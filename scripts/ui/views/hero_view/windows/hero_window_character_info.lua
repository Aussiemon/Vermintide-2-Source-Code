local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_character_info_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local HERO_POWER_EFFECT_DURATION = 1
HeroWindowCharacterInfo = class(HeroWindowCharacterInfo)
HeroWindowCharacterInfo.NAME = "HeroWindowCharacterInfo"

HeroWindowCharacterInfo.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCharacterInfo")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.ingame_ui = ingame_ui_context.ingame_ui
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)
end

HeroWindowCharacterInfo.create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowCharacterInfo.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCharacterInfo")

	self.ui_animator = nil
end

HeroWindowCharacterInfo.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_loadout_sync()
	self:_update_animations(dt)
	self:draw(dt)
end

HeroWindowCharacterInfo.post_update = function (self, dt, t)
	return
end

HeroWindowCharacterInfo._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowCharacterInfo.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowCharacterInfo._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id or self:_has_hero_level_changed() then
		self:_update_experience_presentation()
		self:_update_hero_portrait_frame()

		self._loadout_sync_id = loadout_sync_id
	end
end

HeroWindowCharacterInfo._has_hero_level_changed = function (self)
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level = ExperienceSettings.get_level(experience)

	if level ~= self._hero_level then
		return true
	end
end

HeroWindowCharacterInfo._update_experience_presentation = function (self)
	local widgets_by_name = self._widgets_by_name
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level, progress = ExperienceSettings.get_level(experience)
	local experience_pool = ExperienceSettings.get_experience_pool(self.hero_name)
	local extra_levels, extra_levels_progress = ExperienceSettings.get_extra_level(experience_pool)
	local experience_bar_default_size = scenegraph_definition.experience_bar.size
	local experience_bar_size = self.ui_scenegraph.experience_bar.size

	if progress > 0 then
		experience_bar_size[1] = math.ceil(experience_bar_default_size[1] * progress)
	elseif extra_levels_progress > 0 then
		experience_bar_size[1] = math.ceil(experience_bar_default_size[1] * extra_levels_progress)
	end

	local text = Localize("level") .. " " .. tostring(level)

	if extra_levels and extra_levels > 0 then
		text = text .. " (+" .. tostring(extra_levels) .. ")"
	end

	widgets_by_name.level_text.content.text = text
	self._hero_level = level
end

HeroWindowCharacterInfo._update_hero_portrait_frame = function (self)
	local career_index = self.career_index
	local profile_index = self.profile_index
	local profile_settings = SPProfiles[profile_index]
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image
	local career_display_name = career_settings.display_name
	local hero_display_name = profile_settings.character_name
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.hero_name.content.text = hero_display_name
	widgets_by_name.career_name.content.text = career_display_name
	local level_text = (self._hero_level and tostring(self._hero_level)) or "-"
	local portrait_frame_name = self:_get_portrait_frame()
	local portrait_widget = self:_create_portrait_frame_widget(portrait_frame_name, portrait_image, level_text)
	self._portrait_widget = portrait_widget
end

HeroWindowCharacterInfo._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCharacterInfo.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._portrait_widget then
		UIRenderer.draw_widget(ui_top_renderer, self._portrait_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowCharacterInfo._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCharacterInfo._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, level_text)
	local widget_definition = UIWidgets.create_portrait_frame("portrait_root", frame_settings_name, level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end

HeroWindowCharacterInfo._get_portrait_frame = function (self)
	local profile_index = self.profile_index
	local career_index = self.career_index
	local hero_name = self.hero_name
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local player_portrait_frame = "default"
	local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

	if item then
		local item_data = item.data
		local frame_name = item_data.temporary_template
		player_portrait_frame = frame_name or player_portrait_frame
	end

	return player_portrait_frame
end

return
