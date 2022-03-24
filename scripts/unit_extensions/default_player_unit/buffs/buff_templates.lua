require("scripts/utils/strict_table")
require("scripts/settings/player_unit_damage_settings")
require("scripts/settings/equipment/weapons")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
MeleeBuffTypes = {
	MELEE_1H = true,
	MELEE_2H = true
}
RangedBuffTypes = {
	RANGED = true,
	RANGED_ABILITY = true
}
AttackTypes = table.enum("light_attack", "heavy_attack", "action_push", "projectile", "instant_projectile", "grenade")
MeleeAttackTypes = {
	[AttackTypes.light_attack] = true,
	[AttackTypes.heavy_attack] = true
}
RangedAttackTypes = {
	[AttackTypes.projectile] = true,
	[AttackTypes.instant_projectile] = true,
	[AttackTypes.grenade] = true
}
StatBuffApplicationMethods = {
	stagger_distance = "stacking_multiplier",
	increased_burn_damage = "stacking_multiplier",
	gromril_cooldown = "stacking_bonus",
	max_health_alive = "stacking_multiplier",
	clip_size = "stacking_multiplier",
	headshot_damage = "stacking_multiplier",
	curse_protection = "stacking_multiplier",
	vent_damage = "stacking_multiplier",
	reduced_overcharge_from_passive = "stacking_multiplier",
	increased_weapon_damage_ranged_to_wounded = "stacking_multiplier",
	increased_weapon_damage_melee_1h = "stacking_multiplier",
	not_consume_grenade = "proc",
	damage_taken_to_overcharge = "stacking_multiplier",
	first_melee_hit_damage = "stacking_multiplier",
	protection_gutter_runner = "stacking_multiplier",
	not_consume_potion = "proc",
	fatigue_regen = "stacking_multiplier",
	damage_taken = "stacking_multiplier_multiplicative",
	damage_taken_kd = "stacking_multiplier",
	damage_taken_elites = "stacking_multiplier",
	faster_respawn = "stacking_multiplier",
	increase_luck = "stacking_multiplier",
	power_level_melee_cleave = "stacking_multiplier",
	reduced_overcharge = "stacking_multiplier",
	projectile_bounces = "stacking_bonus",
	extra_shot = "stacking_bonus",
	heal_self_on_heal_other = "proc",
	faster_revive = "stacking_multiplier",
	grimoire_max_health = "stacking_multiplier",
	damage_taken_ranged = "stacking_multiplier",
	block_cost = "stacking_multiplier",
	applied_stagger_distance = "stacking_multiplier",
	timed_block_cost = "stacking_multiplier",
	vent_speed = "stacking_multiplier",
	hit_mass_reduction = "stacking_multiplier",
	power_level_armoured = "stacking_multiplier",
	critical_strike_chance_ranged = "stacking_bonus",
	critical_strike_chance = "stacking_bonus",
	critical_strike_effectiveness = "stacking_multiplier",
	block_angle = "stacking_multiplier",
	increased_max_targets = "stacking_bonus",
	max_overcharge = "stacking_multiplier",
	healing_received = "stacking_multiplier",
	reduced_non_burn_damage = "stacking_multiplier",
	reload_speed = "stacking_multiplier",
	stun_duration = "stacking_multiplier",
	cooldown_regen = "stacking_multiplier",
	activated_cooldown = "stacking_multiplier",
	increased_weapon_damage_heavy_attack = "stacking_multiplier",
	not_consume_pickup = "proc",
	push_power = "stacking_multiplier",
	no_push_fatigue_cost = "proc",
	power_level_chaos = "stacking_multiplier",
	reduced_spread = "stacking_multiplier",
	push_range = "stacking_bonus",
	reduced_spread_moving = "stacking_multiplier",
	power_level = "stacking_multiplier",
	critical_strike_chance_melee = "stacking_bonus",
	increased_weapon_damage_melee = "stacking_multiplier",
	protection_chaos = "stacking_multiplier",
	flat_power_level = "stacking_bonus",
	attack_speed_drakefire = "stacking_multiplier",
	counter_push_power = "stacking_multiplier",
	max_damage_taken_from_boss_or_elite = "min",
	max_health = "stacking_multiplier",
	coop_stamina = "proc",
	power_level_ranged = "stacking_multiplier",
	headshot_vulnerability = "stacking_multiplier",
	headshot_multiplier = "stacking_multiplier",
	protection_skaven = "stacking_multiplier",
	power_level_melee = "stacking_multiplier",
	increased_weapon_damage_ranged = "stacking_multiplier",
	grenade_extra_shot = "stacking_bonus",
	non_headshot_damage = "stacking_multiplier",
	protection_aoe = "stacking_multiplier",
	potion_duration = "stacking_multiplier",
	max_health_kd = "stacking_multiplier",
	total_ammo = "stacking_multiplier",
	attack_intensity_decay = "stacking_multiplier",
	reduced_ranged_charge_time = "stacking_multiplier",
	grenade_radius = "stacking_multiplier",
	attack_intensity_reset = "stacking_multiplier",
	overcharge_regen = "stacking_multiplier",
	unbalanced_damage_dealt = "stacking_multiplier",
	impact_vulnerability = "stacking_multiplier",
	unbalanced_damage_taken = "stacking_bonus",
	overcharge_damage_immunity = "proc",
	reduced_spread_shot = "stacking_multiplier",
	full_charge_boost = "stacking_multiplier",
	dummy_stagger = "stacking_bonus",
	max_fatigue = "stacking_bonus",
	power_level_impact = "stacking_multiplier",
	power_level_unarmoured = "stacking_multiplier",
	power_level_frenzy = "stacking_multiplier",
	attack_speed = "stacking_multiplier",
	increased_move_speed_while_aiming = "stacking_multiplier",
	shield_break_proc = "proc",
	deus_coins_greed = "stacking_multiplier",
	max_damage_taken = "min",
	protection_pack_master = "stacking_multiplier",
	increased_weapon_damage = "stacking_multiplier",
	not_consume_medpack = "proc",
	power_level_large = "stacking_multiplier",
	debuff_armoured = "stacking_bonus",
	outer_block_angle = "stacking_multiplier",
	throw_speed_increase = "stacking_multiplier",
	increased_weapon_damage_melee_2h = "stacking_multiplier",
	damage_dealt = "stacking_multiplier",
	hit_mass_amount = "stacking_multiplier",
	increased_weapon_damage_poisoned_or_bleeding = "stacking_multiplier",
	reduced_spread_hit = "stacking_multiplier",
	power_level_super_armour = "stacking_multiplier",
	stagger_resistance = "stacking_multiplier",
	hit_force = "stacking_multiplier",
	protection_ratling_gunner = "stacking_multiplier",
	health_curse = "stacking_bonus",
	extra_wounds = "stacking_bonus",
	backstab_multiplier = "stacking_bonus",
	protection_poison_wind = "stacking_multiplier",
	movement_speed = "stacking_multiplier",
	ranged_additional_penetrations = "stacking_bonus",
	power_level_skaven = "stacking_multiplier",
	damage_taken_burning_enemy = "stacking_multiplier",
	shielding_player_by_assist = "proc",
	attack_intensity_threshold = "stacking_multiplier",
	power_level_ranged_drakefire = "stacking_multiplier"
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
	"on_ping_target_killed",
	"on_block",
	"on_block_broken",
	"on_timed_block",
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
	"on_unwield",
	"on_critical_hit",
	"on_last_ammo_used",
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
	"on_enemy_pinged",
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
	"on_stealth_stacks_modified",
	"on_death",
	"on_damage_dealt",
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
	"on_gromril_armour_removed",
	"on_broke_shield"
}

local function make_proc_param_lookup(...)
	local num_args = select("#", ...)
	local t = Script.new_map(num_args)

	for i = 1, num_args, 1 do
		local arg = select(i, ...)
		t[arg] = i
	end

	return t
end

