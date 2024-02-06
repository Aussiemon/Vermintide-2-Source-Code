-- chunkname: @scripts/ui/views/splash_view.lua

require("scripts/ui/ui_renderer")
require("scripts/ui/ui_layer")
require("scripts/ui/ui_elements")
require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	screen = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			99,
		},
	},
	background_fit = {
		horizontal_alignment = "center",
		scale = "fit",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			99,
		},
	},
	disclaimer = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1400,
			700,
		},
		position = {
			0,
			0,
			0,
		},
	},
	input_background = {
		horizontal_alignment = "center",
		parent = "background_fit",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
	},
	foreground = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			200,
		},
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			100,
		},
	},
	esrb = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1200,
			576,
		},
	},
	warhammer = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			774,
			417,
		},
	},
	bld_splash_partners = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
	},
	autodesk_splash = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			385,
			90,
		},
		position = {
			-400,
			300,
			0,
		},
	},
	partner_splash_umbra = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			313,
			128,
		},
		position = {
			-400,
			0,
			0,
		},
	},
	partner_splash_wwise = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			315,
			93,
		},
		position = {
			-400,
			-300,
			0,
		},
	},
	partner_splash_simplygon = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			150,
			107,
		},
		position = {
			400,
			300,
			0,
		},
	},
	partner_splash_dobly = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			314,
			80,
		},
		position = {
			400,
			0,
			0,
		},
	},
	partner_splash_dts = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			234,
			88,
		},
		position = {
			400,
			-300,
			0,
		},
	},
	partner_splash_pixeldiet = {
		horizontal_alignment = "left",
		parent = "partner_splash_dts",
		vertical_alignment = "bottom",
		size = {
			314,
			57,
		},
		position = {
			-450,
			-230,
			0,
		},
	},
	partner_splash_nordic_games = {
		horizontal_alignment = "center",
		parent = "partner_splash_dts",
		vertical_alignment = "bottom",
		size = {
			385,
			90,
		},
		position = {
			0,
			-240,
			0,
		},
	},
	partner_splash_black = {
		horizontal_alignment = "center",
		parent = "bld_splash_partners",
		vertical_alignment = "center",
		size = {
			222,
			139,
		},
		position = {
			225,
			-230,
			0,
		},
	},
	texts = {
		parent = "background",
	},
	beta_disclaimer = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			1600,
			528,
		},
	},
}

function create_xbox_beta_widget(input)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					scenegraph_id = "foreground",
					style_id = "foreground",
					content_check_function = function (content)
						return content.foreground.disable_foreground ~= true
					end,
				},
				{
					content_id = "texture_content",
					pass_type = "texture",
					style_id = "texture_style",
					texture_id = "material_name",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name
					end,
				},
				{
					content_id = "input_texture_content",
					pass_type = "texture",
					style_id = "input_style",
					texture_id = "material_name",
					scenegraph_id = input.input_scenegraph_id,
					content_check_function = function (content)
						return content.material_name
					end,
					content_change_function = function (content, style, ui_animations, dt)
						content.timer = (content.timer or 0) + dt

						local intensity = 192 + 63 * math.sin(content.timer * 4)

						style.color[2] = intensity
						style.color[3] = intensity
						style.color[4] = intensity
					end,
				},
			},
		},
		content = {
			texture_content = {
				material_name = input.material_name,
			},
			input_texture_content = {
				material_name = input.input_material_name,
			},
			foreground = {
				disable_foreground = input.disable_foreground,
			},
		},
		style = {
			foreground = {
				color = Colors.color_definitions.black,
			},
			input_style = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = input.input_texture_size,
				offset = input.input_texture_offset or {
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
			texture_style = {
				size = input.texture_size,
				offset = input.texture_offset or {
					0,
					0,
					0,
				},
			},
		},
		scenegraph_id = input.scenegraph_id,
	}
end

