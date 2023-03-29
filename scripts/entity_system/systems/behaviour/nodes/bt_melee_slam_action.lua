require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTMeleeSlamAction = class(BTMeleeSlamAction, BTNode)

BTMeleeSlamAction.init = function (self, ...)
	BTMeleeSlamAction.super.init(self, ...)
end

BTMeleeSlamAction.name = "BTMeleeSlamAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTMeleeSlamAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTMeleeSlamAction

	self:init_attack(unit, blackboard, action, t)

	blackboard.attack_cooldown = t + action.cooldown
	blackboard.anim_locked = t + action.attack_time
	blackboard.move_state = "attacking"
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.keep_target = true
	blackboard.rotate_towards_target = true

	Managers.state.conflict:freeze_intensity_decay(15)

	local target_unit = blackboard.target_unit

	AiUtils.add_attack_intensity(target_unit, action, blackboard)
end

BTMeleeSlamAction.init_attack = function (self, unit, blackboard, action, t)
	local attack_anim, anim_driven = LocomotionUtils.get_attack_anim(unit, blackboard, action.attack_anims)
	anim_driven = anim_driven or action.anim_driven or false
	blackboard.attack_anim_driven = anim_driven

	LocomotionUtils.set_animation_driven_movement(unit, anim_driven, false, false)

	if anim_driven then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:use_lerp_rotation(false)
	else
		blackboard.navigation_extension:stop()
	end

	local attack_animation = randomize(attack_anim or action.attack_anim)

	Managers.state.network:anim_event(unit, attack_animation)

	local target_unit = blackboard.target_unit
	blackboard.attacking_target = target_unit
	blackboard.attack_started_at_t = t
	local to_target_rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
	blackboard.attack_rotation = QuaternionBox(to_target_rotation)
	local bot_threats = action.bot_threats and (action.bot_threats[attack_animation] or action.bot_threats[1] and action.bot_threats)

	if bot_threats then
		local current_threat_index = 1
		local bot_threat = bot_threats[current_threat_index]
		local bot_threat_start_time = bot_threat.start_time
		blackboard.create_bot_threat_at_t = t + bot_threat_start_time
		blackboard.current_bot_threat_index = current_threat_index
		blackboard.bot_threats_data = bot_threats
	end
end

BTMeleeSlamAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if blackboard.attack_anim_driven and not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		LocomotionUtils.set_animation_driven_movement(unit, false)
		locomotion_extension:use_lerp_rotation(true)
	end

	blackboard.attack_anim_driven = nil
	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.attack_rotation = nil
	blackboard.attacking_target = nil
	blackboard.attack_started_at_t = nil
	blackboard.keep_target = nil
	blackboard.create_bot_threat_at_t = nil
	blackboard.current_bot_threat_index = nil
	blackboard.bot_threats_data = nil
	blackboard.attack_aborted = nil
	blackboard.rotate_towards_target = nil
end

BTMeleeSlamAction._calculate_collision = function (self, action, self_pos, forward_direction)
	local height = action.height
	local pos = self_pos + forward_direction * action.forward_offset + Vector3(0, 0, height * 0.5)
	local size = Vector3(action.radius, height, action.radius)
	local rotation = Quaternion.look(Vector3.up(), Vector3.up())

	return pos, rotation, size
end

BTMeleeSlamAction._calculate_cylinder_collision = function (self, action, bot_threat, self_pos, self_rot)
	local radius = bot_threat.radius or action.radius
	local height = bot_threat.height or action.height
	local offset_forward = bot_threat.offset_forward or action.forward_offset
	local half_height = height * 0.5
	local size = Vector3(radius, radius, half_height)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local cylinder_center = self_pos + forward * offset_forward + up * half_height
	local rotation = Quaternion.look(up, Vector3.up())

	return cylinder_center, rotation, size
end

BTMeleeSlamAction._create_bot_aoe_threat = function (self, unit, attack_rotation, action, bot_threat)
	local bot_threat_duration = bot_threat.duration
	local unit_position = POSITION_LOOKUP[unit]
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local obstacle_position, _, obstacle_size = self:_calculate_cylinder_collision(action, bot_threat, unit_position, attack_rotation)

	ai_bot_group_system:aoe_threat_created(obstacle_position, "cylinder", obstacle_size, nil, bot_threat_duration)
end

