require "rails_helper"

RSpec.describe AuthorizeApiRequest do
	before(:all) do
		@user = User.create(email: 'abc@example.com', password: '12345678')
    @auth_token = AuthenticateUser.call(@user.email, '12345678')
	end

  describe "authorize call" do
    it "fetches a user" do
      expect(AuthorizeApiRequest.call).to_not be_nil
    end
  end
end