VoiceChatUI = class(VoiceChatUI)
local RETAINED_MODE_ENABLED = true
local NUM_SLOTS = 4
local PLAYER_NAME_MAX_LENGTH = 16
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
			UILayer.chat
		}
	},
	icon_slot_1 = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		size = {
			24,
			25
		},
		position = {
			90,
			-54,
			1
		}
	},
	icon_slot_2 = {
		vertical_alignment = "bottom",
		parent = "icon_slot_1",
		horizontal_alignment = "center",
		size = {
			24,
			25
		},
		position = {
			0,
			-30,
			0
		}
	},
	icon_slot_3 = {
		vertical_alignment = "bottom",
		parent = "icon_slot_2",
		horizontal_alignment = "center",
		size = {
			24,
			25
		},
		position = {
			0,
			-30,
			0
		}
	},
	icon_slot_4 = {
		vertical_alignment = "bottom",
		parent = "icon_slot_3",
		horizontal_alignment = "center",
		size = {
			24,
			25
		},
		position = {
			0,
			-30,
			0
		}
	},
	name_slot_1 = {
		vertical_alignment = "center",
		parent = "icon_slot_1",
		horizontal_alignment = "left",
		size = {
			400,
			24
		},
		position = {
			25,
			0,
			0
		}
	},
	name_slot_2 = {
		vertical_alignment = "center",
		parent = "icon_slot_2",
		horizontal_alignment = "left",
		size = {
			400,
			24
		},
		position = {
			25,
			0,
			0
		}
	},
	name_slot_3 = {
		vertical_alignment = "center",
		parent = "icon_slot_3",
		horizontal_alignment = "left",
		size = {
			400,
			24
		},
		position = {
			25,
			0,
			0
		}
	},
	name_slot_4 = {
		vertical_alignment = "center",
		parent = "icon_slot_4",
		horizontal_alignment = "left",
		size = {
			400,
			24
		},
		position = {
			25,
			0,
			0
		}
	},
	bg_slot_1 = {
		vertical_alignment = "center",
		parent = "icon_slot_1",
		horizontal_alignment = "left",
		size = {
			250,
			25
		},
		position = {
			-5,
			0,
			-1
		}
	},
	bg_slot_2 = {
		vertical_alignment = "center",
		parent = "icon_slot_2",
		horizontal_alignment = "left",
		size = {
			250,
			25
		},
		position = {
			-5,
			0,
			-1
		}
	},
	bg_slot_3 = {
		vertical_alignment = "center",
		parent = "icon_slot_3",
		horizontal_alignment = "left",
		size = {
			250,
			25
		},
		position = {
			-5,
			0,
			-1
		}
	},
	bg_slot_4 = {
		vertical_alignment = "center",
		parent = "icon_slot_4",
		horizontal_alignment = "left",
		size = {
			250,
			25
		},
		position = {
			-5,
			0,
			-1
		}
	}
}
local icon_widget_definitions = {
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_1", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_2", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_3", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_4", false, RETAINED_MODE_ENABLED)
}
local bg_widget_definitions = {
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_1", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_2", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_3", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_4", false, RETAINED_MODE_ENABLED)
}
local name_style = {
	vertical_alignment = "center",
	font_size = 18,
	localize = false,
	horizontal_alignment = "left",
	word_wrap = false,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 150),
	offset = {
		0,
		0,
		2
	}
}
local name_widget_definitions = {
	UIWidgets.create_simple_text("player_1", "name_slot_1", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_2", "name_slot_2", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_3", "name_slot_3", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_4", "name_slot_4", nil, nil, name_style, nil, RETAINED_MODE_ENABLED)
}

VoiceChatUI.init = function (self, ingame_ui_context)
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.player_manager = ingame_ui_context.player_manager
	self.voip = ingame_ui_context.voip
	self._lobby = ingame_ui_context.lobby
	self._cached_names = {}
	self._talked_last_frame = {}
	self._talking_this_frame = {}
	self._dirty = false

	self:create_ui_elements()
end

VoiceChatUI.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

VoiceChatUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.icon_widgets = {}

	for _, definition in ipairs(icon_widget_definitions) do
		local widget = UIWidget.init(definition)
		widget.content.visible = false
		widget.style.texture_id.color = Colors.get_color_table_with_alpha("white", 150)
		self.icon_widgets[#self.icon_widgets + 1] = widget
	end

	self.bg_widgets = {}

	for _, definition in ipairs(bg_widget_definitions) do
		local widget = UIWidget.init(definition)
		widget.content.visible = false
		self.bg_widgets[#self.bg_widgets + 1] = widget
	end

	self.name_widgets = {}

	for _, definition in ipairs(name_widget_definitions) do
		local widget = UIWidget.init(definition)
		widget.content.visible = false
		self.name_widgets[#self.name_widgets + 1] = widget
	end
end

VoiceChatUI.destroy = function (self)
	if self.icon_widgets then
		for _, widget in ipairs(self.icon_widgets) do
			UIWidget.destroy(self.ui_top_renderer, widget)
		end

		self.icon_widget = nil
	end

	if self.bg_widgets then
		for _, widget in ipairs(self.bg_widgets) do
			UIWidget.destroy(self.ui_top_renderer, widget)
		end

		self.bg_widgets = nil
	end

	if self.name_widgets then
		for _, widget in ipairs(self.name_widgets) do
			UIWidget.destroy(self.ui_top_renderer, widget)
		end

		self._name_widgets = nil
	end

	GarbageLeakDetector.register_object(self, "voice_chat_ui")
end

local MEMBERS = {}

VoiceChatUI.update = function (self, dt)
	local talked_last_frame = self._talked_last_frame
	local talking_this_frame = self._talking_this_frame
	local dirty = false

	table.clear(MEMBERS)

	local lobby = self._lobby
	local lobby_members = lobby and lobby:members()
	local members = lobby_members and lobby_members:get_members()

	if members then
		for _, peer_id in ipairs(members) do
			MEMBERS[peer_id] = true
		end
	end

	if not RETAINED_MODE_ENABLED then
		dirty = true
	end

	for peer_id, player in pairs(talked_last_frame) do
		if not MEMBERS[peer_id] then
			talked_last_frame[peer_id] = nil
			dirty = true
		end
	end

	for peer_id, player in pairs(talking_this_frame) do
		if not MEMBERS[peer_id] then
			talking_this_frame[peer_id] = nil
			dirty = true
		end
	end

	for peer_id, player in pairs(self._cached_names) do
		if not MEMBERS[peer_id] then
			self._cached_names[peer_id] = nil
			dirty = true
		end
	end

	for peer_id, _ in pairs(MEMBERS) do
		local talking = self.voip:is_talking(peer_id)
		local was_talking = talked_last_frame[peer_id]
		talking_this_frame[peer_id] = talking

		if (not was_talking and talking) or (was_talking and not talking) then
			dirty = true
		end
	end

	if dirty then
		local index = 1

		for peer_id, talking in pairs(talking_this_frame) do
			if talking then
				local icon_widget = self.icon_widgets[index]
				icon_widget.content.visible = true
				icon_widget.element.dirty = true
				local bg_widget = self.bg_widgets[index]
				bg_widget.content.visible = true
				bg_widget.element.dirty = true
				local name_widget = self.name_widgets[index]

				if not self._cached_names[peer_id] then
					local lobby = self._lobby
					local lobby_state = lobby.state

					if lobby_state and lobby_state == "joined" then
						self._cached_names[peer_id] = lobby:user_name(peer_id)
					end
				end

				local name = self._cached_names[peer_id] or tostring(peer_id)
				local cropped_name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(name) and UIRenderer.crop_text_width(self.ui_top_renderer, name, 250, name_widget.style.text)) or name
				name_widget.content.text = cropped_name
				name_widget.content.visible = true
				name_widget.element.dirty = true
				index = index + 1
			end
		end

		for i = index, NUM_SLOTS, 1 do
			local icon_widget = self.icon_widgets[index]
			icon_widget.content.visible = false
			icon_widget.element.dirty = true
			local bg_widget = self.bg_widgets[index]
			bg_widget.content.visible = false
			bg_widget.element.dirty = true
			local name_widget = self.name_widgets[index]
			name_widget.content.visible = false
			name_widget.element.dirty = true
			index = index + 1
		end

		self._dirty = true
	end

	self._talked_last_frame = talking_this_frame

	self:draw(dt)
end

VoiceChatUI.draw = function (self, dt)
	if not self._dirty then
		return
	end

	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

	for i = 1, NUM_SLOTS, 1 do
		UIRenderer.draw_widget(ui_top_renderer, self.icon_widgets[i])
		UIRenderer.draw_widget(ui_top_renderer, self.bg_widgets[i])
		UIRenderer.draw_widget(ui_top_renderer, self.name_widgets[i])
	end

	UIRenderer.end_pass(ui_top_renderer)

	self._dirty = false
end

return
