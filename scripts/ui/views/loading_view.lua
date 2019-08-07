require("scripts/ui/ui_renderer")
require("scripts/ui/ui_elements")
require("scripts/ui/views/subtitle_timed_gui")

local definitions = local_require("scripts/ui/views/loading_view_definitions")
local survival_tip_list = {
	"dlc1_2_survival_tip_01",
	"dlc1_2_survival_tip_02",
	"dlc1_2_survival_tip_03",
	"dlc1_2_survival_tip_04",
	"dlc1_2_survival_tip_05",
	"dlc1_2_survival_tip_06"
}
local tip_type_prefix_list = {
	npcs = "loading_screen_npcs",
	kerillian = "loading_screen_kerillian",
	lore = "loading_screen_lore",
	khazalid = "loading_screen_khazalid",
	rotbloods = "loading_screen_rotbloods",
	okri = "loading_screen_okri",
	tip = "loading_screen_tip"
}
local tip_type_max_range = {
	npcs = 3,
	kerillian = 10,
	lore = 55,
	khazalid = 47,
	rotbloods = 9,
	okri = 1,
	tip = 89
}
local tip_type_list = {
	"tip",
	"lore",
	"rotbloods",
	"khazalid",
	"npcs",
	"kerillian",
	"okri"
}
local objective_texts = {
	objective_sockets_name = "nfl_olesya_all_weave_objective_essence_refine_01",
	objective_kill_enemies_name = "nfl_olesya_all_weave_objective_kill_02",
	objective_capture_points_name = "nfl_olesya_all_weave_objective_essence_capture_02",
	objective_destroy_doom_wheels_name = "nfl_olesya_all_weave_objective_essence_nodes_02",
	objective_targets_name = "nfl_olesya_all_weave_objective_essence_shards_04"
}
LoadingView = class(LoadingView)
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}

LoadingView.init = function (self, ui_context)
	local world = ui_context.world
	self.input_manager = ui_context.input_manager
	self.return_to_pc_menu = ui_context.return_to_pc_menu
	self.render_settings = {
		snap_pixel_positions = true
	}

	if not script_data.disable_news_ticker then
		self.news_ticker_speed = 100
		self.news_ticker_manager = Managers.news_ticker

		self.news_ticker_manager:refresh_loading_screen_message()
	end

	self.world = world
	self.default_loading_screen = "loading_screen_default"

	VisualAssertLog.setup(world)

	self.ui_renderer = UIRenderer.create(self.world, "material", "materials/ui/loading_screens/" .. self.default_loading_screen, "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_chat")

	self:create_ui_elements()
	self:_create_hdr_gui()

	self._gamepad_active = Managers.input:is_device_active("gamepad")
	DO_RELOAD = false
	self.active = true
end

LoadingView._create_hdr_gui = function (self)
	local world_flags = {
		Application.DISABLE_SOUND,
		Application.DISABLE_ESRAM
	}
	local layer = 800
	local world_name = "loading_hdr_world"
	local viewport_name = "loading_hdr_viewport"
	local shading_environment = "environment/ui_hdr"
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(world_flags))
	local viewport_type = "overlay"
	local viewport = ScriptWorld.create_viewport(world, viewport_name, viewport_type, layer)
	self._ui_hdr_viewport_name = viewport_name
	self._ui_hdr_world_name = world_name
	self._ui_hdr_world = world
	self._ui_hdr_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_loading", "immediate")
end

