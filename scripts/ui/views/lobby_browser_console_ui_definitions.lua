-- chunkname: @scripts/ui/views/lobby_browser_console_ui_definitions.lua

local spacing = 2
local num_visible_entries = 10
local entry_height = 58
local browser_width = 1200
local details_width = 520
local scroller_width = 15
local filter_height = 40
local bottom_border_size = 40
local element_settings = {
	width = browser_width - scroller_width - spacing,
	height = entry_height,
	spacing = spacing,
	num_visible_entries = num_visible_entries,
	window_height = num_visible_entries * entry_height + spacing * (num_visible_entries - 1),
	window_width = browser_width + details_width + spacing,
	filter_height = filter_height,
	bottom_border_size = bottom_border_size,
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
	dead_space_filler = {
		scale = "fit",
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
	lobby_browser_background = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			element_settings.window_width,
			90,
		},
		position = {
			100,
			-100,
			0,
		},
	},
	lobby_browser_divider = {
		horizontal_alignment = "center",
		parent = "lobby_browser_background",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-55,
			1,
		},
	},
	lobby_browser_frame = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			browser_width,
			40,
		},
		position = {
			100,
			-300,
			0,
		},
	},
	lobby_entry_anchor = {
		horizontal_alignment = "left",
		parent = "lobby_browser_frame",
		vertical_alignment = "bottom",
		size = {
			element_settings.width,
			element_settings.height,
		},
		position = {
			0,
			0,
			0,
		},
	},
	filter_base = {
		horizontal_alignment = "left",
		parent = "lobby_browser_frame",
		vertical_alignment = "top",
		size = {
			element_settings.window_width,
			200,
		},
		position = {
			0,
			80 + element_settings.spacing * 2,
			20,
		},
	},
	lobby_browser_window = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			browser_width + details_width + spacing,
			element_settings.window_height + filter_height * 3 + spacing * 3,
		},
		position = {
			0,
			-0,
			-20,
		},
	},
	details_base = {
		horizontal_alignment = "left",
		parent = "lobby_browser_frame",
		vertical_alignment = "top",
		size = {
			520,
			element_settings.window_height,
		},
		position = {
			browser_width + element_settings.spacing,
			-40 + spacing,
			1,
		},
	},
	details_level_frame = {
		horizontal_alignment = "center",
		parent = "details_base",
		vertical_alignment = "top",
		size = {
			200,
			200,
		},
		position = {
			0,
			-25,
			2,
		},
	},
	details_level_image = {
		horizontal_alignment = "center",
		parent = "details_level_frame",
		vertical_alignment = "center",
		size = {
			180,
			180,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	details_level_name = {
		horizontal_alignment = "center",
		parent = "details_level_image",
		vertical_alignment = "bottom",
		position = {
			0,
			-200,
			-1,
		},
		size = {
			520,
			170,
		},
	},
	details_hero_tabs = {
		horizontal_alignment = "center",
		parent = "details_level_image",
		vertical_alignment = "bottom",
		position = {
			88,
			-160,
			-1,
		},
	},
	details_locked_reason = {
		horizontal_alignment = "center",
		parent = "details_base",
		vertical_alignment = "bottom",
		position = {
			0,
			50,
			-1,
		},
		size = {
			520,
			170,
		},
	},
	details_level_info = {
		horizontal_alignment = "center",
		parent = "details_base",
		vertical_alignment = "bottom",
		position = {
			0,
			10,
			-1,
		},
	},
	details_game_type = {
		horizontal_alignment = "right",
		parent = "details_level_info",
		vertical_alignment = "bottom",
		size = {
			220,
			50,
		},
	},
	details_status = {
		horizontal_alignment = "right",
		parent = "details_level_info",
		vertical_alignment = "bottom",
		size = {
			220,
			50,
		},
	},
	weave_details_base = {
		horizontal_alignment = "left",
		parent = "lobby_browser_frame",
		vertical_alignment = "top",
		size = {
			520,
			element_settings.window_height,
		},
		position = {
			browser_width + element_settings.spacing,
			-40 + spacing,
			1,
		},
	},
	weave_details_level_frame = {
		horizontal_alignment = "right",
		parent = "weave_details_base",
		vertical_alignment = "top",
		size = {
			180,
			180,
		},
		position = {
			-5,
			-5,
			2,
		},
	},
	weave_details_level_image = {
		horizontal_alignment = "center",
		parent = "weave_details_level_frame",
		vertical_alignment = "center",
		size = {
			160,
			160,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	weave_details_level_name = {
		horizontal_alignment = "left",
		parent = "weave_details_base",
		vertical_alignment = "top",
		position = {
			15,
			-15,
			-1,
		},
		size = {
			520,
			170,
		},
	},
	deus_level_icon = {
		horizontal_alignment = "center",
		parent = "details_level_frame",
		vertical_alignment = "center",
		size = {
			180,
			180,
		},
		position = {
			0,
			-20,
			-1,
		},
	},
	weave_details_hero_tabs = {
		horizontal_alignment = "left",
		parent = "weave_details_level_name",
		vertical_alignment = "top",
		position = {
			150,
			10,
			-1,
		},
	},
	weave_details_locked_reason = {
		horizontal_alignment = "center",
		parent = "weave_details_base",
		vertical_alignment = "bottom",
		position = {
			0,
			50,
			-1,
		},
		size = {
			520,
			170,
		},
	},
	weave_details_level_info = {
		horizontal_alignment = "center",
		parent = "weave_details_base",
		vertical_alignment = "bottom",
		position = {
			0,
			10,
			-1,
		},
	},
	weave_game_type = {
		horizontal_alignment = "right",
		parent = "weave_details_level_info",
		vertical_alignment = "bottom",
		size = {
			220,
			50,
		},
	},
	weave_status = {
		horizontal_alignment = "right",
		parent = "weave_details_level_info",
		vertical_alignment = "bottom",
		size = {
			220,
			50,
		},
	},
	wind_icon_bg = {
		horizontal_alignment = "center",
		parent = "weave_details_level_frame",
		vertical_alignment = "bottom",
		size = {
			62.05,
			62.05,
		},
		position = {
			0,
			-20,
			2,
		},
	},
	wind_icon_slot = {
		horizontal_alignment = "center",
		parent = "wind_icon_bg",
		vertical_alignment = "center",
		size = {
			54.4,
			54.4,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wind_icon_glow = {
		horizontal_alignment = "center",
		parent = "wind_icon_slot",
		vertical_alignment = "center",
		size = {
			43.35,
			45.05,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wind_icon = {
		horizontal_alignment = "center",
		parent = "wind_icon_slot",
		vertical_alignment = "center",
		size = {
			54.4,
			54.4,
		},
		position = {
			0,
			0,
			2,
		},
	},
	wind_name = {
		horizontal_alignment = "left",
		parent = "weave_details_level_name",
		vertical_alignment = "top",
		size = {
			520,
			32,
		},
		position = {
			0,
			-40,
			0,
		},
	},
	wind_mutator_window = {
		horizontal_alignment = "center",
		parent = "details_level_frame",
		vertical_alignment = "top",
		size = {
			520,
			0,
		},
		position = {
			0,
			-150,
			1,
		},
	},
	wind_mutator_icon = {
		horizontal_alignment = "left",
		parent = "wind_mutator_window",
		vertical_alignment = "top",
		size = {
			28,
			36,
		},
		position = {
			25,
			-75,
			5,
		},
	},
	wind_mutator_icon_frame = {
		horizontal_alignment = "center",
		parent = "wind_mutator_icon",
		vertical_alignment = "center",
		size = {
			60,
			60,
		},
		position = {
			0,
			0,
			1,
		},
	},
	wind_mutator_title_text = {
		horizontal_alignment = "left",
		parent = "wind_mutator_window",
		vertical_alignment = "top",
		size = {
			312,
			50,
		},
		position = {
			10,
			-5,
			1,
		},
	},
	wind_mutator_title_divider = {
		horizontal_alignment = "left",
		parent = "wind_mutator_title_text",
		vertical_alignment = "bottom",
		size = {
			450,
			4,
		},
		position = {
			0,
			10,
			1,
		},
	},
	wind_mutator_description_text = {
		horizontal_alignment = "left",
		parent = "wind_mutator_icon",
		vertical_alignment = "top",
		size = {
			430,
			100,
		},
		position = {
			60,
			15,
			1,
		},
	},
	objective_title = {
		horizontal_alignment = "left",
		parent = "wind_mutator_icon",
		vertical_alignment = "bottom",
		size = {
			520,
			40,
		},
		position = {
			-20,
			-90,
			3,
		},
	},
	objective_title_bg = {
		horizontal_alignment = "center",
		parent = "objective_title",
		vertical_alignment = "center",
		size = {
			467,
			59,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	objective_1 = {
		horizontal_alignment = "center",
		parent = "objective_title",
		vertical_alignment = "bottom",
		size = {
			520,
			30,
		},
		position = {
			0,
			-35,
			3,
		},
	},
	objective_2 = {
		horizontal_alignment = "center",
		parent = "objective_1",
		vertical_alignment = "bottom",
		size = {
			520,
			30,
		},
		position = {
			0,
			-35,
			0,
		},
	},
	twitch_logo = {
		horizontal_alignment = "center",
		parent = "objective_2",
		vertical_alignment = "center",
		size = {
			130,
			29,
		},
		position = {
			0,
			15,
			1,
		},
	},
	filter_game_type_entry_anchor = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			0,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	filter_level_entry_anchor = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			element_settings.window_width / 5 * 1,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	filter_level_scroller = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			element_settings.window_width / 5 * 1,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	filter_difficulty_entry_anchor = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			element_settings.window_width / 5 * 2 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	filter_lobby_entry_anchor = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			element_settings.window_width / 5 * 3 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	filter_distance_entry_anchor = {
		horizontal_alignment = "left",
		parent = "filter_base",
		vertical_alignment = "top",
		size = {
			element_settings.window_width / 5,
			element_settings.filter_height,
		},
		position = {
			element_settings.window_width / 5 * 4 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1,
		},
	},
	join_button = {
		horizontal_alignment = "right",
		parent = "lobby_browser_window",
		vertical_alignment = "bottom",
		size = {
			200,
			65,
		},
		position = {
			0,
			-120,
			1,
		},
	},
	refresh_button = {
		horizontal_alignment = "center",
		parent = "join_button",
		vertical_alignment = "center",
		size = {
			200,
			65,
		},
		position = {
			-225,
			0,
			1,
		},
	},
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = IS_WINDOWS and 0.05 or 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)

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
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local flag_test = {
	"ad",
	"ae",
	"af",
	"ag",
	"al",
	"am",
	"ao",
	"ar",
	"at",
	"au",
	"az",
	"ba",
	"bb",
	"bd",
	"be",
	"bf",
	"bg",
	"bh",
	"bi",
	"bj",
	"bn",
	"bo",
	"br",
	"bs",
	"bt",
	"bw",
	"by",
	"bz",
	"ca",
	"cd",
	"cf",
	"cg",
	"ch",
	"ci",
	"cl",
	"cm",
	"cn",
	"co",
	"cr",
	"cu",
	"cv",
	"cy",
	"cz",
	"de",
	"dj",
	"dk",
	"dm",
	"do",
	"dz",
	"ec",
	"ee",
	"eg",
	"eh",
	"er",
	"es",
	"et",
	"fi",
	"fj",
	"fm",
	"fr",
	"ga",
	"gb",
	"gd",
	"ge",
	"gh",
	"gm",
	"gn",
	"gq",
	"gr",
	"gt",
	"gw",
	"gy",
	"hn",
	"hr",
	"ht",
	"hu",
	"id",
	"ie",
	"il",
	"in",
	"iq",
	"ir",
	"is",
	"it",
	"jm",
	"jo",
	"jp",
	"ke",
	"kg",
	"kh",
	"ki",
	"km",
	"kn",
	"kp",
	"kr",
	"ks",
	"kw",
	"kz",
	"la",
	"lb",
	"lc",
	"li",
	"lk",
	"lr",
	"ls",
	"lt",
	"lu",
	"lv",
	"ly",
	"ma",
	"mc",
	"md",
	"me",
	"mg",
	"mh",
	"mk",
	"ml",
	"mm",
	"mn",
	"mr",
	"mt",
	"mu",
	"mv",
	"mw",
	"mx",
	"my",
	"mz",
	"na",
	"ne",
	"ng",
	"ni",
	"nl",
	"no",
	"np",
	"nr",
	"nz",
	"om",
	"pa",
	"pe",
	"pg",
	"ph",
	"pk",
	"pl",
	"pt",
	"pw",
	"py",
	"qa",
	"ro",
	"rs",
	"ru",
	"rw",
	"sa",
	"sb",
	"sc",
	"sd",
	"se",
	"sg",
	"si",
	"sk",
	"sl",
	"sm",
	"sn",
	"so",
	"sr",
	"st",
	"sv",
	"sy",
	"sz",
	"td",
	"tg",
	"th",
	"tj",
	"tl",
	"tm",
	"tn",
	"to",
	"tr",
	"tt",
	"tv",
	"tw",
	"tz",
	"ua",
	"ug",
	"us",
	"uy",
	"uz",
	"va",
	"vc",
	"ve",
	"vn",
	"vu",
	"ws",
	"ye",
	"za",
	"zm",
	"zw",
}

local function create_lobby_browser_frame(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "info_bar",
				},
				{
					pass_type = "rect",
					style_id = "dimmer",
					content_check_function = function (content, style)
						return content.filter_active
					end,
				},
				{
					pass_type = "rect",
					style_id = "top_bar",
				},
				{
					pass_type = "rect",
					style_id = "left_bar",
				},
				{
					pass_type = "rect",
					style_id = "right_bar",
				},
				{
					pass_type = "rect",
					style_id = "bottom",
				},
				{
					pass_type = "rect",
					style_id = "scroll_bar",
				},
				{
					pass_type = "rect",
					style_id = "details_background",
				},
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask_id",
				},
				{
					pass_type = "texture",
					style_id = "filter_mask",
					texture_id = "mask_id",
					content_check_function = function (content, style)
						return content.filter_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "host_mask",
					texture_id = "mask_id",
				},
				{
					pass_type = "texture",
					style_id = "country_mask",
					texture_id = "mask_id",
				},
				{
					pass_type = "texture",
					style_id = "difficulty_mask",
					texture_id = "mask_id",
				},
				{
					pass_type = "text",
					style_id = "host_label",
					text_id = "host_label",
				},
				{
					pass_type = "text",
					style_id = "country_label",
					text_id = "country_label",
				},
				{
					pass_type = "text",
					style_id = "difficulty_label",
					text_id = "difficulty_label",
				},
				{
					pass_type = "text",
					style_id = "players_label",
					text_id = "players_label",
				},
				{
					pass_type = "text",
					style_id = "info_text",
					text_id = "info_text_id",
				},
				{
					pass_type = "text",
					style_id = "timer_text",
					text_id = "timer_text_id",
					content_change_function = function (content, style, _, dt)
						content.timer = (content.timer or 0) + dt

						local seconds = math.max(content.timer, 0)
						local minutes = math.floor(seconds / 60)
						local hours = math.floor(minutes / 60)

						content.timer_text_id = string.format("%02d:%02d:%02d", hours, minutes - hours * 60, seconds % 60)
					end,
				},
				{
					pass_type = "text",
					style_id = "time_since_refresh",
					text_id = "time_since_refresh_id",
				},
				{
					pass_type = "text",
					style_id = "details_label",
					text_id = "details_label",
				},
				{
					pass_type = "rect",
					style_id = "scroller",
					content_check_function = function (content, style)
						return content.show_scroller and not content.filter_active
					end,
					content_change_function = function (content, style)
						local window_height = element_settings.window_height
						local offset_y = -element_settings.spacing - content.scrollbar_progress * (window_height + style.texture_size[2])

						style.offset[2] = offset_y
						style.offset[1] = Math.is_valid(style.offset[1]) and style.offset[1] or 0
						style.offset[2] = Math.is_valid(style.offset[2]) and style.offset[2] or 0
						style.offset[3] = Math.is_valid(style.offset[3]) and style.offset[3] or 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "inner_scroller",
					content_check_function = function (content, style)
						return content.show_scroller and not content.filter_active
					end,
					content_change_function = function (content, style)
						local window_height = element_settings.window_height
						local offset_y = -element_settings.spacing - content.scrollbar_progress * (window_height + style.texture_size[2])

						style.offset[2] = offset_y
						style.offset[1] = Math.is_valid(style.offset[1]) and style.offset[1] or 0
						style.offset[2] = Math.is_valid(style.offset[2]) and style.offset[2] or 0
						style.offset[3] = Math.is_valid(style.offset[3]) and style.offset[3] or 0
					end,
				},
			},
		},
		content = {
			country_label = "lb_country",
			details_label = "lb_details",
			difficulty_label = "lb_difficulty",
			filter_active = false,
			host_label = "lb_host",
			info_text_id = " ",
			mask_id = "mask_rect",
			players_label = "lb_players",
			scrollbar_progress = 0,
			show_scroller = true,
			timer_text_id = "0:00:00",
			wanted_scroller_offset = 0,
			time_since_refresh_id = Localize("time_since_last_refresh") .. ":",
		},
		style = {
			info_bar = {
				color = {
					224,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.window_width + element_settings.spacing * 2,
					filter_height,
				},
				offset = {
					-element_settings.spacing,
					0,
					0,
				},
			},
			dimmer = {
				color = {
					196,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.window_width,
					-element_settings.window_height - filter_height,
				},
				offset = {
					0,
					filter_height,
					20,
				},
			},
			top_bar = {
				color = {
					224,
					0,
					0,
					0,
				},
				size = {
					element_settings.window_width + element_settings.spacing * 7,
					element_settings.spacing * 2,
				},
				offset = {
					-element_settings.spacing * 3.5,
					126,
					0,
				},
			},
			bottom = {
				color = {
					224,
					0,
					0,
					0,
				},
				size = {
					element_settings.window_width + element_settings.spacing * 2,
					-bottom_border_size,
				},
				offset = {
					-element_settings.spacing,
					-element_settings.window_height - element_settings.spacing * 1.5,
					0,
				},
			},
			right_bar = {
				color = {
					224,
					0,
					0,
					0,
				},
				size = {
					5,
					-element_settings.window_height - 127 - bottom_border_size - element_settings.spacing * 2,
				},
				offset = {
					element_settings.window_width + element_settings.spacing,
					124 + element_settings.spacing * 2,
					0,
				},
			},
			left_bar = {
				color = {
					224,
					0,
					0,
					0,
				},
				size = {
					5,
					-element_settings.window_height - 127 - bottom_border_size - element_settings.spacing * 2,
				},
				offset = {
					-element_settings.spacing - 5,
					124 + element_settings.spacing * 2,
					0,
				},
			},
			details_bar = {
				texture_size = {
					details_width,
					40,
				},
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					1200 + element_settings.spacing,
					0,
					0,
				},
			},
			scroll_bar = {
				texture_size = {
					scroller_width,
					-element_settings.window_height,
				},
				color = {
					224,
					0,
					0,
					0,
				},
				offset = {
					browser_width - scroller_width,
					-element_settings.spacing,
					0,
				},
			},
			scroller = {
				texture_size = {
					scroller_width,
					-100,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					browser_width - scroller_width,
					-element_settings.spacing,
					0,
				},
			},
			inner_scroller = {
				texture_size = {
					scroller_width - 4,
					-100,
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					browser_width - scroller_width + 2,
					-element_settings.spacing,
					0,
				},
			},
			details_background = {
				texture_size = {
					details_width,
					-element_settings.window_height,
				},
				color = {
					168,
					0,
					0,
					0,
				},
				offset = {
					1200 + element_settings.spacing,
					-element_settings.spacing,
					0,
				},
			},
			mask = {
				texture_size = {
					browser_width - scroller_width - element_settings.spacing,
					-element_settings.window_height,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-element_settings.spacing,
					0,
				},
			},
			filter_mask = {
				texture_size = {
					element_settings.window_width,
					-element_settings.window_height - element_settings.filter_height,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-element_settings.spacing + element_settings.filter_height + element_settings.spacing,
					5,
				},
			},
			host_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height,
				},
				color = {
					1,
					0,
					0,
					0,
				},
				offset = {
					620,
					-element_settings.spacing,
					0,
				},
			},
			country_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height,
				},
				color = {
					1,
					0,
					0,
					0,
				},
				offset = {
					775,
					-element_settings.spacing,
					0,
				},
			},
			difficulty_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height,
				},
				color = {
					1,
					0,
					0,
					0,
				},
				offset = {
					1030,
					-element_settings.spacing,
					0,
				},
			},
			host_label = {
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					20,
					-2,
					1,
				},
			},
			country_label = {
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					100,
					-2,
					1,
				},
			},
			difficulty_label = {
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					305,
					-2,
					1,
				},
			},
			players_label = {
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					510,
					-2,
					1,
				},
			},
			details_label = {
				font_size = 20,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					1220,
					-2,
					1,
				},
			},
			info_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					13,
					-element_settings.window_height - bottom_border_size - 2,
					5,
				},
			},
			timer_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					browser_width - 105,
					-element_settings.window_height - bottom_border_size - 2,
					5,
				},
			},
			time_since_refresh = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-110,
					-element_settings.window_height - bottom_border_size - 2,
					5,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_filter_frame(scenegraph_id)
	local label_distance = element_settings.window_width / 5

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "info_bar",
				},
				{
					pass_type = "triangle",
					style_id = "game_type_left_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_1.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 1 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 1 or content.filter_hotspot_1.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "game_type_right_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_1.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 1 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 1 or content.filter_hotspot_1.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "level_left_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_2.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 2 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 2 or content.filter_hotspot_2.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "level_right_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_2.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 2 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 2 or content.filter_hotspot_2.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "difficulty_left_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_3.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 3 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 3 or content.filter_hotspot_3.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "difficulty_right_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_3.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 3 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 3 or content.filter_hotspot_3.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "lobby_filter_left_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_4.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 4 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 4 or content.filter_hotspot_4.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "lobby_filter_right_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_4.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 4 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 4 or content.filter_hotspot_4.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "distance_left_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_5.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 5 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 5 or content.filter_hotspot_5.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "triangle",
					style_id = "distance_right_triangle",
					content_check_function = function (content, style)
						if content.filter_hotspot_5.disable_button then
							return false
						else
							local gamepad_active = Managers.input:is_device_active("gamepad")

							return content.filter_selection and content.filter_index == 5 or not gamepad_active
						end
					end,
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 5 or content.filter_hotspot_5.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					content_id = "filter_hotspot_1",
					pass_type = "hotspot",
					style_id = "background_1",
				},
				{
					pass_type = "rect",
					style_id = "background_1",
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 1 or content.filter_hotspot_1.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					content_id = "filter_hotspot_2",
					pass_type = "hotspot",
					style_id = "background_2",
				},
				{
					pass_type = "rect",
					style_id = "background_2",
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 2 or content.filter_hotspot_2.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					content_id = "filter_hotspot_3",
					pass_type = "hotspot",
					style_id = "background_3",
				},
				{
					pass_type = "rect",
					style_id = "background_3",
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 3 or content.filter_hotspot_3.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					content_id = "filter_hotspot_4",
					pass_type = "hotspot",
					style_id = "background_4",
				},
				{
					pass_type = "rect",
					style_id = "background_4",
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 4 or content.filter_hotspot_4.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					content_id = "filter_hotspot_5",
					pass_type = "hotspot",
					style_id = "background_5",
				},
				{
					pass_type = "rect",
					style_id = "background_5",
					content_change_function = function (content, style)
						if content.filter_selection and content.filter_index == 5 or content.filter_hotspot_5.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "game_type_label",
					text_id = "game_type_id",
				},
				{
					pass_type = "text",
					style_id = "mission_label",
					text_id = "mission_id",
				},
				{
					pass_type = "text",
					style_id = "difficulty_label",
					text_id = "difficulty_id",
				},
				{
					pass_type = "text",
					style_id = "show_lobbies_label",
					text_id = "show_lobbies_id",
				},
				{
					pass_type = "text",
					style_id = "distance_label",
					text_id = "distance_id",
				},
				{
					pass_type = "text",
					style_id = "game_type_name",
					text_id = "game_type_name",
					content_change_function = function (content, style)
						if content.filter_hotspot_1.disable_button then
							style.text_color = style.disabled_color
						elseif content.filter_selection and content.filter_index == 1 or content.filter_hotspot_1.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "mission_name",
					text_id = "mission_name",
					content_change_function = function (content, style)
						if content.filter_hotspot_2.disable_button then
							style.text_color = style.disabled_color
						elseif content.filter_selection and content.filter_index == 2 or content.filter_hotspot_2.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty_name",
					text_id = "difficulty_name",
					content_change_function = function (content, style)
						if content.filter_hotspot_3.disable_button then
							style.text_color = style.disabled_color
						elseif content.filter_selection and content.filter_index == 3 or content.filter_hotspot_3.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "show_lobbies_name",
					text_id = "show_lobbies_name",
					content_change_function = function (content, style)
						if content.filter_hotspot_4.disable_button then
							style.text_color = style.disabled_color
						elseif content.filter_selection and content.filter_index == 4 or content.filter_hotspot_4.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "distance_name",
					text_id = "distance_name",
					content_change_function = function (content, style)
						if content.filter_hotspot_5.disable_button then
							style.text_color = style.disabled_color
						elseif content.filter_selection and content.filter_index == 5 or content.filter_hotspot_5.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
			},
		},
		content = {
			background_id = "rect_masked",
			difficulty_name = "-",
			distance_name = "-",
			game_type_name = "-",
			mask_id = "mask_rect",
			mission_name = "-",
			show_lobbies_name = "-",
			filter_hotspot_1 = {},
			filter_hotspot_2 = {},
			filter_hotspot_3 = {},
			filter_hotspot_4 = {},
			filter_hotspot_5 = {},
			game_type_id = string.upper(Localize("lb_game_type")),
			mission_id = string.upper(Localize("lb_mission")),
			difficulty_id = string.upper(Localize("lb_difficulty")),
			show_lobbies_id = string.upper(Localize("lb_show_lobbies")),
			distance_id = string.upper(Localize("lb_search_distance")),
		},
		style = {
			info_bar = {
				vertical_alignment = "top",
				color = {
					224,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.window_width,
					40,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			game_type_left_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 1,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			game_type_right_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 1 - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			level_left_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 2,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			level_right_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 2 - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			difficulty_left_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 3,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			difficulty_right_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 3 - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			lobby_filter_left_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 4,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			lobby_filter_right_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 4 - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			distance_left_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			distance_right_triangle = {
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				vertical_alignment = "top",
				texture_size = {
					7.5,
					10,
				},
				select_color = {
					196,
					0,
					0,
					0,
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 5 - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1,
				},
			},
			mask = {
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					element_settings.window_width,
					40,
				},
				offset = {
					0,
					-40 - element_settings.spacing,
					0,
				},
			},
			divider_1 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.spacing,
					40,
				},
				offset = {
					element_settings.window_width / 4,
					-40 - element_settings.spacing,
					0,
				},
			},
			divider_2 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.spacing,
					40,
				},
				offset = {
					element_settings.window_width / 4 * 2,
					-40 - element_settings.spacing,
					0,
				},
			},
			divider_3 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0,
				},
				texture_size = {
					element_settings.spacing,
					40,
				},
				offset = {
					element_settings.window_width / 4 * 3,
					-40 - element_settings.spacing,
					0,
				},
			},
			background_1 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0,
				},
				base_color = {
					196,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					label_distance,
					40,
				},
				size = {
					label_distance,
					40,
				},
				offset = {
					0,
					filter_height * 3 - element_settings.spacing,
					0,
				},
			},
			background_2 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0,
				},
				base_color = {
					196,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40,
				},
				size = {
					label_distance,
					40,
				},
				offset = {
					label_distance * 1 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0,
				},
			},
			background_3 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0,
				},
				base_color = {
					196,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40,
				},
				size = {
					label_distance,
					40,
				},
				offset = {
					label_distance * 2 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0,
				},
			},
			background_4 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0,
				},
				base_color = {
					196,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40,
				},
				size = {
					label_distance,
					40,
				},
				offset = {
					label_distance * 3 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0,
				},
			},
			background_5 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0,
				},
				base_color = {
					196,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40,
				},
				size = {
					label_distance,
					40,
				},
				offset = {
					label_distance * 4 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0,
				},
			},
			game_type_label = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 0,
					158,
					1,
				},
			},
			game_type_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				disabled_color = {
					255,
					60,
					60,
					60,
				},
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 0,
					118,
					1,
				},
			},
			mission_label = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 1,
					158,
					1,
				},
			},
			mission_name = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				area_size = {
					label_distance - 60,
					100,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				disabled_color = {
					255,
					60,
					60,
					60,
				},
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 1,
					118,
					1,
				},
			},
			difficulty_label = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 2,
					158,
					1,
				},
			},
			difficulty_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				disabled_color = {
					255,
					60,
					60,
					60,
				},
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 2,
					118,
					1,
				},
			},
			show_lobbies_label = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 3,
					158,
					1,
				},
			},
			show_lobbies_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				disabled_color = {
					255,
					60,
					60,
					60,
				},
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 3,
					118,
					1,
				},
			},
			distance_label = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 4,
					158,
					1,
				},
			},
			distance_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				disabled_color = {
					255,
					60,
					60,
					60,
				},
				size = {
					element_settings.window_width,
					40,
				},
				offset = {
					15 + label_distance * 4,
					118,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_level_filter_scroller_func(num_elements)
	local max_length = element_settings.window_height + element_settings.filter_height + element_settings.spacing
	local max_entries = math.ceil(max_length / (element_settings.filter_height + element_settings.spacing) - 1)
	local visible = max_entries < num_elements
	local size_y = visible and math.max(max_length / (num_elements / max_entries), 30) or 0
	local border_length = math.clamp(num_elements * (element_settings.filter_height + element_settings.spacing), 0, max_length)

	return {
		scenegraph_id = "filter_level_scroller",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "border",
				},
				{
					content_id = "scroller_hotspot",
					pass_type = "hotspot",
					style_id = "scroller_hotspot",
					content_check_function = function (content, style)
						return content.parent.show_scroller and content.parent.active
					end,
					content_change_function = function (content, style)
						local scrollbar_length = element_settings.window_height - element_settings.spacing * 2
						local start_pos = -element_settings.filter_height - element_settings.spacing
						local offset_y = start_pos - content.parent.scrollbar_progress * scrollbar_length
						local offset_y = start_pos - element_settings.spacing - content.parent.scrollbar_progress * (scrollbar_length - style.area_size[2] - start_pos)

						style.offset[2] = offset_y
						style.offset[1] = Math.is_valid(style.offset[1]) and style.offset[1] or 0
						style.offset[2] = Math.is_valid(style.offset[2]) and style.offset[2] or 0
						style.offset[3] = Math.is_valid(style.offset[3]) and style.offset[3] or 0
					end,
				},
				{
					content_id = "bar_hotspot",
					pass_type = "hotspot",
					style_id = "bar_hotspot",
				},
				{
					pass_type = "rect",
					style_id = "inner_scroller",
					content_check_function = function (content, style)
						return content.show_scroller and content.active
					end,
					content_change_function = function (content, style)
						local scrollbar_length = element_settings.window_height - element_settings.spacing * 2
						local start_pos = -element_settings.filter_height - element_settings.spacing
						local offset_y = start_pos - content.scrollbar_progress * scrollbar_length
						local offset_y = start_pos - element_settings.spacing - content.scrollbar_progress * (scrollbar_length - style.texture_size[2] - start_pos)

						style.offset[2] = offset_y
						style.offset[1] = Math.is_valid(style.offset[1]) and style.offset[1] or 0
						style.offset[2] = Math.is_valid(style.offset[2]) and style.offset[2] or 0
						style.offset[3] = Math.is_valid(style.offset[3]) and style.offset[3] or 0
						style.color = content.scroller_hotspot.is_hover and style.highlight_color or style.default_color
					end,
				},
			},
		},
		content = {
			active = true,
			scrollbar_progress = 0,
			show_scroller = true,
			visible = true,
			bar_hotspot = {},
			scroller_hotspot = {},
		},
		style = {
			background = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				color = {
					224,
					0,
					0,
					0,
				},
				texture_size = {
					scroller_width - element_settings.spacing,
					border_length - element_settings.spacing,
				},
				offset = {
					0,
					-element_settings.spacing - element_settings.filter_height,
					0,
				},
			},
			bar_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					scroller_width - element_settings.spacing,
					element_settings.window_height + element_settings.filter_height,
				},
				offset = {
					element_settings.spacing,
					-element_settings.spacing - element_settings.filter_height,
					-1,
				},
			},
			border = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					scroller_width + element_settings.spacing * 1,
					border_length,
				},
				offset = {
					element_settings.spacing,
					-element_settings.spacing - element_settings.filter_height,
					-1,
				},
			},
			scroller_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					scroller_width - 4,
					size_y,
				},
				offset = {
					-1,
					-element_settings.spacing - element_settings.filter_height,
					2,
				},
			},
			inner_scroller = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					scroller_width - 4,
					size_y,
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				highlight_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-1,
					-element_settings.spacing - element_settings.filter_height,
					2,
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