local function create_disclaimer_widget(input)
	return {
		scenegraph_id = "disclaimer",
		element = {
			passes = {
				{
					pass_type = "rect",
					scenegraph_id = "foreground",
					style_id = "foreground",
				},
				{
					pass_type = "rect",
					style_id = "divider",
				},
				{
					pass_type = "texture",
					style_id = "texture_style",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "header",
					text_id = "header_text",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					scenegraph_id = "screen",
					style_id = "continue",
					text_id = "continue",
					content_check_function = function (content)
						return content.ready
					end,
					content_change_function = function (content, style)
						local gamepad_active = IS_CONSOLE or Managers.input:is_device_active("gamepad")
						local time, dt = Managers.time:time_and_delta("main")

						content.timer = content.timer + dt * 2
						style.text_color[1] = 128 - math.cos(content.timer) * 127
						content.continue = gamepad_active and "press_any_button_to_continue" or "press_any_key_to_continue"
					end,
				},
			},
		},
		content = {
			continue = "press_any_key_to_continue",
			ready = false,
			timer = 0,
			text = input.text,
			header_text = input.header_text,
			texture_id = input.texture_id,
		},
		style = {
			foreground = {
				color = Colors.color_definitions.black,
			},
			texture_style = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = input.texture_size,
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0,
				},
			},
			divider = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					1400,
					3,
				},
				color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-180,
					0,
				},
			},
			header = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					1400,
					900,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-210,
					0,
				},
			},
			text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					1400,
					900,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-260,
					0,
				},
			},
			continue = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = true,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-50,
					50,
					0,
				},
			},
		},
	}
end

local dead_space_filler = {
	scenegraph_id = "dead_space_filler",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "rect",
			},
		},
	},
	content = {},
	style = {
		rect = {
			color = {
				255,
				0,
				0,
				0,
			},
		},
	},
}
local splash_content = {
	{
		material_name = "fatshark_splash",
		scenegraph_id = "splash_video",
		sound_start = "Play_fatshark_logo",
		sound_stop = "Stop_fatshark_logo",
		type = "video",
		video_name = "video/fatshark_splash",
	},
	{
		axis = 2,
		direction = 1,
		dynamic_font = false,
		font_size = 13,
		font_type = "hell_shark",
		localize = true,
		material_name = "warhammer",
		pixel_perfect = false,
		scenegraph_id = "warhammer",
		spacing = 5,
		text_horizontal_alignment = "center",
		text_vertical_alignment = "bottom",
		texts_scenegraph_id = "texts",
		time = 3,
		type = "texture",
		texts = {
			"gw_legal_1",
			"gw_legal_2",
			"gw_legal_3",
			"gw_legal_4",
		},
		size = {
			1920,
			13,
		},
		offset = {
			0,
			110,
			0,
		},
	},
	{
		dynamic_font = false,
		font_size = 13,
		font_type = "hell_shark",
		localize = true,
		partner_splash = true,
		pixel_perfect = false,
		scenegraph_id = "bld_splash_partners",
		spacing = 5,
		text_horizontal_alignment = "center",
		text_vertical_alignment = "bottom",
		texts_scenegraph_id = "texts",
		time = 3,
		type = "texture",
		texture_materials = {
			"autodesk_splash",
			"umbra",
			"wwise",
			"simplygon",
			"dolby",
			"dts",
		},
		offset = {
			0,
			110,
			0,
		},
		texture_scenegraph_ids = {
			"autodesk_splash",
			"partner_splash_umbra",
			"partner_splash_wwise",
			"partner_splash_simplygon",
			"partner_splash_dobly",
			"partner_splash_dts",
		},
	},
	{
		forced = true,
		header_text = "splash_seizure_disclaimer_header",
		text = "splash_seizure_disclaimer",
		texture_id = "vermintide_2_logo",
		time = 3,
		type = "disclaimer",
		texture_size = {
			300,
			168,
		},
	},
}

