require("scripts/managers/side/side")

SideManager = class(SideManager)
ALL_PLAYER_AND_BOT_UNITS = {}

SideManager.init = function (self, side_compositions)
	side_compositions[0] = {
		name = "undecided",
		relations = {},
		available_profiles = {},
		party = Managers.party:get_party(0)
	}
	self._sides, self._side_lookup = self:_create_sides(side_compositions)

	self:_setup_relations(side_compositions, self._sides, self._side_lookup)

	self.side_by_party = self:_setup_side_by_party(self._sides)
	self.side_by_unit = {}
	self._player_units_lookup = {}
end

SideManager._create_sides = function (self, side_compositions)
	local sides = {}
	local side_lookup = {}

	for i = 0, #side_compositions, 1 do
		local definition = side_compositions[i]
		local side_name = definition.name

		fassert(side_lookup[side_name] == nil, "Side with the same name exists in side_composition, side_name(%s)", side_name)

		local side = Side:new(definition, i)
		sides[i] = side
		side_lookup[side_name] = side
	end

	fassert(table.is_empty(sides) == false, "No sides specified")

	return sides, side_lookup
end

SideManager._setup_relations = function (self, side_compositions, sides, side_lookup)
	for i = 0, #side_compositions, 1 do
		local definition = side_compositions[i]
		local side = sides[i]
		local relations = definition.relations

		for relation, side_list in pairs(relations) do
			local temp_sides = {}

			for j = 1, #side_list, 1 do
				local relation_side_name = side_list[j]

				fassert(side_lookup[relation_side_name], "Side (%s) does not exist", relation_side_name)

				temp_sides[#temp_sides + 1] = side_lookup[relation_side_name]
			end

			side:set_relation(relation, temp_sides)
		end
	end
end

SideManager._setup_side_by_party = function (self, sides)
	local side_by_party = {}

	for i = 0, #sides, 1 do
		local side = sides[i]
		local party = side.party

		if party then
			fassert(side_by_party[party] == nil, "Party has multiple sides, this is not supported (party_id==%s)", tostring(party.party_id))

			side_by_party[party] = side
		end
	end

	return side_by_party
end

SideManager.sides = function (self)
	return self._sides
end

SideManager.get_side = function (self, side_id)
	return self._sides[side_id]
end

SideManager.get_side_from_name = function (self, name)
	return self._side_lookup[name]
end

SideManager.get_party_from_side_name = function (self, name)
	local side = self._side_lookup[name]

	return side.party
end

SideManager.versus_is_hero = function (self, unit)
	local side = self.side_by_unit[unit]

	return side and side:name() == "heroes"
end

SideManager.versus_is_dark_pact = function (self, unit)
	local side = self.side_by_unit[unit]

	return side and side:name() == "dark_pact"
end

SideManager.add_unit_to_side = function (self, unit, side_id)
	local side = self._sides[side_id]

	side:add_unit(unit)

	self.side_by_unit[unit] = side
	local enemy_sides = side:get_enemy_sides()

	for i = 1, #enemy_sides, 1 do
		local enemy_side = enemy_sides[i]

		enemy_side:add_enemy_unit(unit)
	end

	return side
end

SideManager.remove_unit_from_side = function (self, unit)
	local side = self.side_by_unit[unit]

	if not side then
		return
	end

	local enemy_sides = side:get_enemy_sides()

	for i = 1, #enemy_sides, 1 do
		local enemy_side = enemy_sides[i]

		enemy_side:remove_enemy_unit(unit)
	end

	self.side_by_unit[unit] = nil

	side:remove_unit(unit)
end

SideManager.add_player_unit_to_side = function (self, player_unit, side_id)
	self:add_unit_to_side(player_unit, side_id)

	local side = self._sides[side_id]

	side:add_player_unit(player_unit)

	local enemy_sides = side:get_enemy_sides()

	for i = 1, #enemy_sides, 1 do
		local enemy_side = enemy_sides[i]

		enemy_side:add_enemy_player_unit(player_unit)
	end

	self._player_units_lookup[player_unit] = true
end

SideManager.remove_player_unit_from_side = function (self, player_unit)
	self._player_units_lookup[player_unit] = nil
	local side = self.side_by_unit[player_unit]
	local enemy_sides = side:get_enemy_sides()

	for i = 1, #enemy_sides, 1 do
		local enemy_side = enemy_sides[i]

		enemy_side:remove_enemy_player_unit(player_unit)
	end

	side:remove_player_unit(player_unit)
	self:remove_unit_from_side(player_unit)
	self:_remove_player_unit_from_lists(player_unit)
end

SideManager.is_enemy = function (self, unit1, unit2)
	local side = self.side_by_unit[unit1]

	return side.enemy_units_lookup[unit2] ~= nil, side
end

SideManager.is_enemy_by_side = function (self, side1, side2)
	if side1 == nil or side2 == nil then
		return false
	end

	if side1.enemy_sides_lookup[side2] == nil then
		return false
	end

	return true
end

SideManager.is_player_friendly_fire = function (self, unit1, unit2)
	if not unit1 or not unit2 then
		return false
	end

	local player_units_lookup = self._player_units_lookup

	if not player_units_lookup[unit1] or not player_units_lookup[unit2] then
		return false
	end

	local side1 = self.side_by_unit[unit1]
	local side2 = self.side_by_unit[unit2]

	if not side1 or not side2 then
		return false
	end

	return side1 == side2
end

SideManager.destroy = function (self)
	self._sides = nil
	self.side_by_unit = nil
	self._player_units_lookup = nil
end

SideManager.remove_aggro_unit = function (self, side_id, aggro_unit)
	local side = self._sides[side_id]
	local enemy_sides = side:get_enemy_sides()
	local num_enemy_sides = #enemy_sides

	for i = 1, num_enemy_sides, 1 do
		local enemy_side = enemy_sides[i]
		local ai_target_units = enemy_side.AI_TARGET_UNITS
		local size = #ai_target_units

		for j = 1, size, 1 do
			if aggro_unit == ai_target_units[j] then
				ai_target_units[j] = ai_target_units[size]
				ai_target_units[size] = nil

				break
			end
		end
	end
end

SideManager.update_frame_tables = function (self)
	table.clear(ALL_PLAYER_AND_BOT_UNITS)

	local sides = self._sides
	local num_sides = #sides

	for i = 1, num_sides, 1 do
		local side = sides[i]

		self:_update_frame_tables(side, ALL_PLAYER_AND_BOT_UNITS)
	end

	for i = 1, num_sides, 1 do
		local side = sides[i]

		self:_update_enemy_frame_tables(side)
	end
end

local unit_alive = Unit.alive

local function is_valid(unit)
	return unit_alive(unit) and not ScriptUnit.extension(unit, "status_system"):is_ready_for_assisted_respawn()
end

local function is_valid_target(unit)
	local status_ext = ScriptUnit.extension(unit, "status_system")
	local dlc_valid = true

	if status_ext.in_ghost_mode then
		dlc_valid = false
	end

	return not status_ext:is_in_end_zone() and not status_ext:is_invisible() and dlc_valid and not status_ext.spawn_grace and ScriptUnit.extension(unit, "health_system"):is_alive()
end

local function is_valid_aggro_target(unit)
	if not unit_alive(unit) then
		return false
	end

	local status_ext = ScriptUnit.has_extension(unit, "status_system")

	if status_ext then
		return not status_ext.ready_for_assisted_respawn and not status_ext:is_in_end_zone() and not status_ext:is_invisible() and not status_ext.spawn_grace and ScriptUnit.extension(unit, "health_system"):is_alive()
	end

	return true
end

local position_lookup = POSITION_LOOKUP

SideManager._update_frame_tables = function (self, side, all_human_and_bot_units)
	local human_units = side.PLAYER_UNITS
	local human_unit_positions = side.PLAYER_POSITIONS
	local all_index = #all_human_and_bot_units
	local human_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local human_and_bot_unit_positions = side.PLAYER_AND_BOT_POSITIONS
	local num_human_units = 0
	local num_human_and_bot_units = 0
	local added_player_units = side:player_units()
	local num_added_player_units = #added_player_units
	local player_manager = Managers.player
	local has_bots = false

	for i = 1, num_added_player_units, 1 do
		local unit = added_player_units[i]

		if is_valid(unit) then
			local pos = position_lookup[unit]
			num_human_and_bot_units = num_human_and_bot_units + 1
			human_and_bot_units[num_human_and_bot_units] = unit
			human_and_bot_unit_positions[num_human_and_bot_units] = pos
			all_human_and_bot_units[all_index + i] = unit
			local player = player_manager:owner(unit)

			if player:is_player_controlled() then
				num_human_units = num_human_units + 1
				human_units[num_human_units] = unit
				human_unit_positions[num_human_units] = pos
			else
				has_bots = true
			end
		end
	end

	side.has_bots = has_bots
	local i = num_human_units + 1

	while human_units[i] do
		human_units[i] = nil
		human_unit_positions[i] = nil
		i = i + 1
	end

	local k = num_human_and_bot_units + 1

	while human_and_bot_units[k] do
		human_and_bot_units[k] = nil
		human_and_bot_unit_positions[k] = nil
		k = k + 1
	end
end

SideManager._update_enemy_frame_tables = function (self, side)
	local human_units = side.ENEMY_PLAYER_UNITS
	local human_unit_positions = side.ENEMY_PLAYER_POSITIONS
	local human_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local human_and_bot_unit_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local valid_humans_and_bots = side.VALID_ENEMY_PLAYERS_AND_BOTS
	local valid_target_humans_and_bots = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	table.clear(valid_humans_and_bots)
	table.clear(valid_target_humans_and_bots)

	local num_human_units = 0
	local num_human_and_bot_units = 0
	local enemy_player_units = side:enemy_player_units()
	local num_enemy_player_units = #enemy_player_units
	local player_manager = Managers.player

	for i = 1, num_enemy_player_units, 1 do
		local unit = enemy_player_units[i]

		if is_valid(unit) then
			local pos = position_lookup[unit]
			num_human_and_bot_units = num_human_and_bot_units + 1
			human_and_bot_units[num_human_and_bot_units] = unit
			human_and_bot_unit_positions[num_human_and_bot_units] = pos
			valid_humans_and_bots[unit] = true
			local player = player_manager:owner(unit)

			if player:is_player_controlled() then
				num_human_units = num_human_units + 1
				human_units[num_human_units] = unit
				human_unit_positions[num_human_units] = pos
			end

			if is_valid_target(unit) then
				valid_target_humans_and_bots[unit] = true
			end
		end
	end

	local i = num_human_units + 1

	while human_units[i] do
		human_units[i] = nil
		human_unit_positions[i] = nil
		i = i + 1
	end

	local k = num_human_and_bot_units + 1

	while human_and_bot_units[k] do
		human_and_bot_units[k] = nil
		human_and_bot_unit_positions[k] = nil
		k = k + 1
	end

	local ai_target_units = side.AI_TARGET_UNITS
	local aggro_system = Managers.state.entity:system("aggro_system")
	local enemy_sides = side:get_enemy_sides()
	local num_enemy_sides = #enemy_sides
	local j = 1

	for ii = 1, num_enemy_sides, 1 do
		local enemy_side = enemy_sides[ii]
		local aggroable_units = aggro_system.aggroable_units[enemy_side.side_id]

		for unit, _ in pairs(aggroable_units) do
			if is_valid_aggro_target(unit) then
				ai_target_units[j] = unit
				j = j + 1
			end
		end
	end

	while ai_target_units[j] do
		ai_target_units[j] = nil
		j = j + 1
	end
end

SideManager._remove_player_unit_from_lists = function (self, player_unit)
	POSITION_LOOKUP[player_unit] = nil
	local sides = self._sides
	local num_sides = #sides

	for i = 1, num_sides, 1 do
		local side = sides[i]
		local player_units = side.PLAYER_UNITS
		local player_positions = side.PLAYER_POSITIONS
		local size = #player_units

		for j = 1, size, 1 do
			if player_unit == player_units[j] then
				player_units[j] = player_units[size]
				player_units[size] = nil
				player_positions[j] = player_positions[size]
				player_positions[size] = nil

				break
			end
		end

		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local player_and_bot_positions = side.PLAYER_AND_BOT_POSITIONS
		size = #player_and_bot_units

		for j = 1, size, 1 do
			if player_unit == player_and_bot_units[j] then
				player_and_bot_units[j] = player_and_bot_units[size]
				player_and_bot_units[size] = nil
				player_and_bot_positions[j] = player_and_bot_positions[size]
				player_and_bot_positions[size] = nil

				break
			end
		end

		local enemy_player_units = side.ENEMY_PLAYER_UNITS
		local enemy_player_positions = side.ENEMY_PLAYER_POSITIONS
		size = #enemy_player_units

		for j = 1, size, 1 do
			if player_unit == enemy_player_units[j] then
				enemy_player_units[j] = enemy_player_units[size]
				enemy_player_units[size] = nil
				enemy_player_positions[j] = enemy_player_positions[size]
				enemy_player_positions[size] = nil

				break
			end
		end

		local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
		local enemy_player_and_bot_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
		size = #enemy_player_and_bot_units

		for j = 1, size, 1 do
			if player_unit == enemy_player_and_bot_units[j] then
				enemy_player_and_bot_units[j] = enemy_player_and_bot_units[size]
				enemy_player_and_bot_units[size] = nil
				enemy_player_and_bot_positions[j] = enemy_player_and_bot_positions[size]
				enemy_player_and_bot_positions[size] = nil

				break
			end
		end

		side.VALID_ENEMY_PLAYERS_AND_BOTS[player_unit] = nil
		side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[player_unit] = nil
	end
end

SideManager.get_side_from_player_unique_id = function (self, unique_id)
	local party_manager = Managers.party
	local player_status = party_manager:get_status_from_unique_id(unique_id)
	local player_party_id = player_status.party_id
	local player_party = party_manager:get_party(player_party_id)
	local side = self.side_by_party[player_party]

	return side
end

return
