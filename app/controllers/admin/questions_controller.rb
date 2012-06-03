class Admin::QuestionsController < Admin::BaseController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
  end
end