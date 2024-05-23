-- chunkname: @scripts/ui/hud_ui/damage_numbers_ui.lua

local SIZE_X, SIZE_Y = 1920, 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	text_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			3,
		},
		size = {
			0,
			0,
		},
	},
	damage_text = {
		horizontal_alignment = "center",
		parent = "text_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			300,
			150,
		},
	},
}
local min_streak_font_size = GameModeSettings.versus and GameModeSettings.versus.min_streak_font_size or 50
local max_streak_font_size = GameModeSettings.versus and GameModeSettings.versus.max_streak_font_size or 100
local default_text_style = {
	font_size = 40,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1,
	},
}
local widget_definitions = {
	damage_text = UIWidgets.create_simple_text("0", "damage_text", nil, nil, default_text_style),
}

DamageNumbersUI = class(DamageNumbersUI)

DamageNumbersUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.camera = Managers.camera
	self.input_manager = ingame_ui_context.input_manager
	self._time = 0
	self._unit_text_size = 0.2
	self._unit_text_time = math.huge
	self._unit_texts = {}
	self._unit_texts_summed = {}

	local world_manager = Managers.world
	local viewport_name = "player_1"
	local world_name = "level_world"
	local world = world_manager:world(world_name)
	local viewport = ScriptWorld.viewport(world, viewport_name)

	self.camera = ScriptViewport.camera(viewport)

	self:create_ui_elements()
	Managers.state.event:register(self, "add_damage_number", "event_add_damage_number")
	Managers.state.event:register(self, "alter_damage_number", "event_alter_damage_number")

	local game_mode_settings = Managers.state.game_mode:settings()
end

DamageNumbersUI.update = function (self, dt, viewport_name)
	self._time = self._time + dt

	self:draw(dt)
end

DamageNumbersUI.event_alter_damage_number = function (self, unit, damage_number, overrides)
	if damage_number then
		damage_number.text = overrides.text
		damage_number.time = self._time + (overrides.time or self._unit_text_time)
		damage_number.starting_time = self._time
		damage_number.color = overrides.color or damage_number.color
		damage_number.color_saved = overrides.color
		damage_number.size = overrides.size or damage_number.size
		damage_number.damage = overrides.damage or damage_number.damage
	end
end

local dummy_table = {}
local SetupFuncs = {
	default = function (data, override_data, index)
		data.random_x_offset = math.random(-60, 60)
		data.random_y_offset = math.random(-60, 60)
	end,
	floating_damage = function (data, index)
		local x_range = 250
		local y_range = 200
		local x = math.random() - 0.5

		data.random_x_offset = x * x_range
		data.random_y_offset = math.sin(2 * x + math.pi * 0.5) * y_range
	end,
	critical_strike = function (data, override_data, index, unit)
		data.unit = unit
	end,
	streak_damage = function (data, override_data, index, unit)
		data.unit = unit
	end,
	floating_radial_damage = function (data, override_data, index)
		local angle = data.angle or (index - 1) * 0.5
		local radius = 150
		local floating_speed = math.random(200, 700)
		local x_angle = math.cos(angle)

		data.random_x_offset = x_angle * radius
		data.floating_speed_x = x_angle * floating_speed

		local y_angle = math.sin(angle)

		data.random_y_offset = y_angle * radius
		data.floating_speed_y = y_angle * floating_speed
	end,
}

