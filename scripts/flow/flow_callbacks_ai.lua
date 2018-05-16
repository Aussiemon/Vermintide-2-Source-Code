function flow_callback_activate_ai_spawner(params)
	local spawner_unit = params.spawner_unit

	Managers.state.event:trigger("activate_ai_spawner", spawner_unit)
end

function flow_callback_deactivate_ai_spawner(params)
	local spawner_unit = params.spawner_unit

	Managers.state.event:trigger("deactivate_ai_spawner", spawner_unit)
end

function flow_callback_hibernate_spawner(params)
	local spawner_unit = params.spawner_unit
	local hibernate = params.hibernate
	local spawner_system = Managers.state.entity:system("spawner_system")

	spawner_system:hibernate_spawner(spawner_unit, hibernate)
end

function flow_callback_ai_move_group_command(params)
	Managers.state.event:trigger("ai_move_group", params.player_name, params.group_name, params.target_unit, params.on_arrived_event_name)
end

function flow_callback_ai_move_single_command(params)
	Managers.state.event:trigger("ai_move_single", params.move_unit, params.target_unit)
end

function flow_callback_ai_despawn(params)
	local spawner_unit = params.spawner_unit
	local spawner = ScriptUnit.extension(spawner_unit, "spawner_system")

	spawner:despawn()
end

function flow_callback_ai_kill(params)
	local hit_unit = params.hit_unit
	local breed = Unit.get_data(hit_unit, "breed")

	if not breed then
		return
	end

	local hit_actor = params.hit_actor
	local node = Actor.node(hit_actor)
	local hit_zone = breed.hit_zones_lookup[node]
	local hit_zone_name = hit_zone.name
	local damage_type = params.damage_type
	local attack_direction = -params.hit_normal

	AiUtils.kill_unit(hit_unit, hit_unit, hit_zone_name, damage_type, attack_direction)
end

function trigger_ai_equipment_flow_event(params)
	local ai_unit = params.unit
	local inv_ext = ScriptUnit.has_extension(ai_unit, "ai_inventory_system")

	if inv_ext then
		local inventory_item_units = inv_ext.inventory_item_units
		local unit_flow = Unit.flow_event

		for i = 1, inv_ext.inventory_items_n, 1 do
			unit_flow(inventory_item_units[i], params.event)
		end
	end
end

function flow_callback_ai_follow_path(params)
	local ai_entity = params.ai_entity
	local spline_name = params.spline_name
	local finish_event = params.finish_event

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")
			ai_base:blackboard().move_orders[spline_name] = {
				name = "follow",
				finish_event = finish_event
			}
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")
		ai_base:blackboard().move_orders[spline_name] = {
			name = "follow",
			finish_event = finish_event
		}
	end
end

function flow_callback_ai_patrol_path(params)
	local ai_entity = params.ai_entity
	local spline_name = params.spline_name

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")
			ai_base:blackboard().move_orders[spline_name] = {
				name = "patrol"
			}
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")
		ai_base:blackboard().move_orders[spline_name] = {
			name = "patrol"
		}
	end
end

function flow_callback_ai_move_to_command(params)
	local ai_entity = params.ai_entity
	local waypoint_unit = params.waypoint_unit
	local finish_event = params.finish_event

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")
			ai_base:blackboard().move_orders[waypoint_unit] = {
				name = "move",
				finish_event = finish_event
			}
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")
		ai_base:blackboard().move_orders[waypoint_unit] = {
			name = "move",
			finish_event = finish_event
		}
	end
end

function flow_callback_ai_detect_player(params)
	local ai_entity = params.ai_entity
	local player_unit = Managers.player:player_from_peer_id(Network.peer_id()).player_unit

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")
			ai_base:blackboard().players[player_unit] = true
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")
		ai_base:blackboard().players[player_unit] = true
	end
end

