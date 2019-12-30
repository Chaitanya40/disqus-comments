class RepliesController < ApplicationController
	before_action :set_comment

	def index
		render json: @comment.replies, status: :ok
	end
	
	def update
		reply = @comment.replies.find(params[:id])
		if reply.update_attributes(reply_params)
			render json: reply, status: :ok
		else 
			render json: { error: reply.errors.full_messages.to_sentence }, status: :bad_request
		end		
	end 

	def desroy
		reply = @comment.replies.find(params[:id])
		if reply.destroy
			render json: reply, status: :ok
		else 
			render json: { error: reply.errors.full_messages.to_sentence }, status: :bad_request
		end		
	end 

	def create
		reply = @comment.replies.create(reply_params.merge user_id: current_user.id)
		if reply.persisted?
			render json: reply, status: :created
		else 
			render json: { error: reply.errors.full_messages.to_sentence }, status: :bad_request
		end		
	end

	def show
		render json: @comment.replies.find(params[:id]), status: :ok
	end	

	private

	def set_comment
		@comment = Comment.find(params[:comment_id])
	end	

	def reply_params
		params.require(:reply).permit(:id, :reply_text)
	end	
end
