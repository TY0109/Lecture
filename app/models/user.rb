class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :omniauthable, omniauth_providers: %i[line] # この1行を追加

        
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  
  validates :student, presence:true              
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6}, allow_nil: true


  def self.guest
    user=User.find_or_create_by(email:'guest@email.com') do |user|
      user.password=SecureRandom.urlsafe_base64
      user.name="ゲストユーザー"
    end
  end
  
  def self.guest_admin
    user=User.find_or_create_by(email:'guest_admin@email.com') do |user|
      user.password=SecureRandom.urlsafe_base64
      user.name="ゲスト管理人"
    end
  end
  
  
  # 以下を追加
  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end
  # 以上を追加
  


end
