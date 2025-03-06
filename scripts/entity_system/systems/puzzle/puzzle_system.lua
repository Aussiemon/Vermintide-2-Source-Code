-- chunkname: @scripts/entity_system/systems/puzzle/puzzle_system.lua

require("scripts/unit_extensions/puzzle/combination_puzzle_extension")

PuzzleSystem = class(PuzzleSystem, ExtensionSystemBase)

local EXTENSIONS = {
	"PuzzleExtensionBase",
	"CombinationPuzzleExtension",
}
local RPCS = {
	"rpc_on_puzzle_completed",
}

PuzzleSystem.init = function (self, entity_system_creation_context, system_name)
	PuzzleSystem.super.init(self, entity_system_creation_context, system_name, EXTENSIONS)

	self._is_server = entity_system_creation_context.is_server
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._extensions = Script.new_map(16)
	self._network_manager = entity_system_creation_context.network_manager
	self._puzzle_groups = {}
	self._puzzles_to_update = {}
	self._group_id_hash_lookup = {}
	self._puzzle_id_hash_lookup = {}
end

PuzzleSystem.destroy = function (self)
	PuzzleSystem.super.destroy(self)
	self._network_event_delegate:unregister(self)
end

PuzzleSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local ext = PuzzleSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	self._extensions[unit] = ext

	local group_name = ext:puzzle_group_id()
	local group_id_type = type(group_name)

	if group_id_type == "string" then
		local group = self:_get_or_add_group(group_name)

		group.extensions[ext] = true
	elseif group_id_type == "table" then
		for i = 1, #group_id_type do
			local group = self:_get_or_add_group(group_id_type[i])

			group.extensions[ext] = true
		end
	end

	return ext
end

PuzzleSystem._get_or_add_group = function (self, group_name)
	local puzzle_group = self._puzzle_groups[group_name] or {
		extensions = {},
		puzzles = {},
	}

	self._puzzle_groups[group_name] = puzzle_group

	return puzzle_group
end

PuzzleSystem.on_remove_extension = function (self, unit, extension_name)
	local ext = self._extensions[unit]
	local group_name = ext:puzzle_group_id()
	local group = self:_get_or_add_group(group_name)

	group.extensions[ext] = nil
	self._extensions[unit] = nil

	PuzzleSystem.super.on_remove_extension(self, unit, extension_name)
end

PuzzleSystem.update = function (self, context, t)
	PuzzleSystem.super.update(self, context, t)

	if not self._is_server then
		return
	end

	self:_update_puzzles()
end

PuzzleSystem.register_puzzle = function (self, group_name, puzzle_name, puzzle_combination, ordered, completed_level_event, hot_join_sync_completion)
	local group = self:_get_or_add_group(group_name)

	if group.puzzles[puzzle_name] then
		return
	end

	group.puzzles[puzzle_name] = {
		completed = false,
		completed_level_event = "",
		ordered = false,
		group_name = group_name,
		combination = {},
		num_per_combination_value = {},
	}

	local puzzle = group.puzzles[puzzle_name]
	local combination_tbl = puzzle.combination
	local num_per_combination_value = puzzle.num_per_combination_value
	local parsed_combination = string.split_deprecated(puzzle_combination, ",")

	for i = 1, #parsed_combination do
		local trimmed = string.trim(parsed_combination[i])

		if trimmed == "" then
			break
		end

		combination_tbl[i] = trimmed
		num_per_combination_value[trimmed] = (num_per_combination_value[trimmed] or 0) + 1
	end

	puzzle.ordered = ordered
	puzzle.completed_level_event = completed_level_event
	puzzle.hot_join_sync_completion = hot_join_sync_completion
	self._puzzles_to_update[puzzle_name] = puzzle

	local group_hash = self._group_id_hash_lookup[group_name] or HashUtils.fnv32_hash(group_name)

	self._group_id_hash_lookup[group_hash] = group_name
	self._group_id_hash_lookup[group_name] = group_hash

	local puzzle_hash = self._puzzle_id_hash_lookup[puzzle_name] or HashUtils.fnv32_hash(puzzle_name)

	self._puzzle_id_hash_lookup[puzzle_hash] = puzzle_name
	self._puzzle_id_hash_lookup[puzzle_name] = puzzle_hash
end

PuzzleSystem.hot_join_sync = function (self, peer_id)
	for group_name, group in pairs(self._puzzle_groups) do
		local group_id_hash = self._group_id_hash_lookup[group_name]

		for puzzle_name, puzzle in pairs(group.puzzles) do
			if puzzle.hot_join_sync_completion and puzzle.completed then
				local puzzle_id_hash = self._puzzle_id_hash_lookup[puzzle_name]

				self.network_transmit:send_rpc("rpc_on_puzzle_completed", peer_id, group_id_hash, puzzle_id_hash)
			end
		end
	end
end

PuzzleSystem._update_puzzles = function (self)
	local puzzles_to_update = self._puzzles_to_update

	for puzzle_name, puzzle in pairs(puzzles_to_update) do
		local puzzle_done = self:_update_puzzle(puzzle)

		if puzzle_done then
			puzzles_to_update[puzzle_name] = nil

			self:_on_puzzle_complete(puzzle.group_name, puzzle_name)
		end
	end
end

local NUM_FOUND_PER_VALUE = {}
local INDICES_READ = {}

