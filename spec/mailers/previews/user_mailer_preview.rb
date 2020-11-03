# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activation_needed_email
  def activation_needed_email
    user = User.first
    user.activation_token  = "zzzzz"
    UserMailer.activation_needed_email(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/activation_success_email
  def activation_success_email
    UserMailer.activation_success_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reset_password_email
  # def reset_password_email
  #   user = User.first
  #   user.reset_password_token = "zzzzz"
  #   UserMailer.reset_password_email(user)
  # end

end
