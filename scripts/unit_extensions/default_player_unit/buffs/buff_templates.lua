require("scripts/settings/player_unit_damage_settings")
require("scripts/settings/equipment/weapons")

MeleeBuffTypes = {
	MELEE_1H = true,
	MELEE_2H = true
}
RangedBuffTypes = {
	RANGED = true
}
StatBuffs = {
	"ATTACK_SPEED",
	"NO_PUSH_FATIGUE_COST",
	"MAX_FATIGUE",
	"FATIGUE_REGEN",
	"RELOAD_SPEED",
	"CLIP_SIZE",
	"TOTAL_AMMO",
	"REDUCED_OVERCHARGE",
	"AUTOMATIC_HEAD_SHOT",
	"EXTRA_SHOT",
	"VENT_DAMAGE",
	"VENT_SPEED",
	"PENETRATING_SHOT_PROC",
	"OVERCHARGE_DAMAGE_IMMUNITY",
	"INCREASED_MOVE_SPEED_WHILE_AIMING",
	"NOT_CONSUME_MEDPACK",
	"NOT_CONSUME_POTION",
	"NOT_CONSUME_GRENADE",
	"PROTECTION_POISON_WIND",
	"PROTECTION_RATLING_GUNNER",
	"PROTECTION_GUTTER_RUNNER",
	"PROTECTION_PACK_MASTER",
	"FASTER_REVIVE",
	"INCREASE_LUCK",
	"DAMAGE_TAKEN_KD",
	"CURSE_PROTECTION",
	"GRENADE_RADIUS",
	"FASTER_RESPAWN",
	"NOT_CONSUME_PICKUP",
	"COOP_STAMINA",
	"BACKSTAB_MULTIPLIER",
	"MOVEMENT_SPEED",
	"DAMAGE_TAKEN",
	"DAMAGE_TAKEN_TO_OVERCHARGE",
	"DAMAGE_TAKEN_ELITES",
	"INCREASED_WEAPON_DAMAGE",
	"INCREASED_WEAPON_DAMAGE_MELEE",
	"INCREASED_WEAPON_DAMAGE_MELEE_2H",
	"INCREASED_WEAPON_DAMAGE_MELEE_1H",
	"INCREASED_WEAPON_DAMAGE_RANGED",
	"INCREASED_WEAPON_DAMAGE_RANGED_TO_WOUNDED",
	"INCREASED_WEAPON_DAMAGE_HEAVY_ATTACK",
	"POWER_LEVEL",
	"POWER_LEVEL_RANGED",
	"POWER_LEVEL_MELEE",
	"POWER_LEVEL_ARMOURED",
	"POWER_LEVEL_UNARMOURED",
	"POWER_LEVEL_LARGE",
	"POWER_LEVEL_FRENZY",
	"POWER_LEVEL_SKAVEN",
	"POWER_LEVEL_CHAOS",
	"REDUCED_SPREAD",
	"REDUCED_SPREAD_MOVING",
	"REDUCED_SPREAD_HIT",
	"REDUCED_SPREAD_SHOT",
	"MAX_HEALTH",
	"GRIMOIRE_MAX_HEALTH",
	"MAX_HEALTH_ALIVE",
	"MAX_HEALTH_KD",
	"SHIELD_BREAK_PROC",
	"HEALING_RECEIVED",
	"MAX_OVERCHARGE",
	"OVERCHARGE_REGEN",
	"REDUCED_RANGED_CHARGE_TIME",
	"MAX_DAMAGE_TAKEN",
	"ACTIVATED_COOLDOWN",
	"COOLDOWN_REGEN",
	"CRITICAL_STRIKE_CHANCE",
	"CRITICAL_STRIKE_CHANCE_RANGED",
	"CRITICAL_STRIKE_CHANCE_MELEE",
	"CRITICAL_STRIKE_EFFECTIVENESS",
	"BLOCK_ANGLE",
	"OUTER_BLOCK_ANGLE",
	"INCREASED_MAX_TARGETS",
	"TIMED_BLOCK_COST",
	"COUNTER_PUSH_POWER",
	"BLOCK_COST",
	"PROTECTION_SKAVEN",
	"PROTECTION_CHAOS",
	"PROTECTION_AOE",
	"STUN_DURATION",
	"SHIELDING_PLAYER_BY_ASSIST",
	"HEAL_SELF_ON_HEAL_OTHER",
	"POTION_DURATION",
	"HEADSHOT_MULTIPLIER"
}
StatBuffIndex = {}

for i = 1, #StatBuffs, 1 do
	StatBuffIndex[StatBuffs[i]] = i
end

StatBuffApplicationMethods = {
	[StatBuffIndex.ATTACK_SPEED] = "stacking_multiplier",
	[StatBuffIndex.NO_PUSH_FATIGUE_COST] = "proc",
	[StatBuffIndex.MAX_FATIGUE] = "stacking_bonus",
	[StatBuffIndex.FATIGUE_REGEN] = "stacking_multiplier",
	[StatBuffIndex.RELOAD_SPEED] = "stacking_multiplier",
	[StatBuffIndex.CLIP_SIZE] = "stacking_multiplier",
	[StatBuffIndex.TOTAL_AMMO] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_OVERCHARGE] = "stacking_multiplier",
	[StatBuffIndex.EXTRA_SHOT] = "proc",
	[StatBuffIndex.VENT_DAMAGE] = "stacking_multiplier",
	[StatBuffIndex.VENT_SPEED] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_MOVE_SPEED_WHILE_AIMING] = "stacking_multiplier",
	[StatBuffIndex.NOT_CONSUME_MEDPACK] = "proc",
	[StatBuffIndex.NOT_CONSUME_POTION] = "proc",
	[StatBuffIndex.NOT_CONSUME_GRENADE] = "proc",
	[StatBuffIndex.PROTECTION_POISON_WIND] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_RATLING_GUNNER] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_GUTTER_RUNNER] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_PACK_MASTER] = "stacking_multiplier",
	[StatBuffIndex.FASTER_REVIVE] = "stacking_multiplier",
	[StatBuffIndex.INCREASE_LUCK] = "stacking_multiplier",
	[StatBuffIndex.DAMAGE_TAKEN_KD] = "stacking_multiplier",
	[StatBuffIndex.CURSE_PROTECTION] = "stacking_multiplier",
	[StatBuffIndex.GRENADE_RADIUS] = "stacking_multiplier",
	[StatBuffIndex.FASTER_RESPAWN] = "stacking_multiplier",
	[StatBuffIndex.NOT_CONSUME_PICKUP] = "proc",
	[StatBuffIndex.COOP_STAMINA] = "proc",
	[StatBuffIndex.BACKSTAB_MULTIPLIER] = "proc",
	[StatBuffIndex.MOVEMENT_SPEED] = "stacking_multiplier",
	[StatBuffIndex.DAMAGE_TAKEN] = "stacking_multiplier",
	[StatBuffIndex.DAMAGE_TAKEN_TO_OVERCHARGE] = "stacking_multiplier",
	[StatBuffIndex.DAMAGE_TAKEN_ELITES] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE_2H] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE_1H] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_RANGED_TO_WOUNDED] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_WEAPON_DAMAGE_HEAVY_ATTACK] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_RANGED] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_MELEE] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_ARMOURED] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_UNARMOURED] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_LARGE] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_FRENZY] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_SKAVEN] = "stacking_multiplier",
	[StatBuffIndex.POWER_LEVEL_CHAOS] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_SPREAD] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_SPREAD_MOVING] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_SPREAD_HIT] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_SPREAD_SHOT] = "stacking_multiplier",
	[StatBuffIndex.MAX_HEALTH] = "stacking_multiplier",
	[StatBuffIndex.GRIMOIRE_MAX_HEALTH] = "stacking_multiplier",
	[StatBuffIndex.MAX_HEALTH_ALIVE] = "stacking_multiplier",
	[StatBuffIndex.MAX_HEALTH_KD] = "stacking_multiplier",
	[StatBuffIndex.SHIELD_BREAK_PROC] = "proc",
	[StatBuffIndex.HEALING_RECEIVED] = "stacking_multiplier",
	[StatBuffIndex.MAX_OVERCHARGE] = "stacking_multiplier",
	[StatBuffIndex.OVERCHARGE_REGEN] = "stacking_multiplier",
	[StatBuffIndex.REDUCED_RANGED_CHARGE_TIME] = "stacking_multiplier",
	[StatBuffIndex.MAX_DAMAGE_TAKEN] = "stacking_bonus",
	[StatBuffIndex.ACTIVATED_COOLDOWN] = "stacking_multiplier",
	[StatBuffIndex.COOLDOWN_REGEN] = "stacking_multiplier",
	[StatBuffIndex.CRITICAL_STRIKE_CHANCE] = "stacking_bonus",
	[StatBuffIndex.CRITICAL_STRIKE_CHANCE_RANGED] = "stacking_bonus",
	[StatBuffIndex.CRITICAL_STRIKE_CHANCE_MELEE] = "stacking_bonus",
	[StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS] = "stacking_multiplier",
	[StatBuffIndex.OVERCHARGE_DAMAGE_IMMUNITY] = "proc",
	[StatBuffIndex.BLOCK_ANGLE] = "stacking_multiplier",
	[StatBuffIndex.OUTER_BLOCK_ANGLE] = "stacking_multiplier",
	[StatBuffIndex.INCREASED_MAX_TARGETS] = "stacking_bonus",
	[StatBuffIndex.TIMED_BLOCK_COST] = "stacking_multiplier",
	[StatBuffIndex.COUNTER_PUSH_POWER] = "stacking_multiplier",
	[StatBuffIndex.BLOCK_COST] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_SKAVEN] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_CHAOS] = "stacking_multiplier",
	[StatBuffIndex.PROTECTION_AOE] = "stacking_multiplier",
	[StatBuffIndex.STUN_DURATION] = "stacking_multiplier",
	[StatBuffIndex.SHIELDING_PLAYER_BY_ASSIST] = "proc",
	[StatBuffIndex.HEAL_SELF_ON_HEAL_OTHER] = "proc",
	[StatBuffIndex.POTION_DURATION] = "stacking_multiplier",
	[StatBuffIndex.HEADSHOT_MULTIPLIER] = "stacking_multiplier"
}
WeaponSpecificStatBuffs = {}

local function add_stat_buff(weapon_type, name, application_method, buff_type)
	local index = #StatBuffs + 1
	StatBuffs[index] = name
	StatBuffIndex[name] = index
	StatBuffApplicationMethods[index] = application_method
	WeaponSpecificStatBuffs[weapon_type] = WeaponSpecificStatBuffs[weapon_type] or {}
	WeaponSpecificStatBuffs[weapon_type][buff_type] = name

	return 
end

for _, template in pairs(Weapons) do
	local weapon_type = template.weapon_type

	if weapon_type and not WeaponSpecificStatBuffs[weapon_type] then
		local name = "INCREASED_WEAPON_DAMAGE_" .. weapon_type

		add_stat_buff(weapon_type, name, "stacking_multiplier", "damage")
	end
end

ProcEvents = {
	"on_hit",
	"on_kill",
	"on_boss_killed",
	"on_special_killed",
	"on_ping_target_killed",
	"on_block",
	"on_block_broken",
	"on_knocked_down",
	"on_revived",
	"on_revived_ally",
	"on_healed",
	"on_healed_ally",
	"on_assisted",
	"on_assisted_ally",
	"on_push",
	"on_damage_taken",
	"on_reload",
	"on_ammo_used",
	"on_unwield",
	"on_critical_hit",
	"on_consumable_picked_up",
	"on_push_used",
	"on_backstab",
	"on_sweep",
	"on_ranged_hit",
	"on_critical_sweep",
	"on_critical_action",
	"on_spell_used",
	"on_gromril_armour_removed"
}
local buff_params = {}

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

