# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::ParameterMissing, with: :missing_parameters
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def render_json(file_path, object)
    JSON.parse(render_to_string(partial: file_path, object: object))
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end

  private

  def missing_parameters
    render json: { error: 'Parameter Missing!' }, status: 422
  end

  def invalid_record(err)
    render json: { error: err.message }, status: 422
  end
end
