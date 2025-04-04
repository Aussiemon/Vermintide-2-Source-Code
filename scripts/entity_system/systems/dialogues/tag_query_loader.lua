﻿-- chunkname: @scripts/entity_system/systems/dialogues/tag_query_loader.lua

local OP, CombiningOP

if rawget(_G, "RuleDatabase") then
	RuleDatabase.initialize_static_values()

	local operator_string_lookup = {
		EQ = "EQ",
		GT = "GT",
		GTEQ = "GTEQ",
		LT = "LT",
		LTEQ = "LTEQ",
		NEQ = "NEQ",
		NOT = "NOT",
		TIMEDIFF = "TIMEDIFF",
		TIMESET = TagQuery.OP.TIMESET,
		ADD = TagQuery.OP.ADD,
		SUB = TagQuery.OP.SUB,
		NUMSET = TagQuery.OP.NUMSET,
	}

	OP = operator_string_lookup
	CombiningOP = {
		AND_NEXT = "AND_NEXT",
		OR_NEXT = "OR_NEXT",
	}
else
	OP = TagQuery.OP
	CombiningOP = TagQuery.CombiningOP
end

local function tprint(format, ...)
	if script_data.dialogue_debug_queries then
		print(string.format("[TagQueryLoader] " .. format, ...))
	end
end

TagQueryLoader = class(TagQueryLoader)

TagQueryLoader.init = function (self, tagquery_database, dialogues_destination_table)
	self.loaded_files = {}
	self.file_environment = {
		OP = OP,
		CombiningOP = CombiningOP,
		math = math,
		define_rule = function (rule_definition)
			tagquery_database:define_rule(rule_definition)
		end,
		add_dialogues = function (dialogues)
			for name, dialogue in pairs(dialogues) do
				dialogue.category = dialogue.category or "default"
				dialogues_destination_table[name] = dialogue
			end
		end,
	}
	self.tagquery_database = tagquery_database
end

function tag_query_errorfunc(arg)
	return arg .. "\n" .. debug.traceback()
end

TagQueryLoader.load_file = function (self, filename)
	local file_function = require(filename)

	self:_trigger_file_function(filename, file_function)
end

TagQueryLoader._trigger_file_function = function (self, filename, file_function)
	setfenv(file_function, self.file_environment)

	local num_rules_before = self.tagquery_database.rules_n

	file_function()

	local rules_read = self.tagquery_database.rules_n - num_rules_before

	tprint("Loaded file %s. Read %d rules.", filename, rules_read)
end

TagQueryLoader.unload_files = function (self)
	for _, filename in ipairs(self.loaded_files) do
		if package.loaded[filename] then
			local load_order = package.load_order
			local n_load_order = #load_order
			local found_file

			for i = n_load_order, 1, -1 do
				if load_order[i] == filename then
					found_file = true
					package.loaded[filename] = nil

					table.remove(load_order, i)

					break
				end
			end

			fassert(found_file)
			tprint("TagQueryLoader: Unloaded file: " .. tostring(filename))
		else
			tprint("TagQueryLoader: Could not unload file: " .. tostring(filename))
		end
	end

	self.file_environment = nil
	self.loaded_files = nil
	self.tagquery_database = nil
end

TagQueryLoader.load_auto_load_files = function (self, out_markers)
	local auto_load_files = DialogueSettings.auto_load_files

	for _, filename in ipairs(auto_load_files) do
		local file_function = DialogueSettings.cached_auto_load_files[filename]

		if file_function then
			self:_trigger_file_function(filename, file_function)
		end

		local markers = DialogueSettings.cached_auto_load_files[filename .. "_markers"]

		if markers then
			for name, marker in pairs(markers) do
				fassert(not out_markers[name], "[DialogueSystem] There is already a marker called %s registered", name)

				out_markers[name] = marker
			end
		end
	end
end
