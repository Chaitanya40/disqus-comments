require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
	before(:all) do
		@user = User.create(email: 'abc@example.com', password: '12345678')
	end

  describe "POST create session" do
    it "has a 200 status code" do
      get :create, params: { email: @user.email, password: @user.password}
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['auth_token']).to_not be_nil
    end
  end
end