DamageNumbersUI.event_add_damage_number = function (self, damage, size, unit, time, color, is_critical_strike, z_offset_override, override_data)
	override_data = override_data or dummy_table

	local camera_position = Camera.world_position(self.camera)
	local unit_position = Unit.world_position(unit, 0)
	local cam_to_unit_dir = Vector3.normalize(unit_position - camera_position)
	local cam_direction = Quaternion.forward(Camera.world_rotation(self.camera))
	local forward_dot = Vector3.dot(cam_direction, cam_to_unit_dir)
	local is_infront = forward_dot >= 0 and forward_dot <= 1

	if is_infront then
		size = size or 1
		color = color or Vector3(255, 255, 255)

		local update_funcs = DamageNumberVariants

		if not self._unit_texts[unit] then
			self._unit_texts[unit] = {}
		end

		local index = #self._unit_texts[unit] + 1
		local variant_name = override_data.variant_name or "default"
		local variant = DamageNumberVariants[variant_name]
		local count
		local new_text = {
			alpha = 255,
			floating_speed_x = 0,
			floating_speed_y = 150,
			random_x_offset = 0,
			random_y_offset = 0,
			size = size,
			text = damage,
			color = {
				255,
				color.x,
				color.y,
				color.z,
			},
			time = self._time + (time or self._unit_text_time),
			floating_speed = override_data.floating_speed or 150,
			starting_time = self._time,
			z_offset = z_offset_override,
			update_function = variant.update,
			complete_function = variant.complete or default_complete_function,
			start_function = variant.start,
			damage = override_data.damage,
			using_bucket_damage = override_data.using_bucket_damage,
		}

		SetupFuncs[variant_name](new_text, override_data, index, unit)

		if is_critical_strike then
			override_data.update_function = DamageNumberVariants.critical_strike.update
		end

		new_text.color_saved = new_text.color
		self._unit_texts[unit][index] = new_text

		if override_data.ref then
			override_data.ref = new_text
		end
	end
end

DamageNumbersUI.destroy = function (self)
	for unit, categories in pairs(self._unit_texts) do
		self:_destroy_unit_texts(unit)
	end

	if Managers.state.event then
		Managers.state.event:unregister("add_damage_number", self)
	end
end

DamageNumbersUI._destroy_unit_texts = function (self, unit)
	self._unit_texts[unit] = nil
end

DamageNumbersUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.damage_text = UIWidget.init(widget_definitions.damage_text)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

local pop_color = {
	255,
	255,
	240,
	240,
}

function default_complete_function(unit_text, t)
	return true
end

local function pop_the_color(color, intensity)
	local r = math.min(color[2] * intensity, 255)
	local g = math.min(color[3] * intensity, 255)
	local b = math.min(color[4] * intensity, 255)

	return {
		255,
		r,
		g,
		b,
	}
end

