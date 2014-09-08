class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def send_purchase_confirmation(user,admin)
    @user = user
    @admin = admin
    mail( :to => @user.email,
          :subject => 'Thanks for your purchase!' )

    mail( :to => @admin,
          :subject => 'a new email comming!' )
  end
end
