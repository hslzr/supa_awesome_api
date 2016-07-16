class Api::V1::CommentsController < Api::V1::BaseController
	def create
	    @comment = Comment.new(comment_params)
	    if @comment.errors.empty? && @comment.save
	      render json: @comment
	    else
	      render json: { comment: @comment, errors: @comment.errors }
	    end
  	end

  	def index
	    render json: Comment.all
  	end

  	private
    def comment_params
      params.require(:comment).permit(
        :user_id,
        :body,
        :post_id
      )
    end
end
