-- chunkname: @scripts/ui/views/voice_chat_ui.lua

VoiceChatUI = class(VoiceChatUI)

local RETAINED_MODE_ENABLED = true
local NUM_SLOTS = 4
local PLAYER_NAME_MAX_LENGTH = 16
local scenegraph_definition = {
	root = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.chat,
		},
	},
	icon_slot_1 = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "top",
		size = {
			24,
			25,
		},
		position = {
			140,
			-54,
			1,
		},
	},
	icon_slot_2 = {
		horizontal_alignment = "center",
		parent = "icon_slot_1",
		vertical_alignment = "bottom",
		size = {
			24,
			25,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	icon_slot_3 = {
		horizontal_alignment = "center",
		parent = "icon_slot_2",
		vertical_alignment = "bottom",
		size = {
			24,
			25,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	icon_slot_4 = {
		horizontal_alignment = "center",
		parent = "icon_slot_3",
		vertical_alignment = "bottom",
		size = {
			24,
			25,
		},
		position = {
			0,
			-30,
			0,
		},
	},
	name_slot_1 = {
		horizontal_alignment = "left",
		parent = "icon_slot_1",
		vertical_alignment = "center",
		size = {
			400,
			24,
		},
		position = {
			25,
			0,
			0,
		},
	},
	name_slot_2 = {
		horizontal_alignment = "left",
		parent = "icon_slot_2",
		vertical_alignment = "center",
		size = {
			400,
			24,
		},
		position = {
			25,
			0,
			0,
		},
	},
	name_slot_3 = {
		horizontal_alignment = "left",
		parent = "icon_slot_3",
		vertical_alignment = "center",
		size = {
			400,
			24,
		},
		position = {
			25,
			0,
			0,
		},
	},
	name_slot_4 = {
		horizontal_alignment = "left",
		parent = "icon_slot_4",
		vertical_alignment = "center",
		size = {
			400,
			24,
		},
		position = {
			25,
			0,
			0,
		},
	},
	bg_slot_1 = {
		horizontal_alignment = "left",
		parent = "icon_slot_1",
		vertical_alignment = "center",
		size = {
			250,
			25,
		},
		position = {
			-5,
			0,
			-1,
		},
	},
	bg_slot_2 = {
		horizontal_alignment = "left",
		parent = "icon_slot_2",
		vertical_alignment = "center",
		size = {
			250,
			25,
		},
		position = {
			-5,
			0,
			-1,
		},
	},
	bg_slot_3 = {
		horizontal_alignment = "left",
		parent = "icon_slot_3",
		vertical_alignment = "center",
		size = {
			250,
			25,
		},
		position = {
			-5,
			0,
			-1,
		},
	},
	bg_slot_4 = {
		horizontal_alignment = "left",
		parent = "icon_slot_4",
		vertical_alignment = "center",
		size = {
			250,
			25,
		},
		position = {
			-5,
			0,
			-1,
		},
	},
}

if not IS_WINDOWS then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = false
end

local icon_widget_definitions = {
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_1", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_2", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_3", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_icon_01", "icon_slot_4", false, RETAINED_MODE_ENABLED),
}
local bg_widget_definitions = {
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_1", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_2", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_3", false, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_texture("voice_chat_bg_01", "bg_slot_4", false, RETAINED_MODE_ENABLED),
}
local name_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 150),
	offset = {
		0,
		0,
		2,
	},
}
local name_widget_definitions = {
	UIWidgets.create_simple_text("player_1", "name_slot_1", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_2", "name_slot_2", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_3", "name_slot_3", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
	UIWidgets.create_simple_text("player_4", "name_slot_4", nil, nil, name_style, nil, RETAINED_MODE_ENABLED),
}
local DO_RELOAD = false
local UI_REMOVE_DELAY = 0.3

VoiceChatUI.init = function (self, ingame_ui_context)
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.player_manager = ingame_ui_context.player_manager
	self.voip = ingame_ui_context.voip
	self._lobby = ingame_ui_context.lobby
	self._cached_names = {}
	self._talking_peers = {}
	self._push_to_talk_talking = 0
	self._push_to_talk_active = false
	self._dirty = true
	self._safe_rect = Application.user_setting("safe_rect") or 0

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

	DO_RELOAD = false
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

VoiceChatUI._update_timer = function (self)
	self._timer = Application.time_since_launch()
end

VoiceChatUI._update_safe_rect = function (self)
	if IS_PS4 then
		local safe_rect = Application.user_setting("safe_rect") or 0

		if safe_rect ~= self._safe_rect then
			self._safe_rect = safe_rect
			self._dirty = true
		end
	end
end

VoiceChatUI._gather_members = function (self, members_table)
	table.clear(members_table)

	local lobby = self._lobby
	local lobby_members = lobby and lobby:members()
	local members = lobby_members and lobby_members:get_members()

	if members then
		for _, peer_id in ipairs(members) do
			members_table[peer_id] = true
		end
	end
end

VoiceChatUI._update_talking_state = function (self, members_table)
	for peer_id, _ in pairs(members_table) do
		local is_talking = self.voip:is_talking(peer_id)
		local was_talking = self._talking_peers[peer_id]

		self._talking_peers[peer_id] = is_talking and self._timer + UI_REMOVE_DELAY or was_talking
		self._dirty = not was_talking and is_talking or self._dirty
	end

	for peer_id, timer in pairs(self._talking_peers) do
		if timer < self._timer then
			self._talking_peers[peer_id] = nil
			self._dirty = true
		end
	end

	self:_evaluate_push_to_talk()
end

VoiceChatUI._evaluate_push_to_talk = function (self)
	if not self.voip:push_to_talk_enabled() then
		return
	end

	local my_peer_id = Network.peer_id()
	local push_to_talk_active = self.voip:is_push_to_talk_active()
	local push_to_talk_talking = self.voip:is_talking(my_peer_id)
	local push_to_talk_was_active = self._push_to_talk_active
	local push_to_talk_was_talking = self._push_to_talk_talking > self._timer

	self._push_to_talk_active = push_to_talk_active
	self._push_to_talk_talking = push_to_talk_talking and self._timer + UI_REMOVE_DELAY or self._push_to_talk_talking
	self._talking_peers[my_peer_id] = push_to_talk_active and self._timer + UI_REMOVE_DELAY or self._talking_peers[my_peer_id]
	self._dirty = not push_to_talk_was_active and push_to_talk_active or push_to_talk_was_talking ~= push_to_talk_talking or self._push_to_talk_talking < self._timer or self._dirty
end

VoiceChatUI._update_widgets = function (self)
	if not self._dirty then
		return
	end

	local my_peer_id = Network.peer_id()
	local index = 1

	for peer_id, _ in pairs(self._talking_peers) do
		local icon_widget = self.icon_widgets[index]
		local icon_widget_content = icon_widget.content
		local icon_widget_element = icon_widget.element

		icon_widget_content.visible = true
		icon_widget_element.dirty = true

		local bg_widget = self.bg_widgets[index]
		local bg_widget_content = bg_widget.content
		local bg_widget_element = bg_widget.element

		bg_widget_content.visible = true
		bg_widget_element.dirty = true

		local name

		if HAS_STEAM then
			name = Steam.user_name(peer_id)
		else
			local player = Managers.player:player_from_peer_id(peer_id, 1)

			name = player and player:name()
		end

		if not name or name == "" then
			name = "Remote #" .. string.sub(peer_id, -3)
		end

		local name_widget = self.name_widgets[index]
		local cropped_name = UTF8Utils.string_length(name) > PLAYER_NAME_MAX_LENGTH and UIRenderer.crop_text_width(self.ui_top_renderer, name, 250, name_widget.style.text) or name
		local name_widget_content = name_widget.content
		local name_widget_element = name_widget.element

		name_widget_content.text = cropped_name
		name_widget_element.dirty = true

		if self.voip:push_to_talk_enabled() and peer_id == my_peer_id then
			name_widget_content.visible = self._push_to_talk_talking > self._timer
		else
			name_widget_content.visible = true
		end

		index = index + 1
	end

	for i = index, NUM_SLOTS do
		local icon_widget = self.icon_widgets[i]
		local icon_widget_content = icon_widget.content
		local icon_widget_element = icon_widget.element

		icon_widget_content.visible = false
		icon_widget_element.dirty = true

		local bg_widget = self.bg_widgets[i]
		local bg_widget_content = bg_widget.content
		local bg_widget_element = bg_widget.element

		bg_widget_content.visible = false
		bg_widget_element.dirty = true

		local name_widget = self.name_widgets[i]
		local name_widget_content = name_widget.content
		local name_widget_element = name_widget.element

		name_widget_content.visible = false
		name_widget_element.dirty = true
	end
end

local MEMBERS_TABLE = {}

VoiceChatUI.update = function (self, dt)
	self:_update_timer()
	self:_update_safe_rect()
	self:_gather_members(MEMBERS_TABLE)
	self:_update_talking_state(MEMBERS_TABLE)
	self:_update_widgets()
	self:_draw(dt)
end

VoiceChatUI._draw = function (self, dt)
	if not self._dirty then
		return
	end

	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

	for i = 1, NUM_SLOTS do
		UIRenderer.draw_widget(ui_top_renderer, self.icon_widgets[i])
		UIRenderer.draw_widget(ui_top_renderer, self.bg_widgets[i])
		UIRenderer.draw_widget(ui_top_renderer, self.name_widgets[i])
	end

	UIRenderer.end_pass(ui_top_renderer)

	self._dirty = not RETAINED_MODE_ENABLED
end
