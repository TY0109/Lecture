# omniauth gemを使わない実装
# 以下も必要
# gemの追加、ルーティング設定、カラムの追加
# cf https://zenn.dev/yoiyoicho/articles/974c73ac75c100

# class LineLoginApiController < ApplicationController
#   require 'json'
#   require 'typhoeus'
#   require 'securerandom'
  
#   # new.html.erbで、LINEでログインのリンクを踏むと呼ばれる
#   # ユーザーに認証と認可を要求する
#   # cf https://developers.line.biz/ja/docs/line-login/integrate-line-login/#making-an-authorization-request
#   def login
#     base_authorization_url = 'https://access.line.me/oauth2/v2.1/authorize'
#     # クエリパラメータ
#     response_type = 'code'
#     client_id = ENV['LINE_KEY']
#     # redirect_uri = CGI.escape(line_login_api_callback_url) # "http://localhost:3000/line_login_api/callback"なので、ローカル環境では以下のようなngrokのURLに設定必要
#     redirect_uri = CGI.escape("https://xxxxxxxx.ngrok-free.app/line_login_api/callback")
#     # CSRF対策用の固有な英数字の文字列
#     session[:state] = SecureRandom.urlsafe_base64  # ログインセッションごとにWebアプリでランダムに生成する
#     state = session[:state]
#     scope = 'profile%20openid' # LINE側から取得する情報の種類を指定(今回の設定ではEメールは取得できない)
#     # クライアントアプリが認可サーバーにアクセストークンをリクエストするときのURL
#     authorization_url = "#{base_authorization_url}?response_type=#{response_type}&client_id=#{client_id}&redirect_uri=#{redirect_uri}&state=#{state}&scope=#{scope}"
#     redirect_to authorization_url, allow_other_host: true
#   end

#   # ログインボタン押下で呼ばれる
#   # アクセストークンを取得し、IDトークンからユーザーIDを取得して、アプリ側でuserを作成しログインさせる
#   def callback
#     # 以下のparametersを受け取る
#     # Parameters {
#     #   "code"=>"xxxxxxxx", "state"=>"xxxxxxxx", 
#     # クライアントアプリが認可サーバーにアクセストークンをリクエストするときのURLに含めたstateと、飛んできたstateが一致することを検証できれば、次の処理へ
#     if params[:state] == session[:state]
#       line_user_id = get_line_user_id(params[:code])
#       user = User.find_or_initialize_by(line_user_id: line_user_id)
#       # TODO: アプリ側のユーザがline_user_idカラムのみを持つ前提で実装しているので、名前やEメールのバリデーションは解除しておく必要あり
#       if user.save!
#         session[:user_id] = user.id
#         flash[:notice] = 'ログインしました'
#       else
#         flash[:notice] = 'ログインに失敗しました'
#       end
#       redirect_to root_url
#     else
#       redirect_to root_path, notice: '不正なアクセスです'
#     end
#   end

#   private
  
#   # ユーザーのIDトークンからユーザーIDを取得する
#   # cf https://developers.line.biz/ja/docs/line-login/verify-id-token/
#   def get_line_user_id(code)
#     line_user_id_token = get_line_user_id_token(code)

#     if line_user_id_token.present?
#       url = 'https://api.line.me/oauth2/v2.1/verify'

#       options = {
#         body: {
#           id_token: line_user_id_token,
#           client_id: ENV['LINE_KEY']
#         }
#       }

#       response = Typhoeus::Request.post(url, options)

#       if response.code == 200
#         JSON.parse(response.body)['sub'] # このsubがユーザID
#       else
#         nil
#       end

#     else
#       nil
#     end
#   end

#   # アクセストークンを取得する。
#   # cf https://developers.line.biz/ja/reference/line-login/#issue-access-token
#   def get_line_user_id_token(code)
#     url = 'https://api.line.me/oauth2/v2.1/token'
#     redirect_uri = line_login_api_callback_url

#     options = {
#       headers: {
#         'Content-Type' => 'application/x-www-form-urlencoded'
#       },
#       body: {
#         grant_type: 'authorization_code',
#         code: code,
#         redirect_uri: redirect_uri,
#         client_id: ENV['LINE_KEY'],
#         client_secret: ENV['LINE_SECRET']
#       }
#     }

#     response = Typhoeus::Request.post(url, options)

#     if response.code == 200
#       JSON.parse(response.body)['id_token'] # ユーザー情報を含むJSONウェブトークン（JWT)。つまり、このIDトークンの中にLINE側のユーザのユーザIDや名前、Eメール情報が含まれている
#     else
#       nil
#     end
#   end
# end
