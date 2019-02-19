require("scripts/settings/difficulty_settings")

local definitions = local_require("scripts/ui/hud_ui/difficulty_unlock_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local survival_start_wave_by_difficulty = SurvivalStartWaveByDifficulty
DifficultyUnlockUI = class(DifficultyUnlockUI)
local DO_RELOAD = false

DifficultyUnlockUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.difficulty_manager = Managers.state.difficulty
	self.statistics_db = ingame_ui_context.statistics_db
	self.ui_animations = {}

	self:create_ui_elements()
	self:difficulty_set()
	Managers.state.event:register(self, "difficulty_synced", "difficulty_set")
	rawset(_G, "difficulty_unlock_ui", self)
end

DifficultyUnlockUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	local icon_widgets = {}

	for i = 1, 5, 1 do
		local definition_name = "difficulty_icon_" .. i
		icon_widgets[i] = UIWidget.init(widget_definitions[definition_name])
	end

	self.icon_widgets = icon_widgets
	self.background_top_widget = UIWidget.init(widget_definitions.background_top)
	self.background_center_widget = UIWidget.init(widget_definitions.background_center)
	self.background_bottom_widget = UIWidget.init(widget_definitions.background_bottom)
	self.background_glow_widget = UIWidget.init(widget_definitions.background_glow)
	self.difficulty_text_widget = UIWidget.init(widget_definitions.difficulty_text)
	self.difficulty_title_text_widget = UIWidget.init(widget_definitions.difficulty_title_text)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	self.is_visible = true
end

DifficultyUnlockUI.difficulty_set = function (self)
	local statistics_db = self.statistics_db
	local player = Managers.player:local_player()
	local player_stats_id = player:stats_id()
	local level_key = Managers.state.game_mode:level_key()
	local level_settings = LevelSettings[level_key]
	local level_difficulties = self.difficulty_manager:get_level_difficulties(level_key)
	local mirrored_level_difficulties = table.mirror_table(level_difficulties)
	local current_difficulty = self.difficulty_manager:get_difficulty()
	local start_index = table.find(mirrored_level_difficulties, current_difficulty)
	local highest_completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, player_stats_id, level_key) or 0
	highest_completed_difficulty_index = highest_completed_difficulty_index + 1

	if start_index and current_difficulty ~= level_difficulties[#level_difficulties] then
		local original_start_wave = survival_start_wave_by_difficulty[current_difficulty]
		local persentation_wave_list = {}
		local persentation_wave_difficulty_list = {}

		for i = start_index, #level_difficulties, 1 do
			local difficulty = level_difficulties[i]

			if difficulty ~= current_difficulty and highest_completed_difficulty_index < i then
				local wave_by_difficulty = survival_start_wave_by_difficulty[difficulty]
				persentation_wave_list[#persentation_wave_list + 1] = wave_by_difficulty - original_start_wave
				persentation_wave_difficulty_list[#persentation_wave_difficulty_list + 1] = difficulty
			end
		end

		self.next_presentation_wave = persentation_wave_list[1]
		self.persentation_wave_list = persentation_wave_list
		self.persentation_wave_difficulty_list = persentation_wave_difficulty_list
	end
end

DifficultyUnlockUI.align_icon_widgets = function (self)
	local icon_draw_count = self.icon_draw_count
	local icon_widgets = self.icon_widgets
	local widget_width = 50
	local draw_position_x = -(icon_draw_count / 2 * widget_width) + widget_width * 0.5

	if icon_widgets then
		local ui_scenegraph = self.ui_scenegraph
		local spacing = 0

		for i = 1, icon_draw_count, 1 do
			local widget = icon_widgets[i]
			local scenegraph_id = widget.scenegraph_id
			local widget_scenegraph = ui_scenegraph[scenegraph_id]
			local local_position = widget_scenegraph.local_position
			local_position[1] = draw_position_x
			draw_position_x = draw_position_x + widget_width
			widget.element.dirty = true
		end
	end
end

DifficultyUnlockUI.destroy = function (self)
	self.ui_animator = nil

	self:set_visible(false)
	rawset(_G, "difficulty_unlock_ui", nil)
end

DifficultyUnlockUI.set_visible = function (self, visible)
	self.is_visible = visible
	local ui_renderer = self.ui_renderer
	local icon_widgets = self.icon_widgets

	if icon_widgets then
		for index, widget in ipairs(icon_widgets) do
			UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
		end
	end
end

DifficultyUnlockUI._check_for_presentation_start = function (self, mission_data)
	local previous_wave_completed = self.previous_wave_completed or 0
	local wave_completed = mission_data.wave_completed - mission_data.starting_wave

	if previous_wave_completed >= wave_completed then
		return
	end

	local next_presentation_wave = self.next_presentation_wave

	if next_presentation_wave == wave_completed then
		table.remove(self.persentation_wave_list, 1)

		self.next_presentation_wave = self.persentation_wave_list[1]
		self.display_presentation_difficulty = self.persentation_wave_difficulty_list[1]

		table.remove(self.persentation_wave_difficulty_list, 1)

		self.presentation_start_time = 0
	end

	self.previous_wave_completed = wave_completed
end

DifficultyUnlockUI._update_start_timer = function (self, dt)
	local time = self.presentation_start_time

	if time then
		local end_time = 10

		if time == end_time then
			self:display_unlock(nil, self.display_presentation_difficulty)

			self.display_presentation_difficulty = nil
			time = nil
		else
			time = math.min(time + dt, end_time)
		end

		self.presentation_start_time = time
	end
end

DifficultyUnlockUI.update = function (self, dt, mission_data)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	if self.next_presentation_wave then
		self:_check_for_presentation_start(mission_data)
	end

	self:_update_start_timer(dt)

	if not self.is_visible or not self.draw_widgets then
		return
	end

	local is_dirty = nil
	local ui_animations = self.ui_animations

	if ui_animations then
		for name, animation in pairs(ui_animations) do
			is_dirty = true

			UIAnimation.update(animation, dt)

			if UIAnimation.completed(animation) then
				self.ui_animations[name] = nil
			end
		end
	end

	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local presentation_anim_id = self.presentation_anim_id

	if presentation_anim_id then
		if ui_animator:is_animation_completed(presentation_anim_id) then
			ui_animator:stop_animation(presentation_anim_id)

			self.presentation_anim_id = nil

			self:start_explode_animation()
		end

		is_dirty = true
	end

	local explode_anim_id = self.explode_anim_id

	if explode_anim_id then
		if ui_animator:is_animation_completed(explode_anim_id) then
			ui_animator:stop_animation(explode_anim_id)

			self.explode_anim_id = nil

			self:on_presentation_complete()
		end

		is_dirty = true
	end

	if not is_dirty then
		local resolution_modified = RESOLUTION_LOOKUP.modified

		if resolution_modified then
			is_dirty = true
		end
	end

	if is_dirty then
		local icon_widgets = self.icon_widgets

		if icon_widgets then
			for index, widget in ipairs(icon_widgets) do
				widget.element.dirty = true
			end
		end
	end

	self:draw(dt)
end

DifficultyUnlockUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local icon_draw_count = self.icon_draw_count

	if icon_draw_count then
		local icon_widgets = self.icon_widgets

		if icon_widgets then
			for i = 1, icon_draw_count, 1 do
				local widget = icon_widgets[i]

				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	UIRenderer.draw_widget(ui_renderer, self.background_top_widget)
	UIRenderer.draw_widget(ui_renderer, self.background_center_widget)
	UIRenderer.draw_widget(ui_renderer, self.background_bottom_widget)
	UIRenderer.draw_widget(ui_renderer, self.background_glow_widget)
	UIRenderer.draw_widget(ui_renderer, self.difficulty_text_widget)
	UIRenderer.draw_widget(ui_renderer, self.difficulty_title_text_widget)
	UIRenderer.end_pass(ui_renderer)
end

DifficultyUnlockUI.set_difficulty_amount = function (self, amount)
	self.icon_draw_count = amount

	self:align_icon_widgets()
end

DifficultyUnlockUI.display_unlock = function (self, level_key, difficulty)
	local difficulty_settings = DifficultySettings[difficulty]
	local rank = difficulty_settings.rank
	local display_name = difficulty_settings.display_name
	self.difficulty_text_widget.content.text = display_name

	self:set_difficulty_amount(rank)
	self:start_presentation_animation()

	self.draw_widgets = true
end

DifficultyUnlockUI.on_presentation_complete = function (self)
	self.draw_widgets = false
end

DifficultyUnlockUI.start_presentation_animation = function (self)
	local params = {
		wwise_world = self.wwise_world
	}
	local widgets = {}
	local icon_draw_count = self.icon_draw_count
	local icon_widgets = self.icon_widgets
	local icons = {}

	for i = 1, icon_draw_count, 1 do
		icons[i] = icon_widgets[i]
	end

	widgets.icons = icons
	widgets.background_top = self.background_top_widget
	widgets.background_center = self.background_center_widget
	widgets.background_bottom = self.background_bottom_widget
	widgets.background_glow = self.background_glow_widget
	widgets.difficulty_text = self.difficulty_text_widget
	widgets.difficulty_title_text = self.difficulty_title_text_widget
	self.presentation_anim_id = self.ui_animator:start_animation("presentation", widgets, scenegraph_definition, params)
end

DifficultyUnlockUI.start_explode_animation = function (self)
	local params = {
		wwise_world = self.wwise_world
	}
	local widgets = {}
	local icon_draw_count = self.icon_draw_count
	local icon_widgets = self.icon_widgets
	local icons = {}

	for i = 1, icon_draw_count, 1 do
		icons[i] = icon_widgets[i]
	end

	widgets.icons = icons
	widgets.background_top = self.background_top_widget
	widgets.background_center = self.background_center_widget
	widgets.background_bottom = self.background_bottom_widget
	widgets.background_glow = self.background_glow_widget
	widgets.difficulty_text = self.difficulty_text_widget
	widgets.difficulty_title_text = self.difficulty_title_text_widget
	local animation_name = (icon_draw_count == 4 and "explode_parts_4") or "explode_parts_5"
	self.explode_anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end

return
