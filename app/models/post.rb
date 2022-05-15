class Post < ApplicationRecord
  belongs_to :user
  
  def user
    User.find(self.user_id)
  end
  
  validates :title, presence:true
  validates :description, presence:true
  
  
end
