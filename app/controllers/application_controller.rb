class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  #after_action :verify_authorized
  #after_action :verify_policy_scoped
  include SessionsHelper
  #include Pundit

end
