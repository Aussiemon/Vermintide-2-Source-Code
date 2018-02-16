require("scripts/settings/controller_settings")
require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	screen = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "fit",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	loading_background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
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
	skip_input = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			0,
			15,
			500
		}
	},
	skip_input_text_1 = {
		vertical_alignment = "bottom",
		parent = "skip_input",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			30,
			2,
			5
		}
	},
	skip_input_text_2 = {
		vertical_alignment = "bottom",
		parent = "skip_input",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			0,
			2,
			5
		}
	},
	skip_input_text_3 = {
		vertical_alignment = "bottom",
		parent = "skip_input",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			110,
			0,
			5
		}
	},
	skip_input_icon = {
		vertical_alignment = "bottom",
		parent = "skip_input",
		horizontal_alignment = "left",
		size = {
			30,
			30
		},
		position = {
			0,
			10,
			5
		}
	},
	skip_input_icon_bar = {
		vertical_alignment = "center",
		parent = "skip_input_icon",
		horizontal_alignment = "center",
		size = {
			36,
			36
		},
		position = {
			0,
			0,
			-1
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			501
		}
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	gamma_header_text = {
		vertical_alignment = "top",
		parent = "gamma_image",
		horizontal_alignment = "center",
		position = {
			0,
			100,
			10
		},
		size = {
			800,
			40
		}
	},
	gamma_image = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			100,
			-10
		},
		size = {
			285,
			285
		}
	},
	gamma_correction_image = {
		vertical_alignment = "bottom",
		parent = "gamma_image",
		horizontal_alignment = "center",
		position = {
			0,
			-140,
			10
		},
		size = {
			420,
			50
		}
	},
	gamma_stepper = {
		vertical_alignment = "center",
		parent = "gamma_correction_image",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			500,
			50
		}
	},
	gamma_info_text = {
		vertical_alignment = "bottom",
		parent = "gamma_correction_image",
		horizontal_alignment = "center",
		position = {
			0,
			-130,
			10
		},
		size = {
			1300,
			50
		}
	},
	apply_button = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			45,
			10
		},
		size = {
			370,
			70
		}
	},
	sound_presentation_image = {
		vertical_alignment = "center",
		parent = "gamma_image",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			166,
			76
		}
	},
	sound_range_presentation_image = {
		vertical_alignment = "center",
		parent = "sound_presentation_image",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			160,
			160
		}
	},
	sound_panning_option_1 = {
		vertical_alignment = "center",
		parent = "gamma_stepper",
		horizontal_alignment = "center",
		position = {
			-120,
			0,
			10
		},
		size = {
			218,
			203
		}
	},
	sound_panning_option_1_glow = {
		vertical_alignment = "center",
		parent = "sound_panning_option_1",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			218,
			203
		}
	},
	sound_panning_option_2 = {
		vertical_alignment = "center",
		parent = "gamma_stepper",
		horizontal_alignment = "center",
		position = {
			120,
			0,
			10
		},
		size = {
			218,
			203
		}
	},
	sound_panning_option_2_glow = {
		vertical_alignment = "center",
		parent = "sound_panning_option_2",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			218,
			203
		}
	},
	sound_range_option_1 = {
		vertical_alignment = "center",
		parent = "sound_panning_option_1",
		horizontal_alignment = "center",
		position = {
			30,
			0,
			1
		},
		size = {
			300,
			200
		}
	},
	sound_range_option_1_glow = {
		vertical_alignment = "center",
		parent = "sound_range_option_1",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			300,
			200
		}
	},
	sound_range_option_2 = {
		vertical_alignment = "center",
		parent = "sound_panning_option_2",
		horizontal_alignment = "center",
		position = {
			20,
			0,
			1
		},
		size = {
			170,
			170
		}
	},
	sound_range_option_2_glow = {
		vertical_alignment = "center",
		parent = "sound_range_option_2",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			170,
			170
		}
	},
	console_input_text_1 = {
		vertical_alignment = "bottom",
		parent = "background",
		horizontal_alignment = "right",
		position = {
			-110,
			85,
			10
		},
		size = {
			300,
			40
		}
	},
	console_input_icon_root_1 = {
		vertical_alignment = "center",
		parent = "console_input_text_1",
		horizontal_alignment = "left",
		position = {
			-25,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	console_input_icon_1 = {
		vertical_alignment = "center",
		parent = "console_input_icon_root_1",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			40,
			40
		}
	},
	console_input_text_2 = {
		vertical_alignment = "center",
		parent = "console_input_text_1",
		horizontal_alignment = "left",
		position = {
			0,
			-50,
			1
		},
		size = {
			300,
			40
		}
	},
	console_input_icon_root_2 = {
		vertical_alignment = "center",
		parent = "console_input_text_2",
		horizontal_alignment = "left",
		position = {
			-25,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	console_input_icon_2 = {
		vertical_alignment = "center",
		parent = "console_input_icon_root_2",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			40,
			40
		}
	}
}

local function create_button_textures()
	local button_texture_data = ButtonTextureByName(nil, "win32")
	local textures = {}

	for i = 1, #button_texture_data, 1 do
		textures[i] = button_texture_data[i].texture
	end

	return textures
end

skip_widget = {
	scenegraph_id = "skip_input",
	element = {
		passes = {
			{
				texture_id = "icon_textures",
				style_id = "keyboard_input_icon",
				pass_type = "multi_texture",
				content_check_function = function (content)
					return not content.input_icon
				end
			},
			{
				style_id = "input_text_1",
				pass_type = "text",
				text_id = "input_text_1"
			},
			{
				style_id = "input_text_2",
				pass_type = "text",
				text_id = "input_text_2"
			},
			{
				style_id = "input_text_3",
				pass_type = "text",
				text_id = "input_text_3",
				content_check_function = function (content)
					return not content.input_icon
				end
			},
			{
				pass_type = "texture",
				style_id = "input_icon",
				texture_id = "input_icon",
				content_check_function = function (content)
					return content.input_icon
				end
			},
			{
				pass_type = "gradient_mask_texture",
				style_id = "input_icon_bar",
				texture_id = "input_icon_bar",
				content_check_function = function (content)
					return not content.using_keyboard
				end
			},
			{
				style_id = "hold_bar",
				pass_type = "rect",
				content_check_function = function (content)
					return content.using_keyboard
				end
			}
		}
	},
	content = {
		input_icon_bar = "controller_hold_bar",
		input_text_3 = "",
		using_keyboard = true,
		input_text_1 = "",
		icon_textures = create_button_textures(),
		input_text_2 = Localize("to_skip")
	},
	style = {
		hold_bar = {
			scenegraph_id = "skip_input_icon",
			color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				3,
				-12,
				0
			},
			size = {
				0,
				8
			}
		},
		keyboard_input_icon = {
			scenegraph_id = "skip_input_icon",
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			tile_sizes = {
				[2] = {
					8,
					36
				}
			},
			texture_sizes = {
				{
					20,
					36
				},
				{
					8,
					36
				},
				{
					20,
					36
				}
			},
			offset = {
				0,
				-5,
				0
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		input_icon = {
			scenegraph_id = "skip_input_icon",
			color = {
				255,
				255,
				255,
				255
			}
		},
		input_icon_bar = {
			scenegraph_id = "skip_input_icon_bar",
			gradient_threshold = 0,
			color = {
				255,
				255,
				255,
				255
			}
		},
		input_text_1 = {
			scenegraph_id = "skip_input_text_1",
			font_size = 36,
			word_wrap = false,
			pixel_perfect = true,
			horizontal_alignment = "right",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255)
		},
		input_text_2 = {
			scenegraph_id = "skip_input_text_2",
			font_size = 36,
			word_wrap = false,
			pixel_perfect = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255)
		},
		input_text_3 = {
			scenegraph_id = "skip_input_text_3",
			word_wrap = false,
			font_size = 24,
			pixel_perfect = true,
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				5,
				0
			}
		}
	}
}
local dead_space_filler_widget = {
	scenegraph_id = "dead_space_filler",
	element = {
		passes = {
			{
				pass_type = "rect"
			}
		}
	},
	content = {},
	style = {
		color = {
			255,
			0,
			0,
			0
		}
	}
}

