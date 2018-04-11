local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	text_root = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			3
		},
		size = {
			0,
			0
		}
	},
	damage_text = {
		vertical_alignment = "center",
		parent = "text_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			300,
			150
		}
	}
}
local default_text_style = {
	word_wrap = false,
	font_size = 40,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local widget_definitions = {
	damage_text = UIWidgets.create_simple_text("0", "damage_text", nil, nil, default_text_style)
}
DamageNumbersUI = class(DamageNumbersUI)
DamageNumbersUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.camera = Managers.camera
	self.input_manager = ingame_ui_context.input_manager
	self._time = 0
	self._unit_text_size = 0.2
	self._unit_text_time = math.huge
	self._unit_texts = {}
	local world_manager = Managers.world
	local viewport_name = "player_1"
	local world_name = "level_world"
	local world = world_manager.world(world_manager, world_name)
	local viewport = ScriptWorld.viewport(world, viewport_name)
	self.camera = ScriptViewport.camera(viewport)

	self.create_ui_elements(self)
	Managers.state.event:register(self, "add_damage_number", "event_add_damage_number")

	return 
end
DamageNumbersUI.update = function (self, dt, viewport_name)
	self._time = self._time + dt

	self.draw(self, dt)

	return 
end
DamageNumbersUI.event_add_damage_number = function (self, damage, size, unit, time, color, is_critical_strike)
	local size = size or 1
	local color = color or Vector3(255, 255, 255)
	local new_text = {
		floating_speed = 150,
		alpha = 255,
		size = size,
		text = damage * 100,
		color = {
			255,
			color.x,
			color.y,
			color.z
		},
		time = self._time + (time or self._unit_text_time),
		starting_time = self._time,
		random_x_offset = math.random(-40, 40),
		random_y_offset = math.random(-40, 40),
		is_critical_strike = is_critical_strike
	}
	self._unit_texts[unit] = self._unit_texts[unit] or {}
	self._unit_texts[unit][#self._unit_texts[unit] + 1] = new_text

	return 
end
DamageNumbersUI.destroy = function (self)
	for unit, categories in pairs(self._unit_texts) do
		self._destroy_unit_texts(self, unit)
	end

	if Managers.state.event then
		Managers.state.event:unregister("add_damage_number", self)
	end

	return 
end
DamageNumbersUI._destroy_unit_texts = function (self, unit)
	self._unit_texts[unit] = nil

	return 
end
DamageNumbersUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.damage_text = UIWidget.init(widget_definitions.damage_text)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	return 
end
DamageNumbersUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local damage_text_widget = self.damage_text
	local damage_text_content = damage_text_widget.content
	local damage_text_offset = damage_text_widget.offset
	local world_to_screen = Camera.world_to_screen
	local z_offset = 1.85
	local z_offset_dps = 0.4
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	local World_position = Unit.world_position
	local easeOutCubic = math.easeOutCubic
	local camera = self.camera

	for unit, unit_texts in pairs(self._unit_texts) do
		if Unit.alive(unit) then
			local world_position = World_position(unit, 0)
			world_position[3] = world_position[3] + z_offset
			local world_to_screen_position = world_to_screen(camera, world_position)

			for i, unit_text in ipairs(unit_texts) do
				if unit_text.time < self._time then
					table.remove(unit_texts, i)
				else
					local text = unit_text.text
					local floating_lerp = unit_text.floating_lerp
					local is_critical_strike = unit_text.is_critical_strike
					local time_left = unit_text.time - self._time
					local total_time = unit_text.time - unit_text.starting_time
					local inv_progress = time_left / total_time
					local progress = 1 - inv_progress
					local ease_out_proggress = easeOutCubic(progress)
					local x = world_to_screen_position.x * inverse_scale
					local y = world_to_screen_position.z * inverse_scale
					damage_text_offset[1] = x + unit_text.random_x_offset
					damage_text_offset[2] = y + unit_text.random_y_offset + ease_out_proggress * unit_text.floating_speed
					local alpha = (1 - ease_out_proggress) * 255
					damage_text_content.text = text
					damage_text_widget.style.text.text_color = unit_text.color
					damage_text_widget.style.text.text_color[1] = alpha
					damage_text_widget.style.text_shadow.text_color[1] = alpha
					local font_size = unit_text.size

					if is_critical_strike then
						local size_progress = easeOutCubic(math.min(progress * 10, 1))
						font_size = font_size + math.ease_pulse(size_progress) * 30
					end

					damage_text_widget.style.text.font_size = font_size
					damage_text_widget.style.text_shadow.font_size = font_size

					UIRenderer.draw_widget(ui_renderer, damage_text_widget)
				end
			end
		else
			self._destroy_unit_texts(self, unit)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end

return 
