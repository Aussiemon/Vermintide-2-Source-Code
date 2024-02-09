-- chunkname: @scripts/ui/round_end_emblem_popup/round_end_emblem_popup_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local background_texture = "emblem_gold_back"
local background_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
local background_size = background_settings.size
local arm_inner_left_texture = "emblem_gold_left_arm_inner"
local arm_inner_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_inner_left_texture)
local arm_inner_left_size = arm_inner_left_settings.size
local arm_inner_right_texture = "emblem_gold_right_arm_inner"
local arm_inner_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_inner_right_texture)
local arm_inner_right_size = arm_inner_right_settings.size
local arm_outer_left_texture = "emblem_gold_left_arm_outer"
local arm_outer_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_outer_left_texture)
local arm_outer_left_size = arm_outer_left_settings.size
local arm_outer_right_texture = "emblem_gold_right_arm_outer"
local arm_outer_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_outer_right_texture)
local arm_outer_right_size = arm_outer_right_settings.size
local inner_left_texture = "emblem_gold_left_inner"
local inner_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inner_left_texture)
local inner_left_size = inner_left_settings.size
local inner_right_texture = "emblem_gold_right_inner"
local inner_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inner_right_texture)
local inner_right_size = inner_right_settings.size
local outer_left_texture = "emblem_gold_left_outer"
local outer_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(outer_left_texture)
local outer_left_size = outer_left_settings.size
local outer_right_texture = "emblem_gold_right_outer"
local outer_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(outer_right_texture)
local outer_right_size = outer_right_settings.size
local skull_texture = "emblem_gold_middle"
local skull_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(skull_texture)
local skull_size = skull_settings.size
local medalion_texture = "emblem_gold_top"
local medalion_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(medalion_texture)
local medalion_size = medalion_settings.size
local smoke_background_texture = "emblem_smoke_big"
local smoke_background_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_background_texture)
local smoke_background_size = smoke_background_settings.size
local smoke_skull_texture = "emblem_smoke_middle"
local smoke_skull_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_skull_texture)
local smoke_skull_size = smoke_skull_settings.size
local smoke_wing_texture = "emblem_smoke_side"
local smoke_wing_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_wing_texture)
local smoke_wing_size = smoke_wing_settings.size
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			30,
			1,
		},
		size = {
			0,
			0,
		},
	},
	title_title = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			-210,
			1,
		},
		size = {
			1200,
			50,
		},
	},
	sub_title_text = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			-255,
			1,
		},
		size = {
			1200,
			50,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = background_size,
	},
	smoke_background = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = smoke_background_size,
	},
	arm_inner_left = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "bottom",
		position = {
			-46,
			-7,
			4,
		},
		size = arm_inner_left_size,
	},
	arm_inner_right = {
		horizontal_alignment = "left",
		parent = "pivot",
		vertical_alignment = "bottom",
		position = {
			46,
			-7,
			4,
		},
		size = arm_inner_right_size,
	},
	smoke_wing_left = {
		horizontal_alignment = "right",
		parent = "arm_inner_left",
		vertical_alignment = "top",
		position = {
			-10,
			0,
			-1,
		},
		size = smoke_wing_size,
	},
	smoke_wing_right = {
		horizontal_alignment = "left",
		parent = "arm_inner_right",
		vertical_alignment = "top",
		position = {
			10,
			0,
			-1,
		},
		size = smoke_wing_size,
	},
	arm_outer_left = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "bottom",
		position = {
			-(arm_outer_left_size[1] - 24),
			arm_outer_left_size[2] + 25,
			5,
		},
		size = arm_outer_left_size,
	},
	arm_outer_right = {
		horizontal_alignment = "left",
		parent = "pivot",
		vertical_alignment = "bottom",
		position = {
			arm_outer_right_size[1] - 24,
			arm_outer_right_size[2] + 25,
			5,
		},
		size = arm_outer_right_size,
	},
	inner_left = {
		horizontal_alignment = "right",
		parent = "arm_inner_left",
		vertical_alignment = "top",
		position = {
			-23,
			-26,
			-3,
		},
		size = inner_left_size,
	},
	inner_right = {
		horizontal_alignment = "left",
		parent = "arm_inner_right",
		vertical_alignment = "top",
		position = {
			23,
			-26,
			-3,
		},
		size = inner_right_size,
	},
	outer_left = {
		horizontal_alignment = "right",
		parent = "arm_outer_left",
		vertical_alignment = "top",
		position = {
			-2,
			-28,
			-3,
		},
		size = outer_left_size,
	},
	outer_right = {
		horizontal_alignment = "left",
		parent = "arm_outer_right",
		vertical_alignment = "top",
		position = {
			2,
			-28,
			-3,
		},
		size = outer_right_size,
	},
	skull = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			12,
			8,
		},
		size = skull_size,
	},
	smoke_skull = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "top",
		position = {
			0,
			0,
			7,
		},
		size = smoke_skull_size,
	},
	medalion = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			86,
			9,
		},
		size = medalion_size,
	},
}
local title_text_style = {
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
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
local sub_title_text_style = {
	font_size = 24,
	font_type = "hell_shark_header",
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
		0,
		2,
	},
}

