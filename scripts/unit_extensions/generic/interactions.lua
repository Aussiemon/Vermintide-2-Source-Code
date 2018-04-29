InteractionResult = {
	"ONGOING",
	"SUCCESS",
	"FAILURE",
	"USER_ENDED"
}

table.mirror_array_inplace(InteractionResult)

InteractionDefinitions = InteractionDefinitions or {}
InteractionDefinitions.player_generic = {
	default_config = {
		hud_verb = "player_interaction",
		duration = 2,
		hold = true,
		swap_to_3p = true
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			InteractionDefinitions.player_generic.current_data = InteractionHelper.choose_player_interaction(interactor_unit, interactable_unit)

			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].server.start(world, interactor_unit, interactable_unit, data, config, t)
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].server.update(world, interactor_unit, interactable_unit, data, config, dt, t)
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			local result = InteractionDefinitions[InteractionDefinitions.player_generic.current_data].server.stop(world, interactor_unit, interactable_unit, data, config, t, result)
			InteractionDefinitions.player_generic.current_data = nil

			return result
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			InteractionDefinitions.player_generic.current_data = InteractionHelper.choose_player_interaction(interactor_unit, interactable_unit)

			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].client.start(world, interactor_unit, interactable_unit, data, config, t)
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].client.update(world, interactor_unit, interactable_unit, data, config, dt, t)
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			local result = InteractionDefinitions[InteractionDefinitions.player_generic.current_data].client.stop(world, interactor_unit, interactable_unit, data, config, t, result)
			InteractionDefinitions.player_generic.current_data = nil

			return result
		end,
		get_progress = function (data, config, t)
			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].client.get_progress(data, config, t)
		end,
		hud_description = function (interactable_unit, __, __, __, interactor_unit)
			local interaction_action_description = nil
			local result = InteractionHelper.choose_player_interaction(interactor_unit, interactable_unit)

			if result then
				interaction_action_description = InteractionDefinitions[result].client.hud_description(interactable_unit, __, __, __, interactor_unit)
			else
				interaction_action_description = InteractionDefinitions.player_generic.default_config.hud_verb
			end

			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				return display_name, interaction_action_description
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local result = InteractionHelper.choose_player_interaction(interactor_unit, interactable_unit)

			return result ~= nil, nil, result
		end
	},
	get_config = function ()
		if InteractionDefinitions.player_generic.current_data then
			return InteractionDefinitions[InteractionDefinitions.player_generic.current_data].config
		else
			return InteractionDefinitions.player_generic.default_config
		end

		return 
	end
}

local function _add_heal_telemetry(healer_player, target_player, position)
	if healer_player == target_player then
		Managers.telemetry.events:player_healed_self(healer_player, position)
	else
		Managers.telemetry.events:player_healed_ally(healer_player, target_player, position)
	end

	return 
end

local function _drop_pickup(interactor_unit, pickup_name)
	local first_person_extension = ScriptUnit.extension(interactor_unit, "first_person_system")
	local position = first_person_extension.current_position(first_person_extension) + Vector3(math.random(-1, 1), math.random(-1, 1), 0) * 0.2
	local rotation = first_person_extension.current_rotation(first_person_extension)
	local direction = Vector3.normalize(Quaternion.forward(rotation))
	local final_position = position + direction * 0.7
	local pickup_spawn_type = "dropped"
	local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
	local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
	local network_manager = Managers.state.network

	network_manager.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", pickup_name_id, final_position, rotation, pickup_spawn_type_id)

	return 
end

