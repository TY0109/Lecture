module SessionsHelper
    
# def log_in(user)〜def logoutは定義不要
    
# def logged_in?　は定義不要

# def current_user　は定義不要


# 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
  def current_user?(user)
    user == current_user
  end

  # 記憶しているURL(またはデフォルトURL)にリダイレクトします。
  def redirect_back_or(default_url)
    redirect_to(session[:forwarding_url] || default_url)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを記憶します。
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end