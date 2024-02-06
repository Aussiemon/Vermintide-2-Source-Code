-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_weave_properties_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local small_window_size = window_default_settings.size
local small_window_spacing = window_default_settings.spacing
local large_window_frame = window_default_settings.large_window_frame
local large_window_frame_width = UIFrameSettings[large_window_frame].texture_sizes.vertical[1]
local inner_window_size = {
	small_window_size[1] * 3 + small_window_spacing * 2 + large_window_frame_width * 2,
	small_window_size[2] + 80,
}
local window_size = {
	inner_window_size[1] + 50,
	inner_window_size[2],
}
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_default_settings = UISettings.game_start_windows
local options_mask_offset = 85
local options_mask_margin = 85

window_frame_width = 0
window_size = {
	1920,
	1080,
}

local scrollbar_size = {
	16,
	window_size[2] - (window_frame_width * 2 + 220),
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	screen_center = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen_center",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	window_overlay = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			5,
		},
	},
	viewport = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			window_size[1] - window_frame_width * 2,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			0,
			window_frame_width,
			3,
		},
	},
	viewport_button = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			560,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			window_frame_width,
			window_frame_width,
			3,
		},
	},
	viewport_background = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			300,
			window_size[2] - window_frame_width * 2,
		},
		position = {
			window_frame_width,
			window_frame_width,
			2,
		},
	},
	viewport_background_fade = {
		horizontal_alignment = "right",
		parent = "viewport_background",
		vertical_alignment = "bottom",
		size = {
			window_size[2] - window_frame_width * 2,
			300,
		},
		position = {
			-2,
			0,
			0,
		},
	},
	viewport_panel = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			450,
			100,
		},
		position = {
			-545,
			90,
			3,
		},
	},
	viewport_panel_divider = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			68,
			19,
		},
		position = {
			0,
			0,
			1,
		},
	},
	viewport_panel_divider_left = {
		horizontal_alignment = "left",
		parent = "viewport_panel_divider",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			-166,
			0,
			0,
		},
	},
	viewport_panel_divider_right = {
		horizontal_alignment = "right",
		parent = "viewport_panel_divider",
		vertical_alignment = "center",
		size = {
			55,
			19,
		},
		position = {
			166,
			0,
			0,
		},
	},
	viewport_title = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			130,
			3,
		},
	},
	viewport_sub_title = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			450,
			50,
		},
		position = {
			0,
			100,
			3,
		},
	},
	panel_level_title = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			60,
			2,
		},
	},
	panel_level_value = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			-90,
			30,
			2,
		},
	},
	panel_power_title = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			60,
			2,
		},
	},
	panel_power_value = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "top",
		size = {
			110,
			20,
		},
		position = {
			90,
			30,
			2,
		},
	},
	bottom_left_corner = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			110,
			110,
		},
		position = {
			window_frame_width,
			window_frame_width,
			12,
		},
	},
	upgrade_button = {
		horizontal_alignment = "center",
		parent = "viewport_panel",
		vertical_alignment = "bottom",
		size = {
			452,
			112,
		},
		position = {
			0,
			0,
			2,
		},
	},
	upgrade_essence_warning = {
		horizontal_alignment = "center",
		parent = "upgrade_button",
		vertical_alignment = "bottom",
		size = {
			296,
			30,
		},
		position = {
			3,
			-10,
			3,
		},
	},
	slot_root = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-180,
			0,
			0,
		},
	},
	slot_cluster = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			273,
			273,
		},
		position = {
			0,
			0,
			4,
		},
	},
	mastery_text = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			430,
			50,
		},
		position = {
			0,
			0,
			10,
		},
	},
	mastery_tooltip = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			160,
			160,
		},
		position = {
			0,
			0,
			10,
		},
	},
	mastery_title_text = {
		horizontal_alignment = "center",
		parent = "mastery_text",
		vertical_alignment = "center",
		size = {
			430,
			50,
		},
		position = {
			0,
			40,
			0,
		},
	},
	mastery_icon = {
		horizontal_alignment = "center",
		parent = "mastery_text",
		vertical_alignment = "center",
		size = {
			55,
			55,
		},
		position = {
			0,
			-45,
			0,
		},
	},
	background_wheel = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			1022,
			1022,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wheel_ring_1 = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			188,
			188,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wheel_ring_2 = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			461,
			461,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wheel_ring_3 = {
		horizontal_alignment = "center",
		parent = "slot_root",
		vertical_alignment = "center",
		size = {
			1074,
			1074,
		},
		position = {
			0,
			0,
			1,
		},
	},
	options_background_mask = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			900,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	options_background = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			900,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	options_window_edge = {
		horizontal_alignment = "right",
		parent = "options_background",
		vertical_alignment = "center",
		size = {
			0,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	options_scroll_field = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			520,
			886,
		},
		position = {
			0,
			0,
			20,
		},
	},
	title_background = {
		horizontal_alignment = "right",
		parent = "options_window_edge",
		vertical_alignment = "top",
		size = {
			576,
			111,
		},
		position = {
			-window_frame_width,
			-window_frame_width,
			10,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "title_background",
		vertical_alignment = "top",
		size = {
			320,
			30,
		},
		position = {
			3,
			-5,
			1,
		},
	},
	sub_title_text = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			320,
			30,
		},
		position = {
			0,
			-31,
			0,
		},
	},
	clear_background = {
		horizontal_alignment = "right",
		parent = "options_window_edge",
		vertical_alignment = "bottom",
		size = {
			576,
			111,
		},
		position = {
			-window_frame_width,
			window_frame_width,
			10,
		},
	},
	clear_button = {
		horizontal_alignment = "center",
		parent = "clear_background",
		vertical_alignment = "bottom",
		size = {
			300,
			60,
		},
		position = {
			0,
			5,
			1,
		},
	},
	options_list_scrollbar = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = scrollbar_size,
		position = {
			-(window_frame_width + 20),
			0,
			10,
		},
	},
	options_background_edge = {
		horizontal_alignment = "right",
		parent = "options_window_edge",
		vertical_alignment = "center",
		size = {
			126,
			1080,
		},
		position = {
			-443,
			0,
			1,
		},
	},
	options_root = {
		horizontal_alignment = "right",
		parent = "options_background_edge",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	option_trait = {
		horizontal_alignment = "left",
		parent = "options_root",
		vertical_alignment = "center",
		size = {
			378,
			194,
		},
		position = {
			6,
			0,
			0,
		},
	},
	option_talent = {
		horizontal_alignment = "left",
		parent = "options_root",
		vertical_alignment = "center",
		size = {
			377,
			230,
		},
		position = {
			6,
			0,
			0,
		},
	},
	option_propery = {
		horizontal_alignment = "left",
		parent = "options_root",
		vertical_alignment = "center",
		size = {
			381,
			124,
		},
		position = {
			6,
			0,
			0,
		},
	},
	upgrade_bg = {
		horizontal_alignment = "center",
		parent = "upgrade_button",
		vertical_alignment = "center",
		size = {
			900,
			400,
		},
		position = {
			0,
			410,
			11,
		},
	},
	upgrade_text = {
		horizontal_alignment = "center",
		parent = "upgrade_button",
		vertical_alignment = "center",
		size = {
			500,
			50,
		},
		position = {
			0,
			400,
			12,
		},
	},
}
local upgrade_title_style = {
	dynamic_font_size = true,
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = false,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = {
		180,
		0,
		0,
		0,
	},
	offset = {
		0,
		0,
		2,
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header_masked",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark_header_masked",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		0,
		2,
	},
}
local mastery_text_style = {
	font_size = 58,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		121,
		193,
		229,
	},
	offset = {
		0,
		0,
		2,
	},
}
local mastery_title_text_style = {
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		121,
		193,
		229,
	},
	offset = {
		0,
		0,
		2,
	},
}
local upgrade_essence_text_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		2,
		2,
	},
}
local upgrade_essence_warning_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		2,
		2,
	},
}
local panel_value_title_style = {
	dynamic_font_size = true,
	font_size = 18,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		0,
		2,
	},
}
local panel_value_text_style = {
	dynamic_font_size = true,
	font_size = 38,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local viewport_title_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local viewport_sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_property_slot_definition(scenegraph_id, size, masked)
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "icon",
		},
		{
			additional_option_id = "tooltip",
			pass_type = "additional_option_tooltip",
			style_id = "tooltip",
			content_passes = {
				"weave_progression_slot_titles",
			},
			content_check_function = function (content)
				return content.tooltip and content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.icon and not content.highlight
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_highlight",
			texture_id = "icon",
			content_check_function = function (content)
				return content.icon and content.highlight and not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "slot",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "slot_locked",
			texture_id = "slot_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "fill_effect",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "highlight_texture",
			texture_id = "highlight_texture",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "new_effect",
			texture_id = "highlight_texture",
			content_change_function = function (content, style, _, dt)
				local new_effect_timer = content.new_effect_timer

				if new_effect_timer then
					local duration = 1

					new_effect_timer = math.min(new_effect_timer + dt, duration)

					local progress = new_effect_timer / duration
					local anim_progress = math.easeInCubic(progress)
					local pulse_progress = math.ease_pulse(progress)
					local texture_size = style.texture_size
					local default_texture_size = style.default_texture_size

					texture_size[1] = default_texture_size[1] + default_texture_size[1] * anim_progress
					texture_size[2] = default_texture_size[2] + default_texture_size[2] * anim_progress
					style.color[1] = 255 * pulse_progress

					if progress == 1 then
						content.new_effect_timer = nil
					else
						content.new_effect_timer = new_effect_timer
					end
				end
			end,
			content_check_function = function (content)
				return content.new_effect_timer
			end,
		},
	}
	local content = {
		highlight_texture = "athanor_skilltree_slot_property_active",
		hover = "athanor_skilltree_slot_property_hover",
		slot = "athanor_skilltree_slot_property_unlocked",
		slot_locked = "athanor_skilltree_slot_property_locked",
		text = "-",
		button_hotspot = {},
		size = size,
	}
	local style = {
		tooltip = {
			horizontal_alignment = "center",
			max_width = 300,
			vertical_alignment = "top",
			offset = {
				0,
				size[2] / 2,
				0,
			},
		},
		icon = {
			masked = masked,
			color = {
				255,
				143,
				216,
				255,
			},
			offset = {
				-size[1] / 2,
				-size[2] / 2,
				3,
			},
			size = size,
		},
		icon_highlight = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-size[1] / 2,
				-size[2] / 2,
				3,
			},
			size = size,
		},
		slot = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-35,
				-35,
				2,
			},
			size = {
				70,
				70,
			},
		},
		slot_locked = {
			masked = masked,
			color = {
				255,
				120,
				120,
				120,
			},
			default_color = {
				255,
				120,
				120,
				120,
			},
			hover_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-35,
				-35,
				2,
			},
			size = {
				70,
				70,
			},
		},
		fill_effect = {
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			default_offset = {
				-35,
				-35,
				2,
			},
			default_size = {
				70,
				70,
			},
			offset = {
				-35,
				-35,
				1,
			},
			size = {
				70,
				70,
			},
		},
		hover = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				5,
			},
			size = {
				128,
				128,
			},
		},
		highlight_texture = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				4,
			},
			size = {
				128,
				128,
			},
		},
		new_effect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				128,
				128,
			},
			default_texture_size = {
				128,
				128,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		text = {
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-size[1] / 2,
				-size[2] / 2,
				5,
			},
			size = size,
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_talent_slot_definition(scenegraph_id, size, masked)
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "icon",
		},
		{
			pass_type = "texture",
			style_id = "slot",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "slot_locked",
			texture_id = "slot_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "fill_effect",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.icon
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_mask",
			texture_id = "icon_mask",
			content_check_function = function (content)
				return content.icon
			end,
		},
		{
			additional_option_id = "tooltip",
			pass_type = "additional_option_tooltip",
			style_id = "tooltip",
			content_passes = {
				"weave_progression_slot_titles",
			},
			content_check_function = function (content)
				return content.tooltip and content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text",
			content_check_function = function (content)
				return not content.locked and not content.icon
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "highlight_texture",
			texture_id = "highlight_texture",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "new_effect",
			texture_id = "highlight_texture",
			content_change_function = function (content, style, _, dt)
				local new_effect_timer = content.new_effect_timer

				if new_effect_timer then
					local duration = 1

					new_effect_timer = math.min(new_effect_timer + dt, duration)

					local progress = new_effect_timer / duration
					local anim_progress = math.easeInCubic(progress)
					local pulse_progress = math.ease_pulse(progress)
					local texture_size = style.texture_size
					local default_texture_size = style.default_texture_size

					texture_size[1] = default_texture_size[1] + default_texture_size[1] * anim_progress
					texture_size[2] = default_texture_size[2] + default_texture_size[2] * anim_progress
					style.color[1] = 255 * pulse_progress

					if progress == 1 then
						content.new_effect_timer = nil
					else
						content.new_effect_timer = new_effect_timer
					end
				end
			end,
		},
	}
	local content = {
		highlight_texture = "athanor_skilltree_slot_talent_active",
		hover = "athanor_skilltree_slot_talent_hover",
		icon_mask = "mask_circular",
		slot = "athanor_skilltree_slot_talent",
		slot_locked = "athanor_skilltree_slot_talent_locked",
		text = "",
		button_hotspot = {},
		size = size,
	}
	local style = {
		tooltip = {
			horizontal_alignment = "center",
			max_width = 300,
			vertical_alignment = "top",
			offset = {
				0,
				size[2] / 2,
				0,
			},
		},
		icon_mask = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-35,
				-35,
				3,
			},
			size = {
				70,
				70,
			},
		},
		icon = {
			masked = true,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-40,
				-40,
				3,
			},
			size = {
				80,
				80,
			},
		},
		slot = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-50,
				-50,
				2,
			},
			size = {
				100,
				100,
			},
		},
		slot_locked = {
			masked = masked,
			color = {
				255,
				120,
				120,
				120,
			},
			default_color = {
				255,
				120,
				120,
				120,
			},
			hover_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				2,
			},
			size = {
				128,
				128,
			},
		},
		fill_effect = {
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			default_offset = {
				-50,
				-50,
				2,
			},
			default_size = {
				100,
				100,
			},
			offset = {
				-50,
				-50,
				1,
			},
			size = {
				100,
				100,
			},
		},
		hover = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				5,
			},
			size = {
				128,
				128,
			},
		},
		highlight_texture = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				4,
			},
			size = {
				128,
				128,
			},
		},
		new_effect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				128,
				128,
			},
			default_texture_size = {
				128,
				128,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		text = {
			font_size = 38,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				87,
				39,
				141,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-size[1] / 2,
				-size[2] / 2 + 14,
				3,
			},
			size = size,
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_trait_slot_definition(scenegraph_id, size, masked)
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "icon",
		},
		{
			additional_option_id = "tooltip",
			pass_type = "additional_option_tooltip",
			style_id = "tooltip",
			content_passes = {
				"weave_progression_slot_titles",
			},
			content_check_function = function (content)
				return content.tooltip and content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "slot",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "slot_locked",
			texture_id = "slot_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "fill_effect",
			texture_id = "slot",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.icon
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_mask",
			texture_id = "icon_mask",
			content_check_function = function (content)
				return content.icon
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "highlight_texture",
			texture_id = "highlight_texture",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "new_effect",
			texture_id = "highlight_texture",
			content_change_function = function (content, style, _, dt)
				local new_effect_timer = content.new_effect_timer

				if new_effect_timer then
					local duration = 1

					new_effect_timer = math.min(new_effect_timer + dt, duration)

					local progress = new_effect_timer / duration
					local anim_progress = math.easeInCubic(progress)
					local pulse_progress = math.ease_pulse(progress)
					local texture_size = style.texture_size
					local default_texture_size = style.default_texture_size

					texture_size[1] = default_texture_size[1] + default_texture_size[1] * anim_progress
					texture_size[2] = default_texture_size[2] + default_texture_size[2] * anim_progress
					style.color[1] = 255 * pulse_progress

					if progress == 1 then
						content.new_effect_timer = nil
					else
						content.new_effect_timer = new_effect_timer
					end
				end
			end,
		},
	}
	local content = {
		highlight_texture = "athanor_skilltree_slot_trait_active",
		hover = "athanor_skilltree_slot_trait_hover",
		icon_mask = "mask_circular",
		slot = "athanor_skilltree_slot_trait_unlocked",
		slot_locked = "athanor_skilltree_slot_trait_locked",
		text = "-",
		button_hotspot = {},
		size = size,
	}
	local style = {
		tooltip = {
			horizontal_alignment = "center",
			max_width = 300,
			vertical_alignment = "top",
			offset = {
				0,
				size[2] / 2,
				0,
			},
		},
		icon = {
			masked = false,
			color = {
				255,
				255,
				200,
				150,
			},
			offset = {
				-25,
				-25,
				3,
			},
			size = {
				50,
				50,
			},
		},
		icon_mask = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-20,
				-20,
				3,
			},
			size = {
				40,
				40,
			},
		},
		slot = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-42.5,
				-42.5,
				2,
			},
			size = {
				85,
				85,
			},
		},
		slot_locked = {
			masked = masked,
			color = {
				255,
				120,
				120,
				120,
			},
			default_color = {
				255,
				120,
				120,
				120,
			},
			hover_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-42.5,
				-42.5,
				2,
			},
			size = {
				85,
				85,
			},
		},
		fill_effect = {
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			default_offset = {
				-42.5,
				-42.5,
				2,
			},
			default_size = {
				85,
				85,
			},
			offset = {
				-42.5,
				-42.5,
				1,
			},
			size = {
				85,
				85,
			},
		},
		hover = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				4,
			},
			size = {
				128,
				128,
			},
		},
		highlight_texture = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-64,
				-64,
				4,
			},
			size = {
				128,
				128,
			},
		},
		new_effect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				128,
				128,
			},
			default_texture_size = {
				128,
				128,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		text = {
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-size[1] / 2,
				-size[2] / 2,
				5,
			},
			size = size,
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_menu_option_property_definition(scenegraph_id, size, masked)
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "connect_texture",
			texture_id = "connect_texture",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "value_glow",
			texture_id = "value_glow",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_disabled",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "price_text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_disabled",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_shadow",
			text_id = "price_text",
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and content.used_amount < content.total_uses
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock_icon",
			texture_id = "lock_icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
		},
		{
			pass_type = "text",
			style_id = "total_value_text",
			text_id = "total_value_text",
			content_check_function = function (content)
				return content.used_amount >= 1
			end,
		},
		{
			pass_type = "text",
			style_id = "total_value_text_shadow",
			text_id = "total_value_text",
			content_check_function = function (content)
				return content.used_amount >= 1
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_1",
			texture_id = "amount_dot",
			content_check_function = function (content)
				local slot_index = 1
				local total_uses = content.total_uses
				local used_amount = content.used_amount
				local diff = total_uses - used_amount

				return slot_index <= diff
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_2",
			texture_id = "amount_dot",
			content_check_function = function (content)
				local slot_index = 2
				local total_uses = content.total_uses
				local used_amount = content.used_amount
				local diff = total_uses - used_amount

				return slot_index <= diff
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_3",
			texture_id = "amount_dot",
			content_check_function = function (content)
				local slot_index = 3
				local total_uses = content.total_uses
				local used_amount = content.used_amount
				local diff = total_uses - used_amount

				return slot_index <= diff
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_4",
			texture_id = "amount_dot",
			content_check_function = function (content)
				local slot_index = 4
				local total_uses = content.total_uses
				local used_amount = content.used_amount
				local diff = total_uses - used_amount

				return slot_index <= diff
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_5",
			texture_id = "amount_dot",
			content_check_function = function (content)
				local slot_index = 5
				local total_uses = content.total_uses
				local used_amount = content.used_amount
				local diff = total_uses - used_amount

				return slot_index <= diff
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_locked_1",
			texture_id = "amount_dot_locked",
			content_check_function = function (content)
				return content.total_uses < 1
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_locked_2",
			texture_id = "amount_dot_locked",
			content_check_function = function (content)
				return content.total_uses < 2
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_locked_3",
			texture_id = "amount_dot_locked",
			content_check_function = function (content)
				return content.total_uses < 3
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_locked_4",
			texture_id = "amount_dot_locked",
			content_check_function = function (content)
				return content.total_uses < 4
			end,
		},
		{
			pass_type = "texture",
			style_id = "amount_dot_locked_5",
			texture_id = "amount_dot_locked",
			content_check_function = function (content)
				return content.total_uses < 5
			end,
		},
	}
	local content = {
		amount_dot = "athanor_entry_property_filled",
		amount_dot_locked = "athanor_entry_property_locked",
		background = "athanor_entry_property_bg",
		connect_texture = "athanor_entry_connector",
		frame = "athanor_entry_property_frame",
		hover = "athanor_entry_property_bg_hover",
		icon = "icons_placeholder",
		lock_icon = "athanor_level_lock",
		price_icon = "icon_mastery_small",
		price_text = "",
		title_text = "",
		total_uses = 0,
		total_value_text = "",
		used_amount = 0,
		value_glow = "athanor_entry_property_glow",
		button_hotspot = {},
		size = size,
	}
	local style = {
		amount_dot_5 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				62,
				24,
				5,
			},
			texture_size = {
				16,
				16,
			},
		},
		amount_dot_4 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				69,
				13,
				5,
			},
			texture_size = {
				16,
				16,
			},
		},
		amount_dot_3 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				72,
				0,
				5,
			},
			texture_size = {
				16,
				16,
			},
		},
		amount_dot_2 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				69,
				-13,
				5,
			},
			texture_size = {
				16,
				16,
			},
		},
		amount_dot_1 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				62,
				-25,
				5,
			},
			texture_size = {
				16,
				16,
			},
		},
		amount_dot_locked_5 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				65,
				24,
				5,
			},
			texture_size = {
				10,
				10,
			},
		},
		amount_dot_locked_4 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				72,
				13,
				5,
			},
			texture_size = {
				10,
				10,
			},
		},
		amount_dot_locked_3 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				75,
				0,
				5,
			},
			texture_size = {
				10,
				10,
			},
		},
		amount_dot_locked_2 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				72,
				-13,
				5,
			},
			texture_size = {
				10,
				10,
			},
		},
		amount_dot_locked_1 = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				65,
				-25,
				5,
			},
			texture_size = {
				10,
				10,
			},
		},
		debug = {
			masked = masked,
			color = {
				255,
				255,
				0,
				0,
			},
			offset = {
				-1,
				-1,
				8,
			},
			size = {
				3,
				3,
			},
		},
		icon = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				143,
				216,
				255,
			},
			offset = {
				26,
				0,
				6,
			},
			texture_size = {
				40,
				40,
			},
		},
		icon_disabled = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				26,
				0,
				6,
			},
			texture_size = {
				40,
				40,
			},
		},
		value_glow = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-4,
				0,
				6,
			},
			texture_size = {
				84,
				110,
			},
		},
		connect_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-20,
				0,
				0,
			},
			texture_size = {
				58,
				18,
			},
		},
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				200,
				200,
				200,
			},
			offset = {
				0,
				0,
				0,
			},
			texture_size = size,
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				4,
			},
			texture_size = size,
		},
		hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_size = size,
		},
		lock_icon = {
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100 + (size[1] - 185) / 2 - 17.5,
				8.5,
				6,
			},
			default_offset = {
				100 + (size[1] - 185) / 2 - 17.5,
				8.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				100 + (size[1] - 185) / 2 - 17.5,
				8.5,
				6,
			},
			default_offset = {
				100 + (size[1] - 185) / 2 - 17.5,
				8.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_text_disabled = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100,
				17,
				3,
			},
			default_offset = {
				100,
				17,
				3,
			},
			size = {
				size[1] - 185,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				100,
				17,
				3,
			},
			default_offset = {
				100,
				17,
				3,
			},
			size = {
				size[1] - 185,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text_shadow = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				102,
				15,
				2,
			},
			default_offset = {
				102,
				15,
				2,
			},
			size = {
				size[1] - 185,
				20,
			},
		},
		title_text_disabled = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100,
				size[2] - 80,
				3,
			},
			size = {
				size[1] - 190,
				70,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					80,
					80,
					80,
				},
			},
		},
		title_text = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				100,
				size[2] - 80,
				3,
			},
			size = {
				size[1] - 190,
				70,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
			},
		},
		title_text_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				102,
				size[2] - 80 - 2,
				2,
			},
			size = {
				size[1] - 190,
				70,
			},
		},
		total_value_text = {
			dynamic_font_size = true,
			font_size = 24,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				17,
				50,
				157,
			},
			color = {
				100,
				255,
				255,
				255,
			},
			offset = {
				size[1] - 75,
				size[2] / 2 - 13,
				7,
			},
			size = {
				60,
				30,
			},
		},
		total_value_text_shadow = {
			dynamic_font_size = true,
			font_size = 24,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 0),
			offset = {
				size[1] - 75 + 2,
				size[2] / 2 - 13 - 2,
				6,
			},
			size = {
				60,
				30,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_menu_option_trait_definition(scenegraph_id, size, masked)
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "connect_texture",
			texture_id = "connect_texture",
		},
		{
			pass_type = "texture",
			style_id = "icon_equipped_frame",
			texture_id = "icon_equipped_frame",
			content_check_function = function (content)
				return content.used_amount > 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text_disabled",
			text_id = "text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text",
		},
		{
			pass_type = "text",
			style_id = "title_text_disabled",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "price_text_disabled",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_shadow",
			text_id = "price_text",
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and content.used_amount < content.total_uses
			end,
		},
		{
			pass_type = "texture",
			style_id = "value_glow",
			texture_id = "value_glow",
		},
		{
			pass_type = "texture",
			style_id = "lock_icon",
			texture_id = "lock_icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
		},
	}
	local content = {
		background = "athanor_entry_trait_bg",
		connect_texture = "athanor_entry_connector",
		frame = "athanor_entry_trait_frame",
		hover = "athanor_entry_trait_bg_hover",
		icon = "icons_placeholder",
		icon_equipped_frame = "athanor_skilltree_slot_trait_active",
		lock_icon = "athanor_level_lock",
		price_icon = "icon_mastery_small",
		price_text = "0",
		text = "-",
		title_text = "n/a",
		total_uses = 0,
		used_amount = 0,
		value_glow = "athanor_entry_trait_glow",
		button_hotspot = {},
		size = size,
	}
	local style = {
		debug = {
			masked = masked,
			color = {
				255,
				255,
				0,
				0,
			},
			offset = {
				-1,
				-1,
				8,
			},
			size = {
				3,
				3,
			},
		},
		icon_equipped_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-18,
				0,
				4,
			},
			texture_size = {
				128,
				128,
			},
		},
		icon = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				26,
				0,
				3,
			},
			texture_size = {
				40,
				40,
			},
		},
		value_glow = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-22,
				0,
				3,
			},
			texture_size = {
				54,
				165,
			},
		},
		icon_disabled = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				26,
				0,
				3,
			},
			texture_size = {
				40,
				40,
			},
		},
		connect_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				-20,
				0,
				0,
			},
			texture_size = {
				58,
				18,
			},
		},
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				0,
			},
			texture_size = size,
		},
		hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_size = size,
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				2,
			},
			texture_size = size,
		},
		lock_icon = {
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100 + (size[1] - 160) / 2 - 17.5,
				12.5,
				6,
			},
			default_offset = {
				100 + (size[1] - 160) / 2 - 17.5,
				12.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				100 + (size[1] - 160) / 2 - 17.5,
				12.5,
				6,
			},
			default_offset = {
				100 + (size[1] - 160) / 2 - 17.5,
				12.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_text_disabled = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100,
				20,
				3,
			},
			default_offset = {
				100,
				20,
				3,
			},
			size = {
				size[1] - 160,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				100,
				20,
				3,
			},
			default_offset = {
				100,
				20,
				3,
			},
			size = {
				size[1] - 160,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text_shadow = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				102,
				18,
				2,
			},
			default_offset = {
				102,
				18,
				2,
			},
			size = {
				size[1] - 160,
				20,
			},
		},
		title_text_disabled = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				100,
				100,
				100,
			},
			offset = {
				100,
				size[2] - 53,
				3,
			},
			size = {
				size[1] - 160,
				30,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				100,
				size[2] - 53,
				3,
			},
			size = {
				size[1] - 160,
				30,
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				102,
				size[2] - 53 - 2,
				2,
			},
			size = {
				size[1] - 160,
				30,
			},
		},
		text_disabled = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				90,
				size[2] - 150,
				3,
			},
			size = {
				size[1] - 140,
				95,
			},
		},
		text = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				90,
				size[2] - 150,
				3,
			},
			size = {
				size[1] - 140,
				95,
			},
		},
		text_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				92,
				size[2] - 150 - 2,
				2,
			},
			size = {
				size[1] - 140,
				95,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_menu_option_talent_definition(scenegraph_id, size, masked)
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "connect_texture",
			texture_id = "connect_texture",
		},
		{
			pass_type = "texture",
			style_id = "icon_equipped_frame",
			texture_id = "icon_equipped_frame",
			content_check_function = function (content)
				return content.used_amount > 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_disabled",
			texture_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text_disabled",
			text_id = "text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text",
		},
		{
			pass_type = "text",
			style_id = "title_text_disabled",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_disabled",
			text_id = "title_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "price_text_disabled",
			text_id = "price_text",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "text",
			style_id = "price_text_shadow",
			text_id = "price_text",
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.button_hotspot.disable_button and content.used_amount < content.total_uses
			end,
		},
		{
			pass_type = "texture",
			style_id = "value_glow",
			texture_id = "value_glow",
		},
		{
			pass_type = "texture",
			style_id = "lock_icon",
			texture_id = "lock_icon",
			content_check_function = function (content)
				return content.button_hotspot.disable_button
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover",
			texture_id = "hover",
		},
	}
	local content = {
		background = "athanor_entry_talent_bg",
		connect_texture = "athanor_entry_connector",
		frame = "athanor_entry_talent_frame",
		hover = "athanor_entry_talent_bg_hover",
		icon = "icons_placeholder",
		icon_equipped_frame = "athanor_skilltree_slot_talent_active",
		lock_icon = "athanor_level_lock",
		price_icon = "icon_mastery_small",
		price_text = "0",
		text = "-",
		title_text = "n/a",
		total_uses = 0,
		used_amount = 0,
		value_glow = "athanor_entry_talent_glow",
		button_hotspot = {
			allow_multi_hover = true,
		},
		size = size,
	}
	local style = {
		debug = {
			masked = masked,
			color = {
				255,
				255,
				0,
				0,
			},
			offset = {
				-1,
				-1,
				8,
			},
			size = {
				3,
				3,
			},
		},
		icon_equipped_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-13,
				0,
				4,
			},
			texture_size = {
				128,
				128,
			},
		},
		icon = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				11,
				0,
				0,
			},
			texture_size = {
				80,
				80,
			},
		},
		icon_disabled = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				11,
				0,
				0,
			},
			texture_size = {
				80,
				80,
			},
		},
		value_glow = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				5,
				3,
			},
			texture_size = {
				72,
				162,
			},
		},
		connect_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				-20,
				0,
				0,
			},
			texture_size = {
				58,
				18,
			},
		},
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				1,
			},
			texture_size = size,
		},
		hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
			texture_size = size,
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				3,
			},
			texture_size = size,
		},
		hover = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = background_color,
			offset = {
				0,
				0,
				2,
			},
			texture_size = size,
		},
		lock_icon = {
			masked = masked,
			color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				110 + (size[1] - 170) / 2 - 17.5,
				12.5,
				6,
			},
			default_offset = {
				110 + (size[1] - 170) / 2 - 17.5,
				12.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_icon = {
			masked = masked,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				110 + (size[1] - 170) / 2 - 17.5,
				12.5,
				6,
			},
			default_offset = {
				110 + (size[1] - 170) / 2 - 17.5,
				12.5,
				6,
			},
			size = {
				35,
				35,
			},
		},
		price_text_disabled = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				110,
				20,
				5,
			},
			default_offset = {
				110,
				20,
				5,
			},
			size = {
				size[1] - 170,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				110,
				20,
				5,
			},
			default_offset = {
				110,
				20,
				5,
			},
			size = {
				size[1] - 170,
				20,
			},
			color_override = {},
			color_override_table = {
				end_index = 0,
				start_index = 0,
				color = {
					255,
					121,
					193,
					229,
				},
			},
		},
		price_text_shadow = {
			dynamic_font_size = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				112,
				18,
				4,
			},
			default_offset = {
				112,
				18,
				4,
			},
			size = {
				size[1] - 170,
				20,
			},
		},
		title_text_disabled = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				100,
				100,
				100,
			},
			offset = {
				110,
				size[2] - 53,
				5,
			},
			size = {
				size[1] - 170,
				30,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				110,
				size[2] - 53,
				5,
			},
			size = {
				size[1] - 170,
				30,
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 20,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			color = {
				150,
				255,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				112,
				size[2] - 53 - 2,
				4,
			},
			size = {
				size[1] - 170,
				30,
			},
		},
		text_disabled = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				100,
				size[2] - 185,
				5,
			},
			size = {
				size[1] - 150,
				130,
			},
		},
		text = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				100,
				size[2] - 185,
				5,
			},
			size = {
				size[1] - 150,
				130,
			},
		},
		text_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			color = {
				150,
				0,
				255,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				102,
				size[2] - 185 - 2,
				4,
			},
			size = {
				size[1] - 150,
				130,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_list_mask(scenegraph_id, size, fade_height)
	fade_height = fade_height or 20

	local element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge",
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge",
			},
		},
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
		hotspot = {
			allow_multi_hover = true,
		},
	}
	local style = {
		debug = {
			size = size,
			color = {
				100,
				255,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		mask = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				size[1],
				size[2] - fade_height * 2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		mask_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				fade_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		mask_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				fade_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				0,
			},
			angle = math.pi,
			pivot = {
				size[1] / 2,
				fade_height / 2,
			},
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_locked_slot_information(scenegraph_id, size)
	local element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
			},
			{
				pass_type = "text",
				style_id = "title_text",
				text_id = "title_text",
			},
			{
				pass_type = "text",
				style_id = "sub_title_text",
				text_id = "sub_title_text",
			},
			{
				pass_type = "text",
				style_id = "description_text",
				text_id = "description_text",
			},
		},
	}
	local content = {
		description_text = "description_text",
		icon = "icon_trait",
		sub_title_text = "sub_title_text",
		title_text = "title_text",
	}
	local style = {
		icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				50,
				50,
			},
			color = {
				255,
				180,
				180,
				180,
			},
			offset = {
				30,
				120,
				1,
			},
		},
		title_text = {
			font_size = 32,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = {
				255,
				180,
				180,
				180,
			},
			size = {
				size[1] - 150,
				30,
			},
			color = {
				100,
				80,
				80,
				200,
			},
			offset = {
				105,
				size[2] / 2 + 50,
				1,
			},
		},
		sub_title_text = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				255,
				160,
				160,
				160,
			},
			size = {
				size[1] - 150,
				30,
			},
			color = {
				100,
				80,
				200,
				80,
			},
			offset = {
				105,
				size[2] / 2 + 10,
				1,
			},
		},
		description_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				255,
				120,
				120,
				120,
			},
			color = {
				100,
				200,
				80,
				80,
			},
			size = {
				size[1] - 150,
				size[2] / 2 - 60,
			},
			offset = {
				105,
				50,
				1,
			},
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_simple_hotspot(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
			},
		},
		content = {
			hotspot = {
				allow_multi_hover = true,
			},
		},
		style = {},
		scenegraph_id = scenegraph_id,
	}