InteractionDefinitions.revive = {
	config = {
		block_other_interactions = true,
		hud_verb = "revive",
		hold = true,
		swap_to_3p = true,
		duration = 2
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local duration = config.duration
			local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
			duration = buff_extension.apply_buffs_to_value(buff_extension, duration, StatBuffIndex.FASTER_REVIVE)
			local revivee_status_extension = ScriptUnit.extension(interactable_unit, "status_system")

			revivee_status_extension.set_knocked_down_bleed_buff_paused(revivee_status_extension, true)

			data.done_time = t + duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension.is_knocked_down(status_extension) or not health_extension.is_alive(health_extension) then
				return InteractionResult.FAILURE
			end

			local revivee_health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local revivee_status_extension = ScriptUnit.extension(interactable_unit, "status_system")

			if not revivee_status_extension.is_knocked_down(revivee_status_extension) or not revivee_health_extension.is_alive(revivee_health_extension) then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				StatusUtils.set_revived_network(interactable_unit, true, interactor_unit)

				local player_manager = Managers.player
				local interactor_player = player_manager.unit_owner(player_manager, interactor_unit)
				local interactable_player = player_manager.unit_owner(player_manager, interactable_unit)

				if not interactor_player or not interactable_player then
					return 
				end

				local interactable_pos = POSITION_LOOKUP[interactable_unit]

				Managers.telemetry.events:player_revived(interactor_player, interactable_player, interactable_pos)
			elseif Unit.alive(interactable_unit) then
				local health_extension = ScriptUnit.extension(interactable_unit, "health_system")

				if health_extension.is_alive(health_extension) then
					local revivee_status_extension = ScriptUnit.extension(interactable_unit, "status_system")

					revivee_status_extension.set_knocked_down_bleed_buff_paused(revivee_status_extension, false)
				end
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local knocked_down = status_extension.is_knocked_down(status_extension)
			local pounced = status_extension.is_pounced_down(status_extension)
			local alive = health_extension.is_alive(health_extension)
			local grabbed = status_extension.is_grabbed_by_pack_master(status_extension)
			local ledge_hanging = status_extension.get_is_ledge_hanging(status_extension)
			local hanging_from_hook = status_extension.is_hanging_from_hook(status_extension)

			return knocked_down and alive and not pounced and not grabbed and not ledge_hanging and not hanging_from_hook
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local revive_time_variable = Unit.animation_find_variable(interactable_unit, "revive_time")
			local duration = config.duration
			local event_data = FrameTable.alloc_table()
			local interactor_alive = Unit.alive(interactor_unit)

			if interactor_alive then
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
				duration = buff_extension.apply_buffs_to_value(buff_extension, duration, StatBuffIndex.FASTER_REVIVE)
				local interaction_duration_variable = Unit.animation_find_variable(interactor_unit, "interaction_duration")

				Unit.animation_set_variable(interactor_unit, interaction_duration_variable, duration)
				Unit.animation_event(interactor_unit, "interaction_revive")

				event_data.target = interactable_unit
			end

			local interactable_alive = Unit.alive(interactable_unit)

			if interactable_alive then
				Unit.animation_set_variable(interactable_unit, revive_time_variable, duration)
				Unit.animation_event(interactable_unit, "revive_start")

				if ScriptUnit.has_extension(interactable_unit, "first_person_system") then
					local first_person_extension = ScriptUnit.extension(interactable_unit, "first_person_system")

					first_person_extension.set_wanted_player_height(first_person_extension, "stand", t, duration)
				end

				event_data.target_name = ScriptUnit.extension(interactable_unit, "dialogue_system").context.player_profile
			end

			data.duration = duration

			if interactable_alive and interactor_alive then
				local dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")

				dialogue_input.trigger_dialogue_event(dialogue_input, "start_revive", event_data)
			end

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil
			local interactable_alive = Unit.alive(interactable_unit)
			local interactor_alive = Unit.alive(interactor_unit)

			if interactor_alive then
				Unit.animation_event(interactor_unit, "interaction_end")
			end

			if result == InteractionResult.SUCCESS then
				if interactable_alive then
					Unit.animation_event(interactable_unit, "revive_complete")
				end

				if interactor_alive and interactable_alive then
					StatisticsUtil.register_revive(interactor_unit, interactable_unit, data.statistics_db)
				end
			elseif interactable_alive then
				Unit.animation_event(interactable_unit, "revive_abort")

				if ScriptUnit.has_extension(interactable_unit, "first_person_system") then
					local first_person_extension = ScriptUnit.extension(interactable_unit, "first_person_system")

					first_person_extension.set_wanted_player_height(first_person_extension, "knocked_down", t)
				end
			end

			return 
		end,
		get_progress = function (data, config, t)
			local duration = data.duration

			if duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local grabbed = status_extension.is_grabbed_by_pack_master(status_extension)
			local ledge_hanging = status_extension.get_is_ledge_hanging(status_extension)
			local hanging_from_hook = status_extension.is_hanging_from_hook(status_extension)
			local can_revive = not status_extension.is_pounced_down(status_extension) and not grabbed and not ledge_hanging and not hanging_from_hook and status_extension.is_knocked_down(status_extension) and health_extension.is_alive(health_extension)

			return can_revive
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				local t = Managers.time:time("game")
				local interaction_progress = (config.duration and data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
				local is_interacting = interaction_progress and 0 < interaction_progress
				local interaction_action_description = (is_interacting and "interaction_action_reviving") or "interaction_action_revive"

				return display_name, interaction_action_description
			end

			return 
		end
	}
}
InteractionDefinitions.pull_up = {
	config = {
		block_other_interactions = true,
		hud_verb = "pull up",
		hold = true,
		swap_to_3p = true,
		duration = 2,
		does_not_require_line_of_sight = true
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension.get_is_ledge_hanging(status_extension) or not health_extension.is_alive(health_extension) then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				StatusUtils.set_pulled_up_network(interactable_unit, true, (Unit.alive(interactor_unit) and interactor_unit) or nil)
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_hanging = status_extension.get_is_ledge_hanging(status_extension)
			local is_pulled_up = status_extension.is_pulled_up(status_extension)

			return is_hanging and not is_pulled_up
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local interaction_duration_variable = Unit.animation_find_variable(interactor_unit, "interaction_duration")

			Unit.animation_set_variable(interactor_unit, interaction_duration_variable, config.duration)
			Unit.animation_event(interactor_unit, "interaction_revive")

			if Unit.alive(interactable_unit) then
				local revive_time_variable = Unit.animation_find_variable(interactable_unit, "revive_time")

				Unit.animation_set_variable(interactable_unit, revive_time_variable, config.duration)
				Unit.animation_event(interactable_unit, "revive_start")

				if ScriptUnit.has_extension(interactable_unit, "first_person_system") then
					local first_person_extension = ScriptUnit.extension(interactable_unit, "first_person_system")

					first_person_extension.set_wanted_player_height(first_person_extension, "stand", t, config.duration)
				end

				local dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.target = interactable_unit
				event_data.target_name = ScriptUnit.extension(interactable_unit, "dialogue_system").context.player_profile

				dialogue_input.trigger_dialogue_event(dialogue_input, "start_revive", event_data)
			end

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS then
				if Unit.alive(interactable_unit) then
					StatisticsUtil.register_pull_up(interactor_unit, interactable_unit, data.statistics_db)
					Unit.animation_event(interactable_unit, "revive_complete")
				end
			elseif Unit.alive(interactable_unit) then
				Unit.animation_event(interactable_unit, "revive_abort")

				if ScriptUnit.has_extension(interactable_unit, "first_person_system") then
					local first_person_extension = ScriptUnit.extension(interactable_unit, "first_person_system")

					first_person_extension.set_wanted_player_height(first_person_extension, "knocked_down", t)
				end
			end

			return 
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local can_pull_up = status_extension.get_is_ledge_hanging(status_extension) and not status_extension.is_pulled_up(status_extension)

			return can_pull_up
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				return display_name, "interaction_action_pull_up"
			end

			return 
		end
	}
}
InteractionDefinitions.release_from_hook = {
	config = {
		block_other_interactions = true,
		hud_verb = "player_interaction",
		hold = true,
		swap_to_3p = true,
		duration = 2
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				StatusUtils.set_grabbed_by_pack_master_network("pack_master_dropping", interactable_unit, true, nil)
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local is_hooked = status_extension.is_hanging_from_hook(status_extension)
			local alive = health_extension.is_alive(health_extension)

			return is_hooked and alive
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local interaction_duration_variable = Unit.animation_find_variable(interactor_unit, "interaction_duration")

			Unit.animation_set_variable(interactor_unit, interaction_duration_variable, config.duration)
			Unit.animation_event(interactor_unit, "interaction_generic")

			local dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.target = interactable_unit
			event_data.target_name = ScriptUnit.extension(interactable_unit, "dialogue_system").context.player_profile

			dialogue_input.trigger_dialogue_event(dialogue_input, "start_revive", event_data)

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			return 
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_hanging = status_extension.is_hanging_from_hook(status_extension)
			local alive = ScriptUnit.extension(interactable_unit, "health_system"):is_alive()

			return is_hanging and alive
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				return display_name, "interact_release_from_hook"
			end

			return 
		end
	}
}
InteractionDefinitions.assisted_respawn = {
	config = {
		block_other_interactions = true,
		hud_verb = "assist respawn",
		hold = true,
		swap_to_3p = true,
		duration = 2
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				StatusUtils.set_respawned_network(interactable_unit, true, interactor_unit)
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local can_be_assisted = status_extension.is_ready_for_assisted_respawn(status_extension)

			return can_be_assisted
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local duration = config.duration
			local revive_time_variable = Unit.animation_find_variable(interactable_unit, "revive_time")

			Unit.animation_set_variable(interactable_unit, revive_time_variable, duration)
			Unit.animation_event(interactable_unit, "revive_start")

			local interaction_duration_variable = Unit.animation_find_variable(interactor_unit, "interaction_duration")

			Unit.animation_set_variable(interactor_unit, interaction_duration_variable, config.duration)
			Unit.animation_event(interactor_unit, "interaction_revive")

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS then
				Unit.animation_event(interactable_unit, "revive_complete")
				StatisticsUtil.register_assisted_respawn(interactor_unit, interactable_unit, data.statistics_db)
			else
				Unit.animation_event(interactable_unit, "revive_abort")
			end

			return 
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_ready = status_extension.is_ready_for_assisted_respawn(status_extension)

			return is_ready
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				return display_name, "interaction_action_assisted_respawn"
			end

			return 
		end
	}
}
local movement_threshold_sq = 1
InteractionDefinitions.smartobject = {
	config = {
		show_weapons = true,
		duration = 0,
		hold = true,
		swap_to_3p = false
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")

			fassert(duration, "Interacting with %q that has no interaction length", interactable_unit)

			data.done_time = t + duration
			data.duration = duration
			local interactor_position = Unit.world_position(interactor_unit, 0)
			local interactable_position = Unit.world_position(interactable_unit, 0)
			local start_offset = interactor_position - interactable_position
			data.start_offset = Vector3Box(start_offset)

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension.is_knocked_down(status_extension) or not health_extension.is_alive(health_extension) then
				return InteractionResult.FAILURE
			end

			local interactor_position = Unit.world_position(interactor_unit, 0)
			local interactable_position = Unit.world_position(interactable_unit, 0)
			local current_offset = interactor_position - interactable_position
			local start_offset = data.start_offset:unbox()
			local movement_sq = Vector3.distance_squared(start_offset, current_offset)

			if movement_threshold_sq < movement_sq then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local used = Unit.get_data(interactable_unit, "interaction_data", "used")

			return not used
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")
			data.duration = duration
			local interactor_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation")
			local interactor_animation_time_variable = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation_time_variable")
			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

			if interactor_animation_name then
				local interactor_animation_time_variable = Unit.animation_find_variable(interactor_unit, interactor_animation_time_variable)

				Unit.animation_set_variable(interactor_unit, interactor_animation_time_variable, duration)
				Unit.animation_event(interactor_unit, interactor_animation_name)
			end

			local interactable_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation")
			local interactable_animation_time_variable_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation_time_variable")

			if interactable_animation_name then
				local interactable_animation_time_variable = Unit.animation_find_variable(interactable_unit, interactable_animation_time_variable_name)

				Unit.animation_set_variable(interactable_unit, interactable_animation_time_variable, duration)
				Unit.animation_event(interactable_unit, interactable_animation_name)
			end

			CharacterStateHelper.stop_weapon_actions(inventory_extension, "interacting")
			Unit.set_data(interactable_unit, "interaction_data", "being_used", true)

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS and Unit.get_data(interactable_unit, "interaction_data", "only_once") then
				Unit.set_data(interactable_unit, "interaction_data", "used", true)
			end

			Unit.set_data(interactable_unit, "interaction_data", "being_used", false)

			return 
		end,
		get_progress = function (data, config, t)
			if data.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / data.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			local used = Unit.get_data(interactable_unit, "interaction_data", "used")
			local being_used = Unit.get_data(interactable_unit, "interaction_data", "being_used")

			return not used and not being_used
		end,
		hud_description = function (interactable_unit, data, config)
			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
		end
	}
}
InteractionDefinitions.pickup_object = {
	config = {
		allow_movement = true,
		duration = 0,
		hold = true,
		swap_to_3p = false
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")
			data.done_time = t + duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if status_extension.is_knocked_down(status_extension) or not health_extension.is_alive(health_extension) then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				if Unit.get_data(interactable_unit, "interaction_data", "only_once") then
					if ScriptUnit.has_extension(interactable_unit, "limited_item_track_system") then
						local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")

						limited_item_extension.mark_for_transformation(limited_item_extension)
					end

					Managers.state.unit_spawner:mark_for_deletion(interactable_unit)
				end

				local interactor_buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
				local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")
				local pickup_settings = pickup_extension.get_pickup_settings(pickup_extension)

				if pickup_settings.consumable_item then
					interactor_buff_extension.trigger_procs(interactor_buff_extension, "on_consumable_picked_up", interactable_unit, pickup_settings)
				end
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			return true
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")
			data.duration = duration

			fassert(duration, "Interacting with %q that has no interaction length", interactable_unit)

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS then
				local player = Managers.player:owner(interactor_unit)
				local local_human = player.local_player
				local local_bot_or_human = not player.remote
				local interactor_is_local_player = player.local_player
				local network_manager = Managers.state.network
				local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
				local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")
				local pickup_settings = pickup_extension.get_pickup_settings(pickup_extension)

				if pickup_settings.type == "loot_die" then
					Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "picked_up_loot_dice", player)

					if local_bot_or_human then
						Managers.chat:send_system_chat_message(1, "system_chat_player_picked_up_loot_die", player.name(player))
					end
				elseif pickup_settings.type == "endurance_badge" then
					Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "picked_up_endurance_badge", player)

					if local_bot_or_human then
						Managers.chat:send_system_chat_message(1, "dlc1_2_system_chat_player_picked_up_endurance_badge", player.name(player))
					end
				elseif pickup_settings.type == "inventory_item" then
					local slot_name = pickup_settings.slot_name
					local item_name = pickup_settings.item_name
					local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)
					local item_data = ItemMasterList[item_name]

					if not slot_data or (slot_data and slot_data.item_data.name ~= item_data.name) then
						if item_name == "wpn_side_objective_tome_01" then
							Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "picked_up_tome", player)

							if local_bot_or_human then
								Managers.chat:send_system_chat_message(1, "system_chat_player_picked_up_tome", player.name(player))
							end
						elseif item_name == "wpn_grimoire_01" then
							Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "picked_up_grimoire", player)

							if local_bot_or_human then
								Managers.chat:send_system_chat_message(1, "system_chat_player_picked_up_grimoire", player.name(player))
							end
						end
					end

					if slot_data then
						local item_data = slot_data.item_data
						local item_template = BackendUtils.get_item_template(item_data)

						if item_name ~= "wpn_side_objective_tome_01" and item_template.name == "wpn_side_objective_tome_01" then
							local local_human = not player.remote and not player.bot_player

							Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "discarded_tome", player)

							if local_bot_or_human then
								Managers.chat:send_system_chat_message(1, "system_chat_player_discarded_tome", player.name(player))
							end
						elseif item_name ~= "wpn_grimoire_01" and item_template.name == "wpn_grimoire_01" then
							local local_human = not player.remote and not player.bot_player

							Managers.state.event:trigger("add_coop_feedback", player.stats_id(player), local_human, "discarded_grimoire", player)

							if local_bot_or_human then
								Managers.chat:send_system_chat_message(1, "system_chat_player_discarded_grimoire", player.name(player))
							end
						end
					end
				end

				local local_pickup_sound = pickup_settings.local_pickup_sound
				local play_sound = ((local_pickup_sound and local_bot_or_human) or not local_pickup_sound) and not player.bot_player

				if play_sound then
					local pickup_sound_event_func = pickup_settings.pickup_sound_event_func
					local sound_event = (pickup_sound_event_func and pickup_sound_event_func(interactor_unit, interactable_unit, data)) or pickup_settings.pickup_sound_event

					if sound_event then
						local wwise_world = Managers.world:wwise_world(world)

						WwiseWorld.trigger_event(wwise_world, sound_event)
					end
				end

				if local_bot_or_human then
					local dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")
					local event_data = FrameTable.alloc_table()
					event_data.pickup_name = Unit.get_data(interactable_unit, "interaction_data", "hud_description")

					dialogue_input.trigger_dialogue_event(dialogue_input, "on_pickup", event_data)

					local pickup_name = Unit.get_data(interactable_unit, "interaction_data", "hud_description")
					local target_name = ScriptUnit.extension(interactor_unit, "dialogue_system").context.player_profile

					SurroundingAwareSystem.add_event(interactor_unit, "on_other_pickup", DialogueSettings.default_view_distance, "pickup_name", pickup_name, "target_name", target_name)

					local statistics_db = data.statistics_db
					local pickup_name = pickup_extension.pickup_name
					local pickup_spawn_type = pickup_extension.spawn_type
					local pickup_position = POSITION_LOOKUP[interactable_unit]

					Managers.telemetry.events:player_pickup(player, pickup_name, pickup_spawn_type, pickup_position)

					local lorebook_page_name = pickup_settings.lorebook_page_name

					if lorebook_page_name then
						local id = LorebookPageLookup[lorebook_page_name]

						StatisticsUtil.unlock_lorebook_page(id, statistics_db)
					end

					if pickup_settings.hide_on_pickup then
						pickup_extension.hide(pickup_extension)
					end

					if pickup_settings.type == "inventory_item" then
						local slot_name = pickup_settings.slot_name
						local item_name = pickup_settings.item_name
						local unit_template = nil
						local extra_extension_init_data = {}
						local is_limited_item = ScriptUnit.has_extension(interactable_unit, "limited_item_track_system")

						if is_limited_item then
							local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")
							local id = limited_item_extension.id
							local spawner_unit = limited_item_extension.spawner_unit
							unit_template = "weapon_unit_ammo_limited"
							extra_extension_init_data.limited_item_track_system = {
								spawner_unit = spawner_unit,
								id = id
							}
						end

						local wielded_slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)

						if pickup_settings.wield_on_pickup or wielded_slot_name == slot_name then
							CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
						end

						local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)
						local item_data = ItemMasterList[item_name]

						inventory_extension.destroy_slot(inventory_extension, slot_name)
						inventory_extension.add_equipment(inventory_extension, slot_name, item_data, unit_template, extra_extension_init_data)

						if not LEVEL_EDITOR_TEST then
							local unit_object_id = Managers.state.unit_storage:go_id(interactor_unit)
							local slot_id = NetworkLookup.equipment_slots[slot_name]
							local item_id = NetworkLookup.item_names[item_name]
							local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

							if is_limited_item then
								local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")
								local id = limited_item_extension.id
								local spawner_unit = limited_item_extension.spawner_unit
								local spawner_unit_id = Managers.state.network:level_object_id(spawner_unit)

								if data.is_server then
									network_manager.network_transmit:send_rpc_clients("rpc_add_equipment_limited_item", unit_object_id, slot_id, item_id, spawner_unit_id, id)
								else
									network_manager.network_transmit:send_rpc_server("rpc_add_equipment_limited_item", unit_object_id, slot_id, item_id, spawner_unit_id, id)
								end
							elseif data.is_server then
								network_manager.network_transmit:send_rpc_clients("rpc_add_equipment", unit_object_id, slot_id, item_id, weapon_skin_id)
							else
								network_manager.network_transmit:send_rpc_server("rpc_add_equipment", unit_object_id, slot_id, item_id, weapon_skin_id)
							end

							if slot_data then
								local item_data = slot_data.item_data
								local item_template = BackendUtils.get_item_template(item_data)
								local pickup_data = item_template.pickup_data

								if pickup_data then
									local position = POSITION_LOOKUP[interactable_unit]
									local rotation = Unit.local_rotation(interactable_unit, 0)
									local pickup_spawn_type = "dropped"
									local pickup_name = pickup_data.pickup_name
									local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
									local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
									local network_manager = Managers.state.network

									network_manager.network_transmit:send_rpc_server("rpc_spawn_pickup", pickup_name_id, position, rotation, pickup_spawn_type_id)
								end
							end

							local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

							if pickup_settings.consumable_item and not data.is_server then
								buff_extension.trigger_procs(buff_extension, "on_consumable_picked_up", interactable_unit, pickup_settings)
							end

							if pickup_settings.dupable and pickup_extension.spawn_type ~= "dropped" then
								local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.NOT_CONSUME_PICKUP)

								if procced then
									local pickup_name = pickup_extension.pickup_name

									_drop_pickup(interactor_unit, pickup_name)
								end
							end
						end

						if pickup_settings.wield_on_pickup or wielded_slot_name == slot_name then
							inventory_extension.wield(inventory_extension, slot_name)
						end
					elseif pickup_settings.type == "explosive_inventory_item" then
						local slot_name = pickup_settings.slot_name
						local item_name = pickup_settings.item_name
						local time_of_explosion = nil

						if ScriptUnit.has_extension(interactable_unit, "projectile_system") then
							local projectile_extension = ScriptUnit.extension(interactable_unit, "projectile_system")
							time_of_explosion = projectile_extension.stop_time
						end

						local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
						local death_extension = ScriptUnit.extension(interactable_unit, "death_system")
						local unit_template = "explosive_weapon_unit_ammo"
						local extra_extension_init_data = {
							health_system = {
								in_hand = true,
								owner_unit = interactor_unit,
								ignored_damage_types = {
									temporary_health_degen = true,
									kinetic = true,
									damage_over_time = true,
									buff = true,
									vomit_face = true,
									health_degen = true,
									vomit_ground = true,
									wounded_dot = true,
									heal = true
								},
								health = health_extension.health,
								damage = health_extension.damage,
								item_name = item_name
							},
							death_system = {
								death_reaction_template = death_extension.death_reaction_template
							}
						}

						if health_extension.ignited then
							extra_extension_init_data.health_system.health_data = health_extension.health_data(health_extension)
						end

						local is_limited_item = ScriptUnit.has_extension(interactable_unit, "limited_item_track_system")

						if is_limited_item then
							local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")
							local id = limited_item_extension.id
							local spawner_unit = limited_item_extension.spawner_unit
							unit_template = "explosive_weapon_unit_ammo_limited"
							extra_extension_init_data.limited_item_track_system = {
								spawner_unit = spawner_unit,
								id = id
							}
						end

						local item_data = ItemMasterList[item_name]

						inventory_extension.add_equipment(inventory_extension, slot_name, item_data, unit_template, extra_extension_init_data)

						if not LEVEL_EDITOR_TEST then
							local unit_object_id = Managers.state.unit_storage:go_id(interactor_unit)
							local slot_id = NetworkLookup.equipment_slots[slot_name]
							local item_id = NetworkLookup.item_names[item_name]
							local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

							if data.is_server then
								if is_limited_item then
									local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")
									local id = limited_item_extension.id
									local spawner_unit = limited_item_extension.spawner_unit
									local spawner_unit_id = Managers.state.network:level_object_id(spawner_unit)

									network_manager.network_transmit:send_rpc_clients("rpc_add_equipment_limited_item", unit_object_id, slot_id, item_id, spawner_unit_id, id)
								else
									network_manager.network_transmit:send_rpc_clients("rpc_add_equipment", unit_object_id, slot_id, item_id, weapon_skin_id)
								end
							elseif is_limited_item then
								local limited_item_extension = ScriptUnit.extension(interactable_unit, "limited_item_track_system")
								local id = limited_item_extension.id
								local spawner_unit = limited_item_extension.spawner_unit
								local spawner_unit_id = Managers.state.network:level_object_id(spawner_unit)

								network_manager.network_transmit:send_rpc_server("rpc_add_equipment_limited_item", unit_object_id, slot_id, item_id, spawner_unit_id, id)
							else
								network_manager.network_transmit:send_rpc_server("rpc_add_equipment", unit_object_id, slot_id, item_id, weapon_skin_id)
							end
						end

						if pickup_settings.wield_on_pickup then
							CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
							inventory_extension.wield(inventory_extension, slot_name)
						end
					elseif pickup_settings.type == "ammo" then
						if local_human then
							local hud_extension = ScriptUnit.extension(interactor_unit, "hud_system")

							hud_extension.set_picked_up_ammo(hud_extension, true)
						end

						inventory_extension.add_ammo_from_pickup(inventory_extension, pickup_settings)
					elseif pickup_settings.mission_name then
						local mission_name = pickup_settings.mission_name
						local mission_name_id = NetworkLookup.mission_names[mission_name]
						local network_transmit = network_manager.network_transmit

						network_transmit.send_rpc_server(network_transmit, "rpc_request_mission", mission_name_id)
						network_transmit.send_rpc_server(network_transmit, "rpc_request_mission_update", mission_name_id, true)
					elseif pickup_settings.type == "lorebook_page" then
						local level_key = Managers.state.game_mode:level_key()
						local pages = table.clone(LorebookCollectablePages[level_key])

						table.shuffle(pages)

						local num_pages = #pages
						local local_player = Managers.player:local_player()
						local stats_id = local_player.stats_id(local_player)

						for i = 1, num_pages, 1 do
							local category_name = pages[i]
							local id = LorebookCategoryLookup[category_name]
							local unlocked = statistics_db.get_persistent_array_stat(statistics_db, stats_id, "lorebook_unlocks", id)

							if not unlocked then
								StatisticsUtil.unlock_lorebook_page(id, statistics_db)
								Managers.state.event:trigger("add_personal_feedback", player.stats_id(player) .. id, local_human, "picked_up_lorebook_page", category_name)

								break
							end
						end
					end
				end
			end

			return 
		end,
		get_progress = function (data, config, t)
			if data.duration == 0 then
				return nil
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / data.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config, world)
			local return_value = not Unit.get_data(interactable_unit, "interaction_data", "used")
			local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")
			local pickup_settings = pickup_extension.get_pickup_settings(pickup_extension)
			local slot_name = pickup_settings.slot_name
			local fail_reason = nil

			if return_value and pickup_extension.can_interact then
				return_value = pickup_extension.can_interact(pickup_extension)
			end

			if return_value and pickup_settings.can_interact_func then
				return_value = pickup_settings.can_interact_func(interactor_unit, interactable_unit, data)
			end

			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local item_data, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)

			if return_value and item_data then
				local current_action_settings, current_action_extension, current_action_hand = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

				if current_action_settings and current_action_settings.block_pickup then
					return_value = false
				end
			end

			if return_value and slot_name == "slot_level_event" then
				local wielded_slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)

				if wielded_slot_name == "slot_level_event" then
					return_value = false
				end
			end

			slot_data = slot_name and inventory_extension.get_slot_data(inventory_extension, slot_name)
			local item_template = slot_data and inventory_extension.get_item_template(inventory_extension, slot_data)

			if return_value and slot_name and item_template and slot_name == "slot_potion" and item_template.is_grimoire then
				fail_reason = "grimoire_equipped"
				return_value = false
			end

			local pickup_item_name = pickup_settings.item_name
			local slot_item_name = inventory_extension.get_item_name(inventory_extension, slot_name)
			local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

			if return_value and pickup_item_name and slot_item_name and pickup_item_name == slot_item_name and (not buff_extension.has_buff_type(buff_extension, "not_consume_pickup") or not pickup_settings.dupable or pickup_extension.spawn_type == "dropped") then
				fail_reason = "already_equipped"
				return_value = false
			end

			if return_value and ScriptUnit.has_extension(interactable_unit, "death_system") then
				local death_extension = ScriptUnit.extension(interactable_unit, "death_system")
				local death_reaction_data = death_extension.death_reaction_data

				if death_reaction_data and death_reaction_data.exploded then
					return_value = false
				end
			end

			if return_value and pickup_settings.type == "ammo" and inventory_extension.has_full_ammo(inventory_extension) then
				fail_reason = "ammo_full"
				return_value = false
			end

			return return_value, fail_reason
		end,
		hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
			local interaction_action_description = "interaction_action_pick_up"

			if not Managers.state.unit_spawner:is_marked_for_deletion(interactable_unit) then
				if fail_reason then
					if fail_reason == "already_equipped" then
						local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")
						local pickup_settings = pickup_extension.get_pickup_settings(pickup_extension)

						if not pickup_settings.item_description then
							table.dump(pickup_settings)
						end

						interaction_action_description = "interaction_action_already_equipped"
					elseif fail_reason == "ammo_full" then
						interaction_action_description = "interaction_action_ammo_full"
					elseif fail_reason == "grimoire_equipped" then
						interaction_action_description = "interaction_action_grimoire_equipped"
					end
				else
					local pickup_extension = ScriptUnit.extension(interactable_unit, "pickup_system")
					local pickup_settings = pickup_extension.get_pickup_settings(pickup_extension)
					local pickup_item_name = pickup_settings.item_name
					local slot_name = pickup_settings.slot_name
					local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
					local slot_item_name = inventory_extension.get_item_name(inventory_extension, slot_name)
					local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

					if pickup_item_name and slot_item_name and pickup_item_name == slot_item_name and buff_extension.has_buff_type(buff_extension, "not_consume_pickup") and pickup_settings.dupable and pickup_extension.spawn_type ~= "dropped" then
						interaction_action_description = "trinket_not_consume_pickup_tier1"
					end
				end
			end

			return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), interaction_action_description
		end
	}
}
InteractionDefinitions.give_item = {
	config = {
		allow_movement = true,
		duration = 0,
		hold = false,
		block_other_interactions = true
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local interactor_health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local interactor_status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if interactor_status_extension.is_knocked_down(interactor_status_extension) or not interactor_health_extension.is_alive(interactor_health_extension) then
				return InteractionResult.FAILURE
			end

			if interactor_status_extension.is_disabled(interactor_status_extension) then
				return InteractionResult.FAILURE
			end

			local interactable_health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local interactable_status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if interactable_status_extension.is_knocked_down(interactable_status_extension) or not interactable_health_extension.is_alive(interactable_health_extension) then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local can_receive_item = not status_extension.is_disabled(status_extension)

			return can_receive_item
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			if result == InteractionResult.SUCCESS then
				local player_manager = Managers.player
				local interactor_player = player_manager.owner(player_manager, interactor_unit)

				if interactor_player and not interactor_player.remote then
					local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
					local interactor_data = data.interactor_data
					local item_slot_name = interactor_data.item_slot_name
					local slot_data = inventory_extension.get_slot_data(inventory_extension, item_slot_name)

					if slot_data then
						local template = inventory_extension.get_item_template(inventory_extension, slot_data)

						if template.can_give_other then
							local ammo_extension = inventory_extension.get_item_slot_extension(inventory_extension, item_slot_name, "ammo_system")

							ammo_extension.use_ammo(ammo_extension, 1)

							if not LEVEL_EDITOR_TEST then
								local interactor_game_object_id = Managers.state.unit_storage:go_id(interactor_unit)
								local game_object_id = Managers.state.unit_storage:go_id(interactable_unit)
								local slot_id = NetworkLookup.equipment_slots[item_slot_name]
								local item_name_id = NetworkLookup.item_names[slot_data.item_data.name]
								local position = POSITION_LOOKUP[interactable_unit] + Vector3(0, 0, 1.5)

								Managers.state.network.network_transmit:send_rpc_server("rpc_give_equipment", interactor_game_object_id, game_object_id, slot_id, item_name_id, position)
							end
						end
					end
				end
			end

			return 
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			if not ScriptUnit.has_extension(interactable_unit, "health_system") then
				return false
			end

			if not ScriptUnit.has_extension(interactable_unit, "status_system") then
				return false
			end

			local owner_player = Managers.player:unit_owner(interactor_unit)
			local is_bot = owner_player and owner_player.bot_player
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_alive = health_extension.is_alive(health_extension) and not status_extension.is_knocked_down(status_extension)
			local interactor_inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local item_template = interactor_inventory_extension.get_wielded_slot_item_template(interactor_inventory_extension)

			if not item_template then
				return false
			end

			local target_inventory_extension = ScriptUnit.extension(interactable_unit, "inventory_system")
			local slot_name = (Managers.input:is_device_active("gamepad") and interactor_inventory_extension.get_selected_consumable_slot_name(interactor_inventory_extension)) or interactor_inventory_extension.get_wielded_slot_name(interactor_inventory_extension)
			local slot_occupied = target_inventory_extension.get_slot_data(target_inventory_extension, slot_name)

			return is_alive and item_template.can_give_other and not slot_occupied
		end,
		set_interactor_data = function (interactor_unit, interactable_unit, interactor_data)
			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local wielded_slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
			interactor_data.item_slot_name = wielded_slot_name

			return 
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				return display_name, "interaction_action_give"
			end

			return 
		end
	}
}
InteractionDefinitions.heal = {
	config = {
		block_other_interactions = true,
		hold = true,
		swap_to_3p = true,
		duration = 2,
		attack_template = "heal_bandage"
	},
	server = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.done_time = t + config.duration

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			local interactor_health_extension = ScriptUnit.extension(interactor_unit, "health_system")
			local interactor_status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if interactor_status_extension.is_knocked_down(interactor_status_extension) or not interactor_health_extension.is_alive(interactor_health_extension) then
				return InteractionResult.FAILURE
			end

			if interactor_status_extension.is_disabled(interactor_status_extension) then
				return InteractionResult.FAILURE
			end

			local interactable_health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local interactable_status_extension = ScriptUnit.extension(interactor_unit, "status_system")

			if interactable_status_extension.is_knocked_down(interactable_status_extension) or not interactable_health_extension.is_alive(interactable_health_extension) then
				return InteractionResult.FAILURE
			end

			if data.done_time < t then
				return InteractionResult.SUCCESS
			end

			return InteractionResult.ONGOING
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			if result == InteractionResult.SUCCESS then
				local attack_template = AttackTemplates[config.attack_template]
				local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
				local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

				if interactor_unit == interactable_unit and buff_extension.has_buff_type(buff_extension, "trait_necklace_no_healing_health_regen") then
					return 
				end

				if attack_template.heal_type == "bandage" then
					local damage_taken = health_extension.get_damage_taken(health_extension)
					local heal_amount = damage_taken * attack_template.heal_percent

					DamageUtils.heal_network(interactable_unit, interactor_unit, heal_amount, attack_template.heal_type)
				else
					DamageUtils.heal_network(interactable_unit, interactor_unit, attack_template.heal_amount, attack_template.heal_type)
				end

				if interactor_unit ~= interactable_unit then
					local health_extension = ScriptUnit.extension(interactor_unit, "health_system")
					local damage_taken = health_extension.get_damage_taken(health_extension)
					local heal_amount_self = buff_extension.apply_buffs_to_value(buff_extension, damage_taken, StatBuffIndex.HEAL_SELF_ON_HEAL_OTHER)
					heal_amount_self = heal_amount_self - damage_taken

					DamageUtils.heal_network(interactor_unit, interactor_unit, heal_amount_self, "bandage_trinket")
				end

				local player_manager = Managers.player
				local interactor_player = player_manager.unit_owner(player_manager, interactor_unit)
				local interactable_player = player_manager.unit_owner(player_manager, interactable_unit)
				local interactable_pos = POSITION_LOOKUP[interactable_unit]

				_add_heal_telemetry(interactor_player, interactable_player, interactable_pos)
			end

			return 
		end,
		can_interact = function (interactor_unit, interactable_unit)
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_knocked_down = status_extension.is_knocked_down(status_extension)
			local is_dead = status_extension.is_dead(status_extension)
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local has_max_health = 1 <= health_extension.current_permanent_health_percent(health_extension)

			return not is_knocked_down and not is_dead and not has_max_health
		end
	},
	client = {
		start = function (world, interactor_unit, interactable_unit, data, config, t)
			data.start_time = t
			local interactor_dialogue_input = ScriptUnit.extension_input(interactor_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.target = interactable_unit
			event_data.target_name = ScriptUnit.extension(interactable_unit, "dialogue_system").context.player_profile

			interactor_dialogue_input.trigger_dialogue_event(interactor_dialogue_input, "heal_start", event_data)

			return 
		end,
		update = function (world, interactor_unit, interactable_unit, data, config, dt, t)
			return 
		end,
		stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
			data.start_time = nil

			Unit.animation_event(interactor_unit, "interaction_end")

			local owner_player = Managers.player:unit_owner(interactor_unit)

			if result == InteractionResult.SUCCESS then
				if not owner_player.remote then
					local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
					local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
					local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.NOT_CONSUME_MEDPACK)

					if interactor_unit == interactable_unit and buff_extension.has_buff_type(buff_extension, "trait_necklace_no_healing_health_regen") then
						return 
					end

					if not procced then
						local interactor_data = data.interactor_data
						local item_slot_name = interactor_data.item_slot_name
						local slot_data = inventory_extension.get_slot_data(inventory_extension, item_slot_name)

						if slot_data then
							local template = inventory_extension.get_item_template(inventory_extension, slot_data)

							if (template.can_heal_self and interactor_unit == interactable_unit) or (template.can_heal_other and interactor_unit ~= interactable_unit) then
								local ammo_extension = inventory_extension.get_item_slot_extension(inventory_extension, item_slot_name, "ammo_system")

								ammo_extension.use_ammo(ammo_extension, 1)
							end
						end
					else
						inventory_extension.wield_previous_weapon(inventory_extension)
					end
				end

				local interactable_dialogue_input = ScriptUnit.extension_input(interactable_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.healer = interactor_unit
				event_data.healer_name = ScriptUnit.extension(interactor_unit, "dialogue_system").context.player_profile

				interactable_dialogue_input.trigger_dialogue_event(interactable_dialogue_input, "heal_completed", event_data)
				StatisticsUtil.register_heal(interactor_unit, interactable_unit, data.statistics_db)
			end

			return 
		end,
		get_progress = function (data, config, t)
			if config.duration == 0 then
				return 0
			end

			return (data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
		end,
		can_interact = function (interactor_unit, interactable_unit, data, config)
			if not ScriptUnit.has_extension(interactable_unit, "health_system") then
				return false
			end

			if not ScriptUnit.has_extension(interactable_unit, "status_system") then
				return false
			end

			local owner_player = Managers.player:unit_owner(interactor_unit)
			local is_bot = owner_player and owner_player.bot_player
			local health_extension = ScriptUnit.extension(interactable_unit, "health_system")
			local status_extension = ScriptUnit.extension(interactable_unit, "status_system")
			local is_alive = health_extension.is_alive(health_extension) and not status_extension.is_knocked_down(status_extension)
			local has_max_health = 1 <= health_extension.current_permanent_health_percent(health_extension)
			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local item_template = inventory_extension.get_wielded_slot_item_template(inventory_extension)

			if not item_template then
				return false
			end

			local interactor_has_medpack = item_template.can_heal_other

			return interactor_has_medpack and is_alive and not has_max_health
		end,
		set_interactor_data = function (interactor_unit, interactable_unit, interactor_data)
			local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
			local wielded_slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)
			interactor_data.item_slot_name = wielded_slot_name

			return 
		end,
		hud_description = function (interactable_unit, data, config)
			if interactable_unit and Unit.alive(interactable_unit) then
				local player_manager = Managers.player
				local profile_synchronizer = Managers.state.network.profile_synchronizer
				local display_name = ""
				local player = player_manager.owner(player_manager, interactable_unit)

				if player then
					local network_id = player.network_id(player)
					local local_player_id = player.local_player_id(player)
					local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, network_id, local_player_id)
					local profile_settings = SPProfiles[profile_index]
					display_name = profile_settings.ingame_display_name
				end

				local t = Managers.time:time("game")
				local interaction_progress = (config.duration and data.start_time == nil and 0) or math.min(1, (t - data.start_time) / config.duration)
				local is_interacting = interaction_progress and 0 < interaction_progress
				local interaction_action_description = (is_interacting and "interaction_action_healing") or "interaction_action_heal"

				return display_name, interaction_action_description
			end

			return 
		end,
		camera_node = function (interactor_unit, interactable_unit)
			if interactor_unit == interactable_unit then
				return "heal_self"
			else
				return "heal_other"
			end

			return 
		end
	}
}
InteractionDefinitions.linker_transportation_unit = InteractionDefinitions.linker_transportation_unit or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.linker_transportation_unit.config.swap_to_3p = false
InteractionDefinitions.linker_transportation_unit.client.hud_description = function (interactable_unit, data, config, key_tail)
	local interaction_action_description = "interaction_action_activate"

	if key_tail then
		if key_tail == "enemies_inside" then
			interaction_action_description = "interaction_action_hostiles_close"
		elseif key_tail == "players_missing" then
			interaction_action_description = "interaction_action_missing_players"
		end
	end

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), interaction_action_description
end
InteractionDefinitions.linker_transportation_unit.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS then
		if Unit.get_data(interactable_unit, "interaction_data", "only_once") then
			Unit.set_data(interactable_unit, "interaction_data", "used", true)
		end

		local transportation_extension = ScriptUnit.extension(interactable_unit, "transportation_system")

		transportation_extension.interacted_with(transportation_extension, interactor_unit)
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", false)

	return 
