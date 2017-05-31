class Axis1 < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Axis1.new(
			i_3_1_1: "0",
			i_3_1_2: "0",
			i_3_1_3: "0",
			i_3_1_4: "0")
	end
end
