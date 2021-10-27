class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    articles_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email image])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def search_articles
    @q = Article.ransack(params[:q])
  end
end
