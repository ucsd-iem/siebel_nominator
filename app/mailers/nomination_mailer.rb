class NominationMailer < ActionMailer::Base
  default :subject => "[UCSD Siebel Scholar Nominations] ", :from => "UCSD Siebel Scholar Nominations <siebel@ucsd.edu>" #, :sent_on => Time.now

  def confirmation(nomination)
    setup_email nomination
    mail :to => nomination.user.email, :subject => "Confirmation of nomination for #{nomination.nominee_name}"
  end

  def update_notificaiton(nomination)
    setup_email nomination
    mail :to => nomination.user.email, :subject => "Update to nomination for #{nomination.nominee_name}"
  end
  
  protected
    def setup_email(nomination)
      @url = "https://siebel.ucsd.edu/nominations/#{nomination.slug}?auth_token=#{nomination.user.authentication_token}"
      @nominee_name = nomination.nominee_name
      @complete = nomination.complete?
    end
end