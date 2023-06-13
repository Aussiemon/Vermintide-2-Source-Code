require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTCombatIdleAction = class(BTCombatIdleAction, BTNode)

BTCombatIdleAction.init = function (self, ...)
	BTCombatIdleAction.super.init(self, ...)
end

BTCombatIdleAction.name = "BTCombatIdleAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTCombatIdleAction.enter = function (self, unit, blackboard, t)
	self:_check_if_should_idle(unit, blackboard)
	blackboard.navigation_extension:set_enabled(true)
end

BTCombatIdleAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.combat_idling = nil
end

local EPSILON_SQ = 0.0001

BTCombatIdleAction._check_if_should_idle = function (self, unit, blackboard)
	if not blackboard.combat_idling then
		local locomotion_ext = blackboard.locomotion_extension
		local speed_sq = Vector3.length_squared(locomotion_ext:current_velocity())

		if speed_sq < EPSILON_SQ then
			blackboard.combat_idling = true

			self:_init_idle_anim(unit, blackboard)
		end
	end
end

BTCombatIdleAction._init_idle_anim = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local animation = "idle"
	local action = self._tree_node.action_data
	blackboard.action = action

	if action and action.alerted_anims and blackboard.confirmed_player_sighting then
		animation = action.alerted_anims[math.random(1, #action.alerted_anims)]
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

	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

local Unit_alive = Unit.alive

BTCombatIdleAction.run = function (self, unit, blackboard, t, dt)
	self:_check_if_should_idle(unit, blackboard)

	local target_unit = blackboard.target_unit

	if Unit_alive(target_unit) then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	return "running"
end
