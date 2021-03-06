require "rails_helper"

RSpec.describe ContactRequestMailer, type: :mailer do
  describe "created" do
    let(:mail) { ContactRequestMailer.created }

    it "renders the headers" do
      expect(mail.subject).to eq("Created")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