local function create_emblem_widget(tier_name)
	local background_texture = "emblem_" .. tier_name .. "_back"
	local background_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = background_settings.size
	local arm_inner_left_texture = "emblem_" .. tier_name .. "_left_arm_inner"
	local arm_inner_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_inner_left_texture)
	local arm_inner_left_size = arm_inner_left_settings.size
	local arm_inner_right_texture = "emblem_" .. tier_name .. "_right_arm_inner"
	local arm_inner_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_inner_right_texture)
	local arm_inner_right_size = arm_inner_right_settings.size
	local arm_outer_left_texture = "emblem_" .. tier_name .. "_left_arm_outer"
	local arm_outer_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_outer_left_texture)
	local arm_outer_left_size = arm_outer_left_settings.size
	local arm_outer_right_texture = "emblem_" .. tier_name .. "_right_arm_outer"
	local arm_outer_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(arm_outer_right_texture)
	local arm_outer_right_size = arm_outer_right_settings.size
	local inner_left_texture = "emblem_" .. tier_name .. "_left_inner"
	local inner_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inner_left_texture)
	local inner_left_size = inner_left_settings.size
	local inner_right_texture = "emblem_" .. tier_name .. "_right_inner"
	local inner_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inner_right_texture)
	local inner_right_size = inner_right_settings.size
	local outer_left_texture = "emblem_" .. tier_name .. "_left_outer"
	local outer_left_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(outer_left_texture)
	local outer_left_size = outer_left_settings.size
	local outer_right_texture = "emblem_" .. tier_name .. "_right_outer"
	local outer_right_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(outer_right_texture)
	local outer_right_size = outer_right_settings.size
	local skull_texture = "emblem_" .. tier_name .. "_middle"
	local skull_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(skull_texture)
	local skull_size = skull_settings.size
	local medalion_texture = "emblem_" .. tier_name .. "_top"
	local medalion_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(medalion_texture)
	local medalion_size = medalion_settings.size
	local smoke_background_texture = "emblem_smoke_big"
	local smoke_background_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_background_texture)
	local smoke_background_size = smoke_background_settings.size
	local smoke_skull_texture = "emblem_smoke_middle"
	local smoke_skull_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_skull_texture)
	local smoke_skull_size = smoke_skull_settings.size
	local smoke_wing_texture = "emblem_smoke_side"
	local smoke_wing_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(smoke_wing_texture)
	local smoke_wing_size = smoke_wing_settings.size

	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arm_inner_left",
					texture_id = "arm_inner_left",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arm_inner_right",
					texture_id = "arm_inner_right",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arm_outer_left",
					texture_id = "arm_outer_left",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arm_outer_right",
					texture_id = "arm_outer_right",
				},
				{
					pass_type = "rotated_texture",
					style_id = "inner_left",
					texture_id = "inner_left",
				},
				{
					pass_type = "rotated_texture",
					style_id = "inner_right",
					texture_id = "inner_right",
				},
				{
					pass_type = "rotated_texture",
					style_id = "outer_left",
					texture_id = "outer_left",
				},
				{
					pass_type = "rotated_texture",
					style_id = "outer_right",
					texture_id = "outer_right",
				},
				{
					pass_type = "texture",
					style_id = "skull",
					texture_id = "skull",
				},
				{
					pass_type = "texture",
					style_id = "medalion",
					texture_id = "medalion",
				},
				{
					pass_type = "texture",
					style_id = "smoke_background",
					texture_id = "smoke_background",
				},
				{
					pass_type = "texture",
					style_id = "smoke_skull",
					texture_id = "smoke_skull",
				},
				{
					content_id = "smoke_wing",
					pass_type = "texture_uv",
					style_id = "smoke_wing_left",
					texture_id = "texture_id",
				},
				{
					content_id = "smoke_wing",
					pass_type = "texture",
					style_id = "smoke_wing_right",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			skull = skull_texture,
			medalion = medalion_texture,
			background = background_texture,
			smoke_wing = {
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
				texture_id = smoke_wing_texture,
			},
			smoke_skull = smoke_skull_texture,
			smoke_background = smoke_background_texture,
			outer_left = outer_left_texture,
			outer_right = outer_right_texture,
			inner_left = inner_left_texture,
			inner_right = inner_right_texture,
			arm_inner_left = arm_inner_left_texture,
			arm_inner_right = arm_inner_right_texture,
			arm_outer_left = arm_outer_left_texture,
			arm_outer_right = arm_outer_right_texture,
		},
		style = {
			smoke_background = {
				scenegraph_id = "smoke_background",
				offset = {
					0,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			smoke_skull = {
				scenegraph_id = "smoke_skull",
				offset = {
					0,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			smoke_wing_left = {
				scenegraph_id = "smoke_wing_left",
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
			smoke_wing_right = {
				scenegraph_id = "smoke_wing_right",
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
			skull = {
				scenegraph_id = "skull",
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
			medalion = {
				scenegraph_id = "medalion",
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
			background = {
				scenegraph_id = "background",
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
			outer_left = {
				angle = 0,
				horizontal_alignment = "right",
				scenegraph_id = "outer_left",
				vertical_alignment = "top",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					outer_left_size[1],
					outer_left_size[2],
				},
				texture_size = outer_left_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			outer_right = {
				angle = 0,
				horizontal_alignment = "left",
				scenegraph_id = "outer_right",
				vertical_alignment = "top",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					0,
					outer_right_size[2],
				},
				texture_size = outer_right_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			inner_left = {
				angle = 0,
				horizontal_alignment = "right",
				scenegraph_id = "inner_left",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					inner_left_size[1],
					0,
				},
				texture_size = inner_left_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			inner_right = {
				angle = 0,
				horizontal_alignment = "left",
				scenegraph_id = "inner_right",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					0,
					0,
				},
				texture_size = inner_right_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			arm_inner_left = {
				angle = 0,
				horizontal_alignment = "right",
				scenegraph_id = "arm_inner_left",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					arm_inner_left_size[1],
					0,
				},
				texture_size = arm_inner_left_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			arm_inner_right = {
				angle = 0,
				horizontal_alignment = "left",
				scenegraph_id = "arm_inner_right",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					0,
					0,
				},
				texture_size = arm_inner_right_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			arm_outer_left = {
				angle = 0,
				horizontal_alignment = "right",
				scenegraph_id = "arm_outer_left",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					123,
					31,
				},
				texture_size = arm_outer_left_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			arm_outer_right = {
				angle = 0,
				horizontal_alignment = "left",
				scenegraph_id = "arm_outer_right",
				vertical_alignment = "bottom",
				offset = {
					0,
					0,
					1,
				},
				pivot = {
					arm_outer_right_size[1] - 123,
					31,
				},
				texture_size = arm_outer_right_size,
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local widget_definitions = {
	title_title = UIWidgets.create_simple_text("", "title_title", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text(Localize("interaction_weave_leaderboard"), "sub_title_text", nil, nil, sub_title_text_style),
}

local function ease_elastic(t)
	local s = 1.70158
	local p = 0
	local a = 1

	if t == 0 then
		return 0
	end

	if t == 1 then
		return 1
	end

	if p == 0 then
		p = 0.3
	end

	if a < 1 then
		a = 1
		s = p / 4
	else
		s = p / (2 * math.pi) * math.asin(1 / a)
	end

	return a * math.pow(2, -40 * t) * math.sin((t * 1 - s) * (2 * math.pi) / p) + 1
end

local animations = {
	present_entry = {
		{
			end_progress = 0.1,
			name = "init",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local emblem = widgets.emblem
				local style = emblem.style
				local width = 40
				local height = -100
				local degrees = 50
				local style_name = "arm_inner_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					position[2] = default_position[2] + height
					pass_style.angle = math.degrees_to_radians(degrees)
					pass_style.color[1] = 0
				end

				local style_name = "arm_inner_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					position[2] = default_position[2] + height
					pass_style.angle = math.degrees_to_radians(-degrees)
					pass_style.color[1] = 0
				end

				local style_name = "arm_outer_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1] + 130
					position[2] = default_position[2] + height + 40
					pass_style.angle = math.degrees_to_radians(-degrees)
					pass_style.color[1] = 0
				end

				local style_name = "arm_outer_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1] - 130
					position[2] = default_position[2] + height + 40
					pass_style.angle = math.degrees_to_radians(degrees)
					pass_style.color[1] = 0
				end

				local style_name = "inner_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(degrees - 15)
					pass_style.color[1] = 0
				end

				local style_name = "inner_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(-(degrees - 15))
					pass_style.color[1] = 0
				end

				local style_name = "outer_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(-(degrees - 15))
					pass_style.color[1] = 0
				end

				local style_name = "outer_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(degrees - 15)
					pass_style.color[1] = 0
				end

				local style_name = "medalion"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "skull"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "background"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "smoke_background"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "smoke_skull"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "smoke_wing_left"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end

				local style_name = "smoke_wing_right"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = 0
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.1,
			name = "init_title_text",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local title_title = widgets.title_title
				local sub_title_text = widgets.sub_title_text

				title_title.alpha_multiplier = 0
				sub_title_text.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "overall_alpha_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
				params.render_settings.blur_progress = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "versus_round_end_coin_bird_finnish")
			end,
		},
		{
			end_progress = 0.5,
			name = "background_entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local size_anim_fraction = math.easeOutCubic(1 - anim_progress)
				local alpha_progress = math.easeInCubic(anim_progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 0.5
				local alpha = 255 * alpha_progress
				local style_name = "background"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[1] = default_size[1] + default_size[1] * size_fraction * size_anim_fraction
					size[2] = default_size[2] + default_size[2] * size_fraction * size_anim_fraction
					pass_style.color[1] = alpha
				end

				local style_name = "skull"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[1] = default_size[1] + default_size[1] * size_fraction * size_anim_fraction
					size[2] = default_size[2] + default_size[2] * size_fraction * size_anim_fraction
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1,
			name = "background_smoke",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = 1 - math.easeOutCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 1
				local alpha = 255 * alpha_progress
				local style_name = "smoke_background"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[1] = default_size[1] + default_size[1] * size_fraction * progress
					size[2] = default_size[2] + default_size[2] * size_fraction * progress
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.75,
			name = "skull_bounce",
			start_progress = 0.45,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local bounce_progress = math.ease_pulse(math.easeCubic(progress))
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 0.03
				local style_name = "skull"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[1] = default_size[1] + default_size[1] * size_fraction * bounce_progress
					size[2] = default_size[2] + default_size[1] * size_fraction * bounce_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.9,
			name = "fade_in_arms",
			start_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeInCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local alpha = 255 * alpha_progress
				local style_name = "arm_inner_left"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "arm_inner_right"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "arm_outer_left"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "arm_outer_right"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.2,
			name = "move_up",
			start_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local position_anim_fraction = 1 - math.easeCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local width = 40
				local height = -100
				local degrees = 50
				local style_name = "arm_inner_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					position[2] = default_position[2] + height * position_anim_fraction
				end

				local style_name = "arm_inner_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					position[2] = default_position[2] + height * position_anim_fraction
				end

				local style_name = "arm_outer_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[2] = default_position[2] + height * position_anim_fraction + 40
				end

				local style_name = "arm_outer_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[2] = default_position[2] + height * position_anim_fraction + 40
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.25,
			name = "fade_in_wings",
			start_progress = 1.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeInCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local alpha = 255 * alpha_progress
				local style_name = "inner_left"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "inner_right"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "outer_left"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end

				local style_name = "outer_right"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.1,
			name = "fade_in_medalion",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.ease_out_exp(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local alpha = 255 * alpha_progress
				local style_name = "medalion"
				local pass_style = style[style_name]

				if pass_style then
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.3,
			name = "move_medalion",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - math.ease_out_exp(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local height = 200 * anim_progress
				local style_name = "medalion"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[2] = default_position[2] + height
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.55,
			name = "skull_bounce_down",
			start_progress = 1.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local bounce_progress = math.ease_pulse(math.easeOutCubic(progress))
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 0.03
				local style_name = "skull"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[2] = default_position[2] - 5 * bounce_progress
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.15,
			name = "smoke_skull",
			start_progress = 1.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = 1 - math.easeOutCubic(progress)
				local size_progress = math.easeOutCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 0.6
				local alpha = 255 * alpha_progress
				local style_name = "smoke_skull"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[2] = default_size[2] / 2 + default_size[2] * size_fraction * size_progress
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.6,
			name = "smoke_wings",
			start_progress = 1.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha_progress = 1 - math.easeOutCubic(progress)
				local size_progress = math.easeOutCubic(progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local size_fraction = 0.6
				local alpha = 255 * alpha_progress
				local style_name = "smoke_wing_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[2] = default_size[2] + default_size[2] * size_fraction * size_progress
					pass_style.color[1] = alpha
				end

				local style_name = "smoke_wing_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local size = ui_scenegraph[scenegraph_id].size
					local default_size = scenegraph_definition[scenegraph_id].size

					size[2] = default_size[2] + default_size[2] * size_fraction * size_progress
					pass_style.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.1,
			name = "fold_out",
			start_progress = 1.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local elastic_progress = ease_elastic(progress)
				local anim_progress = 1 - math.easeInCubic(elastic_progress)
				local emblem = widgets.emblem
				local style = emblem.style
				local width = 40
				local height = 0
				local degrees = 50
				local style_name = "arm_inner_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					pass_style.angle = math.degrees_to_radians(degrees * anim_progress)
				end

				local style_name = "arm_inner_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1]
					pass_style.angle = math.degrees_to_radians(-degrees * anim_progress)
				end

				local style_name = "arm_outer_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1] + 130 * anim_progress
					position[2] = default_position[2] + height + 40 * anim_progress
					pass_style.angle = math.degrees_to_radians(-degrees * anim_progress)
				end

				local style_name = "arm_outer_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					position[1] = default_position[1] - 130 * anim_progress
					position[2] = default_position[2] + height + 40 * anim_progress
					pass_style.angle = math.degrees_to_radians(degrees * anim_progress)
				end

				local style_name = "inner_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians((degrees - 15) * anim_progress)
				end

				local style_name = "inner_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(-(degrees - 15) * anim_progress)
				end

				local style_name = "outer_left"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians(-(degrees - 15) * anim_progress)
				end

				local style_name = "outer_right"
				local pass_style = style[style_name]

				if pass_style then
					local scenegraph_id = pass_style.scenegraph_id
					local position = ui_scenegraph[scenegraph_id].local_position
					local default_position = scenegraph_definition[scenegraph_id].position

					pass_style.angle = math.degrees_to_radians((degrees - 15) * anim_progress)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.6,
			name = "fade_in_title_text",
			start_progress = 1.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local title_title = widgets.title_title
				local sub_title_text = widgets.sub_title_text

				title_title.alpha_multiplier = anim_progress
				sub_title_text.alpha_multiplier = anim_progress

				local height = 20

				title_title.offset[2] = height - height * anim_progress
				sub_title_text.offset[2] = -height + height * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 7.6,
			name = "overall_alpha_out",
			start_progress = 7.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
				params.render_settings.blur_progress = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 6.6,
			name = "fade_out_title_text",
			start_progress = 6.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - math.easeOutCubic(progress)
				local title_title = widgets.title_title
				local sub_title_text = widgets.sub_title_text

				title_title.alpha_multiplier = anim_progress
				sub_title_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	animations = animations,
	create_emblem_widget = create_emblem_widget,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
