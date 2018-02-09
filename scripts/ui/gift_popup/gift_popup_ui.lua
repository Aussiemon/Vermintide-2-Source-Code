local definitions = local_require("scripts/ui/gift_popup/gift_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local generic_input_actions = definitions.generic_input_actions
local create_reward_thumb_widget = definitions.create_reward_thumb_widget
local animation_definitions = definitions.animation_definitions
local temp_rewards = {
	{
		item_key = "es_hood_0001"
	},
	{
		item_key = "dr_helmet_0013"
	},
	{
		item_key = "wh_2h_sword_0165"
	},
	{
		item_key = "wh_brace_of_pistols_0033"
	},
	{
		item_key = "bw_gate_0012"
	}
}
local GIFT_POLL_COOLDOWN = 1.5
local chest_idle_animations = {
	"loot_chest_jump",
	"loot_chest_jump_02"
}
GiftPopupUI = class(GiftPopupUI)
GiftPopupUI.init = function (self, ingame_ui_context)
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.world_manager = ingame_ui_context.world_manager
	local level_world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(level_world)
	self.loaded_packages = {}
	self.packages_to_load = {}
	self.ui_animations = {}
	local input_manager = Managers.input
	local input_service_name = "gift_popup"

	input_manager.create_input_service(input_manager, input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, input_service_name, "keyboard")
	input_manager.map_device_to_service(input_manager, input_service_name, "mouse")
	input_manager.map_device_to_service(input_manager, input_service_name, "gamepad")

	self.input_service_name = input_service_name
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ingame_ui_context = ingame_ui_context
	self.poll_cooldown = GIFT_POLL_COOLDOWN
	local event_manager = Managers.state.event

	event_manager.register(event_manager, self, "level_start_local_player_spawned", "event_initialize_poll")
	rawset(_G, "gift_popup_ui", self)

	return 
end
GiftPopupUI._create_world = function (self)
	local reward_world = self.world_manager:create_world("gift_world", "environment/blank_offscreen_chest", nil, 990)
	local reward_viewport = ScriptWorld.create_viewport(reward_world, "gift_world_viewport_default", "default", 0)

	ScriptWorld.deactivate_viewport(reward_world, reward_viewport)

	self.reward_world = reward_world
	self.reward_viewport = reward_viewport

	return 
end
GiftPopupUI._destroy_world = function (self)
	if self.reward_world then
		ScriptWorld.deactivate_viewport(self.reward_world, self.reward_viewport)
		ScriptWorld.destroy_viewport(self.reward_world, "gift_world_viewport_default")
		self.world_manager:destroy_world(self.reward_world)

		self.reward_world = nil
		self.reward_viewport = nil
	end

	return 
end
GiftPopupUI._create_ui_elements = function (self, rewards, title_text, description_text, button_text)
	self._create_world(self)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	self.reward_text_widgets = {
		title_text = UIWidget.init(widget_definitions.title_text),
		description_text = UIWidget.init(widget_definitions.description_text),
		reward_name_text = UIWidget.init(widget_definitions.reward_name_text),
		reward_type_text = UIWidget.init(widget_definitions.reward_type_text)
	}
	self.reward_text_widgets.title_text.content.text = title_text
	self.reward_text_widgets.description_text.content.text = description_text
	self.hero_icon_widgets = {
		hero_icon = UIWidget.init(widget_definitions.hero_icon),
		hero_icon_tooltip = UIWidget.init(widget_definitions.hero_icon_tooltip)
	}
	local num_rewards = #rewards
	local thumb_widgets = {}

	for i = 1, num_rewards, 1 do
		thumb_widgets[i] = UIWidget.init(create_reward_thumb_widget())
		local icon_glow_color = thumb_widgets[i].style.icon_glow.color
		local animation = UIAnimation.init(UIAnimation.pulse_animation, icon_glow_color, 1, 255, 190, 2)
		thumb_widgets[i].animations[animation] = true
	end

	self.thumb_widgets = thumb_widgets
	self.claim_button_widget = UIWidget.init(widget_definitions.claim_button)
	self.close_button_widget = UIWidget.init(widget_definitions.close_button)
	self.background_widget = UIWidget.init(widget_definitions.background)
	self.divider_widget = UIWidget.init(widget_definitions.divider)
	self.popup_bg_widget = UIWidget.init(widget_definitions.popup_bg)
	self.button_glow_widget = UIWidget.init(widget_definitions.button_glow)
	local button_glow_color = self.button_glow_widget.style.texture_id.color
	button_glow_color[1] = 0
	local button_glow_animation = UIAnimation.init(UIAnimation.pulse_animation, button_glow_color, 1, 50, 255, 2.5)
	self.button_glow_widget.animations[button_glow_animation] = true
	local start_alpha = 0
	self.popup_bg_widget.style.texture_id.color[1] = start_alpha
	self.divider_widget.style.texture_id.color[1] = start_alpha
	self.reward_text_widgets.title_text.style.text.text_color[1] = start_alpha
	self.reward_text_widgets.description_text.style.text.text_color[1] = start_alpha
	self.reward_text_widgets.reward_name_text.style.text.localize = false
	self.reward_text_widgets.reward_type_text.style.text.localize = false
	local claim_button = self.claim_button_widget
	claim_button.style.texture.color[1] = start_alpha
	claim_button.style.text.text_color[1] = start_alpha
	claim_button.style.text_hover.text_color[1] = start_alpha
	claim_button.style.text_selected.text_color[1] = start_alpha
	claim_button.style.text_disabled.text_color[1] = start_alpha
	self.claim_button_widget.content.text_field = button_text

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self.start(self, rewards)
	self._align_thumb_widgets(self)
	self._populate_thumb_widgets(self)

	local input_service = self.input_manager:get_service(self.input_service_name)
	local gui_layer = UILayer.item_display_popup + 30
	self.menu_input_description = MenuInputDescriptionUI:new(self.ingame_ui_context, self.ui_renderer, input_service, 5, gui_layer, generic_input_actions.default)

	self.menu_input_description:set_input_description(nil)

	return 
end
GiftPopupUI._align_thumb_widgets = function (self)
	local thumb_widgets = self.thumb_widgets
	local num_thumb_widgets = #thumb_widgets
	local max_display_width = 630
	local thumb_width = 64
	local total_thumb_width = num_thumb_widgets*thumb_width
	local free_spacing_width = (max_display_width - total_thumb_width)/math.max(num_thumb_widgets - 1, 1)
	local distance_between = (0 < free_spacing_width and math.min(free_spacing_width, 36)) or free_spacing_width
	local start_offset = -((distance_between + thumb_width)*(num_thumb_widgets - 1))/2

	for index, widget in ipairs(thumb_widgets) do
		widget.offset[1] = start_offset
		start_offset = start_offset + distance_between + thumb_width
	end

	return 
end
GiftPopupUI._populate_thumb_widgets = function (self)
	local thumb_widgets = self.thumb_widgets
	local rewards = self.rewards

	for index, widget in ipairs(thumb_widgets) do
		local reward_data = rewards[index]

		if reward_data then
			local content = widget.content
			local style = widget.style
			local item_key = reward_data.item_key
			local item_data = ItemMasterList[item_key]
			local item_rarity = item_data.rarity
			local ratity_color = Colors.get_color_table_with_alpha(item_rarity, 255)
			local display_name = item_data.display_name
			local item_type = item_data.item_type
			style.icon_frame.color = ratity_color
			content.icon = item_data.inventory_icon
			content.display_name = Localize(display_name)
			content.item_type = Localize(item_type)
			local draw_hero_icon = (#item_data.can_wield == 1 and true) or false
			content.draw_hero_icon = draw_hero_icon

			if draw_hero_icon then
				content.hero_key = item_data.can_wield[1]
			end
		end
	end

	return 
end
GiftPopupUI.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)

	return 
end
GiftPopupUI._destroy_units = function (self)
	local reward_world = self.reward_world

	if self.reward_units then
		for i = 1, #self.reward_units, 1 do
			local unit = self.reward_units[i]

			if unit then
				World.destroy_unit(reward_world, unit)
			end
		end

		table.clear(self.reward_units)
	end

	if self.link_unit then
		World.destroy_unit(reward_world, self.link_unit)

		self.link_unit = nil
	end

	if self.chest_unit then
		World.destroy_unit(reward_world, self.chest_unit)

		self.chest_unit = nil
	end

	self.units_spawned = nil

	return 
end
GiftPopupUI.active_input_service = function (self)
	local input_manager = self.input_manager
	local service_name = (self.presentation_started and self.input_service_name) or "ingame_menu"
	local input_service = input_manager.get_service(input_manager, service_name)

	return input_service
end
GiftPopupUI.active = function (self)
	return self.presentation_started
end
GiftPopupUI.start = function (self, rewards)
	self.presentation_started = true

	if not self.cursor_pushed then
		ShowCursorStack.push()

		self.cursor_pushed = true
	end

	self.rewards = rewards
	local input_service_name = self.input_service_name

	self.input_manager:block_device_except_service(input_service_name, "keyboard", 1)
	self.input_manager:block_device_except_service(input_service_name, "mouse", 1)
	self.input_manager:block_device_except_service(input_service_name, "gamepad", 1)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self.spawn_chest_unit(self)
	self.load_reward_units(self)
	ScriptWorld.activate_viewport(self.reward_world, self.reward_viewport)
	self.play_sound(self, "hud_reward_chest_spin")

	return 
end
GiftPopupUI.stop = function (self)
	if self.cursor_pushed then
		ShowCursorStack.pop()

		self.cursor_pushed = nil
	end

	self._selection_index = nil
	self.rewards = nil

	self._destroy_units(self)
	self.unload_packages(self)
	table.clear(self.loaded_packages)
	table.clear(self.packages_to_load)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.presentation_started = nil

	self._destroy_world(self)

	self.poll_cooldown = GIFT_POLL_COOLDOWN

	return 
end
GiftPopupUI.destroy = function (self)
	if self.presentation_started then
		self.stop(self)
	end

	self._destroy_units(self)
	self._destroy_world(self)

	self.ui_animator = nil

	if self.menu_input_description then
		self.menu_input_description:destroy()

		self.menu_input_description = nil
	end

	local event_manager = Managers.state.event

	event_manager.unregister(event_manager, "level_start_local_player_spawned", self)
	rawset(_G, "gift_popup_ui", nil)

	return 
end
GiftPopupUI.event_initialize_poll = function (self)
	self._poll_initialized = true

	return 
end
GiftPopupUI.update = function (self, dt, t)
	if not self.presentation_started then
		return 
	end

	self.ui_animator:update(dt)

	if self.chest_spawn_anim_id and self.ui_animator:is_animation_completed(self.chest_spawn_anim_id) then
		self.ui_animator:stop_animation(self.chest_spawn_anim_id)

		self.chest_spawn_anim_id = nil
		self.chest_spawn_animation_completed = true
	end

	if self.chest_open_anim_id and self.ui_animator:is_animation_completed(self.chest_open_anim_id) then
		self.ui_animator:stop_animation(self.chest_open_anim_id)

		self.chest_open_anim_id = nil
		self.chest_open_animation_completed = true
	end

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	self._draw(self, dt)

	return 
end
GiftPopupUI.post_update = function (self, dt)
	if Development.parameter("debug_gift_popup") then
		local input_manager = self.input_manager
		local service_name = (self.presentation_started and self.input_service_name) or "ingame_menu"
		local input_service = input_manager.get_service(input_manager, service_name)

		if input_service.get(input_service, "matchmaking_start") then
			self.stop(self)
			self._create_ui_elements(self, temp_rewards, "gift_popup_main_title_sonnstill", "gift_popup_sub_title_sonnstill", "gift_popup_button_text")
		end
	end

	if self._poll_initialized and self.is_in_inn then
		if not self.presentation_started then
			if self._verify_poll(self) then
				local handled = self._poll_new_rewards(self, dt)

				if not handled then
					return 
				end
			else
				return 
			end
		end
	else
		return 
	end

	local gamepad_active = self.input_manager:is_device_active("gamepad")

	if self.update_reward_units_visibility then
		self._enable_reward_units_visibility(self)

		self.update_reward_units_visibility = nil
	end

	if self.chest_open_animation_completed and self.chest_unit then
		World.destroy_unit(self.reward_world, self.chest_unit)

		self.chest_unit = nil
	end

	local claim_button_hotspot = self.claim_button_widget.content.button_hotspot

	if claim_button_hotspot.on_release and self.chest_spawn_animation_completed then
		claim_button_hotspot.on_release = nil

		self._open_chest(self)
	end

	local close_button_hotspot = self.close_button_widget.content.button_hotspot

	if close_button_hotspot.on_release and self.chest_spawn_animation_completed then
		close_button_hotspot.on_release = nil

		self.play_sound(self, "Play_hud_select")
		self.stop(self)
	end

	if self.chest_spawn_animation_completed and not self.chest_open_animation_completed and not self.chest_spawn_anim_id and not self.chest_open_anim_id then
		self._update_chest_idle_timer(self, dt)
	end

	if self.chest_open_animation_completed then
		if self.chest_unit then
			World.destroy_unit(self.reward_world, self.chest_unit)

			self.chest_unit = nil
		end

		if not self._selection_index then
			self._set_selection(self, 1)
		end

		if not gamepad_active then
			self._handle_mouse_input(self, dt)
		end
	end

	if gamepad_active then
		self._handle_gamepad_input(self, dt)
	end

	return 
end
GiftPopupUI._verify_poll = function (self)
	local popup_manager = Managers.popup

	if popup_manager and popup_manager.has_popup(popup_manager) then
		return 
	end

	local translation_manager = Managers.transition
	local fade_out_completed = translation_manager.fade_out_completed(translation_manager)

	if fade_out_completed then
		return true
	end

	return 
end
GiftPopupUI._poll_new_rewards = function (self, dt)
	local poll_cooldown = self.poll_cooldown

	if poll_cooldown and 0 < poll_cooldown then
		self.poll_cooldown = poll_cooldown - dt
	else
		local unlock_manager = Managers.unlock

		if unlock_manager then
			local gift_info = unlock_manager.poll_script_startup_data(unlock_manager)

			if gift_info and gift_info ~= "none" then
				local rewards = gift_info.rewards
				local title_key = gift_info.title_key
				local button_key = gift_info.button_key
				local description_key = gift_info.description_key

				print("gift_info", title_key, description_key, button_key)
				self.stop(self)
				self._create_ui_elements(self, rewards, title_key, description_key, button_key)

				return true
			end
		end
	end

	return 
end
GiftPopupUI._open_chest = function (self)
	self.chest_open_anim_id = self._start_chest_animation(self, "chest_unit_open")

	self.play_sound(self, "Play_hud_select")
	self.play_sound(self, "hud_reward_open_chest")

	return 
end
GiftPopupUI._handle_mouse_input = function (self, dt)
	for index, widget in ipairs(self.thumb_widgets) do
		local content = widget.content
		local button_hotspot = content.button_hotspot

		if button_hotspot.on_release then
			self._set_selection(self, index)
		end
	end

	return 
end
GiftPopupUI._handle_gamepad_input = function (self, dt)
	local input_manager = self.input_manager
	local service_name = self.input_service_name
	local input_service = input_manager.get_service(input_manager, service_name)
	local controller_cooldown = self.controller_cooldown

	if controller_cooldown and 0 < controller_cooldown then
		self.controller_cooldown = controller_cooldown - dt
	elseif self.chest_open_animation_completed then
		if input_service.get(input_service, "toggle_menu") or input_service.get(input_service, "back", true) then
			self.play_sound(self, "Play_hud_select")
			self.stop(self)
		elseif self._selection_index then
			local new_selection_index = nil

			if input_service.get(input_service, "move_left") then
				new_selection_index = math.max(self._selection_index - 1, 1)
			elseif input_service.get(input_service, "move_right") then
				local num_thumb_widgets = #self.thumb_widgets
				new_selection_index = math.min(self._selection_index + 1, num_thumb_widgets)
			end

			if new_selection_index and new_selection_index ~= self._selection_index then
				self.controller_cooldown = GamepadSettings.menu_cooldown

				self._set_selection(self, new_selection_index)
			end
		end
	elseif self.chest_spawn_animation_completed and input_service.get(input_service, "confirm", true) then
		self.controller_cooldown = GamepadSettings.menu_cooldown

		self._open_chest(self)
	end

	return 
end
GiftPopupUI._draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, self.input_service_name)

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.popup_bg_widget)

	if not self.chest_open_animation_completed and not self.chest_open_anim_id then
		UIRenderer.draw_widget(ui_renderer, self.claim_button_widget)

		if self.chest_spawn_animation_completed and (not self.claim_button_widget.content.button_hotspot.is_hover or not input_service.get(input_service, "left_hold")) then
			UIRenderer.draw_widget(ui_renderer, self.button_glow_widget)
		end
	end

	if not self.chest_open_animation_completed then
		for widget_name, widget in pairs(self.reward_text_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

	if self.chest_open_animation_completed then
		for index, widget in ipairs(self.thumb_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		if self.draw_hero_icon then
			for widget_name, widget in pairs(self.hero_icon_widgets) do
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	if not self.chest_open_animation_completed and not self.chest_open_anim_id then
	elseif self.chest_open_animation_completed then
		for widget_name, widget in pairs(self.reward_text_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		UIRenderer.draw_widget(ui_top_renderer, self.close_button_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if not self.chest_spawn_anim_id and not self.chest_open_anim_id then
		local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

		if gamepad_active then
			self.menu_input_description:draw(ui_renderer, dt)
		end
	end

	return 
end
GiftPopupUI.load_package = function (self, package_name)
	if self.packages_to_load[package_name] ~= nil then
		return 
	end

	self.packages_to_load[package_name] = true
	local package_manager = Managers.package
	local cb = callback(self, "on_load_complete", package_name)

	package_manager.load(package_manager, package_name, "GiftPopupUI", cb, true)

	return 
end
GiftPopupUI.on_load_complete = function (self, package_name)
	self.loaded_packages[package_name] = true
	self.packages_to_load[package_name] = false

	return 
end
GiftPopupUI.unload_packages = function (self)
	local loaded_packages = self.loaded_packages

	if loaded_packages then
		local package_manager = Managers.package

		for package_name, _ in pairs(loaded_packages) do
			package_manager.unload(package_manager, package_name, "GiftPopupUI")
		end
	end

	return 
end
GiftPopupUI.reward_packages_loaded = function (self)
	local reward_units_to_spawn = self.reward_units_to_spawn
	local loaded_packages = self.loaded_packages

	for package_index, package_list in ipairs(reward_units_to_spawn) do
		for index, package_data in ipairs(package_list) do
			if not loaded_packages[package_data.unit_name] then
				return false
			end
		end
	end

	return true
end
GiftPopupUI.get_camera_position = function (self)
	local reward_viewport = self.reward_viewport
	local camera = ScriptViewport.camera(reward_viewport)

	return ScriptCamera.position(camera)
end
GiftPopupUI.get_camera_rotation = function (self)
	local reward_viewport = self.reward_viewport
	local camera = ScriptViewport.camera(reward_viewport)

	return ScriptCamera.rotation(camera)
end
GiftPopupUI.load_reward_units = function (self)
	local rewards = self.rewards
	local reward_units_to_spawn = {}

	for index, reward_data in ipairs(rewards) do
		local item_key = reward_data.item_key
		local item_data = ItemMasterList[item_key]
		local item_template = ItemHelper.get_template_by_item_name(item_key)
		local units_to_spawn_data = {}
		local slot_type = item_data.slot_type

		if slot_type == "melee" or slot_type == "ranged" then
			local left_hand_unit = item_data.left_hand_unit
			local right_hand_unit = item_data.right_hand_unit

			if left_hand_unit then
				local left_unit = left_hand_unit .. "_3p"

				self.load_package(self, left_unit)

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = left_unit,
					unit_attachment_node_linking = item_template.left_hand_attachment_node_linking.third_person.display
				}
			end

			if right_hand_unit then
				local right_unit = right_hand_unit .. "_3p"

				if right_hand_unit ~= left_hand_unit then
					self.load_package(self, right_unit)
				end

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = right_unit,
					unit_attachment_node_linking = item_template.right_hand_attachment_node_linking.third_person.display
				}
			end
		else
			local unit = item_data.unit

			if unit then
				self.load_package(self, unit)

				units_to_spawn_data[#units_to_spawn_data + 1] = {
					unit_name = unit,
					unit_attachment_node_linking = (slot_type == "trinket" and item_template.attachment_node_linking.slot_trinket_1) or item_template.attachment_node_linking.slot_hat
				}
			end
		end

		reward_units_to_spawn[index] = units_to_spawn_data
	end

	self.reward_units_to_spawn = reward_units_to_spawn

	return 
end
GiftPopupUI.spawn_chest_unit = function (self)
	if self.chest_unit then
		return 
	end

	local unit_name = "units/props/loot_chest/prop_loot_chest_01"
	local camera_rotation = self.get_camera_rotation(self)
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), 0)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local camera_position = self.get_camera_position(self)
	local unit_spawn_position = camera_position + camera_forward_vector
	unit_spawn_position.z = unit_spawn_position.z - 5
	local reward_world = self.reward_world
	local chest_unit = World.spawn_unit(reward_world, unit_name, unit_spawn_position, unit_spawn_rotation)
	local unit_box, box_dimension = Unit.box(chest_unit)
	local unit_center_position = Matrix4x4.translation(unit_box)
	local unit_root_position = Unit.world_position(chest_unit, 0)
	local offset = unit_center_position - unit_root_position

	if box_dimension then
		local max_value = 0.1
		local largest_value = 0

		if largest_value < box_dimension.x then
			largest_value = box_dimension.x
		end

		if largest_value < box_dimension.z then
			largest_value = box_dimension.z
		end

		if largest_value < box_dimension.y then
			largest_value = box_dimension.y
		end

		if max_value < largest_value then
			local diff = largest_value - max_value
			local scale_fraction = diff/largest_value - 1
			local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

			Unit.set_local_scale(chest_unit, 0, scale)

			offset = offset*scale_fraction
		end

		local display_position = unit_spawn_position - offset

		Unit.set_local_position(chest_unit, 0, display_position)

		self.chest_unit = chest_unit
	end

	self.chest_spawn_anim_id = self._start_chest_animation(self, "chest_unit_spawn")
	self.chest_spawn_animation_completed = nil
	self.chest_open_animation_completed = nil
	self._chest_idle_timer = nil

	return 
