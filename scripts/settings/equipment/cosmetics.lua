require("scripts/settings/equipment/player_wwise_dependencies")

Cosmetics = {}
local skin_dr_default = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_default = table.clone(skin_dr_default)
local skin_dr_ironbreaker = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_ironbreaker/third_person_base/chr_third_person_husk_base",
	career = 1,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_ironbreaker/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ironbreaker)
}
Cosmetics.skin_dr_ironbreaker = table.clone(skin_dr_ironbreaker)
local skin_dr_slayer = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_slayer/third_person_base/chr_third_person_husk_base",
	career = 2,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_slayer/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.slayer)
}
Cosmetics.skin_dr_slayer = table.clone(skin_dr_slayer)
local skin_dr_ranger = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	career = 3,
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger = table.clone(skin_dr_ranger)
local skin_dr_ranger_helmgart = {
	third_person_husk = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	career = 3,
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/dwarf_ranger_upgraded/third_person_base/chr_third_person_base",
	first_person_attachment = {
		unit = "units/beings/player/dwarf_ranger_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/chr_dwarf_ranger_upgraded_body_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/dwarf_ranger_upgraded/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.bardin.ranger)
}
Cosmetics.skin_dr_ranger_helmgart = table.clone(skin_dr_ranger_helmgart)
local skin_es_default = {
	third_person_husk = "units/beings/player/empire_soldier/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_default = table.clone(skin_es_default)
local skin_es_knight = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.knight)
}
Cosmetics.skin_es_knight = table.clone(skin_es_knight)
local skin_es_mercenary = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary = table.clone(skin_es_mercenary)
local skin_es_mercenary_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/empire_soldier_mercenary/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_mercenary/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/empire_soldier_mercenary/skins/helmgart/empire_soldier_mercenary_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/empire_soldier_mercenary/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.mercenary)
}
Cosmetics.skin_es_mercenary_helmgart = table.clone(skin_es_mercenary_helmgart)
local skin_es_huntsman = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/empire_soldier_huntsman/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/empire_soldier_huntsman/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.markus.huntsman)
}
Cosmetics.skin_es_huntsman = table.clone(skin_es_huntsman)
local skin_ww_default = {
	third_person_husk = "units/beings/player/way_watcher/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_default = table.clone(skin_ww_default)
local skin_ww_shade = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_shade/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_shade/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.shade)
}
Cosmetics.skin_ww_shade = table.clone(skin_ww_shade)
local skin_ww_maidenguard = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_maiden_guard/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_maiden_guard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.maiden_guard)
}
Cosmetics.skin_ww_maidenguard = table.clone(skin_ww_maidenguard)
local skin_ww_waywatcher = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher = table.clone(skin_ww_waywatcher)
local skin_ww_waywatcher_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/way_watcher_upgraded/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/way_watcher_upgraded/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/way_watcher_upgraded/skins/helmgart/chr_player_waywatcher_wood_elf_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart",
			mtr_outfit_ds = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_ds"
		},
		first_person = {
			mtr_outfit = "units/beings/player/way_watcher_upgraded/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.kerillian.waywatcher)
}
Cosmetics.skin_ww_waywatcher_helmgart = table.clone(skin_ww_waywatcher_helmgart)
local skin_wh_default = {
	third_person_husk = "units/beings/player/witch_hunter/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_default = table.clone(skin_wh_default)
local skin_wh_captain = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain = table.clone(skin_wh_captain)
local skin_wh_captain_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/witch_hunter_captain/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_captain/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/witch_hunter_captain/skins/helmgart/chr_witch_hunter_captain_body_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/witch_hunter_captain/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.witch_hunter_captain)
}
Cosmetics.skin_wh_captain_helmgart = table.clone(skin_wh_captain_helmgart)
local skin_wh_zealot = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_zealot/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_zealot/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.zealot)
}
Cosmetics.skin_wh_zealot = table.clone(skin_wh_zealot)
local skin_wh_bountyhunter = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/witch_hunter_bounty_hunter/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/witch_hunter_bounty_hunter/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.victor.bounty_hunter)
}
Cosmetics.skin_wh_bountyhunter = table.clone(skin_wh_bountyhunter)
local skin_bw_default = {
	third_person_husk = "units/beings/player/bright_wizard/third_person_base/chr_third_person_husk_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	always_hide_attachment_slots = {
		"slot_hat"
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_default = table.clone(skin_bw_default)
local skin_bw_unchained = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_unchained/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_unchained/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.unchained)
}
Cosmetics.skin_bw_unchained = table.clone(skin_bw_unchained)
local skin_bw_scholar = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_scholar/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_scholar/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.scholar)
}
Cosmetics.skin_bw_scholar = table.clone(skin_bw_scholar)
local skin_bw_adept = {
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept = table.clone(skin_bw_adept)
local skin_bw_adept_helmgart = {
	first_person = "units/beings/player/first_person_base/chr_first_person_base",
	third_person = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	third_person_husk = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_husk_base",
	first_person_bot = "units/beings/player/first_person_base/chr_first_person_bot_base",
	third_person_bot = "units/beings/player/bright_wizard_adept/third_person_base/chr_third_person_base",
	unit = "",
	first_person_attachment = {
		unit = "units/beings/player/bright_wizard_adept/first_person_base/chr_first_person_mesh",
		attachment_node_linking = AttachmentNodeLinking.first_person_attachment
	},
	material_changes = {
		package_name = "units/beings/player/bright_wizard_adept/skins/helmgart/chr_player_bright_wizard_adept_helmgart",
		third_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart"
		},
		first_person = {
			mtr_outfit = "units/beings/player/bright_wizard_adept/skins/helmgart/mtr_outfit_helmgart_1p"
		}
	},
	wwise_dep = table.clone(PlayerWwiseDependencies.sienna.adept)
}
Cosmetics.skin_bw_adept_helmgart = table.clone(skin_bw_adept_helmgart)
local frame_0000 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_0000 = table.clone(frame_0000)
local frame_0001 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_0001 = table.clone(frame_0001)
local frame_0002 = {
	icon = "unit_frame_03"
}
Cosmetics.frame_0002 = table.clone(frame_0002)
local frame_0003 = {
	icon = "unit_frame_04"
}
Cosmetics.frame_0003 = table.clone(frame_0003)
local frame_0004 = {
	icon = "unit_frame_05"
}
Cosmetics.frame_0004 = table.clone(frame_0004)
local frame_0005 = {
	icon = "unit_frame_06"
}
Cosmetics.frame_0005 = table.clone(frame_0005)
local frame_0006 = {
	icon = "unit_frame_07"
}
Cosmetics.frame_0006 = table.clone(frame_0006)
local frame_dev = {
	icon = "unit_frame_02"
}
Cosmetics.frame_dev = table.clone(frame_dev)
local frame_collectors_edition = {
	icon = "unit_frame_02"
}
Cosmetics.frame_collectors_edition = table.clone(frame_collectors_edition)
local frame_community_01 = {
	icon = "unit_frame_02"
}
Cosmetics.frame_community_01 = table.clone(frame_community_01)

for name, cosmetic_data in pairs(Cosmetics) do
	cosmetic_data.name = name
end

return 
