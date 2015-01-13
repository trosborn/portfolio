class MessagesMailer < ActionMailer::Base

  default :from => "trosborn@gmail.com"
  default :to => "trosborn@gmail.com"

  def new_message message
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end
