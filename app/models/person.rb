require 'tmail'
class Person < ActiveRecord::Base
  has_one :user
  validates_presence_of :phone#, :message => "Phone number can't be blank"
  validates_presence_of :zip#, :message => "Zip code can't be blank"
  validates_presence_of :email#, :message => "Email can't be blank"

  validates_format_of :phone,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}$/i

  validates_format_of :zip,
    :message => "must be a valid zip code.",
    :with => %r{\d{5}(-\d{4})?} 

  validate :valid_email?

  def valid_email?
      TMail::Address.parse(email)
  rescue => e
      # errors.add_to_base("Must be a valid email")
      errors[:base] << "Must be a valid email."
  end

  def zip_object
    Zipcode.find_by_zip(self.zip)
  end
end