end
GiftPopupUI.auto_rotate = function (self, dt)
	local chest_unit = self.chest_unit

	if chest_unit and Unit.alive(chest_unit) then
		local speed_multiplier = self.unit_auto_rotate_speed_multiplier or 0.5
		local current_value = self.unit_auto_rotate_value or 0
		local value = (current_value + dt*speed_multiplier)%(math.pi*2)
		local unit_rotation = Quaternion.axis_angle(Vector3(0, 0, 1), -value)

		Unit.set_local_rotation(chest_unit, 0, unit_rotation)

		self.unit_auto_rotate_value = value
	end

	return 
end
GiftPopupUI.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end

	return 
end
GiftPopupUI._start_chest_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		chest_unit = self.chest_unit,
		reward_viewport = self.reward_viewport,
		reward_world = self.reward_world
	}
	local widgets = {
		divider = self.divider_widget,
		popup_bg = self.popup_bg_widget,
		thumb_widgets = self.thumb_widgets,
		title_text = self.reward_text_widgets.title_text,
		description_text = self.reward_text_widgets.description_text,
		reward_name_text = self.reward_text_widgets.reward_name_text,
		hero_icon = self.hero_icon_widgets.hero_icon,
		claim_button = self.claim_button_widget
	}

	return self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
end
GiftPopupUI._update_chest_idle_timer = function (self, dt)
	local current_time = self._chest_idle_timer or 0
	current_time = current_time + dt

	if 1.3 <= current_time then
		self._chest_idle_timer = nil

		self._trigger_chest_idle_animation(self)
	else
		self._chest_idle_timer = current_time
	end

	return 
