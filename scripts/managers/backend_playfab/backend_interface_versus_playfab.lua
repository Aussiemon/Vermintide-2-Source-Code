-- chunkname: @scripts/managers/backend_playfab/backend_interface_versus_playfab.lua

BackendInterfaceVersusPlayFab = class(BackendInterfaceVersusPlayFab)

local LOADOUT_INTERFACE_OVERRIDES = {
	slot_frame = "versus",
	slot_hat = "versus",
	slot_melee = "versus",
	slot_necklace = "versus",
	slot_ranged = "versus",
	slot_ring = "versus",
	slot_skin = "versus",
	slot_trinket_1 = "versus",
}

BackendInterfaceVersusPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._profile_data = {}
	self._items_interface = Managers.backend:get_interface("items")

	Managers.backend:add_loadout_interface_override("versus", LOADOUT_INTERFACE_OVERRIDES)
	Managers.backend:add_loadout_interface_override("inn_vs", LOADOUT_INTERFACE_OVERRIDES)

	self._dirty = true
end

BackendInterfaceVersusPlayFab._refresh = function (self)
	local vs_profile_data = self._backend_mirror:get_read_only_data("vs_profile_data") or "{}"

	self._profile_data = cjson.decode(vs_profile_data)
	self._dirty = false
end

BackendInterfaceVersusPlayFab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceVersusPlayFab.ready = function (self)
	return true
end

BackendInterfaceVersusPlayFab.get_profile_data = function (self, key)
	if self._dirty then
		self:_refresh()
	end

	return self._profile_data[key]
end

BackendInterfaceVersusPlayFab.get_loadout_item_id = function (self, career_name, slot_name)
	if self._dirty then
		self:_refresh()
	end

	return self._items_interface:get_loadout_item_id(career_name, slot_name)
end

BackendInterfaceVersusPlayFab.set_loadout_item = function (self, item_id, career_name, slot_name)
	if self._dirty then
		self:_refresh()
	end

	self._dirty = true

	return self._items_interface:set_loadout_item(item_id, career_name, slot_name)
end
