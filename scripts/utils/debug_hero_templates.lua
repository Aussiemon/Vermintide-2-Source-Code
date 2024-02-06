-- chunkname: @scripts/utils/debug_hero_templates.lua

DebugHeroTemplates = {}

local dr_ironbreaker = {
	level = 5,
	prestige_level = 2,
	items = {
		"dr_1h_axe_1001",
		"dr_2h_axe_1001",
		"dr_2h_hammer_1001",
		"dr_1h_hammer_1001",
		"dr_shield_axe_1001",
		"dr_shield_hammer_1001",
		"dr_crossbow_1001",
		"dr_rakegun_1001",
		"dr_handgun_1001",
		"dr_drake_pistol_1001",
		"dr_2h_pick_1001",
	},
	talents = {},
}
local dr_slayer = {
	level = 15,
	prestige_level = 5,
	items = {
		"dr_1h_axe_1001",
		"dr_2h_axe_1001",
		"dr_2h_hammer_1001",
		"dr_1h_hammer_1001",
		"dr_shield_axe_1001",
		"dr_shield_hammer_1001",
		"dr_crossbow_1001",
		"dr_rakegun_1001",
		"dr_handgun_1001",
		"dr_drake_pistol_1001",
		"dr_2h_pick_1001",
	},
	talents = {},
}
local dr_ranger = {
	level = 30,
	prestige_level = 8,
	items = {
		"dr_1h_axe_2001",
		"dr_2h_axe_2001",
		"dr_2h_hammer_2001",
		"dr_1h_hammer_2001",
		"dr_shield_axe_2001",
		"dr_shield_hammer_2001",
		"dr_crossbow_2001",
		"dr_rakegun_2001",
		"dr_handgun_2001",
		"dr_drake_pistol_2001",
		"dr_2h_pick_2001",
	},
	talents = {},
}

DebugHeroTemplates.dr_ironbreaker = table.clone(dr_ironbreaker)
DebugHeroTemplates.dr_slayer = table.clone(dr_slayer)
DebugHeroTemplates.dr_ranger = table.clone(dr_ranger)

local wh_zealot = {
	level = 5,
	prestige_level = 2,
	items = {
		"wh_1h_axe_1001",
		"wh_2h_sword_1001",
		"wh_fencing_sword_1001",
		"wh_brace_of_pistols_1001",
		"wh_repeating_pistols_1001",
		"wh_crossbow_1001",
		"wh_crossbow_repeater_1001",
		"wh_1h_falchion_1001",
	},
	talents = {},
}
local wh_bountyhunter = {
	level = 15,
	prestige_level = 5,
	items = {
		"wh_1h_axe_1001",
		"wh_2h_sword_1001",
		"wh_fencing_sword_1001",
		"wh_brace_of_pistols_1001",
		"wh_repeating_pistols_1001",
		"wh_crossbow_1001",
		"wh_crossbow_repeater_1001",
		"wh_1h_falchion_1001",
	},
	talents = {},
}
local wh_captain = {
	level = 30,
	prestige_level = 8,
	items = {
		"wh_1h_axe_2001",
		"wh_2h_sword_2001",
		"wh_fencing_sword_2001",
		"wh_brace_of_pistols_2001",
		"wh_repeating_pistols_2001",
		"wh_crossbow_2001",
		"wh_crossbow_repeater_2001",
		"wh_1h_falchion_2001",
	},
	talents = {},
}

DebugHeroTemplates.wh_zealot = table.clone(wh_zealot)
DebugHeroTemplates.wh_bountyhunter = table.clone(wh_bountyhunter)
DebugHeroTemplates.wh_captain = table.clone(wh_captain)