local function create_gamma_widget()
	return {
		scenegraph_id = "gamma_image",
		element = {
			passes = {
				{
					style_id = "value_text",
					pass_type = "text",
					text_id = "value_text"
				},
				{
					style_id = "gamma_header_text",
					pass_type = "text",
					text_id = "gamma_header_text"
				},
				{
					style_id = "gamma_info_text",
					pass_type = "text",
					text_id = "gamma_info_text"
				},
				{
					pass_type = "texture",
					style_id = "gamepad_navigation_icon",
					texture_id = "gamepad_navigation_icon",
					content_check_function = function (content)
						return content.gamepad_active
					end
				},
				{
					pass_type = "texture",
					style_id = "gamepad_accept_icon",
					texture_id = "gamepad_accept_icon",
					content_check_function = function (content)
						return content.gamepad_active
					end
				},
				{
					style_id = "gamepad_navigation_text",
					pass_type = "text",
					text_id = "gamepad_navigation_text",
					content_check_function = function (content)
						return content.gamepad_active
					end
				},
				{
					style_id = "gamepad_accept_text",
					pass_type = "text",
					text_id = "gamepad_accept_text",
					content_check_function = function (content)
						return content.gamepad_active
					end
				}
			}
		},
		content = {
			gamma_header_text = "startup_settings_gamma_header",
			gamma_info_text = "startup_settings_gamma_desc",
			value_text = 0,
			gamepad_navigation_icon = "xbone_button_icon_a",
			gamepad_accept_icon = "xbone_button_icon_a",
			gamepad_accept_text = "- " .. Localize("input_description_confirm"),
			gamepad_navigation_text = "- " .. Localize("input_description_change")
		},
		style = {
			gamepad_accept_icon = {
				scenegraph_id = "console_input_icon_2"
			},
			gamepad_navigation_icon = {
				scenegraph_id = "console_input_icon_1"
			},
			gamepad_navigation_text = {
				vertical_alignment = "center",
				scenegraph_id = "console_input_text_1",
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			gamepad_accept_text = {
				vertical_alignment = "center",
				scenegraph_id = "console_input_text_2",
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			value_text = {
				vertical_alignment = "bottom",
				localize = false,
				horizontal_alignment = "left",
				font_size = 32,
				dynamic_font = true,
				font_type = "hell_shark_header",
				offset = {
					120.5,
					-70,
					0
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				hover_color = Colors.get_color_table_with_alpha("font_button_normal", 255)
			},
			gamma_header_text = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 42,
				font_type = "hell_shark_header",
				scenegraph_id = "gamma_header_text",
				text_color = Colors.get_color_table_with_alpha("font_title", 255)
			},
			gamma_info_text = {
				vertical_alignment = "center",
				scenegraph_id = "gamma_info_text",
				localize = true,
				horizontal_alignment = "center",
				font_size = 24,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255)
			}
		}
	}
end

local header_text_style = {
	vertical_alignment = "center",
	upper_case = true,
	localize = true,
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	scenegraph_id = "gamma_header_text",
	text_color = Colors.get_color_table_with_alpha("font_title", 255)
}
local description_text_style = {
	vertical_alignment = "center",
	scenegraph_id = "gamma_info_text",
	localize = true,
	horizontal_alignment = "center",
	font_size = 24,
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255)
}
local sound_presentation_image_color = Colors.get_color_table_with_alpha("font_button_normal", 255)
local gamma_widget_definitions = {
	gamma_adjuster = create_gamma_widget(),
	gamma_image = UIWidgets.create_background_with_frame("gamma_image", scenegraph_definition.gamma_image.size, "gamma_settings_image_01", "button_frame_01"),
	gamma_correction_image = UIWidgets.create_background_with_frame("gamma_correction_image", scenegraph_definition.gamma_correction_image.size, "gamma_settings_image_02", "button_frame_01"),
	gamma_stepper = UIWidgets.create_default_stepper("gamma_stepper", scenegraph_definition.gamma_stepper.size),
	gamma_image_corners = UIWidgets.create_frame("gamma_image", scenegraph_definition.gamma_image.size, "frame_corner_detail_01", 10)
}
local panning_widget_definitions = {
	stepper = UIWidgets.create_default_stepper("gamma_stepper", scenegraph_definition.gamma_stepper.size),
	sound_presentation_image = UIWidgets.create_simple_texture("sound_setting_icon_01", "sound_presentation_image", nil, nil, sound_presentation_image_color),
	sound_option_1 = UIWidgets.create_simple_texture("sound_setting_icon_03", "sound_panning_option_1"),
	sound_option_1_glow = UIWidgets.create_simple_texture("sound_setting_icon_03_glow", "sound_panning_option_1_glow"),
	sound_option_button_1 = UIWidgets.create_simple_hotspot("sound_panning_option_1"),
	sound_option_2 = UIWidgets.create_simple_texture("sound_setting_icon_04", "sound_panning_option_2"),
	sound_option_2_glow = UIWidgets.create_simple_texture("sound_setting_icon_04_glow", "sound_panning_option_2_glow"),
	sound_option_button_2 = UIWidgets.create_simple_hotspot("sound_panning_option_2"),
	header = UIWidgets.create_simple_text("startup_settings_panning_rule_header", "gamma_header_text", nil, nil, header_text_style),
	description = UIWidgets.create_simple_text("startup_settings_panning_rule_desc", "gamma_info_text", nil, nil, description_text_style)
}
local dynamic_range_widget_definitions = {
	stepper = UIWidgets.create_default_stepper("gamma_stepper", scenegraph_definition.gamma_stepper.size),
	sound_presentation_image = UIWidgets.create_simple_texture("sound_setting_icon_05", "sound_range_presentation_image", nil, nil, sound_presentation_image_color),
	header = UIWidgets.create_simple_text("startup_settings_dynamic_range_header", "gamma_header_text", nil, nil, header_text_style),
	description = UIWidgets.create_simple_text("startup_settings_dynamic_range_desc", "gamma_info_text", nil, nil, description_text_style)
}
local done_button = UIWidgets.create_default_button("apply_button", scenegraph_definition.apply_button.size, nil, nil, Localize("input_description_confirm"))
first_time_video = {
	video_name = "video/vermintide_2_prologue_intro",
	sound_start = "vermintide_2_prologue_intro",
	scenegraph_id = "splash_video",
	material_name = "vermintide_2_prologue_intro",
	sound_stop = "Stop_vermintide_2_prologue_intro"
}

