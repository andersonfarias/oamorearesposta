class MainNetwork < ApplicationRecord
	has_one :dependent_variable

	def self.init
		MainNetwork.new(
			i_9_1: "0",
			i_9_2: "0",
			i_9_3: "0",
			i_9_4: "0",
			i_9_5: "0",
			i_9_6: "0",
			i_9_7: "0",
			i_9_8: "0",
			i_9_9: "0",
			i_9_10: "0",
			i_9_11: "0",
			i_9_12: "0",
			i_9_13: "0",
			i_9_14: "0",
			i_9_15: "0",
			i_9_16: "0")
	end
end
