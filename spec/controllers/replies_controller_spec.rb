require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
	before(:each) do 
		@user = User.create(first_name: 'Chaitanya', last_name: 'A', email: 'example@abc.com', password: '12345678')
		@auth_token = AuthenticateUser.call(@user.email, '12345678').result
		@user1 = User.create(first_name: 'Chai', last_name: 'B', email: 'example@abd.com', password: '12345678')
		@question = @user.questions.create(question_text: 'What is life?')
		@comment = @question.comments.create(comment_text: 'The answer is 42', user_id: @user1.id)
	end

	describe 'GET replies list for a comment' do 
		it 'fetches empty array when no replies available' do 
			set_request_headers(@auth_token)
			get :index, params: { comment_id: @comment.id }
			expect(JSON.parse(response.body)).to eq([])
		end

		it 'fetches array of replies when there are replies available' do
			@comment.replies.create(user_id: @user1.id, reply_text: '42?') 
			set_request_headers(@auth_token)
			get :index, params: { comment_id: @comment.id }
			expect(JSON.parse(response.body).length).to eq(1) 
		end 	
	end

	describe 'POST creates reply for the given comment' do
		it 'creates reply' do
			set_request_headers(@auth_token)
			get :create, params: { comment_id: @comment.id, reply: { reply_text: 'The answer is 42' } }
			expect(response.status).to eq(201)
		end	
	end	
end
