require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local position_lookup = POSITION_LOOKUP
local player_and_bot_units = PLAYER_AND_BOT_UNITS
BTJumpSlamImpactAction = class(BTJumpSlamImpactAction, BTNode)

BTJumpSlamImpactAction.init = function (self, ...)
	BTJumpSlamImpactAction.super.init(self, ...)
end

BTJumpSlamImpactAction.name = "BTJumpSlamImpactAction"

BTJumpSlamImpactAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local target_unit = blackboard.target_unit
	blackboard.action = action
	blackboard.active_node = BTJumpSlamImpactAction
	blackboard.attack_finished = nil
	blackboard.attacking_target = target_unit
end

BTJumpSlamImpactAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.attacking_target = nil
	blackboard.keep_target = nil
	blackboard.jump_slam_data = nil

	blackboard.navigation_extension:set_enabled(true)

	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false, true)
	end
end

BTJumpSlamImpactAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.anim_cb_damage then
		blackboard.anim_cb_damage = nil

		self:jump_slam_impact(unit, blackboard, t)

		blackboard.attacking_target = nil
	elseif blackboard.attack_finished then
		return "done"
	end

	return "running"
end

BTJumpSlamImpactAction.jump_slam_impact = function (self, unit, blackboard, t)
	local action = blackboard.action
	local impact_position = position_lookup[unit]

	BTJumpSlamImpactAction.impact_damage(unit, t, action.stagger_radius, action.stagger_distance, action.stagger_impact, action.damage, action.damage_type, action.hit_react_type, action.max_damage_radius, impact_position)

	if action.catapult_players then
		BTJumpSlamImpactAction.catapult_players(impact_position, action.catapult_within_radius, action.catapulted_player_speed)
	end
end

BTJumpSlamImpactAction.catapult_players = function (impact_position, radius, speed)
	for i = 1, #player_and_bot_units, 1 do
		local target_unit = player_and_bot_units[i]

		BTJumpSlamImpactAction.catapult_player(target_unit, impact_position, radius, speed)
	end
end

BTJumpSlamImpactAction.catapult_player = function (target_unit, impact_position, radius, push_speed)
	local target_position = position_lookup[target_unit]
	local towards_player = target_position - impact_position

	if radius < Vector3.length(towards_player) then
		return
	end

	local angle = math.pi / 6
	local flat_towards_player = Vector3.normalize(Vector3.flat(towards_player))
	local length = push_speed * math.cos(angle)
	local height = push_speed * math.sin(angle)
	local push_velocity = flat_towards_player * length
	push_velocity.z = height

	StatusUtils.set_catapulted_network(target_unit, true, push_velocity)
end

local ai_units = {}

BTJumpSlamImpactAction.impact_damage = function (attacking_unit, t, radius, stagger_length, impact, damage, damage_type, hit_react_type, max_damage_radius, impact_position)
	local falloff_radius = radius - max_damage_radius
	local num_ai_units = AiUtils.broadphase_query(impact_position, radius, ai_units)
	local BLACKBOARDS = BLACKBOARDS

	for i = 1, num_ai_units, 1 do
		local ai_unit = ai_units[i]

		if ai_unit ~= attacking_unit then
			local health_extension = ScriptUnit.extension(ai_unit, "health_system")
			local is_alive = health_extension:is_alive()

			if is_alive then
				local unit_position = position_lookup[ai_unit]
				local vector_to_target = unit_position - impact_position
				local stagger_type, stagger_duration = DamageUtils.calculate_stagger(impact, nil, ai_unit, attacking_unit)
				stagger_duration = 1
				local target_ai_blackboard = BLACKBOARDS[ai_unit]

				if stagger_type > 0 then
					AiUtils.stagger(ai_unit, target_ai_blackboard, attacking_unit, vector_to_target, stagger_length, stagger_type, stagger_duration, nil, t)
				end

				if damage then
					local target_armor = target_ai_blackboard.breed.armor_category
					local raw_damage = damage[target_armor] or damage[1]

					if raw_damage > 0 then
						local direction = Vector3.normalize(Vector3(Vector3.x(vector_to_target), Vector3.y(vector_to_target), 0))
						local distance = Vector3.length(vector_to_target)
						local is_inside_radius = distance < radius

						if is_inside_radius then
							local damage_done = nil

							if max_damage_radius < distance then
								damage_done = raw_damage * (distance - max_damage_radius) / falloff_radius
							else
								damage_done = raw_damage
							end

							DamageUtils.add_damage_network(ai_unit, attacking_unit, damage_done, "full", damage_type, nil, Vector3(0, 0, -1), nil, nil, nil, nil, hit_react_type)
						end
					end
				end
			end
		end
	end
end

return
