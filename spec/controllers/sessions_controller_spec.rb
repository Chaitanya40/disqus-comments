require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
  describe "POST create session" do
    it "has a 200 status code" do
      get :create, params: { email: @user.email, password: @user.password}
      expect(response.status).to eq(200)
    end
  end
end