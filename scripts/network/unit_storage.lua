local function bimap_add(bm, a, b)
	assert(not bm[a] and not bm[b], "bimap_add")

	bm[b] = a
	bm[a] = b

	return 
end

local function bimap_remove(bm, a)
	local b = bm[a]

	assert(b, "bimap_remove")

	bm[a], bm[b] = nil

	return 
end

local type = type
NetworkUnitStorage = class(NetworkUnitStorage)
NetworkUnitStorage.init = function (self)
	self.map_goid_to_unit = {}
	self.bimap_goid_unit = {}
	self.map_goid_to_gotype = {}
	self.map_goid_to_owner = {}
	self.owner_goid_array = {}

	return 
end
NetworkUnitStorage.units = function (self)
	return self.map_goid_to_unit
end
NetworkUnitStorage.go_id = function (self, o)
	if type(o) == "number" then
		return o
	end

	return self.bimap_goid_unit[o]
end
NetworkUnitStorage.unit = function (self, o)
	if type(o) == "number" then
		return self.map_goid_to_unit[o]
	end

	return o
end
NetworkUnitStorage.remove = function (self, o)
	local unit = self.unit(self, o)
	local go_id = self.go_id(self, o)

	self.remove_owner(self, o)

	self.map_goid_to_gotype[go_id] = nil
	self.map_goid_to_unit[go_id] = nil

	bimap_remove(self.bimap_goid_unit, unit)
	NetworkUnit.reset_unit(unit)

	return 
end
NetworkUnitStorage.remove_owner = function (self, o)
	local unit = self.unit(self, o)
	local go_id = self.go_id(self, o)
	local current_owner = self.map_goid_to_owner[go_id]

	if current_owner then
		self.owner_goid_array[current_owner][go_id] = nil
		self.map_goid_to_owner[go_id] = nil
	end

	NetworkUnit.set_owner_peer_id(unit, nil)

	return 
end
NetworkUnitStorage.set_owner = function (self, o, owner)
	self.remove_owner(self, o)

	local unit = self.unit(self, o)
	local go_id = self.go_id(self, o)
	local owner_goid_list = self.owner_goid_array[owner]

	if not owner_goid_list then
		owner_goid_list = {}
		self.owner_goid_array[owner] = owner_goid_list
	end

	owner_goid_list[go_id] = unit
	self.map_goid_to_owner[go_id] = owner

	NetworkUnit.set_owner_peer_id(unit, owner)

	return 
end
NetworkUnitStorage.owner = function (self, o)
	local go_id = self.go_id(self, o)

	return self.map_goid_to_owner[go_id]
end
NetworkUnitStorage.add_unit = function (self, unit, go_id, owner)
	assert(go_id ~= NetworkConstants.invalid_game_object_id, "invalid go_id")

	self.map_goid_to_unit[go_id] = unit

	bimap_add(self.bimap_goid_unit, unit, go_id)
	NetworkUnit.set_game_object_id(unit, go_id)

	if owner then
		self.set_owner(self, unit, owner)
	end

	return 
end
NetworkUnitStorage.add_unit_info = function (self, unit, go_id, go_type, owner)
	self.map_goid_to_gotype[go_id] = go_type

	NetworkUnit.set_game_object_type(unit, go_type)
	self.add_unit(self, unit, go_id, owner)

	return 
end
NetworkUnitStorage.go_type = function (self, o)
	return self.map_goid_to_gotype[self.go_id(self, o)]
end

return 
