class PostsController < ApplicationController
  include GuestSessionsHelper
  
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :admin_or_limitation_correct_user, only:[:edit, :update, :destroy]
  
  
  def index
    @search=Post.ransack(params[:q])
    @posts=@search.result
  end
  
  def new
    @post=Post.new
  end
  
  def create
    @post=posts.new(post_params)
    if @post.save
      flash[:success]="新規作成に成功しました"
      redirect_to posts_url 
    else
      render :new
    end
  end
  
  def show
    @likes_count=Like.where(post_id:@post.id).count
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(post_params)
      flash[:success]="投稿を編集しました"
      redirect_to posts_url 
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success]="投稿を削除しました"
    redirect_to posts_path 
  end
  
  
  private
  
    def post_params
      params.require(:post).permit(:university, :department, :branch, :title, :description,:user_id)
    end
    
    
    def set_post
      @post=Post.find(params[:id])
    end
    
    
    def admin_or_limitation_correct_user
      @post=Post.find(params[:id])
      unless @post.user_id==current_user.id  || ! current_use.admin?
        flash[:notice]="自分以外のユーザーの投稿は編集できません"
        redirect_to posts_url
      end
    end
      
    
    
    
  
  
    
    
  
  
 
end

