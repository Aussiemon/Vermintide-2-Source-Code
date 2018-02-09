CameraState = class(CameraState)
CameraState.init = function (self, character_state_init_context, name)
	self.name = name
	self.world = character_state_init_context.world
	self.unit = character_state_init_context.unit
	self.csm = character_state_init_context.csm
	self.temp_params = {}
	self.camera_extension = ScriptUnit.extension(self.unit, "camera_system")

	return 
end

return 
