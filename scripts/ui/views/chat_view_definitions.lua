-- chunkname: @scripts/ui/views/chat_view_definitions.lua

local user_list_height = 800
local user_list_frame_name = "menu_frame_06"
local user_list_frame_settings = UIFrameSettings[user_list_frame_name]
local user_list_frame_height = user_list_frame_settings.texture_sizes.corner[2]
local num_users_in_list = 12
local chat_frame_name = "menu_frame_06"
local chat_frame_settings = UIFrameSettings[chat_frame_name]
local chat_frame_edge_height = chat_frame_settings.texture_sizes.horizontal[2]
local window_size = user_list_height - user_list_frame_height * 2
local user_list_entry_size = window_size / num_users_in_list
local emoji_list_settings = {
	emoji_height_spacing = 5,
	emoji_width_spacing = 5,
	emojis_per_row = 9,
	max_rows = 7,
	emoji_size = {
		35,
		35,
	},
	emoji_offset = {
		5,
		2,
	},
}
local channels_list_settings = {
	channels_height_spacing = 5,
	channels_per_row = 3,
	channels_width_spacing = 5,
	max_rows = 6,
	channels_offset = {
		10,
		-10,
		0,
	},
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.default,
		},
		size = {
			1920,
			1080,
		},
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.default,
		},
		size = {
			1920,
			1080,
		},
	},
	popup_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			1200,
			1000,
		},
	},
	input_field = {
		horizontal_alignment = "left",
		parent = "popup_root",
		vertical_alignment = "bottom",
		position = {
			0,
			100,
			1,
		},
		size = {
			625,
			50,
		},
		position = {
			150,
			50,
			2,
		},
	},
	commands_list = {
		horizontal_alignment = "left",
		parent = "input_field",
		vertical_alignment = "bottom",
		position = {
			25,
			65,
			12,
		},
		size = {
			400,
			300,
		},
	},
	commands_list_entry = {
		horizontal_alignment = "left",
		parent = "commands_list",
		vertical_alignment = "top",
		position = {
			0,
			5,
			1,
		},
		size = {
			500,
			20,
		},
	},
	filtered_user_names_list = {
		horizontal_alignment = "left",
		parent = "input_field",
		vertical_alignment = "bottom",
		position = {
			25,
			60,
			12,
		},
		size = {
			400,
			300,
		},
	},
	filtered_user_names_list_entry = {
		horizontal_alignment = "left",
		parent = "filtered_user_names_list",
		vertical_alignment = "top",
		position = {
			0,
			5,
			1,
		},
		size = {
			500,
			20,
		},
	},
	logo = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "top",
		position = {
			0,
			-50,
			1,
		},
		size = {
			600,
			216,
		},
	},
	title_text = {
		horizontal_alignment = "center",
		parent = "logo",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = {
			800,
			0,
		},
	},
	connecting = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "center",
		position = {
			120,
			-50,
			1,
		},
		size = {
			400,
			50,
		},
	},
	popup_text_box = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "center",
		position = {
			-100,
			-50,
			1,
		},
		size = {
			400,
			50,
		},
	},
	popup_text = {
		horizontal_alignment = "center",
		parent = "logo",
		vertical_alignment = "top",
		position = {
			0,
			-150,
			2,
		},
		size = {
			520,
			260,
		},
	},
	twitch_connect_button = {
		horizontal_alignment = "left",
		parent = "popup_text_box",
		vertical_alignment = "center",
		position = {
			420,
			0,
			2,
		},
		size = {
			188,
			50,
		},
	},
	twitch_disconnect_button = {
		horizontal_alignment = "center",
		parent = "popup_root",
		vertical_alignment = "center",
		position = {
			0,
			-50,
			2,
		},
		size = {
			188,
			50,
		},
	},
	glass_indicator = {
		horizontal_alignment = "right",
		parent = "popup_root",
		vertical_alignment = "top",
		size = {
			40,
			40,
		},
		position = {
			-20,
			-20,
			1,
		},
	},
	fuzzy_circle = {
		horizontal_alignment = "center",
		parent = "glass_indicator",
		vertical_alignment = "center",
		size = {
			90,
			90,
		},
	},
	feed_area_edge = {
		horizontal_alignment = "left",
		parent = "popup_root",
		vertical_alignment = "bottom",
		size = {
			730,
			800,
		},
		position = {
			50,
			110,
			2,
		},
	},
	feed_area_top = {
		horizontal_alignment = "center",
		parent = "feed_area_edge",
		vertical_alignment = "center",
		size = {
			686,
			796,
		},
	},
	channel_tab_anchor = {
		horizontal_alignment = "left",
		parent = "feed_area_top",
		vertical_alignment = "top",
		size = {
			167,
			40,
		},
		position = {
			10,
			40,
			2,
		},
	},
	feed_area = {
		horizontal_alignment = "center",
		parent = "feed_area_top",
		vertical_alignment = "center",
		size = {
			690 - chat_frame_edge_height * 2 + 25,
			800 - chat_frame_edge_height * 2 - 7.5,
		},
	},
	list_area = {
		horizontal_alignment = "right",
		parent = "feed_area_edge",
		vertical_alignment = "top",
		size = {
			370,
			user_list_height,
		},
		position = {
			380,
			0,
			1,
		},
	},
	entry_root = {
		horizontal_alignment = "left",
		parent = "list_area",
		vertical_alignment = "top",
		size = {
			400 - user_list_frame_height * 2 - 30,
			user_list_entry_size,
		},
		position = {
			user_list_frame_height,
			-user_list_frame_height,
			0,
		},
	},
	temp_user_list_area = {
		horizontal_alignment = "center",
		parent = "list_area",
		vertical_alignment = "center",
		position = {
			300,
			0,
			0,
		},
		size = {
			190,
			780,
		},
	},
	down_arrow = {
		horizontal_alignment = "left",
		parent = "popup_root",
		vertical_alignment = "top",
		position = {
			25,
			-20,
			10,
		},
		size = {
			60,
			45,
		},
	},
	channel_list = {
		horizontal_alignment = "left",
		parent = "down_arrow",
		vertical_alignment = "top",
		position = {
			25,
			-55,
			12,
		},
		size = {
			400,
			300,
		},
	},
	channel_list_entry = {
		horizontal_alignment = "left",
		parent = "channel_list",
		vertical_alignment = "top",
		position = {
			0,
			-5,
			1,
		},
		size = {
			500,
			30,
		},
	},
	exit_button = {
		horizontal_alignment = "right",
		parent = "channel_list",
		vertical_alignment = "top",
		position = {
			-25,
			0,
			1,
		},
		size = {
			40,
			40,
		},
	},
	private_messages_button = {
		horizontal_alignment = "left",
		parent = "list_area",
		vertical_alignment = "bottom",
		position = {
			0,
			-53,
			1,
		},
		size = {
			120,
			44,
		},
	},
	private_user_list = {
		horizontal_alignment = "left",
		parent = "private_messages_button",
		vertical_alignment = "top",
		position = {
			0,
			0,
			12,
		},
		size = {
			400,
			300,
		},
	},
	private_user_list_entry = {
		horizontal_alignment = "left",
		parent = "private_user_list",
		vertical_alignment = "top",
		position = {
			0,
			5,
			1,
		},
		size = {
			500,
			30,
		},
	},
	exit_button_private_user = {
		horizontal_alignment = "right",
		parent = "private_user_list",
		vertical_alignment = "top",
		position = {
			-25,
			0,
			1,
		},
		size = {
			25,
			25,
		},
	},
	channels_button = {
		horizontal_alignment = "right",
		parent = "private_messages_button",
		vertical_alignment = "bottom",
		position = {
			125,
			0,
			1,
		},
		size = {
			120,
			44,
		},
	},
	channels_button_list = {
		horizontal_alignment = "left",
		parent = "channels_button",
		vertical_alignment = "top",
		position = {
			0,
			0,
			12,
		},
		size = {
			400,
			300,
		},
	},
	channels_button_list_entry = {
		horizontal_alignment = "left",
		parent = "channels_button_list",
		vertical_alignment = "top",
		position = {
			0,
			5,
			1,
		},
		size = {
			500,
			30,
		},
	},
	exit_button_channel = {
		horizontal_alignment = "right",
		parent = "channels_button_list",
		vertical_alignment = "top",
		position = {
			-25,
			0,
			1,
		},
		size = {
			25,
			25,
		},
	},
	popular_channels_button = {
		horizontal_alignment = "right",
		parent = "channels_button",
		vertical_alignment = "bottom",
		position = {
			125,
			0,
			1,
		},
		size = {
			120,
			44,
		},
	},
	popular_channels_button_list = {
		horizontal_alignment = "right",
		parent = "popular_channels_button",
		vertical_alignment = "top",
		position = {
			0,
			0,
			12,
		},
		size = {
			400,
			300,
		},
	},
	popular_channels_button_list_entry = {
		horizontal_alignment = "left",
		parent = "popular_channels_button_list",
		vertical_alignment = "top",
		position = {
			0,
			5,
			1,
		},
		size = {
			500,
			30,
		},
	},
	commands_button = {
		horizontal_alignment = "left",
		parent = "input_field",
		vertical_alignment = "bottom",
		position = {
			-50,
			7.5,
			1,
		},
		size = {
			44,
			44,
		},
	},
	emoji_button = {
		horizontal_alignment = "left",
		parent = "commands_button",
		vertical_alignment = "bottom",
		position = {
			-50,
			0,
			0,
		},
		size = {
			44,
			44,
		},
	},
	emoji_frame = {
		horizontal_alignment = "left",
		parent = "feed_area",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			15,
		},
		size = {
			500,
			500,
		},
	},
	emoji_scrollbar = {
		horizontal_alignment = "right",
		parent = "emoji_frame",
		vertical_alignment = "top",
		position = {
			-15,
			-12,
			10,
		},
		size = {
			10,
			500,
		},
	},
	emoji = {
		horizontal_alignment = "left",
		parent = "feed_area",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			16,
		},
		size = {
			32,
			32,
		},
	},
	channels_window_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
		size = {
			800,
			500,
		},
	},
	channels_window_text_box = {
		horizontal_alignment = "right",
		parent = "channels_window_root",
		vertical_alignment = "top",
		position = {
			-40,
			-110,
			1,
		},
		size = {
			300,
			40,
		},
	},
	channels_window_text = {
		horizontal_alignment = "center",
		parent = "channels_window_text_box",
		vertical_alignment = "top",
		position = {
			0,
			-150,
			2,
		},
		size = {
			520,
			260,
		},
	},
	channels_window_list_box = {
		horizontal_alignment = "center",
		parent = "channels_window_root",
		vertical_alignment = "bottom",
		position = {
			0,
			80,
			2,
		},
		size = {
			720,
			260,
		},
	},
	channels_window_list_box_entry = {
		horizontal_alignment = "left",
		parent = "channels_window_list_box",
		vertical_alignment = "top",
		position = {
			0,
			0,
			2,
		},
		size = {
			0,
			0,
		},
	},
	channels_window_close = {
		horizontal_alignment = "right",
		parent = "channels_window_root",
		vertical_alignment = "top",
		position = {
			-10,
			-10,
			2,
		},
		size = {
			40,
			40,
		},
	},
	join_channel_button = {
		horizontal_alignment = "right",
		parent = "channels_window_root",
		vertical_alignment = "bottom",
		position = {
			-40,
			20,
			1,
		},
		size = {
			120,
			44,
		},
	},
	create_channel_button = {
		horizontal_alignment = "left",
		parent = "channels_window_root",
		vertical_alignment = "bottom",
		position = {
			40,
			20,
			1,
		},
		size = {
			120,
			44,
		},
	},
	recent_channels_button = {
		horizontal_alignment = "left",
		parent = "create_channel_button",
		vertical_alignment = "bottom",
		position = {
			140,
			0,
			1,
		},
		size = {
			120,
			44,
		},
	},
	channels_window_list_header = {
		horizontal_alignment = "center",
		parent = "channels_window_root",
		vertical_alignment = "top",
		position = {
			0,
			25,
			5,
		},
		size = {
			200,
			50,
		},
	},
	create_channels_window_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
		size = {
			500,
			250,
		},
	},
	create_channel_input = {
		horizontal_alignment = "center",
		parent = "create_channels_window_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			300,
			40,
		},
	},
	create_channel_window_close = {
		horizontal_alignment = "right",
		parent = "create_channels_window_root",
		vertical_alignment = "top",
		position = {
			-10,
			-10,
			2,
		},
		size = {
			40,
			40,
		},
	},
	create_channel_window_list_header = {
		horizontal_alignment = "center",
		parent = "create_channels_window_root",
		vertical_alignment = "top",
		position = {
			0,
			25,
			5,
		},
		size = {
			300,
			50,
		},
	},
	inner_create_channel_button = {
		horizontal_alignment = "center",
		parent = "create_channels_window_root",
		vertical_alignment = "bottom",
		position = {
			0,
			20,
			1,
		},
		size = {
			120,
			44,
		},
	},
	recent_channels_window_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
		size = {
			500,
			500,
		},
	},
	recent_join_channel_button = {
		horizontal_alignment = "center",
		parent = "recent_channels_window_root",
		vertical_alignment = "bottom",
		position = {
			0,
			20,
			1,
		},
		size = {
			120,
			44,
		},
	},
	recent_channel_window_list_header = {
		horizontal_alignment = "center",
		parent = "recent_channels_window_root",
		vertical_alignment = "top",
		position = {
			0,
			25,
			5,
		},
		size = {
			300,
			50,
		},
	},
	recent_channels_window_list_box = {
		horizontal_alignment = "center",
		parent = "recent_channels_window_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			260,
			290,
		},
	},
	recent_channels_window_list_box_entry = {
		horizontal_alignment = "center",
		parent = "recent_channels_window_list_box",
		vertical_alignment = "top",
		position = {
			0,
			-5,
			2,
		},
		size = {
			250,
			52,
		},
	},
	recent_channels_window_close = {
		horizontal_alignment = "right",
		parent = "recent_channels_window_root",
		vertical_alignment = "top",
		position = {
			-10,
			-10,
			2,
		},
		size = {
			40,
			40,
		},
	},
	send_invite_button = {
		horizontal_alignment = "center",
		parent = "create_channels_window_root",
		vertical_alignment = "bottom",
		position = {
			0,
			20,
			1,
		},
		size = {
			200,
			44,
		},
	},
}

