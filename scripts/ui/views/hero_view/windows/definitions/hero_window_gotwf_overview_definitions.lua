-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_overview_definitions.lua

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
local gotwf_item_spacing = 20
local icon_scale = 0.845
local arrow_size = {
	59,
	31,
}
local gotwf_item_size = {
	260 * icon_scale,
	250 * icon_scale,
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
	black_background = {
		horizontal_alignment = "center",
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			200,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	black_background_fade = {
		horizontal_alignment = "center",
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			200,
		},
		position = {
			0,
			200,
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
	viewport = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			800,
			500,
		},
		position = {
			0,
			-115,
			1,
		},
	},
	screen_top = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
	},
	screen_left = {
		horizontal_alignment = "left",
		parent = "screen",
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
	screen_center = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	window = {
		horizontal_alignment = "left",
		parent = "screen_center",
		vertical_alignment = "top",
		size = window_size,
		position = {
			(1920 - window_size[1]) * 0.5,
			(1080 - window_size[2]) * 0.5 * -1,
			1,
		},
	},
	write_mask = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2] + 100,
		},
		position = {
			0,
			0,
			1,
		},
	},
	write_mask_left = {
		horizontal_alignment = "left",
		parent = "write_mask",
		vertical_alignment = "bottom",
		size = {
			50,
			400,
		},
		position = {
			-25,
			0,
			1,
		},
	},
	write_mask_right = {
		horizontal_alignment = "right",
		parent = "write_mask",
		vertical_alignment = "bottom",
		size = {
			50,
			400,
		},
		position = {
			25,
			0,
			1,
		},
	},
	scrollbar_area = {
		horizontal_alignment = "center",
		parent = "write_mask",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			gotwf_item_size[2] + 70,
		},
		position = {
			0,
			100,
			50,
		},
	},
	window_anchor = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			-350,
			2,
		},
	},
	gotwf_logo_foreground = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			460.8,
			527.2,
		},
		position = {
			-650,
			10,
			1,
		},
	},
	gotwf_logo_flag = {
		horizontal_alignment = "center",
		parent = "gotwf_logo_foreground",
		vertical_alignment = "top",
		size = {
			407.20000000000005,
			572.8000000000001,
		},
		position = {
			8,
			-40,
			0,
		},
	},
	gotwf_logo_banner_left = {
		horizontal_alignment = "left",
		parent = "gotwf_logo_foreground",
		vertical_alignment = "center",
		size = {
			133.6,
			201.60000000000002,
		},
		position = {
			-37,
			-65,
			-2,
		},
	},
	gotwf_logo_banner_right = {
		horizontal_alignment = "right",
		parent = "gotwf_logo_foreground",
		vertical_alignment = "center",
		size = {
			133.6,
			201.60000000000002,
		},
		position = {
			50,
			-65,
			-2,
		},
	},
	gotwf_description = {
		horizontal_alignment = "center",
		parent = "gotwf_logo_foreground",
		vertical_alignment = "bottom",
		position = {
			0,
			-240,
			0,
		},
	},
	gotwf_window = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			1600,
			250,
		},
		position = {
			0,
			39,
			2,
		},
	},
	gotwf_item_anchor = {
		parent = "gotwf_window",
		size = gotwf_item_size,
		position = {
			0,
			15,
			0,
		},
	},
	arrow_left = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			100,
			100,
		},
		position = {
			-70,
			115,
			0,
		},
	},
	arrow_right = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			100,
			100,
		},
		position = {
			70,
			115,
			0,
		},
	},
	claim_button = {
		horizontal_alignment = "center",
		parent = "gotwf_item_anchor",
		vertical_alignment = "bottom",
		position = {
			10,
			25,
			5,
		},
		size = {
			gotwf_item_size[1],
			60,
		},
	},
	lock_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1,
			1,
		},
		position = {
			0,
			-1600,
			10,
		},
	},
	lock_bg_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			167,
			333,
		},
		position = {
			0,
			0,
			3,
		},
	},
	lock_bg_right = {
		horizontal_alignment = "left",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			167,
			333,
		},
		position = {
			167,
			0,
			3,
		},
	},
	lock_pillar_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			210,
			231,
		},
		position = {
			1,
			0,
			1,
		},
	},
	lock_pillar_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			210,
			231,
		},
		position = {
			210,
			0,
			1,
		},
	},
	lock_pillar_top = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			231,
			212,
		},
		position = {
			1,
			212,
			1,
		},
	},
	lock_pillar_bottom = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			231,
			212,
		},
		position = {
			0,
			0,
			1,
		},
	},
	lock_cogwheel_bg_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			170,
			342,
		},
		position = {
			0,
			0,
			7,
		},
	},
	lock_cogwheel_bg_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			172,
			342,
		},
		position = {
			172,
			0,
			7,
		},
	},
	lock_cogwheel_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			158,
			316,
		},
		position = {
			0,
			0,
			6,
		},
	},
	lock_cogwheel_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			158,
			316,
		},
		position = {
			158,
			0,
			6,
		},
	},
	lock_stick_top_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			125,
			127,
		},
		position = {
			0,
			127,
			2,
		},
	},
	lock_stick_top_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			125,
			127,
		},
		position = {
			125,
			127,
			2,
		},
	},
	lock_stick_bottom_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			125,
			127,
		},
		position = {
			0,
			0,
			2,
		},
	},
	lock_stick_bottom_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			125,
			127,
		},
		position = {
			125,
			0,
			2,
		},
	},
	lock_block_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			153,
			149,
		},
		position = {
			0,
			0,
			5,
		},
	},
	lock_block_right = {
		horizontal_alignment = "left",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			153,
			149,
		},
		position = {
			-153,
			0,
			5,
		},
	},
	lock_slot_holder_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			52,
			303,
		},
		position = {
			-1,
			0,
			4,
		},
	},
	lock_slot_holder_right = {
		horizontal_alignment = "left",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			52,
			303,
		},
		position = {
			0,
			0,
			4,
		},
	},
	lock_cover_top_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			142,
			151,
		},
		position = {
			0,
			151,
			9,
		},
	},
	lock_cover_top_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			146,
			152,
		},
		position = {
			146,
			152,
			9,
		},
	},
	lock_cover_bottom_left = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			141,
			150,
		},
		position = {
			0,
			0,
			9,
		},
	},
	lock_cover_bottom_right = {
		horizontal_alignment = "right",
		parent = "lock_root",
		vertical_alignment = "top",
		size = {
			146,
			149,
		},
		position = {
			146,
			0,
			9,
		},
	},
	frame_right = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			116,
			290,
		},
		position = {
			0,
			0,
			0,
		},
	},
	frame_bottom = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			116,
			290,
		},
		position = {
			0,
			0,
			0,
		},
	},
	frame_left = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			116,
			290,
		},
		position = {
			0,
			0,
			0,
		},
	},
	frame_top = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			116,
			290,
		},
		position = {
			0,
			0,
			0,
		},
	},
	mask_left = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			120,
			270,
		},
		position = {
			0,
			5,
			480,
		},
	},
	mask_right = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			120,
			270,
		},
		position = {
			0,
			5,
			480,
		},
	},
	mask_top = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			260,
			120,
		},
		position = {
			0,
			-5,
			480,
		},
	},
	mask_bottom = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			260,
			120,
		},
		position = {
			0,
			-5,
			480,
		},
	},
	mask_center = {
		horizontal_alignment = "center",
		parent = "lock_root",
		vertical_alignment = "center",
		size = {
			260,
			260,
		},
		position = {
			0,
			0,
			480,
		},
	},
}
local gotwf_description_text_style = {
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		192,
		192,
		192,
	},
	offset = {
		0,
		0,
		2,
	},
}

