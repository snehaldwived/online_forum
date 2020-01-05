class RepliesController < ApplicationController
  before_action :find_comment, only: [:create, :update, :edit, :destroy]

  def create
    @reply = @comment.replies.create(comment_params)
    @question = @comment.question
    redirect_to question_path(@question)
  end

  def destroy
    @comment = @question.comments.find(params[:id])
    @question = @comment.question
    @comment.destroy
    redirect_to question_path(@question)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body, :parent_id)
    end

    def find_comment
      @comment = Comment.new(parent_id: params[:parent_id])
    end
end
