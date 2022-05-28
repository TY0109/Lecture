class UsersController < ApplicationController
  include GuestSessionsHelper
  
  before_action :set_user ,only:[:show, :destroy]
  before_action :authenticate_user! ,only:[:index,:show, :destroy]
  before_action :admin_or_correct_user, only:[:show]
  before_action :admin_user ,only: [:index, :destroy]
 
  def index
    @users=User.paginate(page:params[:page],per_page:20)
  end
  
  def show
    @favorites=Like.where(user_id:@user.id)
  end

  
  def destroy
    @user.destroy
    flash[:success]="ユーザーを削除しました。"
    redirect_to users_url
  end
      
  private
  
  def set_user
    @user=User.find(params[:id])
  end
  


  
  
end