local function create_simple_item(scenegraph_id, texture_name, size, offset, masked)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local item_icon_name = "item_icon"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = item_icon_name,
		style_id = item_icon_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[item_icon_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
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
			1,
		},
	}
	content[item_icon_name] = texture_name

	local slot_background_frame_name = "item_frame"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = slot_background_frame_name,
		style_id = slot_background_frame_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[slot_background_frame_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
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
			4,
		},
	}
	content[slot_background_frame_name] = "item_frame"

	local rarity_texture_name = "rarity_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = rarity_texture_name,
		style_id = rarity_texture_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[rarity_texture_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
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
			0,
		},
	}
	content[rarity_texture_name] = "icon_bg_default"
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = offset or {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local extra_offset_value = 50

local function create_item_definition_func(scenegraph_id, size, masked, index, current_reward, date, owned, hidden, expired, claimable, rewards)
	local frame_name = "menu_frame_16"
	local frame_settings = UIFrameSettings[frame_name]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local painting_frame_name = "menu_frame_08"
	local painting_frame_settings = UIFrameSettings[painting_frame_name]
	local painting_frame_spacing = painting_frame_settings.texture_sizes.horizontal[2]
	local icon_intensity = not (not current_reward and not (hidden and not expired) and not owned) and 255 or 60
	local current_reward_offset = 75
	local num_rewards = hidden and 1 or rewards and #rewards or 1
	local size_multiplier = 1 - (num_rewards - 1) * 0.25
	local offset = 0
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local base_passes = {
		{
			pass_type = "text",
			style_id = "date_text",
			text_id = "date_text",
		},
		{
			pass_type = "text",
			style_id = "date_text_shadow",
			text_id = "date_text",
		},
		{
			pass_type = "texture",
			style_id = "owned_icon",
			texture_id = "owned_icon",
			content_check_function = function (content)
				return content.owned
			end,
		},
		{
			pass_type = "texture",
			style_id = "owned_icon_bg",
			texture_id = "owned_icon_bg",
			content_check_function = function (content)
				return content.owned
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "loading_icon",
			texture_id = "loading_icon",
			content_check_function = function (content)
				local has_icon = true

				for i = 1, num_rewards do
					if not content["icon_" .. i] then
						has_icon = false

						break
					end
				end

				return not has_icon and not content.hidden and not content.disable_loading_icon
			end,
			content_change_function = function (content, style, _, dt)
				local progress = style.progress or 0

				progress = (progress + dt) % 1

				local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

				style.angle = angle
				style.progress = progress
			end,
		},
		{
			pass_type = "texture",
			style_id = "package_icon",
			texture_id = "package_icon",
			content_check_function = function (content)
				return content.hidden
			end,
		},
	}
	local reward_order = {}

	for i = 1, num_rewards do
		reward_order[#reward_order + 1] = i
	end

	local base_content = {
		loading_icon = "loot_loading",
		masked_rect = "rect_masked",
		owned_icon = "store_owned_sigil",
		owned_icon_bg = "store_owned_ribbon",
		package_icon = "store_package",
		rect = "store_thumbnail_bg_plentiful",
		hidden = hidden,
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		size = size,
		date_text = date,
		current_reward = current_reward,
		owned = owned,
		painting_frame = painting_frame_settings.texture,
		num_rewards = num_rewards,
		rewards = rewards,
		reward_order = reward_order,
	}
	local base_style = {
		date_text = {
			dynamic_font_size = false,
			font_size = 32,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = current_reward and Colors.get_color_table_with_alpha("font_title", 255) or Colors.get_color_table_with_alpha("gray", 255),
			offset = {
				0,
				-20 - (not (not current_reward and not claimable) and not owned and current_reward_offset or 0),
				10,
			},
		},
		date_text_shadow = {
			dynamic_font_size = false,
			font_size = 32,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				-22 - (not (not current_reward and not claimable) and not owned and current_reward_offset or 0),
				9,
			},
		},
		loading_icon = {
			angle = 0,
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "top",
			pivot = {
				50,
				50,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] * 0.5 - 50,
				-50,
				8,
			},
			texture_size = {
				100,
				100,
			},
		},
		owned_icon = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			masked = masked,
			texture_size = {
				53,
				53,
			},
			default_texture_size = {
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
				2,
				20,
				12 + 16 * (num_rewards - 1),
			},
			default_offset = {
				5,
				20,
				12 + 16 * (num_rewards - 1),
			},
		},
		owned_icon_bg = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			masked = masked,
			texture_size = {
				34,
				50,
			},
			default_texture_size = {
				34,
				50,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-10,
				-0,
				11 + 16 * (num_rewards - 1),
			},
			default_offset = {
				2,
				-45,
				11 + 16 * (num_rewards - 1),
			},
		},
		package_icon = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			texture_size = size,
			color = {
				255,
				icon_intensity,
				icon_intensity,
				icon_intensity,
			},
			offset = {
				0,
				0,
				7,
			},
		},
	}

	table.append(passes, base_passes)
	table.merge(content, base_content)
	table.merge(style, base_style)

	local base_size = size

	for i = 1, num_rewards do
		local extra_offset = {
			(i - 1) * extra_offset_value,
			(i - 1) * -extra_offset_value,
			(i - 1) * 15,
		}
		local size = {
			base_size[1] * size_multiplier,
			base_size[2] * size_multiplier,
		}
		local item_passes = {
			{
				pass_type = "hotspot",
				content_id = "hotspot_" .. i,
				style_id = "hotspot_" .. i,
			},
			{
				pass_type = "texture",
				texture_id = "rect",
				style_id = "overlay_" .. i,
			},
			{
				pass_type = "texture",
				texture_id = "rect",
				style_id = "background_rect_" .. i,
			},
			{
				pass_type = "texture",
				texture_id = "background_" .. i,
				style_id = "background_" .. i,
				content_check_function = function (content)
					return content["background_" .. i]
				end,
			},
			{
				pass_type = "texture_frame",
				texture_id = "frame",
				style_id = "frame_" .. i,
			},
			{
				pass_type = "texture_frame",
				texture_id = "hover_frame",
				style_id = "hover_frame_" .. i,
			},
			{
				pass_type = "texture_frame",
				texture_id = "pulse_frame",
				style_id = "pulse_frame_" .. i,
			},
			{
				pass_type = "texture_uv",
				content_id = "painting_" .. i,
				style_id = "painting_" .. i,
				content_check_function = function (content)
					return content.texture_id
				end,
			},
			{
				pass_type = "texture_frame",
				texture_id = "painting_frame",
				style_id = "painting_frame_" .. i,
				content_check_function = function (content)
					return content.painting
				end,
			},
			{
				pass_type = "texture",
				texture_id = "icon_" .. i,
				style_id = "icon_" .. i,
				content_check_function = function (content)
					return content["icon_" .. i] and not content.rendering_loading_icon
				end,
			},
			{
				pass_type = "texture",
				texture_id = "type_tag_icon_" .. i,
				style_id = "type_tag_icon_" .. i,
				content_check_function = function (content)
					return content["type_tag_icon_" .. i] ~= nil
				end,
			},
		}
		local item_content = {
			["hotspot_" .. i] = {},
			["icon_" .. i] = nil,
			["painting_" .. i] = nil,
			["background_" .. i] = nil,
			["type_tag_icon_" .. i] = nil,
		}
		local item_style = {
			["hotspot_" .. i] = {
				size = {
					gotwf_item_size[1] * size_multiplier,
					gotwf_item_size[2],
				},
				base_offset = {
					0,
					0,
					0,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					0 + extra_offset[3],
				},
			},
			["background_rect_" .. i] = {
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
				base_offset = {
					0,
					0,
					0,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					0 + extra_offset[3],
				},
			},
			["background_" .. i] = {
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
				base_offset = {
					0,
					0,
					1,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					1 + extra_offset[3],
				},
			},
			["overlay_" .. i] = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				masked = masked,
				texture_size = size,
				color = {
					0,
					5,
					5,
					5,
				},
				base_offset = {
					0,
					0,
					8,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					8 + extra_offset[3],
				},
			},
			["type_tag_icon_" .. i] = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				masked = masked,
				texture_size = {
					56,
					56,
				},
				color = {
					255,
					icon_intensity,
					icon_intensity,
					icon_intensity,
				},
				base_offset = {
					size[1] - 56,
					0,
					9,
				},
				offset = {
					size[1] - 56 + extra_offset[1],
					0 + extra_offset[2],
					9 + extra_offset[3],
				},
			},
			["icon_" .. i] = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				masked = masked,
				texture_size = size,
				color = {
					255,
					icon_intensity,
					icon_intensity,
					icon_intensity,
				},
				base_offset = {
					0,
					0,
					7,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					7 + extra_offset[3],
				},
			},
			["frame_" .. i] = {
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
					icon_intensity,
					icon_intensity,
					icon_intensity,
				},
				base_offset = {
					0,
					0,
					10,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					10 + extra_offset[3],
				},
			},
			["hover_frame_" .. i] = {
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
				base_offset = {
					0,
					0,
					6,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					6 + extra_offset[3],
				},
			},
			["pulse_frame_" .. i] = {
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
				base_offset = {
					0,
					0,
					12,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					12 + extra_offset[3],
				},
			},
			["painting_" .. i] = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				masked = masked,
				texture_size = size,
				color = {
					255,
					icon_intensity,
					icon_intensity,
					icon_intensity,
				},
				base_offset = {
					0,
					0,
					7,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					7 + extra_offset[3],
				},
			},
			["painting_frame_" .. i] = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				masked = masked,
				area_size = size,
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
				base_offset = {
					0,
					0,
					12,
				},
				offset = {
					0 + extra_offset[1],
					0 + extra_offset[2],
					12 + extra_offset[3],
				},
			},
		}

		table.append(passes, item_passes)
		table.merge(content, item_content)
		table.merge(style, item_style)
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		10 + (index - 1) * (size[1] + gotwf_item_spacing),
		not (not current_reward and not claimable) and not owned and current_reward_offset or 0,
		5,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_arrow(texture, texture_hover, angle, pivot, scenegraph_id, masked, color, layer, offset, disable_with_gamepad)
	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow",
					texture_id = "arrow",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow_hover",
					texture_id = "arrow_hover",
					content_check_function = function (content, style)
						return content.hotspot.is_hover
					end,
				},
			},
		},
		content = {
			hotspot = {},
			arrow = texture,
			arrow_hover = texture_hover,
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			hotspot = {
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					-25,
					-25,
					layer or 0,
				},
			},
			arrow = {
				masked = masked,
				angle = angle,
				pivot = pivot,
				texture_size = arrow_size,
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
			},
			arrow_hover = {
				masked = masked,
				angle = angle,
				pivot = pivot,
				texture_size = arrow_size,
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					(layer or 0) + 1,
				},
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

