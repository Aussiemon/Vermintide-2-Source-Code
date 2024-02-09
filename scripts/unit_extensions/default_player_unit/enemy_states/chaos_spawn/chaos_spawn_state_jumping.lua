-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_spawn/chaos_spawn_state_jumping.lua

ChaosSpawnStateJumping = class(ChaosSpawnStateJumping, EnemyCharacterStateJumping)

ChaosSpawnStateJumping.init = function (self, character_state_init_context)
	ChaosSpawnStateJumping.super.init(self, character_state_init_context)
end

ChaosSpawnStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)
end
