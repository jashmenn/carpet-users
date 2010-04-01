require "carpet_users"
require "rails"
$:.unshift File.dirname(__FILE__) + "/../../vendor/plugins/authlogic/lib"
require "authlogic"

module CarpetUsers
  class Engine < Rails::Engine
    engine_name :carpet_users
  end
end 