local es_poacher = {
	level = 5,
	prestige_level = 2,
	items = {
		"es_1h_sword_1001",
		"es_1h_mace_1001",
		"es_2h_sword_1001",
		"es_2h_hammer_1001",
		"es_sword_shield_1001",
		"es_mace_shield_1001",
		"es_1h_flail_1001",
		"es_halberd_1001",
		"es_blunderbuss_1001",
		"es_handgun_1001",
		"es_repeating_handgun_1001",
	},
	talents = {},
}
local es_fullplate = {
	level = 15,
	prestige_level = 5,
	items = {
		"es_1h_sword_1001",
		"es_1h_mace_1001",
		"es_2h_sword_1001",
		"es_2h_hammer_1001",
		"es_sword_shield_1001",
		"es_mace_shield_1001",
		"es_1h_flail_1001",
		"es_halberd_1001",
		"es_blunderbuss_1001",
		"es_handgun_1001",
		"es_repeating_handgun_1001",
		"es_1h_flail_0001",
	},
	talents = {},
}
local es_vanilla = {
	level = 30,
	prestige_level = 8,
	items = {
		"es_1h_sword_2001",
		"es_1h_mace_2001",
		"es_2h_sword_2001",
		"es_2h_hammer_2001",
		"es_sword_shield_2001",
		"es_mace_shield_2001",
		"es_1h_flail_2001",
		"es_halberd_2001",
		"es_blunderbuss_2001",
		"es_handgun_2001",
		"es_repeating_handgun_2001",
	},
	talents = {},
}

DebugHeroTemplates.es_poacher = table.clone(es_poacher)
DebugHeroTemplates.es_fullplate = table.clone(es_fullplate)
DebugHeroTemplates.es_vanilla = table.clone(es_vanilla)

local we_shade = {
	level = 5,
	prestige_level = 2,
	items = {
		"we_dual_wield_daggers_1001",
		"we_dual_wield_swords_1001",
		"we_1h_sword_1001",
		"we_dual_wield_sword_dagger_1001",
		"we_shortbow_1001",
		"we_shortbow_hagbane_1001",
		"we_longbow_1001",
		"we_longbow_trueflight_1001",
		"we_2h_axe_1001",
	},
	talents = {},
}
local we_maiden = {
	level = 15,
	prestige_level = 5,
	items = {
		"we_dual_wield_daggers_1001",
		"we_dual_wield_swords_1001",
		"we_1h_sword_1001",
		"we_dual_wield_sword_dagger_1001",
		"we_shortbow_1001",
		"we_shortbow_hagbane_1001",
		"we_longbow_1001",
		"we_longbow_trueflight_1001",
		"we_2h_axe_1001",
	},
	talents = {},
}
local we_waywatcher = {
	level = 30,
	prestige_level = 8,
	items = {
		"we_dual_wield_daggers_2001",
		"we_dual_wield_swords_2001",
		"we_1h_sword_2001",
		"we_dual_wield_sword_dagger_2001",
		"we_shortbow_2001",
		"we_shortbow_hagbane_2001",
		"we_longbow_2001",
		"we_longbow_trueflight_2001",
		"we_2h_axe_2001",
	},
	talents = {},
}

DebugHeroTemplates.we_shade = table.clone(we_shade)
DebugHeroTemplates.we_maiden = table.clone(we_maiden)
DebugHeroTemplates.we_waywatcher = table.clone(we_waywatcher)

local bw_sniper = {
	level = 5,
	prestige_level = 2,
	items = {
		"bw_1h_mace_1001",
		"bw_flame_sword_1001",
		"bw_sword_1001",
		"bw_skullstaff_fireball_1001",
		"bw_skullstaff_beam_1001",
		"bw_skullstaff_geiser_1001",
		"bw_skullstaff_spear_1001",
	},
	talents = {},
}
local bw_boomer = {
	level = 15,
	prestige_level = 5,
	items = {
		"bw_1h_mace_1001",
		"bw_flame_sword_1001",
		"bw_sword_1001",
		"bw_skullstaff_fireball_1001",
		"bw_skullstaff_beam_1001",
		"bw_skullstaff_geiser_1001",
		"bw_skullstaff_spear_1001",
	},
	talents = {},
}
local bw_melee = {
	level = 30,
	prestige_level = 8,
	items = {
		"bw_1h_mace_2001",
		"bw_flame_sword_2001",
		"bw_sword_2001",
		"bw_skullstaff_fireball_2001",
		"bw_skullstaff_beam_2001",
		"bw_skullstaff_geiser_2001",
		"bw_skullstaff_spear_2001",
	},
	talents = {},
}

DebugHeroTemplates.bw_sniper = table.clone(bw_sniper)
DebugHeroTemplates.bw_boomer = table.clone(bw_boomer)
DebugHeroTemplates.bw_melee = table.clone(bw_melee)

for name, debug_hero_data in pairs(DebugHeroTemplates) do
	debug_hero_data.name = name
end
