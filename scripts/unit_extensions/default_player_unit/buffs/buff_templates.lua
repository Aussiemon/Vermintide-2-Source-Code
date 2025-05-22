-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/buff_templates.lua

require("scripts/utils/strict_table")
require("scripts/settings/player_unit_damage_settings")
require("scripts/settings/equipment/weapons")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

MeleeBuffTypes = {}
MeleeBuffTypes.MELEE_1H = true
MeleeBuffTypes.MELEE_2H = true
RangedBuffTypes = {}
RangedBuffTypes.RANGED = true
RangedBuffTypes.RANGED_ABILITY = true
AttackTypes = table.enum("light_attack", "heavy_attack", "action_push", "projectile", "instant_projectile", "heavy_instant_projectile", "grenade")
MeleeAttackTypes = {
	[AttackTypes.light_attack] = true,
	[AttackTypes.heavy_attack] = true,
}
RangedAttackTypes = {
	[AttackTypes.projectile] = true,
	[AttackTypes.instant_projectile] = true,
	[AttackTypes.heavy_instant_projectile] = true,
	[AttackTypes.grenade] = true,
}
StatBuffApplicationMethods = {
	activated_cooldown = "stacking_multiplier",
	ammo_used_multiplier = "stacking_multiplier",
	applied_stagger_distance = "stacking_multiplier",
	attack_intensity_decay = "stacking_multiplier",
	attack_intensity_reset = "stacking_multiplier",
	attack_intensity_threshold = "stacking_multiplier",
	attack_speed = "stacking_multiplier",
	attack_speed_drakefire = "stacking_multiplier",
	attack_speed_melee = "stacking_multiplier",
	backstab_multiplier = "stacking_bonus",
	block_angle = "stacking_multiplier",
	block_cost = "stacking_multiplier",
	clip_size = "stacking_multiplier",
	cooldown_regen = "stacking_multiplier",
	coop_stamina = "proc",
	counter_push_power = "stacking_multiplier",
	critical_strike_chance = "stacking_bonus",
	critical_strike_chance_heavy = "stacking_bonus",
	critical_strike_chance_melee = "stacking_bonus",
	critical_strike_chance_ranged = "stacking_bonus",
	critical_strike_effectiveness = "stacking_multiplier",
	curse_protection = "stacking_multiplier",
	damage_dealt = "stacking_multiplier",
	damage_taken = "stacking_multiplier_multiplicative",
	damage_taken_burning_enemy = "stacking_multiplier",
	damage_taken_elites = "stacking_multiplier",
	damage_taken_kd = "stacking_multiplier",
	damage_taken_melee = "stacking_multiplier",
	damage_taken_ranged = "stacking_multiplier",
	damage_taken_to_overcharge = "stacking_multiplier",
	debuff_armoured = "stacking_bonus",
	deus_coins_greed = "stacking_multiplier",
	dummy_stagger = "stacking_bonus",
	explosion_damage = "stacking_multiplier",
	explosion_radius = "stacking_multiplier",
	extra_ability_charges = "stacking_bonus",
	extra_shot = "stacking_bonus",
	extra_wounds = "stacking_bonus",
	faster_respawn = "stacking_multiplier",
	faster_revive = "stacking_multiplier",
	fatigue_regen = "stacking_multiplier",
	first_melee_hit_damage = "stacking_multiplier",
	flat_power_level = "stacking_bonus",
	full_charge_boost = "stacking_multiplier",
	grenade_extra_shot = "stacking_bonus",
	grenade_radius = "stacking_multiplier",
	grenade_throw_range = "stacking_multiplier",
	grimoire_max_health = "stacking_multiplier",
	gromril_cooldown = "stacking_bonus",
	headshot_damage = "stacking_multiplier",
	headshot_multiplier = "stacking_multiplier",
	headshot_vulnerability = "stacking_multiplier",
	heal_self_on_heal_other = "proc",
	healing_received = "stacking_multiplier",
	health_curse = "stacking_bonus",
	hit_force = "stacking_multiplier",
	hit_mass_amount = "stacking_multiplier",
	hit_mass_reduction = "stacking_multiplier",
	impact_vulnerability = "stacking_multiplier",
	increase_luck = "stacking_multiplier",
	increased_balefire_dot_duration = "stacking_multiplier",
	increased_burn_dot_damage = "stacking_multiplier",
	increased_damage_to_balefire = "stacking_multiplier",
	increased_drone_count = "stacking_bonus",
	increased_max_targets = "stacking_bonus",
	increased_move_speed_while_aiming = "stacking_multiplier",
	increased_weapon_damage = "stacking_multiplier",
	increased_weapon_damage_heavy_attack = "stacking_multiplier",
	increased_weapon_damage_melee = "stacking_multiplier",
	increased_weapon_damage_melee_1h = "stacking_multiplier",
	increased_weapon_damage_melee_2h = "stacking_multiplier",
	increased_weapon_damage_poisoned_or_bleeding = "stacking_multiplier",
	increased_weapon_damage_ranged = "stacking_multiplier",
	increased_weapon_damage_ranged_to_wounded = "stacking_multiplier",
	life_essence = "stacking_multiplier",
	max_controlled_pets = "stacking_bonus_and_multiplier",
	max_damage_taken = "min",
	max_damage_taken_from_boss_or_elite = "min",
	max_fatigue = "stacking_bonus",
	max_health = "stacking_multiplier",
	max_health_alive = "stacking_multiplier",
	max_health_kd = "stacking_multiplier",
	max_overcharge = "stacking_multiplier",
	movement_speed = "stacking_multiplier",
	no_push_fatigue_cost = "proc",
	non_headshot_damage = "stacking_multiplier",
	not_consume_grenade = "proc",
	not_consume_medpack = "proc",
	not_consume_potion = "proc",
	outer_block_angle = "stacking_multiplier",
	overcharge_damage_immunity = "proc",
	overcharge_regen = "stacking_multiplier",
	pet_life_time = "stacking_multiplier",
	potion_duration = "stacking_multiplier",
	power_level = "stacking_multiplier",
	power_level_armoured = "stacking_multiplier",
	power_level_chaos = "stacking_multiplier",
	power_level_critical_strike = "stacking_multiplier",
	power_level_frenzy = "stacking_multiplier",
	power_level_impact = "stacking_multiplier",
	power_level_large = "stacking_multiplier",
	power_level_melee = "stacking_multiplier",
	power_level_melee_cleave = "stacking_multiplier",
	power_level_ranged = "stacking_multiplier",
	power_level_ranged_drakefire = "stacking_multiplier",
	power_level_skaven = "stacking_multiplier",
	power_level_super_armour = "stacking_multiplier",
	power_level_unarmoured = "stacking_multiplier",
	projectile_bounces = "stacking_bonus",
	protection_aoe = "stacking_multiplier",
	protection_chaos = "stacking_multiplier",
	protection_gutter_runner = "stacking_multiplier",
	protection_pack_master = "stacking_multiplier",
	protection_poison_wind = "stacking_multiplier",
	protection_ratling_gunner = "stacking_multiplier",
	protection_skaven = "stacking_multiplier",
	push_power = "stacking_multiplier",
	push_range = "stacking_bonus",
	ranged_additional_penetrations = "stacking_bonus",
	reduced_non_burn_damage = "stacking_multiplier",
	reduced_overcharge = "stacking_multiplier",
	reduced_overcharge_from_passive = "stacking_multiplier",
	reduced_ranged_charge_time = "stacking_multiplier",
	reduced_spread = "stacking_multiplier",
	reduced_spread_hit = "stacking_multiplier",
	reduced_spread_moving = "stacking_multiplier",
	reduced_spread_shot = "stacking_multiplier",
	reload_speed = "stacking_multiplier",
	shield_break_proc = "proc",
	shielding_player_by_assist = "proc",
	stagger_distance = "stacking_multiplier",
	stagger_resistance = "stacking_multiplier",
	stun_duration = "stacking_multiplier",
	throw_speed_increase = "stacking_multiplier",
	timed_block_cost = "stacking_multiplier",
	total_ammo = "stacking_multiplier",
	unbalanced_damage_dealt = "stacking_multiplier",
	unbalanced_damage_taken = "stacking_bonus",
	vent_damage = "stacking_multiplier",
	vent_speed = "stacking_multiplier",
}
WeaponSpecificStatBuffs = {}

local function add_stat_buff(weapon_type, stat_buff_name, application_method, buff_type)
	StatBuffApplicationMethods[stat_buff_name] = application_method
	WeaponSpecificStatBuffs[weapon_type] = WeaponSpecificStatBuffs[weapon_type] or {}
	WeaponSpecificStatBuffs[weapon_type][buff_type] = stat_buff_name
end

for _, template in pairs(Weapons) do
	local weapon_type = template.weapon_type

	if weapon_type and not WeaponSpecificStatBuffs[weapon_type] then
		local name = "increased_weapon_damage_" .. weapon_type

		add_stat_buff(weapon_type, name, "stacking_multiplier", "damage")
	end
end

ProcEvents = {
	"on_hit",
	"on_melee_hit",
	"on_ranged_hit",
	"on_kill",
	"on_kill_elite_special",
	"on_boss_killed",
	"on_special_killed",
	"on_elite_killed",
	"on_pingable_target_killed",
	"on_block_broken",
	"on_knocked_down",
	"on_ledge_hang_start",
	"on_player_disabled",
	"on_ally_knocked_down",
	"on_revived",
	"on_revived_ally",
	"on_healed",
	"on_healed_ally",
	"on_healed_consumeable",
	"on_assisted",
	"on_assisted_ally",
	"on_push",
	"on_damage_taken",
	"on_consumable_picked_up",
	"on_reload",
	"on_ammo_used",
	"on_overcharge_used",
	"on_overcharge_lost",
	"on_unwield",
	"on_critical_hit",
	"on_last_ammo_used",
	"on_ammo_clip_used",
	"on_gained_ammo_from_no_ammo",
	"on_player_damage_dealt",
	"on_stagger",
	"on_charge_ability_hit",
	"on_charge_ability_hit_blast",
	"on_bardin_consumable_picked_up_any_player",
	"on_dodge",
	"on_dodge_finished",
	"on_leap_start",
	"on_leap_finished",
	"on_pinged",
	"on_start_action",
	"on_full_charge_action",
	"on_enemy_ignited",
	"on_auto_headshot",
	"on_potion_consumed",
	"on_ability_activated",
	"on_dot_damage_dealt",
	"on_grenade_exploded",
	"on_barrel_exploded",
	"on_inventory_post_apply_buffs",
	"on_visible",
	"on_invisible",
	"on_body_pushed",
	"on_controlled_unit_added",
	"on_controlled_unit_removed",
	"on_controlled_unit_death",
	"on_boon_granted",
	"on_mutator_skull_picked_up",
	"on_death",
	"on_damage_dealt",
	"on_block",
	"on_push_used",
	"on_backstab",
	"on_sweep",
	"on_ranged_hit",
	"on_critical_sweep",
	"on_critical_shot",
	"on_critical_action",
	"on_non_critical_action",
	"on_spell_used",
	"on_grenade_use",
	"on_full_charge",
	"on_charge_finished",
	"on_ability_recharged",
	"on_ability_cooldown_started",
	"on_extra_ability_consumed",
	"on_crouch",
	"on_timed_block",
	"on_wield",
	"on_gromril_armour_removed",
	"on_broke_shield",
	"on_pet_spawned",
	"cursed_chest_running",
	"stagger_calculation_started",
	"stagger_calculation_ended",
	"damage_calculation_started",
	"damage_calculation_ended",
	"on_staggered",
	"minion_attack_used",
}

local function make_proc_param_lookup(...)
	local num_args = select("#", ...)
	local t = Script.new_map(num_args)

	for i = 1, num_args do
		local arg = select(i, ...)

		t[arg] = i
	end

	return t
end

ProcEventParams = {
	on_player_damage_dealt = make_proc_param_lookup("attacked_unit", "damage_amount", "hit_zone_name", "no_crit_headshot_damage", "is_critical_strike", "buff_attack_type", "target_index", "damage_source", "first_hit", "PROC_MODIFIABLE"),
	on_damage_dealt = make_proc_param_lookup("attacked_unit", "attacker_unit", "damage_amount", "hit_zone_name", "no_crit_headshot_damage", "is_critical_strike", "buff_attack_type", "target_index", "damage_source", "damage_type", "first_hit", "PROC_MODIFIABLE"),
	on_critical_hit = make_proc_param_lookup("hit_unit", "attack_type", "hit_zone_name", "target_number", "buff_type"),
	on_ranged_hit = make_proc_param_lookup("hit_unit", "attack_type", "hit_zone_name", "target_number", "buff_type", "is_critical", "unmodified"),
	on_hit = make_proc_param_lookup("hit_unit", "attack_type", "hit_zone_name", "target_number", "buff_type", "is_critical", "unmodified"),
	on_staggered = make_proc_param_lookup("target_unit", "damage_profile", "attacker_unit", "stagger_type", "stagger_duration", "stagger_value", "buff_type", "target_index"),
}

local buff_params = {}

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_server()
	return Managers.player.is_server
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

