require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTQuickTeleportAction = class(BTQuickTeleportAction, BTNode)

BTQuickTeleportAction.init = function (self, ...)
	BTQuickTeleportAction.super.init(self, ...)
end

BTQuickTeleportAction.name = "BTQuickTeleportAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTQuickTeleportAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTQuickTeleportAction

	if action.sound_event then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(action.sound_event, unit)
	end

	if blackboard.action.force_teleport then
		blackboard.quick_teleport = true
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	if action.teleport_start_anim then
		Managers.state.network:anim_event(unit, randomize(action.teleport_start_anim))
	end

	if action.push_close_players then
		blackboard.hit_units = {}
	end

	if blackboard.action.teleport_start_function then
		blackboard.action.teleport_start_function(unit, blackboard)
	end
end

BTQuickTeleportAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.quick_teleport_exit_pos = nil
	blackboard.active_node = nil
	blackboard.quick_teleport = false
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	blackboard.face_player_when_teleporting = false

	if blackboard.action.push_close_players then
		blackboard.hit_units = nil
	end
end

BTQuickTeleportAction.run = function (self, unit, blackboard, t, dt)
	if not blackboard.action.teleport_start_anim then
		self:anim_cb_teleport_start_finished(unit, blackboard)
	end

	if not blackboard.action.teleport_end_anim then
		self:anim_cb_teleport_end_finished(unit, blackboard)
	end

	if not blackboard.quick_teleport then
		return "done"
	end

	return "running"
end

BTQuickTeleportAction.play_teleport_effect = function (self, unit, blackboard, start_position, end_position)
	local action = blackboard.action
	local teleport_effect = action.teleport_effect

	if teleport_effect then
		local effect_name_id = NetworkLookup.effects[teleport_effect]
		local node_id = 0
		local rotation_offset = Quaternion.identity()
		local network_manager = Managers.state.network

		network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, start_position, rotation_offset, false)

		if not action.teleport_end_effect then
			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, end_position, rotation_offset, false)
		end
	end

	local teleport_effect_trail = action.teleport_effect_trail

	if teleport_effect_trail then
		local network_manager = Managers.state.network
		local node_id = 0
		local dir = Vector3.normalize(start_position - end_position)
		local trail_rotation_offset = Quaternion.look(dir, Vector3.up())
		local trail_effect_name_id = NetworkLookup.effects[teleport_effect_trail]

		network_manager:rpc_play_particle_effect(nil, trail_effect_name_id, NetworkConstants.invalid_game_object_id, node_id, start_position, trail_rotation_offset, false)

		if not action.teleport_end_effect then
			network_manager:rpc_play_particle_effect(nil, trail_effect_name_id, NetworkConstants.invalid_game_object_id, node_id, end_position, trail_rotation_offset, false)
		end
	end

	local breed = blackboard.breed
	local audio_system_extension = Managers.state.entity:system("audio_system")

	if breed.teleport_sound_event then
		audio_system_extension:play_audio_unit_event(breed.teleport_sound_event, unit)
	end
end

BTQuickTeleportAction.anim_cb_teleport_start_finished = function (self, unit, blackboard)
	local entrance_position = POSITION_LOOKUP[unit]
	local teleport_position = nil
	local teleport_pos_func = blackboard.action.teleport_pos_func

	if teleport_pos_func then
		teleport_position = teleport_pos_func(unit, blackboard)
	else
		teleport_position = blackboard.quick_teleport_exit_pos:unbox()
	end

	if not teleport_position then
		return
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_navbot_position(teleport_position)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:teleport_to(teleport_position)
	Managers.state.entity:system("ai_bot_group_system"):enemy_teleported(unit, teleport_position)
	self:play_teleport_effect(unit, blackboard, entrance_position, teleport_position)

	if blackboard.action.remove_pings then
		local ping_system = Managers.state.entity:system("ping_system")

		ping_system:remove_ping_from_unit(unit)
	end

	if blackboard.action.push_close_players then
		local side = blackboard.side
		local ENEMY_PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

		for i = 1, #ENEMY_PLAYER_AND_BOT_UNITS do
			local target_unit = ENEMY_PLAYER_AND_BOT_UNITS[i]

			self:push_close_players(unit, blackboard, entrance_position, target_unit)
		end
	end

	local target_unit = blackboard.target_unit

	if blackboard.face_player_when_teleporting and Unit.alive(target_unit) then
		local target_pos = POSITION_LOOKUP[target_unit]
		local look_at_direction_flat = Vector3.flat(target_pos - teleport_position)
		local unit_to_target_rot = Quaternion.look(look_at_direction_flat, Vector3.up())

		Unit.set_local_rotation(unit, 0, unit_to_target_rot)
	end

	if blackboard.action.teleport_end_anim then
		Managers.state.network:anim_event(unit, blackboard.action.teleport_end_anim)
	end

	local t = Managers.time:time("game")
	blackboard.teleport_at_t = t
end

BTQuickTeleportAction.anim_cb_teleport_end_finished = function (self, unit, blackboard)
	blackboard.quick_teleport = false
end

BTQuickTeleportAction.anim_cb_tp_end_enter = function (self, unit, blackboard)
	local action = blackboard.action

	if action.teleport_end_effect then
		local effect_name_id = NetworkLookup.effects[action.teleport_end_effect]
		local node_id = 0
		local rotation_offset = Quaternion.identity()
		local position = POSITION_LOOKUP[unit]
		local network_manager = Managers.state.network

		network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, position, rotation_offset, false)
	end
end

BTQuickTeleportAction.push_close_players = function (self, unit, blackboard, position, target_unit)
	local action = blackboard.action
	local radius = action.radius
	local push_speed = action.push_speed
	local push_speed_z = action.push_speed_z
	local hit_units = blackboard.hit_units
	local pos = POSITION_LOOKUP[target_unit]
	local to_target = pos - position
	local dist = Vector3.length(Vector3.flat(to_target))
	local hit_unit_id = hit_units[target_unit]

	if not hit_unit_id and dist < radius then
		local velocity = push_speed * Vector3.normalize(to_target)

		if push_speed_z then
			Vector3.set_z(velocity, push_speed_z)
		end

		if action.catapult_players then
			StatusUtils.set_catapulted_network(target_unit, true, velocity)
		else
			local locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")

			locomotion_extension:add_external_velocity(velocity)
		end

		hit_units[target_unit] = true
	end
end
