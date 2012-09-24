class InvestigateMailer < ActionMailer::Base
  default :from => "question@invstg8.net"

  def question_email(answer)
    @answer = answer
    @question = answer.question
    @researcher = answer.researcher

    mail(:to => @researcher.email, :subject => "New question from INVSTG8.NET", :from => "question+#{@answer.id}@invstg8.net")
  end

  def answer_email(answer)
    @answer = answer
    @question = answer.question
    @researcher = @answer.researcher

    mail(:to => @question.email, :subject => "#{@researcher.try(:name)} replied to your question", :from => 'answer@invstg8.net')
  end

  def escalate_email(question)
    @question = question

    mail(:to => 'admin@invstg8.net', :subject => 'A Question Has Been Escalated')
  end
end
