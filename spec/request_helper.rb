module RequestHelper
	def set_request_headers(auth_token = nil)
		request.headers['Authorization'] = auth_token
		request
	end	
end	