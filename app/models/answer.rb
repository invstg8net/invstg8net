class Answer < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :question
  belongs_to :researcher

  def send_to_journalist
    if self.question.email.blank?
      puts "SMS"
      #No Email, so SMS the answer if short enough, or send URL
      sms_body = self.body.length > 160 ? answer_url(self) : self.body #TODO - see if this url works

      #TODO - Send SMS
    else
      puts "EMAIL"
      InvestigateMailer.answer_email(self).deliver
    end
  end
end