end
local player_units = {}
InteractionDefinitions.linker_transportation_unit.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local transport_extension = ScriptUnit.extension(interactable_unit, "transportation_system")
	local can_interact = transport_extension.can_interact(transport_extension, interactor_unit)
	local used = Unit.get_data(interactable_unit, "interaction_data", "used")

	if used or not can_interact then
		return false
	end

	local units_inside_oobb = transport_extension.units_inside_oobb

	if units_inside_oobb then
		if 0 < units_inside_oobb.ai.count then
			return false, "enemies_inside"
		end

		local humans_inside = units_inside_oobb.human.count
		local alive_players = 0
		local PLAYER_UNITS = PLAYER_UNITS
		local ScriptUnit_extension = ScriptUnit.extension
		local num_player_units = #PLAYER_UNITS

		for i = 1, num_player_units, 1 do
			local player_unit = PLAYER_UNITS[i]
			local health_extension = ScriptUnit_extension(player_unit, "health_system")
			local status_extension = ScriptUnit_extension(player_unit, "status_system")
			local is_alive = health_extension.is_alive(health_extension)
			local is_ready_for_assisted_respawn = status_extension.is_ready_for_assisted_respawn(status_extension)

			if is_alive and not is_ready_for_assisted_respawn then
				alive_players = alive_players + 1
			end
		end

		if humans_inside < alive_players then
			return false, "players_missing"
		end
	end

	return true
