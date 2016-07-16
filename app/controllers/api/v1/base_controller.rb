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

  def json_pagination(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

end
