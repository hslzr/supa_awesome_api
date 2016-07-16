class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :authenticate!, only: [:index]

  before_action :set_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.errors.empty? && @comment.save
      render json: @comment
    else
      render json: { comment: @comment, errors: @comment.errors }
    end
  end


  private
    def set_post
      @post = Post.includes(:comments).find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(
        :user_id,
        :body,
        :post_id
      )
    end
end
