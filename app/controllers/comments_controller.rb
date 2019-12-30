class CommentsController < ApplicationController
	before_action :set_question

	def index
		render json: @question.comments.page(params[:page]).per(params[:per_page])
	end
	
	def update
		comment = @question.comments.find(params[:id])
		if comment.update_attributes(comment_params)
			render json: comment, status: :ok
		else 
			render json: {error: comment.errors.full_messages.to_sentence }, status: :bad_request
		end		
	end 

	def desroy
		comment = @question.comments.find(params[:id])
		if comment.destroy
			render json: comment, status: :ok
		else 
			render json: {error: comment.errors.full_messages.to_sentence }, status: :bad_request
		end
	end 

	def create
		comment = @question.comments.create(comment_params.merge(user_id: current_user.id))
		if comment.persisted?
			render json: comment, status: :created
		else 
			render json: { error: comment.errors.full_messages.to_sentence }, status: :bad_request
		end	
	end

	def show
		render json: @question.comments.find(params[:id]), status: :ok
	end	


	private

	def	set_question
		@question = Question.find(params[:question_id])
	end

	def comment_params
		params.require(:comment).permit(:id, :comment_text)
	end	
end
