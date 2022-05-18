class CommentsController < ApplicationController
  def create
    @comment= current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        flash[:success]="メッセージを作成しました"
      else
        format.html
        flash[:danger]="メッセージの作成に失敗しました"
      end
      redirect_to post_path(@comment.post)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end
  
end
