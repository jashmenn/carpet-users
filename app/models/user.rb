require 'digest/sha1'

class User < ActiveRecord::Base
  validates_format_of :login, :with => /^[A-Za-z0-9_]+$/, :message => "must be only numbers or letters" 
  belongs_to :person
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "/images/avatars/default_avatar_:style.png"
  SALT = "n12kjed982nkjwe9a8njkna98dakjndniu98ykjn9871y2"

  acts_as_authentic
  # generalize_credentials_error_messages true

  def self.find_by_identifier(identifier)
      find(:first, :conditions =>   ['id = ? OR login = ? OR email = ?', identifier, identifier, identifier])
  end
  def to_param
      login || id
  end

  def check_for_facebook_values(details=nil)
    if self.new_record? && self.facebook_session && self.facebook_uid

      # check for password
      if self.password.nil?
        tmp_pass = Digest::SHA1.hexdigest(Time.now.to_s + SALT)
        self.password = tmp_pass
        self.password_confirmation = tmp_pass
      end

      # check for login -todo
      if self.login.nil?
        self.login = self.facebook_uid # tmp
      end
    end
  end

end