local function create_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "triangle",
			style_id = "left_arrow_top",
			content_change_function = function (content, style)
				style.color = content.left_hotspot.is_hover and style.hover_color or style.base_color
			end,
		},
		{
			pass_type = "triangle",
			style_id = "left_arrow_bottom",
			content_change_function = function (content, style)
				style.color = content.left_hotspot.is_hover and style.hover_color or style.base_color
			end,
		},
		{
			pass_type = "triangle",
			style_id = "right_arrow_top",
			content_change_function = function (content, style)
				style.color = content.right_hotspot.is_hover and style.hover_color or style.base_color
			end,
		},
		{
			pass_type = "triangle",
			style_id = "right_arrow_bottom",
			content_change_function = function (content, style)
				style.color = content.right_hotspot.is_hover and style.hover_color or style.base_color
			end,
		},
		{
			pass_type = "rect",
			style_id = "outer_tab_bg_left",
		},
		{
			pass_type = "rect",
			style_id = "inner_tab_bg_left",
		},
		{
			pass_type = "rect",
			style_id = "outer_tab_bg_right",
		},
		{
			pass_type = "rect",
			style_id = "inner_tab_bg_right",
		},
		{
			content_id = "left_hotspot",
			pass_type = "hotspot",
			style_id = "left_hotspot",
		},
		{
			content_id = "right_hotspot",
			pass_type = "hotspot",
			style_id = "right_hotspot",
		},
		{
			pass_type = "texture",
			style_id = "mask",
			texture_id = "mask_id",
		},
		{
			content_id = "text_input_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "input_field",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "rect",
			style_id = "inner_inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "chat_text",
			text_id = "real_chat_text",
			content_check_function = function (content, style)
				if not content.text_field_active then
					return false
				else
					style.caret_color[1] = 128 + math.sin(Managers.time:time("ui") * 5) * 128
				end

				content.real_chat_text = content.chat_text.text

				return true
			end,
		},
		{
			pass_type = "text",
			style_id = "chat_hint",
			text_id = "chat_hint",
			content_check_function = function (content, style)
				local hotspot = content.text_input_hotspot

				if hotspot.is_hover then
					style.text_color = {
						128,
						255,
						255,
						255,
					}
				else
					style.text_color = {
						60,
						255,
						255,
						255,
					}
				end

				return content.chat_text.text == "" and not content.text_field_active
			end,
		},
		{
			pass_type = "text",
			style_id = "private_user_name",
			text_id = "trimmed_private_user_name",
			content_check_function = function (content)
				if not content.private_user_name then
					return false
				end

				return true
			end,
		},
	}
	local content = {
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		channel_arrow_id = "down_arrow",
		channel_name = " ",
		chat_hint = "Press Enter to chat or / for commands",
		mask_id = "mask_rect",
		text_field_active = false,
		text_index = 1,
		text_start_offset = 0,
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		background_id = background_texture,
		text_input_hotspot = {},
		screen_hotspot = {},
		channel_hotspot = {},
		left_hotspot = {},
		right_hotspot = {},
		chat_text = {
			text = "",
		},
	}
	local style = {
		left_hotspot = {
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				50,
				910,
				100,
			},
			size = {
				28,
				35,
			},
		},
		right_hotspot = {
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				750,
				910,
				100,
			},
			size = {
				28,
				35,
			},
		},
		left_arrow_top = {
			horizontal_alignment = "left",
			triangle_alignment = "bottom_right",
			vertical_alignment = "top",
			base_color = {
				255,
				105,
				90,
				70,
			},
			hover_color = {
				255,
				210,
				180,
				140,
			},
			texture_size = {
				12,
				12,
			},
			offset = {
				63,
				-61,
				100,
			},
		},
		left_arrow_bottom = {
			horizontal_alignment = "left",
			triangle_alignment = "top_right",
			vertical_alignment = "top",
			base_color = {
				255,
				105,
				90,
				70,
			},
			hover_color = {
				255,
				210,
				180,
				140,
			},
			texture_size = {
				12,
				12,
			},
			offset = {
				63,
				-73,
				100,
			},
		},
		right_arrow_top = {
			horizontal_alignment = "left",
			triangle_alignment = "bottom_left",
			vertical_alignment = "top",
			base_color = {
				255,
				105,
				90,
				70,
			},
			hover_color = {
				255,
				210,
				180,
				140,
			},
			texture_size = {
				12,
				12,
			},
			offset = {
				758,
				-61,
				100,
			},
		},
		right_arrow_bottom = {
			horizontal_alignment = "left",
			triangle_alignment = "top_left",
			vertical_alignment = "top",
			base_color = {
				255,
				105,
				90,
				70,
			},
			hover_color = {
				255,
				210,
				180,
				140,
			},
			texture_size = {
				12,
				12,
			},
			offset = {
				758,
				-73,
				100,
			},
		},
		inner_tab_bg_left = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = {
				255,
				20,
				20,
				20,
			},
			texture_size = {
				21,
				33,
			},
			offset = {
				60,
				-57,
				3,
			},
		},
		outer_tab_bg_left = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = {
				255,
				0,
				0,
				0,
			},
			texture_size = {
				25,
				35,
			},
			offset = {
				58,
				-55,
				2,
			},
		},
		inner_tab_bg_right = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = {
				255,
				20,
				20,
				20,
			},
			texture_size = {
				21,
				33,
			},
			offset = {
				752,
				-57,
				3,
			},
		},
		outer_tab_bg_right = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = {
				255,
				0,
				0,
				0,
			},
			texture_size = {
				25,
				35,
			},
			offset = {
				750,
				-55,
				2,
			},
		},
		mask = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				671,
				35,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				79,
				-55,
				100,
			},
		},
		background = {
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
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
				5,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
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
		inner_rect = {
			scenegraph_id = "input_field",
			color = {
				255,
				128,
				128,
				128,
			},
			offset = {
				0,
				10,
				0,
			},
			size = {
				625,
				40,
			},
		},
		inner_inner_rect = {
			scenegraph_id = "input_field",
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				2,
				12,
				0,
			},
			size = {
				621,
				36,
			},
		},
		chat_hint = {
			dynamic_font_size = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "input_field",
			vertical_alignment = "bottom",
			word_wrap = true,
			text_color = {
				60,
				255,
				255,
				255,
			},
			offset = {
				25,
				10,
				10,
			},
		},
		chat_text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "input_field",
			vertical_alignment = "bottom",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				10,
				20,
				10,
			},
			size = {
				scenegraph_definition.input_field.size[1] - 10,
				scenegraph_definition.input_field.size[2],
			},
			caret_size = {
				2,
				18,
			},
			caret_offset = {
				-2,
				-2,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
		channel = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "popup_root",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("cheeseburger"),
			offset = {
				85,
				-35,
				10,
			},
		},
		private_user_name = {
			dynamic_font = true,
			font_size = 36,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "popup_root",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("medium_purple"),
			offset = {
				85,
				-35,
				10,
			},
		},
		channel_arrow = {
			horizontal_alignment = "left",
			scenegraph_id = "popup_root",
			vertical_alignment = "top",
			offset = {
				50,
				-43,
				10,
			},
			texture_size = {
				20,
				15,
			},
			color = Colors.get_table("cheeseburger"),
		},
	}

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

