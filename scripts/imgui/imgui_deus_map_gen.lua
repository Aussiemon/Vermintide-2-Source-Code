ImguiDeusMapGen = class(ImguiDeusMapGen)
local journey_names = AvailableJourneyOrder
local gods = DEUS_GOD_INDEX
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
local populate_editable_keys = {
	{
		type = "INT",
		key = "CURSES_HOT_SPOTS_MIN_COUNT"
	},
	{
		type = "INT",
		key = "CURSES_HOT_SPOTS_MAX_COUNT"
	},
	{
		type = "FLOAT",
		key = "CURSES_HOT_SPOT_MIN_RANGE"
	},
	{
		type = "FLOAT",
		key = "CURSES_HOT_SPOT_MAX_RANGE"
	},
	{
		type = "FLOAT",
		key = "CURSES_MIN_PROGRESS"
	},
	{
		type = "FLOAT",
		key = "MINOR_MODIFIABLE_NODE_CHANCE"
	}
}

local function are_very_different(val1, val2)
	return math.round(val1 * 10000) ~= math.round(val2 * 10000)
end

local function render_key_editor(editable_keys, base_config, original_config)
	for _, key_config in ipairs(editable_keys) do
		if key_config.type == "FLOAT" then
			base_config[key_config.key] = Imgui.InputFloat(key_config.key, base_config[key_config.key])
		elseif key_config.type == "INT" then
			base_config[key_config.key] = Imgui.InputInt(key_config.key, base_config[key_config.key])
		end

		if are_very_different(base_config[key_config.key], original_config[key_config.key]) then
			Imgui.SameLine()
			Imgui.Text("<changed>")
		end
	end
end

ImguiDeusMapGen.init = function (self)
	self._seed = tonumber(script_data.debug_draw_base_map_seed) or 0
	self._journey_index = 1
	self._dominant_god_index = 1
	self._draw_realtime = false
	self._draw_only_base_graph = false
	self._use_seed_whitelist = true

	self:_init_configs()
end

local RELOAD = true

ImguiDeusMapGen.update = function (self)
	if RELOAD then
		self:_init_configs()

		RELOAD = false
	end
end

ImguiDeusMapGen.is_persistent = function (self)
	return false
end

ImguiDeusMapGen._init_configs = function (self)
	self._original_layout_configs = DEUS_MAP_LAYOUT_SETTINGS
	self._layout_configs = table.clone(DEUS_MAP_LAYOUT_SETTINGS)
	self._original_base_configs = DEUS_BASE_MAP_GEN_SETTINGS
	self._base_configs = table.clone(DEUS_BASE_MAP_GEN_SETTINGS)
	self._original_populate_configs = DEUS_MAP_POPULATE_SETTINGS
	self._populate_configs = table.clone(DEUS_MAP_POPULATE_SETTINGS)

	self:_reset_configs_for_journey()
end

ImguiDeusMapGen._reset_configs_for_journey = function (self)
	local journey_name = journey_names[self._journey_index]
	self._original_layout_config = DEUS_MAP_LAYOUT_SETTINGS[journey_name] or DEUS_MAP_LAYOUT_SETTINGS.default
	self._layout_config = self._layout_configs[journey_name] or self._layout_configs.default
	self._original_base_config = DEUS_BASE_MAP_GEN_SETTINGS[journey_name] or DEUS_BASE_MAP_GEN_SETTINGS.default
	self._base_config = self._base_configs[journey_name] or self._base_configs.default
	self._original_populate_config = DEUS_MAP_POPULATE_SETTINGS[journey_name] or DEUS_MAP_POPULATE_SETTINGS.default
	self._populate_config = self._populate_configs[journey_name] or self._populate_configs.default
end

