class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def like?(user)
    # likes.where(user_id: user.id).exists?
    # 複数取得されることはないので以下に修正
    likes.find_by(user_id: user.id).present?
  end
  
  mount_uploader :img, ImgUploader
  
  validates :university, presence:true
  validates :department, presence:true
  validates :title, presence:true
  validates :description, presence:true
end
