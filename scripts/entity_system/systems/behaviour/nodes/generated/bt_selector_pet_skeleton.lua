-- chunkname: @scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_pet_skeleton.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local unit_alive = Unit.alive
local Profiler = Profiler

local function nop()
	return
end

BTSelector_pet_skeleton = class(BTSelector_pet_skeleton, BTNode)
BTSelector_pet_skeleton.name = "BTSelector_pet_skeleton"

BTSelector_pet_skeleton.init = function (self, ...)
	BTSelector_pet_skeleton.super.init(self, ...)

	self._children = {}
end

BTSelector_pet_skeleton.leave = function (self, unit, blackboard, t, reason)
	self:set_running_child(unit, blackboard, t, nil, reason)
end

BTSelector_pet_skeleton.run = function (self, unit, blackboard, t, dt)
	local Profiler_start, Profiler_stop = Profiler.start, Profiler.stop
	local child_running = self:current_running_child(blackboard)
	local children = self._children

	do
		local node_spawn = children[1]
		local condition_result = blackboard.spawn

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_spawn, "aborted")

			local result, evaluate = node_spawn:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_spawn == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_transported_idle = children[2]
		local condition_result = blackboard.is_transported

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_transported_idle, "aborted")

			local result, evaluate = node_transported_idle:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_transported_idle == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_in_vortex = children[3]
		local condition_result = blackboard.in_vortex

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_in_vortex, "aborted")

			local result, evaluate = node_in_vortex:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_in_vortex == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_falling = children[4]
		local condition_result = blackboard.is_falling or blackboard.fall_state ~= nil

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_falling, "aborted")

			local result, evaluate = node_falling:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_falling == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_stagger = children[5]
		local condition_result

		if blackboard.stagger then
			if blackboard.stagger_prohibited then
				blackboard.stagger = false
			else
				condition_result = true
			end
		end

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_stagger, "aborted")

			local result, evaluate = node_stagger:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_stagger == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_blocked = children[6]
		local condition_result = blackboard.blocked

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_blocked, "aborted")

			local result, evaluate = node_blocked:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_blocked == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_smartobject = children[7]
		local condition_result
		local next_smart_object_data = blackboard.next_smart_object_data
		local smartobject_is_next = next_smart_object_data.next_smart_object_id ~= nil

		if not smartobject_is_next then
			condition_result = false
		end

		local is_smart_objecting = blackboard.is_smart_objecting
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")
		local smart_object_unit = next_smart_object_data.smart_object_data and next_smart_object_data.smart_object_data.unit
		local has_nav_graph_extension, nav_graph_enabled = nav_graph_system:has_nav_graph(smart_object_unit)

		if has_nav_graph_extension and not nav_graph_enabled and not is_smart_objecting and condition_result == nil then
			condition_result = false
		end

		local is_in_smartobject_range = blackboard.is_in_smartobject_range
		local moving_state = blackboard.move_state == "moving"

		if condition_result == nil then
			condition_result = is_in_smartobject_range and moving_state or is_smart_objecting
		end

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_smartobject, "aborted")

			local result, evaluate = node_smartobject:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_smartobject == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_teleport_out_of_range = children[8]
		local condition_result
		local controlled_unit = blackboard.unit
		local commander_unit = Managers.state.entity:system("ai_commander_system"):get_commander_unit(controlled_unit)

		if commander_unit then
			local max_commander_distance = blackboard.breed.max_commander_distance

			if max_commander_distance then
				local commander_position = POSITION_LOOKUP[commander_unit]
				local self_position = POSITION_LOOKUP[controlled_unit]
				local distance_sq = Vector3.distance_squared(commander_position, self_position)

				if distance_sq > max_commander_distance * max_commander_distance then
					condition_result = true
				end
			end
		end

		if condition_result == nil then
			condition_result = false
		end

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_teleport_out_of_range, "aborted")

			local result, evaluate = node_teleport_out_of_range:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_teleport_out_of_range == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_commander_disabled = children[9]
		local condition_result = ALIVE[blackboard.commander_unit] and ScriptUnit.extension(blackboard.commander_unit, "status_system"):is_disabled() or blackboard.disabled_resume_time and Managers.time:time("game") < blackboard.disabled_resume_time

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_commander_disabled, "aborted")

			local result, evaluate = node_commander_disabled:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_commander_disabled == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_ability_charge_attack = children[10]
		local condition_result = blackboard.charge_target

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_ability_charge_attack, "aborted")

			local result, evaluate = node_ability_charge_attack:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_ability_charge_attack == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_command_combat = children[11]
		local condition_result = (blackboard.new_command_attack or blackboard.undergoing_command_attack) and (ALIVE[blackboard.target_unit] and blackboard.new_command_attack or (ALIVE[blackboard.locked_target_unit] or blackboard.attack_locked_in_t) and blackboard.undergoing_command_attack)

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_command_combat, "aborted")

			local result, evaluate = node_command_combat:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_command_combat == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_in_combat = children[12]
		local condition_result = ALIVE[blackboard.target_unit] and blackboard.confirmed_enemy_sighting_within_commander or blackboard.attack_locked_in_t

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_in_combat, "aborted")

			local result, evaluate = node_in_combat:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_in_combat == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	do
		local node_stand_ground = children[13]
		local condition_result = blackboard.command_state == CommandStates.StandingGround

		if condition_result then
			self:set_running_child(unit, blackboard, t, node_stand_ground, "aborted")

			local result, evaluate = node_stand_ground:run(unit, blackboard, t, dt)

			if result ~= "running" then
				self:set_running_child(unit, blackboard, t, nil, result)
			end

			if result ~= "failed" then
				return result, evaluate
			end
		elseif node_stand_ground == child_running then
			self:set_running_child(unit, blackboard, t, nil, "failed")
		end
	end

	local node_follow = children[14]

	self:set_running_child(unit, blackboard, t, node_follow, "aborted")

	local result, evaluate = node_follow:run(unit, blackboard, t, dt)

	if result ~= "running" then
		self:set_running_child(unit, blackboard, t, nil, result)
	end

	if result ~= "failed" then
		return result, evaluate
	end
end

BTSelector_pet_skeleton.add_child = function (self, node)
	self._children[#self._children + 1] = node
end
