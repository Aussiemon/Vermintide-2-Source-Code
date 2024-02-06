﻿-- chunkname: @scripts/settings/unit_variation_settings.lua

require("foundation/scripts/util/table")

UnitVariationSettings = {}
UnitVariationSettings.critter_rat = {
	enabled_from_start = {},
	body_parts = {},
	materials_enabled_from_start = {
		"skin_tint",
	},
	material_variations = {
		skin_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_common_rat",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.critter_pig = table.create_copy(UnitVariationSettings.critter_pig, UnitVariationSettings.critter_rat)
UnitVariationSettings.critter_pig.material_variations.skin_tint.materials = {
	"mtr_skin",
}
UnitVariationSettings.critter_nurgling = table.create_copy(UnitVariationSettings.critter_nurgling, UnitVariationSettings.critter_pig)
UnitVariationSettings.critter_nurgling.material_variations.skin_tint.materials = {
	"chr_critter_nurgling",
}
UnitVariationSettings.skaven_skin = {
	materials_enabled_from_start = {
		"skin_tint",
	},
	material_variations = {
		skin_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_skin",
				"mtr_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.skaven_grey_seer = table.create_copy(UnitVariationSettings.skaven_grey_seer, UnitVariationSettings.skaven_skin)
UnitVariationSettings.skaven_gutter_runner = table.create_copy(UnitVariationSettings.skaven_gutter_runner, UnitVariationSettings.skaven_skin)
UnitVariationSettings.skaven_night_runner = table.create_copy(UnitVariationSettings.skaven_night_runner, UnitVariationSettings.skaven_skin)
UnitVariationSettings.skaven_poison_wind_globadier = table.create_copy(UnitVariationSettings.skaven_poison_wind_globadier, UnitVariationSettings.skaven_skin)
UnitVariationSettings.skaven_common = table.create_copy(UnitVariationSettings.skaven_common, UnitVariationSettings.skaven_skin)
UnitVariationSettings.skaven_common.material_variations.cloth_tint = {
	max = 31,
	min = 0,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_variation",
	},
}
UnitVariationSettings.skaven_common.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
}
UnitVariationSettings.skaven_pack_master = table.create_copy(UnitVariationSettings.skaven_pack_master, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_pack_master.material_variations.packmaster_cloth_tint = {
	max = 31,
	min = 0,
	materials = {
		"mtr_packmaster_outfit",
	},
	variables = {
		"tint_color_variation",
	},
	meshes = {
		"g_packmaster_outfit_lod0",
		"g_packmaster_outfit_lod1",
		"g_packmaster_outfit_lod2",
	},
}
UnitVariationSettings.skaven_pack_master.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
	"packmaster_cloth_tint",
}
UnitVariationSettings.skaven_pack_master.material_variations.cloth_tint.meshes = {
	"g_outfit_lod0",
	"g_outfit_lod1",
	"g_outfit_lod2",
}
UnitVariationSettings.skaven_plague_monk = table.create_copy(UnitVariationSettings.skaven_plague_monk, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_ratling_gunner = table.create_copy(UnitVariationSettings.skaven_ratling_gunner, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_warpfire_thrower = table.create_copy(UnitVariationSettings.skaven_warpfire_thrower, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_warpfire_thrower.material_variations.cloth_tint = {
	max = 30,
	min = 0,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_variation",
	},
}
UnitVariationSettings.skaven_rat_ogre = table.create_copy(UnitVariationSettings.skaven_rat_ogre, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_stormfiend = table.create_copy(UnitVariationSettings.skaven_stormfiend, UnitVariationSettings.skaven_common)
UnitVariationSettings.skaven_stormfiend.material_variations.master_skin_tint = {
	max = 31,
	min = 0,
	materials = {
		"mtr_skin_master",
	},
	variables = {
		"tint_color_variation",
	},
}
UnitVariationSettings.skaven_stormfiend.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
	"master_skin_tint",
}
UnitVariationSettings.skaven_stormfiend_boss = table.create_copy(UnitVariationSettings.skaven_stormfiend_boss, UnitVariationSettings.skaven_stormfiend)
UnitVariationSettings.skaven_stormfiend_demo = table.create_copy(UnitVariationSettings.skaven_stormfiend_demo, UnitVariationSettings.skaven_stormfiend)
UnitVariationSettings.skaven_clan_rat = {
	materials_enabled_from_start = {
		"skin_tint",
		"cloth_tint",
	},
	material_variations = {
		skin_tint = {
			max = 28,
			min = 0,
			materials = {
				"mtr_skin",
				"mtr_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
	scale_variation = {
		helmet_spikes = {
			"j_helmet_spikes_1",
			"j_helmet_spikes_2",
			"j_helmet_spikes_3",
		},
	},
}
UnitVariationSettings.skaven_clan_rat_baked = table.create_copy(UnitVariationSettings.skaven_clan_rat_baked, UnitVariationSettings.skaven_clan_rat)
UnitVariationSettings.skaven_dummy_clan_rat = table.create_copy(UnitVariationSettings.skaven_dummy_clan_rat, UnitVariationSettings.skaven_clan_rat)
UnitVariationSettings.skaven_clan_rat_with_shield = table.create_copy(UnitVariationSettings.skaven_clan_rat_with_shield, UnitVariationSettings.skaven_clan_rat)
UnitVariationSettings.skaven_clan_rat_with_shield.material_variations.tint_set_1 = {
	max = 2,
	min = 2,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.skaven_clan_rat_with_shield.material_variations.tint_set_2 = {
	max = 3,
	min = 3,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.skaven_clan_rat_with_shield.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
	"tint_set_1",
	"tint_set_2",
}
UnitVariationSettings.skaven_clan_rat_with_shield_baked = table.create_copy(UnitVariationSettings.skaven_clan_rat_with_shield_baked, UnitVariationSettings.skaven_clan_rat_with_shield)
UnitVariationSettings.skaven_loot_rat = table.create_copy(UnitVariationSettings.skaven_loot_rat, UnitVariationSettings.skaven_clan_rat)
UnitVariationSettings.skaven_loot_rat.material_variations.tint_set_1 = {
	max = 7,
	min = 7,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.skaven_loot_rat.material_variations.tint_set_2 = {
	max = 6,
	min = 6,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.skaven_loot_rat.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
	"tint_set_1",
	"tint_set_2",
}
UnitVariationSettings.skaven_slave = {
	enabled_from_start = {
		"left_arm",
		"right_arm",
		"legs",
	},
	body_parts = {
		left_arm = {
			{
				group = "left_arm_straps",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "right_arm_straps",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		legs = {
			{
				group = "leg_straps",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"skin_tint",
		"cloth_tint",
		"dirt_threshold",
		"dirt_variation",
	},
	material_variations = {
		skin_tint = {
			max = 28,
			min = 0,
			materials = {
				"mtr_skin",
				"mtr_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_hipcloth_lod0",
				"g_hipcloth_lod1",
				"g_hipcloth_lod2",
				"g_head_straps_lod0",
				"g_head_straps_lod1",
				"g_head_straps_lod2",
			},
		},
		dirt_threshold = {
			max = 100,
			min = 50,
			scale = 0.01,
			materials = {
				"mtr_skin",
			},
			variables = {
				"dirt_threshold",
			},
		},
		dirt_variation = {
			max = 3,
			min = 0,
			materials = {
				"mtr_skin",
			},
			variables = {
				"dirt_variation",
			},
		},
		leg_straps = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_legs_straps_lod0",
				"g_legs_straps_lod1",
				"g_legs_straps_lod2",
			},
		},
		left_arm_straps = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_arm_left_straps_lod0",
				"g_arm_left_straps_lod1",
				"g_arm_left_straps_lod2",
			},
		},
		right_arm_straps = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_arm_right_straps_lod0",
				"g_arm_right_straps_lod1",
				"g_arm_right_straps_lod2",
			},
		},
	},
}
UnitVariationSettings.skaven_dummy_slave = table.create_copy(UnitVariationSettings.skaven_dummy_slave, UnitVariationSettings.skaven_slave)
UnitVariationSettings.skaven_slave_baked = {
	materials_enabled_from_start = {
		"skin_tint",
		"cloth_tint",
	},
	material_variations = {
		skin_tint = {
			max = 28,
			min = 0,
			materials = {
				"mtr_skin",
				"mtr_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.skaven_storm_vermin = {
	materials_enabled_from_start = {
		"skin_tint",
		"cloth_tint",
	},
	material_variations = {
		skin_tint = {
			max = 5,
			min = 0,
			materials = {
				"mtr_skin",
				"mtr_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
		cloth_tint = {
			max = 30,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.skaven_storm_vermin_baked = table.create_copy(UnitVariationSettings.skaven_storm_vermin_baked, UnitVariationSettings.skaven_storm_vermin)
UnitVariationSettings.skaven_storm_vermin_commander = table.create_copy(UnitVariationSettings.skaven_storm_vermin_commander, UnitVariationSettings.skaven_storm_vermin)
UnitVariationSettings.skaven_storm_vermin_commander_baked = table.create_copy(UnitVariationSettings.skaven_storm_vermin_commander_baked, UnitVariationSettings.skaven_storm_vermin)
UnitVariationSettings.skaven_storm_vermin_with_shield = table.create_copy(UnitVariationSettings.skaven_storm_vermin_with_shield, UnitVariationSettings.skaven_storm_vermin)
UnitVariationSettings.skaven_storm_vermin_with_shield.material_variations.tint_set_1 = {
	max = 0,
	min = 0,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.skaven_storm_vermin_with_shield.material_variations.tint_set_2 = {
	max = 2,
	min = 2,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.skaven_storm_vermin_with_shield.materials_enabled_from_start = {
	"skin_tint",
	"cloth_tint",
	"tint_set_1",
	"tint_set_2",
}
UnitVariationSettings.skaven_storm_vermin_with_shield_baked = table.create_copy(UnitVariationSettings.skaven_storm_vermin_with_shield_baked, UnitVariationSettings.skaven_storm_vermin_with_shield)
UnitVariationSettings.skaven_storm_vermin_champion = table.create_copy(UnitVariationSettings.skaven_storm_vermin_champion, UnitVariationSettings.skaven_storm_vermin)
UnitVariationSettings.skaven_storm_vermin_champion.material_variations.cloth_tint = {
	max = 0,
	min = 0,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_variation",
	},
}
UnitVariationSettings.skaven_storm_vermin_champion.material_variations.tint_set_1 = {
	max = 4,
	min = 4,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.skaven_storm_vermin_champion.material_variations.tint_set_2 = {
	max = 5,
	min = 5,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.skaven_storm_vermin_champion.materials_enabled_from_start = {
	"cloth_tint",
	"tint_set_1",
	"tint_set_2",
}
UnitVariationSettings.skaven_storm_vermin_warlord = table.create_copy(UnitVariationSettings.skaven_storm_vermin_warlord, UnitVariationSettings.skaven_storm_vermin_champion)
UnitVariationSettings.skaven_storm_vermin_warlord.material_variations.tint_set_1 = {
	max = 7,
	min = 7,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.skaven_storm_vermin_warlord.material_variations.tint_set_2 = {
	max = 6,
	min = 6,
	materials = {
		"mtr_outfit",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.chaos_warrior = {
	enabled_from_start = {
		"cloth1",
		"cloth2",
		"left_arm",
		"right_arm",
		"upper_body",
	},
	body_parts = {
		cloth1 = {
			{
				group = "vg_cloth_var1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		cloth2 = {
			{
				group = "vg_cloth_var2",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_shoulderpads_shield_left_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_shoulderpads_shield_right_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		upper_body = {
			{
				group = "vg_chest_sign",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	material_variations = {
		vg_cloth_var1 = {
			max = 31,
			min = 0,
			materials = {
				"mtr_cloth",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_cloth_var1",
				"g_cloth_var1_lod1",
				"g_cloth_var1_lod2",
				"g_cloth_var1_lod3",
			},
		},
		vg_cloth_var2 = {
			max = 31,
			min = 0,
			materials = {
				"mtr_cloth",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_cloth_var2",
				"g_cloth_var2_lod1",
				"g_cloth_var2_lod2",
				"g_cloth_var2_lod3",
			},
		},
	},
}
UnitVariationSettings.chaos_exalted_champion = {
	materials_enabled_from_start = {
		"cloth1_tint",
		"cloth2_tint",
		"cloak_tint",
	},
	material_variations = {
		cloth1_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_cloth",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_cloth_var1",
				"g_cloth_var1_lod1",
				"g_cloth_var1_lod2",
				"g_cloth_var1_lod3",
			},
		},
		cloth2_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_cloth",
			},
			variables = {
				"tint_color_variation",
			},
			meshes = {
				"g_cloth_var2",
				"g_cloth_var2_lod1",
				"g_cloth_var2_lod2",
				"g_cloth_var2_lod3",
			},
		},
		cloak_tint = {
			max = 18,
			min = 0,
			materials = {
				"mtr_fur",
				"mtr_cloak_fur",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_exalted_champion_norsca = table.create_copy(UnitVariationSettings.chaos_exalted_champion_norsca, UnitVariationSettings.chaos_exalted_champion)
UnitVariationSettings.chaos_marauder = {
	enabled_from_start = {
		"lower_body",
		"upper_body",
		"left_arm",
		"right_arm",
	},
	body_parts = {
		lower_body = {
			{
				group = "vg_hip_1",
				weight = 1,
			},
			{
				group = "vg_hip_2",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		upper_body = {
			{
				weight = 1,
				enables = {
					"upper_body_straps",
				},
			},
			{
				weight = 1,
				enables = {
					"upper_body_straps",
				},
			},
			{
				weight = 1,
				enables = {
					"upper_body_straps",
				},
			},
			{
				group = "vg_body_girdle_1",
				weight = 1,
				enables = {
					"upper_body_girdle_straps",
				},
			},
			{
				group = "vg_body_girdle_1",
				weight = 1,
				enables = {
					"upper_body_girdle_straps",
				},
			},
			{
				group = "vg_body_girdle_2",
				weight = 1,
				enables = {
					"upper_body_girdle_straps",
				},
			},
			{
				group = "vg_body_girdle_2",
				weight = 1,
				enables = {
					"upper_body_girdle_straps",
				},
			},
		},
		upper_body_straps = {
			{
				group = "vg_body_hood_1",
				weight = 1,
			},
			{
				group = "vg_body_hood_1",
				weight = 1,
			},
			{
				group = "vg_body_straps_c_1",
				weight = 1,
				enables = {
					"left_shoulder",
					"upper_body_straps_detail",
				},
			},
			{
				group = "vg_body_straps_c_1",
				weight = 1,
				enables = {
					"right_shoulder",
					"upper_body_straps_detail",
				},
			},
			{
				group = "vg_body_straps_l_1",
				weight = 1,
				enables = {
					"left_shoulder",
				},
			},
			{
				group = "vg_body_straps_l_1",
				weight = 1,
				enables = {
					"left_shoulder",
				},
			},
			{
				group = "vg_body_straps_l_1",
				weight = 1,
			},
			{
				group = "vg_body_straps_r_1",
				weight = 1,
				enables = {
					"right_shoulder",
				},
			},
			{
				weight = 1,
			},
		},
		upper_body_girdle_straps = {
			{
				group = "vg_body_hood_1",
				weight = 1,
			},
			{
				group = "vg_body_hood_1",
				weight = 1,
			},
			{
				group = "vg_body_straps_c_girdle_1",
				weight = 1,
				enables = {
					"left_shoulder",
					"upper_body_straps_detail",
				},
			},
			{
				group = "vg_body_straps_c_girdle_1",
				weight = 1,
				enables = {
					"right_shoulder",
					"upper_body_straps_detail",
				},
			},
			{
				group = "vg_body_straps_l_girdle_1",
				weight = 1,
				enables = {
					"left_shoulder",
				},
			},
			{
				group = "vg_body_straps_l_girdle_1",
				weight = 1,
				enables = {
					"left_shoulder",
				},
			},
			{
				group = "vg_body_straps_l_girdle_1",
				weight = 1,
			},
			{
				group = "vg_body_straps_r_girdle_1",
				weight = 1,
				enables = {
					"right_shoulder",
				},
			},
			{
				weight = 1,
			},
		},
		upper_body_straps_detail = {
			{
				group = "vg_body_straps_detail_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_arm_left_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_shoulder = {
			{
				group = "vg_shoulder_left_1",
				weight = 1,
			},
			{
				group = "vg_shoulder_left_2",
				weight = 1,
			},
			{
				group = "vg_shoulder_left_3",
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_arm_right_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_shoulder = {
			{
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				group = "vg_shoulder_right_1",
				weight = 1,
			},
			{
				group = "vg_shoulder_right_2",
				weight = 1,
			},
			{
				group = "vg_shoulder_right_3",
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"cloth_tint",
		"body_tint",
		"tattoo",
		"tattoo_color",
		"moc_attachments_tints",
	},
	material_variations = {
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
		body_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tint_color_variation",
			},
		},
		tattoo = {
			max = 3,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_style",
			},
		},
		tattoo_color = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_color_variation",
			},
		},
		vg_body_hood_1 = {
			max = 31,
			min = 0,
			materials = {
				"m_moc_hood",
			},
			variables = {
				"tint_color_variation",
			},
		},
		moc_attachments_tints = {
			max = 31,
			min = 0,
			materials = {
				"m_moc_attachements",
			},
			variables = {
				"tint_color_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_marauder_baked = table.create_copy(UnitVariationSettings.chaos_marauder_baked, UnitVariationSettings.chaos_marauder)
UnitVariationSettings.chaos_marauder_baked.enabled_from_start = {}
UnitVariationSettings.chaos_marauder_baked.body_parts = {}
UnitVariationSettings.chaos_marauder_with_shield = table.create_copy(UnitVariationSettings.chaos_marauder_with_shield, UnitVariationSettings.chaos_marauder)
UnitVariationSettings.chaos_marauder_with_shield.body_parts.upper_body_straps = {
	{
		group = "vg_body_straps_c_1",
		weight = 1,
		enables = {
			"left_shoulder",
			"upper_body_straps_detail",
		},
	},
	{
		group = "vg_body_straps_c_1",
		weight = 1,
		enables = {
			"right_shoulder",
			"upper_body_straps_detail",
		},
	},
	{
		group = "vg_body_straps_l_1",
		weight = 1,
		enables = {
			"left_shoulder",
		},
	},
	{
		group = "vg_body_straps_l_1",
		weight = 1,
		enables = {
			"left_shoulder",
		},
	},
	{
		group = "vg_body_straps_r_1",
		weight = 1,
		enables = {
			"right_shoulder",
		},
	},
}
UnitVariationSettings.chaos_marauder_with_shield.body_parts.upper_body_girdle_straps = {
	{
		group = "vg_body_straps_c_girdle_1",
		weight = 1,
		enables = {
			"left_shoulder",
			"upper_body_straps_detail",
		},
	},
	{
		group = "vg_body_straps_c_girdle_1",
		weight = 1,
		enables = {
			"right_shoulder",
			"upper_body_straps_detail",
		},
	},
	{
		group = "vg_body_straps_l_girdle_1",
		weight = 1,
		enables = {
			"left_shoulder",
		},
	},
	{
		group = "vg_body_straps_l_girdle_1",
		weight = 1,
		enables = {
			"left_shoulder",
		},
	},
	{
		group = "vg_body_straps_r_girdle_1",
		weight = 1,
		enables = {
			"right_shoulder",
		},
	},
}
UnitVariationSettings.chaos_marauder_with_shield.body_parts.right_shoulder = {
	{
		group = "vg_shoulder_right_1",
		weight = 1,
	},
	{
		group = "vg_shoulder_right_2",
		weight = 1,
	},
	{
		group = "vg_shoulder_right_3",
		weight = 1,
	},
}
UnitVariationSettings.chaos_marauder_with_shield.material_variations.tint_column = {
	max = 5,
	min = 5,
	materials = {
		"mtr_outfit",
		"m_moc_attachements",
		"m_moc_hood",
	},
	variables = {
		"tint_color_set_1",
	},
}
UnitVariationSettings.chaos_marauder_with_shield.material_variations.tint_column_detail = {
	max = 6,
	min = 6,
	materials = {
		"mtr_outfit",
		"m_moc_attachements",
		"m_moc_hood",
		"mtr_body",
	},
	variables = {
		"tint_color_set_2",
	},
}
UnitVariationSettings.chaos_marauder_with_shield.materials_enabled_from_start = {
	"cloth_tint",
	"tint_column",
	"tint_column_detail",
	"body_tint",
	"tattoo",
	"tattoo_color",
	"moc_attachments_tints",
}
UnitVariationSettings.chaos_marauder_with_shield_baked = table.create_copy(UnitVariationSettings.chaos_marauder_with_shield_baked, UnitVariationSettings.chaos_marauder_with_shield)
UnitVariationSettings.chaos_marauder_with_shield_baked.enabled_from_start = {}
UnitVariationSettings.chaos_marauder_with_shield_baked.body_parts = {}
UnitVariationSettings.chaos_berzerker = {
	enabled_from_start = {
		"lower_body",
		"left_arm",
		"right_arm",
	},
	body_parts = {
		lower_body = {
			{
				group = "vg_hip_1",
				weight = 1,
			},
			{
				group = "vg_hip_2",
				weight = 1,
			},
			{
				group = "vg_hip_3",
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_arm_left_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_arm_right_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"cloth_tint",
		"tint_column",
		"tint_column_detail",
		"body_tint",
		"tattoo",
		"tattoo_color",
	},
	material_variations = {
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
		tint_column = {
			max = 7,
			min = 7,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_set_1",
			},
		},
		tint_column_detail = {
			max = 8,
			min = 8,
			materials = {
				"mtr_outfit",
				"mtr_body",
			},
			variables = {
				"tint_color_set_2",
			},
		},
		body_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tint_color_variation",
			},
		},
		tattoo = {
			max = 3,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_style",
			},
		},
		tattoo_color = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_color_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_berzerker_baked = table.create_copy(UnitVariationSettings.chaos_berzerker_baked, UnitVariationSettings.chaos_berzerker)
UnitVariationSettings.chaos_berzerker_baked.enabled_from_start = {}
UnitVariationSettings.chaos_berzerker_baked.body_parts = {}
UnitVariationSettings.chaos_raider = {
	enabled_from_start = {
		"lower_body",
		"left_arm",
		"right_arm",
	},
	body_parts = {
		lower_body = {
			{
				group = "vg_hip_1",
				weight = 1,
			},
			{
				group = "vg_hip_2",
				weight = 1,
			},
			{
				group = "vg_hip_3",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_arm_left_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_arm_right_1",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"cloth_tint",
		"tint_column",
		"tint_column_detail",
		"body_tint",
		"tattoo",
		"tattoo_color",
	},
	material_variations = {
		cloth_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
		tint_column = {
			max = 9,
			min = 9,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_set_1",
			},
		},
		tint_column_detail = {
			max = 10,
			min = 10,
			materials = {
				"mtr_outfit",
				"mtr_body",
			},
			variables = {
				"tint_color_set_2",
			},
		},
		body_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tint_color_variation",
			},
		},
		tattoo = {
			max = 3,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_style",
			},
		},
		tattoo_color = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tattoo_color_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_raider_baked = table.create_copy(UnitVariationSettings.chaos_raider_baked, UnitVariationSettings.chaos_raider)
UnitVariationSettings.chaos_raider_baked.enabled_from_start = {}
UnitVariationSettings.chaos_raider_baked.body_parts = {}
UnitVariationSettings.chaos_raider_tutorial = table.create_copy(UnitVariationSettings.chaos_raider_tutorial, UnitVariationSettings.chaos_raider)
UnitVariationSettings.chaos_zombie = {
	enabled_from_start = {
		"gut",
		"web",
		"lower_body_right",
		"lower_body_left",
		"upper_body_right",
		"upper_body_left",
		"left_arm",
		"right_arm",
		"left_shoulder",
		"right_shoulder",
	},
	body_parts = {
		gut = {
			{
				group = "vg_intestines",
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		web = {
			{
				group = "vg_web",
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		lower_body_right = {
			{
				group = "vg_r_lower_leg",
				weight = 1,
			},
			{
				group = "vg_r_upper_leg",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		lower_body_left = {
			{
				group = "vg_l_lower_leg",
				weight = 1,
			},
			{
				group = "vg_l_upper_leg",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		upper_body_right = {
			{
				group = "vg_r_chest",
				weight = 1,
			},
			{
				group = "vg_r_neck",
				weight = 1,
			},
			{
				group = "vg_r_pit",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		upper_body_left = {
			{
				group = "vg_l_chest",
				weight = 1,
			},
			{
				group = "vg_l_neck",
				weight = 1,
			},
			{
				group = "vg_l_pit",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_l_hand_1",
				weight = 1,
			},
			{
				group = "vg_l_hand_2",
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_shoulder = {
			{
				group = "vg_l_shoulder",
				weight = 1,
				enables = {
					"left_shoulder_lower",
				},
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_shoulder_lower = {
			{
				group = "vg_l_shoulder_lower",
				weight = 1,
				enables = {
					"left_shoulder_lower_slime",
				},
			},
			{
				weight = 1,
			},
		},
		left_shoulder_lower_slime = {
			{
				group = "vg_l_slime",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_r_hand_1",
				weight = 1,
			},
			{
				group = "vg_r_hand_2",
				weight = 1,
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_shoulder = {
			{
				group = "vg_r_shoulder",
				weight = 1,
				enables = {
					"right_shoulder_lower",
				},
			},
			{
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		right_shoulder_lower = {
			{
				group = "vg_r_shoulder_lower",
				weight = 1,
				enables = {
					"right_shoulder_lower_slime",
				},
			},
			{
				weight = 1,
			},
		},
		right_shoulder_lower_slime = {
			{
				group = "vg_r_slime",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"body_tint",
	},
	material_variations = {
		body_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_nurgle_corpse",
			},
			variables = {
				"gradient_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_sorcerer = {}
UnitVariationSettings.chaos_vortex_sorcerer = {
	enabled_from_start = {
		"mask",
	},
	body_parts = {
		mask = {
			{
				group = "mask1",
				weight = 1,
			},
			{
				group = "mask2",
				weight = 1,
			},
			{
				group = "mask3",
				weight = 1,
			},
		},
	},
}
UnitVariationSettings.chaos_plague_sorcerer = {}
UnitVariationSettings.chaos_fanatic = {
	enabled_from_start = {
		"body",
		"head",
		"right_arm",
		"left_arm",
		"body_straps",
	},
	body_parts = {
		body = {
			{
				group = "vg_tabard",
				weight = 0.5,
			},
			{
				weight = 1,
			},
		},
		body_straps = {
			{
				group = "vg_straps_chest",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		head = {
			{
				group = "vg_mask",
				weight = 0.3,
			},
			{
				group = "vg_straps_head",
				weight = 0.5,
			},
			{
				weight = 1,
			},
		},
		right_arm = {
			{
				group = "vg_straps_arm_right_a",
				weight = 1,
			},
			{
				group = "vg_straps_arm_right_b",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
		left_arm = {
			{
				group = "vg_straps_arm_left_a",
				weight = 1,
			},
			{
				group = "vg_straps_arm_left_b",
				weight = 1,
			},
			{
				weight = 1,
			},
		},
	},
	materials_enabled_from_start = {
		"body_tint",
		"outfit_tint",
		"dirt_threshold_skin",
		"dirt_threshold_outfit",
		"dirt_variation",
	},
	material_variations = {
		body_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_body",
			},
			variables = {
				"tint_color_variation",
			},
		},
		outfit_tint = {
			max = 31,
			min = 0,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"tint_color_variation",
			},
		},
		dirt_threshold_skin = {
			max = 100,
			min = 80,
			scale = 0.01,
			materials = {
				"mtr_body",
			},
			variables = {
				"dirt_threshold",
			},
		},
		dirt_threshold_outfit = {
			max = 100,
			min = 80,
			scale = 0.01,
			materials = {
				"mtr_outfit",
			},
			variables = {
				"dirt_threshold",
			},
		},
		dirt_variation = {
			max = 3,
			min = 0,
			materials = {
				"mtr_body",
				"mtr_outfit",
			},
			variables = {
				"dirt_variation",
			},
		},
	},
}
UnitVariationSettings.chaos_fanatic_baked = table.create_copy(UnitVariationSettings.chaos_fanatic_baked, UnitVariationSettings.chaos_fanatic)
UnitVariationSettings.chaos_fanatic_baked.enabled_from_start = {}
UnitVariationSettings.chaos_fanatic_baked.body_parts = {}

DLCUtils.merge("unit_variation_settings", UnitVariationSettings)
