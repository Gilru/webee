
  json.blogs @blogs do |blog|
    json.extract! blog, :id, :title, :sub_title,:profileimg_url,:image_url, :content, :user
    json.url blog_url(blog)
  end

# if user_signed_in? && current_user.admin?

# json.array!(@blogs) do |blog|
#   json.extract! blog, :id, :title, :sub_title, :content
#   json.url blog_url(blog, format: :json)
# end