end
InteractionDefinitions.door = InteractionDefinitions.door or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.door.config.swap_to_3p = false
InteractionDefinitions.door.config.block_other_interactions = true
InteractionDefinitions.door.config.allow_movement = true
InteractionDefinitions.door.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS then
		local door_extension = ScriptUnit.extension(interactable_unit, "door_system")

		door_extension.interacted_with(door_extension, interactor_unit)
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", false)

	return 
end
InteractionDefinitions.door.client.hud_description = function (interactable_unit, data, config)
	local door_extension = ScriptUnit.extension(interactable_unit, "door_system")
	local is_open = door_extension.is_open(door_extension)
	local interaction_action_description = (is_open and "interaction_action_close") or "interaction_action_open"

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), interaction_action_description
end
local pickup_params = {}
InteractionDefinitions.chest = InteractionDefinitions.chest or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.chest.config.swap_to_3p = false
InteractionDefinitions.chest.config.block_other_interactions = true
InteractionDefinitions.chest.config.allow_movement = true
InteractionDefinitions.chest.client.start = function (world, interactor_unit, interactable_unit, data, config, t)
	data.start_time = t
	local duration = Unit.get_data(interactable_unit, "interaction_data", "interaction_length")
	data.duration = duration
	local interactor_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation")
	local interactor_animation_time_variable = Unit.get_data(interactable_unit, "interaction_data", "interactor_animation_time_variable")
	local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

	if interactor_animation_name then
		local interactor_animation_time_variable = Unit.animation_find_variable(interactor_unit, interactor_animation_time_variable)

		Unit.animation_set_variable(interactor_unit, interactor_animation_time_variable, duration)
		Unit.animation_event(interactor_unit, interactor_animation_name)
	end

	local interactable_animation_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation")
	local interactable_animation_time_variable_name = Unit.get_data(interactable_unit, "interaction_data", "interactable_animation_time_variable")

	if interactable_animation_name then
		local interactable_animation_time_variable = Unit.animation_find_variable(interactable_unit, interactable_animation_time_variable_name)

		Unit.animation_set_variable(interactable_unit, interactable_animation_time_variable, duration)
		Unit.animation_event(interactable_unit, interactable_animation_name)
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", true)

	return 
