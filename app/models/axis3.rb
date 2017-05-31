class Axis3 < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Axis3.new(
			i_3_3_1: "0",
			i_3_3_2: "0",
			i_3_3_3: "0",
			i_3_3_4: "0")
	end
end
