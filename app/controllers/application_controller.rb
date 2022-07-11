class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Genre.ransack(params[:q])
    @search_genres = @search.result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