BTMeleeSlamAction.anim_cb_damage = function (self, unit, blackboard)
	if blackboard.is_illusion then
		blackboard.rotate_towards_target = false

		return
	end

	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local action = blackboard.action
	local unit_forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local self_pos = POSITION_LOOKUP[unit]
	local pos, rotation, size = self:_calculate_collision(action, self_pos, unit_forward)
	local shape = size.y - size.x > 0 and "capsule" or "sphere"

	PhysicsWorld.prepare_actors_for_overlap(physics_world, pos, math.max(action.radius, action.height))

	local hit_actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", shape, "position", pos, "rotation", rotation, "size", size, "types", "both", "collision_filter", "filter_rat_ogre_melee_slam")
	local t = Managers.time:time("game")
	local hit_units = FrameTable.alloc_table()

	for i = 1, num_actors do
		local hit_actor = hit_actors[i]
		local hit_unit = Actor.unit(hit_actor)

		if hit_unit ~= unit and not hit_units[hit_unit] then
			local damage = nil
			local target_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

			if target_status_extension then
				local dodge = nil
				local to_target = Vector3.flat(POSITION_LOOKUP[hit_unit] - pos)

				if target_status_extension.is_dodging and action.dodge_mitigation_radius_squared < Vector3.length_squared(to_target) then
					dodge = true
				end

				if not dodge then
					local attack_direction_name = action.attack_directions and action.attack_directions[blackboard.attack_anim]

					if target_status_extension:is_disabled() then
						damage = action.damage
					elseif DamageUtils.check_ranged_block(unit, hit_unit, Vector3.normalize(to_target), action.shield_blocked_fatigue_type or "shield_blocked_slam") then
						local blocked_velocity = action.player_push_speed_blocked * Vector3.normalize(POSITION_LOOKUP[hit_unit] - self_pos)
						local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

						locomotion_extension:add_external_velocity(blocked_velocity)
					elseif DamageUtils.check_block(unit, hit_unit, action.fatigue_type, attack_direction_name) then
						local blocked_velocity = action.player_push_speed_blocked * Vector3.normalize(POSITION_LOOKUP[hit_unit] - self_pos)
						local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

						locomotion_extension:add_external_velocity(blocked_velocity)

						damage = action.blocked_damage
					else
						damage = action.damage
					end
				end

				if action.hit_player_func and damage then
					action.hit_player_func(unit, blackboard, hit_unit, damage)
				end
			elseif Unit.has_data(hit_unit, "breed") then
				local offset = Vector3.flat(POSITION_LOOKUP[hit_unit] - self_pos)
				local direction = nil

				if Vector3.length_squared(offset) < 0.0001 then
					direction = unit_forward
				else
					direction = Vector3.normalize(offset)
				end

				AiUtils.stagger_target(unit, hit_unit, action.stagger_distance, action.stagger_impact, direction, t)

				damage = action.damage

				if BLACKBOARDS[hit_unit].is_illusion then
					damage = nil
				end
			elseif ScriptUnit.has_extension(hit_unit, "ladder_system") then
				local ladder_ext = ScriptUnit.extension(hit_unit, "ladder_system")

				ladder_ext:shake()
			end

			if damage then
				AiUtils.damage_target(hit_unit, unit, action, damage)
			end

			hit_units[hit_unit] = true
		end
	end

	blackboard.rotate_towards_target = false
end

BTMeleeSlamAction.run = function (self, unit, blackboard, t, dt)
	local attacking_target = blackboard.attacking_target

	if blackboard.attack_finished or not Unit.alive(attacking_target) or blackboard.attack_aborted then
		return "done"
	end

	if t < blackboard.anim_locked then
		if not blackboard.attack_anim_driven and blackboard.rotate_towards_target then
			local locomotion_extension = blackboard.locomotion_extension
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, attacking_target)

			locomotion_extension:set_wanted_rotation(rot)
			blackboard.attack_rotation:store(rot)
		end

		local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

		if create_bot_threat_at_t and create_bot_threat_at_t < t then
			local attack_rotation = blackboard.attack_rotation:unbox()
			local action = blackboard.action
			local bot_threats = blackboard.bot_threats_data
			local current_bot_threat_index = blackboard.current_bot_threat_index
			local current_bot_threat = bot_threats[current_bot_threat_index]

			self:_create_bot_aoe_threat(unit, attack_rotation, action, current_bot_threat)

			local next_bot_threat_index = current_bot_threat_index + 1
			local next_bot_threat = bot_threats[next_bot_threat_index]

			if next_bot_threat then
				local attack_started_at_t = blackboard.attack_started_at_t
				blackboard.create_bot_threat_at_t = attack_started_at_t + next_bot_threat.start_time
				blackboard.current_bot_threat_index = next_bot_threat_index
			else
				blackboard.create_bot_threat_at_t = nil
				blackboard.current_bot_threat_index = nil
			end
		end

		return "running"
	end

	return "done"
end
