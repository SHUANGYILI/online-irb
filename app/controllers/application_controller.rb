class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  allow_browser versions: :modern
end
