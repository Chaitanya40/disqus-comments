class QuestionsController < ApplicationController
	before_action :set_question, only: [:update, :destroy]

	def index
		render json: Question.page(params[:page]).per(params[:per_page])
	end
	
	def create
		new_question = current_user.questions.create!(question_params)
		render json: new_question, status: :created
	end

	def show
		render json: @question, status: :ok
	end 

	def update
		if @question.update_attributes(question_params)
			render json: @question, status: :ok
		else 
			render json: { error: @question.errors.full_messages.to_sentence }, status: :bad_request	
		end	
	end 

	def destroy
		if @question.destroy
			render json: { message: 'Success' } , status: :ok
		else 
			render json: { error: @question.errors.full_messages.to_sentence }, status: :bad_request	
		end
	end

	private

	def question_params
		params.require(:question).permit(:id, :question_text)
	end

	def set_question
		@question = current_user.questions.find(params[:id])
	end	
end	