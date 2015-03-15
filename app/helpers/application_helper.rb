module ApplicationHelper
		 # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(@user.find(current_user.id).email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=250"
    image_tag(gravatar_url, alt: @user.find(current_user.id).email, class: "gravatar")
  end
end