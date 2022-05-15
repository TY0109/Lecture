class Post < ApplicationRecord
  belongs_to :user
  
  def user
    User.find(self.user_id)
  end
  
  validates :university, presence:true
  validates :title, presence:true
  validates :description, presence:true
  
end
