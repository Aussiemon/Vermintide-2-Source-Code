-- chunkname: @scripts/unit_extensions/camera/generic_camera_extension.lua

GenericCameraExtension = class(GenericCameraExtension)

GenericCameraExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.player = extension_init_data.player
	self.viewport_name = self.player.viewport_name
	self.idle_position = Vector3Box(0, 0, 0)
	self.idle_rotation = QuaternionBox(Quaternion.identity())
	self.external_state_change = nil
	self.external_state_change_params = nil
end

GenericCameraExtension.extensions_ready = function (self)
	return
end

GenericCameraExtension.update = function (self, unit, input, dt, context, t)
	if self._delayed_state_change and t > self._delayed_state_change_t then
		self:set_external_state_change(self._delayed_state_change, self._delayed_state_change_params)
	end

	local override_follow_unit = self.override_follow_unit

	if override_follow_unit and not Unit.alive(override_follow_unit) then
		self:set_follow_unit(nil, nil)
	end
end

GenericCameraExtension.set_external_state_change = function (self, state, params)
	self.external_state_change = state
	self.external_state_change_params = params
	self._delayed_state_change = nil
	self._delayed_state_change_t = nil
	self._delayed_state_change_params = nil
end

GenericCameraExtension.set_delayed_external_state_change = function (self, state, params, t)
	self._delayed_state_change = state
	self._delayed_state_change_t = t
	self._delayed_state_change_params = params
end

GenericCameraExtension.set_idle_position = function (self, position)
	local viewport_name = self.viewport_name

	assert(Vector3.is_valid(position), "Trying to set invalid camera position")
	self.idle_position:store(position)
end

GenericCameraExtension.set_idle_rotation = function (self, rotation)
	local viewport_name = self.viewport_name

	self.idle_rotation:store(rotation)
end

GenericCameraExtension.get_idle_position = function (self)
	return self.idle_position:unbox()
end

GenericCameraExtension.get_idle_rotation = function (self)
	return self.idle_rotation:unbox()
end

GenericCameraExtension.set_follow_unit = function (self, follow_unit, follow_node)
	self.override_follow_unit = follow_unit
	self.override_follow_node = follow_node and Unit.node(follow_unit, follow_node) or nil
end

GenericCameraExtension.get_follow_data = function (self)
	local player = self.player
	local player_unit = player.player_unit
	local first_person_unit, node

	if player.respawning then
		return
	end

	if self.override_follow_unit then
		return self.override_follow_unit, self.override_follow_node
	elseif player_unit and ScriptUnit.has_extension(player_unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

		first_person_unit = first_person_extension:get_first_person_unit()
		node = Unit.node(first_person_unit, "camera_node")
	end

	return first_person_unit, node
end

GenericCameraExtension.destroy = function (self)
	return
end
