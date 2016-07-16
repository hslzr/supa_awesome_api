class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  include ApiConcern

  def unauthorized
    redirect_to root_url
  end

  def timezones
    timezones = ActiveSupport::TimeZone.all.collect(&:name)
    render json: timezones, root: false
  end
end
