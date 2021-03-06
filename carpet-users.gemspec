# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{carpet-users}
  s.version = "0.0.27"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nate Murray"]
  s.date = %q{2010-05-13}
  s.description = %q{a rails3 engine for users. uses authlogic and facebooker for facebook connect}
  s.email = %q{nate@natemurray.com}
  s.extra_rdoc_files = [
    "README.mkd"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "README.mkd",
     "Rakefile",
     "VERSION",
     "app/controllers/authentication_controller.rb",
     "app/controllers/fb_connect_controller.rb",
     "app/controllers/user_sessions_controller.rb",
     "app/controllers/users_controller.rb",
     "app/helpers/application_helper.rb",
     "app/helpers/fb_connect_helper.rb",
     "app/helpers/password_resets_helper.rb",
     "app/helpers/user_session_helper.rb",
     "app/helpers/user_sessions_helper.rb",
     "app/helpers/users_helper.rb",
     "app/models/person.rb",
     "app/models/user.rb",
     "app/models/user_session.rb",
     "app/views/layouts/application.html.erb",
     "app/views/password_resets/edit.html.erb",
     "app/views/password_resets/new.html.erb",
     "app/views/shared/_facebook_js.html.erb",
     "app/views/user_sessions/_form.erb",
     "app/views/user_sessions/new.html.erb",
     "app/views/users/_form.erb",
     "app/views/users/edit.html.erb",
     "app/views/users/getting_started_phase_1.html.erb",
     "app/views/users/new.html.erb",
     "app/views/users/show.html.erb",
     "carpet-users.gemspec",
     "config/routes.rb",
     "lib/carpet_users.rb",
     "lib/carpet_users/engine.rb",
     "lib/generators/carpet/facebook/facebook_generator.rb",
     "lib/generators/carpet/facebook/templates/create_users_migration.rb",
     "lib/generators/carpet/facebook/templates/xd_receiver.htm",
     "lib/generators/carpet/users/templates/add_avatar_columns_to_user.rb",
     "lib/generators/carpet/users/templates/add_users_about_me.rb",
     "lib/generators/carpet/users/templates/create_people_migration.rb",
     "lib/generators/carpet/users/templates/create_sessions_migration.rb",
     "lib/generators/carpet/users/templates/create_users_email_migration.rb",
     "lib/generators/carpet/users/templates/create_users_migration.rb",
     "lib/generators/carpet/users/users_generator.rb",
     "test/fixtures/people.yml",
     "test/helper.rb",
     "test/test_carpet-users.rb",
     "test/unit/person_test.rb",
     "vendor/plugins/authlogic/.gitignore",
     "vendor/plugins/authlogic/CHANGELOG.rdoc",
     "vendor/plugins/authlogic/LICENSE",
     "vendor/plugins/authlogic/README.rdoc",
     "vendor/plugins/authlogic/Rakefile",
     "vendor/plugins/authlogic/VERSION.yml",
     "vendor/plugins/authlogic/authlogic.gemspec",
     "vendor/plugins/authlogic/generators/session/session_generator.rb",
     "vendor/plugins/authlogic/generators/session/templates/session.rb",
     "vendor/plugins/authlogic/init.rb",
     "vendor/plugins/authlogic/lib/authlogic.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/base.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/email.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/logged_in_status.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/login.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/magic_columns.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/password.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/perishable_token.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/persistence_token.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/restful_authentication.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/session_maintenance.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/single_access_token.rb",
     "vendor/plugins/authlogic/lib/authlogic/acts_as_authentic/validations_scope.rb",
     "vendor/plugins/authlogic/lib/authlogic/authenticates_many/association.rb",
     "vendor/plugins/authlogic/lib/authlogic/authenticates_many/base.rb",
     "vendor/plugins/authlogic/lib/authlogic/controller_adapters/abstract_adapter.rb",
     "vendor/plugins/authlogic/lib/authlogic/controller_adapters/merb_adapter.rb",
     "vendor/plugins/authlogic/lib/authlogic/controller_adapters/rails_adapter.rb",
     "vendor/plugins/authlogic/lib/authlogic/controller_adapters/sinatra_adapter.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/aes256.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/bcrypt.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/md5.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/sha1.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/sha256.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/sha512.rb",
     "vendor/plugins/authlogic/lib/authlogic/crypto_providers/wordpress.rb",
     "vendor/plugins/authlogic/lib/authlogic/i18n.rb",
     "vendor/plugins/authlogic/lib/authlogic/i18n/translator.rb",
     "vendor/plugins/authlogic/lib/authlogic/random.rb",
     "vendor/plugins/authlogic/lib/authlogic/regex.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/activation.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/active_record_trickery.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/base.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/brute_force_protection.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/callbacks.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/cookies.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/existence.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/foundation.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/http_auth.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/id.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/klass.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/magic_columns.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/magic_states.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/params.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/password.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/perishable_token.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/persistence.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/priority_record.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/scopes.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/session.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/timeout.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/unauthorized_record.rb",
     "vendor/plugins/authlogic/lib/authlogic/session/validation.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case/mock_controller.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case/mock_cookie_jar.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case/mock_logger.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case/mock_request.rb",
     "vendor/plugins/authlogic/lib/authlogic/test_case/rails_request_adapter.rb",
     "vendor/plugins/authlogic/lib/generators/authlogic/session/USAGE",
     "vendor/plugins/authlogic/lib/generators/authlogic/session/session_generator.rb",
     "vendor/plugins/authlogic/lib/generators/authlogic/session/templates/session.rb",
     "vendor/plugins/authlogic/rails/init.rb",
     "vendor/plugins/authlogic/shoulda_macros/authlogic.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/base_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/email_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/logged_in_status_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/login_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/magic_columns_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/password_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/perishable_token_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/persistence_token_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/restful_authentication_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/session_maintenance_test.rb",
     "vendor/plugins/authlogic/test/acts_as_authentic_test/single_access_test.rb",
     "vendor/plugins/authlogic/test/authenticates_many_test.rb",
     "vendor/plugins/authlogic/test/crypto_provider_test/aes256_test.rb",
     "vendor/plugins/authlogic/test/crypto_provider_test/bcrypt_test.rb",
     "vendor/plugins/authlogic/test/crypto_provider_test/sha1_test.rb",
     "vendor/plugins/authlogic/test/crypto_provider_test/sha256_test.rb",
     "vendor/plugins/authlogic/test/crypto_provider_test/sha512_test.rb",
     "vendor/plugins/authlogic/test/fixtures/companies.yml",
     "vendor/plugins/authlogic/test/fixtures/employees.yml",
     "vendor/plugins/authlogic/test/fixtures/projects.yml",
     "vendor/plugins/authlogic/test/fixtures/users.yml",
     "vendor/plugins/authlogic/test/i18n_test.rb",
     "vendor/plugins/authlogic/test/libs/affiliate.rb",
     "vendor/plugins/authlogic/test/libs/company.rb",
     "vendor/plugins/authlogic/test/libs/employee.rb",
     "vendor/plugins/authlogic/test/libs/employee_session.rb",
     "vendor/plugins/authlogic/test/libs/ldaper.rb",
     "vendor/plugins/authlogic/test/libs/ordered_hash.rb",
     "vendor/plugins/authlogic/test/libs/project.rb",
     "vendor/plugins/authlogic/test/libs/user.rb",
     "vendor/plugins/authlogic/test/libs/user_session.rb",
     "vendor/plugins/authlogic/test/random_test.rb",
     "vendor/plugins/authlogic/test/session_test/activation_test.rb",
     "vendor/plugins/authlogic/test/session_test/active_record_trickery_test.rb",
     "vendor/plugins/authlogic/test/session_test/brute_force_protection_test.rb",
     "vendor/plugins/authlogic/test/session_test/callbacks_test.rb",
     "vendor/plugins/authlogic/test/session_test/cookies_test.rb",
     "vendor/plugins/authlogic/test/session_test/credentials_test.rb",
     "vendor/plugins/authlogic/test/session_test/existence_test.rb",
     "vendor/plugins/authlogic/test/session_test/http_auth_test.rb",
     "vendor/plugins/authlogic/test/session_test/id_test.rb",
     "vendor/plugins/authlogic/test/session_test/klass_test.rb",
     "vendor/plugins/authlogic/test/session_test/lint_test.rb",
     "vendor/plugins/authlogic/test/session_test/magic_columns_test.rb",
     "vendor/plugins/authlogic/test/session_test/magic_states_test.rb",
     "vendor/plugins/authlogic/test/session_test/params_test.rb",
     "vendor/plugins/authlogic/test/session_test/password_test.rb",
     "vendor/plugins/authlogic/test/session_test/perishability_test.rb",
     "vendor/plugins/authlogic/test/session_test/persistence_test.rb",
     "vendor/plugins/authlogic/test/session_test/scopes_test.rb",
     "vendor/plugins/authlogic/test/session_test/session_test.rb",
     "vendor/plugins/authlogic/test/session_test/timeout_test.rb",
     "vendor/plugins/authlogic/test/session_test/unauthorized_record_test.rb",
     "vendor/plugins/authlogic/test/session_test/validation_test.rb",
     "vendor/plugins/authlogic/test/test_helper.rb",
     "vendor/plugins/authlogic_facebook/.document",
     "vendor/plugins/authlogic_facebook/.gitignore",
     "vendor/plugins/authlogic_facebook/LICENSE",
     "vendor/plugins/authlogic_facebook/README.rdoc",
     "vendor/plugins/authlogic_facebook/Rakefile",
     "vendor/plugins/authlogic_facebook/VERSION",
     "vendor/plugins/authlogic_facebook/authlogic_facebook.gemspec",
     "vendor/plugins/authlogic_facebook/init.rb",
     "vendor/plugins/authlogic_facebook/lib/authlogic_facebook.rb",
     "vendor/plugins/authlogic_facebook/lib/authlogic_facebook/acts_as_authentic.rb",
     "vendor/plugins/authlogic_facebook/lib/authlogic_facebook/helper.rb",
     "vendor/plugins/authlogic_facebook/lib/authlogic_facebook/session.rb",
     "vendor/plugins/authlogic_facebook/rails/init.rb",
     "vendor/plugins/authlogic_facebook/spec/authlogic_facebook_spec.rb",
     "vendor/plugins/authlogic_facebook/spec/spec.opts",
     "vendor/plugins/authlogic_facebook/spec/spec_helper.rb",
     "vendor/plugins/mini_fb/README.markdown",
     "vendor/plugins/mini_fb/Rakefile",
     "vendor/plugins/mini_fb/VERSION.yml",
     "vendor/plugins/mini_fb/lib/mini_fb.rb",
     "vendor/plugins/mini_fb/mini_fb.gemspec",
     "vendor/plugins/mini_fb/test/test_mini_fb.rb"
  ]
  s.homepage = %q{http://github.com/jashmenn/carpet-users}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{a rails3 engine for users}
  s.test_files = [
    "test/helper.rb",
     "test/test_carpet-users.rb",
     "test/unit/person_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

