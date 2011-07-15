class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery

  
  private
  
  def current_city
     @current_city ||= City.find_by_subdomain(request.subdomain) unless request.subdomain.blank?
  end
end
