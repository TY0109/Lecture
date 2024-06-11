# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  def create_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    flash[:notice] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_url
  end
  
  def create_guest_admin
    user = User.guest_admin
    sign_in user   # ユーザーをログインさせる
    flash[:notice] = 'ゲスト管理人としてログインしました。'
    redirect_to root_url
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