local function create_chat_output_widget(in_scenegraph_id, offset)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "text_area_chat",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				if content.private_user_name then
					return false
				end

				content.message_tables = content.channel_messages_table[content.channel_name] or {}

				return true
			end,
		},
		{
			pass_type = "text_area_chat",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				if not content.private_user_name then
					return false
				end

				content.message_tables = content.private_messages_table[content.private_user_name] or {}

				return true
			end,
		},
	}
	local content = {
		channel_name = " ",
		mask_id = "mask_rect",
		text_start_offset = 0,
		channel_messages_table = {},
		private_messages_table = {},
		message_tables = {},
		frame = chat_frame_settings.texture,
	}
	local style = {
		mask = {
			corner_radius = 0,
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
			texture_size = chat_frame_settings.texture_size,
			texture_sizes = chat_frame_settings.texture_sizes,
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
		background = {
			offset = {
				0,
				0,
				0,
			},
			color = {
				160,
				0,
				0,
				0,
			},
		},
		text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "chat_output_font",
			pixel_perfect = false,
			scenegraph_id = "feed_area",
			spacing = 7,
			vertical_alignment = "bottom",
			word_wrap = true,
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("gold"),
			emoji_size = {
				24,
				24,
			},
			offset = {
				0,
				0,
				3,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = in_scenegraph_id

	return widget
end

local function create_chat_user_list_widget(in_scenegraph_id, offset)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture",
			style_id = "mask",
			texture_id = "mask_id",
		},
		{
			pass_type = "rounded_background",
			style_id = "edge",
		},
		{
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			pass_type = "user_list_chat",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				content.message_tables = content.channel_messages_table[content.channel_name] or {}

				return true
			end,
		},
	}
	local content = {
		channel_name = " ",
		mask_id = "mask_rect",
		text_start_offset = 0,
		channel_messages_table = {},
		message_tables = {},
	}
	local style = {
		mask = {
			corner_radius = 0,
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
			scenegraph_id = in_scenegraph_id .. "_top",
		},
		edge = {
			corner_radius = 0,
			offset = {
				0,
				0,
				1,
			},
			color = {
				60,
				255,
				255,
				255,
			},
			scenegraph_id = in_scenegraph_id .. "_edge",
		},
		background = {
			corner_radius = 0,
			offset = {
				0,
				0,
				0,
			},
			color = Colors.get_color_table_with_alpha("black", 255),
			scenegraph_id = in_scenegraph_id .. "_top",
		},
		text = {
			dynamic_font = true,
			font_size = 18,
			font_type = "hell_shark_arial_masked",
			pixel_perfect = false,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("gold"),
			offset = {
				0,
				offset,
				3,
			},
			scenegraph_id = in_scenegraph_id,
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = in_scenegraph_id

	return widget
end

local function create_user_entry(index)
	local scenegraph_id = "entry_root"
	local size = scenegraph_definition[scenegraph_id].size
	local frame_settings = UIFrameSettings.menu_frame_06
	local offset = {
		0,
		-(user_list_entry_size * (index - 1)),
		0,
	}

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
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "text",
					style_id = "level_text",
					text_id = "level_text",
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_selected and not button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_hover",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
			},
		},
		content = {
			description_text = "n/a",
			glow = "tabs_glow",
			icon = "icons_placeholder",
			level_text = "n/a",
			title_text = "n/a",
			button_hotspot = {},
			frame = frame_settings.texture,
		},
		style = {
			icon = {
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
				size = {
					size[2],
					size[2],
				},
			},
			background = {
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
			title_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					scenegraph_definition[scenegraph_id].size[1] - 70,
					scenegraph_definition[scenegraph_id].size[2],
				},
				offset = {
					size[2] + user_list_frame_height,
					-10,
					3,
				},
			},
			title_text_hover = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					scenegraph_definition[scenegraph_id].size[1] - 70,
					scenegraph_definition[scenegraph_id].size[2],
				},
				offset = {
					size[2] + user_list_frame_height,
					-10,
					3,
				},
			},
			level_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("rosy_brown", 255),
				offset = {
					size[2] + user_list_frame_height,
					4,
					3,
				},
			},
			description_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					size[2] + user_list_frame_height,
					4,
					3,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			glow = {
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
		scenegraph_id = scenegraph_id,
		offset = offset,
	}
