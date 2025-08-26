-- chunkname: @scripts/ui/hud_ui/boss_health_ui.lua

local definitions = local_require("scripts/ui/hud_ui/boss_health_ui_definitions")
local HEALING_MAX_LIFE_TIME = 0.5
local HEALING_EFFECT_LIFE_TIME = 2
local breed_textures = UISettings.breed_textures
local PRIORITY_REASONS = {
	damage_done = 4,
	damage_taken = 3,
	forced = 5,
	lord = 2,
	ping = 4,
	proximity = 1,
	sync = 0,
}
local SWAPPABLE_REASONS = table.set({
	"damage_taken",
	"damage_done",
	"ping",
})
local RPCS = {
	"rpc_add_forced_boss_health_ui",
	"rpc_register_detected_boss",
}

BossHealthUI = class(BossHealthUI)
BossHealthUI.MAX_NUM_FORCED_WIDGETS = 2
BossHealthUI.MAX_NUM_ADDITIONAL_WIDGETS = 4

BossHealthUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world = ingame_ui_context.world_manager:world("level_world")
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}

	self:create_ui_elements()

	self._animations = {}
	self._forced_animations = {}
	self._ingame_ui_context = ingame_ui_context
	self._name_pools = {}
	self._cached_pool_name_by_unit = {}
	self._detected_boss_units = {}

	local event_manager = Managers.state.event

	event_manager:register(self, "boss_health_bar_register_unit", "_event_register_boss_unit")
	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
	event_manager:register(self, "force_add_boss_health_ui", "on_force_add_boss_health_ui")

	self._proximity_update_time = 0
	self._look_at_boss_unit_timer = 0
	self._network_event_delegate = ingame_ui_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))
end

BossHealthUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "boss_health_ui")

	local event_manager = Managers.state.event

	event_manager:unregister("on_spectator_target_changed", self)
	event_manager:unregister("boss_health_bar_register_unit", self)
	event_manager:unregister("force_add_boss_health_ui", self)
	self._network_event_delegate:unregister(self)
end

BossHealthUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._forced_widget_names = {}
	self._additional_widget_names = {}

	local widgets = {}
	local widgets_by_name = {}

	do
		local bar_widget_def = definitions.widget_create_func()
		local bar_widget = UIWidget.init(bar_widget_def)

		widgets[#widgets + 1] = bar_widget
		widgets_by_name.prioritized_bar = bar_widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	self:_preemptively_hide_widgets()

	local game_mode_manager = Managers.state.game_mode
	local game_mode_key = game_mode_manager:game_mode_key()

	if game_mode_key == "versus" then
		self.ui_scenegraph.pivot.position[2] = -150
	end
end

BossHealthUI._get_or_create_forced_widget_name = function (self, idx)
	if idx > BossHealthUI.MAX_NUM_FORCED_WIDGETS then
		return nil
	end

	local names = self._forced_widget_names
	local name = names[idx]

	if not name then
		name = "forced_widget_" .. idx
		names[idx] = name
	end

	local widgets_by_name = self._widgets_by_name

	if not widgets_by_name[name] then
		local widgets = self._widgets
		local bar_widget_def = definitions.widget_create_func()
		local bar_widget = UIWidget.init(bar_widget_def)

		widgets[#widgets + 1] = bar_widget
		widgets_by_name[name] = bar_widget
	end

	return name
end

BossHealthUI._get_or_create_additional_widget_name = function (self, idx)
	if idx > BossHealthUI.MAX_NUM_ADDITIONAL_WIDGETS then
		return nil
	end

	local names = self._additional_widget_names
	local name = names[idx]

	if not name then
		name = "additional_widget_" .. idx
		names[idx] = name
	end

	local widgets_by_name = self._widgets_by_name

	if not widgets_by_name[name] then
		local widgets = self._widgets
		local bar_widget_def = definitions.widget_create_func(true)
		local bar_widget = UIWidget.init(bar_widget_def)

		widgets[#widgets + 1] = bar_widget
		widgets_by_name[name] = bar_widget
	end

	return name
end

BossHealthUI._set_portrait_and_title = function (self, boss_data, marked, title)
	local breed_name = boss_data.breed_name
	local portrait_texture = breed_textures[breed_name] or "icons_placeholder"
	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		local cached_title, cached_marked = widget.content.title_cached, widget.content.marked_cached

		if boss_data.dirty or cached_title ~= title or cached_marked ~= marked then
			widget.content.title_cached, widget.content.marked_cached = title, marked

			if marked then
				widget.content.title_text = "{#grad(true);color(255,125,80,255);color2(234,77,29,255)}" .. Utf8.upper(title)
			else
				widget.content.title_text = Utf8.upper(Localize(title))
			end
		end

		widget.content.portrait = portrait_texture
	end
end

local small_style = {
	divider_icon_width = 22,
	font_size = 16,
	font_type = "hell_shark",
	upper_case = true,
}
local large_style = {
	divider_icon_width = 22,
	font_size = 20,
	font_type = "hell_shark",
	upper_case = true,
	fallback_style = small_style,
}

BossHealthUI._generate_attributes = function (self, attributes, widget, current_style, max_row_width, enemy_name)
	local font_size = current_style.font_size
	local content = widget.content
	local j = 0
	local text_x_start = (content.attribute_offset_reference or 0) + 4
	local x = text_x_start
	local y = -40
	local divider_spacing_in_pixels = 24
	local divider_move_x = (divider_spacing_in_pixels - current_style.divider_icon_width) / 2

	for id in pairs(attributes) do
		if id then
			j = j + 1
			content.attributes[j] = true
			content.num_attributes = j

			local text_id = "attribute_text_" .. j
			local style = widget.style[text_id]

			if style then
				local enhancement_data = BreedEnhancements[id]
				local skull_divider_id = content.skull_dividers[j]

				if skull_divider_id then
					local skull_divider_style = widget.style[skull_divider_id]

					skull_divider_style.offset[1] = x + divider_move_x
					skull_divider_style.offset[2] = y - 13
					x = x + divider_spacing_in_pixels
				end

				local text = "{#grad(true);color(242,226,187,255);color2(255,125,80,255)}" .. Utf8.upper(Localize(enhancement_data.display_name or "missing_grudge_mark_name"))
				local pixel_width = UIUtils.get_text_width(self.ui_renderer, current_style, text)

				content[text_id] = text
				style.offset[1] = x
				style.font_size = font_size
				style.text_color = enhancement_data.text_color
				x = x + pixel_width

				if j % 3 == 0 then
					x = text_x_start
					y = y - 16
				end
			end
		end
	end

	local bg_style = widget.style.lower_marked_bg

	if bg_style then
		if j <= 4 then
			bg_style.offset[2] = -83 + current_style.font_size - 4
		else
			bg_style.offset[2] = -83
		end
	end

	return true
end

BossHealthUI._update_enemy_portrait_name_and_attributes = function (self, boss_data)
	local unit = boss_data.unit
	local ai_system = Managers.state.entity:system("ai_system")
	local attributes = ai_system:get_attributes(unit)
	local grudge_marked = attributes.grudge_marked

	if not boss_data.dirty and boss_data.cached_name then
		return boss_data.cached_name, grudge_marked
	end

	local breed_name = boss_data.breed_name
	local enemy_name
	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		table.clear(widget.content.attributes)
	end

	local level_key = Managers.level_transition_handler:get_current_level_key()
	local breed = Breeds[breed_name] or PlayerBreeds[breed_name]
	local level_name_pool = breed and breed.name_pool_by_level and breed.name_pool_by_level[level_key]

	if grudge_marked then
		local magic_number = grudge_marked.name_index

		enemy_name = TerrorEventUtils.get_grudge_marked_name(breed_name, magic_number, attributes.breed_enhancements)
	elseif level_name_pool then
		if self._cached_pool_name_by_unit[unit] then
			enemy_name = self._cached_pool_name_by_unit[unit]
		else
			local pool_key = string.format("%s_%s", level_key, breed_name)
			local pool = self._name_pools[pool_key] or {}

			self._name_pools[pool_key] = pool

			if table.is_empty(pool) then
				table.append(pool, level_name_pool)
			end

			local unit_go_id = Managers.state.unit_storage:go_id(boss_data.unit) or 0
			local _, idx = Math.next_random(unit_go_id, 1, #pool)

			enemy_name = table.remove(pool, idx)
			self._cached_pool_name_by_unit[unit] = enemy_name
		end
	else
		enemy_name = breed.display_name or breed_name
	end

	if grudge_marked and widget then
		local max_row_width = 430

		if attributes.breed_enhancements then
			local done, fallback_style = self:_generate_attributes(attributes.breed_enhancements, widget, large_style, max_row_width, enemy_name)

			while not done do
				done, fallback_style = self:_generate_attributes(attributes.breed_enhancements, widget, fallback_style, max_row_width, enemy_name)
			end
		end
	end

	boss_data.cached_name = enemy_name

	return enemy_name, grudge_marked
end

local customizer_data = {
	drag_scenegraph_id = "pivot_dragger",
	label = "Boss health",
	registry_key = "boss_health",
	root_scenegraph_id = "pivot",
}

BossHealthUI.update = function (self, dt, t)
	if HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data) then
		UISceneGraph.update_scenegraph(self.ui_scenegraph)
	end

	self:_update_proximity_boss()
	self:_sync_boss_unit_health(dt, t)
	self:_update_animations(dt, t)

	if not script_data.hide_boss_health_ui then
		self:_draw(dt, t)
	end
end

BossHealthUI._update_proximity_boss = function (self)
	local proximity_system = Managers.state.entity:system("proximity_system")
	local proximity_boss_unit = proximity_system.closest_boss_unit

	self:_event_register_boss_unit(proximity_boss_unit, "proximity")
end

BossHealthUI._update_name = function (self, boss_data)
	local name, grudge_marked = self:_update_enemy_portrait_name_and_attributes(boss_data)
	local breed = Breeds[boss_data.breed_name]

	if breed and breed.custom_health_bar_name then
		local custom_name = breed.custom_health_bar_name(boss_data.unit, name)

		if custom_name then
			name = custom_name
			grudge_marked = true
		end
	end

	self:_set_portrait_and_title(boss_data, grudge_marked, name)
end

BossHealthUI._is_forced = function (self, boss_unit)
	for _, boss_data in ipairs(self._detected_boss_units) do
		if boss_data.unit == boss_unit and boss_data.forced then
			return true
		end
	end
end

BossHealthUI._has_forced = function (self)
	return table.find_func(self._detected_boss_units, function (_, boss_data)
		return boss_data.forced
	end)
end

local num_healthbars_scratch = {}

BossHealthUI._num_healthbars = function (self)
	local _, num_healthbars = table.filter_array(self._detected_boss_units, function (boss_data)
		return boss_data.show_health_bar
	end, num_healthbars_scratch)

	return num_healthbars
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

	local forced_animations = self._forced_animations

	for name, animation in pairs(forced_animations) do
		if not UIAnimation.completed(animation) then
			UIAnimation.update(animation, dt)
		else
			forced_animations[name] = nil
		end
	end
end

BossHealthUI._draw = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")
	local render_settings = self.render_settings

	render_settings.alpha_multiplier = math.min(render_settings.alpha_multiplier + dt * 5, 1)

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local saved_alpha_multiplier = render_settings.alpha_multiplier

	for _, boss_data in pairs(self._detected_boss_units) do
		if boss_data.current_progress then
			local widget = self._widgets_by_name[boss_data.widget_name]

			if widget then
				boss_data.alpha_multiplier = math.min(boss_data.alpha_multiplier + dt * 5, 1)
				render_settings.alpha_multiplier = boss_data.alpha_multiplier

				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	render_settings.alpha_multiplier = saved_alpha_multiplier

	UIRenderer.end_pass(ui_renderer)
end

BossHealthUI._show_boss_health_bar = function (self, boss_data)
	local unit = boss_data.unit
	local should_show_health_bar
	local breed = Unit.get_data(unit, "breed")

	if breed and breed.server_controlled_health_bar then
		local state_manager = Managers.state
		local game = state_manager.network:game()
		local go_id = state_manager.unit_storage:go_id(unit)

		should_show_health_bar = go_id and GameSession.game_object_field(game, go_id, "show_health_bar")
	else
		local ai_system = Managers.state.entity:system("ai_system")
		local attributes = ai_system:get_attributes(unit)

		should_show_health_bar = breed and breed.show_health_bar or attributes.grudge_marked ~= nil
	end

	if boss_data.show_health_bar ~= should_show_health_bar then
		local current_num_health_bars = self:_num_healthbars()

		boss_data.show_health_bar = should_show_health_bar
		boss_data.dirty = true
		self.render_settings.alpha_multiplier = current_num_health_bars == 0 and 0 or self.render_settings.alpha_multiplier
		boss_data.alpha_multiplier = current_num_health_bars == 0 and 0 or self.render_settings.alpha_multiplier

		self:_set_healing_amount(boss_data, 0, 0)

		boss_data.freeze_healing = false
		boss_data.next_update_is_instant = true
	end

	return should_show_health_bar
end

BossHealthUI.on_spectator_target_changed = function (self, spectated_player_unit)
	return
end

BossHealthUI.on_force_add_boss_health_ui = function (self, forced_ai_unit)
	self:_event_register_boss_unit(forced_ai_unit, "forced", true)
	self:_realign_forced_boss_widgets()

	if Managers.player.is_server then
		local game = Managers.state.network:game()

		if not game then
			return
		end

		local go_id = Managers.state.unit_storage:go_id(forced_ai_unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_add_forced_boss_health_ui", go_id)
	end
end

BossHealthUI.rpc_add_forced_boss_health_ui = function (self, sender, go_id)
	local unit = Managers.state.unit_storage:unit(go_id)

	self:on_force_add_boss_health_ui(unit)
end

BossHealthUI._event_register_boss_unit = function (self, unit, reason, skip_sync)
	if not HEALTH_ALIVE[unit] then
		return
	end

	local _, existing_data = table.find_func(self._detected_boss_units, function (_, boss_data)
		return boss_data.unit == unit
	end)

	if existing_data then
		local existing_prio = existing_data.priority
		local new_prio = PRIORITY_REASONS[reason]

		if existing_prio < new_prio or new_prio == existing_prio and SWAPPABLE_REASONS[reason] then
			existing_data.priority = new_prio
			existing_data.priority_t = Managers.time:time("ui")
		end

		return existing_data
	end

	local boss_data = {
		alpha_multiplier = 0,
		unit = unit,
		priority = PRIORITY_REASONS[reason],
		priority_t = Managers.time:time("ui"),
		forced = reason == "forced",
		breed_name = Unit.get_data(unit, "breed").name,
	}

	self._detected_boss_units[#self._detected_boss_units + 1] = boss_data

	if boss_data.forced then
		self:_realign_forced_boss_widgets()
	end

	if reason ~= "sync" then
		local go_id = Managers.state.unit_storage:go_id(unit)

		if go_id then
			local network_transmit = Managers.state.network.network_transmit

			if Managers.player.is_server then
				network_transmit:send_rpc_clients("rpc_register_detected_boss", go_id)
			else
				network_transmit:send_rpc_server("rpc_register_detected_boss", go_id)
			end
		end
	end

	return boss_data
end

local forced_widgets_scratch = {}

BossHealthUI._realign_forced_boss_widgets = function (self, forced)
	table.clear(self._forced_animations)

	local animation_time = forced and 0 or 0.3
	local forced_bosses, num_forced_boss_data = table.filter_array(self._detected_boss_units, function (boss_data)
		return boss_data.forced
	end, forced_widgets_scratch)

	num_forced_boss_data = math.min(num_forced_boss_data, BossHealthUI.MAX_NUM_FORCED_WIDGETS)

	local spacing = 50
	local widget_length = 500
	local offset_x = -(num_forced_boss_data - 1) * 0.5 * (widget_length + spacing)

	for i = 1, num_forced_boss_data do
		local boss_data = forced_bosses[i]
		local widget = self._widgets_by_name[boss_data.widget_name]

		if widget then
			self._forced_animations["boss_ui_offset_" .. i] = UIAnimation.init(UIAnimation.function_by_time, widget.offset, 1, widget.offset[1], offset_x, animation_time, math.easeOutCubic)
			offset_x = offset_x + widget_length + spacing
		end
	end
end

BossHealthUI._sync_boss_unit_health = function (self, dt, t)
	local any_forced_data_removed = self:_update_alive_units()
	local widgets_changed, any_forced_data_dirty, prioritized_boss_data = self:_update_prioritized_unit(t)

	self:_preemptively_hide_widgets()

	if any_forced_data_removed or any_forced_data_dirty then
		self:_realign_forced_boss_widgets(any_forced_data_removed)
	end

	local has_forced = self:_has_forced()
	local num_unprioritized = 0
	local detected_boss_units = self._detected_boss_units

	for i = 1, #detected_boss_units do
		local boss_data = detected_boss_units[i]

		if widgets_changed then
			boss_data.dirty = true
		end

		local unit = boss_data.unit
		local dirty = boss_data.dirty

		if boss_data.prioritized or boss_data.forced or dirty then
			self:_update_name(boss_data)
		end

		local widget = self._widgets_by_name[boss_data.widget_name]

		if widget then
			if boss_data.forced then
				widget.offset[2] = 0
			elseif not boss_data.prioritized then
				widget.offset[1] = num_unprioritized % 4 * definitions.total_bar_length * 0.25
				num_unprioritized = num_unprioritized + 1

				local y_offset = -80
				local prioritized_widget = self._widgets_by_name[prioritized_boss_data.widget_name]

				if prioritized_widget and (prioritized_widget.content.num_attributes or 0) > 3 then
					y_offset = -100
				end

				local row = math.ceil(num_unprioritized / 4)

				y_offset = y_offset + (row - 1) * -60
				widget.offset[2] = y_offset
			end
		end

		local progress, max_health_fraction
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local health_percentage = health_extension:current_health_percent()

		health_percentage = math.clamp(health_percentage, 0, 1)

		local health_max_percentage = health_extension:current_max_health_percent()

		progress = health_percentage * health_max_percentage
		max_health_fraction = health_max_percentage

		local actions = BreedActions[boss_data.breed_name]

		boss_data.freeze_healing = actions and actions.downed and actions.downed.freeze_healing and health_extension.state == "down"

		local current_raw_progress = boss_data.current_raw_progress
		local instant = false

		if progress and (current_raw_progress and current_raw_progress < progress or dirty) then
			local healing_start_progress = self._last_rendered_prioritized_unit ~= unit and progress or boss_data.healing_start_progress or boss_data.current_progress or progress
			local show_healing_effect_time = current_raw_progress and current_raw_progress < progress and t

			self:_set_healing_amount(boss_data, healing_start_progress, progress, show_healing_effect_time, dt)

			boss_data.healing_start_progress = healing_start_progress
		end

		if progress ~= boss_data.current_progress or progress ~= boss_data.current_raw_progress or max_health_fraction ~= boss_data.current_max_health_fraction or dirty then
			self:_set_bar_progress(boss_data, progress, max_health_fraction, instant, dt, t)
		end

		self:_update_healing_bar(boss_data, dt, t, boss_data.freeze_healing)
		self:_update_healing_effect(boss_data, dt, t)
		self:_set_health_edge_texture_position_progress(boss_data)

		if boss_data.prioritized then
			self._last_rendered_prioritized_unit = boss_data.unit
		end

		boss_data.dirty = false

		if widget then
			if not boss_data.prioritized and num_unprioritized > BossHealthUI.MAX_NUM_ADDITIONAL_WIDGETS then
				widget.content.visible = false
			else
				widget.content.visible = boss_data.forced or not has_forced and self:_show_boss_health_bar(boss_data)
			end
		end
	end
end

BossHealthUI._update_alive_units = function (self)
	local forced_boss_data_dirty = false
	local datas = self._detected_boss_units

	for i = #datas, 1, -1 do
		local boss_data = datas[i]

		if not HEALTH_ALIVE[boss_data.unit] then
			table.remove(datas, i)

			forced_boss_data_dirty = true
		end
	end

	return forced_boss_data_dirty
end

local update_prioritized_unit_scratch = {}

BossHealthUI._update_prioritized_unit = function (self, t)
	local datas = self._detected_boss_units
	local widgets_changed = false
	local prioritized_data
	local highest_prio = -math.huge
	local highest_prio_t = -math.huge

	for i = #datas, 1, -1 do
		local boss_data = datas[i]

		boss_data.prioritized = false

		local prio = boss_data.priority
		local prio_t = boss_data.priority_t
		local breed_name = boss_data.breed_name
		local breed = Breeds[breed_name] or PlayerBreeds[breed_name]
		local timeout_t = breed and breed.healthbar_timeout or math.huge

		if timeout_t < t - prio_t then
			table.swap_delete(datas, i)
		elseif self:_show_boss_health_bar(boss_data) then
			if highest_prio < prio then
				prioritized_data = boss_data
				highest_prio = prio
				highest_prio_t = boss_data.priority_t
			elseif prio == highest_prio and highest_prio_t < prio_t then
				prioritized_data = boss_data
				highest_prio_t = prio_t
			end
		end
	end

	if prioritized_data then
		prioritized_data.prioritized = true

		if not prioritized_data.forced and prioritized_data.widget_name ~= "prioritized_bar" then
			prioritized_data.dirty = true
			prioritized_data.widget_name = "prioritized_bar"
			widgets_changed = true
		end
	end

	local non_prioritized, n = table.filter_array(datas, function (boss_data)
		return not boss_data.prioritized and not boss_data.forced
	end, update_prioritized_unit_scratch)
	local num_additional = 0

	for i = 1, n do
		local boss_data = non_prioritized[i]
		local breed_name = boss_data.breed_name
		local breed = Breeds[breed_name] or PlayerBreeds[breed_name]
		local allow_as_additional = boss_data.show_health_bar and not breed.disallow_additional_healthbar

		if allow_as_additional then
			num_additional = num_additional + 1
		end

		local wanted_widget_name = allow_as_additional and self:_get_or_create_additional_widget_name(num_additional) or nil

		if wanted_widget_name ~= boss_data.widget_name then
			boss_data.dirty = true
			boss_data.widget_name = wanted_widget_name
			widgets_changed = true
		end
	end

	local any_forced_data_dirty = false
	local forced, forced_n = table.filter_array(datas, function (boss_data)
		return boss_data.forced
	end, update_prioritized_unit_scratch)

	for i = 1, forced_n do
		local boss_data = forced[i]
		local wanted_widget_name = self:_get_or_create_forced_widget_name(i)

		if wanted_widget_name ~= boss_data.widget_name then
			boss_data.dirty = true
			boss_data.widget_name = wanted_widget_name
			any_forced_data_dirty = true
			widgets_changed = true
		end
	end

	return widgets_changed, any_forced_data_dirty, prioritized_data
end

BossHealthUI._preemptively_hide_widgets = function (self)
	local prioritized_bar = self._widgets_by_name.prioritized_bar

	prioritized_bar.content.visible = false

	local additional_widget_names = self._additional_widget_names

	for i = 1, #additional_widget_names do
		local name = self:_get_or_create_additional_widget_name(i)
		local additional_bar = self._widgets_by_name[name]

		additional_bar.content.visible = false
	end

	local forced_widget_names = self._forced_widget_names

	for i = 1, #forced_widget_names do
		local name = self:_get_or_create_forced_widget_name(i)
		local forced_bar = self._widgets_by_name[name]

		forced_bar.content.visible = false
	end
end

BossHealthUI._set_bar_progress = function (self, boss_data, progress, max_health_fraction, instant, dt, t)
	progress = progress or 0

	local current_health_percent = boss_data.current_progress or 1
	local health_anim_progress = boss_data.healing_start_progress or current_health_percent + math.sign(progress - current_health_percent) * (dt * 0.3)

	instant = boss_data.next_update_is_instant or instant

	if instant then
		health_anim_progress = progress
	elseif current_health_percent < progress then
		health_anim_progress = math.min(health_anim_progress, progress)
	else
		health_anim_progress = math.max(health_anim_progress, progress)
	end

	max_health_fraction = max_health_fraction or 1

	local current_max_health_fraction = boss_data.current_max_health_fraction or 1
	local max_health_anim_fraction = current_max_health_fraction + math.sign(max_health_fraction - current_max_health_fraction) * (dt * 0.3)

	if instant then
		max_health_anim_fraction = max_health_fraction
	elseif current_max_health_fraction < max_health_fraction then
		max_health_anim_fraction = math.min(max_health_anim_fraction, max_health_fraction)
	else
		max_health_anim_fraction = math.max(max_health_anim_fraction, max_health_fraction)
	end

	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		local content = widget.content
		local style = widget.style
		local bar_style = style.bar
		local bar_content = content.bar
		local bar_uvs = bar_content.uvs
		local bar_size = bar_style.size
		local bar_default_size = bar_style.default_size

		bar_size[1] = bar_default_size[1] * (health_anim_progress or 1)
		bar_uvs[2][1] = health_anim_progress

		local dead_space_bar_style = style.dead_space_bar
		local dead_space_bar_content = content.dead_space_bar
		local dead_space_bar_uvs = dead_space_bar_content.uvs
		local dead_space_bar_size = dead_space_bar_style.size
		local dead_space_bar_offset = dead_space_bar_style.offset
		local dead_space_bar_default_size = dead_space_bar_style.default_size

		dead_space_bar_size[1] = dead_space_bar_default_size[1] * (1 - (max_health_anim_fraction or 1))
		dead_space_bar_uvs[1][1] = max_health_anim_fraction
		dead_space_bar_offset[1] = content.dead_space_bar_offset_reference + dead_space_bar_default_size[1] - dead_space_bar_size[1]

		local dead_space_bar_divider_style = style.dead_space_bar_divider
		local dead_space_bar_divider_offset = dead_space_bar_divider_style.offset
		local dead_space_bar_divider_default_width_offset = dead_space_bar_divider_style.default_width_offset

		dead_space_bar_divider_offset[1] = content.dead_space_bar_divider_offset_reference + (dead_space_bar_default_size[1] - dead_space_bar_divider_default_width_offset) - dead_space_bar_size[1]
		content.max_health_fraction = max_health_anim_fraction
		content.health_fraction = health_anim_progress
	end

	boss_data.current_progress = health_anim_progress
	boss_data.current_raw_progress = progress
	boss_data.current_max_health_fraction = max_health_anim_fraction
	boss_data.next_update_is_instant = nil
end

BossHealthUI._set_healing_amount = function (self, boss_data, start_progress, end_progress, time, optional_dt)
	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		local content = widget.content
		local style = widget.style
		local bar_style = style.healing_bar

		bar_style.original_color = bar_style.original_color or table.shallow_copy(bar_style.color)

		local bar_content = content.healing_bar
		local bar_size = bar_style.size
		local bar_offset = bar_style.offset
		local bar_uvs = bar_content.uvs
		local total_progress = end_progress - start_progress
		local total_bar_length = content.bar_length * total_progress
		local bar_offset_x = content.healing_bar_offset_reference + content.bar_length * start_progress

		bar_uvs[1][1] = start_progress
		bar_uvs[2][1] = end_progress

		local bar_flash_style = style.healing_bar_flash
		local lerped_color = false
		local breed_name = boss_data.breed_name
		local breed = Breeds[breed_name] or PlayerBreeds[breed_name]

		if breed then
			local lerp_color = breed.reflect_regen_reduction_in_hp_bar

			if lerp_color then
				local buff_extension = ScriptUnit.has_extension(boss_data.unit, "buff_system")

				if buff_extension then
					bar_style.flash_time = bar_style.flash_time or 0

					local flash_duration = 0.75
					local lerp_value = 1 - math.clamp01(buff_extension:apply_buffs_to_value(1, "healing_received"))

					if lerp_value ~= 0 and lerp_value ~= bar_style.last_lerp_value then
						bar_style.flash_time = flash_duration
					end

					local flash_progress = math.inv_lerp_clamped(flash_duration, 0, bar_style.flash_time)

					if flash_progress < 0.5 then
						bar_flash_style.color[1] = 200 * math.ease_out_quad(flash_progress * 2)
					elseif flash_progress < 1 then
						bar_flash_style.color[1] = 200 * math.ease_out_quad(1 - (flash_progress - 0.5) * 2)
					end

					local horizontal_scale = end_progress - start_progress

					bar_flash_style.offset[1] = bar_style.offset[1] - UIFrameSettings.boss_hp_bar_heal_flash.texture_sizes.vertical[1] * horizontal_scale
					bar_flash_style.size[1] = bar_flash_style.default_size[1] * horizontal_scale + UIFrameSettings.boss_hp_bar_heal_flash.texture_sizes.vertical[1] * 2 * horizontal_scale
					bar_style.color[1] = math.lerp(bar_style.original_color[2], 255, lerp_value)
					bar_style.color[2] = math.lerp(bar_style.original_color[2], 200, lerp_value)
					bar_style.color[3] = math.lerp(bar_style.original_color[3], 100, lerp_value)
					bar_style.color[4] = math.lerp(bar_style.original_color[4], 100, lerp_value)
					bar_style.last_lerp_value = lerp_value

					if optional_dt then
						bar_style.flash_time = math.max(bar_style.flash_time - optional_dt, 0)
					end

					lerped_color = true
				end
			end
		end

		if not lerped_color then
			bar_style.color[2] = bar_style.original_color[2]
			bar_style.color[3] = bar_style.original_color[3]
			bar_style.color[4] = bar_style.original_color[4]
			bar_style.last_lerp_value = 1
			bar_style.flash_time = 0
		end

		bar_size[1] = total_bar_length
		bar_offset[1] = bar_offset_x
	end

	if time then
		boss_data.healing_life_time = time + HEALING_MAX_LIFE_TIME
		boss_data.healing_effect_life_time = time + HEALING_EFFECT_LIFE_TIME
	end
end

BossHealthUI._update_healing_bar = function (self, boss_data, dt, t, freeze_healing)
	local healing_end_progress = boss_data.current_raw_progress
	local healing_start_progress = boss_data.healing_start_progress

	if not healing_start_progress or not healing_end_progress then
		return
	end

	local new_healing_start_progress = healing_start_progress

	if healing_end_progress <= healing_start_progress then
		new_healing_start_progress = healing_end_progress
	elseif boss_data.healing_life_time and t >= boss_data.healing_life_time and not freeze_healing then
		new_healing_start_progress = math.min(healing_start_progress + dt * 0.5, healing_end_progress)
	end

	if freeze_healing then
		local unit = boss_data.unit
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local _, _, _, min_health_percent = health_extension:respawn_thresholds()

		new_healing_start_progress = min_health_percent
	end

	self:_set_healing_amount(boss_data, new_healing_start_progress, healing_end_progress, nil, dt)

	boss_data.healing_start_progress = new_healing_start_progress

	if new_healing_start_progress == healing_end_progress then
		boss_data.healing_start_progress = nil
		boss_data.healing_life_time = nil
	end
end

BossHealthUI._set_health_edge_texture_position_progress = function (self, boss_data)
	local progress = boss_data.healing_start_progress or boss_data.current_progress or 0
	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		local content = widget.content
		local style = widget.style
		local bar_edge_style = style.bar_edge
		local bar_edge_offset = bar_edge_style.offset
		local bar_edge_default_width_offset = bar_edge_style.default_width_offset

		bar_edge_offset[1] = content.bar_edge_reference_offset + content.bar_length * progress - bar_edge_default_width_offset
		content.bar_edge_fraction = progress
	end
end

BossHealthUI._update_healing_effect = function (self, boss_data, dt, t)
	local effect_alpha = 0

	if boss_data.healing_effect_life_time then
		local time_progress = math.inv_lerp_clamped(boss_data.healing_effect_life_time - HEALING_EFFECT_LIFE_TIME, HEALING_EFFECT_LIFE_TIME, t)
		local healing_effect_progress = 1 - time_progress

		effect_alpha = 255 * math.ease_pulse(healing_effect_progress)

		if time_progress == 0 then
			boss_data.healing_effect_life_time = nil
		end
	end

	self:_set_health_effect_alpha(boss_data, effect_alpha)
end

BossHealthUI._set_health_effect_alpha = function (self, boss_data, alpha)
	local widget = self._widgets_by_name[boss_data.widget_name]

	if widget then
		local style = widget.style
		local portrait_healing_style = style.portrait_healing
		local portrait_healing_color = portrait_healing_style.color

		portrait_healing_color[1] = alpha
	end
end

BossHealthUI.rpc_register_detected_boss = function (self, channel_id, boss_unit_id)
	local unit = Managers.state.unit_storage:unit(boss_unit_id)

	if ALIVE[unit] then
		self:_event_register_boss_unit(unit, "sync")

		if Managers.state.network.is_server then
			Managers.state.network.network_transmit:send_rpc_clients_except("rpc_register_detected_boss", CHANNEL_TO_PEER_ID[channel_id], boss_unit_id)
		end
	end
end
