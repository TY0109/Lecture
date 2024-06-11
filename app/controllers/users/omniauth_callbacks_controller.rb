# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # LINEログイン
  def line
    basic_action 
  end

  # LINEから取得した情報からアプリ側でユーザを作成/取得
  def basic_action
    # すでにログインしている状態ならLINEログインさせない
    if current_user
      flash[:notice] = "すでにログインしています"
      redirect_to root_url
    else
      @omniauth = request.env["omniauth.auth"]
      # (byebug) @omniauth
      #<OmniAuth::AuthHash 
      #   credentials=#<OmniAuth::AuthHash 
            # expires=true expires_at=171... refresh_token="74..." token="eyJ..."> 
      #   extra=#<OmniAuth::AuthHash> 
      #   info=#<OmniAuth::AuthHash::InfoHash 
      #     description=nil 
      #     image="https://profile.line-scdn.net/0hB..." 
      #     name="自分の名前"> 
      #   provider="line" 
      #   uid="U29...">
      if @omniauth.present?
        # LINEから取得した情報からアプリ側でユーザをnew(初回ログイン以降はfind)
        @user_by_line = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
        # 初回はアプリ側のユーザのemailがない
        if @user_by_line.email.blank?
          # LINEから取得した情報にemailがない場合は、フェイクメールを作成
          @user_by_line.email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
          @user_by_line.password = Devise.friendly_token[0, 20]
          @user_by_line.name = @omniauth["info"]["name"]
          @user_by_line.save!
        end
        sign_in(:user, @user_by_line)
      end
      flash[:notice] = "ログインしました"
      redirect_to root_path
    end
  end
end
