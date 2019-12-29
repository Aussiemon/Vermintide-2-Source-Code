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
	bottom_border_size = bottom_border_size
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	lobby_browser_background = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width,
			90
		},
		position = {
			100,
			-100,
			0
		}
	},
	lobby_browser_divider = {
		vertical_alignment = "top",
		parent = "lobby_browser_background",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-55,
			1
		}
	},
	lobby_browser_frame = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			browser_width,
			40
		},
		position = {
			100,
			-300,
			0
		}
	},
	lobby_entry_anchor = {
		vertical_alignment = "bottom",
		parent = "lobby_browser_frame",
		horizontal_alignment = "left",
		size = {
			element_settings.width,
			element_settings.height
		},
		position = {
			0,
			0,
			0
		}
	},
	filter_base = {
		vertical_alignment = "top",
		parent = "lobby_browser_frame",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width,
			200
		},
		position = {
			0,
			80 + element_settings.spacing * 2,
			20
		}
	},
	lobby_browser_window = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			browser_width + details_width + spacing,
			element_settings.window_height + filter_height * 3 + spacing * 3
		},
		position = {
			0,
			-0,
			-20
		}
	},
	details_base = {
		vertical_alignment = "top",
		parent = "lobby_browser_frame",
		horizontal_alignment = "left",
		size = {
			520,
			element_settings.window_height
		},
		position = {
			browser_width + element_settings.spacing,
			-40 + spacing,
			1
		}
	},
	details_level_frame = {
		vertical_alignment = "top",
		parent = "details_base",
		horizontal_alignment = "center",
		size = {
			200,
			200
		},
		position = {
			0,
			-25,
			2
		}
	},
	details_level_image = {
		vertical_alignment = "center",
		parent = "details_level_frame",
		horizontal_alignment = "center",
		size = {
			180,
			180
		},
		position = {
			0,
			0,
			-1
		}
	},
	details_level_name = {
		vertical_alignment = "bottom",
		parent = "details_level_image",
		horizontal_alignment = "center",
		position = {
			0,
			-200,
			-1
		},
		size = {
			520,
			170
		}
	},
	details_hero_tabs = {
		vertical_alignment = "bottom",
		parent = "details_level_image",
		horizontal_alignment = "center",
		position = {
			88,
			-160,
			-1
		}
	},
	details_locked_reason = {
		vertical_alignment = "bottom",
		parent = "details_base",
		horizontal_alignment = "center",
		position = {
			0,
			50,
			-1
		},
		size = {
			520,
			170
		}
	},
	details_level_info = {
		vertical_alignment = "bottom",
		parent = "details_base",
		horizontal_alignment = "center",
		position = {
			0,
			10,
			-1
		}
	},
	details_game_type = {
		vertical_alignment = "bottom",
		parent = "details_level_info",
		horizontal_alignment = "right",
		size = {
			220,
			50
		}
	},
	details_status = {
		vertical_alignment = "bottom",
		parent = "details_level_info",
		horizontal_alignment = "right",
		size = {
			220,
			50
		}
	},
	weave_details_base = {
		vertical_alignment = "top",
		parent = "lobby_browser_frame",
		horizontal_alignment = "left",
		size = {
			520,
			element_settings.window_height
		},
		position = {
			browser_width + element_settings.spacing,
			-40 + spacing,
			1
		}
	},
	weave_details_level_frame = {
		vertical_alignment = "top",
		parent = "weave_details_base",
		horizontal_alignment = "right",
		size = {
			180,
			180
		},
		position = {
			-5,
			-5,
			2
		}
	},
	weave_details_level_image = {
		vertical_alignment = "center",
		parent = "weave_details_level_frame",
		horizontal_alignment = "center",
		size = {
			160,
			160
		},
		position = {
			0,
			0,
			-1
		}
	},
	weave_details_level_name = {
		vertical_alignment = "top",
		parent = "weave_details_base",
		horizontal_alignment = "left",
		position = {
			15,
			-15,
			-1
		},
		size = {
			520,
			170
		}
	},
	weave_details_hero_tabs = {
		vertical_alignment = "top",
		parent = "weave_details_level_name",
		horizontal_alignment = "left",
		position = {
			150,
			10,
			-1
		}
	},
	weave_details_locked_reason = {
		vertical_alignment = "bottom",
		parent = "weave_details_base",
		horizontal_alignment = "center",
		position = {
			0,
			50,
			-1
		},
		size = {
			520,
			170
		}
	},
	weave_details_level_info = {
		vertical_alignment = "bottom",
		parent = "weave_details_base",
		horizontal_alignment = "center",
		position = {
			0,
			10,
			-1
		}
	},
	weave_game_type = {
		vertical_alignment = "bottom",
		parent = "weave_details_level_info",
		horizontal_alignment = "right",
		size = {
			220,
			50
		}
	},
	weave_status = {
		vertical_alignment = "bottom",
		parent = "weave_details_level_info",
		horizontal_alignment = "right",
		size = {
			220,
			50
		}
	},
	wind_icon_bg = {
		vertical_alignment = "bottom",
		parent = "weave_details_level_frame",
		horizontal_alignment = "center",
		size = {
			62.05,
			62.05
		},
		position = {
			0,
			-20,
			2
		}
	},
	wind_icon_slot = {
		vertical_alignment = "center",
		parent = "wind_icon_bg",
		horizontal_alignment = "center",
		size = {
			54.4,
			54.4
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon_glow = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			43.35,
			45.05
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_icon = {
		vertical_alignment = "center",
		parent = "wind_icon_slot",
		horizontal_alignment = "center",
		size = {
			54.4,
			54.4
		},
		position = {
			0,
			0,
			2
		}
	},
	wind_name = {
		vertical_alignment = "top",
		parent = "weave_details_level_name",
		horizontal_alignment = "left",
		size = {
			520,
			32
		},
		position = {
			0,
			-40,
			0
		}
	},
	wind_mutator_window = {
		vertical_alignment = "top",
		parent = "details_level_frame",
		horizontal_alignment = "center",
		size = {
			520,
			0
		},
		position = {
			0,
			-150,
			1
		}
	},
	wind_mutator_icon = {
		vertical_alignment = "top",
		parent = "wind_mutator_window",
		horizontal_alignment = "left",
		size = {
			28,
			36
		},
		position = {
			25,
			-75,
			5
		}
	},
	wind_mutator_icon_frame = {
		vertical_alignment = "center",
		parent = "wind_mutator_icon",
		horizontal_alignment = "center",
		size = {
			60,
			60
		},
		position = {
			0,
			0,
			1
		}
	},
	wind_mutator_title_text = {
		vertical_alignment = "top",
		parent = "wind_mutator_window",
		horizontal_alignment = "left",
		size = {
			312,
			50
		},
		position = {
			10,
			-5,
			1
		}
	},
	wind_mutator_title_divider = {
		vertical_alignment = "bottom",
		parent = "wind_mutator_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	wind_mutator_description_text = {
		vertical_alignment = "top",
		parent = "wind_mutator_icon",
		horizontal_alignment = "left",
		size = {
			430,
			100
		},
		position = {
			60,
			15,
			1
		}
	},
	objective_title = {
		vertical_alignment = "bottom",
		parent = "wind_mutator_icon",
		horizontal_alignment = "left",
		size = {
			520,
			40
		},
		position = {
			-20,
			-90,
			3
		}
	},
	objective_title_bg = {
		vertical_alignment = "center",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			467,
			59
		},
		position = {
			0,
			0,
			-1
		}
	},
	objective_1 = {
		vertical_alignment = "bottom",
		parent = "objective_title",
		horizontal_alignment = "center",
		size = {
			520,
			30
		},
		position = {
			0,
			-35,
			3
		}
	},
	objective_2 = {
		vertical_alignment = "bottom",
		parent = "objective_1",
		horizontal_alignment = "center",
		size = {
			520,
			30
		},
		position = {
			0,
			-35,
			0
		}
	},
	filter_level_entry_anchor = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width / 4,
			element_settings.filter_height
		},
		position = {
			0,
			-element_settings.filter_height - element_settings.spacing,
			1
		}
	},
	filter_level_scroller = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width / 4,
			element_settings.filter_height
		},
		position = {
			0,
			-element_settings.filter_height - element_settings.spacing,
			1
		}
	},
	filter_difficulty_entry_anchor = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width / 4,
			element_settings.filter_height
		},
		position = {
			element_settings.window_width / 4 * 1 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1
		}
	},
	filter_lobby_entry_anchor = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width / 4,
			element_settings.filter_height
		},
		position = {
			element_settings.window_width / 4 * 2 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1
		}
	},
	filter_distance_entry_anchor = {
		vertical_alignment = "top",
		parent = "filter_base",
		horizontal_alignment = "left",
		size = {
			element_settings.window_width / 4,
			element_settings.filter_height
		},
		position = {
			element_settings.window_width / 4 * 3 + element_settings.spacing,
			-element_settings.filter_height - element_settings.spacing,
			1
		}
	}
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
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
	"zw"
}

