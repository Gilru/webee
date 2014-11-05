module ProjectsHelper

  def is_link_available(link)
    if link.blank?
      "a link will be provide soon"
    end
  end
end
