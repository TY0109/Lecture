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


  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  
  

end
