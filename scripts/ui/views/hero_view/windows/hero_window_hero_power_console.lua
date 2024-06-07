-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_hero_power_console.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_hero_power_console_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local HERO_POWER_EFFECT_DURATION = 1

HeroWindowHeroPowerConsole = class(HeroWindowHeroPowerConsole)
HeroWindowHeroPowerConsole.NAME = "HeroWindowHeroPowerConsole"

HeroWindowHeroPowerConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowHeroPowerConsole")

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
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self._animations = {}
	self._ui_animations = {}
	self._hero_power_loadout_selection = {}

	self:create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
end

HeroWindowHeroPowerConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowHeroPowerConsole.create_ui_elements = function (self, params, offset)
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

HeroWindowHeroPowerConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowHeroPowerConsole")

	self.ui_animator = nil
end

HeroWindowHeroPowerConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_loadout_sync()
	self:_update_animations(dt)
	self:_update_hero_power_effect(dt)
	self:draw(dt)
end

HeroWindowHeroPowerConsole.post_update = function (self, dt, t)
	return
end

HeroWindowHeroPowerConsole._update_animations = function (self, dt)
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

HeroWindowHeroPowerConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowHeroPowerConsole.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowHeroPowerConsole._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id or self:_has_hero_level_changed() then
		self:_calculate_power_level()

		self._loadout_sync_id = loadout_sync_id
	end
end

HeroWindowHeroPowerConsole._has_hero_level_changed = function (self)
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level = ExperienceSettings.get_level(experience)

	if level ~= self._hero_level then
		return true
	end
end

HeroWindowHeroPowerConsole._calculate_power_level = function (self)
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local total_power_level = BackendUtils.get_total_power_level(hero_name, career_name)
	local presentable_hero_power_level = UIUtils.presentable_hero_power_level(total_power_level)
	local widgets_by_name = self._widgets_by_name
	local content = widgets_by_name.power_text.content
	local selected_loadout_index = Managers.backend:get_interface("items"):get_selected_career_loadout(career_name)
	local play_effect = content.power and presentable_hero_power_level > content.power

	if play_effect then
		self._hero_power_effect_time = HERO_POWER_EFFECT_DURATION

		local current_loadout_selection_index = self._hero_power_loadout_selection[career_name]

		if not current_loadout_selection_index or selected_loadout_index == current_loadout_selection_index then
			self:_play_sound("play_gui_equipment_power_level_increase")
		end
	end

	content.power = presentable_hero_power_level
	content.text = tostring(presentable_hero_power_level)
	self._hero_power_loadout_selection[career_name] = selected_loadout_index
end

local power_default_color = Colors.get_color_table_with_alpha("white", 255)
local power_increase_color = Colors.get_color_table_with_alpha("font_title", 255)

HeroWindowHeroPowerConsole._update_hero_power_effect = function (self, dt)
	local hero_power_effect_time = self._hero_power_effect_time

	if hero_power_effect_time then
		hero_power_effect_time = math.max(hero_power_effect_time - dt, 0)

		local progress = 1 - hero_power_effect_time / HERO_POWER_EFFECT_DURATION
		local anim_progress = math.easeOutCubic(progress)
		local pulse_progress = math.ease_pulse(anim_progress)
		local widgets_by_name = self._widgets_by_name
		local effect_style = widgets_by_name.hero_power_tooltip.style.effect

		effect_style.angle = math.degrees_to_radians(120 * anim_progress)
		effect_style.color[1] = 255 * pulse_progress

		local text_style = widgets_by_name.power_text.style.text

		Colors.lerp_color_tables(power_default_color, power_increase_color, pulse_progress, text_style.text_color)

		if progress == 1 then
			self._hero_power_effect_time = nil
		else
			self._hero_power_effect_time = hero_power_effect_time
		end
	end
end

HeroWindowHeroPowerConsole._exit = function (self)
	self.exit = true
end

HeroWindowHeroPowerConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

HeroWindowHeroPowerConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end
