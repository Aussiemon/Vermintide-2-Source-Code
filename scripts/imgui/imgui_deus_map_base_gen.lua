ImguiDeusMapBaseGen = class(ImguiDeusMapBaseGen)
local journey_names = AvailableJourneyOrder
local layout_editable_keys = {
	{
		type = "FLOAT",
		key = "SPRING_CONSTANT"
	},
	{
		type = "FLOAT",
		key = "FORCE_MAX"
	},
	{
		type = "FLOAT",
		key = "REPEL_CONSTANT"
	},
	{
		type = "FLOAT",
		key = "DEFAULT_MASS"
	},
	{
		type = "FLOAT",
		key = "START_MASS"
	},
	{
		type = "FLOAT",
		key = "END_MASS"
	},
	{
		type = "FLOAT",
		key = "NODE_SPEED"
	},
	{
		type = "FLOAT",
		key = "DAMPING_FACTOR"
	},
	{
		type = "INT",
		key = "WIDTH"
	},
	{
		type = "INT",
		key = "HEIGHT"
	},
	{
		type = "INT",
		key = "LAYOUT_TICKS"
	}
}
local base_gen_editable_keys = {
	{
		type = "INT",
		key = "MAX_STRAIGHT_LINE"
	},
	{
		type = "INT",
		key = "MAX_IDEAL_NODES"
	},
	{
		type = "INT",
		key = "MIN_NODES"
	},
	{
		type = "INT",
		key = "MAX_CONNECTIONS_PER_NODE"
	},
	{
		type = "INT",
		key = "MAX_INCOMING_CONNECTIONS_PER_NODE"
	},
	{
		type = "INT",
		key = "MAX_PATHS"
	}
}

local function are_very_different(val1, val2)
	return math.round(val1 * 10000) ~= math.round(val2 * 10000)
end

local function render_key_editor(editable_keys, base_config, original_config)
	for _, key_config in ipairs(editable_keys) do
		if key_config.type == "FLOAT" then
			base_config[key_config.key] = Imgui.input_float(key_config.key, base_config[key_config.key])
		elseif key_config.type == "INT" then
			base_config[key_config.key] = Imgui.input_int(key_config.key, base_config[key_config.key])
		end

		if are_very_different(base_config[key_config.key], original_config[key_config.key]) then
			Imgui.same_line()
			Imgui.text("<changed>")
		end
	end
end

local function have_configs_changed(editable_keys, base_config, original_config)
	for _, key_config in ipairs(editable_keys) do
		if are_very_different(base_config[key_config.key], original_config[key_config.key]) then
			return true
		end
	end
end

