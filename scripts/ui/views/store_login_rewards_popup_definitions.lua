-- chunkname: @scripts/ui/views/store_login_rewards_popup_definitions.lua

local WIN_X, WIN_Y = 1550, 700
local DAY_X, DAY_Y = 150, 350
local DAY_PAD = 20
local DAYS = 8
local DISABLE_WITH_GAMEPAD = true
local scenegraph_definition = {
	screen = {
		horizontal_alignment = "center",
		scale = "fit",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			700,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			WIN_X,
			WIN_Y,
		},
		position = {
			0,
			0,
			1,
		},
	},
	claim_overlay_divider = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			314,
			33,
		},
		position = {
			0,
			20,
			40,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			150,
			150,
		},
		position = {
			0,
			0,
			5,
		},
	},
	window_inner = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		size = {
			WIN_X - 84,
			WIN_Y - 84,
		},
		position = {
			0,
			0,
			0,
		},
	},
	background_edge_top = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			WIN_X - 42,
			42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_bottom = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			WIN_X - 42,
			42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			42,
			WIN_Y - 42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	background_edge_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "center",
		size = {
			42,
			WIN_Y - 42,
		},
		position = {
			0,
			0,
			4,
		},
	},
	corner_bottom_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			151,
			151,
		},
		position = {
			-6,
			-6,
			5,
		},
	},
	corner_bottom_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			151,
			151,
		},
		position = {
			6,
			-6,
			5,
		},
	},
	corner_top_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			151,
			151,
		},
		position = {
			-6,
			6,
			5,
		},
	},
	corner_top_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			151,
			151,
		},
		position = {
			6,
			6,
			5,
		},
	},
	timer = {
		horizontal_alignment = "left",
		parent = "window_inner",
		vertical_alignment = "bottom",
		size = {
			WIN_X - 84 - 150,
			42,
		},
		position = {
			75,
			5,
			5,
		},
	},
	backdrop = {
		horizontal_alignment = "center",
		parent = "window_inner",
		vertical_alignment = "top",
		size = {
			380,
			40,
		},
		position = {
			0,
			-20,
			5,
		},
	},
	title = {
		horizontal_alignment = "center",
		parent = "backdrop",
		vertical_alignment = "center",
		size = {
			WIN_X,
			30,
		},
		position = {
			0,
			0,
			3,
		},
	},
	description = {
		horizontal_alignment = "center",
		parent = "backdrop",
		vertical_alignment = "bottom",
		size = {
			1050,
			100,
		},
		position = {
			0,
			-110,
			3,
		},
	},
	calendar = {
		horizontal_alignment = "center",
		parent = "window_inner",
		vertical_alignment = "center",
		size = {
			(DAY_X + DAY_PAD) * DAYS,
			DAY_Y,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	day_pivot = {
		horizontal_alignment = "left",
		parent = "calendar",
		vertical_alignment = "bottom",
		size = {
			DAY_X,
			DAY_Y,
		},
		position = {
			0,
			0,
			1,
		},
	},
	claim_button = {
		horizontal_alignment = "center",
		parent = "day_pivot",
		vertical_alignment = "bottom",
		size = {
			DAY_X - 8,
			42,
		},
		position = {
			0,
			-15,
			10,
		},
	},
	reward_pivot = {
		horizontal_alignment = "center",
		parent = "day_pivot",
		vertical_alignment = "bottom",
		size = {
			80,
			80,
		},
		position = {
			0,
			130,
			10,
		},
	},
	close_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			260,
			42,
		},
		position = {
			0,
			-82,
			10,
		},
	},
}
local title_text_style = {
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("exotic", 255),
	offset = {
		0,
		0,
		2,
	},
}
local body_text_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local timer_text_style = {
	font_size = 32,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		230,
		230,
		230,
	},
	offset = {
		0,
		0,
		2,
	},
}

