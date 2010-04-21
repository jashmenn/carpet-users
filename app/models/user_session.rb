class UserSession < Authlogic::Session::Base
  facebook_connect_callback :check_for_password
  def check_for_password(details=nil)
    Rails.logger.info("checking for password in session #{details.pretty_inspect}")
  end
end