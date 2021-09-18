class ContactRequestMailer < ApplicationMailer
  def created(contact_request)
    @contact_request = contact_request
    mail to: ENV.fetch('MAIL_RECEIVER'), subject: 'Neue Flohmi Anfrage'
  end
end
