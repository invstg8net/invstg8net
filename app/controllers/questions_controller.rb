class QuestionsController < ApplicationController

  def index
    @questions = Questions.all#TODO - determine what to show
  end

  def new
    @question = Question.new
  end

  def create

    #Create the question
    q = Question.new :body => params[:body],
      :phone_number => params[:phone_number],
      :email => params[:email],
      :needed_by => (params[:needed_by] || (Time.now + 5.days))    
    q.save

    #Choose X Random Researchers

    #Email Random Researchers & Create Questions
  end
end