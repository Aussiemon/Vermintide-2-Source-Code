require("scripts/settings/dlcs/morris/deus_terror_event_tags")

local conversion_table = {
	shield_rats_no_elites = "shield_rats",
	beastmen = "beastmen_elites",
	marauders_and_warriors = "marauders_elites",
	beastmen_light = "beastmen",
	standard_no_elites = "standard"
}

return {
	description = "mutator_deus_more_elites_desc",
	display_name = "mutator_deus_more_elites_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_more_elites",
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		MutatorUtils.tweak_pack_spawning_settings_convert_breeds(pack_spawning_settings, conversion_table)
	end,
	get_terror_event_tags = function (context, data, terror_event_tags)
		terror_event_tags[#terror_event_tags + 1] = DeusTerrorEventTags.MORE_ELITES
	end
}
