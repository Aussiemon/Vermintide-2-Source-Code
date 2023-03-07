Side = class(Side)

Side.init = function (self, definition, side_id)
	self._name = definition.name
	self._units = {}
	self.units_lookup = {}
	self._num_units = 0
	self._player_units = {}
	self._enemy_sides = {}
	self.enemy_sides_lookup = {}
	self._enemy_units = {}
	self.enemy_units_lookup = {}
	self._num_enemy_units = 0
	self._enemy_player_units = {}
	self._allied_sides = {}
	self.allied_sides_lookup = {}
	self._neutral_sides = {}
	self.neutral_sides_lookup = {}
	self.party = definition.party
	self.side_id = side_id
	local add_these_settings = definition.add_these_settings

	if add_these_settings then
		for key, value in pairs(add_these_settings) do
			fassert(not self[key], "Mechanism trying to add setting that is already defined")

			self[key] = value
		end
	end

	self.has_bots = false
	self.PLAYER_UNITS = {}
	self.PLAYER_POSITIONS = {}
	self.PLAYER_AND_BOT_UNITS = {}
	self.PLAYER_AND_BOT_POSITIONS = {}
	self.ENEMY_PLAYER_UNITS = {}
	self.ENEMY_PLAYER_POSITIONS = {}
	self.ENEMY_PLAYER_AND_BOT_UNITS = {}
	self.ENEMY_PLAYER_AND_BOT_POSITIONS = {}
	self.VALID_ENEMY_PLAYERS_AND_BOTS = {}
	self.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = {}
	self.AI_TARGET_UNITS = {}
end

Side.set_relation = function (self, relation, sides)
	local relation_sides, relation_side_lookup = nil

	if relation == "enemy" then
		relation_sides = self._enemy_sides
		relation_side_lookup = self.enemy_sides_lookup
	elseif relation == "ally" then
		relation_sides = self._allied_sides
		relation_side_lookup = self.allied_sides_lookup
	elseif relation == "neutral" then
		relation_sides = self._neutral_sides
		relation_side_lookup = self.neutral_sides_lookup
	else
		ferror("Unknown relation (%s)", relation)
	end

	for i = 1, #sides do
		local side = sides[i]
		relation_sides[i] = side
		relation_side_lookup[side] = true
	end
end

Side.name = function (self)
	return self._name
end

Side.get_enemy_sides = function (self)
	return self._enemy_sides
end

Side.add_unit = function (self, unit)
	fassert(self.units_lookup[unit] == nil, "Unit is already added to side.")

	local num_units = self._num_units + 1
	self._units[num_units] = unit
	self.units_lookup[unit] = num_units
	self._num_units = num_units
end

Side.remove_unit = function (self, unit)
	fassert(self.units_lookup[unit] ~= nil, "Unit has not been added or is already removed from side.")

	local units = self._units
	local num_units = self._num_units
	local units_lookup = self.units_lookup
	local replace_index = units_lookup[unit]
	local last_unit = units[num_units]
	units[replace_index] = last_unit
	units_lookup[last_unit] = replace_index
	units[num_units] = nil
	units_lookup[unit] = nil
	self._num_units = num_units - 1
end

Side.add_enemy_unit = function (self, unit)
	fassert(self.enemy_units_lookup[unit] == nil, "Enemy unit is already added to side.")

	local num_enemy_units = self._num_enemy_units + 1
	self._enemy_units[num_enemy_units] = unit
	self.enemy_units_lookup[unit] = num_enemy_units
	self._num_enemy_units = num_enemy_units
end

Side.remove_enemy_unit = function (self, unit)
	fassert(self.enemy_units_lookup[unit] ~= nil, "Enemy unit has not been added or is already removed from side.")

	local enemy_units = self._enemy_units
	local num_enemy_units = self._num_enemy_units
	local enemy_units_lookup = self.enemy_units_lookup
	local replace_index = enemy_units_lookup[unit]
	local last_unit = enemy_units[num_enemy_units]
	enemy_units[replace_index] = last_unit
	enemy_units_lookup[last_unit] = replace_index
	enemy_units[num_enemy_units] = nil
	enemy_units_lookup[unit] = nil
	self._num_enemy_units = num_enemy_units - 1
end

Side.add_player_unit = function (self, player_unit)
	local player_units = self._player_units

	fassert(table.find(player_units, player_unit) == nil, "player_unit has already been added to side.")

	local num_player_units = #player_units + 1
	player_units[num_player_units] = player_unit
end

Side.remove_player_unit = function (self, player_unit)
	local player_units = self._player_units
	local index = table.find(player_units, player_unit)

	fassert(index ~= false, "player_unit did not get added or has already been removed from side.")
	table.swap_delete(player_units, index)
end

Side.add_enemy_player_unit = function (self, player_unit)
	local enemy_player_units = self._enemy_player_units

	fassert(table.find(enemy_player_units, player_unit) == nil, "player_unit has already been added as an enemy.")

	local num_enemy_player_units = #enemy_player_units + 1
	enemy_player_units[num_enemy_player_units] = player_unit
end

Side.remove_enemy_player_unit = function (self, player_unit)
	local enemy_player_units = self._enemy_player_units
	local index = table.find(enemy_player_units, player_unit)

	fassert(index ~= nil, "player_unit did not get added or has already been removed as an enemy.")
	table.swap_delete(enemy_player_units, index)
end

Side.player_units = function (self)
	return self._player_units
end

Side.enemy_player_units = function (self)
	return self._enemy_player_units
end

Side.enemy_units = function (self)
	return self._enemy_units
end
