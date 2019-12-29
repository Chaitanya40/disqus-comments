require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
	before(:all) do 
		@user = User.create(email: 'abc@example.com', password: '12345678')
	end
		
  describe "POST create session" do
    it "has a 200 status code" do
      get :create, params: { email: @user.email, password: @user.password}
      expect(response.status).to eq(200)
    end
  end
end