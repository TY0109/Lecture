class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_user
    @user = User.find(params[:id])
  end
  
  # 現状、users/registersコントローラ内だけで使用しているが、今後resourceが増えた時のことを考慮しここで定義
  def configure_permitted_parameters
    # 新規登録時のストロングパラメータに「nameカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 更新時のストロングパラメータに「nameカラム」の追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
