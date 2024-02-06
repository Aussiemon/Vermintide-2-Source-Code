-- chunkname: @scripts/ui/hud_ui/difficulty_unlock_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local scenegraph_definition = {
	root = {
		is_root = true,
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
	background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			340,
			1,
		},
		size = {
			522,
			108,
		},
	},
	background_top = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0.5,
			0,
			2,
		},
		size = {
			477,
			52,
		},
	},
	background_bottom = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			2,
		},
		size = {
			522,
			56,
		},
	},
	background_center = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			2,
			1,
		},
		size = {
			481,
			80,
		},
	},
	background_glow = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		position = {
			0,
			14,
			4,
		},
		size = {
			380,
			80,
		},
	},
	difficulty_title_text = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			25,
			5,
		},
		size = {
			1500,
			50,
		},
	},
	difficulty_text = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			-12,
			5,
		},
		size = {
			1500,
			50,
		},
	},
	icon_root = {
		horizontal_alignment = "center",
		parent = "background_bottom",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
}

local function create_difficulty_icon_widget(id, texture)
	local parent_scenegraph_id = "icon_root"
	local scenegraph_id = "icon_" .. id
	local icon_scenegraph = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		parent = parent_scenegraph_id,
		position = {
			0,
			26,
			1,
		},
		size = {
			50,
			50,
		},
	}

	scenegraph_definition[scenegraph_id] = icon_scenegraph

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					retained_mode = true,
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_1",
					texture_id = "part_1",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_2",
					texture_id = "part_2",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_3",
					texture_id = "part_3",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_4",
					texture_id = "part_4",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_5",
					texture_id = "part_5",
				},
				{
					pass_type = "rotated_texture",
					retained_mode = true,
					style_id = "part_6",
					texture_id = "part_6",
				},
			},
		},
		content = {
			icon = "hud_difficulty_unlocked_icon",
			part_1 = "hud_difficulty_unlocked_part_01",
			part_2 = "hud_difficulty_unlocked_part_02",
			part_3 = "hud_difficulty_unlocked_part_03",
			part_4 = "hud_difficulty_unlocked_part_04",
			part_5 = "hud_difficulty_unlocked_part_05",
			part_6 = "hud_difficulty_unlocked_part_06",
		},
		style = {
			icon = {
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
			part_1 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			part_2 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			part_3 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			part_4 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			part_5 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			part_6 = {
				angle = 0,
				pivot = {
					25,
					25,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local difficulty_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	vertical_alignment = "center",
	word_wrap = false,
	offset = {
		0,
		0,
		1,
	},
}
local widget_definitions = {
	background_glow = UIWidgets.create_simple_texture("hud_difficulty_unlocked_glow", "background_glow"),
	background_top = UIWidgets.create_simple_texture("hud_difficulty_unlocked_bg_top", "background_top"),
	background_center = UIWidgets.create_simple_uv_texture("hud_difficulty_unlocked_bg_fade", {
		{
			0,
			0.5,
		},
		{
			1,
			0.5,
		},
	}, "background_center"),
	background_bottom = UIWidgets.create_simple_texture("hud_difficulty_unlocked_bg_bottom", "background_bottom"),
	difficulty_title_text = UIWidgets.create_simple_text("dlc1_2_difficulty_unlocked_title", "difficulty_title_text", 28, Colors.get_color_table_with_alpha("cheeseburger", 0)),
	difficulty_text = UIWidgets.create_simple_text("n/a", "difficulty_text", 40, Colors.get_color_table_with_alpha("white", 0)),
	difficulty_icon_1 = create_difficulty_icon_widget(1),
	difficulty_icon_2 = create_difficulty_icon_widget(2),
	difficulty_icon_3 = create_difficulty_icon_widget(3),
	difficulty_icon_4 = create_difficulty_icon_widget(4),
	difficulty_icon_5 = create_difficulty_icon_widget(5),
}
local animations = {
	presentation = {
		{
			end_progress = 0,
			name = "reset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local icon_widgets = widgets.icons

				for widget_index, widget in ipairs(icon_widgets) do
					local widget_style = widget.style

					widget_style.icon.color[1] = 255

					for i = 1, 6 do
						local part_style_name = "part_" .. i
						local part_style = widget_style[part_style_name]
						local part_offset = part_style.offset
						local part_color = part_style.color

						part_offset[1] = 0
						part_offset[2] = 0
						part_color[1] = 255
						part_style.angle = 0
					end
				end

				local difficulty_text_widget = widgets.difficulty_text

				difficulty_text_widget.style.text.text_color[1] = 0

				local background_top_widget = widgets.background_top
				local background_glow_widget = widgets.background_glow
				local background_bottom_widget = widgets.background_bottom
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size

				current_background_center_size[2] = 0
				background_top_widget.style.texture_id.color[1] = 0
				background_bottom_widget.style.texture_id.color[1] = 0
				background_center_widget.style.texture_id.color[1] = 255
				background_glow_widget.style.texture_id.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "background_entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_start_sound then
					params.played_start_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_start")
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local top_start_height = 2000
				local bottom_start_height = -2000

				current_background_top_position[2] = top_start_height - top_start_height * anim_fraction
				current_background_bottom_position[2] = bottom_start_height - bottom_start_height * anim_fraction

				local alpha = 255 * progress

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "background_expand",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = 0.5 * anim_fraction

				center_uvs[1][2] = total_uv_change
				center_uvs[2][2] = 1 - total_uv_change
				current_background_center_size[2] = default_background_center_size[2] * anim_fraction

				local half_center_height = default_background_center_size[2] / 2

				current_background_top_position[2] = half_center_height * anim_fraction
				current_background_bottom_position[2] = -(half_center_height * anim_fraction)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	explode_parts_5 = {
		{
			end_progress = 0.3,
			name = "explode_parts_3",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local icon_widgets = widgets.icons
				local icons_end_values = {}

				for widget_index, widget in ipairs(icon_widgets) do
					local end_values = {}

					for i = 1, 6 do
						end_values[i] = {
							x = Math.random_range(-150, 150),
							y = Math.random_range(-150, 150),
							alpha_fade_multiplier = Math.random_range(1, 2),
							angle = math.degrees_to_radians(Math.random_range(-90, 90)),
						}
					end

					icons_end_values[widget_index] = end_values
				end

				params.icons_end_values = icons_end_values
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_explode_sound_1 then
					params.played_explode_sound_1 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_stone")
				end

				local catmullrom_value = progress == 1 and 1 or math.catmullrom(progress, 8, 0, 1, -1)
				local anim_fraction = math.easeOutCubic(progress)
				local icon_widgets = widgets.icons
				local alpha_start_progress = 0.5
				local alpha_progress = math.max(progress - alpha_start_progress, 0) / alpha_start_progress
				local icons_end_values = params.icons_end_values

				for widget_index, widget in ipairs(icon_widgets) do
					if widget_index == 3 then
						local widget_style = widget.style
						local widget_values = icons_end_values[widget_index]

						for i = 1, 6 do
							local part_style_name = "part_" .. i
							local part_style = widget_style[part_style_name]
							local part_offset = part_style.offset
							local part_color = part_style.color
							local part_end_values = widget_values[i]
							local end_position_x = part_end_values.x
							local end_position_y = part_end_values.y
							local alpha_fade_multiplier = part_end_values.alpha_fade_multiplier
							local angle = part_end_values.angle

							part_offset[1] = end_position_x * anim_fraction
							part_offset[2] = end_position_y * anim_fraction
							part_color[1] = 255 - math.min(255 * (alpha_progress * alpha_fade_multiplier), 255)
							part_style.angle = angle * anim_fraction
						end
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.1,
			name = "rumble_1",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local parent_position = ui_scenegraph.background.local_position
				local parent_default_position = scenegraph_definition.background.position

				parent_position[1] = parent_default_position[1] + 10 - 10 * math.catmullrom(progress, 5, 1, 1, -1)
				parent_position[2] = parent_default_position[2] + 10 - 10 * math.catmullrom(progress, -1, 1, 1, 5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.7,
			name = "explode_parts_2_4",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_explode_sound_2 then
					params.played_explode_sound_2 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_stone")
				end

				local catmullrom_value = progress == 1 and 1 or math.catmullrom(progress, 8, 0, 1, -1)
				local anim_fraction = math.easeOutCubic(progress)
				local icon_widgets = widgets.icons
				local alpha_start_progress = 0.5
				local alpha_progress = math.max(progress - alpha_start_progress, 0) / alpha_start_progress
				local icons_end_values = params.icons_end_values

				for widget_index, widget in ipairs(icon_widgets) do
					if widget_index == 2 or widget_index == 4 then
						local widget_style = widget.style
						local widget_values = icons_end_values[widget_index]

						for i = 1, 6 do
							local part_style_name = "part_" .. i
							local part_style = widget_style[part_style_name]
							local part_offset = part_style.offset
							local part_color = part_style.color
							local part_end_values = widget_values[i]
							local end_position_x = part_end_values.x
							local end_position_y = part_end_values.y
							local alpha_fade_multiplier = part_end_values.alpha_fade_multiplier
							local angle = part_end_values.angle

							part_offset[1] = end_position_x * anim_fraction
							part_offset[2] = end_position_y * anim_fraction
							part_color[1] = 255 - math.min(255 * (alpha_progress * alpha_fade_multiplier), 255)
							part_style.angle = angle * anim_fraction
						end
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "rumble_2",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local parent_position = ui_scenegraph.background.local_position
				local parent_default_position = scenegraph_definition.background.position

				parent_position[1] = parent_default_position[1] + (10 - 10 * math.catmullrom(progress, -1, 1, 1, 5))
				parent_position[2] = parent_default_position[2] + (10 - 10 * math.catmullrom(progress, -5, 1, 1, 1))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1,
			name = "explode_parts_1_5",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_explode_sound_3 then
					params.played_explode_sound_3 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_stone")
				end

				local catmullrom_value = progress == 1 and 1 or math.catmullrom(progress, 8, 0, 1, -1)
				local anim_fraction = math.easeOutCubic(progress)
				local icon_widgets = widgets.icons
				local alpha_start_progress = 0.5
				local alpha_progress = math.max(progress - alpha_start_progress, 0) / alpha_start_progress
				local icons_end_values = params.icons_end_values

				for widget_index, widget in ipairs(icon_widgets) do
					local widget_style = widget.style
					local widget_values = icons_end_values[widget_index]

					if widget_index == 1 or widget_index == 5 then
						for i = 1, 6 do
							local part_style_name = "part_" .. i
							local part_style = widget_style[part_style_name]
							local part_offset = part_style.offset
							local part_color = part_style.color
							local part_end_values = widget_values[i]
							local end_position_x = part_end_values.x
							local end_position_y = part_end_values.y
							local alpha_fade_multiplier = part_end_values.alpha_fade_multiplier
							local angle = part_end_values.angle

							part_offset[1] = end_position_x * anim_fraction
							part_offset[2] = end_position_y * anim_fraction
							part_color[1] = 255 - math.min(255 * (alpha_progress * alpha_fade_multiplier), 255)
							part_style.angle = angle * anim_fraction
						end
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "rumble_3",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local parent_position = ui_scenegraph.background.local_position
				local parent_default_position = scenegraph_definition.background.position

				parent_position[1] = parent_default_position[1] + 10 - 10 * math.catmullrom(progress, 5, 1, 1, 1)
				parent_position[2] = parent_default_position[2] + 10 - 10 * math.catmullrom(progress, 1, 1, 1, 5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.2,
			name = "fade_in_title_text",
			start_progress = 0.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_title_text_widget = widgets.difficulty_title_text
				local text_style = difficulty_title_text_widget.style.text

				text_style.text_color[1] = 255 * anim_fraction
				text_style.font_size = 28 * math.catmullrom(math.easeOutCubic(progress), -0.5, 1, 1, -0.5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.3,
			name = "fade_in_text",
			start_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_text_reveal_sound then
					params.played_text_reveal_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_text_reveal")
				end

				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_text_widget = widgets.difficulty_text
				local text_style = difficulty_text_widget.style.text

				text_style.text_color[1] = 255 * anim_fraction
				text_style.font_size = 40 * math.catmullrom(math.easeOutCubic(progress), -0.5, 1, 1, -0.5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.1,
			name = "fade_in_glow",
			start_progress = 0.75,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_glow_widget = widgets.background_glow

				background_glow_widget.style.texture_id.color[1] = 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.1,
			name = "fade_out_glow",
			start_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = 255 - 255 * progress
				local background_glow_widget = widgets.background_glow

				background_glow_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.3,
			name = "fade_out_background",
			start_progress = 2.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local background_top_widget = widgets.background_top
				local background_center_widget = widgets.background_center
				local background_bottom_widget = widgets.background_bottom
				local alpha = 255 - 255 * progress

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
				background_center_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.3,
			name = "fade_out_icons",
			start_progress = 2.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = 255 - 255 * progress
				local icon_widgets = widgets.icons

				for widget_index, widget in ipairs(icon_widgets) do
					local widget_style = widget.style

					widget_style.icon.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.5,
			name = "fade_out_title_text",
			start_progress = 3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_title_text_widget = widgets.difficulty_title_text

				difficulty_title_text_widget.style.text.text_color[1] = 255 - 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4,
			name = "fade_out_text",
			start_progress = 3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_text_widget = widgets.difficulty_text

				difficulty_text_widget.style.text.text_color[1] = 255 - 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	explode_parts_4 = {
		{
			end_progress = 0.3,
			name = "explode_parts_2_3",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local icon_widgets = widgets.icons
				local icons_end_values = {}

				for widget_index, widget in ipairs(icon_widgets) do
					local end_values = {}

					for i = 1, 6 do
						end_values[i] = {
							x = Math.random_range(-150, 150),
							y = Math.random_range(-150, 150),
							alpha_fade_multiplier = Math.random_range(1, 2),
							angle = math.degrees_to_radians(Math.random_range(-90, 90)),
						}
					end

					icons_end_values[widget_index] = end_values
				end

				params.icons_end_values = icons_end_values
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_explode_sound_1 then
					params.played_explode_sound_1 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_stone")
				end

				local catmullrom_value = progress == 1 and 1 or math.catmullrom(progress, 8, 0, 1, -1)
				local anim_fraction = math.easeOutCubic(progress)
				local icon_widgets = widgets.icons
				local alpha_start_progress = 0.5
				local alpha_progress = math.max(progress - alpha_start_progress, 0) / alpha_start_progress
				local icons_end_values = params.icons_end_values

				for widget_index, widget in ipairs(icon_widgets) do
					if widget_index == 2 or widget_index == 3 then
						local widget_style = widget.style
						local widget_values = icons_end_values[widget_index]

						for i = 1, 6 do
							local part_style_name = "part_" .. i
							local part_style = widget_style[part_style_name]
							local part_offset = part_style.offset
							local part_color = part_style.color
							local part_end_values = widget_values[i]
							local end_position_x = part_end_values.x
							local end_position_y = part_end_values.y
							local alpha_fade_multiplier = part_end_values.alpha_fade_multiplier
							local angle = part_end_values.angle

							part_offset[1] = end_position_x * anim_fraction
							part_offset[2] = end_position_y * anim_fraction
							part_color[1] = 255 - math.min(255 * (alpha_progress * alpha_fade_multiplier), 255)
							part_style.angle = angle * anim_fraction
						end
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.1,
			name = "rumble_1",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local parent_position = ui_scenegraph.background.local_position
				local parent_default_position = scenegraph_definition.background.position

				parent_position[1] = parent_default_position[1] + 10 - 10 * math.catmullrom(progress, 5, 1, 1, -1)
				parent_position[2] = parent_default_position[2] + 10 - 10 * math.catmullrom(progress, -1, 1, 1, 5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.7,
			name = "explode_parts_1_4",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_explode_sound_2 then
					params.played_explode_sound_2 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_stone")
				end

				local catmullrom_value = progress == 1 and 1 or math.catmullrom(progress, 8, 0, 1, -1)
				local anim_fraction = math.easeOutCubic(progress)
				local icon_widgets = widgets.icons
				local alpha_start_progress = 0.5
				local alpha_progress = math.max(progress - alpha_start_progress, 0) / alpha_start_progress
				local icons_end_values = params.icons_end_values

				for widget_index, widget in ipairs(icon_widgets) do
					if widget_index == 1 or widget_index == 4 then
						local widget_style = widget.style
						local widget_values = icons_end_values[widget_index]

						for i = 1, 6 do
							local part_style_name = "part_" .. i
							local part_style = widget_style[part_style_name]
							local part_offset = part_style.offset
							local part_color = part_style.color
							local part_end_values = widget_values[i]
							local end_position_x = part_end_values.x
							local end_position_y = part_end_values.y
							local alpha_fade_multiplier = part_end_values.alpha_fade_multiplier
							local angle = part_end_values.angle

							part_offset[1] = end_position_x * anim_fraction
							part_offset[2] = end_position_y * anim_fraction
							part_color[1] = 255 - math.min(255 * (alpha_progress * alpha_fade_multiplier), 255)
							part_style.angle = angle * anim_fraction
						end
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "rumble_2",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local parent_position = ui_scenegraph.background.local_position
				local parent_default_position = scenegraph_definition.background.position

				parent_position[1] = parent_default_position[1] + (10 - 10 * math.catmullrom(progress, -1, 1, 1, 5))
				parent_position[2] = parent_default_position[2] + (10 - 10 * math.catmullrom(progress, -5, 1, 1, 1))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.9,
			name = "fade_in_title_text",
			start_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_title_text_widget = widgets.difficulty_title_text
				local text_style = difficulty_title_text_widget.style.text

				text_style.text_color[1] = 255 * anim_fraction
				text_style.font_size = 28 * math.catmullrom(math.easeOutCubic(progress), -0.5, 1, 1, -0.5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1,
			name = "fade_in_text",
			start_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if not params.played_text_reveal_sound then
					params.played_text_reveal_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_text_reveal")
				end

				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_text_widget = widgets.difficulty_text
				local text_style = difficulty_text_widget.style.text

				text_style.text_color[1] = 255 * anim_fraction
				text_style.font_size = 40 * math.catmullrom(math.easeOutCubic(progress), -0.5, 1, 1, -0.5)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "fade_in_glow",
			start_progress = 0.45,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_glow_widget = widgets.background_glow

				background_glow_widget.style.texture_id.color[1] = 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.8,
			name = "fade_out_glow",
			start_progress = 2.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = 255 - 255 * progress
				local background_glow_widget = widgets.background_glow

				background_glow_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3,
			name = "fade_out_background",
			start_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local background_top_widget = widgets.background_top
				local background_center_widget = widgets.background_center
				local background_bottom_widget = widgets.background_bottom
				local alpha = 255 - 255 * progress

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
				background_center_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3,
			name = "fade_out_icons",
			start_progress = 2.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = 255 - 255 * progress
				local icon_widgets = widgets.icons

				for widget_index, widget in ipairs(icon_widgets) do
					local widget_style = widget.style

					widget_style.icon.color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.2,
			name = "fade_out_title_text",
			start_progress = 2.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_title_text_widget = widgets.difficulty_title_text

				difficulty_title_text_widget.style.text.text_color[1] = 255 - 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.7,
			name = "fade_out_text",
			start_progress = 2.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local difficulty_text_widget = widgets.difficulty_text

				difficulty_text_widget.style.text.text_color[1] = 255 - 255 * anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	animations = animations,
	mission_names = mission_names,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
