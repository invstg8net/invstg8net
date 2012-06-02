class AnswersController < ApplicationController
  def show
    @answer = Answer.find params[:id]
  end


  def update
    @answer = Answer.find params[:id]
    @answer.body = params[:body]
    @answer.answered = true
    @answer.save

    if @answer.body.nil?
      #Check to see if admin should be notified      
      @answer.question.escalate_to_admin if @answer.question.answers.where(:answered => false).count == 0
    else
      #Email/SMS user who submitted the question
      @answer.send_to_journalist
    end
  end
end