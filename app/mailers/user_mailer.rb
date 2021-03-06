class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def welcome_email
    @user = params[:user]
    @company = params[:company]
    mail(to: @user.email, subject: "Welcome #{@user.name} to the #{@company.name}'s Genesis Estimator Profile")
  end

end