end
InteractionDefinitions.chest.server.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil
	local success = result == InteractionResult.SUCCESS
	local can_spawn_dice = Unit.get_data(interactable_unit, "can_spawn_dice")

	if not can_spawn_dice then
		return 
	end

	table.clear(pickup_params)

	local pickup_name = "loot_die"
	local dice_keeper = data.dice_keeper
	local pickup_settings = AllPickups[pickup_name]
	pickup_params.dice_keeper = dice_keeper

	if success and pickup_settings.can_spawn_func(pickup_params) then
		local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
		local rand = math.random()
		local chance = dice_keeper.chest_loot_dice_chance(dice_keeper)
		chance = buff_extension.apply_buffs_to_value(buff_extension, chance, StatBuffIndex.INCREASE_LUCK)

		if rand < chance then
			local extension_init_data = {
				pickup_system = {
					has_physics = true,
					spawn_type = "rare",
					pickup_name = pickup_name
				}
			}
			local unit_name = pickup_settings.unit_name
			local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"
			local position = Unit.local_position(interactable_unit, 0) + Vector3(0, 0, 0.3)
			local rotation = Unit.local_rotation(interactable_unit, 0)

			Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
			dice_keeper.bonus_dice_spawned(dice_keeper)
		end
	end

	Unit.set_data(interactable_unit, "interaction_data", "being_used", false)

	return 
