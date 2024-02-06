-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_chaos_god_information_definitions.lua

local WIDGET_SIZE = {
	380,
	200,
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
	root_fit = {
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
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			WIDGET_SIZE[1],
			WIDGET_SIZE[2],
		},
		position = {
			150,
			-170,
			1,
		},
	},
	extra_curse = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			WIDGET_SIZE[1],
			WIDGET_SIZE[2],
		},
		position = {
			600,
			-170,
			1,
		},
	},
}

local function create_widget(scenegraph_id)
	local widget = {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					content_id = "glow_top",
					pass_type = "texture_uv",
					style_id = "glow_top",
				},
				{
					pass_type = "texture",
					style_id = "glow_bottom",
					texture_id = "glow_bottom",
				},
				{
					pass_type = "texture",
					style_id = "header",
					texture_id = "header",
				},
				{
					pass_type = "texture",
					style_id = "glow_icon",
					texture_id = "glow_icon",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "text",
					style_id = "title",
					text_id = "title",
				},
				{
					pass_type = "text",
					style_id = "subtitle",
					text_id = "subtitle",
				},
				{
					pass_type = "text",
					style_id = "body",
					text_id = "body",
				},
			},
		},
		content = {
			background = "morris_gaze_background",
			body = "n/a",
			glow_bottom = "morris_gaze_glow",
			glow_icon = "circular_gradient",
			header = "morris_gaze_header",
			icon = "icons_placeholder",
			subtitle = "n/a",
			theme = "khorne",
			title = "n/a",
			glow_top = {
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
		},
		style = {
			background = {},
			glow_top = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					315,
					42,
				},
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				offset = {
					-3,
					-5,
					1,
				},
			},
			glow_bottom = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					315,
					42,
				},
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				offset = {
					-3,
					-25,
					2,
				},
			},
			header = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					387,
					157,
				},
				offset = {
					-3,
					70,
					3,
				},
			},
			glow_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				texture_size = {
					120,
					120,
				},
				offset = {
					-3,
					95,
					4,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				color = Colors.get_color_table_with_alpha("white", 0),
				texture_size = {
					102,
					106,
				},
				offset = {
					-3,
					100,
					5,
				},
			},
			title = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("tzeentch", 255),
				offset = {
					15,
					-6,
					6,
				},
				size = {
					WIDGET_SIZE[1] - 30,
					WIDGET_SIZE[2],
				},
			},
			subtitle = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-40,
					7,
				},
				size = {
					WIDGET_SIZE[1],
					WIDGET_SIZE[2],
				},
			},
			body = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					40,
					20,
					8,
				},
				size = {
					WIDGET_SIZE[1] - 80,
					WIDGET_SIZE[2] - 40 - 64,
				},
			},
		},
	}

	return widget
end

local widgets = {
	god_info_widget = create_widget("window"),
	belakor_info_widget = create_widget("extra_curse"),
}
local animation_definitions = {
	on_enter = {
		{
			duration = 0.3,
			name = "fade_in",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = NOP,
		},
	},
	on_exit = {
		{
			duration = 0.3,
			name = "fade_out",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = NOP,
		},
	},
	set_theme = {
		{
			delay = 0,
			duration = 0.5,
			name = "fade_in",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local theme_settings = params.theme_settings
				local theme_color = theme_settings.curse_description_color
				local style = widget.style

				style.glow_top.color[1] = 0
				style.glow_bottom.color[1] = 0
				style.glow_icon.color[1] = 0

				Colors.copy_no_alpha_to(style.glow_top.color, theme_color)
				Colors.copy_no_alpha_to(style.glow_bottom.color, theme_color)
				Colors.copy_no_alpha_to(style.glow_icon.color, theme_color)
				Colors.copy_no_alpha_to(style.title.text_color, theme_color)

				local content = widget.content

				content.icon = theme_settings.icon
				content.title = theme_settings.journey_title

				local localized_deity_name = Localize(theme_settings.deity_name or "lb_unknown")

				content.body = string.format(Localize("gaze_information"), localized_deity_name)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local style = widget.style

				progress = math.easeInCubic(progress)

				local alpha = 255 * progress

				style.glow_top.color[1] = alpha
				style.glow_bottom.color[1] = alpha
				style.glow_icon.color[1] = alpha
			end,
			on_complete = NOP,
		},
		{
			delay = 0,
			duration = 0.25,
			name = "fade_in_icon",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.style.icon.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				progress = math.easeInCubic(progress)
				widget.style.icon.color[1] = 255 * progress
			end,
			on_complete = NOP,
		},
	},
	set_theme_belakor = {
		{
			delay = 0,
			duration = 0.5,
			name = "fade_in",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				local theme_settings = params.theme_settings
				local theme_color = theme_settings.curse_description_color
				local style = widget.style

				style.glow_top.color[1] = 0
				style.glow_bottom.color[1] = 0
				style.glow_icon.color[1] = 0

				Colors.copy_no_alpha_to(style.glow_top.color, theme_color)
				Colors.copy_no_alpha_to(style.glow_bottom.color, theme_color)
				Colors.copy_no_alpha_to(style.glow_icon.color, theme_color)
				Colors.copy_no_alpha_to(style.title.text_color, theme_color)

				local content = widget.content

				content.icon = theme_settings.icon
				content.title = theme_settings.journey_title

				local localized_deity_name = Localize(theme_settings.deity_name or "lb_unknown")

				content.body = string.format(Localize("gaze_information"), localized_deity_name)
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local style = widget.style

				progress = math.easeInCubic(progress)

				local alpha = 255 * progress

				style.glow_top.color[1] = alpha
				style.glow_bottom.color[1] = alpha
				style.glow_icon.color[1] = alpha
			end,
			on_complete = NOP,
		},
		{
			delay = 0,
			duration = 0.25,
			name = "fade_in_icon",
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.style.icon.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				progress = math.easeInCubic(progress)
				widget.style.icon.color[1] = 255 * progress
			end,
			on_complete = NOP,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	animation_definitions = animation_definitions,
}
