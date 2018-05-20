BuffFunctionTemplates = BuffFunctionTemplates or {}

local function get_variable(path_to_movement_setting_to_modify, unit)
	assert(#path_to_movement_setting_to_modify > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

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
		assert(orginal_variable_exists, "variable does not exist in PlayerUnitMovementSettings")
	end
end

local function set_variable(path_to_movement_setting_to_modify, unit, value)
	local nr_of_settings = #path_to_movement_setting_to_modify

	assert(nr_of_settings > 0, "movement_setting_exists needs at least a movement_setting_to_modify")

	local unit_movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
	local movement_value = unit_movement_settings_table
	local index = 1

	while nr_of_settings >= index do
		if nr_of_settings < index + 1 then
			movement_value[path_to_movement_setting_to_modify[index]] = value
		else
			movement_value = movement_value[path_to_movement_setting_to_modify[index]]
		end

		index = index + 1
	end
end

local params = {}
local clearable_params = {}
local broadphase_results = {}

local function dprintf(text, ...)
	if script_data.buff_debug then
		printf(text, ...)
	end
end

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
	local is_husk = (player and (player.remote or player.bot_player)) or false

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
		local old_value_to_update_movement_setting, value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil
		local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

		if bonus then
			local new_value = math.lerp(0, bonus, percentage_in_lerp)
			old_value_to_update_movement_setting = buff.current_lerped_value
			buff.current_lerped_value = new_value
			value_to_update_movement_setting = new_value
		end

		if multiplier then
			local player = Managers.player:owner(unit)

			if player and player.boon_handler then
				local boon_handler = player.boon_handler
				local num_increased_combat_movement_boons = boon_handler:get_num_boons("increased_combat_movement")
				local boon_template = BoonTemplates.increased_combat_movement

				if num_increased_combat_movement_boons > 0 then
					multiplier = multiplier + (1 - multiplier) * num_increased_combat_movement_boons * boon_template.multiplier
				end
			end

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
		local value_to_update_movement_setting, old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil

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
	knock_down_bleed_start = function (unit, buff, params)
		buff.next_damage_time = params.t + buff.template.time_between_damage
	end,
	knock_down_bleed_update = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local buff_template = buff.template
			buff.next_damage_time = buff.next_damage_time + buff_template.time_between_damage
			local damage = buff_template.damage
			local damage_type = buff_template.damage_type

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, Vector3(1, 0, 0), "knockdown_bleed")
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

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, Vector3(1, 0, 0), "temporary_health_degen")
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

			DamageUtils.add_damage_network(unit, unit, damage, "full", damage_type, Vector3(1, 0, 0), "health_degen")
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
			local player_and_bot_units = PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units, 1 do
				DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, heal_type)
			end
		end
	end,
	start_dot_damage = function (unit, buff, params)
		local random_mod_next_dot_time = 0.75 * buff.template.time_between_dot_damages + math.random() * 0.5 * buff.template.time_between_dot_damages
		buff.next_poison_damage_time = params.t + random_mod_next_dot_time

		if buff.template.start_flow_event then
			Unit.flow_event(unit, buff.template.start_flow_event)
		end

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
		if not Managers.state.network.is_server then
			return
		end

		local t = params.t

		if buff.next_poison_damage_time < t then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			if health_extension:is_alive() then
				local buff_template = buff.template
				local random_mod_next_dot_time = 0.75 * buff.template.time_between_dot_damages + math.random() * 0.5 * buff.template.time_between_dot_damages
				buff.next_poison_damage_time = buff.next_poison_damage_time + random_mod_next_dot_time

				if Unit.alive(params.attacker_unit) then
					local attacker_unit = params.attacker_unit
					local target_unit = unit
					local hit_zone_name = buff.template.hit_zone or "full"
					local attack_direction = Vector3.down()
					local hit_ragdoll_actor = nil
					local damage_source = buff.damage_source or "dot_debuff"
					local power_level = buff.power_level or DefaultPowerLevel
					local damage_profile_name = buff_template.damage_profile or "default"
					local damage_profile = DamageProfileTemplates[damage_profile_name]
					local target_index = nil
					local boost_curve_multiplier = 0
					local is_critical_strike = false
					local can_damage = true
					local can_stagger = false
					local blocking = false
					local shield_breaking_hit = false
					local backstab_multiplier = nil

					DamageUtils.server_apply_hit(t, attacker_unit, target_unit, hit_zone_name, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier)
				end
			end
		end
	end,
	remove_dot_damage = function (unit, buff, params)
		local end_flow_event = buff.template.end_flow_event

		if end_flow_event then
			Unit.flow_event(unit, end_flow_event)
		end

		if not AiUtils.unit_alive(unit) then
			local death_flow_event = buff.template.death_flow_event

			if death_flow_event then
				Unit.flow_event(unit, death_flow_event)
			end
		end
	end,
	start_dot_damage_globadier_gas = function (unit, buff, params, world)
		buff.next_poison_damage_time = params.t + buff.template.time_between_dot_damages
		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension:modify_poison(true, params.attacker_unit)
	end,
	remove_dot_damage_globadier_gas = function (unit, buff, params, world)
		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension:modify_poison(false)
	end,
	apply_dot_damage_globadier_gas = function (unit, buff, params, world)
		return
	end,
	apply_moving_through_vomit = function (unit, buff, params, world)
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local buff_template = buff.template
		local damage = buff_template.difficulty_damage[difficulty_name]
		buff.damage = damage
		local breed = Unit.get_data(unit, "breed")
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

			if liquid_extension then
				local source_unit = liquid_extension._source_unit
				local source_breed = Unit.alive(source_unit) and Unit.get_data(source_unit, "breed")
				buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			end
		end

		buff.vomit_next_t = params.t + 0
	end,
	update_moving_through_vomit = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
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

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
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
		local buff_template = buff.template
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.nurgle_particle_id_01 = first_person_extension:create_screen_particles("fx/screenspace_nurgle_explosion_01")
			buff.nurgle_particle_id_02 = first_person_extension:create_screen_particles("fx/screenspace_nurgle_explosion_02")
		end
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.plague_wave_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plague_wave_01")
			buff.plague_wave_particle_id = first_person_extension:create_screen_particles("fx/screenspace_plauge_wave_02")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
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
	update_vermintide_in_face = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
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

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_vomit")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vomit_opaque_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_opaque")
			buff.vomit_particle_id = first_person_extension:create_screen_particles("fx/screenspace_vomit_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_puke")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
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
	update_vomit_in_face = function (unit, buff, params, world)
		local t = params.t
		local vomit_next_t = buff.vomit_next_t
		local buff_template = buff.template

		if vomit_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
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

			buff.vomit_next_t = t + buff_template.time_between_dot_damages
		end
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.vortex_particle_id = first_person_extension:create_screen_particles("fx/screenspace_poison_globe_impact")
		end

		buff.vortex_next_t = params.t
	end,
	update_vortex = function (unit, buff, params, world)
		local t = params.t
		local vortex_next_t = buff.vortex_next_t
		local buff_template = buff.template

		if vortex_next_t < t then
			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
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

			buff.vortex_next_t = t + buff_template.time_between_dot_damages
		end
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_onfeet")
		end

		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local liquid_extension = ScriptUnit.extension(attacker_unit, "area_damage_system")
			local source_unit = liquid_extension._source_unit
			local source_breed = Unit.alive(source_unit) and Unit.get_data(source_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
		end

		buff.warpfire_next_t = params.t + buff_template.time_between_dot_damages
	end,
	update_moving_through_warpfire = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
	end,
	update_heal_ticks = function (unit, buff, params, world)
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

				if health_extension:is_alive() then
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

				if health_extension:is_alive() then
					DamageUtils.heal_network(unit, unit, heal_amount, "buff")
				end
			end

			buff.next_heal_tick = t + buff_template.time_between_heals
		end
	end,
	update_kerillian_waywatcher_regen = function (unit, buff, params, world)
		local t = params.t
		local buff_template = buff.template
		local next_heal_tick = buff.next_heal_tick or 0
		local regen_cap = 0.5

		if next_heal_tick < t and Unit.alive(unit) then
			local talent_extension = ScriptUnit.extension(unit, "talent_system")

			if talent_extension:has_talent("kerillian_waywatcher_regenerate_ammunition", "wood_elf", true) then
				local weapon_slot = "slot_ranged"
				local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(weapon_slot)

				if slot_data then
					local right_unit_1p = slot_data.right_unit_1p
					local left_unit_1p = slot_data.left_unit_1p
					local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
					local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
					local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

					if ammo_extension then
						local ammo_bonus_fraction = 0.04
						local ammo_amount = math.max(math.round(ammo_extension:get_max_ammo() * ammo_bonus_fraction), 1)

						ammo_extension:add_ammo_to_reserve(ammo_amount)
					end
				end
			end

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local heal_amount = buff_template.heal_amount

				if health_extension:is_alive() and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
					if talent_extension:has_talent("kerillian_waywatcher_group_regen", "wood_elf", true) then
						heal_amount = heal_amount * 0.5
						local player_and_bot_units = PLAYER_AND_BOT_UNITS

						for i = 1, #player_and_bot_units, 1 do
							if Unit.alive(player_and_bot_units[i]) then
								local health_extension = ScriptUnit.extension(player_and_bot_units[i], "health_system")
								local status_extension = ScriptUnit.extension(player_and_bot_units[i], "status_system")

								if health_extension:current_permanent_health_percent() <= regen_cap and not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() and health_extension:is_alive() then
									DamageUtils.heal_network(player_and_bot_units[i], unit, heal_amount, "career_passive")
								end
							end
						end
					elseif health_extension:current_permanent_health_percent() <= regen_cap then
						if talent_extension:has_talent("kerillian_waywatcher_improved_regen", "wood_elf", true) then
							heal_amount = heal_amount * 1.5
						end

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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_flamethrower_01")
			buff.warpfire_particle_id_2 = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit
		local distance = 0

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
			local victim_position = POSITION_LOOKUP[unit]
			local attacker_position = POSITION_LOOKUP[attacker_unit]
			local to_victim = victim_position - attacker_position
			pushed_direction = Vector3.normalize(to_victim)
			distance = Vector3.length(to_victim)
		else
			pushed_direction = Vector3.backward()
		end

		if not breed and first_person_extension then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local no_ranged_knockback = buff_extension and buff_extension:has_buff_perk("no_ranged_knockback")

			if not no_ranged_knockback then
				local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
				local push_speed = buff_template.push_speed
				local pushed_velocity = pushed_direction * math.max(0, push_speed - distance)

				locomotion_extension:add_external_velocity(pushed_velocity)
			end
		end

		buff.warpfire_next_t = params.t
	end,
	update_warpfirethrower_in_face = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
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
		buff.armor_type = (breed and (breed.armor_category or 1)) or 4
		local owner = Managers.player:owner(unit)
		local is_husk = owner.remote or owner.bot_player or false

		if is_husk then
			Unit.flow_event(unit, "impact_warpfire")
		end

		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		if first_person_extension then
			buff.warpfire_particle_id = first_person_extension:create_screen_particles("fx/screenspace_warpfire_hit_inface")

			first_person_extension:play_hud_sound_event("Play_player_hit_warpfire_thrower")
		end

		local pushed_direction = nil
		local attacker_unit = params.attacker_unit

		if Unit.alive(attacker_unit) then
			local source_breed = Unit.get_data(attacker_unit, "breed")
			buff.damage_source = (source_breed and source_breed.name) or "dot_debuff"
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

		buff.warpfire_next_t = params.t
	end,
	update_warpfire_in_face = function (unit, buff, params, world)
		local t = params.t
		local warpfire_next_t = buff.warpfire_next_t

		if warpfire_next_t < t then
			local buff_template = buff.template

			if Managers.state.network.is_server then
				local health_extension = ScriptUnit.extension(unit, "health_system")

				if health_extension:is_alive() then
					local attacker_unit = (Unit.alive(params.attacker_unit) and params.attacker_unit) or unit
					local armor_type = buff.armor_type
					local damage_type = buff_template.damage_type
					local damage = buff.damage[armor_type]
					local damage_source = buff.damage_source

					DamageUtils.add_damage_network(unit, attacker_unit, damage, "torso", damage_type, Vector3(1, 0, 0), damage_source)
				end
			end

			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:play_hud_sound_event("Play_player_damage_puke")
			end

			buff.warpfire_next_t = t + buff_template.time_between_dot_damages
		end
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

			for i = 1, num_enemies, 1 do
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

				for i = 1, num_enemies, 1 do
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

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = Unit.alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = Unit.alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_buff_stacks_based_on_enemy_proximity = function (unit, buff, params)
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_broadphase = ai_system.broadphase
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local range = buff.range
		local chunk_size = template.chunk_size
		local buff_to_add = template.buff_to_add
		local max_stacks = 5
		local own_position = POSITION_LOOKUP[unit]
		local num_nearby_enemies = Broadphase.query(ai_broadphase, own_position, range, broadphase_results)
		local num_alive_nearby_enemies = 0

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = Unit.alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
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

			for i = 1, difference, 1 do
				local buff_id = buff_extension:add_buff(buff_to_add)
				local stack_ids = buff.stack_ids
				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_extension:remove_buff(buff_id)
			end
		end
	end,
	activate_buff_stacks_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local chunk_size = template.chunk_size
			local buff_to_add = template.buff_to_add
			local max_stacks = 5

			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			local num_chunks = math.min(math.floor(overcharge / chunk_size), max_stacks)
			local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

			if num_buff_stacks < num_chunks then
				local difference = num_chunks - num_buff_stacks

				for i = 1, difference, 1 do
					local buff_id = buff_extension:add_buff(buff_to_add)
					local stack_ids = buff.stack_ids
					stack_ids[#stack_ids + 1] = buff_id
				end
			elseif num_chunks < num_buff_stacks then
				local difference = num_buff_stacks - num_chunks

				for i = 1, difference, 1 do
					local stack_ids = buff.stack_ids
					local buff_id = table.remove(stack_ids, 1)

					buff_extension:remove_buff(buff_id)
				end
			end
		end
	end,
	activate_buff_stacks_based_on_health_chunks = function (unit, buff, params)
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local damage_taken = health_extension:get_damage_taken()
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local max_stacks = 5
		local chunk_size = template.chunk_size
		local current_health = health_extension:current_health()

		if not buff.stack_ids then
			buff.stack_ids = {}
		end

		local health_chunks = math.floor(current_health / chunk_size)
		local num_chunks = math.max(0, max_stacks - health_chunks)
		local num_buff_stacks = buff_extension:num_buff_type(buff_to_add)

		if num_buff_stacks < num_chunks then
			local difference = num_chunks - num_buff_stacks

			for i = 1, difference, 1 do
				local buff_id = buff_extension:add_buff(buff_to_add)
				local stack_ids = buff.stack_ids
				stack_ids[#stack_ids + 1] = buff_id
			end
		elseif num_chunks < num_buff_stacks then
			local difference = num_buff_stacks - num_chunks

			for i = 1, difference, 1 do
				local stack_ids = buff.stack_ids
				local buff_id = table.remove(stack_ids, 1)

				buff_extension:remove_buff(buff_id)
			end
		end
	end,
	activate_buff_on_distance = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local owner_unit = unit
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[unit]
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_units, 1 do
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
	activate_buff_on_closest = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local owner_unit = unit
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[unit]
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local closest_player = nil

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				if closest_player_distance < distance_squared then
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
	markus_knight_proximity_buff_update = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local owner_unit = unit
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[unit]
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
		local buff_to_add = "markus_knight_passive_defence_aura"
		local buff_to_add_2 = nil
		local buff_system = Managers.state.entity:system("buff_system")

		if talent_extension:has_talent("markus_knight_passive_stamina_aura", "empire_soldier", true) then
			buff_to_add_2 = "markus_knight_passive_stamina_aura"
		elseif talent_extension:has_talent("markus_knight_passive_movement_speed_aura", "empire_soldier", true) then
			buff_to_add_2 = "markus_knight_passive_movement_speed_aura"
		elseif talent_extension:has_talent("markus_knight_improved_passive_defence_aura", "empire_soldier", true) then
			buff_to_add_2 = "markus_knight_improved_passive_defence_aura"
		end

		for i = 1, num_units, 1 do
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
	kerillian_maidenguard_proximity_buff_update = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local owner_unit = unit
		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[unit]
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = "kerillian_maidenguard_passive_stamina_regen_buff"
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_units, 1 do
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
	activate_buff_on_other_buff = function (unit, buff, params)
		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local activation_buff = template.activation_buff
		local activate_on_missing = template.activate_on_missing
		local has_buff = buff_extension:get_non_stacking_buff(activation_buff)
		local apply_buff = (has_buff and not activate_on_missing) or (not has_buff and activate_on_missing)
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
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit = nil
		local targets = {}

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
	end,
	activate_multiplier_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local activation_multiplier = template.activation_multiplier
		local stat_buff_index = template.stat_buff
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local owner_unit = nil
		local targets = {}

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	activate_buff_on_last_standing = function (unit, buff, params)
		local template = buff.template
		local player_and_bot_units = PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local owner_unit = unit
		local targets = {}
		local local_player = is_local(owner_unit)

		for i = 1, num_units, 1 do
			local unit = player_and_bot_units[i]
			targets[#targets + 1] = unit
		end

		local disabled_allies = {}

		for i = 1, #targets, 1 do
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

		local adding_buff = nil

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
		local adding_buff = nil

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
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
		local adding_buff = nil

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
			local adding_buff = nil

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
		local adding_buff = nil

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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = Unit.alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_bonus = bonus
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

		for i = 1, num_nearby_enemies, 1 do
			local enemy_unit = broadphase_results[i]
			local alive = Unit.alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive()

			if alive then
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
			bonus = activation_bonus
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

		if (health_percent < activation_health and activate_below) or (activation_health < health_percent and not activate_below) then
			multiplier = activation_multiplier
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
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
			local ammo_extension = (ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system")) or (ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system"))
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_bonus = buff.previous_bonus or 0

			if (ammo_percent < activation_ammo and activate_below) or (activation_ammo < ammo_percent and not activate_below) then
				bonus = activation_bonus
			end
		end

		buff.previous_bonus = bonus

		if previous_bonus ~= bonus and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = bonus - previous_bonus

			buff_extension:update_stat_buff(stat_buff_index, difference)
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
			local ammo_extension = (ScriptUnit.has_extension(left_unit_1p, "ammo_system") and ScriptUnit.extension(left_unit_1p, "ammo_system")) or (ScriptUnit.has_extension(right_unit_1p, "ammo_system") and ScriptUnit.extension(right_unit_1p, "ammo_system"))
			local ammo_percent = ammo_extension:total_ammo_fraction()
			local previous_multiplier = buff.previous_multiplier or 0

			if (ammo_percent < activation_ammo and activate_below) or (activation_ammo < ammo_percent and not activate_below) then
				multiplier = activation_multiplier
			end
		end

		buff.previous_multiplier = multiplier

		if previous_multiplier ~= multiplier and stat_buff_index then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local difference = multiplier - previous_multiplier

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	enter_sienna_unchained_activated_ability = function (unit, buff, params)
		if Managers.state.network.is_server then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
			local go_id = Managers.state.unit_storage:go_id(unit)
			local network_manager = Managers.state.network
			local game = network_manager:game()

			if not go_id then
				return
			end

			local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
			local start_pos = POSITION_LOOKUP[unit]
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, start_pos, 2, 30)

			if projected_start_pos then
				local liquid_template_name = "sienna_unchained_ability_patch"
				local liquid_template_id = NetworkLookup.liquid_area_damage_templates[liquid_template_name]
				local network_manager = Managers.state.network
				local invalid_game_object_id = NetworkConstants.invalid_game_object_id

				network_manager.network_transmit:send_rpc_server("rpc_create_liquid_damage_area", invalid_game_object_id, projected_start_pos, aim_direction, liquid_template_id)
			end
		end

		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_sienna_unchained", nil, true)
		end
	end,
	end_sienna_adept_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)
			career_extension:set_state("default")
		end
	end,
	end_sienna_unchained_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end
	end,
	apply_shade_activated_ability = function (unit, buff, params, world)
		if is_husk(unit) or (is_server() and is_bot(unit)) then
			Unit.flow_event(unit, "vfx_career_ability_start")
		end
	end,
	end_shade_activated_ability = function (unit, buff, params, world)
		if is_local(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit")
			first_person_extension:play_hud_sound_event("Stop_career_ability_kerillian_shade_loop")

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_shade = false
		end

		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)

			local events = {
				"Play_career_ability_kerillian_shade_exit",
				"Stop_career_ability_kerillian_shade_loop_husk"
			}
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local is_server = Managers.player.is_server
			local unit_id = network_manager:unit_game_object_id(unit)
			local node_id = 0

			for _, event in ipairs(events) do
				local event_id = NetworkLookup.sound_events[event]

				if is_server then
					network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
				else
					network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
				end
			end
		end
	end,
	apply_huntsman_activated_ability = function (unit, buff, params)
		if is_local(unit) and not is_bot(unit) then
			local fov_multiplier = 0.8
			local lerp_time = 1

			Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
		end

		if is_husk(unit) or (is_server() and is_bot(unit)) then
			Unit.flow_event(unit, "vfx_career_ability_start")
		end
	end,
	end_huntsman_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			if not is_bot(unit) then
				local fov_multiplier = 1
				local lerp_time = 1

				Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
			end

			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if status_extension:is_invisible() then
				MOOD_BLACKBOARD.skill_huntsman_stealth = false
			else
				MOOD_BLACKBOARD.skill_huntsman_surge = false
			end
		end

		if is_local(unit) or (is_server() and is_bot(unit)) then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")

			if status_extension:is_invisible() then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				status_extension:set_invisible(false)
				first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_exit")
				first_person_extension:play_hud_sound_event("Stop_career_ability_markus_huntsman_loop")

				local events = {
					"Play_career_ability_markus_huntsman_exit",
					"Stop_career_ability_markus_huntsman_loop_husk"
				}
				local network_manager = Managers.state.network
				local network_transmit = network_manager.network_transmit
				local is_server = Managers.player.is_server
				local unit_id = network_manager:unit_game_object_id(unit)
				local node_id = 0

				for _, event in ipairs(events) do
					local event_id = NetworkLookup.sound_events[event]

					if is_server then
						network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					else
						network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
					end
				end
			end

			career_extension:set_state("default")
		end
	end,
	end_slayer_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_noclip(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_slayer_exit", nil, true)
			first_person_extension:play_hud_sound_event("Stop_career_ability_bardin_slayer_loop")
			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_slayer = false
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

			status_extension:set_noclip(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_victor_zealot_exit", nil, true)
			first_person_extension:play_hud_sound_event("Stop_career_ability_victor_zealot_loop")
			career_extension:set_state("default")

			MOOD_BLACKBOARD.skill_zealot = false
		end
	end,
	update_bardin_ironbreaker_activated_ability = function (unit, buff, params)
		local time_between_vo = 3

		if is_local(unit) then
			if not params.next_vo_time then
				params.next_vo_time = params.t + time_between_vo
			elseif params.next_vo_time <= params.t then
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
			slot3 = ScriptUnit.extension(unit, "career_system")
		end
	end,
	end_ranger_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			status_extension:set_invisible(false)
			first_person_extension:play_hud_sound_event("Play_career_ability_bardin_ranger_exit", nil, true)
			first_person_extension:play_hud_sound_event("Stop_career_ability_bardin_ranger_loop")
			career_extension:set_state("default")

			local spawned_go_id = buff.spawned_unit_go_id

			if spawned_go_id then
				local network_manager = Managers.state.network
				local unit_spawner = Managers.state.unit_spawner
				local spawned_unit = Managers.state.unit_storage:unit(spawned_go_id)

				if Unit.alive(spawned_unit) then
					unit_spawner:mark_for_deletion(spawned_unit)
				end
			end

			MOOD_BLACKBOARD.skill_ranger = false
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
			if not is_bot(unit) then
				local fov_multiplier = 1
				local lerp_time = 0.5

				Managers.state.camera:set_additional_fov_multiplier_with_lerp_time(fov_multiplier, lerp_time)
			end

			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(false)
			status_extension:set_noclip(false)

			local career_extension = ScriptUnit.extension(unit, "career_system")

			career_extension:set_state("default")
		end
	end,
	end_knight_activated_ability = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_noclip(false)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
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

				buff_extension:update_stat_buff(stat_buff_index, difference)
			end

			buff.previous_bonus = bonus
		end
	end,
	update_multiplier_based_on_overcharge_chunks = function (unit, buff, params)
		if is_local(unit) then
			local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
			local overcharge, threshold, max_overcharge = overcharge_extension:current_overcharge_status()
			local template = buff.template
			local min_multiplier = template.min_multiplier
			local max_multiplier = template.max_multiplier
			local chunk_size = template.chunk_size
			local stat_buff_index = template.stat_buff
			local previous_multiplier = buff.previous_multiplier or 0
			local num_chunks = math.floor(overcharge / chunk_size)
			local multiplier = math.clamp(num_chunks * min_multiplier, min_multiplier, max_multiplier)
			buff.multiplier = multiplier

			if stat_buff_index and previous_multiplier ~= multiplier then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local difference = multiplier - previous_multiplier

				buff_extension:update_stat_buff(stat_buff_index, difference)
			end

			buff.previous_multiplier = multiplier
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

			buff_extension:update_stat_buff(stat_buff_index, difference)
		end

		buff.previous_multiplier = multiplier
	end,
	apply_volume_dot_damage = function (unit, buff, params)
		buff.next_damage_time = params.t + params.bonus.time_between_damage
	end,
	update_volume_dot_damage = function (unit, buff, params)
		if buff.next_damage_time < params.t then
			local health_extension = ScriptUnit.extension(unit, "health_system")

			if health_extension:is_alive() then
				buff.next_damage_time = buff.next_damage_time + params.bonus.time_between_damage
				local damage = DamageUtils.calculate_damage(params.bonus.damage, unit, params.attacker_unit, "full", 1)

				DamageUtils.add_damage_network(unit, params.attacker_unit, damage, "full", buff.template.damage_type, Vector3(1, 0, 0))
			end
		end
	end,
	apply_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings.move_speed = movement_settings.move_speed * params.multiplier
	end,
	remove_volume_movement_buff = function (unit, buff, params)
		local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		movement_settings.move_speed = movement_settings.move_speed / params.multiplier
	end
}

BuffFunctionTemplates.functions.update_charging_action_lerp_movement_buff = function (unit, buff, params)
	local multiplier = params.multiplier
	local time_into_buff = params.time_into_buff
	local old_value_to_update_movement_setting, old_multiplier_to_update_movement_setting, multiplier_to_update_movement_setting = nil
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	multiplier = multiplier and 1 - buff_extension:apply_buffs_to_value(1 - multiplier, StatBuffIndex.INCREASED_MOVE_SPEED_WHILE_AIMING)
	local percentage_in_lerp = math.min(1, time_into_buff / buff.template.lerp_time)

	if multiplier then
		local player = Managers.player:owner(unit)

		if player and player.boon_handler then
			local boon_handler = player.boon_handler
			local num_increased_combat_movement_boons = boon_handler:get_num_boons("increased_combat_movement")
			local boon_template = BoonTemplates.increased_combat_movement

			if num_increased_combat_movement_boons > 0 then
				multiplier = multiplier + (1 - multiplier) * num_increased_combat_movement_boons * boon_template.multiplier
			end
		end

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

return
