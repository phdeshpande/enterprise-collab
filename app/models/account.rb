class Account < ActiveRecord::Base
		validates :office, numericality: { only_integer: true }
      validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
end
