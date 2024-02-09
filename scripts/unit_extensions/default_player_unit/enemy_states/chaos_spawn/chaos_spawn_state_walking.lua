-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_spawn/chaos_spawn_state_walking.lua

ChaosSpawnStateWalking = class(ChaosSpawnStateWalking, EnemyCharacterStateWalking)

ChaosSpawnStateWalking.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local status_extension = self._status_extension
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	self:_update_taunt_dialogue(t)

	handled = self:common_movement(in_ghost_mode, dt)
end
