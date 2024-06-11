class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line] # LINEログイン

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@email.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理人"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
