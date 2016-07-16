class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate!

  def create
    @user = User.find_by email: user_params[:email]
    if @user && @user.valid_password?(user_params[:password])

      @user.update_column(:token, Devise.friendly_token(10))

      sign_in @user

      render json: @user, serializer: SessionSerializer, root: 'user'
    else
      render json: { errors: 'Información incorrecta' }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