end

local masked = true
local top_hdr_widgets = {
	top_hdr_background_write_mask = UIWidgets.create_simple_texture("ui_write_mask", "window"),
	upgrade_bg = UIWidgets.create_simple_texture("weave_menu_athanor_upgrade_bg", "upgrade_bg"),
}
local wheel_color = {
	255,
	138,
	0,
	147,
}
local bottom_hdr_widgets = {
	hdr_background_wheel = UIWidgets.create_simple_texture("athanor_skilltree_background_effect", "background_wheel", nil, nil, wheel_color, 5),
	hdr_wheel_ring_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_1", 0, {
		94,
		94,
	}, "wheel_ring_1", nil, nil, wheel_color, 1),
	hdr_wheel_ring_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_2", 0, {
		230.5,
		230.5,
	}, "wheel_ring_2", nil, nil, wheel_color, 1),
	hdr_wheel_ring_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_effect_3", 0, {
		537,
		537,
	}, "wheel_ring_3", nil, nil, wheel_color, 1),
}
local bottom_widgets = {
	background_write_mask = UIWidgets.create_simple_texture("athanor_background_write_mask", "window"),
	background_wheel = UIWidgets.create_simple_texture("athanor_skilltree_background", "background_wheel"),
	viewport_background = UIWidgets.create_simple_rect("viewport_background", {
		255,
		0,
		0,
		0,
	}),
	viewport_background_fade = UIWidgets.create_simple_rotated_texture("edge_fade_small", math.pi / 2, {
		scenegraph_definition.viewport_background_fade.size[1],
		0,
	}, "viewport_background_fade"),
	wheel_ring_1 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_1", 0, {
		94,
		94,
	}, "wheel_ring_1"),
	wheel_ring_2 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_2", 0, {
		230.5,
		230.5,
	}, "wheel_ring_2"),
	wheel_ring_3 = UIWidgets.create_simple_rotated_texture("athanor_skilltree_ring_3", 0, {
		537,
		537,
	}, "wheel_ring_3"),
}

