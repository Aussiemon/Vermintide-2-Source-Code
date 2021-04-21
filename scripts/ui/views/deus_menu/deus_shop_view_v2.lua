require("scripts/network/shared_state")

local definitions = local_require("scripts/ui/views/deus_menu/deus_shop_view_definitions_v2")
local WITCH_HUNTER = 1
local BRIGHT_WIZARD = 2
local DWARF_RANGER = 3
local WOOD_ELF = 4
local EMPIRE_SOLDIER = 5
local BACKGROUND_PROFILE_UNITS = {
	[WITCH_HUNTER] = {
		unit_package = "units/props/deus_idol/deus_sigmar_01",
		unit_name = "units/props/deus_idol/deus_sigmar_01"
	},
	[BRIGHT_WIZARD] = {
		unit_package = "units/props/deus_idol/deus_myrmidia_01",
		unit_name = "units/props/deus_idol/deus_myrmidia_01"
	},
	[DWARF_RANGER] = {
		unit_package = "units/props/deus_idol/deus_valaya_01",
		unit_name = "units/props/deus_idol/deus_valaya_01"
	},
	[WOOD_ELF] = {
		unit_package = "units/props/deus_idol/deus_lileath_01",
		unit_name = "units/props/deus_idol/deus_lileath_01"
	},
	[EMPIRE_SOLDIER] = {
		unit_package = "units/props/deus_idol/deus_taal_01",
		unit_name = "units/props/deus_idol/deus_taal_01"
	}
}
local SOUND_EVENTS = {
	blessing_bought = "hud_morris_map_shrine_buy_blessing",
	power_up_bought = "hud_morris_map_shrine_buy_power_up",
	button_hover = "hud_morris_hover",
	ready_pressed = "hud_morris_close"
}

require("scripts/settings/dlcs/morris/deus_cost_settings")
require("scripts/settings/dlcs/morris/deus_shop_settings")

DeusShopView = class(DeusShopView)
local REAL_PLAYER_LOCAL_ID = 1
local SELECT_COUNTDOWN = 60
local FINAL_COUNTDOWN = 5
local states = {
	FINISHED = 5,
	SELECTING = 3,
	INITIALIZED = 1,
	FINISHING = 4,
	STARTING = 2
}
local peer_states = {
	READY_TO_BUY = 1,
	DONE_BUYING = 2
}
local shared_state_spec = {
	server = {
		shop_state = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		}
	},
	peer = {
		peer_state = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		}
	}
}

SharedState.validate_spec(shared_state_spec)

local function get_color_for_consumable_item(item_key)
	local default_color = UISettings.inventory_consumable_slot_colors.default

	return (item_key and UISettings.inventory_consumable_slot_colors[item_key]) or default_color
end

local function update_portrait(widget, frame_name, offset)
	local frame_settings = UIPlayerPortraitFrameSettings[frame_name] or UIPlayerPortraitFrameSettings.default

	for index, frame_data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = frame_data.texture or "icons_placeholder"
		local size = nil

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
			size = texture_settings.size
		else
			size = frame_data.size
		end

		size = (size and table.clone(size)) or {
			0,
			0
		}
		offset = (offset and table.clone(offset)) or {
			0,
			0,
			0
		}

		if frame_data.offset then
			offset[1] = offset[1] + frame_data.offset[1]
			offset[2] = offset[2] + frame_data.offset[2]
			offset[3] = offset[3] + frame_data.offset[3]
		end

		offset[1] = -(size[1] / 2) + offset[1]
		offset[2] = offset[2]
		offset[3] = frame_data.layer or 0
		widget.content[name] = texture_name
		widget.style[name] = {
			color = frame_data.color or {
				255,
				255,
				255,
				255
			},
			offset = offset,
			size = size
		}
	end
end

