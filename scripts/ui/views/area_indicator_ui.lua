local definitions = local_require("scripts/ui/views/area_indicator_ui_definitions")
AreaIndicatorUI = class(AreaIndicatorUI)

AreaIndicatorUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	local world = ingame_ui_context.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)

	self:create_ui_elements()
	rawset(_G, "area_indicator_ui", self)
end

AreaIndicatorUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.area_text_box = UIWidget.init(definitions.widget_definitions.area_text_box)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

AreaIndicatorUI.destroy = function (self)
	rawset(_G, "area_indicator_ui", nil)
end

AreaIndicatorUI.update = function (self, dt)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local player_unit = local_player.player_unit

	if Unit.alive(player_unit) then
		local player_hud_extension = ScriptUnit.extension(player_unit, "hud_system")
		local saved_location = self.saved_location
		local current_location = player_hud_extension.current_location

		if current_location ~= nil and current_location ~= saved_location then
			self.saved_location = current_location
			local ui_settings = UISettings.area_indicator
			local widget = self.area_text_box
			widget.content.text = current_location
			self.area_text_box_animation = UIAnimation.init(UIAnimation.function_by_time, widget.style.text.text_color, 1, 0, 255, ui_settings.fade_time, math.easeInCubic, UIAnimation.wait, ui_settings.wait_time, UIAnimation.function_by_time, widget.style.text.text_color, 1, 255, 0, ui_settings.fade_time, math.easeInCubic)
			self.area_text_box_shadow_animation = UIAnimation.init(UIAnimation.function_by_time, widget.style.text_shadow.text_color, 1, 0, 255, ui_settings.fade_time, math.easeInCubic, UIAnimation.wait, ui_settings.wait_time, UIAnimation.function_by_time, widget.style.text_shadow.text_color, 1, 255, 0, ui_settings.fade_time, math.easeInCubic)

			WwiseWorld.trigger_event(self.wwise_world, "hud_area_indicator")
		end
	end

	if self.area_text_box_animation == nil then
		return
	end

	self.area_text_box_animation = self:update_animation(self.area_text_box_animation, dt)
	self.area_text_box_shadow_animation = self:update_animation(self.area_text_box_shadow_animation, dt)

	self:draw(dt)
end

AreaIndicatorUI.update_animation = function (self, animation, dt)
	if animation then
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			return nil
		end

		return animation
	end
end

AreaIndicatorUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.area_text_box)
	UIRenderer.end_pass(ui_renderer)
end

return