bottom_hdr_widgets.hdr_wheel_ring_1.content.snap_pixel_positions = false
bottom_hdr_widgets.hdr_wheel_ring_2.content.snap_pixel_positions = false
bottom_hdr_widgets.hdr_wheel_ring_3.content.snap_pixel_positions = false
bottom_widgets.wheel_ring_1.content.snap_pixel_positions = false
bottom_widgets.wheel_ring_2.content.snap_pixel_positions = false
bottom_widgets.wheel_ring_3.content.snap_pixel_positions = false

local top_widgets = {
	upgrade_text = UIWidgets.create_simple_text(Localize("menu_weave_item_upgraded_effect_title"), "upgrade_text", nil, nil, upgrade_title_style),
	viewport_panel_divider = UIWidgets.create_simple_texture("athanor_item_divider_middle", "viewport_panel_divider"),
	viewport_panel_divider_left = UIWidgets.create_simple_uv_texture("athanor_item_divider_edge", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "viewport_panel_divider_left"),
	viewport_panel_divider_right = UIWidgets.create_simple_texture("athanor_item_divider_edge", "viewport_panel_divider_right"),
	viewport_level_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_magic_level_title"), "panel_level_title", nil, nil, panel_value_title_style),
	viewport_level_value = UIWidgets.create_simple_text("0", "panel_level_value", nil, nil, panel_value_text_style),
	viewport_power_title = UIWidgets.create_simple_text(Localize("menu_weave_forge_loadout_power_title"), "panel_power_title", nil, nil, panel_value_title_style),
	viewport_power_value = UIWidgets.create_simple_text("0", "panel_power_value", nil, nil, panel_value_text_style),
	viewport_button = UIWidgets.create_simple_hotspot("viewport_button", true),
	viewport_title = UIWidgets.create_simple_text("", "viewport_title", nil, nil, viewport_title_text_style),
	viewport_sub_title = UIWidgets.create_simple_text("", "viewport_sub_title", nil, nil, viewport_sub_title_text_style),
	upgrade_essence_warning = UIWidgets.create_simple_text(Localize("menu_weave_forge_level_too_low"), "upgrade_essence_warning", nil, nil, upgrade_essence_warning_style),
	upgrade_button = UIWidgets.create_athanor_upgrade_button("upgrade_button", scenegraph_definition.upgrade_button.size, "athanor_icon_upgrade", Localize("menu_weave_forge_upgrade_loadout_button"), 24),
	options_background_edge = UIWidgets.create_simple_texture("athanor_categories_background", "options_background_edge"),
	options_list_button = create_simple_hotspot("options_scroll_field"),
	options_background = UIWidgets.create_tiled_texture("options_background", "menu_frame_bg_01", {
		960,
		1080,
	}, nil, masked, {
		255,
		120,
		120,
		120,
	}),
	options_background_mask = UIWidgets.create_simple_uv_texture("athanor_list_mask_write_mask", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "options_background_mask"),
	clear_background = UIWidgets.create_simple_uv_texture("athanor_decoration_headline", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "clear_background"),
	clear_button = UIWidgets.create_default_button("clear_button", scenegraph_definition.clear_button.size, nil, nil, Localize("menu_weave_forge_reset_options_button"), 26, nil, "button_detail_02"),
	mastery_icon = UIWidgets.create_simple_texture("icon_mastery_big", "mastery_icon"),
	mastery_text = UIWidgets.create_simple_text("", "mastery_text", nil, nil, mastery_text_style),
	mastery_title_text = UIWidgets.create_simple_text(Localize("menu_weave_forge_mastery_title"), "mastery_title_text", nil, nil, mastery_title_text_style),
	mastery_tooltip = UIWidgets.create_additional_option_tooltip("mastery_tooltip", scenegraph_definition.mastery_tooltip.size, {
		"additional_option_info",
	}, {
		title = Localize("menu_weave_forge_tooltip_mastery_title"),
		description = Localize("menu_weave_forge_tooltip_mastery_description"),
	}, 400, nil, nil, true),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("", "sub_title_text", nil, nil, sub_title_text_style),
	title_background = UIWidgets.create_simple_texture("athanor_decoration_headline", "title_background"),
	window_overlay = UIWidgets.create_simple_rect("window_overlay", {
		0,
		10,
		10,
		10,
	}),
	locked_slot_description = create_locked_slot_information("options_scroll_field", scenegraph_definition.options_scroll_field.size),
}
local animation_definitions = {
	upgrade = {
		{
			end_progress = 1,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text

				upgrade_bg.alpha_multiplier = 0
				upgrade_text.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text

				upgrade_bg.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "fade_out",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(1 - progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_text = widgets.upgrade_text

				upgrade_bg.alpha_multiplier = anim_progress
				upgrade_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2,
			name = "text_offset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_text = widgets.upgrade_text

				upgrade_text.offset[2] = -40 + 50 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4,
			name = "size_increase",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size

				upgrade_bg_size[1] = upgrade_bg_default_size[1]
				upgrade_bg_size[2] = upgrade_bg_default_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local upgrade_bg = widgets.upgrade_bg
				local upgrade_bg_scenegraph_id = upgrade_bg.scenegraph_id
				local upgrade_bg_definition = scenegraph_definition[upgrade_bg_scenegraph_id]
				local upgrade_bg_default_size = upgrade_bg_definition.size
				local upgrade_bg_scenegraph = ui_scenegraph[upgrade_bg_scenegraph_id]
				local upgrade_bg_size = upgrade_bg_scenegraph.size

				upgrade_bg_size[1] = upgrade_bg_default_size[1] + 200 * (1 - anim_progress)
				upgrade_bg_size[2] = upgrade_bg_default_size[2] + 200 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
				ui_scenegraph.viewport_panel.local_position[2] = scenegraph_definition.viewport_panel.position[2] + (-50 + 50 * anim_progress)
				ui_scenegraph.slot_root.local_position[1] = scenegraph_definition.slot_root.position[1] + (-150 + 150 * anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scrollbar_widget = UIWidgets.create_chain_scrollbar("options_list_scrollbar", "options_scroll_field", scenegraph_definition.options_list_scrollbar.size),
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	top_hdr_widgets = top_hdr_widgets,
	bottom_hdr_widgets = bottom_hdr_widgets,
	options_mask_margin = options_mask_margin,
	options_mask_offset = options_mask_offset,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_trait_slot_definition = create_trait_slot_definition,
	create_menu_option_trait_definition = create_menu_option_trait_definition,
	create_menu_option_talent_definition = create_menu_option_talent_definition,
	create_menu_option_property_definition = create_menu_option_property_definition,
	create_talent_slot_definition = create_talent_slot_definition,
	create_property_slot_definition = create_property_slot_definition,
}
