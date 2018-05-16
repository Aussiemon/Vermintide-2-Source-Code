LocomotionTemplates.AILocomotionExtensionC = {
	init = function (data, nav_world)
		return
	end,
	update = function (data, t, dt)
		local units_to_kill = EngineOptimizedExtensions.ai_locomotion_update(t, dt)

		if units_to_kill then
			local ScriptUnit_extension = ScriptUnit.extension
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
			killing_blow[DamageDataIndex.DAMAGING_UNIT] = "n/a"
			killing_blow[DamageDataIndex.HIT_REACT_TYPE] = "light"
			killing_blow[DamageDataIndex.CRITICAL_HIT] = false

			for i = 1, #units_to_kill, 1 do
				print("Destroying unit since outside mesh or world")

				local unit = units_to_kill[i]
				local ai_extension = ScriptUnit_extension(unit, "ai_system")
				local blackboard = ai_extension._blackboard
				killing_blow[DamageDataIndex.ATTACKER] = unit

				StatisticsUtil.register_kill(unit, killing_blow, statistics_db, true)

				local unit_game_object_id = network_manager:unit_game_object_id(unit)

				network_transmit:send_rpc_clients("rpc_register_kill", unit_game_object_id)
				conflict_director:destroy_unit(unit, blackboard, "out_of_range")
			end
		end
	end
}

return
