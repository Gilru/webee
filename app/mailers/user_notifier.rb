class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def send_purchase_confirmation(user)
    @user = user

    mail( :to => %w(@user.email mont-phil@outlook.com),
          :subject => 'Thanks for your purchase!' )

  end


end
