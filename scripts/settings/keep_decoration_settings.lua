KeepDecorationSettings = {
	whitebox_ta_test_painting_01 = {
		frame_type = "wood",
		orientation = "horizontal",
		backend_key = "whitebox_ta_test_painting_01"
	},
	whitebox_ta_test_painting_02 = {
		frame_type = "gold",
		orientation = "vertical",
		backend_key = "whitebox_ta_test_painting_02"
	},
	keep_hall_painting_gold_high_1 = {
		frame_type = "wood",
		orientation = "vertical",
		backend_key = "keep_hall_painting_gold_high_1"
	},
	keep_hall_painting_wood_high_1 = {
		frame_type = "wood",
		orientation = "vertical",
		backend_key = "keep_hall_painting_wood_high_1"
	},
	keep_hall_painting_wood_high_2 = {
		frame_type = "wood",
		orientation = "vertical",
		backend_key = "keep_hall_painting_wood_high_2"
	},
	keep_hall_painting_wood_long_1 = {
		frame_type = "wood",
		orientation = "horizontal",
		backend_key = "keep_hall_painting_wood_long_1"
	},
	keep_hall_painting_wood_long_2 = {
		frame_type = "wood",
		orientation = "horizontal",
		backend_key = "keep_hall_painting_wood_long_2"
	},
	keep_kruber_painting_painted_high_1 = {
		frame_type = "paint",
		orientation = "vertical",
		backend_key = "keep_kruber_painting_painted_high_1"
	},
	keep_kruber_painting_painted_long_1 = {
		frame_type = "paint",
		orientation = "horizontal",
		backend_key = "keep_kruber_painting_painted_long_1"
	},
	keep_bardin_painting_painted_high_1 = {
		frame_type = "paint",
		orientation = "vertical",
		backend_key = "keep_bardin_painting_painted_high_1"
	},
	keep_bardin_painting_painted_long_1 = {
		frame_type = "paint",
		orientation = "horizontal",
		backend_key = "keep_bardin_painting_painted_long_1"
	},
	keep_kerillian_painting_painted_high_1 = {
		frame_type = "paint",
		orientation = "vertical",
		backend_key = "keep_kerillian_painting_painted_high_1"
	},
	keep_kerillian_painting_painted_long_1 = {
		frame_type = "paint",
		orientation = "horizontal",
		backend_key = "keep_kerillian_painting_painted_long_1"
	},
	keep_sienna_painting_painted_high_1 = {
		frame_type = "paint",
		orientation = "vertical",
		backend_key = "keep_sienna_painting_painted_high_1"
	},
	keep_sienna_painting_painted_long_1 = {
		frame_type = "paint",
		orientation = "horizontal",
		backend_key = "keep_sienna_painting_painted_long_1"
	},
	keep_salty_painting_painted_high_1 = {
		frame_type = "paint",
		orientation = "vertical",
		backend_key = "keep_salty_painting_painted_high_1"
	},
	keep_salty_painting_painted_long_1 = {
		frame_type = "paint",
		orientation = "horizontal",
		backend_key = "keep_salty_painting_painted_long_1"
	}
}

for _, dlc in pairs(DLCSettings) do
	local keep_decoration_file_names = dlc.keep_decoration_file_names

	if keep_decoration_file_names then
		for _, file_name in ipairs(keep_decoration_file_names) do
			require(file_name)
		end
	end
end

return