local function get_slider_progress(min, max, value)
	local range = max - min
	local norm_value = math.clamp(value, min, max) - min

	return norm_value/range
end

local gamma_value_settings = {
	start_value = 2.2,
	min = 1.5,
	num_decimals = 1,
	max = 5
}
local panning_value_settings = {
	min = 1,
	num_decimals = 0,
	start_value = 1,
	max = 2,
	options = {
		{
			value = "speakers",
			text = Localize("menu_settings_speakers")
		},
		{
			value = "headphones",
			text = Localize("menu_settings_headphones")
		}
	},
	option_index_by_key = {
		headphones = 2,
		speakers = 1
	}
}
local dynamic_range_value_settings = {
	min = 1,
	num_decimals = 0,
	start_value = 3,
	max = 3,
	options = {
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		}
	},
	option_index_by_key = {
		high = 3,
		medium = 2,
		low = 1
	}
}
TitleLoadingUI = class(TitleLoadingUI)
TitleLoadingUI.init = function (self, world, params, force_done)
	if PLATFORM == "win32" then
		Application.set_time_step_policy("no_smoothing", "clear_history", "throttle", 60)
	end

	self.render_settings = {
		snap_pixel_positions = true
	}
	self._world = world
	self._done = false
	self._force_done = force_done
	self._startup_settings_done = false
	self._settings_index = 1
	self._needs_cursor_pop = false
	self._current_inputs = {}
	self._display_startup_settings = params.gamma
	self._trailer = params.trailer

	if not self._trailer and not self._display_startup_settings then
		self._done = true
	end

	Managers.input:create_input_service("title_loading_ui", "TitleLoadingKeyMaps", "TitleLoadingFilters")
	Managers.input:map_device_to_service("title_loading_ui", "keyboard")
	Managers.input:map_device_to_service("title_loading_ui", "mouse")
	Managers.input:map_device_to_service("title_loading_ui", "gamepad")
	self._setup_gui(self)

	return 
