-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_item_preview_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local list_size = {
	800,
	600,
}
local list_entry_size = {
	800,
	220,
}
local list_scrollbar_size = {
	16,
	list_size[2] + 100,
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	background = {
		horizontal_alignment = "center",
		scale = "fit_height",
		size = {
			960,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default + 100,
		},
	},
	pivot = {
		horizontal_alignment = "right",
		parent = "background",
		vertical_alignment = "top",
		size = {
			960,
			740,
		},
		position = {
			0,
			-190,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "bottom",
		size = {
			960,
			732,
		},
		position = {
			0,
			0,
			1,
		},
	},
	viewport = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			600,
			500,
		},
		position = {
			0,
			-115,
			1,
		},
	},
	viewport_mask_top_left = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			146,
			152,
		},
		position = {
			0,
			0,
			100,
		},
	},
	viewport_mask_bottom_left = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			146,
			152,
		},
		position = {
			0,
			0,
			100,
		},
	},
	viewport_mask_top_right = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			146,
			152,
		},
		position = {
			0,
			0,
			100,
		},
	},
	viewport_mask_bottom_right = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			146,
			152,
		},
		position = {
			0,
			0,
			100,
		},
	},
	item_texture = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "center",
		size = {
			150,
			150,
		},
		position = {
			0,
			0,
			10,
		},
	},
	disclaimer_text = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "bottom",
		size = {
			700,
			60,
		},
		position = {
			0,
			120,
			10,
		},
	},
	disclaimer_divider = {
		horizontal_alignment = "center",
		parent = "disclaimer_text",
		vertical_alignment = "center",
		size = {
			13,
			13,
		},
		position = {
			0,
			0,
			0,
		},
	},
	amount_text = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "bottom",
		size = {
			260,
			60,
		},
		position = {
			0,
			85,
			10,
		},
	},
	info_anchor = {
		parent = "window",
		position = {
			0,
			0,
			0,
		},
	},
	claimed = {
		horizontal_alignment = "right",
		parent = "info_anchor",
		vertical_alignment = "top",
		size = {
			490,
			60,
		},
		position = {
			350,
			-180,
			8,
		},
	},
	title_text = {
		horizontal_alignment = "right",
		parent = "claimed",
		vertical_alignment = "top",
		size = {
			550,
			60,
		},
		position = {
			0,
			-60,
			8,
		},
	},
	sub_title_text = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			550,
			30,
		},
		position = {
			0,
			-45,
			1,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			550,
			30,
		},
		position = {
			0,
			-45,
			1,
		},
	},
	profile_title_text = {
		horizontal_alignment = "center",
		parent = "sub_title_text",
		vertical_alignment = "bottom",
		size = {
			550,
			30,
		},
		position = {
			0,
			-35,
			1,
		},
	},
	career_title_text = {
		horizontal_alignment = "center",
		parent = "profile_title_text",
		vertical_alignment = "bottom",
		size = {
			550,
			30,
		},
		position = {
			0,
			-35,
			1,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 64,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local description_text_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
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
local type_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local career_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
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
local disclaimer_text_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
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
}
local amount_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
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
}
local loading_widgets = {
	loading_icon = {
		scenegraph_id = "loading_icon",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
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
			texture_id = "loot_loading",
		},
		style = {
			texture_id = {
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
				offset = {
					0,
					0,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}

local function create_painting_widget(scenegraph_id)
	local painting_frame_name = "menu_frame_08"
	local painting_frame_settings = UIFrameSettings[painting_frame_name]
	local painting_frame_spacing = painting_frame_settings.texture_sizes.horizontal[2]
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "painting",
			pass_type = "texture_uv",
			style_id = "painting",
			content_check_function = function (content)
				return content.texture_id
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "painting_frame",
			texture_id = "painting_frame",
			content_check_function = function (content)
				return content.painting
			end,
		},
	}
	local content = {
		painting_frame = painting_frame_settings.texture,
	}
	local style = {
		painting = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				7,
			},
		},
		painting_frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = painting_frame_settings.texture_size,
			texture_sizes = painting_frame_settings.texture_sizes,
			frame_margins = {
				-painting_frame_spacing,
				-painting_frame_spacing,
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
				12,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		5,
	}
	widget.scenegraph_id = "item_texture"

	return widget
