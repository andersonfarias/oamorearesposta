class Axis5 < ActiveRecord::Base
	has_one :independent_variable

	def self.init
		Axis5.new(
			i_3_5_1: "0",
			i_3_5_2: "0",
			i_3_5_3: "0",
			i_3_5_4: "0",
			i_3_5_5: "0")
	end
end