local function create_reward_item_widget(day_index, reward_index)
	local cursor_frame_settings = UIFrameSettings.frame_outer_glow_04_big
	local shadow_settings = UIFrameSettings.frame_outer_glow_01
	local shadow_width = shadow_settings.texture_sizes.vertical[1]
	local selection_frame_settings = UIFrameSettings.frame_outer_glow_01_white
	local selection_frame_width = selection_frame_settings.texture_sizes.vertical[1]

	return {
		scenegraph_id = "reward_pivot",
		offset = {
			(day_index - 1) * (DAY_X + DAY_PAD) + 0.5 * DAY_PAD,
			(reward_index - 1) * -85,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "shadow",
					texture_id = "shadow",
				},
				{
					pass_type = "texture",
					style_id = "item_rarity",
					texture_id = "item_rarity",
				},
				{
					pass_type = "texture",
					style_id = "item_icon",
					texture_id = "item_icon",
				},
				{
					pass_type = "texture",
					style_id = "item_illusion",
					texture_id = "item_illusion",
					content_check_function = function (content)
						return content.is_illusion
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_frame",
					texture_id = "item_frame",
				},
				{
					pass_type = "hover",
					style_id = "item_tooltip",
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					style_id = "item_tooltip",
					content_check_function = function (content)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return content.is_hover or gamepad_active and content.is_selected and content.show_tooltips
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "cursor",
					texture_id = "cursor",
					content_check_function = function (content)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						if gamepad_active then
							return content.is_selected
						else
							return content.is_hover
						end
					end,
				},
			},
		},
		content = {
			is_hover = false,
			is_illusion = false,
			item_frame = "item_frame",
			item_icon = "icons_placeholder",
			item_illusion = "item_frame_illusion",
			item_rarity = "icons_placeholder",
			no_equipped_item = true,
			show_tooltips = false,
			shadow = shadow_settings.texture,
			cursor = cursor_frame_settings.texture,
		},
		style = {
			shadow = {
				offset = {
					0,
					0,
					0,
				},
				frame_margins = {
					-shadow_width,
					-shadow_width,
				},
				texture_size = shadow_settings.texture_size,
				texture_sizes = shadow_settings.texture_sizes,
				color = {
					255,
					50,
					50,
					50,
				},
			},
			item_rarity = {
				offset = {
					0,
					0,
					1,
				},
				texture_size = {
					80,
					80,
				},
			},
			item_icon = {
				offset = {
					0,
					0,
					2,
				},
				texture_size = {
					80,
					80,
				},
			},
			item_illusion = {
				offset = {
					0,
					0,
					3,
				},
				texture_size = {
					80,
					80,
				},
			},
			item_frame = {
				offset = {
					0,
					0,
					4,
				},
				texture_size = {
					80,
					80,
				},
			},
			item_tooltip = {
				font_size = 18,
				font_type = "hell_shark",
				localize = true,
				max_width = 500,
				offset = {
					0,
					0,
					5,
				},
				size = {
					80,
					80,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
			},
			cursor = {
				size = {
					80,
					80,
				},
				texture_size = cursor_frame_settings.texture_size,
				texture_sizes = cursor_frame_settings.texture_sizes,
				frame_margins = {
					-22,
					-22,
				},
				offset = {
					0,
					0,
					4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
	}
end

local function create_day_widget(day_index)
	local frame_settings = UIFrameSettings.button_frame_01_gold
	local corner_settings = UIFrameSettings.frame_corner_detail_01_gold
	local glow_settings = UIFrameSettings.frame_outer_glow_04_big
	local glow_width = glow_settings.texture_sizes.horizontal[2]
	local selection_frame_settings = UIFrameSettings.frame_outer_glow_01_white
	local selection_frame_width = selection_frame_settings.texture_sizes.vertical[1]

	return {
		scenegraph_id = "day_pivot",
		offset = {
			(day_index - 1) * (DAY_X + DAY_PAD) + 0.5 * DAY_PAD,
			0,
			0,
		},
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "bg",
					texture_id = "bg",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "corner",
					texture_id = "corner",
				},
				{
					pass_type = "texture_frame",
					style_id = "selection_frame",
					texture_id = "selection_frame",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return gamepad_active and content.selection_index == content.day_index
					end,
				},
				{
					pass_type = "texture",
					style_id = "inset",
					texture_id = "inset",
				},
				{
					pass_type = "texture_frame",
					style_id = "glow",
					texture_id = "glow",
					content_check_function = function (content)
						return content.is_today
					end,
				},
				{
					content_id = "bottom_glow",
					pass_type = "texture_uv",
					style_id = "bottom_glow",
					content_check_function = function (content)
						return content.parent.is_today
					end,
				},
				{
					pass_type = "text",
					style_id = "day_text",
					text_id = "day_text",
					content_check_function = function (content)
						return content.calendar_type == "personal_time_strike"
					end,
				},
				{
					pass_type = "text",
					style_id = "day_text_shadow",
					text_id = "day_text",
					content_check_function = function (content)
						return content.calendar_type == "personal_time_strike"
					end,
				},
				{
					pass_type = "text",
					style_id = "day_number",
					text_id = "day_number",
					content_check_function = function (content)
						return not content.is_today
					end,
				},
				{
					pass_type = "text",
					style_id = "day_number_shadow",
					text_id = "day_number",
					content_check_function = function (content)
						return not content.is_today
					end,
				},
				{
					pass_type = "texture",
					style_id = "day_number_texture",
					texture_id = "day_number_texture",
					content_check_function = function (content)
						return content.is_today
					end,
				},
				{
					pass_type = "texture",
					style_id = "claimed",
					texture_id = "claimed",
					content_check_function = function (content)
						return content.is_claimed
					end,
				},
				{
					pass_type = "rect",
					style_id = "unclaimed_tint",
					content_check_function = function (content)
						return content.calendar_type == "calendar" and not content.is_claimed and content.day_index <= content.current_day and not content.is_loop
					end,
					content_change_function = function (content, style)
						if content.calendar_type == "calendar" and not content.is_claimed and content.day_index <= content.current_day and not content.is_loop then
							style.color[1] = 120
						end
					end,
				},
			},
		},
		content = {
			bg = "menu_frame_bg_09",
			calendar_type = "personal_time_strike",
			claimed = "store_owned_sigil",
			current_day = 0,
			inset = "options_window_fade_01",
			is_claimed = false,
			is_today = false,
			hotspot = {},
			frame = frame_settings.texture,
			corner = corner_settings.texture,
			glow = glow_settings.texture,
			selection_frame = selection_frame_settings.texture,
			bottom_glow = {
				texture_id = "login_rewards_embers",
				visible = false,
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			day_text = "imperial_day_" .. tostring(day_index),
			day_number = tostring(day_index),
			day_number_texture = "numeric_icon_orange_medium_" .. day_index,
			day_index = day_index,
		},
		style = {
			hotspot = {},
			bg = {
				offset = {
					0,
					0,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			frame = {
				offset = {
					0,
					0,
					4,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			corner = {
				offset = {
					0,
					0,
					5,
				},
				texture_size = corner_settings.texture_size,
				texture_sizes = corner_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			glow = {
				offset = {
					0,
					0,
					3,
				},
				frame_margins = {
					-glow_width,
					-glow_width,
				},
				texture_size = glow_settings.texture_size,
				texture_sizes = glow_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			selection_frame = {
				offset = {
					0,
					0,
					6,
				},
				frame_margins = {
					-selection_frame_width,
					-selection_frame_width,
				},
				texture_size = selection_frame_settings.texture_size,
				texture_sizes = selection_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			inset = {
				offset = {
					0,
					0,
					2,
				},
				color = {
					220,
					255,
					255,
					255,
				},
			},
			bottom_glow = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					3,
				},
				texture_size = {
					DAY_X,
					DAY_Y,
				},
				color = {
					255,
					255,
					115,
					10,
				},
			},
			day_text = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				text_color = {
					255,
					50,
					20,
					20,
				},
				area_size = {
					100,
					-1,
				},
				offset = {
					0,
					-40,
					10,
				},
			},
			day_text_shadow = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				text_color = {
					255,
					164,
					130,
					82,
				},
				area_size = {
					100,
					-1,
				},
				offset = {
					1.5,
					-41.5,
					9,
				},
			},
			day_number = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				offset = {
					0,
					-75,
					4,
				},
				text_color = {
					255,
					50,
					20,
					20,
				},
			},
			day_number_shadow = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				offset = {
					2,
					-77,
					3,
				},
				text_color = {
					255,
					164,
					130,
					82,
				},
			},
			day_number_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				offset = {
					0,
					-70,
					4,
				},
				texture_size = {
					64,
					64,
				},
			},
			claimed = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					75,
					75,
				},
				offset = {
					0,
					-37.5,
					20,
				},
			},
			unclaimed_tint = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					20,
				},
			},
		},
	}
