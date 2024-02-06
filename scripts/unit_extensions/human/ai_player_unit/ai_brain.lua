-- chunkname: @scripts/unit_extensions/human/ai_player_unit/ai_brain.lua

require("scripts/settings/player_bots_settings")
require("scripts/entity_system/systems/behaviour/behaviour_tree")
require("scripts/entity_system/systems/behaviour/bt_minion")
require("scripts/entity_system/systems/behaviour/bt_bot")
require("scripts/unit_extensions/human/ai_player_unit/debug_breeds/debug_globadier")

AIBrain = class(AIBrain)

local BLACKBOARDS = BLACKBOARDS

AIBrain.init = function (self, world, unit, blackboard, breed, behavior)
	self._unit = unit
	BLACKBOARDS[unit] = blackboard
	self._blackboard = blackboard
	blackboard.attacks_done = 0
	blackboard.breed = breed
	blackboard.destination_dist = 0
	blackboard.nav_target_dist_sq = 0

	self:load_brain(behavior)
	self:init_utility_actions(blackboard, breed)
end

AIBrain.destroy = function (self)
	if not Network.game_session() then
		return
	end

	self:exit_last_action()
end

AIBrain.unfreeze = function (self, blackboard, behavior)
	blackboard.attacks_done = 0
	blackboard.destination_dist = 0
	blackboard.nav_target_dist_sq = 0

	self:load_brain(behavior)
	self:init_utility_actions(blackboard, blackboard.breed)
end

AIBrain.init_utility_actions = function (self, blackboard, breed)
	local utility_actions = {}
	local actions = self._bt:action_data()

	for action_name, data in pairs(actions) do
		if data.considerations then
			utility_actions[action_name] = {
				last_time = -math.huge,
				time_since_last = math.huge,
				last_done_time = -math.huge,
				time_since_last_done = math.huge,
			}

			if data.init_blackboard then
				for name, value in pairs(data.init_blackboard) do
					blackboard[name] = value
				end
			end
		end
	end

	blackboard.utility_actions = utility_actions
end

AIBrain.load_brain = function (self, tree_name)
	local ai_system = Managers.state.entity:system("ai_system")

	self._bt = ai_system:behavior_tree(tree_name)

	fassert(self._bt, "Cannot find behavior tree '%s' specified for unit '%s'", tree_name, self._unit)
end

AIBrain.bt = function (self)
	return self._bt
end

AIBrain.exit_last_action = function (self)
	local blackboard = self._blackboard

	blackboard.exit_last_action = true

	local root = self._bt:root()
	local t = Managers.time:time("game")

	root:set_running_child(self._unit, blackboard, t, nil, "aborted", true)
end

AIBrain.update = function (self, unit, t, dt)
	local result = self._bt:root():evaluate(unit, self._blackboard, t, dt)
end