ProcEventParams = {
	on_player_damage_dealt = make_proc_param_lookup("attacked_unit", "damage_amount", "hit_zone_name", "no_crit_headshot_damage", "is_critical_strike", "buff_attack_type", "target_index", "damage_source", "first_hit", "PROC_MODIFIABLE"),
	on_damage_dealt = make_proc_param_lookup("attacked_unit", "attacker_unit", "damage_amount", "hit_zone_name", "no_crit_headshot_damage", "is_critical_strike", "buff_attack_type", "target_index", "damage_source", "damage_type", "first_hit", "PROC_MODIFIABLE"),
	on_critical_hit = make_proc_param_lookup("hit_unit", "attack_type", "hit_zone_name", "target_number", "buff_type")
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

local function get_killing_blow_slot_type(params)
	local killing_blow_data = params[1]

	if not killing_blow_data then
		return
	end

	local master_list_key = killing_blow_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

	if not master_list_key then
		return
	end

	local master_list_data = rawget(ItemMasterList, master_list_key)

	if not master_list_data then
		return
	end

	local slot_type = master_list_data.slot_type

	return slot_type
end

ProcFunctions = {
	heal = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end
	end,
	damage_attacker = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local damage_amount = buff.bonus

			DamageUtils.add_damage_network(player_unit, player_unit, damage_amount, "full", "buff", nil, Vector3(1, 0, 0), "buff")
		end
	end,
	metal_mutator_stacks_on_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local current_stacks = buff.current_stacks or 0
			current_stacks = current_stacks + 1

			if current_stacks == buff.template.num_stacks then
				local damage_amount = buff.bonus
				local hit_unit = params[1]
				local breed = AiUtils.unit_breed(hit_unit)
				local breeds = buff.template.breeds

				if table.contains(breeds, breed.name) then
					DamageUtils.add_damage_network(hit_unit, player_unit, damage_amount, "full", "metal_mutator", nil, Vector3(1, 0, 0), "buff")
				end

				current_stacks = 0
			end

			buff.current_stacks = current_stacks
		end
	end,
	heal_party = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus
			local side = Managers.state.side.side_by_unit[player_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units, 1 do
				DamageUtils.heal_network(player_and_bot_units[i], player_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_other_players_percent_at_range = function (player, buff, params)
		local player_unit = player.player_unit
		local healer_unit = params[1]
		local healer_position = POSITION_LOOKUP[healer_unit]
		local range = buff.range
		local range_squared = range * range

		if Unit.alive(player_unit) and Managers.player.is_server then
			local side = Managers.state.side.side_by_unit[player_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units, 1 do
				local healed_unit = player_and_bot_units[i]

				if healed_unit ~= player_unit and Unit.alive(healed_unit) then
					local unit_position = POSITION_LOOKUP[healed_unit]
					local distance_squared = Vector3.distance_squared(healer_position, unit_position)

					if distance_squared < range_squared then
						local health_extension = ScriptUnit.extension(healed_unit, "health_system")
						local max_health = health_extension:get_max_health()
						local multiplier = buff.multiplier
						local heal_amount = max_health * multiplier
						local heal_type = "buff_shared_medpack"

						DamageUtils.heal_network(healed_unit, player_unit, heal_amount, heal_type)
					end
				end
			end
		end
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
	end,
	buff_defence_on_revived_target = function (player, buff, params)
		local player_unit = player.player_unit
		local revived_unit = params[1]
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		if type(buff_to_add) == "table" then
			if Unit.alive(player_unit) and Unit.alive(revived_unit) and Managers.player.is_server then
				for i = 1, #buff_to_add, 1 do
					local current_buff = buff_to_add[i]

					buff_system:add_buff(revived_unit, current_buff, player_unit, false)
				end
			end
		elseif Unit.alive(player_unit) and Unit.alive(revived_unit) and Managers.player.is_server then
			buff_system:add_buff(revived_unit, buff_to_add, player_unit, false)
		end
	end,
	heal_percentage_of_enemy_hp_on_melee_kill = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local killing_blow_data = params[1]

			if not killing_blow_data then
				return
			end

			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
				local breed = params[2]

				if breed and not breed.is_hero then
					local heal_amount = breed.bloodlust_health or 0

					DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
				end
			end
		end
	end,
	heal_finesse_damage_on_melee = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
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

		if ALIVE[player_unit] and breed and (attack_type == "light_attack" or attack_type == "heavy_attack") and not has_procced then
			if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
				buff.has_procced = true

				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end

			if critical_hit then
				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true
			end
		end
	end,
	heal_stagger_targets_on_melee = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if ALIVE[player_unit] then
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
				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_damage_targets_on_melee = function (player, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if not ALIVE[player_unit] then
			return
		end

		local attack_type = params[param_order.buff_attack_type]

		if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
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
				end

				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_finesse_damage_on_ranged = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
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

		if Unit.alive(player_unit) and breed and buff_type == "RANGED" and not has_procced then
			if hit_zone_name == "head" or hit_zone_name == "neck" or hit_zone_name == "weakspot" then
				buff.has_procced = true

				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end

			if critical_hit then
				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")

				buff.has_procced = true
			end
		end
	end,
	on_hit_debuff_enemy_defence = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) and Managers.player.is_server then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if buff_extension then
				buff_extension:add_buff("defence_debuff_enemies")
			end
		end
	end,
	unbalance_debuff_on_stagger = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local is_dummy = Unit.get_data(hit_unit, "is_dummy")

		if Unit.alive(player_unit) and (is_dummy or Unit.alive(hit_unit)) and Managers.player.is_server then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if buff_extension then
				buff_extension:add_buff("tank_unbalance_buff")
			end
		end
	end,
	kills_stack_fiery_push = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("bw_kill_stacks")
		end
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

			buff_extension:add_buff("stacking_melee_damage", buff_params)
		end
	end,
	heal_on_melee_headshot = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end
	end,
	heal_on_ranged_headshot = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_zone_name = params[3]
		local attack_type = params[2]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "projectile" or attack_type == "instant_projectile") then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end
	end,
	heal_on_crit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local heal_amount = buff_template.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
		end
	end,
	add_buff_on_ranged_critical_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_type = params[5]
			local is_critical = params[6]

			if is_critical and buff_type ~= "MELEE_1H" and buff_type ~= "MELEE_2H" then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	apply_burn_to_enemies = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			table.clear(buff_params)

			buff_params.attacker_unit = player_unit

			buff_extension:add_buff("flaming_shield_burning_dot", buff_params)
		end
	end,
	regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("stamina_regen", buff_params)
		end
	end,
	add_buff_on_charged_attack_hit = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local attack_type = params[2]
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local server_controlled = template.server_controlled

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) and buff_to_add then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(player_unit, buff_to_add, player_unit, server_controlled)
		end
	end,
	sienna_unchained_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("sienna_unchained_stamina_regen", buff_params)
		end
	end,
	markus_mercenary_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("markus_mercenary_stamina_regen_buff", buff_params)
		end
	end,
	markus_knight_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("markus_knight_stamina_regen_buff", buff_params)
		end
	end,
	bardin_ironbreaker_gromril_stagger = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local template = buff.template
			local explosion_template = template.explosion_template
			local world = Application.main_world()
			local player_position = POSITION_LOOKUP[player_unit]
			local rotation = Quaternion.identity()
			local owner_is_bot = player and player.bot_player
			local is_husk = (owner_is_bot and true) or false
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			DamageUtils.create_explosion(world, player_unit, player_position, rotation, explosion_template, 1, "career_ability", true, is_husk, player_unit, career_power_level, false)
		end
	end,
	bardin_ironbreaker_gromril_trigger_rising_anger = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			buff.buff_ids = buff.buff_ids or {}
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_amount = #buff.buff_ids

			for i = 1, buff_amount, 1 do
				buff_extension:remove_buff(buff.buff_ids[i])
			end

			table.clear(buff.buff_ids)

			local template = buff.template

			for i = 1, buff_amount, 1 do
				local buff_on_pop = template.buff_on_pop
				slot12 = buff_extension:add_buff(buff_on_pop)
			end

			local t = Managers.time:time("game")
			buff._next_update_t = t + 0.5
		end
	end,
	bardin_slayer_push_on_dodge = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

			if status_extension:get_dodge_cooldown() >= 1 then
				local first_person_extension = ScriptUnit.has_extension(player_unit, "first_person_system")
				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
				local dodge_direction_box = params[1]
				local dodge_direction = dodge_direction_box:unbox()
				local template = buff.template
				local explosion_template = template.explosion_template
				local player_position = POSITION_LOOKUP[player_unit]
				local unit_rotation = first_person_extension:current_rotation()
				local career_power_level = career_extension:get_career_power_level()
				local offset_distance = 2
				local flat_unit_rotation = Quaternion.look(Vector3.flat(Quaternion.forward(unit_rotation)), Vector3.up())
				local move_direction = Quaternion.rotate(flat_unit_rotation, dodge_direction)
				local offset_position = player_position + Vector3.normalize(move_direction) * offset_distance
				local area_damage_system = Managers.state.entity:system("area_damage_system")

				area_damage_system:create_explosion(player_unit, offset_position, unit_rotation, explosion_template, 1, "career_ability", career_power_level, false)
			end
		end
	end,
	bardin_ironbreaker_regen_stamina_on_block_broken = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local template = buff.template
			local procced = math.random() <= template.proc_chance

			if procced then
				local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

				status_extension:remove_all_fatigue()
			end
		end
	end,
	bardin_ironbreaker_regen_stamina_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("bardin_ironbreaker_regen_stamina_on_charged_attacks_buff", buff_params)
		end
	end,
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = function (player, buff, params)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
			return
		end

		local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
		local fatigued = status_extension and status_extension:fatigued()

		if fatigued then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
			return
		end

		local template = buff.template
		local cooldown_reduction = template.cooldown_reduction
		local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

		career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)
	end,
	bardin_ironbreaker_add_power_buff_on_block = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local template = buff.template

		if Unit.alive(player_unit) then
			local buff_to_add = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			if not buff.buff_list then
				buff.buff_list = {}
			end

			local num_buff_list = #buff.buff_list
			local max_sub_buff_stacks = template.max_sub_buff_stacks

			if num_buff_list < max_sub_buff_stacks then
				buff.buff_list[num_buff_list + 1] = buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
			end
		end
	end,
	maidenguard_add_power_buff_on_block = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local template = buff.template

		if Unit.alive(player_unit) then
			local buff_to_add = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			if not buff.buff_list then
				buff.buff_list = {}
			end

			local amount_to_add = template.amount_to_add

			for i = 1, amount_to_add, 1 do
				local num_buff_list = #buff.buff_list
				local max_sub_buff_stacks = template.max_sub_buff_stacks

				if num_buff_list < max_sub_buff_stacks then
					buff.buff_list[num_buff_list + 1] = buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
				end
			end
		end
	end,
	bardin_ironbreaker_remove_on_block_power_buff = function (player, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local target_index = params[param_order.target_index]
			local template = buff.template
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local reference_buff_name = template.reference_buff
			local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

			if reference_buff and reference_buff.buff_list and target_index and target_index == 1 then
				for i = 1, #reference_buff.buff_list, 1 do
					local buff_to_remove = table.remove(reference_buff.buff_list)

					if buff_to_remove then
						buff_system:remove_server_controlled_buff(player_unit, buff_to_remove)
					end
				end
			end
		end
	end,
	remove_buff_on_action = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local kind = params[1].kind

			if not kind or (kind ~= "flamethrower" and kind ~= "charged_projectile" and kind ~= "bullet_spray" and kind ~= "charge") then
				return
			end

			local buff_template = buff.template
			local buff_ids = buff_template.buff_ids

			if not buff_ids or #buff_ids < 1 then
				return
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff_ids[#buff_ids])
			table.remove(buff_ids, #buff_ids)
		end
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

			buff_extension:add_buff("increased_melee_damage_from_proc", buff_params)
		end
	end,
	add_gromril_delay = function (player, buff, params)
		local player_unit = player.player_unit

		if not ALIVE[player_unit] then
			return
		end

		if is_local(player_unit) or is_server() then
			local buff_name = "bardin_ironbreaker_gromril_delay"
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension:has_talent("bardin_ironbreaker_max_gromril_delay", "dwarf_ranger", true) then
				buff_name = "bardin_ironbreaker_gromril_delay_short"
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff(buff_name)
		end
	end,
	reduce_ally_damage_taken_on_revived_ally = function (player, buff, params)
		local player_unit = player.player_unit
		local revived_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(revived_unit) then
			local buff_extension = ScriptUnit.extension(revived_unit, "buff_system")

			buff_extension:add_buff("bardin_ironbreaker_reduce_damage_taken_on_revive")
		end
	end,
	victor_zealot_gain_invulnerability = function (player, buff, params)
		local player_unit = player.player_unit
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if Unit.alive(player_unit) and not status_extension:is_knocked_down() then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
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
	sienna_unchained_vent_overheat_on_low_health = function (player, buff, params)
		local player_unit = player.player_unit
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if Unit.alive(player_unit) and not status_extension:is_knocked_down() then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
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
				local overcharge_extension = ScriptUnit.has_extension(player_unit, "overcharge_system")
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local buff_to_add = template.buff_to_add

				overcharge_extension:reset()
				buff_extension:add_buff(buff_to_add)

				return true
			end
		end
	end,
	add_increased_ranged_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("passive_career_wh_2_proc")
		end
	end,
	ww_melee_kills_stack_ranged_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("ww_increased_ranged_damage_from_proc")
		end
	end,
	wh_stack_kills_to_be_uninterruptible = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("wh_kill_stack_from_proc")
		end
	end,
	ww_melee_attacks_apply_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("ww_applied_damage_taken")
		end
	end,
	es_legshots_cripple = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) and (attack_type == "instant_projectile" or attack_type == "projectile") and (hit_zone_name == "left_leg" or hit_zone_name == "right_leg") then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("es_movement_speed_debuff")
		end
	end,
	ranged_crits_increase_dmg_vs_armour_type = function (player, buff, params)
		local player_unit = player.player_unit
		local target_unit = params[1]
		local attack_type = params[2]
		local hit_zone_name = nil
		local breed = AiUtils.unit_breed(target_unit)
		local dummy_unit_armor = Unit.get_data(target_unit, "armor")
		local armor_type = ActionUtils.get_target_armor(hit_zone_name, breed, dummy_unit_armor)

		if attack_type and (attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe") and ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

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
	debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff")
		end
	end,
	victor_witchhunter_debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff_enemies")
		end
	end,
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local target_number = params[4]
			local attack_type = params[2]
			local template = buff.template
			local required_targets = template.required_targets

			if target_number == 1 then
				buff.can_trigger = true
			end

			if attack_type == "ability" and required_targets <= target_number and buff.can_trigger then
				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
				local cooldown_reduction = template.cooldown_reduction

				career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)

				buff.can_trigger = false
			end
		end
	end,
	victor_witchhunter_activated_ability_increased_duration_on_enemies_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local target_number = params[4]
			local attack_type = params[2]
			local template = buff.template
			local required_targets = template.required_targets
			local buff_to_add = template.short_buff

			if target_number == 1 then
				buff.can_trigger = true
			end

			if attack_type ~= "ability" then
				return
			end

			if required_targets <= target_number and buff.can_trigger then
				buff_to_add = template.long_buff
			else
				buff_to_add = template.short_buff
			end

			local nearby_ally_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.player_units_broadphase
			local position = POSITION_LOOKUP[player_unit]
			local radius = 10
			local buff_system = Managers.state.entity:system("buff_system")

			Broadphase.query(broadphase, position, radius, nearby_ally_units)

			local side_manager = Managers.state.side

			for _, ally_unit in pairs(nearby_ally_units) do
				if Unit.alive(ally_unit) and not side_manager:is_enemy(player_unit, ally_unit) then
					local buff_extension = ScriptUnit.extension(ally_unit, "buff_system")
					local previous_buff = buff_extension:get_non_stacking_buff(template.short_buff)

					if buff_to_add == template.long_buff and previous_buff then
						buff_extension:remove_buff(previous_buff.id)
					end

					buff_system:add_buff(ally_unit, buff_to_add, player_unit)
				end
			end
		end
	end,
	sienna_unchained_activated_ability_power_on_enemies_hit = function (player, buff, params)
		if Managers.state.network.is_server then
			local player_unit = player.player_unit

			if ALIVE[player_unit] then
				local attack_type = params[2]

				if attack_type and attack_type == "ability" then
					local template = buff.template
					local buff_system = Managers.state.entity:system("buff_system")
					local buff_to_add = template.buff_to_add

					buff_system:add_buff(player_unit, buff_to_add, player_unit, false)
				end
			end
		end
	end,
	sienna_adept_add_damage_reduction_buff_on_ignited_enemy = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local template = buff.template
			local require_alive_enemy = template.require_alive_enemy
			local target_enemy = params[4]

			if require_alive_enemy and not AiUtils.unit_alive(target_enemy) then
				return
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add

			buff_system:add_buff(player_unit, buff_to_add, player_unit, false)
		end
	end,
	sienna_adept_add_attack_speed_buff_on_enemies_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local target_number = params[4]
			local template = buff.template
			local required_targets = template.required_targets

			if target_number == 1 then
				buff.can_trigger = true
			end

			if target_number and required_targets <= target_number and buff.can_trigger then
				local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
				local buff_to_add = template.buff_to_add

				buff_extension:add_buff(buff_to_add)

				buff.can_trigger = false
			end
		end
	end,
	sienna_scholar_refund_activated_ability_cooldown = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local target_number = params[4]
			local buff_type = params[5]
			local is_critical = params[6]

			if target_number <= 1 and buff_type == "RANGED_ABILITY" and is_critical then
				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(1)
			end
		end
	end,
	kerillian_shade_debuff_defence_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("defence_debuff_enemies")
		end
	end,
	kerillian_shade_stealth_on_backstab_kill = function (player, buff, params)
		local player_unit = player.player_unit
		local local_player = player.local_player
		local bot_player = player.bot_player
		local killing_blow_table = params[1]
		local backstab_multiplier = killing_blow_table[DamageDataIndex.BACKSTAB_MULTIPLIER]

		if Unit.alive(player_unit) and backstab_multiplier and backstab_multiplier > 1 then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if buff_extension:has_buff_type("kerillian_shade_activated_ability_short_blocker") then
				return
			end

			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local buffs_to_add = {
				"kerillian_shade_activated_ability_short",
				"kerillian_shade_activated_ability_short_blocker"
			}

			if local_player or (is_server and bot_player) then
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit

				for i = 1, #buffs_to_add, 1 do
					local buff_name = buffs_to_add[i]
					local unit_object_id = network_manager:unit_game_object_id(player_unit)
					local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

					if is_server() then
						buff_extension:add_buff(buff_name, {
							attacker_unit = player_unit
						})
						network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	kerillian_shade_cooldown_regen_on_backstab_kill = function (player, buff, params)
		local player_unit = player.player_unit
		local local_player = player.local_player
		local bot_player = player.bot_player
		local killing_blow_table = params[1]
		local backstab_multiplier = killing_blow_table[DamageDataIndex.BACKSTAB_MULTIPLIER]

		if Unit.alive(player_unit) and backstab_multiplier and backstab_multiplier > 1 then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			if local_player or (is_server and bot_player) then
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit

				buff_extension:add_buff(buff_to_add)
			end
		end
	end,
	kerillian_shade_buff_on_charged_backstab = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if ALIVE[player_unit] and ALIVE[hit_unit] then
			local player_unit_pos = POSITION_LOOKUP[player_unit]
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local owner_to_hit_dir = Vector3.normalize(hit_unit_pos - player_unit_pos)
			local hit_unit_direction = Quaternion.forward(Unit.local_rotation(hit_unit, 0))
			local hit_angle = Vector3.dot(hit_unit_direction, owner_to_hit_dir)
			local behind_target = hit_angle >= 0.55 and hit_angle <= 1
			local attack_type = params[2]
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_to_add = buff.template.buff_to_add

			if behind_target and attack_type == "heavy_attack" then
				if not buff_extension:has_buff_type("kerillian_shade_passive_improved_crit_blocker") then
					buff_extension:add_buff(buff_to_add)
					buff_extension:add_buff("kerillian_shade_passive_improved_crit_blocker")
				end
			else
				local buffs_to_remove = buff_extension:num_buff_stacks(buff_to_add)

				for i = 1, buffs_to_remove, 1 do
					local buff = buff_extension:get_buff_type(buff_to_add)

					if not buff then
						break
					end

					buff_extension:remove_buff(buff.id)
				end
			end
		end
	end,
	kerillian_waywatcher_restore_ammo_on_career_skill_special_kill = function (player, buff, params)
		local player_unit = player.player_unit
		local killing_blow_table = params[1]
		local killer_unit = killing_blow_table[DamageDataIndex.ATTACKER]
		local damage_source = killing_blow_table[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local breed_data = params[2]
		local can_trigger = nil

		if breed_data then
			can_trigger = breed_data.elite or breed_data.special
		end

		if Unit.alive(player_unit) and can_trigger and player_unit == killer_unit and damage_source == "kerillian_waywatcher_career_skill_weapon" then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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

			local energy_extension = ScriptUnit.has_extension(player_unit, "energy_system")

			if energy_extension then
				local max_energy = energy_extension:get_max()
				local energy_amount = ammo_bonus_fraction * max_energy

				energy_extension:add_energy(energy_amount)
			end
		end
	end,
	restore_ammo_on_special_kill = function (player, buff, params)
		local player_unit = player.player_unit
		local killing_blow_table = params[1]
		local killer_unit = killing_blow_table[DamageDataIndex.ATTACKER]

		if Unit.alive(player_unit) and player_unit == killer_unit then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	buff_defence_on_heal = function (player, buff, params)
		local player_unit = player.player_unit
		local healer_unit = params[1]
		local heal_type = params[3]

		if player_unit == healer_unit and (heal_type == "healing_draught" or heal_type == "bandage") then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("trait_necklace_damage_taken_reduction_buff")
		end
	end,
	buff_defence_on_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = "trait_necklace_damage_taken_reduction_buff"
			local server_controlled = false

			if attacker_unit ~= player_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				buff_system:add_buff(player_unit, buff_to_add, player_unit, server_controlled)
			end
		end
	end,
	add_buff_on_enemy_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local buff_system = Managers.state.entity:system("buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local server_controlled = false
			local player_side = Managers.state.side.side_by_unit[player_unit]
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]
			local is_ally = player_side == attacker_side

			if not is_ally and attacker_unit ~= player_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				buff_system:add_buff(player_unit, buff_to_add, player_unit, server_controlled)
			end
		end
	end,
	restore_stamina_on_enemy_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local player_side = Managers.state.side.side_by_unit[player_unit]
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]
			local is_ally = player_side == attacker_side

			if not is_ally and attacker_unit ~= player_unit and damage_amount > 0 and damage_type ~= "overcharge" then
				status_extension:remove_all_fatigue()
			end
		end
	end,
	bardin_ranger_scavenge_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local offset_position_1 = Vector3(0, 0.25, 0)
		local offset_position_2 = Vector3(0, -0.25, 0)

		if Unit.alive(player_unit) then
			local drop_chance = buff.template.drop_chance
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local result = math.random(1, 100)

			if result < drop_chance * 100 then
				local player_pos = POSITION_LOOKUP[player_unit] + Vector3.up() * 0.1
				local raycast_down = true
				local pickup_system = Managers.state.entity:system("pickup_system")

				if talent_extension:has_talent("bardin_ranger_passive_spawn_healing_draught", "dwarf_ranger", true) then
					if math.random(1, 4) > 1 then
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					else
						pickup_system:buff_spawn_pickup("frag_grenade_t1", player_pos, raycast_down)
						pickup_system:buff_spawn_pickup("ammo_ranger", player_pos, raycast_down)
					end
				elseif talent_extension:has_talent("bardin_ranger_passive_spawn_potions_or_bombs", "dwarf_ranger", true) then
					local drop_result = math.random(1, 5)

					if drop_result == 1 then
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
	bardin_ranger_add_power_on_no_ammo_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_add = buff_template.buff_to_add
		local active_buff = buff_extension:get_non_stacking_buff(buff_to_add)
		local server_controlled = true

		if not active_buff then
			local server_buff_id = buff_system:add_buff(player_unit, buff_to_add, player_unit, server_controlled)
			local added_buff = buff_extension:get_non_stacking_buff(buff_to_add)
			added_buff.server_buff_id = server_buff_id
		end
	end,
	bardin_ranger_remove_power_on_no_ammo_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local buff_template = buff.template
		local buff_to_remove = buff_template.buff_to_remove
		local active_buff = buff_extension:get_non_stacking_buff(buff_to_remove)

		if active_buff and active_buff.server_buff_id then
			buff_system:remove_server_controlled_buff(player_unit, active_buff.server_buff_id)
		end
	end,
	debuff_defence_grenade_hit = function (player, buff, params)
		local hit_unit = params[1]
		local attack_type = params[2]
		local breed = Unit.get_data(hit_unit, "breed")

		if attack_type == "grenade" and breed then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			buff_extension:add_buff("trait_trinket_grenade_damage_taken_buff")
		end
	end,
	activate_buff_on_disabler = function (player, buff, params)
		local unit = player.player_unit
		local template = buff.template
		local status_extension = ScriptUnit.extension(unit, "status_system")
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
	add_buff_to_all_players = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local player_unit = player.player_unit
		local side = Managers.state.side.side_by_unit[player_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				buff_system:add_buff(unit, buff_to_add, unit, false)
			end
		end
	end,
	life_mutator_remove_regen = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local ids = buff.health_regeneration_stack_ids

			if #ids > 0 then
				local id = table.remove(ids, 1)

				buff_extension:remove_buff(id)
			end
		end
	end,
	add_buff_on_stacks_on_hit = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local buff_template = buff.template
		local buff_system = Managers.state.entity:system("buff_system")
		local target_number = params[4]
		local buff_to_add = buff_template.buff_to_add
		local buff_on_stacks = buff_template.buff_on_stacks
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if not buff_extension:has_buff_type(buff_to_add) and target_number < 2 then
			if not buff.stack then
				buff.stack = 1
			else
				buff.stack = buff.stack + 1
			end

			if buff.stack and buff_on_stacks <= buff.stack then
				buff.added_buff_id = buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
				buff.stack = 0
			end
		elseif buff.added_buff_id and target_number < 2 then
			buff_system:remove_server_controlled_buff(player_unit, buff.added_buff_id)
		end
	end,
	add_buff_on_stacks_on_event = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local buff_template = buff.template
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff_template.buff_to_add
		local buff_on_stacks = buff_template.buff_on_stacks
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if not buff_extension:has_buff_type(buff_to_add) then
			if not buff.stack then
				buff.stack = 1
			else
				buff.stack = buff.stack + 1
			end

			if buff.stack and buff_on_stacks <= buff.stack then
				buff.added_buff_id = buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
				buff.stack = 0
			end
		elseif buff.added_buff_id then
			buff_system:remove_server_controlled_buff(player_unit, buff.added_buff_id)
		end
	end,
	buff_consecutive_shots_damage = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local attack_type = params[2]
		local target_number = params[4]
		local hit_unit_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")
		local player_unit_buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if attack_type and (attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe") then
			if hit_unit_buff_extension:has_buff_type("consecutive_shot_debuff") and target_number == 1 then
				player_unit_buff_extension:add_buff("consecutive_shot_buff")
			end

			hit_unit_buff_extension:add_buff("consecutive_shot_debuff")
		end
	end,
	block_increase_enemy_damage_taken = function (player, buff, params)
		local attacking_unit = params[1]

		if Unit.alive(attacking_unit) then
			local attacker_buff_extension = ScriptUnit.has_extension(attacking_unit, "buff_system")

			if attacker_buff_extension then
				attacker_buff_extension:add_buff("defence_debuff_enemies")
			end
		end
	end,
	add_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	add_buff_on_first_target_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
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
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if buff_template.block_buff and buff_extension:has_buff_type(buff_template.block_buff) then
				return
			end

			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if client_side then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
			elseif is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	add_buff_on_first_target_hit_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
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
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_on_unmodified_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_data = params[5]
			local attack_type = params[2]
			local unmodifed = params[7]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			if (attack_type ~= "instant_projectile" and attack_type ~= "projectile") or not unmodifed then
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
	add_delayed_buff_on_ranged_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_data = params[5]
			local attack_type = params[2]
			local unmodifed = params[7]
			local hit_unit = params[1]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			local is_dummy = false

			if hit_unit then
				is_dummy = Unit.get_data(hit_unit, "is_dummy")
			end

			if (attack_type ~= "instant_projectile" and attack_type ~= "projectile") or (not unmodifed and not is_dummy) then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				buff.marked_for_add = true
			end
		end
	end,
	add_buff_local = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

			buff_extension:add_buff(buff_name)
		end
	end,
	add_buff_on_first_target_hit_range = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_data = params[5]
			local attack_type = params[2]

			if not hit_data or hit_data == "n/a" or hit_data ~= "RANGED" then
				return
			end

			if attack_type ~= "instant_projectile" and attack_type ~= "projectile" then
				return
			end

			local target_number = params[4]

			if target_number < 2 then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_stack_on_melee_critical_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local target_number = params[4]
			local buff_type = params[5]
			local is_critical = params[6]

			if target_number < 2 and is_critical and (buff_type == "MELEE_1H" or buff_type == "MELEE_2H") then
				local template = buff.template
				local buff_name = template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
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
	set_noclip = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local template = buff.template
			local set_status = template.set_status

			status_extension:set_noclip(set_status)
		end
	end,
	add_buff_on_elite_or_special_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special or killed_unit_breed_data.elite then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_on_special_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	add_buff_stack_on_special_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.special or killed_unit_breed_data.elite then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local max_sub_buff_stacks = buff_template.max_sub_buff_stacks
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if not buff.buff_list then
					buff.buff_list = {}
				end

				if max_sub_buff_stacks > #buff.buff_list then
					buff.buff_list[#buff.buff_list + 1] = buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
				end
			end
		end
	end,
	remove_ref_buff_stack = function (player, buff, params)
		local player_unit = player.player_unit
		local damage_unit = params[1]
		local damage_type = params[3]
		local side_player = Managers.state.side.side_by_unit[player_unit]
		local side_damage = Managers.state.side.side_by_unit[damage_unit]

		if side_damage and side_player and side_player == side_damage then
			return
		elseif ALIVE[player_unit] and damage_type ~= "temporary_health_degen" then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local reference_buff_name = buff_template.reference_buff
			local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

			if reference_buff.buff_list then
				local buff_id = table.remove(reference_buff.buff_list)

				buff_extension:remove_buff(buff_id)
			end
		end
	end,
	add_buff_on_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local hit_zone = params[3]

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") then
				local buff_template = buff.template
				local attack_type = params[2]
				local allowed_attacks = buff_template.allowed_attacks

				if allowed_attacks and not allowed_attacks[attack_type] then
					return
				end

				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	sienna_unchained_add_buff_on_vent_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local damage_type = params[3]

			if damage_type and damage_type == "overcharge" then
				local buff_template = buff.template
				local buff_list = buff_template.buffs_to_add

				for i = 1, #buff_list, 1 do
					local buff_name = buff_list[i]
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_object_id = network_manager:unit_game_object_id(player_unit)
					local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

					if is_server() then
						buff_extension:add_buff(buff_name, {
							attacker_unit = player_unit
						})
						network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	sienna_on_kill_explosion = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local killed_unit = params[3]

		if Unit.alive(player_unit) then
			local ai_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")
			local buff_template = buff.template
			local proc_chance = buff_template.proc_chance

			if math.random() <= proc_chance and ai_buff_extension and ai_buff_extension:has_buff_perk("burning") then
				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
				local area_damage_system = Managers.state.entity:system("area_damage_system")
				local position = POSITION_LOOKUP[killed_unit]
				local damage_source = "buff"
				local explosion_template = "sienna_unchained_burning_enemies_explosion"
				local rotation = Quaternion.identity()
				local career_power_level = career_extension:get_career_power_level()
				local scale = 1
				local is_critical_strike = false

				area_damage_system:create_explosion(player_unit, position, rotation, explosion_template, scale, damage_source, career_power_level, is_critical_strike)
			end
		end
	end,
	sienna_burn_push_on_charged_attacks = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]

		if attack_type ~= "heavy_attack" then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	sienna_burn_push_on_charged_attacks_remove = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	sienna_unchained_pulse_extension = function (player, buff, params)
		if player and player.remote then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local attack_type = params[2]

			if attack_type and attack_type == "light_attack" then
				slot5 = buff.template
			end
		end
	end,
	add_buff_on_ranged_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_zone = params[3]
			local buff_type = params[2] == "light_attack" or params[2] == "heavy_attack"

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") and not buff_type then
				local buff_template = buff.template
				local buff_name = buff_template.buff_to_add
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	bardin_ranger_add_reload_speed_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
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
	remove_non_stacking_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local template = buff.template
			local buff_to_remove = template.buff_to_remove
			local removable_buff = buff_extension:get_non_stacking_buff(buff_to_remove)

			if removable_buff then
				buff_extension:remove_buff(removable_buff.id)
			end
		end
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
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if talent_extension:has_talent("bardin_slayer_passive_increased_max_stacks", "dwarf_ranger", true) then
				buff_name = "bardin_slayer_passive_increased_max_stacks"
			end

			buff_system:add_buff(player_unit, buff_name, player_unit, false)

			if talent_extension:has_talent("bardin_slayer_passive_movement_speed", "dwarf_ranger", true) then
				buff_system:add_buff(player_unit, "bardin_slayer_passive_movement_speed", player_unit, false)
			end

			if talent_extension:has_talent("bardin_slayer_passive_cooldown_reduction_on_max_stacks", "dwarf_ranger", true) then
				local num_stacks = buff_extension:num_buff_type(buff_name)
				local max_stacks = buff.template.max_stacks

				if num_stacks == max_stacks then
					buff_system:add_buff(player_unit, "bardin_slayer_passive_cooldown_reduction_on_max_stacks", player_unit, false)
				end
			end
		end
	end,
	bardin_slayer_self_revive_on_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_template = buff.template

			if not buff_template.kill_count then
				buff_template.kill_count = 0
			end

			buff_template.kill_count = buff_template.kill_count + 1
			local kill_requirement = buff_template.kill_requirement

			if kill_requirement <= buff_template.kill_count then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	remove_fatigue = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local fatigue_amount = buff.bonus
			local status_extension = ScriptUnit.extension(player_unit, "status_system")

			status_extension:remove_fatigue_points(fatigue_amount)
		end
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

			buff_extension:add_buff("increased_attack_speed", buff_params)
		end
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

			buff_extension:add_buff("increased_critical_hit_chance", buff_params)
		end
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
				overcharge_extension:remove_charge(overcharge_amount)
			end
		end
	end,
	shade_activated_ability_on_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_unit = params[1]
			local behind_target = ActionUtils.is_backstab(player_unit, hit_unit)

			if behind_target then
				local first_person_extension = ScriptUnit.has_extension(player_unit, "first_person_system")

				if first_person_extension then
					first_person_extension:play_hud_sound_event("Play_career_ability_shade_backstab")
				end
			end

			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if talent_extension:has_talent("kerillian_shade_activated_ability_restealth") and buff.template.restealth then
				local t = Managers.time:time("game")
				buff.start_time = t - 4.95
				local first_person_extension = ScriptUnit.has_extension(player_unit, "first_person_system")

				if first_person_extension then
					first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter")
					first_person_extension:animation_event("shade_stealth_ability")
				end
			else
				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	kerillian_shade_cheat_death_damage_taken = function (player, buff, params)
		if not is_server() then
			return
		end

		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_to_add = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(player_unit, "kerillian_shade_activated_ability_cheat_death_blocker", player_unit, false)
			buff_system:add_buff(player_unit, buff_to_add, player_unit, false)
			buff_system:remove_buff_synced(player_unit, buff.id)
		end
	end,
	kerillian_shade_stealth_crits_proc = function (player, buff, params)
		local unit = player.player_unit

		if ALIVE[unit] then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if not status_extension or not buff_extension then
				return
			end

			if not buff.old_stealth_counter then
				buff.old_stealth_counter = 0
			end

			if not buff.is_buffed then
				buff.is_buffed = false
			end

			local stealth_counter = params[1]

			if buff.old_stealth_counter == stealth_counter then
				return
			end

			buff.old_stealth_counter = stealth_counter

			if stealth_counter > 0 and not buff.is_buffed then
				local buff_to_add = buff.template.buff_to_add
				buff.is_buffed = buff_extension:add_buff(buff_to_add)
			end

			if stealth_counter < 1 and buff.is_buffed then
				local has_buff = buff_extension:get_buff_by_id(buff.is_buffed)

				if has_buff then
					buff_extension:remove_buff(has_buff.id)
				end

				buff.is_buffed = nil
			end
		end
	end,
	shade_combo_stealth_on_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if not buff_extension:has_buff_type("kerillian_shade_ult_invis_combo_blocker") then
				buff_extension:add_buff("kerillian_shade_ult_invis_combo_window")
			end
		end
	end,
	shade_combo_stealth_extend_on_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local has_buff = buff_extension:get_buff_type("kerillian_shade_ult_invis")

			if has_buff then
				local extend_time = buff.template.extend_time
				local t = Managers.time:time("game")
				local new_duration = (extend_time + has_buff.start_time) - t + has_buff.duration
				has_buff.start_time = t
				has_buff.duration = new_duration
				buff.killed_target = true
			end
		end
	end,
	shade_short_stealth_on_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	shade_backstab_ammo_gain = function (player, buff, params)
		local player_unit = player.player_unit
		local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if buff_extension and not buff_extension:has_buff_type("kerillian_shade_backstabs_replenishes_ammunition_cooldown") then
			if Unit.alive(player_unit) then
				local weapon_slot = "slot_ranged"
				local ammo_amount = buff.bonus
				local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	end_huntsman_stealth = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and is_local(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local removing_stealth = status_extension:remove_stealth_stacking()

			if removing_stealth then
				local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit", nil, true)
				first_person_extension:play_remote_hud_sound_event("Stop_career_ability_markus_huntsman_loop_husk")

				if not is_bot(player_unit) then
					MOOD_BLACKBOARD.skill_shade = false
					MOOD_BLACKBOARD.skill_huntsman_stealth = false
					MOOD_BLACKBOARD.skill_huntsman_surge = true

					first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")
				end
			end
		end
	end,
	end_huntsman_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local huntsman_activated_ability_buff = buff_extension:get_non_stacking_buff("markus_huntsman_activated_ability")

			if huntsman_activated_ability_buff then
				buff_extension:remove_buff(huntsman_activated_ability_buff.id)
			end
		end
	end,
	end_ranger_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local ranger_activated_ability_buff = buff_extension:get_non_stacking_buff("bardin_ranger_activated_ability")
			local ranger_smoke_attack = buff_extension:get_non_stacking_buff("bardin_ranger_smoke_attack")
			local ranger_smoke_heal = buff_extension:get_non_stacking_buff("bardin_ranger_smoke_heal")

			if ranger_activated_ability_buff then
				buff_extension:remove_buff(ranger_activated_ability_buff.id)
			end

			if ranger_smoke_attack then
				buff_extension:remove_buff(ranger_smoke_attack.id)
			end

			if ranger_smoke_heal then
				buff_extension:remove_buff(ranger_smoke_heal.id)
			end
		end
	end,
	exit_buff_area = function (player, template, params)
		local owner_unit = player.player_unit

		if not ALIVE[owner_unit] then
			return false
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_name = template.buff_to_add
		local area_buff = buff_extension:get_non_stacking_buff(buff_name)

		if area_buff then
			buff_extension:remove_buff(area_buff.id)
		end
	end,
	enter_buff_area = function (player, template, params)
		local owner_unit = player.player_unit

		if not ALIVE[owner_unit] then
			return false
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_name = template.buff_to_add

		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})
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

			buff_extension:add_buff("increased_movement_speed_from_proc", buff_params)
		end
	end,
	ammo_gain = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	ammo_fraction_gain = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	victor_bounty_hunter_add_power_on_no_ammo_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local owner_unit = player_unit
		local buff_template = buff.template
		local buff_to_add = buff_template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")

		if Unit.alive(player_unit) then
			local side = Managers.state.side.side_by_unit[player_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units

			for i = 1, num_units, 1 do
				local unit = player_and_bot_units[i]

				if Unit.alive(unit) then
					buff_system:add_buff(unit, buff_to_add, owner_unit, false)
				end
			end
		end
	end,
	add_buff_on_out_of_ammo = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local buffs = buff_template.buffs_to_add

			for i = 1, #buffs, 1 do
				local buff_name = buffs[i]
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	victor_bounty_hunter_ammo_gain_gain_out_of_ammo = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local killed_unit_breed_data = params[2]

			if not killed_unit_breed_data.elite then
				return
			end

			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local current_ammo = ammo_extension:remaining_ammo()
			local clip_ammo = ammo_extension:ammo_count()
			local buff_name = buff_template.buff_to_add
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			for i = 1, 5, 1 do
				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	victor_bounty_hunter_reload_on_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local killing_blow = params[1]
			local damage_source_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local weapon_slot = "slot_melee"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)

			if not slot_data then
				return
			end

			local item_data = slot_data.item_data

			if damage_source_name ~= item_data.name then
				return
			end

			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local current_ammo = ammo_extension:remaining_ammo()
			local clip_ammo = ammo_extension:ammo_count()

			if current_ammo >= 1 and ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false

				ammo_extension:remove_ammo(1)
			end
		end
	end,
	victor_bounty_hunter_ammo_regen = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local current_ammo = ammo_extension:remaining_ammo()
			local clip_ammo = ammo_extension:ammo_count()

			if ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false
			else
				ammo_extension:add_ammo(1)
			end
		end
	end,
	victor_bounty_contract = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local killed_unit_breed_data = params[2]
			local buff_template = buff.template

			if killed_unit_breed_data.name ~= buff_template.breed_to_kill then
				return
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	victor_bounty_blast_streak_activation = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local killing_blow = params[1]
			local damage_source_name = killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if damage_source_name ~= "victor_bountyhunter_career_skill_weapon" then
				return
			end

			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
			local unit_object_id = network_manager:unit_game_object_id(player_unit)

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	victor_bounty_blast_streak_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local damage_type = params[5]

			if damage_type ~= "RANGED_ABILITY" then
				return
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	victor_bountyhunter_blessed_combat = function (player, buff, params)
		if not is_server() then
			return
		end

		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
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

		if attack_type == "projectile" or attack_type == "instant_projectile" then
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

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")

		if is_ranged then
			if #buff_template.melee_buff_ids < 6 then
				table.insert(buff_template.melee_buff_ids, buff_system:add_buff(player_unit, buff_name, player_unit, true))
			end

			if buff_extension:has_buff_type(buff_template.ranged_buff) then
				buff_system:remove_server_controlled_buff(player_unit, buff_template.ranged_buff_ids[#buff_template.ranged_buff_ids])
				table.remove(buff_template.ranged_buff_ids, #buff_template.ranged_buff_ids)
			else
				table.clear(buff_template.ranged_buff_ids)
			end
		end

		if is_melee then
			if #buff_template.ranged_buff_ids < 6 then
				table.insert(buff_template.ranged_buff_ids, buff_system:add_buff(player_unit, buff_name, player_unit, true))
			end

			if buff_extension:has_buff_type(buff_template.melee_buff) then
				buff_system:remove_server_controlled_buff(player_unit, buff_template.melee_buff_ids[#buff_template.melee_buff_ids])
				table.remove(buff_template.melee_buff_ids, #buff_template.melee_buff_ids)
			else
				table.clear(buff_template.melee_buff_ids)
			end
		end
	end,
	add_team_buff_on_ranged_critical_hit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_type = params[5]
			local is_critical = params[6]

			if is_critical and not MeleeBuffTypes[buff_type] then
				local side = Managers.state.side.side_by_unit[player_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local num_targets = #player_and_bot_units
				local range = 40
				local buff_template = buff.template
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local owner_position = POSITION_LOOKUP[player_unit]
				local range_squared = range * range

				for i = 1, num_targets, 1 do
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
	victor_bounty_hunter_ammo_fraction_gain_out_of_ammo = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local killed_unit_breed_data = params[2]

			if killed_unit_breed_data.elite then
				local buff_template = buff.template
				local weapon_slot = "slot_ranged"
				local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	ammo_fraction_gain_on_crit_trait = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local target_number = params[4]
			local attack_type = params[2]
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)
			local ammo_bonus_fraction = buff_template.ammo_bonus_fraction

			if ammo_extension and (attack_type == "instant_projectile" or attack_type == "projectile") then
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
	ammo_gain_when_low = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if Unit.alive(player_unit) then
			local buff_template = buff.template
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
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
	markus_huntsman_passive_proc = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension:has_talent("markus_huntsman_passive_crit_buff_on_headshot", "empire_soldier", true) then
				buff_extension:add_buff("markus_huntsman_passive_crit_buff")
				buff_extension:add_buff("markus_huntsman_passive_crit_buff_removal")
			end

			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	markus_huntsman_free_shot = function (player, buff, params)
		local player_unit = player.player_unit

		if player and player.remote then
			return
		end

		if ALIVE[player_unit] then
			local weapon_slot = "slot_ranged"
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local clip_ammo = ammo_extension:ammo_count()

			if ammo_extension and not ammo_extension:clip_full() then
				ammo_extension._ammo_immediately_available = true

				ammo_extension:add_ammo(1)

				ammo_extension._ammo_immediately_available = false
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	markus_huntsman_ult_on_death = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local damage_taken = params[2]

			if health_extension:current_health() - damage_taken < 0 then
				if Managers.player.is_server then
					DamageUtils.heal_network(player_unit, player_unit, 30, "heal_from_proc")
					DamageUtils.add_damage_network(player_unit, player_unit, health_extension:current_health() - 1, "torso", "buff", nil, Vector3(0, 0, 0), nil, nil, player_unit)
				end

				local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

				career_extension:start_activated_ability_cooldown()
				career_extension:set_activated_ability_cooldown_paused()
				career_extension:force_trigger_active_ability()

				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local template = buff.template
				local buff_name = template.buff_to_add
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
				local unit_object_id = network_manager:unit_game_object_id(player_unit)

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	markus_huntsman_debuff_defence = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	markus_huntsman_passive_on_melee_kills = function (player, buff, params)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
			return
		end

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local template = buff.template
		local buff_to_add = template.counter_buff_to_add
		local buff_name = template.buff_to_add
		local num_stacks = buff_extension:num_buff_type(buff_to_add)
		local max_sub_buff_stacks = template.max_sub_buff_stacks - 1

		if num_stacks >= max_sub_buff_stacks then
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
	remove_buff_stack = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

			if buff_extension then
				local template = buff.template
				local remove_buff_stack_data_array = template.remove_buff_stack_data

				for i = 1, #remove_buff_stack_data_array, 1 do
					local remove_buff_stack_data = remove_buff_stack_data_array[i]
					local buff_to_remove = remove_buff_stack_data.buff_to_remove
					local num_stacks = remove_buff_stack_data.num_stacks or 1

					if remove_buff_stack_data.server_controlled then
						fassert(buff_to_remove == template.buff_to_add, "Trying to remove different type of server controlled buff, only same types are allowed right now.")

						local buff_system = Managers.state.entity:system("buff_system")
						local server_buff_ids = buff.server_buff_ids
						num_stacks = (server_buff_ids and math.min(#server_buff_ids, num_stacks)) or 0

						for i = 1, num_stacks, 1 do
							local buff_to_remove = table.remove(server_buff_ids)

							buff_system:remove_server_controlled_buff(player_unit, buff_to_remove)
						end
					else
						for i = 1, num_stacks, 1 do
							local buff = buff_extension:get_buff_type(buff_to_remove)

							if not buff then
								break
							end

							buff_extension:remove_buff(buff.id)
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
	markus_huntsman_increase_reload_speed = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			buff_extension:add_buff("markus_huntsman_headshots_increase_reload_speed_buff")
		end
	end,
	replenish_ammo_on_headshot_ranged = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local hit_zone_name = params[3]

		if Unit.alive(player_unit) and hit_zone_name == "head" and (attack_type == "instant_projectile" or attack_type == "projectile") then
			local ranged_buff_type = params[5]

			if ranged_buff_type and ranged_buff_type == "RANGED_ABILITY" then
				return
			end

			local weapon_slot = "slot_ranged"
			local ammo_amount = buff.bonus
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local ammo_extension = GearUtils.get_ammo_extension(right_unit_1p, left_unit_1p)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	reset_tranquility = function (player, buff, params)
		local player_unit = player.player_unit
		local attacker_unit = params[1]
		local damage_amount = params[2]
		local damaged = true

		if damage_amount and damage_amount == 0 then
			damaged = false
		end

		if Unit.alive(player_unit) and attacker_unit ~= player_unit and damaged then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local tranquility_buff = buff_extension:get_non_stacking_buff("tranquility")

			if tranquility_buff then
				buff_extension:remove_buff(tranquility_buff.id)
			end

			local buff_to_add = "sienna_adept_passive"
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("sienna_adept_passive_cooldown") then
				buff_to_add = "sienna_adept_passive_cooldown"
			end

			buff_extension:add_buff(buff_to_add)
		end
	end,
	maidenguard_remove_on_block_speed_buff = function (player, buff, params, world, param_order)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local target_index = params[param_order.target_index]
			local template = buff.template
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local reference_buff_names = template.reference_buffs

			for i = 1, #reference_buff_names, 1 do
				local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_names[i])

				if reference_buff and reference_buff.buff_list and target_index and target_index == 1 then
					local buff_to_remove = table.remove(reference_buff.buff_list, #reference_buff.buff_list)

					if buff_to_remove then
						buff_system:remove_server_controlled_buff(player_unit, buff_to_remove)
					end
				end
			end
		end
	end,
	maidenguard_footwork_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local buff_template = buff.template

			if status_extension.blocking then
				local buffs_to_add = buff_template.dodge_buffs_to_add

				for i = 1, #buffs_to_add, 1 do
					local buff_to_add = buffs_to_add[i]

					buff_extension:add_buff(buff_to_add)
				end
			else
				local buff_to_add = buff_template.attack_buff_to_add
				local is_server = Managers.state.network.is_server
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]

				if unit_object_id then
					if is_server then
						buff_extension:add_buff(buff_to_add, {
							attacker_unit = player_unit
						})
					else
						network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
					end
				end
			end
		end
	end,
	maidenguard_footwork_on_dodge_end = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if buff then
				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	maidenguard_reset_unharmed_buff = function (player, buff, params)
		local player_unit = player.player_unit
		local attacker_unit = params[1]
		local damage_amount = params[2]
		local damaged = true

		if damage_amount and damage_amount == 0 then
			damaged = false
		end

		if Unit.alive(player_unit) and attacker_unit ~= player_unit and damaged then
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local buff_name = "kerillian_maidenguard_power_level_on_unharmed_cooldown"
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end

			return true
		end
	end,
	buff_on_stagger_enemy = function (player, buff, params)
		local buff_template = buff.template
		local player_unit = player.player_unit
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local hit_unit = params[1]
		local breed = Unit.get_data(hit_unit, "breed")
		local buff_name = buff_template.buff_to_add
		local enemy_type_list = buff_template.enemy_type or nil
		local add_buff = false

		if breed and enemy_type_list then
			for i = 1, #enemy_type_list, 1 do
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
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

			if is_server() then
				buff_extension:add_buff(buff_name, {
					attacker_unit = player_unit
				})
				network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
			else
				network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
			end
		end
	end,
	buff_on_blocked_attack = function (player, buff, params)
		local buff_template = buff.template
		local player_unit = player.player_unit
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local buff_to_add = buff_template.buff_to_add

		buff_extension:add_buff(buff_to_add)
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
		local buff_applied = true

		if Unit.alive(player_unit) and target_number and buff_template.targets <= target_number and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension:has_talent("markus_mercenary_passive_improved", "empire_soldier", true) then
				if target_number >= 4 then
					buff_system:add_buff(player_unit, "markus_mercenary_passive_improved", owner_unit, false)
				else
					buff_applied = false
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_group_proc", "empire_soldier", true) then
				local side = Managers.state.side.side_by_unit[player_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local num_units = #player_and_bot_units

				for i = 1, num_units, 1 do
					local unit = player_and_bot_units[i]

					if Unit.alive(unit) then
						buff_system:add_buff(unit, buff_to_add, owner_unit, false)
					end
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_power_level_on_proc", "empire_soldier", true) then
				buff_system:add_buff(player_unit, "markus_mercenary_passive_power_level", owner_unit, false)
				buff_system:add_buff(player_unit, buff_to_add, owner_unit, false)
			else
				buff_system:add_buff(player_unit, buff_to_add, owner_unit, false)
			end

			if talent_extension:has_talent("markus_mercenary_passive_defence_on_proc", "empire_soldier", true) and buff_applied then
				buff_system:add_buff(player_unit, "markus_mercenary_passive_defence", owner_unit, false)
			end
		end
	end,
	reduce_activated_ability_cooldown = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local attack_type = params[2]
			local target_number = params[4]
			local career_extension = ScriptUnit.extension(player_unit, "career_system")

			if not attack_type or attack_type == "heavy_attack" or attack_type == "light_attack" then
				career_extension:reduce_activated_ability_cooldown(buff.bonus)
			elseif target_number and target_number == 1 then
				career_extension:reduce_activated_ability_cooldown(buff.bonus)
			end
		end
	end,
	victor_bountyhunter_reduce_activated_ability_cooldown_ignore_paused_on_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local killing_blow_table = params[1]
			local killing_blow_damage_source = killing_blow_table[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local career_extension = ScriptUnit.extension(player_unit, "career_system")

			if career_extension and killing_blow_damage_source ~= "victor_bountyhunter_career_skill_weapon" then
				local ignore_paused = true

				career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier, nil, ignore_paused)
			end
		end
	end,
	victor_bountyhunter_reduce_activated_ability_cooldown_on_passive_crit = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local t = Managers.time:time("game")

			if not buff.cooldown or buff.cooldown < t then
				local attack_type = params[2]

				if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
					local career_extension = ScriptUnit.extension(player_unit, "career_system")

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
	victor_bounty_hunter_reduce_activated_ability_cooldown_railgun = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number and target_number <= 1 then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local buff_to_add = buff.template.buff_to_add

				buff_extension:add_buff(buff_to_add)

				buff.can_trigger = false
			end
		end
	end,
	kerillian_waywatcher_reduce_activated_ability_cooldown = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number and target_number <= 1 then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local career_extension = ScriptUnit.extension(player_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier)

				buff.can_trigger = false
			end
		end
	end,
	kerillian_waywatcher_add_extra_shot_buff_on_melee_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
			return
		end

		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		buff_extension:add_buff(buff_name, {
			attacker_unit = player_unit
		})
	end,
	kerillian_waywatcher_consume_extra_shot_buff = function (player, buff, params)
		local is_career_skill = params[1]
		local should_consume_shot = not is_career_skill

		return should_consume_shot
	end,
	reduce_activated_ability_cooldown_boss_hit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local target_number = params[2]

		if Unit.alive(player_unit) then
			local breed = Unit.get_data(hit_unit, "breed")

			if target_number <= 1 then
				buff.can_trigger = true
			end

			if breed and breed.boss and buff.can_trigger then
				local career_extension = ScriptUnit.extension(player_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown(buff.bonus)

				buff.can_trigger = false
			end
		end
	end,
	reduce_activated_ability_cooldown_with_internal_cooldown_on_crit = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[2]
		local buff_type = params[5]
		local valid_attack = nil

		if RangedBuffTypes[buff_type] then
			valid_attack = attack_type == "projectile" or attack_type == "instant_projectile" or attack_type == "aoe"
		else
			valid_attack = attack_type == "light_attack" or attack_type == "heavy_attack"
		end

		if valid_attack and ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_template = buff.template
			local buff_to_add = buff_template.buff_to_add

			if not buff_extension:has_buff_type(buff_to_add) then
				local career_extension = ScriptUnit.extension(player_unit, "career_system")

				buff_extension:add_buff(buff_to_add)
				career_extension:reduce_activated_ability_cooldown_percent(buff.bonus)
			end
		end
	end,
	reduce_activated_ability_cooldown_on_damage_taken = function (player, buff, params)
		local player_unit = player.player_unit
		local attacker_unit = params[1]
		local damage_taken = params[2]

		if Unit.alive(player_unit) and attacker_unit ~= player_unit then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local cooldown_removed = buff.bonus * damage_taken

			career_extension:reduce_activated_ability_cooldown(cooldown_removed)
		end
	end,
	sienna_adept_reduce_activated_ability_cooldown_on_burning_enemy_killed = function (player, buff, params)
		local player_unit = player.player_unit
		local killed_unit = params[3]

		if Unit.alive(killed_unit) then
			local killed_unit_buff_extension = ScriptUnit.has_extension(killed_unit, "buff_system")

			if killed_unit_buff_extension and killed_unit_buff_extension:has_buff_perk("burning") then
				local t = Managers.time:time("game")
				local cooldown_timer = buff.cooldown_timer

				if not cooldown_timer or cooldown_timer <= t then
					local template = buff.template
					local internal_cooldown = template.internal_cooldown
					local cooldown_removed = template.cooldown_reduction
					local career_extension = ScriptUnit.extension(player_unit, "career_system")

					career_extension:reduce_activated_ability_cooldown_percent(cooldown_removed)

					buff.cooldown_timer = t + internal_cooldown
				end
			end
		end
	end,
	remove_victor_bountyhunter_passive_crit_buff = function (player, buff, params)
		local player_unit = player.player_unit
		local action_type = params[1]
		local melee_action = action_type == "sweep" or action_type == "push_stagger" or action_type == "shield_slam"

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local crit_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_crit_buff")

			if crit_buff and not melee_action then
				buff_extension:remove_buff(crit_buff.id)

				local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

				if talent_extension:has_talent("victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
					buff_extension:add_buff("victor_bountyhunter_passive_reduced_cooldown")
				else
					buff_extension:add_buff("victor_bountyhunter_passive_crit_cooldown")
				end
			end
		end
	end,
	remove_markus_huntsman_passive_crit_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local crit_buff = buff_extension:get_non_stacking_buff("markus_huntsman_passive_crit_buff")

			if crit_buff then
				buff_extension:remove_buff(crit_buff.id)
			end
		end
	end,
	mark_for_delayed_deletion = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			buff.marked_for_deletion = true
		end
	end,
	gain_uninterruptible = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("uninterruptible")
		end
	end,
	gain_bardin_slayer_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("bardin_slayer_uninterruptible_on_block_broken_buff")
		end
	end,
	bardin_slayer_add_buff_on_leap_start = function (player, buff, params)
		local player_unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		if Unit.alive(player_unit) and Managers.player.is_server then
			buff.server_buff_id = buff_system:add_buff(player_unit, buff_to_add, player_unit, true)
		end
	end,
	bardin_slayer_remove_buff_on_leap_finished = function (player, buff, params)
		local player_unit = player.player_unit
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
		local parent_buff_name = buff.template.parent_buff

		if Unit.alive(player_unit) and Managers.player.is_server then
			local parent_buff = buff_extension:get_non_stacking_buff(parent_buff_name)

			if parent_buff then
				local sub_buff_id = parent_buff.server_buff_id

				if sub_buff_id then
					buff_system:remove_server_controlled_buff(player_unit, sub_buff_id)
				end
			end
		end
	end,
	gain_markus_knight_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("markus_knight_uninterruptible_on_block_broken_buff")
		end
	end,
	markus_knight_guard_damage_taken = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local damage_type = params[3]

			if damage_type == "temporary_health_degen" then
				return
			end

			local knight_unit = buff.attacker_unit
			local breed = AiUtils.unit_breed(knight_unit)
			local fatigue_type = {
				harder = "blocked_attack",
				hard = "blocked_attack",
				normal = "blocked_attack",
				hardest = "blocked_attack",
				cataclysm = "blocked_attack",
				cataclysm_3 = "blocked_attack",
				cataclysm_2 = "blocked_attack",
				easy = "blocked_attack"
			}

			if breed and breed.name == "hero_es_knight" and not DamageUtils.check_block(player_unit, knight_unit, fatigue_type, "front") then
				DamageUtils.add_damage_network(knight_unit, knight_unit, damage_amount, "full", "forced", nil, Vector3(1, 0, 0), "buff")
			end
		end
	end,
	markus_knight_reduce_cooldown_on_stagger = function (player, buff, params)
		local buff_template = buff.template
		local player_unit = player.player_unit
		local hit_unit = params[1]
		local breed = Unit.get_data(hit_unit, "breed")
		local enemy_type_list = buff_template.enemy_type or nil
		local add_buff = false

		if breed and enemy_type_list then
			for i = 1, #enemy_type_list, 1 do
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
			local side = Managers.state.side.side_by_unit[player_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_targets = #player_and_bot_units
			local range = 40
			local buff_template = buff.template
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local unit_object_id = network_manager:unit_game_object_id(player_unit)
			local owner_position = POSITION_LOOKUP[player_unit]
			local range_squared = range * range

			for i = 1, num_targets, 1 do
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
	gain_kerillian_maidenguard_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("kerillian_maidenguard_uninterruptible_on_block_broken_buff")
		end
	end,
	victor_bountyhunter_activate_passive_on_melee_kill = function (player, buff, params)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
			return
		end

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
		local cooldown_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_crit_cooldown")
		local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

		if talent_extension:has_talent("victor_bountyhunter_passive_reduced_cooldown", "witch_hunter", true) then
			cooldown_buff = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_reduced_cooldown")
		end

		if cooldown_buff then
			cooldown_buff.duration = 0
		end
	end,
	on_kill_add_remove = function (player, buff, params)
		local player_unit = player.player_unit

		if not Unit.alive(player_unit) then
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
				if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
					return
				end
			elseif required_weapon_type == "ranged" and (not attack_type or (attack_type ~= "instant_projectile" and attack_type ~= "projectile")) then
				return
			end

			if slot_type ~= required_weapon_type then
				return
			end
		end

		local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if buff_extension then
			local requirements = buff_data.requirements

			if requirements then
				local buffs_exist = requirements.buffs_exist

				if buffs_exist then
					for i = 1, #buffs_exist, 1 do
						if not buff_extension:has_buff_type(buffs_exist[i]) then
							return
						end
					end
				end

				local buffs_not_exist = requirements.buffs_not_exist

				if buffs_not_exist then
					for i = 1, #buffs_not_exist, 1 do
						if buff_extension:has_buff_type(buffs_not_exist[i]) then
							return
						end
					end
				end
			end

			local buffs_to_add = buff_data.buffs_to_add

			if buffs_to_add then
				for i = 1, #buffs_to_add, 1 do
					buff_extension:add_buff(buffs_to_add[i])
				end
			end

			local buffs_to_remove = buff_data.buffs_to_remove

			if buffs_to_remove then
				for i = 1, #buffs_to_remove, 1 do
					local buff = buff_extension:get_non_stacking_buff(buffs_to_remove[i])

					if buff then
						buff_extension:remove_buff(buff.id)
					end
				end
			end
		end
	end,
	apply_ranged_damage_debuff = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if Unit.alive(player_unit) and Unit.alive(hit_unit) then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

			if buff_extension then
				local buff_name = "ranged_damage_debuff"
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local hit_object_id = network_manager:unit_game_object_id(hit_unit)

				if is_server() then
					buff_extension:add_buff(buff_name, {
						attacker_unit = player_unit
					})
					network_transmit:send_rpc_clients("rpc_add_buff", hit_object_id, buff_template_name_id, unit_object_id, 0, false)
				else
					network_transmit:send_rpc_server("rpc_add_buff", hit_object_id, buff_template_name_id, unit_object_id, 0, true)
				end
			end
		end
	end,
	event_hud_sfx = function (player, buff, params)
		local player_unit = player.player_unit
		local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

		if first_person_extension then
			local sound_to_play = buff.template.sound_to_play

			first_person_extension:play_hud_sound_event(sound_to_play, nil, false)
		end
	end,
	dummy_function = function (player, buff, params)
		return true
	end
}
MaxStackFunctions = {
	add_remove_buffs = function (unit, sub_buff_template, new_buff_params)
		if ALIVE[unit] then
			local max_stack_data = sub_buff_template.max_stack_data

			if max_stack_data then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local buffs_to_add = max_stack_data.buffs_to_add

				if buffs_to_add then
					for i = 1, #buffs_to_add, 1 do
						buff_extension:add_buff(buffs_to_add[i])
					end
				end

				local talent_buffs_to_add = max_stack_data.talent_buffs_to_add

				if talent_buffs_to_add then
					local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

					if talent_extension then
						for name, data in pairs(talent_buffs_to_add) do
							if talent_extension:has_talent(name) then
								local buff_to_add = data.buff_to_add

								if data.rpc_sync then
									local buff_system = Managers.state.entity:system("buff_system")

									buff_system:add_buff(unit, buff_to_add, unit, false)
								else
									buff_extension:add_buff(buff_to_add)
								end
							end
						end
					end
				end

				local buffs_to_remove = max_stack_data.buffs_to_remove

				if buffs_to_remove then
					for i = 1, #buffs_to_remove, 1 do
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
	reapply_buff = function (unit, sub_buff_template, new_buff_params)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_stacks = buff_extension:get_stacking_buff(sub_buff_template.name)
			local oldest_buff = buff_stacks[1]

			if oldest_buff then
				buff_extension:remove_buff(oldest_buff.id)
			end
		end

		return true
	end,
	reapply_infinite_burn = function (unit, sub_buff_template, new_buff_params)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local burn_buffs = buff_extension:get_stacking_buff(sub_buff_template.name)
			local oldest_buff = burn_buffs and burn_buffs[1]

			if oldest_buff then
				if not Unit.alive(oldest_buff.source_attacker_unit or oldest_buff.attacker_unit) then
					buff_extension:remove_buff(oldest_buff.id)

					return true

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
				end

				return false
			end
		end

		return true
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
InfiniteBurnDotLookup = {
	burning_3W_dot = "burning_3W_dot_infinite",
	burning_dot = "burning_dot_infinite",
	burning_1W_dot = "burning_1W_dot_infinite",
	burning_flamethrower_dot = "burning_flamethrower_dot_infinite",
	beam_burning_dot = "beam_burning_dot_infinite"
}
BuffTemplates = {
	end_zone_invincibility = {
		buffs = {
			{
				refresh_durations = true,
				name = "end_zone_invincibility",
				duration = 1,
				max_stacks = 1,
				perk = buff_perks.invulnerable
			}
		}
	},
	twitch_damage_boost = {
		buffs = {
			{
				duration = 60,
				name = "twitch_armor_penetration_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01",
				perk = buff_perks.potion_armor_penetration
			}
		}
	},
	twitch_speed_boost = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "twitch_movement_buff",
				icon = "potion_buff_02",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 60,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				multiplier = 0.5,
				name = "twitch_attack_speed_buff",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 1,
				duration = 60
			}
		}
	},
	twitch_cooldown_reduction_boost = {
		buffs = {
			{
				name = "twitch_cooldown_reduction_buff",
				multiplier = 5,
				stat_buff = "cooldown_regen",
				duration = 60,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true
			}
		}
	},
	twitch_no_overcharge_no_ammo_reloads = {
		buffs = {
			{
				max_stacks = 1,
				icon = "victor_bountyhunter_passive_infinite_ammo",
				duration = 60,
				name = "twitch_no_overcharge_no_ammo_reloads"
			}
		}
	},
	twitch_health_regen = {
		buffs = {
			{
				update_func = "health_regen_all_update",
				heal_type = "health_regen",
				name = "twitch_health_regen",
				icon = "bardin_ranger_activated_ability_heal",
				time_between_heal = 2,
				max_stacks = 1,
				apply_buff_func = "health_regen_all_start",
				heal = 1,
				duration = 60
			}
		}
	},
	twitch_health_degen = {
		buffs = {
			{
				duration = 60,
				name = "twitch_health_degen",
				damage = 1,
				icon = "bardin_slayer_crit_chance",
				apply_buff_func = "health_degen_start",
				time_between_damage = 3,
				damage_type = "health_degen",
				max_stacks = 1,
				update_func = "health_degen_update"
			}
		}
	},
	twitch_grimoire_health_debuff = {
		buffs = {
			{
				duration = 60,
				name = "twitch_grimoire_health_debuff",
				debuff = true,
				max_stacks = 1,
				icon = "buff_icon_grimoire_health_debuff",
				perk = buff_perks.twitch_grimoire
			}
		}
	},
	twitch_power_boost_dismember = {
		buffs = {
			{
				name = "twitch_power_boost_dismember",
				multiplier = 0.25,
				stat_buff = "power_level",
				duration = 60,
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability",
				perk = buff_perks.bloody_mess
			}
		}
	},
	heavy_attack_shield_break = {
		buffs = {
			{
				name = "heavy_attack_shield_break",
				perk = buff_perks.shield_break
			}
		}
	},
	temporary_health_degen = {
		buffs = {
			{
				name = "temporary health degen",
				damage = 10,
				damage_type = "temporary_health_degen",
				max_stacks = 1,
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
				max_stacks = 1,
				update_func = "knock_down_bleed_update",
				apply_buff_func = "knock_down_bleed_start",
				time_between_damage = 3
			}
		}
	},
	blightreaper_curse = {
		buffs = {
			{
				max_stacks = 1,
				name = "blightreaper_curse",
				apply_buff_func = "convert_permanent_to_temporary_health",
				perk = buff_perks.disable_permanent_heal
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
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01",
				perk = buff_perks.potion_armor_penetration
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
				name = "potion_movement_buff",
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
				name = "potion_attack_speed_buff",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 1,
				duration = 10
			}
		}
	},
	cooldown_reduction_potion = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "potion_cooldown_reduction_buff",
				multiplier = 10,
				stat_buff = "cooldown_regen",
				duration = 10,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true
			}
		}
	},
	invulnerability_potion = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				duration = 10,
				name = "invulnerability_potion",
				max_stacks = 1,
				refresh_durations = true,
				perk = buff_perks.invulnerable
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
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01",
				perk = buff_perks.potion_armor_penetration
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
				name = "potion_movement_buff",
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
				name = "potion_attack_speed_buff",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 1,
				duration = 15
			}
		}
	},
	cooldown_reduction_potion_increased = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "potion_cooldown_reduction_buff",
				multiplier = 15,
				stat_buff = "cooldown_regen",
				duration = 15,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true
			}
		}
	},
	invulnerability_potion_increased = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				duration = 15,
				name = "invulnerability_potion_increased",
				max_stacks = 1,
				refresh_durations = true,
				perk = buff_perks.invulnerable
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
				name = "potion_armor_penetration_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01",
				perk = buff_perks.potion_armor_penetration
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
				name = "potion_movement_buff",
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
				name = "potion_attack_speed_buff",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 1,
				duration = 5
			}
		}
	},
	cooldown_reduction_potion_reduced = {
		activation_effect = "fx/screenspace_potion_02",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_ninjafencer_activate",
		buffs = {
			{
				name = "potion_cooldown_reduction_buff",
				multiplier = 10,
				stat_buff = "cooldown_regen",
				duration = 5,
				max_stacks = 1,
				icon = "potion_buff_03",
				refresh_durations = true
			}
		}
	},
	invulnerability_potion_reduced = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				duration = 5,
				name = "invulnerability_potion_reduced",
				max_stacks = 1,
				refresh_durations = true,
				perk = buff_perks.invulnerable
			}
		}
	},
	grimoire_health_debuff = {
		activation_sound = "hud_info_state_grimoire_pickup",
		buffs = {
			{
				name = "grimoire_health_debuff",
				icon = "buff_icon_grimoire_health_debuff",
				debuff = true,
				perk = buff_perks.skaven_grimoire
			}
		}
	},
	overcharged = {
		buffs = {
			{
				multiplier = -0.15,
				name = "attack speed buff",
				stat_buff = "attack_speed"
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
				stat_buff = "attack_speed"
			}
		}
	},
	overcharged_critical_no_attack_penalty = {
		buffs = {}
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
				lerp_time = 0.2,
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
				lerp_time = 0.2,
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
				update_start_delay = 0.6,
				time_between_dot_damages = 0.6,
				damage_profile = "poison_direct",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage",
				perk = buff_perks.poisoned
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
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_profile = "poison",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage",
				perk = buff_perks.poisoned
			}
		}
	},
	weapon_bleed_dot_dagger = {
		buffs = {
			{
				duration = 2,
				name = "weapon bleed dot dagger",
				max_stacks = 1,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				hit_zone = "neck",
				damage_profile = "bleed",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	weapon_bleed_dot_whc = {
		buffs = {
			{
				duration = 2,
				name = "weapon bleed dot whc",
				max_stacks = 3,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				hit_zone = "neck",
				damage_profile = "bleed",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	weapon_bleed_dot_maidenguard = {
		buffs = {
			{
				duration = 4,
				name = "weapon bleed dot maidenguard",
				max_stacks = 1,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.25,
				time_between_dot_damages = 0.25,
				hit_zone = "neck",
				damage_profile = "bleed_maidenguard",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	bardin_survival_ale_buff = {
		buffs = {
			{
				name = "ale_defence",
				multiplier = -0.04,
				stat_buff = "damage_taken",
				duration = 300,
				max_stacks = 3,
				icon = "buff_icon_mutator_icon_drunk",
				refresh_durations = true
			},
			{
				multiplier = 0.03,
				name = "ale_attack_speed",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 3,
				duration = 300
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
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				perk = buff_perks.poisoned
			},
			{
				multiplier = 0.5,
				name = "kerillian_shade_ability_debuff",
				stat_buff = "damage_taken",
				refresh_durations = true,
				max_stacks = 1,
				duration = 10
			}
		}
	},
	burning_dot = {
		buffs = {
			{
				duration = 3,
				name = "burning_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	beam_burning_dot = {
		buffs = {
			{
				duration = 3,
				name = "beam_burning_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "beam_burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	beam_burning_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "beam_burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_flamethrower_dot = {
		buffs = {
			{
				duration = 1.5,
				name = "burning_flamethrower_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.65,
				time_between_dot_damages = 0.65,
				refresh_durations = true,
				damage_type = "burninating",
				damage_profile = "flamethrower_burning_dot",
				update_func = "apply_dot_damage",
				max_stacks = 1,
				perk = buff_perks.burning
			}
		}
	},
	burning_flamethrower_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.65,
				time_between_dot_damages = 0.65,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "flamethrower_burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	sienna_adept_ability_trail = {
		buffs = {
			{
				leave_linger_time = 1.5,
				name = "sienna_adept_ability_trail",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				on_max_stacks_overflow_func = "reapply_buff",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.25,
				death_flow_event = "burn_death",
				time_between_dot_damages = 0.25,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				max_stacks = 1,
				perk = buff_perks.burning
			}
		}
	},
	burning_dot_fire_grenade = {
		buffs = {
			{
				duration = 6,
				name = "burning_dot_fire_grenade",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				refresh_durations = true,
				damage_type = "burninating",
				damage_profile = "burning_dot_firegrenade",
				update_func = "apply_dot_damage",
				max_stacks = 1,
				perk = buff_perks.burning
			}
		}
	},
	burning_1W_dot = {
		buffs = {
			{
				duration = 2,
				name = "burning_1W_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1.5,
				time_between_dot_damages = 1.5,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_1W_dot_unchained_push = {
		buffs = {
			{
				duration = 6,
				name = "burning_1W_dot_unchained_push",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 2,
				time_between_dot_damages = 2,
				refresh_durations = true,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				max_stacks = 1,
				perk = buff_perks.burning
			}
		}
	},
	burning_1W_dot_unchained_pulse = {
		buffs = {
			{
				duration = 2,
				name = "burning_1W_dot_unchained_pulse",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 2,
				time_between_dot_damages = 2,
				refresh_durations = true,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				max_stacks = 1,
				perk = buff_perks.burning
			}
		}
	},
	burning_1W_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1.5,
				time_between_dot_damages = 1.5,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_3W_dot = {
		buffs = {
			{
				duration = 3,
				name = "burning_3W_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_3W_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
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
	catacombs_corpse_pit = {
		buffs = {
			{
				slowdown_buff_name = "corpse_pit_slowdown",
				name = "catacombs_corpse_pit",
				update_func = "update_catacombs_corpse_pit",
				apply_buff_func = "apply_catacombs_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_catacombs_corpse_pit",
				fatigue_type = "vomit_ground",
				time_between_ticks = 2,
				debuff = true,
				max_stacks = 1,
				icon = "convocation_debuff"
			}
		}
	},
	cemetery_plague_floor = {
		buffs = {
			{
				slowdown_buff_name = "cemetery_floor_plague_slowdown",
				name = "plague_floor",
				debuff = true,
				update_func = "update_moving_through_plague",
				fatigue_type = "plague_ground",
				remove_buff_func = "remove_moving_through_plague",
				apply_buff_func = "apply_moving_through_plague",
				refresh_durations = true,
				time_between_dot_damages = 0.75,
				damage_type = "plague_ground",
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						1,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1
					},
					cataclysm_3 = {
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
	movement_volume_generic_slowdown = {
		buffs = {
			{
				remove_buff_func = "remove_volume_movement_buff",
				name = "movement_volume_generic_slowdown",
				apply_buff_func = "apply_volume_movement_buff"
			}
		}
	},
	regrowth = {
		buffs = {
			{
				name = "regrowth",
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				bonus = 2,
				perk = buff_perks.ninja_healing
			}
		}
	},
	bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				multiplier = 0.2,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = buff_perks.smiter_healing
			}
		}
	},
	vanguard = {
		buffs = {
			{
				name = "vanguard",
				multiplier = 0.25,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = buff_perks.tank_healing
			}
		}
	},
	reaper = {
		buffs = {
			{
				max_targets = 5,
				name = "reaper",
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				bonus = 0.75,
				perk = buff_perks.linesman_healing
			}
		}
	},
	conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	dummy_stagger = {
		buffs = {
			{
				refresh_durations = true,
				name = "dummy_stagger",
				stat_buff = "dummy_stagger",
				max_stacks = 2,
				duration = 1,
				bonus = 1
			}
		}
	},
	linesman_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.6,
				name = "linesman_unbalance",
				max_stacks = 1,
				display_multiplier = 0.4,
				perk = buff_perks.linesman_stagger_damage
			}
		}
	},
	smiter_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "smiter_unbalance",
				display_multiplier = 0.2,
				perk = buff_perks.smiter_stagger_damage
			}
		}
	},
	finesse_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "finesse_unbalance",
				display_multiplier = 0.2,
				perk = buff_perks.finesse_stagger_damage
			}
		}
	},
	tank_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "tank_unbalance",
				buff_func = "unbalance_debuff_on_stagger",
				event = "on_stagger",
				display_multiplier = 0.2
			}
		}
	},
	tank_unbalance_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "tank_unbalance_buff",
				stat_buff = "unbalanced_damage_taken",
				max_stacks = 1,
				duration = 2,
				bonus = 0.1
			}
		}
	},
	power_level_unbalance = {
		buffs = {
			{
				max_stacks = 1,
				name = "power_level_unbalance",
				stat_buff = "power_level",
				multiplier = 0.075
			}
		}
	},
	defence_debuff_enemies = {
		buffs = {
			{
				name = "defence_debuff_enemies",
				multiplier = 0.2,
				stat_buff = "damage_taken",
				refresh_durations = true,
				max_stacks = 1,
				duration = 15
			}
		}
	},
	attack_speed_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "attack_speed_from_proc",
				stat_buff = "attack_speed",
				refresh_durations = true
			}
		}
	},
	fatigue_regen_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "fatigue_regen_from_proc",
				stat_buff = "fatigue_regen",
				refresh_durations = true
			}
		}
	},
	increased_melee_damage_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "increased_melee_damage_from_proc",
				stat_buff = "increased_weapon_damage_melee",
				refresh_durations = true
			}
		}
	},
	damage_taken_from_proc = {
		buffs = {
			{
				max_stacks = 1,
				name = "damage_taken_from_proc",
				stat_buff = "damage_taken",
				refresh_durations = true
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
				apply_buff_func = "start_dot_damage",
				update_start_delay = 10
			}
		}
	},
	damage_taken_powerful_elites = {
		buffs = {
			{
				multiplier = 1,
				name = "damage_taken_from_powerful_elites",
				stat_buff = "damage_taken_elites"
			}
		}
	},
	mutator_life_damage_on_hit = {
		buffs = {
			{
				event = "on_hit",
				name = "mutator_life_damage_on_hit",
				bonus = 1,
				buff_func = "damage_attacker"
			}
		}
	},
	mutator_life_health_regeneration = {
		buffs = {
			{
				name = "mutator_life_health_regeneration",
				buff_func = "life_mutator_remove_regen",
				event = "on_damage_taken",
				update_func = "mutator_life_health_regeneration_update",
				apply_buff_func = "mutator_life_health_regeneration_start"
			}
		}
	},
	mutator_life_health_regeneration_stacks = {
		buffs = {
			{
				heal = 1,
				name = "mutator_life_health_regeneration_stacks",
				heal_type = "health_regen",
				time_between_heal = 1,
				update_func = "health_regen_update",
				apply_buff_func = "health_regen_start"
			}
		}
	},
	mutator_life_thorns_poison = {
		buffs = {
			{
				slowdown_buff_name = "cemetery_floor_plague_slowdown",
				name = "mutator_life_thorns_poison",
				refresh_durations = true,
				remove_buff_func = "remove_mutator_life_thorns_poison",
				apply_buff_func = "apply_mutator_life_thorns_poison",
				time_between_dot_damages = 0.01,
				debuff = true,
				max_stacks = 1,
				update_func = "update_mutator_life_thorns_poison",
				difficulty_damage = {
					harder = 6,
					hard = 4,
					normal = 2,
					hardest = 8,
					cataclysm = 12,
					cataclysm_3 = 20,
					cataclysm_2 = 16,
					easy = 2
				}
			}
		}
	},
	mutator_fire_mutator_bomb = {
		buffs = {
			{
				update_func = "update_fire_mutator_bomb",
				name = "mutator_fire_mutator_bomb",
				icon = "buff_icon_mutator_ticking_bomb",
				max_stacks = 1,
				remove_buff_func = "remove_fire_mutator_bomb",
				apply_buff_func = "apply_fire_mutator_bomb"
			}
		}
	},
	mutator_fire_player_dot = {
		buffs = {
			{
				sound_event = "Play_winds_fire_gameplay_fire_damage_player",
				name = "mutator_fire_player_dot",
				update_func = "apply_dot_damage",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				damage_profile = "mutator_player_dot",
				icon = "buff_icon_mutator_ticking_bomb"
			}
		}
	},
	mutator_fire_enemy_dot = {
		activation_sound = "Play_enemy_on_fire_loop",
		buffs = {
			{
				start_flow_event = "burn",
				name = "mutator_fire_enemy_dot",
				end_flow_event = "smoke",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				damage_profile = "mutator_player_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	mutator_metal_blade_dance = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_01",
				name = "mutator_metal_blade_dance",
				remove_buff_func = "remove_blade_dance",
				duration = 16,
				icon = "teammate_consumable_icon_defence",
				refresh_durations = true,
				apply_buff_func = "start_blade_dance",
				max_stacks = 1,
				update_func = "update_blade_dance"
			}
		}
	},
	mutator_light_debuff = {
		buffs = {
			{
				name = "mutator_light_debuff",
				icon = "buff_icon_mutator_icon_slayer_curse",
				debuff = true,
				perk = buff_perks.mutator_curse
			},
			{
				multiplier = 0.015,
				name = "death_attack_speed_buff",
				stat_buff = "attack_speed"
			}
		}
	},
	mutator_light_cleansing_curse_buff = {
		buffs = {
			{
				screenspace_effect_name = "fx/screenspace_light_beacon_01",
				name = "mutator_light_cleansing_curse_buff",
				refresh_durations = true,
				duration = 1,
				apply_buff_func = "apply_screenspace_effect"
			}
		}
	},
	mutator_beasts_totem_buff = {
		buffs = {
			{
				wind_mutator = true,
				name = "mutator_beasts_totem_buff",
				stat_buff = "damage_taken",
				refresh_durations = true,
				remove_buff_func = "remove_beasts_totem_buff",
				apply_buff_func = "apply_beasts_totem_buff",
				max_stacks = 1,
				icon = "buff_icon_mutator_ticking_bomb",
				reapply_buff_func = "apply_beasts_totem_buff"
			}
		}
	},
	metal_mutator_gromril_armour = {
		buffs = {
			{
				max_stacks = 10,
				name = "metal_mutator_gromril_armour",
				remove_buff_func = "remove_metal_mutator_gromril_armour",
				icon = "teammate_consumable_icon_defence"
			}
		}
	},
	metal_mutator_damage_boost = {
		activation_effect = "fx/screenspace_potion_01",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_smiter_activate",
		buffs = {
			{
				icon = "icon_wpn_emp_mace_04_t3",
				name = "armor penetration",
				stat_buff = "increased_weapon_damage",
				refresh_durations = true,
				max_stacks = 1,
				duration = 8,
				perk = buff_perks.potion_armor_penetration
			},
			{
				multiplier = 0.5,
				name = "metal_mutator_unbalanced_damage_dealt",
				stat_buff = "unbalanced_damage_dealt",
				max_stacks = 1,
				duration = 8
			}
		}
	},
	mutator_death_attack_speed_player_buff = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_03",
				multiplier = 0.25,
				stat_buff = "attack_speed",
				name = "death_attack_speed_buff",
				icon = "buff_icon_mutator_icon_slayer_curse"
			},
			{
				name = "increased_damage",
				multiplier = 0.25,
				stat_buff = "increased_weapon_damage",
				max_stacks = 1,
				icon = "icon_bw_1h_crowbill_01"
			}
		}
	},
	mutator_shadow_damage_reduction = {
		buffs = {
			{
				wind_mutator = true,
				name = "mutator_shadow_damage_reduction",
				stat_buff = "damage_taken"
			}
		}
	},
	mutator_metal_killing_blow = {
		buffs = {
			{
				num_stacks = 15,
				name = "mutator_metal_killing_blow",
				buff_func = "metal_mutator_stacks_on_hit",
				event = "on_hit",
				bonus = 100,
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
					"chaos_vortex_sorcerer"
				}
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
				stat_buff = "activated_cooldown"
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
				stat_buff = "not_consume_medpack"
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
				stat_buff = "not_consume_medpack"
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
				stat_buff = "not_consume_medpack"
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
				stat_buff = "not_consume_potion"
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
				stat_buff = "not_consume_potion"
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
				stat_buff = "not_consume_potion"
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
				stat_buff = "not_consume_grenade"
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
				stat_buff = "not_consume_grenade"
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
				stat_buff = "not_consume_grenade"
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
				stat_buff = "protection_poison_wind"
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
				stat_buff = "protection_poison_wind"
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
				stat_buff = "protection_poison_wind"
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
				stat_buff = "protection_gutter_runner"
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
				stat_buff = "protection_gutter_runner"
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
				stat_buff = "protection_gutter_runner"
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
				stat_buff = "protection_ratling_gunner"
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
				stat_buff = "protection_ratling_gunner"
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
				stat_buff = "protection_ratling_gunner"
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
				stat_buff = "protection_pack_master"
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
				stat_buff = "protection_pack_master"
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
				stat_buff = "protection_pack_master"
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
				stat_buff = "faster_revive"
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
				stat_buff = "faster_revive"
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
				stat_buff = "faster_revive"
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
				stat_buff = "faster_revive"
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
				stat_buff = "increase_luck"
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
				stat_buff = "increase_luck"
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
				stat_buff = "increase_luck"
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
				stat_buff = "increase_luck"
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
				stat_buff = "damage_taken_kd"
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
				stat_buff = "damage_taken_kd"
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
				stat_buff = "damage_taken_kd"
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
				stat_buff = "curse_protection"
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
				stat_buff = "grenade_radius"
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
				stat_buff = "grenade_radius"
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
				stat_buff = "grenade_radius"
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
				stat_buff = "faster_respawn"
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
				stat_buff = "faster_respawn"
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
				stat_buff = "not_consume_pickup"
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
				stat_buff = "not_consume_pickup"
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
				stat_buff = "not_consume_pickup"
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
				stat_buff = "increase_luck"
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
					harder = {
						1,
						1,
						0,
						8.5,
						1
					},
					hardest = {
						1,
						1,
						0,
						9.5,
						1
					},
					cataclysm = {
						1,
						1,
						0,
						7,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						8,
						1
					},
					cataclysm_3 = {
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
				debuff = true,
				update_func = "update_warpfirethrower_in_face",
				fatigue_type = "warpfire_ground",
				remove_buff_func = "remove_warpfirethrower_in_face",
				apply_buff_func = "apply_warpfirethrower_in_face",
				push_speed = 15,
				duration = 0.3,
				time_between_dot_damages = 0.75,
				damage_type = "warpfire_ground",
				max_stacks = 1,
				icon = "troll_vomit_debuff",
				difficulty_damage = {
					easy = {
						3,
						1,
						0,
						6.5,
						1
					},
					normal = {
						3,
						1,
						0,
						6.5,
						2
					},
					hard = {
						4,
						2,
						0,
						7.5,
						2
					},
					harder = {
						5,
						3,
						0,
						8.5,
						4
					},
					hardest = {
						7.5,
						4,
						0,
						9.5,
						5
					},
					cataclysm = {
						4,
						2,
						0,
						7,
						3
					},
					cataclysm_2 = {
						5,
						3,
						0,
						8,
						3
					},
					cataclysm_3 = {
						7.5,
						4,
						0,
						9,
						4
					}
				}
			}
		}
	},
	warpfire_thrower_face_base_mutator = {
		buffs = {
			{
				slowdown_buff_name = "warpfire_thrower_fire_slowdown",
				name = "warpfire_thrower_base",
				debuff = true,
				update_func = "update_warpfirethrower_in_face",
				fatigue_type = "warpfire_ground",
				remove_buff_func = "remove_warpfirethrower_in_face",
				apply_buff_func = "apply_warpfirethrower_in_face",
				push_speed = 30,
				duration = 0.3,
				time_between_dot_damages = 0.75,
				damage_type = "warpfire_ground",
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
						10,
						1,
						0,
						6.5,
						1
					},
					hard = {
						12,
						2,
						0,
						7.5,
						2
					},
					harder = {
						15,
						3,
						0,
						8.5,
						3
					},
					hardest = {
						20,
						4,
						0,
						9.5,
						4
					},
					cataclysm = {
						12,
						2,
						0,
						7,
						2
					},
					cataclysm_2 = {
						15,
						3,
						0,
						8,
						3
					},
					cataclysm_3 = {
						20,
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
				fatigue_type = "vomit_ground",
				name = "troll_bile_ground",
				icon = "troll_vomit_debuff",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_vomit",
				apply_buff_func = "apply_moving_through_vomit",
				time_between_dot_damages = 0.75,
				damage_type = "vomit_ground",
				max_stacks = 1,
				update_func = "update_moving_through_vomit",
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						1,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1
					},
					cataclysm_3 = {
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
				debuff = true,
				update_func = "update_moving_through_vomit",
				fatigue_type = "vomit_ground",
				remove_buff_func = "remove_moving_through_vomit",
				apply_buff_func = "apply_moving_through_vomit",
				refresh_durations = true,
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						4,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						4,
						1
					},
					cataclysm_3 = {
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
	corpse_pit_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_crouch_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_walk_speed_corpse_pit",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_corpse_pit",
				multiplier = 0.5,
				duration = 2,
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
				name = "decrease_dodge_speed_corpse_pit",
				multiplier = 0.6,
				duration = 2,
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
				name = "decrease_dodge_distance_corpse_pit",
				multiplier = 0.6,
				duration = 2,
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
	mutator_life_poison = {
		buffs = {
			{
				max_stacks = 1,
				name = "mutator_life_poison",
				apply_buff_func = "apply_mutator_life_poison_buff",
				refresh_durations = true
			},
			{
				name = "decrease_speed_mutator_life_poison",
				multiplier = 0.5,
				lerp_time = 0.1,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_crouch_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				multiplier = 0.5,
				name = "decrease_walk_speed_mutator_life_poison",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_mutator_life_poison",
				multiplier = 0.5,
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				}
			},
			{
				name = "decrease_dodge_speed_mutator_life_poison",
				multiplier = 0.6,
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				name = "decrease_dodge_distance_mutator_life_poison",
				multiplier = 0.6,
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	cemetery_floor_plague_slowdown = {
		buffs = {
			{
				update_func = "update_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_crouch_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				}
			},
			{
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = 0.75,
				name = "decrease_walk_speed_cemetery_floor",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				duration = 2,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				}
			},
			{
				name = "decrease_jump_speed_cemetery_floor",
				multiplier = 0.75,
				duration = 2,
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
				name = "decrease_dodge_speed_cemetery_floor",
				multiplier = 0.8,
				duration = 2,
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
				name = "decrease_dodge_distance_cemetery_floor",
				multiplier = 0.8,
				duration = 2,
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
				icon = "troll_vomit_debuff",
				apply_buff_func = "apply_plague_wave_in_face",
				remove_buff_func = "remove_plague_wave_in_face",
				fatigue_type = "vomit_face",
				duration = 2,
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "plague_face",
				max_stacks = 1,
				update_func = "update_vomit_in_face",
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
					harder = {
						1,
						1,
						0,
						4,
						1
					},
					hardest = {
						1,
						1,
						0,
						6,
						1
					},
					cataclysm = {
						1,
						1,
						0,
						6,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						8,
						1
					},
					cataclysm_3 = {
						1,
						1,
						0,
						10,
						1
					}
				}
			},
			{
				name = "decrease_jump_speed",
				multiplier = 0.7,
				duration = 2,
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
				duration = 2,
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
				duration = 2,
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
				fatigue_type = "vomit_face",
				name = "plague_wave_face",
				icon = "troll_vomit_debuff",
				duration = 3.5,
				remove_buff_func = "remove_vermintide_in_face",
				apply_buff_func = "apply_vermintide_in_face",
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "plague_face",
				max_stacks = 1,
				update_func = "update_vermintide_in_face",
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						1,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1
					},
					cataclysm_3 = {
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
				debuff = true,
				update_func = "update_vomit_in_face",
				fatigue_type = "vomit_face",
				remove_buff_func = "remove_vomit_in_face",
				apply_buff_func = "apply_vomit_in_face",
				duration = 5,
				time_between_dot_damages = 0.65,
				refresh_durations = true,
				damage_type = "vomit_face",
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						4,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						4,
						1
					},
					cataclysm_3 = {
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
				icon = "troll_vomit_debuff",
				apply_buff_func = "apply_vortex",
				duration = 2,
				remove_buff_func = "remove_vortex",
				fatigue_type = "vomit_face",
				refresh_durations = true,
				time_between_dot_damages = 0.65,
				damage_type = "vomit_face",
				max_stacks = 1,
				update_func = "update_vortex",
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
					harder = {
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
						16,
						1
					},
					cataclysm = {
						1,
						1,
						0,
						16,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						16,
						1
					},
					cataclysm_3 = {
						1,
						1,
						0,
						16,
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
	career_passive_vs_ratling_gunner = {
		buffs = {
			{
				event = "on_ranged_hit",
				icon = "troll_vomit_debuff",
				name = "career_passive_vs_ratling_gunner",
				buff_func = "apply_ranged_damage_debuff"
			}
		}
	},
	ranged_damage_debuff = {
		buffs = {
			{
				icon = "bardin_ranger_not_used_3",
				multiplier = -0.5,
				stat_buff = "increased_weapon_damage_ranged",
				name = "ranged_damage_debuff",
				refresh_durations = true,
				priority_buff = true,
				debuff = true,
				max_stacks = 1,
				duration = 3
			}
		}
	},
	career_passive_vs_gutter_runner_unmount = {
		buffs = {
			{
				name = "career_passive_vs_gutter_runner_unmount"
			}
		}
	},
	stormfiend_warpfire_ground_base = {
		buffs = {
			{
				slowdown_buff_name = "bile_troll_vomit_ground_slowdown",
				name = "stormfiend_warpfire_ground",
				refresh_durations = true,
				remove_buff_func = "remove_moving_through_warpfire",
				apply_buff_func = "apply_moving_through_warpfire",
				time_between_dot_damages = 0.5,
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
						2,
						2,
						0,
						2.5,
						3
					},
					hard = {
						4,
						3,
						0,
						2.5,
						4
					},
					harder = {
						6,
						5,
						0,
						4.5,
						5
					},
					hardest = {
						8,
						8,
						0,
						8.5,
						6
					},
					cataclysm = {
						4,
						3,
						0,
						8.5,
						4
					},
					cataclysm_2 = {
						6,
						5,
						0,
						8.5,
						5
					},
					cataclysm_3 = {
						8,
						8,
						0,
						8.5,
						6
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
				duration = 3,
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
						1.5,
						2
					},
					hard = {
						4,
						2,
						0,
						2,
						2
					},
					harder = {
						5,
						3,
						0,
						3,
						3
					},
					hardest = {
						6,
						4,
						0,
						5,
						4
					},
					cataclysm = {
						4,
						2,
						0,
						5,
						2
					},
					cataclysm_2 = {
						5,
						3,
						0,
						5,
						3
					},
					cataclysm_3 = {
						6,
						4,
						0,
						5,
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
				stat_buff = "damage_taken",
				max_stacks = 1,
				refresh_durations = true
			}
		}
	},
	chaos_zombie_explosion = {
		buffs = {
			{
				refresh_durations = false,
				name = "chaos_zombie_explosion",
				stat_buff = "damage_taken",
				update_func = "update_chaos_zombie_explosion_in_face",
				multiplier = 0.1,
				remove_buff_func = "remove_chaos_zombie_explosion_in_face",
				apply_buff_func = "apply_chaos_zombie_explosion_in_face",
				fatigue_type = "vomit_face",
				damage_type = "vomit_face",
				max_stacks = 5,
				duration = 5
			}
		}
	},
	corpse_explosion_default = {
		buffs = {
			{
				slowdown_buff_name = "bile_troll_vomit_face_slowdown",
				name = "corpse_explosion_default",
				debuff = true,
				update_func = "update_vomit_in_face",
				fatigue_type = "vomit_face",
				remove_buff_func = "remove_vomit_in_face",
				apply_buff_func = "apply_vomit_in_face",
				duration = 2,
				time_between_dot_damages = 0.65,
				refresh_durations = true,
				damage_type = "vomit_face",
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
					harder = {
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
					cataclysm = {
						1,
						1,
						0,
						1,
						1
					},
					cataclysm_2 = {
						1,
						1,
						0,
						2,
						1
					},
					cataclysm_3 = {
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
				duration = 2,
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
				duration = 2,
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
				duration = 2,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	ring_attackspeed_0001_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.03,
				stat_buff = "attack_speed",
				apply_on = "equip",
				name = "ring_attackspeed_0001_buff"
			}
		}
	},
	ring_attackspeed_0002_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.05,
				stat_buff = "attack_speed",
				apply_on = "equip",
				name = "ring_attackspeed_0002_buff"
			}
		}
	},
	ring_attackspeed_0003_buff = {
		buffs = {
			{
				description = "Attack Speed",
				multiplier = 0.07,
				stat_buff = "attack_speed",
				apply_on = "equip",
				name = "ring_attackspeed_0003_buff"
			}
		}
	},
	necklace_stamina_0001_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0001_buff",
				stat_buff = "max_fatigue",
				apply_on = "equip",
				bonus = 1
			}
		}
	},
	necklace_stamina_0002_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0002_buff",
				stat_buff = "max_fatigue",
				apply_on = "equip",
				bonus = 2
			}
		}
	},
	necklace_stamina_0003_buff = {
		buffs = {
			{
				description = "Stamina",
				name = "necklace_stamina_0003_buff",
				stat_buff = "max_fatigue",
				apply_on = "equip",
				bonus = 4
			}
		}
	},
	necklace_health_0001_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.1,
				stat_buff = "max_health",
				apply_on = "equip",
				name = "necklace_health_0001_buff"
			}
		}
	},
	necklace_health_0002_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.15,
				stat_buff = "max_health",
				apply_on = "equip",
				name = "necklace_health_0002_buff"
			}
		}
	},
	necklace_health_0003_buff = {
		buffs = {
			{
				description = "Health",
				multiplier = 0.25,
				stat_buff = "max_health",
				apply_on = "equip",
				name = "necklace_health_0003_buff"
			}
		}
	},
	weapon_trait_uninterruptible = {
		buffs = {
			{
				name = "weapon_trait_uninterruptible",
				perk = buff_perks.uninterruptible
			}
		}
	},
	weapon_trait_riposte = {
		buffs = {
			{
				name = "weapon_trait_riposte",
				perk = buff_perks.uninterruptible
			}
		}
	},
	weapon_trait_backstab = {
		buffs = {
			{
				multiplier = 0.5,
				name = "weapon_trait_backstab",
				stat_buff = "backstab_multiplier"
			}
		}
	},
	weapon_trait_bloodlust = {
		buffs = {
			{
				event = "on_kill",
				name = "weapon_trait_bloodlust",
				bonus = 1,
				buff_func = "heal"
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
				name = "weapon_trait_scavenge_trigger",
				bonus = 1,
				buff_func = "replenish_ammo_on_headshot_ranged"
			},
			{
				multiplier = -0.5,
				name = "weapon_trait_scavenge_buff",
				stat_buff = "total_ammo"
			}
		}
	},
	twitch_mutator_buff_splitting_enemies = {
		buffs = {
			{
				icon = "mutator_icon_splitting_enemies",
				duration = 30,
				name = "twitch_mutator_buff_splitting_enemies",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_leash = {
		buffs = {
			{
				icon = "mutator_icon_leash",
				duration = 30,
				name = "twitch_mutator_buff_leash",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_slayers_curse = {
		buffs = {
			{
				icon = "mutator_icon_slayer_curse",
				duration = 30,
				name = "twitch_mutator_buff_slayers_curse",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_shared_health_pool = {
		buffs = {
			{
				icon = "icon_deed_normal_01",
				duration = 30,
				name = "twitch_mutator_buff_shared_health_pool",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_bloodlust = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability",
				duration = 30,
				name = "twitch_mutator_buff_bloodlust",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_ticking_bomb = {
		buffs = {
			{
				icon = "mutator_icon_ticking_bomb",
				duration = 30,
				name = "twitch_mutator_buff_ticking_bomb",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_lightning_strike = {
		buffs = {
			{
				icon = "mutator_icon_heavens_lightning",
				duration = 33,
				name = "twitch_mutator_buff_lightning_strike",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_chasing_spirits = {
		buffs = {
			{
				icon = "mutator_icon_death_spirits",
				duration = 25,
				name = "twitch_mutator_buff_chasing_spirits",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	twitch_mutator_buff_flames = {
		buffs = {
			{
				icon = "mutator_icon_fire_burn",
				duration = 30,
				name = "twitch_mutator_buff_flames",
				duration_modifier_func = function (buff_template, duration)
					return duration * TwitchSettings.mutator_duration_multiplier
				end
			}
		}
	},
	bloodlust = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability",
				name = "bardin_slayer_frenzy",
				stat_buff = "attack_speed",
				multiplier = 0.15,
				max_stacks = 3,
				duration = 6,
				refresh_durations = true
			},
			{
				remove_buff_func = "remove_movement_buff",
				name = "bardin_slayer_frenzy_movement",
				multiplier = 1.2,
				max_stacks = 3,
				duration = 6,
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bloodlust_debuff = {
		buffs = {
			{
				update_func = "apply_dot_damage",
				name = "bloodlust_debuff",
				time_between_dot_damages = 1,
				icon = "troll_vomit_debuff",
				damage_profile = "bloodlust_debuff",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1
			}
		}
	},
	twitch_vote_buff_root = {
		buffs = {
			{
				icon = "troll_vomit_debuff",
				multiplier = 0.001,
				update_func = "update_action_lerp_movement_buff",
				name = "twitch_vote_buff_root",
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				duration = 10,
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				perk = buff_perks.root
			}
		}
	},
	twitch_vote_buff_fatigue_loss = {
		buffs = {
			{
				multiplier = -1,
				name = "twitch_vote_buff_fatigue_loss",
				stat_buff = "fatigue_regen",
				duration = 15,
				max_stacks = 1,
				refresh_durations = true,
				icon = "troll_vomit_debuff"
			}
		}
	},
	twitch_vote_buff_hemmoraghe = {
		buffs = {
			{
				update_func = "update_speed_scaled_dot_buff",
				name = "twitch_vote_buff_hemmoraghe",
				damage = 3,
				icon = "troll_vomit_debuff",
				remove_buff_func = "remove_speed_scaled_dot_buff",
				apply_buff_func = "apply_speed_scaled_dot_buff",
				damage_frequency = 0.25,
				damage_type = "bleed",
				duration = 15
			}
		}
	},
	twitch_vote_buff_invisibility = {
		buffs = {
			{
				update_func = "update_twitch_invisibility_buff",
				name = "twitch_vote_buff_invisibility",
				duration = 20,
				icon = "kerillian_shade_passive_improved",
				remove_buff_func = "remove_twitch_invisibility_buff",
				apply_buff_func = "apply_twitch_invisibility_buff"
			}
		}
	},
	twitch_vote_buff_critical_strikes = {
		buffs = {
			{
				duration = 20,
				name = "twitch_vote_buff_critical_strikes",
				refresh_durations = true,
				icon = "victor_bountyhunter_passive",
				max_stacks = 1,
				perk = buff_perks.guaranteed_crit
			}
		}
	},
	twitch_vote_buff_infinite_bombs = {
		buffs = {
			{
				update_func = "update_twitch_infinite_bombs",
				name = "twitch_vote_buff_invisibility",
				duration = 10,
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				remove_buff_func = "remove_twitch_infinite_bombs",
				apply_buff_func = "apply_twitch_infinite_bombs"
			}
		}
	},
	twitch_vote_buff_invincibility = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				icon = "victor_zealot_passive_invulnerability",
				name = "twitch_vote_buff_invincibility",
				duration = 10,
				max_stacks = 1,
				remove_buff_func = "remove_twitch_invincibility",
				apply_buff_func = "apply_twitch_invincibility"
			}
		}
	},
	twitch_vote_buff_pulsating_waves = {
		buffs = {
			{
				update_func = "update_twitch_pulsating_waves",
				name = "twitch_vote_buff_pulsating_waves",
				icon = "markus_mercenary_increased_damage_on_enemy_proximity",
				duration = 15,
				apply_buff_func = "apply_twitch_pulsating_waves"
			}
		}
	}
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
DLCUtils.merge("max_stacks_functions", MaxStackFunctions)
DLCUtils.merge("infinite_burn_dot_lookup", InfiniteBurnDotLookup)
DLCUtils.map_list("add_sub_buffs_to_core_buffs", function (data)
	local buffs = BuffTemplates[data.buff_name].buffs
	buffs[#buffs + 1] = data.sub_buff_to_add
end)

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

					fassert(proc_key, "There is no buff value by name: %s on buff: %s", key, buff_name)

					local proc_value = BuffTemplates[proc_key].buffs[1][key]

					fassert(proc_value, "There is no buff value by name: %s on buff %s for proc buff: %s.", key, buff_name, proc_key)

					description_values[i] = proc_value
				end
			end
		end
	end
end

return
