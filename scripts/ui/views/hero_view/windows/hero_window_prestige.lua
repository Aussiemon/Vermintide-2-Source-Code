-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_prestige.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_prestige_definitions")
local widget_definitions = definitions.widgets
local warning_widget_definitions = definitions.warning_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false

HeroWindowPrestige = class(HeroWindowPrestige)
HeroWindowPrestige.NAME = "HeroWindowPrestige"

HeroWindowPrestige.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowPrestige")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index

	local experience = ExperienceSettings.get_experience(self.hero_name)

	self.hero_level = ExperienceSettings.get_level(experience)

	self:_setup_prestige_reward()
end

HeroWindowPrestige.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowPrestige")

	self.ui_animator = nil
end

HeroWindowPrestige.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	local warning_widgets = {}

	for name, widget_definition in pairs(warning_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		warning_widgets[#warning_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._warning_widgets = warning_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowPrestige._setup_prestige_reward = function (self)
	local widgets_by_name = self._widgets_by_name
	local hero_name = self.hero_name
	local max_prestige_level = ProgressionUnlocks.get_max_prestige_levels()

	self._max_prestige_level = max_prestige_level

	local prestige_level = ProgressionUnlocks.get_prestige_level(hero_name)

	self._prestige_level = prestige_level

	local next_presige_level = math.min(prestige_level + 1, max_prestige_level)
	local is_max_prestiged = prestige_level == next_presige_level

	if not is_max_prestiged then
		local reward_portrait_frame, reward_texture
		local reward_item_key = ProgressionUnlocks.prestige_reward_by_level(next_presige_level, hero_name)

		self._reward_item_key = reward_item_key

		local item_data = ItemMasterList[reward_item_key]
		local item_type = item_data.item_type
		local display_name = item_data.display_name

		if item_type == "hat" then
			-- Nothing
		elseif item_type == "frame" then
			reward_portrait_frame = item_data.name
		elseif item_type == "skin" then
			-- Nothing
		end

		self:_set_prestige_reward_portrait_frame(reward_portrait_frame)

		widgets_by_name.reward_item_text.content.text = Localize(display_name)
	end

	local can_prestige = ProgressionUnlocks.can_upgrade_prestige(hero_name)

	widgets_by_name.prestige_button.content.button_hotspot.disable_button = not can_prestige
	widgets_by_name.unable_description_text.content.visible = not can_prestige
end

HeroWindowPrestige.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

HeroWindowPrestige.post_update = function (self, dt, t)
	return
end

HeroWindowPrestige._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowPrestige._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

HeroWindowPrestige._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowPrestige._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end
end

HeroWindowPrestige._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")

	if self:_is_button_pressed(widgets_by_name.debug_level_up_button) then
		hero_attributes:set(self.hero_name, "experience", ExperienceSettings.max_experience)
		self:_setup_prestige_reward()

		return true
	end

	if self:_is_button_pressed(widgets_by_name.prestige_button) and not self._show_warning_popup then
		widgets_by_name.prestige_button.content.visible = false
		self._show_warning_popup = true

		parent:block_input()
		parent:set_fullscreen_effect_enable_state(true)

		return true
	end

	if self._show_warning_popup then
		local input_service = parent:input_service()
		local input_pressed = input_service:get("toggle_menu", true)

		if self:_is_button_pressed(widgets_by_name.warning_popup_decline_button) or input_pressed then
			widgets_by_name.prestige_button.content.visible = true
			self._show_warning_popup = false

			parent:unblock_input()
			parent:set_fullscreen_effect_enable_state(false)

			return true
		end

		if self:_is_button_pressed(widgets_by_name.warning_popup_accept_button) then
			widgets_by_name.prestige_button.content.visible = true
			self._show_warning_popup = false

			self:_play_sound("Play_enemy_combat_globadier_suicide_explosion")
			hero_attributes:prestige(self.hero_name)

			self._wait_for_backend_attributes = true

			parent:unblock_input()
			parent:set_fullscreen_effect_enable_state(false)
			self:_setup_prestige_reward()

			return true
		end
	end
end

HeroWindowPrestige.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._reward_portrait_widget then
		UIRenderer.draw_widget(ui_renderer, self._reward_portrait_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if self._show_warning_popup then
		input_service = self.parent:input_service()

		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

		for _, widget in ipairs(self._warning_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		UIRenderer.end_pass(ui_top_renderer)
	end
end

HeroWindowPrestige._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowPrestige._set_prestige_reward_portrait_frame = function (self, frame_settings_name)
	local career_index = self.career_index
	local profile_index = self.profile_index
	local profile_settings = SPProfiles[profile_index]
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image
	local widget

	if frame_settings_name then
		local widget_definition = UIWidgets.create_portrait_frame("reward_portrait_root", frame_settings_name, "", 1, nil, portrait_image)

		widget = UIWidget.init(widget_definition, self.ui_renderer)

		local widget_content = widget.content

		widget_content.frame_settings_name = frame_settings_name
	end

	self._reward_portrait_widget = widget
end