LoadingView.texture_resource_loaded = function (self, level_key, act_progression_index, game_difficulty, optional_loading_ui_package_name, optional_loading_screen_material_name, weave_data)
	if self.return_to_pc_menu then
		return
	end

	UIRenderer.destroy(self.ui_renderer, self.world)

	self.level_key = level_key
	self.act_progression_index = act_progression_index
	local level_settings = LevelSettings[level_key]
	local has_multiple_loading_images = level_settings.has_multiple_loading_images
	local loading_ui_package_name = optional_loading_ui_package_name or level_settings.loading_ui_package_name
	local game_mode = level_settings.game_mode or "adventure"
	local bg_material = "materials/ui/loading_screens/" .. (loading_ui_package_name or self.default_loading_screen)

	if PLATFORM == "xb1" then
		local gui = World.create_screen_gui(self.world, "immediate", "material", "materials/ui/loading_screens/" .. self.default_loading_screen, "material", bg_material, "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_chat")
		local gui_retained = World.create_screen_gui(self.world, "material", "materials/ui/loading_screens/" .. self.default_loading_screen, "material", bg_material, "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_chat")
		self.ui_renderer = UIRenderer.create_ui_renderer(self.world, gui, gui_retained)
	else
		self.ui_renderer = UIRenderer.create(self.world, "material", "materials/ui/loading_screens/" .. self.default_loading_screen, "material", bg_material, "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_chat")
	end

	self.bg_widget.content.bg_texture = optional_loading_screen_material_name or "loading_screen"

	if weave_data then
		local wind_name = weave_data.wind_name
		local weave_display_name = weave_data.weave_display_name
		local location_display_name = weave_data.location_display_name
		local objective_name = weave_data.objective_name
		local objective_text = objective_texts[objective_name]
		self.bg_widget.content.weave_name = weave_display_name
		self.bg_widget.content.location_name = location_display_name
		self.bg_widget.content.wind_name = wind_name
		self.bg_widget.content.mutator_name = MutatorTemplates[wind_name].display_name
		self.bg_widget.content.mutator_description = MutatorTemplates[wind_name].description
		self.bg_widget.content.objective_text = objective_text or self.bg_widget.content.objective_text
		self.bg_widget.content.is_weave = true
		self.bg_widget.content.is_arena = weave_data.is_arena
		local text = self.bg_widget.content.mutator_description
		local mutator_desc_style = self.bg_widget.style.mutator_description
		local font, size_of_font = UIFontByResolution(mutator_desc_style)
		local font_material = font[1]
		local font_size = font[2]
		local font_name = font[3]
		local font_height, font_min, font_max = UIGetFontHeight(self.ui_renderer.gui, font_name, font_size)
		font_size = size_of_font
		local texts = UIRenderer.word_wrap(self.ui_renderer, Localize(text), font_material, font_size, mutator_desc_style.size[1])
		local offset = #texts * 30 + 30
		self.bg_widget.style.objective_icon.offset[2] = self.bg_widget.style.objective_icon.offset[2] - offset
		self.bg_widget.style.objective_text.offset[2] = self.bg_widget.style.objective_text.offset[2] - offset
		self.weave_loading_icon = UIWidget.init(definitions.weave_loading_icon)

		Managers.transition:hide_loading_icon()

		self._weave_data = weave_data
		self._optional_loading_screen_material_name = optional_loading_screen_material_name
	else
		self.bg_widget.content.is_weave = false

		if level_key ~= "inn_level" and level_settings.level_type ~= "survival" then
			self:setup_act_text(level_key)
			self:setup_difficulty_text(game_difficulty)
		end

		self:setup_level_text(level_key)
		self:setup_tip_text(act_progression_index, game_mode)

		self.weave_loading_icon = nil
	end
end

LoadingView.deactivate = function (self)
	self.active = false
end

LoadingView.activate = function (self)
	self.active = true
end

LoadingView.showing_press_to_continue = function (self)
	return self._show_press_to_continue
end

LoadingView.show_press_to_continue = function (self, show)
	self._show_press_to_continue = show
end

