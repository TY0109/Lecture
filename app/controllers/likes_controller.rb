class LikesController < ApplicationController
  
  
  def create
   @user=User.find(params[:user_id])
   @post=@user.posts.find(params[:post_id])
   
   @like= Like.new(user_id: current_user.id, post_id: params[:post_id])
   @like.save
   redirect_to user_post_path(@user, @post)
   
  end
  
  
  def destroy
   @user=User.find(params[:user_id])
   @post=@user.posts.find(params[:post_id])
   
   @like= Like.find_by(user_id: current_user.id, post_id: params[:post_id])
   @like.destroy
   redirect_to user_post_path(@user, @post)
   
   
  end
  
end
