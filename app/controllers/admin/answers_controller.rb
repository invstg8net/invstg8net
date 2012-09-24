class Admin::AnswersController < Admin::BaseController

  def create
    a = Answer.new
    a.question_id = params[:question_id]
    a.body = params[:body]
    a.answered = true
    a.save

    if !a.body.nil?
      #Email/SMS user who submitted the question
      a.send_to_journalist
    end

    redirect_to [:admin, a.question]
  end
end 