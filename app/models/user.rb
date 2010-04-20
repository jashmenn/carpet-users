class User < ActiveRecord::Base
  validates_format_of :login, :with => /^[A-Za-z0-9_]+$/, :message => "must be only numbers or letters" 
  acts_as_authentic
  belongs_to :person
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "/images/avatars/default_avatar_:style.png"

  def self.find_by_identifier(identifier)
      find(:first, :conditions =>   ['id = ? OR login = ? OR email = ?', identifier, identifier, identifier])
  end
  def to_param
      login || id
  end
end