DamageNumberVariants = {
	default = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size

			damage_text_widget.style.text.font_size = font_size
			damage_text_widget.style.text_shadow.font_size = font_size
		end,
	},
	floating_damage = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size

			damage_text_widget.style.text.font_size = font_size
			damage_text_widget.style.text_shadow.font_size = font_size

			local x = world_to_screen_position.x * inverse_scale
			local y = world_to_screen_position.z * inverse_scale
			local offset = damage_text_widget.offset

			offset[1] = x + unit_text.random_x_offset
			offset[2] = y + unit_text.random_y_offset + ease_out_proggress * unit_text.floating_speed
		end,
	},
	critical_strike = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size
			local size_progress = math.easeOutCubic(math.min(progress * 7, 1))

			font_size = font_size + math.ease_pulse(size_progress) * 60
			damage_text_widget.style.text.font_size = font_size
			damage_text_widget.style.text_shadow.font_size = font_size
		end,
	},
	streak_damage = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size
			local x = world_to_screen_position.x * inverse_scale
			local y = world_to_screen_position.z * inverse_scale

			damage_text_widget.offset[1] = x
			damage_text_widget.offset[2] = y + 60

			local alpha = 255

			damage_text_widget.style.text.text_color[1] = alpha
			damage_text_widget.style.text_shadow.text_color[1] = alpha
		end,
		complete = function (unit_text, t, damage_text_widget)
			unit_text.update_function = DamageNumberVariants.streak_damage.pop_update
			unit_text.complete_function = DamageNumberVariants.streak_damage.pop_complete
			unit_text.time = t + 0.4
			unit_text.starting_time = t

			if unit_text.using_bucket_damage then
				local raw_damage = unit_text.damage
				local dmg_int = math.floor(raw_damage)
				local dmg_dec = raw_damage % 1 * 10

				unit_text.dmg_int = dmg_int
				unit_text.dmg_dec = dmg_dec

				local ts = math.auto_lerp(0, 30, min_streak_font_size, max_streak_font_size, raw_damage)

				unit_text.size = ts

				if dmg_dec > 0 then
					unit_text.text = "{#size(" .. ts .. ")}" .. dmg_int .. "{#size(" .. math.floor(ts / 2) .. ")}" .. dmg_dec
				end
			end

			return false
		end,
		pop_update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size

			damage_text_widget.style.text.font_size = font_size

			local ts = font_size + (35 * math.sin(progress * math.pi - math.pi * 2) + 0)
			local dmg_int = unit_text.dmg_int
			local dmg_dec = unit_text.dmg_dec

			if dmg_dec > 0 then
				unit_text.text = "{#size(" .. ts .. ")}" .. dmg_int .. "{#size(" .. math.floor(ts / 2) .. ")}" .. dmg_dec
			else
				unit_text.text = "{#size(" .. ts .. ")}" .. dmg_int
			end

			local alpha = 255

			damage_text_widget.style.text.text_color[1] = alpha
			damage_text_widget.style.text_shadow.text_color[1] = alpha

			local x = world_to_screen_position.x * inverse_scale
			local y = world_to_screen_position.z * inverse_scale

			damage_text_widget.offset[1] = x
			damage_text_widget.offset[2] = y + 60
		end,
		pop_complete = function (unit_text, t, damage_text_widget)
			unit_text.update_function = DamageNumberVariants.streak_damage_fadeout.update
			unit_text.complete_function = default_complete_function
			unit_text.time = t + 5
			unit_text.starting_time = t
			unit_text.floating_speed = 165

			if unit_text.using_bucket_damage then
				local raw_damage = unit_text.damage
				local dmg_int = math.floor(raw_damage)
				local dmg_dec = raw_damage % 1 * 10

				if dmg_dec > 0 then
					local ts = math.auto_lerp(0, 30, min_streak_font_size, max_streak_font_size, raw_damage)

					unit_text.text = "{#size(" .. ts .. ")}" .. dmg_int .. "{#size(" .. math.floor(ts / 2) .. ")}" .. dmg_dec
				end
			end

			return false
		end,
	},
	streak_damage_fadeout = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			damage_text_widget.style.text.text_color = unit_text.color

			local font_size = unit_text.size

			damage_text_widget.style.text.font_size = font_size
			damage_text_widget.style.text_shadow.font_size = font_size

			local x = world_to_screen_position.x * inverse_scale
			local y = world_to_screen_position.z * inverse_scale

			damage_text_widget.offset[1] = x
			damage_text_widget.offset[2] = y + 60 + ease_out_proggress * unit_text.floating_speed

			Debug.text("STREAK-DAMAGE-FADEOUT %s, %s, %s", x, y, font_size)
		end,
	},
	floating_radial_damage = {
		update = function (unit_text, t, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
			local font_size = unit_text.size

			damage_text_widget.style.text.font_size = font_size
			damage_text_widget.style.text_shadow.font_size = font_size

			local x = world_to_screen_position.x * inverse_scale
			local y = world_to_screen_position.z * inverse_scale

			damage_text_widget.offset[1] = x + ease_out_proggress * unit_text.floating_speed_x
			damage_text_widget.offset[2] = y + ease_out_proggress * unit_text.floating_speed_y

			if progress > 0.5 then
				local alpha = damage_text_widget.style.text.text_color[1]

				alpha = alpha * 0.99
				damage_text_widget.style.text.text_color[1] = alpha
				damage_text_widget.style.text_shadow.text_color[1] = alpha
			end
		end,
	},
}

DamageNumbersUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	local damage_text_widget = self.damage_text
	local damage_text_content = damage_text_widget.content
	local damage_text_offset = damage_text_widget.offset
	local world_to_screen = Camera.world_to_screen
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	local World_position = Unit.world_position
	local easeOutCubic = math.easeOutCubic
	local camera = self.camera

	for unit, unit_texts in pairs(self._unit_texts) do
		if Unit.alive(unit) then
			local world_position = World_position(unit, 0)
			local z_offset = unit_texts[1] and unit_texts[1].z_offset or 1.85

			world_position[3] = world_position[3] + z_offset

			local world_to_screen_position = world_to_screen(camera, world_position)

			for i = #unit_texts, 1, -1 do
				local unit_text = unit_texts[i]

				if self._time > unit_text.time and unit_text.complete_function(unit_text, self._time, damage_text_widget) then
					table.swap_delete(unit_texts, i)
				else
					local text = unit_text.text
					local floating_lerp = unit_text.floating_lerp
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

					unit_text.update_function(unit_text, self._time, damage_text_widget, inverse_scale, world_to_screen_position, progress, ease_out_proggress)
					UIRenderer.draw_widget(ui_renderer, damage_text_widget)
				end
			end
		else
			self:_destroy_unit_texts(unit)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end
