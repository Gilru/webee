module ProjectsHelper

  def is_link_available(link)
    if link.blank?
      "a link will be provide soon"
    end
  end

  def is_admin_or_client(user)
    if user.admin?
      "Web Developer"
    elsif user.manager?
      "Product Manager"
    elsif user
      "Client"
    else
      "error this person should not be here please alert us"

    end
  end

  def put_color_admin_or_client(user)
    if user.admin?
      "label-primary"
    elsif user.manager?
      "label-info"
    elsif user
      "label-success"
    else
      "label-alert"

    end
  end
end