end
InteractionDefinitions.inventory_access = InteractionDefinitions.inventory_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.inventory_access.config.swap_to_3p = false
InteractionDefinitions.inventory_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.inventory_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "overview"
		local menu_sub_state = "equipment"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state, menu_sub_state)
	end

	return 
end
InteractionDefinitions.inventory_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.prestige_access = InteractionDefinitions.prestige_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.prestige_access.config.swap_to_3p = false
InteractionDefinitions.prestige_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.prestige_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "overview"
		local menu_sub_state = "prestige"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state, menu_sub_state)
	end

	return 
end
InteractionDefinitions.prestige_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return false
end
InteractionDefinitions.prestige_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.forge_access = InteractionDefinitions.forge_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.forge_access.config.swap_to_3p = false
InteractionDefinitions.forge_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "overview"
		local menu_sub_state = "forge"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state, menu_sub_state)
	end

	return 
end
InteractionDefinitions.forge_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.forge_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.talents_access = InteractionDefinitions.talents_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.talents_access.config.swap_to_3p = false
InteractionDefinitions.talents_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "overview"
		local menu_sub_state = "talents"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state, menu_sub_state)
	end

	return 
end
InteractionDefinitions.talents_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.talents_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.cosmetics_access = InteractionDefinitions.cosmetics_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.cosmetics_access.config.swap_to_3p = false
InteractionDefinitions.cosmetics_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "overview"
		local menu_sub_state = "cosmetics"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state, menu_sub_state)
	end

	return 
