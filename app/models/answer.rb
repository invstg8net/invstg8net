class Answer < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :question
  belongs_to :researcher

  def send_to_journalist
    if self.question.email.blank?
      puts "SMS"
      #No Email, so SMS the answer if short enough, or send URL
      sms_body = self.body.length > 140 ? "Checkout your invstg8.net response @ #{answer_url(self, :host => 'invstg8.net')}" : "Your invstg8.net response: #{self.body}" #TODO - see if this url works

      #TODO - Send SMS
      puts self.question.inspect
      client = Twilio::REST::Client.new 'AC5a57c5cbbcac4806a290a7e96b917302', 'e8f83cd92951cf3f6171ae59153a72af'
      client.account.sms.messages.create(
        :from => '+16479338848',
        :to => self.question.phone_number,
        :body => sms_body
      )
    else
      puts "EMAIL"
      InvestigateMailer.answer_email(self).deliver
    end
  end
end