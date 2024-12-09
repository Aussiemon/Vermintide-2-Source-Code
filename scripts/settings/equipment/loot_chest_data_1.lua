-- chunkname: @scripts/settings/equipment/loot_chest_data_1.lua

LootChestData = LootChestData or {}
LootChestData.scores = {
	default = {
		game_won = 10,
		grimoire = 15,
		loot_dice = 5,
		max_random_score = 30,
		quickplay = 10,
		tome = 10,
	},
}
LootChestData.score_per_chest = 20
LootChestData.score_thresholds = {
	0,
	20,
	40,
	60,
	80,
	100,
}
LootChestData.score_thresholds_per_chest = {
	0,
}

for i = 2, #LootChestData.score_thresholds do
	LootChestData.score_thresholds_per_chest[i] = LootChestData.score_thresholds[i] - LootChestData.score_thresholds[i - 1]
end

LootChestData.max_score = LootChestData.score_thresholds[#LootChestData.score_thresholds]
LootChestData.power_level_thresholds = {
	category_1 = 1,
	category_10 = 10,
	category_11 = 11,
	category_12 = 12,
	category_13 = 13,
	category_14 = 14,
	category_15 = 15,
	category_16 = 16,
	category_17 = 17,
	category_18 = 18,
	category_19 = 19,
	category_2 = 2,
	category_20 = 20,
	category_21 = 21,
	category_22 = 22,
	category_23 = 23,
	category_24 = 24,
	category_3 = 3,
	category_4 = 4,
	category_5 = 5,
	category_6 = 6,
	category_7 = 7,
	category_8 = 8,
	category_9 = 9,
}
LootChestData.LEVEL_USED_FOR_POOL_LEVELS = 30

local power_level_scratch = {
	0,
	0,
}

LootChestData.calculate_power_level = function (level, pivot_data)
	power_level_scratch[1], power_level_scratch[2] = pivot_data.low, pivot_data.hi

	local raw_level = level

	level = math.min(level, LootChestData.LEVEL_USED_FOR_POOL_LEVELS)

	local loot_interface = Managers.backend:get_interface("loot")
	local power_level_settings = loot_interface:get_power_level_settings()
	local easing_function = math[power_level_settings.easing_function]
	local inverse_easing_function = math[power_level_settings.inverse_easing_function]

	for i = 1, 2 do
		local sub_data = power_level_scratch[i]
		local min, max, pivot_power, pivot_level, easing_power = sub_data.min, sub_data.max, sub_data.pivot_power, sub_data.pivot_level, sub_data.easing_power
		local power_pivot_t = math.max(math.inv_lerp(min, max, pivot_power), 0)
		local eased_max = max

		if power_pivot_t > 1 then
			eased_max = pivot_power
			power_pivot_t = 1 / power_pivot_t
		end

		local pivot_mult = inverse_easing_function(power_pivot_t)
		local level_pivot_t = math.inv_lerp(1, pivot_level, level)
		local level_and_power_pivot_t = math.max(level_pivot_t * pivot_mult, 0)
		local eased = easing_function(level_and_power_pivot_t)

		eased = math.lerp(0, eased_max - min, eased) + min

		if level_pivot_t > 1 then
			if max < pivot_power then
				eased = max
			else
				eased = math.max(eased, pivot_power)
			end
		else
			local un_eased = math.lerp(0, math.min(max, pivot_power) - min, level_pivot_t) + min

			eased = eased + (un_eased - eased) * (1 - easing_power)
		end

		eased = math.clamp(eased, min, max)

		local overflow_pl = sub_data.raise_by_overflow_level

		if overflow_pl then
			eased = eased + math.max(0, overflow_pl * (raw_level - LootChestData.LEVEL_USED_FOR_POOL_LEVELS))
		end

		power_level_scratch[i] = eased
	end

	power_level_scratch[1] = math.min(power_level_scratch[1], power_level_scratch[2])

	local absoluteMax = pivot_data.hi.max

	return power_level_scratch[1], power_level_scratch[2], absoluteMax
end

LootChestData.chests_by_category = {
	easy = {
		package_name = "resource_packages/chests_d1",
		backend_keys = {
			"loot_chest_01_01",
			"loot_chest_01_02",
			"loot_chest_01_03",
			"loot_chest_01_04",
			"loot_chest_01_05",
			"loot_chest_01_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d1_t1",
			"resource_packages/individual_chests/loot_chest_d1_t2",
			"resource_packages/individual_chests/loot_chest_d1_t3",
			"resource_packages/individual_chests/loot_chest_d1_t4",
			"resource_packages/individual_chests/loot_chest_d1_t5",
			"resource_packages/individual_chests/loot_chest_d1_t6",
		},
		display_names = {
			"display_name_loot_chest_normal_01",
			"display_name_loot_chest_normal_02",
			"display_name_loot_chest_normal_03",
			"display_name_loot_chest_normal_04",
			"display_name_loot_chest_normal_05",
			"display_name_loot_chest_normal_06",
		},
	},
	normal = {
		package_name = "resource_packages/chests_d1",
		backend_keys = {
			"loot_chest_01_01",
			"loot_chest_01_02",
			"loot_chest_01_03",
			"loot_chest_01_04",
			"loot_chest_01_05",
			"loot_chest_01_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d1_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d1_t1",
			"resource_packages/individual_chests/loot_chest_d1_t2",
			"resource_packages/individual_chests/loot_chest_d1_t3",
			"resource_packages/individual_chests/loot_chest_d1_t4",
			"resource_packages/individual_chests/loot_chest_d1_t5",
			"resource_packages/individual_chests/loot_chest_d1_t6",
		},
		display_names = {
			"display_name_loot_chest_normal_01",
			"display_name_loot_chest_normal_02",
			"display_name_loot_chest_normal_03",
			"display_name_loot_chest_normal_04",
			"display_name_loot_chest_normal_05",
			"display_name_loot_chest_normal_06",
		},
	},
	hard = {
		package_name = "resource_packages/chests_d2",
		backend_keys = {
			"loot_chest_02_01",
			"loot_chest_02_02",
			"loot_chest_02_03",
			"loot_chest_02_04",
			"loot_chest_02_05",
			"loot_chest_02_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d2_t1",
			"resource_packages/individual_chests/loot_chest_d2_t2",
			"resource_packages/individual_chests/loot_chest_d2_t3",
			"resource_packages/individual_chests/loot_chest_d2_t4",
			"resource_packages/individual_chests/loot_chest_d2_t5",
			"resource_packages/individual_chests/loot_chest_d2_t6",
		},
		display_names = {
			"display_name_loot_chest_hard_01",
			"display_name_loot_chest_hard_02",
			"display_name_loot_chest_hard_03",
			"display_name_loot_chest_hard_04",
			"display_name_loot_chest_hard_05",
			"display_name_loot_chest_hard_06",
		},
	},
	harder = {
		package_name = "resource_packages/chests_d3",
		backend_keys = {
			"loot_chest_03_01",
			"loot_chest_03_02",
			"loot_chest_03_03",
			"loot_chest_03_04",
			"loot_chest_03_05",
			"loot_chest_03_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d3_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d3_t1",
			"resource_packages/individual_chests/loot_chest_d3_t2",
			"resource_packages/individual_chests/loot_chest_d3_t3",
			"resource_packages/individual_chests/loot_chest_d3_t4",
			"resource_packages/individual_chests/loot_chest_d3_t5",
			"resource_packages/individual_chests/loot_chest_d3_t6",
		},
		display_names = {
			"display_name_loot_chest_nightmare_01",
			"display_name_loot_chest_nightmare_02",
			"display_name_loot_chest_nightmare_03",
			"display_name_loot_chest_nightmare_04",
			"display_name_loot_chest_nightmare_05",
			"display_name_loot_chest_nightmare_06",
		},
	},
	hardest = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6",
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06",
		},
	},
	cataclysm = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6",
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06",
		},
	},
	cataclysm_2 = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6",
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06",
		},
	},
	cataclysm_3 = {
		package_name = "resource_packages/chests_d4",
		backend_keys = {
			"loot_chest_04_01",
			"loot_chest_04_02",
			"loot_chest_04_03",
			"loot_chest_04_04",
			"loot_chest_04_05",
			"loot_chest_04_06",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d4_t6",
		},
		individual_chest_package_names = {
			"resource_packages/individual_chests/loot_chest_d4_t1",
			"resource_packages/individual_chests/loot_chest_d4_t2",
			"resource_packages/individual_chests/loot_chest_d4_t3",
			"resource_packages/individual_chests/loot_chest_d4_t4",
			"resource_packages/individual_chests/loot_chest_d4_t5",
			"resource_packages/individual_chests/loot_chest_d4_t6",
		},
		display_names = {
			"display_name_loot_chest_cataclysm_01",
			"display_name_loot_chest_cataclysm_02",
			"display_name_loot_chest_cataclysm_03",
			"display_name_loot_chest_cataclysm_04",
			"display_name_loot_chest_cataclysm_05",
			"display_name_loot_chest_cataclysm_06",
		},
	},
	deed = {
		package_name = "resource_packages/chests_d2",
		backend_keys = {
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
			"loot_chest_deed",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t1",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t2",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t3",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t4",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t5",
			"units/gameplay/loot_chests/gameplay_loot_chest_d2_t6",
		},
	},
	level_up = {
		package_name = "resource_packages/chests_level_up",
		backend_keys = {
			"level_chest",
		},
		individual_chest_package_names = {
			"resource_packages/chests_level_up",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_level_up",
		},
	},
	level_up_lesser = {
		package_name = "resource_packages/chests_level_up",
		backend_keys = {
			"level_chest",
		},
		individual_chest_package_names = {
			"resource_packages/chests_level_up",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_level_up",
		},
	},
	level_up_2 = {
		package_name = "resource_packages/chests_level_up",
		backend_keys = {
			"level_chest",
		},
		individual_chest_package_names = {
			"resource_packages/chest_cc_t1",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_cc_t1",
		},
	},
	bogenhafen = {
		package_name = "resource_packages/chests_bogenhafen",
		backend_keys = {
			"bogenhafen_chest",
		},
		individual_chest_package_names = {
			"resource_packages/chests_bogenhafen",
		},
		chest_unit_names = {
			"units/gameplay/loot_chests/gameplay_loot_chest_bghf_01",
		},
	},
}
LootChestData.rarity_weights_tables = {
	tier_1 = {
		{
			name = "plentiful",
			weight = 15,
		},
		{
			name = "common",
			weight = 5,
		},
		{
			name = "rare",
			weight = 0.5,
		},
	},
	tier_2 = {
		{
			name = "plentiful",
			weight = 8,
		},
		{
			name = "common",
			weight = 4,
		},
		{
			name = "rare",
			weight = 1,
		},
		{
			name = "exotic",
			weight = 0.25,
		},
	},
	tier_3 = {
		{
			name = "plentiful",
			weight = 4,
		},
		{
			name = "common",
			weight = 7,
		},
		{
			name = "rare",
			weight = 1,
		},
		{
			name = "exotic",
			weight = 0.25,
		},
	},
	tier_4 = {
		{
			name = "plentiful",
			weight = 3,
		},
		{
			name = "common",
			weight = 7,
		},
		{
			name = "rare",
			weight = 4,
		},
		{
			name = "exotic",
			weight = 0.5,
		},
	},
	tier_5 = {
		{
			name = "common",
			weight = 1,
		},
		{
			name = "rare",
			weight = 4,
		},
		{
			name = "exotic",
			weight = 1,
		},
	},
	tier_6 = {
		{
			name = "rare",
			weight = 3,
		},
		{
			name = "exotic",
			weight = 1,
		},
	},
	tier_5_nightmare = {
		{
			name = "common",
			weight = 1,
		},
		{
			name = "rare",
			weight = 3,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.1,
		},
	},
	tier_6_nightmare = {
		{
			name = "rare",
			weight = 3,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.1,
		},
	},
	tier_1_cata = {
		{
			name = "rare",
			weight = 6,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.5,
		},
	},
	tier_2_cata = {
		{
			name = "rare",
			weight = 5,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.5,
		},
	},
	tier_3_cata = {
		{
			name = "rare",
			weight = 4,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.5,
		},
	},
	tier_4_cata = {
		{
			name = "rare",
			weight = 3,
		},
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 0.5,
		},
	},
	tier_5_cata = {
		{
			name = "exotic",
			weight = 3,
		},
		{
			name = "unique",
			weight = 1,
		},
	},
	tier_6_cata = {
		{
			name = "exotic",
			weight = 1,
		},
		{
			name = "unique",
			weight = 1,
		},
	},
}
LootChestData.items = {
	dwarf_ranger = {
		plentiful = {
			melee = {
				{
					key = "dr_1h_axe",
					weight = 1,
				},
				{
					key = "dr_dual_wield_axes",
					weight = 1,
				},
				{
					key = "dr_2h_axe",
					weight = 1,
				},
				{
					key = "dr_2h_hammer",
					weight = 1,
				},
				{
					key = "dr_1h_hammer",
					weight = 1,
				},
				{
					key = "dr_shield_axe",
					weight = 1,
				},
				{
					key = "dr_shield_hammer",
					weight = 1,
				},
				{
					key = "dr_2h_pick",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "dr_crossbow",
					weight = 1,
				},
				{
					key = "dr_rakegun",
					weight = 1,
				},
				{
					key = "dr_handgun",
					weight = 1,
				},
				{
					key = "dr_drake_pistol",
					weight = 1,
				},
				{
					key = "dr_drakegun",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		common = {
			melee = {
				{
					key = "dr_1h_axe",
					weight = 1,
				},
				{
					key = "dr_dual_wield_axes",
					weight = 1,
				},
				{
					key = "dr_2h_axe",
					weight = 1,
				},
				{
					key = "dr_2h_hammer",
					weight = 1,
				},
				{
					key = "dr_1h_hammer",
					weight = 1,
				},
				{
					key = "dr_shield_axe",
					weight = 1,
				},
				{
					key = "dr_shield_hammer",
					weight = 1,
				},
				{
					key = "dr_2h_pick",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "dr_crossbow",
					weight = 1,
				},
				{
					key = "dr_rakegun",
					weight = 1,
				},
				{
					key = "dr_handgun",
					weight = 1,
				},
				{
					key = "dr_drake_pistol",
					weight = 1,
				},
				{
					key = "dr_drakegun",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		rare = {
			melee = {
				{
					key = "dr_1h_axe",
					weight = 1,
				},
				{
					key = "dr_dual_wield_axes",
					weight = 1,
				},
				{
					key = "dr_2h_axe",
					weight = 1,
				},
				{
					key = "dr_2h_hammer",
					weight = 1,
				},
				{
					key = "dr_1h_hammer",
					weight = 1,
				},
				{
					key = "dr_shield_axe",
					weight = 1,
				},
				{
					key = "dr_shield_hammer",
					weight = 1,
				},
				{
					key = "dr_2h_pick",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "dr_crossbow",
					weight = 1,
				},
				{
					key = "dr_rakegun",
					weight = 1,
				},
				{
					key = "dr_handgun",
					weight = 1,
				},
				{
					key = "dr_drake_pistol",
					weight = 1,
				},
				{
					key = "dr_drakegun",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		exotic = {
			melee = {
				{
					key = "dr_1h_axe",
					weight = 1,
				},
				{
					key = "dr_dual_wield_axes",
					weight = 1,
				},
				{
					key = "dr_2h_axe",
					weight = 1,
				},
				{
					key = "dr_2h_hammer",
					weight = 1,
				},
				{
					key = "dr_1h_hammer",
					weight = 1,
				},
				{
					key = "dr_shield_axe",
					weight = 1,
				},
				{
					key = "dr_shield_hammer",
					weight = 1,
				},
				{
					key = "dr_2h_pick",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "dr_crossbow",
					weight = 1,
				},
				{
					key = "dr_rakegun",
					weight = 1,
				},
				{
					key = "dr_handgun",
					weight = 1,
				},
				{
					key = "dr_drake_pistol",
					weight = 1,
				},
				{
					key = "dr_drakegun",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		unique = {
			melee = {
				{
					key = "dr_1h_axe",
					weight = 1,
				},
				{
					key = "dr_dual_wield_axes",
					weight = 1,
				},
				{
					key = "dr_2h_axe",
					weight = 1,
				},
				{
					key = "dr_2h_hammer",
					weight = 1,
				},
				{
					key = "dr_1h_hammer",
					weight = 1,
				},
				{
					key = "dr_shield_axe",
					weight = 1,
				},
				{
					key = "dr_shield_hammer",
					weight = 1,
				},
				{
					key = "dr_2h_pick",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "dr_crossbow",
					weight = 1,
				},
				{
					key = "dr_rakegun",
					weight = 1,
				},
				{
					key = "dr_handgun",
					weight = 1,
				},
				{
					key = "dr_drake_pistol",
					weight = 1,
				},
				{
					key = "dr_drakegun",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
	},
	witch_hunter = {
		plentiful = {
			melee = {
				{
					key = "wh_1h_axe",
					weight = 1,
				},
				{
					key = "wh_2h_sword",
					weight = 1,
				},
				{
					key = "wh_fencing_sword",
					weight = 1,
				},
				{
					key = "wh_1h_falchion",
					weight = 1,
				},
				{
					key = "es_1h_flail",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "wh_brace_of_pistols",
					weight = 1,
				},
				{
					key = "wh_repeating_pistols",
					weight = 1,
				},
				{
					key = "wh_crossbow",
					weight = 1,
				},
				{
					key = "wh_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		common = {
			melee = {
				{
					key = "wh_1h_axe",
					weight = 1,
				},
				{
					key = "wh_2h_sword",
					weight = 1,
				},
				{
					key = "wh_fencing_sword",
					weight = 1,
				},
				{
					key = "wh_1h_falchion",
					weight = 1,
				},
				{
					key = "es_1h_flail",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "wh_brace_of_pistols",
					weight = 1,
				},
				{
					key = "wh_repeating_pistols",
					weight = 1,
				},
				{
					key = "wh_crossbow",
					weight = 1,
				},
				{
					key = "wh_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		rare = {
			melee = {
				{
					key = "wh_1h_axe",
					weight = 1,
				},
				{
					key = "wh_2h_sword",
					weight = 1,
				},
				{
					key = "wh_fencing_sword",
					weight = 1,
				},
				{
					key = "wh_1h_falchion",
					weight = 1,
				},
				{
					key = "es_1h_flail",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "wh_brace_of_pistols",
					weight = 1,
				},
				{
					key = "wh_repeating_pistols",
					weight = 1,
				},
				{
					key = "wh_crossbow",
					weight = 1,
				},
				{
					key = "wh_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		exotic = {
			melee = {
				{
					key = "wh_1h_axe",
					weight = 1,
				},
				{
					key = "wh_2h_sword",
					weight = 1,
				},
				{
					key = "wh_fencing_sword",
					weight = 1,
				},
				{
					key = "wh_1h_falchion",
					weight = 1,
				},
				{
					key = "es_1h_flail",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "wh_brace_of_pistols",
					weight = 1,
				},
				{
					key = "wh_repeating_pistols",
					weight = 1,
				},
				{
					key = "wh_crossbow",
					weight = 1,
				},
				{
					key = "wh_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		unique = {
			melee = {
				{
					key = "wh_1h_axe",
					weight = 1,
				},
				{
					key = "wh_2h_sword",
					weight = 1,
				},
				{
					key = "wh_fencing_sword",
					weight = 1,
				},
				{
					key = "wh_1h_falchion",
					weight = 1,
				},
				{
					key = "es_1h_flail",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "wh_brace_of_pistols",
					weight = 1,
				},
				{
					key = "wh_repeating_pistols",
					weight = 1,
				},
				{
					key = "wh_crossbow",
					weight = 1,
				},
				{
					key = "wh_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
	},
	empire_soldier = {
		plentiful = {
			melee = {
				{
					key = "es_1h_sword",
					weight = 1,
				},
				{
					key = "es_1h_mace",
					weight = 1,
				},
				{
					key = "es_2h_sword",
					weight = 1,
				},
				{
					key = "es_2h_hammer",
					weight = 1,
				},
				{
					key = "es_sword_shield",
					weight = 1,
				},
				{
					key = "es_mace_shield",
					weight = 1,
				},
				{
					key = "es_halberd",
					weight = 1,
				},
				{
					key = "es_2h_sword_executioner",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "es_blunderbuss",
					weight = 1,
				},
				{
					key = "es_handgun",
					weight = 1,
				},
				{
					key = "es_repeating_handgun",
					weight = 1,
				},
				{
					key = "es_longbow",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		common = {
			melee = {
				{
					key = "es_1h_sword",
					weight = 1,
				},
				{
					key = "es_1h_mace",
					weight = 1,
				},
				{
					key = "es_2h_sword",
					weight = 1,
				},
				{
					key = "es_2h_hammer",
					weight = 1,
				},
				{
					key = "es_sword_shield",
					weight = 1,
				},
				{
					key = "es_mace_shield",
					weight = 1,
				},
				{
					key = "es_halberd",
					weight = 1,
				},
				{
					key = "es_2h_sword_executioner",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "es_blunderbuss",
					weight = 1,
				},
				{
					key = "es_handgun",
					weight = 1,
				},
				{
					key = "es_repeating_handgun",
					weight = 1,
				},
				{
					key = "es_longbow",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		rare = {
			melee = {
				{
					key = "es_1h_sword",
					weight = 1,
				},
				{
					key = "es_1h_mace",
					weight = 1,
				},
				{
					key = "es_2h_sword",
					weight = 1,
				},
				{
					key = "es_2h_hammer",
					weight = 1,
				},
				{
					key = "es_sword_shield",
					weight = 1,
				},
				{
					key = "es_mace_shield",
					weight = 1,
				},
				{
					key = "es_halberd",
					weight = 1,
				},
				{
					key = "es_2h_sword_executioner",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "es_blunderbuss",
					weight = 1,
				},
				{
					key = "es_handgun",
					weight = 1,
				},
				{
					key = "es_repeating_handgun",
					weight = 1,
				},
				{
					key = "es_longbow",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		exotic = {
			melee = {
				{
					key = "es_1h_sword",
					weight = 1,
				},
				{
					key = "es_1h_mace",
					weight = 1,
				},
				{
					key = "es_2h_sword",
					weight = 1,
				},
				{
					key = "es_2h_hammer",
					weight = 1,
				},
				{
					key = "es_sword_shield",
					weight = 1,
				},
				{
					key = "es_mace_shield",
					weight = 1,
				},
				{
					key = "es_halberd",
					weight = 1,
				},
				{
					key = "es_2h_sword_executioner",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "es_blunderbuss",
					weight = 1,
				},
				{
					key = "es_handgun",
					weight = 1,
				},
				{
					key = "es_repeating_handgun",
					weight = 1,
				},
				{
					key = "es_longbow",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		unique = {
			melee = {
				{
					key = "es_1h_sword",
					weight = 1,
				},
				{
					key = "es_1h_mace",
					weight = 1,
				},
				{
					key = "es_2h_sword",
					weight = 1,
				},
				{
					key = "es_2h_hammer",
					weight = 1,
				},
				{
					key = "es_sword_shield",
					weight = 1,
				},
				{
					key = "es_mace_shield",
					weight = 1,
				},
				{
					key = "es_halberd",
					weight = 1,
				},
				{
					key = "es_2h_sword_executioner",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "es_blunderbuss",
					weight = 1,
				},
				{
					key = "es_handgun",
					weight = 1,
				},
				{
					key = "es_repeating_handgun",
					weight = 1,
				},
				{
					key = "es_longbow",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
	},
	wood_elf = {
		plentiful = {
			melee = {
				{
					key = "we_dual_wield_daggers",
					weight = 1,
				},
				{
					key = "we_dual_wield_swords",
					weight = 1,
				},
				{
					key = "we_1h_sword",
					weight = 1,
				},
				{
					key = "we_dual_wield_sword_dagger",
					weight = 1,
				},
				{
					key = "we_2h_axe",
					weight = 1,
				},
				{
					key = "we_2h_sword",
					weight = 1,
				},
				{
					key = "we_spear",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "we_shortbow",
					weight = 1,
				},
				{
					key = "we_shortbow_hagbane",
					weight = 1,
				},
				{
					key = "we_longbow",
					weight = 1,
				},
				{
					key = "we_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		common = {
			melee = {
				{
					key = "we_dual_wield_daggers",
					weight = 1,
				},
				{
					key = "we_dual_wield_swords",
					weight = 1,
				},
				{
					key = "we_1h_sword",
					weight = 1,
				},
				{
					key = "we_dual_wield_sword_dagger",
					weight = 1,
				},
				{
					key = "we_2h_axe",
					weight = 1,
				},
				{
					key = "we_2h_sword",
					weight = 1,
				},
				{
					key = "we_spear",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "we_shortbow",
					weight = 1,
				},
				{
					key = "we_shortbow_hagbane",
					weight = 1,
				},
				{
					key = "we_longbow",
					weight = 1,
				},
				{
					key = "we_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		rare = {
			melee = {
				{
					key = "we_dual_wield_daggers",
					weight = 1,
				},
				{
					key = "we_dual_wield_swords",
					weight = 1,
				},
				{
					key = "we_1h_sword",
					weight = 1,
				},
				{
					key = "we_dual_wield_sword_dagger",
					weight = 1,
				},
				{
					key = "we_2h_axe",
					weight = 1,
				},
				{
					key = "we_2h_sword",
					weight = 1,
				},
				{
					key = "we_spear",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "we_shortbow",
					weight = 1,
				},
				{
					key = "we_shortbow_hagbane",
					weight = 1,
				},
				{
					key = "we_longbow",
					weight = 1,
				},
				{
					key = "we_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		exotic = {
			melee = {
				{
					key = "we_dual_wield_daggers",
					weight = 1,
				},
				{
					key = "we_dual_wield_swords",
					weight = 1,
				},
				{
					key = "we_1h_sword",
					weight = 1,
				},
				{
					key = "we_dual_wield_sword_dagger",
					weight = 1,
				},
				{
					key = "we_2h_axe",
					weight = 1,
				},
				{
					key = "we_2h_sword",
					weight = 1,
				},
				{
					key = "we_spear",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "we_shortbow",
					weight = 1,
				},
				{
					key = "we_shortbow_hagbane",
					weight = 1,
				},
				{
					key = "we_longbow",
					weight = 1,
				},
				{
					key = "we_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		unique = {
			melee = {
				{
					key = "we_dual_wield_daggers",
					weight = 1,
				},
				{
					key = "we_dual_wield_swords",
					weight = 1,
				},
				{
					key = "we_1h_sword",
					weight = 1,
				},
				{
					key = "we_dual_wield_sword_dagger",
					weight = 1,
				},
				{
					key = "we_2h_axe",
					weight = 1,
				},
				{
					key = "we_2h_sword",
					weight = 1,
				},
				{
					key = "we_spear",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "we_shortbow",
					weight = 1,
				},
				{
					key = "we_shortbow_hagbane",
					weight = 1,
				},
				{
					key = "we_longbow",
					weight = 1,
				},
				{
					key = "we_crossbow_repeater",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
	},
	bright_wizard = {
		plentiful = {
			melee = {
				{
					key = "bw_1h_mace",
					weight = 1,
				},
				{
					key = "bw_flame_sword",
					weight = 1,
				},
				{
					key = "bw_sword",
					weight = 1,
				},
				{
					key = "bw_dagger",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "bw_skullstaff_fireball",
					weight = 1,
				},
				{
					key = "bw_skullstaff_beam",
					weight = 1,
				},
				{
					key = "bw_skullstaff_geiser",
					weight = 1,
				},
				{
					key = "bw_skullstaff_spear",
					weight = 1,
				},
				{
					key = "bw_skullstaff_flamethrower",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		common = {
			melee = {
				{
					key = "bw_1h_mace",
					weight = 1,
				},
				{
					key = "bw_flame_sword",
					weight = 1,
				},
				{
					key = "bw_sword",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "bw_skullstaff_fireball",
					weight = 1,
				},
				{
					key = "bw_skullstaff_beam",
					weight = 1,
				},
				{
					key = "bw_skullstaff_geiser",
					weight = 1,
				},
				{
					key = "bw_skullstaff_spear",
					weight = 1,
				},
				{
					key = "bw_skullstaff_flamethrower",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		rare = {
			melee = {
				{
					key = "bw_1h_mace",
					weight = 1,
				},
				{
					key = "bw_flame_sword",
					weight = 1,
				},
				{
					key = "bw_sword",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "bw_skullstaff_fireball",
					weight = 1,
				},
				{
					key = "bw_skullstaff_beam",
					weight = 1,
				},
				{
					key = "bw_skullstaff_geiser",
					weight = 1,
				},
				{
					key = "bw_skullstaff_spear",
					weight = 1,
				},
				{
					key = "bw_skullstaff_flamethrower",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		exotic = {
			melee = {
				{
					key = "bw_1h_mace",
					weight = 1,
				},
				{
					key = "bw_flame_sword",
					weight = 1,
				},
				{
					key = "bw_sword",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "bw_skullstaff_fireball",
					weight = 1,
				},
				{
					key = "bw_skullstaff_beam",
					weight = 1,
				},
				{
					key = "bw_skullstaff_geiser",
					weight = 1,
				},
				{
					key = "bw_skullstaff_spear",
					weight = 1,
				},
				{
					key = "bw_skullstaff_flamethrower",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
		unique = {
			melee = {
				{
					key = "bw_1h_mace",
					weight = 1,
				},
				{
					key = "bw_flame_sword",
					weight = 1,
				},
				{
					key = "bw_sword",
					weight = 1,
				},
			},
			ranged = {
				{
					key = "bw_skullstaff_fireball",
					weight = 1,
				},
				{
					key = "bw_skullstaff_beam",
					weight = 1,
				},
				{
					key = "bw_skullstaff_geiser",
					weight = 1,
				},
				{
					key = "bw_skullstaff_spear",
					weight = 1,
				},
				{
					key = "bw_skullstaff_flamethrower",
					weight = 1,
				},
			},
			ring = {
				{
					key = "ring",
					weight = 1,
				},
				{
					key = "ring_02",
					weight = 1,
				},
				{
					key = "ring_03",
					weight = 1,
				},
				{
					key = "ring_04",
					weight = 1,
				},
				{
					key = "ring_05",
					weight = 1,
				},
				{
					key = "ring_06",
					weight = 1,
				},
				{
					key = "ring_07",
					weight = 1,
				},
				{
					key = "ring_08",
					weight = 1,
				},
				{
					key = "ring_09",
					weight = 1,
				},
				{
					key = "ring_10",
					weight = 1,
				},
			},
			necklace = {
				{
					key = "necklace",
					weight = 1,
				},
				{
					key = "necklace_02",
					weight = 1,
				},
				{
					key = "necklace_03",
					weight = 1,
				},
				{
					key = "necklace_04",
					weight = 1,
				},
				{
					key = "necklace_05",
					weight = 1,
				},
				{
					key = "necklace_06",
					weight = 1,
				},
				{
					key = "necklace_07",
					weight = 1,
				},
				{
					key = "necklace_08",
					weight = 1,
				},
				{
					key = "necklace_09",
					weight = 1,
				},
				{
					key = "necklace_10",
					weight = 1,
				},
			},
			trinket = {
				{
					key = "trinket",
					weight = 1,
				},
				{
					key = "trinket_02",
					weight = 1,
				},
				{
					key = "trinket_03",
					weight = 1,
				},
				{
					key = "trinket_04",
					weight = 1,
				},
				{
					key = "trinket_05",
					weight = 1,
				},
				{
					key = "trinket_06",
					weight = 1,
				},
				{
					key = "trinket_07",
					weight = 1,
				},
				{
					key = "trinket_08",
					weight = 1,
				},
				{
					key = "trinket_09",
					weight = 1,
				},
				{
					key = "trinket_10",
					weight = 1,
				},
			},
			crafting_material = {
				{
					key = "crafting_material_weapon",
					weight = 1,
				},
				{
					key = "crafting_material_jewellery",
					weight = 1,
				},
			},
			deed = {
				{
					key = "deed",
					weight = 1,
				},
				{
					key = "deed_0002",
					weight = 1,
				},
			},
		},
	},
}
LootChestData.items_new = {
	dwarf_ranger = {
		melee = {
			{
				key = "dr_1h_axe",
				weight = 1,
			},
			{
				key = "dr_dual_wield_axes",
				weight = 1,
			},
			{
				key = "dr_2h_axe",
				weight = 1,
			},
			{
				key = "dr_2h_hammer",
				weight = 1,
			},
			{
				key = "dr_1h_hammer",
				weight = 1,
			},
			{
				key = "dr_shield_axe",
				weight = 1,
			},
			{
				key = "dr_shield_hammer",
				weight = 1,
			},
			{
				key = "dr_2h_pick",
				weight = 1,
			},
		},
		ranged = {
			{
				key = "dr_crossbow",
				weight = 1,
			},
			{
				key = "dr_rakegun",
				weight = 1,
			},
			{
				key = "dr_handgun",
				weight = 1,
			},
			{
				key = "dr_drake_pistol",
				weight = 1,
			},
			{
				key = "dr_drakegun",
				weight = 1,
			},
		},
		ring = {
			{
				key = "ring",
				weight = 1,
			},
			{
				key = "ring_02",
				weight = 1,
			},
			{
				key = "ring_03",
				weight = 1,
			},
			{
				key = "ring_04",
				weight = 1,
			},
			{
				key = "ring_05",
				weight = 1,
			},
			{
				key = "ring_06",
				weight = 1,
			},
			{
				key = "ring_07",
				weight = 1,
			},
			{
				key = "ring_08",
				weight = 1,
			},
			{
				key = "ring_09",
				weight = 1,
			},
			{
				key = "ring_10",
				weight = 1,
			},
		},
		necklace = {
			{
				key = "necklace",
				weight = 1,
			},
			{
				key = "necklace_02",
				weight = 1,
			},
			{
				key = "necklace_03",
				weight = 1,
			},
			{
				key = "necklace_04",
				weight = 1,
			},
			{
				key = "necklace_05",
				weight = 1,
			},
			{
				key = "necklace_06",
				weight = 1,
			},
			{
				key = "necklace_07",
				weight = 1,
			},
			{
				key = "necklace_08",
				weight = 1,
			},
			{
				key = "necklace_09",
				weight = 1,
			},
			{
				key = "necklace_10",
				weight = 1,
			},
		},
		trinket = {
			{
				key = "trinket",
				weight = 1,
			},
			{
				key = "trinket_02",
				weight = 1,
			},
			{
				key = "trinket_03",
				weight = 1,
			},
			{
				key = "trinket_04",
				weight = 1,
			},
			{
				key = "trinket_05",
				weight = 1,
			},
			{
				key = "trinket_06",
				weight = 1,
			},
			{
				key = "trinket_07",
				weight = 1,
			},
			{
				key = "trinket_08",
				weight = 1,
			},
			{
				key = "trinket_09",
				weight = 1,
			},
			{
				key = "trinket_10",
				weight = 1,
			},
		},
		crafting_material = {
			{
				key = "crafting_material_weapon",
				weight = 1,
			},
			{
				key = "crafting_material_jewellery",
				weight = 1,
			},
		},
		deed = {
			{
				key = "deed",
				weight = 1,
			},
		},
	},
	witch_hunter = {
		melee = {
			{
				key = "wh_1h_axe",
				weight = 1,
			},
			{
				key = "wh_2h_sword",
				weight = 1,
			},
			{
				key = "wh_fencing_sword",
				weight = 1,
			},
			{
				key = "wh_1h_falchion",
				weight = 1,
			},
			{
				key = "es_1h_flail",
				weight = 1,
			},
		},
		ranged = {
			{
				key = "wh_brace_of_pistols",
				weight = 1,
			},
			{
				key = "wh_repeating_pistols",
				weight = 1,
			},
			{
				key = "wh_crossbow",
				weight = 1,
			},
			{
				key = "wh_crossbow_repeater",
				weight = 1,
			},
		},
		ring = {
			{
				key = "ring",
				weight = 1,
			},
			{
				key = "ring_02",
				weight = 1,
			},
			{
				key = "ring_03",
				weight = 1,
			},
			{
				key = "ring_04",
				weight = 1,
			},
			{
				key = "ring_05",
				weight = 1,
			},
			{
				key = "ring_06",
				weight = 1,
			},
			{
				key = "ring_07",
				weight = 1,
			},
			{
				key = "ring_08",
				weight = 1,
			},
			{
				key = "ring_09",
				weight = 1,
			},
			{
				key = "ring_10",
				weight = 1,
			},
		},
		necklace = {
			{
				key = "necklace",
				weight = 1,
			},
			{
				key = "necklace_02",
				weight = 1,
			},
			{
				key = "necklace_03",
				weight = 1,
			},
			{
				key = "necklace_04",
				weight = 1,
			},
			{
				key = "necklace_05",
				weight = 1,
			},
			{
				key = "necklace_06",
				weight = 1,
			},
			{
				key = "necklace_07",
				weight = 1,
			},
			{
				key = "necklace_08",
				weight = 1,
			},
			{
				key = "necklace_09",
				weight = 1,
			},
			{
				key = "necklace_10",
				weight = 1,
			},
		},
		trinket = {
			{
				key = "trinket",
				weight = 1,
			},
			{
				key = "trinket_02",
				weight = 1,
			},
			{
				key = "trinket_03",
				weight = 1,
			},
			{
				key = "trinket_04",
				weight = 1,
			},
			{
				key = "trinket_05",
				weight = 1,
			},
			{
				key = "trinket_06",
				weight = 1,
			},
			{
				key = "trinket_07",
				weight = 1,
			},
			{
				key = "trinket_08",
				weight = 1,
			},
			{
				key = "trinket_09",
				weight = 1,
			},
			{
				key = "trinket_10",
				weight = 1,
			},
		},
		crafting_material = {
			{
				key = "crafting_material_weapon",
				weight = 1,
			},
			{
				key = "crafting_material_jewellery",
				weight = 1,
			},
		},
		deed = {
			{
				key = "deed",
				weight = 1,
			},
		},
	},
	empire_soldier = {
		melee = {
			{
				key = "es_1h_sword",
				weight = 1,
			},
			{
				key = "es_1h_mace",
				weight = 1,
			},
			{
				key = "es_2h_sword",
				weight = 1,
			},
			{
				key = "es_2h_hammer",
				weight = 1,
			},
			{
				key = "es_sword_shield",
				weight = 1,
			},
			{
				key = "es_mace_shield",
				weight = 1,
			},
			{
				key = "es_halberd",
				weight = 1,
			},
			{
				key = "es_2h_sword_executioner",
				weight = 1,
			},
		},
		ranged = {
			{
				key = "es_blunderbuss",
				weight = 1,
			},
			{
				key = "es_handgun",
				weight = 1,
			},
			{
				key = "es_repeating_handgun",
				weight = 1,
			},
			{
				key = "es_longbow",
				weight = 1,
			},
		},
		ring = {
			{
				key = "ring",
				weight = 1,
			},
			{
				key = "ring_02",
				weight = 1,
			},
			{
				key = "ring_03",
				weight = 1,
			},
			{
				key = "ring_04",
				weight = 1,
			},
			{
				key = "ring_05",
				weight = 1,
			},
			{
				key = "ring_06",
				weight = 1,
			},
			{
				key = "ring_07",
				weight = 1,
			},
			{
				key = "ring_08",
				weight = 1,
			},
			{
				key = "ring_09",
				weight = 1,
			},
			{
				key = "ring_10",
				weight = 1,
			},
		},
		necklace = {
			{
				key = "necklace",
				weight = 1,
			},
			{
				key = "necklace_02",
				weight = 1,
			},
			{
				key = "necklace_03",
				weight = 1,
			},
			{
				key = "necklace_04",
				weight = 1,
			},
			{
				key = "necklace_05",
				weight = 1,
			},
			{
				key = "necklace_06",
				weight = 1,
			},
			{
				key = "necklace_07",
				weight = 1,
			},
			{
				key = "necklace_08",
				weight = 1,
			},
			{
				key = "necklace_09",
				weight = 1,
			},
			{
				key = "necklace_10",
				weight = 1,
			},
		},
		trinket = {
			{
				key = "trinket",
				weight = 1,
			},
			{
				key = "trinket_02",
				weight = 1,
			},
			{
				key = "trinket_03",
				weight = 1,
			},
			{
				key = "trinket_04",
				weight = 1,
			},
			{
				key = "trinket_05",
				weight = 1,
			},
			{
				key = "trinket_06",
				weight = 1,
			},
			{
				key = "trinket_07",
				weight = 1,
			},
			{
				key = "trinket_08",
				weight = 1,
			},
			{
				key = "trinket_09",
				weight = 1,
			},
			{
				key = "trinket_10",
				weight = 1,
			},
		},
		crafting_material = {
			{
				key = "crafting_material_weapon",
				weight = 1,
			},
			{
				key = "crafting_material_jewellery",
				weight = 1,
			},
		},
		deed = {
			{
				key = "deed",
				weight = 1,
			},
		},
	},
	wood_elf = {
		melee = {
			{
				key = "we_dual_wield_daggers",
				weight = 1,
			},
			{
				key = "we_dual_wield_swords",
				weight = 1,
			},
			{
				key = "we_1h_sword",
				weight = 1,
			},
			{
				key = "we_dual_wield_sword_dagger",
				weight = 1,
			},
			{
				key = "we_2h_axe",
				weight = 1,
			},
			{
				key = "we_2h_sword",
				weight = 1,
			},
			{
				key = "we_spear",
				weight = 1,
			},
		},
		ranged = {
			{
				key = "we_shortbow",
				weight = 1,
			},
			{
				key = "we_shortbow_hagbane",
				weight = 1,
			},
			{
				key = "we_longbow",
				weight = 1,
			},
			{
				key = "we_crossbow_repeater",
				weight = 1,
			},
		},
		ring = {
			{
				key = "ring",
				weight = 1,
			},
			{
				key = "ring_02",
				weight = 1,
			},
			{
				key = "ring_03",
				weight = 1,
			},
			{
				key = "ring_04",
				weight = 1,
			},
			{
				key = "ring_05",
				weight = 1,
			},
			{
				key = "ring_06",
				weight = 1,
			},
			{
				key = "ring_07",
				weight = 1,
			},
			{
				key = "ring_08",
				weight = 1,
			},
			{
				key = "ring_09",
				weight = 1,
			},
			{
				key = "ring_10",
				weight = 1,
			},
		},
		necklace = {
			{
				key = "necklace",
				weight = 1,
			},
			{
				key = "necklace_02",
				weight = 1,
			},
			{
				key = "necklace_03",
				weight = 1,
			},
			{
				key = "necklace_04",
				weight = 1,
			},
			{
				key = "necklace_05",
				weight = 1,
			},
			{
				key = "necklace_06",
				weight = 1,
			},
			{
				key = "necklace_07",
				weight = 1,
			},
			{
				key = "necklace_08",
				weight = 1,
			},
			{
				key = "necklace_09",
				weight = 1,
			},
			{
				key = "necklace_10",
				weight = 1,
			},
		},
		trinket = {
			{
				key = "trinket",
				weight = 1,
			},
			{
				key = "trinket_02",
				weight = 1,
			},
			{
				key = "trinket_03",
				weight = 1,
			},
			{
				key = "trinket_04",
				weight = 1,
			},
			{
				key = "trinket_05",
				weight = 1,
			},
			{
				key = "trinket_06",
				weight = 1,
			},
			{
				key = "trinket_07",
				weight = 1,
			},
			{
				key = "trinket_08",
				weight = 1,
			},
			{
				key = "trinket_09",
				weight = 1,
			},
			{
				key = "trinket_10",
				weight = 1,
			},
		},
		crafting_material = {
			{
				key = "crafting_material_weapon",
				weight = 1,
			},
			{
				key = "crafting_material_jewellery",
				weight = 1,
			},
		},
		deed = {
			{
				key = "deed",
				weight = 1,
			},
		},
	},
	bright_wizard = {
		melee = {
			{
				key = "bw_1h_mace",
				weight = 1,
			},
			{
				key = "bw_flame_sword",
				weight = 1,
			},
			{
				key = "bw_sword",
				weight = 1,
			},
		},
		ranged = {
			{
				key = "bw_skullstaff_fireball",
				weight = 1,
			},
			{
				key = "bw_skullstaff_beam",
				weight = 1,
			},
			{
				key = "bw_skullstaff_geiser",
				weight = 1,
			},
			{
				key = "bw_skullstaff_spear",
				weight = 1,
			},
			{
				key = "bw_skullstaff_flamethrower",
				weight = 1,
			},
		},
		ring = {
			{
				key = "ring",
				weight = 1,
			},
			{
				key = "ring_02",
				weight = 1,
			},
			{
				key = "ring_03",
				weight = 1,
			},
			{
				key = "ring_04",
				weight = 1,
			},
			{
				key = "ring_05",
				weight = 1,
			},
			{
				key = "ring_06",
				weight = 1,
			},
			{
				key = "ring_07",
				weight = 1,
			},
			{
				key = "ring_08",
				weight = 1,
			},
			{
				key = "ring_09",
				weight = 1,
			},
			{
				key = "ring_10",
				weight = 1,
			},
		},
		necklace = {
			{
				key = "necklace",
				weight = 1,
			},
			{
				key = "necklace_02",
				weight = 1,
			},
			{
				key = "necklace_03",
				weight = 1,
			},
			{
				key = "necklace_04",
				weight = 1,
			},
			{
				key = "necklace_05",
				weight = 1,
			},
			{
				key = "necklace_06",
				weight = 1,
			},
			{
				key = "necklace_07",
				weight = 1,
			},
			{
				key = "necklace_08",
				weight = 1,
			},
			{
				key = "necklace_09",
				weight = 1,
			},
			{
				key = "necklace_10",
				weight = 1,
			},
		},
		trinket = {
			{
				key = "trinket",
				weight = 1,
			},
			{
				key = "trinket_02",
				weight = 1,
			},
			{
				key = "trinket_03",
				weight = 1,
			},
			{
				key = "trinket_04",
				weight = 1,
			},
			{
				key = "trinket_05",
				weight = 1,
			},
			{
				key = "trinket_06",
				weight = 1,
			},
			{
				key = "trinket_07",
				weight = 1,
			},
			{
				key = "trinket_08",
				weight = 1,
			},
			{
				key = "trinket_09",
				weight = 1,
			},
			{
				key = "trinket_10",
				weight = 1,
			},
		},
		crafting_material = {
			{
				key = "crafting_material_weapon",
				weight = 1,
			},
			{
				key = "crafting_material_jewellery",
				weight = 1,
			},
		},
		deed = {
			{
				key = "deed",
				weight = 1,
			},
		},
	},
}

DLCUtils.merge("extra_loot_chest_score_types", LootChestData.scores)