ProcFunctions = {
	heal = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end

		return 
	end,
	heal_permanent = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "bandage")
		end

		return 
	end,
	heal_party = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus
			local player_and_bot_units = PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units, 1 do
				DamageUtils.heal_network(player_and_bot_units[i], player_unit, heal_amount, "heal_from_proc")
			end
		end

		return 
	end,
	heal_assisted_and_self_on_assist = function (player, buff, params)
		local player_unit = player.player_unit
		local assisted_unit = params[1]

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")

			if Unit.alive(assisted_unit) then
				DamageUtils.heal_network(assisted_unit, player_unit, heal_amount, "heal_from_proc")
			end
		end

		return 
	end,
	buff_defence_on_revived_target = function (player, buff, params)
		local player_unit = player.player_unit
		local revived_unit = params[1]
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		if Unit.alive(player_unit) and Unit.alive(revived_unit) and Managers.player.is_server then
			buff_system.add_buff(buff_system, revived_unit, buff_to_add, player_unit, false)
		end

		return 
	end,
	on_hit_debuff_enemy_defence = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) and Managers.player.is_server then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if buff_extension then
				buff_extension.add_buff(buff_extension, "defence_debuff_enemies")
			end
		end

		return 
	end,
	kills_stack_fiery_push = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "bw_kill_stacks")
		end

		return 
	end,
	add_stacking_damage_from_melee_headshot = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local damage_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = damage_increase
			buff_params.external_optional_duration = duration

			buff_extension.add_buff(buff_extension, "stacking_melee_damage", buff_params)
		end

		return 
	end,
	heal_on_melee_headshot = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end

		return 
	end,
	heal_on_ranged_headshot = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "projectile" or attack_type == "instant_projectile") then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end

		return 
	end,
	heal_on_crit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end

		return 
	end,
	remove_wounded = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local heal_amount = health_extension.current_temporary_health(health_extension)

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "bandage")
		end

		return 
	end,
	apply_burn_to_enemies = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			table.clear(buff_params)

			buff_params.attacker_unit = player_unit

			buff_extension.add_buff(buff_extension, "flaming_shield_burning_dot", buff_params)
		end

		return 
	end,
	regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "stamina_regen", buff_params)
		end

		return 
	end,
	sienna_unchained_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "sienna_unchained_stamina_regen", buff_params)
		end

		return 
	end,
	markus_mercenary_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "markus_mercenary_stamina_regen_buff", buff_params)
		end

		return 
	end,
	markus_knight_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "markus_knight_stamina_regen_buff", buff_params)
		end

		return 
	end,
	bardin_ironbreaker_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "bardin_ironbreaker_regen_stamina_on_charged_attacks_buff", buff_params)
		end

		return 
	end,
	increased_melee_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local damage_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = damage_increase
			buff_params.external_optional_duration = duration

			buff_extension.add_buff(buff_extension, "increased_melee_damage_from_proc", buff_params)
		end

		return 
	end,
	add_gromril_delay = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

				if talent_extension.has_talent(talent_extension, "bardin_ironbreaker_max_gromril_delay", "dwarf_ranger", true) then
					buff_extension.add_buff(buff_extension, "bardin_ironbreaker_gromril_delay_short")
				else
					buff_extension.add_buff(buff_extension, "bardin_ironbreaker_gromril_delay")
				end
			end
		end

		return 
	end,
	reduce_ally_damage_taken_on_revived_ally = function (player, buff, params)
		local player_unit = player.player_unit
		local revived_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(revived_unit) then
			local buff_extension = ScriptUnit.extension(revived_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "bardin_ironbreaker_reduce_damage_taken_on_revive")
		end

		return 
	end,
	victor_zealot_gain_invulnerability = function (player, buff, params)
		local player_unit = player.player_unit
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if Unit.alive(player_unit) and not status_extension.is_knocked_down(status_extension) then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local damage = params[2]
			local current_health = health_extension.current_health(health_extension)
			local killing_blow = current_health <= damage

			if killing_blow then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

				buff_extension.add_buff(buff_extension, "victor_zealot_invulnerability_on_lethal_damage_taken")

				if Managers.state.network.is_server then
					local heal_amount = (current_health - damage) * -1 + 1

					DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
				end

				return true
			end
		end

		return 
	end,
	add_increased_ranged_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "passive_career_wh_2_proc")
		end

		return 
	end,
	ww_melee_kills_stack_ranged_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "ww_increased_ranged_damage_from_proc")
		end

		return 
	end,
	wh_stack_kills_to_be_uninterruptible = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "wh_kill_stack_from_proc")
		end

		return 
	end,
	ww_melee_attacks_apply_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "ww_applied_damage_taken")
		end

		return 
	end,
	es_legshots_cripple = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) and (attack_type == "instant_projectile" or attack_type == "projectile") and (hit_zone_name == "left_leg" or hit_zone_name == "right_leg") then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "es_movement_speed_debuff")
		end

		return 
	end,
	ranged_crits_increase_dmg_vs_armour_type = function (player, buff, params)
		local player_unit = player.player_unit
		local target_unit = params[1]
		local armour_type = DamageUtils.get_unit_armor(target_unit)

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if armour_type == 1 then
				buff_extension.add_buff(buff_extension, "ranged_power_vs_unarmored")
			elseif armour_type == 2 then
				buff_extension.add_buff(buff_extension, "ranged_power_vs_armored")
			elseif armour_type == 3 then
				buff_extension.add_buff(buff_extension, "ranged_power_vs_large")
			elseif armour_type == 5 then
				buff_extension.add_buff(buff_extension, "ranged_power_vs_frenzy")
			end
		end

		return 
	end,
	debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "defence_debuff")
		end

		return 
	end,
	victor_witchhunter_debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "defence_debuff_enemies")
		end

		return 
	end,
	kerillian_shade_debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "defence_debuff_enemies")
		end

		return 
	end,
	buff_defence_on_heal = function (player, buff, params)
		local player_unit = player.player_unit
		local healer_unit = params[1]
		local heal_type = params[3]

		if player_unit == healer_unit and (heal_type == "healing_draught" or heal_type == "bandage") then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "trait_necklace_damage_taken_reduction_buff")
		end

		return 
	end,
	bardin_ranger_scavenge_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return 
		end

		local player_unit = player.player_unit
		local killed_unit = params[3]

		if Unit.alive(player_unit) then
			local drop_chance = buff.template.drop_chance
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local result = math.random(1, 100)

			if result < drop_chance * 100 then
				local enemy_pos = POSITION_LOOKUP[killed_unit]
				local raycast_down = true
				local pickup_system = Managers.state.entity:system("pickup_system")

				if talent_extension.has_talent(talent_extension, "bardin_ranger_passive_spawn_healing_draught", "dwarf_ranger", true) then
					if 1 < math.random(1, 4) then
						pickup_system.debug_spawn_pickup(pickup_system, "ammo_ranger", enemy_pos, raycast_down)
					else
						pickup_system.debug_spawn_pickup(pickup_system, "frag_grenade_t1", enemy_pos, raycast_down)
					end
				elseif talent_extension.has_talent(talent_extension, "bardin_ranger_passive_spawn_potions", "dwarf_ranger", true) then
					local drop_result = math.random(1, 6)

					if drop_result == 1 then
						pickup_system.debug_spawn_pickup(pickup_system, "damage_boost_potion", enemy_pos, raycast_down)
					elseif drop_result == 2 then
						pickup_system.debug_spawn_pickup(pickup_system, "speed_boost_potion", enemy_pos, raycast_down)
					else
						pickup_system.debug_spawn_pickup(pickup_system, "ammo_ranger", enemy_pos, raycast_down)
					end
				elseif talent_extension.has_talent(talent_extension, "bardin_ranger_passive_improved_ammo") then
					pickup_system.debug_spawn_pickup(pickup_system, "ammo_ranger_improved", enemy_pos, raycast_down)
				else
					pickup_system.debug_spawn_pickup(pickup_system, "ammo_ranger", enemy_pos, raycast_down)
				end
			end
		end

		return 
	end,
	debuff_defence_grenade_hit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]
		local breed = Unit.get_data(hit_unit, "breed")

		if attack_type == "grenade" and breed then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "trait_trinket_grenade_damage_taken_buff")
		end

		return 
	end,
	activate_buff_on_disabler = function (player, buff, params)
		local unit = player.player_unit
		local template = buff.template
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension.is_disabled(status_extension)
		local buff_to_add = template.buff_to_add

		if is_disabled then
			local disabler_unit = status_extension.get_disabler_unit(status_extension)

			if Unit.alive(disabler_unit) then
				local disabler_breed = disabler_unit and Unit.get_data(disabler_unit, "breed")

				if not disabler_breed or not disabler_breed.boss then
					local buff_extension = ScriptUnit.extension(disabler_unit, "buff_system")

					buff_extension.add_buff(buff_extension, buff_to_add)
				end
			end
		end

		return 
	end,
	buff_consecutive_shots_damage = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")
		local player_unit_buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if not hit_unit_buff_extension.has_buff_type(hit_unit_buff_extension, "consecutive_shot_debuff") then
			hit_unit_buff_extension.add_buff(hit_unit_buff_extension, "consecutive_shot_debuff")
		else
			player_unit_buff_extension.add_buff(player_unit_buff_extension, "consecutive_shot_buff")
		end

		return 
	end,
	block_increase_enemy_damage_taken = function (player, buff, params)
		local buff_template = buff.template
		local attacking_unit = params[1]

		if Unit.alive(attacking_unit) then
			local buff_extension = ScriptUnit.extension(attacking_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "defence_debuff_enemies")
		end

		return 
	end,
	add_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, buff_name)
		end

		return 
	end,
	add_bardin_slayer_passive_buff = function (player, buff, params)
		if not Managers.state.network.is_server then
			return 
		end

		local player_unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")

		if Unit.alive(player_unit) then
			local buff_name = "bardin_slayer_passive_stacking_damage_buff"
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension.has_talent(talent_extension, "bardin_slayer_passive_stacking_damage_buff_increased_duration", "dwarf_ranger", true) then
				buff_name = "bardin_slayer_passive_stacking_damage_buff_increased_duration"
			end

			if talent_extension.has_talent(talent_extension, "bardin_slayer_passive_stacking_damage_buff_grants_defence", "dwarf_ranger", true) then
				buff_system.add_buff(buff_system, player_unit, "bardin_slayer_passive_stacking_defence_buff", player_unit, false)
			end

			buff_system.add_buff(buff_system, player_unit, buff_name, player_unit, false)

			if talent_extension.has_talent(talent_extension, "bardin_slayer_passive_cooldown_reduction_on_max_stacks", "dwarf_ranger", true) then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local num_stacks = buff_extension.num_buff_type(buff_extension, buff_name)
				local max_stacks = buff.template.max_stacks

				if num_stacks == max_stacks then
					buff_system.add_buff(buff_system, player_unit, "bardin_slayer_passive_cooldown_reduction_on_max_stacks", player_unit, false)
				end
			end
		end

		return 
	end,
	remove_fatigue = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local fatigue_amount = buff.bonus
			local status_extension = ScriptUnit.extension(player_unit, "status_system")

			status_extension.remove_fatigue_points(status_extension, fatigue_amount)
		end

		return 
	end,
	increase_attack_speed = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local speed_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = speed_increase
			buff_params.external_optional_duration = duration

			buff_extension.add_buff(buff_extension, "increased_attack_speed", buff_params)
		end

		return 
	end,
	increase_critical_hit_chance = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local crit_chance_increase = buff_template.inherited_bonus
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_bonus = crit_chance_increase
			buff_params.external_optional_duration = duration

			buff_extension.add_buff(buff_extension, "increased_critical_hit_chance", buff_params)
		end

		return 
	end,
	remove_overcharge = function (player, buff, params)
		local player_unit = player.player_unit

		if not is_local(player_unit) then
			return 
		end

		if Unit.alive(player_unit) then
			local overcharge_amount = buff.bonus
			local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")

			if overcharge_extension then
				overcharge_extension.remove_charge(overcharge_extension, overcharge_amount)
			end
		end

		return 
	end,
	end_shade_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local ranged_stealth = talent_extension.has_talent(talent_extension, "kerillian_shade_activated_ability_no_break_on_ranged", "wood_elf", true)
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local wielded_slot = inventory_extension.get_wielded_slot_name(inventory_extension)

			if wielded_slot == "slot_melee" or (wielded_slot == "slot_ranged" and not ranged_stealth) then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local shade_activated_ability_buff = nil

				if talent_extension.has_talent(talent_extension, "kerillian_shade_activated_ability_duration", "wood_elf", true) then
					shade_activated_ability_buff = buff_extension.get_non_stacking_buff(buff_extension, "kerillian_shade_activated_ability_duration")
				else
					shade_activated_ability_buff = buff_extension.get_non_stacking_buff(buff_extension, "kerillian_shade_activated_ability")
				end

				if shade_activated_ability_buff then
					buff_extension.remove_buff(buff_extension, shade_activated_ability_buff.id)
				end
			end
		end

		return 
	end,
	end_huntsman_stealth = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and is_local(player_unit) then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
			local status_extension = ScriptUnit.extension(player_unit, "status_system")

			if status_extension.is_invisible(status_extension) then
				status_extension.set_invisible(status_extension, false)
				first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_markus_huntsman_exit")
				first_person_extension.play_hud_sound_event(first_person_extension, "Stop_career_ability_markus_huntsman_loop")
			end

			if not is_bot(player_unit) then
				MOOD_BLACKBOARD.skill_huntsman_stealth = false
				MOOD_BLACKBOARD.skill_huntsman_surge = true
			end
		end

		return 
	end,
	end_huntsman_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local wielded_slot = inventory_extension.get_wielded_slot_name(inventory_extension)
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local huntsman_activated_ability_buff = buff_extension.get_non_stacking_buff(buff_extension, "markus_huntsman_activated_ability")

			if huntsman_activated_ability_buff then
				buff_extension.remove_buff(buff_extension, huntsman_activated_ability_buff.id)
			end
		end

		return 
	end,
	end_ranger_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local wielded_slot = inventory_extension.get_wielded_slot_name(inventory_extension)
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local ranger_activated_ability_buff = buff_extension.get_non_stacking_buff(buff_extension, "bardin_ranger_activated_ability")

			if ranger_activated_ability_buff then
				buff_extension.remove_buff(buff_extension, ranger_activated_ability_buff.id)
			end
		end

		return 
	end,
	increased_movement_speed = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local speed_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = speed_increase
			buff_params.external_optional_duration = duration

			buff_extension.add_buff(buff_extension, "increased_movement_speed_from_proc", buff_params)
		end

		return 
	end,
	ammo_gain = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	ammo_fraction_gain = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local ammo_percent = ammo_extension.total_ammo_fraction(ammo_extension)
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
			local ammo_amount = math.max(math.round(ammo_extension.get_max_ammo(ammo_extension) * ammo_bonus_fraction), 1)

			if ammo_extension then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	ammo_gain_when_low = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return 
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local ammo_percent = ammo_extension.total_ammo_fraction(ammo_extension)
			local activate_bonus = ammo_percent < buff_template.activation_ammo
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
			local ammo_amount = math.max(math.round(ammo_extension.get_max_ammo(ammo_extension) * ammo_bonus_fraction), 1)

			if ammo_extension and activate_bonus then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	markus_huntsman_passive_proc = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension.has_talent(talent_extension, "markus_huntsman_passive_improved", "empire_soldier", true) then
				ammo_amount = ammo_amount * 2
			end

			if talent_extension.has_talent(talent_extension, "markus_huntsman_passive_crit_buff_on_headshot", "empire_soldier", true) then
				buff_extension.add_buff(buff_extension, "markus_huntsman_passive_crit_buff")
				buff_extension.add_buff(buff_extension, "markus_huntsman_passive_crit_buff_removal")
			end

			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	markus_huntsman_increase_reload_speed = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			buff_extension.add_buff(buff_extension, "markus_huntsman_headshots_increase_reload_speed_buff")
		end

		return 
	end,
	replenish_ammo_on_headshot_ranged = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	reset_tranquility = function (player, buff, params)
		local player_unit = player.player_unit
		local attacker_unit = params[1]

		if Unit.alive(player_unit) and attacker_unit ~= player_unit then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local tranquility_buff = buff_extension.get_non_stacking_buff(buff_extension, "tranquility")

			if tranquility_buff then
				buff_extension.remove_buff(buff_extension, tranquility_buff.id)
			end

			buff_extension.add_buff(buff_extension, "sienna_adept_passive")
		end

		return 
	end,
	gain_markus_mercenary_passive_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return 
		end

		local player_unit = player.player_unit
		local owner_unit = player_unit
		local buff_template = buff.template
		local target_number = params[4]
		local attack_type = params[2]
		local buff_to_add = buff_template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")

		if Unit.alive(player_unit) and target_number and buff_template.targets <= target_number and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension.has_talent(talent_extension, "markus_mercenary_passive_group_proc", "empire_soldier", true) then
				local player_and_bot_units = PLAYER_AND_BOT_UNITS
				local num_units = #player_and_bot_units

				for i = 1, num_units, 1 do
					local unit = player_and_bot_units[i]

					if Unit.alive(unit) then
						buff_system.add_buff(buff_system, unit, buff_to_add, owner_unit, false)
					end
				end
			else
				buff_system.add_buff(buff_system, player_unit, buff_to_add, owner_unit, false)
			end
		end

		return 
	end,
	reduce_activated_ability_cooldown = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")

			career_extension.reduce_activated_ability_cooldown(career_extension, buff.bonus)
		end

		return 
	end,
	reduce_activated_ability_cooldown_on_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit
		local attacker_unit = params[1]
		local damage_taken = params[2]

		if Unit.alive(player_unit) and attacker_unit ~= player_unit then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local cooldown_removed = buff.bonus * damage_taken

			career_extension.reduce_activated_ability_cooldown(career_extension, cooldown_removed)
		end

		return 
	end,
	remove_victor_bountyhunter_passive_crit_buff = function (player, buff, params)
		local player_unit = player.player_unit
		local action_type = params[1]
		local melee_action = action_type == "sweep" or action_type == "push_stagger"

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local crit_buff = buff_extension.get_non_stacking_buff(buff_extension, "victor_bountyhunter_passive_crit_buff")

			if crit_buff and not melee_action then
				buff_extension.remove_buff(buff_extension, crit_buff.id)

				local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

				if talent_extension.has_talent(talent_extension, "victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
					buff_extension.add_buff(buff_extension, "victor_bountyhunter_passive_reduced_cooldown")
				else
					buff_extension.add_buff(buff_extension, "victor_bountyhunter_passive_crit_cooldown")
				end
			end
		end

		return 
	end,
	remove_markus_huntsman_passive_crit_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local crit_buff = buff_extension.get_non_stacking_buff(buff_extension, "markus_huntsman_passive_crit_buff")

			if crit_buff then
				buff_extension.remove_buff(buff_extension, crit_buff.id)
			end
		end

		return 
	end,
	gain_uninterruptible = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "uninterruptible")
		end

		return 
	end,
	gain_bardin_slayer_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "bardin_slayer_uninterruptible_on_block_broken_buff")
		end

		return 
	end,
	gain_markus_knight_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "markus_knight_uninterruptible_on_block_broken_buff")
		end

		return 
	end,
	gain_kerillian_maidenguard_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "kerillian_maidenguard_uninterruptible_on_block_broken_buff")
		end

		return 
	end,
	gain_victor_zealot_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "victor_zealot_uninterruptible_on_block_broken_buff")
		end

		return 
	end,
	victor_bountyhunter_activate_passive_on_melee_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local wielded_slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if wielded_slot_name == "slot_melee" then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local cooldown_buff = buff_extension.get_non_stacking_buff(buff_extension, "victor_bountyhunter_passive_crit_cooldown")

				if talent_extension.has_talent(talent_extension, "victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
					cooldown_buff = buff_extension.get_non_stacking_buff(buff_extension, "victor_bountyhunter_passive_reduced_cooldown")
				end

				if cooldown_buff then
					cooldown_buff.duration = 0
				end
			end
		end

		return 
	end
}
MaxStackFunctions = {
	gain_push_applies_burn = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "bw_push_applies_burn")
		end

		return 
	end,
	gain_assassinate = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension.add_buff(buff_extension, "assassinate")
		end

		return 
	end,
	gain_health_and_ammo = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			if Managers.player.is_server then
				local heal_amount = sub_buff_template.heal_amount

				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end

			local weapon_slot = "slot_ranged"
			local ammo_amount = sub_buff_template.ammo_amount
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension.get_slot_data(inventory_extension, weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = right_unit_1p and ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = left_unit_1p and ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension.add_ammo_to_reserve(ammo_extension, ammo_amount)
			end
		end

		return 
	end,
	remove_buff = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_to_remove = sub_buff_template.buff_to_remove
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff = buff_extension.get_non_stacking_buff(buff_extension, buff_to_remove)

			if buff then
				buff_extension.remove_buff(buff_extension, buff.id)
			end
		end

		return 
	end
}
PotionSpreadTrinketTemplates = {
	damage_boost_potion = {
		tier1 = "damage_boost_potion_weak",
		tier3 = "damage_boost_potion",
		tier2 = "damage_boost_potion_medium"
	},
	speed_boost_potion = {
		tier1 = "speed_boost_potion_weak",
		tier3 = "speed_boost_potion",
		tier2 = "speed_boost_potion_medium"
	},
	invulnerability_potion = {
		tier1 = "invulnerability_potion_weak",
		tier3 = "invulnerability_potion",
		tier2 = "invulnerability_potion_medium"
	}
}
TrinketSpreadDistance = 10
BuffTemplates = {
	twitch_damage_boost = {
		activation_effect = "fx/screenspace_potion_01",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		buffs = {
			{
				duration = 20,
				name = "armor penetration",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01"
			}
		}
	},
	twitch_speed_boost = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "movement",
				icon = "potion_buff_02",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 20,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "attack speed buff",
				refresh_durations = true,
				max_stacks = 1,
				duration = 20,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	twitch_cooldown_reduction_boost = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "cooldown reduction buff",
				multiplier = 10,
				duration = 10,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true,
				stat_buff = StatBuffIndex.COOLDOWN_REGEN
			}
		}
	},
	twitch_no_overcharge_no_ammo_reloads = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_passive_infinite_ammo",
				duration = 30,
				name = "twitch_no_overcharge_no_ammo_reloads"
			}
		}
	},
	twitch_health_regen = {
		buffs = {
			{
				icon = "bardin_ranger_activated_ability_heal",
				name = "twitch_health_regen",
				heal = 1,
				heal_type = "health_regen",
				time_between_heal = 1,
				update_func = "health_regen_update",
				apply_buff_func = "health_regen_start",
				duration = 30
			}
		}
	},
	twitch_health_degen = {
		buffs = {
			{
				icon = "bardin_slayer_crit_chance",
				name = "twitch_health_degen",
				damage = 1,
				damage_type = "health_degen",
				duration = 20,
				update_func = "health_degen_update",
				apply_buff_func = "health_degen_start",
				time_between_damage = 1
			}
		}
	},
	twitch_grimoire_health_debuff = {
		buffs = {
			{
				duration = 30,
				name = "twitch_grimoire_health_debuff",
				debuff = true,
				icon = "buff_icon_grimoire_health_debuff",
				perk = "twitch_grimoire",
				stat_buff = StatBuffIndex.MAX_HEALTH,
				multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF
			}
		}
	},
	twitch_power_boost_dismember = {
		buffs = {
			{
				duration = 30,
				multiplier = 0.25,
				perk = "bloody_mess",
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability",
				stat_buff = StatBuffIndex.POWER_LEVEL
			}
		}
	},
	heavy_attack_shield_break = {
		buffs = {
			{
				perk = "shield_break"
			}
		}
	},
	temporary_health_degen = {
		buffs = {
			{
				name = "temporary health degen",
				damage = 10,
				damage_type = "temporary_health_degen",
				update_func = "temporary_health_degen_update",
				apply_buff_func = "temporary_health_degen_start",
				time_between_damage = 3
			}
		}
	},
	knockdown_bleed = {
		buffs = {
			{
				name = "knockdown bleed",
				damage = 10,
				damage_type = "knockdown_bleed",
				update_func = "knock_down_bleed_update",
				apply_buff_func = "knock_down_bleed_start",
				time_between_damage = 3
			}
		}
	},
	damage_boost_potion = {
		activation_effect = "fx/screenspace_potion_01",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		buffs = {
			{
				duration = 10,
				name = "armor penetration",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01"
			}
		}
	},
	speed_boost_potion = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "movement",
				icon = "potion_buff_02",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 10,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "attack speed buff",
				refresh_durations = true,
				max_stacks = 1,
				duration = 10,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	cooldown_reduction_potion = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "cooldown reduction buff",
				multiplier = 10,
				duration = 10,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true,
				stat_buff = StatBuffIndex.COOLDOWN_REGEN
			}
		}
	},
	invulnerability_potion = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				max_stacks = 1,
				name = "invulnerable",
				duration = 10,
				refresh_durations = true
			}
		}
	},
	damage_boost_potion_increased = {
		activation_effect = "fx/screenspace_potion_01",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		buffs = {
			{
				duration = 15,
				name = "armor penetration",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01"
			}
		}
	},
	speed_boost_potion_increased = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "movement",
				icon = "potion_buff_02",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 15,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "attack speed buff",
				refresh_durations = true,
				max_stacks = 1,
				duration = 15,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	cooldown_reduction_potion_increased = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "cooldown reduction buff",
				multiplier = 15,
				duration = 15,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true,
				stat_buff = StatBuffIndex.COOLDOWN_REGEN
			}
		}
	},
	invulnerability_potion_increased = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				max_stacks = 1,
				name = "invulnerable",
				duration = 15,
				refresh_durations = true
			}
		}
	},
	damage_boost_potion_reduced = {
		activation_effect = "fx/screenspace_potion_01",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		buffs = {
			{
				duration = 5,
				name = "armor penetration",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01"
			}
		}
	},
	speed_boost_potion_reduced = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "movement",
				icon = "potion_buff_02",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "attack speed buff",
				refresh_durations = true,
				max_stacks = 1,
				duration = 5,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	cooldown_reduction_potion_reduced = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "cooldown reduction buff",
				multiplier = 15,
				duration = 5,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true,
				stat_buff = StatBuffIndex.COOLDOWN_REGEN
			}
		}
	},
	invulnerability_potion_reduced = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				max_stacks = 1,
				name = "invulnerable",
				duration = 5,
				refresh_durations = true
			}
		}
	},
	grimoire_health_debuff = {
		activation_sound = "hud_info_state_grimoire_pickup",
		buffs = {
			{
				perk = "skaven_grimoire",
				name = "grimoire_health_debuff",
				debuff = true,
				icon = "buff_icon_grimoire_health_debuff",
				dormant = true
			}
		}
	},
	overcharged = {
		buffs = {
			{
				multiplier = -0.15,
				name = "attack speed buff",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	overcharged_no_attack_penalty = {
		buffs = {}
	},
	overcharged_critical = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "increase speed",
				lerp_time = 0.2,
				multiplier = 0.85,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				name = "change dodge speed",
				multiplier = 0.85,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				multiplier = -0.25,
				name = "attack speed buff",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	overcharged_critical_no_attack_penalty = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "increase speed",
				lerp_time = 0.2,
				multiplier = 0.85,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				name = "change dodge speed",
				multiplier = 0.85,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	change_dodge_speed = {
		buffs = {
			{
				name = "change dodge speed",
				multiplier = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	change_dodge_distance = {
		buffs = {
			{
				name = "change dodge distance",
				multiplier = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	statue_decrease_movement = {
		description = "description_melee_weapon_ammo_on_killing_blow_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_ammo_on_killing_blow_tier1",
		icon = "trait_icons_scavenger",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	sack_decrease_movement = {
		description = "description_melee_weapon_ammo_on_killing_blow_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_ammo_on_killing_blow_tier1",
		icon = "trait_icons_scavenger",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 0.2,
				multiplier = 0.7,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	planted_decrease_movement = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 0.2,
				multiplier = 0.75,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 1,
				multiplier = 0.75,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 1,
				multiplier = 0.75,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	planted_charging_decrease_movement = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 1,
				multiplier = 0.75,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 1,
				multiplier = 0.75,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 1,
				multiplier = 0.75,
				update_func = "update_charging_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	planted_casting_long_decrease_movement = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 2,
				multiplier = 0.75,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 2,
				multiplier = 0.75,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 2,
				multiplier = 0.75,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	planted_fast_decrease_movement = {
		buffs = {
			{
				remove_buff_name = "planted_return_to_normal_movement",
				name = "decrease_speed",
				lerp_time = 0.01,
				multiplier = 1,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				name = "decrease_crouch_speed",
				lerp_time = 0.01,
				multiplier = 1,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				remove_buff_name = "planted_return_to_normal_walk_movement",
				name = "decrease_walk_speed",
				lerp_time = 0.01,
				multiplier = 1,
				update_func = "update_action_lerp_movement_buff",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	planted_return_to_normal_movement = {
		buffs = {
			{
				update_func = "update_action_lerp_remove_movement_buff",
				name = "increase speed return",
				lerp_time = 0.2,
				duration = 1,
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	planted_return_to_normal_crouch_movement = {
		buffs = {
			{
				update_func = "update_action_lerp_remove_movement_buff",
				name = "increase speed return",
				lerp_time = 0.2,
				duration = 1,
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			}
		}
	},
	planted_return_to_normal_walk_movement = {
		buffs = {
			{
				update_func = "update_action_lerp_remove_movement_buff",
				name = "increase speed return",
				lerp_time = 0.2,
				duration = 1,
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	arrow_poison_dot = {
		buffs = {
			{
				duration = 3,
				name = "arrow poison dot",
				start_flow_event = "poisoned",
				end_flow_event = "poisoned_end",
				death_flow_event = "poisoned_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.6,
				damage_profile = "poison_direct",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage"
			}
		}
	},
	aoe_poison_dot = {
		buffs = {
			{
				duration = 3,
				name = "aoe poison dot",
				start_flow_event = "poisoned",
				end_flow_event = "poisoned_end",
				death_flow_event = "poisoned_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.75,
				damage_profile = "poison",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage"
			}
		}
	},
	weapon_bleed_dot_test = {
		buffs = {
			{
				damage_profile = "bleed",
				name = "weapon bleed dot test",
				duration = 5,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1,
				hit_zone = "neck",
				max_stacks = 1,
				update_func = "apply_dot_damage"
			}
		}
	},
	weapon_bleed_dot_maidenguard = {
		buffs = {
			{
				damage_profile = "bleed_maidenguard",
				name = "weapon bleed dot test",
				duration = 3,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1,
				hit_zone = "neck",
				max_stacks = 1,
				update_func = "apply_dot_damage"
			}
		}
	},
	kerillian_shade_ability_dot = {
		buffs = {
			{
				duration = 10,
				name = "kerillian_shade_ability_dot",
				time_between_dot_damages = 1,
				damage_profile = "poison",
				update_func = "apply_dot_damage",
				apply_buff_func = "start_dot_damage"
			},
			{
				multiplier = 0.5,
				name = "kerillian_shade_ability_debuff",
				refresh_durations = true,
				max_stacks = 1,
				duration = 10,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	burning_dot = {
		buffs = {
			{
				duration = 3,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	beam_burning_dot = {
		buffs = {
			{
				duration = 3,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "beam_burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_flamethrower_dot = {
		buffs = {
			{
				duration = 1.5,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				max_stacks = 1,
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "burninating",
				damage_profile = "flamethrower_burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	sienna_adept_ability_trail = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				name = "burning dot",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				end_flow_event = "smoke",
				time_between_dot_damages = 0.25,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_1W_dot = {
		buffs = {
			{
				duration = 2,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1.5,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_3W_dot = {
		buffs = {
			{
				duration = 3,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 1.25,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	slow_grenade_slow = {
		buffs = {
			{
				duration = 1,
				name = "slow_grenade_slow",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_grenade_slow",
				apply_buff_func = "apply_grenade_slow"
			}
		}
	},
	globadier_gas_dot = {
		buffs = {
			{
				damage_scale = 0.1,
				name = "globadier_gas_dot",
				duration = 5,
				player_screen_effect_name = "fx/screenspace_poison_globe_impact",
				remove_buff_func = "remove_dot_damage_globadier_gas",
				apply_buff_func = "start_dot_damage_globadier_gas",
				time_between_dot_damages = 1,
				damage_type = "globadier_gas_dot",
				update_func = "apply_dot_damage_globadier_gas",
				bonus = 1
			}
		}
	},
	super_jump = {
		buffs = {
			{
				duration = 20,
				name = "speed buff",
				multiplier = 1.7,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				duration = 10,
				name = "jump buff",
				multiplier = 1.2,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				bonus = 5,
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			}
		}
	},
	damage_volume_generic_dot = {
		buffs = {
			{
				update_func = "update_volume_dot_damage",
				name = "damage_volume_generic_dot",
				apply_buff_func = "apply_volume_dot_damage",
				damage_type = "volume_generic_dot"
			}
		}
	},
	movement_volume_generic_slowdown = {
		buffs = {
			{
				remove_buff_func = "remove_volume_movement_buff",
				name = "movement_volume_generic_slowdown",
				apply_buff_func = "apply_volume_movement_buff"
			}
		}
	},
	ranged_weapon_clip_size_tier1 = {
		description = "description_ranged_weapon_clip_size_tier1",
		apply_on = "equip",
		display_name = "ranged_weapon_clip_size_tier1",
		icon = "trait_icons_extracapacity",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.5,
				name = "clip_size",
				stat_buff = StatBuffIndex.CLIP_SIZE
			}
		}
	},
	ranged_weapon_clip_size_small_clip_tier1 = {
		description = "description_ranged_weapon_clip_size_tier1",
		apply_on = "equip",
		display_name = "ranged_weapon_clip_size_tier1",
		icon = "trait_icons_extracapacity",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 1,
				name = "clip_size",
				stat_buff = StatBuffIndex.CLIP_SIZE
			}
		}
	},
	ranged_weapon_clip_size_repeating_crossbow_clip_tier1 = {
		description = "description_ranged_weapon_clip_size_tier1",
		apply_on = "equip",
		display_name = "ranged_weapon_clip_size_tier1",
		icon = "trait_icons_extracapacity",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.4,
				name = "clip_size",
				stat_buff = StatBuffIndex.CLIP_SIZE
			}
		}
	},
	ranged_weapon_total_ammo_tier1 = {
		description = "description_ranged_weapon_total_ammo_tier1",
		apply_on = "equip",
		display_name = "ranged_weapon_total_ammo_tier1",
		icon = "trait_icons_ammunitionholder",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.3,
				name = "total_ammo",
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	},
	ranged_weapon_reload_speed_tier1 = {
		description = "description_ranged_weapon_reload_speed_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_reload_speed_tier1",
		icon = "trait_icon_mastercrafted",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.25,
				name = "reload_speed",
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	ranged_weapon_reload_speed_slow = {
		description = "description_ranged_weapon_reload_speed_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_reload_speed_tier1",
		icon = "trait_icon_mastercrafted",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "reload_speed",
				stat_buff = StatBuffIndex.RELOAD_SPEED
			}
		}
	},
	ranged_weapon_increased_zoom = {
		description = "description_ranged_weapon_increased_zoom",
		apply_on = "wield",
		display_name = "ranged_weapon_increased_zoom",
		icon = "trait_icon_hawkeye",
		buffs = {
			{
				name = "increased_zoom"
			}
		}
	},
	ranged_weapon_accuracy_tier1 = {
		description = "description_ranged_weapon_accuracy_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_accuracy_tier1",
		icon = "trait_icon_targeteer",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "accuracy",
				stat_buff = StatBuffIndex.ACCURACY
			}
		}
	},
	ranged_weapon_reduced_overcharge_tier1 = {
		description = "description_ranged_weapon_reduced_overcharge_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_reduced_overcharge_tier1",
		icon = "trait_icons_stability",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.1,
				name = "reduced_overcharge",
				stat_buff = StatBuffIndex.REDUCED_OVERCHARGE
			}
		}
	},
	ranged_weapon_extra_shot_tier1 = {
		description = "description_ranged_weapon_extra_shot_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_extra_shot_tier1",
		icon = "trait_icon_hailofdoom",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				name = "extra_shot",
				stat_buff = StatBuffIndex.EXTRA_SHOT,
				proc_chance = {
					0.05,
					0.15
				}
			}
		}
	},
	ranged_weapon_reduced_discharge_tier1 = {
		description = "description_ranged_weapon_reduced_discharge_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_reduced_discharge_tier1",
		icon = "trait_icons_channelingrune",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "reduced_vent_damage",
				stat_buff = StatBuffIndex.VENT_DAMAGE
			}
		}
	},
	ranged_weapon_increased_speed_while_aiming_tier1 = {
		description = "description_ranged_weapon_increased_move_speed_while_aiming_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_increased_speed_while_aiming_tier1",
		icon = "trait_icons_skirmisher",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "increased_move_speed_while_aiming",
				stat_buff = StatBuffIndex.INCREASED_MOVE_SPEED_WHILE_AIMING
			}
		}
	},
	ranged_weapon_attack_speed_tier1 = {
		description = "description_ranged_weapon_attack_speed_tier1",
		apply_on = "wield",
		display_name = "ranged_weapon_attack_speed_tier1",
		icon = "trait_icon_mastercrafted",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.15,
				name = "attack_speed",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	ranged_weapon_coop_stamina = {
		description = "dlc1_1_description_ranged_weapon_coop_stamina",
		apply_on = "wield",
		display_name = "dlc1_1_ranged_weapon_coop_stamina",
		icon = "trait_icon_inspirational_shot",
		description_values = {},
		buffs = {
			{
				name = "coop_stamina",
				stat_buff = StatBuffIndex.COOP_STAMINA
			}
		}
	},
	melee_weapon_no_push_fatigue_cost_tier1 = {
		description = "description_melee_weapon_no_push_fatigue_cost_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_no_push_fatigue_cost_tier1",
		icon = "trait_icons_improvedpommel",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				name = "no_push_fatigue_cost",
				stat_buff = StatBuffIndex.NO_PUSH_FATIGUE_COST,
				proc_chance = {
					0.2,
					0.4
				}
			}
		}
	},
	melee_weapon_max_fatigue_tier1 = {
		description = "description_melee_weapon_max_fatigue_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_max_fatigue_tier1",
		icon = "trait_icons_perfectbalance",
		description_values = {
			"bonus_description"
		},
		buffs = {
			{
				bonus_description = 1,
				name = "max_fatigue",
				bonus = 2,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	melee_weapon_push_increase = {
		description = "description_melee_weapon_push_increase",
		apply_on = "wield",
		display_name = "melee_weapon_push_increase",
		icon = "trait_icons_devastatingblow",
		buffs = {
			{
				name = "push_increase"
			}
		}
	},
	melee_weapon_backstab_tier1 = {
		description = "dlc1_1_description_melee_weapon_backstab_tier1",
		apply_on = "wield",
		display_name = "dlc1_1_melee_weapon_backstab_tier1",
		icon = "trait_icon_backstabbery",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 1,
				name = "melee_backstab_tier1",
				stat_buff = StatBuffIndex.BACKSTAB_MULTIPLIER
			}
		}
	},
	melee_weapon_shield_break_tier1 = {
		description = "",
		apply_on = "wield",
		display_name = "",
		icon = "trait_icons_scavenger",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				name = "shield_break_proc",
				stat_buff = StatBuffIndex.SHIELD_BREAK_PROC,
				proc_chance = {
					0.1,
					0.3
				}
			}
		}
	},
	melee_weapon_no_push_fatigue_cost_tier2 = {
		description = "description_melee_weapon_no_push_fatigue_cost_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_no_push_fatigue_cost_tier1",
		icon = "trait_icons_improvedpommel",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				name = "no_push_fatigue_cost",
				stat_buff = StatBuffIndex.NO_PUSH_FATIGUE_COST,
				proc_chance = {
					0.2,
					0.4
				}
			}
		}
	},
	melee_weapon_max_fatigue_tier2 = {
		description = "description_melee_weapon_max_fatigue_tier1",
		apply_on = "wield",
		display_name = "melee_weapon_max_fatigue_tier1",
		icon = "trait_icons_perfectbalance",
		description_values = {
			"bonus_description"
		},
		buffs = {
			{
				bonus_description = 1,
				name = "max_fatigue",
				bonus = 2,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	melee_weapon_push_increase = {
		description = "description_melee_weapon_push_increase",
		apply_on = "wield",
		display_name = "melee_weapon_push_increase",
		icon = "trait_icons_devastatingblow",
		buffs = {
			{
				name = "push_increase"
			}
		}
	},
	melee_weapon_backstab_tier2 = {
		description = "dlc1_1_description_melee_weapon_backstab_tier1",
		apply_on = "wield",
		display_name = "dlc1_1_melee_weapon_backstab_tier1",
		icon = "trait_icon_backstabbery",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 1,
				name = "melee_backstab_tier1",
				stat_buff = StatBuffIndex.BACKSTAB_MULTIPLIER
			}
		}
	},
	melee_weapon_shield_break_tier2 = {
		description = "",
		apply_on = "wield",
		display_name = "",
		icon = "trait_icons_scavenger",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				name = "shield_break_proc",
				stat_buff = StatBuffIndex.SHIELD_BREAK_PROC,
				proc_chance = {
					0.1,
					0.3
				}
			}
		}
	},
	regrowth = {
		buffs = {
			{
				name = "regrowth",
				event_buff = true,
				event = "on_critical_hit",
				bonus = 3,
				buff_func = ProcFunctions.heal
			}
		}
	},
	bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				event_buff = true,
				event = "on_kill",
				bonus = 2,
				buff_func = ProcFunctions.heal
			}
		}
	},
	conqueror = {
		buffs = {
			{
				name = "conqueror",
				event_buff = true,
				event = "on_boss_killed",
				bonus = 50,
				buff_func = ProcFunctions.heal_permanent
			}
		}
	},
	defence_debuff_enemies = {
		buffs = {
			{
				multiplier = 0.2,
				name = "defence_debuff_enemies",
				refresh_durations = true,
				max_stacks = 1,
				duration = 5,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	attack_speed_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "attack_speed_from_proc",
				refresh_durations = true,
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	fatigue_regen_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "fatigue_regen_from_proc",
				refresh_durations = true,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	},
	increased_melee_damage_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "increased_melee_damage_from_proc",
				refresh_durations = true,
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE
			}
		}
	},
	damage_taken_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "damage_taken_from_proc",
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	mutator_player_dot = {
		buffs = {
			{
				update_func = "apply_dot_damage",
				name = "mutator player dot",
				time_between_dot_damages = 10,
				damage_profile = "mutator_player_dot",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage"
			}
		}
	},
	damage_taken_powerful_elites = {
		buffs = {
			{
				multiplier = 2,
				name = "damage_taken_from_powerful_elites",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN_ELITES
			}
		}
	},
	trinket_reduce_activated_ability_cooldown = {
		description = "trinket_reduce_activated_ability_cooldown_description",
		display_name = "trinket_reduce_activated_ability_cooldown",
		unique_id = "trinket_ability_cooldown",
		icon = "trait_icon_mastercrafted",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "trinket_reduce_activated_ability_cooldown",
				stat_buff = StatBuffIndex.ACTIVATED_COOLDOWN
			}
		}
	},
	trinket_not_consume_medpack_tier1 = {
		description = "trinket_not_consume_medpack_tier1_description",
		display_name = "trinket_not_consume_medpack_tier1",
		unique_id = "trinket_not_consume_medpack",
		icon = "trinket_not_consume_medpack_tier1",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.1,
				name = "not_consume_medpack",
				stat_buff = StatBuffIndex.NOT_CONSUME_MEDPACK
			}
		}
	},
	trinket_not_consume_medpack_tier2 = {
		description = "trinket_not_consume_medpack_tier2_description",
		display_name = "trinket_not_consume_medpack_tier2",
		unique_id = "trinket_not_consume_medpack",
		icon = "trinket_not_consume_medpack_tier2",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.15,
				name = "not_consume_medpack",
				stat_buff = StatBuffIndex.NOT_CONSUME_MEDPACK
			}
		}
	},
	trinket_not_consume_medpack_tier3 = {
		description = "trinket_not_consume_medpack_tier3_description",
		display_name = "trinket_not_consume_medpack_tier3",
		unique_id = "trinket_not_consume_medpack",
		icon = "trinket_not_consume_medpack_tier3",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.2,
				name = "not_consume_medpack",
				stat_buff = StatBuffIndex.NOT_CONSUME_MEDPACK
			}
		}
	},
	trinket_not_consume_potion_tier1 = {
		description = "trinket_not_consume_potion_tier1_description",
		display_name = "trinket_not_consume_potion_tier1",
		unique_id = "trinket_not_consume_potion",
		icon = "trinket_not_consume_potion_tier1",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.15,
				name = "not_consume_potion",
				stat_buff = StatBuffIndex.NOT_CONSUME_POTION
			}
		}
	},
	trinket_not_consume_potion_tier2 = {
		description = "trinket_not_consume_potion_tier2_description",
		display_name = "trinket_not_consume_potion_tier2",
		unique_id = "trinket_not_consume_potion",
		icon = "trinket_not_consume_potion_tier2",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.2,
				name = "not_consume_potion",
				stat_buff = StatBuffIndex.NOT_CONSUME_POTION
			}
		}
	},
	trinket_not_consume_potion_tier3 = {
		description = "trinket_not_consume_potion_tier3_description",
		display_name = "trinket_not_consume_potion_tier3",
		unique_id = "trinket_not_consume_potion",
		icon = "trinket_not_consume_potion_tier3",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.25,
				name = "not_consume_potion",
				stat_buff = StatBuffIndex.NOT_CONSUME_POTION
			}
		}
	},
	trinket_not_consume_grenade_tier1 = {
		description = "trinket_not_consume_grenade_tier1_description",
		display_name = "trinket_not_consume_grenade_tier1",
		unique_id = "trinket_not_consume_grenade",
		icon = "trinket_not_consume_grenade_tier1",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.15,
				name = "not_consume_grenade",
				stat_buff = StatBuffIndex.NOT_CONSUME_GRENADE
			}
		}
	},
	trinket_not_consume_grenade_tier2 = {
		description = "trinket_not_consume_grenade_tier2_description",
		display_name = "trinket_not_consume_grenade_tier2",
		unique_id = "trinket_not_consume_grenade",
		icon = "trinket_not_consume_grenade_tier2",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.2,
				name = "not_consume_grenade",
				stat_buff = StatBuffIndex.NOT_CONSUME_GRENADE
			}
		}
	},
	trinket_not_consume_grenade_tier3 = {
		description = "trinket_not_consume_grenade_tier3_description",
		display_name = "trinket_not_consume_grenade_tier3",
		unique_id = "trinket_not_consume_grenade",
		icon = "trinket_not_consume_grenade_tier3",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.25,
				name = "not_consume_grenade",
				stat_buff = StatBuffIndex.NOT_CONSUME_GRENADE
			}
		}
	},
	trinket_no_interruption_revive = {
		description = "trinket_no_interruption_revive_description",
		display_name = "trinket_no_interruption_revive",
		unique_id = "trinket_no_interruption_revive",
		icon = "trinket_no_interruption_revive_tier1",
		buffs = {
			{
				name = "no_interruption_revive"
			}
		}
	},
	trinket_no_interruption_bandage = {
		description = "trinket_no_interruption_bandage_description",
		display_name = "trinket_no_interruption_bandage",
		unique_id = "trinket_no_interruption_bandage",
		icon = "trinket_no_interruption_bandage_tier1",
		buffs = {
			{
				name = "no_interruption_bandage"
			}
		}
	},
	trinket_protection_poison_wind_tier1 = {
		description = "trinket_protection_poison_wind_tier1_description",
		display_name = "trinket_protection_poison_wind_tier1",
		unique_id = "trinket_protection_poison_wind",
		icon = "trinket_protection_poison_wind_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_poison_wind",
				stat_buff = StatBuffIndex.PROTECTION_POISON_WIND
			}
		}
	},
	trinket_protection_poison_wind_tier2 = {
		description = "trinket_protection_poison_wind_tier2_description",
		display_name = "trinket_protection_poison_wind_tier2",
		unique_id = "trinket_protection_poison_wind",
		icon = "trinket_protection_poison_wind_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_poison_wind",
				stat_buff = StatBuffIndex.PROTECTION_POISON_WIND
			}
		}
	},
	trinket_protection_poison_wind_tier3 = {
		description = "trinket_protection_poison_wind_tier3_description",
		display_name = "trinket_protection_poison_wind_tier3",
		unique_id = "trinket_protection_poison_wind",
		icon = "trinket_protection_poison_wind_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_poison_wind",
				stat_buff = StatBuffIndex.PROTECTION_POISON_WIND
			}
		}
	},
	trinket_protection_gutter_runner_tier1 = {
		description = "trinket_protection_gutter_runner_tier1_description",
		display_name = "trinket_protection_gutter_runner_tier1",
		unique_id = "trinket_protection_gutter_runner",
		icon = "trinket_protection_gutter_runner_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_gutter_runner",
				stat_buff = StatBuffIndex.PROTECTION_GUTTER_RUNNER
			}
		}
	},
	trinket_protection_gutter_runner_tier2 = {
		description = "trinket_protection_gutter_runner_tier2_description",
		display_name = "trinket_protection_gutter_runner_tier2",
		unique_id = "trinket_protection_gutter_runner",
		icon = "trinket_protection_gutter_runner_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_gutter_runner",
				stat_buff = StatBuffIndex.PROTECTION_GUTTER_RUNNER
			}
		}
	},
	trinket_protection_gutter_runner_tier3 = {
		description = "trinket_protection_gutter_runner_tier3_description",
		display_name = "trinket_protection_gutter_runner_tier3",
		unique_id = "trinket_protection_gutter_runner",
		icon = "trinket_protection_gutter_runner_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_gutter_runner",
				stat_buff = StatBuffIndex.PROTECTION_GUTTER_RUNNER
			}
		}
	},
	trinket_protection_ratling_gunner_tier1 = {
		description = "trinket_protection_ratling_gunner_tier1_description",
		display_name = "trinket_protection_ratling_gunner_tier1",
		unique_id = "trinket_protection_ratling_gunner",
		icon = "trinket_protection_ratling_gunner_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_ratling_gunner",
				stat_buff = StatBuffIndex.PROTECTION_RATLING_GUNNER
			}
		}
	},
	trinket_protection_ratling_gunner_tier2 = {
		description = "trinket_protection_ratling_gunner_tier2_description",
		display_name = "trinket_protection_ratling_gunner_tier2",
		unique_id = "trinket_protection_ratling_gunner",
		icon = "trinket_protection_ratling_gunner_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_ratling_gunner",
				stat_buff = StatBuffIndex.PROTECTION_RATLING_GUNNER
			}
		}
	},
	trinket_protection_ratling_gunner_tier3 = {
		description = "trinket_protection_ratling_gunner_tier3_description",
		display_name = "trinket_protection_ratling_gunner_tier3",
		unique_id = "trinket_protection_ratling_gunner",
		icon = "trinket_protection_ratling_gunner_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_ratling_gunner",
				stat_buff = StatBuffIndex.PROTECTION_RATLING_GUNNER
			}
		}
	},
	trinket_protection_pack_master_tier1 = {
		description = "trinket_protection_pack_master_tier1_description",
		display_name = "trinket_protection_pack_master_tier1",
		unique_id = "trinket_protection_pack_master",
		icon = "trinket_protection_pack_master_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_pack_master",
				stat_buff = StatBuffIndex.PROTECTION_PACK_MASTER
			}
		}
	},
	trinket_protection_pack_master_tier2 = {
		description = "trinket_protection_pack_master_tier2_description",
		display_name = "trinket_protection_pack_master_tier2",
		unique_id = "trinket_protection_pack_master",
		icon = "trinket_protection_pack_master_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_pack_master",
				stat_buff = StatBuffIndex.PROTECTION_PACK_MASTER
			}
		}
	},
	trinket_protection_pack_master_tier3 = {
		description = "trinket_protection_pack_master_tier3_description",
		display_name = "trinket_protection_pack_master_tier3",
		unique_id = "trinket_protection_pack_master",
		icon = "trinket_protection_pack_master_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_pack_master",
				stat_buff = StatBuffIndex.PROTECTION_PACK_MASTER
			}
		}
	},
	trinket_potion_spread_area_tier1 = {
		description = "trinket_potion_spread_area_tier1_description",
		display_name = "trinket_potion_spread_area_tier1",
		unique_id = "trinket_potion_spread_area",
		icon = "trinket_potion_spread_area_tier1",
		description_values = {
			"distance"
		},
		buffs = {
			{
				name = "potion_spread_area_tier1",
				distance = TrinketSpreadDistance
			}
		}
	},
	trinket_potion_spread_area_tier2 = {
		description = "trinket_potion_spread_area_tier2_description",
		display_name = "trinket_potion_spread_area_tier2",
		unique_id = "trinket_potion_spread_area",
		icon = "trinket_potion_spread_area_tier2",
		description_values = {
			"distance"
		},
		buffs = {
			{
				name = "potion_spread_area_tier2",
				distance = TrinketSpreadDistance
			}
		}
	},
	trinket_potion_spread_area_tier3 = {
		description = "trinket_potion_spread_area_tier3_description",
		display_name = "trinket_potion_spread_area_tier3",
		unique_id = "trinket_potion_spread_area",
		icon = "trinket_potion_spread_area_tier3",
		description_values = {
			"distance"
		},
		buffs = {
			{
				name = "potion_spread_area_tier3",
				distance = TrinketSpreadDistance
			}
		}
	},
	trinket_faster_revive_promo = {
		description = "trinket_faster_revive_tier1_description",
		display_name = "trinket_faster_revive_tier1",
		unique_id = "trinket_faster_revive",
		icon = "trinket_faster_revive_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.15,
				name = "faster_revive",
				stat_buff = StatBuffIndex.FASTER_REVIVE
			}
		}
	},
	trinket_faster_revive_tier1 = {
		description = "trinket_faster_revive_tier1_description",
		display_name = "trinket_faster_revive_tier1",
		unique_id = "trinket_faster_revive",
		icon = "trinket_faster_revive_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.3,
				name = "faster_revive",
				stat_buff = StatBuffIndex.FASTER_REVIVE
			}
		}
	},
	trinket_faster_revive_tier2 = {
		description = "trinket_faster_revive_tier2_description",
		display_name = "trinket_faster_revive_tier2",
		unique_id = "trinket_faster_revive",
		icon = "trinket_faster_revive_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "faster_revive",
				stat_buff = StatBuffIndex.FASTER_REVIVE
			}
		}
	},
	trinket_faster_revive_tier3 = {
		description = "trinket_faster_revive_tier3_description",
		display_name = "trinket_faster_revive_tier3",
		unique_id = "trinket_faster_revive",
		icon = "trinket_faster_revive_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "faster_revive",
				stat_buff = StatBuffIndex.FASTER_REVIVE
			}
		}
	},
	trinket_increase_luck_promo = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		unique_id = "trinket_increase_luck",
		icon = "trinket_increase_luck_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.1,
				name = "increase_luck",
				stat_buff = StatBuffIndex.INCREASE_LUCK
			}
		}
	},
	trinket_increase_luck_tier1 = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		unique_id = "trinket_increase_luck",
		icon = "trinket_increase_luck_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.25,
				name = "increase_luck",
				stat_buff = StatBuffIndex.INCREASE_LUCK
			}
		}
	},
	trinket_increase_luck_tier2 = {
		description = "trinket_increase_luck_tier2_description",
		display_name = "trinket_increase_luck_tier2",
		unique_id = "trinket_increase_luck",
		icon = "trinket_increase_luck_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.5,
				name = "increase_luck",
				stat_buff = StatBuffIndex.INCREASE_LUCK
			}
		}
	},
	trinket_increase_luck_tier3 = {
		description = "trinket_increase_luck_tier3_description",
		display_name = "trinket_increase_luck_tier3",
		unique_id = "trinket_increase_luck",
		icon = "trinket_increase_luck_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 1,
				name = "increase_luck",
				stat_buff = StatBuffIndex.INCREASE_LUCK
			}
		}
	},
	trinket_hp_increase_kd_tier1 = {
		description = "trinket_hp_increase_kd_tier1_description",
		display_name = "trinket_hp_increase_kd_tier1",
		unique_id = "trinket_hp_increase_kd",
		icon = "trinket_hp_increase_kd_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "hp_increase_kd",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN_KD
			}
		}
	},
	trinket_hp_increase_kd_tier2 = {
		description = "trinket_hp_increase_kd_tier2_description",
		display_name = "trinket_hp_increase_kd_tier2",
		unique_id = "trinket_hp_increase_kd",
		icon = "trinket_hp_increase_kd_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.3,
				name = "hp_increase_kd",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN_KD
			}
		}
	},
	trinket_hp_increase_kd_tier3 = {
		description = "trinket_hp_increase_kd_tier3_description",
		display_name = "trinket_hp_increase_kd_tier3",
		unique_id = "trinket_hp_increase_kd",
		icon = "trinket_hp_increase_kd_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "hp_increase_kd",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN_KD
			}
		}
	},
	trinket_increased_movement_speed_tier1 = {
		description = "trinket_increased_movement_speed_tier1_description",
		display_name = "trinket_increased_movement_speed_tier1",
		unique_id = "trinket_increased_movement_speed",
		icon = "trinket_increased_movement_speed_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				name = "movement_speed",
				multiplier = 1.02,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	trinket_increased_movement_speed_tier2 = {
		description = "trinket_increased_movement_speed_tier2_description",
		display_name = "trinket_increased_movement_speed_tier2",
		unique_id = "trinket_increased_movement_speed",
		icon = "trinket_increased_movement_speed_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				name = "movement_speed",
				multiplier = 1.04,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	trinket_increased_movement_speed_tier3 = {
		description = "trinket_increased_movement_speed_tier3_description",
		display_name = "trinket_increased_movement_speed_tier3",
		unique_id = "trinket_increased_movement_speed",
		icon = "trinket_increased_movement_speed_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				name = "movement_speed",
				multiplier = 1.06,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	trinket_reduce_grimoire_penalty = {
		description = "trinket_reduce_grimoire_penalty_description",
		display_name = "trinket_reduce_grimoire_penalty",
		unique_id = "trinket_reduce_grimoire_penalty",
		icon = "trinket_reduce_grimoire_penalty_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.33,
				name = "curse_protection",
				stat_buff = StatBuffIndex.CURSE_PROTECTION
			}
		}
	},
	trinket_grenade_radius_tier1 = {
		description = "trinket_grenade_radius_tier1_description",
		display_name = "trinket_grenade_radius_tier1",
		unique_id = "trinket_grenade_radius",
		icon = "trinket_grenade_radius_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.4,
				name = "grenade_radius",
				stat_buff = StatBuffIndex.GRENADE_RADIUS
			}
		}
	},
	trinket_grenade_radius_tier2 = {
		description = "trinket_grenade_radius_tier2_description",
		display_name = "trinket_grenade_radius_tier2",
		unique_id = "trinket_grenade_radius",
		icon = "trinket_grenade_radius_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.5,
				name = "grenade_radius",
				stat_buff = StatBuffIndex.GRENADE_RADIUS
			}
		}
	},
	trinket_grenade_radius_tier3 = {
		description = "trinket_grenade_radius_tier3_description",
		display_name = "trinket_grenade_radius_tier3",
		unique_id = "trinket_grenade_radius",
		icon = "trinket_grenade_radius_tier3",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.6,
				name = "grenade_radius",
				stat_buff = StatBuffIndex.GRENADE_RADIUS
			}
		}
	},
	trinket_faster_respawn_tier1 = {
		description = "trinket_faster_respawn_tier1_description",
		display_name = "trinket_faster_respawn_tier1",
		unique_id = "trinket_faster_respawn",
		icon = "trinket_faster_respawn_tier1",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.25,
				name = "faster_respawn",
				stat_buff = StatBuffIndex.FASTER_RESPAWN
			}
		}
	},
	trinket_faster_respawn_tier2 = {
		description = "trinket_faster_respawn_tier2_description",
		display_name = "trinket_faster_respawn_tier2",
		unique_id = "trinket_faster_respawn",
		icon = "trinket_faster_respawn_tier2",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "faster_respawn",
				stat_buff = StatBuffIndex.FASTER_RESPAWN
			}
		}
	},
	trinket_not_consume_pickup_tier1 = {
		description = "trinket_not_consume_pickup_tier1_description",
		display_name = "trinket_not_consume_pickup_tier1",
		unique_id = "trinket_not_consume_pickup",
		icon = "trinket_not_consume_pickup_tier1",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.04,
				name = "not_consume_pickup",
				stat_buff = StatBuffIndex.NOT_CONSUME_PICKUP
			}
		}
	},
	trinket_not_consume_pickup_tier2 = {
		description = "trinket_not_consume_pickup_tier2_description",
		display_name = "trinket_not_consume_pickup_tier2",
		unique_id = "trinket_not_consume_pickup",
		icon = "trinket_not_consume_pickup_tier2",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.08,
				name = "not_consume_pickup",
				stat_buff = StatBuffIndex.NOT_CONSUME_PICKUP
			}
		}
	},
	trinket_not_consume_pickup_tier3 = {
		description = "trinket_not_consume_pickup_tier3_description",
		display_name = "trinket_not_consume_pickup_tier3",
		unique_id = "trinket_not_consume_pickup",
		icon = "trinket_not_consume_pickup_tier3",
		description_values = {
			"proc_chance"
		},
		buffs = {
			{
				proc_chance = 0.12,
				name = "not_consume_pickup",
				stat_buff = StatBuffIndex.NOT_CONSUME_PICKUP
			}
		}
	},
	trinket_shared_damage = {
		description = "trinket_shared_damage_description",
		display_name = "trinket_shared_damage",
		unique_id = "trinket_shared_damage",
		icon = "trinket_shared_damage_tier3",
		buffs = {
			{
				name = "shared_health_pool"
			}
		}
	},
	trinket_roll_dice_as_witch_hunter = {
		description = "dlc1_1_trinket_roll_dice_as_witch_hunter_description",
		display_name = "dlc1_1_trinket_roll_dice_as_witch_hunter",
		unique_id = "trinket_roll_dice_as_hero",
		icon = "trait_icon_loot_trinket_witch_hunter",
		roll_dice_as_hero = "witch_hunter",
		buffs = {}
	},
	trinket_roll_dice_as_bright_wizard = {
		description = "dlc1_1_trinket_roll_dice_as_bright_wizard_description",
		display_name = "dlc1_1_trinket_roll_dice_as_bright_wizard",
		unique_id = "trinket_roll_dice_as_hero",
		icon = "trait_icon_loot_trinket_bright_wizard",
		roll_dice_as_hero = "bright_wizard",
		buffs = {}
	},
	trinket_roll_dice_as_dwarf_ranger = {
		description = "dlc1_1_trinket_roll_dice_as_dwarf_ranger_description",
		display_name = "dlc1_1_trinket_roll_dice_as_dwarf_ranger",
		unique_id = "trinket_roll_dice_as_hero",
		icon = "trait_icon_loot_trinket_dwarf_ranger",
		roll_dice_as_hero = "dwarf_ranger",
		buffs = {}
	},
	trinket_roll_dice_as_wood_elf = {
		description = "dlc1_1_trinket_roll_dice_as_wood_elf_description",
		display_name = "dlc1_1_trinket_roll_dice_as_wood_elf",
		unique_id = "trinket_roll_dice_as_hero",
		icon = "trait_icon_loot_trinket_waywatcher",
		roll_dice_as_hero = "wood_elf",
		buffs = {}
	},
	trinket_roll_dice_as_empire_soldier = {
		description = "dlc1_1_trinket_roll_dice_as_empire_soldier_description",
		display_name = "dlc1_1_trinket_roll_dice_as_empire_soldier",
		unique_id = "trinket_roll_dice_as_hero",
		icon = "trait_icon_loot_trinket_empire_soldier",
		roll_dice_as_hero = "empire_soldier",
		buffs = {}
	},
	trinket_increase_luck_halloween = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		unique_id = "trinket_increase_luck",
		icon = "trinket_increase_luck_halloween",
		description_values = {
			"multiplier"
		},
		buffs = {
			{
				multiplier = 0.91,
				name = "increase_luck",
				stat_buff = StatBuffIndex.INCREASE_LUCK
			}
		}
	},
	warpfire_thrower_ground_base = {
		buffs = {
			{
				refresh_durations = true,
				name = "stormfiend_warpfire_ground",
				remove_buff_func = "remove_moving_through_warpfire",
				apply_buff_func = "apply_moving_through_warpfire",
				time_between_dot_damages = 0.75,
				damage_type = "warpfire_ground",
				max_stacks = 1,
				update_func = "update_moving_through_warpfire",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						5.5,
						1
					},
					normal = {
						1,
						1,
						0,
						6.5,
						1
					},
					hard = {
						1,
						1,
						0,
						7.5,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						7,
						1
					},
					harder = {
						1,
						1,
						0,
						8.5,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						8,
						1
					},
					hardest = {
						1,
						1,
						0,
						9.5,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						9,
						1
					}
				}
			}
		}
	},
	warpfire_thrower_face_base = {
		buffs = {
			{
				slowdown_buff_name = "warpfire_thrower_fire_slowdown",
				name = "warpfire_thrower_base",
				update_func = "update_warpfirethrower_in_face",
				dormant = true,
				damage_type = "warpfire_ground",
				remove_buff_func = "remove_warpfirethrower_in_face",
				apply_buff_func = "apply_warpfirethrower_in_face",
				fatigue_type = "warpfire_ground",
				push_speed = 15,
				time_between_dot_damages = 0.75,
				duration = 0.3,
				debuff = true,
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				difficulty_damage = {
					easy = {
						2,
						1,
						0,
						5.5,
						1
					},
					normal = {
						2,
						1,
						0,
						6.5,
						1
					},
					hard = {
						3,
						2,
						0,
						7.5,
						2
					},
					survival_hard = {
						3,
						2,
						0,
						7,
						2
					},
					harder = {
						4,
						3,
						0,
						8.5,
						3
					},
					survival_harder = {
						4,
						3,
						0,
						8,
						3
					},
					hardest = {
						5,
						4,
						0,
						9.5,
						4
					},
					survival_hardest = {
						5,
						4,
						0,
						9,
						4
					}
				}
			}
		}
	},
	warpfire_thrower_fire_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_crouch_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_walk_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_bile_troll",
				multiplier = 0.6,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed_bile_troll",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance_bile_troll",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	plague_wave_ground_base = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_vomit",
				name = "troll_bile_ground",
				update_func = "update_moving_through_vomit",
				dormant = true,
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_vomit",
				fatigue_type = "vomit_ground",
				time_between_dot_damages = 0.75,
				damage_type = "vomit_ground",
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1
					},
					normal = {
						1,
						1,
						0,
						1,
						1
					},
					hard = {
						1,
						1,
						0,
						1,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						2,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						4,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			}
		}
	},
	plague_wave_ground_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_crouch_speed_plague_wavel",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_walk_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_plague_wave",
				multiplier = 0.6,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed_plague_wave",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance_plague_wave",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	bile_troll_vomit_ground_base = {
		buffs = {
			{
				slowdown_buff_name = "bile_troll_vomit_ground_slowdown",
				name = "troll_bile_ground",
				update_func = "update_moving_through_vomit",
				dormant = true,
				damage_type = "vomit_ground",
				remove_buff_func = "remove_moving_through_vomit",
				apply_buff_func = "apply_moving_through_vomit",
				fatigue_type = "vomit_ground",
				refresh_durations = true,
				time_between_dot_damages = 0.75,
				debuff = true,
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1
					},
					normal = {
						1,
						1,
						0,
						1,
						1
					},
					hard = {
						1,
						1,
						0,
						1,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						2,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						4,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			}
		}
	},
	bile_troll_vomit_ground_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_crouch_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_walk_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 1,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_bile_troll",
				multiplier = 0.75,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed_bile_troll",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance_bile_troll",
				multiplier = 0.8,
				duration = 1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	plague_wave_face_base = {
		buffs = {
			{
				slowdown_buff_name = "plague_wave_face_slowdown",
				name = "plague_wave_face",
				update_func = "update_vomit_in_face",
				dormant = true,
				fatigue_type = "vomit_face",
				remove_buff_func = "remove_plague_wave_in_face",
				apply_buff_func = "apply_plague_wave_in_face",
				duration = 3.5,
				time_between_dot_damages = 0.65,
				refresh_durations = true,
				damage_type = "plague_face",
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				push_speed = 6,
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1
					},
					normal = {
						1,
						1,
						0,
						2,
						1
					},
					hard = {
						1,
						1,
						0,
						3,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						4,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						6,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			},
			{
				name = "decrease_jump_speed",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	vermintide_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_vermintide_in_face",
				name = "plague_wave_face",
				update_func = "update_vermintide_in_face",
				dormant = true,
				remove_buff_func = "remove_vermintide_in_face",
				fatigue_type = "vomit_face",
				duration = 3.5,
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "plague_face",
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				push_speed = 15,
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1
					},
					normal = {
						1,
						1,
						0,
						1,
						1
					},
					hard = {
						1,
						1,
						0,
						1,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						2,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						4,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			},
			{
				name = "decrease_jump_speed",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance",
				multiplier = 0.7,
				duration = 3.5,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	bile_troll_vomit_face_base = {
		buffs = {
			{
				slowdown_buff_name = "bile_troll_vomit_face_slowdown",
				name = "troll_bile_face",
				update_func = "update_vomit_in_face",
				dormant = true,
				damage_type = "vomit_face",
				remove_buff_func = "remove_vomit_in_face",
				apply_buff_func = "apply_vomit_in_face",
				fatigue_type = "vomit_face",
				time_between_dot_damages = 0.65,
				duration = 5,
				debuff = true,
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				refresh_durations = true,
				push_speed = 6,
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1
					},
					normal = {
						1,
						1,
						0,
						1,
						1
					},
					hard = {
						1,
						1,
						0,
						1,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						2,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						4,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			},
			{
				name = "decrease_jump_speed",
				multiplier = 0.3,
				duration = 7,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed",
				multiplier = 0.3,
				duration = 7,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance",
				multiplier = 0.3,
				duration = 7,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	bile_troll_vomit_face_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.3,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	plague_wave_face_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.8,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.8,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.8,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	vortex_base = {
		buffs = {
			{
				slowdown_buff_name = "vortex_slowdown",
				name = "vortex",
				update_func = "update_vortex",
				dormant = true,
				fatigue_type = "vomit_face",
				remove_buff_func = "remove_vortex",
				apply_buff_func = "apply_vortex",
				duration = 2,
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "vomit_face",
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						2,
						1
					},
					normal = {
						1,
						1,
						0,
						3,
						1
					},
					hard = {
						1,
						1,
						0,
						5,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						1,
						1
					},
					harder = {
						1,
						1,
						0,
						8,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						2,
						1
					},
					hardest = {
						1,
						1,
						0,
						16,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						4,
						1
					}
				}
			},
			{
				name = "decrease_jump_speed",
				multiplier = 0.8,
				duration = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed",
				multiplier = 0.8,
				duration = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance",
				multiplier = 0.8,
				duration = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	vortex_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.9,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.9,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.9,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 0.5,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			}
		}
	},
	stormfiend_warpfire_ground_base = {
		buffs = {
			{
				refresh_durations = true,
				name = "stormfiend_warpfire_ground",
				remove_buff_func = "remove_moving_through_warpfire",
				apply_buff_func = "apply_moving_through_warpfire",
				time_between_dot_damages = 0.75,
				damage_type = "warpfire_ground",
				max_stacks = 1,
				update_func = "update_moving_through_warpfire",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						1.5,
						1
					},
					normal = {
						1,
						1,
						0,
						2.5,
						1
					},
					hard = {
						1,
						1,
						0,
						2.5,
						1
					},
					survival_hard = {
						1,
						1,
						0,
						2.5,
						1
					},
					harder = {
						1,
						1,
						0,
						4.5,
						1
					},
					survival_harder = {
						1,
						1,
						0,
						4.5,
						1
					},
					hardest = {
						1,
						1,
						0,
						8.5,
						1
					},
					survival_hardest = {
						1,
						1,
						0,
						8.5,
						1
					}
				}
			}
		}
	},
	stormfiend_warpfire_face_base = {
		buffs = {
			{
				name = "stormfiend_warpfire_face",
				update_func = "update_warpfire_in_face",
				refresh_durations = true,
				remove_buff_func = "remove_warpfire_in_face",
				apply_buff_func = "apply_warpfire_in_face",
				time_between_dot_damages = 0.65,
				damage_type = "warpfire_face",
				max_stacks = 1,
				duration = 5,
				push_speed = 10,
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						2,
						1
					},
					normal = {
						3,
						2,
						0,
						3,
						2
					},
					hard = {
						4,
						2,
						0,
						3,
						2
					},
					survival_hard = {
						4,
						2,
						0,
						3,
						2
					},
					harder = {
						5,
						3,
						0,
						5,
						3
					},
					survival_harder = {
						5,
						3,
						0,
						5,
						3
					},
					hardest = {
						6,
						4,
						0,
						9,
						4
					},
					survival_hardest = {
						6,
						4,
						0,
						9,
						1
					}
				}
			}
		}
	},
	increase_damage_recieved_while_burning = {
		buffs = {
			{
				multiplier = 0.5,
				name = "increase_damage_recieved_while_burning",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	chaos_zombie_explosion = {
		buffs = {
			{
				refresh_durations = false,
				name = "chaos_zombie_explosion",
				update_func = "update_chaos_zombie_explosion_in_face",
				multiplier = 0.1,
				remove_buff_func = "remove_chaos_zombie_explosion_in_face",
				apply_buff_func = "apply_chaos_zombie_explosion_in_face",
				fatigue_type = "vomit_face",
				damage_type = "vomit_face",
				max_stacks = 5,
				duration = 5,
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	ring_attackspeed_0001_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.03,
				apply_on = "equip",
				name = "ring_attackspeed_0001_buff",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	ring_attackspeed_0002_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.05,
				apply_on = "equip",
				name = "ring_attackspeed_0002_buff",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	ring_attackspeed_0003_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.07,
				apply_on = "equip",
				name = "ring_attackspeed_0003_buff",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	necklace_stamina_0001_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0001_buff",
				apply_on = "equip",
				bonus = 1,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	necklace_stamina_0002_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0002_buff",
				apply_on = "equip",
				bonus = 2,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	necklace_stamina_0003_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0003_buff",
				apply_on = "equip",
				bonus = 4,
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	necklace_health_0001_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.1,
				apply_on = "equip",
				name = "necklace_health_0001_buff",
				stat_buff = StatBuffIndex.MAX_HEALTH
			}
		}
	},
	necklace_health_0002_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.15,
				apply_on = "equip",
				name = "necklace_health_0002_buff",
				stat_buff = StatBuffIndex.MAX_HEALTH
			}
		}
	},
	necklace_health_0003_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.25,
				apply_on = "equip",
				name = "necklace_health_0003_buff",
				stat_buff = StatBuffIndex.MAX_HEALTH
			}
		}
	},
	weapon_trait_uninterruptible = {
		buffs = {
			{
				perk = "uninterruptible"
			}
		}
	},
	weapon_trait_riposte = {
		buffs = {
			{
				perk = "uninterruptible"
			}
		}
	},
	weapon_trait_backstab = {
		buffs = {
			{
				multiplier = 0.5,
				stat_buff = StatBuffIndex.BACKSTAB_MULTIPLIER
			}
		}
	},
	weapon_trait_bloodlust = {
		buffs = {
			{
				name = "weapon_trait_bloodlust",
				event_buff = true,
				event = "on_kill",
				bonus = 1,
				buff_func = ProcFunctions.heal
			}
		}
	},
	weapon_trait_improved_push = {
		buffs = {
			{
				name = "push_increase"
			}
		}
	},
	weapon_trait_scavenge = {
		buffs = {
			{
				event = "on_hit",
				bonus = 1,
				event_buff = true,
				buff_func = ProcFunctions.replenish_ammo_on_headshot_ranged
			},
			{
				multiplier = -0.5,
				stat_buff = StatBuffIndex.TOTAL_AMMO
			}
		}
	}
}

