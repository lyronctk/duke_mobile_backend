class AuthorizeApiRequestService < ApplicationService
	attr_reader :headers

	def initialize(headers={})
		@headers = headers
	end

	def action
		return Failure.new(auth: 'Missing token') unless headers['Authorization'].present?
		user = User.find(decoded_auth_token[:user_id]) if decoded_auth_token
		if user
			Success.new user: user
		else 
			Failure.new(auth: 'Invalid token')
		end 	
	end

	private
	def decoded_auth_token
		JsonWebToken.decode(headers['Authorization'].split(' ').last)
	end
end