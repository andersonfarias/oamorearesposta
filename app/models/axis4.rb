class Axis4 < ApplicationRecord
	has_one :independent_variable

	def self.init
		Axis4.new(
			i_3_4_1: "0",
			i_3_4_2: "0",
			i_3_4_3: "0",
			i_3_4_4: "0",
			i_3_4_5: "0",
			i_3_4_6: "0",
			i_3_4_7: "0",
			i_3_4_8: "0",
			i_3_4_9: "0")
	end
end
