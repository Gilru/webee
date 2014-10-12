module UsersHelper

  def is_company_empty(company_name)
    if company_name.blank?
       "no company name"
    else
      company_name

    end
  end
end