DeusShopView.init = function (self, context)
	local input_service_name = "deus_shop_view"
	local input_manager = context.input_manager
	self._input_manager = input_manager
	self._world = context.world
	self._network_event_delegate = context.network_event_delegate
	self._input_service_name = input_service_name
	self._previous_bought_blessings = {}

	input_manager:create_input_service(input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "mouse")
	input_manager:map_device_to_service(input_service_name, "gamepad")

	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self._wwise_world = context.wwise_world
	self._is_server = context.is_server
	self._deus_run_controller = context.deus_run_controller
	local server_peer_id = self._deus_run_controller:get_server_peer_id()
	local own_peer_id = self._deus_run_controller:get_own_peer_id()
	self._shared_state = SharedState:new("deus_shop_" .. self._deus_run_controller:get_run_id(), shared_state_spec, self._is_server, context.network_server, server_peer_id, own_peer_id)

	self._shared_state:full_sync()

	if self._is_server then
		self._shared_state:set_server(self._shared_state:get_key("shop_state"), states.INITIALIZED)
	end

	local event = Managers.state.event

	event:register(self, "ingame_menu_opened", "on_ingame_menu_opened")
	event:register(self, "ingame_menu_closed", "on_ingame_menu_closed")
end

DeusShopView._set_camera_node = function (self, camera_node)
	local player = Managers.player:local_player()
	local camera_follow_unit = player.camera_follow_unit

	Unit.set_data(camera_follow_unit, "camera", "settings_node", camera_node)
end

