require("scripts/settings/attachment_node_linking")

local items = {
	outfit_null = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/player/chr_dummy_hat",
		attachment_node_linking = AttachmentNodeLinking.non_visual_attachment
	},
	wpn_skaven_sword_01_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_02_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_03_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_03",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_04_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_04",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_05_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_05",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_06_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_06",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_07_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_07",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_08_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_08",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_short_sword_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_short_sword/wpn_skaven_short_sword",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_16_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_16",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_17_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_17",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_18_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_18",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_19_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_19",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_20_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_20",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_21_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_21",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_22_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_22",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_23_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_23",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_24_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_24",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_31_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_31",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_32_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_32",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_33_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_33",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_34_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_34",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_35_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_35",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_36_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_36",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_37_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_37",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_01_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_02_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_03_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_03",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_04_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_04",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_05_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_05",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_06_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_06",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_07_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_07",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_08_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_08",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_short_sword_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_short_sword/wpn_skaven_short_sword",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_16_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_16",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_17_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_17",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_18_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_18",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_19_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_19",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_20_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_20",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_21_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_21",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_22_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_22",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_23_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_23",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_sword_24_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_24",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_sword_dual_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_dual_left",
		attachment_node_linking = AttachmentNodeLinking.ai_storm_vermin_1h_weapon_dual.left
	},
	wpn_skaven_sword_dual_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_dual_right",
		attachment_node_linking = AttachmentNodeLinking.ai_storm_vermin_1h_weapon_dual.right
	},
	wpn_skaven_sword_47_right = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_sword_47",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_skaven_mace_31_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_31",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_32_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_32",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_33_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_33",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_34_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_34",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_35_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_35",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_36_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_36",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_mace_37_left = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_mace_37",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_spear_25 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_spear_25",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_skaven_spear_27 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_spear_27",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_skaven_spear_28 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_spear_28",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_skaven_spear_29 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_spear_29",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_skaven_spear_30 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_spear_30",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	outfit_skaven_clan_rat_head_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_05 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_05",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_06 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_06",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_head_07 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_head_07",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_head_ears
	},
	outfit_skaven_clan_rat_arm_l_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_l_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_l_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_l_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_l_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_l_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_l_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_l_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_r_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_r_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_r_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_r_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_r_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_r_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale_thumb
	},
	outfit_skaven_clan_rat_arm_r_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_arm_r_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale_thumb
	},
	outfit_skaven_clan_rat_legs_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_legs_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_legs_scale
	},
	outfit_skaven_clan_rat_body_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_body_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_body_scale_w_tail
	},
	outfit_skaven_clan_rat_body_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_body_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_body_scale_w_tail
	},
	outfit_skaven_clan_rat_body_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_body_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_body_scale_w_tail
	},
	outfit_skaven_clan_rat_body_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_body_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_body_scale_w_tail
	},
	outfit_skaven_clan_rat_neck_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_neck_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_neck_long
	},
	outfit_skaven_clan_rat_baked_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_baked_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_w_tail
	},
	outfit_skaven_clan_rat_baked_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_baked_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_w_tail
	},
	outfit_skaven_clan_rat_baked_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_baked_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_w_tail
	},
	outfit_skaven_clan_rat_baked_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_clan_rat/outfits/chr_skaven_clan_rat_outfit_baked_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_w_tail
	},
	wpn_skaven_shield_38 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_38",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_01",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_03"
		}
	},
	wpn_skaven_shield_39 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_39",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_metalring_round_01",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_03",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal_02"
		}
	},
	wpn_skaven_shield_40 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_40",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_01",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_03",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal_02"
		}
	},
	wpn_skaven_shield_42 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_42",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_03",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_04"
		}
	},
	wpn_skaven_shield_44 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_44",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_03",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_triangle_04",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_metal_02"
		}
	},
	wpn_skaven_shield_45 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_45",
		unbreakable = true,
		attachment_node_linking = AttachmentNodeLinking.ai_shield
	},
	wpn_marauder_shield_01 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_01",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_03"
		}
	},
	wpn_marauder_shield_02 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_02",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shieldskull_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_03 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_03",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_04 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_04",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield9_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield9_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_05 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_05",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield5_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_06 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_06",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shieldskull_break_01"
		}
	},
	wpn_marauder_shield_07 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_07",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_08 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_08",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shieldskull_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_marauder_shield_09 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_09",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shieldskull_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield1_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield9_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield9_break_02"
		}
	},
	wpn_marauder_shield_10 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield_10",
		attachment_node_linking = AttachmentNodeLinking.ai_marauder_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield5_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shieldskull_break_01",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_02",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_03",
			"units/weapons/enemy/wpn_chaos_shields/wpn_moc_shield7_break_04"
		}
	},
	wpn_skaven_shield_46 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_shield_46",
		attachment_node_linking = AttachmentNodeLinking.ai_shield,
		drop_unit_names = {
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_metalring_round_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_02",
			"units/weapons/enemy/wpn_skaven_set/wpn_shield_shard_round_03"
		}
	},
	wpn_skaven_halberd_41 = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_halberd_41",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_skaven_halberd_stormvermin_champion = {
		unit_name = "units/weapons/enemy/wpn_skaven_set/wpn_skaven_halberd_stormvermin_champion",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_stormfiend_warpfire_r = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_stormfiend/outfits/chr_skaven_stormfiend_warpfire_r_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_simple
	},
	wpn_stormfiend_warpfire_l = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/skaven_stormfiend/outfits/chr_skaven_stormfiend_warpfire_l_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_simple
	},
	wpn_chaos_2h_axe_1 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_chaos_2h_axe_2 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_chaos_2h_axe_3 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_03",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_chaos_2h_axe_1_moc = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_2h_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_chaos_2h_axe_2_moc = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_2h_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_moc_sword_01 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_sword_01",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_sword_02 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_sword_02",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_sword_03 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_sword_03",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_sword_04 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_sword_04",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_mace_01 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_mace_01",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_mace_02 = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_mace_02",
		attachment_node_linking = AttachmentNodeLinking.ai_mace
	},
	wpn_moc_axe_01_right = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon_dual.right
	},
	wpn_moc_axe_02_right = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon_dual.right
	},
	wpn_moc_axe_01_left = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon_dual.left
	},
	wpn_moc_axe_02_left = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon_dual.left
	},
	wpn_torch_right = {
		unit_name = "units/weapons/enemy/wpn_torch/wpn_torch",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_torch_left = {
		unit_name = "units/weapons/enemy/wpn_torch/wpn_torch",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.left
	},
	wpn_skaven_packmaster_claw = {
		unit_name = "units/weapons/enemy/wpn_skaven_packmaster_claw/wpn_skaven_packmaster_claw",
		attachment_node_linking = AttachmentNodeLinking.ai_packmaster_claw
	},
	wpn_loot_rat_sack = {
		unit_extension_template = "ai_inventory_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_looter_sack/wpn_skaven_looter_sack",
		drop_unit_name = "units/weapons/enemy/wpn_skaven_looter_sack/wpn_skaven_looter_sack_static",
		attachment_node_linking = AttachmentNodeLinking.ai_looter_sack
	},
	wpn_ratlinggun = {
		unit_extension_template = "ai_weapon_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_ratlinggun/wpn_skaven_ratlinggun",
		attachment_node_linking = AttachmentNodeLinking.ai_ratlinggun,
		extension_init_data = {
			weapon_system = {
				weapon_template = "ratling_gun"
			}
		}
	},
	wpn_warpfiregun = {
		unit_extension_template = "ai_weapon_unit",
		unit_name = "units/weapons/enemy/wpn_skaven_warpfiregun/wpn_skaven_warpfiregun",
		attachment_node_linking = AttachmentNodeLinking.ai_warpfiregun,
		extension_init_data = {
			weapon_system = {
				weapon_template = "warpfire_gun"
			}
		}
	},
	wpn_chaos_troll_01 = {
		unit_name = "units/weapons/enemy/wpn_chaos_troll/wpn_chaos_troll_01",
		attachment_node_linking = AttachmentNodeLinking.ai_troll_axe
	},
	wpn_chaos_troll_02 = {
		unit_name = "units/weapons/enemy/wpn_chaos_troll/wpn_chaos_troll_02",
		attachment_node_linking = AttachmentNodeLinking.ai_troll_axe
	},
	wpn_chaos_sorcerer_stick = {
		unit_name = "units/weapons/enemy/wpn_chaos_sorcerer_stick/wpn_sorcerer_stick",
		attachment_node_linking = AttachmentNodeLinking.ai_chaos_sorcerer_stick
	},
	wpn_chaos_sorcerer_book = {
		unit_name = "units/weapons/enemy/wpn_chaos_sorcerer_book/wpn_chaos_sorcerer_book",
		attachment_node_linking = AttachmentNodeLinking.ai_chaos_sorcerer_book
	},
	wpn_chaos_sorcerer_scythe_01 = {
		unit_name = "units/weapons/enemy/wpn_chaos_sorcerer_scythe/wpn_chaos_sorcerer_scythe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_chaos_sorcerer_stick
	},
	moc_helmet_01 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_01/moc_helmet_01",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_02 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_02/moc_helmet_02",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_03 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_03/moc_helmet_03",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_04a = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_04/moc_helmet_04_a",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_04b = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_04/moc_helmet_04_b",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_04c = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_04/moc_helmet_04_c",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_04d = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_04/moc_helmet_04_d",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_05 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_05/moc_helmet_05",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_06 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_06/moc_helmet_06",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_07 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_07/moc_helmet_07",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_08 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_08/moc_helmet_08",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_09 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_09/moc_helmet_09",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_10 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_10/moc_helmet_10",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_11 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_11/moc_helmet_11",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	moc_helmet_12 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_marauder/moc_helmet_12/moc_helmet_12",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_01 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_warrior/woc_helmet_01/woc_helmet_01",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_02 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_warrior/woc_helmet_02/woc_helmet_02",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_03 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_warrior/woc_helmet_03/woc_helmet_03",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_04 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_warrior/woc_helmet_04/woc_helmet_04",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_05 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/chaos_warrior/woc_helmet_05/woc_helmet_05",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	zombie_blob_01 = {
		unit_name = "units/beings/enemies/addons/chaos_nurgle_corpses/tumors/tumor_01",
		weak_spot = "left_arm",
		attachment_node_linking = AttachmentNodeLinking.ai_zombie_blob_left
	},
	zombie_blob_02 = {
		unit_name = "units/beings/enemies/addons/chaos_nurgle_corpses/tumors/tumor_01",
		weak_spot = "right_arm",
		attachment_node_linking = AttachmentNodeLinking.ai_zombie_blob_right
	},
	zombie_blob_03 = {
		unit_name = "units/beings/enemies/addons/chaos_nurgle_corpses/tumors/tumor_01",
		weak_spot = "head",
		attachment_node_linking = AttachmentNodeLinking.ai_zombie_blob_head
	},
	wpn_npc_skeleton_sword_01_right = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_sword_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_weapon
	},
	wpn_npc_skeleton_sword_01_left = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_sword_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_weapon_offhand
	},
	wpn_npc_skeleton_shield_01 = {
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_shield_01",
		unit_extension_template = "ai_shield_unit",
		flow_event = "using_shield",
		drop_on_hit = true,
		attachment_node_linking = AttachmentNodeLinking.ai_shield
	},
	wpn_npc_skeleton_2h_hammer_01 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_2h_hammer_01",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_npc_skeleton_short_sword_01_right = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_short_sword_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_weapon
	},
	wpn_npc_skeleton_short_sword_01_left = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_npc_skeleton_set/wpn_npc_skeleton_short_sword_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_weapon_offhand
	},
	chr_npc_skeleton_armor_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_armor_01",
		flow_event = "hide_shoulders",
		attachment_node_linking = AttachmentNodeLinking.skeleton_armor
	},
	chr_npc_skeleton_helmet_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_helmet_02",
		attachment_node_linking = AttachmentNodeLinking.skeleton_helmet
	},
	chr_npc_skeleton_helmet_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_helmet_03",
		attachment_node_linking = AttachmentNodeLinking.skeleton_helmet
	},
	chr_npc_skeleton_helmet_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_helmet_04",
		attachment_node_linking = AttachmentNodeLinking.skeleton_helmet
	},
	chr_npc_skeleton_skull_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_skull_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_skull
	},
	chr_npc_skeleton_skull_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_skull_02",
		attachment_node_linking = AttachmentNodeLinking.skeleton_skull
	},
	chr_npc_skeleton_skull_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_skull_03",
		attachment_node_linking = AttachmentNodeLinking.skeleton_skull
	},
	chr_npc_skeleton_greaves_01_l = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_greaves_01_l",
		attachment_node_linking = AttachmentNodeLinking.skeleton_greaves_l
	},
	chr_npc_skeleton_greaves_01_r = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_greaves_01_r",
		attachment_node_linking = AttachmentNodeLinking.skeleton_greaves_r
	},
	chr_npc_skeleton_vambrace_01_l = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_vambrace_01_l",
		attachment_node_linking = AttachmentNodeLinking.skeleton_vambrace_l
	},
	chr_npc_skeleton_vambrace_01_r = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_vambrace_01_r",
		attachment_node_linking = AttachmentNodeLinking.skeleton_vambrace_r
	},
	chr_npc_skeleton_hip_cloth_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_hip_cloth_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_hips
	},
	chr_npc_skeleton_hip_cloth_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_hip_cloth_02",
		attachment_node_linking = AttachmentNodeLinking.skeleton_hips
	},
	chr_npc_skeleton_torso_cloth_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_torso_cloth_01",
		flow_event = "show_shoulders",
		attachment_node_linking = AttachmentNodeLinking.skeleton_torso
	},
	chr_npc_skeleton_torso_cloth_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/npcs/necromancer_skeleton/outfits/chr_npc_skeleton_torso_cloth_02",
		flow_event = "show_shoulders",
		attachment_node_linking = AttachmentNodeLinking.skeleton_torso
	},
	wpn_undead_ethereal_skeleton_sword_01 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_undead_ethereal_set/wpn_undead_ethereal_sword_01",
		attachment_node_linking = AttachmentNodeLinking.skeleton_weapon
	},
	wpn_undead_ethereal_skeleton_shield_01 = {
		unit_extension_template = "ai_shield_unit",
		unit_name = "units/weapons/enemy/wpn_undead_ethereal_set/wpn_undead_ethereal_shield_01",
		drop_on_hit = true,
		attachment_node_linking = AttachmentNodeLinking.ai_shield
	},
	wpn_undead_ethereal_skeleton_2h_hammer_01 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_undead_ethereal_set/wpn_undead_ethereal_2h_hammer_01",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_beastmen_2h_axe_2_moc = {
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_moc_2h_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_gor_axe_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_axe_02 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_axe_03 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_axe_03",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_axe_04 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_axe_04",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_flail_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_flail_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_01",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_02 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_02",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_03 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_03",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_04 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_04",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_05 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_05",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_gor_sword_06 = {
		unit_name = "units/weapons/enemy/wpn_bm_gor_set_01/wpn_bm_gor_sword_06",
		attachment_node_linking = AttachmentNodeLinking.ai_1h_weapon.right
	},
	wpn_bm_bestigor_halberd_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_01",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_standard_axe
	},
	wpn_bm_bestigor_halberd_02 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_02",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_bestigor_halberd_03 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_03",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_bestigor_halberd_04 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_04",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_standard_axe
	},
	wpn_bm_bestigor_halberd_05 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_05",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_bestigor_halberd_06 = {
		unit_name = "units/weapons/enemy/wpn_bm_bestigor_set_01/wpn_bm_bestigor_halberd_06",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_standard_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_standard_01/wpn_bm_standard_01",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_standard
	},
	wpn_bm_ungor_spear_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_spear_01",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_ungor_spear_02 = {
		unit_name = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_spear_02",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_ungor_spear_03 = {
		unit_name = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_spear_03",
		attachment_node_linking = AttachmentNodeLinking.ai_spear
	},
	wpn_bm_ungor_bow_01 = {
		unit_name = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_bow_01",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_bow
	},
	wpn_bm_ungor_bow_02 = {
		unit_name = "units/weapons/enemy/wpn_bm_ungor_set_01/wpn_bm_ungor_bow_02",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_bow
	},
	outfit_bm_ungor_head_00 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_head_00",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_head_00
	},
	outfit_bm_ungor_head_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_head_01",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_head_01
	},
	outfit_bm_ungor_head_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_head_02",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_head_02
	},
	outfit_bm_ungor_head_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_head_03",
		attachment_node_linking = AttachmentNodeLinking.ai_bm_ungor_head_03
	},
	outfit_bm_ungor_arm_l_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_l_arm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale_short
	},
	outfit_bm_ungor_arm_l_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_l_arm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_scale
	},
	outfit_bm_ungor_arm_r_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_r_arm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale_short
	},
	outfit_bm_ungor_arm_r_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_r_arm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_scale
	},
	outfit_bm_ungor_necklace_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_necklace_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_neck_long_wide
	},
	outfit_bm_ungor_necklace_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_necklace_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_neck_long_wide
	},
	outfit_bm_ungor_necklace_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_necklace_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_scale_neck_long_wide
	},
	outfit_bm_ungor_baked_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_outfit_baked_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_arm
	},
	outfit_bm_ungor_baked_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_outfit_baked_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_arm
	},
	outfit_bm_ungor_baked_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_ungor/outfits/chr_beastmen_ungor_outfit_baked_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_arm
	},
	outfit_bm_gor_horns_01 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_horns_01",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	outfit_bm_gor_horns_02 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_horns_02",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	outfit_bm_gor_horns_03 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_horns_03",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	outfit_bm_gor_horns_04 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_horns_04",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	outfit_bm_gor_horns_05 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_horns_05",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	outfit_bm_gor_belt_addon_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_belt_addon_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_belt
	},
	outfit_bm_gor_belt_addon_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_belt_addon_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_belt
	},
	outfit_bm_gor_belt_addon_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_belt_addon_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_belt
	},
	outfit_bm_gor_necklace_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_necklace_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_neck_wide
	},
	outfit_bm_gor_necklace_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_necklace_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_neck_wide
	},
	outfit_bm_gor_arm_r_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_right_arm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_forarm_scale
	},
	outfit_bm_gor_arm_r_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_right_arm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_forarm_scale
	},
	outfit_bm_gor_arm_r_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_right_arm_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_arm_forarm_scale
	},
	outfit_bm_gor_arm_l_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_left_arm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_forearm_scale
	},
	outfit_bm_gor_arm_l_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_left_arm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_forearm_scale
	},
	outfit_bm_gor_arm_l_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_left_arm_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_arm_forearm_scale
	},
	outfit_bm_baked_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_baked_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_forearm
	},
	outfit_bm_baked_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_baked_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_forearm
	},
	outfit_bm_baked_03 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_baked_03",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_forearm
	},
	outfit_bm_baked_04 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_gor/outfits/chr_beastmen_gor_outfit_baked_04",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_upper_scale_forearm
	},
	outfit_bm_bestigor_arm_r_upper_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_bestigor/outfits/chr_beastmen_bestigor_outfit_right_upperarm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_upperarm
	},
	outfit_bm_bestigor_arm_r_upper_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_bestigor/outfits/chr_beastmen_bestigor_outfit_right_upperarm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_r_upperarm
	},
	outfit_bm_bestigor_arm_l_upper_01 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_bestigor/outfits/chr_beastmen_bestigor_outfit_left_upperarm_01",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_upperarm
	},
	outfit_bm_bestigor_arm_l_upper_02 = {
		unit_extension_template = "ai_outfit_unit",
		unit_name = "units/beings/enemies/beastmen_bestigor/outfits/chr_beastmen_bestigor_outfit_left_upperarm_02",
		attachment_node_linking = AttachmentNodeLinking.ai_outfit_l_upperarm
	},
	wpn_beastmen_minotaur_dual_axes_left = {
		unit_name = "units/weapons/enemy/wpn_bm_minotaur_set_01/wpn_bm_minotaur_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_beastmen_minotaur_dual.left
	},
	wpn_beastmen_minotaur_dual_axes_right = {
		unit_name = "units/weapons/enemy/wpn_bm_minotaur_set_01/wpn_bm_minotaur_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_beastmen_minotaur_dual.right
	},
	wpn_chaos_2h_axe_blk_shadow_lieutenant_1 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_blk_2h_axe_01",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	wpn_chaos_2h_axe_blk_shadow_lieutenant_2 = {
		drop_on_hit = true,
		unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_blk_2h_axe_02",
		attachment_node_linking = AttachmentNodeLinking.ai_2h
	},
	woc_helmet_blk_shadow_lieutenant_01 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/blk_shadow_lieutenant/blk_helmet_01",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_blk_shadow_lieutenant_02 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/blk_shadow_lieutenant/blk_helmet_02",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_blk_shadow_lieutenant_03 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/blk_shadow_lieutenant/blk_helmet_03",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	woc_helmet_blk_shadow_lieutenant_04 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/enemies/addons/blk_shadow_lieutenant/blk_helmet_04",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	critter_nurgling_horn_01 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling_horn_01",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	critter_nurgling_horn_02 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling_horn_02",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	critter_nurgling_horn_03 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling_horn_03",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	critter_nurgling_horn_04 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling_horn_04",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	},
	critter_nurgling_horn_05 = {
		unit_extension_template = "ai_helmet_unit",
		unit_name = "units/beings/critters/chr_critter_nurgling/chr_critter_nurgling_horn_05",
		attachment_node_linking = AttachmentNodeLinking.ai_helmet
	}
}
local item_categories = {
	one_hand_weapon_right = {
		items.wpn_skaven_sword_01_right,
		items.wpn_skaven_sword_02_right,
		items.wpn_skaven_sword_03_right,
		items.wpn_skaven_sword_04_right,
		items.wpn_skaven_sword_05_right,
		items.wpn_skaven_sword_06_right,
		items.wpn_skaven_sword_07_right,
		items.wpn_skaven_sword_08_right,
		items.wpn_skaven_sword_16_right,
		items.wpn_skaven_sword_17_right,
		items.wpn_skaven_sword_18_right,
		items.wpn_skaven_sword_19_right,
		items.wpn_skaven_sword_20_right,
		items.wpn_skaven_sword_21_right,
		items.wpn_skaven_sword_22_right,
		items.wpn_skaven_sword_23_right,
		items.wpn_skaven_sword_24_right,
		items.wpn_skaven_mace_31_right,
		items.wpn_skaven_mace_32_right,
		items.wpn_skaven_mace_33_right,
		items.wpn_skaven_mace_34_right,
		items.wpn_skaven_mace_35_right,
		items.wpn_skaven_mace_35_right,
		items.wpn_skaven_mace_35_right,
		items.wpn_skaven_mace_35_right,
		items.wpn_skaven_mace_35_right,
		items.wpn_skaven_mace_36_right,
		items.wpn_skaven_mace_36_right,
		items.wpn_skaven_mace_36_right,
		items.wpn_skaven_mace_36_right,
		items.wpn_skaven_mace_36_right,
		items.wpn_skaven_mace_37_right,
		items.wpn_torch_right,
		items.wpn_torch_right,
		items.wpn_torch_right,
		items.wpn_torch_right,
		items.wpn_torch_right
	},
	one_hand_weapon_left = {
		items.wpn_skaven_sword_01_left,
		items.wpn_skaven_sword_02_left,
		items.wpn_skaven_sword_03_left,
		items.wpn_skaven_sword_04_left,
		items.wpn_skaven_sword_05_left,
		items.wpn_skaven_sword_06_left,
		items.wpn_skaven_sword_07_left,
		items.wpn_skaven_sword_08_left,
		items.wpn_skaven_sword_16_left,
		items.wpn_skaven_sword_17_left,
		items.wpn_skaven_sword_18_left,
		items.wpn_skaven_sword_19_left,
		items.wpn_skaven_sword_20_left,
		items.wpn_skaven_sword_21_left,
		items.wpn_skaven_sword_22_left,
		items.wpn_skaven_sword_23_left,
		items.wpn_skaven_sword_24_left,
		items.wpn_skaven_mace_31_left,
		items.wpn_skaven_mace_32_left,
		items.wpn_skaven_mace_33_left,
		items.wpn_skaven_mace_34_left,
		items.wpn_skaven_mace_35_left,
		items.wpn_skaven_mace_35_left,
		items.wpn_skaven_mace_35_left,
		items.wpn_skaven_mace_35_left,
		items.wpn_skaven_mace_35_left,
		items.wpn_skaven_mace_36_left,
		items.wpn_skaven_mace_36_left,
		items.wpn_skaven_mace_36_left,
		items.wpn_skaven_mace_36_left,
		items.wpn_skaven_mace_36_left,
		items.wpn_skaven_mace_37_left,
		items.wpn_torch_left,
		items.wpn_torch_left,
		items.wpn_torch_left,
		items.wpn_torch_left,
		items.wpn_torch_left
	},
	spear = {
		items.wpn_skaven_spear_25,
		items.wpn_skaven_spear_27,
		items.wpn_skaven_spear_28,
		items.wpn_skaven_spear_29,
		items.wpn_skaven_spear_30
	},
	bow = {
		items.wpn_bm_ungor_bow_01,
		items.wpn_bm_ungor_bow_02
	},
	clan_rat_outfit_head = {
		items.outfit_skaven_clan_rat_head_01,
		items.outfit_skaven_clan_rat_head_02,
		items.outfit_skaven_clan_rat_head_03,
		items.outfit_skaven_clan_rat_head_04,
		items.outfit_skaven_clan_rat_head_05,
		items.outfit_skaven_clan_rat_head_06
	},
	clan_rat_outfit_body = {
		items.outfit_skaven_clan_rat_body_01,
		items.outfit_skaven_clan_rat_body_02,
		items.outfit_skaven_clan_rat_body_03,
		items.outfit_skaven_clan_rat_body_04
	},
	clan_rat_outfit_arm_l = {
		items.outfit_skaven_clan_rat_arm_l_01,
		items.outfit_skaven_clan_rat_arm_l_02,
		items.outfit_skaven_clan_rat_arm_l_03,
		items.outfit_skaven_clan_rat_arm_l_04
	},
	clan_rat_outfit_arm_r = {
		items.outfit_skaven_clan_rat_arm_r_01,
		items.outfit_skaven_clan_rat_arm_r_02,
		items.outfit_skaven_clan_rat_arm_r_03,
		items.outfit_skaven_clan_rat_arm_r_04
	},
	clan_rat_outfit_legs = {
		items.outfit_null,
		items.outfit_skaven_clan_rat_legs_01
	},
	clan_rat_outfit_opt = {
		items.outfit_skaven_clan_rat_baked_01,
		items.outfit_skaven_clan_rat_baked_02,
		items.outfit_skaven_clan_rat_baked_03,
		items.outfit_skaven_clan_rat_baked_04
	},
	clan_rat_shield_outfit_head = {
		items.outfit_skaven_clan_rat_head_05,
		items.outfit_skaven_clan_rat_head_06,
		items.outfit_skaven_clan_rat_head_07
	},
	clan_rat_shield_outfit_body = {
		items.outfit_skaven_clan_rat_body_02,
		items.outfit_skaven_clan_rat_body_03,
		items.outfit_skaven_clan_rat_body_04
	},
	clan_rat_shield_outfit_arm_l = {
		items.outfit_skaven_clan_rat_arm_l_03,
		items.outfit_skaven_clan_rat_arm_l_04
	},
	clan_rat_shield_outfit_arm_r = {
		items.outfit_skaven_clan_rat_arm_r_03,
		items.outfit_skaven_clan_rat_arm_r_04
	},
	clan_rat_shield_outfit_opt = {
		items.outfit_skaven_clan_rat_baked_03,
		items.outfit_skaven_clan_rat_baked_04
	},
	clan_rat_loot_outfit_head = {
		items.outfit_skaven_clan_rat_head_03,
		items.outfit_skaven_clan_rat_head_04
	},
	clan_rat_loot_outfit_neck = {
		items.outfit_skaven_clan_rat_neck_01
	},
	clan_rat_loot_outfit_body = {
		items.outfit_skaven_clan_rat_body_02,
		items.outfit_skaven_clan_rat_body_04
	},
	clan_rat_loot_outfit_arm_l = {
		items.outfit_skaven_clan_rat_arm_l_01,
		items.outfit_skaven_clan_rat_arm_l_02
	},
	clan_rat_loot_outfit_arm_r = {
		items.outfit_skaven_clan_rat_arm_r_01,
		items.outfit_skaven_clan_rat_arm_r_02
	},
	mace = {
		items.wpn_moc_mace_01,
		items.wpn_moc_mace_02,
		items.wpn_moc_sword_01,
		items.wpn_moc_sword_02,
		items.wpn_moc_sword_03,
		items.wpn_moc_sword_04
	},
	halberd = {
		items.wpn_skaven_halberd_41
	},
	halberd_stormvermin_champion = {
		items.wpn_skaven_halberd_stormvermin_champion
	},
	stormfiend_warpfire_r = {
		items.wpn_stormfiend_warpfire_r
	},
	stormfiend_warpfire_l = {
		items.wpn_stormfiend_warpfire_l
	},
	axe = {
		items.wpn_chaos_2h_axe_1,
		items.wpn_chaos_2h_axe_2
	},
	warrior_helmet = {
		items.woc_helmet_01,
		items.woc_helmet_02,
		items.woc_helmet_03,
		items.woc_helmet_04
	},
	two_h_axe_moc = {
		items.wpn_chaos_2h_axe_1_moc,
		items.wpn_chaos_2h_axe_2_moc
	},
	exalted_axe = {
		items.wpn_chaos_2h_axe_3
	},
	exalted_helmet = {
		items.woc_helmet_05
	},
	marauder_helmet = {
		items.moc_helmet_01,
		items.moc_helmet_02,
		items.moc_helmet_05,
		items.moc_helmet_06,
		items.moc_helmet_07,
		items.moc_helmet_08,
		items.moc_helmet_09,
		items.moc_helmet_10,
		items.moc_helmet_12,
		items.moc_helmet_03,
		items.moc_helmet_04a,
		items.moc_helmet_04b,
		items.moc_helmet_04c,
		items.moc_helmet_04d
	},
	marauder_shield_helmet = {
		items.moc_helmet_11
	},
	zombie_blobs = {
		items.zombie_blob_01,
		items.zombie_blob_02,
		items.zombie_blob_03,
		items.zombie_blob_04
	},
	undead_npc_skeleton_sword = {
		items.wpn_npc_skeleton_sword_01_right
	},
	undead_npc_skeleton_shield = {
		items.wpn_npc_skeleton_shield_01
	},
	undead_npc_skeleton_2h_hammer = {
		items.wpn_npc_skeleton_2h_hammer_01
	},
	undead_npc_skeleton_dual_wield_right = {
		items.wpn_npc_skeleton_sword_01_right,
		items.wpn_npc_skeleton_short_sword_01_right
	},
	undead_npc_skeleton_dual_wield_left = {
		items.wpn_npc_skeleton_sword_01_left,
		items.wpn_npc_skeleton_short_sword_01_left
	},
	undead_npc_skeleton_skull = {
		items.chr_npc_skeleton_skull_01,
		items.chr_npc_skeleton_skull_02,
		items.chr_npc_skeleton_skull_03
	},
	undead_npc_skeleton_helmet = {
		items.outfit_null,
		items.chr_npc_skeleton_helmet_02,
		items.chr_npc_skeleton_helmet_03,
		items.chr_npc_skeleton_helmet_04
	},
	undead_npc_skeleton_chest_armor = {
		items.chr_npc_skeleton_armor_01
	},
	undead_npc_skeleton_chest_cloth = {
		items.outfit_null,
		items.chr_npc_skeleton_torso_cloth_01,
		items.chr_npc_skeleton_torso_cloth_02
	},
	undead_npc_skeleton_torso = {
		items.outfit_null,
		items.chr_npc_skeleton_armor_01,
		items.chr_npc_skeleton_torso_cloth_01,
		items.chr_npc_skeleton_torso_cloth_02
	},
	undead_npc_skeleton_hips = {
		items.outfit_null,
		items.chr_npc_skeleton_hip_cloth_01,
		items.chr_npc_skeleton_hip_cloth_01,
		items.chr_npc_skeleton_hip_cloth_02,
		items.chr_npc_skeleton_hip_cloth_02
	},
	undead_npc_skeleton_vambrace_l = {
		items.outfit_null,
		items.chr_npc_skeleton_vambrace_01_l,
		items.chr_npc_skeleton_vambrace_01_l
	},
	undead_npc_skeleton_vambrace_r = {
		items.outfit_null,
		items.chr_npc_skeleton_vambrace_01_r,
		items.chr_npc_skeleton_vambrace_01_r
	},
	undead_npc_skeleton_greaves_l = {
		items.outfit_null,
		items.chr_npc_skeleton_greaves_01_l,
		items.chr_npc_skeleton_greaves_01_l
	},
	undead_npc_skeleton_greaves_r = {
		items.outfit_null,
		items.chr_npc_skeleton_greaves_01_r,
		items.chr_npc_skeleton_greaves_01_r
	},
	undead_ethereal_skeleton_sword = {
		items.wpn_undead_ethereal_skeleton_sword_01
	},
	undead_ethereal_skeleton_shield = {
		items.wpn_undead_ethereal_skeleton_shield_01
	},
	undead_ethereal_skeleton_2h_hammer = {
		items.wpn_undead_ethereal_skeleton_2h_hammer_01
	},
	berzerker_helmet = {},
	berzerker_right = {
		items.wpn_moc_axe_01_right,
		items.wpn_moc_axe_02_right
	},
	berzerker_left = {
		items.wpn_moc_axe_01_left,
		items.wpn_moc_axe_02_left
	},
	stormvermin_one_hand_weapon_right = {
		items.wpn_skaven_sword_47_right
	},
	stormvermin_one_hand_weapon_dual_right = {
		items.wpn_skaven_sword_dual_right
	},
	stormvermin_one_hand_weapon_dual_left = {
		items.wpn_skaven_sword_dual_left
	},
	beastmen_minotaur_dual_axes_right = {
		items.wpn_beastmen_minotaur_dual_axes_right
	},
	beastmen_minotaur_dual_axes_left = {
		items.wpn_beastmen_minotaur_dual_axes_left
	},
	shield = {
		items.wpn_skaven_shield_38,
		items.wpn_skaven_shield_39,
		items.wpn_skaven_shield_40,
		items.wpn_skaven_shield_42,
		items.wpn_skaven_shield_44,
		items.wpn_skaven_shield_46
	},
	stormvermin_shield = {
		items.wpn_skaven_shield_45
	},
	marauder_shield = {
		items.wpn_marauder_shield_01,
		items.wpn_marauder_shield_02,
		items.wpn_marauder_shield_03,
		items.wpn_marauder_shield_04,
		items.wpn_marauder_shield_05,
		items.wpn_marauder_shield_06,
		items.wpn_marauder_shield_07,
		items.wpn_marauder_shield_08,
		items.wpn_marauder_shield_09,
		items.wpn_marauder_shield_10
	},
	packmaster_claw = {
		items.wpn_skaven_packmaster_claw
	},
	loot_rat_sack = {
		items.wpn_loot_rat_sack
	},
	ratlinggun = {
		items.wpn_ratlinggun
	},
	warpfiregun = {
		items.wpn_warpfiregun
	},
	chaos_troll = {
		items.wpn_chaos_troll_01,
		items.wpn_chaos_troll_02
	},
	chaos_sorcerer_stick = {
		items.wpn_chaos_sorcerer_stick
	},
	chaos_sorcerer_book = {
		items.wpn_chaos_sorcerer_book
	},
	chaos_sorcerer_scythe_01 = {
		items.wpn_chaos_sorcerer_scythe_01
	},
	beastmen_1h = {
		items.wpn_bm_gor_axe_01,
		items.wpn_bm_gor_axe_02,
		items.wpn_bm_gor_axe_03,
		items.wpn_bm_gor_axe_04,
		items.wpn_bm_gor_flail_01,
		items.wpn_bm_gor_sword_01,
		items.wpn_bm_gor_sword_02,
		items.wpn_bm_gor_sword_03,
		items.wpn_bm_gor_sword_04,
		items.wpn_bm_gor_sword_05,
		items.wpn_bm_gor_sword_06
	},
	beastmen_gor_outfit_head = {
		items.outfit_bm_gor_horns_02,
		items.outfit_bm_gor_horns_03,
		items.outfit_bm_gor_horns_04,
		items.outfit_bm_gor_horns_05
	},
	beastmen_gor_outfit_neck = {
		items.outfit_null,
		items.outfit_null,
		items.outfit_bm_gor_necklace_01,
		items.outfit_bm_gor_necklace_02
	},
	beastmen_gor_outfit_r_arm = {
		items.outfit_bm_gor_arm_r_01,
		items.outfit_bm_gor_arm_r_02,
		items.outfit_bm_gor_arm_r_03
	},
	beastmen_gor_outfit_l_arm = {
		items.outfit_bm_gor_arm_l_01,
		items.outfit_bm_gor_arm_l_02,
		items.outfit_bm_gor_arm_l_03
	},
	beastmen_gor_belt = {
		items.outfit_null,
		items.outfit_bm_gor_belt_addon_01,
		items.outfit_bm_gor_belt_addon_02,
		items.outfit_bm_gor_belt_addon_03
	},
	beastmen_gor_outfit_baked = {
		items.outfit_bm_baked_01,
		items.outfit_bm_baked_02,
		items.outfit_bm_baked_03,
		items.outfit_bm_baked_04
	},
	beastmen_bestigor_outfit_r_arm_upper = {
		items.outfit_bm_bestigor_arm_r_upper_01,
		items.outfit_bm_bestigor_arm_r_upper_02
	},
	beastmen_bestigor_outfit_l_arm_upper = {
		items.outfit_bm_bestigor_arm_l_upper_01,
		items.outfit_bm_bestigor_arm_l_upper_02
	},
	beastmen_ungor_spear = {
		items.wpn_bm_ungor_spear_01,
		items.wpn_bm_ungor_spear_02,
		items.wpn_bm_ungor_spear_03
	},
	beastmen_ungor_outfit_head = {
		items.outfit_bm_ungor_head_00,
		items.outfit_bm_ungor_head_01,
		items.outfit_bm_ungor_head_02,
		items.outfit_bm_ungor_head_03
	},
	beastmen_ungor_outfit_r_arm = {
		items.outfit_bm_ungor_arm_r_01,
		items.outfit_bm_ungor_arm_r_02
	},
	beastmen_ungor_outfit_l_arm = {
		items.outfit_bm_ungor_arm_l_01,
		items.outfit_bm_ungor_arm_l_02
	},
	beastmen_ungor_outfit_neck = {
		items.outfit_null,
		items.outfit_bm_ungor_necklace_01,
		items.outfit_bm_ungor_necklace_02,
		items.outfit_bm_ungor_necklace_03
	},
	beastmen_ungor_outfit_baked = {
		items.outfit_bm_ungor_baked_01,
		items.outfit_bm_ungor_baked_02,
		items.outfit_bm_ungor_baked_03
	},
	beastmen_bestigor_outfit_head = {
		items.outfit_bm_gor_horns_01
	},
	beastmen_standard_bearer_outfit_head = {
		items.outfit_bm_gor_horns_02
	},
	beastmen_2h_axe_2_moc = {
		items.wpn_beastmen_2h_axe_2_moc
	},
	beastmen_2h = {
		items.wpn_bm_bestigor_halberd_02,
		items.wpn_bm_bestigor_halberd_03,
		items.wpn_bm_bestigor_halberd_05,
		items.wpn_bm_bestigor_halberd_06
	},
	beastmen_2h_axe_standard = {
		items.wpn_bm_bestigor_halberd_01,
		items.wpn_bm_bestigor_halberd_04
	},
	beastmen_standard = {
		items.wpn_bm_standard_01
	},
	blk_shadow_lieutenant_warrior_helmet = {
		items.woc_helmet_blk_shadow_lieutenant_01,
		items.woc_helmet_blk_shadow_lieutenant_02,
		items.woc_helmet_blk_shadow_lieutenant_03,
		items.woc_helmet_blk_shadow_lieutenant_04
	},
	blk_shadow_lieutenant_axe = {
		items.wpn_chaos_2h_axe_blk_shadow_lieutenant_1,
		items.wpn_chaos_2h_axe_blk_shadow_lieutenant_2
	},
	critter_nurgling_horns = {
		items.critter_nurgling_horn_01,
		items.critter_nurgling_horn_02,
		items.critter_nurgling_horn_03,
		items.critter_nurgling_horn_04,
		items.critter_nurgling_horn_05
	}
}
local drop_reasons_shield = {
	death = true,
	shield_break = true
}
local drop_reasons_other = {
	death = true
}

