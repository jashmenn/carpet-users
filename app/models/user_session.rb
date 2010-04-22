class UserSession < Authlogic::Session::Base
  facebook_connect_callback :check_for_facebook_values
  facebook_name_field :name
  facebook_auto_register true
end