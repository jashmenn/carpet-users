require "carpet_users"
require "rails"
$:.unshift File.dirname(__FILE__) + "/../../vendor/plugins/authlogic/lib"
$:.unshift File.dirname(__FILE__) + "/../../vendor/plugins/authlogic_facebook/lib"
$:.unshift File.dirname(__FILE__) + "/../../vendor/plugins/mini_fb/lib"
require "authlogic"
require "authlogic_facebook"
require "mini_fb"

module CarpetUsers
  class Engine < Rails::Engine
    # engine_name :carpet_users
  end
end 
