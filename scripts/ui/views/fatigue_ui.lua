local definitions = local_require("scripts/ui/views/fatigue_ui_definitions")
FatigueUI = class(FatigueUI)
FatigueUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.local_player = ingame_ui_context.player_manager:local_player()

	self.create_ui_elements(self)
	rawset(_G, "fatigue_ui", self)

	return 
end
FatigueUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local shields = {}

	for i = 1, UISettings.max_fatigue_shields, 1 do
		local shield = UIWidget.init(definitions.shield_definition)
		shields[i] = shield
	end

	self.active_shields = 0
	self.shields = shields

	return 
end
FatigueUI.destroy = function (self)
	rawset(_G, "fatigue_ui", nil)

	return 
end
FatigueUI.shield_state = function (self, shield_number, living_shields)
	local leftover = living_shields - shield_number

	if 0 <= leftover then
		return "state_1"
	elseif leftover == -0.5 then
		return "state_2"
	else
		return "state_3"
	end

	return 
end
FatigueUI.setup_hud = function (self, status_extension)
	local fatigue_points, max_fatigue_points = status_extension.current_fatigue_points(status_extension)
	local active_shields = math.floor(max_fatigue_points/2 + 0.5)
	local offset = 30
	local total_width = offset*(active_shields - 1)
	local half_width = total_width/2
	local living_shields = max_fatigue_points*0.5 - fatigue_points*0.5
	local shields = self.shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]
		local style = shield.style
		local width_offet = half_width - offset*(i - 1)
		style.offset[1] = width_offet
		style.texture_glow_id.offset[1] = width_offet
		shield.state = self.shield_state(self, i, living_shields)
		shield.content.texture_id = style.state_textures[shield.state]
	end

	self.active_shields = active_shields
	self.current_fatigue = fatigue_points
	self.max_fatigue_points = max_fatigue_points

	return 
end
FatigueUI.start_fade_in = function (self)
	local active_shields = self.active_shields
	local shields = self.shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]
		local style = shield.style
		local from = 0
		local to = 255

		UIWidget.animate(shield, UIAnimation.init(UIAnimation.function_by_time, style.color, 1, from, to, 0.2, math.easeInCubic))
		UIWidget.animate(shield, UIAnimation.init(UIAnimation.function_by_time, style.texture_glow_id.color, 1, from, to, 0.2, math.easeInCubic))
	end

	return 
end
FatigueUI.start_fade_out = function (self)
	local active_shields = self.active_shields
	local shields = self.shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]
		local style = shield.style
		local from = style.color[1]
		local to = 0

		UIWidget.animate(shield, UIAnimation.init(UIAnimation.function_by_time, style.color, 1, from, to, 0.2, math.easeInCubic))
		UIWidget.animate(shield, UIAnimation.init(UIAnimation.function_by_time, style.texture_glow_id.color, 1, from, to, 0.2, math.easeInCubic))
	end

	return 
end
FatigueUI.update = function (self, dt)
	local player = self.local_player
	local player_unit = player.player_unit
	local status_extension = ScriptUnit.extension(player_unit, "status_system")
	local should_be_active = self.check_active(self, status_extension)

	if not self.active and should_be_active then
		self.active = true

		self.setup_hud(self, status_extension)
		self.start_fade_in(self)
	elseif self.active then
		local fatigue_points, max_fatigue_points = status_extension.current_fatigue_points(status_extension)

		if fatigue_points/max_fatigue_points < 0.6 and not should_be_active then
			self.active = false

			self.start_fade_out(self)
		end
	end

	if self.active then
		self.update_shields(self, status_extension, dt)
	end

	local active_shields = self.active_shields
	local shields = self.shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]
		local style = shield.style

		if status_extension.has_bonus_fatigue_active then
			shield.content.show_glow = false
		else
			shield.content.show_glow = false
		end
	end

	self.draw(self, dt)

	return 
end
FatigueUI.check_active = function (self, status_extension)
	local active = status_extension.is_blocking(status_extension) or status_extension.show_fatigue_gui

	return active
end
FatigueUI.update_shields = function (self, status_extension, dt)
	local current_fatigue = self.current_fatigue
	local fatigue_points, max_fatigue_points = status_extension.current_fatigue_points(status_extension)

	if max_fatigue_points ~= self.max_fatigue_points then
		self.setup_hud(self, status_extension)
	end

	if fatigue_points == current_fatigue then
		return 
	end

	local living_shields = max_fatigue_points*0.5 - fatigue_points*0.5
	local active_shields = self.active_shields
	local shields = self.shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]
		local style = shield.style
		local current_state = shield.state
		local new_state = self.shield_state(self, i, living_shields)

		if current_state ~= new_state then
			local state_animations = style.state_animations[current_state]

			if state_animations and state_animations[new_state] then
				local animation_data = state_animations[new_state]

				UIWidget.animate(shield, UIAnimation.init(UIAnimation.picture_sequence, shield.content, "texture_id", animation_data.pictures, animation_data.time))
			else
				shield.content.texture_id = style.state_textures[new_state]
			end
		end

		shield.state = new_state
	end

	self.current_fatigue = fatigue_points

	return 
end
FatigueUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local shields = self.shields
	local active_shields = self.active_shields

	for i = 1, active_shields, 1 do
		local shield = shields[i]

		UIRenderer.draw_widget(ui_renderer, shield)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end

return 
