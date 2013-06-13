module UsersHelper

def gravatar_for(user, options = { size: 50 })
	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	size = options[:size]
	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	image_tag(gravatar_url, alt: user.name, clas: "gravatar")	
end

def valid_signup
	fill_in "Name",			with: "Example User"
	fill_in "Email",		with: "user@example.com"
	fill_in "Password",		with: "foobar"
	fill_in	"Password confirmation", 	with: "foobar"
end

def retrieve_test_user
	User.find_by_email("user@example.com")
end

end