DeusShopView.start = function (self, params)
	fassert(params, "DeusShopView needs params to be set in order to function properly, see GameModeMapDeus")

	self._finished = false
	self._finish_cb = params.finish_cb

	self:_set_camera_node("map_deus")
	self:_acquire_input()

	self._render_top_widgets = true
	self._selecting_countdown = nil
	self._final_countdown = FINAL_COUNTDOWN

	self._shared_state:set_own(self._shared_state:get_key("peer_state"), peer_states.READY_TO_BUY)

	if self._is_server then
		self._shared_state:set_server(self._shared_state:get_key("shop_state"), states.STARTING)
	end

	local current_node = self._deus_run_controller:get_current_node()
	self._shop_type = current_node.level
	self._shop_config = DeusShopSettings.shop_types[self._shop_type]
	self._available_blessings = self._shop_config.blessings
	self._available_power_ups = self._deus_run_controller:generate_random_power_ups(self._shop_config.power_up_count, DeusPowerUpAvailabilityTypes.shrine)
	local own_peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, _ = self._deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local background_unit_settings = BACKGROUND_PROFILE_UNITS[profile_index]

	self:_create_ui_elements(self._shop_config, self._available_power_ups, self._available_blessings, background_unit_settings)

	local vo_unit = LevelHelper:find_dialogue_unit(self._world, "ferry_lady_01")
	local dialogue_input = ScriptUnit.extension_input(vo_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_dialogue_event("deus_shrine_tutorial", event_data)
end

DeusShopView.register_rpcs = function (self, network_event_delegate, network_transmit)
	self._shared_state:register_rpcs(network_event_delegate)
end

DeusShopView.unregister_rpcs = function (self)
	self._shared_state:unregister_rpcs()
end

DeusShopView._create_ui_elements = function (self, shop_settings, power_ups, blessings, background_unit_settings)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	widgets_by_name.bottom_text.content.text = Localize("deus_shrine_continue_info")
	widgets_by_name.ready_button.content.title_text = Localize("deus_ready_button")
	local top_widgets = {}

	for name, widget_definition in pairs(definitions.top_widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			top_widgets[#top_widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	local player_widgets = {}

	for name, widget_definition in pairs(definitions.player_widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			player_widgets[#player_widgets + 1] = widget
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	local local_peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local shop_items = {
		power_ups = {},
		blessings = {}
	}
	local power_up_templates = DeusPowerUpTemplates
	local shop_item_widgets = {}
	local num_power_ups = #power_ups

	for i = 1, num_power_ups, 1 do
		local power_up = power_ups[i]
		local power_up_template = power_up_templates[power_up.name]
		local is_rectangular_icon = power_up_template.rectangular_icon
		local widget_size = definitions.scenegraph_definition.power_up_root.size
		local widget_definition = definitions.create_power_up_shop_item("power_up_root", widget_size, false, is_rectangular_icon)
		local widget = UIWidget.init(widget_definition)
		local step = i - 1
		local max_steps = num_power_ups - 1
		local rad = math.rad(step / max_steps * 180)
		local max_spacing_x = 60
		local spacing_y = 0
		local widget_offset_y = widget_size[2] + spacing_y
		local max_spacing_y = widget_offset_y * num_power_ups + widget_size[2]
		local init_pos_y = max_spacing_y / 2
		widget.offset = {
			max_spacing_x * math.sin(rad),
			init_pos_y - (spacing_y + widget_size[2]) * i,
			0
		}
		local has_discount = i <= shop_settings.max_discounts
		local discount = has_discount and shop_settings.power_up_discount
		local max_value = nil
		local current_value = 0

		self:_init_power_up_widget(widget, power_up, discount, current_value, max_value, profile_index, career_index)

		widgets[#widgets + 1] = widget
		shop_item_widgets[#shop_item_widgets + 1] = widget
		widgets_by_name["power_up_item_" .. i] = widget
		shop_items.power_ups[#shop_items.power_ups + 1] = {
			widget = widget,
			power_up = power_up,
			discount = discount
		}
	end

	local num_blessings = #blessings

	for i = 1, num_blessings, 1 do
		local widget_size = definitions.scenegraph_definition.blessing_root.size
		local widget_definition = definitions.create_blessing_shop_item("blessing_root", widget_size, false)
		local widget = UIWidget.init(widget_definition)
		local spacing_y = 15
		local widget_offset_y = widget_size[2] + spacing_y
		local max_spacing_y = widget_offset_y * num_blessings + widget_size[2]
		local init_pos_y = max_spacing_y / 2
		widget.offset = {
			0,
			init_pos_y - (spacing_y + widget_size[2]) * i,
			0
		}
		local blessing_name = blessings[i]

		self:_init_blessing_widget(widget, blessing_name)

		widgets[#widgets + 1] = widget
		shop_item_widgets[#shop_item_widgets + 1] = widget
		widgets_by_name["blessing_item_" .. i] = widget
		shop_items.blessings[#shop_items.blessings + 1] = {
			widget = widget,
			blessing_name = blessing_name
		}
	end

	self._shop_items = shop_items
	self._shop_item_widgets = shop_item_widgets
	self._widgets = widgets
	self._top_widgets = top_widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	if background_unit_settings then
		local background_unit_definition = self:_create_background_unit_definition()
		self._background_unit_widget = UIWidget.init(background_unit_definition)
		local unit_name = background_unit_settings.unit_name
		local unit_package = background_unit_settings.unit_package
		self._unit_previewer = self:_create_unit_previewer(self._background_unit_widget, unit_name, unit_package)

		self._unit_previewer:set_zoom_fraction_unclamped(-0.2)
	end
end

DeusShopView.update = function (self, dt, t)
	local state = self._shared_state:get_server(self._shared_state:get_key("shop_state"))

	self:_update_countdowns(state, dt, t)

	if self._is_server then
		local new_state = self:_check_transition(state)

		if new_state ~= state then
			self._shared_state:set_server(self._shared_state:get_key("shop_state"), new_state)

			state = new_state
		end
	end

	if state == states.STARTING then
		self:_update_during_starting(dt, t)
	elseif state == states.SELECTING then
		self:_update_during_selecting(dt, t)
	elseif state == states.FINISHING then
		self:_update_during_finishing(dt, t)
	elseif state == states.FINISHED and not self._finished then
		self:_finish()

		self._finished = true
	end

	local unit_previewer = self._unit_previewer

	if unit_previewer then
		unit_previewer:update(dt, t, false)
	end

	self:_update_player_data()
	self:_update_background_animations(dt)
	self:_draw(dt, t)
end

DeusShopView.post_update = function (self, dt, t)
	if self._unit_previewer then
		self._unit_previewer:post_update(dt, t)
	end
end

DeusShopView.destroy_idol = function (self)
	if self._background_unit_widget then
		self._unit_previewer:destroy()

		self._unit_previewer = nil

		UIWidget.destroy(self.ui_renderer, self._background_unit_widget)

		self._background_unit_widget = nil
	end
end

DeusShopView.destroy = function (self)
	self:destroy_idol()
	self._shared_state:destroy()

	self._shared_state = nil
	local event = Managers.state.event

	event:unregister("ingame_menu_opened", self)
	event:unregister("ingame_menu_closed", self)
end

DeusShopView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusShopView._finish = function (self, data)
	local finish_cb = self._finish_cb

	if finish_cb then
		self._finish_cb = nil

		finish_cb(data)
	end

	self:_release_input()
	self:_set_camera_node("first_person_node")
end

DeusShopView._init_power_up_widget = function (self, widget, power_up_instance, discount, current_value, max_value, profile_index, career_index)
	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
	local rarity = power_up.rarity
	local content = widget.content
	content.title_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
	content.rarity_text = Localize(RaritySettings[rarity].display_name)
	content.sub_text = DeusPowerUpUtils.get_power_up_description(power_up, profile_index, career_index)
	content.max_value_text = nil
	content.current_value_text = nil
	content.has_discount = discount
	content.icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
	local price = DeusCostSettings.shop.power_ups[rarity] or 9001

	if discount then
		price = price - price * discount
	end

	content.price_text = tostring(price)
	local style = widget.style
	local rarity_color = Colors.get_table(rarity)
	style.rarity_text.text_color = rarity_color

	if discount then
		style.price_text.text_color = definitions.discount_text_color
	end

	if not max_value or not current_value then
		local offset_y = definitions.single_price_offset[2]
		style.price_icon.offset[2] = style.price_icon.offset[2] + offset_y
		style.price_text.offset[2] = style.price_text.offset[2] + offset_y
		style.price_text_shadow.offset[2] = style.price_text_shadow.offset[2] + offset_y
		style.price_text_disabled.offset[2] = style.price_text_disabled.offset[2] + offset_y
	end
end

DeusShopView._init_blessing_widget = function (self, widget, blessing_name)
	local content = widget.content
	local blessing_settings = DeusBlessingSettings[blessing_name]
	content.title_text = Localize(blessing_settings.display_name)
	content.sub_text = Localize(blessing_settings.description)
	content.icon = blessing_settings.shop_icon
	local price = DeusCostSettings.shop.blessings[blessing_name] or 9001
	content.price_text = price
end

DeusShopView._update_countdowns = function (self, state, dt, t)
	if state == states.FINISHING then
		self._final_countdown = (self._final_countdown and math.max(0, self._final_countdown - dt)) or nil
	end
end

DeusShopView._check_transition = function (self, state)
	if state == states.STARTING then
		if self:_are_all_peers_ready() then
			return states.SELECTING
		end
	elseif state == states.SELECTING then
		if self._selecting_countdown == 0 or self:_are_all_peers_done() then
			self._selecting_countdown = 0

			return states.FINISHING
		end
	elseif state == states.FINISHING and self._final_countdown == 0 then
		return states.FINISHED
	end

	return state
end

DeusShopView._update_during_starting = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local bottom_text_widget_content = widgets_by_name.bottom_text.content
	bottom_text_widget_content.text = Localize("deus_shrine_waiting_info")
	widgets_by_name.ready_button.content.button_hotspot.disable_button = true

	self:_update_shop_widgets()
end

DeusShopView._update_during_selecting = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local bottom_text_widget_content = widgets_by_name.bottom_text.content
	bottom_text_widget_content.text = Localize("deus_shrine_continue_info")
	local key = self._shared_state:get_key("peer_state")
	local ready_state = self._shared_state:get_own(key) == peer_states.DONE_BUYING
	widgets_by_name.ready_button.content.button_hotspot.disable_button = ready_state

	if self._selecting_countdown then
		local new_countdown = self._selecting_countdown - dt
		new_countdown = math.max(new_countdown, 0)
		widgets_by_name.timer_text.content.text = math.floor(new_countdown)
		self._selecting_countdown = new_countdown
	elseif self:_did_someone_vote() then
		self._selecting_countdown = SELECT_COUNTDOWN
	end

	self:_update_shop_widgets()
	self:_handle_input()
end

DeusShopView._update_during_finishing = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local bottom_text_widget_content = widgets_by_name.bottom_text.content
	bottom_text_widget_content.text = Localize("deus_shrine_continue_in")
	widgets_by_name.ready_button.content.button_hotspot.disable_button = true
	widgets_by_name.timer_text.content.text = nil

	self:_update_shop_widgets()
	self:_handle_input()
end

DeusShopView._update_shop_widgets = function (self)
	local local_peer_id = self._deus_run_controller:get_own_peer_id()
	local coins = self._deus_run_controller:get_player_soft_currency(local_peer_id)
	local coins_widget = self._widgets_by_name.coins_text
	coins_widget.content.text = string.format("%d", coins)
	local shop_items = self._shop_items

	for _, power_up_data in ipairs(shop_items.power_ups) do
		local widget = power_up_data.widget
		local power_up = power_up_data.power_up
		local discount = power_up_data.discount
		local costs = self:_get_power_up_costs(power_up.rarity, discount)
		local max_power_ups_reached = self._deus_run_controller:reached_max_power_ups(local_peer_id, power_up.name)
		local bought = self._deus_run_controller:has_power_up(local_peer_id, power_up.client_id)
		local content = widget.content

		if max_power_ups_reached or bought then
			content.is_bought = true
			content.button_hotspot.disable_button = true
		elseif coins < costs then
			content.button_hotspot.disable_button = true
		else
			content.is_bought = false
			content.button_hotspot.disable_button = false
		end
	end

	local blessings_with_buyer = self._deus_run_controller:get_blessings_with_buyer()
	local blessing_costs = DeusCostSettings.shop.blessings

	for _, blessing_data in ipairs(shop_items.blessings) do
		local widget = blessing_data.widget
		local blessing_name = blessing_data.blessing_name
		local costs = blessing_costs[blessing_name] or 9001
		local content = widget.content
		local buyer = blessings_with_buyer[blessing_name]

		if buyer then
			content.is_bought = true
			content.button_hotspot.disable_button = true
			local profile_index, career_index = self._deus_run_controller:get_player_profile(buyer, REAL_PLAYER_LOCAL_ID)

			if profile_index ~= 0 then
				local profile_data = SPProfiles[profile_index]
				local careers = profile_data.careers
				local career_data = careers[career_index]
				local name = self._deus_run_controller:get_player_name(buyer)
				local level = self._deus_run_controller:get_player_level(buyer, profile_index)
				local frame = self._deus_run_controller:get_player_frame(buyer, profile_index, career_index)
				local offset = {
					541,
					75,
					10
				}

				update_portrait(widget, frame, offset)

				content.player_name_text = name
				content.character_portrait = career_data.portrait_image
				content.level = tostring(level)
			end

			if not self._previous_bought_blessings[blessing_name] and buyer ~= local_peer_id then
				self:_play_sound(SOUND_EVENTS.blessing_bought)
			end
		elseif coins < costs then
			content.button_hotspot.disable_button = true
		else
			content.button_hotspot.disable_button = false
			content.is_bought = false
		end

		self._previous_bought_blessings[blessing_name] = content.is_bought
	end
end

DeusShopView._acquire_input = function (self, ignore_cursor_stack)
	self:_release_input(true)

	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, input_service_name, "DeusShopView")
	input_manager:block_device_except_service(input_service_name, "mouse")

	if not ignore_cursor_stack then
		ShowCursorStack.push()
		input_manager:enable_gamepad_cursor()
	end
end

DeusShopView._release_input = function (self, ignore_cursor_stack)
	local input_manager = self._input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusShopView")
	input_manager:device_unblock_all_services("mouse")

	if not ignore_cursor_stack then
		ShowCursorStack.pop()
		input_manager:disable_gamepad_cursor()
	end
end

DeusShopView._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

DeusShopView._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

DeusShopView._update_button_hover_sound = function (self, widget)
	if self:_is_button_hovered(widget) then
		self:_play_sound(SOUND_EVENTS.button_hover)
	end
end

DeusShopView._on_blessing_bought = function (self, blessing_name)
	self._deus_run_controller:shop_buy_blessing(blessing_name)
end

DeusShopView._on_power_up_bought = function (self, power_up, discount)
	self._deus_run_controller:shop_buy_power_up(power_up, discount)
end

DeusShopView._handle_input = function (self)
	local shop_items = self._shop_items

	for _, power_up_data in ipairs(shop_items.power_ups) do
		local widget = power_up_data.widget

		if self:_is_button_pressed(widget) then
			local power_up = power_up_data.power_up
			local discount = power_up_data.discount

			self:_on_power_up_bought(power_up, discount or 0)
			self:_play_sound(SOUND_EVENTS.power_up_bought)
		end

		self:_update_button_hover_sound(widget)
	end

	for _, blessing_data in ipairs(shop_items.blessings) do
		local widget = blessing_data.widget

		if self:_is_button_pressed(widget) then
			self:_on_blessing_bought(blessing_data.blessing_name)
			self:_play_sound(SOUND_EVENTS.blessing_bought)
		end

		self:_update_button_hover_sound(widget)
	end

	local widgets_by_name = self._widgets_by_name

	self:_update_button_hover_sound(widgets_by_name.ready_button)

	if self:_is_button_pressed(widgets_by_name.ready_button) then
		local key = self._shared_state:get_key("peer_state")

		self._shared_state:set_own(key, peer_states.DONE_BUYING)
		self:_play_sound(SOUND_EVENTS.ready_pressed)
	end
end

DeusShopView._get_power_up_costs = function (self, rarity, discount)
	local cost = DeusCostSettings.shop.power_ups[rarity] or 9001

	if discount then
		cost = cost - math.round(cost * discount)
	end

	return cost
end

DeusShopView._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusShopView._update_player_data = function (self)
	local player_data = {
		{}
	}
	local local_peer_id = Network.peer_id()
	local peers = self._deus_run_controller:get_peers()

	for i = 1, 4, 1 do
		local peer_id = peers[i]

		if peer_id then
			local data = nil

			if peer_id == local_peer_id then
				data = player_data[1]
			else
				data = {}
				player_data[#player_data + 1] = data
			end

			local profile_index, career_index = self._deus_run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)

			if profile_index ~= 0 and career_index ~= 0 then
				data.profile_index = profile_index
				data.career_index = career_index
				data.level = self._deus_run_controller:get_player_level(peer_id, data.profile_index)
				data.frame = self._deus_run_controller:get_player_frame(peer_id, data.profile_index, data.career_index)
				data.name = self._deus_run_controller:get_player_name(peer_id)
				data.health_percentage = self._deus_run_controller:get_player_health_percentage(peer_id, REAL_PLAYER_LOCAL_ID) or 1
				data.healthkit_consumable = self._deus_run_controller:get_player_consumable_healthkit_slot(peer_id, REAL_PLAYER_LOCAL_ID)
				data.potion_consumable = self._deus_run_controller:get_player_consumable_potion_slot(peer_id, REAL_PLAYER_LOCAL_ID)
				data.grenade_consumable = self._deus_run_controller:get_player_consumable_grenade_slot(peer_id, REAL_PLAYER_LOCAL_ID)
				data.ammo_percentage = self._deus_run_controller:get_player_ranged_ammo(peer_id, REAL_PLAYER_LOCAL_ID)
				data.soft_currency = self._deus_run_controller:get_player_soft_currency(peer_id) or 0
				data.peer_state = self._shared_state:get_peer(peer_id, self._shared_state:get_key("peer_state"))
			else
				data.profile_index = 0
				data.career_index = 0
				data.level = 1
				data.frame = "default"
				data.health_percentage = 1
				data.soft_currency = 0
			end
		end
	end

	self:_update_player_portraits(player_data)
end

DeusShopView._update_player_portraits = function (self, player_data)
	local widgets_by_name = self._widgets_by_name
	local ready_button_tokens = widgets_by_name.ready_button_tokens

	for i = 1, 4, 1 do
		local data = player_data[i]
		local player_portrait = widgets_by_name["player_portrait_" .. i]
		local player_texts = widgets_by_name["player_texts_" .. i]
		local should_be_visible = not not data
		player_portrait.content.visible = should_be_visible
		player_texts.content.visible = should_be_visible
		local token_icon_name = "token_icon_" .. i
		ready_button_tokens.content[token_icon_name] = nil

		if should_be_visible then
			update_portrait(player_portrait, data.frame)

			player_portrait.content.level = data.level or "-"
			player_texts.content.name_text = data.name or ""
			player_texts.content.coins_text = string.format("%d", data.soft_currency or 0)
			player_portrait.style.token_icon.saturated = data.peer_state == peer_states.DONE_BUYING

			if data.profile_index and data.profile_index ~= 0 then
				local profile_data = SPProfiles[data.profile_index]
				local careers = profile_data.careers
				local career_data = careers[data.career_index]
				player_portrait.content.character_portrait = career_data.portrait_image
				local hero_selection_image = profile_data.hero_selection_image
				player_portrait.content.token_icon = profile_data.hero_selection_image

				if data.peer_state == peer_states.DONE_BUYING then
					ready_button_tokens.content[token_icon_name] = hero_selection_image
				end
			else
				player_portrait.content.character_portrait = "unit_frame_portrait_default"
				player_portrait.content.token_icon = nil
			end

			player_portrait.content.hp_bar.bar_value = data.health_percentage or 0
			player_portrait.content.ammo_percentage = data.ammo_percentage or 0
			local healthkit_item = data.healthkit_consumable
			player_portrait.content.healthkit_slot = healthkit_item and ItemMasterList[healthkit_item].hud_icon
			player_portrait.style.healthkit_slot_bg.color = get_color_for_consumable_item(healthkit_item)
			local potion_item = data.potion_consumable
			player_portrait.content.potion_slot = potion_item and ItemMasterList[potion_item].hud_icon
			player_portrait.style.potion_slot_bg.color = get_color_for_consumable_item(potion_item)
			local grenade_item = data.grenade_consumable
			player_portrait.content.grenade_slot = grenade_item and ItemMasterList[grenade_item].hud_icon
			player_portrait.style.grenade_slot_bg.color = get_color_for_consumable_item(grenade_item)
		end
	end
end

DeusShopView._are_all_peers_ready = function (self)
	local local_peer_id = self._deus_run_controller:get_own_peer_id()

	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		if local_peer_id ~= peer_id then
			local key = self._shared_state:get_key("peer_state")
			local ready_state = self._shared_state:get_peer(peer_id, key) == peer_states.READY_TO_BUY

			if ready_state ~= true then
				return false
			end
		end
	end

	return true
end

DeusShopView._are_all_peers_done = function (self)
	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local key = self._shared_state:get_key("peer_state")
		local ready_state = self._shared_state:get_peer(peer_id, key) == peer_states.DONE_BUYING

		if ready_state ~= true then
			return false
		end
	end

	return true
end

DeusShopView._did_someone_vote = function (self)
	for _, peer_id in ipairs(self._deus_run_controller:get_peers()) do
		local key = self._shared_state:get_key("peer_state")
		local ready_state = self._shared_state:get_peer(peer_id, key) == peer_states.DONE_BUYING

		if ready_state == true then
			return true
		end
	end

	return false
end

DeusShopView._animate_shop_item_widget = function (self, dt, widget)
	local content = widget.content
	local style = widget.style
	local hotspot = content.hotspot or content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_bought = content.is_bought
	local is_selected = hotspot.is_selected
	local hover_progress = hotspot.hover_progress or 0
	local highlight_progress = hotspot.highlight_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 15

	if is_bought then
		is_hover = false
	end

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_bought then
		highlight_progress = math.min(highlight_progress + dt * speed, 1)
	else
		highlight_progress = math.max(highlight_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local bought_glow_style_ids = content.bought_glow_style_ids

	if bought_glow_style_ids then
		for _, style_id in ipairs(content.bought_glow_style_ids) do
			style[style_id].color[1] = 255 * highlight_progress
		end
	end

	style.hover.color[1] = 255 * hover_progress
	style.icon_hover_frame.color[1] = 255 * hover_progress
	local value_progress = hotspot.value_progress or 0
	value_progress = math.max(value_progress - dt * speed, 0)

	if style.icon_equipped_frame then
		style.icon_equipped_frame.color[1] = 255 * value_progress
	end

	hotspot.value_progress = value_progress
	hotspot.hover_progress = hover_progress
	hotspot.highlight_progress = highlight_progress
	hotspot.selection_progress = selection_progress
end

DeusShopView._draw = function (self, dt)
	for _, widget in ipairs(self._shop_item_widgets) do
		self:_animate_shop_item_widget(dt, widget)
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.ready_button, dt)

	local ui_scenegraph = self.ui_scenegraph
	local input_service = self._input_manager:get_service(self._input_service_name)
	local render_settings = self.render_settings

	if self._render_top_widgets then
		local ui_top_renderer = self.ui_top_renderer
		local top_widgets = self._top_widgets

		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		for i = 1, #top_widgets, 1 do
			UIRenderer.draw_widget(ui_top_renderer, top_widgets[i])
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	local ui_renderer = self.ui_renderer

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._background_unit_widget then
		UIRenderer.draw_widget(ui_renderer, self._background_unit_widget)
	end

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)
end

DeusShopView._create_unit_previewer = function (self, widget, unit_name, package_name)
	local pass_data = widget.element.pass_data[1]
	local viewport = pass_data.viewport
	local world = pass_data.world

	World.set_data(world, "avoid_blend", true)

	local preview_position = {
		0,
		2.5,
		-0.5
	}
	local unit_previewer = UIUnitPreviewer:new(unit_name, package_name, preview_position, world, viewport)

	unit_previewer:activate_auto_spin()

	return unit_previewer
end

DeusShopView._create_background_unit_definition = function (self)
	local shading_environment = "environment/ui_weave_forge_preview"

	return {
		scenegraph_id = "background_unit",
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 840,
				world_name = "item_preview",
				viewport_type = "default_forward",
				viewport_name = "item_preview_viewport",
				enable_sub_gui = false,
				fov = 20,
				shading_environment = shading_environment,
				camera_position = {
					0,
					0,
					0
				},
				camera_lookat = {
					0,
					0,
					0
				}
			}
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true
			}
		}
	}
end

DeusShopView._update_background_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name

	for i = 1, 3, 1 do
		local wheel_widget = widgets_by_name["background_wheel_0" .. i]
		local current_angle = wheel_widget.style.texture_id.angle
		local angle_add = 0
		local circle_speed_modifier = nil

		if i == 1 then
			circle_speed_modifier = 0.2
		elseif i == 2 then
			circle_speed_modifier = -0.1
		else
			circle_speed_modifier = 0.05
		end

		local speed = dt * circle_speed_modifier
		angle_add = current_angle + speed
		wheel_widget.style.texture_id.angle = angle_add
	end
end

DeusShopView.on_ingame_menu_opened = function (self)
	self._render_top_widgets = false

	Managers.input:disable_gamepad_cursor()
end

DeusShopView.on_ingame_menu_closed = function (self)
	self._render_top_widgets = true

	Managers.input:enable_gamepad_cursor()
end

return
