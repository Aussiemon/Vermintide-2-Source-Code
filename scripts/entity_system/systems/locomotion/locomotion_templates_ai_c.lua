-- chunkname: @scripts/entity_system/systems/locomotion/locomotion_templates_ai_c.lua

LocomotionTemplates.AILocomotionExtensionC = {}

LocomotionTemplates.AILocomotionExtensionC.init = function (data, nav_world)
	return
end

LocomotionTemplates.AILocomotionExtensionC.update = function (data, t, dt)
	local units_to_kill = EngineOptimizedExtensions.ai_locomotion_update(t, dt)

	if units_to_kill then
		local ScriptUnit_extension = ScriptUnit.extension
		local ScriptUnit_has_extension = ScriptUnit.has_extension
		local conflict_director = Managers.state.conflict
		local statistics_db = Managers.player:statistics_db()
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local killing_blow = FrameTable.alloc_table()

		killing_blow[DamageDataIndex.DAMAGE_AMOUNT] = NetworkConstants.damage.max
		killing_blow[DamageDataIndex.DAMAGE_TYPE] = "forced"
		killing_blow[DamageDataIndex.HIT_ZONE] = "full"
		killing_blow[DamageDataIndex.DIRECTION] = Vector3.down()
		killing_blow[DamageDataIndex.DAMAGE_SOURCE_NAME] = "suicide"
		killing_blow[DamageDataIndex.HIT_RAGDOLL_ACTOR_NAME] = "n/a"
		killing_blow[DamageDataIndex.HIT_REACT_TYPE] = "light"
		killing_blow[DamageDataIndex.CRITICAL_HIT] = false
		killing_blow[DamageDataIndex.FIRST_HIT] = true
		killing_blow[DamageDataIndex.TOTAL_HITS] = 1
		killing_blow[DamageDataIndex.BACKSTAB_MULTIPLIER] = 1

		for i = 1, #units_to_kill do
			print("Destroying unit since outside mesh or world")

			local unit = units_to_kill[i]
			local ai_extension = ScriptUnit_extension(unit, "ai_system")
			local blackboard = ai_extension._blackboard

			killing_blow[DamageDataIndex.ATTACKER] = unit
			killing_blow[DamageDataIndex.POSITION] = Unit.world_position(unit, 0)
			killing_blow[DamageDataIndex.SOURCE_ATTACKER_UNIT] = unit

			local buff_extenstion = ScriptUnit_has_extension(unit, "buff_system")

			if buff_extenstion then
				buff_extenstion:trigger_procs("on_death", unit)
			end

			StatisticsUtil.register_kill(unit, killing_blow, statistics_db, true)

			local unit_game_object_id = network_manager:unit_game_object_id(unit)

			network_transmit:send_rpc_clients("rpc_register_kill", unit_game_object_id)
			conflict_director:destroy_unit(unit, blackboard, "out_of_range")
		end
	end
end
