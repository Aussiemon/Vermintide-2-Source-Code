-- chunkname: @scripts/settings/mutators/mutator_more_specials.lua

local max_specials_multiplier = 2
local spawn_time_reduction = 1

return {
	description = "description_mutator_more_specials",
	display_name = "display_name_mutator_more_specials",
	icon = "mutator_icon_specials_frequency",
	update_conflict_settings = function (context, data)
		MutatorUtils.update_conflict_settings_specials_frequency(max_specials_multiplier, spawn_time_reduction)
	end,
}
