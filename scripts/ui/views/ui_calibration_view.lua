local RETICULE_SIZE = 48
local RETICULE_THICKNESS = 4
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			900
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			900
		},
		size = {
			1920,
			1080
		}
	},
	top_left_reticule = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			-RETICULE_SIZE / 2,
			RETICULE_SIZE / 2,
			1
		},
		size = {
			RETICULE_SIZE,
			RETICULE_SIZE
		}
	},
	bottom_right_reticule = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			RETICULE_SIZE / 2,
			-RETICULE_SIZE / 2,
			1
		},
		size = {
			RETICULE_SIZE,
			RETICULE_SIZE
		}
	},
	reset_button = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			220,
			62
		}
	}
}
local widget_definitions = {
	top_left_reticule = {
		scenegraph_id = "top_left_reticule",
		element = {
			passes = {
				{
					pass_type = "hotspot"
				},
				{
					pass_type = "rect",
					style_id = "horizontal"
				},
				{
					pass_type = "rect",
					style_id = "vertical"
				}
			}
		},
		content = {},
		style = {
			horizontal = {
				color = {
					255,
					0,
					255,
					0
				},
				size = {
					RETICULE_SIZE,
					RETICULE_THICKNESS
				},
				offset = {
					0,
					RETICULE_SIZE / 2 - RETICULE_THICKNESS / 2
				}
			},
			vertical = {
				color = {
					255,
					0,
					255,
					0
				},
				size = {
					RETICULE_THICKNESS,
					RETICULE_SIZE
				},
				offset = {
					RETICULE_SIZE / 2 - RETICULE_THICKNESS / 2,
					0
				}
			}
		}
	},
	bottom_right_reticule = {
		scenegraph_id = "bottom_right_reticule",
		element = {
			passes = {
				{
					pass_type = "hotspot"
				},
				{
					pass_type = "rect",
					style_id = "horizontal"
				},
				{
					pass_type = "rect",
					style_id = "vertical"
				}
			}
		},
		content = {},
		style = {
			horizontal = {
				color = {
					255,
					255,
					0,
					0
				},
				size = {
					RETICULE_SIZE,
					RETICULE_THICKNESS
				},
				offset = {
					0,
					RETICULE_SIZE / 2 - RETICULE_THICKNESS / 2
				}
			},
			vertical = {
				color = {
					255,
					255,
					0,
					0
				},
				size = {
					RETICULE_THICKNESS,
					RETICULE_SIZE
				},
				offset = {
					RETICULE_SIZE / 2 - RETICULE_THICKNESS / 2,
					0
				}
			}
		}
	},
	background = {
		scenegraph_id = "screen",
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
}
local button_navigation = {
	"reset"
}
local button_definitions = {
	{
		scenegraph_id = "reset_button",
		element = UIElements.Button3States,
		content = {
			texture_click_id = "small_button_selected",
			texture_id = "small_button_normal",
			texture_hover_id = "small_button_hover",
			text_field = Localize("menu_settings_reset_to_default"),
			button_hotspot = {}
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					0,
					2
				}
			}
		}
	}
}
UICalibrationView = class(UICalibrationView)

UICalibrationView.init = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.background = UIWidget.init(widget_definitions.background)
	self.top_left_reticule = UIWidget.init(widget_definitions.top_left_reticule)
	self.bottom_right_reticule = UIWidget.init(widget_definitions.bottom_right_reticule)
	local buttons = {}

	for i = 1, #button_definitions, 1 do
		buttons[i] = UIWidget.init(button_definitions[i])
	end

	self.buttons = buttons
end

UICalibrationView.destroy = function (self)
	return
end

UICalibrationView.update = function (self, ui_renderer, input_service, dt)
	local ui_scenegraph = self.ui_scenegraph
	local top_left_reticule = self.top_left_reticule
	local bottom_right_reticule = self.bottom_right_reticule

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.background)
	UIRenderer.draw_widget(ui_renderer, top_left_reticule)
	UIRenderer.draw_widget(ui_renderer, bottom_right_reticule)

	for i, button in ipairs(self.buttons) do
		button.content.button_hotspot.disable_button = self.cursor_start_pos ~= nil

		UIRenderer.draw_widget(ui_renderer, button)
	end

	UIRenderer.end_pass(ui_renderer)

	local top_left_reticule_content = top_left_reticule.content

	if top_left_reticule_content.on_pressed then
		local cursor = input_service:get("cursor")
		self.cursor_start_pos = {
			cursor.x,
			cursor.y
		}
		self.start_root = table.clone(UISettings.root_scale)
		self.modifying_retucile = "top_left"
	end

	local bottom_right_reticule_content = bottom_right_reticule.content

	if bottom_right_reticule_content.on_pressed then
		local cursor = input_service:get("cursor")
		self.cursor_start_pos = {
			cursor.x,
			cursor.y
		}
		self.start_root = table.clone(UISettings.root_scale)
		self.modifying_retucile = "bottom_right"
	end

	if self.cursor_start_pos and not input_service:get("left_hold") then
		self:evaluate_new_root_scale(UISettings.root_scale)
		self:save_new_root_scale(UISettings.root_scale)

		self.cursor_start_pos = nil
		self.start_root = nil
		self.modifying_retucile = nil
	end

	if self.cursor_start_pos then
		local cursor_start = self.cursor_start_pos
		local cursor = input_service:get("cursor")
		local start_x = cursor_start[1]
		local cursor_x = cursor[1]
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local diff_x = cursor_x - start_x
		local norm_x = diff_x / 1920 * 2
		local start_y = cursor_start[2]
		local cursor_y = cursor[2]
		local diff_y = cursor_y - start_y
		local norm_y = diff_y / h * 2

		if self.modifying_retucile == "bottom_right" then
			norm_x = -1 * norm_x
			norm_y = -1 * norm_y
		end

		local new_scale_x = self.start_root[1] - norm_x
		local new_scale_y = self.start_root[2] + norm_y
		UISettings.root_scale[1] = self.start_root[1] - norm_x
		UISettings.root_scale[2] = self.start_root[2] + norm_y
	end

	for i, button in ipairs(self.buttons) do
		if button.content.button_hotspot.on_release and button_navigation[i] == "reset" then
			self:reset_root_scale()
		end
	end
end

UICalibrationView.reset_root_scale = function (self)
	UISettings.root_scale[1] = 1
	UISettings.root_scale[2] = 1

	self:save_new_root_scale(UISettings.root_scale)
end

UICalibrationView.evaluate_new_root_scale = function (self, root_scale)
	local w, h = Application.resolution()
	local scale_x = root_scale[1]

	if scale_x > 1 then
		local new_root_screen_x = 1920 * scale_x

		if w < new_root_screen_x then
			local diff = (new_root_screen_x - w) / w
			scale_x = scale_x - diff
		end
	elseif scale_x < 0.2 then
		scale_x = 0.2
	end

	local scale_y = root_scale[2]

	if scale_y > 1 then
		scale_y = 1
	elseif scale_y < 0.2 then
		scale_y = 0.2
	end

	root_scale[1] = scale_x
	root_scale[2] = scale_y
end

UICalibrationView.save_new_root_scale = function (self, root_scale)
	Application.set_user_setting("root_scale_x", root_scale[1])
	Application.set_user_setting("root_scale_y", root_scale[2])
	Application.save_user_settings()
end

return
