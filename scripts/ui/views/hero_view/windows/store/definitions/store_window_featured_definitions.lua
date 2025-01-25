-- chunkname: @scripts/ui/views/hero_view/windows/store/definitions/store_window_featured_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local MAX_SLIDESHOW_ITEMS = 10
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	discount_banner = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			800,
			64,
		},
		position = {
			0,
			-81,
			0,
		},
	},
	slideshow = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			920,
			0,
		},
		position = {
			100,
			-160,
			10,
		},
	},
	list_window = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			788,
			0,
		},
		position = {
			-100,
			-160,
			10,
		},
	},
	item_root = {
		horizontal_alignment = "left",
		parent = "list_window",
		vertical_alignment = "top",
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
	fence = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			153,
		},
		position = {
			0,
			35,
			UILayer.default + 30,
		},
	},
	skull_front_left = {
		horizontal_alignment = "left",
		parent = "fence",
		vertical_alignment = "center",
		size = {
			287,
			258,
		},
		position = {
			-1,
			15,
			1,
		},
	},
	skull_front_right = {
		horizontal_alignment = "right",
		parent = "fence",
		vertical_alignment = "center",
		size = {
			287,
			258,
		},
		position = {
			1,
			15,
			1,
		},
	},
	skull_back_left = {
		horizontal_alignment = "left",
		parent = "fence",
		vertical_alignment = "center",
		size = {
			287,
			258,
		},
		position = {
			-1,
			15,
			-1,
		},
	},
	skull_back_right = {
		horizontal_alignment = "right",
		parent = "fence",
		vertical_alignment = "center",
		size = {
			287,
			258,
		},
		position = {
			1,
			15,
			-1,
		},
	},
	login_rewards = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			375,
			68,
		},
		position = {
			-350,
			120,
			20,
		},
	},
}

local function create_login_rewards_button(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size
	local frame_settings = UIFrameSettings.button_frame_01_gold
	local glow_settings = UIFrameSettings.frame_outer_glow_01
	local glow_width = glow_settings.texture_sizes.horizontal[2]
	local side_detail_texture = "button_detail_09_gold"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "tiled_texture",
					style_id = "bg",
					texture_id = "bg",
				},
				{
					pass_type = "texture",
					style_id = "bg_fade",
					texture_id = "bg_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
				},
				{
					pass_type = "texture_frame",
					style_id = "outer_glow",
					texture_id = "outer_glow",
					content_check_function = function (content)
						return content.is_claimable
					end,
					content_change_function = function (content, style)
						style.color[1] = 150 + 105 * math.sin(5 * Managers.time:time("ui"))
					end,
				},
				{
					pass_type = "text",
					style_id = "title",
					text_id = "title",
				},
				{
					pass_type = "text",
					style_id = "title_shadow",
					text_id = "title",
				},
				{
					pass_type = "text",
					style_id = "subtitle",
					text_id = "subtitle",
				},
			},
		},
		content = {
			bg = "menu_frame_bg_07",
			bg_fade = "button_bg_fade",
			glass = "game_options_fg",
			glass_bottom = "button_glass_02",
			glass_top = "button_glass_01",
			hover_glow = "button_state_default",
			subtitle = "n/a",
			title = "store_login_rewards_title",
			button_hotspot = {},
			frame = frame_settings.texture,
			side_detail = {
				uvs = {
					{
						1,
						0,
					},
					{
						0,
						1,
					},
				},
				texture_id = side_detail_texture,
			},
			outer_glow = glow_settings.texture,
		},
		style = {
			bg = {
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
				texture_tiling_size = {
					512,
					256,
				},
			},
			bg_fade = {
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
			},
			hover_glow = {
				vertical_alignment = "bottom",
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
				texture_size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			glass = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			glass_top = {
				vertical_alignment = "top",
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
				texture_size = {
					size[1],
					11,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					0,
					0,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			side_detail_left = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-55,
					0,
					10,
				},
				texture_size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					55,
					0,
					10,
				},
				texture_size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
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
					4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			title = {
				dynamic_font_size = true,
				font_size = 38,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					30,
					0,
					6,
				},
				size = {
					size[1] - 60,
					size[2],
				},
			},
			title_shadow = {
				dynamic_font_size = true,
				font_size = 38,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					32,
					-2,
					5,
				},
				size = {
					size[1] - 60,
					size[2],
				},
			},
			subtitle = {
				font_size = 25,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-65,
					6,
				},
			},
		},
	}
