class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    q_params = params[:question] || params

    #Create the question
    q = Question.new :body => q_params[:body], :phone_number => q_params[:phone_number], :email => q_params[:email], :needed_by => q_params[:needed_by]
    q.needed_by ||= Time.now + 5.days
    q.save

    #Choose X Random Researchers
    researchers = Researcher.select_researchers_for_question(q)

    #Email Random Researchers & Create Questions
    researchers.each do |r|
      q.send_to_researcher(r)
    end

    render :thank_you
  end
end