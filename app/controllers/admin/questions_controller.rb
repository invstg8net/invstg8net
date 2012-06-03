class Admin::QuestionsController < Admin::BaseController

  def index
    @questions = Question.all
  end
end