local function create_game_type_filter_entry_func(game_type, game_type_string, offset_y)
	local label_distance = element_settings.window_width / 5
	local game_type_name = Localize(game_type_string)

	print(game_type, game_type_string, game_type_name)

	return {
		scenegraph_id = "filter_game_type_entry_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "texture_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "background_border",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "game_type",
					text_id = "game_type_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
			},
		},
		content = {
			texture_id = "rect_masked",
			button_hotspot = {},
			game_type_id = game_type_name,
			game_type = game_type,
		},
		style = {
			button_hotspot = {
				area_size = {
					element_settings.window_width / 5,
					element_settings.filter_height,
				},
			},
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				base_color = {
					255,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height,
				},
				offset = {
					element_settings.spacing,
					0,
					1,
				},
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2,
				},
				offset = {
					0,
					element_settings.spacing,
					0,
				},
			},
			game_type = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				area_size = {
					400,
					100,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_level_filter_entry_func(level, unlocked)
	local label_distance = element_settings.window_width / 5
	local level_name = level

	if level ~= "any" then
		local level_settings = LevelSettings[level]

		level_name = Localize(level_settings.display_name)
	else
		level_name = Localize("lobby_browser_mission")
	end

	return {
		scenegraph_id = "filter_level_entry_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "texture_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "background_border",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "level_name",
					text_id = "level_name_id",
					content_check_function = function (content, style)
						return content.unlocked
					end,
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "level_name_locked",
					text_id = "level_name_id",
					content_check_function = function (content, style)
						return not content.unlocked
					end,
				},
			},
		},
		content = {
			texture_id = "rect_masked",
			button_hotspot = {},
			level_name_id = level_name,
			level = level,
			unlocked = unlocked,
		},
		style = {
			button_hotspot = {
				area_size = {
					element_settings.window_width / 5 - 15,
					element_settings.filter_height,
				},
			},
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				base_color = {
					255,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing - scroller_width,
					element_settings.filter_height,
				},
				offset = {
					element_settings.spacing,
					0,
					1,
				},
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing - scroller_width + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2,
				},
				offset = {
					0,
					element_settings.spacing,
					0,
				},
			},
			level_name = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				area_size = {
					label_distance - element_settings.spacing - scroller_width - 20,
					100,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2,
				},
			},
			level_name_locked = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				area_size = {
					label_distance - element_settings.spacing - scroller_width - 20,
					100,
				},
				text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
				offset = {
					0,
					0,
					2,
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

local function create_difficulty_filter_entry_func(difficulty, offset_y)
	local label_distance = element_settings.window_width / 5
	local difficulty_name
	local unlocked = true

	if difficulty ~= "any" then
		local human_players = Managers.player:human_players()
		local players_below_difficulty = DifficultyManager.players_below_required_power_level(difficulty, human_players)
		local difficulty_settings = DifficultySettings[difficulty]

		difficulty_name = Localize(difficulty_settings.display_name)
		unlocked = #players_below_difficulty == 0
	else
		difficulty_name = Localize("lobby_browser_mission")
	end

	return {
		scenegraph_id = "filter_difficulty_entry_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rect",
					style_id = "background",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "rect",
					style_id = "background_border",
				},
				{
					pass_type = "text",
					style_id = "difficulty_name",
					text_id = "difficulty_name_id",
					content_check_function = function (content, style)
						return content.unlocked
					end,
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty_name_locked",
					text_id = "difficulty_name_id",
					content_check_function = function (content, style)
						return not content.unlocked
					end,
				},
			},
		},
		content = {
			button_hotspot = {},
			difficulty_name_id = difficulty_name,
			difficulty = difficulty,
			unlocked = unlocked,
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				base_color = {
					255,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2,
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0,
				},
			},
			difficulty_name = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2,
				},
			},
			difficulty_name_locked = {
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
				offset = {
					0,
					0,
					2,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_lobby_filter_entry_func(lobby_filter, offset_y)
	local label_distance = element_settings.window_width / 5

	return {
		scenegraph_id = "filter_lobby_entry_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rect",
					style_id = "background",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "rect",
					style_id = "background_border",
				},
				{
					pass_type = "text",
					style_id = "lobby_filter_name",
					text_id = "lobby_filter_name_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
			},
		},
		content = {
			button_hotspot = {},
			lobby_filter_name_id = Localize(lobby_filter),
			lobby_filter = lobby_filter,
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				base_color = {
					255,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height,
				},
				size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2,
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0,
				},
			},
			lobby_filter_name = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_distance_filter_entry_func(distance, offset_y)
	local label_distance = element_settings.window_width / 5

	return {
		scenegraph_id = "filter_distance_entry_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "rect",
					style_id = "background",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "rect",
					style_id = "background_border",
				},
				{
					pass_type = "text",
					style_id = "distance_name",
					text_id = "distance_name_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end,
				},
			},
		},
		content = {
			button_hotspot = {},
			distance_name_id = Localize(distance),
			distance = distance,
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				base_color = {
					255,
					0,
					0,
					0,
				},
				selection_color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96,
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2,
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0,
				},
			},
			distance_name = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_lobby_entry_func(offset_y, lobby_data, flag_index, joinable, completed_difficulty_index)
	local host_name = IS_WINDOWS and (lobby_data.unique_server_name or lobby_data.host) or lobby_data.name or "UNKNOWN"
	local num_players = lobby_data.num_players or 0
	local country_code = lobby_data.country_code
	local matchmaking_type_id = lobby_data.matchmaking_type
	local matchmaking_type = IS_PS4 and matchmaking_type_id or NetworkLookup.matchmaking_types[tonumber(matchmaking_type_id)]
	local mechanism = lobby_data.mechanism
	local difficulty = lobby_data.difficulty or "UNKNOWN"
	local difficulty_settings = DifficultySettings[difficulty]

	if difficulty_settings then
		local display_name = difficulty_settings.display_name

		difficulty = Localize(display_name)
	end

	local selected_level_name = "UNKNOWN"
	local level_image = "any_small_image"
	local selected_mission_id = lobby_data.selected_mission_id

	if mechanism == "weave" and selected_mission_id ~= "" and selected_mission_id ~= "false" then
		level_image = "weaves_small_image"

		local weave_name = selected_mission_id
		local weave_template = WeaveSettings.templates[weave_name]
		local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)

		if not weave_template then
			local level_settings = LevelSettings[selected_mission_id]

			selected_level_name = Localize(level_settings.display_name or "UNKNOWN")
		elseif lobby_data.quick_game == "true" then
			selected_level_name = weave_template and Localize(weave_template.display_name) or Localize("start_game_window_weave_quickplay_title")
		else
			selected_level_name = weave_index .. ". " .. Localize(weave_template.display_name)
		end
	elseif mechanism == "deus" then
		level_image = "deus_small_image"

		local level_settings = LevelSettings[selected_mission_id]

		selected_level_name = Localize(level_settings.display_name or "UNKNOWN")
	elseif mechanism == "versus" then
		if selected_mission_id ~= "any" then
			local level_settings = LevelSettings[selected_mission_id]

			selected_level_name = Localize(level_settings.display_name or "UNKNOWN")
			level_image = LevelHelper:get_small_level_image(selected_mission_id)
		else
			level_image = "any_small_image"
			selected_level_name = Localize("random_level")
		end
	elseif selected_mission_id then
		local level_settings = LevelSettings[selected_mission_id]

		selected_level_name = Localize(level_settings.display_name or "UNKNOWN")
		level_image = LevelHelper:get_small_level_image(selected_mission_id)
	end

	local current_level_name = "UNKNOWN"
	local current_mission_id = lobby_data.mission_id

	if current_mission_id then
		local current_level_name = current_mission_id
		local weave_template = WeaveSettings.templates[current_level_name]

		if weave_template then
			current_level_name = weave_template.objectives[1].level_id
		end

		local level_settings = LevelSettings[current_level_name]

		current_level_name = Localize(level_settings.display_name or "UNKNOWN")
	end

	local country_code = lobby_data.country_code and string.lower(lobby_data.country_code) or Localize("lb_unknown")
	local flag_size = {
		30,
		50,
	}
	local flag_name

	if UIAtlasHelper.has_texture_by_name(country_code) then
		local flag_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(country_code)

		flag_size = {
			flag_settings.size[1] * 1.5,
			flag_settings.size[2] * 1.5,
		}
		flag_name = country_code
	end

	if rawget(_G, "Steam") then
		local user_country_code = Managers.account:region()

		if (user_country_code == "cn" or user_country_code == "hk") and country_code == "tw" then
			flag_size = {
				30,
				50,
			}
			flag_name = nil
			country_code = ""
		end
	end

	local level_frame = "map_frame_00"

	if completed_difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[completed_difficulty_index]
		local settings = DifficultySettings[difficulty_key]

		level_frame = settings.completed_frame_texture
	end

	return {
		scenegraph_id = "lobby_entry_anchor",
		element = {
			passes = {
				{
					content_id = "lobby_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return not content.selected and not Managers.matchmaking:is_game_matchmaking()
					end,
				},
				{
					pass_type = "texture",
					style_id = "lock_icon",
					texture_id = "lock_icon_id",
					content_check_function = function (content, style)
						return not content.joinable
					end,
					content_change_function = function (content, style)
						if content.selected or content.lobby_hotspot.is_hover then
							style.color = style.selected_color
						else
							style.color = style.base_color
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "lock_icon_shadow",
					texture_id = "lock_icon_id",
					content_check_function = function (content, style)
						return not content.selected and not content.lobby_hotspot.is_hover and not content.joinable
					end,
				},
				{
					pass_type = "texture",
					style_id = "selected_background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return (content.selected or content.lobby_hotspot.is_hover) and not Managers.matchmaking:is_game_matchmaking()
					end,
				},
				{
					pass_type = "texture",
					style_id = "disabled_background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return Managers.matchmaking:is_game_matchmaking()
					end,
				},
				{
					pass_type = "text",
					style_id = "host_name",
					text_id = "host_name",
				},
				{
					pass_type = "text",
					style_id = "selected_level_name",
					text_id = "selected_level_name",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "selected_level_name_shadow",
					text_id = "selected_level_name",
					content_check_function = function (content, style)
						return content.joinable or not content.selected and not content.lobby_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "level_image",
					texture_id = "level_image_id",
					content_check_function = function (content, style)
						return content.level_image_id
					end,
				},
				{
					pass_type = "texture",
					style_id = "flag",
					texture_id = "flag_id",
					content_check_function = function (content)
						return content.flag_id
					end,
				},
				{
					pass_type = "text",
					style_id = "no_flag",
					text_id = "no_flag_id",
					content_check_function = function (content)
						return not content.flag_id
					end,
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "no_flag_shadow",
					text_id = "no_flag_id",
					content_check_function = function (content, style)
						return (content.joinable or not content.selected and not content.lobby_hotspot.is_hover) and not content.flag_id
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty",
					text_id = "difficulty_id",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "num_players",
					text_id = "num_players_id",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty_shadow",
					text_id = "difficulty_id",
					content_check_function = function (content, style)
						return content.joinable or not content.selected and not content.lobby_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "num_players_shadow",
					text_id = "num_players_id",
					content_check_function = function (content, style)
						return content.joinable or not content.selected and not content.lobby_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			background_id = "rect_masked",
			frame_id = "rect_masked",
			lock_icon_id = "lobby_icon_lock",
			selected = false,
			lobby_hotspot = {},
			host_name = host_name,
			num_players_id = num_players .. "/4",
			difficulty_id = difficulty,
			selected_level_name = selected_level_name,
			current_level_name = current_level_name,
			lobby_data = lobby_data,
			level_image_id = level_image,
			flag_id = flag_name,
			flag_index = flag_index,
			no_flag_id = country_code,
			joinable = joinable,
		},
		style = {
			background = {
				color = {
					96,
					0,
					0,
					0,
				},
				size = {
					element_settings.width,
					element_settings.height,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			selected_background = {
				color = Colors.get_color_table_with_alpha("font_default", 96),
				size = {
					element_settings.width,
					element_settings.height,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			disabled_background = {
				color = {
					196,
					0,
					0,
					0,
				},
				size = {
					element_settings.width,
					element_settings.height,
				},
				offset = {
					0,
					0,
					11,
				},
			},
			lock_icon = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("font_default", 96),
				base_color = Colors.get_color_table_with_alpha("font_default", 96),
				selected_color = {
					255,
					0,
					0,
					0,
				},
				texture_size = {
					29,
					42,
				},
				offset = {
					580,
					-0,
					3,
				},
			},
			lock_icon_shadow = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					0,
					0,
					0,
				},
				texture_size = {
					29,
					42,
				},
				offset = {
					582,
					-0 - 2,
					2,
				},
			},
			host_name = {
				font_size = 22,
				font_type = "arial_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					110 + element_settings.spacing,
					0,
					2,
				},
			},
			selected_level_name = {
				font_size = 32,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "bottom",
				text_color = {
					255,
					255,
					255,
					255,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					110 + element_settings.spacing,
					-5,
					2,
				},
			},
			selected_level_name_shadow = {
				font_size = 32,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "bottom",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					110 + element_settings.spacing + 2,
					-7,
					1,
				},
			},
			host_name_shadow = {
				font_size = 26,
				font_type = "arial_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				text_color = {
					255,
					0,
					0,
					0,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					132,
					-4,
					1,
				},
			},
			difficulty = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					255,
					255,
					255,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					315,
					-4,
					2,
				},
			},
			difficulty_shadow = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					317,
					-6,
					1,
				},
			},
			num_players = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					255,
					255,
					255,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					1090,
					-4,
					2,
				},
			},
			num_players_shadow = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					1092,
					-6,
					1,
				},
			},
			level_image = {
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					(element_settings.height - 10) * 1.6724137931034482,
					element_settings.height - 10,
				},
				offset = {
					10,
					0,
					1,
				},
			},
			level_image_frame = {
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					0,
					0,
					0,
				},
				texture_size = {
					(element_settings.height - 10) * 1.6724137931034482 + 4,
					element_settings.height - 10 + 4,
				},
				offset = {
					8,
					0,
					0,
				},
			},
			flag = {
				horizontal_alignment = "center",
				masked = true,
				vertical_alignment = "center",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = flag_size,
				offset = {
					105,
					0,
					10,
				},
			},
			flag_shadow = {
				vertical_alignment = "center",
				color = {
					255,
					0,
					0,
					0,
				},
				texture_size = {
					90,
					45,
				},
				offset = {
					659,
					-4,
					9,
				},
			},
			no_flag = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					255,
					255,
					255,
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0,
				},
				base_color = {
					255,
					128,
					128,
					128,
				},
				joinable_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					110,
					-5,
					10,
				},
			},
			no_flag_shadow = {
				font_size = 26,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					112,
					-7,
					9,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_empty_lobby_entry_func(offset_y)
	return {
		scenegraph_id = "lobby_entry_anchor",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
				},
			},
		},
		content = {
			background_id = "rect_masked",
		},
		style = {
			background = {
				color = {
					96,
					0,
					0,
					0,
				},
				size = {
					element_settings.width,
					element_settings.height,
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
			offset_y,
			0,
		},
	}
end

local function create_unavailable_lobby_entry_func(offset_y)
	return {
		scenegraph_id = "lobby_entry_anchor",
		element = {
			passes = {
				{
					content_id = "lobby_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "unavailable_text",
					text_id = "unavailable_text",
				},
				{
					pass_type = "text",
					style_id = "unavailable_text_shadow",
					text_id = "unavailable_text",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return not content.selected and not content.lobby_hotspot.is_hover or Managers.matchmaking:is_game_matchmaking()
					end,
				},
				{
					pass_type = "texture",
					style_id = "selected_background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return (content.selected or content.lobby_hotspot.is_hover) and not Managers.matchmaking:is_game_matchmaking()
					end,
				},
			},
		},
		content = {
			background_id = "rect_masked",
			selected = false,
			lobby_hotspot = {},
			unavailable_text = string.upper(Localize("level_display_name_unavailable")),
		},
		style = {
			background = {
				color = {
					96,
					0,
					0,
					0,
				},
				size = {
					element_settings.width,
					element_settings.height,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			selected_background = {
				color = {
					128,
					50,
					50,
					50,
				},
				size = {
					element_settings.width,
					element_settings.height,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			unavailable_text = {
				font_size = 24,
				font_type = "hell_shark_header_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					90,
					90,
					90,
				},
				offset = {
					110 + element_settings.spacing,
					-5,
					2,
				},
			},
			unavailable_text_shadow = {
				font_size = 24,
				font_type = "hell_shark_header_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					20,
					20,
					20,
				},
				offset = {
					110 + element_settings.spacing + 2,
					-7,
					1,
				},
			},
		},
		offset = {
			0,
			offset_y,
			0,
		},
	}
end

local function create_details_information(scenegraph_id, game_type_scenegraph_id, status_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "rounded_background",
					style_id = "background",
				},
				{
					pass_type = "rounded_background",
					style_id = "inner_background",
				},
				{
					pass_type = "text",
					style_id = "game_type_label",
					text_id = "game_type_label_id",
				},
				{
					pass_type = "text",
					style_id = "status_label",
					text_id = "status_label_id",
				},
				{
					pass_type = "text",
					style_id = "game_type",
					text_id = "game_type_id",
				},
				{
					pass_type = "text",
					style_id = "status",
					text_id = "status_id",
				},
			},
		},
		content = {
			game_type_id = "lb_game_type_none",
			game_type_label_id = "lb_game_type",
			status_id = "lb_in_inn",
			status_label_id = "lb_status",
		},
		style = {
			background = {
				corner_radius = 10,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					128,
					60,
					60,
					60,
				},
				offset = {
					0,
					0,
					1,
				},
				rect_size = {
					400,
					100,
				},
			},
			inner_background = {
				corner_radius = 10,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					2,
					1,
				},
				rect_size = {
					396,
					96,
				},
			},
			game_type_label = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "bottom",
				text_color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					75,
					50,
					2,
				},
			},
			status_label = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "bottom",
				text_color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					75,
					15,
					2,
				},
			},
			game_type = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = true,
				vertical_alignment = "bottom",
				scenegraph_id = game_type_scenegraph_id,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-75,
					50,
					2,
				},
			},
			status = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = true,
				vertical_alignment = "bottom",
				scenegraph_id = status_scenegraph_id,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-75,
					15,
					2,
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