local function create_lobby_browser_frame(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "info_bar"
				},
				{
					style_id = "dimmer",
					pass_type = "rect",
					content_check_function = function (content, style)
						return content.filter_active
					end
				},
				{
					pass_type = "rect",
					style_id = "top_bar"
				},
				{
					pass_type = "rect",
					style_id = "left_bar"
				},
				{
					pass_type = "rect",
					style_id = "right_bar"
				},
				{
					pass_type = "rect",
					style_id = "bottom"
				},
				{
					pass_type = "rect",
					style_id = "scroll_bar"
				},
				{
					pass_type = "rect",
					style_id = "details_background"
				},
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask_id"
				},
				{
					pass_type = "texture",
					style_id = "filter_mask",
					texture_id = "mask_id",
					content_check_function = function (content, style)
						return content.filter_active
					end
				},
				{
					pass_type = "texture",
					style_id = "host_mask",
					texture_id = "mask_id"
				},
				{
					pass_type = "texture",
					style_id = "country_mask",
					texture_id = "mask_id"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_mask",
					texture_id = "mask_id"
				},
				{
					style_id = "host_label",
					pass_type = "text",
					text_id = "host_label"
				},
				{
					style_id = "country_label",
					pass_type = "text",
					text_id = "country_label"
				},
				{
					style_id = "difficulty_label",
					pass_type = "text",
					text_id = "difficulty_label"
				},
				{
					style_id = "players_label",
					pass_type = "text",
					text_id = "players_label"
				},
				{
					style_id = "info_text",
					pass_type = "text",
					text_id = "info_text_id"
				},
				{
					style_id = "timer_text",
					pass_type = "text",
					text_id = "timer_text_id",
					content_change_function = function (content, style, _, dt)
						content.timer = (content.timer or 0) + dt
						local seconds = math.max(content.timer, 0)
						local minutes = math.floor(seconds / 60)
						local hours = math.floor(minutes / 60)
						content.timer_text_id = string.format("%02d:%02d:%02d", hours, minutes - hours * 60, seconds % 60)
					end
				},
				{
					style_id = "time_since_refresh",
					pass_type = "text",
					text_id = "time_since_refresh_id"
				},
				{
					style_id = "details_label",
					pass_type = "text",
					text_id = "details_label"
				},
				{
					style_id = "scroller",
					pass_type = "rect",
					content_check_function = function (content, style)
						return content.show_scroller and not content.filter_active
					end,
					content_change_function = function (content, style)
						local window_height = element_settings.window_height
						local offset_y = -element_settings.spacing - content.scrollbar_progress * (window_height + style.texture_size[2])
						style.offset[2] = offset_y
						style.offset[1] = (Math.is_valid(style.offset[1]) and style.offset[1]) or 0
						style.offset[2] = (Math.is_valid(style.offset[2]) and style.offset[2]) or 0
						style.offset[3] = (Math.is_valid(style.offset[3]) and style.offset[3]) or 0
					end
				},
				{
					style_id = "inner_scroller",
					pass_type = "rect",
					content_check_function = function (content, style)
						return content.show_scroller and not content.filter_active
					end,
					content_change_function = function (content, style)
						local window_height = element_settings.window_height
						local offset_y = -element_settings.spacing - content.scrollbar_progress * (window_height + style.texture_size[2])
						style.offset[2] = offset_y
						style.offset[1] = (Math.is_valid(style.offset[1]) and style.offset[1]) or 0
						style.offset[2] = (Math.is_valid(style.offset[2]) and style.offset[2]) or 0
						style.offset[3] = (Math.is_valid(style.offset[3]) and style.offset[3]) or 0
					end
				}
			}
		},
		content = {
			players_label = "lb_players",
			filter_active = false,
			timer_text_id = "0:00:00",
			details_label = "lb_details",
			difficulty_label = "lb_difficulty",
			wanted_scroller_offset = 0,
			info_text_id = " ",
			scrollbar_progress = 0,
			show_scroller = true,
			host_label = "lb_host",
			mask_id = "mask_rect",
			country_label = "lb_country",
			time_since_refresh_id = Localize("time_since_last_refresh") .. ":"
		},
		style = {
			info_bar = {
				color = {
					224,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.window_width + element_settings.spacing * 2,
					filter_height
				},
				offset = {
					-element_settings.spacing,
					0,
					0
				}
			},
			dimmer = {
				color = {
					196,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.window_width,
					-element_settings.window_height - filter_height
				},
				offset = {
					0,
					filter_height,
					20
				}
			},
			top_bar = {
				color = {
					224,
					0,
					0,
					0
				},
				size = {
					element_settings.window_width + element_settings.spacing * 7,
					element_settings.spacing * 2
				},
				offset = {
					-element_settings.spacing * 3.5,
					126,
					0
				}
			},
			bottom = {
				color = {
					224,
					0,
					0,
					0
				},
				size = {
					element_settings.window_width + element_settings.spacing * 2,
					-bottom_border_size
				},
				offset = {
					-element_settings.spacing,
					-element_settings.window_height - element_settings.spacing * 1.5,
					0
				}
			},
			right_bar = {
				color = {
					224,
					0,
					0,
					0
				},
				size = {
					5,
					-element_settings.window_height - 127 - bottom_border_size - element_settings.spacing * 2
				},
				offset = {
					element_settings.window_width + element_settings.spacing,
					124 + element_settings.spacing * 2,
					0
				}
			},
			left_bar = {
				color = {
					224,
					0,
					0,
					0
				},
				size = {
					5,
					-element_settings.window_height - 127 - bottom_border_size - element_settings.spacing * 2
				},
				offset = {
					-element_settings.spacing - 5,
					124 + element_settings.spacing * 2,
					0
				}
			},
			details_bar = {
				texture_size = {
					details_width,
					40
				},
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					1200 + element_settings.spacing,
					0,
					0
				}
			},
			scroll_bar = {
				texture_size = {
					scroller_width,
					-element_settings.window_height
				},
				color = {
					224,
					0,
					0,
					0
				},
				offset = {
					browser_width - scroller_width,
					-element_settings.spacing,
					0
				}
			},
			scroller = {
				texture_size = {
					scroller_width,
					-100
				},
				color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					browser_width - scroller_width,
					-element_settings.spacing,
					0
				}
			},
			inner_scroller = {
				texture_size = {
					scroller_width - 4,
					-100
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					browser_width - scroller_width + 2,
					-element_settings.spacing,
					0
				}
			},
			details_background = {
				texture_size = {
					details_width,
					-element_settings.window_height
				},
				color = {
					168,
					0,
					0,
					0
				},
				offset = {
					1200 + element_settings.spacing,
					-element_settings.spacing,
					0
				}
			},
			mask = {
				texture_size = {
					browser_width - scroller_width - element_settings.spacing,
					-element_settings.window_height
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-element_settings.spacing,
					0
				}
			},
			filter_mask = {
				texture_size = {
					element_settings.window_width,
					-element_settings.window_height - element_settings.filter_height
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-element_settings.spacing + element_settings.filter_height + element_settings.spacing,
					0
				}
			},
			host_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height
				},
				color = {
					1,
					0,
					0,
					0
				},
				offset = {
					620,
					-element_settings.spacing,
					0
				}
			},
			country_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height
				},
				color = {
					1,
					0,
					0,
					0
				},
				offset = {
					775,
					-element_settings.spacing,
					0
				}
			},
			difficulty_mask = {
				texture_size = {
					element_settings.spacing * 0.33,
					-element_settings.window_height
				},
				color = {
					1,
					0,
					0,
					0
				},
				offset = {
					1030,
					-element_settings.spacing,
					0
				}
			},
			host_label = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					20,
					-2,
					1
				}
			},
			country_label = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 20,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					100,
					-2,
					1
				}
			},
			difficulty_label = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 20,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					305,
					-2,
					1
				}
			},
			players_label = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 20,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					510,
					-2,
					1
				}
			},
			details_label = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					1220,
					-2,
					1
				}
			},
			info_text = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					13,
					-element_settings.window_height - bottom_border_size - 2,
					5
				}
			},
			timer_text = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					browser_width - 105,
					-element_settings.window_height - bottom_border_size - 2,
					5
				}
			},
			time_since_refresh = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				localize = false,
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-110,
					-element_settings.window_height - bottom_border_size - 2,
					5
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