end

local background_shines_definition = {
	scenegraph_id = "window",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "top",
			},
			{
				pass_type = "texture_uv",
				style_id = "bottom",
			},
		},
	},
	content = {
		texture_id = "morris_gaze_glow",
		uvs = {
			{
				0,
				1,
			},
			{
				1,
				0,
			},
		},
	},
	style = {
		top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			offset = {
				0,
				100,
				0,
			},
			texture_size = {
				WIN_X,
				100,
			},
			color = Colors.get_color_table_with_alpha("exotic", 200),
		},
		bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			offset = {
				0,
				-100,
				0,
			},
			texture_size = {
				WIN_X,
				100,
			},
			color = Colors.get_color_table_with_alpha("exotic", 200),
		},
	},
}
local loading_icon_widget = {
	scenegraph_id = "loading_icon",
	element = {
		passes = {
			{
				pass_type = "rotated_texture",
				style_id = "loading_icon",
				texture_id = "loading_icon",
				content_change_function = function (content, style, _, dt)
					local progress = style.progress or 0

					progress = (progress + dt) % 1

					local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

					style.angle = angle
					style.progress = progress
				end,
			},
		},
	},
	content = {
		loading_icon = "loot_loading",
	},
	style = {
		loading_icon = {
			angle = 0,
			pivot = {
				75,
				75,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			texture_size = {
				150,
				150,
			},
		},
	},
}
local glow_settings = UIFrameSettings.frame_outer_glow_01
local glow_width = glow_settings.texture_sizes.horizontal[2]
local claim_button_glow_definition = {
	scenegraph_id = "claim_button",
	element = {
		passes = {
			{
				pass_type = "texture_frame",
				style_id = "outer_glow",
				texture_id = "outer_glow",
				content_change_function = function (content, style)
					style.color[1] = 150 + 105 * math.sin(5 * Managers.time:time("ui"))
				end,
			},
		},
	},
	content = {
		outer_glow = glow_settings.texture,
		disable_with_gamepad = DISABLE_WITH_GAMEPAD,
	},
	style = {
		outer_glow = {
			frame_margins = {
				-glow_width,
				-glow_width,
			},
			texture_size = glow_settings.texture_size,
			texture_sizes = glow_settings.texture_sizes,
			offset = {
				0,
				0,
				0,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
}
local loading_widgets_definitions = {
	background_overlay = UIWidgets.create_simple_rect("screen", {
		220,
		12,
		12,
		12,
	}),
	loading_icon = loading_icon_widget,
}
local overlay_widgets_definitions = {
	overlay = UIWidgets.create_simple_rect("screen", {
		220,
		12,
		12,
		12,
	}, 36),
	loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "claim_overlay_divider", nil, nil, nil, 1),
	loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "claim_overlay_divider"),
}
local widget_definitions = {
	screen = UIWidgets.create_simple_rect("screen", {
		220,
		12,
		12,
		12,
	}),
	background_glows = background_shines_definition,
	window_background = UIWidgets.create_tiled_texture("window_inner", "menu_frame_bg_03", {
		256,
		256,
	}, nil, nil, {
		255,
		150,
		150,
		150,
	}),
	background_edge_top = UIWidgets.create_tiled_texture("background_edge_top", "store_frame_small_side_01", {
		128,
		42,
	}),
	background_edge_bottom = UIWidgets.create_tiled_texture("background_edge_bottom", "store_frame_small_side_03", {
		128,
		42,
	}),
	background_edge_left = UIWidgets.create_tiled_texture("background_edge_left", "store_frame_small_side_04", {
		42,
		128,
	}),
	background_edge_right = UIWidgets.create_tiled_texture("background_edge_right", "store_frame_small_side_02", {
		42,
		128,
	}),
	corner_bottom_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", 0, {
		75.5,
		75.5,
	}, "corner_bottom_left"),
	corner_bottom_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", -math.pi / 2, {
		75.5,
		75.5,
	}, "corner_bottom_right"),
	corner_top_left = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi / 2, {
		75.5,
		75.5,
	}, "corner_top_left"),
	corner_top_right = UIWidgets.create_simple_rotated_texture("store_frame_small_corner", math.pi, {
		75.5,
		75.5,
	}, "corner_top_right"),
	backdrop = UIWidgets.create_simple_texture("store_preview_info_text_backdrop", "backdrop"),
	title = UIWidgets.create_simple_text("store_login_rewards_title", "title", nil, nil, title_text_style),
	description = UIWidgets.create_simple_text("store_login_rewards_desc", "description", nil, nil, body_text_style),
	timer = UIWidgets.create_simple_text(Localize("available_now"), "timer", nil, nil, timer_text_style),
	claim_button = UIWidgets.create_default_button("claim_button", scenegraph_definition.claim_button.size, "button_frame_01_gold", "menu_frame_bg_06", Localize("welcome_currency_popup_button_claim"), 28, nil, "button_detail_03_gold", nil),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, "button_frame_01_gold", "menu_frame_bg_06", Localize("interaction_action_close"), 28, nil, "button_detail_03_gold", nil, DISABLE_WITH_GAMEPAD),
	claim_button_glow = claim_button_glow_definition,
}
local day_widget_definitions = Script.new_array(DAYS)

