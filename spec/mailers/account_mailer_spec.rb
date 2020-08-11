require "rails_helper"

RSpec.describe AccountMailer, type: :mailer do
  describe "activation" do
    let(:mail) { AccountMailer.activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
