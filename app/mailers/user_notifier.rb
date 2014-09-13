class UserNotifier < ActionMailer::Base
  default from: "from@example.com"

  def send_purchase_confirmation(user, admin)
    @user = user
    @admin = admin

    admin = "mont-phil@outlook.com"

    mail(:to => ["#{@user.email}", "#{admin}"],
         :subject => 'Thanks for your purchase!')

  end


  def send_confirmation_project_email(user)
    @user = user


    mail(:to => @user.email,
         :subject => 'Your Project has been created')

  end

end
