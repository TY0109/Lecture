class CommentsController < ApplicationController
  def create
    @comment= current_user.comments.build(comment_params)
    if @comment.save
      flash[:success]="メッセージを作成しました"
    else
      flash[:danger]="メッセージの作成に失敗しました"
    end
    redirect_to post_path(@comment.post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :parent_id)
  end
  
end