if Development.parameter("use_beta_mode") or script_data.settings.use_beta_mode then
	if IS_XB1 then
		local is_xbox_one_x = false
		local console_type = XboxOne.console_type()

		if console_type == XboxOne.CONSOLE_TYPE_XBOX_ONE_X_DEVKIT or console_type == XboxOne.CONSOLE_TYPE_XBOX_ONE_X or console_type == XboxOne.CONSOLE_TYPE_XBOX_ANACONDA or console_type == XboxOne.CONSOLE_TYPE_XBOX_SERIES_X_DEVKIT then
			is_xbox_one_x = true
		end

		splash_content[#splash_content + 1] = {
			forced = true,
			input_material_name = "storepage_button",
			input_scenegraph_id = "input_background",
			material_name = "beta_end_overlay",
			music_name = "Play_menu_screen_music",
			product_id = "ADAA6515-8206-49E5-B34C-405244800B46",
			scenegraph_id = "background_fit",
			texts_scenegraph_id = "texts",
			type = "beta_end",
			input_texture_size = is_xbox_one_x and {
				1776,
				346,
			} or {
				888,
				173,
			},
			input_texture_offset = is_xbox_one_x and {
				550,
				-260,
			} or {
				275,
				-130,
			},
			time = math.huge,
		}
	elseif IS_PS4 then
		local is_pro = PS4.is_pro()

		splash_content[#splash_content + 1] = {
			axis = 2,
			direction = 1,
			dynamic_font = false,
			font_type = "hell_shark",
			forced = true,
			localize = false,
			pixel_perfect = false,
			scenegraph_id = "background",
			spacing = 5,
			text_horizontal_alignment = "center",
			text_vertical_alignment = "center",
			texts_scenegraph_id = "texts",
			time = 10,
			type = "texture",
			texts = {
				"PRE-RELEASE SOFTWARE",
				"***",
				"This game is in a pre-release stage of development. This means ",
				"that some parts of the game, including online features",
				"(like chat and multiplayer), might not function as expected (or might",
				"not function at all). The game might even crash. Because this is",
				"a pre-release game, Fatshark does not commit",
				"to providing customer support for the game.",
			},
			font_size = is_pro and 52 or 36,
			size = {
				1920,
				is_pro and 70 or 50,
			},
			offset = {
				0,
				750,
				0,
			},
		}
	elseif IS_WINDOWS then
		local is_beta = rawget(_G, "Steam") and Steam.app_id() == 1085780

		if is_beta then
			splash_content[#splash_content + 1] = {
				axis = 2,
				direction = 1,
				dynamic_font = false,
				font_size = 36,
				font_type = "hell_shark",
				forced = true,
				localize = false,
				pixel_perfect = false,
				scenegraph_id = "background",
				spacing = 5,
				text_horizontal_alignment = "center",
				text_vertical_alignment = "center",
				texts_scenegraph_id = "texts",
				time = 10,
				type = "texture",
				texts = {
					"PRE-RELEASE SOFTWARE",
					"***",
					"This game is in a pre-release stage of development. This means ",
					"that some parts of the game, including online features",
					"(like chat and multiplayer), might not function as expected (or might",
					"not function at all). The game might even crash. Because this is",
					"a pre-release game, Fatshark does not commit",
					"to providing customer support for the game.",
				},
				size = {
					1920,
					50,
				},
				offset = {
					0,
					750,
					0,
				},
			}
		end
	end
end

local VIDEO_REFERENCE_NAME = "SplashView"

SplashView = class(SplashView)

SplashView.init = function (self, input_manager, world)
	if IS_PS4 then
		PS4.hide_splash_screen()
	end

	self._fram_skip_hack = 0
	self.force_debug_enabled = Development.parameter("force_debug_enabled")
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self._world = world
	self._current_index = 1
	self.ui_renderer = UIRenderer.create(world, "material", "video/fatshark_splash", "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_splash_screen")

	if input_manager then
		input_manager:create_input_service("splash_view", "SplashScreenKeymaps", "SplashScreenFilters")
		input_manager:map_device_to_service("splash_view", "keyboard")
		input_manager:map_device_to_service("splash_view", "gamepad")
		input_manager:map_device_to_service("splash_view", "mouse")

		self.input_manager = input_manager
	end

	self:_create_ui_elements()

	if script_data["-no-rendering"] then
		self._current_index = #splash_content + 1
	end

	self:_next_splash(true)
end

