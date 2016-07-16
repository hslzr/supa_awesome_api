class Api::V1::PostsController < Api::V1::BaseController

  skip_before_action :authenticate!, only: [:index, :show]

  def index
    render json: Post.includes(:user, :comments).all, status: 200
  end

  def show
    post = Post.includes(:user, { comments: [:user] }).find(params[:id])
    render json: post, status: 200
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      render json: post, status: 201
    else
      render json: { post: { errors: post.errors } }, status: 422
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post, status: 200
    else
      render json: { post: { errors: post.errors } }, status: 422
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    head 204
  end

  private

  def post_params
    params.require(:post).permit(
       :title,
       :body
    )
  end
end
