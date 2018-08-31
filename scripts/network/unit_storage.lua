local function bimap_add(bm, a, b)
	fassert(a and b, "bimap_add, nil arguments")
	fassert(not bm[a] and not bm[b], "bimap_add, already contained a and/or b")

	bm[b] = a
	bm[a] = b
end

local function bimap_remove(bm, a)
	fassert(a, "bimap_add, nil argument")

	local b = bm[a]

	fassert(b, "bimap_remove, didn't contain item")

	bm[a], bm[b] = nil
end

local type = type
NetworkUnitStorage = class(NetworkUnitStorage)

NetworkUnitStorage.init = function (self)
	self.bimap_goid_unit = {}
	self.frozen_bimap_goid_unit = {}
	self.map_goid_to_unit = {}
	self.map_goid_to_gotype = {}
	self.map_goid_to_owner = {}
	self.owner_goid_array = {}
end

NetworkUnitStorage.freeze = function (self, unit)
	local go_id = self.bimap_goid_unit[unit]

	bimap_add(self.frozen_bimap_goid_unit, unit, go_id)
	bimap_remove(self.bimap_goid_unit, unit)
end

NetworkUnitStorage.unfreeze = function (self, unit)
	local go_id = self.frozen_bimap_goid_unit[unit]

	bimap_remove(self.frozen_bimap_goid_unit, unit)
	bimap_add(self.bimap_goid_unit, unit, go_id)
end

NetworkUnitStorage.units = function (self)
	return self.map_goid_to_unit
end

NetworkUnitStorage.go_id = function (self, unit)
	fassert(type(unit) ~= "number", "Not allowed to pass in a go_id here anymore.")

	return self.bimap_goid_unit[unit]
end

NetworkUnitStorage.unit = function (self, go_id)
	fassert(type(go_id) ~= "userdata", "Not allowed to pass in a unit here anymore.")

	return self.bimap_goid_unit[go_id]
end

NetworkUnitStorage.remove = function (self, unit, go_id)
	self:remove_owner(unit, go_id)

	self.map_goid_to_gotype[go_id] = nil
	self.map_goid_to_unit[go_id] = nil

	if self.frozen_bimap_goid_unit[unit] then
		bimap_remove(self.frozen_bimap_goid_unit, unit)
	else
		bimap_remove(self.bimap_goid_unit, unit)
	end

	NetworkUnit.reset_unit(unit)
end

NetworkUnitStorage.remove_owner = function (self, unit, go_id)
	local current_owner = self.map_goid_to_owner[go_id]

	if current_owner then
		self.owner_goid_array[current_owner][go_id] = nil
		self.map_goid_to_owner[go_id] = nil
	end

	NetworkUnit.set_owner_peer_id(unit, nil)
end

NetworkUnitStorage.set_owner = function (self, unit, go_id, owner)
	self:remove_owner(unit, go_id)

	local owner_goid_list = self.owner_goid_array[owner]

	if not owner_goid_list then
		owner_goid_list = {}
		self.owner_goid_array[owner] = owner_goid_list
	end

	owner_goid_list[go_id] = unit
	self.map_goid_to_owner[go_id] = owner

	NetworkUnit.set_owner_peer_id(unit, owner)
end

NetworkUnitStorage.owner = function (self, go_id)
	return self.map_goid_to_owner[go_id]
end

NetworkUnitStorage.add_unit = function (self, unit, go_id, owner)
	fassert(go_id ~= NetworkConstants.invalid_game_object_id, "invalid go_id")

	self.map_goid_to_unit[go_id] = unit

	bimap_add(self.bimap_goid_unit, unit, go_id)
	NetworkUnit.set_game_object_id(unit, go_id)

	if owner then
		self:set_owner(unit, go_id, owner)
	end
end

NetworkUnitStorage.add_unit_info = function (self, unit, go_id, go_type, owner)
	self.map_goid_to_gotype[go_id] = go_type

	NetworkUnit.set_game_object_type(unit, go_type)
	self:add_unit(unit, go_id, owner)
end

NetworkUnitStorage.go_type = function (self, go_id)
	return self.map_goid_to_gotype[go_id]
end

NetworkUnitStorage.transfer_go_id = function (self, unit, unit_new)
	local bimap_goid_unit = self.bimap_goid_unit
	local go_id = bimap_goid_unit[unit]
	bimap_goid_unit[unit_new] = go_id
	bimap_goid_unit[go_id] = unit_new
	bimap_goid_unit[unit] = nil
	self.map_goid_to_unit[go_id] = unit_new

	NetworkUnit.transfer_unit(unit, unit_new)
end

return