end

local channel_list_frame = {
	scenegraph_id = "channel_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}

local function create_channel_tab(channel_name, index, current_channel_name)
	local frame_settings = UIFrameSettings.button_frame_01
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "inner_tab",
			texture_id = "texture_id",
		},
		{
			content_id = "tab_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "channel_name",
			text_id = "channel_name",
			content_check_function = function (content, style)
				if content.tab_hotspot.is_hover then
					style.text_color = style.hover_color
				elseif content.selected then
					style.text_color = style.selected_color
				else
					style.text_color = style.base_color
				end

				return true
			end,
		},
	}
	local content = {
		texture_id = "rect_masked",
		tab_hotspot = {},
		exit_button_hotspot = {},
		channel_name = channel_name,
		frame = frame_settings.texture,
		selected = current_channel_name == channel_name,
	}
	local style = {
		channel_name = {
			dynamic_font = true,
			dynamic_font_size = true,
			font_size = 18,
			font_type = "hell_shark_arial_masked",
			horizontal_alignment = "center",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			base_color = {
				255,
				128,
				128,
				128,
			},
			selected_color = Colors.get_table("cheeseburger"),
			hover_color = Colors.get_table("white"),
			size = {
				scenegraph_definition.channel_tab_anchor.size[1] - 10,
				scenegraph_definition.channel_tab_anchor.size[2],
			},
			offset = {
				0,
				-5,
				-1,
			},
		},
		tab = {
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "top",
			color = {
				255,
				255,
				255,
				255,
			},
			texture_size = scenegraph_definition.channel_tab_anchor.size,
			offset = {
				0,
				0,
				-3,
			},
		},
		inner_tab = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = {
				255,
				0,
				0,
				0,
			},
			texture_size = {
				scenegraph_definition.channel_tab_anchor.size[1] - 4,
				scenegraph_definition.channel_tab_anchor.size[2] - 2,
			},
			offset = {
				2,
				-2,
				-2,
			},
		},
		frame = {
			masked = true,
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
				-4,
				0,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		(index - 1) * scenegraph_definition.channel_tab_anchor.size[1],
		0,
		0,
	}
	widget.scenegraph_id = "channel_tab_anchor"

	return widget
end

local private_user_list_frame = {
	scenegraph_id = "private_user_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}
local recent_channels_list_frame = {
	scenegraph_id = "channels_button_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		num_recent_channels = 0,
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}
local popular_channels_list_frame = {
	scenegraph_id = "popular_channels_button_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}

function create_channel_entry(name, offset_y)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "exit_button_hotspot",
			pass_type = "hotspot",
			style_id = "exit_button_hotspot",
		},
		{
			pass_type = "texture",
			style_id = "exit_button",
			texture_id = "exit_texture_id",
			content_check_function = function (content)
				return not content.exit_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "exit_button_hover",
			texture_id = "exit_texture_hover_id",
			content_check_function = function (content)
				return content.exit_button_hotspot.is_hover
			end,
		},
		{
			content_id = "channel_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "channel_name",
			text_id = "channel_name",
			content_check_function = function (content, style)
				if content.channel_hotspot.is_hover then
					style.text_color = Colors.get_table("white")
				else
					style.text_color = Colors.get_table("cheeseburger")
				end

				return true
			end,
		},
	}
	local content = {
		exit_texture_hover_id = "tabs_icon_power_glow",
		exit_texture_id = "tabs_icon_power",
		channel_hotspot = {},
		channel_name = name,
		exit_button_hotspot = {},
	}
	local style = {
		channel_name = {
			dynamic_font = true,
			font_size = 18,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				50,
				0,
				3,
			},
		},
		exit_button_hotspot = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y,
				0,
			},
		},
		exit_button_hover = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y - 3,
				0,
			},
			color = {
				255,
				255,
				30,
				30,
			},
			texture_size = {
				30,
				30,
			},
		},
		exit_button = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y - 3,
				0,
			},
			texture_size = {
				30,
				30,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "channel_list_entry"

	return widget
end

function create_recent_channel_entry(name, offset_y)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "channel_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "channel_name",
			text_id = "channel_name",
			content_check_function = function (content, style)
				if content.channel_hotspot.is_hover then
					style.text_color = Colors.get_table("white")
				else
					style.text_color = Colors.get_table("cheeseburger")
				end

				return true
			end,
		},
	}
	local content = {
		exit_texture_hover_id = "tabs_icon_power_glow",
		exit_texture_id = "tabs_icon_power",
		channel_hotspot = {},
		channel_name = name,
		exit_button_hotspot = {},
	}
	local style = {
		channel_name = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				50,
				0,
				3,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "channels_button_list_entry"

	return widget
end

function create_popular_channels_entry(name, num_users, offset_y)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "channel_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "channel_name",
			text_id = "channel_name",
			content_check_function = function (content, style)
				if content.channel_hotspot.is_hover then
					style.text_color = Colors.get_table("white")
				else
					style.text_color = Colors.get_table("cheeseburger")
				end

				return true
			end,
		},
		{
			pass_type = "text",
			style_id = "num_users",
			text_id = "num_users",
		},
	}
	local content = {
		exit_texture_hover_id = "tabs_icon_power_glow",
		exit_texture_id = "tabs_icon_power",
		channel_hotspot = {},
		channel_name = name,
		num_users = num_users,
		exit_button_hotspot = {},
	}
	local style = {
		channel_name = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				50,
				0,
				3,
			},
		},
		num_users = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_arial",
			horizontal_alignment = "right",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				50,
				0,
				3,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "popular_channels_button_list_entry"

	return widget