local function create_filter_frame(scenegraph_id)
	local label_distance = element_settings.window_width / 4

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "info_bar"
				},
				{
					style_id = "level_left_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 1) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 1) or content.filter_hotspot_1.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "level_right_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 1) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 1) or content.filter_hotspot_1.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "difficulty_left_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 2) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 2) or content.filter_hotspot_2.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "difficulty_right_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 2) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 2) or content.filter_hotspot_2.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "lobby_filter_left_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 3) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 3) or content.filter_hotspot_3.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "lobby_filter_right_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 3) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 3) or content.filter_hotspot_3.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "distance_left_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 4) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 4) or content.filter_hotspot_4.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "distance_right_triangle",
					pass_type = "triangle",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						return (content.filter_selection and content.filter_index == 4) or not gamepad_active
					end,
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 4) or content.filter_hotspot_4.is_hover then
							style.color = style.select_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "background_1",
					pass_type = "hotspot",
					content_id = "filter_hotspot_1"
				},
				{
					style_id = "background_1",
					pass_type = "rect",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 1) or content.filter_hotspot_1.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "background_2",
					pass_type = "hotspot",
					content_id = "filter_hotspot_2"
				},
				{
					style_id = "background_2",
					pass_type = "rect",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 2) or content.filter_hotspot_2.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "background_3",
					pass_type = "hotspot",
					content_id = "filter_hotspot_3"
				},
				{
					style_id = "background_3",
					pass_type = "rect",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 3) or content.filter_hotspot_3.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "background_4",
					pass_type = "hotspot",
					content_id = "filter_hotspot_4"
				},
				{
					style_id = "background_4",
					pass_type = "rect",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 4) or content.filter_hotspot_4.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					style_id = "mission_label",
					pass_type = "text",
					text_id = "mission_id"
				},
				{
					style_id = "difficulty_label",
					pass_type = "text",
					text_id = "difficulty_id"
				},
				{
					style_id = "show_lobbies_label",
					pass_type = "text",
					text_id = "show_lobbies_id"
				},
				{
					style_id = "distance_label",
					pass_type = "text",
					text_id = "distance_id"
				},
				{
					style_id = "mission_name",
					pass_type = "text",
					text_id = "mission_name",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 1) or content.filter_hotspot_1.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "difficulty_name",
					pass_type = "text",
					text_id = "difficulty_name",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 2) or content.filter_hotspot_2.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "show_lobbies_name",
					pass_type = "text",
					text_id = "show_lobbies_name",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 3) or content.filter_hotspot_3.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "distance_name",
					pass_type = "text",
					text_id = "distance_name",
					content_change_function = function (content, style)
						if (content.filter_selection and content.filter_index == 4) or content.filter_hotspot_4.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				}
			}
		},
		content = {
			mission_name = "-",
			difficulty_name = "-",
			background_id = "rect_masked",
			distance_name = "-",
			mask_id = "mask_rect",
			show_lobbies_name = "-",
			filter_hotspot_1 = {},
			filter_hotspot_2 = {},
			filter_hotspot_3 = {},
			filter_hotspot_4 = {},
			mission_id = string.upper(Localize("lb_mission")),
			difficulty_id = string.upper(Localize("lb_difficulty")),
			show_lobbies_id = string.upper(Localize("lb_show_lobbies")),
			distance_id = string.upper(Localize("lb_search_distance"))
		},
		style = {
			info_bar = {
				vertical_alignment = "top",
				color = {
					224,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.window_width,
					40
				},
				offset = {
					0,
					0,
					0
				}
			},
			level_left_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 1,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			level_right_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					(-25 + label_distance * 1) - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			difficulty_left_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 2,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			difficulty_right_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					(-25 + label_distance * 2) - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			lobby_filter_left_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 3,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			lobby_filter_right_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					(-25 + label_distance * 3) - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			distance_left_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_left",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					-25 + label_distance * 4,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			distance_right_triangle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				triangle_alignment = "top_right",
				texture_size = {
					7.5,
					10
				},
				select_color = {
					196,
					0,
					0,
					0
				},
				base_color = Colors.get_color_table_with_alpha("font_default", 128),
				color = Colors.get_color_table_with_alpha("font_default", 128),
				offset = {
					(-25 + label_distance * 4) - 7.5,
					0 - element_settings.filter_height * 1 - element_settings.spacing * 2 - 15,
					1
				}
			},
			mask = {
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					element_settings.window_width,
					40
				},
				offset = {
					0,
					-40 - element_settings.spacing,
					0
				}
			},
			divider_1 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.spacing,
					40
				},
				offset = {
					element_settings.window_width / 4,
					-40 - element_settings.spacing,
					0
				}
			},
			divider_2 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.spacing,
					40
				},
				offset = {
					element_settings.window_width / 4 * 2,
					-40 - element_settings.spacing,
					0
				}
			},
			divider_3 = {
				vertical_alignment = "top",
				color = {
					1,
					0,
					0,
					0
				},
				texture_size = {
					element_settings.spacing,
					40
				},
				offset = {
					element_settings.window_width / 4 * 3,
					-40 - element_settings.spacing,
					0
				}
			},
			background_1 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0
				},
				base_color = {
					196,
					0,
					0,
					0
				},
				selection_color = {
					255,
					128,
					128,
					128
				},
				texture_size = {
					label_distance,
					40
				},
				size = {
					label_distance,
					40
				},
				offset = {
					0,
					filter_height * 3 - element_settings.spacing,
					0
				}
			},
			background_2 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0
				},
				base_color = {
					196,
					0,
					0,
					0
				},
				selection_color = {
					255,
					128,
					128,
					128
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40
				},
				size = {
					label_distance,
					40
				},
				offset = {
					label_distance * 1 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0
				}
			},
			background_3 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0
				},
				base_color = {
					196,
					0,
					0,
					0
				},
				selection_color = {
					255,
					128,
					128,
					128
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40
				},
				size = {
					label_distance,
					40
				},
				offset = {
					label_distance * 2 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0
				}
			},
			background_4 = {
				vertical_alignment = "top",
				color = {
					196,
					0,
					0,
					0
				},
				base_color = {
					196,
					0,
					0,
					0
				},
				selection_color = {
					255,
					128,
					128,
					128
				},
				texture_size = {
					label_distance - element_settings.spacing * 0.5,
					40
				},
				size = {
					label_distance,
					40
				},
				offset = {
					label_distance * 3 + element_settings.spacing,
					filter_height * 3 - element_settings.spacing,
					0
				}
			},
			mission_label = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 0,
					158,
					1
				}
			},
			mission_name = {
				localize = false,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 0,
					118,
					1
				}
			},
			difficulty_label = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 1,
					158,
					1
				}
			},
			difficulty_name = {
				localize = false,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 1,
					118,
					1
				}
			},
			show_lobbies_label = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 2,
					158,
					1
				}
			},
			show_lobbies_name = {
				localize = false,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 2,
					118,
					1
				}
			},
			distance_label = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 3,
					158,
					1
				}
			},
			distance_name = {
				localize = false,
				font_size = 24,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				size = {
					element_settings.window_width,
					40
				},
				offset = {
					15 + label_distance * 3,
					118,
					1
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

local function create_level_filter_scroller_func(num_elements)
	local length = element_settings.window_height + element_settings.filter_height
	local max_entries = math.ceil(length / (element_settings.filter_height + element_settings.spacing) - 1)
	local size_y = math.max(length / (num_elements / max_entries), 30)

	return {
		scenegraph_id = "filter_level_scroller",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					pass_type = "rect",
					style_id = "border"
				},
				{
					style_id = "inner_scroller",
					pass_type = "rect",
					content_check_function = function (content, style)
						return content.show_scroller and content.active
					end,
					content_change_function = function (content, style)
						local scrollbar_length = element_settings.window_height - element_settings.spacing * 2
						local start_pos = -element_settings.filter_height - element_settings.spacing
						local offset_y = start_pos - content.scrollbar_progress * scrollbar_length
						local offset_y = start_pos - element_settings.spacing - content.scrollbar_progress * (scrollbar_length - style.texture_size[2] - start_pos)
						style.offset[2] = offset_y
						style.offset[1] = (Math.is_valid(style.offset[1]) and style.offset[1]) or 0
						style.offset[2] = (Math.is_valid(style.offset[2]) and style.offset[2]) or 0
						style.offset[3] = (Math.is_valid(style.offset[3]) and style.offset[3]) or 0
					end
				}
			}
		},
		content = {
			show_scroller = true,
			scrollbar_progress = 0,
			active = true
		},
		style = {
			background = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				color = {
					224,
					0,
					0,
					0
				},
				texture_size = {
					scroller_width - element_settings.spacing,
					element_settings.window_height + element_settings.filter_height
				},
				offset = {
					0,
					-element_settings.spacing - element_settings.filter_height,
					0
				}
			},
			border = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					scroller_width - element_settings.spacing,
					element_settings.window_height + element_settings.filter_height
				},
				offset = {
					element_settings.spacing,
					-element_settings.spacing - element_settings.filter_height,
					-1
				}
			},
			inner_scroller = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					scroller_width - 4,
					size_y
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-1,
					-element_settings.spacing - element_settings.filter_height,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local function create_level_filter_entry_func(level, unlocked)
	local label_distance = element_settings.window_width / 4
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
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					texture_id = "texture_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "background_border",
					texture_id = "texture_id"
				},
				{
					style_id = "level_name",
					pass_type = "text",
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
					end
				},
				{
					style_id = "level_name_locked",
					pass_type = "text",
					text_id = "level_name_id",
					content_check_function = function (content, style)
						return not content.unlocked
					end
				}
			}
		},
		content = {
			texture_id = "rect_masked",
			button_hotspot = {},
			level_name_id = level_name,
			level = level,
			unlocked = unlocked
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				base_color = {
					255,
					0,
					0,
					0
				},
				selection_color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing - scroller_width,
					element_settings.filter_height
				},
				offset = {
					element_settings.spacing,
					0,
					1
				}
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing - scroller_width + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2
				},
				offset = {
					0,
					element_settings.spacing,
					0
				}
			},
			level_name = {
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2
				}
			},
			level_name_locked = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = false,
				font_size = 28,
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local function create_difficulty_filter_entry_func(difficulty, offset_y)
	local label_distance = element_settings.window_width / 4
	local difficulty_name = nil
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
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "rect",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					pass_type = "rect",
					style_id = "background_border"
				},
				{
					style_id = "difficulty_name",
					pass_type = "text",
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
					end
				},
				{
					style_id = "difficulty_name_locked",
					pass_type = "text",
					text_id = "difficulty_name_id",
					content_check_function = function (content, style)
						return not content.unlocked
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			difficulty_name_id = difficulty_name,
			difficulty = difficulty,
			unlocked = unlocked
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				base_color = {
					255,
					0,
					0,
					0
				},
				selection_color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height
				},
				offset = {
					0,
					0,
					1
				}
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0
				}
			},
			difficulty_name = {
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2
				}
			},
			difficulty_name_locked = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = false,
				font_size = 28,
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			offset_y,
			0
		}
	}