for i = 1, DAYS do
	day_widget_definitions[i] = create_day_widget(i)
end

local animation_definitions = {
	on_enter = {
		{
			duration = 0.3,
			name = "fade_in",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				params.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				params.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = NOP,
		},
		{
			duration = 0.8,
			name = "slide_in",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				ui_scenegraph.window.local_position[2] = 432
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				ui_scenegraph.window.local_position[2] = math.round(432 * (1 - math.ease_out_elastic(progress)))
			end,
			on_complete = NOP,
		},
		{
			delay = 0.5,
			duration = 0.8,
			name = "fade_in_glows",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				widgets.background_glows.content.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				widgets.background_glows.content.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = NOP,
		},
	},
	on_exit = {
		{
			duration = 0.3,
			name = "fade_out",
			init = function (ui_scenegraph, _scenegraph_definition, widgets, params)
				params.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widgets, progress, params)
				params.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = NOP,
		},
	},
	on_claim = {
		{
			duration = 0.25,
			name = "sigil",
			init = function (ui_scenegraph, _scenegraph_definition, widget, params)
				local claimed_style = widget.style.claimed

				params.og_size_x = claimed_style.texture_size[1]
				params.og_size_y = claimed_style.texture_size[2]
				claimed_style.color[1] = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widget, progress, params)
				local t = math.easeInCubic(progress)
				local claimed_style = widget.style.claimed

				claimed_style.texture_size[1] = (3 - 2 * t) * params.og_size_x
				claimed_style.texture_size[2] = (3 - 2 * t) * params.og_size_y
				claimed_style.color[1] = 255 * t
			end,
			on_complete = NOP,
		},
		{
			delay = 0.5,
			duration = 0.5,
			name = "fade_in_glow",
			init = function (ui_scenegraph, _scenegraph_definition, widget, params)
				widget.style.glow.color[1] = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widget, progress, params)
				widget.style.glow.color[1] = 255 * progress
			end,
			on_complete = NOP,
		},
		{
			delay = 0.5,
			duration = 0.5,
			name = "fade_in_bottom_glow",
			init = function (ui_scenegraph, _scenegraph_definition, widget, params)
				widget.style.bottom_glow.color[1] = 0
			end,
			update = function (ui_scenegraph, _scenegraph_definition, widget, progress, params)
				widget.style.bottom_glow.color[1] = 255 * progress
			end,
			on_complete = NOP,
		},
		{
			delay = 0,
			duration = 1.5,
			name = "delay",
			init = NOP,
			update = NOP,
			on_complete = NOP,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_tooltip",
			input_action = "right_stick_press",
			priority = 2,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
	claim_available = {
		{
			description_text = "welcome_currency_popup_button_claim",
			input_action = "confirm",
			priority = 1,
		},
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 2,
		},
		{
			description_text = "input_description_tooltip",
			input_action = "right_stick_press",
			priority = 3,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 4,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	loading_widgets_definitions = loading_widgets_definitions,
	overlay_widgets_definitions = overlay_widgets_definitions,
	widget_definitions = widget_definitions,
	day_widget_definitions = day_widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	create_reward_item_widget = create_reward_item_widget,
	day_count = DAYS,
}
