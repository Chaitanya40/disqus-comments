require "rails_helper"

RSpec.describe AuthorizeApiRequest do
	before(:all) do
		@user = User.create(email: 'abc@example.com', password: '12345678')
    @auth_token = AuthenticateUser.call(@user.email, '12345678').result
	end

  describe "authorize call" do
    it "fetches a user" do
      resp = AuthorizeApiRequest.call(ActiveSupport::HashWithIndifferentAccess.new('Authorization': @auth_token)).result
      expect(resp).to_not be_nil
    end
  end
end