ImguiDeusMapGen.draw = function (self, is_open)
	Imgui.Begin("DeusMapGen", "always_auto_resize")

	local prev_journey_index = self._journey_index
	self._journey_index = Imgui.Combo("Journey to change", self._journey_index - 1, journey_names)

	if prev_journey_index ~= self._journey_index then
		self:_reset_configs_for_journey()
	end

	self._dominant_god_index = Imgui.Combo("Dominant God", self._dominant_god_index - 1, gods)

	if Imgui.TreeNode("BaseGenSettings") then
		render_key_editor(base_gen_editable_keys, self._base_config, self._original_base_config)
		Imgui.TreePop()
	end

	if Imgui.TreeNode("LayoutSettings") then
		render_key_editor(layout_editable_keys, self._layout_config, self._original_layout_config)
		Imgui.TreePop()
	end

	if Imgui.TreeNode("PopulateSettings") then
		render_key_editor(populate_editable_keys, self._populate_config, self._original_populate_config)
		Imgui.TreePop()
	end

	Imgui.Spacing()

	self._draw_realtime = Imgui.Checkbox("see realtime layouting", self._draw_realtime)
	self._draw_only_base_graph = Imgui.Checkbox("see only layed out base graph", self._draw_only_base_graph)
	self._use_seed_whitelist = Imgui.Checkbox("use seed whitelist", self._use_seed_whitelist)
	script_data.deus_generate_base_graph_debug = Imgui.Checkbox("print gen debug info", script_data.deus_generate_base_graph_debug or false)
	script_data.deus_populate_graph_debug = Imgui.Checkbox("print populate debug info", script_data.deus_populate_graph_debug or false)

	Imgui.Spacing()

	self._seed = Imgui.InputInt("seed", self._seed)

	Imgui.Spacing()

	if Imgui.Button("Generate and show") then
		self:_trigger_graph_render()
	end

	if Imgui.Button("Set new seed, Generate and show") then
		self._seed = self._seed + 1

		self:_trigger_graph_render()
	end

	if Imgui.Button("Save seed") then
		if not self._saved_seeds then
			self._saved_seeds = tostring(self._seed)
		else
			self._saved_seeds = self._saved_seeds .. ",\n" .. self._seed
		end
	end

	if Imgui.Button("Hide") then
		script_data.deus_debug_draw_map = false
		DeusDebugDrawMapSettings.layout_config = nil
		DeusDebugDrawMapSettings.base_config = nil
		DeusDebugDrawMapSettings.populate_config = nil
		DeusDebugDrawMapSettings.draw_realtime = false
	end

	if Imgui.Button("Force this seed and journey on the next game (can't have changes)") then
		script_data.deus_seed = self._seed
		script_data.deus_journey = journey_names[self._journey_index]
		script_data.deus_dominant_god = gods[self._dominant_god_index]
	end

	Imgui.Spacing()
	Imgui.Spacing()

	if self._saved_seeds then
		Imgui.Text("Saved seed: ")
		Imgui.Text(self._saved_seeds)

		if Imgui.Button("Copy Saved Seeds to Clipboard") then
			Clipboard.put(self._saved_seeds)
		end

		if Imgui.Button("Clear Saved Seeds") then
			self._saved_seeds = nil
		end
	end

	Imgui.End()
end

ImguiDeusMapGen._trigger_graph_render = function (self)
	script_data.deus_debug_draw_map = true
	DeusDebugDrawMapSettings.seed = self._seed
	DeusDebugDrawMapSettings.base_config = self._base_config
	DeusDebugDrawMapSettings.layout_config = self._layout_config
	DeusDebugDrawMapSettings.populate_config = self._populate_config
	DeusDebugDrawMapSettings.draw_realtime = self._draw_realtime
	DeusDebugDrawMapSettings.draw_only_base_graph = self._draw_only_base_graph
	DeusDebugDrawMapSettings.dominant_god = gods[self._dominant_god_index]
	DeusDebugDrawMapSettings.seed = self._seed
	DeusDebugDrawMapSettings.use_seed_whitelist = self._use_seed_whitelist
	DeusDebugDrawMapSettings.regenerate = true
end

return
