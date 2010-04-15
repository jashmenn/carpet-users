class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :person
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "50x50>" }, :default_url => "/images/avatars/default_avatar_:style.png"
end
