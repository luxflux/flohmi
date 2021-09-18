# Preview all emails at http://localhost:3000/rails/mailers/contact_request_mailer
class ContactRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_request_mailer/created
  def created
    ContactRequestMailer.created
  end

end
