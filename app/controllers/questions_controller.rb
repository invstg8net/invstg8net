class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create

    #Create the question
    q = Question.new params[:question]
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