LoadingView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.bg_widget = UIWidget.init(definitions.background_image)
	self.subtitle_widget = UIWidget.init(definitions.subtitle)
	self.tip_title_widget = UIWidget.init(definitions.tip_title_widget)
	self.tip_text_prefix_widget = UIWidget.init(definitions.tip_text_prefix_widget)
	self.tip_text_suffix_widget = UIWidget.init(definitions.tip_text_suffix_widget)
	self.gamepad_input_icon = UIWidget.init(definitions.gamepad_input_icon)
	self.second_gamepad_input_icon = UIWidget.init(definitions.second_gamepad_input_icon)
	self.second_row_tip_text_prefix_widget = UIWidget.init(definitions.second_row_tip_text_prefix_widget)
	self.second_row_tip_text_suffix_widget = UIWidget.init(definitions.second_row_tip_text_suffix_widget)
	self.second_row_gamepad_input_icon = UIWidget.init(definitions.second_row_gamepad_input_icon)
	self.second_row_second_gamepad_input_icon = UIWidget.init(definitions.second_row_second_gamepad_input_icon)
	self.act_name_widget = UIWidget.init(definitions.act_name_widget)
	self.act_name_bg_widget = UIWidget.init(definitions.act_name_bg_widget)
	self.level_name_widget = UIWidget.init(definitions.level_name_widget)
	self.level_name_bg_widget = UIWidget.init(definitions.level_name_bg_widget)
	self.game_difficulty_widget = UIWidget.init(definitions.game_difficulty_widget)
	self.game_difficulty_bg_widget = UIWidget.init(definitions.game_difficulty_bg_widget)

	if script_data.honduras_demo then
		self._press_to_continue_widget = UIWidget.init(definitions.press_to_continue_widget)
	end

	self.widgets = {
		self.bg_widget,
		self.level_name_widget,
		UIWidget.init(definitions.dead_space_filler)
	}

	if not script_data.honduras_demo then
		self.widgets[#self.widgets + 1] = self.gamepad_input_icon
		self.widgets[#self.widgets + 1] = self.second_gamepad_input_icon
		self.widgets[#self.widgets + 1] = self.second_row_gamepad_input_icon
		self.widgets[#self.widgets + 1] = self.second_row_second_gamepad_input_icon
		self.widgets[#self.widgets + 1] = self.tip_text_prefix_widget
		self.widgets[#self.widgets + 1] = self.tip_text_suffix_widget
		self.widgets[#self.widgets + 1] = self.second_row_tip_text_prefix_widget
		self.widgets[#self.widgets + 1] = self.second_row_tip_text_suffix_widget
	end

	if not script_data.disable_news_ticker then
		self.news_ticker_text_widget = UIWidget.init(definitions.news_ticker_text_widget)
		self.widgets[#self.widgets + 1] = self.news_ticker_text_widget
		self.widgets[#self.widgets + 1] = UIWidget.init(definitions.news_ticker_mask_widget)
	end

	local subtitle_row_widgets = {}
	local NUM_SUBTITLE_ROWS = definitions.NUM_SUBTITLE_ROWS

	for i = 1, NUM_SUBTITLE_ROWS, 1 do
		local subtitle_row_widget = UIWidget.init(definitions.subtitle_row_widgets[i])
		subtitle_row_widgets[i] = subtitle_row_widget
		self.widgets[#self.widgets + 1] = subtitle_row_widget
	end

	self._subtitle_row_widgets = subtitle_row_widgets
	self.bg_widget.content.bg_texture = self.default_loading_screen
	local level_settings = self.level_key and LevelSettings[self.level_key]
	local game_mode = (level_settings and level_settings.game_mode) or "adventure"

	self:setup_tip_text(self.act_progression_index, game_mode, self._tip_localization_key)

	if self._weave_data then
		local weave_data = self._weave_data
		local wind_name = weave_data.wind_name
		local weave_display_name = weave_data.weave_display_name
		local location_display_name = weave_data.location_display_name
		local objective_name = weave_data.objective_name
		local objective_text = objective_texts[objective_name]
		self.bg_widget.content.weave_name = weave_display_name
		self.bg_widget.content.location_name = location_display_name
		self.bg_widget.content.wind_name = wind_name
		self.bg_widget.content.mutator_name = MutatorTemplates[wind_name].display_name
		self.bg_widget.content.mutator_description = MutatorTemplates[wind_name].description
		self.bg_widget.content.objective_text = objective_text or self.bg_widget.content.objective_text
		self.bg_widget.content.is_weave = true
		self.bg_widget.content.is_arena = weave_data.is_arena
		local text = self.bg_widget.content.mutator_description
		local mutator_desc_style = self.bg_widget.style.mutator_description
		local font, size_of_font = UIFontByResolution(mutator_desc_style)
		local font_material = font[1]
		local font_size = font[2]
		local font_name = font[3]
		local font_height, font_min, font_max = UIGetFontHeight(self.ui_renderer.gui, font_name, font_size)
		font_size = size_of_font
		local texts = UIRenderer.word_wrap(self.ui_renderer, Localize(text), font_material, font_size, mutator_desc_style.size[1])
		local offset = #texts * 30 + 30
		self.bg_widget.style.objective_icon.offset[2] = self.bg_widget.style.objective_icon.offset[2] - offset
		self.bg_widget.style.objective_text.offset[2] = self.bg_widget.style.objective_text.offset[2] - offset
		self.bg_widget.content.bg_texture = self._optional_loading_screen_material_name
		self.weave_loading_icon = UIWidget.init(definitions.weave_loading_icon)

		Managers.transition:hide_loading_icon()
	end

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

LoadingView.trigger_subtitles = function (self, wwise_event, t)
	if wwise_event and not self.subtitle_timed_gui and Application.user_setting("use_subtitles") then
		self.subtitle_timed_gui = SubtitleTimedGui:new(wwise_event, self._subtitle_row_widgets)
	end
end

LoadingView.trigger_weave_subtitles = function (self, wwise_events, t)
	if wwise_events and not self.subtitle_timed_gui and Application.user_setting("use_subtitles") then
		self.subtitle_timed_gui = SubtitleTimedGui:new(wwise_events, self._subtitle_row_widgets)
	end
end

LoadingView.reset_tip_text = function (self)
	self.tip_text_prefix_widget.content.text = ""
	self.tip_text_suffix_widget.content.text = ""
	self.gamepad_input_icon.content.texture_id = nil
	self.second_gamepad_input_icon.content.texture_id = nil
	self.second_row_tip_text_prefix_widget.content.text = ""
	self.second_row_tip_text_suffix_widget.content.text = ""
	self.second_row_gamepad_input_icon.content.texture_id = nil
	self.second_row_second_gamepad_input_icon.content.texture_id = nil
	self.tip_text_prefix_widget.style.text.word_wrap = false
	self.tip_text_suffix_widget.style.text.word_wrap = false
	self.second_row_tip_text_prefix_widget.style.text.word_wrap = false
	self.second_row_tip_text_suffix_widget.style.text.word_wrap = false
	self.tip_text_prefix_widget.style.text.horizontal_alignment = "right"
	self.tip_text_suffix_widget.style.text.horizontal_alignment = "left"
	self.second_row_tip_text_prefix_widget.style.text.horizontal_alignment = "right"
	self.second_row_tip_text_suffix_widget.style.text.horizontal_alignment = "left"
	self.tip_text_prefix_widget.style.text.offset[1] = 0
	self.tip_text_suffix_widget.style.text.offset[1] = 0
	self.second_row_tip_text_prefix_widget.style.text.offset[1] = 0
	self.second_row_tip_text_suffix_widget.style.text.offset[1] = 0
	self.tip_text_prefix_widget.style.text.offset[2] = 0
	self.tip_text_suffix_widget.style.text.offset[2] = 0
	self.second_row_tip_text_prefix_widget.style.text.offset[2] = 0
	self.second_row_tip_text_suffix_widget.style.text.offset[2] = 0
	self.ui_scenegraph.tip_text_prefix.size[1] = definitions.MAXIMUM_TIP_WIDTH
	self.ui_scenegraph.tip_text_suffix.size[1] = definitions.MAXIMUM_TIP_WIDTH
	self.ui_scenegraph.gamepad_input_icon.size = definitions.ICON_SIZE
	self.ui_scenegraph.second_gamepad_input_icon.size = definitions.ICON_SIZE
	self.ui_scenegraph.second_row_tip_text_prefix.size[1] = definitions.MAXIMUM_TIP_WIDTH
	self.ui_scenegraph.second_row_tip_text_suffix.size[1] = definitions.MAXIMUM_TIP_WIDTH
	self.ui_scenegraph.second_row_gamepad_input_icon.size = definitions.ICON_SIZE
	self.ui_scenegraph.second_row_second_gamepad_input_icon.size = definitions.ICON_SIZE
end

LoadingView.fit_title = function (self)
	local style = self.tip_title_widget.style.text
	local text = Localize("loading_screen_tip_title")
	local temp_vectors, temp_quaternions, temp_matrices = Script.temp_count()
	local continue = true

	repeat
		local font, scaled_font_size = UIFontByResolution(style)
		local text_width = UIRenderer.text_size(self.ui_renderer, text, font[1], scaled_font_size)

		Script.set_temp_count(temp_vectors, temp_quaternions, temp_matrices)

		if text_width <= 260 or style.font_size <= 1 then
			continue = false
		else
			style.font_size = style.font_size - 1
		end
	until not continue
end

local DEFAULT_SECOND_ICON_DATA = {}

LoadingView._find_second_input_texture = function (self, suffix_text, macro_replacement, input_action, font, scaled_font_size)
	table.clear(DEFAULT_SECOND_ICON_DATA)

	local second_input_texture_data = DEFAULT_SECOND_ICON_DATA
	local start_index, end_index = string.find(suffix_text, macro_replacement)
	local prefix_text = string.sub(suffix_text, 1, start_index - 1)
	local prefix_text_width = UIRenderer.text_size(self.ui_renderer, prefix_text, font[1], scaled_font_size)
	second_input_texture_data.icon_offset = prefix_text_width
	suffix_text = string.gsub(suffix_text, macro_replacement, "      ")
	second_input_texture_data.button_texture_data = UISettings.get_gamepad_input_texture_data(Managers.input:get_service("Player"), input_action, true)

	return second_input_texture_data, suffix_text
end

local DEFAULT_SECOND_ICON_TABLE = {}
local DEFAULT_ICON_SIZE_TABLE = {
	0,
	0
}

LoadingView.setup_tip_text = function (self, act_progression_index, game_mode, tip_localization_key)
	self:fit_title()
	self:reset_tip_text()

	if script_data.no_loading_screen_tip_texts then
		return
	end

	table.clear(DEFAULT_SECOND_ICON_TABLE)

	if game_mode == "survival" then
		local text = tip_localization_key or survival_tip_list[math.random(1, #survival_tip_list)]
		self.tip_text_prefix_widget.content.text = Localize(text)
		self.tip_text_prefix_widget.style.text.horizontal_alignment = "center"
		self.tip_text_prefix_widget.style.text.word_wrap = true
	else
		local index_table = {}

		if act_progression_index and act_progression_index < 4 then
			local tip_count = 9 - act_progression_index * 2

			for i = 1, tip_count, 1 do
				index_table[i] = 3
			end

			index_table[#index_table + 1] = 1
		else
			index_table[#index_table + 1] = 1
		end

		local tip_localization_key = tip_localization_key or nil

		if not tip_localization_key then
			local read_index = math.random(1, #index_table)
			local tip_type_index = index_table[read_index]
			local tip_type = tip_type_list[tip_type_index]
			local tip_prefix = tip_type_prefix_list[tip_type]
			local typ_max_range = tip_type_max_range[tip_type]
			local tip_random_index = math.random(1, typ_max_range)
			local tip_index = (tip_random_index < 10 and "0" .. tostring(tip_random_index)) or tostring(tip_random_index)
			tip_localization_key = tip_prefix .. "_" .. tip_index
		end

		self._tip_localization_key = tip_localization_key
		local input_manager = self.input_manager
		local gamepad_active = input_manager:is_device_active("gamepad")
		local localized_tip = nil

		if gamepad_active then
			local input_action, input_actions, input_service_name = Managers.localizer:get_input_action(tip_localization_key)

			if input_action then
				local button_texture_data = UISettings.get_gamepad_input_texture_data(input_manager:get_service(input_service_name), input_action, gamepad_active)

				if button_texture_data then
					local button_texture_size = button_texture_data.size
					local button_texture_texture = button_texture_data.texture
					local macro_replacement = "______"
					localized_tip = Managers.localizer:replace_macro_in_string(tip_localization_key, macro_replacement)

					if string.find(localized_tip, "%[") then
						localized_tip = string.gsub(localized_tip, "%[", "")
					end

					if string.find(localized_tip, "%]") then
						localized_tip = string.gsub(localized_tip, "%]", "")
					end

					local start_index, end_index = string.find(localized_tip, macro_replacement)
					local prefix_text = string.sub(localized_tip, 1, start_index - 1)
					local suffix_text = string.sub(localized_tip, end_index + 1)
					local text_tip_widget_style = self.tip_text_prefix_widget.style.text
					local font, scaled_font_size = UIFontByResolution(text_tip_widget_style)
					local prefix_text_width = UIRenderer.text_size(self.ui_renderer, prefix_text, font[1], scaled_font_size)
					local icon_width = button_texture_size[1]
					local second_input_texture_data = DEFAULT_SECOND_ICON_TABLE

					if input_actions and input_actions[2] then
						second_input_texture_data, suffix_text = self:_find_second_input_texture(suffix_text, macro_replacement, input_actions[2], font, scaled_font_size)
					end

					local second_icon_size = (second_input_texture_data.button_texture_data and second_input_texture_data.button_texture_data.size) or DEFAULT_ICON_SIZE_TABLE
					local second_icon_texture = second_input_texture_data.button_texture_data and second_input_texture_data.button_texture_data.texture
					local second_icon_icon_offset = second_input_texture_data.icon_offset or 0
					local suffix_text_width = UIRenderer.text_size(self.ui_renderer, suffix_text, font[1], scaled_font_size)
					local total_width = prefix_text_width + icon_width + suffix_text_width + second_icon_size[1]
					local prefix_text_offset = (-total_width * 0.5 + prefix_text_width * 0.5) - icon_width * 0.05
					local input_icon_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.05 + icon_width * 0.5
					local second_icon_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.05 + icon_width * 0.5 + second_icon_icon_offset + second_icon_size[1] * 0.05 + second_icon_size[1]
					local suffix_text_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.5 + suffix_text_width * 0.5 + icon_width * 0.5

					if definitions.MAXIMUM_TIP_WIDTH < prefix_text_width then
						local text_rows = UIRenderer.word_wrap(self.ui_renderer, prefix_text, font[1], scaled_font_size, definitions.MAXIMUM_TIP_WIDTH - prefix_text_width - icon_width)
						prefix_text = text_rows[2]
						prefix_text_width = UIRenderer.text_size(self.ui_renderer, prefix_text, font[1], scaled_font_size)
						total_width = prefix_text_width + icon_width + suffix_text_width
						prefix_text_offset = (-total_width * 0.5 + prefix_text_width * 0.5) - icon_width * 0.5
						input_icon_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.05
						suffix_text_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.5 + suffix_text_width * 0.5
						self.tip_text_prefix_widget.content.text = text_rows[1]
						self.tip_text_prefix_widget.style.text.horizontal_alignment = "center"
						self.tip_text_prefix_widget.style.text.word_wrap = true
						self.second_row_tip_text_prefix_widget.style.text.offset[1] = prefix_text_offset
						self.second_row_gamepad_input_icon.style.texture_id.offset[1] = input_icon_offset
						self.second_row_second_gamepad_input_icon.style.texture_id.offset[1] = second_icon_offset
						self.second_row_tip_text_suffix_widget.style.text.offset[1] = suffix_text_offset
						self.tip_text_prefix_widget.style.text.offset[2] = 0
						self.second_row_tip_text_prefix_widget.style.text.offset[2] = 0
						self.second_row_gamepad_input_icon.style.texture_id.offset[2] = 0
						self.second_row_second_gamepad_input_icon.style.texture_id.offset[2] = 0
						self.second_row_tip_text_suffix_widget.style.text.offset[2] = 0
						self.second_row_tip_text_prefix_widget.content.text = prefix_text
						self.second_row_gamepad_input_icon.content.texture_id = button_texture_texture
						self.second_row_second_gamepad_input_icon.content.texture_id = second_icon_texture
						self.second_row_tip_text_suffix_widget.content.text = suffix_text
						self.ui_scenegraph.second_row_tip_text_prefix.size[1] = prefix_text_width
						self.ui_scenegraph.second_row_gamepad_input_icon.size = button_texture_size
						self.ui_scenegraph.second_row_second_gamepad_input_icon.size = second_icon_size
						self.ui_scenegraph.second_row_tip_text_suffix.size[1] = suffix_text_width
					elseif definitions.MAXIMUM_TIP_WIDTH < suffix_text_width then
						local text_rows = UIRenderer.word_wrap(self.ui_renderer, suffix_text, font[1], scaled_font_size, definitions.MAXIMUM_TIP_WIDTH - prefix_text_width - icon_width)
						suffix_text = text_rows[1]
						suffix_text_width = UIRenderer.text_size(self.ui_renderer, suffix_text, font[1], scaled_font_size)
						total_width = prefix_text_width + icon_width + suffix_text_width
						prefix_text_offset = (-total_width * 0.5 + prefix_text_width * 0.5) - icon_width * 0.5
						input_icon_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.05
						suffix_text_offset = -total_width * 0.5 + prefix_text_width + icon_width * 0.5 + suffix_text_width * 0.5
						self.second_row_tip_text_prefix_widget.content.text = text_rows[2]
						self.second_row_tip_text_prefix_widget.style.text.horizontal_alignment = "center"
						self.second_row_tip_text_prefix_widget.style.text.word_wrap = true
						self.tip_text_prefix_widget.style.text.offset[1] = prefix_text_offset
						self.gamepad_input_icon.style.texture_id.offset[1] = input_icon_offset
						self.second_gamepad_input_icon.style.texture_id.offset[1] = second_icon_offset
						self.tip_text_suffix_widget.style.text.offset[1] = suffix_text_offset
						self.second_row_tip_text_prefix_widget.style.text.offset[2] = 0
						self.tip_text_prefix_widget.style.text.offset[2] = 0
						self.gamepad_input_icon.style.texture_id.offset[2] = 0
						self.second_gamepad_input_icon.style.texture_id.offset[2] = 0
						self.tip_text_suffix_widget.style.text.offset[2] = 0
						self.tip_text_prefix_widget.content.text = prefix_text
						self.gamepad_input_icon.content.texture_id = button_texture_texture
						self.second_gamepad_input_icon.content.texture_id = second_icon_texture
						self.tip_text_suffix_widget.content.text = suffix_text
						self.ui_scenegraph.tip_text_prefix.size[1] = prefix_text_width
						self.ui_scenegraph.gamepad_input_icon.size = button_texture_size
						self.ui_scenegraph.second_gamepad_input_icon.size = second_icon_size
						self.ui_scenegraph.tip_text_suffix.size[1] = suffix_text_width
					else
						self.ui_scenegraph.tip_text_prefix.size[1] = prefix_text_width
						self.ui_scenegraph.gamepad_input_icon.size = button_texture_size
						self.ui_scenegraph.second_gamepad_input_icon.size = second_icon_size
						self.ui_scenegraph.tip_text_suffix.size[1] = suffix_text_width
						self.tip_text_prefix_widget.style.text.offset[1] = prefix_text_offset
						self.gamepad_input_icon.style.texture_id.offset[1] = input_icon_offset
						self.second_gamepad_input_icon.style.texture_id.offset[1] = second_icon_offset
						self.tip_text_suffix_widget.style.text.offset[1] = suffix_text_offset
						self.tip_text_prefix_widget.style.text.offset[2] = 0
						self.gamepad_input_icon.style.texture_id.offset[2] = 0
						self.second_gamepad_input_icon.style.texture_id.offset[2] = 0
						self.tip_text_suffix_widget.style.text.offset[2] = 0
						self.tip_text_prefix_widget.content.text = prefix_text
						self.gamepad_input_icon.content.texture_id = button_texture_texture
						self.second_gamepad_input_icon.content.texture_id = second_icon_texture
						self.tip_text_suffix_widget.content.text = suffix_text
					end
				end
			end
		end

		if not localized_tip then
			localized_tip = Localize(tip_localization_key)
			self.tip_text_prefix_widget.content.text = localized_tip
			self.tip_text_prefix_widget.style.text.horizontal_alignment = "center"
			self.tip_text_prefix_widget.style.text.word_wrap = true
		end
	end
end

LoadingView.setup_act_text = function (self, level_key)
	if level_key then
		local level_settings = LevelSettings[level_key]
		local act = level_settings.act

		if act then
			local act_key = act .. "_ls"
			local act_text = Localize(act_key)
			self.act_name_widget.content.text = act_text
			self.act_name_bg_widget.content.text = act_text
		end
	end
end

LoadingView.setup_level_text = function (self, level_key)
	if level_key then
		local level_settings = LevelSettings[level_key]
		local display_name = level_settings.display_name

		if display_name then
			local level_text = Localize(display_name)
			self.level_name_widget.content.text = level_text
			self.level_name_bg_widget.content.text = level_text
		end
	end
end

LoadingView.setup_difficulty_text = function (self, game_difficulty)
	if game_difficulty then
		local difficulty_settings = DifficultySettings[game_difficulty]
		local difficulty_display_name = difficulty_settings.display_name
		local difficulty_text = Localize(difficulty_display_name)
		self.game_difficulty_widget.content.text = difficulty_text
		self.game_difficulty_bg_widget.content.text = difficulty_text
	end
end

LoadingView.setup_news_ticker = function (self, text)
	local widget = self.news_ticker_text_widget
	local widget_content = widget.content
	local widget_style = widget.style
	widget_content.text = text
	local text_style = widget_style.text
	local font_type = text_style.font_type
	local font, scaled_font_size = UIFontByResolution(text_style)
	local fonts = DynamicFonts[font_type]
	local text_width, text_height, min = UIRenderer.text_size(self.ui_renderer, text, font[1], scaled_font_size)
	self.news_ticker_text_width = text_width
	self.news_ticker_started = true
end

local DO_RELOAD = false

LoadingView.update = function (self, dt)
	if DO_RELOAD then
		print("reload")
		self:create_ui_elements()

		DO_RELOAD = false
	end

	if not self.active then
		return
	end

	VisualAssertLog.update(dt)

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active ~= self._gamepad_active then
		local level_settings = self.level_key and LevelSettings[self.level_key]
		local game_mode = (level_settings and level_settings.game_mode) or "adventure"

		self:setup_tip_text(self.act_progression_index, game_mode, self._tip_localization_key)

		self._gamepad_active = gamepad_active
	end

	if not script_data.disable_news_ticker then
		local news_ticker_started = self.news_ticker_started

		if not news_ticker_started then
			local news_ticker_text = self.news_ticker_manager:loading_screen_text()

			if news_ticker_text then
				self:setup_news_ticker(news_ticker_text)
			end
		end
	end

	if self.subtitle_timed_gui then
		self.subtitle_timed_gui:update(dt)
	end

	self:draw(dt)
end

LoadingView.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_hdr_renderer = self._ui_hdr_renderer
	local ui_scenegraph = self.ui_scenegraph

	if not script_data.disable_news_ticker then
		local news_ticker_started = self.news_ticker_started

		if news_ticker_started then
			local news_ticker_widget_position = ui_scenegraph.news_ticker_text.local_position

			if news_ticker_widget_position[1] + self.news_ticker_text_width <= 0 then
				news_ticker_widget_position[1] = 1920
			end

			news_ticker_widget_position[1] = news_ticker_widget_position[1] - dt * self.news_ticker_speed
		end
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, fake_input_service, dt, nil, self.render_settings)

	for i = 1, #self.widgets, 1 do
		UIRenderer.draw_widget(ui_renderer, self.widgets[i])
	end

	if self._show_press_to_continue then
		UIRenderer.draw_widget(ui_renderer, self._press_to_continue_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if self.weave_loading_icon then
		UIRenderer.begin_pass(ui_hdr_renderer, ui_scenegraph, fake_input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_hdr_renderer, self.weave_loading_icon)
		UIRenderer.end_pass(ui_hdr_renderer)
	end
end

LoadingView.destroy = function (self)
	VisualAssertLog.cleanup()
	UIRenderer.destroy(self.ui_renderer, self.world)
	UIRenderer.destroy(self._ui_hdr_renderer, self._ui_hdr_world)
	Managers.world:destroy_world(self._ui_hdr_world)
	Managers.transition:show_loading_icon()
end

LoadingView.is_done = function (self)
	return true
end

return
