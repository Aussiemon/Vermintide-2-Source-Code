require("scripts/settings/player_unit_damage_settings")
require("scripts/settings/equipment/weapons")

MeleeBuffTypes = {
	MELEE_1H = true,
	MELEE_2H = true
}
RangedBuffTypes = {
	RANGED = true,
	RANGED_ABILITY = true
}
StatBuffApplicationMethods = {
	reduced_spread_shot = "stacking_multiplier",
	reduced_spread = "stacking_multiplier",
	power_level_frenzy = "stacking_multiplier",
	max_health_alive = "stacking_multiplier",
	power_level_unarmoured = "stacking_multiplier",
	power_level_armoured = "stacking_multiplier",
	curse_protection = "stacking_multiplier",
	vent_damage = "stacking_multiplier",
	increased_max_targets = "stacking_bonus",
	damage_taken_kd = "stacking_multiplier",
	increased_weapon_damage_ranged_to_wounded = "stacking_multiplier",
	not_consume_grenade = "proc",
	damage_taken_to_overcharge = "stacking_multiplier",
	increased_weapon_damage_melee_1h = "stacking_multiplier",
	protection_gutter_runner = "stacking_multiplier",
	reduced_overcharge = "stacking_multiplier",
	fatigue_regen = "stacking_multiplier",
	faster_respawn = "stacking_multiplier",
	power_level_large = "stacking_multiplier",
	damage_taken_elites = "stacking_multiplier",
	protection_ratling_gunner = "stacking_multiplier",
	increase_luck = "stacking_multiplier",
	power_level_melee_cleave = "stacking_multiplier",
	max_health = "stacking_multiplier",
	projectile_bounces = "stacking_bonus",
	extra_shot = "proc",
	heal_self_on_heal_other = "proc",
	faster_revive = "stacking_multiplier",
	max_damage_taken = "stacking_bonus",
	critical_strike_chance_ranged = "stacking_bonus",
	block_cost = "stacking_multiplier",
	block_angle = "stacking_multiplier",
	timed_block_cost = "stacking_multiplier",
	vent_speed = "stacking_multiplier",
	not_consume_potion = "proc",
	clip_size = "stacking_multiplier",
	counter_push_power = "stacking_multiplier",
	critical_strike_chance = "stacking_bonus",
	push_power = "stacking_multiplier",
	critical_strike_effectiveness = "stacking_multiplier",
	protection_chaos = "stacking_multiplier",
	max_overcharge = "stacking_multiplier",
	healing_received = "stacking_multiplier",
	reduced_non_burn_damage = "stacking_multiplier",
	reload_speed = "stacking_multiplier",
	stun_duration = "stacking_multiplier",
	cooldown_regen = "stacking_multiplier",
	activated_cooldown = "stacking_multiplier",
	increased_weapon_damage_heavy_attack = "stacking_multiplier",
	not_consume_pickup = "proc",
	attack_intensity_decay = "stacking_multiplier",
	no_push_fatigue_cost = "proc",
	power_level_chaos = "stacking_multiplier",
	increased_burn_damage = "stacking_multiplier",
	attack_intensity_reset = "stacking_multiplier",
	reduced_spread_moving = "stacking_multiplier",
	unbalanced_damage_dealt = "stacking_multiplier",
	critical_strike_chance_melee = "stacking_bonus",
	increased_weapon_damage_melee = "stacking_multiplier",
	unbalanced_damage_taken = "stacking_bonus",
	flat_power_level = "stacking_bonus",
	power_level = "stacking_multiplier",
	shield_break_proc = "proc",
	full_charge_boost = "stacking_multiplier",
	dummy_stagger = "stacking_bonus",
	coop_stamina = "proc",
	power_level_ranged = "stacking_multiplier",
	headshot_multiplier = "stacking_multiplier",
	protection_skaven = "stacking_multiplier",
	power_level_melee = "stacking_multiplier",
	increased_weapon_damage_ranged = "stacking_multiplier",
	protection_aoe = "stacking_multiplier",
	potion_duration = "stacking_multiplier",
	max_health_kd = "stacking_multiplier",
	total_ammo = "stacking_multiplier",
	reduced_ranged_charge_time = "stacking_multiplier",
	grenade_radius = "stacking_multiplier",
	overcharge_regen = "stacking_multiplier",
	grimoire_max_health = "stacking_multiplier",
	overcharge_damage_immunity = "proc",
	max_fatigue = "stacking_bonus",
	power_level_impact = "stacking_multiplier",
	damage_taken = "stacking_multiplier",
	attack_speed = "stacking_multiplier",
	increased_move_speed_while_aiming = "stacking_multiplier",
	protection_pack_master = "stacking_multiplier",
	increased_weapon_damage = "stacking_multiplier",
	not_consume_medpack = "proc",
	outer_block_angle = "stacking_multiplier",
	increased_weapon_damage_melee_2h = "stacking_multiplier",
	increased_weapon_damage_poisoned_or_bleeding = "stacking_multiplier",
	reduced_spread_hit = "stacking_multiplier",
	damage_taken_secondary = "stacking_multiplier",
	backstab_multiplier = "stacking_bonus",
	protection_poison_wind = "stacking_multiplier",
	movement_speed = "stacking_multiplier",
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
	"on_kill",
	"on_kill_elite_special",
	"on_boss_killed",
	"on_special_killed",
	"on_ping_target_killed",
	"on_block",
	"on_block_broken",
	"on_timed_block",
	"on_knocked_down",
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
	"on_unwield",
	"on_critical_hit",
	"on_last_ammo_used",
	"on_gained_ammo_from_no_ammo",
	"on_damage_dealt",
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
	"on_push_used",
	"on_backstab",
	"on_sweep",
	"on_ranged_hit",
	"on_critical_sweep",
	"on_critical_action",
	"on_spell_used",
	"on_grenade_use",
	"on_full_charge",
	"on_charge_finished",
	"on_gromril_armour_removed"
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
	heal_permanent = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) and Managers.player.is_server then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "bandage")
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

		if Unit.alive(player_unit) and Unit.alive(revived_unit) and Managers.player.is_server then
			buff_system:add_buff(revived_unit, buff_to_add, player_unit, false)
		end
	end,
	heal_percent_of_damage_dealt_on_melee = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_type = params[6]

			if buff_type == "MELEE_1H" or buff_type == "MELEE_2H" then
				local hit_unit = params[1]
				local damage_amount = params[2]
				local hit_unit_health_extension = ScriptUnit.extension(hit_unit, "health_system")

				if hit_unit_health_extension and hit_unit_health_extension:current_health() <= damage_amount then
					local breed = AiUtils.unit_breed(hit_unit)

					if breed and not breed.is_hero then
						local heal_amount = breed.bloodlust_health or 0

						DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
					end
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
		local buff_type = params[5]
		local critical_hit = params[6]
		local breed = AiUtils.unit_breed(hit_unit)

		if target_number == 1 then
			buff.has_procced = false
			has_procced = false
		end

		if Unit.alive(player_unit) and breed and (buff_type == "MELEE_1H" or buff_type == "MELEE_2H") and not has_procced then
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

		if Unit.alive(player_unit) then
			local hit_unit = params[1]
			local damage_profile = params[2]
			local stagger_value = params[6]
			local buff_type = params[7]
			local target_index = params[8]
			local breed = AiUtils.unit_breed(hit_unit)
			local multiplier = buff.multiplier
			local is_push = damage_profile.is_push
			local heal_amount = stagger_value * multiplier

			if is_push then
				heal_amount = 0.6
			end

			if target_index and target_index < 5 and breed and not breed.is_hero and (buff_type == "MELEE_1H" or buff_type == "MELEE_2H") then
				DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
			end
		end
	end,
	heal_damage_targets_on_melee = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local buff_template = buff.template
		local max_targets = buff_template.max_targets
		local hit_unit = params[1]
		local damage_amount = params[2]
		local buff_type = params[6]
		local target_number = params[7]
		local breed = AiUtils.unit_breed(hit_unit)

		if Unit.alive(player_unit) and breed and (buff_type == "MELEE_1H" or buff_type == "MELEE_2H") and damage_amount > 0 and target_number and target_number <= max_targets then
			local heal_amount = 0.75

			if target_number == 1 then
				heal_amount = heal_amount / 2
			end

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
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
	remove_wounded = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local heal_amount = health_extension:current_temporary_health()

			DamageUtils.heal_network(player_unit, player_unit, heal_amount, "bandage")
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

		local slot_type = get_killing_blow_slot_type(params)
		local is_melee = slot_type == "melee"

		if not is_melee then
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
	bardin_ironbreaker_remove_on_block_power_buff = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local target_number_damage = params[7]
			local target_number_stagger = params[8]
			local template = buff.template
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local reference_buff_name = template.reference_buff
			local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

			if reference_buff and reference_buff.buff_list and ((target_number_damage and target_number_damage == 1) or (target_number_stagger and target_number_stagger == 1)) then
				for i = 1, #reference_buff.buff_list, 1 do
					local buff_to_remove = table.remove(reference_buff.buff_list)

					if buff_to_remove then
						buff_system:remove_server_controlled_buff(player_unit, buff_to_remove)
					end
				end
			end
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

		if Unit.alive(player_unit) then
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

				if talent_extension:has_talent("bardin_ironbreaker_max_gromril_delay", "dwarf_ranger", true) then
					buff_extension:add_buff("bardin_ironbreaker_gromril_delay_short")
				else
					buff_extension:add_buff("bardin_ironbreaker_gromril_delay")
				end
			end
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
			local damage = params[2]
			local current_health = health_extension:current_health()
			local killing_blow = current_health <= damage
			local template = buff.template
			local buff_to_add = template.buff_to_add

			if killing_blow and not buff_extension:has_buff_perk("ignore_death") then
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
		local hit_zone_name = nil
		local breed = AiUtils.unit_breed(target_unit)
		local dummy_unit_armor = Unit.get_data(target_unit, "armor")
		local armor_type = ActionUtils.get_target_armor(hit_zone_name, breed, dummy_unit_armor)

		if Unit.alive(player_unit) then
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
	sienna_unchained_activated_ability_power_on_enemies_hit = function (player, buff, params)
		if Managers.state.network.is_server then
			local player_unit = player.player_unit

			if Unit.alive(player_unit) then
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
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local buffs_to_add = {
				"kerillian_shade_activated_ability_short",
				"kerillian_shade_end_activated_ability"
			}

			if local_player or (is_server and bot_player) then
				status_extension:set_invisible(true)
				status_extension:set_noclip(true)

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
			local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
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
		local killed_unit = params[3]

		if Unit.alive(player_unit) then
			local drop_chance = buff.template.drop_chance
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local result = math.random(1, 100)

			if result < drop_chance * 100 then
				local enemy_pos = POSITION_LOOKUP[killed_unit] + Vector3.up() * 0.1
				local raycast_down = true
				local pickup_system = Managers.state.entity:system("pickup_system")

				if talent_extension:has_talent("bardin_ranger_passive_spawn_healing_draught", "dwarf_ranger", true) then
					if math.random(1, 4) > 1 then
						pickup_system:buff_spawn_pickup("ammo_ranger", enemy_pos, raycast_down)
					else
						pickup_system:buff_spawn_pickup("frag_grenade_t1", enemy_pos, raycast_down)
					end
				elseif talent_extension:has_talent("bardin_ranger_passive_spawn_potions_or_bombs", "dwarf_ranger", true) then
					local drop_result = math.random(1, 5)

					if drop_result == 1 then
						local potion_result = math.random(1, 5)

						if potion_result == 1 then
							pickup_system:buff_spawn_pickup("damage_boost_potion", enemy_pos, raycast_down)
						elseif potion_result == 2 then
							pickup_system:buff_spawn_pickup("speed_boost_potion", enemy_pos, raycast_down)
						elseif potion_result == 3 then
							pickup_system:buff_spawn_pickup("cooldown_reduction_potion", enemy_pos, raycast_down)
						elseif potion_result == 4 then
							pickup_system:buff_spawn_pickup("frag_grenade_t1", enemy_pos, raycast_down)
						elseif potion_result == 5 then
							pickup_system:buff_spawn_pickup("fire_grenade_t1", enemy_pos, raycast_down)
						end
					else
						pickup_system:buff_spawn_pickup("ammo_ranger", enemy_pos, raycast_down)
					end
				elseif talent_extension:has_talent("bardin_ranger_passive_improved_ammo") then
					pickup_system:buff_spawn_pickup("ammo_ranger_improved", enemy_pos, raycast_down)
				else
					pickup_system:buff_spawn_pickup("ammo_ranger", enemy_pos, raycast_down)
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

		if hit_unit_buff_extension:has_buff_type("consecutive_shot_debuff") and target_number == 1 then
			player_unit_buff_extension:add_buff("consecutive_shot_buff")
		end

		hit_unit_buff_extension:add_buff("consecutive_shot_debuff")
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

		if Unit.alive(player_unit) then
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

		if Unit.alive(player_unit) then
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
	add_buff_on_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local hit_zone = params[3]

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") then
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
	sienna_unchained_add_buff_on_vent_damage = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local damage_type = params[3]

			if damage_type and damage_type == "overcharge" then
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
	add_buff_on_ranged_headshot = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local hit_zone = params[3]
			local buff_type = params[5] == "MELEE_1H" or params[5] == "MELEE_2H"

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
	end_shade_activated_ability = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local shade_activated_ability_buff = {}
			local restealth = false

			if talent_extension:has_talent("kerillian_shade_activated_ability_quick_cooldown", "wood_elf", true) then
				shade_activated_ability_buff[#shade_activated_ability_buff + 1] = buff_extension:get_non_stacking_buff("kerillian_shade_activated_ability_quick_cooldown")
				buff.restealth_delay = nil
			end

			if talent_extension:has_talent("kerillian_shade_passive_stealth_on_backstab_kill", "wood_elf", true) then
				shade_activated_ability_buff[#shade_activated_ability_buff + 1] = buff_extension:get_non_stacking_buff("kerillian_shade_activated_ability_short")
			end

			if talent_extension:has_talent("kerillian_shade_activated_ability_restealth", "wood_elf", true) then
				if buff_extension:has_buff_type("kerillian_shade_activated_ability") then
					restealth = true
				end

				local t = Managers.time:time("game")

				if buff.restealth_delay and buff.restealth_delay < t then
					shade_activated_ability_buff[#shade_activated_ability_buff + 1] = buff_extension:get_non_stacking_buff("kerillian_shade_activated_ability_quick_cooldown")
				end
			end

			shade_activated_ability_buff[#shade_activated_ability_buff + 1] = buff_extension:get_non_stacking_buff("kerillian_shade_activated_ability")

			if #shade_activated_ability_buff > 0 then
				for i = 1, #shade_activated_ability_buff, 1 do
					local buff_to_remove = shade_activated_ability_buff[i]

					if buff_to_remove then
						local buff_id = buff_to_remove.id

						if buff_id then
							buff_extension:remove_buff(buff_id)
						end
					end
				end
			end

			if restealth and not buff_extension:has_buff_type("kerillian_shade_activated_ability_quick_cooldown") then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				status_extension:set_invisible(true)
				status_extension:set_noclip(true)

				local buff_name = "kerillian_shade_activated_ability_quick_cooldown"
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_object_id = network_manager:unit_game_object_id(player_unit)
				local buff_template_name_id = NetworkLookup.buff_templates[buff_name]
				local t = Managers.time:time("game")
				buff.restealth_delay = t + 1

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
	end_huntsman_stealth = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			if is_local(player_unit) and not is_bot(player_unit) then
				MOOD_BLACKBOARD.skill_huntsman_stealth = false
				MOOD_BLACKBOARD.skill_huntsman_surge = true
			end

			if is_local(player_unit) or (is_server() and is_bot(player_unit)) then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if status_extension:is_invisible() then
					status_extension:set_invisible(false)

					local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

					first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit")
					first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")

					local events = {
						"Play_career_ability_markus_huntsman_exit",
						"Stop_career_ability_markus_huntsman_loop_husk"
					}
					local network_manager = Managers.state.network
					local network_transmit = network_manager.network_transmit
					local unit_id = network_manager:unit_game_object_id(player_unit)
					local node_id = 0

					for _, event in ipairs(events) do
						local event_id = NetworkLookup.sound_events[event]

						if is_server() then
							network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
						else
							network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
						end
					end
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
			local ranger_activated_ability_duration_buff = buff_extension:get_non_stacking_buff("bardin_ranger_activated_ability_duration")

			if ranger_activated_ability_buff then
				buff_extension:remove_buff(ranger_activated_ability_buff.id)
			end

			if ranger_activated_ability_duration_buff then
				buff_extension:remove_buff(ranger_activated_ability_duration_buff.id)
			end
		end
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
	bardin_ranger_restore_ammo_on_ally_picked_up_ammo = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("bardin_ranger_passive_ammo_on_ally_pickup") then
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
			local ammo_amount = math.max(math.round(ammo_extension:max_ammo() * ammo_bonus_fraction), 1)

			if ammo_extension and (attack_type == "instant_projectile" or attack_type == "projectile") then
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
			local career_extension = ScriptUnit.extension(player_unit, "career_system")

			if (attack_type and attack_type ~= "ability") or not attack_type then
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

		local slot_type = get_killing_blow_slot_type(params)
		local is_melee = slot_type == "melee"

		if not is_melee then
			return
		end

		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		buff_extension:add_buff(buff_name, {
			attacker_unit = player_unit
		})
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

		if Unit.alive(player_unit) then
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
				local career_extension = ScriptUnit.extension(player_unit, "career_system")
				local template = buff.template
				local cooldown_removed = template.cooldown_reduction

				career_extension:reduce_activated_ability_cooldown_percent(cooldown_removed)
			end
		end
	end,
	remove_victor_bountyhunter_passive_crit_buff = function (player, buff, params)
		local player_unit = player.player_unit
		local action_type = params[1]
		local melee_action = action_type == "sweep" or action_type == "push_stagger"

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
	gain_kerillian_maidenguard_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("kerillian_maidenguard_uninterruptible_on_block_broken_buff")
		end
	end,
	gain_victor_zealot_uninterruptible_on_block_broken_buff = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("victor_zealot_uninterruptible_on_block_broken_buff")
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

		local damage_type = killing_blow_data[DamageDataIndex.DAMAGE_TYPE]
		local rapier_pistol = damage_type == "shot_carbine"

		if rapier_pistol then
			return
		end

		local slot_type = get_killing_blow_slot_type(params)
		local is_melee = slot_type == "melee"

		if not is_melee then
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
	dummy_function = function (player, buff, params)
		return true
	end
}
MaxStackFunctions = {
	gain_push_applies_burn = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("bw_push_applies_burn")
		end
	end,
	gain_assassinate = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff("assassinate")
		end
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
			local slot_data = inventory_extension:get_slot_data(weapon_slot)
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = right_unit_1p and ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = left_unit_1p and ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

			if ammo_extension then
				ammo_extension:add_ammo_to_reserve(ammo_amount)
			end
		end
	end,
	remove_buff = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local buff_to_remove = sub_buff_template.buff_to_remove
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_to_remove)

			if buff then
				buff_extension:remove_buff(buff.id)
			end
		end
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
	sienna_adept_ability_trail = "sienna_adept_ability_trail_infinite",
	burning_dot = "burning_dot_infinite",
	burning_1W_dot = "burning_1W_dot_infinite",
	burning_flamethrower_dot = "burning_flamethrower_dot_infinite",
	burning_3W_dot = "burning_3W_dot_infinite",
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
				perk = "invincibility"
			}
		}
	},
	twitch_damage_boost = {
		buffs = {
			{
				duration = 60,
				name = "armor penetration",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_buff_01"
			}
		}
	},
	twitch_speed_boost = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.5,
				name = "movement",
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
				name = "attack speed buff",
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
				name = "cooldown reduction buff",
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
				stat_buff = "max_health",
				debuff = true,
				max_stacks = 1,
				icon = "buff_icon_grimoire_health_debuff",
				perk = "twitch_grimoire",
				multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF
			}
		}
	},
	twitch_power_boost_dismember = {
		buffs = {
			{
				icon = "markus_huntsman_activated_ability",
				multiplier = 0.25,
				stat_buff = "power_level",
				perk = "bloody_mess",
				max_stacks = 1,
				duration = 60
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
				perk = "disable_permanent_heal"
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
				name = "cooldown reduction buff",
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
				name = "cooldown reduction buff",
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
				name = "cooldown reduction buff",
				multiplier = 15,
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
				perk = "poisoned",
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
				perk = "poisoned",
				time_between_dot_damages = 0.75,
				damage_profile = "poison",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage"
			}
		}
	},
	weapon_bleed_dot_dagger = {
		buffs = {
			{
				damage_profile = "bleed",
				name = "weapon bleed dot dagger",
				duration = 2,
				perk = "bleeding",
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.75,
				hit_zone = "neck",
				max_stacks = 3,
				update_func = "apply_dot_damage"
			}
		}
	},
	weapon_bleed_dot_maidenguard = {
		buffs = {
			{
				damage_profile = "bleed_maidenguard",
				name = "weapon bleed dot maidenguard",
				duration = 4,
				perk = "bleeding",
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.25,
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
				perk = "poisoned",
				damage_profile = "poison",
				update_func = "apply_dot_damage",
				apply_buff_func = "start_dot_damage"
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
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_dot_infinite = {
		buffs = {
			{
				damage_profile = "burning_dot",
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				max_stacks = 1,
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
				perk = "burning",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "beam_burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	beam_burning_dot_infinite = {
		buffs = {
			{
				damage_profile = "beam_burning_dot",
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				max_stacks = 1,
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
				perk = "burning",
				damage_type = "burninating",
				damage_profile = "flamethrower_burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_flamethrower_dot_infinite = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				name = "burning dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				max_stacks = 1,
				remove_buff_func = "remove_dot_damage",
				end_flow_event = "smoke",
				refresh_durations = true,
				perk = "burning",
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
				perk = "burning",
				remove_buff_func = "remove_dot_damage",
				end_flow_event = "smoke",
				time_between_dot_damages = 0.25,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	sienna_adept_ability_trail_infinite = {
		buffs = {
			{
				damage_profile = "burning_dot",
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 0.25,
				damage_type = "burninating",
				max_stacks = 1,
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_dot_fire_grenade = {
		buffs = {
			{
				duration = 6,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot_firegrenade",
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
				perk = "burning",
				time_between_dot_damages = 1.5,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_1W_dot_unchained_push = {
		buffs = {
			{
				duration = 2,
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				refresh_durations = true,
				time_between_dot_damages = 1.5,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_1W_dot_infinite = {
		buffs = {
			{
				damage_profile = "burning_dot",
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 1.5,
				damage_type = "burninating",
				max_stacks = 1,
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
				perk = "burning",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage"
			}
		}
	},
	burning_3W_dot_infinite = {
		buffs = {
			{
				damage_profile = "burning_dot",
				name = "burning dot",
				end_flow_event = "smoke",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				perk = "burning",
				time_between_dot_damages = 1,
				damage_type = "burninating",
				max_stacks = 1,
				update_func = "apply_dot_damage"
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
				dormant = true,
				fatigue_type = "vomit_ground",
				remove_buff_func = "remove_catacombs_corpse_pit",
				apply_buff_func = "apply_catacombs_corpse_pit",
				refresh_durations = true,
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
				update_func = "update_moving_through_plague",
				dormant = true,
				damage_type = "plague_ground",
				remove_buff_func = "remove_moving_through_plague",
				apply_buff_func = "apply_moving_through_plague",
				fatigue_type = "plague_ground",
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
				event_buff = true,
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				perk = "ninja_healing",
				bonus = 2
			}
		}
	},
	bloodlust = {
		buffs = {
			{
				multiplier = 0.2,
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percent_of_damage_dealt_on_melee",
				event = "on_damage_dealt",
				perk = "smiter_healing"
			}
		}
	},
	vanguard = {
		buffs = {
			{
				multiplier = 0.25,
				name = "vanguard",
				event_buff = true,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = "tank_healing"
			}
		}
	},
	reaper = {
		buffs = {
			{
				max_targets = 5,
				name = "reaper",
				event_buff = true,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				perk = "linesman_healing",
				bonus = 0.75
			}
		}
	},
	conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				range = 10
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
				perk = "linesman_stagger_damage",
				max_stacks = 1,
				display_multiplier = 0.4
			}
		}
	},
	smiter_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "smiter_unbalance",
				display_multiplier = 0.2,
				perk = "smiter_stagger_damage"
			}
		}
	},
	finesse_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "finesse_unbalance",
				display_multiplier = 0.2,
				perk = "finesse_stagger_damage"
			}
		}
	},
	tank_unbalance = {
		buffs = {
			{
				max_display_multiplier = 0.4,
				name = "tank_unbalance",
				event_buff = true,
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
				multiplier = 0.2,
				name = "defence_debuff_enemies",
				stat_buff = "damage_taken",
				refresh_durations = true,
				max_stacks = 1,
				duration = 5
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
				apply_buff_func = "start_dot_damage"
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
				name = "mutator_life_damage_on_hit",
				event_buff = true,
				buff_func = "damage_attacker",
				event = "on_hit",
				bonus = 1
			}
		}
	},
	mutator_life_health_regeneration = {
		buffs = {
			{
				name = "mutator_life_health_regeneration",
				event_buff = true,
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
				apply_buff_func = "apply_mutator_life_thorns_poison",
				refresh_durations = true,
				remove_buff_func = "remove_mutator_life_thorns_poison",
				dormant = true,
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
				icon = "buff_icon_mutator_ticking_bomb",
				time_between_dot_damages = 1,
				damage_profile = "mutator_player_dot",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_func = "apply_dot_damage"
			}
		}
	},
	mutator_fire_enemy_dot = {
		activation_sound = "Play_enemy_on_fire_loop",
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				name = "mutator_fire_enemy_dot",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				end_flow_event = "smoke",
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
				perk = "mutator_curse",
				name = "mutator_light_debuff",
				debuff = true,
				icon = "buff_icon_mutator_icon_slayer_curse",
				dormant = true
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
				icon = "teammate_consumable_icon_defence",
				name = "metal_mutator_gromril_armour",
				max_stacks = 10,
				remove_buff_func = "remove_metal_mutator_gromril_armour",
				dormant = true
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
				duration = 8
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
				event_buff = true,
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
				update_func = "update_warpfirethrower_in_face",
				dormant = true,
				damage_type = "warpfire_ground",
				remove_buff_func = "remove_warpfirethrower_in_face",
				apply_buff_func = "apply_warpfirethrower_in_face",
				fatigue_type = "warpfire_ground",
				push_speed = 30,
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
				update_func = "update_vomit_in_face",
				dormant = true,
				fatigue_type = "vomit_face",
				remove_buff_func = "remove_plague_wave_in_face",
				apply_buff_func = "apply_plague_wave_in_face",
				duration = 2,
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
				update_func = "update_vomit_in_face",
				dormant = true,
				damage_type = "vomit_face",
				remove_buff_func = "remove_vomit_in_face",
				apply_buff_func = "apply_vomit_in_face",
				fatigue_type = "vomit_face",
				time_between_dot_damages = 0.65,
				duration = 2,
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
				stat_buff = "backstab_multiplier",
				multiplier = 0.5
			}
		}
	},
	weapon_trait_bloodlust = {
		buffs = {
			{
				name = "weapon_trait_bloodlust",
				event_buff = true,
				buff_func = "heal",
				event = "on_kill",
				bonus = 1
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
				buff_func = "replenish_ammo_on_headshot_ranged"
			},
			{
				stat_buff = "total_ammo",
				multiplier = -0.5
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
					return duration * ((PLATFORM == "xb1" and MixerSettings.mutator_duration_multiplier) or TwitchSettings.mutator_duration_multiplier)
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
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.2,
				duration = 6,
				refresh_durations = true,
				max_stacks = 3,
				remove_buff_func = "remove_movement_buff",
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
				dormant = true
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
				perk = "root",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 0.1,
				duration = 10,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
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
				perk = "guaranteed_crit"
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

for _, dlc in pairs(DLCSettings) do
	local buff_templates = dlc.buff_templates

	if buff_templates then
		table.merge_recursive(BuffTemplates, buff_templates)
	end

	local add_sub_buffs_to_core_buffs = dlc.add_sub_buffs_to_core_buffs

	if add_sub_buffs_to_core_buffs then
		for i = 1, #add_sub_buffs_to_core_buffs, 1 do
			local data = add_sub_buffs_to_core_buffs[i]
			BuffTemplates[data.buff_name].buffs[#BuffTemplates[data.buff_name].buffs + 1] = data.sub_buff_to_add
		end
	end
end

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