end
GiftPopupUI._trigger_chest_idle_animation = function (self)
	local num_anims = #chest_idle_animations
	local random_anim_index = math.round(Math.random_range(1, num_anims))
	local event_name = chest_idle_animations[random_anim_index]

	self.trigger_unit_flow_event(self, self.chest_unit, event_name)
	self.play_sound(self, "hud_reward_chest_move")

	return 
end
GiftPopupUI._set_selection = function (self, index)
	if self._selection_index == index then
		if self.link_unit then
			Unit.flow_event(self.link_unit, "lua_spin_no_fx")
			self.play_sound(self, "Play_hud_select")
		end

		return 
	end

	self.menu_input_description:change_generic_actions(generic_input_actions.selection)

	self._previous_index = self._selection_index
	self._selection_index = index
	local widget = self.thumb_widgets[index]
	local widget_content = widget.content
	local first_time = widget_content.first_time
	widget_content.first_time = false
	local display_name = widget_content.display_name
	local item_type = widget_content.item_type
	local reward_name_text = self.reward_text_widgets.reward_name_text
	local reward_type_text = self.reward_text_widgets.reward_type_text
	reward_name_text.content.text = display_name
	reward_type_text.content.text = item_type
	local draw_hero_icon = widget_content.draw_hero_icon
	self.draw_hero_icon = draw_hero_icon

	if draw_hero_icon then
		local key = widget_content.hero_key
		local hero_icon_texture = UISettings.hero_icons.medium[key]
		local hero_icon_tooltip = UISettings.hero_tooltips[key]
		local hero_icon_widgets = self.hero_icon_widgets
		hero_icon_widgets.hero_icon.content.texture_id = hero_icon_texture
		hero_icon_widgets.hero_icon_tooltip.content.tooltip_text = Localize(hero_icon_tooltip)
	end

	local widget_animations = widget.animations

	table.clear(widget_animations)

	local icon_glow_color = widget.style.icon_glow.color

	if 0 < icon_glow_color[1] then
		local animation = UIAnimation.init(UIAnimation.function_by_time, icon_glow_color, 1, icon_glow_color[1], 0, 0.2, math.easeOutCubic)
		widget_animations[animation] = true
	end

	for i, widget in ipairs(self.thumb_widgets) do
		local selected = i == index
		widget.content.selected = selected
	end

	local reward_units_to_spawn = self.reward_units_to_spawn

	if reward_units_to_spawn then
		local units_data = reward_units_to_spawn[index]
		local units_loaded = true

		for _, data in ipairs(units_data) do
			local unit_name = data.unit_name

			if not self.loaded_packages[unit_name] then
				units_loaded = false

				break
			end
		end

		if units_loaded then
			local item_data = self.rewards[index]
			local item_key = item_data.item_key

			self.spawn_link_unit(self, item_key)
			self.spawn_reward_units(self, units_data, first_time)
		end
	end

	return 
