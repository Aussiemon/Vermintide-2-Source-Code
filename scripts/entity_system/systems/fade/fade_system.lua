FadeSystem = class(FadeSystem, ExtensionSystemBase)
FadeSystem.system_extensions = {
	"PlayerUnitFadeExtension",
	"AIUnitFadeExtension"
}
local unit_alive = Unit.alive
local script_unit_extension = ScriptUnit.extension

FadeSystem.init = function (self, entity_system_creation_context, system_name)
	local extensions = FadeSystem.system_extensions

	FadeSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.fade_system = EngineOptimizedExtensions.fade_init_system()
end

FadeSystem.destroy = function (self)
	EngineOptimizedExtensions.fade_destroy_system(self.fade_system)
end

FadeSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	EngineOptimizedExtensions.fade_on_add_extension(self.fade_system, unit)
	ScriptUnit.set_extension(unit, self.name, {})

	return {}
end

FadeSystem.set_min_fade = function (self, unit, min_fade)
	EngineOptimizedExtensions.fade_set_min_fade(self.fade_system, unit, min_fade)
end

FadeSystem.on_remove_extension = function (self, unit, extension_name)
	EngineOptimizedExtensions.fade_on_remove_extension(self.fade_system, unit)
	ScriptUnit.remove_extension(unit, self.name)
end

FadeSystem.on_freeze_extension = function (self, unit, extension_name)
	EngineOptimizedExtensions.fade_on_remove_extension(self.fade_system, unit)
end

FadeSystem.freeze = function (self, unit, extension_name, reason)
	EngineOptimizedExtensions.fade_on_remove_extension(self.fade_system, unit)
end

FadeSystem.unfreeze = function (self, unit)
	EngineOptimizedExtensions.fade_on_add_extension(self.fade_system, unit)
end

FadeSystem.local_player_created = function (self, player)
	self.player = player
end

FadeSystem.update = function (self, context, t)
	if Development.parameter("fade_on_camera_ai_collision") == false then
		return
	end

	if not self.player then
		return
	end

	local local_player = self.player
	local local_player_id = local_player:local_player_id()
	local viewport_name = local_player.viewport_name
	local camera_position = nil
	local freeflight_manager = Managers.free_flight

	if freeflight_manager:active(local_player_id) then
		camera_position = freeflight_manager:camera_position_rotation(local_player_id)
	else
		camera_position = Managers.state.camera:camera_position(viewport_name)
	end

	EngineOptimizedExtensions.fade_update(self.fade_system, camera_position)

	if script_data.fade_debug_unit then
		if self.debug_unit ~= script_data.debug_unit then
			if Unit.alive(self.debug_unit) then
				Unit.set_scalar_for_materials_in_unit_and_childs(self.debug_unit, "inv_jitter_alpha", 0)
			end

			self.debug_unit = script_data.debug_unit
		end

		if Unit.alive(self.debug_unit) then
			local value = (math.cos(t * 4) + 1) * 0.25

			Unit.set_scalar_for_materials_in_unit_and_childs(self.debug_unit, "inv_jitter_alpha", value)
		end
	end
end

return
