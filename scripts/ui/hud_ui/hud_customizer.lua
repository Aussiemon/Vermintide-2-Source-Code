-- chunkname: @scripts/ui/hud_ui/hud_customizer.lua

HudCustomizer = {}

local COLOR_TEXT = Colors.get_color_table_with_alpha("white", 255)
local COLOR_BACKGROUND = Colors.get_color_table_with_alpha("black", 100)
local COLOR_DEFAULT = Colors.get_color_table_with_alpha("light_sky_blue", 200)
local COLOR_HOVER = Colors.get_color_table_with_alpha("silver", 230)
local COLOR_ACTIVE = Colors.get_color_table_with_alpha("cheeseburger", 230)
local drag_active = false
local drag_hover = false
local drag_base = {
	0,
	0,
}
local offset_registry = {}

HudCustomizer.offset_registry = offset_registry

local hud_customizer_enabled = Application.user_setting("hud_customizer_enabled")

HudCustomizer.is_active = function ()
	return hud_customizer_enabled and Managers.chat.chat_gui.chat_focused and Keyboard.button(Keyboard.button_id("left alt")) > 0.5
end

HudCustomizer.reset_button = function (ui_renderer)
	if not HudCustomizer.is_active() then
		return
	end
end

HudCustomizer.run = function (ui_renderer, ui_scenegraph, customizer_data)
	if not HudCustomizer.is_active() then
		return
	end

	drag_hover = false

	local is_dirty = false
	local key = customizer_data.registry_key or customizer_data
	local offset = offset_registry[key]

	if not offset then
		offset = {
			0,
			0,
		}
		offset_registry[key] = offset
		is_dirty = true
	end

	if not customizer_data.is_child then
		local drag_node = ui_scenegraph[customizer_data.drag_scenegraph_id]

		if not drag_node then
			return
		end

		local drag_pos = Vector3(drag_node.world_position[1], drag_node.world_position[2], 999)
		local drag_size = drag_node.size
		local cursor = UIInverseScaleVectorToResolution(Mouse.axis(Mouse.axis_id("cursor")))
		local is_hover = math.point_is_inside_2d_box(cursor, drag_pos, drag_size)

		if drag_active == customizer_data then
			Debug.text("Customizing HUD component %q", customizer_data.label)
			Debug.text("[%s] = Vector2(%6.2f, %6.2f), ", customizer_data.root_scenegraph_id, offset[1], offset[2])

			if not customizer_data.lock_x then
				offset[1] = cursor[1] - drag_base[1]
			end

			if not customizer_data.lock_y then
				offset[2] = cursor[2] - drag_base[2]
			end

			if Mouse.released(Mouse.button_id("left")) then
				drag_active = false
			end
		elseif not drag_active and not drag_hover and not customizer_data.is_child and is_hover then
			drag_hover = customizer_data

			if Mouse.pressed(Mouse.button_id("left")) then
				drag_active = customizer_data
				drag_base[1] = cursor[1] - offset[1]
				drag_base[2] = cursor[2] - offset[2]
			end
		end

		local color = COLOR_DEFAULT

		if drag_active == customizer_data then
			color = COLOR_ACTIVE
		elseif drag_hover == customizer_data then
			color = COLOR_HOVER
			color[1] = 200 + 55 * math.sin(5 * Managers.time:time("ui"))
		end

		local border = customizer_data.border or 3
		local h_size = Vector2(drag_size[1], border)
		local v_size = Vector2(border, drag_size[2] - 2 * border)
		local a_size = Vector2(drag_size[1], drag_size[2])

		UIRenderer.draw_rect(ui_renderer, drag_pos, a_size, COLOR_BACKGROUND)
		UIRenderer.draw_rect(ui_renderer, drag_pos + Vector2(0, drag_size[2] - border), h_size, color)
		UIRenderer.draw_rect(ui_renderer, drag_pos, h_size, color)
		UIRenderer.draw_rect(ui_renderer, drag_pos + Vector2(0, border), v_size, color)
		UIRenderer.draw_rect(ui_renderer, drag_pos + Vector2(drag_size[1] - border, border), v_size, color)

		local sx, sy = UIRenderer.text_alignment_size(ui_renderer, customizer_data.label, "materials/fonts/arial", 18)
		local text_pos = drag_pos + 0.5 * Vector2(drag_size[1] - sx, drag_size[2] - sy)

		UIRenderer.draw_text(ui_renderer, customizer_data.label, "materials/fonts/arial", 18, nil, text_pos, COLOR_TEXT)
	end

	local root_node = ui_scenegraph[customizer_data.root_scenegraph_id]

	is_dirty = is_dirty or root_node.local_position[1] ~= offset[1] or root_node.local_position[2] ~= offset[2]

	if is_dirty then
		root_node.local_position[1] = offset[1]
		root_node.local_position[2] = offset[2]
	end

	return is_dirty
end

HudCustomizer.debug_temp = function (scenegraph, scenegraph_id)
	local l = scenegraph[scenegraph_id].local_position
	local w = scenegraph[scenegraph_id].world_position

	Debug.text("%s|local=V3(%.1f, %.1f, %.1f), world=V3(%.1f, %.1f, %.1f)", scenegraph_id, l[1], l[2], l[3], w[1], w[2], w[3])
end

if not IS_WINDOWS then
	HudCustomizer.reset_button = NOP
	HudCustomizer.run = NOP
end