end
GiftPopupUI.spawn_link_unit = function (self, item_key)
	if self.link_unit then
		World.destroy_unit(self.reward_world, self.link_unit)

		self.link_unit = nil
	end

	local item_template = ItemHelper.get_template_by_item_name(item_key)
	local item_data = ItemMasterList[item_key]
	local unit_name = item_template.display_unit
	local camera_rotation = self.get_camera_rotation(self)
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), math.pi*1)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local camera_position = self.get_camera_position(self)
	local unit_spawn_position = camera_position + camera_forward_vector
	unit_spawn_position.z = unit_spawn_position.z + 0.05
	local reward_world = self.reward_world
	local link_unit = World.spawn_unit(reward_world, unit_name, unit_spawn_position, unit_spawn_rotation)
	local unit_box, box_dimension = Unit.box(link_unit)
	local unit_center_position = Matrix4x4.translation(unit_box)
	local unit_root_position = Unit.world_position(link_unit, 0)
	local offset = unit_center_position - unit_root_position

	if box_dimension then
		local max_value = 0.1
		local largest_value = 0

		if largest_value < box_dimension.x then
			largest_value = box_dimension.x
		end

		if largest_value < box_dimension.z then
			largest_value = box_dimension.z
		end

		if largest_value < box_dimension.y then
			largest_value = box_dimension.y
		end

		if max_value < largest_value then
			local diff = largest_value - max_value
			local scale_fraction = diff/largest_value - 1
			local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

			Unit.set_local_scale(link_unit, 0, scale)

			offset = offset*scale_fraction
		end

		local display_position = unit_spawn_position - offset

		Unit.set_local_position(link_unit, 0, display_position)

		self.link_unit = link_unit
	end

	return 
