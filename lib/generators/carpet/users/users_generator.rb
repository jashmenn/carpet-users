require 'rails/generators'
require 'rails/generators/migration'

module Carpet
class UsersGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  # ew
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def manifest
    migration_template 'create_users_migration.rb', 'db/migrate/create_users.rb'
    sleep 1.1 
    migration_template 'create_sessions_migration.rb', 'db/migrate/create_sessions.rb'
    sleep 1.1 
    migration_template 'create_people_migration.rb', 'db/migrate/create_people.rb'
  end
end
end
