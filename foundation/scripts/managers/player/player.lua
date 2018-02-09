Player = class(Player)
Player.init = function (self, network_manager, input_source, viewport_name, viewport_world_name, is_server)
	self.network_manager = network_manager
	self.input_source = input_source
	self.viewport_name = viewport_name
	self.viewport_world_name = viewport_world_name
	self.owned_units = {}
	self.is_server = is_server
	self.camera_follow_unit = nil

	return 
end
Player.destroy = function (self)
	self.network_manager = nil

	return 
end
Player.set_camera_follow_unit = function (self, unit)
	self.camera_follow_unit = unit

	return 
end

return 
