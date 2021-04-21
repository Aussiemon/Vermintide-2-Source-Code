local skin_bw_myrmidia = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_blazing_sun_01/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_blazing_sun_01/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_blazing_sun_01/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_blazing_sun_01/first_person_base/chr_first_person_mesh",
		attachment_node_linking = table.clone(AttachmentNodeLinking.first_person_attachment)
	}
}
local skin_dr_irondrake = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_irondrake/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_irondrake/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_irondrake/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_irondrake/first_person_base/chr_first_person_mesh",
		attachment_node_linking = table.clone(AttachmentNodeLinking.first_person_attachment)
	}
}
local skin_es_mercenary_1001 = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary_skin_01/third_person_base/chr_third_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary_skin_01/third_person_base/chr_third_person_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary_skin_01/third_person_base/chr_third_person_husk_base",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary_skin_01/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	}
}
local skin_ww_shade_1001 = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade_skin_01/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_shade_skin_01/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade_skin_01/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade_skin_01/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	}
}
local skin_wh_bountyhunter_1001 = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_bounty_hunter_skin_01/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_bounty_hunter_skin_01/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_bounty_hunter_skin_01/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter_skin_01/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	}
}

return {
	skin_bw_myrmidia = skin_bw_myrmidia,
	skin_dr_irondrake = skin_dr_irondrake,
	skin_es_mercenary_1001 = skin_es_mercenary_1001,
	skin_ww_shade_1001 = skin_ww_shade_1001,
	skin_wh_bountyhunter_1001 = skin_wh_bountyhunter_1001
}
