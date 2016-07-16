class Api::V1::PostsController < Api::V1::BaseController

  def index
    render json: Post.all, status: 200
  end

  def show
    post = Post.find(params[:id])
    render json: post, status: 200
  end

  def create
    post = Post.new(post_params)
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
       :body,
       :slug,
       :user_id
    )
  end
end
