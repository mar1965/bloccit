module UsersHelper

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(current_user.email).downcase
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    image_tag(gravatar_url, class: "gravatar")
  end

end
