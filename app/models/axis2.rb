class Axis2 < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Axis2.new(
			i_3_2_1: "0",
			i_3_2_2: "0",
			i_3_2_3: "0",
			i_3_2_4: "0")
	end
end
