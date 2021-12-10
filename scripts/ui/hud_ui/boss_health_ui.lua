local definitions = local_require("scripts/ui/hud_ui/boss_health_ui_definitions")
local bar_length = definitions.bar_length
local portrait_scale = 1
local HEALING_MAX_LIFE_TIME = 0.5
local HEALING_EFFECT_LIFE_TIME = 2
local breed_textures = UISettings.breed_textures
local PRIORITY_TIMER_LENGTH = 5
local PRIORITY_REASONS = {
	proximity = 1,
	lord = 2,
	ping = 4,
	damage_taken = 3,
	damage_done = 4
}
BossHealthUI = class(BossHealthUI)

BossHealthUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}

	self:create_ui_elements()

	self._animations = {}
	self._is_spectator = false
	self._spectated_player = nil
	self._spectated_player_unit = nil
	self._prioritized_unit = nil
	self._prioritized_reason = nil
	local event_manager = Managers.state.event

	event_manager:register(self, "boss_health_bar_set_prioritized_unit", "event_set_prioritized_unit")
	event_manager:register(self, "boss_health_bar_clear_prioritized_unit", "event_clear_prioritized_unit")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")

	self._proximity_update_time = 0
	self._look_at_boss_unit_timer = 0
end

BossHealthUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "boss_health_ui")

	local event_manager = Managers.state.event

	event_manager:unregister("on_spectator_target_changed", self)
	event_manager:unregister("boss_health_bar_set_prioritized_unit", self)
	event_manager:unregister("boss_health_bar_clear_prioritized_unit", self)
end

BossHealthUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}
	local bar_widget_def = definitions.widget_create_func()
	local bar_widget = UIWidget.init(bar_widget_def)
	widgets[#widgets + 1] = bar_widget
	widgets_by_name.bar = bar_widget
	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local game_mode_manager = Managers.state.game_mode
	local game_mode_key = game_mode_manager:game_mode_key()

	if game_mode_key == "versus" then
		self.ui_scenegraph.pivot.position[2] = -150
	end
end

BossHealthUI._set_portrait_and_title = function (self, marked, breed_name, title)
	local portrait_texture = breed_textures[breed_name] or "icons_placeholder"
	local bar_widget = self._widgets_by_name.bar

	if marked then
		bar_widget.content.title_text = "{#grad(true);color(255,125,80,255);color2(234,77,29,255)}" .. Utf8.upper(title)
	else
		bar_widget.content.title_text = Utf8.upper(Localize(title))
	end

	bar_widget.content.portrait = portrait_texture
end

local skull_dividers = {
	"skull_divider1",
	"skull_divider2",
	false,
	"skull_divider3",
	"skull_divider4",
	false
}
local small_style = {
	font_size = 16,
	upper_case = true,
	font_type = "hell_shark",
	divider_icon_width = 22
}
local large_style = {
	upper_case = true,
	divider_icon_width = 22,
	font_size = 20,
	font_type = "hell_shark",
	fallback_style = small_style
}

BossHealthUI._generate_attributes = function (self, attributes, widget, current_style, max_row_width)
	local font_size = current_style.font_size
	local j = 1
	local skull_divider_index = 0
	local text_x_start = 4
	local x = text_x_start
	local y = -40
	local divider_spacing_in_pixels = 24
	local divider_move_x = (divider_spacing_in_pixels - current_style.divider_icon_width) / 2

	for id, value in pairs(attributes) do
		if id then
			local content = widget.content
			local text_id = "attribute_text" .. j
			local style = widget.style[text_id]

			if not style then
				return true
			end

			local data = BreedEnhancements.boss[id]
			local text = "{#grad(true);color(242,226,187,255);color2(255,125,80,255)}" .. Utf8.upper(Localize(data.display_name))
			local pixel_width = UIUtils.get_text_width(self.ui_renderer, current_style, text)
			style.offset[1] = x
			style.font_size = font_size
			style.text_color = data.text_color
			x = x + pixel_width
			local skull_divider_id = skull_dividers[j]

			if skull_divider_id then
				local skull_divider_style = widget.style[skull_divider_id]
				skull_divider_style.offset[1] = x + divider_move_x
				skull_divider_style.offset[2] = y - 13
				x = x + divider_spacing_in_pixels
			elseif current_style.fallback_style and max_row_width < x then
				return false, current_style.fallback_style
			end

			content[text_id] = text
			content.attributes[j] = true
			j = j + 1

			if j == 4 then
				x = text_x_start
				y = -56
			end
		end
	end

	local bg_style = widget.style.lower_marked_bg

	if j <= 4 then
		bg_style.offset[2] = (-83 + current_style.font_size) - 4
	else
		bg_style.offset[2] = -83
	end

	return true
end

BossHealthUI._update_enemy_portrait_name_and_attributes = function (self, unit, breed_name)
	if not ALIVE[unit] then
		return
	end

	local ai_system = Managers.state.entity:system("ai_system")
	local attributes = ai_system:get_attributes(unit)
	local widget = self._widgets_by_name.bar

	table.clear(widget.content.attributes)

	local grudge_marked = attributes.grudge_marked

	if grudge_marked then
		local max_row_width = 430
		local done, fallback_style = self:_generate_attributes(attributes.breed_enhancements, widget, large_style, max_row_width)

		while not done do
			done, fallback_style = self:_generate_attributes(attributes.breed_enhancements, widget, fallback_style, max_row_width)
		end

		local magic_number = grudge_marked.name_index
		local enemy_name = TerrorEventUtils.get_grudge_marked_name(breed_name, magic_number)

		self:_set_portrait_and_title(true, breed_name, enemy_name)
	else
		self:_set_portrait_and_title(false, breed_name, breed_name)
	end
end

local customizer_data = {
	root_scenegraph_id = "pivot",
	label = "Boss health",
	registry_key = "boss_health",
	drag_scenegraph_id = "pivot_dragger"
}

BossHealthUI.update = function (self, dt, t)
	if HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data) then
		UISceneGraph.update_scenegraph(self.ui_scenegraph)
	end

	self:_sync_boss_health(dt, t)
	self:_update_targeted_boss(dt, t)
	self:_update_timed_prioritization(dt, t)

	if self._current_progress and not script_data.hide_boss_health_ui then
		self:_update_animations(dt, t)
		self:_draw(dt, t)
	end
