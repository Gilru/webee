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

  def send_confirmation_review(user, admin)
    @user = user
    @admin = admin

    admin = "mont-phil@outlook.com"

    mail(:to => ["#{@user.email}", "#{admin}"],
         :subject => 'We received your email!')

  end

  def send_confirmation_review_ready(user, admin)
    @user = user
    @admin = admin

    admin = "mont-phil@outlook.com"

    mail(:to => ["#{@user.email}", "#{admin}"],
         :subject => 'We answer your question!')

  end

end
