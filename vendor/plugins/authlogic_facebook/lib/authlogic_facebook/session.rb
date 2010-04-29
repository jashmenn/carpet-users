module AuthlogicFacebook
  module Session
    def self.included(klass)
      klass.class_eval do
        extend Config
        include Methods
      end
    end

    module Config
      # REQUIRED
      #
      # Specify your api_key.
      #
      # * <tt>Default:</tt> nil
      # * <tt>Accepts:</tt> String
      def facebook_api_key(value=nil)
        rw_config(:facebook_api_key, value, nil)
      end
      alias_method :facebook_api_key=, :facebook_api_key

      # REQUIRED
      #
      # Specify your secret_key.
      #
      # * <tt>Default:</tt> nil
      # * <tt>Accepts:</tt> String
      def facebook_secret_key(value=nil)
        rw_config(:facebook_secret_key, value, nil)
      end
      alias_method :facebook_secret_key=, :facebook_secret_key

      # Which user field should be used for the facebook UID?
      #
      # * <tt>Default:</tt> :facebook_uid
      # * <tt>Accepts:</tt> Symbol
      def facebook_uid_field(value=nil)
        rw_config(:facebook_uid_field, value, :facebook_uid)
      end
      alias_method :facebook_uid_field=, :facebook_uid_field

      # Which user field should be used for the facebook session key?
      #
      # * <tt>Default:</tt> :facebook_session
      # * <tt>Accepts:</tt> Symbol
      def facebook_session_field(value=nil)
        rw_config(:facebook_session_field, value, :facebook_session)
      end
      alias_method :facebook_session_field=, :facebook_session_field

      # Which user attr_writer should be used for the (full) name for
      # a new user when facebook_auto_register is enabled?
      #
      # * <tt>Default:</tt> :name
      # * <tt>Accepts:</tt> Symbol
      def facebook_name_field(value=nil)
        rw_config(:facebook_name_field, value, :name)
      end
      alias_method :facebook_name_field=, :facebook_name_field

      # Which User attr_writer should be used for facebook username (if
      # one exists) for a new user when facebook_auto_register is enabled?
      #
      # * <tt>Default:</tt> :facebook_username
      # * <tt>Accepts:</tt> Symbol
      def facebook_username_field(value=nil)
        rw_config(:facebook_username_field, value, :facebook_username)
      end
      alias_method :facebook_username_field=, :facebook_username_field

      # What extended permissions should be requested from the user?
      #
      # * <tt>Default:</tt> []
      # * <tt>Accepts:</tt> Array of Strings
      def facebook_permissions(value=nil)
        rw_config(:facebook_permissions, value, [])
      end
      alias_method :facebook_permissions=, :facebook_permissions

      # Should a new user be automatically created if there is no user with
      # given facebook uid?
      #
      # * <tt>Default:</tt> false
      # * <tt>Accepts:</tt> Boolean
      def facebook_auto_register(value=nil)
        rw_config(:facebook_auto_register, value, false)
      end
      alias_method :facebook_auto_register=, :facebook_auto_register
      alias_method :facebook_auto_register?, :facebook_auto_register

      # Which method should be called before the event of a successful
      # authentication via facebook connect?
      #
      # * <tt>Default:</tt> :during_connect
      # * <tt>Accepts:</tt> Symbol
      def facebook_connect_callback(value=nil)
        rw_config(:facebook_connect_callback, value, :before_facebook_connect)
      end
      alias_method :facebook_connect_callback=, :facebook_connect_callback
    end

    module Methods
      def self.included(klass)
        klass.class_eval do
          attr_accessor :facebook_uid, :facebook_session, :facebook_name, :facebook_username
          validate :validate_by_facebook, :if => :authenticating_with_facebook?
          delegate :facebook_auto_register?, :facebook_uid_field, :facebook_session_field,
              :facebook_api_key, :facebook_secret_key, :facebook_connect_callback,
              :facebook_name_field, :facebook_username_field, :to => "self.class"
        end
      end

      # Hooks into credentials to print out meaningful credentials for Facebook connect.
      def credentials
        if self.authenticating_with_facebook?
          details = {
            :facebook_uid => self.send(self.facebook_uid_field),
            :facebook_session => self.send(self.facebook_session_field)
          }
        else
          super
        end
      end
      
      # Hooks into credentials so that you can pass :facebook_uid and :facebook_session keys.
      def credentials=(value)
        super
        values = value.is_a?(Array) ? value : [value]
        if values.first.is_a?(Hash)
          hash = values.first.with_indifferent_access
          self.facebook_uid = hash[:facebook_uid].to_i if hash.key?(:facebook_uid)
          self.facebook_session = hash[:facebook_session]
          self.facebook_name = hash[:facebook_name]
          self.facebook_username = hash[:facebook_username]
        end
      end

      # def facebook_session
      #   return @facebook_session if defined?(@facebook_session)
      #   session_key = unverified_facebook_params['session_key']

      #   uid = nil
      #   10.times do
      #     params = {'session_key' => session_key}
      #     begin
      #       uid = MiniFB.call(self.class.facebook_api_key,
      #                         self.class.facebook_secret_key,
      #                         'Users.getLoggedInUser', params)
      #       break
      #     rescue Errno::ECONNRESET, EOFError, Timeout::Error => e
      #       exception = e
      #     end
      #   end

      #   if !uid
      #     raise exception
      #   end

      #   # Facebook returns quotes on /occasion/ (uh, wtf?)
      #   uid = uid.strip.sub(/^"(\d+)"$/, '\1')
      #   @facebook_session = {'uid' => uid, 'session_key' => session_key}
      # end

      # def unverified_facebook_params
      #   if defined?(@unverified_facebook_params)
      #     return @unverified_facebook_params
      #   end

      #   params = ActiveSupport::JSON.decode(self.controller.params['session'] || '')
      #   @unverified_facebook_params = params.is_a?(Hash) ? params : {}
      # end


      protected

      def facebook_api_params_provided?
        return @facebook_api_params_provided_p if defined? @facebook_api_params_provided_p

        @facebook_api_params_provided_p =
            (!self.facebook_api_key.blank? && !self.facebook_secret_key.blank? && true) ||
                warn("Expected #{self.class.name} to declare Facebook API key and secret. Not authenticating using Facebook." || false)
      end

      def facebook_request_params_provided?
        !self.send(self.facebook_uid_field).blank?
      end

      # Override this if you only want some requests to use facebook
      def authenticating_with_facebook?
        self.facebook_api_params_provided? && facebook_request_params_provided? && !authenticating_with_unauthorized_record?
      end

      def validate_by_facebook
        if self.facebook_uid.nil? || self.facebook_session.nil?
          errors.add_to_base(I18n.t('error_messages.facebook_connect_failed', :default => 'Authentication via Facebook Connect failed.'))
          return
        end

        self.attempted_record = klass.where(self.facebook_uid_field => self.facebook_uid).first || klass.new

        if !self.attempted_record.new_record? || self.facebook_auto_register?
          self.attempted_record.send(:"#{self.facebook_session_field}=", self.facebook_session)

          if self.attempted_record.new_record?
            self.attempted_record.send(:"#{self.facebook_uid_field}=", self.facebook_uid)
            self.attempted_record.send(:"#{self.facebook_name_field}=", self.facebook_name) if self.attempted_record.respond_to? "#{self.facebook_name_field}="
            self.attempted_record.send(:"#{self.facebook_username_field}=", self.facebook_username) if self.attempted_record.respond_to?("#{self.facebook_username_field}=") && !self.facebook_username.blank?

            [:persistence, :single_access].each do |token|
              self.attempted_record.send("reset_#{token}_token") if self.attempted_record.respond_to? "#{token}_token"
            end
          end

          if self.attempted_record.respond_to?(self.facebook_connect_callback)
            self.attempted_record.send(self.facebook_connect_callback, self)
          end
        else
          errors.add_to_base(I18n.t('error_messages.facebook_connect_by_unregistered_user', :default => 'Your Facebook account is not connected to any registered user on file.'))
        end
      end

    end
  end
end