SplashView._next_splash = function (self, override_skip)
	if not override_skip and IS_CONSOLE and not self._allow_console_skip then
		self._update_func = "_wait_for_allow_console_skip"
		self._video_complete = true

		return
	end

	self._update_func = "do_nothing"
	self._current_splash_data = splash_content[self._current_index]
	self._current_widget = self._splash_widgets[self._current_index]

	if self._current_splash_data then
		local update_func = "_update_" .. self._current_splash_data.type

		self._update_func = self[update_func] and update_func or "_update_texture"
		self._current_index = self._current_index + 1
		self._current_splash_data.timer = self._current_splash_data.time
	elseif not Managers.transition:loading_icon_active() then
		Managers.transition:show_loading_icon()
	end
end

SplashView._update_video = function (self, gui, dt)
	if not self.ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
		UIRenderer.create_video_player(self.ui_renderer, VIDEO_REFERENCE_NAME, self._world, self._current_splash_data.video_name, false)
		Managers.transition:fade_out(0.5, nil)
	else
		local video_complete = self._current_widget.content.video_content.video_completed

		if video_complete then
			UIRenderer.destroy_video_player(self.ui_renderer, VIDEO_REFERENCE_NAME)

			self._sound_started = false

			if self._current_splash_data.sound_stop then
				Managers.music:trigger_event(self._current_splash_data.sound_stop)
			end

			self:_next_splash()
		else
			if not self._sound_started then
				if self._current_splash_data.sound_start then
					Managers.music:trigger_event(self._current_splash_data.sound_start)
				end

				self._sound_started = true
			end

			UIRenderer.draw_widget(self.ui_renderer, self._current_widget)
		end
	end
end

SplashView._update_texture = function (self, gui, dt)
	local w, h = Gui.resolution()
	local timer = self._current_splash_data.timer
	local texts = self._current_splash_data.texts
	local total_time = self._current_splash_data.time

	dt = math.min(dt, 0.03333333333333333)

	if timer > total_time - 0.5 then
		local value = 255 * ((timer - (total_time - 0.5)) / 0.5)

		self._current_widget.style.foreground.color[1] = value
	elseif timer <= 0.5 then
		local value = 255 * (1 - timer / 0.5)

		self._current_widget.style.foreground.color[1] = value
	else
		self._current_widget.style.foreground.color[1] = 0
	end

	UIRenderer.draw_widget(self.ui_renderer, self._current_widget)

	self._current_splash_data.timer = self._current_splash_data.timer - dt

	if self._current_splash_data.timer <= 0 then
		self:_next_splash()
	end
end

SplashView._update_disclaimer = function (self, gui, dt)
	local w, h = Gui.resolution()
	local timer = self._current_splash_data.timer
	local texts = self._current_splash_data.texts
	local total_time = self._current_splash_data.time

	dt = math.min(dt, 0.03333333333333333)

	if self._current_splash_data.confirmed then
		local value = 255 * (1 - timer / 0.5)

		self._current_widget.style.foreground.color[1] = value
	elseif timer > total_time - 0.5 then
		local value = 255 * ((timer - (total_time - 0.5)) / 0.5)

		self._current_widget.style.foreground.color[1] = value
	elseif timer <= 0.5 then
		local skip

		if IS_CONSOLE then
			skip = script_data.skip_splash or self:_get_console_input()
		else
			local input_service = self.input_manager:get_service("splash_view")

			skip = script_data.skip_splash or input_service:get("skip_splash")
		end

		if skip then
			self._current_splash_data.confirmed = true
		end

		dt = 0
		self._current_widget.style.foreground.color[1] = 0
		self._current_widget.content.ready = true
	end

	UIRenderer.draw_widget(self.ui_renderer, self._current_widget)

	self._current_splash_data.timer = self._current_splash_data.timer - dt

	if self._current_splash_data.timer <= 0 then
		self:_next_splash()
	end
end

