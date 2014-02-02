class Account < ActiveRecord::Base
	validates_format_of :zipcode, :presence => true, :with => %r{\d{5}(-\d{4})?}, :message => "Format: 12345 or 12345-1234"
	validates :office, numericality: { only_integer: true }
    validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
end