end

BossHealthUI._update_targeted_boss = function (self, dt, t)
	local local_player = (self._is_spectator and self._spectated_player) or self.player_manager:local_player()

	if not local_player then
		return
	end

	local player_unit = local_player.player_unit

	if not player_unit then
		return
	end

	if self._prioritized_unit then
		if ALIVE[self._prioritized_unit] then
			return
		else
			self:event_clear_prioritized_unit()
		end
	end

	local proximity_system = Managers.state.entity:system("proximity_system")
	local proximity_boss_unit = proximity_system.closest_boss_unit

	if proximity_boss_unit and self._boss_unit ~= proximity_boss_unit then
		self:_show_boss_health_bar(proximity_boss_unit)
	end
end

BossHealthUI._update_animations = function (self, dt, t)
	local animations = self._animations

	for name, animation in pairs(animations) do
		if not UIAnimation.completed(animation) then
			UIAnimation.update(animation, dt)
		else
			animations[name] = nil
		end
	end
end

BossHealthUI._update_timed_prioritization = function (self, dt, t)
	if self._start_prioritization_timer then
		self._prioritization_timer = t
		self._start_prioritization_timer = false

		return
	end

	if not self._prioritization_timer then
		return
	end

	if t < self._prioritization_timer + PRIORITY_TIMER_LENGTH then
		return
	end

	self._prioritization_timer = nil

	self:event_clear_prioritized_unit(self._prioritized_reason)
end

