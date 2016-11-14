class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def safe_params
    params.except(:host, :port, :protocol).permit!
  end

  helper_method :safe_params

end
