class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :store_user_location!, if: :storable_location?

  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper
  
  def set_user
    @user = User.find(params[:id])
  end
  
  # def logged_in_userは定義不要
  
  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  def admin_or_correct_user
    unless current_user.admin? || current_user?(@user)
     flash[:danger]="権限がありません"
     redirect_to root_url
    end
  end
  
  
  protected
  #新規登録時のストロングパラメータに「nameカラム」の追加
  def configure_permitted_parameters
    #新規登録時のストロングパラメータに「nicknameカラムとageカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
  
end



