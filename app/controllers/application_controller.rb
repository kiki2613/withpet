class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :search
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :age_id, :gender_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:nickname, :age_id, :gender_id])
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
