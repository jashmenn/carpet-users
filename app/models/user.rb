require 'digest/sha1'
require 'andand'

class User < ActiveRecord::Base
  validates_format_of :login, :with => /^[A-Za-z0-9_@\.\+\-]+$/, :message => "must be only numbers or letters" 
  belongs_to :person
  has_attached_file :avatar, 
    :styles => { :large => "230x230#", :medium => "100x100#", :thumb => "50x50#" }, 
    :default_url => "/images/avatars/default_avatar_:style.png",
    :storage => Rails.application.config.file_storage,
    :path => Rails.application.config.paperclip_path, 
    :s3_credentials => "#{Rails.root}/config/s3.yml"

  SALT = "n12kjed982nkjwe9a8njkna98dakjndniu98ykjn9871y2" # todo - mv to config otherwise this is a huge security hole b/c you pushed it to github

  acts_as_authentic
  # generalize_credentials_error_messages true
  has_many :timeline_events_users, :class_name => "TimelineEventsUsers"
  has_many :timeline_events, :through => :timeline_events_users

  def self.find_by_identifier(identifier)
    if identifier =~ /^\d+$/
      find(:first, :conditions => ['id = ?', identifier])
    else
      find(:first, :conditions => ['login = ? OR email = ?', identifier, identifier])
    end
  end
  def to_param
      login || id
  end

  def check_for_facebook_values(details=nil)
    if self.new_record? && self.facebook_session && self.facebook_uid
      # Rails.logger.info("  it is a new record")

      # check for password
      if self.password.nil?
        tmp_pass = Digest::SHA1.hexdigest(Time.now.to_s + SALT)
        self.password = tmp_pass
        self.password_confirmation = tmp_pass
      end

      # check for login -todo
      if self.login.nil?
        login_as_param = self.name.andand.downcase.gsub(/\W/,"_")
        proposed_login = login_as_param || self.facebook_uid

        if self.class.find_by_identifier(proposed_login)
          self.login = login_as_param + "_" + self.facebook_uid
        else
          self.login = proposed_login 
        end
        # Rails.logger.info("  set login to #{proposed_login}")
      end
    end
  end

  def best_name
     self.name && self.name.length > 0 ? self.name : 
     self.facebook_username && self.name.length > 0  ? self.facebook_username :
     self.login
  end

  def is_admin?
    login == "nate" ? true : false
  end

end
