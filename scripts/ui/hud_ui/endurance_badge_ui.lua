local definitions = local_require("scripts/ui/hud_ui/endurance_badge_ui_definitions")
local mission_names = definitions.mission_names
EnduranceBadgeUI = class(EnduranceBadgeUI)
EnduranceBadgeUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.mission_system = Managers.state.entity:system("mission_system")
	self.ui_animations = {}

	self.create_ui_elements(self)
	rawset(_G, "endurance_badge_ui", self)

	return 
end
EnduranceBadgeUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	local badge_widgets = {}

	for i = 1, #widget_definitions, 1 do
		badge_widgets[i] = UIWidget.init(widget_definitions[i])
	end

	self.badge_widgets = badge_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self.align_badge_widgets(self)

	return 
end
EnduranceBadgeUI.align_badge_widgets = function (self)
	local badge_widgets = self.badge_widgets

	if badge_widgets then
		local ui_scenegraph = self.ui_scenegraph
		local spacing = 0

		for index, widget in ipairs(badge_widgets) do
			local scenegraph_id = widget.scenegraph_id
			local widget_scenegraph = ui_scenegraph[scenegraph_id]
			local local_position = widget_scenegraph.local_position
			local_position[1] = (index - 1)*64 + (index - 1)*spacing
			widget.element.dirty = true
		end
	end

	return 
end
EnduranceBadgeUI.destroy = function (self)
	self.set_visible(self, false)
	rawset(_G, "endurance_badge_ui", nil)

	return 
end
EnduranceBadgeUI.set_visible = function (self, visible)
	local ui_renderer = self.ui_renderer
	local badge_widgets = self.badge_widgets

	if badge_widgets then
		for index, widget in ipairs(badge_widgets) do
			UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
		end
	end

	return 
end
EnduranceBadgeUI.update_mission_data = function (self, dt)
	local mission_system = self.mission_system
	local badge_widgets = self.badge_widgets

	if badge_widgets then
		for index, widget in ipairs(badge_widgets) do
			local widget_content = widget.content
			local mission_name = widget_content.mission_name
			local mission_data = mission_system.get_level_end_mission_data(mission_system, mission_name)

			if mission_data then
				local current_amount = mission_data.current_amount

				if widget_content.amount ~= current_amount then
					self.set_badge_amount(self, widget, current_amount)
				end
			end
		end
	end

	return 
end
EnduranceBadgeUI.update = function (self, dt)
	self.update_mission_data(self, dt)

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

	if not is_dirty then
		local resolution_modified = RESOLUTION_LOOKUP.modified

		if resolution_modified then
			is_dirty = true
		end
	end

	if is_dirty then
		local badge_widgets = self.badge_widgets

		if badge_widgets then
			for index, widget in ipairs(badge_widgets) do
				widget.element.dirty = true
			end
		end
	end

	self.draw(self, dt)

	return 
end
EnduranceBadgeUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local badge_widgets = self.badge_widgets

	if badge_widgets then
		for index, widget in ipairs(badge_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
EnduranceBadgeUI.set_badge_amount = function (self, widget, amount, ignore_animation)
	local scenegraph_id = widget.scenegraph_id
	local widget_style = widget.style
	local widget_content = widget.content
	local text_style = widget_style.icon_text
	local color = text_style.text_color
	color[1] = 200
	widget_content.icon_text = "x" .. amount
	widget_content.amount = amount

	if ignore_animation then
		widget.element.dirty = true
	else
		local size = self.ui_scenegraph[scenegraph_id].size
		local p1 = 2
		local p2 = 1
		local p3 = 1
		local p4 = 2
		local duration = 0.2
		self.ui_animations[scenegraph_id] = UIAnimation.init(UIAnimation.catmullrom, size, nil, 64, p1, p2, p3, p4, duration)
	end

	return 
end

return 