function flow_callback_ai_hold_position(params)
	local ai_entity = params.ai_entity

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")

			ai_base:steering():reset()

			local brain = ai_base:brain()

			brain:change_behaviour("avoidance", "nil_tree")
			brain:change_behaviour("pathing", "nil_tree")
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")

		ai_base:steering():reset()

		local brain = ai_base:brain()

		brain:change_behaviour("avoidance", "nil_tree")
		brain:change_behaviour("pathing", "nil_tree")
	end
end

function flow_callback_set_ai_properties(params)
	local ai_entity = params.ai_entity
	params.ai_entity = nil

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")

			ai_base:set_properties(params)
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")

		ai_base:set_properties(params)
	end
end

function flow_callback_set_ai_perception(params)
	local ai_entity = params.ai_entity

	if ScriptUnit.has_extension(ai_entity, "spawner_system") then
		local spawner = ScriptUnit.extension(ai_entity, "spawner_system")

		for ai_unit, _ in pairs(spawner:spawned_units()) do
			local ai_base = ScriptUnit.extension(ai_unit, "ai_system")

			ai_base:perception():set_config(params)
		end
	else
		local ai_base = ScriptUnit.extension(ai_entity, "ai_system")

		ai_base:perception():set_config(params)
	end
end

function flow_callback_ai_set_waypoint(params)
	local waypoint_name = params.waypoint_name
	local waypoint_unit = params.waypoint_unit
	local world = Managers.world:world("level_world")
	local level = LevelHelper:current_level(world)

	Level.set_flow_variable(level, waypoint_name, waypoint_unit)
end

function flow_callback_ai_set_areas(params)
	flow_callback_set_ai_properties(params)
end

function flow_callback_set_ai_spawner_mode(params)
	Managers.state.entity:system("spawner_system"):set_deterministic(params.deterministic)
end

function flow_callback_force_terror_event(params)
	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		Managers.state.conflict:start_terror_event(params.event_type)
	end
end

function flow_callback_override_player_respawning(params)
	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		Managers.state.spawn.respawn_handler:set_override_respawn_group(params.respawn_group_name, params.active)
	end
end

function flow_callback_pick_crossroad_path(params)
	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		Managers.state.conflict.level_analysis:pick_crossroad_path(params.crossroad_id, params.path_id)
	end
end

function flow_callback_change_spawner_id(params)
	Managers.state.entity:system("spawner_system"):change_spawner_id(params.unit, params.spawner_id, params.new_spawner_id)
end

function flow_callback_stop_terror_event(params)
	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		local event_name = params.event_type

		TerrorEventMixer.stop_event(event_name)
	end
end

function flow_callback_force_random_terror_event(params)
	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		TerrorEventMixer.start_random_event(params.event_chunk)
	end
end

function flow_callback_bot_nav_transition_entered(params)
	local bot_unit = params.bot_unit
	local transition_unit = params.transition_unit
	local actor = params.bot_actor
	local nav_ext = ScriptUnit.has_extension(bot_unit, "ai_navigation_system") and ScriptUnit.extension(bot_unit, "ai_navigation_system")

	if nav_ext then
		if nav_ext.flow_cb_entered_nav_transition then
			nav_ext:flow_cb_entered_nav_transition(transition_unit, actor)
		end
	else
		Application.warning(string.format("[flow_callback_bot_nav_transition_left] Unit: %s missing extension \"ai_navigation_system\"", tostring(bot_unit)))
	end
end

function flow_callback_bot_nav_transition_left(params)
	local bot_unit = params.bot_unit
	local transition_unit = params.transition_unit
	local actor = params.bot_actor
	local nav_ext = ScriptUnit.has_extension(bot_unit, "ai_navigation_system") and ScriptUnit.extension(bot_unit, "ai_navigation_system")

	if nav_ext then
		if nav_ext.flow_cb_left_nav_transition then
			nav_ext:flow_cb_left_nav_transition(transition_unit, actor)
		end
	else
		Application.warning(string.format("[flow_callback_bot_nav_transition_left] Unit: %s missing extension \"ai_navigation_system\"", tostring(bot_unit)))
	end
