local definitions = local_require("scripts/ui/hud_ui/loot_objective_ui_definitions")
local create_loot_widget = definitions.create_loot_widget
LootObjectiveUI = class(LootObjectiveUI)
local settings = {
	tome = {
		item_name = "wpn_side_objective_tome_01",
		mission_name = "tome_bonus_mission",
		total_amount = 3,
		texture = "loot_objective_icon_02"
	},
	grimoire = {
		item_name = "wpn_grimoire_01",
		mission_name = "grimoire_hidden_mission",
		total_amount = 2,
		texture = "loot_objective_icon_01"
	}
}

LootObjectiveUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.saved_mission_objectives = {}
	self.completed_mission_objectives = {}
	self.current_mission_objective = nil
	self.index_count = 0
	local mission_system = Managers.state.entity:system("mission_system")
	self._mission_system = mission_system
	self._animations = {}
	self._event_queue = {}

	self:create_ui_elements()
	rawset(_G, "loot_objective_ui", self)
end

local DO_RELOAD = true

LootObjectiveUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets_by_name = {}
	local settings_data = {}

	for key, setting in pairs(settings) do
		local mission_name = setting.mission_name
		local texture = setting.texture
		local total_amount = setting.total_amount
		local definition = create_loot_widget(texture, total_amount)
		local widget = UIWidget.init(definition)
		widgets_by_name[key] = widget
		local data = {
			name = key,
			total_amount = total_amount,
			mission_name = mission_name,
			widget = widget
		}
		settings_data[key] = data
	end

	self._settings_data = settings_data
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	DO_RELOAD = false

	self:_sync_missions(true)
end

LootObjectiveUI.destroy = function (self)
	rawset(_G, "loot_objective_ui", nil)
	GarbageLeakDetector.register_object(self, "loot_objective_ui")
end

local customizer_data = {
	root_scenegraph_id = "background",
	label = "Books",
	registry_key = "books",
	drag_scenegraph_id = "background"
}

LootObjectiveUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data)
	self:_sync_missions()

	self._active_presentation_widget = self:_update_active_presentation(dt, t)

	self:_update_animations(dt)
	self:draw(dt)
end

LootObjectiveUI._sync_missions = function (self, initialize)
	local settings_data = self._settings_data

	for _, data in pairs(settings_data) do
		local mission_name = data.mission_name
		local amount = self:_get_item_amount_by_mission_name(mission_name) or 0

		if not data.amount then
			data.amount = amount or 0
		end

		local current_amount = data.amount

		if current_amount ~= amount then
			data.previous_amount = current_amount or 0
			data.amount = amount
			local widget = data.widget

			if not initialize then
				self:_add_presentation_event(widget, data.previous_amount, amount)
			end
		end
	end
end

LootObjectiveUI._assign_amount_to_widget = function (self, widget, amount)
	widget.content.draw_count = amount
end

LootObjectiveUI._get_item_amount_by_mission_name = function (self, mission_name)
	local mission_system = self._mission_system
	local data = mission_system:get_level_end_mission_data(mission_name)
	local current_amount = data and data.current_amount

	return current_amount
end

LootObjectiveUI._add_presentation_event = function (self, widget, previous_amount, amount)
	local event_queue = self._event_queue
	local stack_count = #event_queue
	event_queue[#event_queue + 1] = {
		amount = amount,
		previous_amount = previous_amount,
		widget = widget
	}
end

LootObjectiveUI._update_active_presentation = function (self, dt, t)
	local event_queue = self._event_queue
	local stack_count = #event_queue

	if stack_count == 0 then
		return
	end

	local presentation_data = event_queue[1]
	local widget = presentation_data.widget
	local amount = presentation_data.amount
	local previous_amount = presentation_data.previous_amount

	if not presentation_data.started then
		self:_assign_amount_to_widget(widget, amount)

		presentation_data.started = true
		local life_time = 2.5
		local duration = self:_animate_in(widget, previous_amount)
		presentation_data.end_time = t + duration + life_time
	end

	if presentation_data.end_time < t then
		if not presentation_data.end_started then
			presentation_data.end_started = true
			local duration = self:_animate_out(widget)
			presentation_data.end_time = t + duration
		else
			table.remove(event_queue, 1)
		end
	end

	return widget
