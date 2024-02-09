-- chunkname: @scripts/ui/views/versus_menu/versus_party_char_selection_view_settings.lua

local view_settings = {
	picking_states_strings_lookup = {
		done = "Done",
		picking = "Picking",
		waiting = "Waiting",
	},
	picking_colors = {
		local_player = {
			255,
			252,
			221,
			0,
		},
		other_player = {
			255,
			0,
			212,
			212,
		},
	},
	side_colors = {
		hero_team = {
			255,
			0,
			204,
			255,
		},
		opponent_team = {
			255,
			250,
			24,
			24,
		},
	},
	generic_input_actions = {
		default = {
			actions = {
				{
					description_text = "input_description_navigate",
					ignore_keybinding = true,
					input_action = "d_horizontal",
					priority = 1,
				},
				{
					description_text = "input_description_select_character",
					input_action = "confirm",
					priority = 2,
				},
				{
					description_text = "input_description_next_hero",
					input_action = "cycle_next",
					priority = 3,
				},
				{
					description_text = "input_description_previous_hero",
					input_action = "cycle_previous",
					priority = 4,
				},
			},
		},
	},
	parading = {
		camera_animation = {
			duration = 2,
		},
	},
}

return view_settings