end

function create_filtered_user_name_entry(name, offset_y)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "user_name_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "user_name",
			text_id = "user_name",
			content_check_function = function (content, style)
				if content.user_name_hotspot.is_hover then
					style.text_color = Colors.get_table("white")
				else
					style.text_color = Colors.get_table("medium_purple")
				end

				return true
			end,
		},
	}
	local content = {
		exit_texture_hover_id = "tabs_icon_power_glow",
		exit_texture_id = "tabs_icon_power",
		user_name_hotspot = {},
		user_name = name,
		exit_button_hotspot = {},
	}
	local style = {
		user_name = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				30,
				0,
				3,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "filtered_user_names_list_entry"

	return widget
end

function create_private_user_entry(name, offset_y, new)
	local widget = {
		element = {},
	}
	local trimmed_name = string.sub(name, 1, -11)
	local passes = {
		{
			content_id = "exit_button_hotspot",
			pass_type = "hotspot",
			style_id = "exit_button_hotspot",
		},
		{
			pass_type = "texture",
			style_id = "exit_button",
			texture_id = "exit_texture_id",
			content_check_function = function (content)
				return not content.exit_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "exit_button_hover",
			texture_id = "exit_texture_hover_id",
			content_check_function = function (content)
				return content.exit_button_hotspot.is_hover
			end,
		},
		{
			content_id = "user_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "user_name",
			text_id = "trimmed_name",
			content_check_function = function (content, style)
				local selected_color = style.selected_color
				local unselected_color = style.unselected_color

				if content.user_hotspot.is_hover then
					style.text_color = selected_color
				else
					local blend = 1

					if content.new then
						local time = Managers.time:time("main")

						blend = 0.5 + math.sin(time * 8) * 0.5
					end

					style.current_color[2] = math.lerp(selected_color[2], unselected_color[2], blend)
					style.current_color[3] = math.lerp(selected_color[3], unselected_color[3], blend)
					style.current_color[4] = math.lerp(selected_color[4], unselected_color[4], blend)
					style.text_color = style.current_color
				end

				return true
			end,
		},
	}
	local content = {
		exit_texture_hover_id = "tabs_icon_power_glow",
		exit_texture_id = "tabs_icon_power",
		user_hotspot = {},
		user_name = name,
		trimmed_name = trimmed_name,
		exit_button_hotspot = {},
		new = new,
	}
	local style = {
		user_name = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("medium_purple"),
			unselected_color = Colors.get_table("medium_purple"),
			selected_color = Colors.get_table("white"),
			current_color = Colors.get_table("white"),
			offset = {
				50,
				0,
				3,
			},
		},
		exit_button_hotspot = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button_private_user",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y + 5,
				0,
			},
		},
		exit_button_hover = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button_private_user",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y + 5,
				0,
			},
			color = {
				255,
				255,
				30,
				30,
			},
		},
		exit_button = {
			horizontal_alignment = "right",
			scenegraph_id = "exit_button_private_user",
			vertical_alignment = "top",
			offset = {
				0,
				offset_y + 5,
				0,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "private_user_list_entry"

	return widget
end

local commands_list_frame = {
	scenegraph_id = "commands_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}
local filtered_user_names_list_frame = {
	scenegraph_id = "filtered_user_names_list",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "screen_hotspot",
				pass_type = "hotspot",
				scenegraph_id = "root",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {
		frame = UIFrameSettings.menu_frame_06.texture,
		hotspot = {},
		screen_hotspot = {},
	},
	style = {
		frame = {
			texture_size = UIFrameSettings.menu_frame_06.texture_size,
			texture_sizes = UIFrameSettings.menu_frame_06.texture_sizes,
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
		rect = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			color = Colors.get_table("black"),
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
}

function create_command_entry(command, description, parameter, description_offset, command_color, offset_y, chat_text)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "command_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "text",
			style_id = "command",
			text_id = "command",
		},
		{
			pass_type = "text",
			style_id = "command_compare",
			text_id = "command_compare",
			content_check_function = function (content, style)
				if content.command_hotspot.is_hover then
					content.command_compare = content.command

					return true
				end

				local input = chat_text.text
				local command = content.command
				local length = string.len(command)
				local start_idx, end_idx = string.find(command, input)

				if start_idx ~= 1 and end_idx ~= length then
					return false
				else
					content.command_compare = input

					return true
				end
			end,
		},
		{
			pass_type = "text",
			style_id = "description",
			text_id = "description",
			content_check_function = function (content, style)
				return content.description ~= nil
			end,
		},
	}
	local content = {
		command_compare = " ",
		command_hotspot = {},
		command = command,
		description = description,
		parameter = parameter,
		chat_text = chat_text,
	}
	local style = {
		command = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				30,
				0,
				3,
			},
		},
		command_compare = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = command_color or Colors.get_table("light_blue"),
			offset = {
				30,
				0,
				4,
			},
		},
		description = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("gray"),
			offset = {
				30 + description_offset,
				0,
				3,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		offset_y,
		0,
	}
	widget.scenegraph_id = "commands_list_entry"

	return widget
end

function create_private_button(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name)
	local button_color_name

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)

	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
					content_check_function = function (content)
						content.disable_button = not content.parent.has_private_conversations

						return true
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
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
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "texture",
					style_id = "speech_bubble",
					texture_id = "speech_bubble_id",
					content_check_function = function (content, style)
						return content.num_private_messages > 0
					end,
				},
				{
					pass_type = "text",
					style_id = "message_number",
					text_id = "message_number_text",
					content_check_function = function (content)
						local num_private_messages = content.num_private_messages

						if num_private_messages <= 0 then
							return false
						end

						if num_private_messages > 10 then
							content.message_number_text = "..."
						else
							content.message_number_text = tostring(num_private_messages)
						end

						return true
					end,
				},
			},
		},
		content = {
			glass_top = "button_glass_01",
			has_private_conversations = false,
			message_number_text = "",
			num_private_messages = 0,
			speech_bubble_id = "speech_bubble",
			hover_glow = optional_color_name and "button_state_hover_" .. optional_color_name or "button_state_hover",
			glow = optional_color_name and "button_state_normal_" .. optional_color_name or "button_state_normal",
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
			new_per_user = {},
		},
		style = {
			background = {
				color = background_color,
				offset = {
					0,
					0,
					0,
				},
			},
			clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					5,
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					5,
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					4,
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
					7,
				},
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					1,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
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
					size[2] - frame_settings.texture_sizes.horizontal[2] - 4,
					3,
				},
				size = {
					size[1],
					5,
				},
			},
			glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					2,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			speech_bubble = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					35,
					35,
				},
				offset = {
					10,
					10,
					10,
				},
			},
			message_number = {
				font_size = 18,
				font_type = "hell_shark_arial",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					57,
					17,
					11,
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

local function create_emoji()
	return {
		scenegraph_id = "emoji",
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rounded_background",
					style_id = "rect",
					content_check_function = function (content)
						return content.texture_id and content.hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end,
				},
			},
		},
		content = {
			hotspot = {},
		},
		style = {
			rect = {
				corner_radius = 5,
				masked = false,
				color = Colors.get_color_table_with_alpha("font_button_normal", 128),
				offset = {
					7.5,
					-2.5,
					-1,
				},
				size = {
					37,
					37,
				},
			},
			texture_id = {
				masked = true,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
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
	}
end

local function create_emoji_frame()
	local frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "hotspot",
			pass_type = "hotspot",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			pass_type = "rect",
			style_id = "rect",
		},
		{
			pass_type = "texture",
			style_id = "mask_rect",
			texture_id = "mask_texture",
		},
		{
			pass_type = "text",
			style_id = "emoji_text",
			text_id = "emoji_text_id",
			content_check_function = function (content)
				return content.emoji_text_id ~= nil
			end,
		},
		{
			pass_type = "texture",
			style_id = "emoji_texture",
			texture_id = "emoji_texture_id",
			content_check_function = function (content)
				return content.emoji_texture_id
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
	}
	local content = {
		mask_texture = "mask_rect",
		frame = frame_settings.texture,
		hotspot = {},
		screen_hotspot = {},
	}
	local style = {
		rect = {
			offset = {
				0,
				0,
				0,
			},
			color = {
				255,
				0,
				0,
				0,
			},
		},
		mask_rect = {
			offset = {
				0,
				0,
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
				5,
			},
		},
		emoji_text = {
			font_size = 22,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = true,
			vertical_alignment = "bottom",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				0,
				10,
				0,
			},
		},
		emoji_texture = {
			horizontal_alignment = "left",
			masked = false,
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				10,
				0,
			},
			texture_size = {
				32,
				32,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = "emoji_frame"

	return widget
end

local function create_emoji_scroller_func()
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "rect",
			style_id = "scrollbar",
		},
	}
	local content = {
		hotspot = {},
	}
	local style = {
		scrollbar = {
			color = Colors.get_color_table_with_alpha("font_button_normal", 128),
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = "emoji_scrollbar"

	return widget
end

local function create_channel_list_entry(scenegraph_id, frame_setting, selected_frame_setting)
	local frame_settings = frame_setting and UIFrameSettings[frame_setting] or UIFrameSettings.menu_frame_06
	local selected_frame_settings = selected_frame_setting and UIFrameSettings[selected_frame_setting] or UIFrameSettings.frame_outer_glow_01
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame_id",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon_id",
		},
		{
			pass_type = "text",
			style_id = "channel_name",
			text_id = "channel_name_id",
		},
		{
			pass_type = "text",
			style_id = "num_members",
			text_id = "num_members_id",
		},
		{
			pass_type = "rect",
			style_id = "background",
			content_check_function = function (content, style)
				style.color = content.hotspot.is_hover and style.hover_color or style.base_color

				return true
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "selected_frame",
			texture_id = "selected_frame_id",
			content_check_function = function (content)
				return content.channel_name == content.selected_channel
			end,
		},
	}
	local content = {
		channel_name_id = "",
		icon_id = "icons_placeholder",
		num_members_id = "0",
		frame_id = frame_settings.texture,
		selected_frame_id = selected_frame_settings.texture,
		hotspot = {},
	}
	local style = {
		background = {
			color = {
				0,
				0,
				0,
				0,
			},
			base_color = {
				255,
				0,
				0,
				0,
			},
			hover_color = {
				255,
				30,
				30,
				30,
			},
			offset = {
				0,
				0,
				-1,
			},
			size = {
				0,
				0,
			},
		},
		icon = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = {
				0,
				0,
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
				5,
			},
		},
		selected_frame = {
			texture_size = selected_frame_settings.texture_size,
			texture_sizes = selected_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-5,
				4,
			},
			frame_margins = {
				-13,
				-13,
			},
		},
		channel_name = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = true,
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("font_button_normal"),
			offset = {
				0,
				-10,
				0,
			},
		},
		num_members = {
			dynamic_font = true,
			font_size = 12,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			pixel_perfect = true,
			vertical_alignment = "bottom",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				0,
				0,
				0,
			},
		},
	}

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

