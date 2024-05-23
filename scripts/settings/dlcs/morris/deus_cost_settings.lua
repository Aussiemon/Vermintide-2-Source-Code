-- chunkname: @scripts/settings/dlcs/morris/deus_cost_settings.lua

local base_swap_cost = {
	common = 60,
	exotic = 200,
	plentiful = 0,
	rare = 120,
	unique = 300,
}
local base_upgrade_cost = {
	common = 100,
	exotic = 350,
	plentiful = 0,
	rare = 200,
	unique = 500,
}
local swap_discount = 0.5
local upgrade_discount = 0.5

local function cost_formula_for_swap(equipped_rarity, new_rarity)
	local value = base_swap_cost[new_rarity] - base_swap_cost[equipped_rarity] * swap_discount

	value = math.ceil(value / 10) * 10

	return math.max(value, 0)
end

local function cost_formula_for_upgrade(equipped_rarity, new_rarity)
	local value = base_upgrade_cost[new_rarity] - base_upgrade_cost[equipped_rarity] * upgrade_discount

	value = math.ceil(value / 10) * 10

	return math.max(value, 0)
end

DeusCostSettings = DeusCostSettings or {
	shop = {
		consumables = {
			ammo = 100,
			heal = 200,
			potion = 250,
		},
		blessings = {
			blessing_holy_hand_grenade = 200,
			blessing_of_abundance = 200,
			blessing_of_grimnir = 200,
			blessing_of_isha = 200,
			blessing_of_power = 100,
			blessing_of_ranald = 200,
			blessing_of_shallya = 200,
			blessing_rally_flag = 200,
		},
		power_ups = {
			event = 100,
			exotic = 250,
			rare = 200,
			uncommon = 100,
			unique = 300,
		},
	},
	deus_chest = {
		power_up = 150,
		swap_ranged = {
			plentiful = {
				plentiful = cost_formula_for_swap("plentiful", "plentiful"),
				common = cost_formula_for_swap("plentiful", "common"),
				rare = cost_formula_for_swap("plentiful", "rare"),
				exotic = cost_formula_for_swap("plentiful", "exotic"),
				unique = cost_formula_for_swap("plentiful", "unique"),
			},
			common = {
				plentiful = cost_formula_for_swap("common", "plentiful"),
				common = cost_formula_for_swap("common", "common"),
				rare = cost_formula_for_swap("common", "rare"),
				exotic = cost_formula_for_swap("common", "exotic"),
				unique = cost_formula_for_swap("common", "unique"),
			},
			rare = {
				plentiful = cost_formula_for_swap("rare", "plentiful"),
				common = cost_formula_for_swap("rare", "common"),
				rare = cost_formula_for_swap("rare", "rare"),
				exotic = cost_formula_for_swap("rare", "exotic"),
				unique = cost_formula_for_swap("rare", "unique"),
			},
			exotic = {
				plentiful = cost_formula_for_swap("exotic", "plentiful"),
				common = cost_formula_for_swap("exotic", "common"),
				rare = cost_formula_for_swap("exotic", "rare"),
				exotic = cost_formula_for_swap("exotic", "exotic"),
				unique = cost_formula_for_swap("exotic", "unique"),
			},
			unique = {
				plentiful = cost_formula_for_swap("unique", "plentiful"),
				common = cost_formula_for_swap("unique", "common"),
				rare = cost_formula_for_swap("unique", "rare"),
				exotic = cost_formula_for_swap("unique", "exotic"),
				unique = cost_formula_for_swap("unique", "unique"),
			},
		},
		swap_melee = {
			plentiful = {
				plentiful = cost_formula_for_swap("plentiful", "plentiful"),
				common = cost_formula_for_swap("plentiful", "common"),
				rare = cost_formula_for_swap("plentiful", "rare"),
				exotic = cost_formula_for_swap("plentiful", "exotic"),
				unique = cost_formula_for_swap("plentiful", "unique"),
			},
			common = {
				plentiful = cost_formula_for_swap("common", "plentiful"),
				common = cost_formula_for_swap("common", "common"),
				rare = cost_formula_for_swap("common", "rare"),
				exotic = cost_formula_for_swap("common", "exotic"),
				unique = cost_formula_for_swap("common", "unique"),
			},
			rare = {
				plentiful = cost_formula_for_swap("rare", "plentiful"),
				common = cost_formula_for_swap("rare", "common"),
				rare = cost_formula_for_swap("rare", "rare"),
				exotic = cost_formula_for_swap("rare", "exotic"),
				unique = cost_formula_for_swap("rare", "unique"),
			},
			exotic = {
				plentiful = cost_formula_for_swap("exotic", "plentiful"),
				common = cost_formula_for_swap("exotic", "common"),
				rare = cost_formula_for_swap("exotic", "rare"),
				exotic = cost_formula_for_swap("exotic", "exotic"),
				unique = cost_formula_for_swap("exotic", "unique"),
			},
			unique = {
				plentiful = cost_formula_for_swap("unique", "plentiful"),
				common = cost_formula_for_swap("unique", "common"),
				rare = cost_formula_for_swap("unique", "rare"),
				exotic = cost_formula_for_swap("unique", "exotic"),
				unique = cost_formula_for_swap("unique", "unique"),
			},
		},
		upgrade = {
			plentiful = {
				plentiful = cost_formula_for_upgrade("plentiful", "plentiful"),
				common = cost_formula_for_upgrade("plentiful", "common"),
				rare = cost_formula_for_upgrade("plentiful", "rare"),
				exotic = cost_formula_for_upgrade("plentiful", "exotic"),
				unique = cost_formula_for_upgrade("plentiful", "unique"),
			},
			common = {
				plentiful = cost_formula_for_upgrade("common", "plentiful"),
				common = cost_formula_for_upgrade("common", "common"),
				rare = cost_formula_for_upgrade("common", "rare"),
				exotic = cost_formula_for_upgrade("common", "exotic"),
				unique = cost_formula_for_upgrade("common", "unique"),
			},
			rare = {
				plentiful = cost_formula_for_upgrade("rare", "plentiful"),
				common = cost_formula_for_upgrade("rare", "common"),
				rare = cost_formula_for_upgrade("rare", "rare"),
				exotic = cost_formula_for_upgrade("rare", "exotic"),
				unique = cost_formula_for_upgrade("rare", "unique"),
			},
			exotic = {
				plentiful = cost_formula_for_upgrade("exotic", "plentiful"),
				common = cost_formula_for_upgrade("exotic", "common"),
				rare = cost_formula_for_upgrade("exotic", "rare"),
				exotic = cost_formula_for_upgrade("exotic", "exotic"),
				unique = cost_formula_for_upgrade("exotic", "unique"),
			},
			unique = {
				plentiful = cost_formula_for_upgrade("unique", "plentiful"),
				common = cost_formula_for_upgrade("unique", "common"),
				rare = cost_formula_for_upgrade("unique", "rare"),
				exotic = cost_formula_for_upgrade("unique", "exotic"),
				unique = cost_formula_for_upgrade("unique", "unique"),
			},
		},
	},
}