end

function flow_callback_player_bot_hold_position(params)
	if not Managers.player.is_server then
		return
	end

	local player_unit = params.player_unit
	local ai_bot_group_extension = ScriptUnit.has_extension(player_unit, "ai_bot_group_system")

	if ai_bot_group_extension then
		local should_hold_position = params.should_hold_position

		if should_hold_position then
			local ai_system = Managers.state.entity:system("ai_system")
			local nav_world = ai_system:nav_world()
			local hold_position = params.position or Unit.local_position(player_unit, 0)
			local above = 0.5
			local below = 2
			local success, altitude = GwNavQueries.triangle_from_position(nav_world, hold_position, above, below)

			if success then
				local max_distance = params.max_allowed_distance_from_position or 0
				hold_position = Vector3(hold_position.x, hold_position.y, altitude)

				ai_bot_group_extension:set_hold_position(hold_position, max_distance)
			else
				Application.warning(string.format("[flow_callback_player_bot_hold_position] %s could not hold position %s since it is not near navmesh!", tostring(player_unit), tostring(hold_position)))
			end
		else
			ai_bot_group_extension:set_hold_position(nil)
		end
	else
		Application.warning(string.format("[flow_callback_player_bot_hold_position] Unit: %s is missing ai_bot_group_extension", tostring(player_unit)))
	end
end

function flow_callback_overcharge_explode_player_bot(params)
	if not Managers.player.is_server then
		return
	end

	local player_unit = params.player_unit

	if Unit.alive(player_unit) then
		local overcharge_extension = ScriptUnit.has_extension(player_unit, "overcharge_system")

		fassert(overcharge_extension, "Tried to overcharge explode unit %s from flow but the unit has no overcharge extension", player_unit)

		local max_overcharge = overcharge_extension:get_max_value()

		overcharge_extension:add_charge(max_overcharge)
	end
end

function flow_callback_broadphase_ai_set_goal_destination(params)
	if not Managers.player.is_server then
		return
	end

	local goal_unit = params.goal_unit
	local goal_position = Unit.local_position(goal_unit, 0)
	local goal_destination = nil
	local above = 1
	local below = 5
	local ai_system = Managers.state.entity:system("ai_system")
	local nav_world = ai_system:nav_world()
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, goal_position, above, below)

	if success then
		goal_destination = Vector3(goal_position.x, goal_position.y, altitude)
	else
		local horizontal = 5
		local distance_from_obstacle = 0.1
		goal_destination = GwNavQueries.inside_position_from_outside_position(nav_world, goal_position, above, below, horizontal, distance_from_obstacle)
	end

	if goal_destination then
		local broadphase_radius = params.broadphase_radius
		local broadphase_start_unit = params.broadphase_start_unit
		local broadphase_position = Unit.local_position(broadphase_start_unit, 0)
		local BLACKBOARDS = BLACKBOARDS
		local affected_breed_name = params.affected_breed
		local broadphase_result = FrameTable.alloc_table()
		local num_result = Broadphase.query(ai_system.broadphase, broadphase_position, broadphase_radius, broadphase_result)

		for i = 1, num_result, 1 do
			local ai_unit = broadphase_result[i]
			local blackboard = BLACKBOARDS[ai_unit]
			local breed = blackboard.breed

			if breed.name == affected_breed_name and AiUtils.unit_alive(ai_unit) then
				if blackboard.goal_destination == nil then
					blackboard.goal_destination = Vector3Box(goal_destination)
				else
					Application.warning(string.format("[flow_callback_broadphase_ai_set_goal_destination] Unit: %s already have a goal destination!", tostring(ai_unit)))
				end
			end
		end
	else
		Application.warning(string.format("[flow_callback_broadphase_ai_set_goal_destination] Couldn't find nearby navmesh for Goal Unit: %s", tostring(goal_unit)))
	end
end

return
