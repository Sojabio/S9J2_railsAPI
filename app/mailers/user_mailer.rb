class UserMailer < Devise::Mailer
  default from: 'sojabio@protonmail.com'

  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Bienvenue !')
  end

  def reset_password_instructions(record, token, opts={})
    super
  end

end