end

LootObjectiveUI._animate_in = function (self, widget, previous_draw_count)
	local animations = self._animations
	local target = 1
	local from = 0
	local easing = math.easeInCubic
	local func = UIAnimation.function_by_time
	local duration = 0.3
	local amount = widget.content.amount
	local draw_count = widget.content.draw_count
	local texture_colors = widget.style.icon_textures.texture_colors
	local largest_amount = math.max(previous_draw_count, draw_count)
	local amount_increased = previous_draw_count < draw_count

	for i = 1, math.min(amount, largest_amount) do
		local color = texture_colors[i]

		if not amount_increased or i < largest_amount then
			local anim = UIAnimation.init(func, color, target, from, 255, duration, easing)
			animations["icon_textures_" .. i] = anim
		end

		if i == largest_amount then
			if amount_increased then
				local anim = UIAnimation.init(UIAnimation.wait, duration + 0.2, func, color, target, from, 255, duration, easing)
				animations["icon_textures_" .. i] = anim
			else
				local anim = UIAnimation.init(UIAnimation.wait, duration + 0.5, func, color, target, 255, 0, duration, easing)
				animations["icon_textures_last" .. i] = anim
			end
		end
	end

	local background_icon_textures_color = widget.style.background_icon_textures.color
	local background_icon_textures_default_color = widget.style.background_icon_textures.default_color
	animations.background_icon_textures = UIAnimation.init(func, background_icon_textures_color, target, from, background_icon_textures_default_color[target], duration, easing)
	local glow_icon_textures_color = widget.style.glow_icon_textures.color
	local glow_icon_textures_default_color = widget.style.glow_icon_textures.default_color
	animations.glow_icon_textures = UIAnimation.init(func, glow_icon_textures_color, target, from, glow_icon_textures_default_color[target], duration, easing)
	local background_color = widget.style.background.color
	local background_default_color = widget.style.background.default_color
	animations.background = UIAnimation.init(func, background_color, target, from, background_default_color[target], duration, easing)

	return duration
end

LootObjectiveUI._animate_out = function (self, widget)
	local animations = self._animations
	local target = 1
	local to = 0
	local easing = math.easeInCubic
	local func = UIAnimation.function_by_time
	local duration = 0.3
	local amount = widget.content.amount
	local draw_count = widget.content.draw_count
	local texture_colors = widget.style.icon_textures.texture_colors

	for i = 1, amount do
		if i <= draw_count then
			local icon_duration = i == draw_count and duration + 1 or duration
			local color = texture_colors[i]
			animations["icon_textures_" .. i] = UIAnimation.init(func, color, target, 255, to, duration, easing)
		end
	end

	local background_icon_textures_color = widget.style.background_icon_textures.color
	animations.background_icon_textures = UIAnimation.init(func, background_icon_textures_color, target, background_icon_textures_color[1], to, duration, easing)
	local glow_icon_textures_color = widget.style.glow_icon_textures.color
	animations.glow_icon_textures = UIAnimation.init(func, glow_icon_textures_color, target, glow_icon_textures_color[1], to, duration, easing)
	local background_color = widget.style.background.color
	animations.background = UIAnimation.init(func, background_color, target, background_color[1], to, duration, easing)

	return duration
end

LootObjectiveUI._update_animations = function (self, dt)
	local animations = self._animations

	for anmation_name, anmation in pairs(animations) do
		UIAnimation.update(anmation, dt)

		if UIAnimation.completed(anmation) then
			animations[anmation_name] = nil
		end
	end
end

LootObjectiveUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local active_presentation_widget = self._active_presentation_widget

	if active_presentation_widget then
		UIRenderer.draw_widget(ui_renderer, active_presentation_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end