local function create_channels_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local channels_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "input_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "channels_window_text_box",
		},
		{
			content_id = "widget_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "channels_window_root",
		},
		{
			content_id = "channels_list_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "channels_window_root",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			content_id = "close_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "channels_window_close",
		},
		{
			pass_type = "rotated_texture",
			style_id = "connecting_icon",
			texture_id = "connecting_icon",
			content_check_function = function (content, style)
				if not content.fetching_channels then
					return false
				end

				local dt = Managers.time:mean_dt()
				local connecting_rotation_speed = 400
				local connecting_rotation_angle = dt * connecting_rotation_speed % 360
				local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

				style.angle = style.angle + connecting_radians

				return true
			end,
		},
		{
			pass_type = "texture",
			scenegraph_id = "channels_window_text_box",
			style_id = "mask",
			texture_id = "mask_id",
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture_frame",
			style_id = "list_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "texture",
			style_id = "search_icon",
			texture_id = "search_icon_id",
			content_check_function = function (content, style)
				if content.text_field_active then
					return
				end

				if content.input_hotspot.is_hover then
					style.color[1] = 128
				else
					style.color[1] = 60
				end

				return true
			end,
		},
		{
			pass_type = "rect",
			style_id = "list_inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "info_text",
			text_id = "info_id",
		},
		{
			pass_type = "text",
			style_id = "search_text",
			text_id = "search_text_id",
		},
		{
			pass_type = "text",
			style_id = "channel_text",
			text_id = "channel_text_id",
		},
		{
			pass_type = "tiled_texture",
			style_id = "header_background",
			texture_id = "background_id",
		},
		{
			pass_type = "text",
			style_id = "header_text",
			text_id = "header_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "header_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "text",
			style_id = "chat_text",
			text_id = "chat_text_id",
			content_check_function = function (content, style)
				if not content.text_field_active then
					return
				end

				local on = math.floor(Managers.time:time("main") * 2) % 2

				style.caret_color[1] = on == 0 and 255 or 0

				return true
			end,
		},
		{
			pass_type = "text",
			style_id = "close_text",
			text_id = "close_text_id",
			content_check_function = function (content, style)
				if content.close_hotspot.is_hover then
					style.text_color[1] = 255
				else
					style.text_color[1] = 128
				end

				return true
			end,
		},
	}
	local content = {
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		channel_text_id = "Channels",
		chat_text_id = "",
		close_text_id = "X",
		connecting_icon = "matchmaking_connecting_icon",
		header_id = "CHANNELS",
		info_id = "",
		mask_id = "mask_rect",
		search_icon_id = "search_icon",
		search_text_id = "Search",
		text_index = 1,
		text_start_offset = 0,
		input_hotspot = {},
		screen_hotspot = {},
		widget_hotspot = {},
		channels_list_hotspot = {},
		close_hotspot = {},
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		background_id = background_texture,
	}
	local style = {
		connecting_icon = {
			angle = 0,
			horizontal_alignment = "center",
			scenegraph_id = "channels_window_list_box",
			vertical_alignment = "center",
			pivot = {
				25,
				25,
			},
			texture_size = {
				50,
				50,
			},
			offset = {
				0,
				0,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		background = {
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
		},
		mask = {
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "channels_window_text_box",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		inner_frame = {
			scenegraph_id = "channels_window_text_box",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
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
		},
		search_icon = {
			horizontal_alignment = "right",
			scenegraph_id = "channels_window_text_box",
			vertical_alignment = "center",
			texture_size = {
				24,
				24,
			},
			color = {
				60,
				255,
				255,
				255,
			},
			offset = {
				-10,
				0,
				1,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				100,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		info_text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark",
			horizontal_alignment = "right",
			pixel_perfect = true,
			scenegraph_id = "channels_window_text_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-320,
				0,
				2,
			},
		},
		search_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "channels_window_text_box",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("font_default"),
			offset = {
				5,
				25,
				10,
			},
		},
		chat_text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "channels_window_text_box",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				5,
				13,
				10,
			},
			caret_size = {
				2,
				18,
			},
			caret_offset = {
				-2,
				-2,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
		channel_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "channels_window_list_box",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("font_default"),
			offset = {
				5,
				25,
				10,
			},
		},
		header_text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "channels_window_list_header",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				10,
			},
		},
		header_frame = {
			scenegraph_id = "channels_window_list_header",
			texture_size = channels_frame_settings.texture_size,
			texture_sizes = channels_frame_settings.texture_sizes,
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
		header_background = {
			scenegraph_id = "channels_window_list_header",
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
		},
		close_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "channels_window_close",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 128),
			offset = {
				0,
				0,
				10,
			},
		},
		list_inner_rect = {
			scenegraph_id = "channels_window_list_box",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		list_frame = {
			scenegraph_id = "channels_window_list_box",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
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
		},
	}

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

