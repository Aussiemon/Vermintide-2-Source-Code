-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/buff_function_templates.lua

local buff_perk_names = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

BuffFunctionTemplates = BuffFunctionTemplates or {}

local unit_is_frozen = Unit.is_frozen
local dot_tick_sound_events = {}

local function get_variable(path_to_movement_setting_to_modify, unit)
	fassert(#path_to_movement_setting_to_modify > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_value = movement_settings_table

	for _, movement_setting in ipairs(path_to_movement_setting_to_modify) do
		movement_value = movement_value[movement_setting]

		if not movement_value then
			break
		end
	end

	if movement_value then
		return movement_value
	else
		ferror("Variable does not exist in PlayerUnitMovementSettings")
	end
end

local function set_variable(path_to_movement_setting_to_modify, unit, value)
	local nr_of_settings = #path_to_movement_setting_to_modify

	fassert(nr_of_settings > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

	local unit_movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_value = unit_movement_settings_table
	local index = 1

	while index <= nr_of_settings do
		if nr_of_settings < index + 1 then
			movement_value[path_to_movement_setting_to_modify[index]] = value
		else
			movement_value = movement_value[path_to_movement_setting_to_modify[index]]
		end

		index = index + 1
	end
end

local clearable_params = {}
local broadphase_results = {}

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

local function is_server()
	return Managers.state.network.is_server
end

local function is_husk(unit)
	local player = Managers.player:owner(unit)
	local is_husk = player and (player.remote or player.bot_player) or false

	return is_husk
end

BuffFunctionTemplates.functions = {
	apply_action_lerp_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if bonus then
			buff.current_lerped_value = 0
		end

		if multiplier then
			buff.current_lerped_multiplier = 1
		end
	end,
	update_action_lerp_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier
		local time_into_buff = params.time_into_buff
		local old_value_to_update_movement_setting, value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting
		local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

		if bonus then
			local new_value = math.lerp(0, bonus, percentage_in_lerp)

			old_value_to_update_movement_setting = buff.current_lerped_value
			buff.current_lerped_value = new_value
			value_to_update_movement_setting = new_value
		end

		if multiplier then
			local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)

			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end

		if value_to_update_movement_setting or multiplier_to_update_movement_setting then
			if buff.has_added_movement_previous_turn then
				buff_extension_function_params.value = old_value_to_update_movement_setting
				buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

				BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)
			end

			buff.has_added_movement_previous_turn = true
			buff_extension_function_params.value = value_to_update_movement_setting
			buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
		end
	end,
	remove_action_lerp_movement_buff = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		table.clear(clearable_params)

		clearable_params.external_optional_duration = nil
		clearable_params.external_optional_bonus = buff.current_lerped_value
		clearable_params.external_optional_multiplier = buff.current_lerped_multiplier

		buff_extension:add_buff(buff.template.remove_buff_name, clearable_params)
	end,
	apply_action_lerp_remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if bonus then
			buff.current_lerped_value = bonus
		end

		if multiplier then
			buff.current_lerped_multiplier = multiplier
		end

		buff.last_frame_percentage = 1
	end,
	update_action_lerp_remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier
		local time_into_buff = params.time_into_buff
		local value_to_update_movement_setting, old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting

		if buff.last_frame_percentage == 0 then
			return
		end

		local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

		percentage_in_lerp = 1 - percentage_in_lerp
		buff.last_frame_percentage = percentage_in_lerp

		if bonus then
			local new_value = math.lerp(0, bonus, percentage_in_lerp)

			old_value_to_update_movement_setting = buff.current_lerped_value
			buff.current_lerped_value = new_value
			value_to_update_movement_setting = new_value
		end

		if multiplier then
			local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)

			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end

		if value_to_update_movement_setting or multiplier_to_update_movement_setting then
			buff_extension_function_params.value = old_value_to_update_movement_setting
			buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)

			if percentage_in_lerp > 0 then
				buff_extension_function_params.value = value_to_update_movement_setting
				buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

				BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
			end
		end
	end,
	apply_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()

			multiplier = multiplier[wind_strength]
		end

		local path_to_movement_setting_to_modify = buff.template.path_to_movement_setting_to_modify
		local movement_setting_value = get_variable(path_to_movement_setting_to_modify, unit)

		if bonus then
			movement_setting_value = movement_setting_value + bonus
		end

		if multiplier then
			movement_setting_value = movement_setting_value * multiplier
		end

		set_variable(path_to_movement_setting_to_modify, unit, movement_setting_value)
	end,
	remove_movement_buff = function (unit, buff, params)
		local bonus = params.bonus
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()

			multiplier = multiplier[wind_strength]
		end

		local path_to_movement_setting_to_modify = buff.template.path_to_movement_setting_to_modify
		local movement_setting_value = get_variable(path_to_movement_setting_to_modify, unit)

		if multiplier then
			movement_setting_value = movement_setting_value / multiplier
		end

		if bonus then
			movement_setting_value = movement_setting_value - bonus
		end

		set_variable(path_to_movement_setting_to_modify, unit, movement_setting_value)
	end,
	apply_ai_movement_buff = function (unit, buff, params)
		local blackboard = BLACKBOARDS[unit]
		local multiplier = params.multiplier

		if buff.template.wind_mutator then
			local wind_strength = Managers.weave:get_wind_strength()

			multiplier = multiplier[wind_strength]
		end

		local navigation_extension = blackboard.navigation_extension

		buff.id = navigation_extension:add_movement_modifier(multiplier)
	end,
	remove_ai_movement_buff = function (unit, buff, params)
		local blackboard = BLACKBOARDS[unit]
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:remove_movement_modifier(buff.id)
	end,
	apply_screenspace_effect = function (unit, buff, params, world)
		local screenspace_effect_name = buff.template.screenspace_effect_name
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:create_screen_particles(screenspace_effect_name)
		end
	end,
	knock_down_bleed_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	knock_down_bleed_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template

			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage

			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "knockdown_bleed")
		end
	end,
	temporary_health_degen_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	temporary_health_degen_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template

			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage

			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "temporary_health_degen")
		end
	end,
	health_degen_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	health_degen_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template

			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage

			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "health_degen")
		end
	end,
	convert_permanent_to_temporary_health = function (unit, buff, params)
		if Managers.state.network.is_server then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				health_extension:convert_permanent_to_temporary_health()
			end
		end
	end,
	life_drain_update_no_kill = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template

			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage

			local damage
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local current_health = health_extension:current_health()
			local in_end_zone = status_extension:is_in_end_zone()

			if not in_end_zone and current_health > 1 then
				if current_health - buff_template.damage > 1 then
					damage = buff_template.damage
				else
					damage = current_health - 1
				end

				local damage_type = buff_template.damage_type

				DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, nil, Vector3(1, 0, 0), "life_drain")
			end
		end
	end,
	health_regen_all_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_heal_time = params.t + buff.template.time_between_heal
		end
	end,
	health_regen_all_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_heal_time < params.t then
			local buff_template = buff.template

			buff.next_heal_time = buff.next_heal_time + buff_template.time_between_heal

			local heal_amount = buff_template.heal
			local heal_type = buff_template.heal_type or "health_regen"
			local side = Managers.state.side.side_by_unit[unit]

			if not side then
				return
			end

			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units do
				DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, heal_type)
			end
		end
	end,
	health_regen_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_heal_time = params.t + buff.template.time_between_heal
		end
	end,
	health_regen_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_heal_time < params.t then
			local buff_template = buff.template

			buff.next_heal_time = buff.next_heal_time + buff_template.time_between_heal

			local heal_amount = buff_template.heal
			local heal_type = buff_template.heal_type or "health_regen"

			DamageUtils.heal_network(unit, unit, heal_amount, heal_type)
		end
	end,
	mutator_life_health_regeneration_start = function (unit, buff, params)
		if Managers.state.network.is_server then
			buff.next_buff_time = params.t + 5
			buff.health_regeneration_stack_ids = {}
		end
	end,
	mutator_life_health_regeneration_update = function (unit, buff, params)
		if Managers.state.network.is_server and buff.next_buff_time < params.t then
			local buff_template = buff.template

			buff.next_buff_time = buff.next_buff_time + 5

			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				local num_stacks = #buff.health_regeneration_stack_ids

				if num_stacks < 3 then
					local id = buff_extension:add_buff("mutator_life_health_regeneration_stacks")

					buff.health_regeneration_stack_ids[num_stacks + 1] = id
				end
			end
		end
	end,
	remove_metal_mutator_gromril_armour = function (unit, buff, params)
		local buff_params = {
			attacker_unit = unit,
		}
		local buff_ext = ScriptUnit.extension(unit, "buff_system")

		buff_ext:add_buff("metal_mutator_damage_boost", buff_params)
	end,
	start_blade_dance = function (unit, buff, params, world)
		params.next_tick_t = params.t + 0.5

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)
		local fx

		if unit == local_player_unit then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.first_person_unit

			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01_1p", POSITION_LOOKUP[first_person_unit])

			World.link_particles(world, fx, first_person_unit, Unit.node(first_person_unit, "root_point"), Matrix4x4.identity(), "stop")
			WwiseWorld.trigger_event(wwise_world, "Play_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Play_wind_metal_gameplay_mutator_wind_loop", unit, 0)

			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01", POSITION_LOOKUP[unit])

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end

		buff.linked_effect = fx
	end,
	update_blade_dance = function (unit, buff, params)
		if params.t >= params.next_tick_t then
			params.next_tick_t = params.t + 0.5

			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
			local rotation = Unit.local_rotation(unit, 0)

			area_damage_system:create_explosion(unit, position, rotation, "metal_mutator_blade_dance", 1, "undefined", 0, false)
		end
	end,
	remove_blade_dance = function (unit, buff, params, world)
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)

		if unit == local_player_unit then
			WwiseWorld.trigger_event(wwise_world, "Stop_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Stop_wind_metal_gameplay_mutator_wind_loop", unit, 0)
		end

		if buff.linked_effect then
			World.destroy_particles(world, buff.linked_effect)

			buff.linked_effect = nil
		end
	end,
	apply_beasts_totem_buff = function (unit, buff, params, world)
		if not buff.fx_id then
			local fx = World.create_particles(world, "fx/chr_beastmen_standard_bearer_buff_01", POSITION_LOOKUP[unit])

			buff.fx_id = fx

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end
	end,
	remove_beasts_totem_buff = function (unit, buff, params, world)
		if buff.fx_id then
			World.stop_spawning_particles(world, buff.fx_id)
		end
	end,
	apply_fire_mutator_bomb = function (unit, buff, params, world)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if unit == local_player_unit then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				buff.screenspace_particle_id = first_person_extension:create_screen_particles("fx/screenspace_magic_wind_fire_01")
			end
		else
			local fx = World.create_particles(world, "fx/magic_wind_fire_timer_01", POSITION_LOOKUP[unit])

			buff.linked_effect = fx

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end
	end,
	update_fire_mutator_bomb = function (unit, buff, params, world)
		return
	end,
	remove_fire_mutator_bomb = function (unit, buff, params, world)
		if buff.linked_effect then
			World.destroy_particles(world, buff.linked_effect)

			buff.linked_effect = nil
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:destroy_screen_particles(buff.screenspace_particle_id)
		end
	end,
	apply_mutator_life_poison_buff = function (unit, buff, params, world)
		local wind_settings = WindSettings.life
		local weave_manager = Managers.weave
		local wind_strength = weave_manager:get_wind_strength()
		local thorns_damage = wind_settings.thorns_damage[wind_strength]
	end,
	start_dot_damage = function (unit, buff, params)
		if buff.template.damage_type == "burninating" then
			local attacker_unit = params.attacker_unit
			local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if target_buff_extension and attacker_buff_extension and attacker_buff_extension:has_buff_type("sienna_unchained_burn_increases_damage_taken") then
				local buff_data = attacker_buff_extension:get_non_stacking_buff("sienna_unchained_burn_increases_damage_taken")

				table.clear(clearable_params)

				clearable_params.external_optional_multiplier = buff_data.multiplier
				clearable_params.external_optional_duration = buff.duration

				target_buff_extension:add_buff("increase_damage_recieved_while_burning", clearable_params)
			end
		end
	end,
	reapply_dot_damage = function (unit, buff, params)
		if buff.template.damage_type == "burninating" then
			local attacker_unit = params.attacker_unit
			local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")
			local target_buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if target_buff_extension and attacker_buff_extension and attacker_buff_extension:has_buff_type("sienna_unchained_burn_increases_damage_taken") then
				local buff_data = attacker_buff_extension:get_non_stacking_buff("sienna_unchained_burn_increases_damage_taken")

				table.clear(clearable_params)

				clearable_params.external_optional_multiplier = buff_data.multiplier
				clearable_params.external_optional_duration = buff.duration

				target_buff_extension:add_buff("increase_damage_recieved_while_burning", clearable_params)
			end
		end
	end,
	apply_dot_damage = function (unit, buff, params)
		local t = params.t
		local next_poison_damage_time = t

		if HEALTH_ALIVE[unit] then
			local buff_template = buff.template
			local tick_time = buff.template.time_between_dot_damages
			local perks = buff.template.perks

			if perks and table.find(perks, buff_perk_names.burning_balefire) then
				local source = buff.source_attacker_unit or buff.attacker_unit
				local source_buff_extension = ScriptUnit.has_extension(source, "buff_system")

				if source_buff_extension and not Managers.state.side:is_ally(unit, source) then
					local duration_multiplier = source_buff_extension:apply_buffs_to_value(1, "increased_balefire_dot_duration")

					tick_time = tick_time * duration_multiplier
				end
			end

			local random_mod_next_dot_time = 0.75 * tick_time + math.random() * 0.5 * tick_time

			next_poison_damage_time = next_poison_damage_time + random_mod_next_dot_time

			if Managers.state.network.is_server then
				local attacker_unit = params.attacker_unit
				local source_attacker_unit = params.source_attacker_unit
				local used_attacker_unit = ALIVE[attacker_unit] and attacker_unit or ALIVE[source_attacker_unit] and source_attacker_unit

				if used_attacker_unit then
					if buff.template.custom_dot_tick_func then
						BuffFunctionTemplates.functions[buff.template.custom_dot_tick_func](unit, buff, params)
					else
						local target_unit = unit
						local hit_zone_name = buff.template.hit_zone or "full"
						local attack_direction = Vector3.down()
						local hit_ragdoll_actor
						local damage_source = "dot_debuff"
						local power_level = buff.power_level or DefaultPowerLevel
						local damage_profile_name = buff_template.damage_profile or "default"
						local damage_profile = DamageProfileTemplates[damage_profile_name]
						local target_index
						local boost_curve_multiplier = 0
						local is_critical_strike = false
						local can_damage = true
						local can_stagger = damage_profile.dot_stagger
						local blocking = false
						local shield_breaking_hit = false
						local backstab_multiplier, first_hit, total_hits

						DamageUtils.server_apply_hit(t, used_attacker_unit, target_unit, hit_zone_name, nil, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, source_attacker_unit)
					end
				end
			end
		end

		if buff.template.sound_event and is_local(unit) then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event(buff.template.sound_event)
			end
		end

		local perks = buff.template.perks

		if perks then
			for perk_i = 1, #perks do
				local perk = perks[perk_i]
				local dot_tick_sound_event = perk and dot_tick_sound_events[perk]

				if dot_tick_sound_event then
					local attacker_unit = params.source_attacker_unit or AiUtils.get_actual_attacker_unit(params.attacker_unit)

					if is_local(attacker_unit) then
						local first_person_extension = ScriptUnit.has_extension(attacker_unit, "first_person_system")

						if first_person_extension then
							first_person_extension:play_hud_sound_event(dot_tick_sound_event)
						end
					end
				end
			end
		end

		return next_poison_damage_time
	end,
	apply_moving_through_vomit = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension:get_source_attacker_unit()
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")

				buff.damage_source = source_breed and source_breed.name or "dot_debuff"
			end
		end
	end,
	update_moving_through_vomit = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = ALIVE[params.attacker_unit] and params.attacker_unit or unit
			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source
			local liquid_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				damage = damage * (liquid_extension.buff_damage_multiplier or 1)
			end

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local vomit_next_t = t + buff_template.time_between_dot_damages

		return vomit_next_t
	end,
	remove_moving_through_vomit = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vomit_particle_id)
		end
	end,
	apply_catacombs_corpse_pit = function (unit, buff, params, world)
		buff.next_tick = params.t + 0
	end,
	update_catacombs_corpse_pit = function (unit, buff, params, world)
		local t = params.t
		local next_tick = buff.next_tick
		local buff_template = buff.template

		if next_tick < t then
			local fatigue_type = buff_template.fatigue_type
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			if status_extension then
				status_extension:add_fatigue_points(fatigue_type)
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local slowdown_buff_name = buff_template.slowdown_buff_name

			if slowdown_buff_name then
				buff_extension:add_buff(slowdown_buff_name, params)
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.next_tick = t + buff_template.time_between_ticks
		end
	end,
	remove_catacombs_corpse_pit = function (unit, buff, params, world)
		return
	end,
	apply_moving_through_plague = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.plague_particle_id = first_person_extension:create_screen_particles("fx/screenspace_cemetery_plague_01")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension:get_source_attacker_unit()
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")

				buff.damage_source = source_breed and source_breed.name or "dot_debuff"
			end
		end
	end,
	update_moving_through_plague = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = ALIVE[params.attacker_unit] and params.attacker_unit or unit
			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local plague_next_t = t + buff_template.time_between_dot_damages

		return plague_next_t
	end,
	remove_moving_through_plague = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.plague_particle_id)
		end
	end,
	apply_mutator_life_thorns_poison = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension._source_unit
				local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")

				buff.damage_source = source_breed and source_breed.name or "dot_debuff"
			end
		end
	end,
	update_mutator_life_thorns_poison = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = ALIVE[params.attacker_unit] and params.attacker_unit or unit
			local damage_type = buff_template.damage_type
			local damage = buff.damage
			local damage_source = buff.damage_source

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local poison_next_t = t + buff_template.time_between_dot_damages

		return poison_next_t
	end,
	remove_mutator_life_thorns_poison = function (unit, buff, params, world)
		return
	end,
	apply_ai_movement_debuff = function (unit, buff, params, world)
		local ext = ScriptUnit.extension(unit, "ai_navigation_system")
		local modifier = buff.template.multiplier
		local id = ext:add_movement_modifier(modifier)

		buff.movement_modifier_id = id
	end,
	remove_ai_movement_debuff = function (unit, buff, params, world)
		local ext = ScriptUnit.extension(unit, "ai_navigation_system")

		ext:remove_movement_modifier(buff.movement_modifier_id)
	end,
	apply_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		return
	end,
	update_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		return
	end,
	remove_chaos_zombie_explosion_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.nurgle_particle_id_01)
			first_person_extension:stop_spawning_screen_particles(buff.nurgle_particle_id_02)
		end
	end,
	apply_plague_wave_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			CosmeticsUtils.flow_event_mesh_3p(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.plague_wave_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plague_wave_01")
			buff.plague_wave_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plauge_wave_02")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position

			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)

		buff.vomit_next_t = params.t
	end,
	remove_plague_wave_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.plague_wave_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.plague_wave_opaque_particle_id)
		end
	end,
	apply_vermintide_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local pushed_direction
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position

			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)
	end,
	update_vermintide_in_face = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = params.attacker_unit

			attacker_unit = Unit.alive(attacker_unit) and attacker_unit or unit

			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local next_vomit_t = t + buff_template.time_between_dot_damages

		return next_vomit_t
	end,
	remove_vermintide_in_face = function (unit, buff, params, world)
		return
	end,
	apply_vomit_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			CosmeticsUtils.flow_event_mesh_3p(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_opaque")
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position

			pushed_direction = Vector3.normalize(to_victim)

			local attacker_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

			if attacker_buff_extension then
				buff.buff_damage_multiplier = attacker_buff_extension:apply_buffs_to_value(1, "damage_dealt")
			end
		else
			pushed_direction = Vector3.backward()
		end

		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		local push_speed = buff_template.push_speed
		local pushed_velocity = pushed_direction * push_speed

		locomotion_extension:add_external_velocity(pushed_velocity)
	end,
	update_vomit_in_face = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = params.attacker_unit
			local attacker_unit = Unit.alive(attacker_unit) and attacker_unit or unit
			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source

			if buff.buff_damage_multiplier then
				damage = damage * buff.buff_damage_multiplier
			end

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local vomit_next_t = t + buff_template.time_between_dot_damages

		return vomit_next_t
	end,
	remove_vomit_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vomit_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.vomit_opaque_particle_id)
		end
	end,
	apply_vortex = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vortex_particle_id = first_person_extension:create_screen_particles("fx/screenspace_poison_globe_impact")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local is_enemy = DamageUtils.is_enemy(attacker_unit, unit)
			local attacker_breed = ALIVE[attacker_unit] and Unit.get_data(attacker_unit, "breed")
			local attacker_breed_name = attacker_breed and attacker_breed.name
			local damage_source = is_enemy and attacker_breed_name or "dot_debuff"

			buff.damage_source = damage_source
		end
	end,
	update_vortex = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = params.attacker_unit
			local attacker_unit = Unit.alive(attacker_unit) and attacker_unit or unit
			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local fatigue_type = buff_template.fatigue_type
		local status_extension = ScriptUnit.has_extension(unit, "status_system")

		if status_extension then
			status_extension:add_fatigue_points(fatigue_type)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local vortex_next_t = t + buff_template.time_between_dot_damages

		return vortex_next_t
	end,
	remove_vortex = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.vortex_particle_id)
		end
	end,
	apply_moving_through_warpfire = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.extension(attacker_unit, "area_damage_system")
			local source_unit = liquid_extension:get_source_attacker_unit()
			local source_breed = ALIVE[source_unit] and Unit.get_data(source_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			if ALIVE[source_unit] then
				local source_buff_extension = ScriptUnit.has_extension(source_unit, "buff_system")

				if source_buff_extension then
					if type(buff.damage) == "table" then
						local damage_table = table.clone(buff.damage)

						for key, val in pairs(damage_table) do
							damage_table[key] = source_buff_extension:apply_buffs_to_value(val, "damage_dealt")
						end

						buff.damage = damage_table
					else
						buff.damage = source_buff_extension:apply_buffs_to_value(buff.damage, "damage_dealt")
					end
				end
			end
		end

		buff.warpfire_next_t = params.t + 0.1
	end,
	update_moving_through_warpfire = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server and HEALTH_ALIVE[unit] then
			local attacker_unit = params.attacker_unit
			local attacker_unit = Unit.alive(attacker_unit) and attacker_unit or unit
			local armor_type = buff.armor_type
			local damage_type = buff_template.damage_type
			local damage = buff.damage[armor_type]
			local damage_source = buff.damage_source

			DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:play_hud_sound_event("Play_player_damage_puke")
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local slowdown_buff_name = buff_template.slowdown_buff_name

		if slowdown_buff_name then
			buff_extension:add_buff(slowdown_buff_name, params)
		end

		local warpfire_next_t = t + buff_template.time_between_dot_damages

		return warpfire_next_t
	end,
	update_heal_ticks = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local health_extension = ScriptUnit.extension(unit, "health_system")

		if health_extension:current_permanent_health_percent() >= 1 then
			return
		end

		if next_heal_tick < t then
			if Managers.state.network.is_server then
				local heal_amount = buff_template.heal_amount

				if HEALTH_ALIVE[unit] then
					DamageUtils.heal_network(unit, unit, heal_amount, "career_passive")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	markus_huntsman_update_heal_ticks = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local health_extension = ScriptUnit.extension(unit, "health_system")

		if health_extension:current_health_percent() == 1 then
			return
		end

		if next_heal_tick < t then
			if Managers.state.network.is_server then
				local heal_amount = buff_template.heal_amount

				if HEALTH_ALIVE[unit] then
					DamageUtils.heal_network(unit, unit, heal_amount, "buff")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	delayed_buff_removal = function (unit, buff, params, world)
		if not ALIVE[unit] then
			return
		end

		local buff_template = buff.template
		local t = params.t

		if buff.marked_for_deletion then
			if not buff.delete_time then
				buff.delete_time = t + buff_template.deletion_delay
			end

			if t > buff.delete_time then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local reference_buff_name = buff_template.reference_buff
				local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

				if reference_buff and reference_buff.buff_list then
					local buff_to_remove = table.remove(reference_buff.buff_list)

					if buff_to_remove then
						buff_extension:remove_buff(buff_to_remove)
					end
				end

				buff.delete_time = nil
				buff.marked_for_deletion = nil
			end
		end
	end,
	delayed_buff_add = function (unit, buff, params, world)
		if not ALIVE[unit] then
			return
		end

		local buff_template = buff.template
		local t = params.t

		if buff.marked_for_add then
			if not buff.add_time then
				buff.add_time = t + buff_template.add_delay
			end

			if t > buff.add_time then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local reference_buff_name = buff_template.reference_buff
				local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)
				local buff_to_add = buff_template.buff_to_add

				if buff_extension then
					if not reference_buff.buff_list then
						reference_buff.buff_list = {}
					end

					local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

					if num_buff_stacks < reference_buff.template.max_sub_buff_stacks then
						reference_buff.buff_list[#reference_buff.buff_list + 1] = buff_extension:add_buff(buff_to_add)
					end
				end

				buff.add_time = nil
				buff.marked_for_add = nil
			end
		end
	end,
	delayed_single_buff_add = function (unit, buff, params, world)
		if not ALIVE[unit] then
			return
		end

		local buff_template = buff.template
		local t = params.t

		if buff.marked_for_add then
			if not buff.add_time then
				buff.add_time = t + buff_template.add_delay
			end

			if t > buff.add_time then
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

				buff.add_time = nil
				buff.marked_for_add = nil
			end
		end
	end,
	add_buff_stacks_on_movement = function (unit, buff, params, world)
		if not ALIVE[unit] then
			return
		end

		local position = POSITION_LOOKUP[unit]

		if not buff.position then
			buff.position = Vector3Box(position)
		else
			local buff_template = buff.template
			local difference = buff.position:unbox() - position
			local distance_moved = Vector3.length(difference)

			if not buff.distance_moved then
				buff.distance_moved = 0
			end

			buff.distance_moved = buff.distance_moved + distance_moved

			local talent_extension = ScriptUnit.has_extension(unit, "talent_system")
			local has_short_passive = false
			local distance_to_travel = math.huge

			if has_short_passive then
				distance_to_travel = buff_template.distance_per_stack * 0.7
			else
				distance_to_travel = buff_template.distance_per_stack
			end

			if distance_to_travel < buff.distance_moved then
				local buff_to_add = buff_template.buff_to_add
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

				if buff_extension then
					if not buff.buff_list then
						buff.buff_list = {}
					end

					local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

					if num_buff_stacks < buff_template.max_sub_buff_stacks then
						buff.buff_list[#buff.buff_list + 1] = buff_extension:add_buff(buff_to_add)
					end
				end

				buff.distance_moved = 0
			end

			buff.position:store(position)
		end
	end,
	set_stacks_on_stacks = function (unit, buff, params, world)
		local player_unit = unit

		if ALIVE[player_unit] then
			local template = buff.template
			local buff_to_check = template.buff_to_check
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local parent_num_buffs = buff_extension:num_buff_type(buff_to_check)

			if not buff.buff_list then
				buff.buff_list = {}
			end

			if parent_num_buffs == #buff.buff_list then
				return
			end

			local buff_to_add = template.buff_to_add
			local parent_stacks_per_stack = template.parent_stacks_per_stack
			local num_buffs = #buff.buff_list
			local buffs_to_have = parent_num_buffs / parent_stacks_per_stack
			local difference = buffs_to_have - num_buffs

			if difference < 0 then
				local amount_to_remove = math.abs(difference)

				for i = 1, amount_to_remove do
					local buff_id = table.remove(buff.buff_list)

					buff_extension:remove_buff(buff_id)
				end
			else
				for i = 1, difference do
					table.insert(buff.buff_list, buff_extension:add_buff(buff_to_add))
				end
			end
		end
	end,
	update_kerillian_waywatcher_regen = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local regen_cap = 0.5

		if next_heal_tick < t and Unit.alive(unit) then
			local talent_extension = ScriptUnit.extension(unit, "talent_system")
			local cooldown_talent = talent_extension:has_talent("kerillian_waywatcher_passive_cooldown_restore", "wood_elf", true)

			if cooldown_talent then
				local cooldown_reduction = 0.05
				local career_extension = ScriptUnit.extension(unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(cooldown_reduction)
			end

			if Managers.state.network.is_server and not cooldown_talent then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local heal_amount = buff_template.heal_amount

				if talent_extension:has_talent("kerillian_waywatcher_improved_regen", "wood_elf", true) then
					heal_amount = heal_amount * 1.5
				end

				if HEALTH_ALIVE[unit] and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
					if talent_extension:has_talent("kerillian_waywatcher_group_regen", "wood_elf", true) then
						local side = Managers.state.side.side_by_unit[unit]

						if not side then
							return
						end

						local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

						for i = 1, #player_and_bot_units do
							local heal_unit = player_and_bot_units[i]

							if HEALTH_ALIVE[heal_unit] then
								local health_extension = ScriptUnit.extension(heal_unit, "health_system")
								local status_extension = ScriptUnit.extension(heal_unit, "status_system")

								if regen_cap >= health_extension:current_permanent_health_percent() and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
									DamageUtils.heal_network(heal_unit, unit, heal_amount, "career_passive")
								end
							end
						end
					elseif regen_cap >= health_extension:current_permanent_health_percent() then
						DamageUtils.heal_network(unit, unit, heal_amount, "career_passive")
					end
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	remove_moving_through_warpfire = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
		end
	end,
	apply_warpfirethrower_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_flamethrower_01")
			buff.warpfire_particle_id_2 = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction
		local attacker_unit = params.attacker_unit
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

		if breed.is_hero and first_person_extension then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(unit, "status_system")
			local no_ranged_knockback = buff_extension and buff_extension:has_buff_perk("no_ranged_knockback")
			local is_valid_push_target = not no_ranged_knockback and not status_extension:is_disabled()

			if is_valid_push_target then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * math.max(0, push_speed - distance)

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end
	end,
	update_warpfirethrower_in_face = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server then
			local attacker_unit_is_alive = ALIVE[params.attacker_unit]
			local attacker_unit = attacker_unit_is_alive and params.attacker_unit or unit

			if HEALTH_ALIVE[unit] then
				local armor_type = buff.armor_type
				local damage_type = buff_template.damage_type
				local damage = buff.damage[armor_type]
				local damage_source = buff.damage_source

				DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
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
	remove_warpfirethrower_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id_2)
			first_person_extension:play_hud_sound_event("Stop_player_hit_warpfire_thrower")
		end
	end,
	apply_warpfire_in_face = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]

		buff.damage = damage

		local breed = Unit.get_data(unit, "breed")

		buff.armor_type = breed.armor_category or 1

		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			CosmeticsUtils.flow_event_mesh_3p(unit, "impact_warpfire")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction
		local attacker_unit = params.attacker_unit

		if ALIVE[attacker_unit] then
			local source_breed = Unit.get_data(attacker_unit, "breed")

			buff.damage_source = source_breed and source_breed.name or "dot_debuff"

			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position

			pushed_direction = Vector3.normalize(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		if first_person_extension then
			local hit_unit_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local no_ranged_knockback = hit_unit_buff_extension and hit_unit_buff_extension:has_buff_perk("no_ranged_knockback")

			if not no_ranged_knockback then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * push_speed

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end
	end,
	update_warpfire_in_face = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template

		if Managers.state.network.is_server then
			local attacker_unit_is_alive = ALIVE[params.attacker_unit]
			local attacker_unit = attacker_unit_is_alive and params.attacker_unit or unit

			if HEALTH_ALIVE[unit] then
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
	remove_warpfire_in_face = function (unit, buff, params, world)
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			first_person_extension:stop_spawning_screen_particles(buff.warpfire_particle_id)
			first_person_extension:play_hud_sound_event("Stop_player_hit_warpfire_thrower")
		end
	end,
	start_aoe_buff = function (unit, buff, params)
		local buff_template = buff.template

		if buff_template.target == "enemies" and Managers.state.network.is_server then
			table.clear(broadphase_results)

			local ai_system = Managers.state.entity:system("ai_system")
			local ai_broadphase = ai_system.broadphase
			local position = POSITION_LOOKUP[unit]
			local range = buff_template.range
			local num_enemies = Broadphase.query(ai_broadphase, position, range, broadphase_results)
			local buff_name = buff_template.buff

			for i = 1, num_enemies do
				local enemy_unit = broadphase_results[i]
				local buff_extension = ScriptUnit.has_extension(enemy_unit, "buff_system")

				if buff_extension then
					table.clear(clearable_params)

					clearable_params.attacker_unit = unit

					buff_extension:add_buff(buff_name, clearable_params)
				end
			end
		end

		buff.reapply_t = params.t + buff_template.reapply_rate
	end,
	reapply_aoe_buff = function (unit, buff, params)
		if buff.reapply_t <= params.t then
			local buff_template = buff.template

			if buff_template.target == "enemies" and Managers.state.network.is_server then
				table.clear(broadphase_results)

				local ai_system = Managers.state.entity:system("ai_system")
				local ai_broadphase = ai_system.broadphase
				local position = POSITION_LOOKUP[unit]
				local range = buff_template.range
				local num_enemies = Broadphase.query(ai_broadphase, position, range, broadphase_results)
				local buff_name = buff_template.buff

				for i = 1, num_enemies do
					local unit = broadphase_results[i]
					local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

					if buff_extension then
						table.clear(clearable_params)

						clearable_params.attacker_unit = unit

						buff_extension:add_buff(buff_name, clearable_params)
					end
				end
			end

			buff.reapply_t = params.t + buff_template.reapply_rate
		end
	end,
	remove_aoe_buff = function (unit, buff, params)
		return
	end,
	add_buff_local = function (unit, buff, params)
		local template = buff.template
		local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		local buffs_to_add = template.buffs_to_add

		if buffs_to_add then
			for i = 1, #buffs_to_add do
				local buff_name = buffs_to_add[1]

				buff_extension:add_buff(buff_name)
			end
		else
			local buff_name = template.buff_to_add

			buff_extension:add_buff(buff_name)
		end
	end,
	remove_buff_local = function (unit, buff, params)
		local buff_to_remove = buff.template.buff_to_remove
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local remove_buff = buff_extension:get_buff_type(buff_to_remove)

		if remove_buff then
			buff_extension:remove_buff(remove_buff.id)
		end
	end,
	add_buff_synced = function (unit, buff, params)
		local template = buff.template

		if template.ignore_if_client and not Managers.state.network.is_server then
			return
		end

		local sync_type = template.sync_type
		local peer_id

		if sync_type == BuffSyncType.Client or sync_type == BuffSyncType.ClientAndServer then
			local player = Managers.player:owner(unit)

			if not player then
				print(string.format("Tried adding peer_id requiring buff on a unit which no peer owns. Defaulting to own peer_id. (%s)", template.name))
			end

			peer_id = player and player.peer_id or Network.peer_id()
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buffs_to_add = template.synced_buffs_to_add

		if buffs_to_add then
			for i = 1, #buffs_to_add do
				local buff_to_add = buffs_to_add[i]

				buff_system:add_buff_synced(unit, buff_to_add, sync_type, nil, peer_id)
			end
		else
			local buff_to_add = template.synced_buff_to_add

			buff_system:add_buff_synced(unit, buff_to_add, sync_type, nil, peer_id)
		end
	end,
	remove_buff_synced = function (unit, buff, params)
		local template = buff.template

		if template.ignore_if_client and not Managers.state.network.is_server then
			return
		end

		local buff_to_remove = buff.template.synced_buff_to_remove
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local remove_buff = buff_extension:get_buff_type(buff_to_remove)

		if remove_buff then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:remove_buff_synced(unit, remove_buff.id)
		end
	end,
	add_buff_server_controlled = function (unit, buff, params)
		local game = Managers.state.network:game()

		if not game then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local current_stacks = buff_extension:num_buff_type(buff_name)
			local max_stacks = BuffTemplates[buff_name].buffs[1].max_stacks

			if current_stacks < max_stacks then
				local buff_system = Managers.state.entity:system("buff_system")
				local server_buff_id = buff_system:add_buff(unit, buff_name, unit, true)

				if not buff.server_buff_ids then
					buff.server_buff_ids = {
						server_buff_id,
					}
				else
					buff.server_buff_ids[#buff.server_buff_ids + 1] = server_buff_id
				end
			end
		end
	end,
	remove_buff_server_controlled = function (unit, buff, params)
		local game = Managers.state.network:game()

		if not game then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local server_buff_ids = buff.server_buff_ids

			if server_buff_ids then
				local buff_system = Managers.state.entity:system("buff_system")

				for i = 1, #server_buff_ids do
					local buff_id = server_buff_ids[i]

					buff_system:remove_server_controlled_buff(unit, buff_id)
				end

				buff.server_buff_ids = nil
			end
		end
	end,
	add_buffs = function (unit, buff, params)
		if Unit.alive(unit) then
			local template = buff.template
			local add_buffs_data = template.add_buffs_data

			if add_buffs_data then
				local buffs_to_add = add_buffs_data.buffs_to_add

				if buffs_to_add then
					local buff_system = Managers.state.entity:system("buff_system")
					local link_buffs = add_buffs_data.link_buffs
					local params

					if link_buffs then
						params = {
							parent_id = buff.id,
						}
					end

					local sync_buffs = add_buffs_data.sync_buffs
					local sync_type = sync_buffs and BuffSyncType.LocalAndServer or BuffSyncType.Local

					for i = 1, #buffs_to_add do
						buff_system:add_buff_synced(unit, buffs_to_add[i], sync_type, params)
					end
				end
			end
		end
	end,
	remove_buffs = function (unit, buff, params)
		if Unit.alive(unit) then
			local template = buff.template
			local remove_buffs_data = template.remove_buffs_data

			if remove_buffs_data then
				local buffs_to_remove = remove_buffs_data.buffs_to_remove

				if buffs_to_remove then
					local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

					if buff_extension then
						for i = 1, #buffs_to_remove do
							local buff = buff_extension:get_non_stacking_buff(buffs_to_remove[i])

							if buff then
								buff_extension:remove_buff(buff.id)
							end
						end
					end
				end
			end
		end
	end,
	remove_buff_stack = function (unit, buff, params)
		if Unit.alive(unit) then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				local template = buff.template
				local remove_buff_stack_data_array = template.remove_buff_stack_data

				for i = 1, #remove_buff_stack_data_array do
					local remove_buff_stack_data = remove_buff_stack_data_array[i]
					local buff_to_remove = remove_buff_stack_data.buff_to_remove
					local num_stacks = remove_buff_stack_data.num_stacks or 1

					if remove_buff_stack_data.server_controlled then
						fassert(buff_to_remove == template.buff_to_add, "Trying to remove different type of server controlled buff, only same types are allowed right now.")

						local buff_system = Managers.state.entity:system("buff_system")
						local server_buff_ids = buff.server_buff_ids

						num_stacks = server_buff_ids and math.min(#server_buff_ids, num_stacks) or 0

						for i = 1, num_stacks do
							local buff_to_remove = table.remove(server_buff_ids)

							buff_system:remove_server_controlled_buff(unit, buff_to_remove)
						end
					else
						for i = 1, num_stacks do
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
	add_health_on_application = function (unit, buff, params)
		if Unit.alive(unit) and Managers.state.network.is_server then
			local template = buff.template
			local heal_amount = template.heal_amount

			DamageUtils.heal_network(unit, unit, heal_amount, "career_passive")
		end
	end,
	kerillian_maidenguard_add_power_buff_on_unharmed = function (unit, buff, params)
		if not is_server() then
			return
		end

		local game = Managers.state.network:game()

		if not game then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(unit, buff_name, unit, false)
		end
	end,
	update_multiplier_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	update_bonus_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_bonus = template.min_bonus
		local max_bonus = template.max_bonus
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local bonus = num_chunks * min_bonus

		if max_bonus < bonus then
			bonus = max_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	activate_buff_stacks_based_on_enemy_proximity = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local side = Managers.state.side.side_by_unit[unit]

		if not side then
			return
		end

		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local range = buff.range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = 5
		local own_position = POSITION_LOOKUP[unit]
		local enemy_broadphase_categories = side.enemy_broadphase_categories
		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results, enemy_broadphase_categories)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1

				if math.floor(num_alive_nearby_enemies / chunk_size) == max_stacks then
					break
				end
			end
		end

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids

				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	activate_buff_stacks_based_on_ally_proximity = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if not ALIVE[unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = template.max_stacks
		local side = Managers.state.side.side_by_unit[unit]
		local player_and_bot_units = side and side.PLAYER_AND_BOT_UNITS
		local own_position = POSITION_LOOKUP[unit]
		local num_nearby_allies = 0
		local allies = player_and_bot_units and #player_and_bot_units or 0

		for i = 1, allies do
			local ally_unit = player_and_bot_units[i]

			if ally_unit ~= unit then
				local ally_position = POSITION_LOOKUP[ally_unit]
				local distance_squared = Vector3.distance_squared(own_position, ally_position)

				if distance_squared < range_squared then
					num_nearby_allies = num_nearby_allies + 1
				end

				if math.floor(num_nearby_allies / chunk_size) == max_stacks then
					break
				end
			end
		end

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		local num_chunks = math.floor(num_nearby_allies / chunk_size)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids

				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	update_multiplier_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local num_chunks = math.floor(num_alive_nearby_enemies / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_buff_stacks_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local chunk_size = template.chunk_size
			local buff_to_add = template.buff_to_add
			local max_stacks = template.max_stacks

			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			local num_chunks = math.min(math.floor(overcharge / chunk_size), max_stacks)
			local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

			if num_buff_stacks < num_chunks then
				local difference = num_chunks - num_buff_stacks

				for i = 1, difference do
					local buff_id = buff_extension:add_buff(buff_to_add)
					local stack_ids = buff.stack_ids

					stack_ids[#stack_ids + 1] = buff_id
				end
			elseif num_chunks < num_buff_stacks then
				local difference = num_buff_stacks - num_chunks

				for i = 1, difference do
					local stack_ids = buff.stack_ids
					local buff_id = table.remove(stack_ids, 1)

					buff_extension:remove_buff(buff_id)
				end
			end
		end
	end,
	activate_server_buff_stacks_based_on_overcharge_chunks = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local overcharge, _, _ = overcharge_extension:current_overcharge_status()
		local template = buff.template
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = template.max_sub_buff_stacks or 5

		if not buff.stack_server_ids then
			buff.stack_server_ids = {}
		end

		local stack_server_ids = buff.stack_server_ids
		local num_chunks = math.min(math.floor(overcharge / chunk_size), max_stacks)
		local num_buff_stacks = #buff.stack_server_ids

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference do
				local server_buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)

				stack_server_ids[#stack_server_ids + 1] = server_buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference do
				local server_buff_id = table.remove(stack_server_ids, 1)

				buff_system:remove_server_controlled_buff(unit, server_buff_id)
			end
		end
	end,
	activate_buff_stacks_based_on_health_chunks = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local chunk_size = template.chunk_size
		local damage_taken = health_extension:get_damage_taken("uncursed_max_health")
		local uncursed_max_health = health_extension:get_uncursed_max_health()
		local max_stacks = math.min(math.floor(uncursed_max_health / chunk_size) - 1, template.max_stacks)
		local health_chunks = math.floor(damage_taken / chunk_size)
		local num_chunks = math.min(max_stacks, health_chunks)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference do
				local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
				local stack_ids = buff.stack_ids

				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_system:remove_server_controlled_buff(unit, buff_id)
			end
		end
	end,
	victor_zealot_activate_buff_stacks_based_on_health_percent = function (unit, buff, params)
		if Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local template = buff.template
			local health_threshold_1 = template.threshold_1
			local health_threshold_2 = template.threshold_2
			local buffed_max_health = health_extension:get_buffed_max_health()
			local current_health = health_extension:current_permanent_health()
			local current_health_percent = current_health / buffed_max_health

			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			if #buff.stack_ids > 0 and health_threshold_2 < current_health_percent then
				if #buff.stack_ids > 1 or health_threshold_1 < current_health_percent then
					local buff_id = table.remove(buff.stack_ids, 1)

					buff_system:remove_server_controlled_buff(unit, buff_id)
				end
			elseif current_health_percent < health_threshold_1 then
				local buff_to_add = template.buff_to_add
				local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)
				local add_second_buff = false

				if current_health_percent < health_threshold_2 then
					add_second_buff = true
				end

				if num_buff_stacks < 1 or add_second_buff and num_buff_stacks == 1 then
					local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)

					buff.stack_ids[#buff.stack_ids + 1] = buff_id
				end
			end
		end
	end,
	activate_buff_stacks_based_on_clip_size = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local slot_data = inventory_extension:get_slot_data("slot_ranged")
			local buff_system = Managers.state.entity:system("buff_system")
			local max_ammo = 1

			if slot_data then
				local item_template = BackendUtils.get_item_template(slot_data.item_data)
				local ammo_data = item_template and item_template.ammo_data
				local ammo_per_clip = ammo_data and ammo_data.ammo_per_clip

				if ammo_per_clip and max_ammo < ammo_per_clip then
					max_ammo = ammo_per_clip
				end

				local clip_size = max_ammo
				local max_stacks = clip_size
				local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

				if not buff.stack_ids then
					buff.stack_ids = {}
				end

				if num_buff_stacks < max_stacks then
					local difference = max_stacks - num_buff_stacks

					for i = 1, difference do
						local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
						local stack_ids = buff.stack_ids

						stack_ids[#stack_ids + 1] = buff_id
					end
				elseif max_stacks < num_buff_stacks then
					local difference = num_buff_stacks - max_stacks

					for i = 1, difference do
						local stack_ids = buff.stack_ids
						local buff_id = table.remove(stack_ids, 1)

						buff_system:remove_server_controlled_buff(unit, buff_id)
					end
				end
			end
		end
	end,
	remove_buff_stacks_based_on_clip_size = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add
			local buff_stack_ids = buff.stack_ids

			if buff_extension:has_buff_type(buff_to_add) and buff_stack_ids then
				for i = 1, #buff_stack_ids do
					local buff_id = buff_stack_ids[i]

					buff_system:remove_server_controlled_buff(unit, buff_id)
				end

				buff.stack_ids = nil
			end
		end
	end,
	pause_activated_ability = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension then
				career_extension:start_activated_ability_cooldown()
				career_extension:set_activated_ability_cooldown_paused()
			end
		end
	end,
	unpause_activated_ability = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension then
				career_extension:set_activated_ability_cooldown_unpaused()
			end
		end
	end,
	activate_buff_on_distance = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local disregard_self = template.disregard_self
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) and (not disregard_self or unit ~= owner_unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	side_buff_aura = function (owner_unit, buff, params)
		local template = buff.template

		if template.server_only and not Managers.state.network.is_server then
			return
		end

		local side_manager = Managers.state.side
		local side_by_unit = side_manager.side_by_unit
		local side = side_by_unit[owner_unit]

		if not side then
			return
		end

		local buffed_units = buff.buffed_units or {}

		buff.buffed_units = buffed_units

		local buff_params = FrameTable.alloc_table()

		if template.owner_as_source then
			buff_params.source_attacker_unit = owner_unit
		end

		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_sync_type = template.buff_sync_type or BuffSyncType.All
		local inside_this_frame = FrameTable.alloc_table()

		if template.player_buff_name then
			local friendly_players = side.PLAYER_AND_BOT_UNITS

			for i = 1, #friendly_players do
				local friendly_unit = friendly_players[i]
				local inside = range_squared > Vector3.distance_squared(owner_position, POSITION_LOOKUP[friendly_unit])
				local buff_id = buffed_units[friendly_unit]

				if inside then
					if not buff_id then
						buffed_units[friendly_unit] = buff_system:add_buff_synced(friendly_unit, template.player_buff_name, buff_sync_type, buff_params)
					end

					inside_this_frame[friendly_unit] = true
				elseif buff_id then
					buff_system:remove_buff_synced(friendly_unit, buff_id)

					buffed_units[friendly_unit] = nil
				end
			end
		end

		if template.ai_buff_name then
			local nearby_units = FrameTable.alloc_table()
			local num_units = AiUtils.broadphase_query(owner_position, range, nearby_units)

			for i = 1, num_units do
				local other_unit = nearby_units[i]
				local other_side = side_by_unit[other_unit]

				if not side_manager:is_enemy_by_side(side, other_side) then
					local buff_id = buffed_units[other_unit]

					if not buff_id then
						buffed_units[other_unit] = buff_system:add_buff_synced(other_unit, template.ai_buff_name, buff_sync_type, buff_params)
					end

					inside_this_frame[other_unit] = true
				end
			end
		end

		for unit, buff_id in pairs(buffed_units) do
			if not inside_this_frame[unit] then
				buff_system:remove_buff_synced(unit, buff_id)
			end
		end
	end,
	remove_side_buff_aura = function (owner_unit, buff, params)
		local buffed_units = buff.buffed_units

		if not buffed_units then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")

		for unit, buff_id in pairs(buff.buffed_units) do
			buff_system:remove_buff_synced(unit, buff_id)
		end
	end,
	remove_party_buff_stacks = function (owner_unit, buff, params)
		if not Managers.state.network.is_server or not buff.stack_ids then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side:get_side_from_name("heroes")

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local allies = #player_and_bot_units

		for i = 1, allies do
			local unit = player_and_bot_units[i]

			if ALIVE[unit] then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local stack_ids = buff.stack_ids[unit]

				if stack_ids then
					for i = 1, #stack_ids do
						local buff_id = table.remove(stack_ids)

						buff_system:remove_server_controlled_buff(unit, buff_id)
					end
				end
			end
		end
	end,
	activate_party_buff_stacks_on_ally_proximity = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = template.max_stacks
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local own_position = POSITION_LOOKUP[owner_unit]
		local num_nearby_allies = 0
		local allies = #player_and_bot_units

		for i = 1, allies do
			local ally_unit = player_and_bot_units[i]

			if ally_unit ~= owner_unit then
				local ally_position = POSITION_LOOKUP[ally_unit]
				local distance_squared = Vector3.distance_squared(own_position, ally_position)

				if distance_squared < range_squared then
					num_nearby_allies = num_nearby_allies + 1
				end

				if math.floor(num_nearby_allies / chunk_size) == max_stacks then
					break
				end
			end
		end

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		for i = 1, allies do
			local unit = player_and_bot_units[i]

			if ALIVE[unit] then
				if not buff.stack_ids[unit] then
					buff.stack_ids[unit] = {}
				end

				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(own_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared then
					local stack_ids = buff.stack_ids[unit]

					for i = 1, #stack_ids do
						local stack_ids = buff.stack_ids[unit]
						local buff_id = table.remove(stack_ids)

						buff_system:remove_server_controlled_buff(unit, buff_id)
					end
				else
					local num_chunks = math.floor(num_nearby_allies / chunk_size)
					local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

					if num_buff_stacks < num_chunks then
						local difference = num_chunks - num_buff_stacks
						local stack_ids = buff.stack_ids[unit]

						for i = 1, difference do
							local buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)

							stack_ids[#stack_ids + 1] = buff_id
						end
					elseif num_chunks < num_buff_stacks then
						local difference = num_buff_stacks - num_chunks
						local stack_ids = buff.stack_ids[unit]

						for i = 1, difference do
							local buff_id = table.remove(stack_ids)

							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end
			end
		end
	end,
	activate_buff_on_closest_distance = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local distance_squared = math.huge
		local current_unit = buff.current_unit

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if ALIVE[unit] and unit ~= current_unit and unit ~= owner_unit then
				local unit_position = POSITION_LOOKUP[unit]
				local dist_squared = Vector3.distance_squared(owner_position, unit_position)

				if dist_squared < range_squared and dist_squared < distance_squared then
					if current_unit and ALIVE[current_unit] then
						local current_unit_position = POSITION_LOOKUP[current_unit]

						if not owner_position or not current_unit_position then
							return
						end

						local current_dist_squared = Vector3.distance_squared(owner_position, current_unit_position)

						if dist_squared < current_dist_squared then
							local buff_extension = ScriptUnit.extension(current_unit, "buff_system")
							local has_buff = buff_extension:get_non_stacking_buff(buff_to_add)

							if has_buff then
								local buff_id = has_buff.server_id

								if buff_id then
									buff_system:remove_server_controlled_buff(current_unit, buff_id)
								end
							end

							distance_squared = dist_squared
							buff.current_unit = unit
						end
					else
						distance_squared = dist_squared
						buff.current_unit = unit
					end
				end
			end
		end

		local current_unit = buff.current_unit

		if current_unit then
			local buff_extension = ScriptUnit.has_extension(current_unit, "buff_system")

			if not buff_extension then
				return
			end

			local current_unit_position = POSITION_LOOKUP[current_unit]
			local dist_squared = Vector3.distance_squared(owner_position, current_unit_position)

			if range_squared < dist_squared then
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					local buff_id = buff.server_id

					if buff_id then
						buff.current_unit = nil

						buff_system:remove_server_controlled_buff(current_unit, buff_id)
					end
				end
			end

			if dist_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
				local server_buff_id = buff_system:add_buff(current_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		else
			buff.current_unit = nil
		end
	end,
	markus_hero_time_reset = function (unit, buff, params)
		local player_unit = unit

		if Unit.alive(player_unit) then
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

			career_extension:reduce_activated_ability_cooldown_percent(1)
		end
	end,
	add_buff_stacks = function (unit, buff, params)
		local player_unit = unit

		if Unit.alive(player_unit) then
			local template = buff.template
			local amount_to_add = template.amount_to_add
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local buff_to_add = template.buff_to_add
			local buff_list = template.buff_list

			for i = 1, amount_to_add do
				if amount_to_add > #buff_list then
					template.buff_list[#template.buff_list + 1] = buff_extension:add_buff(buff_to_add)
				end
			end
		end
	end,
	remove_aura_buff = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side:get_side_from_name("heroes")

		if side then
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units

			for i = 1, num_units do
				local unit = player_and_bot_units[i]

				if ALIVE[unit] then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end
			end
		end
	end,
	activate_buff_on_nearby_ai_enemies = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local t = Managers.time:time("game")

		if not buff.next_update_t then
			buff.next_update_t = t
			buff.tracked_buffs = {}
		end

		if t < buff.next_update_t then
			return
		end

		local buff_template = buff.template

		buff.next_update_t = buff.next_update_t + buff_template.tick_rate

		local side_by_unit = Managers.state.side.side_by_unit
		local owner_side = side_by_unit[owner_unit]
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add
		local tracked_buffs = buff.tracked_buffs
		local position = POSITION_LOOKUP[owner_unit]
		local radius = buff.template.radius
		local nearby_enemies = FrameTable.alloc_table()
		local num_nearby_enemies = AiUtils.broadphase_query(position, radius, nearby_enemies)

		for i = 1, num_nearby_enemies do
			local nearby_unit = nearby_enemies[i]

			nearby_enemies[nearby_unit] = true

			if not tracked_buffs[nearby_unit] then
				local side = side_by_unit[nearby_unit]

				if side ~= owner_side then
					tracked_buffs[nearby_unit] = buff_system:add_buff(nearby_unit, buff_to_add, owner_unit, true)
				end
			end
		end

		for unit, buff_id in pairs(tracked_buffs) do
			if not nearby_enemies[unit] then
				buff_system:remove_server_controlled_buff(unit, buff_id)

				tracked_buffs[unit] = nil
			end
		end
	end,
	remove_tracked_buffs = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local tracked_buffs = buff.tracked_buffs

		if tracked_buffs then
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			for unit, buff_id in pairs(tracked_buffs) do
				if ALIVE[unit] then
					buff_system:remove_server_controlled_buff(unit, buff_id)
				end
			end

			table.clear(tracked_buffs)
		end
	end,
	update_ascending_descending_buff_stacks_on_time = function (owner_unit, buff, params)
		if not Unit.alive(owner_unit) then
			return
		end

		local t = params.t
		local template = buff.template

		if not buff.buff_ids then
			buff.ascending = true
			buff.buff_ids = {}
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = template.buff_to_add
		local max_sub_buff_stacks = template.max_sub_buff_stacks

		if buff.ascending then
			buff.buff_ids[#buff.buff_ids + 1] = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)

			if max_sub_buff_stacks <= #buff.buff_ids then
				buff.ascending = false
			end
		else
			local buff_to_remove = table.remove(buff.buff_ids, 1)

			buff_system:remove_server_controlled_buff(owner_unit, buff_to_remove)

			if #buff.buff_ids <= 1 then
				buff.ascending = true
			end
		end
	end,
	activate_buff_on_closest = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local closest_player

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if distance_squared > closest_player_distance then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	markus_knight_proximity_buff_update = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
		local buff_to_add = "markus_knight_passive_defence_aura"
		local buff_system = Managers.state.entity:system("buff_system")
		local power_talent = talent_extension:has_talent("markus_knight_guard")
		local range_talent = talent_extension:has_talent("markus_knight_passive_block_cost_aura")

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared or power_talent or range_talent then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not power_talent and not range_talent and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	markus_knight_movespeed_on_incapacitated_ally = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side and side.PLAYER_AND_BOT_UNITS
		local num_units = player_and_bot_units and #player_and_bot_units or 0
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_system = Managers.state.entity:system("buff_system")
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local disabled_allies

		for i = 1, num_units do
			local unit = player_and_bot_units[i]
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local is_disabled = status_extension:is_disabled()

			if is_disabled then
				disabled_allies = true
			end
		end

		if buff_extension:has_buff_type(buff_to_add) then
			if not disabled_allies then
				local buff_id = buff.buff_id

				if buff_id then
					buff_system:remove_server_controlled_buff(owner_unit, buff_id)

					buff.buff_id = nil
				end
			end
		elseif disabled_allies then
			buff.buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
		end
	end,
	kerillian_maidenguard_proximity_buff_update = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = "kerillian_maidenguard_passive_stamina_regen_buff"
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if range_squared < distance_squared then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	victor_bountyhunter_blessed_combat_update = function (unit, buff, params)
		local template = buff.template
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local ranged_buff_to_add = template.ranged_buff_to_add
		local ranged_activation_buff = template.ranged_buff
		local has_ranged_buff = buff_extension:has_buff_type(ranged_activation_buff)
		local applied_ranged_buff = buff_extension:get_non_stacking_buff(ranged_buff_to_add)

		if has_ranged_buff then
			if not applied_ranged_buff then
				buff_extension:add_buff(ranged_buff_to_add)
			end
		elseif applied_ranged_buff then
			buff_extension:remove_buff(applied_ranged_buff.id)
		end

		local melee_buff_to_add = template.melee_buff_to_add
		local melee_activation_buff = template.melee_buff
		local has_melee_buff = buff_extension:has_buff_type(melee_activation_buff)
		local applied_buff = buff_extension:get_non_stacking_buff(melee_buff_to_add)

		if has_melee_buff then
			if not applied_buff then
				buff_extension:add_buff(melee_buff_to_add)
			end
		elseif applied_buff then
			buff_extension:remove_buff(applied_buff.id)
		end
	end,
	victor_bountyhunter_contract_killing_update = function (unit, buff, params)
		local template = buff.template
		local t = params.t
		local update_frequency = template.update_frequency
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if not buff_extension then
			return
		end

		if not buff.timer then
			buff.timer = t + update_frequency
		end

		if t > buff.timer then
			buff.timer = t + update_frequency

			local buff_list = {}

			if CurrentConflictSettings.factions then
				if table.contains(CurrentConflictSettings.factions, "chaos") then
					local buff_list_chaos = template.buffs_to_add_chaos

					for i = 1, #buff_list_chaos do
						buff_list[#buff_list + 1] = buff_list_chaos[i]
					end
				end

				if table.contains(CurrentConflictSettings.factions, "skaven") then
					local buff_list_skaven = template.buffs_to_add_skaven

					for i = 1, #buff_list_skaven do
						buff_list[#buff_list + 1] = buff_list_skaven[i]
					end
				end

				if table.contains(CurrentConflictSettings.factions, "beastmen") then
					local buffs_to_add_beastmen = template.buffs_to_add_beastmen

					for i = 1, #buffs_to_add_beastmen do
						buff_list[#buff_list + 1] = buffs_to_add_beastmen[i]
					end
				end

				if buff_extension:num_buff_type(template.reward_to_add) > 5 then
					local buff_list_special = template.buffs_to_add_special

					for i = 1, #buff_list_special do
						buff_list[#buff_list + 1] = buff_list_special[i]
					end
				end
			end

			local buff_to_add = buff_list[math.random(1, #buff_list)]

			if buff.current_buff_id then
				buff_extension:remove_buff(template.current_buff_id)
			end

			if buff_to_add then
				buff.current_buff_id = buff_extension:add_buff(buff_to_add)
				buff.can_reward = true
				buff.current_buff = buff_to_add
			end
		end

		local completed_contract = not buff_extension:has_buff_type(buff.current_buff)

		if completed_contract and buff.can_reward then
			local reward = template.reward_to_add

			buff.can_reward = false

			buff_extension:add_buff(reward)
		end
	end,
	maidenguard_attack_speed_on_block_update = function (unit, buff, params)
		if Unit.alive(unit) then
			local template = buff.template
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local stat_increase_buffs = template.stat_increase_buffs
			local activation_buff = template.buff_to_add

			for i = 1, #stat_increase_buffs do
				local stat_increase_buff = stat_increase_buffs[i]
				local has_activation_buff = buff_extension:has_buff_type(activation_buff)
				local applied_stat_increase_buff = buff_extension:get_non_stacking_buff(stat_increase_buff)

				if has_activation_buff then
					if not applied_stat_increase_buff then
						buff_extension:add_buff(stat_increase_buff)
					end
				elseif applied_stat_increase_buff then
					buff_extension:remove_buff(applied_stat_increase_buff.id)
				end
			end
		end
	end,
	activate_buff_on_other_buff = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local activation_buff = template.activation_buff
		local activate_on_missing = template.activate_on_missing
		local only_local = template.only_local
		local has_buff = buff_extension:get_non_stacking_buff(activation_buff)
		local apply_buff = (has_buff and not activate_on_missing or not has_buff and activate_on_missing) and (not only_local or only_local and is_local(unit))
		local applied_buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if apply_buff then
			if not applied_buff then
				buff_extension:add_buff(buff_to_add)
			end
		elseif applied_buff then
			buff_extension:remove_buff(applied_buff.id)
		end
	end,
	activate_bonus_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local stat_buff_index = template.stat_buff
		local side = Managers.state.side.side_by_unit[unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit
		local targets = {}

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets do
			local unit = targets[i]
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local is_disabled = status_extension:is_disabled()

			if is_disabled and unit == owner_unit then
				return
			elseif is_disabled and unit ~= owner_unit then
				disabled_allies[#disabled_allies + 1] = unit
			end
		end

		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if #disabled_allies == num_units - 1 then
			bonus = activation_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local side = Managers.state.side.side_by_unit[unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit
		local targets = {}

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets do
			local unit = targets[i]

			if unit then
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local is_disabled = status_extension:is_disabled()

				if is_disabled and unit == owner_unit then
					return
				elseif is_disabled and unit ~= owner_unit then
					disabled_allies[#disabled_allies + 1] = unit
				end
			end
		end

		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if #disabled_allies == num_units - 1 then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_buff_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local side = Managers.state.side.side_by_unit[unit]

		if not side then
			return
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local targets = {}
		local local_player = is_local(owner_unit)

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets do
			local target_unit = targets[i]

			if target_unit then
				local status_extension = ScriptUnit.has_extension(target_unit, "status_system")
				local is_disabled = not status_extension or status_extension:is_disabled()

				if is_disabled and target_unit == owner_unit then
					return
				elseif is_disabled and target_unit ~= owner_unit then
					disabled_allies[#disabled_allies + 1] = target_unit
				end
			end
		end

		local adding_buff

		if #disabled_allies == num_units - 1 then
			adding_buff = true
		end

		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if buff_extension then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_to_add)

			if not adding_buff and buff then
				if local_player then
					buff_extension:remove_buff(buff.id)
				else
					local server_id = buff.server_id

					buff_system:remove_server_controlled_buff(owner_unit, server_id)
				end
			elseif adding_buff and not buff then
				if local_player then
					buff_extension:add_buff(buff_to_add)
				else
					local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	activate_buff_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local targets = {}
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local adding_buff

		if health_percent < activation_health and activate_below or activation_health < health_percent and not activate_below then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_buff_on_disabled = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local adding_buff

		if is_disabled then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_buff_on_no_ammo = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local weapon_slot = "slot_ranged"
		local ammo_amount = buff.bonus
		local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
		local slot_data = inventory_extension:get_slot_data(weapon_slot)

		if slot_data then
			local right_unit_1p = slot_data.right_unit_1p
			local left_unit_1p = slot_data.left_unit_1p
			local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
			local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension
			local adding_buff

			if ammo_extension then
				adding_buff = ammo_extension:total_ammo_fraction() == 0
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local buff = buff_extension:get_non_stacking_buff(buff_to_add)

			if not adding_buff and buff then
				if local_player then
					buff_extension:remove_buff(buff.id)
				else
					local server_id = buff.server_id

					buff_system:remove_server_controlled_buff(owner_unit, server_id)
				end
			elseif adding_buff and not buff then
				if local_player then
					buff_extension:add_buff(buff_to_add)
				else
					local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end

		return false, 0
	end,
	activate_buff_on_grimoire_picked_up = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local local_player = is_local(owner_unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local adding_buff

		if buff_extension:has_buff_perk("skaven_grimoire") then
			adding_buff = true
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if not adding_buff and buff then
			if local_player then
				buff_extension:remove_buff(buff.id)
			else
				local server_id = buff.server_id

				buff_system:remove_server_controlled_buff(owner_unit, server_id)
			end
		elseif adding_buff and not buff then
			if local_player then
				buff_extension:add_buff(buff_to_add)
			else
				local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				local buff = buff_extension:get_non_stacking_buff(buff_to_add)

				if buff then
					buff.server_id = server_buff_id
				end
			end
		end
	end,
	activate_multiplier_on_disabled = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled() or status_extension:is_in_vortex()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if is_disabled then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_multiplier_on_wounded = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_wounded = status_extension:is_wounded()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if is_wounded then
			multiplier = activation_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_wounded = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus or 0
		local stat_buff_index = template.stat_buff
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_wounded = status_extension:is_wounded()
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if is_wounded then
			bonus = activation_bonus
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	bardin_slayer_passive_update = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local base_multiplier = template.base_multiplier
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local own_position = POSITION_LOOKUP[unit]
		local talent_extension = ScriptUnit.extension(unit, "talent_system")

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local bonus = 0

		if talent_extension:has_talent("bardin_slayer_increased_passive_bonus", "dwarf_ranger", true) then
			base_multiplier = base_multiplier * 1.5
		end

		if talent_extension:has_talent("bardin_slayer_increased_activation_number", "dwarf_ranger", true) then
			if num_alive_nearby_enemies <= 2 then
				bonus = base_multiplier
			end
		elseif num_alive_nearby_enemies == 1 then
			bonus = base_multiplier
		end

		buff.bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	bardin_slayer_activate_buff_on_loadout = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local melee_slot_data = inventory_extension:get_slot_data("slot_melee")
			local ranged_slot_data = inventory_extension:get_slot_data("slot_ranged")

			if melee_slot_data and ranged_slot_data then
				local template = buff.template
				local buff_type = template.buff_type
				local melee_slot_template = inventory_extension:get_item_template(melee_slot_data)
				local melee_slot_buff_type = melee_slot_template and melee_slot_template.buff_type
				local ranged_slot_template = inventory_extension:get_item_template(ranged_slot_data)
				local ranged_slot_buff_type = ranged_slot_template and ranged_slot_template.buff_type
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = template.buff_to_add
				local has_buff = buff_extension:has_buff_type(buff_to_add)

				ranged_slot_buff_type = ranged_slot_buff_type == "RANGED" and "MELEE_1H" or ranged_slot_buff_type

				local add_buff = melee_slot_buff_type == buff_type and ranged_slot_buff_type == buff_type

				if not has_buff then
					if add_buff then
						buff.added_buff_id = buff_system:add_buff(unit, buff_to_add, unit, true)
					end
				elseif buff.added_buff_id and not add_buff then
					buff_system:remove_server_controlled_buff(unit, buff.added_buff_id)

					buff.added_buff_id = nil
				else
					return
				end
			end
		end
	end,
	bardin_slayer_remove_activate_buff_on_loadout = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if Unit.alive(unit) then
			local template = buff.template
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add

			if buff_extension:has_buff_type(buff_to_add) and buff.added_buff_id then
				buff_system:remove_server_controlled_buff(unit, buff.added_buff_id)

				buff.added_buff_id = nil
			end
		end
	end,
	bardin_slayer_active_buff_on_charge_action = function (unit, buff, params)
		if Unit.alive(unit) then
			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
			local lh_weapon_unit, rh_weapon_unit = inventory_extension:get_all_weapon_unit()
			local lh_weapon_extension = lh_weapon_unit and ScriptUnit.has_extension(lh_weapon_unit, "weapon_system")
			local rh_weapon_extension = rh_weapon_unit and ScriptUnit.has_extension(rh_weapon_unit, "weapon_system")
			local add_buff_on_action_type

			if lh_weapon_extension then
				local has_action = lh_weapon_extension:has_current_action()

				if has_action then
					local current_action_settings = lh_weapon_extension:get_current_action_settings()

					add_buff_on_action_type = ActionUtils.is_melee_start_sub_action(current_action_settings)
				end
			end

			if not add_buff_on_action_type and rh_weapon_extension then
				local has_action = rh_weapon_extension:has_current_action()

				if has_action then
					local current_action_settings = rh_weapon_extension:get_current_action_settings()

					add_buff_on_action_type = ActionUtils.is_melee_start_sub_action(current_action_settings)
				end
			end

			if add_buff_on_action_type then
				local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
				local template = buff.template
				local buff_name = template.buff_to_add
				local has_buff = buff_extension:has_buff_type(buff_name)

				if not has_buff then
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
			end
		end
	end,
	activate_on_single_enemy = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local template = buff.template
		local range = buff.range
		local base_multiplier = template.multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local own_position = POSITION_LOOKUP[unit]

		table.clear(broadphase_results)

		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies do
			local enemy_unit = broadphase_results[i]

			if HEALTH_ALIVE[enemy_unit] then
				num_alive_nearby_enemies = num_alive_nearby_enemies + 1
			end
		end

		local multiplier = 0

		if num_alive_nearby_enemies == 1 then
			multiplier = base_multiplier
		end

		buff.multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if health_percent < activation_health and activate_below or activation_health < health_percent and not activate_below then
			bonus = activation_bonus
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_health_percent = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local activation_health = template.activation_health
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percent = health_extension:current_health_percent()
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if health_percent < activation_health and activate_below or activation_health < health_percent and not activate_below then
			multiplier = activation_multiplier
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_ammo_percent = function (unit, buff, params)
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local activation_ammo = template.activation_ammo
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
		local bonus = 0
		local slot_data = inventory_extension:get_slot_data("slot_ranged")

		if slot_data then
			local left_unit_1p = slot_data.left_unit_1p
			local right_unit_1p = slot_data.right_unit_1p
			local ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system") or ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system")
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_bonus = buff.previous_bonus or 0

			if ammo_percent < activation_ammo and activate_below or activation_ammo < ammo_percent and not activate_below then
				bonus = activation_bonus
			end
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_ammo_percent = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local activation_ammo = template.activation_ammo
		local activate_below = template.activate_below
		local stat_buff_index = template.stat_buff
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
		local multiplier = 0
		local slot_data = inventory_extension:get_slot_data("slot_ranged")

		if slot_data then
			local left_unit_1p = slot_data.left_unit_1p
			local right_unit_1p = slot_data.right_unit_1p
			local ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system") or ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system")
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_multiplier = buff.previous_multiplier or 0

			if ammo_percent < activation_ammo and activate_below or activation_ammo < ammo_percent and not activate_below then
				multiplier = activation_multiplier
			end
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_multiplier_on_grimoire_picked_up = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = 0

		if buff_extension:has_buff_perk("skaven_grimoire") then
			multiplier = activation_multiplier
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_bonus_on_grimoire_picked_up = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local activation_bonus = template.activation_bonus
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local bonus = 0

		if buff_extension:has_buff_perk("skaven_grimoire") then
			bonus = activation_bonus
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	update_multiplier_based_on_missing_health = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local base_multiplier = template.base_multiplier
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local multiplier = damage_taken * base_multiplier

		buff.multiplier = multiplier

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	sienna_unchained_activated_ability_pulse_remove = function (unit, buff, params)
		local world = Managers.world:world("level_world")

		if buff.targeting_effect_id then
			World.destroy_particles(world, buff.targeting_effect_id)

			buff.targeting_effect_id = nil
		end

		if buff.screenspace_effect_id then
			World.destroy_particles(world, buff.screenspace_effect_id)

			buff.screenspace_effect_id = nil
		end
	end,
	sienna_unchained_activated_ability_pulse_update = function (unit, buff, params)
		local template = buff.template
		local t = params.t
		local position = POSITION_LOOKUP[unit]
		local pulse_frequency = template.pulse_frequency
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if not buff_extension then
			return
		end

		if not buff.targeting_effect_id then
			local world = Managers.world:world("level_world")
			local first_person_effect_name = "fx/unchained_aura_talent_1p"
			local third_person_effect_name = "fx/unchained_aura_talent_3p"

			buff.targeting_effect_id = World.create_particles(world, third_person_effect_name, Vector3.zero())
			buff.targeting_variable_id = World.find_particles_variable(world, third_person_effect_name, "charge_radius")

			World.set_particles_variable(world, buff.targeting_effect_id, buff.targeting_variable_id, Vector3(12, 12, 0.2))

			local screenspace_effect_name = first_person_effect_name
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				buff.screenspace_effect_id = first_person_extension:create_screen_particles(screenspace_effect_name)
			end
		end

		if buff.targeting_effect_id then
			local world = Managers.world:world("level_world")

			World.move_particles(world, buff.targeting_effect_id, position)
		end

		if not buff.timer or t > buff.timer then
			if not Managers.state.network.is_server then
				return
			end

			local ai_system = Managers.state.entity:system("ai_system")
			local ai_broadphase = ai_system.broadphase
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")
			local range = 6

			table.clear(broadphase_results)

			local num_nearby_enemies = Broadphase.query(ai_broadphase, position, range, broadphase_results)
			local num_alive_nearby_enemies = 0

			for i = 1, num_nearby_enemies do
				local enemy_unit = broadphase_results[i]

				if HEALTH_ALIVE[enemy_unit] then
					local damage = 2
					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:add_buff(enemy_unit, "burning_dot_unchained_pulse", unit, false, 200, unit)
					DamageUtils.add_damage_network(enemy_unit, enemy_unit, damage, "torso", "burn_shotgun", nil, Vector3(0, 0, 0), nil, nil, unit)
				end
			end

			buff.timer = t + pulse_frequency
		end
	end,
	sienna_unchained_health_to_cooldown_update = function (unit, buff, params)
		local t = params.t
		local frequency = 0.25

		if not buff.timer or t >= buff.timer then
			buff.timer = t + frequency

			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension and career_extension:current_ability_cooldown_percentage() > 0 then
				career_extension:reduce_activated_ability_cooldown_percent(0.1)

				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local damage = health_extension:get_max_health() / 20

				DamageUtils.add_damage_network(unit, unit, damage, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, unit)
			end
		end
	end,
	victor_bountyhunter_activated_ability_railgun_delayed = function (unit, buff, params)
		if ALIVE[unit] then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier)
		end
	end,
	enter_sienna_unchained_activated_ability = function (unit, buff, params)
		local go_id = Managers.state.unit_storage:go_id(unit)
		local network_manager = Managers.state.network
		local game = network_manager:game()

		if not go_id or not game then
			return
		end

		local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local unit_pos = POSITION_LOOKUP[unit]
		local above = 2
		local below = 30
		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, unit_pos, above, below)

		projected_start_pos = projected_start_pos or GwNavQueries.inside_position_from_outside_position(nav_world, unit_pos, above, below, 2, 0.5)

		if projected_start_pos then
			local liquid_template_name = "sienna_unchained_ability_patch"
			local liquid_template_id = NetworkLookup.liquid_area_damage_templates[liquid_template_name]
			local owner_unit_go_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", owner_unit_go_id, projected_start_pos, aim_direction, liquid_template_id)
		end

		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_sienna_unchained", nil, true)
		end
	end,
	end_sienna_adept_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false, nil, "skill_adept")
			status_extension:set_noclip(false, "skill_adept")

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end
	end,
	sienna_adept_double_trail_talent_start_ability_cooldown_add = function (unit, buff, params)
		if ALIVE[unit] and not buff.aborted and is_local(unit) then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local buff_to_add = buff.template.buff_to_add

			buff_extension:add_buff(buff_to_add)
		end
	end,
	sienna_adept_double_trail_talent_start_ability_cooldown = function (unit, buff, params)
		if ALIVE[unit] and not buff._already_removed and is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_abilities_always_usable(false, "sienna_adept_ability_trail_double")
			career_extension:stop_ability("cooldown_triggered")
			career_extension:start_activated_ability_cooldown()
		end

		buff._already_removed = true
	end,
	end_sienna_unchained_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end
	end,
	apply_shade_activated_ability = function (unit, buff, params, world)
		local network_transmit = Managers.state.network.network_transmit
		local go_id = Managers.state.unit_storage:go_id(unit)
		local flow_id = NetworkLookup.flow_events.vfx_career_ability_start

		if Managers.state.network.is_server then
			if is_bot(unit) then
				Unit.flow_event(unit, "vfx_career_ability_start")
			end

			network_transmit:send_rpc_clients("rpc_flow_event", go_id, flow_id)
		else
			network_transmit:send_rpc_server("rpc_flow_event", go_id, flow_id)
		end

		local stealth_identifier = buff.template.stealth_identifier
		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension:set_noclip(true, stealth_identifier)
		status_extension:set_invisible(true, nil, stealth_identifier)

		if not is_bot(unit) then
			MOOD_BLACKBOARD[stealth_identifier] = true
		end
	end,
	on_apply_shade_dash_stealth = function (unit, buff, params, world)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(true, nil, "shade_dash")
			status_extension:set_noclip(true, "shade_dash")
		end
	end,
	on_remove_shade_dash_stealth = function (unit, buff, params, world)
		if is_local(unit) then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			status_extension:set_invisible(false, nil, "shade_dash")
			status_extension:set_noclip(false, "shade_dash")
		end
	end,
	kerillian_shade_noclip_on = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension then
				status_extension:set_noclip(true, "shade_phasing")
			end
		end
	end,
	kerillian_shade_noclip_off = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension then
				status_extension:set_noclip(false, "shade_phasing")
			end
		end
	end,
	kerillian_shade_missed_combo_window = function (owner_unit, buff, params)
		if ALIVE[owner_unit] and not buff.killed_target then
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local has_buff = buff_extension:get_buff_type("kerillian_shade_ult_invis")

			if has_buff then
				buff_extension:remove_buff(has_buff.id)
			end
		end
	end,
	on_shade_activated_ability_remove = function (unit, buff, params, world)
		if not ALIVE[unit] then
			return
		end

		if not is_local(unit) then
			return
		end

		local buff_template = buff.template
		local stealth_identifier = buff_template.stealth_identifier
		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension:set_invisible(false, nil, stealth_identifier)
		status_extension:set_noclip(false, stealth_identifier)

		local talent_extension = ScriptUnit.has_extension(unit, "talent_system")
		local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

		if not talent_extension or not buff_extension then
			return
		end

		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

		first_person_extension:play_hud_sound_event("Stop_career_ability_kerillian_shade_loop")
		first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit", nil, true)
		first_person_extension:play_remote_hud_sound_event("Stop_career_ability_kerillian_shade_loop_husk")

		if not is_bot(unit) then
			MOOD_BLACKBOARD[stealth_identifier] = false
		end

		local career_extension = ScriptUnit.extension(unit, "career_system")

		career_extension:set_state("default")
		status_extension:set_is_dodging(false)

		if buff_template.can_restealth_combo and talent_extension:has_talent("kerillian_shade_activated_stealth_combo") then
			buff_extension:add_buff("kerillian_shade_ult_invis_combo_blocker")
			buff_extension:add_buff("kerillian_shade_ult_invis")
		end

		if buff_template.can_restealth_on_remove and talent_extension:has_talent("kerillian_shade_activated_ability_restealth") then
			buff_extension:add_buff("kerillian_shade_activated_ability_restealth")

			local restealth_buffs = buff_extension:get_stacking_buff("kerillian_shade_activated_ability_restealth")
			local restealth_buff = restealth_buffs[1]
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local weapon_unit = inventory_extension:get_weapon_unit()
			local weapon_unit_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

			if weapon_unit_extension:has_current_action() then
				local current_action = weapon_unit_extension:get_current_action()
				local action_start_t = current_action.action_start_t

				restealth_buff.triggering_action_start_t = action_start_t
			end
		end

		if talent_extension:has_talent("kerillian_shade_activated_ability_phasing") then
			buff_extension:add_buff("kerillian_shade_phasing_buff")
			buff_extension:add_buff("kerillian_shade_movespeed_buff")
			buff_extension:add_buff("kerillian_shade_power_buff")
		end
	end,
	on_crit_passive_removed = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_template = buff.template
		local reference_buff_name = buff_template.reference_buff
		local reference_buff = buff_extension:get_non_stacking_buff(reference_buff_name)

		if reference_buff and reference_buff.buff_list then
			local amount_to_remove = #reference_buff.buff_list

			for i = 1, amount_to_remove do
				local buff_to_remove = table.remove(reference_buff.buff_list)

				if buff_to_remove then
					buff_extension:remove_buff(buff_to_remove)
				end
			end

			reference_buff.buff_list = {}
		end
	end,
	remove_invulnd_flash = function (unit, buff, params)
		if ALIVE[unit] then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			career_extension:set_activated_ability_cooldown_unpaused()
		end
	end,
	add_invulnd_flash = function (unit, buff, params)
		if ALIVE[unit] and Managers.player.is_server then
			StatusUtils.set_knocked_down_network(unit, false)
		end
	end,
	apply_huntsman_activated_ability = function (unit, buff, params)
		if is_husk(unit) then
			Unit.flow_event(unit, "vfx_career_ability_start")
		end

		if is_local(unit) then
			local status_extension = ScriptUnit.has_extension(unit, "status_system")

			status_extension:set_invisible(true, nil, "huntsman_ability")
		end
	end,
	end_huntsman_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false, nil, "huntsman_ability")

			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")
			first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit", nil, true)
			first_person_extension:play_remote_hud_sound_event("Stop_career_ability_markus_huntsman_loop_husk")

			if not is_bot(unit) then
				MOOD_BLACKBOARD.skill_huntsman_surge = false
				MOOD_BLACKBOARD.skill_huntsman_stealth = false
			end
		end
	end,
	end_slayer_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_noclip(false, "skill_slayer")
			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_slayer_exit", nil, true)
			first_person_extension:play_hud_sound_event("Stop_career_ability_bardin_slayer_loop")
			career_extension:set_state("default")

			if not is_bot(unit) then
				MOOD_BLACKBOARD.skill_slayer = false
			end
		end
	end,
	add_victor_zealot_invulnerability_cooldown = function (unit, buff, params)
		local player_unit = unit
		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if Unit.alive(player_unit) then
			buff_extension:add_buff("victor_zealot_invulnerability_cooldown")
		end
	end,
	end_zealot_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_noclip(false, "skill_zealot")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_victor_zealot_exit", unit, 0)
			career_extension:set_state("default")

			if not is_bot(unit) then
				first_person_extension:play_hud_sound_event("Play_career_ability_victor_zealot_exit")
				first_person_extension:play_hud_sound_event("Stop_career_ability_victor_zealot_loop")

				MOOD_BLACKBOARD.skill_zealot = false
			end
		end
	end,
	bardin_ironbreaker_stacking_buff_gromril = function (unit, buff, params)
		local template = buff.template
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local activation_buff = template.activation_buff
		local has_buff = buff_extension:get_non_stacking_buff(activation_buff)

		if has_buff then
			buff.buff_ids = buff.buff_ids or {}

			local num_stacks = #buff.buff_ids

			if num_stacks < template.max_sub_buff_stacks then
				local buff_to_add = template.buff_to_add
				local stack_buff_id = buff_extension:add_buff(buff_to_add)

				buff.buff_ids[num_stacks + 1] = stack_buff_id
			end
		end
	end,
	update_bardin_ironbreaker_activated_ability = function (unit, buff, params)
		local time_between_vo = 3

		if is_local(unit) then
			if not params.next_vo_time then
				params.next_vo_time = params.t + time_between_vo
			elseif params.t >= params.next_vo_time then
				params.next_vo_time = params.t + time_between_vo

				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_networked_dialogue_event("activate_ability_taunt", event_data)
			end
		end
	end,
	end_bardin_ironbreaker_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			params.next_vo_time = nil

			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ironbreaker_exit")
			first_person_extension:play_remote_unit_sound_event("Play_career_ability_bardin_ironbreaker_exit", unit, 0)
		end
	end,
	play_sound_synced = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return false
		end

		if is_local(owner_unit) then
			local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
			local sound_to_play = buff.template.sound_to_play

			first_person_extension:play_hud_sound_event(sound_to_play, nil, true)
		end
	end,
	ranger_activated_ability_buff = function (owner_unit, buff, params)
		if is_local(owner_unit) then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:set_invisible(true, nil, buff)
		end
	end,
	ranger_activated_ability_buff_remove = function (owner_unit, buff, params)
		if is_local(owner_unit) then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			status_extension:set_invisible(false, nil, buff)
		end
	end,
	bardin_ranger_smoke_buff = function (owner_unit, buff, params)
		local template = buff.template
		local smoke_location = POSITION_LOOKUP[buff.area_buff_unit]

		if not smoke_location then
			return
		end

		local side = Managers.state.side.side_by_unit[owner_unit]

		if not side then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local range = template.area_radius
		local range_squared = range * range
		local buff_to_add = template.smoke_buff
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

		for i = 1, #player_and_bot_units do
			local unit = player_and_bot_units[i]

			if ALIVE[unit] then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(unit_position, smoke_location)

				if distance_squared < range_squared then
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					if not buff_extension:has_buff_type(buff_to_add) then
						local player = Managers.player:owner(unit)
						local peer_id = player.peer_id

						buff_system:add_buff_synced(unit, buff_to_add, template.buff_sync_type, nil, peer_id)
					end
				end
			end
		end
	end,
	bardin_ranger_heal_smoke = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0

		if next_heal_tick < t and HEALTH_ALIVE[unit] then
			local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

			if talent_extension then
				local status_extension = ScriptUnit.has_extension(unit, "status_system")

				if not status_extension then
					return
				end

				local heal_amount = buff_template.heal_amount

				if not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
					DamageUtils.heal_network(unit, unit, heal_amount, "heal_from_proc")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	update_server_buff_on_health_percent = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")

			if health_extension then
				local max_health = health_extension:get_max_health()
				local health_threshold = buff.template.threshold
				local current_health = health_extension:current_health()
				local buff_to_add = buff.template.buff_to_add

				if current_health >= max_health * buff.template.health_threshold and not buff.has_buff then
					local buff_system = Managers.state.entity:system("buff_system")

					buff.has_buff = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
				elseif current_health < max_health * buff.template.health_threshold and buff.has_buff then
					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:remove_server_controlled_buff(owner_unit, buff.has_buff)

					buff.has_buff = nil
				end
			end
		end
	end,
	remove_server_buff_on_health_percent = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] and buff.has_buff then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:remove_server_controlled_buff(owner_unit, buff.has_buff)

			buff.has_buff = nil
		end
	end,
	start_maidenguard_activated_ability = function (unit, buff, params)
		if is_local(unit) and not is_bot(unit) then
			local fov_multiplier = 0.8
			local lerp_time = 0.2

			Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
		end
	end,
	end_maidenguard_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false, nil, "skill_maiden_guard")
			status_extension:set_noclip(false, "skill_maiden_guard")

			if not is_bot(unit) then
				local fov_multiplier = 1
				local lerp_time = 0.5

				Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)

				MOOD_BLACKBOARD.skill_maiden_guard = false
			end

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			if Managers.state.network:game() then
				local status_extension = ScriptUnit.extension(unit, "status_system")

				status_extension:set_is_dodging(false)

				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.dodging, false, unit_id, 0)
			end
		end
	end,
	end_knight_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_noclip(false, "skill_knight")
		end
	end,
	start_activated_ability_cooldown = function (unit, buff, params)
		if is_local(unit) and buff.attacker_unit == unit then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:start_activated_ability_cooldown()
		end
	end,
	update_bonus_based_on_missing_health_chunks = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local min_bonus = template.min_bonus
		local max_bonus = template.max_bonus
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_bonus = buff.previous_bonus or 0
		local num_chunks = math.floor(damage_taken / chunk_size)
		local bonus = num_chunks * min_bonus

		if max_bonus < bonus then
			bonus = max_bonus
		end

		buff.bonus = bonus

		if stat_buff_index and previous_bonus ~= bonus then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_bonus = bonus
	end,
	update_multiplier_based_on_missing_health_chunks = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local min_multiplier = template.min_multiplier
		local max_multiplier = template.max_multiplier
		local chunk_size = template.chunk_size
		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local num_chunks = math.floor(damage_taken / chunk_size)
		local multiplier = num_chunks * min_multiplier

		if max_multiplier < multiplier then
			multiplier = max_multiplier
		end

		buff.multiplier = multiplier

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	update_bonus_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local min_bonus = template.min_bonus
			local max_bonus = template.max_bonus
			local chunk_size = template.chunk_size
			local stat_buff_index = template.stat_buff
			local previous_bonus = buff.previous_bonus or 0
			local num_chunks = math.floor(overcharge / chunk_size)
			local bonus = num_chunks * min_bonus

			if max_bonus < bonus then
				bonus = max_bonus
			end

			buff.bonus = bonus

			if stat_buff_index and previous_bonus ~= bonus then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local difference = bonus - previous_bonus

				buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
			end

			buff.previous_bonus = bonus
		end
	end,
	apply_grenade_slow = function (unit, buff, params)
		if Managers.state.network.is_server then
			local ext = ScriptUnit.extension(unit, "ai_navigation_system")
			local id = ext:add_movement_modifier(0.2)

			buff.movement_modifier_id = id
		end
	end,
	remove_grenade_slow = function (unit, buff, params)
		if Managers.state.network.is_server then
			local ext = ScriptUnit.extension(unit, "ai_navigation_system")

			ext:remove_movement_modifier(buff.movement_modifier_id)
		end
	end,
	activate_bonus_based_on_low_health = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local template = buff.template
		local damage_taken = health_extension:get_damage_taken()
		local max_health = health_extension:get_max_health()
		local activation_health = template.activation_health
		local multiplier = 0

		if max_health - damage_taken < activation_health * max_health then
			multiplier = template.multiplier
		end

		local stat_buff_index = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0

		if stat_buff_index and previous_multiplier ~= multiplier then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference, template.name)
		end

		buff.previous_multiplier = multiplier
	end,
	reduce_cooldown_percent = function (unit, buff, params)
		local career_extension = ScriptUnit.has_extension(unit, "career_system")

		if career_extension then
			local cooldown_amount = buff.template.cooldown_amount

			career_extension:reduce_activated_ability_cooldown_percent(cooldown_amount)
		end
	end,
	apply_volume_dot_damage = function (unit, buff, params)
		buff.next_damage_time = params.t + params.bonus.time_between_damage
	end,
	update_volume_dot_damage = function (unit, buff, params)
		if buff.next_damage_time < params.t and HEALTH_ALIVE[unit] then
			buff.next_damage_time = buff.next_damage_time + params.bonus.time_between_damage

			local damage = DamageUtils.calculate_damage(params.bonus.damage, unit, params.attacker_unit, "full", 1)

			DamageUtils.add_damage_network(unit, params.attacker_unit, damage, "full", buff.template.damage_type, nil, Vector3(1, 0, 0))
		end
	end,
	apply_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)

		movement_settings.move_speed = movement_settings.move_speed * params.multiplier
	end,
	remove_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)

		movement_settings.move_speed = movement_settings.move_speed / params.multiplier
	end,
	apply_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
			buff.next_damage_t = 0
		end
	end,
	update_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
			local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
			local flat_velocity = Vector3.flat(locomotion_extension:current_velocity())
			local length = Vector3.length(flat_velocity)

			if length > 0.5 and buff.next_damage_t < params.t and HEALTH_ALIVE[unit] then
				local template = buff.template
				local damage_type = template.damage_type
				local damage = template.damage

				DamageUtils.add_damage_network(unit, unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), "buff")

				buff.next_damage_t = params.t + template.damage_frequency
			end
		end
	end,
	remove_speed_scaled_dot_buff = function (unit, buff, params)
		if is_local(unit) then
			-- Nothing
		end
	end,
	apply_twitch_invisibility_buff = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(true, nil, "twitch_invis")
			status_extension:set_noclip(true, "twitch_invis")

			if not is_bot(unit) then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter_small")

				MOOD_BLACKBOARD.twitch_invis = true
			end
		end
	end,
	update_twitch_invisibility_buff = function (unit, buff, params)
		return
	end,
	remove_twitch_invisibility_buff = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local removing_stealth = status_extension:set_invisible(false, nil, "twitch_invis")

			status_extension:set_noclip(false, "twitch_invis")

			if not is_bot(unit) then
				MOOD_BLACKBOARD.twitch_invis = false
			end
		end
	end,
	apply_twitch_infinite_bombs = function (unit, buff, params)
		return
	end,
	update_twitch_infinite_bombs = function (unit, buff, params)
		if is_local(unit) then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local pickup_settings = AllPickups.frag_grenade_t1
			local slot_name = pickup_settings.slot_name
			local item_name = pickup_settings.item_name
			local slot_data = inventory_extension:get_slot_data(slot_name)
			local equipped_item_data = slot_data and slot_data.item_data
			local item_data = ItemMasterList[item_name]
			local add_equipment = not slot_data or equipped_item_data.name ~= item_name

			if add_equipment then
				local extra_extension_init_data = {}

				if slot_data then
					inventory_extension:destroy_slot(slot_name)
					inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)
				else
					inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)
				end
			end

			local additional_item_granted

			repeat
				additional_item_granted = inventory_extension:store_additional_item(slot_name, item_data)
			until not additional_item_granted

			if add_equipment then
				local go_id = Managers.state.unit_storage:go_id(unit)
				local slot_id = NetworkLookup.equipment_slots[slot_name]
				local item_id = NetworkLookup.item_names[item_name]
				local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

				if is_server() then
					network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
				else
					network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
				end

				local wielded_slot_name = inventory_extension:get_wielded_slot_name()

				if wielded_slot_name == slot_name then
					CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
					CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
					inventory_extension:wield(slot_name)
				end
			end
		end
	end,
	remove_twitch_infinite_bombs = function (unit, buff, params)
		return
	end,
	apply_twitch_invincibility = function (unit, buff, params)
		if is_server() and Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			health_extension.is_invincible = true
		end
	end,
	remove_twitch_invincibility = function (unit, buff, params)
		if is_server() and Unit.alive(unit) then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			health_extension.is_invincible = false
		end
	end,
	apply_twitch_pulsating_waves = function (unit, buff, params)
		buff.next_pulse_t = params.t
	end,
	update_twitch_pulsating_waves = function (unit, buff, params, world)
		if is_server() and Unit.alive(unit) then
			local t = params.t

			if t > buff.next_pulse_t then
				local damage_source = "grenade_frag_01"
				local explosion_template = ExplosionTemplates.twitch_pulse_explosion
				local explosion_position = POSITION_LOOKUP[unit]

				DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, false)

				local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
				local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
				local damage_source_id = NetworkLookup.damage_sources[damage_source]

				Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false)

				buff.next_pulse_t = t + 2
			end
		end
	end,
	add_modify_ability_max_cooldown = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:modify_max_cooldown(1, 0, buff.template.multiplier)
		end
	end,
	remove_modify_ability_max_cooldown = function (unit, buff, params)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:modify_max_cooldown(1, 0, -buff.template.multiplier)
		end
	end,
	refresh_ranged_slot_buffs = function (unit, buff, params)
		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		if inventory_extension then
			local ranged_slot_data = inventory_extension:get_slot_data("slot_ranged")

			if ranged_slot_data then
				local left_hand_unit = ranged_slot_data.left_unit_1p
				local right_hand_unit = ranged_slot_data.right_unit_1p
				local left_hand_ammo_extension = ScriptUnit.has_extension(left_hand_unit, "ammo_system")

				if left_hand_ammo_extension then
					left_hand_ammo_extension:refresh_buffs()
				end

				local right_hand_ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system")

				if right_hand_ammo_extension then
					right_hand_ammo_extension:refresh_buffs()
				end
			end
		end
	end,
	remove_controlled_unit = function (unit, buff, params)
		if buff.removed_controlled_unit then
			return
		end

		local commander_unit = buff.source_attacker_unit
		local commander_extension = ScriptUnit.extension(commander_unit, "ai_commander_system")
		local skip_sync = true
		local skip_buff_removal = true

		commander_extension:remove_controlled_unit(unit, skip_sync, skip_buff_removal)
	end,
	sienna_scholar_vent_zone_update = function (owner_unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_stacks = buff_extension:get_stacking_buff(buff_to_add)
		local num_buffs = buff_stacks and #buff_stacks or 0
		local sienna_side = Managers.state.side.side_by_unit[owner_unit]
		local ally_categories = sienna_side.enemy_broadphase_categories
		local position = POSITION_LOOKUP[owner_unit]
		local radius = template.radius
		local result_table = FrameTable.alloc_table()
		local num_hits = AiUtils.broadphase_query(position, radius, result_table, ally_categories)

		if num_buffs < num_hits then
			for i = num_buffs + 1, num_hits do
				buff_extension:add_buff(buff_to_add)
			end
		elseif num_hits < num_buffs then
			for i = 1, num_buffs - num_hits do
				local last_buff = buff_stacks[num_buffs - i + 1]

				buff_extension:remove_buff(last_buff.id)
			end
		end
	end,
}

BuffFunctionTemplates.functions.update_charging_action_lerp_movement_buff = function (unit, buff, params)
	local multiplier = params.multiplier
	local time_into_buff = params.time_into_buff
	local old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting
	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	multiplier = multiplier and 1 - buff_extension:apply_buffs_to_value(1 - multiplier, "increased_move_speed_while_aiming")

	local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

	if multiplier then
		local new_multiplier = math.lerp(1, multiplier, percentage_in_lerp)
		local difference = new_multiplier - buff.current_lerped_multiplier

		if math.abs(difference) > 0.001 then
			old_multiplier_to_update_movement_setting = buff.current_lerped_multiplier
			buff.current_lerped_multiplier = new_multiplier
			multiplier_to_update_movement_setting = new_multiplier
		end
	end

	if multiplier_to_update_movement_setting then
		if buff.has_added_movement_previous_turn then
			buff_extension_function_params.value = old_value_to_update_movement_setting
			buff_extension_function_params.multiplier = old_multiplier_to_update_movement_setting

			BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, buff_extension_function_params)
		end

		buff.has_added_movement_previous_turn = true
		buff_extension_function_params.multiplier = multiplier_to_update_movement_setting

		BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, buff_extension_function_params)
	end
end

BuffFunctionTemplates.functions.ai_update_max_health = function (unit, buff, params)
	if is_server() then
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local health_extension = ScriptUnit.has_extension(unit, "health_system")

		if buff_extension and health_extension then
			local base_health = health_extension.unmodified_max_health
			local max_health = math.max(buff_extension:apply_buffs_to_value(base_health, "max_health"), 0.25)

			health_extension:set_max_health(max_health)
		end
	end
end, DLCUtils.merge("buff_function_templates", BuffFunctionTemplates.functions)
