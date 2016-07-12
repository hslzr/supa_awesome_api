class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def unauthorized
    redirect_to root_url
  end
end