local function create_create_channel_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local channels_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "input_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channel_input",
		},
		{
			content_id = "widget_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channels_window_root",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			content_id = "close_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channel_window_close",
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "channel_name_text",
			text_id = "channel_name_id",
		},
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "header_background",
		},
		{
			pass_type = "text",
			style_id = "header_text",
			text_id = "header_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "header_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "text",
			style_id = "chat_text",
			text_id = "chat_text_id",
			content_check_function = function (content, style)
				if not content.text_field_active then
					return
				end

				local on = math.floor(Managers.time:time("main") * 2) % 2

				style.caret_color[1] = on == 0 and 255 or 0

				return true
			end,
		},
		{
			pass_type = "text",
			style_id = "close_text",
			text_id = "close_text_id",
			content_check_function = function (content, style)
				if content.close_hotspot.is_hover then
					style.text_color[1] = 255
				else
					style.text_color[1] = 128
				end

				return true
			end,
		},
	}
	local content = {
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		channel_name_id = "Channel Name",
		chat_text_id = "",
		close_text_id = "X",
		header_id = "CREATE CHANNEL",
		text_index = 1,
		text_start_offset = 0,
		input_hotspot = {},
		screen_hotspot = {},
		widget_hotspot = {},
		channels_list_hotspot = {},
		close_hotspot = {},
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		background_id = background_texture,
	}
	local style = {
		background = {
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "create_channel_input",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		inner_frame = {
			scenegraph_id = "create_channel_input",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
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
		},
		search_icon = {
			horizontal_alignment = "right",
			scenegraph_id = "create_channel_input",
			vertical_alignment = "center",
			texture_size = {
				24,
				24,
			},
			color = {
				60,
				255,
				255,
				255,
			},
			offset = {
				-10,
				0,
				1,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				100,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		channel_name_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "create_channel_input",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("font_default"),
			offset = {
				5,
				25,
				10,
			},
		},
		chat_text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "create_channel_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				5,
				13,
				10,
			},
			caret_size = {
				2,
				18,
			},
			caret_offset = {
				-2,
				-2,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
		header_text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "create_channel_window_list_header",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				10,
			},
		},
		header_frame = {
			scenegraph_id = "create_channel_window_list_header",
			texture_size = channels_frame_settings.texture_size,
			texture_sizes = channels_frame_settings.texture_sizes,
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
		header_background = {
			scenegraph_id = "create_channel_window_list_header",
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		close_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "create_channel_window_close",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 128),
			offset = {
				0,
				0,
				10,
			},
		},
	}

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

local function create_send_invite_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local channels_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "input_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channel_input",
		},
		{
			content_id = "widget_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channels_window_root",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			content_id = "close_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "create_channel_window_close",
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "text",
			style_id = "channel_name_text",
			text_id = "channel_name_id",
		},
		{
			pass_type = "tiled_texture",
			style_id = "header_background",
			texture_id = "background_id",
		},
		{
			pass_type = "text",
			style_id = "header_text",
			text_id = "header_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "header_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "text",
			style_id = "chat_text",
			text_id = "chat_text_id",
			content_check_function = function (content, style)
				if not content.text_field_active then
					return
				end

				local on = math.floor(Managers.time:time("main") * 2) % 2

				style.caret_color[1] = on == 0 and 255 or 0

				return true
			end,
		},
		{
			pass_type = "text",
			style_id = "close_text",
			text_id = "close_text_id",
			content_check_function = function (content, style)
				if content.close_hotspot.is_hover then
					style.text_color[1] = 255
				else
					style.text_color[1] = 128
				end

				return true
			end,
		},
	}
	local content = {
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		channel_name_id = "Description",
		chat_text_id = "",
		close_text_id = "X",
		header_id = "POST INVITE LINK",
		text_index = 1,
		text_start_offset = 0,
		input_hotspot = {},
		screen_hotspot = {},
		widget_hotspot = {},
		channels_list_hotspot = {},
		close_hotspot = {},
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		background_id = background_texture,
	}
	local style = {
		background = {
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "create_channel_input",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		inner_frame = {
			scenegraph_id = "create_channel_input",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
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
		},
		search_icon = {
			horizontal_alignment = "right",
			scenegraph_id = "create_channel_input",
			vertical_alignment = "center",
			texture_size = {
				24,
				24,
			},
			color = {
				60,
				255,
				255,
				255,
			},
			offset = {
				-10,
				0,
				1,
			},
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				100,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		channel_name_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			pixel_perfect = true,
			scenegraph_id = "create_channel_input",
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_table("font_default"),
			offset = {
				5,
				25,
				10,
			},
		},
		chat_text = {
			dynamic_font = true,
			font_size = 16,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "create_channel_input",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				5,
				13,
				10,
			},
			caret_size = {
				2,
				18,
			},
			caret_offset = {
				-2,
				-2,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
		header_text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "create_channel_window_list_header",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				10,
			},
		},
		header_frame = {
			scenegraph_id = "create_channel_window_list_header",
			texture_size = channels_frame_settings.texture_size,
			texture_sizes = channels_frame_settings.texture_sizes,
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
		header_background = {
			scenegraph_id = "create_channel_window_list_header",
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
		},
		close_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "create_channel_window_close",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 128),
			offset = {
				0,
				0,
				10,
			},
		},
	}

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

