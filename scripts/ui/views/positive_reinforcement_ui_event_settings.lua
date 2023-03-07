return {
	save = {
		text_function = function (amount, player_1_name, player_2_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_saved_player_multiple"), player_1_name, player_2_name, amount)
			else
				return string.format(Localize("positive_reinforcement_player_saved_player"), player_1_name, player_2_name)
			end
		end,
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or script_data.enable_reinforcement_ui_remote_sound and "hud_info"
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_saved", image_2
		end
	},
	revive = {
		text_function = function (amount, player_1_name, player_2_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_revived_player_multiple"), player_1_name, player_2_name, amount)
			else
				return string.format(Localize("positive_reinforcement_player_revived_player"), player_1_name, player_2_name)
			end
		end,
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or script_data.enable_reinforcement_ui_remote_sound and "hud_info"
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_revive", image_2
		end
	},
	assisted_respawn = {
		text_function = function (amount, player_1_name, player_2_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_rescued_player_multiple"), player_1_name, player_2_name, amount)
			else
				return string.format(Localize("positive_reinforcement_player_rescued_player"), player_1_name, player_2_name)
			end
		end,
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or script_data.enable_reinforcement_ui_remote_sound and "hud_info"
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_assisted_respawn", image_2
		end
	},
	killed_special = {
		text_function = function (amount, player_name, breed_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_killed_special_multiple"), player_name, Localize(breed_name), amount)
			else
				return string.format(Localize("positive_reinforcement_player_killed_special"), player_name, Localize(breed_name))
			end
		end,
		sound_function = function ()
			return nil
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_kill", image_2
		end
	},
	player_killed = {
		text_function = function (amount, player_name, breed_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_killed_special_multiple"), player_name, Localize(breed_name), amount)
			else
				return string.format(Localize("positive_reinforcement_player_killed_special"), player_name, Localize(breed_name))
			end
		end,
		sound_function = function ()
			return nil
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_kill", image_2
		end
	},
	player_knocked_down = {
		text_function = function (amount, player_name, breed_name)
			if amount > 1 then
				return string.format(Localize("positive_reinforcement_player_killed_special_multiple"), player_name, Localize(breed_name), amount)
			else
				return string.format(Localize("positive_reinforcement_player_killed_special"), player_name, Localize(breed_name))
			end
		end,
		sound_function = function ()
			return nil
		end,
		icon_function = function (image_1, image_2)
			return image_1, "killfeed_icon_12", image_2
		end
	},
	dealing_damage = {
		text_function = function (amount, player_name, breed_name)
			if amount > 5 then
				return string.format(Localize("positive_reinforcement_player_killed_special_multiple"), player_name, Localize(breed_name), amount)
			else
				return string.format(Localize("positive_reinforcement_player_killed_special"), player_name, Localize(breed_name))
			end
		end,
		sound_function = function ()
			return "hud_achievement_unlock_02"
		end,
		icon_function = function (image_1, image_2)
			return image_1, "reinforcement_kill", image_2
		end
	},
	collected_isha_reward = {
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or script_data.enable_reinforcement_ui_remote_sound and "hud_info"
		end,
		icon_function = function (image_1, image_2)
			return nil, "killfeed_icon_isha", image_2
		end
	},
	collected_grimnir_reward = {
		sound_function = function ()
			return script_data.reinforcement_ui_local_sound or "hud_achievement_unlock_02" or script_data.enable_reinforcement_ui_remote_sound and "hud_info"
		end,
		icon_function = function (image_1, image_2)
			return nil, "killfeed_icon_grimnir", image_2
		end
	}
}
