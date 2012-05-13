class ReportMailer < ActionMailer::Base
  default from: "mailer@carogoverno.it"
  
  def report(post)
    @post = post
    mail(:to => "admin@carogoverno.it", :subject => "Segnalazione")
  end
end
