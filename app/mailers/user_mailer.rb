class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def parent_email(parent, child, user)
    specialtext = "#{parent.name} has added you as a parent to #{child.name}'s profile!"
    # @user = user
    # @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'New notification from MyChild')
  end

end
