require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	before(:each) do 
		@user = User.create(first_name: 'Chaitanya', last_name: 'A', email: 'example@abc.com', password: '12345678')
		@auth_token = AuthenticateUser.call(@user.email, '12345678').result
		@user1 = User.create(first_name: 'Chai', last_name: 'B', email: 'example@abd.com', password: '12345678')
		@question = @user.questions.create(question_text: 'What is life?')
	end

	describe 'GET comments list for a question' do 
		it 'fetches empty array when no comments available' do 
			set_request_headers(@auth_token)
			get :index, params: { question_id: @question.id }
			expect(JSON.parse(response.body)).to eq([])
		end	
	end	
end
