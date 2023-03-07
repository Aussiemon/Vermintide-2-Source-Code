require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosPlagueWaveSpawnerSummoningAction = class(BTChaosPlagueWaveSpawnerSummoningAction, BTNode)
BTChaosPlagueWaveSpawnerSummoningAction.name = "BTChaosPlagueWaveSpawnerSummoningAction"
local BTChaosPlagueWaveSpawnerSummoningAction = BTChaosPlagueWaveSpawnerSummoningAction

BTChaosPlagueWaveSpawnerSummoningAction.init = function (self, ...)
	BTChaosPlagueWaveSpawnerSummoningAction.super.init(self, ...)
end

BTChaosPlagueWaveSpawnerSummoningAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local breed = blackboard.breed
	blackboard.action = action
	local target_dist = blackboard.target_dist
	blackboard.ready_to_summon = false

	if not blackboard.plague_wave_data then
		blackboard.plague_wave_data = {
			plague_wave_timer = t + action.plague_wave_spawn_cooldown,
			physics_world = World.get_data(blackboard.world, "physics_world"),
			target_starting_pos = Vector3Box(),
			plague_wave_rot = QuaternionBox()
		}
	end
end

BTChaosPlagueWaveSpawnerSummoningAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
end

BTChaosPlagueWaveSpawnerSummoningAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local plague_wave_data = blackboard.plague_wave_data
	local skulk_data = blackboard.skulk_data
	local target_unit = blackboard.target_unit
	local external_event_name = blackboard.external_event_name
	local external_event_value = blackboard.external_event_value
	local timer = action.plague_wave_spawn_cooldown

	if external_event_name and external_event_name == action.external_event_name then
		timer = external_event_value
	end

	if external_event_value and external_event_value >= 100 then
		Managers.state.conflict:destroy_unit(unit, blackboard, "plague_wave_spawner")

		return
	end

	local anticipation_fx = action.anticipation_fx

	if not blackboard.anticipation_fx_id and anticipation_fx and t > plague_wave_data.plague_wave_timer - action.anticipation_fx_offset_time then
		local world = blackboard.world
		blackboard.anticipation_fx_id = World.create_particles(world, anticipation_fx, POSITION_LOOKUP[unit], Quaternion.identity())
	end

	if plague_wave_data.plague_wave_timer < t and not ScriptUnit.extension(target_unit, "status_system"):is_invisible() then
		local nav_world = blackboard.nav_world
		local target_position = POSITION_LOOKUP[target_unit]
		local unit_pos = POSITION_LOOKUP[unit]
		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, unit_pos, 1, 1)
		local projected_end_pos = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 1)
		local success = projected_start_pos and projected_end_pos and GwNavQueries.raycango(nav_world, projected_start_pos, projected_end_pos)

		if success then
			plague_wave_data.plague_wave_timer = t + timer or action.plague_wave_spawn_cooldown
			blackboard.ready_to_summon = true
			blackboard.summoning_finished = true
			blackboard.anticipation_fx_id = nil
		else
			plague_wave_data.plague_wave_timer = t + 2
		end

		return "done"
	end

	return "running"
end