PuzzleSystem._update_puzzle = function (self, puzzle)
	local group_name = puzzle.group_name
	local group = self:_get_or_add_group(group_name)
	local combination = puzzle.combination
	local num_per_combination_value = puzzle.num_per_combination_value
	local puzzle_extensions = group.extensions
	local ordered = puzzle.ordered
	local num_done = 0
	local num_needed = #combination

	if ordered then
		for extension in pairs(puzzle_extensions) do
			local value = extension:puzzle_value()
			local order_id = extension:order_id()
			local combination_value = puzzle.combination[order_id]

			if value ~= combination_value then
				break
			end

			num_done = num_done + 1
		end
	else
		table.clear(NUM_FOUND_PER_VALUE)
		table.clear(INDICES_READ)

		for extension in pairs(puzzle_extensions) do
			local value = extension:puzzle_value()
			local index

			while index ~= -1 do
				index = table.index_of(combination, value, (index or 0) + 1)

				if INDICES_READ[index] then
					if NUM_FOUND_PER_VALUE[value] >= num_per_combination_value[value] then
						break
					end
				elseif index ~= -1 then
					INDICES_READ[index] = true
					NUM_FOUND_PER_VALUE[value] = (NUM_FOUND_PER_VALUE[value] or 0) + 1
					num_done = num_done + 1

					break
				end
			end
		end
	end

	return num_needed <= num_done
end

PuzzleSystem._on_puzzle_complete = function (self, group_name, puzzle_id)
	local group = self:_get_or_add_group(group_name)
	local puzzle = group.puzzles[puzzle_id]

	puzzle.completed = true

	local puzzle_extensions = group.extensions

	for ext in pairs(puzzle_extensions) do
		ext:on_puzzle_completed(puzzle_id)
	end

	local completed_level_event = puzzle.completed_level_event
	local level = LevelHelper:current_level(self.world)

	Level.trigger_event(level, completed_level_event)

	if self._is_server then
		local group_id_hash = self._group_id_hash_lookup[group_name]
		local puzzle_id_hash = self._puzzle_id_hash_lookup[puzzle_id]

		self.network_transmit:send_rpc_clients("rpc_on_puzzle_completed", group_id_hash, puzzle_id_hash)
	end
end

PuzzleSystem.rpc_on_puzzle_completed = function (self, channel_id, group_id_hash, puzzle_id_hash)
	local group_name = self._group_id_hash_lookup[group_id_hash]
	local puzzle_id = self._puzzle_id_hash_lookup[puzzle_id_hash]

	if not group_name then
		Crashify.print_exception("PuzzleSystem", "Desync during hot join. Missing puzzle group.")

		return
	elseif not puzzle_id then
		Crashify.print_exception("PuzzleSystem", "Desync during hot join. Missing puzzle in group '%s'", group_name)

		return
	end

	self:_on_puzzle_complete(group_name, puzzle_id)
end

local DEBUG_CATEGORY = "debug_puzzles"

PuzzleSystem._debug_draw_values = function (self)
	local drawn_extensions = FrameTable.alloc_table()

	Managers.state.debug_text:clear_world_text(DEBUG_CATEGORY)

	local puzzle_extensions = self._extensions

	for unit, ext in pairs(puzzle_extensions) do
		if not drawn_extensions[ext] then
			local value = ext:puzzle_value()

			Managers.state.debug_text:output_world_text(value, 0.6, Unit.local_position(unit, 0), nil, DEBUG_CATEGORY, Vector3(0, 255, 0), nil, Unit.local_rotation(unit, 0))
		end

		drawn_extensions[ext] = true
	end

	local active_groups = FrameTable.alloc_table()
	local inactive_groups = FrameTable.alloc_table()
	local puzzle_groups = self._puzzle_groups

	for group_name, group in pairs(puzzle_groups) do
		for puzzle_name, puzzle in pairs(group.puzzles) do
			if not puzzle.completed then
				active_groups[group_name] = true
			else
				inactive_groups[group_name] = true
			end
		end
	end

	Debug.text("Puzzle Debug")

	if not table.is_empty(active_groups) then
		Debug.text("    Active groups:")

		for group_name in pairs(active_groups) do
			Debug.text("        %s:", group_name)

			local group = self:_get_or_add_group(group_name)

			for puzzle_name, puzzle in pairs(group.puzzles) do
				if not puzzle.completed then
					local combination_string = table.concat(puzzle.combination, ", ")
					local values = {}
					local extensions = group.extensions
					local fallback_i = 1

					for ext in pairs(extensions) do
						values[ext:order_id() or fallback_i] = ext:puzzle_value()
						fallback_i = fallback_i + 1
					end

					local values_string = table.concat(values, ", ")

					Debug.text("            %s: Combination: %s, Values: %s, (Ordered=%s)", puzzle_name == "" and "<no_name>" or puzzle_name, combination_string, values_string, puzzle.ordered)
				end
			end
		end
	end

	if not table.is_empty(inactive_groups) then
		Debug.text("    Inactive groups:")

		for group_name in pairs(inactive_groups) do
			local group = self:_get_or_add_group(group_name)

			Debug.text("        %s:", group_name)

			for puzzle_name, puzzle in pairs(group.puzzles) do
				if puzzle.completed then
					Debug.text("            %s", puzzle_name)
				end
			end
		end
	end
end
