﻿-- chunkname: @scripts/unit_extensions/ai_supplementary/shadow_dagger_extension.lua

ShadowDaggerExtension = class(ShadowDaggerExtension)

local DAGGER_DURATION = 10

ShadowDaggerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._projectile_locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
end

ShadowDaggerExtension.destroy = function (self)
	return
end

ShadowDaggerExtension.on_remove_extension = function (self, unit, extension_name)
	return
end

ShadowDaggerExtension.update = function (self, unit, input, dt, context, t)
	if self._done then
		return
	end

	local current_life_time = self._projectile_locomotion_extension.time_lived
	local unit_alive = Unit.alive(unit)

	if not unit_alive then
		self._done = true
	elseif current_life_time > DAGGER_DURATION then
		Managers.state.unit_spawner:mark_for_deletion(unit)

		self._done = true
	end
end
