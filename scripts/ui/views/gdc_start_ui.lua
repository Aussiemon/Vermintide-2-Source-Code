local scenegraph = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.gdc_intro
		}
	},
	gdc_logo = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			-100,
			1
		},
		size = {
			1237,
			538
		}
	},
	input_root = {
		parent = "root",
		position = {
			960,
			320,
			0
		},
		size = {
			1,
			1
		}
	},
	input = {
		vertical_alignment = "bottom",
		parent = "input_root",
		position = {
			0,
			0,
			1
		},
		size = {
			200,
			40
		}
	},
	input_text = {
		vertical_alignment = "center",
		parent = "input",
		size = {
			600,
			62
		},
		position = {
			0,
			0,
			2
		}
	},
	input_prefix_text = {
		vertical_alignment = "center",
		parent = "input_icon",
		horizontal_alignment = "left",
		size = {
			300,
			62
		},
		position = {
			-300,
			0,
			2
		}
	},
	input_icon = {
		vertical_alignment = "center",
		parent = "input",
		horizontal_alignment = "left",
		size = {
			62,
			62
		},
		position = {
			0,
			0,
			1
		}
	}
}
local widget_definitions = {
	input = {
		scenegraph_id = "input",
		element = {
			passes = {
				{
					texture_id = "icon_textures",
					style_id = "icon_styles",
					pass_type = "multi_texture"
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						return content.text ~= ""
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				},
				{
					style_id = "prefix_text",
					pass_type = "text",
					text_id = "prefix_text",
					content_check_function = function (content)
						return content.text
					end
				}
			}
		},
		content = {
			text = "input_text",
			prefix_text = "",
			button_text = "",
			icon_textures = {
				"pc_button_icon_left"
			}
		},
		style = {
			prefix_text = {
				scenegraph_id = "input_prefix_text",
				font_size = 36,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					3,
					1
				}
			},
			text = {
				scenegraph_id = "input_text",
				font_size = 36,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					3,
					1
				}
			},
			button_text = {
				font_size = 24,
				scenegraph_id = "input_icon",
				horizontal_alignment = "center",
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					2,
					2
				}
			},
			icon_styles = {
				scenegraph_id = "input_icon",
				texture_sizes = {
					{
						20,
						36
					}
				},
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		}
	},
	logo = {
		scenegraph_id = "gdc_logo",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "logo"
				}
			}
		},
		content = {
			logo = "vermintide_logo_transparent"
		},
		style = {}
	}
}
GDCStartUI = class(GDCStartUI)

GDCStartUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.camera_manager = ingame_ui_context.camera_manager
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.world_manager = ingame_ui_context.world_manager
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager
	self.ui_animations = {}

	self.network_event_delegate:register(self, "rpc_on_skip_gdc_intro")
	rawset(_G, "GDCStartUI_pointer", self)
	self:create_ui_elements()
end

GDCStartUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph)
	self.logo_widget = UIWidget.init(widget_definitions.logo)
	self.input_widget = UIWidget.init(widget_definitions.input)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
	self:set_input_text("waiting_for_other_players")

	local input_widget_style = self.input_widget.style
	self.ui_animations.button_text_pulse = UIAnimation.init(UIAnimation.pulse_animation, input_widget_style.button_text.text_color, 1, 100, 255, 2)
	self.ui_animations.button_texture_pulse = UIAnimation.init(UIAnimation.pulse_animation, input_widget_style.icon_styles.color, 1, 100, 255, 2)
end

GDCStartUI.update = function (self, dt)
	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	if not self.intro_complete then
		if not self.draw_intro then
			if player_unit and Unit.alive(player_unit) then
				local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

				if hud_extension.show_gdc_intro then
					self:start_gdc_intro()
				end
			end
		else
			local input_service = self.input_manager:get_service("cutscene")

			self:check_start_input(input_service)
		end
	end

	self:draw(dt)
end

GDCStartUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("cutscene")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if not self.intro_complete and self.draw_intro then
		UIRenderer.draw_widget(ui_renderer, self.input_widget)
		UIRenderer.draw_widget(ui_renderer, self.logo_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

GDCStartUI.destroy = function (self)
	self.network_event_delegate:unregister(self)
	rawset(_G, "GDCStartUI_pointer", nil)
	GarbageLeakDetector.register_object(self, "GDCStartUI")
end

GDCStartUI.start_gdc_intro = function (self)
	self.draw_intro = true
end

GDCStartUI.end_gdc_intro = function (self)
	self.draw_intro = nil
	self.intro_complete = true
end

GDCStartUI.rpc_on_skip_gdc_intro = function (self, sender)
	if Managers.player.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_on_skip_gdc_intro", self.peer_id)
	end

	if not self.input_pressed then
		self.input_pressed = true

		self:end_gdc_intro()

		local world_name = "level_world"
		local world_manager = self.world_manager

		if world_manager:has_world(world_name) then
			local world = world_manager:world(world_name)

			LevelHelper:flow_event(world, "gdc_intro_complete")
		end
	end
end

GDCStartUI.check_start_input = function (self, input_service)
	if self.input_pressed or not self.input_widget then
		return
	end

	local ignore_player_count = Development.parameter("gdc_ignore_minimum_players")
	local expected_num_of_players = Development.parameter("gdc_player_count") or 1

	if ignore_player_count then
		expected_num_of_players = 1
	end

	local human_players = Managers.player:human_players()
	local num_of_human_players = 0

	for id, player in pairs(human_players) do
		local player_unit = player.player_unit

		if player_unit and Unit.alive(player_unit) then
			num_of_human_players = num_of_human_players + 1
		end
	end

	if input_service and ((expected_num_of_players <= num_of_human_players and input_service:get("gdc_skip")) or (input_service:has("gdc_debug_skip") and input_service:get("gdc_debug_skip"))) then
		if Managers.player.is_server then
			self:rpc_on_skip_gdc_intro()
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_on_skip_gdc_intro")
		end
	end

	if self.num_of_human_players ~= num_of_human_players then
		local optional_text = (num_of_human_players < expected_num_of_players and Localize("waiting_for_other_players") .. " - " .. num_of_human_players .. "/" .. expected_num_of_players) or nil

		self:set_input_text(optional_text)

		self.num_of_human_players = num_of_human_players
	end
end

GDCStartUI.set_input_text = function (self, optinal_text)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local widget = self.input_widget
	local widget_content = widget.content
	local widget_style = widget.style
	local text = ""
	local prefix_text = ""
	local button_text = ""
	local button_texture_data = nil

	if not optinal_text then
		local interact_action = "jump"
		local input_manager = self.input_manager
		local input_service = input_manager:get_service("Player")
		local gamepad_active = input_manager:is_device_active("gamepad")
		local button_texture_data, button_text = UISettings.get_gamepad_input_texture_data(input_service, interact_action, gamepad_active)

		assert(button_texture_data, "Could not find button texture(s) for action: jump")

		text = Localize("to_start_game")
		prefix_text = Localize("interaction_prefix_press")
	else
		text = optinal_text
		prefix_text = ""
	end

	local texture_size_x = 0
	local texture_size_y = 0

	if button_texture_data then
		if button_texture_data.texture then
			widget_content.button_text = ""
			widget_content.icon_textures = {
				button_texture_data.texture
			}
			widget_style.icon_styles.texture_sizes = {
				button_texture_data.size
			}
			texture_size_x = button_texture_data.size[1]
			texture_size_y = button_texture_data.size[2]
		else
			local textures = {}
			local sizes = {}
			local button_text_style = widget_style.button_text
			local font, scaled_font_size = UIFontByResolution(button_text_style)
			local text_width, text_height, min = UIRenderer.text_size(ui_renderer, button_text, font[1], scaled_font_size)

			for i = 1, #button_texture_data, 1 do
				textures[i] = button_texture_data[i].texture
				sizes[i] = button_texture_data[i].size

				if i == 2 then
					sizes[i][1] = text_width
				end

				texture_size_x = texture_size_x + sizes[i][1]

				if texture_size_y < sizes[i][2] and not sizes[i][2] then
				end
			end

			widget_content.icon_textures = textures
			widget_content.button_text = button_text
			widget_style.icon_styles.texture_sizes = sizes
		end

		ui_scenegraph.input_text.local_position[1] = texture_size_x
		ui_scenegraph.input_icon.size[1] = texture_size_x
		ui_scenegraph.input_icon.size[2] = texture_size_y
	else
		widget_content.icon_textures = {}
		widget_content.button_text = ""
		widget_content.prefix_text = ""
		ui_scenegraph.input_text.local_position[1] = 0
	end

	local text_style = widget_style.text
	local text_width, scaled_font_size = self:get_text_width(text_style, text)
	local prefix_text_width = self:get_text_width(widget_style.prefix_text, prefix_text)
	widget_content.text = text
	widget_content.prefix_text = prefix_text
	ui_scenegraph.input_text.position[2] = (scaled_font_size == text_style.font_size and 3) or 0
	ui_scenegraph.input_prefix_text.position[2] = ui_scenegraph.input_text.position[2]
	ui_scenegraph.input.position[1] = -((text_width + texture_size_x) * 0.5) + prefix_text_width
end

GDCStartUI.get_text_width = function (self, text_style, text)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local width, height, min = UIRenderer.text_size(self.ui_renderer, text, font[1], scaled_font_size)

	return width, scaled_font_size
end

return
