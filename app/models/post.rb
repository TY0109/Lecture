class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,dependent: :destroy
  
  def user
    User.find(self.user_id)
  end
  
  def like?(user)
   likes.where(user_id: user.id).exists?
  end
  
  mount_uploader :img, ImgUploader
  
  
  validates :title, presence:true
  validates :description, presence:true
  
  
end
