require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTNinjaVanishAction = class(BTNinjaVanishAction, BTNode)
BTNinjaVanishAction.name = "BTNinjaVanishAction"
local POSITION_LOOKUP = POSITION_LOOKUP
local script_data = script_data

BTNinjaVanishAction.init = function (self, ...)
	BTNinjaVanishAction.super.init(self, ...)
end

local function debug3d(unit, text, color_name)
	if script_data.debug_ai_movement then
		Debug.world_sticky_text(POSITION_LOOKUP[unit], text, color_name)
	end
end

BTNinjaVanishAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data
	blackboard.vanish_timer = 0
	blackboard.skulk_pos = nil
	local vanish_pos = BTNinjaVanishAction.find_escape_position(unit, blackboard)

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	if vanish_pos then
		blackboard.vanish_pos = Vector3Box(vanish_pos)

		Managers.state.network:anim_event(unit, "foff_self")

		blackboard.vanish_timer = t + blackboard.action.foff_anim_length
	elseif blackboard.move_state ~= "idle" then
		Managers.state.network:anim_event(unit, "idle")

		blackboard.move_state = "idle"
	end
end

BTNinjaVanishAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.vanish_timer = nil
	blackboard.vanish_pos = nil
	blackboard.wait_one_frame = nil
	blackboard.ninja_vanish = false

	blackboard.navigation_extension:set_enabled(true)
end

BTNinjaVanishAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.vanish_timer < t then
		if blackboard.wait_one_frame then
			return "done"
		end

		if blackboard.vanish_pos then
			BTNinjaVanishAction.vanish(unit, blackboard)
		end

		blackboard.wait_one_frame = true
	end

	return "running"
end

BTNinjaVanishAction.vanish = function (unit, blackboard)
	local vanish_pos = blackboard.vanish_pos:unbox()

	if script_data.debug_ai_movement then
		QuickDrawerStay:cylinder(vanish_pos, vanish_pos + Vector3(0, 0, 17), 0.4, Color(200, 0, 131), 20)
		QuickDrawerStay:line(POSITION_LOOKUP[unit] + Vector3(0, 0, 4), vanish_pos + Vector3(0, 0, 17), Color(200, 0, 131))
	end

	local network_manager = Managers.state.network

	BTNinjaVanishAction.play_foff(unit, blackboard, network_manager, POSITION_LOOKUP[unit], vanish_pos)
	network_manager:anim_event(unit, "idle")
	blackboard.locomotion_extension:teleport_to(vanish_pos)

	local ai_navigation = blackboard.navigation_extension

	ai_navigation:move_to(vanish_pos)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
	Managers.state.entity:system("ai_bot_group_system"):enemy_teleported(unit, vanish_pos)

	local ping_system = Managers.state.entity:system("ping_system")

	ping_system:remove_ping_from_unit(unit)
end

BTNinjaVanishAction.play_foff = function (unit, blackboard, network_manager, pos, pos2)
	local effect_name_id = NetworkLookup.effects[blackboard.action.effect_name]
	local owner_unit_id = network_manager:unit_game_object_id(unit)
	local node_id = 0
	local rotation_offset = Quaternion.identity()

	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, pos, rotation_offset, false)
	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, pos2, rotation_offset, false)
end

BTNinjaVanishAction.find_escape_position = function (unit, blackboard)
	local center_position = nil

	if blackboard.action.stalk_lonliest_player then
		local cluster_utility, lonliest_pos, loneliness_value = Managers.state.conflict:get_cluster_and_loneliness(7)
		center_position = lonliest_pos
	else
		center_position = POSITION_LOOKUP[unit]
	end

	local num_found = 0
	local hidden_cover_units = nil

	if center_position then
		local side = blackboard.side
		num_found, hidden_cover_units = ConflictUtils.hidden_cover_points(center_position, side.ENEMY_PLAYER_POSITIONS, 15, 40)
	end

	if num_found > 0 then
		local pick = math.random(math.ceil(num_found / 2), num_found)
		local cover_point_unit = hidden_cover_units[pick]

		if cover_point_unit then
			return Unit.local_position(cover_point_unit, 0)
		end
	else
		local conflict_director = Managers.state.conflict
		local main_path_info = conflict_director.main_path_info
		local ahead_unit = main_path_info.ahead_unit

		if POSITION_LOOKUP[ahead_unit] then
			local main_path_player_info = conflict_director.main_path_player_info
			local player_info = main_path_player_info[ahead_unit]
			local pos, path_index = MainPathUtils.point_on_mainpath(main_path_info.main_paths, player_info.travel_dist + 30 + math.random() * 10)

			return pos
		else
			local pos = MainPathUtils.closest_pos_at_main_path(main_path_info.main_paths, POSITION_LOOKUP[unit])

			return pos
		end
	end
end

return
