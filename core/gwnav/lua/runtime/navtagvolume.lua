require("core/gwnav/lua/safe_require")

local NavTagVolume = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavTagVolume = NavClass(NavTagVolume)
local GwNavTagVolume = stingray.GwNavTagVolume
NavTagVolume.init = function (self, world, point_table, alt_min, alt_max, is_exclusive, color, layer_id, smartobject_id, user_data_id)
	self.nav_tagvolume = GwNavTagVolume.create(world, point_table, alt_min, alt_max, is_exclusive, color, layer_id, smartobject_id, user_data_id)

	return 
end
NavTagVolume.shutdown = function (self)
	GwNavTagVolume.destroy(self.nav_tagvolume)

	self.nav_tagvolume = nil

	return 
end
NavTagVolume.add_to_world = function (self)
	GwNavTagVolume.add_to_world(self.nav_tagvolume)

	return 
end
NavTagVolume.remove_from_world = function (self)
	GwNavTagVolume.remove_from_world(self.nav_tagvolume)

	return 
end

return NavTagVolume
