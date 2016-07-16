class Api::V1::RegistrationsController < Api::V1::BaseController
  skip_before_action :authenticate_user_from_token!

  def create
    @user = User.new(registration_params)
    if @user.errors.empty? && @user.save
      render json: @user, serializer: SessionSerializer, root: 'user'
    else
      render json: { user: @user, errors: @user.errors }
    end
  end

  private
    def registration_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
end
