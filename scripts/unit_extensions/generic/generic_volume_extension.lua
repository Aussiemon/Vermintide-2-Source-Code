require("scripts/unit_extensions/generic/generic_volume_templates")

GenericVolumeExtension = class(GenericVolumeExtension)
GenericVolumeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.volume_data = {}
	self.active_updates_n = 0

	return 
end
GenericVolumeExtension.destroy = function (self)
	local unit = self.unit

	for _, data in pairs(self.volume_data) do
		if data.is_inside then
			data.is_inside = false

			if data.destroy_func then
				data.destroy_func(unit, data)
			end
		end
	end

	self.unit = nil
	self.volume_data = nil

	return 
end
GenericVolumeExtension.on_volume_enter = function (self, dt, t, volume)
	local volume_data = self.volume_data
	local templates = GenericVolumeTemplates.functions

	if not volume_data[volume.volume_name] then
		volume_data[volume.volume_name] = {
			update_active = false,
			volume_name = volume.volume_name,
			volume_type = volume.volume_type,
			level = volume.level,
			params = volume.params,
			settings = volume.settings,
			enter_func = templates[volume.volume_type][volume.params.sub_type].on_enter,
			update_func = templates[volume.volume_type][volume.params.sub_type].update,
			exit_func = templates[volume.volume_type][volume.params.sub_type].on_exit,
			destroy_func = templates[volume.volume_type][volume.params.sub_type].on_destroy
		}
	end

	local data = volume_data[volume.volume_name]
	data.is_inside = true

	if data.enter_func then
		data.enter_func(self.unit, dt, t, data)
	end

	if data.update_func then
		self.set_update_active(self, data, true)
	end

	return 
end
GenericVolumeExtension.on_volume_exit = function (self, volume)
	local data = self.volume_data[volume.volume_name]
	data.is_inside = false

	if data.exit_func then
		data.exit_func(self.unit, data)
	end

	if data.update_func then
		self.set_update_active(self, data, false)
	end

	return 
end
GenericVolumeExtension.on_volume_unregistered = function (self, volume)
	self.volume_data[volume.volume_name] = nil

	return 
end
GenericVolumeExtension.update = function (self, dt, t, context)
	local unit = self.unit

	for _, data in pairs(self.volume_data) do
		if data.update_active then
			data.update_func(unit, dt, t, context, data)
		end
	end

	return 
end
GenericVolumeExtension.set_update_active = function (self, data, active)
	self.active_updates_n = self.active_updates_n + ((active and 1) or -1)
	data.update_active = active

	return 
end
GenericVolumeExtension.do_update = function (self)
	return 0 < self.active_updates_n
end
GenericVolumeExtension.is_inside_volume = function (self, volume_name)
	local volume_data = self.volume_data
	local data = volume_data and volume_data[volume_name]
	local is_inside = (data and data.is_inside) or false

	return is_inside
end

return 
