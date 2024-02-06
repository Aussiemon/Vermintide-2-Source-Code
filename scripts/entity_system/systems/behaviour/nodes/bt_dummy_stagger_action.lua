-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_dummy_stagger_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")

BTDummyStaggerAction = class(BTDummyStaggerAction, BTNode)

BTDummyStaggerAction.init = function (self, ...)
	BTDummyStaggerAction.super.init(self, ...)
end

BTDummyStaggerAction.name = "BTDummyStaggerAction"

local DEFAULT_IN_AIR_MOVER_CHECK_RADIUS = 0.35

BTDummyStaggerAction.enter = function (self, unit, blackboard, t)
	local breed = blackboard.breed
	local was_already_in_stagger = blackboard.staggering_id and blackboard.stagger ~= blackboard.staggering_id

	blackboard.stagger_anim_done = false
	blackboard.stagger_hit_wall = nil
	blackboard.stagger_ignore_anim_cb = nil
	blackboard.staggering_id = blackboard.stagger
	blackboard.attack_aborted = true
	blackboard.move_state = "stagger"
	blackboard.active_node = BTDummyStaggerAction
	blackboard.stagger_time = t + 0.35

	local action_data = self._tree_node.action_data

	blackboard.action = action_data

	local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

	ai_base_extension:increase_stagger_count()

	local stagger_anims, idle_event, post_stagger_event, override_rotation

	idle_event = "idle"
	stagger_anims = action_data.stagger_anims[blackboard.stagger_type]

	local impact_dir = blackboard.stagger_direction:unbox()
	local push_anim, impact_rot = self:_select_animation(unit, blackboard, impact_dir, stagger_anims)
	local network_manager = Managers.state.network

	network_manager:anim_event(unit, push_anim)
end

BTDummyStaggerAction._select_animation = function (self, unit, blackboard, impact_vec, stagger_anims)
	local impact_dir = Vector3.normalize(impact_vec)
	local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(my_fwd, impact_dir)

	dot = math.clamp(dot, -1, 1)

	local angle = math.acos(dot)
	local action = blackboard.action
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension and locomotion_extension:current_velocity() or Vector3(0, 0, 0)
	local impact_rot, anim_table
	local moving_stagger_distance = action.moving_stagger_minimum_destination_distance
	local in_moving_stagger_distane = moving_stagger_distance and moving_stagger_distance < blackboard.destination_dist
	local moving_stagger_threshold = action.moving_stagger_threshold
	local velocy_my_fwd_dot = Vector3.dot(velocity, my_fwd)
	local in_moving_stagger_velocity = moving_stagger_threshold and moving_stagger_threshold < velocy_my_fwd_dot
	local moving_stagger = false

	if not blackboard.always_stagger_suffered then
		moving_stagger = in_moving_stagger_distane and in_moving_stagger_velocity
	end

	blackboard.always_stagger_suffered = nil

	if impact_vec.z == -1 and stagger_anims.dwn then
		impact_dir.z = 0
		impact_rot = Quaternion.look(-impact_dir)
		anim_table = moving_stagger and stagger_anims.moving_dwn or stagger_anims.dwn
	else
		impact_dir.z = 0

		if angle > math.pi * 0.75 then
			impact_rot = Quaternion.look(-impact_dir)
			anim_table = moving_stagger and stagger_anims.moving_bwd or stagger_anims.bwd
		elseif angle < math.pi * 0.25 then
			impact_rot = Quaternion.look(impact_dir)
			anim_table = moving_stagger and stagger_anims.moving_fwd or stagger_anims.fwd
		elseif Vector3.cross(my_fwd, impact_dir).z > 0 then
			local dir = Vector3.cross(Vector3(0, 0, -1), impact_dir)

			impact_rot = Quaternion.look(dir)
			anim_table = moving_stagger and stagger_anims.moving_left or stagger_anims.left
		else
			local dir = Vector3.cross(Vector3(0, 0, 1), impact_dir)

			impact_rot = Quaternion.look(dir)
			anim_table = moving_stagger and stagger_anims.moving_right or stagger_anims.right
		end
	end

	local num_anims = #anim_table
	local index = Math.random(1, num_anims)
	local anim = anim_table[index]

	if anim == blackboard.last_stagger_anim then
		anim = anim_table[index % num_anims + 1]
	end

	blackboard.last_stagger_anim = anim

	local yaw = Quaternion.yaw(impact_rot)
	local final_rotation = Quaternion(Vector3.up(), yaw)

	return anim, final_rotation
end

BTDummyStaggerAction.clean_blackboard = function (self, blackboard)
	blackboard.action = nil
	blackboard.heavy_stagger_immune_time = nil
	blackboard.pushing_unit = nil
	blackboard.stagger = nil
	blackboard.stagger_anim_done = nil
	blackboard.stagger_direction = nil
	blackboard.stagger_hit_wall = nil
	blackboard.stagger_ignore_anim_cb = nil
	blackboard.stagger_immune_time = nil
	blackboard.stagger_length = nil
	blackboard.stagger_time = nil
	blackboard.stagger_type = nil
	blackboard.staggering_id = nil
	blackboard.active_node = nil
end

BTDummyStaggerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	self:clean_blackboard(blackboard)

	if not destroy then
		local network_manager = Managers.state.network
		local post_stagger_anim_event

		if blackboard.post_stagger_event then
			post_stagger_anim_event = blackboard.post_stagger_event
			blackboard.post_stagger_event = nil
		else
			post_stagger_anim_event = "stagger_finished"
		end

		network_manager:anim_event(unit, post_stagger_anim_event)
	end

	local run_on_stagger_action_done = blackboard.breed.run_on_stagger_action_done

	if run_on_stagger_action_done then
		run_on_stagger_action_done(unit, blackboard, t)
	end

	local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")

	hit_reaction_extension.force_ragdoll_on_death = nil
end

BTDummyStaggerAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.stagger ~= blackboard.staggering_id then
		self:enter(unit, blackboard, t)
	end

	local locomotion_extension = blackboard.locomotion_extension
	local stagger_anim_done = blackboard.stagger_anim_done
	local stagger_time_finished = t > blackboard.stagger_time
	local stagger_ignore_anim_cb = blackboard.stagger_ignore_anim_cb

	if blackboard.stagger_immune_time and t > blackboard.stagger_immune_time then
		blackboard.stagger_immune_time = nil
	end

	if blackboard.heavy_stagger_immune_time and t > blackboard.heavy_stagger_immune_time then
		blackboard.heavy_stagger_immune_time = nil
	end

	if stagger_time_finished then
		return "done"
	else
		return "running"
	end
end

BTDummyStaggerAction.anim_cb_push_cancel = function (self, unit, blackboard)
	if blackboard.stagger_type and blackboard.stagger_type == 9 then
		Managers.state.network:anim_event(unit, "stagger_finished")

		blackboard.stagger_anim_done = true
	end
end
