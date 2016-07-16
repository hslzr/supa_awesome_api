class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!
  before_action :authenticate!

  respond_to :json

  def unauthorized
    redirect_to root_url
  end

  def timezones
    timezones = ActiveSupport::TimeZone.all.collect(&:name)
    render json: timezones, root: false
  end


  def render_api_json(json)
    code = json[:status] == 'error' ? 400 : 200
    render json: json, status: code
  end

  def respond_with_exception(e)
    logger.info e.backtrace.join("\n\n")
    render_api_json status: "error", message: e.message
  end

  private

    def authenticate!
      authenticate_user_from_token || render_unauthorized
    end

    def authenticate_user_from_token
      authenticate_with_http_token do |token, options|
        logger.info token.inspect
        user_email = options[:email].presence
        user =  user_email && User.find_by_email(user_email)
        if user && Devise.secure_compare(user.token, token)
          sign_in(user, store: false)
        end
      end
    end

    def render_unauthorized
      sign_out_all_scopes
      render_api_json({ status: 'error', message: "Invalid session data" }) and return
    end
end
