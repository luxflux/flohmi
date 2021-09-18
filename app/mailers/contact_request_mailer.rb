class ContactRequestMailer < ApplicationMailer
  def created(contact_request)
    @contact_request = contact_request
    mail to: ENV.fetch('MAIL_RECEIVER'), from: 'flohmi@yux.ch', subject: 'Neue Flohmi Anfrage'
  end
end
