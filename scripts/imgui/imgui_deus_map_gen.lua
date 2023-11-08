ImguiDeusMapGen = class(ImguiDeusMapGen)
local journey_names = AvailableJourneyOrder
local gods = DEUS_GOD_INDEX
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

local RELOAD = true

ImguiDeusMapGen.init = function (self)
	self._seed = tonumber(script_data.debug_draw_base_map_seed) or 0
	self._journey_index = 1
	self._dominant_god_index = 1

	self:_init_configs()

	RELOAD = false
end

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
	self._original_populate_configs = DEUS_MAP_POPULATE_SETTINGS
	self._populate_configs = table.clone(DEUS_MAP_POPULATE_SETTINGS)

	self:_reset_configs_for_journey()
end

ImguiDeusMapGen._reset_configs_for_journey = function (self)
	local journey_name = journey_names[self._journey_index]
	self._original_populate_config = DEUS_MAP_POPULATE_SETTINGS[journey_name] or DEUS_MAP_POPULATE_SETTINGS.default
	self._populate_config = self._populate_configs[journey_name] or self._populate_configs.default
end

ImguiDeusMapGen.draw = function (self, is_open)
	local do_close = Imgui.begin_window("DeusMapGen", "always_auto_resize")
	local prev_journey_index = self._journey_index
	self._journey_index = Imgui.combo("Journey to change", self._journey_index, journey_names)

	if prev_journey_index ~= self._journey_index then
		self:_reset_configs_for_journey()
	end

	self._dominant_god_index = Imgui.combo("Dominant God", self._dominant_god_index, gods)
	local with_belakor = self._with_belakor or false
	with_belakor = Imgui.checkbox("With Be'lakor", with_belakor)
	self._with_belakor = with_belakor

	if Imgui.tree_node("PopulateSettings") then
		render_key_editor(populate_editable_keys, self._populate_config, self._original_populate_config)
		Imgui.tree_pop()
	end

	Imgui.spacing()

	script_data.deus_populate_graph_debug = Imgui.checkbox("print populate debug info", script_data.deus_populate_graph_debug or false)

	Imgui.spacing()

	self._seed = Imgui.input_int("seed", self._seed)

	Imgui.spacing()

	if Imgui.button("Generate and show") then
		self:_trigger_graph_render()
	end

	if Imgui.button("Set new seed, Generate and show") then
		self._seed = self._seed + 1

		self:_trigger_graph_render()
	end

	if Imgui.button("Hide") then
		script_data.deus_debug_draw_map = false
		DeusDebugDrawMapSettings.base_graph = nil
		DeusDebugDrawMapSettings.final_graph = nil
	end

	if Imgui.button("Force this seed and journey on the next game (can't have changes)") then
		script_data.deus_seed = self._seed
		script_data.deus_journey = journey_names[self._journey_index]
		script_data.deus_dominant_god = gods[self._dominant_god_index]
	end

	Imgui.spacing()
	Imgui.spacing()
	Imgui.end_window()

	return do_close
end

ImguiDeusMapGen._trigger_graph_render = function (self)
	script_data.deus_debug_draw_map = true
	local graph = deus_generate_graph(self._seed, journey_names[self._journey_index], gods[self._dominant_god_index], self._populate_config, self._with_belakor)
	DeusDebugDrawMapSettings.base_graph = nil
	DeusDebugDrawMapSettings.final_graph = graph
end
