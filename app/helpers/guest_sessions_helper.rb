module GuestSessionsHelper
  
  def guest_user
    user=User.find_by(email:"guest@email.com")
  end
  
  def guest_user?(user)
    user==guest_user
  end
  
  
end