end
InteractionDefinitions.cosmetics_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.cosmetics_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.loot_access = InteractionDefinitions.loot_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.loot_access.config.swap_to_3p = false
InteractionDefinitions.loot_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "loot"

		data.ingame_ui:transition_with_fade("hero_view_force", menu_state)
	end

	return 
end
InteractionDefinitions.loot_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.loot_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.characters_access = InteractionDefinitions.characters_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.characters_access.config.swap_to_3p = false
InteractionDefinitions.characters_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "character"

		data.ingame_ui:transition_with_fade("character_selection_force", menu_state)
	end

	return 
end
InteractionDefinitions.characters_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.characters_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.altar_access = InteractionDefinitions.altar_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.altar_access.config.swap_to_3p = false
InteractionDefinitions.altar_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		data.ingame_ui:transition_with_fade("altar_view_force")
	end

	return 
end
InteractionDefinitions.altar_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return false
end
InteractionDefinitions.quest_access = InteractionDefinitions.quest_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.quest_access.config.swap_to_3p = false
InteractionDefinitions.quest_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		data.ingame_ui:transition_with_fade("quest_view_force")
	end

	return 
end
InteractionDefinitions.quest_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local can_use = false
	local backend_settings = GameSettingsDevelopment.backend_settings
	local can_interact = can_use and backend_settings.quests_enabled
	local fail_reason = not can_interact and "quest_access_locked"

	return can_interact, fail_reason
