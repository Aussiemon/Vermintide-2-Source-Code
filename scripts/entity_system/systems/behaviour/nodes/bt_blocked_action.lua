﻿-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_blocked_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBlockedAction = class(BTBlockedAction, BTNode)

BTBlockedAction.init = function (self, ...)
	BTBlockedAction.super.init(self, ...)
end

BTBlockedAction.name = "BTBlockedAction"

BTBlockedAction.enter = function (self, unit, blackboard, t)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	local action = self._tree_node.action_data
	local anim_table = action.blocked_anims
	local block_anim = blackboard.blocked_anim or anim_table[Math.random(1, #anim_table)]
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, block_anim)
	LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_rotation_speed(100)
	locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.spawn_to_running = nil

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension:set_is_blocking(false)
	end

	blackboard.move_state = "stagger"

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)
	ai_slot_system:ai_unit_blocked_attack(unit)

	local difficulty_duration = action.difficulty_duration

	if difficulty_duration then
		local difficulty = Managers.state.difficulty:get_difficulty()
		local leave_blocked_t = difficulty_duration[difficulty]

		if leave_blocked_t then
			blackboard.leave_blocked_at_t = t + Math.random_range(leave_blocked_t[1], leave_blocked_t[2])
		end
	end
end

BTBlockedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.blocked = nil
	blackboard.anim_cb_blocked_cooldown = nil
	blackboard.stagger_hit_wall = nil
	blackboard.leave_blocked_at_t = nil

	if blackboard.stagger and blackboard.stagger < 3 then
		blackboard.stagger = 3
	end

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension:set_is_blocking(true)
	end

	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false, false)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_rotation_speed(10)
		locomotion_extension:set_wanted_rotation(nil)
		locomotion_extension:set_movement_type("snap_to_navmesh")
		locomotion_extension:set_wanted_velocity(Vector3.zero())
	end

	blackboard.blocked_anim = nil

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTBlockedAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension

	if locomotion_extension.movement_type ~= "constrained_by_mover" and not blackboard.stagger_hit_wall then
		local position = POSITION_LOOKUP[unit]
		local velocity = locomotion_extension:current_velocity()
		local nav_world = blackboard.nav_world
		local world = blackboard.world
		local physics_world = World.physics_world(world)
		local navigation_extension = blackboard.navigation_extension
		local traverse_logic = navigation_extension:traverse_logic()
		local result = LocomotionUtils.navmesh_movement_check(position, velocity, nav_world, physics_world, traverse_logic)

		if result == "navmesh_hit_wall" then
			blackboard.stagger_hit_wall = true
		elseif result == "navmesh_use_mover" then
			local breed = blackboard.breed
			local override_mover_move_distance = breed.override_mover_move_distance
			local ignore_forced_mover_kill = true
			local successful = locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance, ignore_forced_mover_kill)

			if not successful then
				locomotion_extension:set_movement_type("snap_to_navmesh")

				blackboard.stagger_hit_wall = true
			end
		end
	end

	if blackboard.anim_cb_blocked_cooldown and blackboard.leave_blocked_at_t and t > blackboard.leave_blocked_at_t then
		return "done"
	end

	return "running"
end
