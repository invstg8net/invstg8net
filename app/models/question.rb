class Question < ActiveRecord::Base
  has_many :answers

  def escalate_to_admin
    self.update_attributes(:escalated => true)

    InvestigateMailer.escalate_email(self).deliver
  end

  def send_to_researcher(researcher)
    a = Answer.new :researcher => researcher, :question => self

    InvestigateMailer.question_email(a).deliver if a.save
  end

end