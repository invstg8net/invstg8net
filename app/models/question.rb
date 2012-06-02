class Question < ActiveRecord::Base
  has_many :answers

  def escalate_to_admin
    self.update_attributes(:escalated => true)

    #TODO Email admin
  end

  def send_to_researcher(researcher)
    a = Answer.new :researcher_id => researcher, :question_id => self
    a.save

    #TODO - send email
  end

end