local function write_indent(string_array, indent)
	for i = 1, indent, 1 do
		string_array[#string_array + 1] = "\t"
	end
end

local function serialize_table(string_array, indent, table)
	for key, value in pairs(table) do
		write_indent(string_array, indent)

		if type(key) == "string" then
			string_array[#string_array + 1] = key
		else
			string_array[#string_array + 1] = "["
			string_array[#string_array + 1] = tostring(key)
			string_array[#string_array + 1] = "]"
		end

		string_array[#string_array + 1] = " = "
		local value_type = type(value)

		if value_type == "string" then
			string_array[#string_array + 1] = "\""
			string_array[#string_array + 1] = value
			string_array[#string_array + 1] = "\""
		elseif value_type == "table" then
			string_array[#string_array + 1] = "{\n"
			indent = indent + 1

			serialize_table(string_array, indent, value)

			indent = indent - 1

			write_indent(string_array, indent)

			string_array[#string_array + 1] = "}"
		else
			string_array[#string_array + 1] = tostring(value)
		end

		string_array[#string_array + 1] = ",\n"
	end
end

local function serialize_graphs(graphs)
	local string_array = {
		[#string_array + 1] = "return {\n"
	}

	serialize_table(string_array, 1, graphs)

	string_array[#string_array + 1] = "}\n"

	return table.concat(string_array)
end

local RELOAD = true

ImguiDeusMapBaseGen.init = function (self)
	self._seed = tonumber(script_data.debug_draw_base_map_seed) or 0
	self._journey_index = 1
	self._draw_realtime = false
	self._start_paused = false

	self:_init_configs()

	RELOAD = false
end

local GEN_STATE = {
	LAYOUT = 2,
	BASE_GEN = 1
}

ImguiDeusMapBaseGen.update = function (self, t, dt)
	if RELOAD then
		self:_init_configs()

		RELOAD = false
	end

	if self._seed_to_render then
		self._generator_seed = self._seed_to_render
		self._seed_to_render = nil
		self._generation_state = GEN_STATE.BASE_GEN
		self._base_graph_generator = nil
		self._layout_updater = nil
		self._nodes_being_generated = nil
		self._paused = false
		self._next_step = false
		DeusDebugDrawMapSettings.error_message = nil
		DeusDebugDrawMapSettings.base_graph = nil
		DeusDebugDrawMapSettings.final_graph = nil
	end

	if self._generation_state == GEN_STATE.BASE_GEN then
		if not self._base_graph_generator then
			self._base_graph_generator = deus_base_graph_generator(self._generator_seed, self._base_config)

			if self._draw_realtime and self._start_paused then
				self._paused = true
			end
		end

		local generator_done, error_message, nodes = nil

		if not self._paused or self._next_step then
			if self._draw_realtime then
				generator_done, error_message, nodes = self._base_graph_generator()
				DeusDebugDrawMapSettings.base_graph = deus_layout_normalize(nodes)
				DeusDebugDrawMapSettings.final_graph = nil
			else
				local time_start = os.clock()

				while not generator_done and os.clock() - time_start <= 0.01 do
					generator_done, error_message, nodes = self._base_graph_generator()
				end

				DeusDebugDrawMapSettings.base_graph = deus_layout_normalize(nodes)
				DeusDebugDrawMapSettings.final_graph = nil
			end
		end

		self._nodes_being_generated = nodes

		if generator_done then
			if error_message then
				self._generation_state = nil
				DeusDebugDrawMapSettings.error_message = error_message
			else
				self._generation_state = GEN_STATE.LAYOUT
			end
		end
	elseif self._generation_state == GEN_STATE.LAYOUT then
		local layed_out_graph = nil

		if not self._paused or self._next_step then
			if self._draw_realtime then
				if not self._layout_updater then
					self._layout_updater = debug_deus_create_realtime_layout_updater(self._nodes_being_generated, self._layout_config)

					if self._draw_realtime and self._start_paused then
						self._paused = true
					end
				end

				local done = nil
				done, layed_out_graph = self._layout_updater()
				self._nodes_being_generated = layed_out_graph

				if done then
					self._generation_state = nil
					self._graph_to_save = self._nodes_being_generated
					self._nodes_being_generated = nil
				end
			else
				layed_out_graph = deus_layout_base_graph(self._nodes_being_generated, self._layout_config)
				self._generation_state = nil
				self._graph_to_save = layed_out_graph
				self._nodes_being_generated = nil
			end

			DeusDebugDrawMapSettings.base_graph = layed_out_graph
			DeusDebugDrawMapSettings.final_graph = nil
		end
	end

	self._next_step = false
end

ImguiDeusMapBaseGen.is_persistent = function (self)
	return false
end

ImguiDeusMapBaseGen._init_configs = function (self)
	self._original_layout_configs = DEUS_MAP_LAYOUT_SETTINGS
	self._layout_configs = table.clone(DEUS_MAP_LAYOUT_SETTINGS)
	self._original_base_configs = DEUS_BASE_MAP_GEN_SETTINGS
	self._base_configs = table.clone(DEUS_BASE_MAP_GEN_SETTINGS)

	self:_reset_configs_for_journey()

	self._configs_changed = false
end

ImguiDeusMapBaseGen._reset_configs_for_journey = function (self)
	local journey_name = journey_names[self._journey_index]
	self._original_layout_config = DEUS_MAP_LAYOUT_SETTINGS[journey_name] or DEUS_MAP_LAYOUT_SETTINGS.default
	self._layout_config = self._layout_configs[journey_name] or self._layout_configs.default
	self._original_base_config = DEUS_BASE_MAP_GEN_SETTINGS[journey_name] or DEUS_BASE_MAP_GEN_SETTINGS.default
	self._base_config = self._base_configs[journey_name] or self._base_configs.default
end

ImguiDeusMapBaseGen.draw = function (self, is_open)
	Imgui.begin_window("DeusMapBaseGen", "always_auto_resize")

	if self._saved_graphs then
		Imgui.text("Saving for " .. journey_names[self._journey_index])
	else
		local prev_journey_index = self._journey_index
		self._journey_index = Imgui.combo("Journey to change", self._journey_index, journey_names)

		if prev_journey_index ~= self._journey_index then
			self:_reset_configs_for_journey()

			self._configs_changed = false
		end

		if Imgui.tree_node("BaseGenSettings") then
			render_key_editor(base_gen_editable_keys, self._base_config, self._original_base_config)
			Imgui.tree_pop()
		end

		if Imgui.tree_node("LayoutSettings") then
			render_key_editor(layout_editable_keys, self._layout_config, self._original_layout_config)
			Imgui.tree_pop()
		end

		self._configs_changed = have_configs_changed(base_gen_editable_keys, self._base_config, self._original_base_config) or have_configs_changed(layout_editable_keys, self._layout_config, self._original_layout_config)

		Imgui.spacing()
	end

	self._draw_realtime = Imgui.checkbox("see realtime layouting", self._draw_realtime)

	if self._draw_realtime then
		script_data.deus_base_graph_generator_debug = Imgui.checkbox("print gen debug info", script_data.deus_base_graph_generator_debug or false)
	else
		script_data.deus_base_graph_generator_debug = false
	end

	if not self._generation_state then
		if self._draw_realtime then
			self._start_paused = Imgui.checkbox("start paused", self._start_paused)
		end

		Imgui.spacing()

		self._seed = Imgui.input_int("seed", self._seed)

		Imgui.spacing()

		if Imgui.button("Generate and show") then
			self._seed_to_render = self._seed
			script_data.deus_debug_draw_map = true
		end

		if Imgui.button("Set new seed, Generate and show") then
			self._seed = self._seed + 1
			self._seed_to_render = self._seed
			script_data.deus_debug_draw_map = true
		end

		if self._graph_to_save then
			if not self._configs_changed then
				if Imgui.button("Save seed") then
					if not self._saved_graphs then
						self._saved_graphs = {
							[self._seed] = self._graph_to_save
						}
					else
						self._saved_graphs[self._seed] = self._graph_to_save
					end

					self._graph_to_save = nil
				end
			else
				Imgui.text("You can't save seeds with changed configs.")
				Imgui.text("Save your changes first to the lua config files and then save seeds.")
			end
		end
	else
		if self._paused then
			if Imgui.button("Next Step") then
				self._next_step = true
			end

			if Imgui.button("Continue") then
				self._paused = false
			end
		elseif Imgui.button("Pause") then
			self._paused = true
		end

		if Imgui.button("Stop") then
			self._generation_state = nil
			self._next_step = false
			self._paused = false
		end
	end

	if Imgui.button("Hide") then
		script_data.deus_debug_draw_map = false
	end

	Imgui.spacing()
	Imgui.spacing()

	if self._saved_graphs and not self._configs_changed then
		local graph_count = 0

		for _, _ in pairs(self._saved_graphs) do
			graph_count = graph_count + 1
		end

		Imgui.text("Saved graphs " .. graph_count)

		if Imgui.button("Copy Saved Graphs to Clipboard") then
			Clipboard.put(serialize_graphs(self._saved_graphs))
		end

		if Imgui.button("Clear Saved Graphs") then
			self._saved_graphs = nil
		end
	end

	Imgui.end_window()
end

return
