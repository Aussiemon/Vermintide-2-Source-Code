-- chunkname: @scripts/unit_extensions/level/crawl_space_extension.lua

CrawlSpaceExtension = class(CrawlSpaceExtension)

CrawlSpaceExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.partner_unit = nil
	self.entrance_type = Unit.get_data(unit, "entrance_type")

	local pos = Unit.local_position(unit, 0)
	local rotation = Unit.local_rotation(unit, 0)

	if self.entrance_type == "manhole" or self.entrance_type == "well" then
		rotation = Quaternion.multiply(rotation, Quaternion.from_euler_angles_xyz(90, 0, 0))
	end

	local look_dir = Vector3.flat(Quaternion.forward(rotation))

	self.enter_rot = Vector3Box(look_dir)
	self.enter_pos = Vector3Box(pos - look_dir + Vector3.down())
	self.entrance_type = Unit.get_data(unit, "entrance_type")
	self.id = Unit.get_data(unit, "crawl_space_id")
	self.type = self.id == 0 and "spawner" or "tunnel"
end

CrawlSpaceExtension.extensions_ready = function (self)
	if self.entrance_type == "chimney" then
		local interactable_extension = ScriptUnit.extension(self.unit, "interactable_system")

		interactable_extension:set_enabled(false)
	end
end

CrawlSpaceExtension.update = function (self, unit, input, dt, context, t)
	return
end

CrawlSpaceExtension.hot_join_sync = function (self, sender)
	return
end

CrawlSpaceExtension.destroy = function (self)
	self.unit = nil
	self.partner_unit = nil
end
