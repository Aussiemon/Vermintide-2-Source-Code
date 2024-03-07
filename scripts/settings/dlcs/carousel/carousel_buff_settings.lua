-- chunkname: @scripts/settings/dlcs/carousel/carousel_buff_settings.lua

local settings = DLCSettings.carousel
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

settings.buff_templates = {
	vs_gutter_runner_allow_dismount = {
		buffs = {
			{
				name = "vs_gutter_runner_allow_dismount",
			},
		},
	},
	vs_gutter_runner_smoke_bomb_invisible = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		buffs = {
			{
				continuous_effect = "fx/screenspace_ranger_skill_01",
				duration = 4,
				icon = "bardin_ranger_activated_ability",
				max_stacks = 1,
				name = "vs_gutter_runner_smoke_bomb_invisible",
				priority_buff = true,
				refresh_durations = true,
				remove_buff_func = "end_vs_gutter_runner_smoke_bomb_invisibility",
			},
		},
	},
	vs_ratling_gunner_slow = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				debuff = true,
				duration = 0.8,
				icon = "troll_vomit_debuff",
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "vs_ratling_gunner_slow",
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
				duration = 0.8,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_crouch_speed_vs_ratling_gunner",
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
				duration = 0.8,
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "decrease_walk_speed_vs_ratling_gunner",
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
				duration = 0.8,
				max_stacks = 1,
				multiplier = 0.6,
				name = "decrease_jump_speed_vs_ratling_gunner",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 0.8,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_speed_vs_ratling_gunner",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 0.8,
				max_stacks = 1,
				multiplier = 0.8,
				name = "decrease_dodge_distance_vs_ratling_gunner",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	vs_warpfire_thrower_long_distance_damage = {
		buffs = {
			{
				apply_buff_func = "apply_vs_warpfirethrower_long_distance_damage",
				duration = 0.3,
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "vs_warpfire_thrower_long_distance_damage",
				refresh_durations = true,
				remove_buff_func = "remove_vs_warpfirethrower_long_distance_damage",
				time_between_dot_damages = 0.35,
				update_func = "update_vs_warpfirethrower_long_distance_damage",
				update_start_delay = 0.1,
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	vs_warpfire_thrower_short_distance_damage = {
		buffs = {
			{
				apply_buff_func = "apply_warpfirethrower_in_face_versus",
				damage_type = "warpfire_ground",
				debuff = true,
				dormant = true,
				duration = 0.15,
				fatigue_type = "warpfire_ground",
				icon = "troll_vomit_debuff",
				max_stacks = 1,
				name = "vs_warpfire_thrower_base",
				push_speed = 8,
				remove_buff_func = "remove_warpfirethrower_in_face",
				slowdown_buff_name = "warpfire_thrower_fire_slowdown",
				time_between_dot_damages = 0.15,
				update_func = "update_warpfirethrower_in_face_versus",
				perks = {
					buff_perks.burning_warpfire,
				},
			},
		},
	},
	vs_pactsworn_melee_damage_taken = {
		buffs = {
			{
				multiplier = 1,
				name = "defence_debuff_enemies",
				stat_buff = "damage_taken_melee",
			},
		},
	},
}

local function is_grail_knight_blocking(unit, attacker_unit, buff, params, world)
	local unit_id = Managers.state.unit_storage:go_id(unit)
	local game = Managers.state.network:game()
	local unit_forward = GameSession.game_object_field(game, unit_id, "aim_direction")
	local unit_pos = POSITION_LOOKUP[unit]
	local attacker_pos = POSITION_LOOKUP[attacker_unit]
	local to_attacker = Vector3.flat(attacker_pos - unit_pos)
	local to_attacker_normalized, distance = Vector3.direction_length(to_attacker)

	if distance < math.epsilon then
		return true, 1
	end

	local unit_facing_attacker_dot = Vector3.dot(unit_forward, to_attacker_normalized)
	local max_block_angle = math.cos(math.pi * 0.6666666666666666)
	local is_power_blocking = max_block_angle < unit_facing_attacker_dot

	return is_power_blocking, unit_facing_attacker_dot
end

settings.buff_function_templates = {
	end_vs_gutter_runner_smoke_bomb_invisibility = function (unit, buff, params, world)
		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_unit_sound_event("Play_versus_gutterrunner_vanish_fps_end", unit, 0)

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
			career_extension:start_activated_ability_cooldown(1)

			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false, nil, "gutter_runner_f")

			if Managers.state.network:game() then
				local status_extension = ScriptUnit.extension(unit, "status_system")

				status_extension:set_is_dodging(false)

				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local unit_id = network_manager:unit_game_object_id(unit)

				network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
			end

			MOOD_BLACKBOARD.gutter_runner_f = false
		end
	end,
	apply_vs_warpfirethrower_long_distance_damage = function (unit, buff, params, world)
		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_onfeet")
		end

		local attacker_unit_is_alive = ALIVE[params.attacker_unit]
		local attacker_unit = attacker_unit_is_alive and params.attacker_unit or unit

		if Unit.alive(attacker_unit) then
			local warpfire_unit_breed = Unit.get_data(attacker_unit, "breed")
			local damage = warpfire_unit_breed.shoot_warpfire_long_attack_damage

			buff.damage = damage
			buff.damage_source = warpfire_unit_breed and warpfire_unit_breed.name or "dot_debuff"
		end
	end,
	update_vs_warpfirethrower_long_distance_damage = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server then
			local attacker_unit = params.attacker_unit
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local target_power_block_perk = target_buff_extension:has_buff_perk("power_block")
			local is_power_blocking, dot = false

			if target_power_block_perk then
				is_power_blocking, dot = is_grail_knight_blocking(unit, attacker_unit, buff, params, world)
			end

			if (not is_power_blocking or not DamageUtils.check_ranged_block(attacker_unit, unit, dot, "blocked_berzerker")) and HEALTH_ALIVE[unit] then
				local armor_type = buff.armor_type
				local damage_type = buff_template.damage_type
				local damage = buff.damage[armor_type]
				local damage_source = buff.damage_source

				DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
			end
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local warpfire_next_t = t + buff_template.time_between_dot_damages

		return warpfire_next_t
	end,
	remove_vs_warpfirethrower_long_distance_damage = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
		end
	end,
	apply_warpfirethrower_in_face_versus = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_flamethrower_01")
			buff.warpfire_particle_id_2 = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local warpfire_unit_breed = Unit.get_data(attacker_unit, "breed")
			local damage = warpfire_unit_breed.shoot_warpfire_long_attack_damage

			buff.damage = damage
			buff.damage_source = warpfire_unit_breed and warpfire_unit_breed.name or "dot_debuff"
		end

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local pushed_direction
		local distance = 0

		if ALIVE[attacker_unit] then
			local source_breed = Unit.get_data(attacker_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position

			pushed_direction = Vector3.normalize(to_victim)
			distance = Vector3.length(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		local target_power_block_perk = target_buff_extension:has_buff_perk("power_block")

		if breed.is_hero and first_person_extension and not target_power_block_perk then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(unit, "status_system")
			local no_ranged_knockback = buff_extension and buff_extension:has_buff_perk("no_ranged_knockback")
			local is_valid_push_target = not no_ranged_knockback and not status_extension:is_disabled()

			if is_valid_push_target then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * push_speed

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end
	end,
	update_warpfirethrower_in_face_versus = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server then
			local attacker_unit_is_alive = ALIVE[params.attacker_unit]
			local attacker_unit = attacker_unit_is_alive and params.attacker_unit or unit
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local target_power_block_perk = target_buff_extension:has_buff_perk("power_block")
			local is_power_blocking, dot = false

			if target_power_block_perk then
				is_power_blocking, dot = is_grail_knight_blocking(unit, attacker_unit, buff, params, world)
			end

			if (not is_power_blocking or not DamageUtils.check_ranged_block(attacker_unit, unit, dot, "blocked_berzerker")) and HEALTH_ALIVE[unit] then
				local armor_type = buff.armor_type
				local damage_type = buff_template.damage_type
				local damage = buff.damage[armor_type]
				local damage_source = buff.damage_source

				DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source, nil, attacker_unit)
			end

			local is_friendly_target = not DamageUtils.is_enemy(attacker_unit, unit)
			local target_dead = HEALTH_ALIVE[unit]

			if attacker_unit_is_alive and is_friendly_target and target_dead then
				QuestSettings.check_num_enemies_killed_by_warpfire(unit, attacker_unit)
			end
		end

		local warpfire_next_t = t + buff_template.time_between_dot_damages

		return warpfire_next_t
	end,
}
