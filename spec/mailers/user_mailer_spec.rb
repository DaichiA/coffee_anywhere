require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(user) }
    let(:user) { FactoryBot.create(:user)}

    it "renders the headers" do
      expect(mail.subject).to eq('Coffee Anywhereへようこそ！')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content (user.email)
      expect(mail.body.encoded).to have_content (@url)
      # expect(mail.body.encoded).to match (@user.email)
      # expect(mail.body.encoded).to match (@url)
    end
  end

  # describe "activation_success_email" do
  #   let(:mail) { UserMailer.activation_success_email }

  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Activation success email")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end

  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end
