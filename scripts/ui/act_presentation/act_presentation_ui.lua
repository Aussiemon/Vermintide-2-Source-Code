local definitions = local_require("scripts/ui/act_presentation/act_presentation_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animations
ActPresentationUI = class(ActPresentationUI)
local RELOAD_UI = false

ActPresentationUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.statistics_db = ingame_ui_context.statistics_db
	self.stats_id = ingame_ui_context.stats_id
	self.input_manager = ingame_ui_context.input_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self.platform = PLATFORM
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(self.world)

	self:create_ui_elements()

	local input_manager = self.input_manager

	input_manager:create_input_service("act_presentation", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("act_presentation", "keyboard")
	input_manager:map_device_to_service("act_presentation", "mouse")
	input_manager:map_device_to_service("act_presentation", "gamepad")
end

ActPresentationUI.create_ui_elements = function (self)
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
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	RELOAD_UI = false
end

ActPresentationUI.start = function (self, level_key, previous_completed_difficulty_index)
	local act_key = LevelUnlockUtils.get_act_key_by_level(level_key)

	if not act_key then
		self.active = true
		self._presentation_aborted = true

		return false
	end

	self._presentation_aborted = nil

	self:_set_presentation_info(act_key, level_key)

	local first_time_completed, difficulty_index_completed = self:_setup_level(act_key, level_key, previous_completed_difficulty_index)
	local animation_params = {
		wwise_world = self.wwise_world,
		level_key = level_key,
		widget = self._widgets_by_name.level,
		first_time = first_time_completed,
		previous_difficulty_index = previous_completed_difficulty_index,
		difficulty_index = difficulty_index_completed,
		render_settings = self.render_settings
	}
	self.animation_params = animation_params
	local animation_name = first_time_completed and "enter_first_time" or "enter"

	self:start_presentation_animation(animation_name, animation_params)

	self.active = true
end

ActPresentationUI._set_presentation_info = function (self, act_key, level_key)
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local level_image = level_settings.level_image
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_display_name = difficulty_settings.display_name
	local act_settings = ActSettings[act_key]
	local act_display_name = act_settings.display_name
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.level.content.icon = level_image
	widgets_by_name.act_title.content.text = act_display_name and Localize(act_display_name) or ""
	widgets_by_name.level_title.content.text = Localize(level_display_name)
end

ActPresentationUI._setup_level = function (self, act_key, played_level_key, previous_difficulty_index_completed)
	local widgets_by_name = self._widgets_by_name
	local statistics_db = self.statistics_db
	local stats_id = self.stats_id
	local level_stat = statistics_db:get_persistent_stat(stats_id, "completed_levels", played_level_key) or 0
	local level_completed = level_stat ~= 0
	local difficulty_complete_index = level_completed and LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, played_level_key) or 0
	local first_time_completed = previous_difficulty_index_completed < difficulty_complete_index
	local widget_name = "level"
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	local style = widget.style
	content.locked = first_time_completed or not level_completed

	return first_time_completed, difficulty_complete_index
end

ActPresentationUI.destroy = function (self)
	self._ui_animator = nil
end

ActPresentationUI._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_key, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_key] = nil
			local animation_params = self.animation_params

			if animation_params then
				animation_params.presentation_completed = true
				self.active = false
			end
		end
	end
end

ActPresentationUI.presentation_completed = function (self)
	local animation_params = self.animation_params

	return animation_params and animation_params.presentation_completed or self._presentation_aborted
end

ActPresentationUI.update = function (self, dt, t)
	if RELOAD_UI then
		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:draw(dt)
end

ActPresentationUI.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local render_settings = self.render_settings
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self.input_manager:get_service("act_presentation")
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_top_renderer)
end

ActPresentationUI.start_presentation_animation = function (self, animation_name, optional_params)
	if not optional_params then
		local params = {
			wwise_world = self.wwise_world
		}
	end

	local animation_id = self._ui_animator:start_animation(animation_name, self._widgets_by_name, scenegraph_definition, params)
	local animation_key = animation_name
	self._animations[animation_key] = animation_id

	return animation_key
end
