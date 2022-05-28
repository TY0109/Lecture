class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

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
  
  
  

end
