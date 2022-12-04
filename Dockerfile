FROM ruby:2.6.9

# node.jsとyarnのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn \
  # vimのインストールを追記
  && apt-get install -y vim
# docker側のディレクトリを作成
WORKDIR /app
# srcフォルダ（appフォルダとgemfile）を、docker側のディレクトリの配下に置く。
COPY . /app

# 追記
RUN gem install bundler

# bundle installでアプリ生成時に、gemもいくつか追加（それ以降はコマンドで手入力）
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install
# CMD サーバーの起動は今回は、ここには書かない。

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets