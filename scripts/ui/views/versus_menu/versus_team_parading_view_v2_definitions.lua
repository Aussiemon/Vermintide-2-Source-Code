-- chunkname: @scripts/ui/views/versus_menu/versus_team_parading_view_v2_definitions.lua

local player_name_box_size = {
	474,
	46,
}
local scenegraph_position = {
	screen = {
		0,
		0,
		UILayer.default,
	},
	bottom_bar = {
		0,
		0,
		10,
	},
	bottom_bar_detail = {
		0,
		0,
		1,
	},
	center_pivot = {
		0,
		0,
		1,
	},
	player_portrait_anchor_1 = {
		528,
		200,
		20,
	},
	player_portrait_anchor_2 = {
		816,
		200,
		20,
	},
	player_portrait_anchor_3 = {
		1104,
		200,
		20,
	},
	player_portrait_anchor_4 = {
		1392,
		200,
		20,
	},
}
local scenegraph_size = {
	screen = {
		1920,
		1080,
	},
	bottom_bar = {
		1920,
		250,
	},
	bottom_bar_detail = {
		1920,
		10,
	},
	center_pivot = {
		0,
		0,
	},
	player_portrait_anchor_1 = player_portrait_anchor_size,
	player_portrait_anchor_2 = player_portrait_anchor_size,
	player_portrait_anchor_3 = player_portrait_anchor_size,
	player_portrait_anchor_4 = player_portrait_anchor_size,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = scenegraph_size.screen,
		position = scenegraph_position.screen,
	},
	bottom_bar = {
		horizontal_alignment = "center",
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = scenegraph_size.bottom_bar,
		position = scenegraph_position.bottom_bar,
	},
	bottom_bar_detail = {
		horizontal_alignment = "center",
		parent = "bottom_bar",
		vertical_alignment = "top",
		size = scenegraph_size.bottom_bar_detail,
		position = scenegraph_position.bottom_bar_detail,
	},
	top_bar_detail = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = scenegraph_size.bottom_bar_detail,
		position = scenegraph_position.bottom_bar,
	},
	center_pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = scenegraph_size.center_pivot,
		position = scenegraph_position.center_pivot,
	},
	player_portrait_anchor_1 = {
		horizontal_alignment = "center",
		parent = "bottom_bar",
		vertical_alignment = "center",
		size = scenegraph_size.player_portrait_anchor_1,
		position = scenegraph_position.player_portrait_anchor_1,
	},
	player_portrait_anchor_2 = {
		horizontal_alignment = "center",
		parent = "bottom_bar",
		vertical_alignment = "center",
		size = scenegraph_size.player_portrait_anchor_2,
		position = scenegraph_position.player_portrait_anchor_2,
	},
	player_portrait_anchor_3 = {
		horizontal_alignment = "center",
		parent = "bottom_bar",
		vertical_alignment = "center",
		size = scenegraph_size.player_portrait_anchor_3,
		position = scenegraph_position.player_portrait_anchor_3,
	},
	player_portrait_anchor_4 = {
		horizontal_alignment = "center",
		parent = "bottom_bar",
		vertical_alignment = "center",
		size = scenegraph_size.player_portrait_anchor_4,
		position = scenegraph_position.player_portrait_anchor_4,
	},
}
local team_text_style = {
	font_size = 150,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("local_player_team", 255),
	offset = {
		0,
		-10,
		2,
	},
}

function create_rotated_texture(texture, angle, size, pivot, scenegraph_id, color, layer, offset)
	return {
		alpha_multiplier = 0,
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = texture,
		},
		style = {
			texture_id = {
				angle = angle,
				pivot = pivot,
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					layer or 0,
				},
				texture_size = size,
			},
		},
		offset = offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

function create_player_name_career_text(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "player_name",
					text_id = "player_name",
				},
				{
					pass_type = "text",
					style_id = "career_name",
					text_id = "career_name",
				},
			},
		},
		content = {
			career_name = "n/a",
			player_name = "n/a",
		},
		style = {
			player_name = {
				font_size = 30,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("local_player_team", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			career_name = {
				font_size = 30,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-30,
					2,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			-960,
			0,
			10,
		},
	}
end

local bottom_widgets_definitions = {
	bottom_background = UIWidgets.create_simple_rect("bottom_bar", Colors.get_color_table_with_alpha("black", 185)),
	bottom_background_detail = UIWidgets.create_simple_rect("bottom_bar_detail", Colors.get_color_table_with_alpha("local_player_team", 255)),
}
local top_widgets_definitions = {
	team_text = UIWidgets.create_simple_text("HAMMERS", "top_bar_detail", nil, nil, team_text_style),
	top_background_detail = UIWidgets.create_simple_rect("top_bar_detail", Colors.get_color_table_with_alpha("local_player_team", 255)),
	team_flag = UIWidgets.create_simple_texture("team_one_banner", "top_bar_detail", nil, nil, {
		255,
		255,
		255,
		255,
	}, {
		50,
		-252,
		0,
	}, {
		156,
		252,
	}),
}
local vs_text_size = {
	512,
	512,
}
local vs_text_offset = {
	-vs_text_size[1] / 2,
	-vs_text_size[1] / 2,
	0,
}
local slim_background_size = {
	2300,
	50,
}
local thick_background_size = {
	2300,
	500,
}
local slim_background_offset = {
	-1160,
	250,
	0,
}
local thick_background_offset = {
	-1160,
	-300,
	0,
}
local transition_widget_definitions = {
	background = UIWidgets.create_simple_rect("screen", Colors.get_color_table_with_alpha("black", 255)),
}
local view_settings = {
	level_name = "levels/carousel_podium/world",
}
local animation_definitions = {
	on_enter_local_player = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local top_widgets = self._top_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(portrait_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = 0
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local top_widgets = self._top_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(portrait_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local self = params.self
				local transition_widgets = self._transition_widgets

				for _, widget in ipairs(transition_widgets) do
					widget.alpha_multiplier = 0
				end
			end,
		},
		{
			end_progress = 0.8,
			name = "slide_up_bottom_widgets",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					local y = -250 + 250 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end

				for _, widget in ipairs(portrait_widgets) do
					local y = -200 + 200 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end

				for _, widget in ipairs(player_name_widgets) do
					local y = -270 + 50 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1,
			name = "slide_in_top_widgets",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local anim_quad_progress = math.ease_out_quad(progress)
				local self = params.self
				local team_name = self._widgets_by_name.team_text
				local top_detail = self._widgets_by_name.top_background_detail
				local team_banner = self._widgets_by_name.team_flag
				local x_text = -1664 + 1920 * anim_quad_progress
				local offset = team_name.offset

				offset[1] = x_text

				local x_detail = 1920 - 1920 * anim_progress
				local detail_offset = top_detail.offset

				detail_offset[1] = x_detail

				local y_banner = -252 + 252 * (1 - anim_progress)
				local banner_offset = team_banner.offset

				banner_offset[2] = y_banner
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	team_transition_fade_in = {
		{
			end_progress = 0.25,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local transition_widgets = self._transition_widgets
				local top_widgets = self._top_widgets

				for _, widget in ipairs(bottom_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(transition_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = 0
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local transition_widgets = self._transition_widgets

				for _, widget in ipairs(transition_widgets) do
					widget.alpha_multiplier = anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.25,
			name = "slide_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local self = params.self
				local opponent_team_data = self._opponents_party_data

				self:_change_team_info(opponent_team_data)
			end,
		},
	},
	on_enter_opponent_team = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(portrait_widgets) do
					widget.alpha_multiplier = 0
				end

				for _, widget in ipairs(player_name_widgets) do
					widget.alpha_multiplier = 0
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local top_widgets = self._top_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(portrait_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(top_widgets) do
					widget.alpha_multiplier = anim_progress
				end

				for _, widget in ipairs(player_name_widgets) do
					widget.alpha_multiplier = anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "slide_up_bottom_widgets",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local bottom_widgets = self._bottom_widgets
				local portrait_widgets = self._team_portrait_frame_widgets
				local player_name_widgets = self._player_name_widgets

				for _, widget in ipairs(bottom_widgets) do
					local y = -250 + 250 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end

				for _, widget in ipairs(portrait_widgets) do
					local y = -200 + 200 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end

				for _, widget in ipairs(player_name_widgets) do
					local y = -270 + 50 * anim_progress
					local offset = widget.offset

					offset[2] = y
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1,
			name = "slide_in_top_widgets",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local anim_quad_progress = math.ease_out_quad(progress)
				local self = params.self
				local team_name = self._widgets_by_name.team_text
				local top_detail = self._widgets_by_name.top_background_detail
				local team_banner = self._widgets_by_name.team_flag
				local ui_renderer = self._ui_top_renderer
				local text_style = team_name.style.text
				local text = team_name.content.text
				local width = UIUtils.get_text_width(ui_renderer, text_style, text)
				local x_text = 1920 - width - 250 + 1920 * (1 - anim_quad_progress)
				local offset = team_name.offset

				offset[1] = x_text

				local x_detail = 0 + -3840 * (1 - anim_progress)
				local detail_offset = top_detail.offset

				detail_offset[1] = x_detail

				local y_banner = -252 + 252 * (1 - anim_progress)
				local banner_offset = team_banner.offset

				banner_offset[2] = y_banner
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	team_transition_fade_out = {
		{
			end_progress = 0.25,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local self = params.self
				local transition_widgets = self._transition_widgets

				for _, widget in ipairs(transition_widgets) do
					widget.alpha_multiplier = 1 - anim_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 1,
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
	scenegraph_definition = scenegraph_definition,
	bottom_widgets_definitions = bottom_widgets_definitions,
	top_widgets_definitions = top_widgets_definitions,
	animation_definitions = animation_definitions,
	transition_widget_definitions = transition_widget_definitions,
	create_player_name_career_text = create_player_name_career_text,
	view_settings = view_settings,
}
