-- chunkname: @scripts/settings/trophies.lua

Trophies = Trophies or {}
Trophies.hub_trophy_empty = {
	description = "hub_trophy_empty_description",
	display_name = "hub_trophy_empty_name",
	icon = "icon_placeholder",
	sound_event = "hub_trophy_empty_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_empty",
}
Trophies.hub_trophy_holly = {
	description = "keep_trophy_holly_description",
	display_name = "interaction_holly_stone",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_holly_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_holly",
}
Trophies.hub_trophy_skarrik = {
	description = "keep_trophy_skarrik_description",
	display_name = "keep_trophy_skarrik",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_skarrik_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_skarrik",
}
Trophies.hub_trophy_bugman = {
	description = "keep_trophy_bugman_description",
	display_name = "interaction_bugmans",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_bugman_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_bugman",
}
Trophies.hub_trophy_bodvarr = {
	description = "keep_trophy_bodvarr_description",
	display_name = "keep_trophy_bodvarr",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_bodvarr_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_bodvarr",
}
Trophies.hub_trophy_burblespue = {
	description = "keep_trophy_burblespue_description",
	display_name = "keep_trophy_burblespue",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_burblespue_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_burblespue",
}
Trophies.hub_trophy_nurgloth = {
	description = "keep_trophy_nurgloth_description",
	display_name = "keep_trophy_nurgloth",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_nurgloth_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_nurgloth",
}
Trophies.hub_trophy_bogenhafen = {
	description = "keep_trophy_bogenhafen_description",
	display_name = "keep_trophy_bogenhafen",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_bogenhafen_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_bogenhafen",
}
Trophies.hub_trophy_rasknitt = {
	description = "keep_trophy_rasknitt_description",
	display_name = "keep_trophy_rasknitt",
	icon = "icon_placeholder",
	sound_event = "keep_trophy_rasknitt_description",
	unit_name = "units/props/inn/hub_trophy/hub_trophy_rasknitt",
}
DefaultTrophies = {
	"hub_trophy_empty",
}

local trophy_order = {
	"hub_trophy_empty",
	"hub_trophy_holly",
	"hub_trophy_skarrik",
	"hub_trophy_bugman",
	"hub_trophy_bodvarr",
	"hub_trophy_burblespue",
	"hub_trophy_nurgloth",
	"hub_trophy_bogenhafen",
	"hub_trophy_rasknitt",
}

TrophyOrder = TrophyOrder or {}

for _, painting in ipairs(trophy_order) do
	if not table.contains(TrophyOrder, painting) and not table.contains(DefaultTrophies, painting) then
		TrophyOrder[#TrophyOrder + 1] = painting
	end
end

table.sort(TrophyOrder)
