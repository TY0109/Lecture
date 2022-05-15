class PostsController < ApplicationController
  before_action :set_user, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only:[:destory]
  
  
  def all
    @search=Post.ransack(params[:q])
    @posts=@search.result
  end
  
  
  
  def index
    @posts=@user.posts
  end
  
  def new
    @post=@user.posts.build
  end
  
  def create
    @post=@user.posts.build(post_params)
    if @post.save
      flash[:success]="新規作成に成功しました"
      redirect_to user_posts_url @user
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(post_params)
      flash[:success]="投稿を編集しました"
      redirect_to user_posts_url @user
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success]="投稿を削除しました"
    redirect_to user_posts_path @user
  end
  
  
  private
  
    def post_params
      params.require(:post).permit(:title, :description,:user_id)
    end
    
    def set_user
      @user=User.find_by(id:params[:user_id])
    end
    
    def set_post
      @post=@user.posts.find_by(id:params[:id])
    end
    
    
  
  
    
    
  
  
 
  
end