for category_name, category in pairs(item_categories) do
	local drop_reasons = (category_name == "stormvermin_shield" or category_name == "shield" or category_name == "marauder_shield") and drop_reasons_shield or drop_reasons_other

	for i, item in ipairs(category) do
		if not item.drop_reasons then
			item.drop_reasons = drop_reasons
		end
	end
end

InventoryConfigurations = {
	empty = {
		anim_state_event = "to_sword",
		items = {}
	},
	skaven_clan_rat_sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.clan_rat_outfit_head,
			item_categories.clan_rat_outfit_arm_l,
			item_categories.clan_rat_outfit_arm_r,
			item_categories.clan_rat_outfit_legs,
			item_categories.clan_rat_outfit_body
		}
	},
	opt_skaven_clan_rat_sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.clan_rat_outfit_opt
		}
	},
	skaven_slave_sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right
		}
	},
	opt_skaven_slave_sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right
		}
	},
	sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right
		}
	},
	dual_sword = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.one_hand_weapon_left
		}
	},
	dual_axes = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_dual_wield",
		items = {
			item_categories.berzerker_right,
			item_categories.berzerker_left
		}
	},
	skaven_clan_rat_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.spear,
			item_categories.clan_rat_outfit_head,
			item_categories.clan_rat_outfit_arm_l,
			item_categories.clan_rat_outfit_arm_r,
			item_categories.clan_rat_outfit_legs,
			item_categories.clan_rat_outfit_body
		}
	},
	opt_skaven_clan_rat_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.spear,
			item_categories.clan_rat_outfit_opt
		}
	},
	skaven_slave_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.spear
		}
	},
	opt_skaven_slave_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.spear
		}
	},
	spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.spear
		}
	},
	halberd = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		equip_anim = "equip_halberd",
		items = {
			item_categories.halberd
		}
	},
	halberd_stormvermin_champion = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		equip_anim = "equip_halberd",
		items = {
			item_categories.halberd_stormvermin_champion
		}
	},
	axe_2h = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_2h_axe",
		items = {
			item_categories.two_h_axe_moc
		}
	},
	axe = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.axe
		}
	},
	warrior_axe = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.axe,
			item_categories.warrior_helmet
		}
	},
	exalted_axe = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_spear",
		items = {
			item_categories.exalted_axe,
			item_categories.exalted_helmet
		}
	},
	exalted_spawn_axe = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_spear",
		items = {
			item_categories.axe
		}
	},
	sword_and_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield_1h",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.shield
		}
	},
	skaven_clan_rat_sword_and_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield_1h",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.shield,
			item_categories.clan_rat_shield_outfit_head,
			item_categories.clan_rat_shield_outfit_arm_l,
			item_categories.clan_rat_shield_outfit_arm_r,
			item_categories.clan_rat_shield_outfit_body,
			item_categories.clan_rat_outfit_legs
		}
	},
	opt_skaven_clan_rat_sword_and_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield_1h",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.shield,
			item_categories.clan_rat_shield_outfit_opt
		}
	},
	stormvermin_sword_and_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield_1h",
		items = {
			item_categories.stormvermin_one_hand_weapon_right,
			item_categories.stormvermin_shield
		}
	},
	stormvermin_dual_wield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_dual_wield",
		equip_anim = "equip_dual_wield",
		items = {
			item_categories.stormvermin_one_hand_weapon_dual_right,
			item_categories.stormvermin_one_hand_weapon_dual_left
		}
	},
	warlord_dual_setups = {
		multiple_configurations = {
			"halberd_stormvermin_champion",
			"stormvermin_dual_wield"
		}
	},
	marauder_mace = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.marauder_helmet,
			item_categories.mace
		}
	},
	marauder_sword_and_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield",
		items = {
			item_categories.marauder_shield_helmet,
			item_categories.mace,
			item_categories.marauder_shield
		}
	},
	fanatic = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right
		}
	},
	raider_axe_2h = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_2h_axe",
		items = {
			item_categories.two_h_axe_moc
		}
	},
	berzerker_dual_axes = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_dual_wield",
		items = {
			item_categories.berzerker_right,
			item_categories.berzerker_left
		}
	},
	zombie_blobs = {
		items = {
			item_categories.zombie_blobs
		}
	},
	undead_npc_skeleton = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.undead_npc_skeleton_skull,
			item_categories.undead_npc_skeleton_sword,
			item_categories.undead_npc_skeleton_hips
		}
	},
	undead_npc_skeleton_with_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield",
		items = {
			item_categories.undead_npc_skeleton_skull,
			item_categories.undead_npc_skeleton_sword,
			item_categories.undead_npc_skeleton_shield,
			item_categories.undead_npc_skeleton_helmet,
			item_categories.undead_npc_skeleton_torso,
			item_categories.undead_npc_skeleton_hips,
			item_categories.undead_npc_skeleton_vambrace_l,
			item_categories.undead_npc_skeleton_vambrace_r,
			item_categories.undead_npc_skeleton_greaves_l,
			item_categories.undead_npc_skeleton_greaves_r
		}
	},
	undead_npc_skeleton_dual_wield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_dual_wield",
		items = {
			item_categories.undead_npc_skeleton_skull,
			item_categories.undead_npc_skeleton_dual_wield_right,
			item_categories.undead_npc_skeleton_dual_wield_left,
			item_categories.undead_npc_skeleton_helmet,
			item_categories.undead_npc_skeleton_chest_cloth,
			item_categories.undead_npc_skeleton_hips,
			item_categories.undead_npc_skeleton_vambrace_l,
			item_categories.undead_npc_skeleton_vambrace_r,
			item_categories.undead_npc_skeleton_greaves_l,
			item_categories.undead_npc_skeleton_greaves_r
		}
	},
	undead_npc_skeleton_armored = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_2h_hammer",
		items = {
			item_categories.undead_npc_skeleton_skull,
			item_categories.undead_npc_skeleton_2h_hammer,
			item_categories.undead_npc_skeleton_helmet,
			item_categories.undead_npc_skeleton_torso,
			item_categories.undead_npc_skeleton_hips,
			item_categories.undead_npc_skeleton_vambrace_l,
			item_categories.undead_npc_skeleton_vambrace_r,
			item_categories.undead_npc_skeleton_greaves_l,
			item_categories.undead_npc_skeleton_greaves_r
		}
	},
	pack_master = {
		items = {
			item_categories.packmaster_claw
		}
	},
	loot_rat_sack = {
		items = {
			item_categories.loot_rat_sack,
			item_categories.clan_rat_loot_outfit_head,
			item_categories.clan_rat_loot_outfit_arm_l,
			item_categories.clan_rat_loot_outfit_arm_r,
			item_categories.clan_rat_loot_outfit_body,
			item_categories.clan_rat_loot_outfit_neck,
			item_categories.clan_rat_outfit_legs
		}
	},
	ratlinggun = {
		enemy_hit_sound = "bullet",
		items = {
			item_categories.ratlinggun
		}
	},
	warpfiregun = {
		enemy_hit_sound = "bullet",
		items = {
			item_categories.warpfiregun
		}
	},
	rat_ogre = {
		enemy_hit_sound = "melee",
		items = {}
	},
	beastmen_minotaur_dual_axes = {
		enemy_hit_sound = "sword",
		items = {
			item_categories.beastmen_minotaur_dual_axes_right,
			item_categories.beastmen_minotaur_dual_axes_left
		}
	},
	stormfiend_warpfire = {
		enemy_hit_sound = "melee",
		items = {
			item_categories.stormfiend_warpfire_r,
			item_categories.stormfiend_warpfire_l
		}
	},
	chaos_troll = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_1h_axe",
		items = {
			item_categories.chaos_troll
		}
	},
	gutter_runner = {
		enemy_hit_sound = "dagger",
		items = {}
	},
	chaos_sorcerer = {
		items = {
			item_categories.chaos_sorcerer_stick
		}
	},
	chaos_sorcerer_vortex = {
		items = {
			item_categories.chaos_sorcerer_book
		}
	},
	chaos_exalted_sorcerer = {
		anim_state_event = "to_boss",
		items = {
			item_categories.chaos_sorcerer_stick
		}
	},
	chaos_exalted_sorcerer_drachenfels = {
		anim_state_event = "to_boss",
		items = {
			item_categories.chaos_sorcerer_scythe_01
		}
	},
	chaos_mutator_sorcerer = {
		items = {}
	},
	mace = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.mace
		}
	},
	chaos_sorcerer_vortex = {
		items = {
			item_categories.chaos_sorcerer_book
		}
	},
	beastmen_ungor_1h = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.one_hand_weapon_right,
			item_categories.beastmen_ungor_outfit_head,
			item_categories.beastmen_ungor_outfit_r_arm,
			item_categories.beastmen_ungor_outfit_l_arm,
			item_categories.beastmen_ungor_outfit_neck
		}
	},
	beastmen_ungor_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		items = {
			item_categories.beastmen_ungor_spear,
			item_categories.beastmen_ungor_outfit_head,
			item_categories.beastmen_ungor_outfit_r_arm,
			item_categories.beastmen_ungor_outfit_l_arm,
			item_categories.beastmen_ungor_outfit_neck
		}
	},
	opt_beastmen_ungor_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		items = {
			item_categories.beastmen_ungor_spear,
			item_categories.beastmen_ungor_outfit_head,
			item_categories.beastmen_ungor_outfit_baked
		}
	},
	beastmen_ungor_bow = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_bow",
		items = {
			item_categories.bow,
			item_categories.beastmen_ungor_outfit_head,
			item_categories.beastmen_ungor_outfit_r_arm,
			item_categories.beastmen_ungor_outfit_l_arm,
			item_categories.beastmen_ungor_outfit_neck
		}
	},
	opt_beastmen_ungor_bow = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_bow",
		items = {
			item_categories.bow,
			item_categories.beastmen_ungor_outfit_head,
			item_categories.beastmen_ungor_outfit_baked
		}
	},
	beastmen_ungor_just_add_spear = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		items = {
			item_categories.beastmen_ungor_spear
		}
	},
	beastmen_ungor_archer_bow_and_spear = {
		enemy_hit_sound = "spear",
		multiple_configurations = {
			"beastmen_ungor_bow",
			"beastmen_ungor_just_add_spear"
		}
	},
	opt_beastmen_ungor_archer_bow_and_spear = {
		enemy_hit_sound = "spear",
		multiple_configurations = {
			"opt_beastmen_ungor_bow",
			"beastmen_ungor_just_add_spear"
		}
	},
	beastmen_gor_1h = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.beastmen_1h,
			item_categories.beastmen_gor_outfit_head,
			item_categories.beastmen_gor_outfit_neck,
			item_categories.beastmen_gor_belt,
			item_categories.beastmen_gor_outfit_r_arm,
			item_categories.beastmen_gor_outfit_l_arm
		}
	},
	opt_beastmen_gor_1h = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_sword",
		items = {
			item_categories.beastmen_1h,
			item_categories.beastmen_gor_outfit_head,
			item_categories.beastmen_gor_outfit_baked
		}
	},
	beastmen_bestigor_2h_axe = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		equip_anim = "equip_halberd",
		items = {
			item_categories.beastmen_2h,
			item_categories.beastmen_bestigor_outfit_head,
			item_categories.beastmen_bestigor_outfit_r_arm_upper,
			item_categories.beastmen_bestigor_outfit_l_arm_upper
		}
	},
	beastmen_standard_bearer_2h_axe = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_halberd",
		equip_anim = "equip_halberd",
		items = {
			item_categories.beastmen_2h_axe_standard,
			item_categories.beastmen_standard_bearer_outfit_head
		}
	},
	beastmen_2h_axe_standard = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_standard_bearer",
		equip_anim = "equip_halberd",
		items = {
			item_categories.beastmen_standard
		}
	},
	beastmen_standard_bearer_dual_setup = {
		multiple_configurations = {
			"beastmen_2h_axe_standard",
			"beastmen_standard_bearer_2h_axe"
		}
	},
	warrior_axe_blk_shadow_lieutenant = {
		enemy_hit_sound = "spear",
		anim_state_event = "to_spear",
		items = {
			item_categories.blk_shadow_lieutenant_axe,
			item_categories.blk_shadow_lieutenant_warrior_helmet
		}
	},
	undead_ethereal_skeleton_with_shield = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_shield",
		items = {
			item_categories.undead_ethereal_skeleton_sword,
			item_categories.undead_ethereal_skeleton_shield
		}
	},
	undead_ethereal_skeleton_2h = {
		enemy_hit_sound = "sword",
		anim_state_event = "to_2h_hammer",
		items = {
			item_categories.undead_ethereal_skeleton_2h_hammer
		}
	},
	critter_nurgling = {
		items = {
			item_categories.critter_nurgling_horns
		}
	}
}
AIInventoryTemplates = {}
local melee_configurations = {
	"sword",
	"spear"
}

AIInventoryTemplates.random_melee = function ()
	local index = math.random(1, #melee_configurations)
	local config_name = melee_configurations[index]

	return config_name
end

AIInventoryTemplates.default = function ()
	return AIInventoryTemplates.random_melee()
end

for category_name, category in pairs(item_categories) do
	category.count = #category
	category.name = category_name
end

for config_name, config in pairs(InventoryConfigurations) do
	config.items_n = config.items and #config.items

	assert(AIInventoryTemplates[config_name] == nil, "Can't override configuration based templates")

	AIInventoryTemplates[config_name] = function ()
		return config_name
	end

	local multiple_configurations = config.multiple_configurations

	if multiple_configurations then
		config.config_lookup = {}

		for i = 1, #multiple_configurations do
			local config_name = multiple_configurations[i]
			config.config_lookup[config_name] = i
		end
	end
end
