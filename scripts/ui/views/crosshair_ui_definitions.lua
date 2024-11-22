-- chunkname: @scripts/ui/views/crosshair_ui_definitions.lua

local MAX_SIZE = 228
local GAP = 2
local HIT_GAP = 3
local PI = math.pi
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.crosshair,
		},
		size = {
			1920,
			1080,
		},
	},
	pivot = {
		parent = "screen",
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
	crosshair_root = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			MAX_SIZE,
			MAX_SIZE,
		},
	},
	crosshair_dot = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			4,
			4,
		},
	},
	crosshair_line = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			10,
			4,
		},
	},
	crosshair_arrow = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			12,
			11,
		},
	},
	crosshair_shotgun = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			8,
			25,
		},
	},
	crosshair_projectile = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			-24,
			3,
		},
		size = {
			14,
			28,
		},
	},
	critical_hit_indication = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			75,
			75,
		},
	},
	crosshair_circle = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			126,
			126,
		},
	},
	crosshair_hit = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			10,
			4,
		},
	},
	crosshair_hit_2 = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			-(4 + HIT_GAP),
			0,
			1,
		},
		size = {
			8,
			8,
		},
	},
	crosshair_hit_3 = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			-(4 + HIT_GAP),
			1,
		},
		size = {
			8,
			8,
		},
	},
	crosshair_hit_4 = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			4 + HIT_GAP,
			1,
		},
		size = {
			8,
			8,
		},
	},
	crosshair_hit_armored = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	kill_confirm = {
		horizontal_alignment = "center",
		parent = "crosshair_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			75,
			75,
		},
	},
}
local widget_definitions = {
	crosshair_dot = {
		scenegraph_id = "crosshair_dot",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_01_center",
		},
		style = {
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_projectile = {
		scenegraph_id = "crosshair_projectile",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_05",
		},
		style = {
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_arrow = {
		scenegraph_id = "crosshair_arrow",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_06",
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_arrow.size[1] / 2,
				scenegraph_definition.crosshair_arrow.size[2] / 2,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_line = {
		scenegraph_id = "crosshair_line",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal",
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_line.size[1] / 2,
				scenegraph_definition.crosshair_line.size[2] / 2,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_shotgun = {
		scenegraph_id = "crosshair_shotgun",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_04",
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_shotgun.size[1] / 2,
				scenegraph_definition.crosshair_shotgun.size[2] / 2,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	critical_hit_indication = {
		scenegraph_id = "critical_hit_indication",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_03",
		},
		style = {
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_1 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal",
		},
		style = {
			rotating_texture = {
				angle = 0,
				pivot = {
					5,
					2,
				},
				offset = {
					6,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_2 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal",
		},
		style = {
			rotating_texture = {
				angle = 0,
				pivot = {
					5,
					2,
				},
				offset = {
					-6,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_3 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal",
		},
		style = {
			rotating_texture = {
				angle = 0.5 * PI,
				pivot = {
					5,
					2,
				},
				offset = {
					0,
					-6,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_4 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal",
		},
		style = {
			rotating_texture = {
				angle = 0.5 * PI,
				pivot = {
					5,
					2,
				},
				offset = {
					0,
					6,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_armored_no_damage = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "enemy_defense_indication_icon",
		},
		style = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				0,
				255,
				255,
				255,
			},
			texture_size = {
				55,
				50,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_armored_damage = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "enemy_defense_indication_icon_partial",
		},
		style = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				0,
				255,
				255,
				255,
			},
			texture_size = {
				42,
				46,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_armored_break = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "enemy_defense_indication_icon_broken",
		},
		style = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				0,
				255,
				255,
				255,
			},
			texture_size = {
				75,
				52,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_hit_armored_open = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "enemy_defense_indication_icon_open",
		},
		style = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				0,
				255,
				255,
				255,
			},
			texture_size = {
				42,
				46,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_circle = {
		scenegraph_id = "crosshair_circle",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_02",
		},
		style = {
			offset = {
				0,
				0,
				0,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	crosshair_wh_priest = {
		scenegraph_id = "crosshair_dot",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "crosshair_component_1",
					texture_id = "crosshair_component",
				},
				{
					pass_type = "rotated_texture",
					style_id = "crosshair_component_2",
					texture_id = "crosshair_component",
				},
				{
					pass_type = "rotated_texture",
					style_id = "crosshair_component_3",
					texture_id = "crosshair_component",
				},
				{
					pass_type = "rotated_texture",
					style_id = "crosshair_component_4",
					texture_id = "crosshair_component",
				},
				{
					pass_type = "texture",
					style_id = "career_portrait",
					texture_id = "career_portrait",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_id",
				},
			},
		},
		content = {
			career_portrait = "small_unit_frame_portrait_default",
			crosshair_component = "crosshair_01_horizontal",
			state = "wh_priest_self",
			text_id = "-",
		},
		style = {
			crosshair_component_1 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				angle = PI / 6,
				pivot = {
					5,
					2,
				},
				offset = {
					-87,
					50,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
			crosshair_component_2 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				angle = 11 * PI / 6,
				pivot = {
					5,
					2,
				},
				offset = {
					-87,
					-50,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
			crosshair_component_3 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				angle = 7 * PI / 6,
				pivot = {
					5,
					2,
				},
				offset = {
					87,
					-50,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
			crosshair_component_4 = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				angle = 5 * PI / 6,
				pivot = {
					5,
					2,
				},
				offset = {
					87,
					50,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					10,
					4,
				},
			},
			career_portrait = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					42,
					54,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					70,
					0,
					0,
				},
			},
			text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 0),
				size = {
					50,
					50,
				},
				offset = {
					90,
					-40,
					3,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	kill_confirm = {
		scenegraph_id = "kill_confirm",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_02",
		},
		style = {
			color = {
				0,
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
	},
}
local hit_marker_configurations = {
	normal = {
		color = Colors.color_definitions.hit_marker_normal,
		size = {
			8,
			8,
		},
	},
	critical = {
		color = Colors.color_definitions.hit_marker_critical,
		size = {
			12,
			12,
		},
	},
	armored = {
		color = Colors.color_definitions.hit_marker_armored,
		size = {
			8,
			8,
		},
	},
	friendly = {
		color = Colors.color_definitions.hit_marker_friendly,
		size = {
			8,
			8,
		},
	},
}
local animations_definitions = {
	ally_to_self = {
		{
			end_progress = 0.3,
			name = "ally_to_self",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local style = widgets.style
				local anim_progress = math.easeOutCubic(progress)
				local move_progres = 100 * math.easeOutCubic(progress)

				for _, component in pairs(style) do
					if not component.angle then
						-- Nothing
					else
						local angle = component.angle
						local offset_x = -move_progres * math.cos(angle)
						local offset_y = move_progres * math.sin(angle)

						component.offset[1] = offset_x
						component.offset[2] = offset_y
					end
				end

				style.career_portrait.color[1] = 255 * (1 - anim_progress)
				style.text.text_color[1] = 255 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	self_to_ally = {
		{
			end_progress = 0.3,
			name = "self_to_ally",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local style = widgets.style
				local anim_progress = math.easeOutCubic(progress)
				local move_progres = 10 + 90 * (1 - math.easeOutCubic(progress))

				for _, component in pairs(style) do
					if not component.angle then
						-- Nothing
					else
						local angle = component.angle
						local offset_x = -move_progres * math.cos(angle)
						local offset_y = move_progres * math.sin(angle)

						component.offset[1] = offset_x
						component.offset[2] = offset_y
					end
				end

				style.career_portrait.color[1] = 255 * anim_progress
				style.text.text_color[1] = 255 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	animations_definitions = animations_definitions,
	widget_definitions = widget_definitions,
	hit_marker_configurations = hit_marker_configurations,
	max_spread_pitch = MAX_SIZE,
	max_spread_yaw = MAX_SIZE,
	MAX_SIZE = MAX_SIZE,
}
