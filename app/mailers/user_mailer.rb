class UserMailer < Devise::Mailer
  default from: 'sojabio@protonmail.com'

  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Bienvenue !')
  end

  def reset_password_instructions(record, token, opts={})
    super
  end

  # def reset_password_instructions(record, token, opts = {})
  #   @reset_password_url = edit_password_url(record, reset_password_token: token)
  #   mail(to: record.email, subject: 'Reset Your Password')
  # end

end
