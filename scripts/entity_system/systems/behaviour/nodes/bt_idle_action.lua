-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_idle_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTIdleAction = class(BTIdleAction, BTNode)

BTIdleAction.init = function (self, ...)
	BTIdleAction.super.init(self, ...)
end

BTIdleAction.name = "BTIdleAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTIdleAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local animation = "idle"
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.spawn_to_running = nil

	if action and action.alerted_anims and blackboard.confirmed_player_sighting then
		animation = action.alerted_anims[math.random(1, #action.alerted_anims)]
	elseif action and action.idle_combat and not blackboard.is_passive then
		animation = randomize(action.idle_combat)
	elseif action and action.idle_animation then
		animation = randomize(action.idle_animation)
	elseif blackboard.is_passive and blackboard.spawn_type ~= "horde" and blackboard.spawn_type ~= "horde_hidden" then
		if action and action.animations then
			local anims = action.animations
			local index = action.anim_cycle_index % #anims + 1

			animation = anims[index]
			action.anim_cycle_index = index
		end
	elseif action and action.combat_animations then
		local anims = action.combat_animations
		local index = action.anim_cycle_index % #anims + 1

		animation = anims[index]
		action.anim_cycle_index = index
	end

	local optional_spawn_data = blackboard.optional_spawn_data
	local idle_animation = optional_spawn_data and optional_spawn_data.idle_animation

	if idle_animation and idle_animation ~= "" then
		animation = idle_animation
	end

	if blackboard.move_state ~= "idle" or action and action.force_idle_animation then
		network_manager:anim_event(unit, animation)

		blackboard.move_state = "idle"
	end

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

BTIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)
end

local function player_within_distance(unit, sqr_near_dist, side)
	local pos = POSITION_LOOKUP[unit]
	local player_positions = side.ENEMY_PLAYER_POSITIONS

	for i = 1, #player_positions do
		local player_pos = player_positions[i]
		local sqr_dist = Vector3.distance_squared(pos, player_pos)

		if sqr_dist < sqr_near_dist then
			return side.ENEMY_PLAYER_UNITS[i]
		end
	end
end

BTIdleAction._discovery_sound_when_close = function (self, unit, blackboard)
	local near_distance_sqr = blackboard.action and blackboard.action.sound_when_near_distance_sqr

	if near_distance_sqr and not blackboard.sound_when_near_played then
		local player_unit = player_within_distance(unit, near_distance_sqr, blackboard.side)

		if player_unit then
			local player = Managers.player:unit_owner(player_unit)
			local peer_id = player:network_id()
			local network_manager = Managers.state.network
			local sound_event = blackboard.action.sound_when_near_event
			local sound_id = NetworkLookup.sound_events[sound_event]
			local unit_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, sound_id, unit_id, false, 0)

			blackboard.sound_when_near_played = true
		end
	end
end

local Unit_alive = Unit.alive

BTIdleAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.target_unit
	local action = blackboard.action
	local should_not_face_target = action and action.dont_face_target

	if Unit_alive(target_unit) and not should_not_face_target then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
		self:_discovery_sound_when_close(unit, blackboard)
	end

	return "running"
end
