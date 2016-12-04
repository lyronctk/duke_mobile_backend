class AuthenticateUserService < ApplicationService
	include ActiveAttr::Model
	attribute :email
	attribute :password

	def action
		if user
			Success.new token: JsonWebToken.encode(user_id: user.id)
		else
			Failure.new(errors: {auth: 'Invalid credentials'})
		end
	end

	private
	def user
		user = User.find_by_email(email)
		return user if user && user.authenticate(password)
		nil
	end
end