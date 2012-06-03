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

  def should_escalate?
    #All users have answered and all answers were empty
    if answers.where(:answered => true).where('body IS NOT NULL').count == 0
      return true if self.answers.where(:answered => false).count == 0
      return true if Time.now > self.needed_by
    end
    return false
  end

end