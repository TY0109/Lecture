class UsersController < ApplicationController
  before_action :set_user ,only:[:show, :destroy]
  before_action :authenticate_user! ,only:[:index, :show, :destroy]
  before_action :admin_user ,only: [:index, :destroy]
 
  def index
    @users = User.paginate(page: params[:page], per_page:20)
  end
  
  def show
    @favorites = Like.where(user_id: @user.id)
  end

  def destroy
    @user.destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to users_url
  end
      
  private
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
