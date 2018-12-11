require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSkulkAroundAction = class(BTSkulkAroundAction, BTNode)
BTSkulkAroundAction.name = "BTSkulkAroundAction"
local position_lookup = POSITION_LOOKUP
local script_data = script_data

BTSkulkAroundAction.init = function (self, ...)
	BTSkulkAroundAction.super.init(self, ...)
end

local function debug3d(unit, text, color_name)
	if script_data.debug_ai_movement then
		Debug.world_sticky_text(position_lookup[unit], text, color_name)
	end
end

BTSkulkAroundAction.enter = function (self, unit, blackboard, t)
	if not blackboard.skulk_data then
		blackboard.skulk_data = {}
	end

	local skulk_data = blackboard.skulk_data

	LocomotionUtils.set_animation_driven_movement(unit, false)

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "move_fwd")
	blackboard.navigation_extension:set_max_speed(blackboard.breed.run_speed)

	local locomotion = blackboard.locomotion_extension

	locomotion:set_rotation_speed(5)

	if skulk_data.skulk_pos then
		local pos = skulk_data.skulk_pos:unbox()

		blackboard.navigation_extension:move_to(pos)
	else
		local pos = self:get_new_skulk_goal(unit, blackboard)
		skulk_data.skulk_pos = Vector3Box(pos)

		blackboard.navigation_extension:move_to(pos)
	end

	if not skulk_data.attack_timer or skulk_data.attack_timer < t then
		skulk_data.attack_timer = t + math.random(25, 30)
	end
end

BTSkulkAroundAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if reason == "aborted" then
	end

	if blackboard.approach_target then
		local skulk_data = blackboard.skulk_data
		skulk_data.attack_timer = nil
	end
end

BTSkulkAroundAction.run = function (self, unit, blackboard, t, dt)
	local skulk_data = blackboard.skulk_data

	if not skulk_data.skulk_pos then
		return "done"
	end

	if skulk_data.attack_timer < t then
		blackboard.approach_target = true

		return "failed"
	end

	local urgency_to_engage = PerceptionUtils.special_opportunity(unit, blackboard)

	if urgency_to_engage > 0 then
		blackboard.approach_target = true

		return "failed"
	end

	local pos = POSITION_LOOKUP[unit]
	local skulk_pos = skulk_data.skulk_pos:unbox()
	local skulk_target_dist = Vector3.distance_squared(pos, skulk_pos)

	if skulk_target_dist < 1 then
		skulk_data.skulk_pos = nil

		return "done"
	end

	return "running"
end

BTSkulkAroundAction.get_new_skulk_goal = function (self, unit, blackboard)
	local conflict_director = Managers.state.conflict
	local main_paths = conflict_director.level_analysis:get_main_paths()
	local path_pos, travel_dist, move_percent = MainPathUtils.closest_pos_at_main_path(main_paths, POSITION_LOOKUP[unit])
	local info = Managers.state.conflict.main_path_info
	local player_info = Managers.state.conflict.main_path_player_info
	local enemy_pos, player_travel_dist, add_dist = nil

	if info.ahead_percent <= move_percent then
		enemy_pos = POSITION_LOOKUP[info.ahead_unit]
		add_dist = 30
		player_travel_dist = player_info[info.ahead_unit].travel_dist
	elseif move_percent <= info.behind_percent then
		enemy_pos = POSITION_LOOKUP[info.behind_unit]
		add_dist = -20
		player_travel_dist = player_info[info.behind_unit].travel_dist
	else
		enemy_pos = POSITION_LOOKUP[info.ahead_unit]
		add_dist = 30
		player_travel_dist = player_info[info.ahead_unit].travel_dist
	end

	local wanted_travel_dist = player_travel_dist + add_dist
	local pos = MainPathUtils.point_on_mainpath(main_paths, wanted_travel_dist)

	if not pos then
		wanted_travel_dist = player_travel_dist - add_dist
		pos = MainPathUtils.point_on_mainpath(main_paths, wanted_travel_dist)
	end

	local spawn_zone_baker = conflict_director.spawn_zone_baker
	local zone_index = math.clamp(math.floor((wanted_travel_dist + 5) / 10), 1, #spawn_zone_baker.zones)
	local zone = spawn_zone_baker.zones[zone_index]
	local nodes = nil
	local nearby_islands = zone.nearby_islands

	if nearby_islands then
		local island_zone = nearby_islands[math.random(1, #nearby_islands)]
		nodes = island_zone.sub[1]
	else
		local num_zones = #zone.sub
		local zone_layer = math.clamp(num_zones, 1, 2)
		local outer_nodes = zone.sub[zone_layer]
		nodes = outer_nodes
	end

	local triangle_index = nodes[math.random(1, #nodes)]
	local p = spawn_zone_baker.spawn_pos_lookup[triangle_index]

	while not p do
		triangle_index = nodes[math.random(1, #nodes)]
		p = spawn_zone_baker.spawn_pos_lookup[triangle_index]
	end

	local pos = Vector3(p[1], p[2], p[3])

	return pos
end

return
