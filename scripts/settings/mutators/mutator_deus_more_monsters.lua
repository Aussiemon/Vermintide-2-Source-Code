require("scripts/settings/dlcs/morris/deus_terror_event_tags")

return {
	description = "mutator_deus_more_monsters_desc",
	display_name = "mutator_deus_more_monsters_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_more_monsters",
	get_terror_event_tags = function (context, data, terror_event_tags)
		terror_event_tags[#terror_event_tags + 1] = DeusTerrorEventTags.MORE_MONSTERS
	end
}
