require "sms-easy"

class TextNotifier
  def initialize(phone_number, carrier)
    @phone_number = phone_number
    @carrier = carrier
    ActionMailer::Base.smtp_settings = {
      user_name: 'standmore69@gmail.com',
      password: 'gqoseqbugngkjzvp',
      address: 'smtp.gmail.com',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }
    
    SMSEasy::Client.config['from_address'] = "standmore69@gmail.com"
    @notifier = SMSEasy::Client.new
  end

  def send(message)
    @notifier.deliver(@phone_number, @carrier, message)
  end
end