SplashView._update_beta_end = function (self, gui, dt)
	local w, h = Gui.resolution()
	local timer = self._current_splash_data.timer
	local texts = self._current_splash_data.texts
	local total_time = self._current_splash_data.time

	if self._current_splash_data.music_name and not self._sound_started then
		Managers.music:stop_all_sounds()
		Managers.music:trigger_event(self._current_splash_data.music_name)

		self._sound_started = true
	end

	dt = math.min(dt, 0.03333333333333333)

	if timer <= 0.5 then
		local value = 255 * (1 - timer / 0.5)

		self._current_widget.style.foreground.color[1] = value
	else
		self._current_widget.style.foreground.color[1] = 0
	end

	UIRenderer.draw_widget(self.ui_renderer, self._current_widget)

	self._current_splash_data.timer = self._current_splash_data.timer - dt

	local pad = "Pad"

	for i = 1, 8 do
		local pad_name = pad .. tostring(i)
		local pad_controller = rawget(_G, pad_name)

		if pad_controller and pad_controller.pressed(pad_controller.button_index("y")) then
			local user_id = pad_controller.user_id()

			if user_id then
				XboxLive.show_product_details(user_id, self._current_splash_data.product_id)
			end
		end
	end
end

if IS_CONSOLE then
	SplashView._wait_for_allow_console_skip = function (self)
		if self._allow_console_skip then
			self:_next_splash()
		end
	end
end

SplashView.set_index = function (self, index)
	self._current_index = index

	self:_next_splash()
end

SplashView._create_ui_elements = function (self)
	self._splash_widgets = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.dead_space_filler = UIWidget.init(dead_space_filler)

	for _, splash in pairs(splash_content) do
		local widget

		if splash.type == "video" then
			widget = UIWidgets.create_splash_video(splash, VIDEO_REFERENCE_NAME)
		elseif splash.type == "beta_end" then
			widget = create_xbox_beta_widget(splash)
		elseif splash.type == "disclaimer" then
			widget = create_disclaimer_widget(splash)
		elseif splash.partner_splash then
			widget = UIWidgets.create_partner_splash_widget(splash)
		else
			widget = UIWidgets.create_splash_texture(splash)
		end

		self._splash_widgets[#self._splash_widgets + 1] = UIWidget.init(widget)
	end

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

SplashView.update = function (self, dt)
	if IS_WINDOWS and self._fram_skip_hack < 1 then
		self._fram_skip_hack = self._fram_skip_hack + 1

		return
	end

	local w, h = Gui.resolution()
	local ui_renderer = self.ui_renderer
	local input_service = IS_WINDOWS and self.input_manager:get_service("splash_view") or FAKE_INPUT_SERVICE

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_widget(ui_renderer, self.dead_space_filler)

	local skip

	if IS_CONSOLE then
		skip = script_data.skip_splash or self:_get_console_input()
	else
		skip = script_data.skip_splash or input_service:get("skip_splash")
	end

	if skip and (not self._current_splash_data or not self._current_splash_data.forced) then
		if self._current_splash_data and self._current_splash_data.type == "video" then
			if ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
				UIRenderer.destroy_video_player(self.ui_renderer, VIDEO_REFERENCE_NAME)
			end

			if self._current_splash_data.sound_stop then
				Managers.music:trigger_event(self._current_splash_data.sound_stop)
			end

			self._sound_started = false
		end

		self:_next_splash()
	elseif self[self._update_func] then
		self[self._update_func](self, ui_renderer.gui, dt)
	end

	UIRenderer.end_pass(ui_renderer)
end

if IS_CONSOLE then
	SplashView.allow_console_skip = function (self)
		self._allow_console_skip = true
	end

	SplashView._get_console_input = function (self)
		if not self._allow_console_skip then
			return
		end

		local pad = "Pad"

		for i = 1, 8 do
			local pad_name = pad .. tostring(i)
			local pad_controller = rawget(_G, pad_name)

			if pad_controller and pad_controller.any_pressed() then
				return true
			end
		end

		if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and (Keyboard.any_pressed() or Mouse.any_pressed()) then
			return true
		end
	end
end

SplashView.render = function (self)
	return
end

SplashView.video_complete = function (self)
	return self._video_complete
end

SplashView.destroy = function (self)
	Managers.music:stop_all_sounds()
	UIRenderer.destroy(self.ui_renderer, self._world)
end

SplashView.is_completed = function (self)
	return self._current_splash_data == nil
end
