require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterAttackAction = class(BTPackMasterAttackAction, BTNode)

BTPackMasterAttackAction.init = function (self, ...)
	BTPackMasterAttackAction.super.init(self, ...)
end

BTPackMasterAttackAction.name = "BTPackMasterAttackAction"

BTPackMasterAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTPackMasterAttackAction
	blackboard.attacks_done = 0
	blackboard.attack_aborted = nil
	blackboard.attack_success = nil
	blackboard.drag_target_unit = blackboard.target_unit
	blackboard.target_unit_status_extension = ScriptUnit.has_extension(blackboard.target_unit, "status_system") or nil

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.constraint_target = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
end

BTPackMasterAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	if reason ~= "done" then
		blackboard.packmaster_target_group = nil

		if blackboard.attack_success and Unit.alive(blackboard.drag_target_unit) then
			StatusUtils.set_grabbed_by_pack_master_network("pack_master_pulling", blackboard.drag_target_unit, false, unit)
			print("Packmaster weird case")
		end

		blackboard.target_unit = nil
		blackboard.drag_target_unit = nil

		if not destroy then
			LocomotionUtils.set_animation_driven_movement(unit, false)
		end
	end

	blackboard.target_unit_status_extension = nil
	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attack_finished = nil
	blackboard.attack_success = nil
	blackboard.attack_time_ends = nil
	blackboard.attack_cooldown = t + blackboard.action.cooldown
	blackboard.action = nil
	blackboard.create_bot_threat_at = nil
end

BTPackMasterAttackAction.run = function (self, unit, blackboard, t, dt)
	if not AiUtils.is_of_interest_to_packmaster(unit, blackboard.target_unit) then
		return "failed"
	end

	if blackboard.attack_aborted then
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "idle")

		return "failed"
	end

	if blackboard.attack_success then
		return "done"
	end

	self:attack(unit, t, dt, blackboard)

	return "running"
end

BTPackMasterAttackAction.attack = function (self, unit, t, dt, blackboard)
	local action = blackboard.action
	local locomotion_extension = blackboard.locomotion_extension

	if blackboard.move_state ~= "attacking" then
		blackboard.move_state = "attacking"

		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, true)
		Managers.state.network:anim_event(unit, action.attack_anim)

		blackboard.attack_time_ends = t + action.attack_anim_duration
		blackboard.create_bot_threat_at = t + action.bot_threat_start_time
	end

	local rotation = LocomotionUtils.rotation_towards_unit(unit, blackboard.target_unit)

	locomotion_extension:set_wanted_rotation(rotation)

	local head_index = Unit.node(blackboard.target_unit, "j_head")
	local aim_target = Unit.world_position(blackboard.target_unit, head_index)

	Unit.animation_set_constraint_target(unit, blackboard.constraint_target, aim_target)

	if blackboard.create_bot_threat_at and blackboard.create_bot_threat_at < t then
		self:create_bot_threat(unit, blackboard, t)

		blackboard.create_bot_threat_at = nil
	end

	if not blackboard.attack_time_ends or blackboard.attack_time_ends < t then
		blackboard.attack_aborted = true
	end
end

BTPackMasterAttackAction.attack_success = function (self, unit, blackboard)
	if blackboard.active_node and blackboard.active_node == BTPackMasterAttackAction then
		local target_unit = blackboard.target_unit
		local target_status_ext = blackboard.target_unit_status_extension

		if target_status_ext and (target_status_ext:get_is_dodging() or target_status_ext:is_invisible()) then
			local pos = POSITION_LOOKUP[unit]
			local dodge_pos = POSITION_LOOKUP[target_unit]
			local dir = Vector3.normalize(Vector3.flat(dodge_pos - pos))
			local forward = Quaternion.forward(Unit.local_rotation(unit, 0))
			local dot_value = Vector3.dot(dir, forward)
			local angle = math.acos(dot_value)
			local distance_squared = Vector3.distance_squared(pos, dodge_pos)

			if math.radians_to_degrees(angle) <= blackboard.action.dodge_angle and distance_squared < blackboard.action.dodge_distance * blackboard.action.dodge_distance then
				blackboard.attack_success = PerceptionUtils.pack_master_has_line_of_sight_for_attack(blackboard.physics_world, unit, target_unit)
			else
				blackboard.attack_success = false

				QuestSettings.check_pack_master_dodge(target_unit)
			end
		else
			blackboard.attack_success = PerceptionUtils.pack_master_has_line_of_sight_for_attack(blackboard.physics_world, unit, target_unit)
		end

		local first_person_extension = ScriptUnit.has_extension(blackboard.target_unit, "first_person_system")

		if blackboard.attack_success and first_person_extension then
			first_person_extension:animation_event("shake_get_hit")
		end
	end
end

BTPackMasterAttackAction.create_bot_threat = function (self, unit, blackboard, t)
	local first_person_extension = ScriptUnit.has_extension(blackboard.target_unit, "first_person_system")

	if first_person_extension then
		local camera_position = first_person_extension:current_position()
		local camera_rotation = first_person_extension:current_rotation()
		local unit_to_target = Vector3.normalize(camera_position - POSITION_LOOKUP[unit])
		local target_first_person_dir = Quaternion.forward(camera_rotation)
		local angle = Vector3.dot(target_first_person_dir, unit_to_target)
		local behind_target = angle >= 0.55 and angle <= 1

		if not behind_target then
			local action = blackboard.action
			local self_pos = POSITION_LOOKUP[unit]
			local to_target = POSITION_LOOKUP[blackboard.target_unit] - self_pos
			local distance = Vector3.length(to_target)
			local width = action.dodge_distance
			local obstacle_position, obstacle_rotation, obstacle_size = AiUtils.calculate_oobb(distance + 2, self_pos, Quaternion.look(to_target), 2, width)
			local bot_threat_duration = blackboard.attack_time_ends - t
			local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

			ai_bot_group_system:aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, bot_threat_duration)
		end
	end
end

return
