class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def send_purchase_confirmation(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'Thanks for your purchase!' )
  end
end