ProcFunctions = {
	heal = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
		end
	end,
	damage_attacker = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and Managers.player.is_server then
			local damage_amount = buff.bonus

			DamageUtils.add_damage_network(owner_unit, owner_unit, damage_amount, "full", "buff", nil, Vector3(1, 0, 0), "buff", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
		end
	end,
	metal_mutator_stacks_on_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and Managers.player.is_server then
			local current_stacks = buff.current_stacks or 0

			current_stacks = current_stacks + 1

			if current_stacks == buff.template.num_stacks then
				local damage_amount = buff.bonus
				local hit_unit = params[1]
				local breed = AiUtils.unit_breed(hit_unit)
				local breeds = buff.template.breeds

				if table.contains(breeds, breed.name) then
					DamageUtils.add_damage_network(hit_unit, owner_unit, damage_amount, "full", "metal_mutator", nil, Vector3(1, 0, 0), "buff", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
				end

				current_stacks = 0
			end

			buff.current_stacks = current_stacks
		end
	end,
	heal_party = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and Managers.player.is_server then
			local heal_amount = buff.bonus
			local side = Managers.state.side.side_by_unit[owner_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units do
				DamageUtils.heal_network(player_and_bot_units[i], owner_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_other_players_percent_at_range = function (owner_unit, buff, params)
		local healer_unit = params[1]
		local healer_position = POSITION_LOOKUP[healer_unit]
		local range = buff.range
		local range_squared = range * range

		if ALIVE[owner_unit] and Managers.player.is_server then
			local side = Managers.state.side.side_by_unit[owner_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units do
				local healed_unit = player_and_bot_units[i]

				if healed_unit ~= owner_unit and Unit.alive(healed_unit) then
					local unit_position = POSITION_LOOKUP[healed_unit]
					local distance_squared = Vector3.distance_squared(healer_position, unit_position)

					if distance_squared < range_squared then
						local health_extension = ScriptUnit.extension(healed_unit, "health_system")
						local max_health = health_extension:get_max_health()
						local multiplier = buff.multiplier
						local heal_amount = max_health * multiplier
						local heal_type = "buff_shared_medpack"

						DamageUtils.heal_network(healed_unit, owner_unit, heal_amount, heal_type)
					end
				end
			end
		end
	end,
	heal_assisted_and_self_on_assist = function (owner_unit, buff, params)
		local assisted_unit = params[1]

		if ALIVE[owner_unit] and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

			if Unit.alive(assisted_unit) then
				DamageUtils.heal_network(assisted_unit, owner_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	buff_defence_on_revived_target = function (owner_unit, buff, params)
		local revived_unit = params[1]

		if not ALIVE[owner_unit] or not ALIVE[revived_unit] or not Managers.player.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		if type(buff_to_add) == "table" then
			for i = 1, #buff_to_add do
				local current_buff = buff_to_add[i]

				buff_system:add_buff(revived_unit, current_buff, owner_unit, false)
			end
		else
			buff_system:add_buff(revived_unit, buff_to_add, owner_unit, false)
		end
	end,
	heal_percentage_of_enemy_hp_on_melee_kill = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local killing_blow_data = params[1]

			if not killing_blow_data then
				return
			end

			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
				local breed = params[2]

				if breed and not breed.is_hero then
					local heal_amount = breed.bloodlust_health or 0

					DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
				end
			end
		end
	end,
	heal_finesse_damage_on_melee = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local heal_amount = buff.bonus
		local has_procced = buff.has_procced
		local hit_unit = params[1]
		local hit_zone_name = params[3]
		local target_number = params[4]
		local attack_type = params[2]
		local critical_hit = params[6]
		local breed = AiUtils.unit_breed(hit_unit)

		if target_number == 1 then
			buff.has_procced = false
			has_procced = false
		end

		if ALIVE[owner_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and not has_procced then
			if critical_hit then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true

				if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
					DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

					buff.has_procced = true
				end
			elseif hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true
			else
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount / 4, "heal_from_proc")

				buff.has_procced = true
			end
		end
	end,
	heal_stagger_targets_on_melee = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local hit_unit = params[1]
			local damage_profile = params[2]
			local attack_type = damage_profile.charge_value
			local stagger_value = params[6]
			local stagger_type = params[4]
			local target_index = params[8]
			local breed = AiUtils.unit_breed(hit_unit)
			local multiplier = buff.multiplier
			local is_push = damage_profile.is_push
			local stagger_calulation = stagger_type or stagger_value
			local heal_amount = stagger_calulation * multiplier

			if is_push then
				heal_amount = 0.6
			end

			if target_index and target_index < 5 and breed and not breed.is_hero and (attack_type == "light_attack" or attack_type == "heavy_attack" or attack_type == "action_push") then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_damage_targets_on_melee = function (owner_unit, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local attack_type = params[param_order.buff_attack_type]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local hit_unit = params[param_order.attacked_unit]
		local breed = AiUtils.unit_breed(hit_unit)

		if not breed then
			return
		end

		local damage_amount = params[param_order.damage_amount]

		if damage_amount > 0 then
			local buff_template = buff.template
			local max_targets = buff_template.max_targets
			local target_number = params[param_order.target_index]

			if target_number and target_number <= max_targets then
				local heal_amount = 1

				if target_number == 1 then
					-- Nothing
				end

				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	thp_linesman_func = function (owner_unit, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local attack_type = params[param_order.buff_attack_type]

			if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
				return
			end

			local hit_unit = params[param_order.attacked_unit]
			local breed = AiUtils.unit_breed(hit_unit)

			if not breed then
				return
			end

			local damage_amount = params[param_order.damage_amount]

			if damage_amount > 0 then
				local buff_template = buff.template
				local base_value = buff_template.base_value
				local target_number = params[param_order.target_index]

				if target_number then
					local target_dropoff = buff_template.target_dropoff
					local max_targets = buff_template.max_targets

					if target_dropoff < target_number then
						base_value = base_value / buff_template.dropoff_divisor
					end

					if target_number <= max_targets then
						local heal_amount = base_value

						if script_data.show_player_health then
							print(string.format("Linesman THP: Target %s gives %s THP", target_number, heal_amount))
						end

						DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
					end
				end
			end
		end
	end,
	thp_ninjafencer_func = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local heal_amount = buff.bonus
		local hit_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name = params[3]
		local target_number = params[4]
		local critical_hit = params[6]
		local breed = AiUtils.unit_breed(hit_unit)

		if ALIVE[owner_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and target_number == 1 then
			local hit_weakspot = hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot"

			if critical_hit then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true

				if hit_weakspot then
					DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

					buff.has_procced = true
				end
			elseif hit_weakspot then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true
			else
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount / 4, "heal_from_proc")

				buff.has_procced = true
			end
		end
	end,
	thp_smiter_func = function (owner_unit, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local killing_blow_data = params[1]

			if not killing_blow_data then
				return
			end

			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
				local breed = params[2]

				if breed and not breed.is_hero then
					local thp_return = breed.bloodlust_health or 0
					local heal_amount = thp_return

					if script_data.show_player_health then
						print(string.format("Smiter THP: %s gives %s", breed.name, heal_amount))
					end

					DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
				end
			end
		end
	end,
	thp_tank_stagger_func = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local buff_template = buff.template
			local hit_unit = params[1]
			local damage_profile = params[2]
			local attack_type = damage_profile.charge_value
			local stagger_type = params[4]
			local stagger_value = params[6]
			local breed = AiUtils.unit_breed(hit_unit)
			local target_index = params[8]
			local base_value = buff.template.base_value

			if damage_profile.is_push then
				local push_modifier = buff.template.push_modifier

				base_value = base_value * push_modifier
			end

			local max_targets = buff_template.max_targets
			local stagger_calculation = math.min(math.max(stagger_type, stagger_value), 3)
			local stagger_index = {
				0.25,
				1,
				2,
			}
			local stagger_multiplier = stagger_index[stagger_calculation] or 1
			local heal_amount = base_value * stagger_multiplier

			if target_index and target_index <= max_targets and breed and not breed.is_hero and (attack_type == "light_attack" or attack_type == "heavy_attack" or attack_type == "action_push") then
				if script_data.show_player_health then
					print(string.format("Tank THP: %s * %s = %s (Target %s/%s)", base_value, stagger_multiplier, heal_amount, target_index, max_targets))
				end

				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	thp_tank_kill_func = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local killing_blow_data = params[1]

			if not killing_blow_data then
				return
			end

			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
				local breed = params[2]

				if breed and not breed.is_hero then
					local base_value = buff.template.base_value
					local target_index = killing_blow_data[16]
					local max_targets = buff.template.max_targets
					local heal_amount = base_value

					if target_index and target_index <= max_targets then
						if script_data.show_player_health then
							print(string.format("Tank THP: Kill gives %s (Target %s/%s)", heal_amount, target_index, max_targets))
						end

						DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
					end
				end
			end
		end
	end,
	heal_finesse_damage_on_ranged = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local heal_amount = buff.bonus
		local has_procced = buff.has_procced
		local hit_unit = params[1]
		local hit_zone_name = params[3]
		local target_number = params[4]
		local buff_type = params[5]
		local critical_hit = params[6]
		local breed = AiUtils.unit_breed(hit_unit)

		if target_number == 1 then
			buff.has_procced = false
			has_procced = false
		end

		if ALIVE[owner_unit] and breed and buff_type == "RANGED" and not has_procced then
			if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
				buff.has_procced = true

				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
			end

			if critical_hit then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true
			end
		end
	end,
	on_hit_debuff_enemy_defence = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] and Managers.player.is_server then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff_enemies")
		end
	end,
	unbalance_debuff_on_stagger = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and Unit.alive(hit_unit) and Managers.player.is_server then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if buff_extension then
				buff_extension:add_buff("tank_unbalance_buff")
			end
		end
	end,
	kills_stack_fiery_push = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("bw_kill_stacks")
		end
	end,
	add_stacking_damage_from_melee_headshot = function (owner_unit, buff, params)
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(owner_unit) and hit_zone_name == "head" and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local damage_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = damage_increase
			buff_params.external_optional_duration = duration

			buff_extension:add_buff("stacking_melee_damage", buff_params)
		end
	end,
	heal_on_melee_headshot = function (owner_unit, buff, params)
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
		end
	end,
	heal_on_ranged_headshot = function (owner_unit, buff, params)
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "heavy_instant_projectile") then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
		end
	end,
	heal_on_crit = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")
		end
	end,
	add_buff_on_ranged_critical_hit = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_type = params[5]
			local is_critical = params[6]

			if is_critical and buff_type ~= "MELEE_1H" and buff_type ~= "MELEE_2H" then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	apply_burn_to_enemies = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if Unit.alive(owner_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			table.clear(buff_params)

			buff_params.attacker_unit = owner_unit

			buff_extension:add_buff("flaming_shield_burning_dot", buff_params)
		end
	end,
	regen_stamina_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("stamina_regen", buff_params)
		end
	end,
	add_buff_on_charged_attack_hit = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local attack_type = params[2]
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local server_controlled = template.server_controlled

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(owner_unit) and buff_to_add then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, server_controlled)
		end
	end,
	sienna_unchained_regen_stamina_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("sienna_unchained_stamina_regen", buff_params)
		end
	end,
	markus_mercenary_regen_stamina_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("markus_mercenary_stamina_regen_buff", buff_params)
		end
	end,
	markus_knight_regen_stamina_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("markus_knight_stamina_regen_buff", buff_params)
		end
	end,
	bardin_ironbreaker_gromril_stagger = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(owner_unit) then
			local template = buff.template
			local explosion_template = template.explosion_template
			local world = Managers.world:world(LevelHelper.INGAME_WORLD_NAME)

			if not world then
				return
			end

			local player_position = POSITION_LOOKUP[owner_unit]
			local rotation = Quaternion.identity()
			local player = Managers.player:owner(owner_unit)
			local owner_is_bot = player and player.bot_player
			local is_husk = owner_is_bot and true or false
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			DamageUtils.create_explosion(world, owner_unit, player_position, rotation, explosion_template, 1, "career_ability", true, is_husk, owner_unit, career_power_level, false)
		end
	end,
	bardin_ironbreaker_gromril_trigger_rising_anger = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			buff.buff_ids = buff.buff_ids or {}

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_amount = #buff.buff_ids

			for i = 1, buff_amount do
				buff_extension:remove_buff(buff.buff_ids[i])
			end

			table.clear(buff.buff_ids)

			local template = buff.template

			for i = 1, buff_amount do
				local buff_on_pop = template.buff_on_pop

				buff_extension:add_buff(buff_on_pop)
			end

			local t = Managers.time:time("game")

			buff._next_update_t = t + 0.5
		end
	end,
	bardin_slayer_push_on_dodge = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension:get_dodge_cooldown() >= 1 then
				local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
				local dodge_direction_box = params[1]
				local dodge_direction = dodge_direction_box:unbox()
				local template = buff.template
				local explosion_template = template.explosion_template
				local owner_position = POSITION_LOOKUP[owner_unit]
				local unit_rotation = first_person_extension:current_rotation()
				local career_power_level = career_extension:get_career_power_level()
				local offset_distance = 2
				local flat_unit_rotation = Quaternion.look(Vector3.flat(Quaternion.forward(unit_rotation)), Vector3.up())
				local move_direction = Quaternion.rotate(flat_unit_rotation, dodge_direction)
				local offset_position = owner_position + Vector3.normalize(move_direction) * offset_distance
				local area_damage_system = Managers.state.entity:system("area_damage_system")

				area_damage_system:create_explosion(owner_unit, offset_position, unit_rotation, explosion_template, 1, "career_ability", career_power_level, false)
			end
		end
	end,
	bardin_ironbreaker_regen_stamina_on_block_broken = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local template = buff.template
			local procced = template.proc_chance >= math.random()

			if procced then
				local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

				status_extension:remove_all_fatigue()
			end
		end
	end,
	bardin_ironbreaker_regen_stamina_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(owner_unit) then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("bardin_ironbreaker_regen_stamina_on_charged_attacks_buff", buff_params)
		end
	end,
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")
		local fatigued = status_extension and status_extension:fatigued()

		if fatigued then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local template = buff.template
		local cooldown_reduction = template.cooldown_reduction
		local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

		career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)
	end,
	maidenguard_add_power_buff_on_block = function (owner_unit, buff, params)
		local template = buff.template

		if ALIVE[owner_unit] then
			local buff_to_add = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			if not buff.buff_list then
				buff.buff_list = {}
			end

			local amount_to_add = template.amount_to_add

			for i = 1, amount_to_add do
				local num_buff_list = #buff.buff_list
				local max_sub_buff_stacks = template.max_sub_buff_stacks

				if num_buff_list < max_sub_buff_stacks then
					buff.buff_list[num_buff_list + 1] = buff_system:add_buff_synced(owner_unit, buff_to_add, BuffSyncType.LocalAndServer)
				end
			end
		end
	end,
	remove_buff_on_action = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local kind = params[1].kind

			if not kind or kind ~= "flamethrower" and kind ~= "charged_projectile" and kind ~= "bullet_spray" and kind ~= "charge" then
				return
			end

			local buff_template = buff.template
			local buff_ids = buff_template.buff_ids

			if not buff_ids or #buff_ids < 1 then
				return
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff_ids[#buff_ids])
			table.remove(buff_ids, #buff_ids)
		end
	end,
	increased_melee_damage = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local damage_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = damage_increase
			buff_params.external_optional_duration = duration

			buff_extension:add_buff("increased_melee_damage_from_proc", buff_params)
		end
	end,
	add_gromril_delay = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		if is_local(owner_unit) or is_server() then
			local buff_name = "bardin_ironbreaker_gromril_delay"
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

			if talent_extension:has_talent("bardin_ironbreaker_max_gromril_delay", "dwarf_ranger", true) then
				buff_name = "bardin_ironbreaker_gromril_delay_short"
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff(buff_name)
		end
	end,
	reduce_ally_damage_taken_on_revived_ally = function (owner_unit, buff, params)
		local revived_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[revived_unit] then
			local buff_extension = ScriptUnit.extension(revived_unit, "buff_system")

			buff_extension:add_buff("bardin_ironbreaker_reduce_damage_taken_on_revive")
		end
	end,
	victor_zealot_gain_invulnerability = function (owner_unit, buff, params)
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		if ALIVE[owner_unit] and not status_extension:is_knocked_down() then
			local health_extension = ScriptUnit.extension(owner_unit, "health_system")
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local already_unkillable = buff_extension:has_buff_perk("invulnerable") or buff_extension:has_buff_perk("ignore_death")

			if already_unkillable then
				return false
			end

			local damage = params[2]
			local current_health = health_extension:current_health()
			local killing_blow = current_health <= damage
			local template = buff.template
			local buff_to_add = template.buff_to_add

			if killing_blow then
				buff_extension:add_buff(buff_to_add)

				return true
			end
		end
	end,
	sienna_unchained_vent_overheat_on_low_health = function (owner_unit, buff, params)
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		if ALIVE[owner_unit] and not status_extension:is_knocked_down() then
			local health_extension = ScriptUnit.extension(owner_unit, "health_system")
			local damage = params[2]
			local current_health = health_extension:current_health()
			local new_health = current_health - damage
			local max_health = health_extension:get_max_health()
			local new_health_percentage = new_health / max_health
			local current_health_percentage = health_extension:current_health_percent()
			local template = buff.template
			local health_threshold = template.threshold
			local trigger = new_health_percentage <= health_threshold and health_threshold < current_health_percentage

			if trigger then
				local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local buff_to_add = template.buff_to_add

				overcharge_extension:reset()
				buff_extension:add_buff(buff_to_add)

				return true
			end
		end
	end,
	add_increased_ranged_damage = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("passive_career_wh_2_proc")
		end
	end,
	ww_melee_kills_stack_ranged_damage = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("ww_increased_ranged_damage_from_proc")
		end
	end,
	wh_stack_kills_to_be_uninterruptible = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("wh_kill_stack_from_proc")
		end
	end,
	ww_melee_attacks_apply_damage_taken = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("ww_applied_damage_taken")
		end
	end,
	es_legshots_cripple = function (owner_unit, buff, params)
		local hit_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if ALIVE[owner_unit] and ALIVE[hit_unit] and (attack_type == "instant_projectile" or attack_type == "projectile" or attack_type == "heavy_instant_projectile") and (hit_zone_name == "left_leg" or hit_zone_name == "right_leg") then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("es_movement_speed_debuff")
		end
	end,
	ranged_crits_increase_dmg_vs_armour_type = function (owner_unit, buff, params)
		local target_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name
		local breed = AiUtils.unit_breed(target_unit)
		local armor_override = Unit.get_data(target_unit, "armor")
		local armor_type = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)

		if attack_type and (attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe" or attack_type == "heavy_instant_projectile") and ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if armor_type == 1 then
				buff_extension:add_buff("ranged_power_vs_unarmored")
			elseif armor_type == 2 then
				buff_extension:add_buff("ranged_power_vs_armored")
			elseif armor_type == 3 then
				buff_extension:add_buff("ranged_power_vs_large")
			elseif armor_type == 5 then
				buff_extension:add_buff("ranged_power_vs_frenzy")
			end
		end
	end,
	debuff_defence_on_crit = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff")
		end
	end,
	victor_witchhunter_debuff_defence_on_crit = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff_enemies")
		end
	end,
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]
			local attack_type = params[2]
			local template = buff.template
			local required_targets = template.required_targets

			if target_number == 1 then
				buff.can_trigger = true
			end

			if attack_type == "ability" and required_targets <= target_number and buff.can_trigger then
				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
				local cooldown_reduction = template.cooldown_reduction

				career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)

				buff.can_trigger = false
			end
		end
	end,
	victor_witchhunter_activated_ability_increased_duration_on_enemies_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]
			local attack_type = params[2]
			local template = buff.template
			local required_targets = template.required_targets

			if target_number == 1 then
				buff.can_trigger = true
			end

			if attack_type ~= "ability" then
				return
			end

			local buff_to_add

			if required_targets <= target_number and buff.can_trigger then
				buff_to_add = template.long_buff
			else
				buff_to_add = template.short_buff
			end

			local nearby_ally_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.player_units_broadphase
			local position = POSITION_LOOKUP[owner_unit]
			local radius = 10
			local buff_system = Managers.state.entity:system("buff_system")

			Broadphase.query(broadphase, position, radius, nearby_ally_units)

			local side_manager = Managers.state.side

			for _, ally_unit in pairs(nearby_ally_units) do
				if Unit.alive(ally_unit) and not side_manager:is_enemy(owner_unit, ally_unit) then
					local buff_extension = ScriptUnit.extension(ally_unit, "buff_system")
					local previous_buff = buff_extension:get_non_stacking_buff(template.short_buff)

					if buff_to_add == template.long_buff and previous_buff then
						buff_extension:remove_buff(previous_buff.id)
					end

					buff_system:add_buff(ally_unit, buff_to_add, owner_unit)
				end
			end
		end
	end,
	sienna_unchained_activated_ability_power_on_enemies_hit = function (owner_unit, buff, params)
		if Managers.state.network.is_server and ALIVE[owner_unit] then
			local attack_type = params[2]

			if attack_type and attack_type == "ability" then
				local template = buff.template
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	sienna_adept_add_damage_reduction_buff_on_ignited_enemy = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local template = buff.template
			local require_alive_enemy = template.require_alive_enemy
			local target_enemy = params[4]

			if require_alive_enemy and not HEALTH_ALIVE[target_enemy] then
				return
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add

			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
		end
	end,
	sienna_adept_add_attack_speed_buff_on_enemies_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]
			local template = buff.template
			local required_targets = template.required_targets

			if target_number == 1 then
				buff.can_trigger = true
			end

			if target_number and required_targets <= target_number and buff.can_trigger then
				local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
				local buff_to_add = template.buff_to_add

				buff_extension:add_buff(buff_to_add)

				buff.can_trigger = false
			end
		end
	end,
	sienna_scholar_refund_activated_ability_cooldown = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]
			local buff_type = params[5]
			local is_critical = params[6]

			if target_number <= 1 and buff_type == "RANGED_ABILITY" and is_critical then
				local career_extension = ScriptUnit.extension(owner_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(1)
			end
		end
	end,
	kerillian_shade_debuff_defence_on_crit = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff_enemies")
		end
	end,
	kerillian_shade_stealth_on_backstab_kill = function (owner_unit, buff, params)
		local player = Managers.player:owner(owner_unit)
		local player_unit = player.player_unit
		local local_player = player.local_player
		local bot_player = player.bot_player
		local killing_blow_table = params[1]
		local backstab_multiplier = killing_blow_table[DamageDataIndex.BACKSTAB_MULTIPLIER]

		if ALIVE[owner_unit] and backstab_multiplier and backstab_multiplier > 1 then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if buff_extension:has_buff_type("kerillian_shade_activated_ability_short_blocker") then
				return
			end

			local buffs_to_add = {
				"kerillian_shade_activated_ability_short",
				"kerillian_shade_activated_ability_short_blocker",
			}

			if local_player or is_server and bot_player then
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit

				for i = 1, #buffs_to_add do
					local buff_name = buffs_to_add[i]
					local unit_object_id = network_manager:unit_game_object_id(player_unit)
					local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

					if is_server() then
						buff_extension:add_buff(buff_name, {
							attacker_unit = player_unit,
						})
						network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	kerillian_shade_cooldown_regen_on_backstab_kill = function (owner_unit, buff, params)
		local player = Managers.player:owner(owner_unit)
		local player_unit = player.player_unit
		local local_player = player.local_player
		local bot_player = player.bot_player
		local killing_blow_table = params[1]
		local backstab_multiplier = killing_blow_table[DamageDataIndex.BACKSTAB_MULTIPLIER]

		if ALIVE[owner_unit] and backstab_multiplier and backstab_multiplier > 1 then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			if local_player or is_server and bot_player then
				buff_extension:add_buff(buff_to_add)
			end
		end
	end,
	kerillian_shade_buff_on_charged_backstab = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local player_unit_pos = POSITION_LOOKUP[owner_unit]
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - player_unit_pos)
			local hit_unit_direction = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
			local hit_angle = Vector3.dot(hit_unit_direction, owner_to_hit_dir)
			local behind_target = hit_angle >= 0.55 and hit_angle <= 1
			local attack_type = params[2]
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_to_add = buff.template.buff_to_add

			if behind_target and attack_type == "heavy_attack" then
				if not buff_extension:has_buff_type("kerillian_shade_passive_improved_crit_blocker") then
					buff_extension:add_buff(buff_to_add)
					buff_extension:add_buff("kerillian_shade_passive_improved_crit_blocker")
				end
			else
				local buffs_to_remove = buff_extension:num_buff_stacks(buff_to_add)

				for i = 1, buffs_to_remove do
					local added_buff = buff_extension:get_buff_type(buff_to_add)

					if not added_buff then
						break
					end

					buff_extension:remove_buff(added_buff.id)
				end
			end
		end
	end,
	kerillian_waywatcher_restore_ammo_on_career_skill_special_kill = function (owner_unit, buff, params)
		local killing_blow_table = params[1]
		local killer_unit = killing_blow_table[DamageDataIndex.ATTACKER]
		local damage_source = killing_blow_table[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local breed_data = params[2]
		local can_trigger

		if breed_data then
			can_trigger = breed_data.elite or breed_data.special
		end

		if ALIVE[owner_unit] and can_trigger and owner_unit == killer_unit and damage_source == "kerillian_waywatcher_career_skill_weapon" then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction

			if ammo_extension then
				local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end

			local energy_extension = ScriptUnit.has_extension(owner_unit, "energy_system")

			if energy_extension then
				local max_energy = energy_extension:get_max()
				local energy_amount = ammo_bonus_fraction * max_energy

				energy_extension:add_energy(energy_amount)
			end
		end
	end,
	restore_ammo_on_special_kill = function (owner_unit, buff, params)
		local killing_blow_table = params[1]
		local killer_unit = killing_blow_table[DamageDataIndex.ATTACKER]

		if ALIVE[owner_unit] and owner_unit == killer_unit then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
				local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	buff_defence_on_heal = function (owner_unit, buff, params)
		local healer_unit = params[1]
		local heal_type = params[3]

		if owner_unit == healer_unit and (heal_type == "healing_draught" or heal_type == "bandage") then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("trait_necklace_damage_taken_reduction_buff")
		end
	end,
	buff_defence_on_damage_taken = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = "trait_necklace_damage_taken_reduction_buff"
			local server_controlled = false

			if attacker_unit ~= owner_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, server_controlled)
			end
		end
	end,
	add_buff_on_enemy_damage_taken = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local buff_system = Managers.state.entity:system("buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local server_controlled = false
			local player_side = Managers.state.side.side_by_unit[owner_unit]
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]
			local is_ally = player_side == attacker_side

			if not is_ally and attacker_unit ~= owner_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, server_controlled)
			end
		end
	end,
	restore_stamina_on_enemy_damage_taken = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")
			local player_side = Managers.state.side.side_by_unit[owner_unit]
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]
			local is_ally = player_side == attacker_side

			if not is_ally and attacker_unit ~= owner_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				status_extension:remove_all_fatigue()
			end
		end
	end,
	bardin_ranger_scavenge_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local offset_position_1 = Vector3(0, 0.25, 0)
		local offset_position_2 = Vector3(0, -0.25, 0)

		if ALIVE[owner_unit] then
			local drop_chance = buff.template.drop_chance
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
			local result = math.random(1, 100)

			if result < drop_chance * 100 then
				local player_pos = POSITION_LOOKUP[owner_unit] + Vector3.up() * 0.1
				local raycast_down = true
				local pickup_system = Managers.state.entity:system("pickup_system")

				if talent_extension:has_talent("bardin_ranger_passive_spawn_healing_draught") then
					if math.random(1, 4) > 1 then
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					else
						pickup_system:buff_spawn_pickup("frag_grenade_t1", player_pos, raycast_down)
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					end
				elseif talent_extension:has_talent("bardin_ranger_passive_spawn_potions_or_bombs") then
					local spawn_chance = TalentUtils.get_talent_attribute("bardin_ranger_passive_spawn_potions_or_bombs", "spawn_chance")
					local drop_result = math.random()

					if drop_result <= spawn_chance then
						local potion_result = math.random(1, 5)

						if potion_result >= 1 and potion_result <= 3 then
							local game_mode_key = Managers.state.game_mode:game_mode_key()
							local custom_potions = BardinScavengerCustomPotions[game_mode_key]

							if custom_potions then
								local custom_potion_result = math.random(1, #custom_potions)

								pickup_system:buff_spawn_pickup(custom_potions[custom_potion_result], player_pos, raycast_down)
							elseif potion_result == 1 then
								pickup_system:buff_spawn_pickup("damage_boost_potion", player_pos, raycast_down)
							elseif potion_result == 2 then
								pickup_system:buff_spawn_pickup("speed_boost_potion", player_pos, raycast_down)
							elseif potion_result == 3 then
								pickup_system:buff_spawn_pickup("cooldown_reduction_potion", player_pos, raycast_down)
							end
						elseif potion_result == 4 then
							pickup_system:buff_spawn_pickup("frag_grenade_t1", player_pos, raycast_down)
						elseif potion_result == 5 then
							pickup_system:buff_spawn_pickup("fire_grenade_t1", player_pos, raycast_down)
						end
					else
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					end
				elseif talent_extension:has_talent("bardin_ranger_passive_improved_ammo") then
					pickup_system:buff_spawn_pickup("ammo_ranger_improved", player_pos, raycast_down)
				elseif talent_extension:has_talent("bardin_ranger_passive_ale") then
					local drop_result = math.random(1, 4)

					if drop_result == 1 or drop_result == 2 then
						pickup_system:buff_spawn_pickup("bardin_survival_ale", player_pos + offset_position_1, raycast_down)
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos + offset_position_2, raycast_down)
					else
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					end
				else
					pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
				end
			end
		end
	end,
	bardin_ranger_add_power_on_no_ammo_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_add = buff_template.buff_to_add
		local active_buff = buff_extension:get_non_stacking_buff(buff_to_add)
		local server_controlled = true

		if not active_buff then
			local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, server_controlled)
			local added_buff = buff_extension:get_non_stacking_buff(buff_to_add)

			added_buff.server_buff_id = server_buff_id
		end
	end,
	bardin_ranger_remove_power_on_no_ammo_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_remove = buff_template.buff_to_remove
		local active_buff = buff_extension:get_non_stacking_buff(buff_to_remove)

		if active_buff and active_buff.server_buff_id then
			buff_system:remove_server_controlled_buff(owner_unit, active_buff.server_buff_id)
		end
	end,
	victor_bountyhunter_add_power_on_no_ammo_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_add = buff_template.buff_to_add
		local active_buff = buff_extension:get_stacking_buff(buff_to_add)
		local server_controlled = true

		if not active_buff then
			local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, server_controlled)
			local added_buff = buff_extension:get_stacking_buff(buff_to_add)

			added_buff.server_buff_id = server_buff_id
		end
	end,
	victor_bountyhunter_remove_power_on_no_ammo_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_remove = buff_template.buff_to_remove
		local active_buff = buff_extension:get_stacking_buff(buff_to_remove)

		if active_buff and active_buff.server_buff_id then
			buff_system:remove_server_controlled_buff(owner_unit, active_buff.server_buff_id)
		end
	end,
	debuff_defence_grenade_hit = function (owner_unit, buff, params)
		local hit_unit = params[1]
		local attack_type = params[2]
		local breed = Unit.get_data(hit_unit, "breed")

		if attack_type == "grenade" and breed then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("trait_trinket_grenade_damage_taken_buff")
		end
	end,
	activate_buff_on_disabler = function (owner_unit, buff, params)
		local template = buff.template
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local is_disabled = status_extension:is_disabled()
		local buff_to_add = template.buff_to_add

		if is_disabled then
			local disabler_unit = status_extension:get_disabler_unit()
			local attacker_unit = params[1]

			if disabler_unit == attacker_unit and Unit.alive(disabler_unit) then
				local disabler_breed = disabler_unit and Unit.get_data(disabler_unit, "breed")

				if not disabler_breed or not disabler_breed.boss then
					local buff_extension = ScriptUnit.extension(disabler_unit, "buff_system")

					buff_extension:add_buff(buff_to_add)
				end
			end
		end
	end,
	add_buff_to_all_players = function (owner_unit, buff, params)
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units do
			local other_unit = player_and_bot_units[i]

			if Unit.alive(other_unit) then
				buff_system:add_buff(other_unit, buff_to_add, other_unit, false)
			end
		end
	end,
	life_mutator_remove_regen = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local ids = buff.health_regeneration_stack_ids

			if #ids > 0 then
				local id = table.remove(ids, 1)

				buff_extension:remove_buff(id)
			end
		end
	end,
	add_buff_on_stacks_on_hit = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_template = buff.template
		local buff_system = Managers.state.entity:system("buff_system")
		local target_number = params[4]
		local buff_to_add = buff_template.buff_to_add
		local buff_on_stacks = buff_template.buff_on_stacks
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not buff_extension:has_buff_type(buff_to_add) and target_number < 2 then
			if not buff.stack then
				buff.stack = 1
			else
				buff.stack = buff.stack + 1
			end

			if buff.stack and buff_on_stacks <= buff.stack then
				buff.added_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				buff.stack = 0
			end
		elseif buff.added_buff_id and target_number < 2 then
			buff_system:remove_server_controlled_buff(owner_unit, buff.added_buff_id)
		end
	end,
	add_buff_on_stacks_on_event = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_template = buff.template
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff_template.buff_to_add
		local buff_on_stacks = buff_template.buff_on_stacks
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not buff_extension:has_buff_type(buff_to_add) then
			if not buff.stack then
				buff.stack = 1
			else
				buff.stack = buff.stack + 1
			end

			if buff.stack and buff_on_stacks <= buff.stack then
				buff.added_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				buff.stack = 0
			end
		elseif buff.added_buff_id then
			buff_system:remove_server_controlled_buff(owner_unit, buff.added_buff_id)
		end
	end,
	buff_consecutive_shots_damage = function (owner_unit, buff, params)
		local hit_unit = params[1]
		local attack_type = params[2]
		local target_number = params[4]
		local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")
		local owner_unit_buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if attack_type and (attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe" or attack_type == "heavy_instant_projectile") then
			if hit_unit_buff_extension:has_buff_type("consecutive_shot_debuff") and target_number == 1 then
				owner_unit_buff_extension:add_buff("consecutive_shot_buff")
			end

			hit_unit_buff_extension:add_buff("consecutive_shot_debuff")
		end
	end,
	block_increase_enemy_damage_taken = function (owner_unit, buff, params)
		local attacking_unit = params[1]

		if ALIVE[attacking_unit] then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff_synced(attacking_unit, "defence_debuff_enemies", BuffSyncType.All)
		end
	end,
	add_buff = function (unit, buff, params)
		if ALIVE[unit] then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = unit,
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	victor_witchhunter_ping_enemy_attack_speed = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local ping_added = params[3]

		if not ping_added then
			return
		end

		local target_unit = params[1]

		if not Managers.state.side:is_enemy(target_unit, owner_unit) then
			return
		end

		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add

		table.clear(buff_params)

		buff_params.attacker_unit = owner_unit

		local player = Managers.player:owner(owner_unit)

		Managers.state.entity:system("buff_system"):add_buff_synced(owner_unit, buff_name, BuffSyncType.Client, buff_params, player.peer_id)
	end,
	add_buff_on_first_target_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]

			if target_number > 1 then
				return
			end

			local buff_template = buff.template
			local valid_attack_types = buff_template.valid_attack_types
			local attack_type = params[2]

			if valid_attack_types and not valid_attack_types[attack_type] then
				return
			end

			local client_side = buff_template.client_side
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if buff_template.block_buff and buff_extension:has_buff_type(buff_template.block_buff) then
				return
			end

			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(owner_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if client_side then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit,
				})
			elseif is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit,
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	add_buff_on_first_target_hit_headshot = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_data = params[5]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			local hit_zone_name = params[3]

			if hit_zone_name ~= "head" then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_on_unmodified_headshot = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_data = params[5]
			local attack_type = params[2]
			local unmodifed = params[7]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			if attack_type ~= "instant_projectile" and attack_type ~= "projectile" and attack_type ~= "heavy_instant_projectile" or not unmodifed then
				return
			end

			local hit_zone_name = params[3]

			if hit_zone_name ~= "head" then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				buff.marked_for_add = true
			end
		end
	end,
	add_delayed_buff_on_ranged_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_data = params[5]
			local attack_type = params[2]
			local unmodifed = params[7]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			if attack_type ~= "instant_projectile" and attack_type ~= "projectile" and attack_type ~= "heavy_instant_projectile" or not unmodifed then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				buff.marked_for_add = true
			end
		end
	end,
	add_buff_local = function (owner_unit, buff, params)
		BuffFunctionTemplates.functions.add_buff_local(owner_unit, buff, params)
	end,
	add_buff_on_first_target_hit_range = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_data = params[5]
			local attack_type = params[2]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			if attack_type ~= "instant_projectile" and attack_type ~= "projectile" and attack_type ~= "heavy_instant_projectile" then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_stack_on_melee_critical_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]
			local buff_type = params[5]
			local is_critical = params[6]

			if target_number < 2 and is_critical and (buff_type == "MELEE_1H" or buff_type == "MELEE_2H") then
				local template = buff.template
				local buff_name = template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local max_sub_buff_stacks = template.max_sub_buff_stacks

				if template.reference_buff then
					local reference_buff_name = template.reference_buff
					local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

					max_sub_buff_stacks = reference_buff.template.max_sub_buff_stacks

					if not reference_buff.buff_list then
						reference_buff.buff_list = {}
					end

					if max_sub_buff_stacks > #reference_buff.buff_list then
						table.insert(reference_buff.buff_list, buff_extension:add_buff(buff_name))
					end
				else
					if not buff.buff_list then
						buff.buff_list = {}
					end

					if max_sub_buff_stacks > #buff.buff_list then
						table.insert(buff.buff_list, buff_extension:add_buff(buff_name))
					end
				end
			end
		end
	end,
	set_noclip = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")
			local template = buff.template
			local set_status = template.set_status
			local status_identifier = template.status_identifier

			status_extension:set_noclip(set_status, status_identifier)
		end
	end,
	add_buff_on_elite_or_special_kill = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special or killed_unit_breed_data.elite then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_on_special_kill = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_stack_on_special_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special or killed_unit_breed_data.elite then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local max_sub_buff_stacks = buff_template.max_sub_buff_stacks

				if not buff.buff_list then
					buff.buff_list = {}
				end

				if max_sub_buff_stacks > #buff.buff_list then
					buff.buff_list[#buff.buff_list + 1] = buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
				end
			end
		end
	end,
	remove_ref_buff_stack = function (owner_unit, buff, params)
		local damage_unit = params[1]
		local damage_type = params[3]
		local side_player = Managers.state.side.side_by_unit[owner_unit]
		local side_damage = Managers.state.side.side_by_unit[damage_unit]

		if side_damage and side_player and side_player == side_damage then
			return
		elseif ALIVE[owner_unit] and damage_type ~= "temporary_health_degen" then
			local buff_template = buff.template
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local reference_buff_name = buff_template.reference_buff
			local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

			if reference_buff.buff_list then
				local buff_id = table.remove(reference_buff.buff_list)

				buff_extension:remove_buff(buff_id)
			end
		end
	end,
	add_buff_on_headshot = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local hit_zone = params[3]

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") then
				local buff_template = buff.template
				local attack_type = params[2]
				local allowed_attacks = buff_template.allowed_attacks

				if allowed_attacks and not allowed_attacks[attack_type] then
					return
				end

				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	sienna_unchained_add_buff_on_vent_damage = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local damage_type = params[3]

			if damage_type and damage_type == "overcharge" then
				local buff_template = buff.template
				local buff_list = buff_template.buffs_to_add

				for i = 1, #buff_list do
					local buff_name = buff_list[i]
					local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_object_id = network_manager:unit_game_object_id(owner_unit)
					local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

					if is_server() then
						buff_extension:add_buff(buff_name, {
							attacker_unit = owner_unit,
						})
						network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	sienna_on_kill_explosion = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local killed_unit = params[3]

		if ALIVE[owner_unit] then
			local ai_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")
			local buff_template = buff.template
			local proc_chance = buff_template.proc_chance

			if proc_chance >= math.random() and (ai_buff_extension and ai_buff_extension:has_buff_perk(buff_perks.burning) or ai_buff_extension:has_buff_perk(buff_perks.burning_balefire) or ai_buff_extension:has_buff_perk(buff_perks.burning_elven_magic)) then
				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
				local area_damage_system = Managers.state.entity:system("area_damage_system")
				local position = POSITION_LOOKUP[killed_unit]
				local damage_source = "buff"
				local explosion_template = "sienna_unchained_burning_enemies_explosion"
				local rotation = Quaternion.identity()
				local career_power_level = career_extension:get_career_power_level()
				local scale = 1
				local is_critical_strike = false

				area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, damage_source, career_power_level, is_critical_strike)
			end
		end
	end,
	sienna_burn_push_on_charged_attacks = function (owner_unit, buff, params)
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	sienna_burn_push_on_charged_attacks_remove = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	add_buff_on_ranged_headshot = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_zone = params[3]
			local buff_type = params[2] == "light_attack" or params[2] == "heavy_attack"

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") and not buff_type then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	bardin_ranger_add_reload_speed_buff = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local buff_type = params[5]

			if buff_type ~= "MELEE_1H" and buff_type ~= "MELEE_2H" then
				local target_number = params[4]
				local required_target = template.target_number

				if required_target <= target_number then
					buff_extension:add_buff(buff_to_add)
				end
			end
		end
	end,
	remove_non_stacking_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local template = buff.template
			local buff_to_remove = template.buff_to_remove
			local removable_buff = buff_extension:get_non_stacking_buff(buff_to_remove)

			if removable_buff then
				buff_extension:remove_buff(removable_buff.id)
			end
		end
	end,
	add_bardin_slayer_passive_buff = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")

		if Unit.alive(owner_unit) then
			local buff_name = "bardin_slayer_passive_stacking_damage_buff"
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if talent_extension:has_talent("bardin_slayer_passive_increased_max_stacks", "dwarf_ranger", true) then
				buff_name = "bardin_slayer_passive_increased_max_stacks"
			end

			buff_system:add_buff(owner_unit, buff_name, owner_unit, false)

			if talent_extension:has_talent("bardin_slayer_passive_movement_speed", "dwarf_ranger", true) then
				buff_system:add_buff(owner_unit, "bardin_slayer_passive_movement_speed", owner_unit, false)
			end

			if talent_extension:has_talent("bardin_slayer_passive_cooldown_reduction_on_max_stacks", "dwarf_ranger", true) then
				local num_stacks = buff_extension:num_buff_type(buff_name)
				local max_stacks = buff.template.max_stacks

				if num_stacks == max_stacks then
					buff_system:add_buff(owner_unit, "bardin_slayer_passive_cooldown_reduction_on_max_stacks", owner_unit, false)
				end
			end
		end
	end,
	bardin_slayer_self_revive_on_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_template = buff.template

			if not buff_template.kill_count then
				buff_template.kill_count = 0
			end

			buff_template.kill_count = buff_template.kill_count + 1

			local kill_requirement = buff_template.kill_requirement

			if kill_requirement <= buff_template.kill_count then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	remove_fatigue = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local fatigue_amount = buff.bonus
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:remove_fatigue_points(fatigue_amount)
		end
	end,
	increase_attack_speed = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local speed_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = speed_increase
			buff_params.external_optional_duration = duration

			buff_extension:add_buff("increased_attack_speed", buff_params)
		end
	end,
	increase_critical_hit_chance = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local crit_chance_increase = buff_template.inherited_bonus
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_bonus = crit_chance_increase
			buff_params.external_optional_duration = duration

			buff_extension:add_buff("increased_critical_hit_chance", buff_params)
		end
	end,
	remove_overcharge = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if Unit.alive(owner_unit) then
			local overcharge_amount = buff.bonus
			local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

			overcharge_extension:remove_charge(overcharge_amount)
		end
	end,
	shade_activated_ability_on_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_unit = params[1]
			local behind_target = ActionUtils.is_backstab(owner_unit, hit_unit)

			if behind_target then
				local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

				if first_person_extension then
					first_person_extension:play_hud_sound_event("Play_career_ability_shade_backstab")
				end
			end

			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

			if buff.template.can_restealth_on_remove and talent_extension:has_talent("kerillian_shade_activated_ability_restealth") then
				local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

				if first_person_extension then
					first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter")
					first_person_extension:animation_event("shade_stealth_ability")
				end
			end

			if buff.triggering_action_start_t then
				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
				local weapon_unit = inventory_extension:get_weapon_unit()
				local weapon_unit_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

				if weapon_unit_extension:has_current_action() then
					local current_action = weapon_unit_extension:get_current_action()
					local action_start_t = current_action.action_start_t

					if action_start_t == buff.triggering_action_start_t then
						return
					end
				end
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	kerillian_shade_cheat_death_damage_taken = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[owner_unit] then
			local buff_to_add = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, "kerillian_shade_activated_ability_cheat_death_blocker", owner_unit, false)
			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			buff_system:remove_buff_synced(owner_unit, buff.id)
		end
	end,
	shade_combo_stealth_on_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if not buff_extension:has_buff_type("kerillian_shade_ult_invis_combo_blocker") then
				buff_extension:add_buff("kerillian_shade_ult_invis_combo_window")
			end
		end
	end,
	shade_combo_stealth_extend_on_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local has_buff = buff_extension:get_buff_type("kerillian_shade_ult_invis")

			if has_buff then
				local extend_time = buff.template.extend_time
				local t = Managers.time:time("game")
				local new_duration = extend_time + has_buff.start_time - t + has_buff.duration

				has_buff.start_time = t
				has_buff.duration = new_duration
				buff.killed_target = true
			end
		end
	end,
	shade_short_stealth_on_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	shade_backstab_ammo_gain = function (owner_unit, buff, params)
		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if buff_extension and not buff_extension:has_buff_type("kerillian_shade_backstabs_replenishes_ammunition_cooldown") then
			if ALIVE[owner_unit] then
				local weapon_slot = "slot_ranged"
				local ammo_amount = buff.bonus
				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(weapon_slot)
				local right_unit_1p = slot_data.right_unit_1p
				local left_unit_1p = slot_data.left_unit_1p
				local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
				local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
				local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

				if ammo_extension then
					ammo_extension:add_ammo_to_reserve(ammo_amount)
				end
			end

			buff_extension:add_buff("kerillian_shade_backstabs_replenishes_ammunition_cooldown")
		end
	end,
	end_huntsman_stealth = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and is_local(owner_unit) then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:set_invisible(false, nil, "huntsman_ability")

			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit", nil, true)
			first_person_extension:play_remote_hud_sound_event("Stop_career_ability_markus_huntsman_loop_husk")

			if not is_bot(owner_unit) then
				Managers.state.camera:set_mood("skill_huntsman_stealth", "skill_huntsman_stealth", false)
				Managers.state.camera:set_mood("skill_huntsman_surge", "skill_huntsman_surge", true)
				first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")
			end
		end

		return true
	end,
	end_huntsman_activated_ability = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local huntsman_activated_ability_buff = buff_extension:get_non_stacking_buff("markus_huntsman_activated_ability")

			if huntsman_activated_ability_buff then
				buff_extension:remove_buff(huntsman_activated_ability_buff.id)
			end
		end
	end,
	increased_movement_speed = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local speed_increase = buff_template.inherited_multiplier
			local duration = buff_template.inherited_duration

			table.clear(buff_params)

			buff_params.external_optional_multiplier = speed_increase
			buff_params.external_optional_duration = duration

			buff_extension:add_buff("increased_movement_speed_from_proc", buff_params)
		end
	end,
	ammo_gain = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	ammo_fraction_gain = function (owner_unit, buff, params)
		local player = Managers.player:owner(owner_unit)

		if player and player.remote then
			return
		end

		if Unit.alive(owner_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
			local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	add_buff_on_out_of_ammo = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local buffs = buff_template.buffs_to_add

			for i = 1, #buffs do
				local buff_name = buffs[i]
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	victor_bounty_hunter_reload_on_kill = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local killing_blow = params[1]
			local damage_source_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]

			do
				local weapon_slot = "slot_melee"
				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(weapon_slot)

				if not slot_data then
					return
				end

				local item_data = slot_data.item_data

				if damage_source_name ~= item_data.name then
					return
				end
			end

			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local current_ammo = ammo_extension:remaining_ammo()

			if current_ammo >= 1 and ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false

				ammo_extension:remove_ammo(1)
			end
		end
	end,
	victor_bounty_hunter_ammo_regen = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false
			else
				ammo_extension:add_ammo(1)
			end
		end
	end,
	victor_bounty_blast_streak_activation = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local killing_blow = params[1]
			local damage_source_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if damage_source_name ~= "victor_bountyhunter_career_skill_weapon" then
				return
			end

			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
			local unit_object_id = network_manager:unit_game_object_id(owner_unit)

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit,
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	victor_bounty_blast_streak_buff = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local damage_type = params[5]

			if damage_type ~= "RANGED_ABILITY" then
				return
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	victor_bountyhunter_blessed_combat = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local attack_type = params[2]

		if not attack_type then
			return
		end

		local buff_template = buff.template
		local buff_name = ""
		local is_melee = false
		local is_ranged = false

		if attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "heavy_instant_projectile" then
			local t = Managers.time:time("game")

			if not buff.t then
				buff.t = 0
			end

			if buff.t == t then
				return false
			end

			buff.t = t
			is_ranged = true
			buff_name = buff_template.melee_buff
		elseif attack_type == "light_attack" or attack_type == "heavy_attack" then
			local target_number = params[4]

			if target_number > 1 then
				return false
			end

			is_melee = true
			buff_name = buff_template.ranged_buff
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")

		if is_ranged then
			if #buff_template.melee_buff_ids < 6 then
				table.insert(buff_template.melee_buff_ids, buff_system:add_buff(owner_unit, buff_name, owner_unit, true))
			end

			if buff_extension:has_buff_type(buff_template.ranged_buff) then
				buff_system:remove_server_controlled_buff(owner_unit, buff_template.ranged_buff_ids[#buff_template.ranged_buff_ids])
				table.remove(buff_template.ranged_buff_ids, #buff_template.ranged_buff_ids)
			else
				table.clear(buff_template.ranged_buff_ids)
			end
		end

		if is_melee then
			if #buff_template.ranged_buff_ids < 6 then
				table.insert(buff_template.ranged_buff_ids, buff_system:add_buff(owner_unit, buff_name, owner_unit, true))
			end

			if buff_extension:has_buff_type(buff_template.melee_buff) then
				buff_system:remove_server_controlled_buff(owner_unit, buff_template.melee_buff_ids[#buff_template.melee_buff_ids])
				table.remove(buff_template.melee_buff_ids, #buff_template.melee_buff_ids)
			else
				table.clear(buff_template.melee_buff_ids)
			end
		end
	end,
	add_team_buff_on_ranged_critical_hit = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_type = params[5]
			local is_critical = params[6]

			if is_critical and not MeleeBuffTypes[buff_type] then
				local side = Managers.state.side.side_by_unit[owner_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local num_targets = #player_and_bot_units
				local range = 40
				local buff_template = buff.template
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local owner_position = POSITION_LOOKUP[owner_unit]
				local range_squared = range * range

				for i = 1, num_targets do
					local target_unit = player_and_bot_units[i]
					local ally_position = POSITION_LOOKUP[target_unit]
					local distance_squared = Vector3.distance_squared(owner_position, ally_position)

					if distance_squared < range_squared then
						local buff_to_add = buff_template.buff_to_add
						local target_unit_object_id = network_manager:unit_game_object_id(target_unit)
						local target_buff_extension = ScriptUnit.extension(target_unit, "buff_system")
						local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]

						if is_server() then
							target_buff_extension:add_buff(buff_to_add)
							network_transmit:send_rpc_clients("rpc_add_buff", target_unit_object_id, buff_template_name_id, unit_object_id, 0, false)
						else
							network_transmit:send_rpc_server("rpc_add_buff", target_unit_object_id, buff_template_name_id, unit_object_id, 0, true)
						end
					end
				end
			end
		end
	end,
	victor_bounty_hunter_ammo_fraction_gain_out_of_ammo = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.elite then
				local buff_template = buff.template
				local weapon_slot = "slot_ranged"
				local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(weapon_slot)
				local right_unit_1p = slot_data.right_unit_1p
				local left_unit_1p = slot_data.left_unit_1p
				local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
				local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
				local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
				local current_ammo = ammo_extension:remaining_ammo()
				local clip_ammo = ammo_extension:ammo_count()

				if current_ammo < 1 and clip_ammo < 1 then
					local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
					local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

					if ammo_extension then
						ammo_extension:add_ammo_to_reserve(ammo_amount)
					end
				end
			end
		end
	end,
	ammo_fraction_gain_on_crit_trait = function (owner_unit, buff, params)
		local player = Managers.player:owner(owner_unit)

		if player and player.remote then
			return
		end

		if Unit.alive(owner_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local target_number = params[4]
			local attack_type = params[2]
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction

			if ammo_extension and (attack_type == "instant_projectile" or attack_type == "projectile" or attack_type == "heavy_instant_projectile") then
				local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

				if target_number == 1 then
					buff.has_procced = false
				end

				local has_procced = buff.has_procced

				if not has_procced then
					ammo_extension:add_ammo_to_reserve(ammo_amount)

					buff.has_procced = true
				end
			end
		end
	end,
	ammo_gain_when_low = function (owner_unit, buff, params)
		local player = Managers.player:owner(owner_unit)

		if player and player.remote then
			return
		end

		if Unit.alive(owner_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local activate_bonus = ammo_percent < buff_template.activation_ammo
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction
			local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

			if ammo_extension and activate_bonus then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	markus_huntsman_passive_proc = function (owner_unit, buff, params)
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile" or attack_type == "heavy_instant_projectile") then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

			if talent_extension:has_talent("markus_huntsman_passive_crit_buff_on_headshot", "empire_soldier", true) then
				buff_extension:add_buff("markus_huntsman_passive_crit_buff")
				buff_extension:add_buff("markus_huntsman_passive_crit_buff_removal")
			end

			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	markus_huntsman_free_shot = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		if ALIVE[owner_unit] then
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	markus_huntsman_ult_on_death = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local health_extension = ScriptUnit.extension(owner_unit, "health_system")
			local damage_taken = params[2]

			if health_extension:current_health() - damage_taken < 0 then
				if Managers.player.is_server then
					DamageUtils.heal_network(owner_unit, owner_unit, 30, "heal_from_proc")
					DamageUtils.add_damage_network(owner_unit, owner_unit, health_extension:current_health() - 1, "torso", "buff", nil, Vector3(0, 0, 0), nil, nil, owner_unit, nil, nil, nil, nil, nil, nil, nil, nil, 1)
				end

				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

				career_extension:start_activated_ability_cooldown()
				career_extension:set_activated_ability_cooldown_paused()
				career_extension:force_trigger_active_ability()

				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local template = buff.template
				local buff_name = template.buff_to_add
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = owner_unit,
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	markus_huntsman_debuff_defence = function (owner_unit, buff, params)
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	markus_huntsman_passive_on_melee_kills = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local template = buff.template
		local buff_to_add = template.counter_buff_to_add
		local buff_name = template.buff_to_add
		local num_stacks = buff_extension:num_buff_type(buff_to_add)
		local max_sub_buff_stacks = template.max_sub_buff_stacks - 1

		if max_sub_buff_stacks <= num_stacks then
			if template.reference_buff then
				local reference_buff_name = template.reference_buff
				local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

				max_sub_buff_stacks = reference_buff.template.max_sub_buff_stacks

				if not reference_buff.buff_list then
					reference_buff.buff_list = {}
				end

				if max_sub_buff_stacks > #reference_buff.buff_list then
					table.insert(reference_buff.buff_list, buff_extension:add_buff(buff_name))
				end
			else
				if not buff.buff_list then
					buff.buff_list = {}
				end

				if max_sub_buff_stacks > #buff.buff_list then
					table.insert(buff.buff_list, buff_extension:add_buff(buff_name))
				end
			end
		end

		buff_extension:add_buff(buff_to_add)
	end,
	remove_buff_stack = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension then
				local template = buff.template
				local remove_buff_stack_data_array = template.remove_buff_stack_data

				for i = 1, #remove_buff_stack_data_array do
					local remove_buff_stack_data = remove_buff_stack_data_array[i]
					local buff_to_remove_name = remove_buff_stack_data.buff_to_remove
					local num_stacks = remove_buff_stack_data.num_stacks or 1

					if remove_buff_stack_data.server_controlled then
						fassert(buff_to_remove_name == template.buff_to_add, "Trying to remove different type of server controlled buff, only same types are allowed right now.")

						local buff_system = Managers.state.entity:system("buff_system")
						local server_buff_ids = buff.server_buff_ids

						num_stacks = server_buff_ids and math.min(#server_buff_ids, num_stacks) or 0

						for _ = 1, num_stacks do
							local buff_to_remove = table.remove(server_buff_ids)

							buff_system:remove_server_controlled_buff(owner_unit, buff_to_remove)
						end
					else
						for _ = 1, num_stacks do
							local buff_to_remove = buff_extension:get_buff_type(buff_to_remove_name)

							if not buff_to_remove then
								break
							end

							buff_extension:remove_buff(buff_to_remove.id)
						end
					end

					if remove_buff_stack_data.reset_update_timer then
						local t = Managers.time:time("game")

						buff._next_update_t = t + (template.update_frequency or 0)
					end
				end
			end
		end
	end,
	markus_huntsman_increase_reload_speed = function (owner_unit, buff, params)
		local attack_type = params[2]
		local hit_zone_name = params[3]
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile" or attack_type == "heavy_instant_projectile") then
			buff_extension:add_buff("markus_huntsman_headshots_increase_reload_speed_buff")
		end
	end,
	replenish_ammo_on_headshot_ranged = function (owner_unit, buff, params)
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if ALIVE[owner_unit] and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile" or attack_type == "heavy_instant_projectile") then
			local ranged_buff_type = params[5]

			if ranged_buff_type and ranged_buff_type == "RANGED_ABILITY" then
				return
			end

			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	reset_tranquility = function (owner_unit, buff, params)
		local attacker_unit = params[1]
		local damage_amount = params[2]
		local damaged = true

		if damage_amount and damage_amount == 0 then
			damaged = false
		end

		if ALIVE[owner_unit] and attacker_unit ~= owner_unit and damaged then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local tranquility_buff = buff_extension:get_non_stacking_buff("tranquility")

			if tranquility_buff then
				buff_extension:remove_buff(tranquility_buff.id)
			end

			local buff_to_add = "sienna_adept_passive"
			local talent_extension = ScriptUnit.has_extension(owner_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("sienna_adept_passive_cooldown") then
				buff_to_add = "sienna_adept_passive_cooldown"
			end

			buff_extension:add_buff(buff_to_add)
		end
	end,
	maidenguard_remove_on_block_speed_buff = function (owner_unit, buff, params, world, param_order)
		if ALIVE[owner_unit] then
			local target_index = params[param_order.target_number]
			local template = buff.template
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local reference_buff_names = template.reference_buffs

			for i = 1, #reference_buff_names do
				local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_names[i])

				if reference_buff and reference_buff.buff_list and target_index and target_index == 1 then
					local buff_to_remove = table.remove(reference_buff.buff_list, #reference_buff.buff_list)

					if buff_to_remove then
						buff_system:remove_buff_synced(owner_unit, buff_to_remove)
					end
				end
			end
		end
	end,
	maidenguard_footwork_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local buff_template = buff.template

			if status_extension.blocking then
				local buffs_to_add = buff_template.dodge_buffs_to_add

				for i = 1, #buffs_to_add do
					local buff_to_add = buffs_to_add[i]

					buff_extension:add_buff(buff_to_add)
				end
			else
				local buff_to_add = buff_template.attack_buff_to_add
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(owner_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]

				if unit_object_id then
					if is_server() then
						buff_extension:add_buff(buff_to_add, {
							attacker_unit = owner_unit,
						})
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	maidenguard_footwork_on_dodge_end = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if buff then
				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	maidenguard_reset_unharmed_buff = function (owner_unit, buff, params)
		local attacker_unit = params[1]
		local damage_amount = params[2]
		local damaged = true

		if damage_amount and damage_amount == 0 then
			damaged = false
		end

		if ALIVE[owner_unit] and attacker_unit ~= owner_unit and damaged then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local buff_name = "kerillian_maidenguard_power_level_on_unharmed_cooldown"
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(owner_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit,
				})
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end

			return true
		end
	end,
	buff_on_stagger_enemy = function (owner_unit, buff, params)
		local buff_template = buff.template
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local hit_unit = params[1]
		local breed = Unit.get_data(hit_unit, "breed")
		local buff_name = buff_template.buff_to_add
		local enemy_type_list = buff_template.enemy_type or nil
		local add_buff = false

		if breed and enemy_type_list then
			for i = 1, #enemy_type_list do
				local enemy_type = enemy_type_list[i]

				if breed[enemy_type] then
					add_buff = true
				end
			end
		elseif breed then
			add_buff = true
		end

		if add_buff then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(owner_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = owner_unit,
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	buff_on_blocked_attack = function (owner_unit, buff, params)
		local buff_template = buff.template
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_to_add = buff_template.buff_to_add

		buff_extension:add_buff(buff_to_add)
	end,
	gain_markus_mercenary_passive_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_template = buff.template
		local target_number = params[4]
		local attack_type = params[2]
		local buff_to_add = buff_template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_applied = true

		if ALIVE[owner_unit] and target_number and target_number >= buff_template.targets and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

			if talent_extension:has_talent("markus_mercenary_passive_improved", "empire_soldier", true) then
				if target_number >= 4 then
					buff_system:add_buff(owner_unit, "markus_mercenary_passive_improved", owner_unit, false)
				else
					buff_applied = false
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_group_proc", "empire_soldier", true) then
				local side = Managers.state.side.side_by_unit[owner_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local num_units = #player_and_bot_units

				for i = 1, num_units do
					local unit = player_and_bot_units[i]

					if HEALTH_ALIVE[unit] then
						buff_system:add_buff(unit, buff_to_add, owner_unit, false)
					end
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_power_level_on_proc", "empire_soldier", true) then
				buff_system:add_buff(owner_unit, "markus_mercenary_passive_power_level", owner_unit, false)
				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			else
				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			end

			if talent_extension:has_talent("markus_mercenary_passive_defence_on_proc", "empire_soldier", true) and buff_applied then
				buff_system:add_buff(owner_unit, "markus_mercenary_passive_defence", owner_unit, false)
			end
		end
	end,
	reduce_activated_ability_cooldown = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attack_type = params[2]
			local target_number = params[4]
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")

			if not attack_type or attack_type == "heavy_attack" or attack_type == "light_attack" then
				career_extension:reduce_activated_ability_cooldown(buff.bonus)
			elseif target_number and target_number == 1 then
				career_extension:reduce_activated_ability_cooldown(buff.bonus)
			end
		end
	end,
	victor_bountyhunter_reduce_activated_ability_cooldown_ignore_paused_on_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local killing_blow_table = params[1]
			local killing_blow_damage_source = killing_blow_table[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")

			if career_extension and killing_blow_damage_source ~= "victor_bountyhunter_career_skill_weapon" then
				local ignore_paused = true

				career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier, nil, ignore_paused)
			end
		end
	end,
	victor_bountyhunter_reduce_activated_ability_cooldown_on_passive_crit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local t = Managers.time:time("game")

			if not buff.cooldown or t > buff.cooldown then
				local attack_type = params[2]

				if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
					local career_extension = ScriptUnit.extension(owner_unit, "career_system")

					if career_extension then
						local template = buff.template
						local cooldown = template.cooldown

						career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier, nil)

						buff.cooldown = t + cooldown
					end
				end
			end
		end
	end,
	victor_bounty_hunter_reduce_activated_ability_cooldown_railgun = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number and target_number <= 1 then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local buff_to_add = buff.template.buff_to_add

				buff_extension:add_buff(buff_to_add)

				buff.can_trigger = false
			end
		end
	end,
	kerillian_waywatcher_reduce_activated_ability_cooldown = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number and target_number <= 1 then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local career_extension = ScriptUnit.extension(owner_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier)

				buff.can_trigger = false
			end
		end
	end,
	kerillian_waywatcher_add_extra_shot_buff_on_melee_kill = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit,
		})
	end,
	kerillian_waywatcher_consume_extra_shot_buff = function (owner_unit, buff, params, worlds, params_lookup)
		return true
	end,
	reduce_activated_ability_cooldown_boss_hit = function (owner_unit, buff, params)
		local hit_unit = params[1]
		local target_number = params[2]

		if ALIVE[owner_unit] then
			local breed = Unit.get_data(hit_unit, "breed")

			if target_number <= 1 then
				buff.can_trigger = true
			end

			if breed and breed.boss and buff.can_trigger then
				local career_extension = ScriptUnit.extension(owner_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown(buff.bonus)

				buff.can_trigger = false
			end
		end
	end,
	reduce_activated_ability_cooldown_with_internal_cooldown_on_crit = function (owner_unit, buff, params)
		local attack_type = params[2]
		local buff_type = params[5]
		local valid_attack

		if RangedBuffTypes[buff_type] then
			valid_attack = attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe" or attack_type == "heavy_instant_projectile"
		else
			valid_attack = attack_type == "light_attack" or attack_type == "heavy_attack"
		end

		if valid_attack and ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			if not buff_extension:has_buff_type(buff_to_add) then
				local career_extension = ScriptUnit.extension(owner_unit, "career_system")

				buff_extension:add_buff(buff_to_add)
				career_extension:reduce_activated_ability_cooldown_percent(buff.bonus)
			end
		end
	end,
	reduce_activated_ability_cooldown_on_damage_taken = function (owner_unit, buff, params)
		local attacker_unit = params[1]
		local damage_taken = params[2]

		if ALIVE[owner_unit] and attacker_unit ~= owner_unit then
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")
			local cooldown_removed = buff.bonus * damage_taken

			career_extension:reduce_activated_ability_cooldown(cooldown_removed)
		end
	end,
	sienna_adept_reduce_activated_ability_cooldown_on_burning_enemy_killed = function (owner_unit, buff, params)
		local killed_unit = params[3]

		if ALIVE[killed_unit] then
			local killed_unit_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

			if killed_unit_buff_extension and killed_unit_buff_extension:has_buff_perk(buff_perks.burning) or killed_unit_buff_extension:has_buff_perk(buff_perks.burning_balefire) or killed_unit_buff_extension:has_buff_perk(buff_perks.burning_elven_magic) then
				local t = Managers.time:time("game")
				local cooldown_timer = buff.cooldown_timer

				if not cooldown_timer or cooldown_timer <= t then
					local template = buff.template
					local internal_cooldown = template.internal_cooldown
					local cooldown_removed = template.cooldown_reduction
					local career_extension = ScriptUnit.extension(owner_unit, "career_system")

					career_extension:reduce_activated_ability_cooldown_percent(cooldown_removed)

					buff.cooldown_timer = t + internal_cooldown
				end
			end
		end
	end,
	remove_victor_bountyhunter_passive_crit_buff = function (owner_unit, buff, params)
		local action_type = params[1]
		local melee_action = action_type == "sweep" or action_type == "push_stagger" or action_type == "shield_slam"

		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local crit_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_crit_buff")

			if crit_buff and not melee_action then
				buff_extension:remove_buff(crit_buff.id)

				local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

				if talent_extension:has_talent("victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
					buff_extension:add_buff("victor_bountyhunter_passive_reduced_cooldown")
				else
					buff_extension:add_buff("victor_bountyhunter_passive_crit_cooldown")
				end
			end
		end
	end,
	remove_markus_huntsman_passive_crit_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local crit_buff = buff_extension:get_non_stacking_buff("markus_huntsman_passive_crit_buff")

			if crit_buff then
				buff_extension:remove_buff(crit_buff.id)
			end
		end
	end,
	mark_for_delayed_deletion = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			buff.marked_for_deletion = true
		end
	end,
	gain_uninterruptible = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("uninterruptible")
		end
	end,
	gain_bardin_slayer_uninterruptible_on_block_broken_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("bardin_slayer_uninterruptible_on_block_broken_buff")
		end
	end,
	bardin_slayer_add_buff_on_leap_start = function (owner_unit, buff, params)
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		if ALIVE[owner_unit] and Managers.player.is_server then
			buff.server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
		end
	end,
	bardin_slayer_remove_buff_on_leap_finished = function (owner_unit, buff, params)
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
		local parent_buff_name = buff.template.parent_buff

		if ALIVE[owner_unit] and Managers.player.is_server then
			local parent_buff = buff_extension:get_non_stacking_buff(parent_buff_name)

			if parent_buff then
				local sub_buff_id = parent_buff.server_buff_id

				if sub_buff_id then
					buff_system:remove_server_controlled_buff(owner_unit, sub_buff_id)
				end
			end
		end
	end,
	gain_markus_knight_uninterruptible_on_block_broken_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("markus_knight_uninterruptible_on_block_broken_buff")
		end
	end,
	markus_knight_guard_damage_taken = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local damage_amount = params[2]
			local damage_type = params[3]

			if damage_type == "temporary_health_degen" then
				return
			end

			local knight_unit = buff.attacker_unit
			local breed = AiUtils.unit_breed(knight_unit)
			local fatigue_type = {
				cataclysm = "blocked_attack",
				cataclysm_2 = "blocked_attack",
				cataclysm_3 = "blocked_attack",
				easy = "blocked_attack",
				hard = "blocked_attack",
				harder = "blocked_attack",
				hardest = "blocked_attack",
				normal = "blocked_attack",
				versus_base = "blocked_attack",
			}

			if breed and breed.name == "hero_es_knight" and not DamageUtils.check_block(owner_unit, knight_unit, fatigue_type, "front") then
				DamageUtils.add_damage_network(knight_unit, knight_unit, damage_amount, "full", "forced", nil, Vector3(1, 0, 0), "buff", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
			end
		end
	end,
	markus_knight_reduce_cooldown_on_stagger = function (owner_unit, buff, params)
		local buff_template = buff.template
		local hit_unit = params[1]
		local breed = Unit.get_data(hit_unit, "breed")
		local enemy_type_list = buff_template.enemy_type or nil
		local add_buff = false

		if breed and enemy_type_list then
			for i = 1, #enemy_type_list do
				local enemy_type = enemy_type_list[i]

				if breed[enemy_type] then
					add_buff = true

					break
				end
			end
		elseif breed then
			add_buff = true
		end

		if add_buff then
			local side = Managers.state.side.side_by_unit[owner_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_targets = #player_and_bot_units
			local range = 40
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(owner_unit)
			local owner_position = POSITION_LOOKUP[owner_unit]
			local range_squared = range * range

			for i = 1, num_targets do
				local target_unit = player_and_bot_units[i]
				local ally_position = POSITION_LOOKUP[target_unit]
				local distance_squared = Vector3.distance_squared(owner_position, ally_position)

				if distance_squared < range_squared then
					local buff_to_add = buff_template.buff_to_add
					local target_unit_object_id = network_manager:unit_game_object_id(target_unit)
					local target_buff_extension = ScriptUnit.extension(target_unit, "buff_system")
					local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]

					if is_server() then
						target_buff_extension:add_buff(buff_to_add)
						network_transmit:send_rpc_clients("rpc_add_buff", target_unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", target_unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	gain_kerillian_maidenguard_uninterruptible_on_block_broken_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff("kerillian_maidenguard_uninterruptible_on_block_broken_buff")
		end
	end,
	victor_bountyhunter_activate_passive_on_melee_kill = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local cooldown_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_crit_cooldown")
		local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

		if talent_extension:has_talent("victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
			cooldown_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_reduced_cooldown")
		end

		if cooldown_buff then
			cooldown_buff.duration = 0
		end
	end,
	on_kill_add_remove = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local buff_template = buff.template
		local buff_data = buff_template.on_kill_add_remove_data

		if not buff_data then
			return
		end

		local required_weapon_type = buff_data.weapon_type

		if required_weapon_type then
			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if required_weapon_type == "melee" then
				if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
					return
				end
			elseif required_weapon_type == "ranged" and (not attack_type or attack_type ~= "instant_projectile" and attack_type ~= "projectile" or attack_type == "heavy_instant_projectile") then
				return
			end
		end

		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if buff_extension then
			local requirements = buff_data.requirements

			if requirements then
				local buffs_exist = requirements.buffs_exist

				if buffs_exist then
					for i = 1, #buffs_exist do
						if not buff_extension:has_buff_type(buffs_exist[i]) then
							return
						end
					end
				end

				local buffs_not_exist = requirements.buffs_not_exist

				if buffs_not_exist then
					for i = 1, #buffs_not_exist do
						if buff_extension:has_buff_type(buffs_not_exist[i]) then
							return
						end
					end
				end
			end

			local buffs_to_add = buff_data.buffs_to_add

			if buffs_to_add then
				for i = 1, #buffs_to_add do
					buff_extension:add_buff(buffs_to_add[i])
				end
			end

			local buffs_to_remove = buff_data.buffs_to_remove

			if buffs_to_remove then
				for i = 1, #buffs_to_remove do
					local buff_to_remove = buff_extension:get_non_stacking_buff(buffs_to_remove[i])

					if buff_to_remove then
						buff_extension:remove_buff(buff_to_remove.id)
					end
				end
			end
		end
	end,
	event_hud_sfx = function (owner_unit, buff, params)
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		if first_person_extension then
			local sound_to_play = buff.template.sound_to_play

			first_person_extension:play_hud_sound_event(sound_to_play, nil, false)
		end
	end,
	ignore_death_func = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local already_invulnerable = buff_extension:has_buff_perk("invulnerable")

		if already_invulnerable then
			return
		end

		local template = buff.template
		local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")
		local health_threshold = template.health_threshold
		local current_health = health_extension:current_health()
		local max_health = health_extension:get_max_health()
		local damage_amount = params[2]

		if damage_amount <= 0 then
			return
		end

		local percent_health_after_damage = (current_health - damage_amount) / max_health

		if percent_health_after_damage <= 0 and buff_extension:has_buff_perk("ignore_death") then
			return
		end

		local damage_source = params[3]

		if percent_health_after_damage < health_threshold and damage_source ~= "life_tap" then
			local condition_func = template.condition_func
			local player = Managers.player:owner(owner_unit)

			if condition_func and not condition_func(player, buff, params) then
				return
			end

			local damage_to_deal = current_health - damage_amount > 1 and damage_amount or current_health - 1

			DamageUtils.add_damage_network(owner_unit, owner_unit, damage_to_deal, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, owner_unit, nil, nil, nil, nil, nil, nil, nil, nil, 1)

			local buffs_to_add = template.buffs_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			for i = 1, #buffs_to_add do
				local buff_to_add = buffs_to_add[i]

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	apply_dot_on_hit = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local damage_profile, target_index
		local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
		local full_power_level = career_extension and career_extension:get_career_power_level() or DefaultPowerLevel
		local hit_unit = params[1]
		local hit_zone_name
		local damage_source = "buff"
		local boost_curve_multiplier
		local is_critical_strike = false
		local explosion_data
		local source_attacker_unit = buff.source_attacker_unit or owner_unit
		local custom_dot = FrameTable.alloc_table()

		custom_dot.dot_template_name = buff.template.dot_template_name

		DamageUtils.apply_dot(damage_profile, target_index, full_power_level, hit_unit, owner_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, explosion_data, source_attacker_unit, custom_dot)
	end,
	dummy_function = function (owner_unit, buff, params)
		return true
	end,
	add_buff_synced = function (owner_unit, buff, params)
		BuffFunctionTemplates.functions.add_buff_synced(owner_unit, buff, params)
	end,
	remove_buff_synced = function (owner_unit, buff, params)
		BuffFunctionTemplates.functions.remove_buff_synced(owner_unit, buff, params)
	end,
	add_kill_timer = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		buff_extension:add_buff("enemy_kill_timer_buff")
	end,
}
StackingBuffFunctions = {
	add_remove_buffs = function (unit, sub_buff_template, new_buff_params, is_overflow)
		if ALIVE[unit] then
			local max_stack_data = sub_buff_template.max_stack_data

			if max_stack_data then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				do
					local buffs_to_add = max_stack_data.buffs_to_add

					if buffs_to_add then
						for i = 1, #buffs_to_add do
							buff_extension:add_buff(buffs_to_add[i])
						end
					end
				end

				if is_overflow then
					local overflow_buffs_to_add = max_stack_data.overflow_buffs_to_add

					if overflow_buffs_to_add then
						for i = 1, #overflow_buffs_to_add do
							buff_extension:add_buff(overflow_buffs_to_add[i])
						end
					end
				end

				local talent_buffs = max_stack_data.talent_buffs

				if talent_buffs then
					local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

					if talent_extension then
						for name, data in pairs(talent_buffs) do
							local buffs_to_add = data.buffs_to_add
							local buffs_to_add_if_missing = data.buffs_to_add_if_missing
							local has_talent = talent_extension:has_talent(name)

							if has_talent and buffs_to_add then
								for i = 1, #buffs_to_add do
									local buff_to_add = buffs_to_add[i]

									if not buff_to_add.only_if_overflow or is_overflow then
										local buff_name = buff_to_add.name

										if data.rpc_sync then
											local buff_system = Managers.state.entity:system("buff_system")

											buff_system:add_buff(unit, buff_name, unit, false)
										else
											buff_extension:add_buff(buff_name)
										end
									end
								end
							elseif not has_talent and buffs_to_add_if_missing then
								for i = 1, #buffs_to_add_if_missing do
									local buff_to_add = buffs_to_add_if_missing[i]

									if not buff_to_add.only_if_overflow or is_overflow then
										local buff_name = buff_to_add.name

										if data.rpc_sync then
											local buff_system = Managers.state.entity:system("buff_system")

											buff_system:add_buff(unit, buff_name, unit, false)
										else
											buff_extension:add_buff(buff_name)
										end
									end
								end
							end
						end
					end
				end

				local buffs_to_remove = max_stack_data.buffs_to_remove

				if buffs_to_remove then
					for i = 1, #buffs_to_remove do
						local buff = buff_extension:get_non_stacking_buff(buffs_to_remove[i])

						if buff then
							buff_extension:remove_buff(buff.id)
						end
					end
				end
			end
		end

		return false
	end,
	reapply_buff = function (unit, sub_buff_template, new_buff_params, is_overflow)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_stacks = buff_extension:get_stacking_buff(sub_buff_template.name)

			if buff_stacks then
				local oldest_buff_t = -math.huge
				local oldest_buff
				local t = Managers.time:time("game")

				for i = 1, #buff_stacks do
					local buff = buff_stacks[i]
					local time_spanned = t - buff.start_time

					if oldest_buff_t < time_spanned then
						oldest_buff = buff
						oldest_buff_t = time_spanned
					end
				end

				buff_extension:remove_buff(oldest_buff.id)
			end
		end

		return true
	end,
	reapply_infinite_burn = function (unit, sub_buff_template, new_buff_params, is_overflow)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local burn_buffs = buff_extension:get_stacking_buff(sub_buff_template.name)
			local oldest_buff

			if burn_buffs then
				local oldest_buff_t = -math.huge
				local t = Managers.time:time("game")

				for i = 1, #burn_buffs do
					local buff = burn_buffs[i]
					local time_spanned = t - buff.start_time

					if oldest_buff_t < time_spanned then
						oldest_buff = buff
						oldest_buff_t = time_spanned
					end
				end
			end

			if oldest_buff then
				if not Unit.alive(oldest_buff.source_attacker_unit or oldest_buff.attacker_unit) then
					buff_extension:remove_buff(oldest_buff.id)

					return true
				end

				local old_power_level = oldest_buff.power_level or DefaultPowerLevel
				local new_power_level = new_buff_params.power_level or DefaultPowerLevel
				local is_same_buff = oldest_buff.template == sub_buff_template and new_power_level <= old_power_level

				if not is_same_buff then
					local hit_zone = "full"
					local old_damage = DamageUtils.calculate_dot_buff_damage(unit, oldest_buff.source_attacker_unit or oldest_buff.attacker_unit, hit_zone, oldest_buff.damage_source, oldest_buff.power_level, oldest_buff.template.damage_profile)
					local new_damage = DamageUtils.calculate_dot_buff_damage(unit, new_buff_params.source_attacker_unit or new_buff_params.attacker_unit, hit_zone, new_buff_params.damage_source, new_buff_params.power_level, sub_buff_template.damage_profile)
					local old_prio = old_damage / oldest_buff.template.time_between_dot_damages
					local new_prio = new_damage / sub_buff_template.time_between_dot_damages

					if old_prio < new_prio then
						buff_extension:remove_buff(oldest_buff.id)

						return true
					end
				end

				return false
			end
		end

		return true
	end,
	add_buff_synced = function (unit, sub_buff_template, new_buff_params, is_overflow)
		local dummy_buff = FrameTable.alloc_table()

		dummy_buff.template = sub_buff_template

		BuffFunctionTemplates.functions.add_buff_synced(unit, dummy_buff, new_buff_params)
	end,
	remove_buff_synced = function (unit, sub_buff_template, new_buff_params, is_overflow)
		local dummy_buff = FrameTable.alloc_table()

		dummy_buff.template = sub_buff_template

		BuffFunctionTemplates.functions.remove_buff_synced(unit, dummy_buff, new_buff_params)
	end,
	reduce_cooldown_percent = function (unit, sub_buff_template, new_buff_params, is_overflow)
		local dummy_buff = FrameTable.alloc_table()

		dummy_buff.template = sub_buff_template

		BuffFunctionTemplates.functions.reduce_cooldown_percent(unit, dummy_buff, new_buff_params)
	end,
}
PotionSpreadTrinketTemplates = {
	damage_boost_potion = {
		tier1 = "damage_boost_potion_weak",
		tier2 = "damage_boost_potion_medium",
		tier3 = "damage_boost_potion",
	},
	speed_boost_potion = {
		tier1 = "speed_boost_potion_weak",
		tier2 = "speed_boost_potion_medium",
		tier3 = "speed_boost_potion",
	},
	invulnerability_potion = {
		tier1 = "invulnerability_potion_weak",
		tier2 = "invulnerability_potion_medium",
		tier3 = "invulnerability_potion",
	},
}
TrinketSpreadDistance = 10
BuffTemplates = {
	end_zone_invincibility = {
		buffs = {
			{
				duration = 1,
				max_stacks = 1,
				name = "end_zone_invincibility",
				refresh_durations = true,
				perks = {
					buff_perks.invulnerable,
					buff_perks.no_ranged_knockback,
				},
			},
		},
	},
	twitch_damage_boost = {
		buffs = {
			{
				duration = 60,
				icon = "potion_buff_01",
				max_stacks = 1,
				name = "twitch_armor_penetration_buff",
				refresh_durations = true,
				perks = {
					buff_perks.potion_armor_penetration,
				},
			},
		},
	},
	twitch_speed_boost = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				duration = 60,
				icon = "potion_buff_02",
				max_stacks = 1,
				multiplier = 1.5,
				name = "twitch_movement_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				duration = 60,
				max_stacks = 1,
				multiplier = 0.5,
				name = "twitch_attack_speed_buff",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	twitch_cooldown_reduction_boost = {
		buffs = {
			{
				duration = 60,
				icon = "potion_buff_03",
				max_stacks = 1,
				multiplier = 5,
				name = "twitch_cooldown_reduction_buff",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	twitch_no_overcharge_no_ammo_reloads = {
		buffs = {
			{
				duration = 60,
				icon = "victor_bountyhunter_passive_infinite_ammo",
				max_stacks = 1,
				name = "twitch_no_overcharge_no_ammo_reloads",
			},
		},
	},
	twitch_health_regen = {
		buffs = {
			{
				apply_buff_func = "health_regen_all_start",
				duration = 60,
				heal = 1,
				heal_type = "health_regen",
				icon = "bardin_ranger_activated_ability_heal",
				max_stacks = 1,
				name = "twitch_health_regen",
				time_between_heal = 2,
				update_func = "health_regen_all_update",
			},
		},
	},
	twitch_health_degen = {
		buffs = {
			{
				apply_buff_func = "health_degen_start",
				damage = 1,
				damage_type = "health_degen",
				duration = 60,
				icon = "bardin_slayer_crit_chance",
				max_stacks = 1,
				name = "twitch_health_degen",
				time_between_damage = 3,
				update_func = "health_degen_update",
			},
		},
	},
	twitch_grimoire_health_debuff = {
		buffs = {
			{
				debuff = true,
				duration = 60,
				icon = "buff_icon_grimoire_health_debuff",
				max_stacks = 1,
				name = "twitch_grimoire_health_debuff",
				perks = {
					buff_perks.twitch_grimoire,
				},
			},
		},
	},
	twitch_power_boost_dismember = {
		buffs = {
			{
				duration = 60,
				icon = "markus_huntsman_activated_ability",
				max_stacks = 1,
				multiplier = 0.25,
				name = "twitch_power_boost_dismember",
				stat_buff = "power_level",
				perks = {
					buff_perks.bloody_mess,
				},
			},
		},
	},
	heavy_attack_shield_break = {
		buffs = {
			{
				name = "heavy_attack_shield_break",
				perks = {
					buff_perks.shield_break,
				},
			},
		},
	},
	temporary_health_degen = {
		buffs = {
			{
				apply_buff_func = "temporary_health_degen_start",
				damage = 10,
				damage_type = "temporary_health_degen",
				max_stacks = 1,
				name = "temporary health degen",
				time_between_damage = 3,
				update_func = "temporary_health_degen_update",
			},
		},
	},
	knockdown_bleed = {
		buffs = {
			{
				apply_buff_func = "knock_down_bleed_start",
				damage = 10,
				damage_type = "knockdown_bleed",
				max_stacks = 1,
				name = "knockdown bleed",
				time_between_damage = 3,
				update_func = "knock_down_bleed_update",
			},
		},
	},
	blightreaper_curse = {
		buffs = {
			{
				apply_buff_func = "convert_permanent_to_temporary_health",
				max_stacks = 1,
				name = "blightreaper_curse",
				perks = {
					buff_perks.disable_permanent_heal,
				},
			},
		},
	},
	damage_boost_potion = {
		activation_effect = "fx/screenspace_potion_01",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 10,
				icon = "potion_buff_01",
				max_stacks = 1,
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				perks = {
					buff_perks.potion_armor_penetration,
				},
			},
		},
	},
	speed_boost_potion = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				duration = 10,
				icon = "potion_buff_02",
				max_stacks = 1,
				multiplier = 1.5,
				name = "potion_movement_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				duration = 10,
				max_stacks = 1,
				multiplier = 0.5,
				name = "potion_attack_speed_buff",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	cooldown_reduction_potion = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 10,
				icon = "potion_buff_03",
				max_stacks = 1,
				multiplier = 10,
				name = "potion_cooldown_reduction_buff",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	invulnerability_potion = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 10,
				max_stacks = 1,
				name = "invulnerability_potion",
				refresh_durations = true,
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	damage_boost_potion_increased = {
		activation_effect = "fx/screenspace_potion_01",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 15,
				icon = "potion_buff_01",
				max_stacks = 1,
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				perks = {
					buff_perks.potion_armor_penetration,
				},
			},
		},
	},
	speed_boost_potion_increased = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				duration = 15,
				icon = "potion_buff_02",
				max_stacks = 1,
				multiplier = 1.5,
				name = "potion_movement_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				duration = 15,
				max_stacks = 1,
				multiplier = 0.5,
				name = "potion_attack_speed_buff",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	cooldown_reduction_potion_increased = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 15,
				icon = "potion_buff_03",
				max_stacks = 1,
				multiplier = 15,
				name = "potion_cooldown_reduction_buff",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	invulnerability_potion_increased = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 15,
				max_stacks = 1,
				name = "invulnerability_potion_increased",
				refresh_durations = true,
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	damage_boost_potion_reduced = {
		activation_effect = "fx/screenspace_potion_01",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 5,
				icon = "potion_buff_01",
				max_stacks = 1,
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				perks = {
					buff_perks.potion_armor_penetration,
				},
			},
		},
	},
	speed_boost_potion_reduced = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				duration = 5,
				icon = "potion_buff_02",
				max_stacks = 1,
				multiplier = 1.5,
				name = "potion_movement_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				duration = 5,
				max_stacks = 1,
				multiplier = 0.5,
				name = "potion_attack_speed_buff",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	cooldown_reduction_potion_reduced = {
		activation_effect = "fx/screenspace_potion_02",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 5,
				icon = "potion_buff_03",
				max_stacks = 1,
				multiplier = 10,
				name = "potion_cooldown_reduction_buff",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	invulnerability_potion_reduced = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 5,
				max_stacks = 1,
				name = "invulnerability_potion_reduced",
				refresh_durations = true,
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	grimoire_health_debuff = {
		activation_sound = "hud_info_state_grimoire_pickup",
		buffs = {
			{
				debuff = true,
				icon = "buff_icon_grimoire_health_debuff",
				name = "grimoire_health_debuff",
				perks = {
					buff_perks.skaven_grimoire,
				},
			},
		},
	},
	overcharged = {
		buffs = {
			{
				multiplier = -0.15,
				name = "attack speed buff",
				stat_buff = "attack_speed",
			},
		},
	},
	overcharged_no_attack_penalty = {
		buffs = {},
	},
	overcharged_critical = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.85,
				name = "increase speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 0.85,
				name = "change dodge speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				multiplier = -0.25,
				name = "attack speed buff",
				stat_buff = "attack_speed",
			},
		},
	},
	overcharged_critical_no_attack_penalty = {
		buffs = {},
	},
	change_dodge_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1,
				name = "change dodge speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
		},
	},
	change_dodge_distance = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1,
				name = "change dodge distance",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	statue_decrease_movement = {
		apply_on = "wield",
		description = "description_melee_weapon_ammo_on_killing_blow_tier1",
		display_name = "melee_weapon_ammo_on_killing_blow_tier1",
		icon = "trait_icons_scavenger",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.75,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.75,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.75,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	sack_decrease_movement = {
		apply_on = "wield",
		description = "description_melee_weapon_ammo_on_killing_blow_tier1",
		display_name = "melee_weapon_ammo_on_killing_blow_tier1",
		icon = "trait_icons_scavenger",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.7,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.7,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.7,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_decrease_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.75,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				multiplier = 0.75,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				multiplier = 0.75,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_charging_decrease_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				multiplier = 0.75,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				multiplier = 0.75,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				multiplier = 0.75,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_casting_long_decrease_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 2,
				multiplier = 0.75,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 2,
				multiplier = 0.75,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 2,
				multiplier = 0.75,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_fast_decrease_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.01,
				multiplier = 1,
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.01,
				multiplier = 1,
				name = "decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.01,
				multiplier = 1,
				name = "decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_return_to_normal_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				duration = 1,
				lerp_time = 0.2,
				name = "increase speed return",
				update_func = "update_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	planted_return_to_normal_crouch_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				duration = 1,
				lerp_time = 0.2,
				name = "increase speed return",
				update_func = "update_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
		},
	},
	planted_return_to_normal_walk_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				duration = 1,
				lerp_time = 0.2,
				name = "increase speed return",
				update_func = "update_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	planted_decrease_rotation_speed = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.2,
				multiplier = 0.75,
				name = "decrease_rotation_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_rotation",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"look_input_sensitivity",
				},
			},
		},
	},
	planted_return_to_normal_rotation = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				duration = 1,
				lerp_time = 0.2,
				name = "decrease_rotation_speed_return",
				update_func = "update_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"look_input_sensitivity",
				},
			},
		},
	},
	set_rotation_limit = {
		buffs = {
			{
				apply_buff_func = "apply_rotation_limit_buff",
				bonus = 1,
				name = "set_rotation_limit",
				remove_buff_func = "remove_rotation_limit_buff",
				max_stacks = math.huge,
				path_to_movement_setting_to_modify = {
					"look_input_limit",
				},
			},
		},
	},
	planted_rotation_limit_multiplier = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.4,
				multiplier = 0.75,
				name = "planted_rotation_limit_multiplier",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_rotation_limit_multiplier",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"look_input_limit_multiplier",
				},
			},
		},
	},
	planted_return_to_normal_rotation_limit_multiplier = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_remove_movement_buff",
				duration = 1.5,
				lerp_time = 0.4,
				name = "planted_return_to_normal_rotation_limit_multiplier",
				update_func = "update_action_lerp_remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"look_input_limit_multiplier",
				},
			},
		},
	},
	arrow_poison_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "poison_direct",
				duration = 3,
				name = "arrow poison dot",
				time_between_dot_damages = 0.6,
				update_func = "apply_dot_damage",
				update_start_delay = 0.6,
				perks = {
					buff_perks.poisoned,
				},
			},
		},
	},
	aoe_poison_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "poison",
				duration = 3,
				name = "aoe poison dot",
				time_between_dot_damages = 0.75,
				update_func = "apply_dot_damage",
				update_start_delay = 0.75,
				perks = {
					buff_perks.poisoned,
				},
			},
		},
	},
	weapon_bleed_dot_dagger = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "bleed",
				duration = 2,
				hit_zone = "neck",
				max_stacks = 1,
				name = "weapon bleed dot dagger",
				refresh_durations = true,
				time_between_dot_damages = 0.75,
				update_func = "apply_dot_damage",
				update_start_delay = 0.75,
				perks = {
					buff_perks.bleeding,
				},
			},
		},
	},
	weapon_bleed_dot_whc = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "bleed",
				duration = 2,
				hit_zone = "neck",
				max_stacks = 3,
				name = "weapon bleed dot whc",
				refresh_durations = true,
				time_between_dot_damages = 0.75,
				update_func = "apply_dot_damage",
				update_start_delay = 0.75,
				perks = {
					buff_perks.bleeding,
				},
			},
		},
	},
	weapon_bleed_dot_maidenguard = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "bleed_maidenguard",
				duration = 4,
				hit_zone = "neck",
				max_stacks = 1,
				name = "weapon bleed dot maidenguard",
				refresh_durations = true,
				time_between_dot_damages = 0.25,
				update_func = "apply_dot_damage",
				update_start_delay = 0.25,
				perks = {
					buff_perks.bleeding,
				},
			},
		},
	},
	bardin_survival_ale_buff = {
		buffs = {
			{
				duration = 300,
				icon = "buff_icon_mutator_icon_drunk",
				max_stacks = 3,
				multiplier = -0.04,
				name = "ale_defence",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
			{
				duration = 300,
				max_stacks = 3,
				multiplier = 0.03,
				name = "ale_attack_speed",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	kerillian_shade_ability_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "poison",
				duration = 10,
				name = "kerillian_shade_ability_dot",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
				perks = {
					buff_perks.poisoned,
				},
			},
			{
				duration = 10,
				max_stacks = 1,
				multiplier = 0.5,
				name = "kerillian_shade_ability_debuff",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	burning_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 3,
				name = "burning_dot",
				time_between_dot_damages = 0.75,
				update_func = "apply_dot_damage",
				update_start_delay = 0.75,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	beam_burning_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "beam_burning_dot",
				damage_type = "burninating",
				duration = 3,
				name = "beam_burning_dot",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_flamethrower_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "flamethrower_burning_dot",
				damage_type = "burninating",
				duration = 1.5,
				max_stacks = 1,
				name = "burning_flamethrower_dot",
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				update_func = "apply_dot_damage",
				update_start_delay = 0.65,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	sienna_adept_ability_trail = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				leave_linger_time = 0.25,
				max_stacks = 1,
				name = "sienna_adept_ability_trail",
				on_max_stacks_overflow_func = "reapply_buff",
				time_between_dot_damages = 0.25,
				update_func = "apply_dot_damage",
				update_start_delay = 0.25,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_dot_fire_grenade = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot_firegrenade",
				damage_type = "burninating",
				duration = 6,
				name = "burning_dot_fire_grenade",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
				perks = {
					buff_perks.burning,
				},
				max_stacks_func = function (unit, template)
					local breed = AiUtils.unit_breed(unit)

					if breed and breed.is_player then
						local mechanism_name = Managers.mechanism:current_mechanism_name()

						if mechanism_name == "versus" then
							return 1
						end
					end

					return math.huge
				end,
				refresh_durations_func = function (unit, template)
					local breed = AiUtils.unit_breed(unit)

					if breed and breed.is_player then
						local mechanism_name = Managers.mechanism:current_mechanism_name()

						if mechanism_name == "versus" then
							return true
						end
					end

					return false
				end,
				duration_modifier_func = function (unit, sub_buff_template, duration, buff_extension, params)
					local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

					if not is_versus then
						return duration
					end

					local breed = AiUtils.unit_breed(unit)

					if breed and breed.is_player then
						local versus_player_duration = 2

						return versus_player_duration
					end

					return duration
				end,
			},
		},
	},
	burning_dot_1tick = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 2,
				name = "burning_dot_1tick",
				time_between_dot_damages = 1.5,
				update_func = "apply_dot_damage",
				update_start_delay = 1.5,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_dot_1tick_vs = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 4,
				name = "burning_dot_1tick_vs",
				time_between_dot_damages = 0.75,
				update_func = "apply_dot_damage",
				update_start_delay = 0.75,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_dot_unchained_push = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 6,
				max_stacks = 1,
				name = "burning_dot_unchained_push",
				refresh_durations = true,
				time_between_dot_damages = 2,
				update_func = "apply_dot_damage",
				update_start_delay = 2,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_dot_unchained_pulse = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 2,
				max_stacks = 1,
				name = "burning_dot_unchained_pulse",
				refresh_durations = true,
				time_between_dot_damages = 2,
				update_func = "apply_dot_damage",
				update_start_delay = 2,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	burning_dot_3tick = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 3,
				name = "burning_dot_3tick",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	super_jump = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				duration = 20,
				multiplier = 1.7,
				name = "speed buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				bonus = 5,
				duration = 10,
				multiplier = 1.2,
				name = "jump buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
		},
	},
	damage_volume_generic_dot = {
		buffs = {
			{
				apply_buff_func = "apply_volume_dot_damage",
				damage_type = "volume_generic_dot",
				name = "damage_volume_generic_dot",
				update_func = "update_volume_dot_damage",
			},
		},
	},
	catacombs_corpse_pit = {
		buffs = {
			{
				apply_buff_func = "apply_catacombs_corpse_pit",
				debuff = true,
				fatigue_type = "vomit_ground",
				icon = "convocation_debuff",
				max_stacks = 1,
				name = "catacombs_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_catacombs_corpse_pit",
				slowdown_buff_name = "corpse_pit_slowdown",
				time_between_ticks = 2,
				update_func = "update_catacombs_corpse_pit",
			},
		},
	},
	cemetery_plague_floor = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_plague",
				damage_type = "plague_ground",
				debuff = true,
				fatigue_type = "plague_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "plague_floor",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_plague",
				slowdown_buff_name = "cemetery_floor_plague_slowdown",
				time_between_dot_damages = 0.75,
				update_func = "update_moving_through_plague",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						1,
						1,
					},
					hard = {
						1,
						1,
						0,
						1,
						1,
					},
					harder = {
						1,
						1,
						0,
						2,
						1,
					},
					hardest = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						1,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						4,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						4,
						1,
					},
				},
			},
		},
	},
	movement_volume_generic_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_volume_movement_buff",
				name = "movement_volume_generic_slowdown",
				remove_buff_func = "remove_volume_movement_buff",
			},
		},
	},
	regrowth = {
		buffs = {
			{
				bonus = 2,
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				name = "regrowth",
				perks = {
					buff_perks.ninja_healing,
				},
			},
		},
	},
	vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 0.25,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	reaper = {
		buffs = {
			{
				bonus = 0.75,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	dummy_stagger = {
		buffs = {
			{
				bonus = 1,
				duration = 1,
				max_stacks = 2,
				name = "dummy_stagger",
				refresh_durations = true,
				stat_buff = "dummy_stagger",
			},
		},
	},
	linesman_unbalance = {
		buffs = {
			{
				display_multiplier = 0.4,
				max_display_multiplier = 0.6,
				max_stacks = 1,
				name = "linesman_unbalance",
				perks = {
					buff_perks.linesman_stagger_damage,
				},
			},
		},
	},
	smiter_unbalance = {
		buffs = {
			{
				display_multiplier = 0.2,
				max_display_multiplier = 0.4,
				name = "smiter_unbalance",
				perks = {
					buff_perks.smiter_stagger_damage,
				},
			},
		},
	},
	finesse_unbalance = {
		buffs = {
			{
				display_multiplier = 0.2,
				max_display_multiplier = 0.4,
				name = "finesse_unbalance",
				perks = {
					buff_perks.finesse_stagger_damage,
				},
			},
		},
	},
	tank_unbalance = {
		buffs = {
			{
				buff_func = "unbalance_debuff_on_stagger",
				display_multiplier = 0.2,
				event = "on_stagger",
				max_display_multiplier = 0.4,
				name = "tank_unbalance",
			},
		},
	},
	tank_unbalance_buff = {
		buffs = {
			{
				bonus = 0.1,
				duration = 2,
				max_stacks = 1,
				name = "tank_unbalance_buff",
				refresh_durations = true,
				stat_buff = "unbalanced_damage_taken",
			},
		},
	},
	power_level_unbalance = {
		buffs = {
			{
				max_stacks = 1,
				multiplier = 0.075,
				name = "power_level_unbalance",
				stat_buff = "power_level",
			},
		},
	},
	thp_linesman = {
		buffs = {
			{
				base_value = 1,
				buff_func = "thp_linesman_func",
				description = "thp_linesman_desc",
				display_name = "thp_linesman_name",
				dropoff_divisor = 2,
				event = "on_player_damage_dealt",
				max_targets = 10,
				name = "thp_linesman",
				target_dropoff = 5,
				description_values = {},
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	thp_ninjafencer = {
		buffs = {
			{
				bonus = 2,
				buff_func = "thp_ninjafencer_func",
				description = "thp_ninjafencer_desc",
				display_name = "thp_ninjafencer_name",
				event = "on_hit",
				name = "thp_ninjafencer",
				description_values = {
					{
						value = 0.5,
					},
					{
						value = 2,
					},
					{
						value = 4,
					},
				},
				perks = {
					buff_perks.ninja_healing,
				},
			},
		},
	},
	thp_smiter = {
		buffs = {
			{
				buff_func = "thp_smiter_func",
				description = "thp_smiter_desc",
				display_name = "thp_smiter_name",
				event = "on_kill",
				name = "thp_smiter",
				description_values = {},
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	thp_tank = {
		buffs = {
			{
				base_value = 1,
				buff_func = "thp_tank_stagger_func",
				description = "thp_tank_desc",
				display_name = "thp_tank_name",
				event = "on_stagger",
				max_targets = 5,
				name = "thp_tank",
				push_modifier = 0.5,
				description_values = {
					{
						value = 2,
					},
					{
						value = 0.25,
					},
				},
				perks = {
					buff_perks.tank_healing,
				},
			},
			{
				base_value = 0.25,
				buff_func = "thp_tank_kill_func",
				event = "on_kill",
				max_targets = 5,
				name = "thp_tank_kill",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	defence_debuff_enemies = {
		buffs = {
			{
				duration = 15,
				max_stacks = 1,
				multiplier = 0.2,
				name = "defence_debuff_enemies",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	attack_speed_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "attack_speed_from_proc",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	fatigue_regen_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "fatigue_regen_from_proc",
				refresh_durations = true,
				stat_buff = "fatigue_regen",
			},
		},
	},
	increased_melee_damage_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "increased_melee_damage_from_proc",
				refresh_durations = true,
				stat_buff = "increased_weapon_damage_melee",
			},
		},
	},
	damage_taken_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "damage_taken_from_proc",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	enemy_kill_timer = {
		buffs = {
			{
				buff_func = "add_kill_timer",
				event = "on_staggered",
				max_stacks = 1,
				name = "enemy_kill_timer",
			},
		},
	},
	enemy_kill_timer_buff = {
		buffs = {
			{
				fuse_time = 1,
				max_stacks = 1,
				name = "enemy_kill_timer_buff",
				update_func = "update_kill_timer",
			},
		},
	},
	mutator_player_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "mutator_player_dot",
				name = "mutator player dot",
				time_between_dot_damages = 10,
				update_func = "apply_dot_damage",
				update_start_delay = 10,
			},
		},
	},
	damage_taken_powerful_elites = {
		buffs = {
			{
				multiplier = 1,
				name = "damage_taken_from_powerful_elites",
				stat_buff = "damage_taken_elites",
			},
		},
	},
	mutator_life_damage_on_hit = {
		buffs = {
			{
				bonus = 1,
				buff_func = "damage_attacker",
				event = "on_hit",
				name = "mutator_life_damage_on_hit",
			},
		},
	},
	mutator_life_health_regeneration = {
		buffs = {
			{
				apply_buff_func = "mutator_life_health_regeneration_start",
				buff_func = "life_mutator_remove_regen",
				event = "on_damage_taken",
				name = "mutator_life_health_regeneration",
				update_func = "mutator_life_health_regeneration_update",
			},
		},
	},
	mutator_life_health_regeneration_stacks = {
		buffs = {
			{
				apply_buff_func = "health_regen_start",
				heal = 1,
				heal_type = "health_regen",
				name = "mutator_life_health_regeneration_stacks",
				time_between_heal = 1,
				update_func = "health_regen_update",
			},
		},
	},
	mutator_life_thorns_poison = {
		buffs = {
			{
				apply_buff_func = "apply_mutator_life_thorns_poison",
				debuff = true,
				max_stacks = 1,
				name = "mutator_life_thorns_poison",
				refresh_durations = true,
				remove_buff_func = "remove_mutator_life_thorns_poison",
				slowdown_buff_name = "cemetery_floor_plague_slowdown",
				time_between_dot_damages = 0.01,
				update_func = "update_mutator_life_thorns_poison",
				difficulty_damage = {
					cataclysm = 12,
					cataclysm_2 = 16,
					cataclysm_3 = 20,
					easy = 2,
					hard = 4,
					harder = 6,
					hardest = 8,
					normal = 2,
				},
			},
		},
	},
	mutator_fire_mutator_bomb = {
		buffs = {
			{
				apply_buff_func = "apply_fire_mutator_bomb",
				icon = "buff_icon_mutator_ticking_bomb",
				max_stacks = 1,
				name = "mutator_fire_mutator_bomb",
				remove_buff_func = "remove_fire_mutator_bomb",
				update_func = "update_fire_mutator_bomb",
			},
		},
	},
	mutator_fire_player_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "mutator_player_dot",
				icon = "buff_icon_mutator_ticking_bomb",
				name = "mutator_fire_player_dot",
				sound_event = "Play_winds_fire_gameplay_fire_damage_player",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
			},
		},
	},
	mutator_fire_enemy_dot = {
		activation_sound = "Play_enemy_on_fire_loop",
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "mutator_player_dot",
				name = "mutator_fire_enemy_dot",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
			},
		},
	},
	mutator_metal_blade_dance = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_01",
				apply_buff_func = "start_blade_dance",
				duration = 16,
				icon = "teammate_consumable_icon_defence",
				max_stacks = 1,
				name = "mutator_metal_blade_dance",
				refresh_durations = true,
				remove_buff_func = "remove_blade_dance",
				update_func = "update_blade_dance",
			},
		},
	},
	mutator_light_debuff = {
		buffs = {
			{
				debuff = true,
				icon = "buff_icon_mutator_icon_slayer_curse",
				name = "mutator_light_debuff",
				perks = {
					buff_perks.mutator_curse,
				},
			},
			{
				multiplier = 0.015,
				name = "death_attack_speed_buff",
				stat_buff = "attack_speed",
			},
		},
	},
	mutator_light_cleansing_curse_buff = {
		buffs = {
			{
				apply_buff_func = "apply_screenspace_effect",
				duration = 1,
				name = "mutator_light_cleansing_curse_buff",
				refresh_durations = true,
				screenspace_effect_name = "fx/screenspace_light_beacon_01",
			},
		},
	},
	mutator_beasts_totem_buff = {
		buffs = {
			{
				apply_buff_func = "apply_beasts_totem_buff",
				icon = "buff_icon_mutator_ticking_bomb",
				max_stacks = 1,
				name = "mutator_beasts_totem_buff",
				reapply_buff_func = "apply_beasts_totem_buff",
				refresh_durations = true,
				remove_buff_func = "remove_beasts_totem_buff",
				stat_buff = "damage_taken",
				wind_mutator = true,
			},
		},
	},
	metal_mutator_gromril_armour = {
		buffs = {
			{
				icon = "teammate_consumable_icon_defence",
				max_stacks = 10,
				name = "metal_mutator_gromril_armour",
				remove_buff_func = "remove_metal_mutator_gromril_armour",
			},
		},
	},
	metal_mutator_damage_boost = {
		activation_effect = "fx/screenspace_potion_01",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 8,
				icon = "icon_wpn_emp_mace_04_t3",
				max_stacks = 1,
				name = "armor penetration",
				refresh_durations = true,
				stat_buff = "increased_weapon_damage",
				perks = {
					buff_perks.potion_armor_penetration,
				},
			},
			{
				duration = 8,
				max_stacks = 1,
				multiplier = 0.5,
				name = "metal_mutator_unbalanced_damage_dealt",
				stat_buff = "unbalanced_damage_dealt",
			},
		},
	},
	mutator_death_attack_speed_player_buff = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_03",
				icon = "buff_icon_mutator_icon_slayer_curse",
				multiplier = 0.25,
				name = "death_attack_speed_buff",
				stat_buff = "attack_speed",
			},
			{
				icon = "mutator_death_attack_speed_player_buff",
				max_stacks = 1,
				multiplier = 0.25,
				name = "increased_damage",
				stat_buff = "increased_weapon_damage",
			},
		},
	},
	mutator_shadow_damage_reduction = {
		buffs = {
			{
				name = "mutator_shadow_damage_reduction",
				stat_buff = "damage_taken",
				wind_mutator = true,
			},
		},
	},
	mutator_metal_killing_blow = {
		buffs = {
			{
				bonus = 100,
				buff_func = "metal_mutator_stacks_on_hit",
				event = "on_hit",
				name = "mutator_metal_killing_blow",
				num_stacks = 15,
				breeds = {
					"skaven_slave",
					"skaven_clan_rat",
					"skaven_clan_rat_with_shield",
					"skaven_plague_monk",
					"skaven_pack_master",
					"skaven_gutter_runner",
					"skaven_storm_vermin",
					"skaven_storm_vermin_with_shield",
					"skaven_poison_wind_globadier",
					"chaos_fanatic",
					"chaos_marauder",
					"chaos_marauder_with_shield",
					"chaos_raider",
					"chaos_berzerker",
					"chaos_corruptor_sorcerer",
					"chaos_vortex_sorcerer",
				},
			},
		},
	},
	trinket_reduce_activated_ability_cooldown = {
		description = "trinket_reduce_activated_ability_cooldown_description",
		display_name = "trinket_reduce_activated_ability_cooldown",
		icon = "trait_icon_mastercrafted",
		unique_id = "trinket_ability_cooldown",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "trinket_reduce_activated_ability_cooldown",
				stat_buff = "activated_cooldown",
			},
		},
	},
	trinket_not_consume_medpack_tier1 = {
		description = "trinket_not_consume_medpack_tier1_description",
		display_name = "trinket_not_consume_medpack_tier1",
		icon = "trinket_not_consume_medpack_tier1",
		unique_id = "trinket_not_consume_medpack",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_medpack",
				proc_chance = 0.1,
				stat_buff = "not_consume_medpack",
			},
		},
	},
	trinket_not_consume_medpack_tier2 = {
		description = "trinket_not_consume_medpack_tier2_description",
		display_name = "trinket_not_consume_medpack_tier2",
		icon = "trinket_not_consume_medpack_tier2",
		unique_id = "trinket_not_consume_medpack",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_medpack",
				proc_chance = 0.15,
				stat_buff = "not_consume_medpack",
			},
		},
	},
	trinket_not_consume_medpack_tier3 = {
		description = "trinket_not_consume_medpack_tier3_description",
		display_name = "trinket_not_consume_medpack_tier3",
		icon = "trinket_not_consume_medpack_tier3",
		unique_id = "trinket_not_consume_medpack",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_medpack",
				proc_chance = 0.2,
				stat_buff = "not_consume_medpack",
			},
		},
	},
	trinket_not_consume_potion_tier1 = {
		description = "trinket_not_consume_potion_tier1_description",
		display_name = "trinket_not_consume_potion_tier1",
		icon = "trinket_not_consume_potion_tier1",
		unique_id = "trinket_not_consume_potion",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_potion",
				proc_chance = 0.15,
				stat_buff = "not_consume_potion",
			},
		},
	},
	trinket_not_consume_potion_tier2 = {
		description = "trinket_not_consume_potion_tier2_description",
		display_name = "trinket_not_consume_potion_tier2",
		icon = "trinket_not_consume_potion_tier2",
		unique_id = "trinket_not_consume_potion",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_potion",
				proc_chance = 0.2,
				stat_buff = "not_consume_potion",
			},
		},
	},
	trinket_not_consume_potion_tier3 = {
		description = "trinket_not_consume_potion_tier3_description",
		display_name = "trinket_not_consume_potion_tier3",
		icon = "trinket_not_consume_potion_tier3",
		unique_id = "trinket_not_consume_potion",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_potion",
				proc_chance = 0.25,
				stat_buff = "not_consume_potion",
			},
		},
	},
	trinket_not_consume_grenade_tier1 = {
		description = "trinket_not_consume_grenade_tier1_description",
		display_name = "trinket_not_consume_grenade_tier1",
		icon = "trinket_not_consume_grenade_tier1",
		unique_id = "trinket_not_consume_grenade",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_grenade",
				proc_chance = 0.15,
				stat_buff = "not_consume_grenade",
			},
		},
	},
	trinket_not_consume_grenade_tier2 = {
		description = "trinket_not_consume_grenade_tier2_description",
		display_name = "trinket_not_consume_grenade_tier2",
		icon = "trinket_not_consume_grenade_tier2",
		unique_id = "trinket_not_consume_grenade",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_grenade",
				proc_chance = 0.2,
				stat_buff = "not_consume_grenade",
			},
		},
	},
	trinket_not_consume_grenade_tier3 = {
		description = "trinket_not_consume_grenade_tier3_description",
		display_name = "trinket_not_consume_grenade_tier3",
		icon = "trinket_not_consume_grenade_tier3",
		unique_id = "trinket_not_consume_grenade",
		description_values = {
			"proc_chance",
		},
		buffs = {
			{
				name = "not_consume_grenade",
				proc_chance = 0.25,
				stat_buff = "not_consume_grenade",
			},
		},
	},
	trinket_no_interruption_revive = {
		description = "trinket_no_interruption_revive_description",
		display_name = "trinket_no_interruption_revive",
		icon = "trinket_no_interruption_revive_tier1",
		unique_id = "trinket_no_interruption_revive",
		buffs = {
			{
				name = "no_interruption_revive",
			},
		},
	},
	trinket_no_interruption_bandage = {
		description = "trinket_no_interruption_bandage_description",
		display_name = "trinket_no_interruption_bandage",
		icon = "trinket_no_interruption_bandage_tier1",
		unique_id = "trinket_no_interruption_bandage",
		buffs = {
			{
				name = "no_interruption_bandage",
			},
		},
	},
	trinket_protection_poison_wind_tier1 = {
		description = "trinket_protection_poison_wind_tier1_description",
		display_name = "trinket_protection_poison_wind_tier1",
		icon = "trinket_protection_poison_wind_tier1",
		unique_id = "trinket_protection_poison_wind",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_poison_wind",
				stat_buff = "protection_poison_wind",
			},
		},
	},
	trinket_protection_poison_wind_tier2 = {
		description = "trinket_protection_poison_wind_tier2_description",
		display_name = "trinket_protection_poison_wind_tier2",
		icon = "trinket_protection_poison_wind_tier2",
		unique_id = "trinket_protection_poison_wind",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_poison_wind",
				stat_buff = "protection_poison_wind",
			},
		},
	},
	trinket_protection_poison_wind_tier3 = {
		description = "trinket_protection_poison_wind_tier3_description",
		display_name = "trinket_protection_poison_wind_tier3",
		icon = "trinket_protection_poison_wind_tier3",
		unique_id = "trinket_protection_poison_wind",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_poison_wind",
				stat_buff = "protection_poison_wind",
			},
		},
	},
	trinket_protection_gutter_runner_tier1 = {
		description = "trinket_protection_gutter_runner_tier1_description",
		display_name = "trinket_protection_gutter_runner_tier1",
		icon = "trinket_protection_gutter_runner_tier1",
		unique_id = "trinket_protection_gutter_runner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_gutter_runner",
				stat_buff = "protection_gutter_runner",
			},
		},
	},
	trinket_protection_gutter_runner_tier2 = {
		description = "trinket_protection_gutter_runner_tier2_description",
		display_name = "trinket_protection_gutter_runner_tier2",
		icon = "trinket_protection_gutter_runner_tier2",
		unique_id = "trinket_protection_gutter_runner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_gutter_runner",
				stat_buff = "protection_gutter_runner",
			},
		},
	},
	trinket_protection_gutter_runner_tier3 = {
		description = "trinket_protection_gutter_runner_tier3_description",
		display_name = "trinket_protection_gutter_runner_tier3",
		icon = "trinket_protection_gutter_runner_tier3",
		unique_id = "trinket_protection_gutter_runner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_gutter_runner",
				stat_buff = "protection_gutter_runner",
			},
		},
	},
	trinket_protection_ratling_gunner_tier1 = {
		description = "trinket_protection_ratling_gunner_tier1_description",
		display_name = "trinket_protection_ratling_gunner_tier1",
		icon = "trinket_protection_ratling_gunner_tier1",
		unique_id = "trinket_protection_ratling_gunner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_ratling_gunner",
				stat_buff = "protection_ratling_gunner",
			},
		},
	},
	trinket_protection_ratling_gunner_tier2 = {
		description = "trinket_protection_ratling_gunner_tier2_description",
		display_name = "trinket_protection_ratling_gunner_tier2",
		icon = "trinket_protection_ratling_gunner_tier2",
		unique_id = "trinket_protection_ratling_gunner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_ratling_gunner",
				stat_buff = "protection_ratling_gunner",
			},
		},
	},
	trinket_protection_ratling_gunner_tier3 = {
		description = "trinket_protection_ratling_gunner_tier3_description",
		display_name = "trinket_protection_ratling_gunner_tier3",
		icon = "trinket_protection_ratling_gunner_tier3",
		unique_id = "trinket_protection_ratling_gunner",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_ratling_gunner",
				stat_buff = "protection_ratling_gunner",
			},
		},
	},
	trinket_protection_pack_master_tier1 = {
		description = "trinket_protection_pack_master_tier1_description",
		display_name = "trinket_protection_pack_master_tier1",
		icon = "trinket_protection_pack_master_tier1",
		unique_id = "trinket_protection_pack_master",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "protection_pack_master",
				stat_buff = "protection_pack_master",
			},
		},
	},
	trinket_protection_pack_master_tier2 = {
		description = "trinket_protection_pack_master_tier2_description",
		display_name = "trinket_protection_pack_master_tier2",
		icon = "trinket_protection_pack_master_tier2",
		unique_id = "trinket_protection_pack_master",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "protection_pack_master",
				stat_buff = "protection_pack_master",
			},
		},
	},
	trinket_protection_pack_master_tier3 = {
		description = "trinket_protection_pack_master_tier3_description",
		display_name = "trinket_protection_pack_master_tier3",
		icon = "trinket_protection_pack_master_tier3",
		unique_id = "trinket_protection_pack_master",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.6,
				name = "protection_pack_master",
				stat_buff = "protection_pack_master",
			},
		},
	},
	trinket_potion_spread_area_tier1 = {
		description = "trinket_potion_spread_area_tier1_description",
		display_name = "trinket_potion_spread_area_tier1",
		icon = "trinket_potion_spread_area_tier1",
		unique_id = "trinket_potion_spread_area",
		description_values = {
			"distance",
		},
		buffs = {
			{
				name = "potion_spread_area_tier1",
				distance = TrinketSpreadDistance,
			},
		},
	},
	trinket_potion_spread_area_tier2 = {
		description = "trinket_potion_spread_area_tier2_description",
		display_name = "trinket_potion_spread_area_tier2",
		icon = "trinket_potion_spread_area_tier2",
		unique_id = "trinket_potion_spread_area",
		description_values = {
			"distance",
		},
		buffs = {
			{
				name = "potion_spread_area_tier2",
				distance = TrinketSpreadDistance,
			},
		},
	},
	trinket_potion_spread_area_tier3 = {
		description = "trinket_potion_spread_area_tier3_description",
		display_name = "trinket_potion_spread_area_tier3",
		icon = "trinket_potion_spread_area_tier3",
		unique_id = "trinket_potion_spread_area",
		description_values = {
			"distance",
		},
		buffs = {
			{
				name = "potion_spread_area_tier3",
				distance = TrinketSpreadDistance,
			},
		},
	},
	trinket_faster_revive_promo = {
		description = "trinket_faster_revive_tier1_description",
		display_name = "trinket_faster_revive_tier1",
		icon = "trinket_faster_revive_tier1",
		unique_id = "trinket_faster_revive",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.15,
				name = "faster_revive",
				stat_buff = "faster_revive",
			},
		},
	},
	trinket_faster_revive_tier1 = {
		description = "trinket_faster_revive_tier1_description",
		display_name = "trinket_faster_revive_tier1",
		icon = "trinket_faster_revive_tier1",
		unique_id = "trinket_faster_revive",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.3,
				name = "faster_revive",
				stat_buff = "faster_revive",
			},
		},
	},
	trinket_faster_revive_tier2 = {
		description = "trinket_faster_revive_tier2_description",
		display_name = "trinket_faster_revive_tier2",
		icon = "trinket_faster_revive_tier2",
		unique_id = "trinket_faster_revive",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "faster_revive",
				stat_buff = "faster_revive",
			},
		},
	},
	trinket_faster_revive_tier3 = {
		description = "trinket_faster_revive_tier3_description",
		display_name = "trinket_faster_revive_tier3",
		icon = "trinket_faster_revive_tier3",
		unique_id = "trinket_faster_revive",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "faster_revive",
				stat_buff = "faster_revive",
			},
		},
	},
	trinket_increase_luck_promo = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		icon = "trinket_increase_luck_tier1",
		unique_id = "trinket_increase_luck",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.1,
				name = "increase_luck",
				stat_buff = "increase_luck",
			},
		},
	},
	trinket_increase_luck_tier1 = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		icon = "trinket_increase_luck_tier1",
		unique_id = "trinket_increase_luck",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.25,
				name = "increase_luck",
				stat_buff = "increase_luck",
			},
		},
	},
	trinket_increase_luck_tier2 = {
		description = "trinket_increase_luck_tier2_description",
		display_name = "trinket_increase_luck_tier2",
		icon = "trinket_increase_luck_tier2",
		unique_id = "trinket_increase_luck",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.5,
				name = "increase_luck",
				stat_buff = "increase_luck",
			},
		},
	},
	trinket_increase_luck_tier3 = {
		description = "trinket_increase_luck_tier3_description",
		display_name = "trinket_increase_luck_tier3",
		icon = "trinket_increase_luck_tier3",
		unique_id = "trinket_increase_luck",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 1,
				name = "increase_luck",
				stat_buff = "increase_luck",
			},
		},
	},
	trinket_hp_increase_kd_tier1 = {
		description = "trinket_hp_increase_kd_tier1_description",
		display_name = "trinket_hp_increase_kd_tier1",
		icon = "trinket_hp_increase_kd_tier1",
		unique_id = "trinket_hp_increase_kd",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.2,
				name = "hp_increase_kd",
				stat_buff = "damage_taken_kd",
			},
		},
	},
	trinket_hp_increase_kd_tier2 = {
		description = "trinket_hp_increase_kd_tier2_description",
		display_name = "trinket_hp_increase_kd_tier2",
		icon = "trinket_hp_increase_kd_tier2",
		unique_id = "trinket_hp_increase_kd",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.3,
				name = "hp_increase_kd",
				stat_buff = "damage_taken_kd",
			},
		},
	},
	trinket_hp_increase_kd_tier3 = {
		description = "trinket_hp_increase_kd_tier3_description",
		display_name = "trinket_hp_increase_kd_tier3",
		icon = "trinket_hp_increase_kd_tier3",
		unique_id = "trinket_hp_increase_kd",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.4,
				name = "hp_increase_kd",
				stat_buff = "damage_taken_kd",
			},
		},
	},
	trinket_increased_movement_speed_tier1 = {
		description = "trinket_increased_movement_speed_tier1_description",
		display_name = "trinket_increased_movement_speed_tier1",
		icon = "trinket_increased_movement_speed_tier1",
		unique_id = "trinket_increased_movement_speed",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.02,
				name = "movement_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	trinket_increased_movement_speed_tier2 = {
		description = "trinket_increased_movement_speed_tier2_description",
		display_name = "trinket_increased_movement_speed_tier2",
		icon = "trinket_increased_movement_speed_tier2",
		unique_id = "trinket_increased_movement_speed",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.04,
				name = "movement_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	trinket_increased_movement_speed_tier3 = {
		description = "trinket_increased_movement_speed_tier3_description",
		display_name = "trinket_increased_movement_speed_tier3",
		icon = "trinket_increased_movement_speed_tier3",
		unique_id = "trinket_increased_movement_speed",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.06,
				name = "movement_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	trinket_reduce_grimoire_penalty = {
		description = "trinket_reduce_grimoire_penalty_description",
		display_name = "trinket_reduce_grimoire_penalty",
		icon = "trinket_reduce_grimoire_penalty_tier1",
		unique_id = "trinket_reduce_grimoire_penalty",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.33,
				name = "curse_protection",
				stat_buff = "curse_protection",
			},
		},
	},
	trinket_grenade_radius_tier1 = {
		description = "trinket_grenade_radius_tier1_description",
		display_name = "trinket_grenade_radius_tier1",
		icon = "trinket_grenade_radius_tier1",
		unique_id = "trinket_grenade_radius",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.4,
				name = "grenade_radius",
				stat_buff = "grenade_radius",
			},
		},
	},
	trinket_grenade_radius_tier2 = {
		description = "trinket_grenade_radius_tier2_description",
		display_name = "trinket_grenade_radius_tier2",
		icon = "trinket_grenade_radius_tier2",
		unique_id = "trinket_grenade_radius",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.5,
				name = "grenade_radius",
				stat_buff = "grenade_radius",
			},
		},
	},
	trinket_grenade_radius_tier3 = {
		description = "trinket_grenade_radius_tier3_description",
		display_name = "trinket_grenade_radius_tier3",
		icon = "trinket_grenade_radius_tier3",
		unique_id = "trinket_grenade_radius",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.6,
				name = "grenade_radius",
				stat_buff = "grenade_radius",
			},
		},
	},
	trinket_faster_respawn_tier1 = {
		description = "trinket_faster_respawn_tier1_description",
		display_name = "trinket_faster_respawn_tier1",
		icon = "trinket_faster_respawn_tier1",
		unique_id = "trinket_faster_respawn",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.25,
				name = "faster_respawn",
				stat_buff = "faster_respawn",
			},
		},
	},
	trinket_faster_respawn_tier2 = {
		description = "trinket_faster_respawn_tier2_description",
		display_name = "trinket_faster_respawn_tier2",
		icon = "trinket_faster_respawn_tier2",
		unique_id = "trinket_faster_respawn",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = -0.5,
				name = "faster_respawn",
				stat_buff = "faster_respawn",
			},
		},
	},
	trinket_shared_damage = {
		description = "trinket_shared_damage_description",
		display_name = "trinket_shared_damage",
		icon = "trinket_shared_damage_tier3",
		unique_id = "trinket_shared_damage",
		buffs = {
			{
				name = "shared_health_pool",
			},
		},
	},
	trinket_roll_dice_as_witch_hunter = {
		description = "dlc1_1_trinket_roll_dice_as_witch_hunter_description",
		display_name = "dlc1_1_trinket_roll_dice_as_witch_hunter",
		icon = "trait_icon_loot_trinket_witch_hunter",
		roll_dice_as_hero = "witch_hunter",
		unique_id = "trinket_roll_dice_as_hero",
		buffs = {},
	},
	trinket_roll_dice_as_bright_wizard = {
		description = "dlc1_1_trinket_roll_dice_as_bright_wizard_description",
		display_name = "dlc1_1_trinket_roll_dice_as_bright_wizard",
		icon = "trait_icon_loot_trinket_bright_wizard",
		roll_dice_as_hero = "bright_wizard",
		unique_id = "trinket_roll_dice_as_hero",
		buffs = {},
	},
	trinket_roll_dice_as_dwarf_ranger = {
		description = "dlc1_1_trinket_roll_dice_as_dwarf_ranger_description",
		display_name = "dlc1_1_trinket_roll_dice_as_dwarf_ranger",
		icon = "trait_icon_loot_trinket_dwarf_ranger",
		roll_dice_as_hero = "dwarf_ranger",
		unique_id = "trinket_roll_dice_as_hero",
		buffs = {},
	},
	trinket_roll_dice_as_wood_elf = {
		description = "dlc1_1_trinket_roll_dice_as_wood_elf_description",
		display_name = "dlc1_1_trinket_roll_dice_as_wood_elf",
		icon = "trait_icon_loot_trinket_waywatcher",
		roll_dice_as_hero = "wood_elf",
		unique_id = "trinket_roll_dice_as_hero",
		buffs = {},
	},
	trinket_roll_dice_as_empire_soldier = {
		description = "dlc1_1_trinket_roll_dice_as_empire_soldier_description",
		display_name = "dlc1_1_trinket_roll_dice_as_empire_soldier",
		icon = "trait_icon_loot_trinket_empire_soldier",
		roll_dice_as_hero = "empire_soldier",
		unique_id = "trinket_roll_dice_as_hero",
		buffs = {},
	},
	trinket_increase_luck_halloween = {
		description = "trinket_increase_luck_tier1_description",
		display_name = "trinket_increase_luck_tier1",
		icon = "trinket_increase_luck_halloween",
		unique_id = "trinket_increase_luck",
		description_values = {
			"multiplier",
		},
		buffs = {
			{
				multiplier = 0.91,
				name = "increase_luck",
				stat_buff = "increase_luck",
			},
		},
	},
	warpfire_thrower_ground_base = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_warpfire",
				damage_type = "warpfire_ground",
				max_stacks = 1,
				name = "stormfiend_warpfire_ground",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_warpfire",
				time_between_dot_damages = 0.75,
				update_func = "update_moving_through_warpfire",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						5.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						6.5,
						1,
					},
					hard = {
						1,
						1,
						0,
						7.5,
						1,
					},
					harder = {
						1,
						1,
						0,
						8.5,
						1,
					},
					hardest = {
						1,
						1,
						0,
						9.5,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						7,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						8,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						9,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						6.5,
						1,
					},
				},
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	warpfire_thrower_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_warpfirethrower_in_face",
				damage_type = "warpfire_ground",
				debuff = true,
				duration = 0.3,
				fatigue_type = "warpfire_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "warpfire_thrower_base",
				push_speed = 15,
				remove_buff_func = "remove_warpfirethrower_in_face",
				slowdown_buff_name = "warpfire_thrower_fire_slowdown",
				time_between_dot_damages = 0.75,
				update_func = "update_warpfirethrower_in_face",
				difficulty_damage = {
					easy = {
						3,
						1,
						0,
						6.5,
						1,
					},
					normal = {
						3,
						1,
						0,
						6.5,
						2,
					},
					hard = {
						4,
						2,
						0,
						7.5,
						2,
					},
					harder = {
						5,
						3,
						0,
						8.5,
						4,
					},
					hardest = {
						7.5,
						4,
						0,
						9.5,
						5,
					},
					cataclysm = {
						4,
						2,
						0,
						7,
						3,
					},
					cataclysm_2 = {
						5,
						3,
						0,
						8,
						3,
					},
					cataclysm_3 = {
						7.5,
						4,
						0,
						9,
						4,
					},
					versus_base = {
						3,
						3,
						3,
						3,
						3,
					},
				},
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	warpfire_thrower_face_base_mutator = {
		buffs = {
			{
				apply_buff_func = "apply_warpfirethrower_in_face",
				damage_type = "warpfire_ground",
				debuff = true,
				duration = 0.3,
				fatigue_type = "warpfire_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "warpfire_thrower_base",
				push_speed = 30,
				remove_buff_func = "remove_warpfirethrower_in_face",
				slowdown_buff_name = "warpfire_thrower_fire_slowdown",
				time_between_dot_damages = 0.75,
				update_func = "update_warpfirethrower_in_face",
				difficulty_damage = {
					easy = {
						2,
						1,
						0,
						5.5,
						1,
					},
					normal = {
						10,
						1,
						0,
						6.5,
						1,
					},
					hard = {
						12,
						2,
						0,
						7.5,
						2,
					},
					harder = {
						15,
						3,
						0,
						8.5,
						3,
					},
					hardest = {
						20,
						4,
						0,
						9.5,
						4,
					},
					cataclysm = {
						12,
						2,
						0,
						7,
						2,
					},
					cataclysm_2 = {
						15,
						3,
						0,
						8,
						3,
					},
					cataclysm_3 = {
						20,
						4,
						0,
						9,
						4,
					},
					versus_base = {
						3,
						3,
						3,
						3,
						3,
					},
				},
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	warpfire_thrower_fire_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_crouch_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_walk_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_jump_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	plague_wave_ground_base = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_vomit",
				damage_type = "vomit_ground",
				fatigue_type = "vomit_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "troll_bile_ground",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_vomit",
				time_between_dot_damages = 0.75,
				update_func = "update_moving_through_vomit",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						1,
						1,
					},
					hard = {
						1,
						1,
						0,
						1,
						1,
					},
					harder = {
						1,
						1,
						0,
						2,
						1,
					},
					hardest = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						1,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						4,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						1,
						1,
					},
				},
			},
		},
	},
	plague_wave_ground_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_crouch_speed_plague_wavel",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_walk_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_jump_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance_plague_wave",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	bile_troll_vomit_ground_base = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_vomit",
				damage_type = "vomit_ground",
				debuff = true,
				fatigue_type = "vomit_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "troll_bile_ground",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_vomit",
				slowdown_buff_name = "bile_troll_vomit_ground_slowdown",
				time_between_dot_damages = 0.75,
				update_func = "update_moving_through_vomit",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						1,
						1,
					},
					hard = {
						1,
						1,
						0,
						1,
						1,
					},
					harder = {
						1,
						1,
						0,
						2,
						1,
					},
					hardest = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						4,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						1,
						1,
					},
				},
			},
		},
	},
	corpse_pit_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_crouch_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_walk_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_jump_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_dodge_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_dodge_distance_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	mutator_life_poison = {
		buffs = {
			{
				apply_buff_func = "apply_mutator_life_poison_buff",
				max_stacks = 1,
				name = "mutator_life_poison",
				refresh_durations = true,
			},
			{
				apply_buff_func = "apply_movement_buff",
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_crouch_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_walk_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_jump_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_dodge_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_dodge_distance_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	cemetery_floor_plague_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_crouch_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 2,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_walk_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_jump_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	bile_troll_vomit_ground_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_crouch_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 1,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_walk_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.75,
				name = "decrease_jump_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance_bile_troll",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	plague_wave_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_plague_wave_in_face",
				damage_type = "plague_face",
				duration = 2,
				fatigue_type = "vomit_face",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "plague_wave_face",
				push_speed = 6,
				refresh_durations = true,
				remove_buff_func = "remove_plague_wave_in_face",
				slowdown_buff_name = "plague_wave_face_slowdown",
				time_between_dot_damages = 0.65,
				update_func = "update_vomit_in_face",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						2,
						1,
					},
					hard = {
						1,
						1,
						0,
						3,
						1,
					},
					harder = {
						1,
						1,
						0,
						4,
						1,
					},
					hardest = {
						1,
						1,
						0,
						6,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						6,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						8,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						10,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						2,
						1,
					},
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				multiplier = 0.7,
				name = "decrease_jump_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				multiplier = 0.7,
				name = "decrease_dodge_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 2,
				multiplier = 0.7,
				name = "decrease_dodge_distance",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	vermintide_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_vermintide_in_face",
				damage_type = "plague_face",
				duration = 3.5,
				fatigue_type = "vomit_face",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "plague_wave_face",
				push_speed = 15,
				refresh_durations = true,
				remove_buff_func = "remove_vermintide_in_face",
				time_between_dot_damages = 0.65,
				update_func = "update_vermintide_in_face",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						1,
						1,
					},
					hard = {
						1,
						1,
						0,
						1,
						1,
					},
					harder = {
						1,
						1,
						0,
						2,
						1,
					},
					hardest = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						1,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						4,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						1,
						1,
					},
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 3.5,
				multiplier = 0.7,
				name = "decrease_jump_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 3.5,
				multiplier = 0.7,
				name = "decrease_dodge_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 3.5,
				multiplier = 0.7,
				name = "decrease_dodge_distance",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	bile_troll_vomit_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_vomit_in_face",
				damage_type = "vomit_face",
				debuff = true,
				duration = 5,
				fatigue_type = "vomit_face",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "troll_bile_face",
				push_speed = 6,
				refresh_durations = true,
				remove_buff_func = "remove_vomit_in_face",
				slowdown_buff_name = "bile_troll_vomit_face_slowdown",
				time_between_dot_damages = 0.65,
				update_func = "update_vomit_in_face",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						0.5,
						1,
					},
					normal = {
						1,
						1,
						0,
						1,
						1,
					},
					hard = {
						1,
						1,
						0,
						1,
						1,
					},
					harder = {
						1,
						1,
						0,
						2,
						1,
					},
					hardest = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						4,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						4,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						1,
						1,
					},
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 7,
				multiplier = 0.3,
				name = "decrease_jump_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 7,
				multiplier = 0.3,
				name = "decrease_dodge_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 7,
				multiplier = 0.3,
				name = "decrease_dodge_distance",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	bile_troll_vomit_face_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.3,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.3,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.3,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	plague_wave_face_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	vortex_base = {
		buffs = {
			{
				apply_buff_func = "apply_vortex",
				damage_type = "vomit_face",
				duration = 2,
				fatigue_type = "vomit_face",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "vortex",
				refresh_durations = true,
				remove_buff_func = "remove_vortex",
				slowdown_buff_name = "vortex_slowdown",
				time_between_dot_damages = 0.65,
				update_func = "update_vortex",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						2,
						1,
					},
					normal = {
						1,
						1,
						0,
						3,
						1,
					},
					hard = {
						1,
						1,
						0,
						5,
						1,
					},
					harder = {
						1,
						1,
						0,
						8,
						1,
					},
					hardest = {
						1,
						1,
						0,
						16,
						1,
					},
					cataclysm = {
						1,
						1,
						0,
						16,
						1,
					},
					cataclysm_2 = {
						1,
						1,
						0,
						16,
						1,
					},
					cataclysm_3 = {
						1,
						1,
						0,
						16,
						1,
					},
					versus_base = {
						1,
						1,
						0,
						3,
						1,
					},
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				multiplier = 0.8,
				name = "decrease_jump_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	vortex_slowdown = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.9,
				name = "decrease_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.9,
				name = "decrease_crouch_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.9,
				name = "decrease_walk_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	stormfiend_warpfire_ground_base = {
		buffs = {
			{
				apply_buff_func = "apply_moving_through_warpfire",
				damage_type = "warpfire_ground",
				max_stacks = 1,
				name = "stormfiend_warpfire_ground",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_warpfire",
				slowdown_buff_name = "bile_troll_vomit_ground_slowdown",
				time_between_dot_damages = 0.5,
				update_func = "update_moving_through_warpfire",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						1.5,
						1,
					},
					normal = {
						2,
						2,
						0,
						2.5,
						3,
					},
					hard = {
						4,
						3,
						0,
						2.5,
						4,
					},
					harder = {
						6,
						5,
						0,
						4.5,
						5,
					},
					hardest = {
						8,
						8,
						0,
						8.5,
						6,
					},
					cataclysm = {
						4,
						3,
						0,
						8.5,
						4,
					},
					cataclysm_2 = {
						6,
						5,
						0,
						8.5,
						5,
					},
					cataclysm_3 = {
						8,
						8,
						0,
						8.5,
						6,
					},
					versus_base = {
						2,
						2,
						0,
						2.5,
						3,
					},
				},
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	stormfiend_warpfire_face_base = {
		buffs = {
			{
				apply_buff_func = "apply_warpfire_in_face",
				damage_type = "warpfire_face",
				duration = 3,
				max_stacks = 1,
				name = "stormfiend_warpfire_face",
				push_speed = 10,
				refresh_durations = true,
				remove_buff_func = "remove_warpfire_in_face",
				time_between_dot_damages = 0.65,
				update_func = "update_warpfire_in_face",
				difficulty_damage = {
					easy = {
						1,
						1,
						0,
						2,
						1,
					},
					normal = {
						3,
						2,
						0,
						1.5,
						2,
					},
					hard = {
						4,
						2,
						0,
						2,
						2,
					},
					harder = {
						5,
						3,
						0,
						3,
						3,
					},
					hardest = {
						6,
						4,
						0,
						5,
						4,
					},
					cataclysm = {
						4,
						2,
						0,
						5,
						2,
					},
					cataclysm_2 = {
						5,
						3,
						0,
						5,
						3,
					},
					cataclysm_3 = {
						6,
						4,
						0,
						5,
						1,
					},
					versus_base = {
						3,
						2,
						0,
						1.5,
						2,
					},
				},
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	increase_damage_recieved_while_burning = {
		buffs = {
			{
				max_stacks = 1,
				multiplier = 0.5,
				name = "increase_damage_recieved_while_burning",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	chaos_zombie_explosion = {
		buffs = {
			{
				apply_buff_func = "apply_chaos_zombie_explosion_in_face",
				damage_type = "vomit_face",
				duration = 5,
				fatigue_type = "vomit_face",
				max_stacks = 5,
				multiplier = 0.1,
				name = "chaos_zombie_explosion",
				refresh_durations = false,
				remove_buff_func = "remove_chaos_zombie_explosion_in_face",
				stat_buff = "damage_taken",
				update_func = "update_chaos_zombie_explosion_in_face",
			},
		},
	},
	ring_attackspeed_0001_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Attack Speed",
				multiplier = 0.03,
				name = "ring_attackspeed_0001_buff",
				stat_buff = "attack_speed",
			},
		},
	},
	ring_attackspeed_0002_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Attack Speed",
				multiplier = 0.05,
				name = "ring_attackspeed_0002_buff",
				stat_buff = "attack_speed",
			},
		},
	},
	ring_attackspeed_0003_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Attack Speed",
				multiplier = 0.07,
				name = "ring_attackspeed_0003_buff",
				stat_buff = "attack_speed",
			},
		},
	},
	necklace_stamina_0001_buff = {
		buffs = {
			{
				apply_on = "equip",
				bonus = 1,
				description = "Stamina",
				name = "necklace_stamina_0001_buff",
				stat_buff = "max_fatigue",
			},
		},
	},
	necklace_stamina_0002_buff = {
		buffs = {
			{
				apply_on = "equip",
				bonus = 2,
				description = "Stamina",
				name = "necklace_stamina_0002_buff",
				stat_buff = "max_fatigue",
			},
		},
	},
	necklace_stamina_0003_buff = {
		buffs = {
			{
				apply_on = "equip",
				bonus = 4,
				description = "Stamina",
				name = "necklace_stamina_0003_buff",
				stat_buff = "max_fatigue",
			},
		},
	},
	necklace_health_0001_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Health",
				multiplier = 0.1,
				name = "necklace_health_0001_buff",
				stat_buff = "max_health",
			},
		},
	},
	necklace_health_0002_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Health",
				multiplier = 0.15,
				name = "necklace_health_0002_buff",
				stat_buff = "max_health",
			},
		},
	},
	necklace_health_0003_buff = {
		buffs = {
			{
				apply_on = "equip",
				description = "Health",
				multiplier = 0.25,
				name = "necklace_health_0003_buff",
				stat_buff = "max_health",
			},
		},
	},
	weapon_trait_uninterruptible = {
		buffs = {
			{
				name = "weapon_trait_uninterruptible",
				perks = {
					buff_perks.uninterruptible,
				},
			},
		},
	},
	weapon_trait_riposte = {
		buffs = {
			{
				name = "weapon_trait_riposte",
				perks = {
					buff_perks.uninterruptible,
				},
			},
		},
	},
	weapon_trait_backstab = {
		buffs = {
			{
				multiplier = 0.5,
				name = "weapon_trait_backstab",
				stat_buff = "backstab_multiplier",
			},
		},
	},
	weapon_trait_bloodlust = {
		buffs = {
			{
				bonus = 1,
				buff_func = "heal",
				event = "on_kill",
				name = "weapon_trait_bloodlust",
			},
		},
	},
	weapon_trait_improved_push = {
		buffs = {
			{
				name = "push_increase",
			},
		},
	},
	weapon_trait_scavenge = {
		buffs = {
			{
				bonus = 1,
				buff_func = "replenish_ammo_on_headshot_ranged",
				event = "on_hit",
				name = "weapon_trait_scavenge_trigger",
			},
			{
				multiplier = -0.5,
				name = "weapon_trait_scavenge_buff",
				stat_buff = "total_ammo",
			},
		},
	},
	twitch_mutator_buff_splitting_enemies = {
		buffs = {
			{
				duration = 30,
				icon = "mutator_icon_splitting_enemies",
				name = "twitch_mutator_buff_splitting_enemies",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_leash = {
		buffs = {
			{
				duration = 30,
				icon = "mutator_icon_leash",
				name = "twitch_mutator_buff_leash",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_slayers_curse = {
		buffs = {
			{
				duration = 30,
				icon = "mutator_icon_slayer_curse",
				name = "twitch_mutator_buff_slayers_curse",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_shared_health_pool = {
		buffs = {
			{
				duration = 30,
				icon = "icon_deed_normal_01",
				name = "twitch_mutator_buff_shared_health_pool",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_bloodlust = {
		buffs = {
			{
				duration = 30,
				icon = "bardin_slayer_activated_ability",
				name = "twitch_mutator_buff_bloodlust",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_ticking_bomb = {
		buffs = {
			{
				duration = 30,
				icon = "mutator_icon_ticking_bomb",
				name = "twitch_mutator_buff_ticking_bomb",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_lightning_strike = {
		buffs = {
			{
				duration = 33,
				icon = "mutator_icon_heavens_lightning",
				name = "twitch_mutator_buff_lightning_strike",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_chasing_spirits = {
		buffs = {
			{
				duration = 25,
				icon = "mutator_icon_death_spirits",
				name = "twitch_mutator_buff_chasing_spirits",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	twitch_mutator_buff_flames = {
		buffs = {
			{
				duration = 30,
				icon = "mutator_icon_fire_burn",
				name = "twitch_mutator_buff_flames",
				duration_modifier_func = function (owner_unit, buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end,
			},
		},
	},
	bloodlust = {
		buffs = {
			{
				duration = 6,
				icon = "bardin_slayer_activated_ability",
				max_stacks = 3,
				multiplier = 0.15,
				name = "bardin_slayer_frenzy",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 6,
				max_stacks = 3,
				multiplier = 1.2,
				name = "bardin_slayer_frenzy_movement",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	bloodlust_debuff = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "bloodlust_debuff",
				icon = "troll_vomit_debuff",
				name = "bloodlust_debuff",
				time_between_dot_damages = 1,
				update_func = "apply_dot_damage",
				update_start_delay = 1,
			},
		},
	},
	twitch_vote_buff_root = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 10,
				icon = "troll_vomit_debuff",
				lerp_time = 0.1,
				multiplier = 0.001,
				name = "twitch_vote_buff_root",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
				perks = {
					buff_perks.root,
				},
			},
		},
	},
	twitch_vote_buff_fatigue_loss = {
		buffs = {
			{
				duration = 15,
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				multiplier = -1,
				name = "twitch_vote_buff_fatigue_loss",
				refresh_durations = true,
				stat_buff = "fatigue_regen",
			},
		},
	},
	twitch_vote_buff_hemmoraghe = {
		buffs = {
			{
				apply_buff_func = "apply_speed_scaled_dot_buff",
				damage = 3,
				damage_frequency = 0.25,
				damage_type = "bleed",
				duration = 15,
				icon = "troll_vomit_debuff",
				name = "twitch_vote_buff_hemmoraghe",
				remove_buff_func = "remove_speed_scaled_dot_buff",
				update_func = "update_speed_scaled_dot_buff",
			},
		},
	},
	twitch_vote_buff_invisibility = {
		buffs = {
			{
				apply_buff_func = "apply_twitch_invisibility_buff",
				duration = 20,
				icon = "kerillian_shade_passive_improved",
				name = "twitch_vote_buff_invisibility",
				remove_buff_func = "remove_twitch_invisibility_buff",
				update_func = "update_twitch_invisibility_buff",
			},
		},
	},
	twitch_vote_buff_critical_strikes = {
		buffs = {
			{
				duration = 20,
				icon = "victor_bountyhunter_passive",
				max_stacks = 1,
				name = "twitch_vote_buff_critical_strikes",
				refresh_durations = true,
				perks = {
					buff_perks.guaranteed_crit,
				},
			},
		},
	},
	twitch_vote_buff_infinite_bombs = {
		buffs = {
			{
				apply_buff_func = "apply_twitch_infinite_bombs",
				duration = 10,
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				name = "twitch_vote_buff_invisibility",
				remove_buff_func = "remove_twitch_infinite_bombs",
				update_func = "update_twitch_infinite_bombs",
			},
		},
	},
	twitch_vote_buff_invincibility = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				apply_buff_func = "apply_twitch_invincibility",
				duration = 10,
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1,
				name = "twitch_vote_buff_invincibility",
				remove_buff_func = "remove_twitch_invincibility",
			},
		},
	},
	twitch_vote_buff_pulsating_waves = {
		buffs = {
			{
				apply_buff_func = "apply_twitch_pulsating_waves",
				duration = 15,
				icon = "markus_mercenary_increased_damage_on_enemy_proximity",
				name = "twitch_vote_buff_pulsating_waves",
				update_func = "update_twitch_pulsating_waves",
			},
		},
	},
}

require("scripts/unit_extensions/default_player_unit/buffs/talent_buff_templates")
require("scripts/unit_extensions/default_player_unit/buffs/buff_utils")
require("scripts/managers/talents/talent_settings")
require("scripts/settings/equipment/weapon_properties")
require("scripts/settings/equipment/weapon_traits")
require("scripts/settings/equipment/weave_properties")
require("scripts/settings/equipment/weave_traits")
table.merge_recursive(BuffTemplates, OldTalentBuffTemplates)

for _, buffs in pairs(TalentBuffTemplates) do
	table.merge_recursive(BuffTemplates, buffs)
end

table.merge_recursive(BuffTemplates, WeaponProperties.buff_templates)
table.merge_recursive(BuffTemplates, WeaponTraits.buff_templates)
table.merge_recursive(BuffTemplates, WeaveProperties.buff_templates)
table.merge_recursive(BuffTemplates, WeaveTraits.buff_templates)
DLCUtils.merge("buff_templates", BuffTemplates)
DLCUtils.merge("proc_functions", ProcFunctions)
DLCUtils.merge("stacking_buff_functions", StackingBuffFunctions)
DLCUtils.map_list("add_sub_buffs_to_core_buffs", function (data)
	local buffs = BuffTemplates[data.buff_name].buffs

	buffs[#buffs + 1] = data.sub_buff_to_add
end)
BuffUtils.generate_balefire_burn_variants(BuffTemplates)
BuffUtils.generate_infinite_burn_variants(BuffTemplates)

local override_descriptions = {
	proc_chance = true,
}

for buff_name, buff_template in pairs(BuffTemplates) do
	if buff_template then
		local description_values = buff_template.description_values

		if description_values then
			for i = 1, #description_values do
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

					fassert(proc_key, "There is no buff value by name: %s on buff: %s", key, buff_name)

					local proc_value = BuffTemplates[proc_key].buffs[1][key]

					fassert(proc_value, "There is no buff value by name: %s on buff %s for proc buff: %s.", key, buff_name, proc_key)

					description_values[i] = proc_value
				end
			end
		end
	end
end