function create_claim_button_definition(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad, skip_side_detail, masked)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local extra_detail_offset_x, extra_detail_offset_y
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]

	if optional_detail_offset then
		if type(optional_detail_offset) == "table" then
			extra_detail_offset_x = optional_detail_offset[1]
			extra_detail_offset_y = optional_detail_offset[2]
		else
			extra_detail_offset_x = optional_detail_offset
		end
	end

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return gamepad_active
					end,
					content_change_function = function (content, style)
						local speed = 2
						local t, dt = Managers.time:time_and_delta("main")
						local gamepad_selected = content.gamepad_selected
						local gamepad_selection_progress = content.gamepad_selection_progress
						local value = 0

						if gamepad_selected then
							gamepad_selection_progress = math.min(gamepad_selection_progress + dt * speed, 1)
							value = math.easeOutCubic(gamepad_selection_progress)
						else
							gamepad_selection_progress = math.max(gamepad_selection_progress - dt * speed, 0)
							value = math.easeInCubic(gamepad_selection_progress)
						end

						style.color[1] = value * 255
						content.gamepad_selection_progress = gamepad_selection_progress
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			draw_frame = true,
			gamepad_selection_progress = 0,
			glass = "button_glass_02",
			hover_glow = "button_state_default",
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
				skip_side_detail = skip_side_detail,
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
			disable_with_gamepad = disable_with_gamepad,
			hover_frame = hover_frame_settings.texture,
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
				masked = masked,
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					2,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
				masked = masked,
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
				masked = masked,
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					22,
					-2,
					5,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					8,
				},
				masked = masked,
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4,
				},
				size = {
					size[1],
					11,
				},
				masked = masked,
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					4,
				},
				size = {
					size[1],
					11,
				},
				masked = masked,
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					extra_detail_offset_x and -extra_detail_offset_x or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
				masked = masked,
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (extra_detail_offset_x or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
				masked = masked,
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
					255,
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
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

local disable_with_gamepad = false
local skip_side_details = true
local masked = true

local function create_claim_button()
	return create_claim_button_definition("claim_button", scenegraph_definition.claim_button.size, nil, nil, Localize("welcome_currency_popup_button_claim"), 26, nil, nil, nil, disable_with_gamepad, skip_side_details, masked)
end

local background_widgets = {
	black_background = UIWidgets.create_simple_rect("black_background", {
		255,
		0,
		0,
		0,
	}),
	black_background_fade = UIWidgets.create_simple_texture("vertical_gradient", "black_background_fade", nil, nil, {
		255,
		0,
		0,
		0,
	}),
}
local bottom_widgets = {
	bg_black = UIWidgets.create_simple_rect("screen", {
		255,
		0,
		0,
		0,
	}),
}
local viewport_widgets = {
	frame_bg = UIWidgets.create_simple_texture("store_thumbnail_bg_plentiful", "viewport", true, nil, nil, 1),
	left_mask = UIWidgets.create_simple_texture("mask_rect", "mask_left", nil, nil, {
		0,
		255,
		255,
		255,
	}),
	right_mask = UIWidgets.create_simple_texture("mask_rect", "mask_right", nil, nil, {
		0,
		255,
		255,
		255,
	}),
	top_mask = UIWidgets.create_simple_texture("mask_rect", "mask_top", nil, nil, {
		0,
		255,
		255,
		255,
	}),
	bottom_mask = UIWidgets.create_simple_texture("mask_rect", "mask_bottom", nil, nil, {
		0,
		255,
		255,
		255,
	}),
	center_mask = UIWidgets.create_simple_texture("mask_rect", "mask_center", nil, nil, {
		0,
		255,
		255,
		255,
	}),
}
local widgets = {
	arrow_left = create_arrow("achievement_arrow", "achievement_arrow_hover", math.pi * 0.5, {
		arrow_size[1] * 0.5,
		arrow_size[2] * 0.5,
	}, "arrow_left", false, {
		255,
		255,
		255,
		255,
	}, 0, {
		0,
		0,
		0,
	}),
	arrow_right = create_arrow("achievement_arrow", "achievement_arrow_hover", -math.pi * 0.5, {
		arrow_size[1] * 0.5,
		arrow_size[2] * 0.5,
	}, "arrow_right", false, {
		255,
		255,
		255,
		255,
	}, 0, {
		41,
		0,
		0,
	}),
	gotwf_logo_foreground = UIWidgets.create_simple_texture("gotwf_foreground", "gotwf_logo_foreground"),
	gotwf_logo_flag = UIWidgets.create_simple_texture("gotwf_flag", "gotwf_logo_flag"),
	gotwf_logo_banner_left = UIWidgets.create_simple_texture("gotwf_banner_left", "gotwf_logo_banner_left"),
	gotwf_logo_banner_right = UIWidgets.create_simple_texture("gotwf_banner_right", "gotwf_logo_banner_right"),
	gotwf_description = UIWidgets.create_simple_text("", "gotwf_description", nil, nil, gotwf_description_text_style),
	write_mask = UIWidgets.create_simple_texture("mask_rect", "write_mask", false, false, {
		255,
		255,
		255,
		255,
	}, 0),
	left_fade_mask = UIWidgets.create_simple_texture("horizontal_gradient_mask", "write_mask_left", false, false, {
		255,
		255,
		255,
		255,
	}, 0),
	right_fade_mask = UIWidgets.create_simple_uv_texture("horizontal_gradient_mask", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "write_mask_right", false, false, {
		255,
		255,
		255,
		255,
	}, 0),
}
local lock_widgets = {
	lock_bg_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_11", 0, {
		167,
		166.5,
	}, "lock_bg_left"),
	lock_bg_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_11", math.pi, {
		0,
		166.5,
	}, "lock_bg_right"),
	lock_pillar_left = UIWidgets.create_simple_texture("dice_game_lock_part_13", "lock_pillar_left"),
	lock_pillar_right = UIWidgets.create_simple_uv_texture("dice_game_lock_part_13", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "lock_pillar_right"),
	lock_pillar_top = UIWidgets.create_simple_texture("dice_game_lock_part_12", "lock_pillar_top"),
	lock_pillar_bottom = UIWidgets.create_simple_uv_texture("dice_game_lock_part_12", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "lock_pillar_bottom"),
	lock_cogwheel_bg_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_05", 0, {
		170,
		171,
	}, "lock_cogwheel_bg_left"),
	lock_cogwheel_bg_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_06", 0, {
		0,
		171,
	}, "lock_cogwheel_bg_right"),
	lock_cogwheel_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_07", 0, {
		158,
		158,
	}, "lock_cogwheel_left"),
	lock_cogwheel_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_08", 0, {
		0,
		158,
	}, "lock_cogwheel_right"),
	lock_stick_top_left = UIWidgets.create_simple_texture("dice_game_lock_part_14", "lock_stick_top_left"),
	lock_stick_top_right = UIWidgets.create_simple_uv_texture("dice_game_lock_part_14", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "lock_stick_top_right"),
	lock_stick_bottom_left = UIWidgets.create_simple_texture("dice_game_lock_part_15", "lock_stick_bottom_left"),
	lock_stick_bottom_right = UIWidgets.create_simple_uv_texture("dice_game_lock_part_15", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "lock_stick_bottom_right"),
	lock_cover_top_left = UIWidgets.create_simple_texture("dice_game_lock_part_01", "lock_cover_top_left"),
	lock_cover_top_right = UIWidgets.create_simple_texture("dice_game_lock_part_03", "lock_cover_top_right"),
	lock_cover_bottom_left = UIWidgets.create_simple_texture("dice_game_lock_part_02", "lock_cover_bottom_left"),
	lock_cover_bottom_right = UIWidgets.create_simple_texture("dice_game_lock_part_04", "lock_cover_bottom_right"),
	lock_block_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_09", 0, {
		153,
		74.5,
	}, "lock_block_left"),
	lock_block_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_09", math.pi, {
		153,
		74.5,
	}, "lock_block_right"),
	lock_slot_holder_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_10", 0, {
		52,
		151,
	}, "lock_slot_holder_left"),
	lock_slot_holder_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_part_10_02", 0, {
		0,
		151.5,
	}, "lock_slot_holder_right"),
	frame_right = UIWidgets.create_simple_rotated_texture("dice_game_lock_left_side", math.pi, {
		58,
		145,
	}, "frame_right"),
	frame_bottom = UIWidgets.create_simple_rotated_texture("dice_game_lock_left_side", -math.pi * 0.5, {
		58,
		145,
	}, "frame_bottom"),
	frame_left = UIWidgets.create_simple_rotated_texture("dice_game_lock_left_side", 0, {
		58,
		145,
	}, "frame_left"),
	frame_top = UIWidgets.create_simple_rotated_texture("dice_game_lock_left_side", -math.pi * 1.5, {
		58,
		145,
	}, "frame_top"),
}
local lock_open_time_multiplier = 0.5
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.7,
			name = "fade_in",
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
	item_rotation = {
		{
			end_progress = 0.5,
			name = "item_rotation",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local item_widget = params.item_widget
				local content = item_widget.content
				local style = item_widget.style
				local reward_index = params.reward_index
				local reward_order = content.reward_order
				local idx = table.find(reward_order, reward_index)

				params.start_index = idx

				table.remove(reward_order, idx)

				reward_order[#reward_order + 1] = reward_index
				style["background_rect_" .. reward_index].color[1] = 0
				style["background_" .. reward_index].color[1] = 0
				style["type_tag_icon_" .. reward_index].color[1] = 0
				style["icon_" .. reward_index].color[1] = 0
				style["frame_" .. reward_index].color[1] = 0
				style["hover_frame_" .. reward_index].color[1] = 0
				style["pulse_frame_" .. reward_index].color[1] = 0
				style["painting_" .. reward_index].color[1] = 0
				style["painting_frame_" .. reward_index].color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local item_widget = params.item_widget
				local content = item_widget.content
				local style = item_widget.style
				local reward_order = content.reward_order
				local reward_index = params.reward_index
				local start_index = params.start_index

				for index = start_index, #reward_order do
					local i = reward_order[index]
					local start_extra_offset = {
						index * extra_offset_value,
						index * -extra_offset_value,
						index * 15,
					}
					local extra_offset = {
						(index - 1) * extra_offset_value,
						(index - 1) * -extra_offset_value,
						(index - 1) * 15,
					}

					style["hotspot_" .. i].offset[1] = math.lerp(style["hotspot_" .. i].base_offset[1] + start_extra_offset[1], style["hotspot_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["hotspot_" .. i].offset[2] = math.lerp(style["hotspot_" .. i].base_offset[2] + start_extra_offset[2], style["hotspot_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["hotspot_" .. i].offset[3] = math.lerp(style["hotspot_" .. i].base_offset[3] + start_extra_offset[3], style["hotspot_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["background_rect_" .. i].offset[1] = math.lerp(style["background_rect_" .. i].base_offset[1] + start_extra_offset[1], style["background_rect_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["background_rect_" .. i].offset[2] = math.lerp(style["background_rect_" .. i].base_offset[2] + start_extra_offset[2], style["background_rect_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["background_rect_" .. i].offset[3] = math.lerp(style["background_rect_" .. i].base_offset[3] + start_extra_offset[3], style["background_rect_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["background_" .. i].offset[1] = math.lerp(style["background_" .. i].base_offset[1] + start_extra_offset[1], style["background_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["background_" .. i].offset[2] = math.lerp(style["background_" .. i].base_offset[2] + start_extra_offset[2], style["background_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["background_" .. i].offset[3] = math.lerp(style["background_" .. i].base_offset[3] + start_extra_offset[3], style["background_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["overlay_" .. i].offset[1] = math.lerp(style["overlay_" .. i].base_offset[1] + start_extra_offset[1], style["overlay_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["overlay_" .. i].offset[2] = math.lerp(style["overlay_" .. i].base_offset[2] + start_extra_offset[2], style["overlay_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["overlay_" .. i].offset[3] = math.lerp(style["overlay_" .. i].base_offset[3] + start_extra_offset[3], style["overlay_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["type_tag_icon_" .. i].offset[1] = math.lerp(style["type_tag_icon_" .. i].base_offset[1] + start_extra_offset[1], style["type_tag_icon_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["type_tag_icon_" .. i].offset[2] = math.lerp(style["type_tag_icon_" .. i].base_offset[2] + start_extra_offset[2], style["type_tag_icon_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["type_tag_icon_" .. i].offset[3] = math.lerp(style["type_tag_icon_" .. i].base_offset[3] + start_extra_offset[3], style["type_tag_icon_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["icon_" .. i].offset[1] = math.lerp(style["icon_" .. i].base_offset[1] + start_extra_offset[1], style["icon_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["icon_" .. i].offset[2] = math.lerp(style["icon_" .. i].base_offset[2] + start_extra_offset[2], style["icon_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["icon_" .. i].offset[3] = math.lerp(style["icon_" .. i].base_offset[3] + start_extra_offset[3], style["icon_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["frame_" .. i].offset[1] = math.lerp(style["frame_" .. i].base_offset[1] + start_extra_offset[1], style["frame_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["frame_" .. i].offset[2] = math.lerp(style["frame_" .. i].base_offset[2] + start_extra_offset[2], style["frame_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["frame_" .. i].offset[3] = math.lerp(style["frame_" .. i].base_offset[3] + start_extra_offset[3], style["frame_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["hover_frame_" .. i].offset[1] = math.lerp(style["hover_frame_" .. i].base_offset[1] + start_extra_offset[1], style["hover_frame_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["hover_frame_" .. i].offset[2] = math.lerp(style["hover_frame_" .. i].base_offset[2] + start_extra_offset[2], style["hover_frame_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["hover_frame_" .. i].offset[3] = math.lerp(style["hover_frame_" .. i].base_offset[3] + start_extra_offset[3], style["hover_frame_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["pulse_frame_" .. i].offset[1] = math.lerp(style["pulse_frame_" .. i].base_offset[1] + start_extra_offset[1], style["pulse_frame_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["pulse_frame_" .. i].offset[2] = math.lerp(style["pulse_frame_" .. i].base_offset[2] + start_extra_offset[2], style["pulse_frame_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["pulse_frame_" .. i].offset[3] = math.lerp(style["pulse_frame_" .. i].base_offset[3] + start_extra_offset[3], style["pulse_frame_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["painting_" .. i].offset[1] = math.lerp(style["painting_" .. i].base_offset[1] + start_extra_offset[1], style["painting_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["painting_" .. i].offset[2] = math.lerp(style["painting_" .. i].base_offset[2] + start_extra_offset[2], style["painting_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["painting_" .. i].offset[3] = math.lerp(style["painting_" .. i].base_offset[3] + start_extra_offset[3], style["painting_" .. i].base_offset[3] + extra_offset[3], anim_progress)
					style["painting_frame_" .. i].offset[1] = math.lerp(style["painting_frame_" .. i].base_offset[1] + start_extra_offset[1], style["painting_frame_" .. i].base_offset[1] + extra_offset[1], anim_progress)
					style["painting_frame_" .. i].offset[2] = math.lerp(style["painting_frame_" .. i].base_offset[2] + start_extra_offset[2], style["painting_frame_" .. i].base_offset[2] + extra_offset[2], anim_progress)
					style["painting_frame_" .. i].offset[3] = math.lerp(style["painting_frame_" .. i].base_offset[3] + start_extra_offset[3], style["painting_frame_" .. i].base_offset[3] + extra_offset[3], anim_progress)

					if i == reward_index then
						style["background_rect_" .. i].color[1] = anim_progress * 255
						style["background_" .. i].color[1] = anim_progress * 255
						style["type_tag_icon_" .. i].color[1] = anim_progress * 255
						style["icon_" .. i].color[1] = anim_progress * 255
						style["frame_" .. i].color[1] = anim_progress * 255
						style["painting_" .. i].color[1] = anim_progress * 255
						style["painting_frame_" .. i].color[1] = anim_progress * 255
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local item_widget = params.item_widget
				local style = item_widget.style
				local reward_index = params.reward_index

				style["background_rect_" .. reward_index].color[1] = 255
				style["background_" .. reward_index].color[1] = 255
				style["type_tag_icon_" .. reward_index].color[1] = 255
				style["icon_" .. reward_index].color[1] = 255
				style["frame_" .. reward_index].color[1] = 255
				style["painting_" .. reward_index].color[1] = 255
				style["painting_frame_" .. reward_index].color[1] = 255
			end,
		},
	},
	hide_item_list = {
		{
			end_progress = 0.3,
			name = "hide_item_list",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.gotwf_window.local_position[2] = scenegraph_definition.gotwf_window.position[2] - 500 * anim_progress
				ui_scenegraph.scrollbar_area.local_position[2] = scenegraph_definition.scrollbar_area.position[2] - 500 * anim_progress
				ui_scenegraph.arrow_left.local_position[2] = scenegraph_definition.arrow_left.position[2] - 500 * anim_progress
				ui_scenegraph.arrow_right.local_position[2] = scenegraph_definition.arrow_right.position[2] - 500 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	show_item_list = {
		{
			end_progress = 0.3,
			name = "show_item_list",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.gotwf_window.local_position[2] = scenegraph_definition.gotwf_window.position[2] - 500 * (1 - anim_progress)
				ui_scenegraph.scrollbar_area.local_position[2] = scenegraph_definition.scrollbar_area.position[2] - 500 * (1 - anim_progress)
				ui_scenegraph.arrow_left.local_position[2] = scenegraph_definition.arrow_left.position[2] - 500 * (1 - anim_progress)
				ui_scenegraph.arrow_right.local_position[2] = scenegraph_definition.arrow_right.position[2] - 500 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	lock_open = {
		{
			name = "animate_in",
			start_progress = 0 * lock_open_time_multiplier,
			end_progress = 1 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.lock_root.position[2] = scenegraph_definition.lock_root.position[2]
				widgets.lock_bg_left.content.visible = true
				widgets.lock_bg_right.content.visible = true
				widgets.lock_pillar_left.content.visible = true
				widgets.lock_pillar_right.content.visible = true
				widgets.lock_pillar_top.content.visible = true
				widgets.lock_pillar_bottom.content.visible = true
				widgets.lock_cogwheel_bg_left.content.visible = true
				widgets.lock_cogwheel_bg_right.content.visible = true
				widgets.lock_cogwheel_left.content.visible = true
				widgets.lock_cogwheel_right.content.visible = true
				widgets.lock_stick_top_left.content.visible = true
				widgets.lock_stick_top_right.content.visible = true
				widgets.lock_stick_bottom_left.content.visible = true
				widgets.lock_stick_bottom_right.content.visible = true
				widgets.lock_block_left.content.visible = true
				widgets.lock_block_right.content.visible = true
				widgets.lock_slot_holder_left.content.visible = true
				widgets.lock_slot_holder_right.content.visible = true
				widgets.lock_cover_top_left.content.visible = true
				widgets.lock_cover_top_right.content.visible = true
				widgets.lock_cover_bottom_left.content.visible = true
				widgets.lock_cover_bottom_right.content.visible = true
				ui_scenegraph.lock_bg_left.position[1] = scenegraph_definition.lock_bg_left.position[1]
				ui_scenegraph.lock_bg_left.position[2] = scenegraph_definition.lock_bg_left.position[2]
				ui_scenegraph.lock_bg_left.position[3] = scenegraph_definition.lock_bg_left.position[3]
				ui_scenegraph.lock_bg_right.position[1] = scenegraph_definition.lock_bg_right.position[1]
				ui_scenegraph.lock_bg_right.position[2] = scenegraph_definition.lock_bg_right.position[2]
				ui_scenegraph.lock_bg_right.position[3] = scenegraph_definition.lock_bg_right.position[3]
				ui_scenegraph.lock_pillar_left.position[1] = scenegraph_definition.lock_pillar_left.position[1]
				ui_scenegraph.lock_pillar_left.position[2] = scenegraph_definition.lock_pillar_left.position[2]
				ui_scenegraph.lock_pillar_left.position[3] = scenegraph_definition.lock_pillar_left.position[3]
				ui_scenegraph.lock_pillar_right.position[1] = scenegraph_definition.lock_pillar_right.position[1]
				ui_scenegraph.lock_pillar_right.position[2] = scenegraph_definition.lock_pillar_right.position[2]
				ui_scenegraph.lock_pillar_right.position[3] = scenegraph_definition.lock_pillar_right.position[3]
				ui_scenegraph.lock_pillar_top.position[1] = scenegraph_definition.lock_pillar_top.position[1]
				ui_scenegraph.lock_pillar_top.position[2] = scenegraph_definition.lock_pillar_top.position[2]
				ui_scenegraph.lock_pillar_top.position[3] = scenegraph_definition.lock_pillar_top.position[3]
				ui_scenegraph.lock_pillar_bottom.position[1] = scenegraph_definition.lock_pillar_bottom.position[1]
				ui_scenegraph.lock_pillar_bottom.position[2] = scenegraph_definition.lock_pillar_bottom.position[2]
				ui_scenegraph.lock_pillar_bottom.position[3] = scenegraph_definition.lock_pillar_bottom.position[3]
				ui_scenegraph.lock_cogwheel_bg_left.position[1] = scenegraph_definition.lock_cogwheel_bg_left.position[1]
				ui_scenegraph.lock_cogwheel_bg_left.position[2] = scenegraph_definition.lock_cogwheel_bg_left.position[2]
				ui_scenegraph.lock_cogwheel_bg_left.position[3] = scenegraph_definition.lock_cogwheel_bg_left.position[3]
				ui_scenegraph.lock_cogwheel_bg_right.position[1] = scenegraph_definition.lock_cogwheel_bg_right.position[1]
				ui_scenegraph.lock_cogwheel_bg_right.position[2] = scenegraph_definition.lock_cogwheel_bg_right.position[2]
				ui_scenegraph.lock_cogwheel_bg_right.position[3] = scenegraph_definition.lock_cogwheel_bg_right.position[3]
				ui_scenegraph.lock_cogwheel_left.position[1] = scenegraph_definition.lock_cogwheel_left.position[1]
				ui_scenegraph.lock_cogwheel_left.position[2] = scenegraph_definition.lock_cogwheel_left.position[2]
				ui_scenegraph.lock_cogwheel_left.position[3] = scenegraph_definition.lock_cogwheel_left.position[3]
				ui_scenegraph.lock_cogwheel_right.position[1] = scenegraph_definition.lock_cogwheel_right.position[1]
				ui_scenegraph.lock_cogwheel_right.position[2] = scenegraph_definition.lock_cogwheel_right.position[2]
				ui_scenegraph.lock_cogwheel_right.position[3] = scenegraph_definition.lock_cogwheel_right.position[3]
				ui_scenegraph.lock_stick_top_left.position[1] = scenegraph_definition.lock_stick_top_left.position[1]
				ui_scenegraph.lock_stick_top_left.position[2] = scenegraph_definition.lock_stick_top_left.position[2]
				ui_scenegraph.lock_stick_top_left.position[3] = scenegraph_definition.lock_stick_top_left.position[3]
				ui_scenegraph.lock_stick_top_right.position[1] = scenegraph_definition.lock_stick_top_right.position[1]
				ui_scenegraph.lock_stick_top_right.position[2] = scenegraph_definition.lock_stick_top_right.position[2]
				ui_scenegraph.lock_stick_top_right.position[3] = scenegraph_definition.lock_stick_top_right.position[3]
				ui_scenegraph.lock_stick_bottom_left.position[1] = scenegraph_definition.lock_stick_bottom_left.position[1]
				ui_scenegraph.lock_stick_bottom_left.position[2] = scenegraph_definition.lock_stick_bottom_left.position[2]
				ui_scenegraph.lock_stick_bottom_left.position[3] = scenegraph_definition.lock_stick_bottom_left.position[3]
				ui_scenegraph.lock_stick_bottom_right.position[1] = scenegraph_definition.lock_stick_bottom_right.position[1]
				ui_scenegraph.lock_stick_bottom_right.position[2] = scenegraph_definition.lock_stick_bottom_right.position[2]
				ui_scenegraph.lock_stick_bottom_right.position[3] = scenegraph_definition.lock_stick_bottom_right.position[3]
				ui_scenegraph.lock_block_left.position[1] = scenegraph_definition.lock_block_left.position[1]
				ui_scenegraph.lock_block_left.position[2] = scenegraph_definition.lock_block_left.position[2]
				ui_scenegraph.lock_block_left.position[3] = scenegraph_definition.lock_block_left.position[3]
				ui_scenegraph.lock_block_right.position[1] = scenegraph_definition.lock_block_right.position[1]
				ui_scenegraph.lock_block_right.position[2] = scenegraph_definition.lock_block_right.position[2]
				ui_scenegraph.lock_block_right.position[3] = scenegraph_definition.lock_block_right.position[3]
				ui_scenegraph.lock_slot_holder_left.position[1] = scenegraph_definition.lock_slot_holder_left.position[1]
				ui_scenegraph.lock_slot_holder_left.position[2] = scenegraph_definition.lock_slot_holder_left.position[2]
				ui_scenegraph.lock_slot_holder_left.position[3] = scenegraph_definition.lock_slot_holder_left.position[3]
				ui_scenegraph.lock_slot_holder_right.position[1] = scenegraph_definition.lock_slot_holder_right.position[1]
				ui_scenegraph.lock_slot_holder_right.position[2] = scenegraph_definition.lock_slot_holder_right.position[2]
				ui_scenegraph.lock_slot_holder_right.position[3] = scenegraph_definition.lock_slot_holder_right.position[3]
				ui_scenegraph.lock_bg_left.size[1] = scenegraph_definition.lock_bg_left.size[1]
				ui_scenegraph.lock_bg_left.size[2] = scenegraph_definition.lock_bg_left.size[2]
				ui_scenegraph.lock_bg_right.size[1] = scenegraph_definition.lock_bg_right.size[1]
				ui_scenegraph.lock_bg_right.size[2] = scenegraph_definition.lock_bg_right.size[2]
				ui_scenegraph.lock_pillar_left.size[1] = scenegraph_definition.lock_pillar_left.size[1]
				ui_scenegraph.lock_pillar_left.size[2] = scenegraph_definition.lock_pillar_left.size[2]
				ui_scenegraph.lock_pillar_right.size[1] = scenegraph_definition.lock_pillar_right.size[1]
				ui_scenegraph.lock_pillar_right.size[2] = scenegraph_definition.lock_pillar_right.size[2]
				ui_scenegraph.lock_pillar_top.size[1] = scenegraph_definition.lock_pillar_top.size[1]
				ui_scenegraph.lock_pillar_top.size[2] = scenegraph_definition.lock_pillar_top.size[2]
				ui_scenegraph.lock_pillar_bottom.size[1] = scenegraph_definition.lock_pillar_bottom.size[1]
				ui_scenegraph.lock_pillar_bottom.size[2] = scenegraph_definition.lock_pillar_bottom.size[2]
				ui_scenegraph.lock_cogwheel_bg_left.size[1] = scenegraph_definition.lock_cogwheel_bg_left.size[1]
				ui_scenegraph.lock_cogwheel_bg_left.size[2] = scenegraph_definition.lock_cogwheel_bg_left.size[2]
				ui_scenegraph.lock_cogwheel_bg_right.size[1] = scenegraph_definition.lock_cogwheel_bg_right.size[1]
				ui_scenegraph.lock_cogwheel_bg_right.size[2] = scenegraph_definition.lock_cogwheel_bg_right.size[2]
				ui_scenegraph.lock_cogwheel_left.size[1] = scenegraph_definition.lock_cogwheel_left.size[1]
				ui_scenegraph.lock_cogwheel_left.size[2] = scenegraph_definition.lock_cogwheel_left.size[2]
				ui_scenegraph.lock_cogwheel_right.size[1] = scenegraph_definition.lock_cogwheel_right.size[1]
				ui_scenegraph.lock_cogwheel_right.size[2] = scenegraph_definition.lock_cogwheel_right.size[2]
				ui_scenegraph.lock_stick_top_left.size[1] = scenegraph_definition.lock_stick_top_left.size[1]
				ui_scenegraph.lock_stick_top_left.size[2] = scenegraph_definition.lock_stick_top_left.size[2]
				ui_scenegraph.lock_stick_top_right.size[1] = scenegraph_definition.lock_stick_top_right.size[1]
				ui_scenegraph.lock_stick_top_right.size[2] = scenegraph_definition.lock_stick_top_right.size[2]
				ui_scenegraph.lock_stick_bottom_left.size[1] = scenegraph_definition.lock_stick_bottom_left.size[1]
				ui_scenegraph.lock_stick_bottom_left.size[2] = scenegraph_definition.lock_stick_bottom_left.size[2]
				ui_scenegraph.lock_stick_bottom_right.size[1] = scenegraph_definition.lock_stick_bottom_right.size[1]
				ui_scenegraph.lock_stick_bottom_right.size[2] = scenegraph_definition.lock_stick_bottom_right.size[2]
				ui_scenegraph.lock_block_left.size[1] = scenegraph_definition.lock_block_left.size[1]
				ui_scenegraph.lock_block_left.size[2] = scenegraph_definition.lock_block_left.size[2]
				ui_scenegraph.lock_block_right.size[1] = scenegraph_definition.lock_block_right.size[1]
				ui_scenegraph.lock_block_right.size[2] = scenegraph_definition.lock_block_right.size[2]
				ui_scenegraph.lock_slot_holder_left.size[1] = scenegraph_definition.lock_slot_holder_left.size[1]
				ui_scenegraph.lock_slot_holder_left.size[2] = scenegraph_definition.lock_slot_holder_left.size[2]
				ui_scenegraph.lock_slot_holder_right.size[1] = scenegraph_definition.lock_slot_holder_right.size[1]
				ui_scenegraph.lock_slot_holder_right.size[2] = scenegraph_definition.lock_slot_holder_right.size[2]
				widgets.frame_right.content.visible = false
				widgets.frame_bottom.content.visible = false
				widgets.frame_left.content.visible = false
				widgets.frame_top.content.visible = false
				widgets.left_mask.style.texture_id.color[1] = 0
				widgets.right_mask.style.texture_id.color[1] = 0
				widgets.top_mask.style.texture_id.color[1] = 0
				widgets.bottom_mask.style.texture_id.color[1] = 0
				widgets.center_mask.style.texture_id.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local value = math.easeOutCubic(local_progress)

				ui_scenegraph.lock_root.position[2] = math.lerp(scenegraph_definition.lock_root.position[2], -355, value)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "sticks_open",
			start_progress = 0.5 * lock_open_time_multiplier,
			end_progress = 1 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local lock_stick_top_left_position = ui_scenegraph.lock_stick_top_left.local_position

				lock_stick_top_left_position = scenegraph_definition.lock_stick_top_left.position

				local lock_stick_top_right_position = ui_scenegraph.lock_stick_top_right.local_position
				local lock_stick_top_right_default_position = scenegraph_definition.lock_stick_top_right.position

				lock_stick_top_right_position[1] = lock_stick_top_right_default_position[1]
				lock_stick_top_right_position[2] = lock_stick_top_right_default_position[2]

				local lock_stick_bottom_left_position = ui_scenegraph.lock_stick_bottom_left.local_position
				local lock_stick_bottom_left_default_position = scenegraph_definition.lock_stick_bottom_left.position

				lock_stick_bottom_left_position[1] = lock_stick_bottom_left_default_position[1]
				lock_stick_bottom_left_position[2] = lock_stick_bottom_left_default_position[2]

				local lock_stick_bottom_right_position = ui_scenegraph.lock_stick_bottom_right.local_position
				local lock_stick_bottom_right_default_position = scenegraph_definition.lock_stick_bottom_right.position

				lock_stick_bottom_right_position[1] = lock_stick_bottom_right_default_position[1]
				lock_stick_bottom_right_position[2] = lock_stick_bottom_right_default_position[2]

				local lock_cover_top_left_position = ui_scenegraph.lock_cover_top_left.local_position
				local lock_cover_top_left_default_position = scenegraph_definition.lock_cover_top_left.position

				lock_cover_top_left_position[1] = lock_cover_top_left_default_position[1]
				lock_cover_top_left_position[2] = lock_cover_top_left_default_position[2]

				local lock_cover_top_right_position = ui_scenegraph.lock_cover_top_right.local_position
				local lock_cover_top_right_default_position = scenegraph_definition.lock_cover_top_right.position

				lock_cover_top_right_position[1] = lock_cover_top_right_default_position[1]
				lock_cover_top_right_position[2] = lock_cover_top_right_default_position[2]

				local lock_cover_bottom_left_position = ui_scenegraph.lock_cover_bottom_left.local_position
				local lock_cover_bottom_left_default_position = scenegraph_definition.lock_cover_bottom_left.position

				lock_cover_bottom_left_position[1] = lock_cover_bottom_left_default_position[1]
				lock_cover_bottom_left_position[2] = lock_cover_bottom_left_default_position[2]

				local lock_cover_bottom_right_position = ui_scenegraph.lock_cover_bottom_right.local_position
				local lock_cover_bottom_right_default_position = scenegraph_definition.lock_cover_bottom_right.position

				lock_cover_bottom_right_position[1] = lock_cover_bottom_right_default_position[1]
				lock_cover_bottom_right_position[2] = lock_cover_bottom_right_default_position[2]

				local lock_pillar_left_position = ui_scenegraph.lock_pillar_left.local_position
				local lock_pillar_left_default_position = scenegraph_definition.lock_pillar_left.position

				lock_pillar_left_position[1] = lock_pillar_left_default_position[1]

				local lock_pillar_right_position = ui_scenegraph.lock_pillar_right.local_position
				local lock_pillar_right_default_position = scenegraph_definition.lock_pillar_right.position

				lock_pillar_right_position[1] = lock_pillar_right_default_position[1]

				local lock_pillar_top_position = ui_scenegraph.lock_pillar_top.local_position
				local lock_pillar_top_default_position = scenegraph_definition.lock_pillar_top.position

				lock_pillar_top_position[2] = lock_pillar_top_default_position[2]

				local lock_pillar_bottom_position = ui_scenegraph.lock_pillar_bottom.local_position
				local lock_pillar_bottom_default_position = scenegraph_definition.lock_pillar_bottom.position

				lock_pillar_bottom_position[2] = lock_pillar_bottom_default_position[2]
				widgets.lock_cogwheel_left.style.texture_id.angle = 0
				widgets.lock_cogwheel_right.style.texture_id.angle = 0
				widgets.lock_slot_holder_left.style.texture_id.angle = 0
				widgets.lock_slot_holder_right.style.texture_id.angle = 0
				widgets.lock_block_left.style.texture_id.angle = 0
				widgets.lock_block_right.style.texture_id.angle = math.pi
				widgets.lock_cogwheel_bg_left.style.texture_id.angle = 0
				widgets.lock_cogwheel_bg_right.style.texture_id.angle = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local value = math.easeCubic(local_progress)
				local move_distance = 50
				local lock_stick_top_left_position = ui_scenegraph.lock_stick_top_left.local_position
				local lock_stick_top_left_default_position = scenegraph_definition.lock_stick_top_left.position
				local lock_stick_top_right_position = ui_scenegraph.lock_stick_top_right.local_position
				local lock_stick_top_right_default_position = scenegraph_definition.lock_stick_top_right.position
				local lock_stick_bottom_left_position = ui_scenegraph.lock_stick_bottom_left.local_position
				local lock_stick_bottom_left_default_position = scenegraph_definition.lock_stick_bottom_left.position
				local lock_stick_bottom_right_position = ui_scenegraph.lock_stick_bottom_right.local_position
				local lock_stick_bottom_right_default_position = scenegraph_definition.lock_stick_bottom_right.position

				lock_stick_top_left_position[1] = lock_stick_top_left_default_position[1] - move_distance * value
				lock_stick_top_left_position[2] = lock_stick_top_left_default_position[2] + move_distance * value
				lock_stick_top_right_position[1] = lock_stick_top_right_default_position[1] + move_distance * value
				lock_stick_top_right_position[2] = lock_stick_top_right_default_position[2] + move_distance * value
				lock_stick_bottom_left_position[1] = lock_stick_bottom_left_default_position[1] - move_distance * value
				lock_stick_bottom_left_position[2] = lock_stick_bottom_left_default_position[2] - move_distance * value
				lock_stick_bottom_right_position[1] = lock_stick_bottom_right_default_position[1] + move_distance * value
				lock_stick_bottom_right_position[2] = lock_stick_bottom_right_default_position[2] - move_distance * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "cover_open",
			start_progress = 1.2 * lock_open_time_multiplier,
			end_progress = 1.8 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 90
				local value = math.easeOutCubic(local_progress)
				local lock_cover_top_left_position = ui_scenegraph.lock_cover_top_left.local_position
				local lock_cover_top_left_default_position = scenegraph_definition.lock_cover_top_left.position
				local lock_cover_top_right_position = ui_scenegraph.lock_cover_top_right.local_position
				local lock_cover_top_right_default_position = scenegraph_definition.lock_cover_top_right.position
				local lock_cover_bottom_left_position = ui_scenegraph.lock_cover_bottom_left.local_position
				local lock_cover_bottom_left_default_position = scenegraph_definition.lock_cover_bottom_left.position
				local lock_cover_bottom_right_position = ui_scenegraph.lock_cover_bottom_right.local_position
				local lock_cover_bottom_right_default_position = scenegraph_definition.lock_cover_bottom_right.position

				lock_cover_top_left_position[1] = lock_cover_top_left_default_position[1] - move_distance * value
				lock_cover_top_left_position[2] = lock_cover_top_left_default_position[2] + move_distance * value
				lock_cover_top_right_position[1] = lock_cover_top_right_default_position[1] + move_distance * value
				lock_cover_top_right_position[2] = lock_cover_top_right_default_position[2] + move_distance * value
				lock_cover_bottom_left_position[1] = lock_cover_bottom_left_default_position[1] - move_distance * value
				lock_cover_bottom_left_position[2] = lock_cover_bottom_left_default_position[2] - move_distance * value
				lock_cover_bottom_right_position[1] = lock_cover_bottom_right_default_position[1] + move_distance * value
				lock_cover_bottom_right_position[2] = lock_cover_bottom_right_default_position[2] - move_distance * value

				local block_angle = math.pi * 4 * value
				local lock_block_left_widget = widgets.lock_block_left
				local lock_block_right_widget = widgets.lock_block_right

				lock_block_left_widget.style.texture_id.angle = block_angle
				lock_block_right_widget.style.texture_id.angle = block_angle + math.pi
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "top_and_bottom_pillar_lock",
			start_progress = 1.8 * lock_open_time_multiplier,
			end_progress = 1.9 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 28
				local value = math.ease_in_exp(local_progress)
				local lock_pillar_top_position = ui_scenegraph.lock_pillar_top.local_position
				local lock_pillar_top_default_position = scenegraph_definition.lock_pillar_top.position
				local lock_pillar_bottom_position = ui_scenegraph.lock_pillar_bottom.local_position
				local lock_pillar_bottom_default_position = scenegraph_definition.lock_pillar_bottom.position

				lock_pillar_top_position[2] = lock_pillar_top_default_position[2] + move_distance * value
				lock_pillar_bottom_position[2] = lock_pillar_bottom_default_position[2] - move_distance * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "cogwheel_bg_spin",
			start_progress = 2 * lock_open_time_multiplier,
			end_progress = 2.4 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local value = math.easeCubic(local_progress)
				local lock_cogwheel_bg_left_widget = widgets.lock_cogwheel_bg_left
				local lock_cogwheel_bg_right_widget = widgets.lock_cogwheel_bg_right
				local angle = math.pi * 0.5 * value

				lock_cogwheel_bg_left_widget.style.texture_id.angle = angle
				lock_cogwheel_bg_right_widget.style.texture_id.angle = angle
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "cogwheel_spin",
			start_progress = 2.5 * lock_open_time_multiplier,
			end_progress = 3.5 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local cogwheel_value = math.ease_exp(local_progress)
				local center_value = math.easeInCubic(local_progress)
				local lock_slot_holder_left_widget = widgets.lock_slot_holder_left
				local lock_slot_holder_right_widget = widgets.lock_slot_holder_right
				local lock_cogwheel_left_widget = widgets.lock_cogwheel_left
				local lock_cogwheel_right_widget = widgets.lock_cogwheel_right
				local center_angle = math.pi / 2 * center_value
				local cogwheel_angle = math.pi * 2 * cogwheel_value

				lock_slot_holder_left_widget.style.texture_id.angle = -center_angle
				lock_slot_holder_right_widget.style.texture_id.angle = -center_angle
				lock_cogwheel_left_widget.style.texture_id.angle = cogwheel_angle
				lock_cogwheel_right_widget.style.texture_id.angle = cogwheel_angle
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			name = "left_and_right_pillar_lock",
			start_progress = 3.5 * lock_open_time_multiplier,
			end_progress = 3.6 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 28
				local value = math.ease_in_exp(local_progress)
				local lock_pillar_left_position = ui_scenegraph.lock_pillar_left.local_position
				local lock_pillar_left_default_position = scenegraph_definition.lock_pillar_left.position
				local lock_pillar_right_position = ui_scenegraph.lock_pillar_right.local_position
				local lock_pillar_right_default_position = scenegraph_definition.lock_pillar_right.position

				lock_pillar_left_position[1] = lock_pillar_left_default_position[1] - move_distance * value
				lock_pillar_right_position[1] = lock_pillar_right_default_position[1] + move_distance * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	lock_close = {
		{
			end_progress = 3.1,
			name = "sticks_open",
			start_progress = 2.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local value = math.easeCubic(1 - local_progress)
				local move_distance = 50
				local lock_stick_top_left_position = ui_scenegraph.lock_stick_top_left.local_position
				local lock_stick_top_left_default_position = scenegraph_definition.lock_stick_top_left.position
				local lock_stick_top_right_position = ui_scenegraph.lock_stick_top_right.local_position
				local lock_stick_top_right_default_position = scenegraph_definition.lock_stick_top_right.position
				local lock_stick_bottom_left_position = ui_scenegraph.lock_stick_bottom_left.local_position
				local lock_stick_bottom_left_default_position = scenegraph_definition.lock_stick_bottom_left.position
				local lock_stick_bottom_right_position = ui_scenegraph.lock_stick_bottom_right.local_position
				local lock_stick_bottom_right_default_position = scenegraph_definition.lock_stick_bottom_right.position

				lock_stick_top_left_position[1] = lock_stick_top_left_default_position[1] - move_distance * value + 50 * (1 - value)
				lock_stick_top_left_position[2] = lock_stick_top_left_default_position[2] + move_distance * value - 50 * (1 - value)
				lock_stick_top_right_position[1] = lock_stick_top_right_default_position[1] + move_distance * value - 50 * (1 - value)
				lock_stick_top_right_position[2] = lock_stick_top_right_default_position[2] + move_distance * value - 50 * (1 - value)
				lock_stick_bottom_left_position[1] = lock_stick_bottom_left_default_position[1] - move_distance * value + 50 * (1 - value)
				lock_stick_bottom_left_position[2] = lock_stick_bottom_left_default_position[2] - move_distance * value + 50 * (1 - value)
				lock_stick_bottom_right_position[1] = lock_stick_bottom_right_default_position[1] + move_distance * value - 50 * (1 - value)
				lock_stick_bottom_right_position[2] = lock_stick_bottom_right_default_position[2] - move_distance * value + 50 * (1 - value)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.4,
			name = "cover_open",
			start_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 90
				local value = math.easeOutCubic(1 - local_progress)
				local lock_cover_top_left_position = ui_scenegraph.lock_cover_top_left.local_position
				local lock_cover_top_left_default_position = scenegraph_definition.lock_cover_top_left.position
				local lock_cover_top_right_position = ui_scenegraph.lock_cover_top_right.local_position
				local lock_cover_top_right_default_position = scenegraph_definition.lock_cover_top_right.position
				local lock_cover_bottom_left_position = ui_scenegraph.lock_cover_bottom_left.local_position
				local lock_cover_bottom_left_default_position = scenegraph_definition.lock_cover_bottom_left.position
				local lock_cover_bottom_right_position = ui_scenegraph.lock_cover_bottom_right.local_position
				local lock_cover_bottom_right_default_position = scenegraph_definition.lock_cover_bottom_right.position

				lock_cover_top_left_position[1] = lock_cover_top_left_default_position[1] - move_distance * value
				lock_cover_top_left_position[2] = lock_cover_top_left_default_position[2] + move_distance * value
				lock_cover_top_right_position[1] = lock_cover_top_right_default_position[1] + move_distance * value
				lock_cover_top_right_position[2] = lock_cover_top_right_default_position[2] + move_distance * value
				lock_cover_bottom_left_position[1] = lock_cover_bottom_left_default_position[1] - move_distance * value
				lock_cover_bottom_left_position[2] = lock_cover_bottom_left_default_position[2] - move_distance * value
				lock_cover_bottom_right_position[1] = lock_cover_bottom_right_default_position[1] + move_distance * value
				lock_cover_bottom_right_position[2] = lock_cover_bottom_right_default_position[2] - move_distance * value

				local block_angle = math.pi * 4 * value
				local lock_block_left_widget = widgets.lock_block_left
				local lock_block_right_widget = widgets.lock_block_right

				lock_block_left_widget.style.texture_id.angle = block_angle
				lock_block_right_widget.style.texture_id.angle = block_angle + math.pi
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.8,
			name = "top_and_bottom_pillar_lock",
			start_progress = 1.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 28
				local value = math.ease_in_exp(1 - local_progress)
				local lock_pillar_top_position = ui_scenegraph.lock_pillar_top.local_position
				local lock_pillar_top_default_position = scenegraph_definition.lock_pillar_top.position
				local lock_pillar_bottom_position = ui_scenegraph.lock_pillar_bottom.local_position
				local lock_pillar_bottom_default_position = scenegraph_definition.lock_pillar_bottom.position

				lock_pillar_top_position[2] = lock_pillar_top_default_position[2] + move_distance * value
				lock_pillar_bottom_position[2] = lock_pillar_bottom_default_position[2] - move_distance * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.6,
			name = "cogwheel_bg_spin",
			start_progress = 1.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local value = math.easeCubic(1 - local_progress)
				local lock_cogwheel_bg_left_widget = widgets.lock_cogwheel_bg_left
				local lock_cogwheel_bg_right_widget = widgets.lock_cogwheel_bg_right
				local angle = math.pi * 0.5 * value

				lock_cogwheel_bg_left_widget.style.texture_id.angle = angle
				lock_cogwheel_bg_right_widget.style.texture_id.angle = angle
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.1,
			name = "cogwheel_spin",
			start_progress = 0.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local cogwheel_value = math.ease_exp(1 - local_progress)
				local center_value = math.easeInCubic(1 - local_progress)
				local lock_slot_holder_left_widget = widgets.lock_slot_holder_left
				local lock_slot_holder_right_widget = widgets.lock_slot_holder_right
				local lock_cogwheel_left_widget = widgets.lock_cogwheel_left
				local lock_cogwheel_right_widget = widgets.lock_cogwheel_right
				local center_angle = math.pi / 2 * center_value
				local cogwheel_angle = math.pi * 2 * cogwheel_value

				lock_slot_holder_left_widget.style.texture_id.angle = -center_angle
				lock_slot_holder_right_widget.style.texture_id.angle = -center_angle
				lock_cogwheel_left_widget.style.texture_id.angle = cogwheel_angle
				lock_cogwheel_right_widget.style.texture_id.angle = cogwheel_angle
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.1,
			name = "left_and_right_pillar_lock",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local move_distance = 28
				local value = math.ease_in_exp(1 - local_progress)
				local lock_pillar_left_position = ui_scenegraph.lock_pillar_left.local_position
				local lock_pillar_left_default_position = scenegraph_definition.lock_pillar_left.position
				local lock_pillar_right_position = ui_scenegraph.lock_pillar_right.local_position
				local lock_pillar_right_default_position = scenegraph_definition.lock_pillar_right.position

				lock_pillar_left_position[1] = lock_pillar_left_default_position[1] - move_distance * value
				lock_pillar_right_position[1] = lock_pillar_right_default_position[1] + move_distance * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 3.5,
			name = "finalize",
			start_progress = 3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				widgets.lock_bg_left.content.visible = false
				widgets.lock_bg_right.content.visible = false
				widgets.lock_block_left.content.visible = false
				widgets.lock_block_right.content.visible = false
				widgets.lock_cogwheel_left.content.visible = false
				widgets.lock_cogwheel_right.content.visible = false

				local move_distance = 120
				local value = math.easeOutCubic(local_progress)
				local lock_pillar_left_position = ui_scenegraph.lock_pillar_left.local_position
				local lock_pillar_left_default_position = scenegraph_definition.lock_pillar_left.position

				lock_pillar_left_position[1] = lock_pillar_left_default_position[1] + move_distance * value

				local lock_pillar_right_position = ui_scenegraph.lock_pillar_right.local_position
				local lock_pillar_right_default_position = scenegraph_definition.lock_pillar_right.position

				lock_pillar_right_position[1] = lock_pillar_right_default_position[1] - move_distance * value

				local lock_pillar_top_position = ui_scenegraph.lock_pillar_top.local_position
				local lock_pillar_top_default_position = scenegraph_definition.lock_pillar_top.position

				lock_pillar_top_position[2] = lock_pillar_top_default_position[2] - move_distance * value

				local lock_pillar_bottom_position = ui_scenegraph.lock_pillar_bottom.local_position
				local lock_pillar_bottom_default_position = scenegraph_definition.lock_pillar_bottom.position

				lock_pillar_bottom_position[2] = lock_pillar_bottom_default_position[2] + move_distance * value

				local size_multiplier = 0.25
				local lock_cogwheel_bg_left_size = ui_scenegraph.lock_cogwheel_bg_left.size
				local lock_cogwheel_bg_left_default_size = scenegraph_definition.lock_cogwheel_bg_left.size

				lock_cogwheel_bg_left_size[1] = lock_cogwheel_bg_left_default_size[1] - lock_cogwheel_bg_left_default_size[1] * size_multiplier * value
				lock_cogwheel_bg_left_size[2] = lock_cogwheel_bg_left_default_size[2] - lock_cogwheel_bg_left_default_size[2] * size_multiplier * value

				local lock_cogwheel_bg_right_size = ui_scenegraph.lock_cogwheel_bg_right.size
				local lock_cogwheel_bg_right_position = ui_scenegraph.lock_cogwheel_bg_right.local_position
				local lock_cogwheel_bg_right_default_size = scenegraph_definition.lock_cogwheel_bg_right.size
				local lock_cogwheel_bg_right_default_position = scenegraph_definition.lock_cogwheel_bg_right.position

				lock_cogwheel_bg_right_size[1] = lock_cogwheel_bg_right_default_size[1] - lock_cogwheel_bg_right_default_size[1] * size_multiplier * value
				lock_cogwheel_bg_right_size[2] = lock_cogwheel_bg_right_default_size[2] - lock_cogwheel_bg_right_default_size[2] * size_multiplier * value
				lock_cogwheel_bg_right_position[1] = lock_cogwheel_bg_right_default_position[1] - lock_cogwheel_bg_right_default_position[1] * size_multiplier * value

				local lock_slot_holder_left_size = ui_scenegraph.lock_slot_holder_left.size
				local lock_slot_holder_left_default_size = scenegraph_definition.lock_slot_holder_left.size

				lock_slot_holder_left_size[2] = lock_slot_holder_left_default_size[2] - lock_slot_holder_left_default_size[2] * size_multiplier * value

				local lock_slot_holder_right_size = ui_scenegraph.lock_slot_holder_right.size
				local lock_slot_holder_right_default_size = scenegraph_definition.lock_slot_holder_right.size

				lock_slot_holder_right_size[2] = lock_slot_holder_right_default_size[2] - lock_slot_holder_right_default_size[2] * size_multiplier * value
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	reveal = {
		{
			name = "reveal",
			start_progress = 0.5 * lock_open_time_multiplier,
			end_progress = 1 * lock_open_time_multiplier,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.lock_bg_left.content.visible = false
				widgets.lock_bg_right.content.visible = false
				widgets.lock_pillar_left.content.visible = false
				widgets.lock_pillar_right.content.visible = false
				widgets.lock_pillar_top.content.visible = false
				widgets.lock_pillar_bottom.content.visible = false
				widgets.lock_cogwheel_bg_left.content.visible = false
				widgets.lock_cogwheel_bg_right.content.visible = false
				widgets.lock_cogwheel_left.content.visible = false
				widgets.lock_cogwheel_right.content.visible = false
				widgets.lock_stick_top_left.content.visible = false
				widgets.lock_stick_top_right.content.visible = false
				widgets.lock_stick_bottom_left.content.visible = false
				widgets.lock_stick_bottom_right.content.visible = false
				widgets.lock_block_left.content.visible = false
				widgets.lock_block_right.content.visible = false
				widgets.lock_slot_holder_left.content.visible = false
				widgets.lock_slot_holder_right.content.visible = false
				widgets.left_mask.style.texture_id.color[1] = 0
				widgets.right_mask.style.texture_id.color[1] = 0
				widgets.top_mask.style.texture_id.color[1] = 0
				widgets.bottom_mask.style.texture_id.color[1] = 0
				widgets.center_mask.style.texture_id.color[1] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.frame_left.local_position[1] = 0
				ui_scenegraph.frame_left.local_position[2] = 0
				ui_scenegraph.frame_left.local_position[3] = 0
				ui_scenegraph.frame_top.local_position[1] = 0
				ui_scenegraph.frame_top.local_position[2] = 0
				ui_scenegraph.frame_top.local_position[3] = 0
				ui_scenegraph.frame_right.local_position[1] = 0
				ui_scenegraph.frame_right.local_position[2] = 0
				ui_scenegraph.frame_right.local_position[3] = 0
				ui_scenegraph.frame_bottom.local_position[1] = 0
				ui_scenegraph.frame_bottom.local_position[2] = 0
				ui_scenegraph.frame_bottom.local_position[3] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				widgets.frame_right.content.visible = true
				widgets.frame_bottom.content.visible = true
				widgets.frame_left.content.visible = true
				widgets.frame_top.content.visible = true

				local move_distance = 130
				local value = math.easeOutCubic(local_progress)
				local lock_cover_top_left_position = ui_scenegraph.lock_cover_top_left.local_position
				local lock_cover_top_left_default_position = scenegraph_definition.lock_cover_top_left.position
				local lock_cover_top_right_position = ui_scenegraph.lock_cover_top_right.local_position
				local lock_cover_top_right_default_position = scenegraph_definition.lock_cover_top_right.position
				local lock_cover_bottom_left_position = ui_scenegraph.lock_cover_bottom_left.local_position
				local lock_cover_bottom_left_default_position = scenegraph_definition.lock_cover_bottom_left.position
				local lock_cover_bottom_right_position = ui_scenegraph.lock_cover_bottom_right.local_position
				local lock_cover_bottom_right_default_position = scenegraph_definition.lock_cover_bottom_right.position

				lock_cover_top_left_position[1] = lock_cover_top_left_default_position[1] - move_distance * value
				lock_cover_top_left_position[2] = lock_cover_top_left_default_position[2] + move_distance * value
				lock_cover_top_right_position[1] = lock_cover_top_right_default_position[1] + move_distance * value
				lock_cover_top_right_position[2] = lock_cover_top_right_default_position[2] + move_distance * value
				lock_cover_bottom_left_position[1] = lock_cover_bottom_left_default_position[1] - move_distance * value
				lock_cover_bottom_left_position[2] = lock_cover_bottom_left_default_position[2] - move_distance * value
				lock_cover_bottom_right_position[1] = lock_cover_bottom_right_default_position[1] + move_distance * value
				lock_cover_bottom_right_position[2] = lock_cover_bottom_right_default_position[2] - move_distance * value

				local frame_left_position = ui_scenegraph.frame_left.local_position
				local frame_left_default_position = scenegraph_definition.frame_left.position
				local frame_top_position = ui_scenegraph.frame_top.local_position
				local frame_top_default_position = scenegraph_definition.frame_top.position
				local frame_right_position = ui_scenegraph.frame_right.local_position
				local frame_right_default_position = scenegraph_definition.frame_right.position
				local frame_bottom_position = ui_scenegraph.frame_bottom.local_position
				local frame_bottom_default_position = scenegraph_definition.frame_bottom.position

				frame_left_position[1] = frame_left_default_position[1] - (move_distance + 77) * value
				frame_top_position[2] = frame_top_default_position[2] + (move_distance + 85) * value
				frame_right_position[1] = frame_right_default_position[1] + (move_distance + 85) * value
				frame_bottom_position[2] = frame_bottom_default_position[2] - (move_distance + 85) * value

				local mask_left_position = ui_scenegraph.mask_left.local_position
				local mask_left_default_position = scenegraph_definition.mask_left.position
				local mask_right_position = ui_scenegraph.mask_right.local_position
				local mask_right_default_position = scenegraph_definition.mask_right.position
				local mask_bottom_position = ui_scenegraph.mask_bottom.local_position
				local mask_bottom_default_position = scenegraph_definition.mask_bottom.position
				local mask_top_position = ui_scenegraph.mask_top.local_position
				local mask_top_default_position = scenegraph_definition.mask_top.position

				mask_left_position[1] = mask_left_default_position[1] - 185 * value
				mask_left_position[2] = mask_left_default_position[2]
				mask_right_position[1] = mask_right_default_position[1] + 185 * value
				mask_right_position[2] = mask_right_default_position[2]
				mask_bottom_position[2] = mask_bottom_default_position[1] - 185 * value
				mask_top_position[2] = mask_top_default_position[2] + 185 * value
				widgets.left_mask.style.texture_id.color[1] = local_progress * 255
				widgets.right_mask.style.texture_id.color[1] = local_progress * 255
				widgets.top_mask.style.texture_id.color[1] = local_progress * 255
				widgets.bottom_mask.style.texture_id.color[1] = local_progress * 255
				widgets.center_mask.style.texture_id.color[1] = local_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	reveal_instant = {
		{
			end_progress = 0,
			name = "reveal_instant",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.lock_root.position[2] = -355
				widgets.lock_bg_left.content.visible = false
				widgets.lock_bg_right.content.visible = false
				widgets.lock_pillar_left.content.visible = false
				widgets.lock_pillar_right.content.visible = false
				widgets.lock_pillar_top.content.visible = false
				widgets.lock_pillar_bottom.content.visible = false
				widgets.lock_cogwheel_bg_left.content.visible = false
				widgets.lock_cogwheel_bg_right.content.visible = false
				widgets.lock_cogwheel_left.content.visible = false
				widgets.lock_cogwheel_right.content.visible = false
				widgets.lock_stick_top_left.content.visible = false
				widgets.lock_stick_top_right.content.visible = false
				widgets.lock_stick_bottom_left.content.visible = false
				widgets.lock_stick_bottom_right.content.visible = false
				widgets.lock_block_left.content.visible = false
				widgets.lock_block_right.content.visible = false
				widgets.lock_slot_holder_left.content.visible = false
				widgets.lock_slot_holder_right.content.visible = false
				widgets.lock_cover_top_left.content.visible = true
				widgets.lock_cover_top_right.content.visible = true
				widgets.lock_cover_bottom_left.content.visible = true
				widgets.lock_cover_bottom_right.content.visible = true
				widgets.frame_right.content.visible = true
				widgets.frame_bottom.content.visible = true
				widgets.frame_left.content.visible = true
				widgets.frame_top.content.visible = true
				widgets.left_mask.style.texture_id.color[1] = 0
				widgets.right_mask.style.texture_id.color[1] = 0
				widgets.top_mask.style.texture_id.color[1] = 0
				widgets.bottom_mask.style.texture_id.color[1] = 0
				widgets.center_mask.style.texture_id.color[1] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.frame_left.local_position[1] = 0
				ui_scenegraph.frame_left.local_position[2] = 0
				ui_scenegraph.frame_left.local_position[3] = 0
				ui_scenegraph.frame_top.local_position[1] = 0
				ui_scenegraph.frame_top.local_position[2] = 0
				ui_scenegraph.frame_top.local_position[3] = 0
				ui_scenegraph.frame_right.local_position[1] = 0
				ui_scenegraph.frame_right.local_position[2] = 0
				ui_scenegraph.frame_right.local_position[3] = 0
				ui_scenegraph.frame_bottom.local_position[1] = 0
				ui_scenegraph.frame_bottom.local_position[2] = 0
				ui_scenegraph.frame_bottom.local_position[3] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				widgets.frame_right.content.visible = true
				widgets.frame_bottom.content.visible = true
				widgets.frame_left.content.visible = true
				widgets.frame_top.content.visible = true

				local move_distance = 130
				local value = math.easeOutCubic(local_progress)
				local lock_cover_top_left_position = ui_scenegraph.lock_cover_top_left.local_position
				local lock_cover_top_left_default_position = scenegraph_definition.lock_cover_top_left.position
				local lock_cover_top_right_position = ui_scenegraph.lock_cover_top_right.local_position
				local lock_cover_top_right_default_position = scenegraph_definition.lock_cover_top_right.position
				local lock_cover_bottom_left_position = ui_scenegraph.lock_cover_bottom_left.local_position
				local lock_cover_bottom_left_default_position = scenegraph_definition.lock_cover_bottom_left.position
				local lock_cover_bottom_right_position = ui_scenegraph.lock_cover_bottom_right.local_position
				local lock_cover_bottom_right_default_position = scenegraph_definition.lock_cover_bottom_right.position

				lock_cover_top_left_position[1] = lock_cover_top_left_default_position[1] - move_distance * value
				lock_cover_top_left_position[2] = lock_cover_top_left_default_position[2] + move_distance * value
				lock_cover_top_right_position[1] = lock_cover_top_right_default_position[1] + move_distance * value
				lock_cover_top_right_position[2] = lock_cover_top_right_default_position[2] + move_distance * value
				lock_cover_bottom_left_position[1] = lock_cover_bottom_left_default_position[1] - move_distance * value
				lock_cover_bottom_left_position[2] = lock_cover_bottom_left_default_position[2] - move_distance * value
				lock_cover_bottom_right_position[1] = lock_cover_bottom_right_default_position[1] + move_distance * value
				lock_cover_bottom_right_position[2] = lock_cover_bottom_right_default_position[2] - move_distance * value

				local frame_left_position = ui_scenegraph.frame_left.local_position
				local frame_left_default_position = scenegraph_definition.frame_left.position
				local frame_top_position = ui_scenegraph.frame_top.local_position
				local frame_top_default_position = scenegraph_definition.frame_top.position
				local frame_right_position = ui_scenegraph.frame_right.local_position
				local frame_right_default_position = scenegraph_definition.frame_right.position
				local frame_bottom_position = ui_scenegraph.frame_bottom.local_position
				local frame_bottom_default_position = scenegraph_definition.frame_bottom.position

				frame_left_position[1] = frame_left_default_position[1] - (move_distance + 77) * value
				frame_top_position[2] = frame_top_default_position[2] + (move_distance + 85) * value
				frame_right_position[1] = frame_right_default_position[1] + (move_distance + 85) * value
				frame_bottom_position[2] = frame_bottom_default_position[2] - (move_distance + 85) * value

				local mask_left_position = ui_scenegraph.mask_left.local_position
				local mask_left_default_position = scenegraph_definition.mask_left.position
				local mask_right_position = ui_scenegraph.mask_right.local_position
				local mask_right_default_position = scenegraph_definition.mask_right.position
				local mask_bottom_position = ui_scenegraph.mask_bottom.local_position
				local mask_bottom_default_position = scenegraph_definition.mask_bottom.position
				local mask_top_position = ui_scenegraph.mask_top.local_position
				local mask_top_default_position = scenegraph_definition.mask_top.position

				mask_left_position[1] = mask_left_default_position[1] - 185 * value
				mask_left_position[2] = mask_left_default_position[2]
				mask_right_position[1] = mask_right_default_position[1] + 185 * value
				mask_right_position[2] = mask_right_default_position[2]
				mask_bottom_position[2] = mask_bottom_default_position[1] - 185 * value
				mask_top_position[2] = mask_top_default_position[2] + 185 * value
				widgets.left_mask.style.texture_id.color[1] = local_progress * 255
				widgets.right_mask.style.texture_id.color[1] = local_progress * 255
				widgets.top_mask.style.texture_id.color[1] = local_progress * 255
				widgets.bottom_mask.style.texture_id.color[1] = local_progress * 255
				widgets.center_mask.style.texture_id.color[1] = local_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	hide_instant = {
		{
			end_progress = 0,
			name = "hide_instant",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.lock_root.position[2] = -355
				widgets.lock_bg_left.content.visible = false
				widgets.lock_bg_right.content.visible = false
				widgets.lock_pillar_left.content.visible = false
				widgets.lock_pillar_right.content.visible = false
				widgets.lock_pillar_top.content.visible = false
				widgets.lock_pillar_bottom.content.visible = false
				widgets.lock_cogwheel_bg_left.content.visible = false
				widgets.lock_cogwheel_bg_right.content.visible = false
				widgets.lock_cogwheel_left.content.visible = false
				widgets.lock_cogwheel_right.content.visible = false
				widgets.lock_stick_top_left.content.visible = false
				widgets.lock_stick_top_right.content.visible = false
				widgets.lock_stick_bottom_left.content.visible = false
				widgets.lock_stick_bottom_right.content.visible = false
				widgets.lock_block_left.content.visible = false
				widgets.lock_block_right.content.visible = false
				widgets.lock_slot_holder_left.content.visible = false
				widgets.lock_slot_holder_right.content.visible = false
				widgets.lock_cover_top_left.content.visible = false
				widgets.lock_cover_top_right.content.visible = false
				widgets.lock_cover_bottom_left.content.visible = false
				widgets.lock_cover_bottom_right.content.visible = false
				widgets.frame_right.content.visible = false
				widgets.frame_bottom.content.visible = false
				widgets.frame_left.content.visible = false
				widgets.frame_top.content.visible = false
				widgets.left_mask.style.texture_id.color[1] = 0
				widgets.right_mask.style.texture_id.color[1] = 0
				widgets.top_mask.style.texture_id.color[1] = 0
				widgets.bottom_mask.style.texture_id.color[1] = 0
				widgets.center_mask.style.texture_id.color[1] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.mask_left.local_position[1] = 0
				ui_scenegraph.mask_left.local_position[2] = 0
				ui_scenegraph.mask_left.local_position[3] = 0
				ui_scenegraph.mask_right.local_position[1] = 0
				ui_scenegraph.mask_right.local_position[2] = 0
				ui_scenegraph.mask_right.local_position[3] = 0
				ui_scenegraph.mask_top.local_position[1] = 0
				ui_scenegraph.mask_top.local_position[2] = 0
				ui_scenegraph.mask_top.local_position[3] = 0
				ui_scenegraph.mask_bottom.local_position[1] = 0
				ui_scenegraph.mask_bottom.local_position[2] = 0
				ui_scenegraph.mask_bottom.local_position[3] = 0
				ui_scenegraph.frame_left.local_position[1] = 0
				ui_scenegraph.frame_left.local_position[2] = 0
				ui_scenegraph.frame_left.local_position[3] = 0
				ui_scenegraph.frame_top.local_position[1] = 0
				ui_scenegraph.frame_top.local_position[2] = 0
				ui_scenegraph.frame_top.local_position[3] = 0
				ui_scenegraph.frame_right.local_position[1] = 0
				ui_scenegraph.frame_right.local_position[2] = 0
				ui_scenegraph.frame_right.local_position[3] = 0
				ui_scenegraph.frame_bottom.local_position[1] = 0
				ui_scenegraph.frame_bottom.local_position[2] = 0
				ui_scenegraph.frame_bottom.local_position[3] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				return
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
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	multiple_rewards = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_toggle",
			input_action = "special_1",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	claim_available = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "welcome_currency_popup_button_claim",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
}

return {
	gotwf_item_size = {
		gotwf_item_size[1] + gotwf_item_spacing,
		gotwf_item_size[2],
	},
	icon_scale = icon_scale,
	create_item_definition_func = create_item_definition_func,
	widgets = widgets,
	lock_widgets = lock_widgets,
	bottom_widgets = bottom_widgets,
	background_widgets = background_widgets,
	viewport_widgets = viewport_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	create_simple_item = create_simple_item,
	create_claim_button = create_claim_button,
}