BossHealthUI._draw = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")
	local render_settings = self.render_settings
	render_settings.alpha_multiplier = math.min(render_settings.alpha_multiplier + dt * 5, 1)

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	for _, widget in ipairs(widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

BossHealthUI._show_boss_health_bar = function (self, unit)
	if not ALIVE[unit] then
		return
	end

	local should_show_health_bar = false
	local breed = Unit.get_data(unit, "breed")

	if breed and breed.server_controlled_health_bar then
		local state_manager = Managers.state
		local game = state_manager.network:game()
		local go_id = state_manager.unit_storage:go_id(unit)
		local show_health_bar_field = go_id and GameSession.game_object_field(game, go_id, "show_health_bar")

		if show_health_bar_field then
			should_show_health_bar = true
		end
	else
		should_show_health_bar = breed and breed.boss
	end

	if should_show_health_bar then
		local breed_name = breed.name
		self._switch_healthbars = self._boss_unit and unit ~= self._boss_unit
		self._breed_name = breed_name

		self:_update_enemy_portrait_name_and_attributes(unit, breed_name)

		self.render_settings.alpha_multiplier = (not self._boss_unit and 0) or self.render_settings.alpha_multiplier
		self._boss_unit = unit

		self:_set_healing_amount(0, 0)
		self:_set_health_effect_alpha(0)

		self._freeze_healing = false
		self._next_update_is_instant = true

		return true
	end

	return false
end

BossHealthUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
end

BossHealthUI.event_set_prioritized_unit = function (self, unit, reason)
	local new_prio = PRIORITY_REASONS[reason] or -999
	local current_prio = PRIORITY_REASONS[self._prioritized_reason] or -999

	if new_prio < current_prio then
		return
	end

	if self:_show_boss_health_bar(unit) then
		self._prioritized_reason = reason
		self._prioritized_unit = unit

		if reason == "damage_taken" or reason == "damage_done" then
			self._start_prioritization_timer = true
		else
			self._prioritization_timer = nil
			self._start_prioritization_timer = false
		end
	end
end

BossHealthUI.event_clear_prioritized_unit = function (self, reason)
	if self._prioritized_reason ~= reason then
		return
	end

	self._prioritized_unit = nil
	self._prioritized_reason = nil
end

BossHealthUI._reset = function (self)
	self._boss_unit = nil
	self._current_progress = nil
	self._current_raw_progress = nil
	self._current_max_health_fraction = nil
	self._healing_start_progress = nil
	self._healing_life_time = nil
	self._healing_effect_life_time = nil
	self._prioritized_unit = nil
	self._prioritized_reason = nil
end

BossHealthUI._sync_boss_health = function (self, dt, t)
	local unit = self._boss_unit

	if not unit then
		return
	end

	if not AiUtils.unit_alive(unit) then
		self:_reset()

		return
	end

	local progress, max_health_fraction = nil

	if unit and Unit.alive(unit) then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percentage = health_extension:current_health_percent()
		health_percentage = math.clamp(health_percentage, 0, 1)
		local health_max_percentage = health_extension:current_max_health_percent()
		progress = health_percentage * health_max_percentage
		max_health_fraction = health_max_percentage
		self._freeze_healing = self._breed_name == "chaos_troll" and health_extension.state == "down"
	end

	local current_raw_progress = self._current_raw_progress
	local healing_gained = false

	if (progress and current_raw_progress and current_raw_progress < progress) or (progress and self._switch_healthbars) then
		local healing_start_progress = self._current_progress or 0

		self:_set_healing_amount(healing_start_progress, progress, t)

		self._healing_start_progress = healing_start_progress
		healing_gained = true
	end

	if progress ~= self._current_progress or max_health_fraction ~= self._current_max_health_fraction then
		self:_set_bar_progress(progress, max_health_fraction, healing_gained, dt, t)
	end

	self:_update_healing_bar(dt, t, self._freeze_healing)
	self:_update_healing_effect(dt, t)
	self:_set_health_edge_texture_position_progress(self._healing_start_progress or self._current_progress or 0)

	if not progress or self._current_progress == 0 then
		self:_reset()
	end
end

BossHealthUI._set_bar_progress = function (self, progress, max_health_fraction, instant, dt, t)
	progress = progress or 0
	local current_health_percent = self._current_progress or 1
	local health_anim_progress = current_health_percent + math.sign(progress - current_health_percent) * dt * 0.3
	local instant = self._next_update_is_instant or instant

	if instant then
		health_anim_progress = progress
	elseif current_health_percent < progress then
		health_anim_progress = math.min(health_anim_progress, progress)
	else
		health_anim_progress = math.max(health_anim_progress, progress)
	end

	local widget = self._widgets_by_name.bar
	local content = widget.content
	local style = widget.style
	local bar_style = style.bar
	local bar_content = content.bar
	local bar_uvs = bar_content.uvs
	local bar_size = bar_style.size
	local bar_offset = bar_style.offset
	local bar_default_size = bar_style.default_size
	local bar_default_offset = bar_style.default_offset
	bar_size[1] = bar_default_size[1] * (health_anim_progress or 1)
	bar_uvs[2][1] = health_anim_progress
	max_health_fraction = max_health_fraction or 1
	local current_max_health_fraction = self._current_max_health_fraction or 1
	local max_health_anim_fraction = current_max_health_fraction + math.sign(max_health_fraction - current_max_health_fraction) * dt * 0.3

	if instant then
		max_health_anim_fraction = max_health_fraction
	elseif current_max_health_fraction < max_health_fraction then
		max_health_anim_fraction = math.min(max_health_anim_fraction, max_health_fraction)
	else
		max_health_anim_fraction = math.max(max_health_anim_fraction, max_health_fraction)
	end

	local dead_space_bar_style = style.dead_space_bar
	local dead_space_bar_content = content.dead_space_bar
	local dead_space_bar_uvs = dead_space_bar_content.uvs
	local dead_space_bar_size = dead_space_bar_style.size
	local dead_space_bar_offset = dead_space_bar_style.offset
	local dead_space_bar_default_size = dead_space_bar_style.default_size
	local dead_space_bar_default_offset = dead_space_bar_style.default_offset
	dead_space_bar_size[1] = dead_space_bar_default_size[1] * (1 - (max_health_anim_fraction or 1))
	dead_space_bar_uvs[1][1] = max_health_anim_fraction
	dead_space_bar_offset[1] = dead_space_bar_default_size[1] - dead_space_bar_size[1]
	local dead_space_bar_divider_style = style.dead_space_bar_divider
	local dead_space_bar_divider_offset = dead_space_bar_divider_style.offset
	local dead_space_bar_divider_default_width_offset = dead_space_bar_divider_style.default_width_offset
	dead_space_bar_divider_offset[1] = dead_space_bar_default_size[1] - dead_space_bar_divider_default_width_offset - dead_space_bar_size[1]
	content.max_health_fraction = max_health_anim_fraction
	content.health_fraction = health_anim_progress
	self._current_progress = health_anim_progress
	self._current_raw_progress = progress
	self._current_max_health_fraction = max_health_anim_fraction
	self._next_update_is_instant = nil
end

BossHealthUI._set_healing_amount = function (self, start_progress, end_progress, time)
	local widget = self._widgets_by_name.bar
	local content = widget.content
	local style = widget.style
	local bar_style = style.healing_bar
	local bar_content = content.healing_bar
	local bar_size = bar_style.size
	local bar_offset = bar_style.offset
	local bar_uvs = bar_content.uvs
	local total_progress = end_progress - start_progress
	local total_bar_length = bar_length * total_progress
	local bar_offset_x = bar_length * start_progress
	bar_uvs[1][1] = start_progress
	bar_uvs[2][1] = end_progress
	bar_size[1] = total_bar_length
	bar_offset[1] = bar_offset_x

	if time then
		self._healing_life_time = time + HEALING_MAX_LIFE_TIME
		self._healing_effect_life_time = time + HEALING_EFFECT_LIFE_TIME
	end
end

BossHealthUI._update_healing_bar = function (self, dt, t, freeze_healing)
	local healing_end_progress = self._current_raw_progress
	local healing_start_progress = self._healing_start_progress

	if not healing_start_progress or not healing_end_progress then
		return
	end

	local new_healing_start_progress = healing_start_progress

	if healing_end_progress <= healing_start_progress then
		new_healing_start_progress = healing_end_progress
	elseif self._healing_life_time and self._healing_life_time <= t and not freeze_healing then
		new_healing_start_progress = math.min(healing_start_progress + dt * 0.5, healing_end_progress)
	end

	if freeze_healing then
		local unit = self._boss_unit
		local action = BreedActions.chaos_troll.downed
		local min_health_percent = action.respawn_hp_min_percent
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local current_max_health = health_extension:current_max_health_percent()
		new_healing_start_progress = min_health_percent * current_max_health
	end

	self:_set_healing_amount(new_healing_start_progress, healing_end_progress)

	self._healing_start_progress = new_healing_start_progress

	if new_healing_start_progress == healing_end_progress then
		self._healing_start_progress = nil
		self._healing_life_time = nil
	end
end

BossHealthUI._set_health_edge_texture_position_progress = function (self, progress)
	local widget = self._widgets_by_name.bar
	local content = widget.content
	local style = widget.style
	local bar_edge_style = style.bar_edge
	local bar_edge_offset = bar_edge_style.offset
	local bar_edge_default_width_offset = bar_edge_style.default_width_offset
	bar_edge_offset[1] = bar_length * progress - bar_edge_default_width_offset
	content.bar_edge_fraction = progress
end

BossHealthUI._update_healing_effect = function (self, dt, t)
	if self._healing_effect_life_time then
		local time_progress = math.max(self._healing_effect_life_time - t, 0) / HEALING_EFFECT_LIFE_TIME
		local healing_effect_progress = 1 - time_progress
		local effect_alpha = 255 * math.ease_pulse(healing_effect_progress)

		self:_set_health_effect_alpha(effect_alpha)

		if time_progress == 0 then
			self._healing_effect_life_time = nil
		end
	end
end

BossHealthUI._set_health_effect_alpha = function (self, alpha)
	local widget = self._widgets_by_name.bar
	local content = widget.content
	local style = widget.style
	local portrait_healing_style = style.portrait_healing
	local portrait_healing_color = portrait_healing_style.color
	portrait_healing_color[1] = alpha
end

return