end

local function create_lobby_filter_entry_func(lobby_filter, offset_y)
	local label_distance = element_settings.window_width / 4

	return {
		scenegraph_id = "filter_lobby_entry_anchor",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "rect",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					pass_type = "rect",
					style_id = "background_border"
				},
				{
					style_id = "lobby_filter_name",
					pass_type = "text",
					text_id = "lobby_filter_name_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			lobby_filter_name_id = Localize(lobby_filter),
			lobby_filter = lobby_filter
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				base_color = {
					255,
					0,
					0,
					0
				},
				selection_color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height
				},
				size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height
				},
				offset = {
					0,
					0,
					1
				}
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0
				}
			},
			lobby_filter_name = {
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			offset_y,
			0
		}
	}
end

local function create_distance_filter_entry_func(distance, offset_y)
	local label_distance = element_settings.window_width / 4

	return {
		scenegraph_id = "filter_distance_entry_anchor",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "rect",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.color = style.selection_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					pass_type = "rect",
					style_id = "background_border"
				},
				{
					style_id = "distance_name",
					pass_type = "text",
					text_id = "distance_name_id",
					content_change_function = function (content, style)
						if content.selected or content.button_hotspot.is_hover then
							style.text_color = style.selection_color
						else
							style.text_color = style.base_color
						end
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			distance_name_id = Localize(distance),
			distance = distance
		},
		style = {
			background = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				base_color = {
					255,
					0,
					0,
					0
				},
				selection_color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing,
					element_settings.filter_height
				},
				offset = {
					0,
					0,
					1
				}
			},
			background_border = {
				vertical_alignment = "top",
				color = {
					255,
					96,
					96,
					96
				},
				texture_size = {
					label_distance - element_settings.spacing + element_settings.spacing * 2,
					element_settings.filter_height + element_settings.spacing * 2
				},
				offset = {
					-element_settings.spacing,
					element_settings.spacing,
					0
				}
			},
			distance_name = {
				localize = false,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				base_color = Colors.get_color_table_with_alpha("font_default", 255),
				selection_color = Colors.get_color_table_with_alpha("black", 224),
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			offset_y,
			0
		}
	}
