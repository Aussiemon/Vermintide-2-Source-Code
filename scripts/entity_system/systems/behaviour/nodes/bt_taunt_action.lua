require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTTauntAction = class(BTTauntAction, BTNode)

BTTauntAction.init = function (self, ...)
	BTTauntAction.super.init(self, ...)
end

BTTauntAction.name = "BTTauntAction"

BTTauntAction.enter = function (self, unit, blackboard, t)
	print("TAUNT")

	local action = self._tree_node.action_data
	local side = Managers.state.side.side_by_unit[unit]
	local position = POSITION_LOOKUP[unit]
	local radius = action.radius
	local taunt_duration = action.duration
	local nearby_ai = FrameTable.alloc_table()
	local broadphase_categories = side.enemy_broadphase_categories
	local n_hits = AiUtils.broadphase_query(position, radius, nearby_ai, broadphase_categories)

	for i = 1, n_hits do
		local ai_unit = nearby_ai[i]
		local enemy_blackboard = BLACKBOARDS[ai_unit]
		local override_targets = enemy_blackboard.override_targets

		table.clear(override_targets)

		enemy_blackboard.target_unit = nil
		override_targets[unit] = t + taunt_duration
	end

	local effect_name = action.effect_name

	if effect_name then
		local effect_id = NetworkLookup.effects[effect_name]
		local node_id = 0
		local linked = false

		Managers.state.network:rpc_play_particle_effect_no_rotation(nil, effect_id, NetworkConstants.invalid_game_object_id, node_id, position, linked)
	end

	local sound_event = action.sound_event

	if sound_event then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_event, unit)
	end
end

BTTauntAction.leave = function (self, unit, blackboard, t, reason, destroy)
	return
end

BTTauntAction.run = function (self, unit, blackboard, t, dt)
	return "done"
end
