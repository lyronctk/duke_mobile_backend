class AuthenticateUserService < ApplicationService
	
	attribute :email
	attribute :password

	def action
		if user
			Success.new token: JsonWebToken.encode(user_id: user.id)
		else
			Failure.new(auth: 'Invalid credentials')
		end
	end

	private
	def user
		user = User.find_by_email(email)
		return user if user && user.authenticate(password)
		nil
	end
end