end

local function create_list_mask(scenegraph_id, list_scenegraph_id, size, entry_size)
	local entry_hover_frame_settings = UIFrameSettings.frame_outer_glow_04_big
	local entry_hover_frame_spacing = entry_hover_frame_settings.texture_sizes.horizontal[2]
	local element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "hotspot",
			},
			{
				content_id = "list_hotspot",
				pass_type = "hotspot",
				style_id = "list_hotspot",
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
		list_hotspot = {},
		button_hotspot = {},
		scrollbar = {
			percentage = 0.1,
			scroll_amount = 0.1,
			scroll_value = 1,
		},
	}
	local style = {
		hotspot = {
			size = {
				size[1],
				size[2],
			},
			offset = {
				0,
				0,
				0,
			},
		},
		list_hotspot = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2] + entry_hover_frame_spacing * 2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0,
			},
		},
		mask = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				0,
				0,
			},
		},
		mask_top = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				size[2],
				0,
			},
		},
		mask_bottom = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0,
			},
			angle = math.pi,
			pivot = {
				(size[1] + entry_hover_frame_spacing * 2) / 2,
				entry_hover_frame_spacing / 2,
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

local function create_texture_widget(texture, scenegraph_id, masked, retained, color, offset, texture_size, disable_with_gamepad, viewport_mask)
	if type(offset) ~= "table" then
		offset = {
			0,
			0,
			offset or 0,
		}
	end

	if texture_size == "native" then
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
		local settings_size = texture_settings.size

		texture_size = {
			settings_size[1],
			settings_size[2],
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					retained_mode = retained,
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {
			texture_id = texture,
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = color or {
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
				masked = masked,
				texture_size = texture_size,
				viewport_mask = viewport_mask,
			},
		},
		offset = offset,
		scenegraph_id = scenegraph_id,
	}
end

local claimed_text_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
		255,
		255,
		255,
		255,
	},
	offset = {
		0,
		0,
		1,
	},
}
local claimed_text_shadow_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
		255,
		0,
		0,
		0,
	},
	offset = {
		2,
		-2,
		0,
	},
}

local function create_base_portrait_frame(scenegraph_id, frame_settings_name, scale)
	scale = scale or 1

	local frame_settings_name = frame_settings_name or "default"
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name,
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local size = data.size

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)

			size = texture_settings.size
		else
			size = data.size
		end

		size = size and table.clone(size) or {
			0,
			0,
		}
		size[1] = size[1] * scale
		size[2] = size[2] * scale

		local offset = table.clone(data.offset or default_offset)

		offset[1] = offset[1] * scale
		offset[2] = offset[2] * scale
		offset[3] = data.layer or 0
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
		}
		content[name] = texture_name
		style[name] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			color = data.color or default_color,
			offset = offset,
			texture_size = size,
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