require("scripts/unit_extensions/default_player_unit/buffs/talent_buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_utils")
require("scripts/managers/talents/talent_settings")
require("scripts/settings/equipment/weapon_properties")
require("scripts/settings/equipment/weapon_traits")
table.merge_recursive(BuffTemplates, OldTalentBuffTemplates)

for hero_name, buffs in pairs(TalentBuffTemplates) do
	table.merge_recursive(BuffTemplates, buffs)
end

table.merge_recursive(BuffTemplates, WeaponProperties.buff_templates)
table.merge_recursive(BuffTemplates, WeaponTraits.buff_templates)

local override_descriptions = {
	proc_chance = true
}

for buff_name, buff_template in pairs(BuffTemplates) do
	if buff_template then
		local description_values = buff_template.description_values

		if description_values then
			for i = 1, #description_values, 1 do
				local buff = buff_template.buffs[1]
				local key = description_values[i]
				local value = buff[key]
				local melee_weapon = string.find(buff_name, "melee_weapon_")
				local ranged_weapon = string.find(buff_name, "ranged_weapon_")

				if override_descriptions[key] and (melee_weapon or ranged_weapon) then
					description_values[i] = key
				elseif value then
					if key == "multiplier" or key == "proc_chance" then
						if key == "multiplier" and not buff.stat_buff then
							value = value - 1
						end

						value = math.abs(value * 100)
					elseif key == "bonus" and value < 0 then
						value = value * -1
					end

					description_values[i] = value
				else
					local proc_key = buff.proc

					assert(proc_key, "There is no buff value by name: %s on buff: %s", key, buff_name)

					local proc_value = BuffTemplates[proc_key].buffs[1][key]

					assert(proc_value, "There is no buff value by name: %s on buff %s for proc buff: %s.", key, buff_name, proc_key)

					description_values[i] = proc_value
				end
			end
		end
	end
end

return 
