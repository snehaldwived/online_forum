class CommentsController < ApplicationController
  before_action :find_question, only: [:create, :update, :edit, :destroy]

  def create
    @comment = @question.comments.create(comment_params)
    redirect_to question_path(@question)
  end

  def destroy
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end