end
TitleLoadingUI._setup_gui = function (self)
	self._ui_renderer = UIRenderer.create(self._world, "material", "materials/ui/ui_1080p_splash_screen", "material", "materials/ui/ui_1080p_title_screen", "material", "materials/ui/ui_1080p_common", "material", first_time_video.video_name, "material", "materials/fonts/gw_fonts")

	self._create_elements(self)

	return 
end
TitleLoadingUI._create_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._video_widget = UIWidget.init(UIWidgets.create_splash_video(first_time_video))
	self._skip_widget = UIWidget.init(skip_widget)
	self._dead_space_filler_widget = UIWidget.init(dead_space_filler_widget)
	self._done_button = UIWidget.init(done_button)

	if self._display_startup_settings then
		ShowCursorStack.push()

		self._needs_cursor_pop = true
		local gamma_widgets = {}
		local gamma_widgets_by_name = {}

		for name, widget_definition in pairs(gamma_widget_definitions) do
			local widget = UIWidget.init(widget_definition)
			gamma_widgets[#gamma_widgets + 1] = widget
			gamma_widgets_by_name[name] = widget
		end

		self._gamma_widgets = gamma_widgets
		self._gamma_widgets_by_name = gamma_widgets_by_name
		local panning_widgets = {}
		local panning_widgets_by_name = {}

		for name, widget_definition in pairs(panning_widget_definitions) do
			local widget = UIWidget.init(widget_definition)
			panning_widgets[#panning_widgets + 1] = widget
			panning_widgets_by_name[name] = widget
		end

		self._panning_widgets = panning_widgets
		self._panning_widgets_by_name = panning_widgets_by_name
		local dynamic_range_widgets = {}
		local dynamic_range_widgets_by_name = {}

		for name, widget_definition in pairs(dynamic_range_widget_definitions) do
			local widget = UIWidget.init(widget_definition)
			dynamic_range_widgets[#dynamic_range_widgets + 1] = widget
			dynamic_range_widgets_by_name[name] = widget
		end

		self._dynamic_range_widgets = dynamic_range_widgets
		self._dynamic_range_widgets_by_name = dynamic_range_widgets_by_name

		self.setup_gamma_menu(self)
		self.setup_sound_panning_menu(self)
		self.setup_sound_dynamic_range_menu(self)

		local gamma_adjuster = self._gamma_widgets_by_name.gamma_adjuster
		local texture_data, input_text = self._get_input_gamepad_texture_data(self, "confirm")
		gamma_adjuster.content.gamepad_accept_icon = texture_data.texture
		self._ui_scenegraph.console_input_icon_2.size[1] = texture_data.size[1]
		self._ui_scenegraph.console_input_icon_2.size[2] = texture_data.size[2]
		local platform = PLATFORM
		local texture_data, input_text = ButtonTextureByName("d_horizontal", (platform == "win32" and "xb1") or platform)
		gamma_adjuster.content.gamepad_navigation_icon = texture_data.texture
		self._ui_scenegraph.console_input_icon_1.size[1] = texture_data.size[1]
		self._ui_scenegraph.console_input_icon_1.size[2] = texture_data.size[2]
	else
		self._startup_settings_done = true
	end

	DO_RELOAD = false

	return 
end
DO_RELOAD = true
TitleLoadingUI.setup_gamma_menu = function (self)
	local gamma_stepper = self._gamma_widgets_by_name.gamma_stepper
	local gamma_adjuster = self._gamma_widgets_by_name.gamma_adjuster
	local min = gamma_value_settings.min
	local max = gamma_value_settings.max
	local start_value = gamma_value_settings.start_value
	local value = Application.user_setting("render_settings", "gamma") or start_value
	gamma_stepper.content.setting_text = ""
	gamma_stepper.content.value = value
	local internal_value = get_slider_progress(min, max, value)
	gamma_stepper.content.internal_value = internal_value
	local gamma_adjuster_content = gamma_adjuster.content
	gamma_adjuster_content.value_text = string.format("%.1f", value)

	return 
end
TitleLoadingUI.setup_sound_panning_menu = function (self)
	local stepper = self._panning_widgets_by_name.stepper
	local min = panning_value_settings.min
	local max = panning_value_settings.max
	local start_value = panning_value_settings.start_value
	local options = panning_value_settings.options
	local option_index_by_key = panning_value_settings.option_index_by_key
	local default_value = DefaultUserSettings.get("user_settings", "sound_panning_rule")
	local sound_panning_rule = Application.user_setting("sound_panning_rule") or default_value
	stepper.content.setting_text = ""
	stepper.content.value = sound_panning_rule
	stepper.content.internal_value = start_value

	self._change_sound_panning_display_by_value(self, start_value)

	return 
end
TitleLoadingUI.setup_sound_dynamic_range_menu = function (self)
	local stepper = self._dynamic_range_widgets_by_name.stepper
	local min = dynamic_range_value_settings.min
	local max = dynamic_range_value_settings.max
	local start_value = dynamic_range_value_settings.start_value
	local options = dynamic_range_value_settings.options
	local option_index_by_key = dynamic_range_value_settings.option_index_by_key
	local default_value = DefaultUserSettings.get("user_settings", "dynamic_range_sound")
	local dynamic_range_sound = Application.user_setting("dynamic_range_sound") or default_value
	stepper.content.setting_text = ""
	stepper.content.value = dynamic_range_sound
	stepper.content.internal_value = start_value

	self._change_sound_dynamic_range_display_by_value(self, start_value)

	return 
end
TitleLoadingUI.update = function (self, dt)
	if DO_RELOAD then
		self._create_elements(self)
	end

	if not self._startup_settings_done then
		local gamepad_active = Managers.input:is_device_active("gamepad")
		local settings_index = self._settings_index

		if settings_index == 1 then
			local stepper = self._gamma_widgets_by_name.gamma_stepper
			local change_made = self._handle_stepper_input(self, stepper, gamma_value_settings, gamepad_active, dt)

			if change_made then
				local min = gamma_value_settings.min
				local max = gamma_value_settings.max
				local num_decimals = gamma_value_settings.num_decimals
				local internal_value = stepper.content.internal_value
				local value = math.round_with_precision(min + (max - min)*internal_value, num_decimals or 0)
				stepper.content.value = value
				local gamma_adjuster = self._gamma_widgets_by_name.gamma_adjuster
				local gamma_adjuster_content = gamma_adjuster.content
				gamma_adjuster_content.value_text = string.format("%.1f", value)

				Application.set_render_setting("gamma", value)
			end
		elseif settings_index == 2 then
			local panning_widgets_by_name = self._panning_widgets_by_name
			local stepper = panning_widgets_by_name.stepper
			local change_made = self._handle_stepper_input(self, stepper, panning_value_settings, gamepad_active, dt)

			if change_made then
				local min = panning_value_settings.min
				local max = panning_value_settings.max
				local num_decimals = panning_value_settings.num_decimals
				local internal_value = stepper.content.internal_value
				local index = math.round_with_precision(min + (max - min)*internal_value, num_decimals or 0)
				local options = panning_value_settings.options
				local option = options[index]
				stepper.content.value = option.value

				self._change_sound_panning_display_by_value(self, index)
			else
				for i = 1, 2, 1 do
					local widget_name = "sound_option_button_" .. i
					local widget = panning_widgets_by_name[widget_name]
					local hotspot = widget.content.hotspot

					if hotspot.on_release and not hotspot.is_selected then
						hotspot.on_release = false

						self._change_sound_panning_display_by_value(self, i)

						break
					end
				end
			end
		elseif settings_index == 3 then
			local stepper = self._dynamic_range_widgets_by_name.stepper
			local change_made = self._handle_stepper_input(self, stepper, dynamic_range_value_settings, gamepad_active, dt)

			if change_made then
				local min = dynamic_range_value_settings.min
				local max = dynamic_range_value_settings.max
				local num_decimals = dynamic_range_value_settings.num_decimals
				local internal_value = stepper.content.internal_value
				local index = math.round_with_precision(min + (max - min)*internal_value, num_decimals or 0)
				local options = dynamic_range_value_settings.options
				local option = options[index]
				stepper.content.value = option.value

				self._change_sound_dynamic_range_display_by_value(self, index)
			end
		end

		self._update_continue_button(self, gamepad_active, dt)
	else
		self._update_input_text(self, dt)
		self._update_input(self, dt)
	end

	self._render(self, dt)

	return 
end
TitleLoadingUI._change_sound_panning_display_by_value = function (self, value)
	local min = panning_value_settings.min
	local max = panning_value_settings.max
	local internal_value = get_slider_progress(min, max, value)
	local options = panning_value_settings.options
	local option = options[value]
	local option_value = option.value
	local panning_widgets_by_name = self._panning_widgets_by_name
	local stepper = panning_widgets_by_name.stepper
	stepper.content.value = option_value
	stepper.content.internal_value = internal_value

	for i = 1, 2, 1 do
		local widget_name = "sound_option_" .. i
		local glow_widget_name = widget_name .. "_glow"
		local widget = panning_widgets_by_name[glow_widget_name]
		widget.content.visible = value == i
		local button_widget_name = "sound_option_button_" .. i
		local button_widget = panning_widgets_by_name[button_widget_name]
		local hotspot = button_widget.content.hotspot
		hotspot.is_selected = i == value
	end

	panning_widgets_by_name.sound_presentation_image.content.texture_id = "sound_setting_icon_0" .. value

	return 
end
TitleLoadingUI._change_sound_dynamic_range_display_by_value = function (self, value)
	local min = dynamic_range_value_settings.min
	local max = dynamic_range_value_settings.max
	local internal_value = get_slider_progress(min, max, value)
	local options = dynamic_range_value_settings.options
	local option = options[value]
	local option_value = option.value
	local option_text = option.text
	local dynamic_range_widgets_by_name = self._dynamic_range_widgets_by_name
	local stepper = dynamic_range_widgets_by_name.stepper
	stepper.content.setting_text = option_text
	stepper.content.value = option_value
	stepper.content.internal_value = internal_value
	dynamic_range_widgets_by_name.sound_presentation_image.content.texture_id = "sound_setting_icon_0" .. value + 4

	return 
end
TitleLoadingUI._update_continue_button = function (self, gamepad_active, dt)
	self._animate_button(self, self._done_button, dt)

	local input_service = Managers.input:get_service("title_loading_ui")

	if (gamepad_active and input_service.get(input_service, "confirm")) or self._done_button.content.button_hotspot.on_release then
		self._done_button.content.button_hotspot.on_release = nil
		local settings_index = self._settings_index

		if settings_index == 1 then
			local gamma_stepper = self._gamma_widgets_by_name.gamma_stepper
			local content = gamma_stepper.content
			local gamma = content.value

			Application.set_user_setting("render_settings", "gamma", gamma)
		elseif settings_index == 2 then
			local stepper = self._panning_widgets_by_name.stepper
			local content = stepper.content
			local value = content.value

			Application.set_user_setting("sound_panning_rule", value)
		elseif settings_index == 3 then
			local stepper = self._dynamic_range_widgets_by_name.stepper
			local content = stepper.content
			local value = content.value

			Application.set_user_setting("dynamic_range_sound", value)
		end

		local end_index = 3

		if settings_index == end_index then
			SaveData.gamma_corrected = true

			Managers.save:auto_save(SaveFileName, SaveData)

			if PLATFORM == "win32" then
				Application.save_user_settings()
			end

			self._startup_settings_done = true
			self._needs_cursor_pop = false

			ShowCursorStack.pop()
		else
			self._settings_index = settings_index + 1
		end
	end

	return 
end
TitleLoadingUI._animate_button = function (self, widget, dt)
	local ui_renderer = self.ui_renderer
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt*input_speed, 1)
	else
		input_progress = math.max(input_progress - dt*input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt*speed, 1)
	else
		hover_progress = math.max(hover_progress - dt*speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt*speed, 1)
	else
		selection_progress = math.max(selection_progress - dt*speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = input_progress*255
	style.clicked_rect.color[1] = input_progress*100
	local hover_alpha = hover_progress*255
	style.hover_glow.color[1] = hover_alpha
	local select_alpha = selection_progress*255
	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2]*0.4
	disabled_text_color[3] = disabled_default_text_color[3]*0.4
	disabled_text_color[4] = disabled_default_text_color[4]*0.4
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)

	return 
end
TitleLoadingUI._handle_stepper_input = function (self, widget, stepper_settings, gamepad_active, dt)
	local input_service = Managers.input:get_service("title_loading_ui")
	local content = widget.content
	local left_hotspot = content.left_hotspot
	local right_hotspot = content.right_hotspot

	if left_hotspot.on_hover_enter then
		self._on_stepper_arrow_hover(self, widget, "left_arrow_hover")
	elseif left_hotspot.on_hover_exit then
		self._on_stepper_arrow_dehover(self, widget, "left_arrow_hover")
	end

	if right_hotspot.on_hover_enter then
		self._on_stepper_arrow_hover(self, widget, "right_arrow_hover")
	elseif right_hotspot.on_hover_exit then
		self._on_stepper_arrow_dehover(self, widget, "right_arrow_hover")
	end

	local input_cooldown = content.input_cooldown
	local input_cooldown_multiplier = content.input_cooldown_multiplier
	local on_cooldown_last_frame = false

	if input_cooldown then
		on_cooldown_last_frame = true
		local new_cooldown = math.max(input_cooldown - dt, 0)
		input_cooldown = (0 < new_cooldown and new_cooldown) or nil
		content.input_cooldown = input_cooldown
	end

	local internal_value = content.internal_value
	local num_decimals = stepper_settings.num_decimals
	local min = stepper_settings.min
	local max = stepper_settings.max
	local diff = max - min
	local total_step = diff*10^num_decimals
	local step = total_step/1
	local move = gamepad_active and input_service.get(input_service, "analog_input")
	local analog_speed = 0.01
	local current_time = Managers.time:time("main")
	local input_been_made = false

	if left_hotspot.is_clicked == 0 or (gamepad_active and input_service.get(input_service, "move_left_hold")) then
		if not input_cooldown then
			internal_value = math.clamp(internal_value - step, 0, 1)
			input_been_made = true
		end
	elseif right_hotspot.is_clicked == 0 or (gamepad_active and input_service.get(input_service, "move_right_hold")) then
		if not input_cooldown then
			internal_value = math.clamp(internal_value + step, 0, 1)
			input_been_made = true
		end
	elseif move and 0 < math.abs(move.x) and not input_cooldown then
		local step_change = math.max(math.abs(math.pow(move.x, 2)*total_step*dt*analog_speed), step)
		internal_value = math.clamp(internal_value + step_change*math.sign(move.x), 0, 1)
		input_been_made = true
	end

	local change_made = false

	if content.internal_value ~= internal_value then
		change_made = true
		content.internal_value = internal_value
	end

	if input_been_made then
		if on_cooldown_last_frame then
			input_cooldown_multiplier = math.max(input_cooldown_multiplier - 0.1, 0.1)
			content.input_cooldown = math.ease_in_exp(input_cooldown_multiplier)*0.2
			content.input_cooldown_multiplier = input_cooldown_multiplier
		else
			input_cooldown_multiplier = 1
			content.input_cooldown = math.ease_in_exp(input_cooldown_multiplier)*0.2
			content.input_cooldown_multiplier = input_cooldown_multiplier
		end
	end

	return change_made
end
TitleLoadingUI._on_stepper_arrow_hover = function (self, widget, style_id)
	local widget_animations = widget.animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = 0.2
	local animation_duration = (current_alpha/target_alpha - 1)*total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		local anim = self._animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
		widget_animations[anim] = animation_name_hover
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
TitleLoadingUI._on_stepper_arrow_dehover = function (self, widget, style_id)
	local widget_animations = widget.animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 0
	local total_time = 0.2
	local animation_duration = current_alpha/255*total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		local anim = self._animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
		widget_animations[anim] = animation_name_hover
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
TitleLoadingUI._on_stepper_arrow_pressed = function (self, widget, style_id)
	local widget_animations = widget.animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local default_size = pass_style.default_size
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = 0.2
	local animation_duration = total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		local animation_name_width = "stepper_widget_arrow_width_" .. style_id
		local animation_name_height = "stepper_widget_arrow_height_" .. style_id
		local anim = self._animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
		widget_animations[anim] = animation_name_hover
		anim = self._animate_element_by_catmullrom(self, pass_style.size, 1, default_size[1], 0.7, 1, 1, 0.7, animation_duration)
		widget_animations[anim] = animation_name_width
		anim = self._animate_element_by_catmullrom(self, pass_style.size, 2, default_size[2], 0.7, 1, 1, 0.7, animation_duration)
		widget_animations[anim] = animation_name_height
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
TitleLoadingUI._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end
TitleLoadingUI._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
TitleLoadingUI._get_input_texture_data = function (self, input_action)
	local input_service = Managers.input:get_service("title_loading_ui")

	if Managers.input:is_device_active("keyboard") or Managers.input:is_device_active("mouse") then
		local platform = PLATFORM
		local keymap_binding = input_service.get_keymapping(input_service, input_action, platform)
		local device_type = keymap_binding[1]
		local key_index = keymap_binding[2]
		local key_action_type = keymap_binding[3]

		return nil, Keyboard.button_locale_name(key_index)
	elseif Managers.input:is_device_active("gamepad") then
		return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
	end

	return 
end
TitleLoadingUI._get_input_gamepad_texture_data = function (self, input_action)
	local input_service = Managers.input:get_service("title_loading_ui")

	return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
end
TitleLoadingUI._update_input_text = function (self, dt)
	local widget_content = self._skip_widget.content
	local widget_style = self._skip_widget.style
	local ui_scenegraph = self._ui_scenegraph
	local texture_data, input_text = self._get_input_texture_data(self, "cancel_video_1")

	if not texture_data then
		if widget_content.input_text ~= input_text then
			widget_content.input_text_1 = Localize("input_hold")
			widget_content.input_text_3 = Localize("any_key")
			widget_content.input_icon = nil
		end
	elseif texture_data.texture ~= widget_content.input_icon then
		widget_content.input_text_1 = Localize("input_hold")
		ui_scenegraph.skip_input_icon.size = texture_data.size
		widget_content.input_icon = texture_data.texture
		widget_content.input_text_3 = ""
	end

	local font, scaled_font_size = UIFontByResolution(widget_style.input_text_1)
	local text_width, text_height, min = UIRenderer.text_size(self._ui_renderer, widget_content.input_text_1, font[1], scaled_font_size)
	ui_scenegraph.skip_input_text_1.size[1] = text_width
	ui_scenegraph.skip_input_icon.position[1] = ui_scenegraph.skip_input_text_1.position[1] + text_width + ui_scenegraph.skip_input_icon.size[1]*0.25

	if texture_data then
		ui_scenegraph.skip_input.position[1] = 0
	end

	widget_content.using_keyboard = (not texture_data and true) or false

	if texture_data then
		ui_scenegraph.skip_input_text_2.position[1] = ui_scenegraph.skip_input_text_1.position[1] + text_width + ui_scenegraph.skip_input_icon.size[1]*1.75
	else
		local offset = 30
		local font, scaled_font_size = UIFontByResolution(widget_style.input_text_3)
		local text_width, text_height, min = UIRenderer.text_size(self._ui_renderer, widget_content.input_text_3, font[1], scaled_font_size)
		ui_scenegraph.skip_input_text_3.size[1] = text_width
		widget_style.keyboard_input_icon.tile_sizes[2][1] = text_width
		ui_scenegraph.skip_input_text_3.position[1] = ui_scenegraph.skip_input_text_1.position[1] + ui_scenegraph.skip_input_text_1.size[1] + offset
		ui_scenegraph.skip_input_text_2.position[1] = ui_scenegraph.skip_input_text_3.position[1] + ui_scenegraph.skip_input_text_3.size[1] + offset
		self.hold_bar_max_length = text_width + 34
	end

	self._can_draw_input_widget = true

	return 
end
INPUTS_TO_REMOVE = {}
TitleLoadingUI._update_any_held = function (self)
	local held = false

	for input, device in pairs(self._current_inputs) do
		if device.button(input) < 1 then
			INPUTS_TO_REMOVE[#INPUTS_TO_REMOVE + 1] = input
		else
			held = true
		end
	end

	for _, input in ipairs(INPUTS_TO_REMOVE) do
		self._current_inputs[input] = nil
	end

	table.clear(INPUTS_TO_REMOVE)

	local input = Keyboard.any_pressed()

	if input then
		self._current_inputs[input] = Keyboard
	end

	local input = Mouse.any_pressed()

	if input then
		self._current_inputs[input] = Mouse
	end

	local input = Pad1.any_pressed()

	if input then
		self._current_inputs[input] = Pad1
	end

	return held
end
TitleLoadingUI._update_input = function (self, dt)
	if self._force_done then
		self._handle_skip_fade(self, 0)

		return 
	end

	local total_hold_time = 1
	local total_fade_time = 1
	self._fade_timer = math.clamp((self._fade_timer or 0) - dt, 0, total_fade_time)
	local input_service = Managers.input:get_service("title_loading_ui")
	local cancel_video = input_service.get(input_service, "cancel_video")

	if self._update_any_held(self) then
		self._fade_timer = total_fade_time
		self._cancel_timer = (self._cancel_timer or 0) + dt
	else
		self._cancel_timer = (self._cancel_timer or 0) - dt*3
	end

	self._handle_skip_fade(self, self._fade_timer/total_fade_time*255)

	self._cancel_timer = math.clamp(self._cancel_timer, 0, total_hold_time)
	local progress = self._cancel_timer/total_hold_time

	if 1 <= progress or (cancel_video and self._cancel_video) then
		self._cancel_timer = nil
		self._force_done = true
		self._done = true

		if not Managers.transition:loading_icon_active() then
			Managers.transition:show_loading_icon()
		end

		self._skip_widget.style.input_icon_bar.gradient_threshold = 0
		self._skip_widget.style.hold_bar.size[1] = 0

		if self._sound_started then
			if first_time_video.sound_stop then
				Managers.music:trigger_event(first_time_video.sound_stop)
			end

			self._sound_started = false
		end
	else
		local fraction = math.clamp(progress, 0, 1)
		self._skip_widget.style.input_icon_bar.gradient_threshold = fraction
		local hold_bar_max_length = self.hold_bar_max_length

		if hold_bar_max_length then
			self._skip_widget.style.hold_bar.size[1] = hold_bar_max_length*fraction
		end
	end

	self._cancel_video = self._cancel_video or cancel_video

	return 
end
TitleLoadingUI._handle_skip_fade = function (self, alpha)
	local skip_input_style = self._skip_widget.style
	skip_input_style.input_text_1.text_color[1] = alpha
	skip_input_style.input_text_2.text_color[1] = alpha
	skip_input_style.input_text_3.text_color[1] = alpha
	skip_input_style.input_icon.color[1] = alpha
	skip_input_style.input_icon_bar.color[1] = alpha
	skip_input_style.keyboard_input_icon.color[1] = alpha

	return 
end
TitleLoadingUI._render = function (self, dt)
	local input_manager = Managers.input
	local input_service = input_manager.get_service(input_manager, "title_loading_ui")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

	UIRenderer.begin_pass(self._ui_renderer, self._ui_scenegraph, input_service, dt, nil, self.render_settings)

	if not self._startup_settings_done then
		local settings_index = self._settings_index

		if settings_index == 1 then
			for _, widget in ipairs(self._gamma_widgets) do
				UIRenderer.draw_widget(self._ui_renderer, widget)
			end
		elseif settings_index == 2 then
			for _, widget in ipairs(self._panning_widgets) do
				UIRenderer.draw_widget(self._ui_renderer, widget)
			end
		elseif settings_index == 3 then
			for _, widget in ipairs(self._dynamic_range_widgets) do
				UIRenderer.draw_widget(self._ui_renderer, widget)
			end
		end

		if not gamepad_active then
			UIRenderer.draw_widget(self._ui_renderer, self._done_button)
		end
	else
		self._render_video(self, dt)

		if self._can_draw_input_widget then
			UIRenderer.draw_widget(self._ui_renderer, self._skip_widget)
		end
	end

	UIRenderer.draw_widget(self._ui_renderer, self._dead_space_filler_widget)
	UIRenderer.end_pass(self._ui_renderer)

	return 
end
TitleLoadingUI._render_video = function (self, dt)
	if not self._trailer then
		return 
	end

	if self._done then
		return 
	end

	if not self._ui_renderer.video_player then
		UIRenderer.create_video_player(self._ui_renderer, self._world, first_time_video.video_name, false)
	else
		local video_complete = self._video_widget.content.video_content.video_completed

		if video_complete then
			UIRenderer.destroy_video_player(self._ui_renderer)

			self._sound_started = false

			if first_time_video.sound_stop then
				Managers.music:trigger_event(first_time_video.sound_stop)
			end

			self._done = true

			if not Managers.transition:loading_icon_active() then
				Managers.transition:show_loading_icon()
			end
		else
			if not self._sound_started then
				if first_time_video.sound_start then
					Managers.music:trigger_event(first_time_video.sound_start)
				end

				self._sound_started = true
			end

			UIRenderer.draw_widget(self._ui_renderer, self._video_widget)
		end
	end

	return 
end
TitleLoadingUI.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)

	if PLATFORM == "win32" then
		local max_fps = Application.user_setting("max_fps")

		if max_fps == nil or max_fps == 0 then
			Application.set_time_step_policy("no_throttle", "smoothing", 11, 2, 0.1)
		else
			Application.set_time_step_policy("throttle", max_fps, "smoothing", 11, 2, 0.1)
		end
	end

	if self._needs_cursor_pop then
		ShowCursorStack.pop()

		self._needs_cursor_pop = false
	end

	return 
end
TitleLoadingUI.is_done = function (self)
	return self._startup_settings_done and (self._force_done or self._done)
end
TitleLoadingUI.force_done = function (self)
	self._force_done = true
	self._cancel_timer = nil

	if not Managers.transition:loading_icon_active() then
		Managers.transition:show_loading_icon()
	end

	self._skip_widget.style.input_icon_bar.gradient_threshold = 0

	return 
end

return 