local function create_objective(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end,
				},
			},
		},
		content = {
			background = "chest_upgrade_fill_glow",
			icon = "trial_gem",
			text = "-",
		},
		style = {
			background = {
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
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					49,
					44,
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					size[1] - 60,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					50,
					2,
					2,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					size[1] - 60,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					52,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local lobby_browser_description_style = {
	dynamic_font_size = true,
	font_size = 50,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		-10,
		2,
	},
}
local disable_with_gamepad = true
local base_widget_definition = {
	background = UIWidgets.create_simple_rect("lobby_browser_window", {
		50,
		0,
		0,
		0,
	}, -10),
	lobby_browser_background = UIWidgets.create_rect_with_outer_frame("lobby_browser_background", scenegraph_definition.lobby_browser_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	lobby_browser_title = UIWidgets.create_simple_text(Localize("menu_title_lobby_browser"), "lobby_browser_background", nil, nil, lobby_browser_description_style),
	custom_game_divider = UIWidgets.create_simple_texture("divider_01_top", "lobby_browser_divider"),
	join_button = UIWidgets.create_default_button("join_button", scenegraph_definition.join_button.size, nil, nil, Localize("lb_join"), 28, nil, nil, nil, disable_with_gamepad),
	refresh_button = UIWidgets.create_default_button("refresh_button", scenegraph_definition.refresh_button.size, nil, nil, Localize("menu_description_refresh"), 28, nil, nil, nil, disable_with_gamepad),
	frame = create_lobby_browser_frame("lobby_browser_frame"),
	filter_frame = create_filter_frame("filter_base"),
}
local hero_icons = {}

for i = 1, #ProfilePriority do
	local profile_index = ProfilePriority[i]
	local profile = SPProfiles[profile_index]

	hero_icons[#hero_icons + 1] = profile.ui_portrait
end

local hero_entry_size_scale = 0.75
local hero_entry_width = 96 * hero_entry_size_scale
local hero_entry_height = 112 * hero_entry_size_scale
local hero_entry_spacing = 5 * hero_entry_size_scale
local hero_entry_frame_size = {
	86 * hero_entry_size_scale,
	108 * hero_entry_size_scale,
}
local weave_hero_entry_size_scale = 0.6
local weave_hero_entry_width = 96 * weave_hero_entry_size_scale
local weave_hero_entry_height = 112 * weave_hero_entry_size_scale
local weave_hero_entry_spacing = 5 * weave_hero_entry_size_scale
local weave_hero_entry_frame_size = {
	86 * weave_hero_entry_size_scale,
	108 * weave_hero_entry_size_scale,
}
local wind_name_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local level_name_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local weave_level_name_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
	size = {
		350,
		scenegraph_definition.weave_details_level_name[2],
	},
}
local locked_reason_style = {
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = {
		255,
		255,
		62,
		62,
	},
	offset = {
		0,
		0,
		2,
	},
}
local mutator_title_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		-5,
		2,
	},
}
local mutator_description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = true,
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
local objective_title_text_style = {
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local adventure_details_widget_definition = {
	level_image_frame = UIWidgets.create_simple_texture("map_frame_00", "details_level_frame"),
	level_image = UIWidgets.create_simple_texture("level_image_any", "details_level_image"),
	level_name = UIWidgets.create_simple_text(" ", "details_level_name", nil, nil, level_name_style),
	locked_reason = UIWidgets.create_simple_text("tutorial_no_text", "details_locked_reason", nil, nil, locked_reason_style),
	details_information = create_details_information("details_level_info", "details_game_type", "details_status"),
	twitch_logo = UIWidgets.create_simple_texture("twitch_logo_new", "twitch_logo"),
	hero_tabs = UIWidgets.create_icon_selector("details_hero_tabs", {
		hero_entry_width,
		hero_entry_height,
	}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true),
}
local deus_details_widget_definition = {
	expedition_icon = UIWidgets.create_expedition_widget_func("deus_level_icon", nil, DeusJourneySettings.journey_cave, "journey_cave", {
		spacing_x = 40,
		width = 800,
	}, 1.2),
	level_name = UIWidgets.create_simple_text(" ", "details_level_name", nil, nil, level_name_style),
	locked_reason = UIWidgets.create_simple_text("tutorial_no_text", "details_locked_reason", nil, nil, locked_reason_style),
	details_information = create_details_information("details_level_info", "details_game_type", "details_status"),
	twitch_logo = UIWidgets.create_simple_texture("twitch_logo_new", "twitch_logo"),
	hero_tabs = UIWidgets.create_icon_selector("details_hero_tabs", {
		hero_entry_width,
		hero_entry_height,
	}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true),
}
local weave_details_widget_definition = {
	level_image_frame = UIWidgets.create_simple_texture("map_frame_00", "weave_details_level_frame"),
	level_image = UIWidgets.create_simple_texture("level_image_any", "weave_details_level_image"),
	wind_icon = UIWidgets.create_simple_texture("icon_wind_azyr", "wind_icon"),
	wind_icon_glow = UIWidgets.create_simple_texture("winds_icon_background_glow", "wind_icon_glow"),
	wind_icon_bg = UIWidgets.create_simple_texture("weave_item_icon_border_selected", "wind_icon_bg"),
	wind_icon_slot = UIWidgets.create_simple_texture("weave_item_icon_border_center", "wind_icon_slot"),
	wind_name = UIWidgets.create_simple_text("wind_name", "wind_name", nil, nil, wind_name_style),
	level_name = UIWidgets.create_simple_text(" ", "weave_details_level_name", nil, nil, weave_level_name_style),
	hero_tabs = UIWidgets.create_icon_selector("weave_details_hero_tabs", {
		weave_hero_entry_width,
		weave_hero_entry_height,
	}, hero_icons, weave_hero_entry_spacing, true, weave_hero_entry_frame_size, true),
	wind_mutator_icon = UIWidgets.create_simple_texture("icons_placeholder", "wind_mutator_icon"),
	wind_mutator_icon_frame = UIWidgets.create_simple_texture("talent_frame", "wind_mutator_icon_frame"),
	wind_mutator_title_text = UIWidgets.create_simple_text("n/a", "wind_mutator_title_text", nil, nil, mutator_title_text_style),
	wind_mutator_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "wind_mutator_title_divider"),
	wind_mutator_description_text = UIWidgets.create_simple_text("n/a", "wind_mutator_description_text", nil, nil, mutator_description_text_style),
	objective_title_bg = UIWidgets.create_simple_texture("menu_subheader_bg", "objective_title_bg"),
	objective_title = UIWidgets.create_simple_text("weave_objective_title", "objective_title", nil, nil, objective_title_text_style),
	objective_1 = create_objective("objective_1", scenegraph_definition.objective_1.size),
	objective_2 = create_objective("objective_2", scenegraph_definition.objective_2.size),
	locked_reason = UIWidgets.create_simple_text("tutorial_no_text", "weave_details_locked_reason", nil, nil, locked_reason_style),
	details_information = create_details_information("weave_details_level_info", "weave_game_type", "weave_status"),
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	base_widget_definition = base_widget_definition,
	adventure_details_widget_definition = adventure_details_widget_definition,
	weave_details_widget_definition = weave_details_widget_definition,
	deus_details_widget_definition = deus_details_widget_definition,
	create_lobby_entry_func = create_lobby_entry_func,
	create_empty_lobby_entry_func = create_empty_lobby_entry_func,
	create_unavailable_lobby_entry_func = create_unavailable_lobby_entry_func,
	create_game_type_filter_entry_func = create_game_type_filter_entry_func,
	create_level_filter_entry_func = create_level_filter_entry_func,
	create_difficulty_filter_entry_func = create_difficulty_filter_entry_func,
	create_lobby_filter_entry_func = create_lobby_filter_entry_func,
	create_distance_filter_entry_func = create_distance_filter_entry_func,
	create_level_filter_scroller_func = create_level_filter_scroller_func,
	element_settings = element_settings,
	widget_definition = widget_definition,
}
