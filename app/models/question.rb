class Question < ActiveRecord::Base
  has_many :answers

  def escalate_to_admin
    self.update_attributes(:escalated => true)

    InvestigateMailer.escalate_email(self)
  end

  def send_to_researcher(researcher)
    a = Answer.new :researcher_id => researcher, :question_id => self

    InvestigateMailer.question_email(a) if a.save
  end

end