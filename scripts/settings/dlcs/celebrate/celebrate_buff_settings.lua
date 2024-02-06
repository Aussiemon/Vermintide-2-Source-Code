-- chunkname: @scripts/settings/dlcs/celebrate/celebrate_buff_settings.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.celebrate

local function is_server()
	return Managers.player.is_server
end

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

settings.buff_templates = {
	celebrate_group = {
		buffs = {
			{
				apply_buff_func = "hot_joined",
				max_stacks = 1,
				name = "celebrate_group",
			},
		},
	},
	beer_bottle_pickup_cooldown = {
		buffs = {
			{
				duration = 2.5,
				max_stacks = 1,
				name = "beer_bottle_pickup_cooldown",
			},
		},
	},
	hinder_career_ability = {
		buffs = {
			{
				duration = 2.1,
				name = "hinder_career_ability",
				perks = {
					buff_perks.disable_career_ability,
				},
			},
		},
	},
	intoxication_base = {
		buffs = {
			{
				max_stacks = 1,
				name = "intoxication_base",
				remove_buff_func = "remove_intoxication_base",
				update_func = "update_intoxication_level",
			},
		},
	},
	intoxication_stagger = {
		buffs = {
			{
				duration = 2.5,
				max_stacks = 1,
				name = "intoxication_stagger",
				refresh_durations = true,
				perks = {
					buff_perks.intoxication_stagger,
				},
			},
		},
	},
	increase_intoxication_level = {
		activation_effect = "fx/screenspace_drink_01",
		buffs = {
			{
				apply_buff_func = "increase_intoxication_level",
				base_buff = "intoxication_base",
				effect_buff = "intoxication_effect",
				name = "increase_intoxication_level",
			},
			{
				apply_buff_func = "add_buff",
				buff_to_add = "intoxication_stagger",
				name = "add_intoxication_stagger",
			},
			{
				apply_buff_func = "add_buff",
				buff_to_add = "beer_bottle_pickup_cooldown",
				name = "add_intoxication_pickup_cooldown",
			},
		},
	},
	intoxication_effect_vfx = {
		buffs = {
			{
				continuous_effect = "fx/screenspace_drunken_lens_01",
				duration = 30,
				max_stacks = 1,
				name = "intoxication_effect_vfx",
				refresh_durations = true,
			},
		},
	},
	intoxication_effect_max_stacks_vfx = {
		buffs = {
			{
				continuous_effect = "fx/screenspace_drunken_lens_05",
				duration = 30,
				max_stacks = 1,
				name = "intoxication_effect_max_stacks_vfx",
				refresh_durations = true,
			},
		},
	},
	intoxication_effect = {
		buffs = {
			{
				continuous_effect = "fx/screenspace_drunken_lens_01",
				duration = 30,
				icon = "buff_icon_mutator_icon_drunk",
				max_stacks = 3,
				name = "intoxication_effect",
				priority_buff = true,
				refresh_durations = true,
				remove_buff_func = "end_intoxication_effect",
			},
			{
				duration = 30,
				max_stacks = 1,
				name = "intoxication_effect_bloody_mess",
				refresh_durations = true,
				perks = {
					buff_perks.bloody_mess,
				},
			},
			{
				duration = 30,
				max_stacks = 1,
				name = "intoxication_effect_drunk_stagger",
				refresh_durations = true,
				perks = {
					buff_perks.drunk_stagger,
				},
			},
			{
				duration = 30,
				max_stacks = 3,
				multiplier = 0.1,
				name = "intoxication_power_level",
				refresh_durations = true,
				stat_buff = "power_level",
			},
			{
				duration = 30,
				max_stacks = 3,
				multiplier = 0.15,
				name = "intoxication_critical_hit_chance",
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
			{
				duration = 30,
				max_stacks = 3,
				multiplier = 1.5,
				name = "intoxication_cooldown_regen_increase",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
			{
				max_stacks = 3,
				multiplier = 0.02,
				name = "drunk_attack_speed_slowdown",
				stat_buff = "attack_speed",
			},
		},
	},
	falling_down_effect = {
		activation_effect = "fx/screenspace_hungover_01",
		deactivation_effect = "fx/screenspace_hungover_01",
		buffs = {
			{
				continuous_effect = "fx/screenspace_drink_looping",
				duration = 5,
				max_stacks = 1,
				multiplier = -0.5,
				name = "falling_down_attack_speed_slowdown",
				remove_buff_func = "remove_falling_down_effect",
				stat_buff = "attack_speed",
				perks = {
					buff_perks.falling_down,
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 5,
				lerp_time = 1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "falling_down_decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 5,
				lerp_time = 1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "falling_down_decrease_crouch_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				duration = 5,
				lerp_time = 1,
				max_stacks = 1,
				multiplier = 0.5,
				name = "falling_down_decrease_walk_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
			},
		},
	},
	hungover_effect = {
		activation_effect = "fx/screenspace_hungover_01",
		buffs = {
			{
				continuous_effect = "fx/screenspace_hungover_lens_01",
				debuff = true,
				icon = "debuff_icon_mutator_icon_drunk",
				max_stacks = 3,
				name = "hungover_effect",
				priority_buff = true,
			},
			{
				max_stacks = 3,
				name = "hungover_effect_stagger",
				perks = {
					buff_perks.hungover_stagger,
				},
			},
			{
				max_stacks = 3,
				multiplier = -0.05,
				name = "hungover_attack_speed_slowdown",
				stat_buff = "attack_speed",
			},
			{
				max_stacks = 3,
				multiplier = -0.2,
				name = "hungover_regen_increase",
				stat_buff = "fatigue_regen",
			},
			{
				max_stacks = 1,
				name = "hungover_effect_perk",
				perks = {
					buff_perks.hungover,
				},
			},
		},
	},
}
settings.buff_function_templates = {
	update_intoxication_level = function (unit, buff, params, world)
		if not is_local(unit) or is_bot(unit) then
			return
		end

		local status_extension = ScriptUnit.extension(unit, "status_system")
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local career_extension = ScriptUnit.extension(unit, "career_system")
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local intoxication_level = status_extension:intoxication_level()

		if not buff.intoxication_stack_ids then
			buff.intoxication_stack_ids = {}
		end

		if not buff.intoxication_vfx_stack_ids then
			buff.intoxication_vfx_stack_ids = {}
		end

		if not buff.intoxication_vfx_max_stack_ids then
			buff.intoxication_vfx_max_stack_ids = {}
		end

		if not buff.hungover_stack_ids then
			buff.hungover_stack_ids = {}
		end

		local t = params.t
		local falling_down = buff_extension:has_buff_perk("falling_down")

		if not falling_down and intoxication_level > 0 and intoxication_level > #buff.intoxication_stack_ids then
			if career_extension and career_extension:current_ability_paused() then
				career_extension:start_activated_ability_cooldown()
			end

			local num_wanted_buffs = intoxication_level - #buff.intoxication_stack_ids

			for i = 1, num_wanted_buffs do
				local buff_id = buff_extension:add_buff("intoxication_effect")

				buff.intoxication_stack_ids[#buff.intoxication_stack_ids + 1] = buff_id
			end

			if intoxication_level >= 3 then
				for i = 1, #buff.intoxication_vfx_stack_ids do
					local buff_id = buff.intoxication_vfx_stack_ids[i]

					buff_extension:remove_buff(buff_id)
				end

				table.clear(buff.intoxication_vfx_stack_ids)

				local buff_id = buff_extension:add_buff("intoxication_effect_max_stacks_vfx")

				buff.intoxication_vfx_max_stack_ids[#buff.intoxication_vfx_max_stack_ids + 1] = buff_id
			else
				for i = 1, #buff.intoxication_vfx_max_stack_ids do
					local buff_id = buff.intoxication_vfx_max_stack_ids[i]

					buff_extension:remove_buff(buff_id)
				end

				table.clear(buff.intoxication_vfx_max_stack_ids)

				local buff_id = buff_extension:add_buff("intoxication_effect_vfx")

				buff.intoxication_vfx_stack_ids[#buff.intoxication_vfx_stack_ids + 1] = buff_id
			end

			local num_buffs_to_remove = #buff.hungover_stack_ids

			for i = 1, num_buffs_to_remove do
				local buff_id = buff.hungover_stack_ids[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(buff.hungover_stack_ids)

			if buff.shake_id then
				Managers.state.camera:stop_camera_effect_shake_event(buff.shake_id)

				buff.shake_id = nil
			end

			MOOD_BLACKBOARD.drunk_01 = true
			MOOD_BLACKBOARD.hangover_01 = false
		elseif intoxication_level < 0 and #buff.hungover_stack_ids ~= math.abs(intoxication_level) then
			if career_extension and not career_extension:current_ability_paused() then
				CharacterStateHelper.stop_weapon_actions(inventory_extension, "hungover")
				CharacterStateHelper.stop_career_abilities(career_extension, "hungover")
				career_extension:reset_cooldown()
				career_extension:set_activated_ability_cooldown_paused()
			end

			local num_hungover_stacks = #buff.hungover_stack_ids
			local adding_buff = num_hungover_stacks < math.abs(intoxication_level)

			if adding_buff then
				local num_buffs_to_add = math.abs(intoxication_level)

				for i = #buff.hungover_stack_ids + 1, num_buffs_to_add do
					local buff_id = buff_extension:add_buff("hungover_effect")

					buff.hungover_stack_ids[i] = buff_id
				end
			else
				local num_buffs_to_remove = num_hungover_stacks - math.abs(intoxication_level)

				for i = 1, num_buffs_to_remove do
					local buff_id = table.remove(buff.hungover_stack_ids, 1)

					buff_extension:remove_buff(buff_id)
				end
			end

			for i = 1, #buff.intoxication_stack_ids do
				local buff_id = buff.intoxication_stack_ids[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(buff.intoxication_stack_ids)

			for i = 1, #buff.intoxication_vfx_max_stack_ids do
				local buff_id = buff.intoxication_vfx_max_stack_ids[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(buff.intoxication_vfx_max_stack_ids)

			for i = 1, #buff.intoxication_vfx_stack_ids do
				local buff_id = buff.intoxication_vfx_stack_ids[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(buff.intoxication_vfx_stack_ids)

			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("buff_wears_off", event_data)

			if not buff.shake_id then
				local shake_id = Managers.state.camera:camera_effect_shake_event("intoxication_after_effect", t)

				buff.shake_id = shake_id
			end

			Managers.state.camera:camera_effect_shake_event("hungover", t)

			MOOD_BLACKBOARD.drunk_01 = false
			MOOD_BLACKBOARD.hangover_01 = true

			local blink_sound_event_name = "Play_eye_blink_hangover"
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event(blink_sound_event_name)

			buff.next_blink_t = t + 3

			local hungover_sound_event_name = "Play_player_celebrate_hangover"

			first_person_extension:play_hud_sound_event(hungover_sound_event_name)
		end

		if buff.delayed_vce_time and t > buff.delayed_vce_time then
			local delayed_vce_event = buff.delayed_vce_event
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event(delayed_vce_event, event_data)

			buff.delayed_vce_time = nil
			buff.delayed_vce_event = nil
		end

		if buff.delayed_drink_vce_time and t > buff.delayed_drink_vce_time then
			local delayed_drink_vce_event = buff.delayed_drink_vce_event
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event(delayed_drink_vce_event, event_data)

			buff.delayed_drink_vce_time = nil
			buff.delayed_drink_vce_event = nil
		end

		if not buff.shake_event_settings then
			local shake_event_settings = {}
			local event = CameraEffectSettings.shake.intoxication_after_effect

			shake_event_settings.event = event
			shake_event_settings.start_time = t
			shake_event_settings.seed = event.seed or Math.random(1, 100)
			buff.shake_event_settings = shake_event_settings
			buff.shake_functions = {
				calculate_perlin_value_func = function (buff, x)
					local total = 0
					local shake_settings = buff.shake_event_settings.event
					local persistance = shake_settings.persistance
					local number_of_octaves = shake_settings.octaves

					for i = 0, number_of_octaves do
						local frequency = 2^i
						local amplitude = persistance^i

						total = total + buff.shake_functions.interpolated_noise_func(buff, x * frequency) * amplitude
					end

					local amplitude_multiplier = shake_settings.amplitude or 1
					local fade_multiplier = settings.fade_progress or 1

					total = total * amplitude_multiplier * fade_multiplier

					return total
				end,
				interpolated_noise_func = function (buff, x)
					local x_floored = math.floor(x)
					local remainder = x - x_floored
					local v1 = buff.shake_functions.smoothed_noise_func(buff, x_floored)
					local v2 = buff.shake_functions.smoothed_noise_func(buff, x_floored + 1)

					return math.lerp(v1, v2, remainder)
				end,
				smoothed_noise_func = function (buff, x, noise_func)
					return buff.shake_functions.noise_func(buff, x) / 2 + buff.shake_functions.noise_func(buff, x - 1) / 4 + buff.shake_functions.noise_func(buff, x + 1) / 4
				end,
				noise_func = function (buff, x)
					local next_seed, _ = Math.next_random(x + buff.shake_event_settings.seed)
					local _, value = Math.next_random(next_seed)

					return value * 2 - 1
				end,
			}
		end

		if buff.next_blink_t and t > buff.next_blink_t then
			local sound_event_name = "Play_eye_blink_hangover"
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event(sound_event_name)

			buff.next_blink_t = nil
		end

		if not buff.next_noise_t or t > buff.next_noise_t then
			buff.next_noise_t = t + 2

			local pitch_value = buff.shake_functions.calculate_perlin_value_func(buff, t - buff.shake_event_settings.start_time, buff.shake_event_settings)
			local yaw_value = buff.shake_functions.calculate_perlin_value_func(buff, t - buff.shake_event_settings.start_time + 10, buff.shake_event_settings)
			local sine_value = math.abs(math.sin(t * math.pi * 0.5))
			local sine_value_2 = math.abs(math.sin(t * math.pi))
			local square = math.sqrt(pitch_value * pitch_value + yaw_value * yaw_value)

			assert(square ~= 0, "trying to divide by zero in \"update_intoxication_level\" buff update function")

			pitch_value = pitch_value / square
			yaw_value = yaw_value / square

			local final_value = math.abs(math.lerp(pitch_value, yaw_value, sine_value)) * math.sign(intoxication_level) * 200 + math.sign(intoxication_level) * 200 * (math.abs(intoxication_level) - 1)
			local final_value_2 = math.abs(math.lerp(pitch_value, yaw_value, sine_value_2)) * math.sign(intoxication_level) * 200 + math.sign(intoxication_level) * 200 * (math.abs(intoxication_level) - 1)
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.set_global_parameter(wwise_world, "player_intoxication_level", final_value)
			WwiseWorld.set_global_parameter(wwise_world, "player_intoxication_level_2", final_value_2)
		end
	end,
	remove_intoxication_base = function (unit, buff, params, world)
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_global_parameter(wwise_world, "player_intoxication_level", 0)
		WwiseWorld.set_global_parameter(wwise_world, "player_intoxication_level_2", 0)

		if buff.shake_id then
			Managers.state.camera:stop_camera_effect_shake_event(buff.shake_id)

			buff.shake_id = nil
		end
	end,
	check_celebrate_buff = function (unit, buff, params, world)
		if not is_local(unit) or is_bot(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if buff_extension:has_buff_perk("hungover") then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local intoxication_level = status_extension:intoxication_level()

			if intoxication_level < 0 then
				status_extension:invert_intoxication_level()

				local t = Managers.time:time("game")

				Managers.state.camera:camera_effect_shake_event("intoxication", t)

				local network_manager = Managers.state.network
				local unit_go_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_server("rpc_request_heal_wounds", unit_go_id)
			end

			local drunk_sound_event_name = "Play_player_celebrate_drunk"
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			first_person_extension:play_hud_sound_event(drunk_sound_event_name)
		end
	end,
	increase_intoxication_level = function (unit, buff, params, world)
		if not is_local(unit) or is_bot(unit) then
			return
		end

		local status_extension = ScriptUnit.extension(unit, "status_system")
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if buff_extension:has_buff_perk("falling_down") then
			return
		end

		local buff_template = buff.template
		local base_buff_name = buff_template.base_buff
		local base_buff = buff_extension:get_non_stacking_buff(base_buff_name)
		local intoxication_level = status_extension:intoxication_level()

		if intoxication_level < 0 then
			status_extension:invert_intoxication_level()

			if base_buff then
				base_buff.delayed_vce_time = params.t + 1
				base_buff.delayed_vce_event = "buff_begins_from_sick"
			end
		else
			status_extension:add_intoxication_level(1)

			if base_buff then
				base_buff.delayed_vce_time = params.t + 1
				base_buff.delayed_vce_event = "buff_begins"
			end

			if intoxication_level >= 3 then
				buff_extension:add_buff("falling_down_effect")
			end
		end

		local t = Managers.time:time("game")

		Managers.state.camera:camera_effect_shake_event("intoxication", t)

		local network_manager = Managers.state.network
		local unit_go_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_server("rpc_request_heal_wounds", unit_go_id)

		base_buff.delayed_drink_vce_time = params.t + 1.6
		base_buff.delayed_drink_vce_event = "player_drank_vce"

		local drunk_sound_event_name = "Play_player_celebrate_drunk"
		local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

		first_person_extension:play_hud_sound_event(drunk_sound_event_name)

		if is_server() then
			local group_buff_template_name = "celebrate_group"
			local group_buff_name_id = NetworkLookup.group_buff_templates[group_buff_template_name]
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:rpc_add_group_buff(nil, group_buff_name_id, 1)
		end
	end,
	end_intoxication_effect = function (unit, buff, params, world)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local intoxication_level = status_extension:intoxication_level()

		if intoxication_level > 0 then
			status_extension:invert_intoxication_level()
		end
	end,
	remove_falling_down_effect = function (unit, buff, params, world)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local intoxication_level = status_extension:intoxication_level()

		if intoxication_level > 0 then
			status_extension:invert_intoxication_level()
		end

		local network_manager = Managers.state.network
		local unit_go_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_server("rpc_request_knock_down", unit_go_id)
	end,
	add_buff = function (unit, buff, params, world)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_template = buff.template
		local buff_to_add = buff_template.buff_to_add

		buff_extension:add_buff(buff_to_add)
	end,
	hot_joined = function (unit, buff, params, world)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local intoxication_level = status_extension:intoxication_level()

		if intoxication_level == 0 then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:add_buff("intoxication_base")
			status_extension:add_intoxication_level(1)
			status_extension:invert_intoxication_level()
		end
	end,
}
settings.group_buff_templates = {
	celebrate_group = {
		buff_per_instance = "celebrate_group",
		side_name = "heroes",
	},
}
settings.add_sub_buffs_to_core_buffs = {
	{
		buff_name = "damage_boost_potion",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "speed_boost_potion",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "cooldown_reduction_potion",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "invulnerability_potion",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "damage_boost_potion_increased",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "speed_boost_potion_increased",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "cooldown_reduction_potion_increased",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "invulnerability_potion_increased",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "damage_boost_potion_reduced",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "speed_boost_potion_reduced",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "cooldown_reduction_potion_reduced",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
	{
		buff_name = "invulnerability_potion_reduced",
		sub_buff_to_add = {
			apply_buff_func = "check_celebrate_buff",
			name = "check celebrate",
		},
	},
}
