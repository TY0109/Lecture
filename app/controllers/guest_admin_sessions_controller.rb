class GuestAdminSessionsController < ApplicationController
  
  def create
    user=User.find_or_create_by(email:"guest_admin@email.com") do |user|
      user.password=SecureRandom.urlsafe_base64
      user.name="ゲスト管理人"
    end
      session[:user_id]=user.id
      flash[:success]="ゲストユーザーとしてログインしました"
      redirect_to user
  end
  
  
end
