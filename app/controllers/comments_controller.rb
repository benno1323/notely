class CommentsController < ApplicationController
	before_action :set_note, only: :create
	before_action :authenticate_user!, except: :show

	def create
		build_comment
		if @comment.save
			redirect_to @note
		else
			render 'notes/show'
		end
	end

	private

		def set_note
			@note = Note.find(params[:note_id])
		end

		def build_comment
			@comment = @note.comments.build(comment_params)
			@comment.user = current_user
		end

		def comment_params
			params.require(:comment).permit(:content)
		end
end
