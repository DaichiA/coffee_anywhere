require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "activation_needed_email" do
    let(:mail) { UserMailer.activation_needed_email(user) }
    let(:user) { FactoryBot.create(:user)}
    let(:reset_mail){ UserMailer.reset_password_email(user) } 

    it "renders the headers" do
      # expect(mail.subject).to eq('Welcome to Coffee Anywhere!')
      expect(mail.subject).to eq('COFFEE ANYWHEREへようこそ！')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      # expect(mail.body.encoded).to have_content (user.email)
      expect(mail.body.encoded).to have_content (@url)
      # expect(mail.body.encoded).to match (@user.email)
      # expect(mail.body.encoded).to match (@url)
      
    end

    # describe "password reset mail" do
    #   it "renders the headers" do
    #     # expect(mail.subject).to eq('Welcome to Coffee Anywhere!')
    #     expect(reset_mail.subject).to eq('COFFEE ANYWHERE パスワードリセット')
    #     expect(reset_mail.to).to eq([user.email])
    #     expect(reset_mail.from).to eq(["from@example.com"])
    #   end
  
    #   it "renders the body" do
    #     # expect(mail.body.encoded).to have_content (user.email)
    #     expect(reset_mail.body.encoded).to have_content (@url)
    #     # expect(mail.body.encoded).to match (@user.email)
    #     # expect(mail.body.encoded).to match (@url)
        
    #   end
    # end

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

  # describe "reset_password_email" do
  #   let(:user) { FactoryBot.create(:user)}
  #   let(:mail) { UserMailer.reset_password_email(user) }
  #   # before do
  #   #   login(user) #モジュールに切り分けた
  #   #   click_on "Logout"

  #   #   user.update!(
  #   #     password: "password",
  #   #     password_confirmation: "password",
  #   #     activation_state: "active"
  #   #   )
  #   #   debugger
  #   # end

  #   it "renders the headers" do
  #     expect(mail.subject).to eq('Your password has been reset')
  #     expect(mail.to).to eq([user.email])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end

  #   it "renders the body" do
  #     expect(mail.body.encoded).to have_content (user.email)
  #     expect(mail.body.encoded).to have_content (@url)
  #     # expect(mail.body.encoded).to match (@user.email)
  #     # expect(mail.body.encoded).to match (@url)
  #   end
  # end

end
