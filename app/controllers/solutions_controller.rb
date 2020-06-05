class SolutionsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.build(solution_params)

    if @solution.save
      flash[:notice] = "投稿しました"
      redirect_back(fallback_location: questions_path)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      @solutions = @question.solutions
      render "questions/show"
    end
  end

  private

  def solution_params
    params.require(:solution).permit(:detail)
  end
end