end

local function create_lobby_entry_func(offset_y, lobby_data, flag_index, joinable, completed_difficulty_index)
	local host_name = (PLATFORM == "win32" and (lobby_data.unique_server_name or lobby_data.host)) or lobby_data.name or "UNKNOWN"
	local num_players = lobby_data.num_players
	local country_code = lobby_data.country_code
	local game_mode_id = lobby_data.game_mode
	local game_mode = (PLATFORM == "ps4" and game_mode_id) or NetworkLookup.game_modes[tonumber(game_mode_id)]
	local weave_name = lobby_data.weave_name
	local difficulty = lobby_data.difficulty or "UNKNOWN"
	local difficulty_settings = DifficultySettings[difficulty]

	if difficulty_settings then
		local display_name = difficulty_settings.display_name
		difficulty = Localize(display_name)
	end

	local level_image = "any_small_image"
	local selected_level_name = lobby_data.selected_level_key

	if game_mode == "weave" and weave_name ~= "" then
		level_image = "weaves_small_image"
		local weave_template = WeaveSettings.templates[weave_name]
		local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)

		if lobby_data.quick_game == "true" then
			selected_level_name = (weave_template and Localize(weave_template.display_name)) or Localize("start_game_window_weave_quickplay_title")
		else
			selected_level_name = weave_index .. ". " .. Localize(weave_template.display_name)
		end
	elseif selected_level_name then
		local level_settings = LevelSettings[selected_level_name]
		selected_level_name = Localize(level_settings.display_name or "UNKNOWN")
		level_image = lobby_data.selected_level_key .. "_small_image"

		if not UIAtlasHelper.has_texture_by_name(level_image) then
			level_image = "any_small_image"
		end
	else
		selected_level_name = "UNKNOWN"
	end

	local current_level_name = lobby_data.level_key

	if current_level_name then
		local level_settings = LevelSettings[current_level_name]
		current_level_name = Localize(level_settings.display_name or "UNKNOWN")
	else
		current_level_name = "UNKNOWN"
	end

	local country_code = (lobby_data.country_code and string.lower(lobby_data.country_code)) or Localize("lb_unknown")
	local flag_size = {
		30,
		50
	}
	local flag_name = nil

	if UIAtlasHelper.has_texture_by_name(country_code) then
		local flag_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(country_code)
		flag_size = {
			flag_settings.size[1] * 1.5,
			flag_settings.size[2] * 1.5
		}
		flag_name = country_code
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
					style_id = "background",
					pass_type = "hotspot",
					content_id = "lobby_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return not content.selected and not Managers.matchmaking:is_game_matchmaking()
					end
				},
				{
					style_id = "lock_icon",
					texture_id = "lock_icon_id",
					pass_type = "texture",
					content_check_function = function (content, style)
						return not content.joinable
					end,
					content_change_function = function (content, style)
						if content.selected or content.lobby_hotspot.is_hover then
							style.color = style.selected_color
						else
							style.color = style.base_color
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "lock_icon_shadow",
					texture_id = "lock_icon_id",
					content_check_function = function (content, style)
						return not content.selected and not content.lobby_hotspot.is_hover and not content.joinable
					end
				},
				{
					pass_type = "texture",
					style_id = "selected_background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return (content.selected or content.lobby_hotspot.is_hover) and not Managers.matchmaking:is_game_matchmaking()
					end
				},
				{
					pass_type = "texture",
					style_id = "disabled_background",
					texture_id = "background_id",
					content_check_function = function (content, style)
						return Managers.matchmaking:is_game_matchmaking()
					end
				},
				{
					style_id = "host_name",
					pass_type = "text",
					text_id = "host_name"
				},
				{
					style_id = "selected_level_name",
					pass_type = "text",
					text_id = "selected_level_name",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "selected_level_name_shadow",
					pass_type = "text",
					text_id = "selected_level_name",
					content_check_function = function (content, style)
						return content.joinable or (not content.selected and not content.lobby_hotspot.is_hover)
					end
				},
				{
					pass_type = "texture",
					style_id = "level_image",
					texture_id = "level_image_id",
					content_check_function = function (content, style)
						return content.level_image_id
					end
				},
				{
					pass_type = "texture",
					style_id = "flag",
					texture_id = "flag_id",
					content_check_function = function (content)
						return content.flag_id
					end
				},
				{
					style_id = "no_flag",
					pass_type = "text",
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
					end
				},
				{
					style_id = "no_flag_shadow",
					pass_type = "text",
					text_id = "no_flag_id",
					content_check_function = function (content, style)
						return (content.joinable or (not content.selected and not content.lobby_hotspot.is_hover)) and not content.flag_id
					end
				},
				{
					style_id = "difficulty",
					pass_type = "text",
					text_id = "difficulty_id",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "num_players",
					pass_type = "text",
					text_id = "num_players_id",
					content_change_function = function (content, style)
						if content.joinable then
							style.text_color = style.joinable_color
						elseif content.selected or content.lobby_hotspot.is_hover then
							style.text_color = style.selected_unjoinable_color
						else
							style.text_color = style.base_color
						end
					end
				},
				{
					style_id = "difficulty_shadow",
					pass_type = "text",
					text_id = "difficulty_id",
					content_check_function = function (content, style)
						return content.joinable or (not content.selected and not content.lobby_hotspot.is_hover)
					end
				},
				{
					style_id = "num_players_shadow",
					pass_type = "text",
					text_id = "num_players_id",
					content_check_function = function (content, style)
						return content.joinable or (not content.selected and not content.lobby_hotspot.is_hover)
					end
				}
			}
		},
		content = {
			frame_id = "rect_masked",
			selected = false,
			background_id = "rect_masked",
			lock_icon_id = "lobby_icon_lock",
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
			joinable = joinable
		},
		style = {
			background = {
				color = {
					96,
					0,
					0,
					0
				},
				size = {
					element_settings.width,
					element_settings.height
				},
				offset = {
					0,
					0,
					0
				}
			},
			selected_background = {
				color = Colors.get_color_table_with_alpha("font_default", 96),
				size = {
					element_settings.width,
					element_settings.height
				},
				offset = {
					0,
					0,
					0
				}
			},
			disabled_background = {
				color = {
					196,
					0,
					0,
					0
				},
				size = {
					element_settings.width,
					element_settings.height
				},
				offset = {
					0,
					0,
					11
				}
			},
			lock_icon = {
				vertical_alignment = "center",
				masked = true,
				horizontal_alignment = "left",
				color = Colors.get_color_table_with_alpha("font_default", 96),
				base_color = Colors.get_color_table_with_alpha("font_default", 96),
				selected_color = {
					255,
					0,
					0,
					0
				},
				texture_size = {
					29,
					42
				},
				offset = {
					580,
					-0,
					3
				}
			},
			lock_icon_shadow = {
				vertical_alignment = "center",
				masked = true,
				horizontal_alignment = "left",
				color = {
					255,
					0,
					0,
					0
				},
				texture_size = {
					29,
					42
				},
				offset = {
					582,
					-0 - 2,
					2
				}
			},
			host_name = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				localize = false,
				font_size = 22,
				font_type = "arial_masked",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					110 + element_settings.spacing,
					0,
					2
				}
			},
			selected_level_name = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 32,
				horizontal_alignment = "left",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					255,
					255,
					255
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					110 + element_settings.spacing,
					-5,
					2
				}
			},
			selected_level_name_shadow = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				localize = false,
				font_size = 32,
				font_type = "hell_shark_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					110 + element_settings.spacing + 2,
					-7,
					1
				}
			},
			host_name_shadow = {
				vertical_alignment = "top",
				localize = false,
				font_size = 26,
				horizontal_alignment = "left",
				font_type = "arial_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					132,
					-4,
					1
				}
			},
			difficulty = {
				vertical_alignment = "center",
				localize = false,
				font_size = 26,
				horizontal_alignment = "center",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					255,
					255,
					255
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					315,
					-4,
					2
				}
			},
			difficulty_shadow = {
				vertical_alignment = "center",
				localize = false,
				font_size = 26,
				horizontal_alignment = "center",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					317,
					-6,
					1
				}
			},
			num_players = {
				vertical_alignment = "center",
				localize = false,
				font_size = 26,
				horizontal_alignment = "left",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					255,
					255,
					255
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					1090,
					-4,
					2
				}
			},
			num_players_shadow = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 26,
				font_type = "hell_shark_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					1092,
					-6,
					1
				}
			},
			level_image = {
				vertical_alignment = "center",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					(element_settings.height - 10) * 1.6724137931034482,
					element_settings.height - 10
				},
				offset = {
					10,
					0,
					1
				}
			},
			level_image_frame = {
				vertical_alignment = "center",
				masked = true,
				color = {
					255,
					0,
					0,
					0
				},
				texture_size = {
					(element_settings.height - 10) * 1.6724137931034482 + 4,
					element_settings.height - 10 + 4
				},
				offset = {
					8,
					0,
					0
				}
			},
			flag = {
				vertical_alignment = "center",
				masked = true,
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = flag_size,
				offset = {
					105,
					0,
					10
				}
			},
			flag_shadow = {
				vertical_alignment = "center",
				color = {
					255,
					0,
					0,
					0
				},
				texture_size = {
					90,
					45
				},
				offset = {
					659,
					-4,
					9
				}
			},
			no_flag = {
				vertical_alignment = "center",
				localize = false,
				font_size = 26,
				horizontal_alignment = "center",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					255,
					255,
					255
				},
				selected_unjoinable_color = {
					255,
					0,
					0,
					0
				},
				base_color = {
					255,
					128,
					128,
					128
				},
				joinable_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					110,
					-5,
					10
				}
			},
			no_flag_shadow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				localize = false,
				font_size = 26,
				font_type = "hell_shark_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					112,
					-7,
					9
				}
			}
		},
		offset = {
			0,
			offset_y,
			0
		}
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
					texture_id = "background_id"
				}
			}
		},
		content = {
			background_id = "rect_masked"
		},
		style = {
			background = {
				color = {
					96,
					0,
					0,
					0
				},
				size = {
					element_settings.width,
					element_settings.height
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
			offset_y,
			0
		}
	}
end

local function create_details_information(scenegraph_id, game_type_scenegraph_id, status_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "rounded_background",
					style_id = "background"
				},
				{
					pass_type = "rounded_background",
					style_id = "inner_background"
				},
				{
					style_id = "game_type_label",
					pass_type = "text",
					text_id = "game_type_label_id"
				},
				{
					style_id = "status_label",
					pass_type = "text",
					text_id = "status_label_id"
				},
				{
					style_id = "game_type",
					pass_type = "text",
					text_id = "game_type_id"
				},
				{
					style_id = "status",
					pass_type = "text",
					text_id = "status_id"
				}
			}
		},
		content = {
			game_type_label_id = "lb_game_type",
			status_label_id = "lb_status",
			game_type_id = "lb_game_type_none",
			status_id = "lb_in_inn"
		},
		style = {
			background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				corner_radius = 10,
				color = {
					128,
					60,
					60,
					60
				},
				offset = {
					0,
					0,
					1
				},
				rect_size = {
					400,
					100
				}
			},
			inner_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				corner_radius = 10,
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					0,
					2,
					1
				},
				rect_size = {
					396,
					96
				}
			},
			game_type_label = {
				vertical_alignment = "bottom",
				upper_case = true,
				localize = true,
				horizontal_alignment = "left",
				font_size = 26,
				font_type = "hell_shark",
				text_color = {
					255,
					128,
					128,
					128
				},
				offset = {
					75,
					50,
					2
				}
			},
			status_label = {
				vertical_alignment = "bottom",
				upper_case = true,
				localize = true,
				horizontal_alignment = "left",
				font_size = 26,
				font_type = "hell_shark",
				text_color = {
					255,
					128,
					128,
					128
				},
				offset = {
					75,
					15,
					2
				}
			},
			game_type = {
				font_size = 26,
				localize = true,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark",
				scenegraph_id = game_type_scenegraph_id,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-75,
					50,
					2
				}
			},
			status = {
				font_size = 26,
				localize = true,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark",
				scenegraph_id = status_scenegraph_id,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-75,
					15,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

local function create_objective(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text ~= "tutorial_no_text"
					end
				}
			}
		},
		content = {
			text = "-",
			icon = "trial_gem",
			background = "chest_upgrade_fill_glow"
		},
		style = {
			background = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					49,
					44
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1
				}
			},
			text = {
				word_wrap = true,
				localize = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1] - 60,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					50,
					2,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				localize = true,
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				size = {
					size[1] - 60,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					52,
					0,
					1
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

local lobby_browser_description_style = {
	font_size = 50,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = false,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		-10,
		2
	}
}
local base_widget_definition = {
	background = UIWidgets.create_simple_rect("lobby_browser_window", {
		50,
		0,
		0,
		0
	}, -10),
	lobby_browser_background = UIWidgets.create_rect_with_outer_frame("lobby_browser_background", scenegraph_definition.lobby_browser_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	lobby_browser_title = UIWidgets.create_simple_text(Localize("menu_title_lobby_browser"), "lobby_browser_background", nil, nil, lobby_browser_description_style),
	custom_game_divider = UIWidgets.create_simple_texture("divider_01_top", "lobby_browser_divider"),
	frame = create_lobby_browser_frame("lobby_browser_frame"),
	filter_frame = create_filter_frame("filter_base")
}
local hero_icons = {}

for i = 1, #ProfilePriority, 1 do
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
	108 * hero_entry_size_scale
}
local weave_hero_entry_size_scale = 0.6
local weave_hero_entry_width = 96 * weave_hero_entry_size_scale
local weave_hero_entry_height = 112 * weave_hero_entry_size_scale
local weave_hero_entry_spacing = 5 * weave_hero_entry_size_scale
local weave_hero_entry_frame_size = {
	86 * weave_hero_entry_size_scale,
	108 * weave_hero_entry_size_scale
}
local wind_name_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_name_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local weave_level_name_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	},
	size = {
		350,
		scenegraph_definition.weave_details_level_name[2]
	}
}
local locked_reason_style = {
	font_size = 24,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = {
		255,
		255,
		62,
		62
	},
	offset = {
		0,
		0,
		2
	}
}
local mutator_title_text_style = {
	font_size = 28,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		-5,
		2
	}
}
local mutator_description_text_style = {
	font_size = 20,
	use_shadow = true,
	localize = true,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local objective_title_text_style = {
	font_size = 24,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local details_widget_definition = {
	level_image_frame = UIWidgets.create_simple_texture("map_frame_00", "details_level_frame"),
	level_image = UIWidgets.create_simple_texture("level_image_any", "details_level_image"),
	level_name = UIWidgets.create_simple_text(" ", "details_level_name", nil, nil, level_name_style),
	locked_reason = UIWidgets.create_simple_text("tutorial_no_text", "details_locked_reason", nil, nil, locked_reason_style),
	details_information = create_details_information("details_level_info", "details_game_type", "details_status"),
	hero_tabs = UIWidgets.create_icon_selector("details_hero_tabs", {
		hero_entry_width,
		hero_entry_height
	}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true)
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
		weave_hero_entry_height
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
	details_information = create_details_information("weave_details_level_info", "weave_game_type", "weave_status")
}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	base_widget_definition = base_widget_definition,
	details_widget_definition = details_widget_definition,
	weave_details_widget_definition = weave_details_widget_definition,
	create_lobby_entry_func = create_lobby_entry_func,
	create_empty_lobby_entry_func = create_empty_lobby_entry_func,
	create_level_filter_entry_func = create_level_filter_entry_func,
	create_difficulty_filter_entry_func = create_difficulty_filter_entry_func,
	create_lobby_filter_entry_func = create_lobby_filter_entry_func,
	create_distance_filter_entry_func = create_distance_filter_entry_func,
	create_level_filter_scroller_func = create_level_filter_scroller_func,
	element_settings = element_settings,
	widget_definition = widget_definition
}