end
InteractionDefinitions.quest_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	if fail_reason and fail_reason == "quest_access_locked" then
		return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "dlc1_3_1_interact_open_quests_blocked"
	end

	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.journal_access = InteractionDefinitions.journal_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.journal_access.config.swap_to_3p = false
InteractionDefinitions.journal_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		data.ingame_ui:transition_with_fade("lorebook_view_force")
	end

	return 
end
InteractionDefinitions.journal_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end
InteractionDefinitions.map_access = InteractionDefinitions.map_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.map_access.config.swap_to_3p = false
InteractionDefinitions.map_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local menu_state = "play"

		data.ingame_ui:transition_with_fade("start_game_view_force", menu_state)
	end

	return 
end
InteractionDefinitions.map_access.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), "interaction_action_open"
end
InteractionDefinitions.map_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()

	return not is_game_matchmaking
end
InteractionDefinitions.unlock_key_access = InteractionDefinitions.unlock_key_access or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.unlock_key_access.config.swap_to_3p = false
InteractionDefinitions.unlock_key_access.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		data.ingame_ui:transition_with_fade("unlock_key_force")
	end

	return 
end
InteractionDefinitions.unlock_key_access.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return true
end

for k, v in pairs(InteractionDefinitions) do
	if v.client.camera_node == nil then
		v.client.camera_node = function ()
			return k
		end
	end

	if v.client.hud_description == nil then
		v.client.hud_description = function ()
			return "interact_" .. k
		end
	end
end

InteractionDefinitions.pictureframe = InteractionDefinitions.pictureframe or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.pictureframe.config.swap_to_3p = false
InteractionDefinitions.pictureframe.client.stop = function (world, interactor_unit, interactable_unit, data, config, t, result)
	data.start_time = nil

	if result == InteractionResult.SUCCESS and not data.is_husk then
		local decoration_system = Managers.state.entity:system("keep_decoration_system")

		decoration_system.interacted_with(decoration_system, interactable_unit)
	end

	return 
end
InteractionDefinitions.pictureframe.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	local decoration_system = Managers.state.entity:system("keep_decoration_system")
	local can_interact = decoration_system.can_interact(decoration_system, interactable_unit)

	return can_interact
end
InteractionDefinitions.pictureframe.client.hud_description = function (interactable_unit, data, config, fail_reason, interactor_unit)
	return Unit.get_data(interactable_unit, "interaction_data", "hud_description"), Unit.get_data(interactable_unit, "interaction_data", "hud_interaction_action")
end
InteractionDefinitions.no_interaction_hud_only = InteractionDefinitions.no_interaction_hud_only or table.clone(InteractionDefinitions.smartobject)
InteractionDefinitions.no_interaction_hud_only.client.hud_description = function (interactable_unit, data, config, key_tail)
	local hud_text_line_1 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_1")
	local hud_text_line_2 = Unit.get_data(interactable_unit, "interaction_data", "hud_text_line_2")

	return hud_text_line_1, hud_text_line_2
end
InteractionDefinitions.no_interaction_hud_only.client.can_interact = function (interactor_unit, interactable_unit, data, config)
	return false, ""
end

return 
