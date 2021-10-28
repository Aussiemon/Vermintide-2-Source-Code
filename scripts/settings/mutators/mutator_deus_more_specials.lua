require("scripts/settings/dlcs/morris/deus_terror_event_tags")

local max_specials_multiplier = 2
local spawn_time_reduction = 1

return {
	description = "mutator_deus_more_specials_desc",
	display_name = "mutator_deus_more_specials_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_more_specials",
	update_conflict_settings = function (context, data)
		MutatorUtils.update_conflict_settings_specials_frequency(max_specials_multiplier, spawn_time_reduction)
	end,
	get_terror_event_tags = function (context, data, terror_event_tags)
		terror_event_tags[#terror_event_tags + 1] = DeusTerrorEventTags.MORE_SPECIALS
	end
}