end

local function create_slideshow_definition(scenegraph_id, size)
	local frame_name = "menu_frame_16"
	local frame_settings = UIFrameSettings[frame_name]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local masked = false
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "hotspot",
			pass_type = "hotspot",
			style_id = "hotspot",
		},
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "rect",
			style_id = "text_background",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "description_text",
			text_id = "description_text",
		},
		{
			pass_type = "text",
			style_id = "description_text_shadow",
			text_id = "description_text",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
		{
			pass_type = "texture",
			style_id = "timer_bg",
			texture_id = "timer_bg",
		},
		{
			content_id = "timer_bar",
			pass_type = "texture_uv",
			style_id = "timer_bar",
		},
		{
			content_id = "icon_1",
			pass_type = "texture_uv",
			style_id = "icon_1",
		},
		{
			content_id = "icon_2",
			pass_type = "texture_uv",
			style_id = "icon_2",
		},
		{
			pass_type = "texture",
			style_id = "hourglass_icon",
			texture_id = "hourglass_icon",
			content_check_function = function (content)
				return content.show_hourglass
			end,
		},
		{
			content_id = "list_content",
			pass_type = "list_pass",
			style_id = "list_style",
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
			},
		},
	}
	local content = {
		description_text = "n/a",
		hourglass_icon = "icon_store_timer",
		rect = "rect_masked",
		timer_bg = "store_slideshow_bg",
		title_text = "n/a",
		wait_time = 3,
		hotspot = {},
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		timer_bar = {
			texture_id = "store_slideshow_fill",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
		icon_1 = {
			texture_id = "icons_placeholder",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
		icon_2 = {
			texture_id = "icons_placeholder",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
		size = size,
		list_content = {
			allow_multi_hover = true,
		},
	}
	local list_content = content.list_content

	for i = 1, MAX_SLIDESHOW_ITEMS do
		list_content[i] = {
			background = "store_slideshow_off",
			icon = "store_slideshow_on",
			button_hotspot = {},
		}
	end

	local style = {
		hotspot = {
			size = size,
			offset = {
				0,
				-size[2],
				0,
			},
		},
		title_text = {
			dynamic_font_size = true,
			dynamic_font_size_word_wrap = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1] * 0.33 - 30,
				110,
			},
			area_size = {
				size[1] * 0.33 + 25,
				100,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				15,
				-110,
				6,
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			dynamic_font_size_word_wrap = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1] * 0.33 - 30,
				110,
			},
			area_size = {
				size[1] * 0.33 + 25,
				100,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				17,
				-112,
				5,
			},
		},
		description_text = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] * 0.33,
				size[2] - 120,
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				15,
				-size[2],
				6,
			},
		},
		description_text_shadow = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] * 0.33,
				size[2] - 120,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				17,
				-size[2] - 2,
				5,
			},
		},
		background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			texture_size = size,
			color = {
				200,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		text_background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			texture_size = {
				size[1] * 0.33 + 30,
				size[2],
			},
			color = {
				150,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		timer_bar = {
			horizontal_alignment = "left",
			texture_width = 144,
			vertical_alignment = "bottom",
			size = size,
			masked = masked,
			texture_size = {
				0,
				3,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - 72,
				-size[2] + 10 + 3,
				9,
			},
		},
		timer_bg = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			size = size,
			masked = masked,
			texture_size = {
				150,
				9,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-size[2] + 10,
				8,
			},
		},
		icon_1 = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			texture_size = size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		icon_2 = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			texture_size = size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			frame_margins = {
				0,
				0,
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
				5,
			},
		},
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
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
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
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
				12,
			},
		},
		hourglass_icon = {
			horizontal_alignment = "right",
			vertical_alignment = "top",
			offset = {
				0,
				0,
				10,
			},
			texture_size = {
				49.5,
				58.5,
			},
		},
		list_style = {
			num_draws = 0,
			start_index = 1,
			offset = {
				0,
				-size[2] + 20,
				9,
			},
			list_member_offset = {
				0,
				0,
				0,
			},
			size = {
				33,
				39,
			},
			item_styles = {},
		},
	}
	local item_styles = style.list_style.item_styles

	for i = 1, MAX_SLIDESHOW_ITEMS do
		item_styles[i] = {
			list_member_offset = {
				33,
				0,
				0,
			},
			size = {
				33,
				39,
			},
			background = {
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
					0,
				},
			},
			icon = {
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
			},
		}
	end

	widget.element.passes = passes
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

local function create_discount_banner(scenegraph_id)
	local size = scenegraph_definition[scenegraph_id].size
	local frame_name = "button_frame_03_gold"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_spacing = frame_settings.texture_sizes.horizontal[2]

	return {
		scenegraph_id = scenegraph_id,
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rect",
					style_id = "bg",
					texture_id = "bg",
				},
				{
					pass_type = "tiled_texture",
					style_id = "bg_texture",
					texture_id = "bg_texture",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass_bottom",
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text_shadow",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_change_function = function (content, style)
						local s = 0.5 + math.sin(Managers.time:time("ui") * 3) * 0.5

						style.color[1] = 215 + 40 * s
					end,
				},
			},
		},
		content = {
			bg_texture = "button_bg_01",
			glass = "athanor_panel_front_glass",
			glass_bottom = "button_glass_02",
			glass_top = "button_glass_01",
			glow = "tab_menu_glow",
			icon = "icon_store_timer",
			text = "n/a",
			text_shadow = "n/a",
			visible = false,
			hotspot = {},
			frame = frame_settings.texture,
		},
		style = {
			bg = {
				color = {
					255,
					66,
					0,
					0,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			bg_texture = {
				color = {
					179,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
				texture_tiling_size = {
					480,
					270,
				},
			},
			glass_top = {
				vertical_alignment = "top",
				texture_size = {
					size[1],
					5,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			glass_bottom = {
				vertical_alignment = "bottom",
				texture_size = {
					size[1],
					5,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			glass = {
				offset = {
					0,
					0,
					4,
				},
			},
			glow = {
				offset = {
					0,
					0,
					5,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					44,
					46,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					0,
					6,
				},
			},
			text = {
				dynamic_font_size = true,
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					50,
					5,
					7,
				},
				size = {
					size[1] - 100,
					size[2],
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					51,
					4,
					6,
				},
				size = {
					size[1] - 100,
					size[2],
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				area_size = size,
				offset = {
					0,
					0,
					8,
				},
			},
		},
	}
end

local content_widgets = {
	slideshow = create_slideshow_definition("slideshow", {
		920,
		680,
	}),
}
local widgets = {
	discount_banner = create_discount_banner("discount_banner"),
	skull_front_right = UIWidgets.create_simple_uv_texture("store_fence_skulls_front", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "skull_front_right"),
	skull_front_left = UIWidgets.create_simple_uv_texture("store_fence_skulls_front", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "skull_front_left"),
	skull_back_right = UIWidgets.create_simple_uv_texture("store_fence_skulls_back", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "skull_back_right"),
	skull_back_left = UIWidgets.create_simple_uv_texture("store_fence_skulls_back", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "skull_back_left"),
	login_rewards_button = create_login_rewards_button("login_rewards"),
	gotwf_rewards_button = create_login_rewards_button("login_rewards"),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fence_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.content_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.content_alpha_multiplier = anim_progress
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
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	featured = {
		{
			description_text = "input_description_previous",
			input_action = "trigger_cycle_previous",
			priority = 1,
		},
		{
			description_text = "input_description_next",
			input_action = "trigger_cycle_next",
			priority = 2,
		},
		{
			description_text = "buy_now",
			input_action = "confirm",
			priority = 3,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 4,
		},
		{
			description_text = "store_login_claim_reward_title",
			input_action = "special_1",
			priority = 5,
		},
	},
}

return {
	generic_input_actions = generic_input_actions,
	max_slideshow_items = MAX_SLIDESHOW_ITEMS,
	widgets = widgets,
	content_widgets = content_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
