local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	background_top = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			518,
			55
		}
	},
	background_top_glow = {
		vertical_alignment = "bottom",
		parent = "background_top",
		horizontal_alignment = "center",
		position = {
			0,
			-0,
			1
		},
		size = {
			518,
			0
		}
	},
	background_bottom = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			518,
			55
		}
	},
	background_bottom_glow = {
		vertical_alignment = "top",
		parent = "background_bottom",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			518,
			0
		}
	},
	background_center = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			472,
			0
		}
	},
	entry_root = {
		vertical_alignment = "center",
		parent = "background_center",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			5
		},
		size = {
			1500,
			0
		}
	},
	title_root = {
		vertical_alignment = "center",
		parent = "entry_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			1500,
			0
		}
	},
	level_root = {
		vertical_alignment = "center",
		parent = "entry_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			1500,
			0
		}
	},
	reward_root = {
		vertical_alignment = "center",
		parent = "background_bottom",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			5
		},
		size = {
			0,
			0
		}
	},
	texture_root = {
		vertical_alignment = "center",
		parent = "reward_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	item_root = {
		vertical_alignment = "center",
		parent = "reward_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			80,
			80
		}
	},
	career_root = {
		vertical_alignment = "center",
		parent = "reward_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			60,
			70
		}
	}
}
local title_text_style = {
	word_wrap = true,
	font_size = 46,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_text_style = {
	word_wrap = true,
	font_size = 46,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_icon_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture"
				}
			}
		},
		content = {
			frame = "reward_pop_up_item_frame",
			background = "reward_pop_up_item_bg",
			texture_id = texture
		},
		style = {
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_item_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture"
				},
				{
					texture_id = "rarity_texture",
					style_id = "rarity_texture",
					pass_type = "texture"
				}
			}
		},
		content = {
			frame = "reward_pop_up_item_frame",
			rarity_texture = "icon_bg_plentiful",
			texture_id = texture
		},
		style = {
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			},
			rarity_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_description_text_widget(text, scenegraph_id)
	local text_offset = {
		0,
		6,
		2
	}
	local text_style = {
		vertical_alignment = "bottom",
		word_wrap = true,
		horizontal_alignment = "center",
		font_size = 28,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = text_offset
	}
	local text_shadow_style = table.clone(text_style)
	text_shadow_style.text_color = {
		255,
		0,
		0,
		1
	}
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1
	}
	local title_text_offset = {
		0,
		0,
		2
	}
	local title_text_style = {
		vertical_alignment = "top",
		word_wrap = true,
		horizontal_alignment = "center",
		font_size = 46,
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = title_text_offset
	}
	local title_text_shadow_style = table.clone(title_text_style)
	title_text_shadow_style.text_color = {
		255,
		0,
		0,
		1
	}
	title_text_shadow_style.offset = {
		title_text_offset[1] + 2,
		title_text_offset[2] - 2,
		title_text_offset[3] - 1
	}

	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = text,
			title_text = text
		},
		style = {
			title_text = title_text_style,
			title_text_shadow = title_text_shadow_style,
			text = text_style,
			text_shadow = text_shadow_style
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local widget_definitions = {
	title = UIWidgets.create_simple_text("n/a", "title_root", nil, nil, title_text_style),
	level = UIWidgets.create_simple_text("n/a", "level_root", nil, nil, level_text_style),
	description = create_description_text_widget("n/a", "title_root"),
	texture = {
		scenegraph_id = "item_root",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				}
			}
		},
		content = {
			texture_id = "icons_placeholder"
		},
		style = {
			texture_id = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	},
	icon = {
		scenegraph_id = "item_root",
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				}
			}
		},
		content = {
			texture_id = "icons_placeholder"
		},
		style = {
			texture_id = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	},
	item = create_item_widget("icons_placeholder", "item_root"),
	loot_chest = create_item_widget("icons_placeholder", "item_root"),
	career = UIWidgets.create_simple_texture("icons_placeholder", "career_root"),
	background_top = UIWidgets.create_simple_texture("reward_popup_panel", "background_top"),
	background_center = UIWidgets.create_simple_uv_texture("reward_pop_up_01_bg", {
		{
			0,
			0.5
		},
		{
			1,
			0.5
		}
	}, "background_center"),
	background_bottom = UIWidgets.create_simple_uv_texture("reward_popup_panel", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "background_bottom"),
	background_bottom_glow = UIWidgets.create_simple_uv_texture("mission_objective_bottom", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "background_bottom_glow"),
	background_top_glow = UIWidgets.create_simple_uv_texture("mission_objective_top", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "background_top_glow"),
	screen_background = UIWidgets.create_simple_rect("screen", {
		100,
		0,
		0,
		0
	})
}
local animations = {
	present_entry = {
		{
			name = "fade_in_title_text",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget_type, progress, params)
				if not params.played_text_reveal_sound_1 then
					params.played_text_reveal_sound_1 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_compleation_ver2")
				end

				local anim_fraction = math.easeOutCubic(progress)

				for _, data in pairs(widget_type) do
					local widget = data.widget
					local widget_type = data.widget_type
					data.alpha_multiplier = anim_fraction

					if widget_type == "level" then
						local text_style = widget.style.text
						text_style.font_size = level_text_style.font_size * math.catmullrom(math.easeOutCubic(progress), -0.5, 1, 1, -0.5)
					elseif widget_type == "item" then
						local scenegraph_id = widget.scenegraph_id
						local default_size = scenegraph_definition[scenegraph_id].size
						local size = ui_scenegraph[scenegraph_id].size
						local size_fraction = math.ease_out_exp(progress)
						size[1] = default_size[1] + default_size[1] * (1 - size_fraction)
						size[2] = default_size[2] + default_size[2] * (1 - size_fraction)
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end
		},
		{
			name = "fade_out_title_text",
			start_progress = 2.5,
			end_progress = 2.7,
			init = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget_type, progress, params)
				local anim_fraction = math.easeOutCubic(progress)

				for _, data in pairs(widget_type) do
					local widget = data.widget
					local widget_type = data.widget_type
					data.alpha_multiplier = 1 - anim_fraction
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end
		}
	},
	open = {
		{
			name = "reset",
			start_progress = 0,
			end_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local background_top_widget = widgets.background_top
				local background_bottom_widget = widgets.background_bottom
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				current_background_center_size[2] = 0
				background_top_widget.style.texture_id.color[1] = 0
				background_bottom_widget.style.texture_id.color[1] = 0
				background_center_widget.style.texture_id.color[1] = 255
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				current_background_top_position[2] = default_background_top_position[2]
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				current_background_bottom_position[2] = default_background_bottom_position[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_in_blur",
			start_progress = 0,
			end_progress = 0.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				params.blur_progress = anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "background_fade_in",
			start_progress = 0.1,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_start_sound then
					params.played_start_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_start")
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_top_widget = widgets.background_top
				local background_bottom_widget = widgets.background_bottom
				local alpha = 255 * anim_fraction
				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "background_entry",
			start_progress = 0.25,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_size = scenegraph_definition[background_top_scenegraph_id].size
				local current_background_top_size = ui_scenegraph[background_top_scenegraph_id].size
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_size = scenegraph_definition[background_bottom_scenegraph_id].size
				local current_background_bottom_size = ui_scenegraph[background_bottom_scenegraph_id].size
				local anim_size_fraction = math.catmullrom(progress, -4, 1, 1, -1)
				current_background_top_size[1] = default_background_top_size[1] * anim_size_fraction
				current_background_top_size[2] = default_background_top_size[2] * anim_size_fraction
				current_background_bottom_size[1] = default_background_bottom_size[1] * anim_size_fraction
				current_background_bottom_size[2] = default_background_bottom_size[2] * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "background_expand",
			start_progress = 0.4,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size
				current_background_center_size[2] = math.ceil(default_background_center_size[2] * anim_fraction)
				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * anim_fraction
				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = default_background_top_position[2] + half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height * anim_fraction
				local background_top_glow_widget = widgets.background_top_glow
				background_top_glow_widget.content.texture_id.uvs[2][2] = anim_fraction
				local new_top_glow_height = 55 * anim_fraction
				ui_scenegraph.background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.background_top_glow.local_position[2] = -new_top_glow_height
				local background_bottom_glow_widget = widgets.background_bottom_glow
				background_bottom_glow_widget.content.texture_id.uvs[2][2] = anim_fraction
				local new_bottom_glow_height = 55 * anim_fraction
				ui_scenegraph.background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	close = {
		{
			name = "background_collapse",
			start_progress = 0,
			end_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local inv_anim_fraction = 1 - math.easeInCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size
				current_background_center_size[2] = math.ceil(default_background_center_size[2] - default_background_center_size[2] * anim_fraction)
				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * inv_anim_fraction
				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = (default_background_top_position[2] + half_center_height) - half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height + half_center_height * anim_fraction
				local background_top_glow_widget = widgets.background_top_glow
				background_top_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction
				local new_top_glow_height = 55 * inv_anim_fraction
				ui_scenegraph.background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.background_top_glow.local_position[2] = -new_top_glow_height
				local background_bottom_glow_widget = widgets.background_bottom_glow
				background_bottom_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction
				local new_bottom_glow_height = 55 * inv_anim_fraction
				ui_scenegraph.background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_end_sound then
					params.played_end_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_end")
				end
			end
		},
		{
			name = "fade_out_background",
			start_progress = 0.15,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local background_top_widget = widgets.background_top
				local background_center_widget = widgets.background_center
				local background_bottom_widget = widgets.background_bottom
				local anim_fraction = math.easeOutCubic(progress)
				local alpha = 255 - 255 * anim_fraction
				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
				background_center_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out_blur",
			start_progress = 0.4,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(1 - progress)
				params.blur_progress = anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	animations = animations,
	mission_names = mission_names,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
