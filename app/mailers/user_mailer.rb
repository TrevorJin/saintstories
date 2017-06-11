class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Account Activation'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end

  def account_approved(approved_user, approving_admin)
    @user = approved_user
    @admin = approving_admin
    mail to: @user.email, subject: "You have been approved as a user for the Saint Stories"
  end
end
