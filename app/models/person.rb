class Person < ActiveRecord::Base
  has_one :user
  validates_format_of :phone,
    :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}$/i

  validates_format_of :zip,
    :message => "must be a valid zip code.",
    :with => %r{\d{5}(-\d{4})?} 

  validate :valid_email?

  def valid_email?
      TMail::Address.parse(email)
  rescue
      errors.add_to_base(“Must be a valid email”)
  end
end