local function create_claimed_widget(ui_renderer)
	local text = string.gsub(Localize("search_filter_claimed"), "^%l", string.upper)
	local font_size = 32
	local font_type = "hell_shark_header"
	local font, scaled_font_size = UIFontByResolution(claimed_text_style)
	local width, height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)
	local owned_text = Localize("event_gotwf_already_owned")
	local owned_width, _, _ = UIRenderer.text_size(ui_renderer, owned_text, font[1], scaled_font_size)
	local max_width = scenegraph_definition.claimed.size[1]

	width = math.min(width, max_width)
	owned_width = math.min(owned_width, max_width)

	return {
		scenegraph_id = "claimed",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.already_owned
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return not content.already_owned
					end,
				},
				{
					pass_type = "rect",
					style_id = "background",
					content_check_function = function (content)
						return not content.already_owned
					end,
				},
				{
					pass_type = "texture",
					style_id = "sigil",
					texture_id = "sigil",
					content_check_function = function (content)
						return not content.already_owned
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "owned_text",
					content_check_function = function (content)
						return content.already_owned
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "owned_text",
					content_check_function = function (content)
						return content.already_owned
					end,
				},
				{
					pass_type = "rect",
					style_id = "background_owned",
					content_check_function = function (content)
						return content.already_owned
					end,
				},
				{
					pass_type = "texture",
					style_id = "sigil_owned",
					texture_id = "sigil",
					content_check_function = function (content)
						return content.already_owned
					end,
				},
			},
		},
		content = {
			already_owned = true,
			sigil = "store_owned_sigil",
			text = text,
			owned_text = owned_text,
		},
		style = {
			text = claimed_text_style,
			text_shadow = claimed_text_shadow_style,
			background = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				texture_size = {
					width + 35,
					35,
				},
				color = {
					192,
					0,
					0,
					0,
				},
				offset = {
					10,
					2,
					0,
				},
			},
			sigil = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					53,
					53,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-width,
					0,
					5,
				},
			},
			background_owned = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				texture_size = {
					owned_width + 35,
					35,
				},
				color = {
					192,
					0,
					0,
					0,
				},
				offset = {
					10,
					2,
					0,
				},
			},
			sigil_owned = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					53,
					53,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-owned_width,
					0,
					5,
				},
			},
		},
		offset = {
			-10,
			0,
			0,
		},
	}
end

local disable_with_gamepad = false
local top_widgets = {
	disclaimer_divider = UIWidgets.create_simple_texture("tooltip_marker_gold", "disclaimer_divider"),
	disclaimer_text = UIWidgets.create_simple_text(Localize("menu_store_product_hero_skin_disclaimer_desc"), "disclaimer_text", nil, nil, disclaimer_text_style),
	amount_text = UIWidgets.create_simple_text("", "amount_text", nil, nil, amount_text_style),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	type_title_text = UIWidgets.create_simple_text("", "sub_title_text", nil, nil, type_title_text_style),
	sub_title_text = UIWidgets.create_simple_text("", "profile_title_text", nil, nil, sub_title_text_style),
	description_text = UIWidgets.create_simple_text("", "profile_title_text", nil, nil, description_text_style),
	career_title_text = UIWidgets.create_simple_text("", "career_title_text", nil, nil, career_title_text_style),
	viewport_button = UIWidgets.create_simple_hotspot("viewport"),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "delay",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.6,
			name = "fade_in",
			start_progress = 0.3,
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
	},
	info_animation = {
		{
			end_progress = 0.8,
			name = "animate_in",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.claimed.alpha_multiplier = 0
				widgets.title_text.alpha_multiplier = 0
				widgets.type_title_text.alpha_multiplier = 0
				widgets.sub_title_text.alpha_multiplier = 0
				widgets.career_title_text.alpha_multiplier = 0
				widgets.description_text.alpha_multiplier = 0
				ui_scenegraph.info_anchor.local_position[1] = scenegraph_definition.info_anchor.position[1] + 50
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.info_anchor.local_position[1] = math.lerp(scenegraph_definition.info_anchor.position[1] + 50, scenegraph_definition.info_anchor.position[1], anim_progress)
				widgets.claimed.alpha_multiplier = anim_progress
				widgets.title_text.alpha_multiplier = anim_progress
				widgets.type_title_text.alpha_multiplier = anim_progress
				widgets.sub_title_text.alpha_multiplier = anim_progress
				widgets.career_title_text.alpha_multiplier = anim_progress
				widgets.description_text.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	top_widgets = top_widgets,
	loading_widgets = loading_widgets,
	create_claimed_widget = create_claimed_widget,
	create_painting_widget = create_painting_widget,
	create_texture_widget = create_texture_widget,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