end
GiftPopupUI.spawn_reward_units = function (self, data, first_time)
	if self.reward_units then
		local reward_world = self.reward_world

		for i = 1, #self.reward_units, 1 do
			local unit = self.reward_units[i]

			if unit then
				World.destroy_unit(reward_world, unit)
			end
		end

		self.reward_units = nil
	end

	local link_unit = self.link_unit

	if data and link_unit then
		local scene_graph_links = {}
		local reward_world = self.reward_world
		local reward_units = {}
		local reward_units_default_position = {}
		local reward_units_position_offset = {}

		for i = 1, #data, 1 do
			local spawn_unit_data = data[i]
			local unit_name = spawn_unit_data.unit_name
			local unit_attachment_node_linking = spawn_unit_data.unit_attachment_node_linking
			local reward_unit = World.spawn_unit(reward_world, unit_name)

			Unit.set_unit_visibility(reward_unit, false)

			reward_units[#reward_units + 1] = reward_unit

			GearUtils.link(reward_world, unit_attachment_node_linking, scene_graph_links, link_unit, reward_unit)
		end

		self.reward_units = reward_units
		self.reward_units_position_offset = reward_units_position_offset
		self.reward_units_default_position = reward_units_default_position
		self.spawn_reward_units_when_ready = nil
		self.update_reward_units_visibility = true
		local event = (first_time and "lua_spin") or "lua_spin_no_fx"

		Unit.flow_event(link_unit, event)

		self.units_spawned = true

		if first_time then
			self.play_sound(self, "hud_dice_game_reward_sound")
		else
			self.play_sound(self, "Play_hud_select")
		end
	end

	return 
end
GiftPopupUI._enable_reward_units_visibility = function (self)
	local reward_units = self.reward_units

	for _, unit in ipairs(reward_units) do
		if unit and Unit.alive(unit) then
			Unit.set_unit_visibility(unit, true)

			local reward_unit_event = "lua_presentation"

			self.trigger_unit_flow_event(self, unit, reward_unit_event)
		end
	end

	return 
end
GiftPopupUI._update_thumb_selection_timer = function (self, dt)
	local timer = self._selection_timer

	if timer then
		local total_time = 0.25

		if timer == total_time then
			self._selection_timer = nil

			return 
		else
			timer = math.min(timer + dt, total_time)
			self._selection_timer = timer

			return timer/total_time
		end
	end

	return 
end
GiftPopupUI._update_thumb_widgets = function (self, dt, instant)
	local selection_progress = (instant and 1) or self._update_thumb_selection_timer(self, dt)

	if not selection_progress then
		return 
	end

	local selected_index = self._selection_index or 1
	local previous_index = self._previous_index or 1
	local anim_progress = math.easeCubic(selection_progress)

	for index, widget in ipairs(self.thumb_widgets) do
		self._animate_thumb_element(self, widget, index, selection_progress)
	end

	return 
end
GiftPopupUI._animate_thumb_element = function (self, widget, index, progress)
	local is_selection_widget = self._selection_index == index
	local anim_progress = (is_selection_widget and math.easeCubic(progress)) or math.easeCubic(progress - 1)

	return 
end

return 
