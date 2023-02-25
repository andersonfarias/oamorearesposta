class BasicAssistance < ApplicationRecord
	has_one :dependent_variable

	def self.init
		BasicAssistance.new(
			i_10_1: "0",
			i_10_2: "0",
			i_10_3: "0",
			i_10_4: "0",
			i_10_5: "0",
			i_10_6: "0",
			i_10_7: "0",
			i_10_8: "0",
			i_10_9: "0",
			i_10_10: "0",
			i_10_11: "0",
			i_10_12: "0",
			i_10_13: "0",
			i_10_14: "0",
			i_10_15: "0")
	end
end
