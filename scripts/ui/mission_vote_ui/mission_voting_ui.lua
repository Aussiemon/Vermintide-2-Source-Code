local definitions = local_require("scripts/ui/mission_vote_ui/mission_voting_ui_definitions")
local widget_definitions = definitions.widgets
local deed_game_widget_definitions = definitions.deed_game_widgets
local mutator_widget_definitions = definitions.mutator_widgets
local custom_game_widget_definitions = definitions.custom_game_widgets
local adventure_game_widget_definitions = definitions.adventure_game_widgets

local function get_text_height(ui_renderer, size, ui_style, ui_content, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = ui_content.text_start_index or 1
	local max_texts = ui_content.max_texts or #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min))*inv_scale*num_texts

	return full_font_height
end

local RELOAD_UI = true
MissionVotingUI = class(MissionVotingUI)
MissionVotingUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.voting_manager = ingame_ui_context.voting_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self.platform = PLATFORM

	self.create_ui_elements(self)
	rawset(_G, "ingame_voting_ui", self)

	self._active_mutator_widgets = {}
	self.unblocked_services = {}
	self.unblocked_services_n = 0
	local input_manager = self.input_manager

	input_manager.create_input_service(input_manager, "mission_voting", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "mission_voting", "keyboard")
	input_manager.map_device_to_service(input_manager, "mission_voting", "mouse")
	input_manager.map_device_to_service(input_manager, "mission_voting", "gamepad")

	return 
end
MissionVotingUI.create_ui_elements = function (self)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local deed_widgets = {}
	local deed_widgets_by_name = {}

	for name, widget_definition in pairs(deed_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			deed_widgets[#deed_widgets + 1] = widget
			deed_widgets_by_name[name] = widget
		end
	end

	self._deed_widgets = deed_widgets
	self._deed_widgets_by_name = deed_widgets_by_name
	local mutator_widgets = {}
	local mutator_widgets_by_name = {}

	for name, widget_definition in pairs(mutator_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			mutator_widgets[#mutator_widgets + 1] = widget
			mutator_widgets_by_name[name] = widget
		end
	end

	self._mutator_widgets = mutator_widgets
	self._mutator_widgets_by_name = mutator_widgets_by_name
	local custom_game_widgets = {}
	local custom_game_widgets_by_name = {}

	for name, widget_definition in pairs(custom_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			custom_game_widgets[#custom_game_widgets + 1] = widget
			custom_game_widgets_by_name[name] = widget
		end
	end

	self._custom_game_widgets = custom_game_widgets
	self._custom_game_widgets_by_name = custom_game_widgets_by_name
	local adventure_game_widgets = {}
	local adventure_game_widgets_by_name = {}

	for name, widget_definition in pairs(adventure_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			adventure_game_widgets[#adventure_game_widgets + 1] = widget
			adventure_game_widgets_by_name[name] = widget
		end
	end

	self._adventure_game_widgets = adventure_game_widgets
	self._adventure_game_widgets_by_name = adventure_game_widgets_by_name
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.scenegraph_definition = definitions.scenegraph_definition
	RELOAD_UI = false

	return 
end
MissionVotingUI.destroy = function (self)
	if self.vote_started then
		self.on_vote_ended(self)
	end

	rawset(_G, "ingame_voting_ui", nil)

	return 
end
MissionVotingUI.is_active = function (self)
	return self.vote_started and not self.has_voted
end
MissionVotingUI.get_text_width = function (self, text, text_style)
	local font = UIFontByResolution(text_style)
	local font_size = text_style.font_size
	local text_width, _ = UIRenderer.text_size(self.ui_top_renderer, text, font[1], font_size)

	return text_width
end
MissionVotingUI.setup_option_input = function (self, option_widget, option, gamepad_active)
	local total_width = 35
	local text = option.text
	local input_action = option.input
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "mission_voting")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local button_texture_data, input_text = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)

	if not gamepad_active then
		button_texture_data = nil
	end

	local option_text = Localize(text)
	option_widget.content.title_text = option_text

	return 
end
MissionVotingUI.start_vote = function (self, active_voting)
	self.render_settings.alpha_multiplier = 0
	local widgets_by_name = self._widgets_by_name
	local vote_template = active_voting.template

	if vote_template.can_start_vote then
		local can_start_vote = vote_template.can_start_vote(active_voting.data)

		if not can_start_vote then
			local text = vote_template.text or "Unknown vote"

			print(string.format("[MissionVotingUI] - Terminating vote request (%s) due to the requirements to start was not fulfilled.", text))

			return 
		end
	end

	local vote_data = active_voting.data
	local item_name = vote_data.item_name
	local is_deed = item_name ~= nil

	if is_deed then
		local level_key = vote_data.level_key
		local difficulty = vote_data.difficulty

		self._set_deed_presentation(self, item_name, level_key, difficulty)
	else
		local quick_game = vote_data.quick_game

		if quick_game then
			local difficulty = vote_data.difficulty

			self._set_adventure_presentation(self, difficulty)
		else
			local level_key = vote_data.level_key
			local difficulty = vote_data.difficulty
			local private_game = vote_data.private_game

			self._set_custom_game_presentation(self, difficulty, level_key, private_game)
		end
	end

	local title_text = vote_template.text

	if vote_template.modify_title_text then
		title_text = vote_template.modify_title_text(Localize(title_text), vote_data)
	else
		title_text = Localize(title_text)
	end

	widgets_by_name.title_text.content.text = title_text
	self.voters = {}
	self.vote_results = {
		[1.0] = 0,
		[2.0] = 0
	}
	self.vote_started = true
	self.has_voted = false
	local gamepad_active = self.input_manager:is_device_active("gamepad")

	if gamepad_active then
		self.on_gamepad_activated(self, active_voting)
	else
		local vote_options = vote_template.vote_options

		self.setup_option_input(self, widgets_by_name.button_confirm, vote_options[1], gamepad_active)
		self.setup_option_input(self, widgets_by_name.button_abort, vote_options[2], gamepad_active)
	end

	self.gamepad_active = self.input_manager:is_device_active("gamepad")

	self.acquire_input(self)

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end

	self._check_initial_votes(self)

	return 
end
MissionVotingUI._check_initial_votes = function (self)
	local has_voted = self.voting_manager:has_voted(Network.peer_id())

	if has_voted then
		self.on_vote_casted(self)
	end

	return 
end
MissionVotingUI.on_vote_casted = function (self)
	self.has_voted = true

	self.voting_manager:allow_vote_input(false)
	self.release_input(self)

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
MissionVotingUI.on_vote_ended = function (self)
	if not self.has_voted then
		self.voting_manager:allow_vote_input(false)
		self.release_input(self)

		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
			ShadingEnvironment.apply(shading_env)
		end
	end

	self.has_voted = nil
	self.vote_started = nil

	return 
end
MissionVotingUI._set_adventure_presentation = function (self, difficulty)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local adventure_game_widgets_by_name = self._adventure_game_widgets_by_name
	local game_option_1 = adventure_game_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(difficulty_display_name)
	game_option_1.content.icon = difficulty_display_image
	self._presentation_type = "adventure"

	return 
end
MissionVotingUI._set_custom_game_presentation = function (self, difficulty, level_key, private_game)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local level_image = level_settings.level_image
	local custom_game_widgets_by_name = self._custom_game_widgets_by_name
	local game_option_1 = custom_game_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(level_display_name)
	game_option_1.content.icon = level_image
	local game_option_2 = custom_game_widgets_by_name.game_option_2
	game_option_2.content.option_text = Localize(difficulty_display_name)
	game_option_2.content.icon = difficulty_display_image
	local additional_option = custom_game_widgets_by_name.additional_option
	additional_option.content.option_text = (private_game and Localize("start_game_window_other_options_private")) or Localize("start_game_window_other_options_public")
	self._presentation_type = "custom"

	return 
end
MissionVotingUI._set_deed_presentation = function (self, item_key, level_key, difficulty)
	local item_data = ItemMasterList[item_key]
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local level_image = level_settings.level_image
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local deed_widgets_by_name = self._deed_widgets_by_name
	local mutator_widgets_by_name = self._mutator_widgets_by_name
	local deed_options = deed_widgets_by_name.deed_options
	local content = deed_options.content
	content.option_text_1 = Localize(level_display_name)
	content.option_text_2 = Localize(difficulty_display_name)
	local display_name = item_data.display_name
	content.deed_title = Localize(display_name)
	local mutators = item_data.mutators

	self._add_mutator_entries(self, mutators)

	local rewards = item_data.rewards

	self._add_mutator_rewards(self, rewards)

	self._presentation_type = "deed"

	return 
end
MissionVotingUI._add_mutator_rewards = function (self, rewards)
	local deed_widgets_by_name = self._deed_widgets_by_name
	local num_rewards = #rewards
	local spacing = 20
	local start_offset = -(num_rewards - 1)*(spacing*0.5 + 40)

	for i = 1, 2, 1 do
		local widget_name = "reward_item_" .. i
		local widget = deed_widgets_by_name[widget_name]
		local content = widget.content
		local item_key = rewards[i]
		content.visible = item_key ~= nil

		if item_key then
			local hotspot_content = content.button_hotspot
			local style = widget.style
			local item_data = ItemMasterList[item_key]
			local inventory_icon = item_data.inventory_icon
			local rarity = item_data.rarity
			local slot_type = item_data.slot_type
			content.item_icon = inventory_icon
			content.item_frame = "item_frame"
			content.rarity_texture = UISettings.item_rarity_textures[rarity]
			content.item = item_data
			widget.offset[1] = start_offset
			start_offset = start_offset + 80 + spacing
		end
	end

	return 
end
MissionVotingUI._add_mutator_entries = function (self, entries)
	local active_mutator_widgets = self._active_mutator_widgets

	table.clear(active_mutator_widgets)

	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local mutator_widgets = self._mutator_widgets
	local entry_spacing = 10
	local total_length = 0

	for index, name in ipairs(entries) do
		local widget = mutator_widgets[index]
		local scenegraph_id = widget.scenegraph_id
		local content = widget.content
		local offset = widget.offset
		local style = widget.style
		local text_style = style.text
		local text_size = ui_scenegraph[scenegraph_id].size
		text_size[2] = 0
		local mutator_template = MutatorTemplates[name]
		local display_name = mutator_template.display_name
		local description = mutator_template.description
		local icon = mutator_template.icon
		local title_text = (display_name and Localize(display_name)) or "n/a"
		local description_text = (description and Localize(description)) or "n/a"
		local text = title_text
		content.text = text
		content.icon = icon or "icons_placeholder"
		local text_height = get_text_height(ui_top_renderer, text_size, text_style, content, text)
		text_size[2] = math.max(text_height, 30)
		offset[2] = -total_length
		total_length = total_length + text_size[2] + entry_spacing
		active_mutator_widgets[index] = widget
	end

	return 
end
MissionVotingUI.update_vote_timer = function (self)
	local voting_manager = self.voting_manager
	local vote_template = voting_manager.active_vote_template(voting_manager)
	local duration = vote_template.duration
	local vote_time_left = voting_manager.vote_time_left(voting_manager)
	local time_progress = math.max(vote_time_left/duration, 0)

	self._set_vote_time_progress(self, time_progress)

	return 
end
MissionVotingUI._set_vote_time_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.timer_fg
	local content = widget.content
	local uvs = content.texture_id.uvs
	local scenegraph_definition = self.scenegraph_definition
	local scenegraph_id = widget.scenegraph_id
	local default_size = self.scenegraph_definition[scenegraph_id].size
	local current_size = self.ui_scenegraph[scenegraph_id].size
	current_size[1] = default_size[1]*progress
	uvs[2][1] = progress

	return 
end
MissionVotingUI._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
MissionVotingUI.update = function (self, menu_active, dt, t)
	local widgets_by_name = self._widgets_by_name
	local ingame_ui = self.ingame_ui

	if menu_active or ingame_ui.current_view then
		menu_active = true
	else
		menu_active = false
	end

	self.menu_active = menu_active

	if RELOAD_UI then
		self.create_ui_elements(self)
	end

	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager.vote_in_progress(voting_manager)
	local is_mission_vote = active_vote_name == "game_settings_vote" or active_vote_name == "game_settings_deed_vote"

	if is_mission_vote then
		if not menu_active then
			if not self.vote_started then
				self.start_vote(self, voting_manager.active_voting)
			end

			self.update_vote_timer(self)

			if not self.has_voted then
				local active_voting = voting_manager.active_voting
				local vote_template = active_voting and active_voting.template

				if vote_template then
					local vote_options = vote_template.vote_options

					if self._is_button_pressed(self, widgets_by_name.button_confirm) then
						voting_manager.vote(voting_manager, 1)
						self.on_vote_casted(self)
					elseif self._is_button_pressed(self, widgets_by_name.button_abort) then
						voting_manager.vote(voting_manager, 2)
						self.on_vote_casted(self)
					end
				end

				local gamepad_active = self.input_manager:is_device_active("gamepad")

				if self.gamepad_active ~= gamepad_active and vote_template then
					local vote_options = vote_template.vote_options

					self.setup_option_input(self, widgets_by_name.button_confirm, vote_options[1])
					self.setup_option_input(self, widgets_by_name.button_abort, vote_options[2])

					self.gamepad_active = gamepad_active
				end
			end
		end
	elseif self.vote_started then
		self.on_vote_ended(self)
	end

	if self.vote_started and not self.has_voted then
		local input_manager = self.input_manager
		local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

		self.draw(self, dt)
	end

	return 
end
MissionVotingUI.on_gamepad_activated = function (self, active_voting)
	if not self.has_voted then
	end

	if active_voting then
		local vote_template = active_voting.template
		slot3 = vote_template.vote_options
	end

	return 
end
MissionVotingUI.on_gamepad_deactivated = function (self, active_voting)
	if not self.has_voted then
	end

	if active_voting then
		local vote_template = active_voting.template
		slot3 = vote_template.vote_options
	end

	return 
end
MissionVotingUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local render_settings = self.render_settings
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("mission_voting")

	self.update_pulse_animations(self, dt)

	local alpha_multiplier = render_settings.alpha_multiplier
	alpha_multiplier = 1
	render_settings.alpha_multiplier = alpha_multiplier
	ui_scenegraph.window.local_position[2] = alpha_multiplier*50 + -50

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local presentation_type = self._presentation_type

	if presentation_type then
		if presentation_type == "adventure" then
			for _, widget in ipairs(self._adventure_game_widgets) do
				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "custom" then
			for _, widget in ipairs(self._custom_game_widgets) do
				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "deed" then
			for _, widget in ipairs(self._deed_widgets) do
				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end

			local active_mutator_widgets = self._active_mutator_widgets

			if active_mutator_widgets then
				for _, widget in ipairs(active_mutator_widgets) do
					if widget.snap_pixel_positions ~= nil then
						render_settings.snap_pixel_positions = widget.snap_pixel_positions
					end

					UIRenderer.draw_widget(ui_top_renderer, widget)

					render_settings.snap_pixel_positions = snap_pixel_positions
				end
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	return 
end
MissionVotingUI.update_pulse_animations = function (self, dt)
	if self.has_voted then
		return 
	end

	local widgets_by_name = self._widgets_by_name
	local menu_active = self.menu_active
	local speed_multiplier = (menu_active and 5) or 8
	local time_since_launch = Application.time_since_launch()
	local progress = (not menu_active or 0) and math.sin(time_since_launch*speed_multiplier)*0.5 + 0.5

	if menu_active then
		slot7 = progress*50 + 50
	else
		local alpha = progress*155 + 100
		widgets_by_name.timer_fg.style.texture_id.color[1] = alpha
		widgets_by_name.timer_glow.style.texture_id.color[1] = alpha
	end

	return 
end
MissionVotingUI.acquire_input = function (self, ignore_cursor_stack)
	local input_manager = self.input_manager

	self.release_input(self, true)

	self.unblocked_services_n = input_manager.get_unblocked_services(input_manager, nil, nil, self.unblocked_services)

	input_manager.device_block_services(input_manager, "keyboard", 1, self.unblocked_services, self.unblocked_services_n, "mission_voting")
	input_manager.device_block_services(input_manager, "gamepad", 1, self.unblocked_services, self.unblocked_services_n, "mission_voting")
	input_manager.device_block_services(input_manager, "mouse", 1, self.unblocked_services, self.unblocked_services_n, "mission_voting")
	input_manager.device_unblock_service(input_manager, "keyboard", 1, "mission_voting")
	input_manager.device_unblock_service(input_manager, "gamepad", 1, "mission_voting")
	input_manager.device_unblock_service(input_manager, "mouse", 1, "mission_voting")

	if not ignore_cursor_stack then
		ShowCursorStack.push()
	end

	return 
end
MissionVotingUI.release_input = function (self, ignore_cursor_stack)
	local input_manager = self.input_manager

	input_manager.device_block_service(input_manager, "keyboard", 1, "mission_voting")
	input_manager.device_block_service(input_manager, "gamepad", 1, "mission_voting")
	input_manager.device_block_service(input_manager, "mouse", 1, "mission_voting")
	input_manager.device_unblock_services(input_manager, "keyboard", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager.device_unblock_services(input_manager, "gamepad", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager.device_unblock_services(input_manager, "mouse", 1, self.unblocked_services, self.unblocked_services_n)
	table.clear(self.unblocked_services)

	self.unblocked_services_n = 0

	if not ignore_cursor_stack then
		ShowCursorStack.pop()
	end

	return 
end
MissionVotingUI.active_input_service = function (self)
	local input_manager = self.input_manager
	local service_name = "mission_voting"
	local input_service = input_manager.get_service(input_manager, service_name)

	return input_service
end

return 
