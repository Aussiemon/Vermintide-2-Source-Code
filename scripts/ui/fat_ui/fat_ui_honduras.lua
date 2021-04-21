require("scripts/helpers/ui_atlas_helper")
require("scripts/settings/ui_frame_settings")

local format = string.format
local V2 = Vector2
local V3 = Vector3
local CC = Color
local FatUI = FatUI
local tab2V2 = FatUI.tab2V2
local Colors = Colors
local UIAtlasHelper = UIAtlasHelper
local UIFrameSettings = UIFrameSettings

FatUI.texture_settings = function (texture_name)
	return UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
end

FatUI.texture_size = function (texture_name)
	return tab2V2(UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name).size)
end

FatUI.material_for_texture = function (atlas_settings, masked, saturated, point_sample)
	local key = string.format("%s%s%s%smaterial_name", (masked and "masked_") or "", (saturated and "saturated_") or "", (point_sample and "point_sample_") or "")

	return atlas_settings[key]
end

FatUI.draw_texture = function (texture_name, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	size = size or tab2V2(settings.size)

	return FatUI.draw_bitmap_uv(settings.material_name, tab2V2(settings.uv00), tab2V2(settings.uv11), pos, size, color)
end

FatUI.draw_texture_saturated = function (texture_name, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	size = size or tab2V2(settings.size)

	return FatUI.draw_bitmap_uv(settings.saturated_material_name, tab2V2(settings.uv00), tab2V2(settings.uv11), pos, size, color)
end

FatUI.draw_texture_aligned = function (texture_name, align, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	local tex_size = tab2V2(settings.size)
	local tex_pos = FatUILayout.align_box(align, tex_size, pos, size)

	return FatUI.draw_bitmap_uv(settings.material_name, tab2V2(settings.uv00), tab2V2(settings.uv11), tex_pos, tex_size, color)
end

FatUI.draw_rotated_texture = function (texture_name, pivot, angle, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	size = size or tab2V2(settings.size)

	return FatUI.draw_bitmap_uv(settings.material_name, tab2V2(settings.uv00), tab2V2(settings.uv11), pos, size, color)
end

FatUI.draw_texture_uv = function (texture_name, uv00, uv11, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	uv00, uv11 = FatUILayout.sub_uv(settings.uv00, settings.uv11, uv00, uv11)

	return FatUI.draw_bitmap_uv(settings.material_name, uv00, uv11, pos, size, color)
end

FatUI.draw_frame = function (frame_style, pos, size, color)
	local frame_settings = UIFrameSettings[frame_style]
	local texture = frame_settings.texture
	local corner = tab2V2(frame_settings.texture_sizes.corner)
	local cx = frame_settings.texture_sizes.corner[1] / frame_settings.texture_size[1]
	local cy = frame_settings.texture_sizes.corner[2] / frame_settings.texture_size[2]
	local vert = V2(corner[1], size[2] - 2 * corner[2])

	FatUI.draw_texture_uv(texture, V2(0, cy), V2(cx, 1 - cy), FatUILayout.align_box(V2(0, 0.5), vert, pos, size), vert, color)
	FatUI.draw_texture_uv(texture, V2(1 - cx, cy), V2(1, 1 - cy), FatUILayout.align_box(V2(1, 0.5), vert, pos, size), vert, color)

	local horz = V2(size[1] - 2 * corner[1], corner[2])

	FatUI.draw_texture_uv(texture, V2(cx, 1 - cy), V2(1 - cx, 1), FatUILayout.align_box(V2(0.5, 0), horz, pos, size), horz, color)
	FatUI.draw_texture_uv(texture, V2(cx, 0), V2(1 - cx, cy), FatUILayout.align_box(V2(0.5, 1), horz, pos, size), horz, color)
	FatUI.draw_texture_uv(texture, V2(0, 0), V2(cx, cy), FatUILayout.align_box(V2(0, 1), corner, pos, size), corner, color)
	FatUI.draw_texture_uv(texture, V2(1 - cx, 0), V2(1, cy), FatUILayout.align_box(V2(1, 1), corner, pos, size), corner, color)
	FatUI.draw_texture_uv(texture, V2(1 - cx, 1 - cy), V2(1, 1), FatUILayout.align_box(V2(1, 0), corner, pos, size), corner, color)
	FatUI.draw_texture_uv(texture, V2(0, 1 - cy), V2(cx, 1), FatUILayout.align_box(V2(0, 0), corner, pos, size), corner, color)
end

FatUI.draw_default_window = function (idx, label, pos, size)
	FatUI.begin_group(idx)
	FatUI.draw_texture("menu_frame_bg_01", pos, size)
	FatUI.draw_frame("menu_frame_11", pos, size)

	local header_size = V2(658, 60)
	local header_pos = V2(0, 34) + FatUILayout.align_box(V2(0.5, 1), V2(658, 60), pos, size)
	local header_bg_size = V2(415, 39)
	local header_bg_pos = V2(0, 0) + FatUILayout.align_box(V2(0.5, 0.5), header_bg_size, header_pos, header_size)

	FatUI.draw_texture("menu_frame_bg_02", header_bg_pos, header_bg_size)
	FatUI.draw_texture("frame_title_bg", header_pos, header_size)
	FatUI.draw_text_multiline(label, "materials/fonts/gw_head", 28, V2(0.5, 0.5), V2(0, 5, 1) + header_pos, header_size, Colors.get("font_title"))
	FatUI.close_group()
end

FatUI.draw_gamepad_input_texture = function (input_service, input)
	local keymap_binding = input_service:get_keymapping(input)
	local key_index = (keymap_binding and keymap_binding[2]) or UNASSIGNED_KEY
	local button_name = Pad1.button_name(key_index)
	local button_data = FatUI.gamepad_input_texture_data(button_name)
	local icon_size = tab2V2(button_data.size)
	local icon_pos = FatUILayout.align_box(FatUILayout.CENTER, icon_size, pos, size)

	FatUI.draw_texture(button_data.texture, icon_pos, icon_size)
end

FatUI.draw_default_button = function (idx, label, pos, size)
	FatUI.begin_group(idx)

	local data, is_clicked = FatUI.use_behaviour("behaviour_button", "behaviour_button", pos, size)
	local state = data.state
	local pos1 = pos + V3(0, 0, 1)

	FatUI.draw_texture("button_bg_01", pos, size)
	FatUI.draw_texture("button_bg_fade", pos, size)

	if state == "hover" or state == "warm" then
		FatUI.draw_texture("button_state_default", pos, size)
	end

	FatUI.draw_frame("button_frame_01", pos1, size)

	local button_detail_size = tab2V2(FatUI.texture_settings("button_detail_01").size)
	button_detail_size = button_detail_size * size[2] / button_detail_size[2]

	FatUI.draw_texture("button_detail_01", FatUILayout.align_box(V2(0, 0.5), button_detail_size, pos1 - V2(9, 0), size), button_detail_size)
	FatUI.draw_texture_uv("button_detail_01", V2(1, 0), V2(0, 1), FatUILayout.align_box(V2(1, 0.5), button_detail_size, pos1 + V2(9, 0), size), button_detail_size)

	local text_color = nil

	if state == "hot" or state == "warm" then
		text_color = Color(255, 255, 255)
	elseif state == "disabled" then
		text_color = Color(255, 100, 100, 100)
	else
		text_color = Colors.get("font_button_normal")
	end

	FatUI.draw_text_multiline(label, "materials/fonts/gw_body", 24, V2(0.5, 0.75), pos + V3(0, 0, 2), size - V2(0, 10), text_color)
	FatUI.draw_texture("button_glass_02", pos + V2(0, size[2] - 18), V2(size[1], 11))
	FatUI.draw_texture("button_glass_02", pos + V2(0, -2), V2(size[1], 11), CC(100, 255, 255, 255))

	if is_clicked then
		FatUI.play_sound("play_gui_start_menu_button_click")
	end

	FatUI.close_group()

	return is_clicked, data
end

FatUI.draw_gamepad_button = function (idx, label, input_service, input, pos, size)
	local keymap_binding = input_service:get_keymapping(input)
	local key_index = (keymap_binding and keymap_binding[2]) or UNASSIGNED_KEY
	local button_name = Pad1.button_name(key_index)

	FatUI.draw_rect(pos, size, Color(230, 0, 0, 0))

	local button_data = FatUI.gamepad_input_texture_data(button_name)
	local icon_size = tab2V2(button_data.size)
	local icon_pos = Vector2(20, 0, 0) + FatUILayout.align_box(FatUILayout.WEST, icon_size, pos, size)

	FatUI.draw_texture(button_data.texture, icon_pos, icon_size)
	FatUI.draw_text_multiline(label, "materials/fonts/gw_body", 24, V2(0.5, 0.75), pos + V3(0, 0, 2), size - V2(0, 10))

	return input_service:get(input, true)
end

FatUI.draw_generic_button = function (idx, label, input_service, input, pos, size)
	if FatUI.gamepad_type then
		return FatUI.draw_gamepad_button(idx, label, input_service, input, pos, size)
	else
		return FatUI.draw_default_button(idx, label, pos, size)
	end
end

return