local function create_recent_channels_window(scenegraph_id, size)
	local background_texture = "menu_frame_bg_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local inner_frame_settings = UIFrameSettings.menu_frame_06
	local channels_frame_settings = UIFrameSettings.menu_frame_06
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "list_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "recent_channels_window_list_box",
		},
		{
			content_id = "widget_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "recent_channels_window_root",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "root",
		},
		{
			content_id = "close_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "recent_channels_window_close",
		},
		{
			pass_type = "rotated_texture",
			style_id = "connecting_icon",
			texture_id = "connecting_icon",
			content_check_function = function (content, style)
				if not content.fetching_channels then
					return false
				end

				local dt = Managers.time:mean_dt()
				local connecting_rotation_speed = 400
				local connecting_rotation_angle = dt * connecting_rotation_speed % 360
				local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

				style.angle = style.angle + connecting_radians

				return true
			end,
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "rect",
			style_id = "inner_rect",
		},
		{
			pass_type = "texture",
			style_id = "background_tint",
			texture_id = "background_tint",
		},
		{
			pass_type = "tiled_texture",
			style_id = "header_background",
			texture_id = "background_id",
		},
		{
			pass_type = "text",
			style_id = "header_text",
			text_id = "header_id",
		},
		{
			pass_type = "texture_frame",
			style_id = "header_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "text",
			style_id = "close_text",
			text_id = "close_text_id",
			content_check_function = function (content, style)
				if content.close_hotspot.is_hover then
					style.text_color[1] = 255
				else
					style.text_color[1] = 128
				end

				return true
			end,
		},
	}
	local content = {
		background_tint = "gradient_dice_game_reward",
		caret_index = 1,
		channel_name_id = "Channel Name",
		chat_text_id = "",
		close_text_id = "X",
		connecting_icon = "matchmaking_connecting_icon",
		header_id = "RECENT CHANNELS",
		text_index = 1,
		text_start_offset = 0,
		list_hotspot = {},
		screen_hotspot = {},
		widget_hotspot = {},
		channels_list_hotspot = {},
		close_hotspot = {},
		frame = frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		background_id = background_texture,
	}
	local style = {
		connecting_icon = {
			angle = 0,
			horizontal_alignment = "center",
			scenegraph_id = "recent_channels_window_list_box",
			vertical_alignment = "center",
			pivot = {
				25,
				25,
			},
			texture_size = {
				50,
				50,
			},
			offset = {
				0,
				0,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		background = {
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
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
				5,
			},
		},
		inner_rect = {
			scenegraph_id = "recent_channels_window_list_box",
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		inner_frame = {
			scenegraph_id = "recent_channels_window_list_box",
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
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
		},
		background_tint = {
			scenegraph_id = "screen",
			offset = {
				0,
				0,
				100,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		header_text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "recent_channel_window_list_header",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				10,
			},
		},
		header_frame = {
			scenegraph_id = "recent_channel_window_list_header",
			texture_size = channels_frame_settings.texture_size,
			texture_sizes = channels_frame_settings.texture_sizes,
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
		header_background = {
			scenegraph_id = "recent_channel_window_list_header",
			color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				1,
			},
			texture_tiling_size = background_texture_settings.size,
		},
		close_text = {
			dynamic_font = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "recent_channels_window_close",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 128),
			offset = {
				0,
				0,
				10,
			},
		},
	}

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

function create_default_button(scenegraph_id, size, frame_name, background_texture, text, font_size, disable_dynamic_font_size)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]

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
			},
		},
		content = {
			background_fade = "button_bg_fade",
			draw_frame = true,
			glass = "button_glass_02",
			hover_glow = "button_state_default",
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
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				dynamic_font_size = not disable_dynamic_font_size,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					-2,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
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
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
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

local widget_definitions = {
	widgets = {
		frame_widget = create_window("popup_root", scenegraph_definition.popup_root.size),
		chat_output_widget = create_chat_output_widget("feed_area_edge", 0),
		name_list_widget = UIWidgets.create_rect_with_frame("list_area", scenegraph_definition.list_area.size, {
			160,
			0,
			0,
			0,
		}, user_list_frame_name),
		list_area_hotspot_widget = UIWidgets.create_simple_hotspot("list_area"),
		private_messages_widget = create_private_button("private_messages_button", scenegraph_definition.private_messages_button.size, nil, nil, "Private", 20),
		send_invite_widget = create_default_button("channels_button", scenegraph_definition.channels_button.size, nil, nil, "Invite", 20),
		channels_widget = create_default_button("popular_channels_button", scenegraph_definition.popular_channels_button.size, nil, nil, "Channels", 20),
		commands_widget = create_default_button("commands_button", scenegraph_definition.commands_button.size, nil, nil, "?", 20, true),
		emoji_widget = create_default_button("emoji_button", scenegraph_definition.emoji_button.size, nil, nil, ":)", 20, true),
	},
	create_channel_entry_func = create_channel_entry,
	channel_list_frame = channel_list_frame,
	create_channel_tab = create_channel_tab,
	create_private_user_entry_func = create_private_user_entry,
	private_user_list_frame = private_user_list_frame,
	create_recent_channel_entry_func = create_recent_channel_entry,
	recent_channels_list_frame = recent_channels_list_frame,
	create_popular_channels_entry_func = create_popular_channels_entry,
	popular_channels_list_frame = popular_channels_list_frame,
	create_command_entry_func = create_command_entry,
	commands_list_frame = commands_list_frame,
	create_emoji_func = create_emoji,
	create_emoji_frame_func = create_emoji_frame,
	create_emoji_scroller_func = create_emoji_scroller_func,
	channels_window = create_channels_window("channels_window_root", scenegraph_definition.channels_window_root.size),
	channel_entry = create_channel_list_entry("channels_window_list_box_entry"),
	join_channel_button = create_default_button("join_channel_button", scenegraph_definition.join_channel_button.size, nil, nil, "Join", 20),
	create_channel_button = create_default_button("create_channel_button", scenegraph_definition.create_channel_button.size, nil, nil, "Create", 20),
	recent_channels_button = create_default_button("recent_channels_button", scenegraph_definition.recent_channels_button.size, nil, nil, "Recent", 20),
	create_channel_window = create_create_channel_window("create_channels_window_root", scenegraph_definition.create_channels_window_root.size),
	inner_create_channel_button = create_default_button("inner_create_channel_button", scenegraph_definition.inner_create_channel_button.size, nil, nil, "Create", 20),
	recent_channels_window = create_recent_channels_window("recent_channels_window_root", scenegraph_definition.recent_channels_window_root.size),
	recent_join_channel_button = create_default_button("recent_join_channel_button", scenegraph_definition.join_channel_button.size, nil, nil, "Join", 20),
	create_channel_list_entry_func = create_channel_list_entry,
	send_invite_window = create_send_invite_window("create_channels_window_root", scenegraph_definition.create_channels_window_root.size),
	send_invite_button = create_default_button("send_invite_button", scenegraph_definition.send_invite_button.size, nil, nil, "Send Invite", 20),
	create_filtered_user_name_entry_func = create_filtered_user_name_entry,
	filtered_user_names_list_frame = filtered_user_names_list_frame,
}

return {
	num_users_in_list = num_users_in_list,
	create_entry_func = create_user_entry,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	emoji_list_settings = emoji_list_settings,
	channels_list_settings = channels_list_settings,
}
