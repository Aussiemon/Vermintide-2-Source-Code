require("scripts/helpers/ui_atlas_helper")
require("scripts/settings/ui_frame_settings")

local FatUI = FatUI
local format = string.format
local UIAtlasHelper = UIAtlasHelper
local UIFrameSettings = UIFrameSettings

local function tab2V2(t)
	return Vector2(t[1], t[2])
end

FatUI.texture_settings = function (texture_name)
	return UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
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

FatUI.draw_texture_uv = function (texture_name, uv00, uv11, pos, size, color)
	local settings = FatUI.texture_settings(texture_name)
	uv00, uv11 = FatUILayout.sub_uv(settings.uv00, settings.uv11, uv00, uv11)

	return FatUI.draw_bitmap_uv(settings.material_name, uv00, uv11, pos, size, color)
end

FatUI.draw_frame = function (frame_style, pos, size)
	local frame_settings = UIFrameSettings[frame_style]
	local texture = frame_settings.texture
	local corner = tab2V2(frame_settings.texture_sizes.corner)
	local cx = frame_settings.texture_sizes.corner[1] / frame_settings.texture_size[1]
	local cy = frame_settings.texture_sizes.corner[2] / frame_settings.texture_size[2]
	local vert = Vector2(corner[1], size[2] - 2 * corner[2])

	FatUI.draw_texture_uv(texture, Vector2(0, cy), Vector2(cx, 1 - cy), FatUILayout.align_box(Vector2(0, 0.5), vert, pos, size), vert)
	FatUI.draw_texture_uv(texture, Vector2(1 - cx, cy), Vector2(1, 1 - cy), FatUILayout.align_box(Vector2(1, 0.5), vert, pos, size), vert)

	local horz = Vector2(size[1] - 2 * corner[1], corner[2])

	FatUI.draw_texture_uv(texture, Vector2(cx, 1 - cy), Vector2(1 - cx, 1), FatUILayout.align_box(Vector2(0.5, 0), horz, pos, size), horz)
	FatUI.draw_texture_uv(texture, Vector2(cx, 0), Vector2(1 - cx, cy), FatUILayout.align_box(Vector2(0.5, 1), horz, pos, size), horz)
	FatUI.draw_texture_uv(texture, Vector2(0, 0), Vector2(cx, cy), FatUILayout.align_box(Vector2(0, 1), corner, pos, size), corner)
	FatUI.draw_texture_uv(texture, Vector2(1 - cx, 0), Vector2(1, cy), FatUILayout.align_box(Vector2(1, 1), corner, pos, size), corner)
	FatUI.draw_texture_uv(texture, Vector2(1 - cx, 1 - cy), Vector2(1, 1), FatUILayout.align_box(Vector2(1, 0), corner, pos, size), corner)
	FatUI.draw_texture_uv(texture, Vector2(0, 1 - cy), Vector2(cx, 1), FatUILayout.align_box(Vector2(0, 0), corner, pos, size), corner)
end

FatUI.draw_default_window = function (idx, label, pos, size)
	FatUI.open_group(idx)
	FatUI.draw_texture("menu_frame_bg_01", pos, size)
	FatUI.draw_frame("menu_frame_11", pos, size)

	local header_size = Vector2(658, 60)
	local header_pos = Vector2(0, 34) + FatUILayout.align_box(Vector2(0.5, 1), Vector2(658, 60), pos, size)
	local header_bg_size = Vector2(415, 39)
	local header_bg_pos = Vector2(0, 0) + FatUILayout.align_box(Vector2(0.5, 0.5), header_bg_size, header_pos, header_size)

	FatUI.draw_texture("menu_frame_bg_02", header_bg_pos, header_bg_size)
	FatUI.draw_texture("frame_title_bg", header_pos, header_size)
	FatUI.draw_multiline_text(label, "materials/fonts/gw_head", 28, Vector2(0.5, 0.5), Vector2(0, 5) + header_pos, header_size, Colors.get("font_title"))
	FatUI.close_group()
end

FatUI.draw_default_button = function (idx, label, pos, size)
	FatUI.group_open(idx)

	local data, is_clicked = FatUI.use_behaviour("behaviour_button", "behaviour_button", pos, size)
	local state = data.state
	local pos1 = pos + Vector3(0, 0, 1)

	FatUI.draw_texture("button_bg_01", pos, size)
	FatUI.draw_texture("button_bg_fade", pos, size)

	if state == "hover" then
		FatUI.draw_texture("button_state_default", pos, size)
	end

	FatUI.draw_frame("button_frame_01", pos1, size)

	local button_detail_size = tab2V2(FatUI.texture_settings("button_detail_01").size)
	button_detail_size = button_detail_size * size[2] / button_detail_size[2]

	FatUI.draw_texture("button_detail_01", FatUILayout.align_box(Vector2(0, 0.5), button_detail_size, pos1 - Vector2(9, 0), size), button_detail_size)
	FatUI.draw_texture_uv("button_detail_01", Vector2(1, 0), Vector2(0, 1), FatUILayout.align_box(Vector2(1, 0.5), button_detail_size, pos1 + Vector2(9, 0), size), button_detail_size)
	FatUI.draw_multiline_text(label, "materials/fonts/gw_body", 24, Vector2(0.5, 0.75), pos, size, Colors.get("font_button_normal"))
	FatUI.draw_texture("button_glass_02", pos + Vector2(0, size[2] - 18), Vector2(size[1], 11))
	FatUI.draw_texture("button_glass_02", pos + Vector2(0, -2), Vector2(size[1], 11), Color(100, 255, 255, 255))
	FatUI.group_close()

	return is_clicked
end

return
