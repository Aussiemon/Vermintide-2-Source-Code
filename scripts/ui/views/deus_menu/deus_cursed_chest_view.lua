require("scripts/utils/hash_utils")

local definitions = local_require("scripts/ui/views/deus_menu/deus_cursed_chest_view_definitions")
local REAL_PLAYER_LOCAL_ID = 1
local POWER_UP_MAX_SPACING_X = 40
local POWER_UP_SPACING_Y = 0
local CIRCLE_SPEED = 1
local POWER_UP_SELECTED_CIRCLE_SPEED = 12
local LERP_SPEED = 2.5
local SOUND_EVENTS = {
	close_ui = "hud_morris_weapon_chest_close",
	button_hover = "hud_morris_hover",
	power_up_unlocked = "hud_morris_cursed_chest_activate_powerup",
	open_ui = "hud_morris_cursed_chest_open"
}
DeusCursedChestView = class(DeusCursedChestView)

DeusCursedChestView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._wwise_world = ingame_ui_context.wwise_world
	local input_service_name = "deus_cursed_chest_view"
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager
	self._input_service_name = input_service_name
	self.ingame_ui = ingame_ui_context.ingame_ui

	input_manager:create_input_service(input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "mouse")
	input_manager:map_device_to_service(input_service_name, "gamepad")
end

DeusCursedChestView.destroy = function (self)
	return
end

DeusCursedChestView.on_enter = function (self, params)
	self._interactable = params and params.interactable_unit
	self._deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
	self._circle_speed_modifier = CIRCLE_SPEED
	self._circle_max_speed_modifier = CIRCLE_SPEED
	self._power_up_data = Unit.get_data(self._interactable, "power_ups")

	if not self._power_up_data then
		local position = Unit.world_position(self._interactable, 0)
		local seed = HashUtils.fnv32_hash(position.x .. "_" .. position.y .. "_" .. position.z)
		local power_ups = self._deus_run_controller:generate_random_power_ups(DeusPowerUpSettings.cursed_chest_choice_amount, DeusPowerUpAvailabilityTypes.cursed_chest, seed)
		self._power_up_data = {}

		for i, power_up in ipairs(power_ups) do
			self._power_up_data[i] = {
				selected = false,
				power_up = power_up
			}
		end

		Unit.set_data(self._interactable, "power_ups", self._power_up_data)
	end

	self:_acquire_input()
	self:create_ui_elements()
	self:_play_sound(SOUND_EVENTS.open_ui)
end

DeusCursedChestView.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.background_widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	local local_peer_id = self._deus_run_controller:get_own_peer_id()
	local profile_index, career_index = self._deus_run_controller:get_player_profile(local_peer_id, REAL_PLAYER_LOCAL_ID)
	local power_up_templates = DeusPowerUpTemplates
	local power_up_widgets = {}
	local num_power_ups = #self._power_up_data

	for i = 1, num_power_ups do
		local power_up = self._power_up_data[i].power_up
		local power_up_template = power_up_templates[power_up.name]
		local is_rectangular_icon = power_up_template.rectangular_icon
		local widget_size = definitions.scenegraph_definition.power_up_root.size
		local widget_definition = definitions.create_power_up_shop_item("power_up_root", widget_size, false, is_rectangular_icon)
		local widget = UIWidget.init(widget_definition)
		local step = i - 1
		local max_steps = num_power_ups - 1
		local rad = math.rad(step / max_steps * 180)
		local widget_offset_y = widget_size[2] + POWER_UP_SPACING_Y
		local max_spacing_y = widget_offset_y * num_power_ups + widget_size[2]
		local init_pos_y = max_spacing_y / 2
		widget.offset = {
			POWER_UP_MAX_SPACING_X * math.sin(rad),
			init_pos_y - (POWER_UP_SPACING_Y + widget_size[2]) * i,
			0
		}
		local max_value = nil
		local current_value = 0

		self:_init_power_up_widget(widget, power_up, nil, current_value, max_value, profile_index, career_index)

		self._power_up_data[i].widget = widget
		widgets[#widgets + 1] = widget
		power_up_widgets[#power_up_widgets + 1] = widget
		widgets_by_name["power_up_item_" .. i] = widget
	end

	self._widgets = widgets
	self._power_up_widgets = power_up_widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

DeusCursedChestView.post_update_on_enter = function (self)
	return
end

DeusCursedChestView.on_exit = function (self)
	self._power_up_data = nil
	self._interactable = nil

	self:_release_input()
end

DeusCursedChestView.post_update_on_exit = function (self)
	return
end

DeusCursedChestView._init_power_up_widget = function (self, widget, power_up_instance, discount, current_value, max_value, profile_index, career_index)
	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
	local rarity = power_up.rarity
	local content = widget.content
	content.title_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
	content.rarity_text = Localize(RaritySettings[rarity].display_name)
	content.sub_text = DeusPowerUpUtils.get_power_up_description(power_up, profile_index, career_index)
	content.has_discount = discount
	content.icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
	content.max_value_text = nil
	content.current_value_text = nil
	local style = widget.style
	local rarity_color = Colors.get_table(rarity)
	style.rarity_text.text_color = rarity_color
	style.price_icon.color[1] = 0
	style.price_text.text_color[1] = 0
	style.price_text_shadow.text_color[1] = 0
	style.price_text_disabled.text_color[1] = 0
	local offset_y = 22
	style.current_value_title_text.offset[2] = style.current_value_title_text.offset[2] + offset_y
	style.current_value_title_text_shadow.offset[2] = style.current_value_title_text_shadow.offset[2] + offset_y
	style.current_value_text.offset[2] = style.current_value_text.offset[2] + offset_y
	style.current_value_text_shadow.offset[2] = style.current_value_text_shadow.offset[2] + offset_y
	style.max_value_title_text.offset[2] = style.max_value_title_text.offset[2] + offset_y
	style.max_value_title_text_shadow.offset[2] = style.max_value_title_text_shadow.offset[2] + offset_y
	style.max_value_text.offset[2] = style.max_value_text.offset[2] + offset_y
	style.max_value_text_shadow.offset[2] = style.max_value_text_shadow.offset[2] + offset_y
end

DeusCursedChestView.draw = function (self, dt)
	for _, widget in ipairs(self._power_up_widgets) do
		self:_animate_power_up_widget(dt, widget)
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.exit_button, dt)

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self:input_service()
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)
end

DeusCursedChestView._get_selected_power_up_count = function (self)
	local counter = 0

	for _, power_up_data in ipairs(self._power_up_data) do
		if power_up_data.selected then
			counter = counter + 1
		end
	end

	return counter
end

DeusCursedChestView.update = function (self, dt, t)
	local local_peer_id = self._deus_run_controller:get_own_peer_id()
	local max_selectable_power_ups = DeusPowerUpSettings.cursed_chest_max_picks
	local selected_power_ups = self:_get_selected_power_up_count()
	local max_selectable_power_ups_reached = max_selectable_power_ups <= selected_power_ups

	for _, power_up_data in ipairs(self._power_up_data) do
		local widget = power_up_data.widget
		local power_up = power_up_data.power_up
		local max_power_ups_reached = self._deus_run_controller:reached_max_power_ups(local_peer_id, power_up.name)
		local content = widget.content

		if power_up_data.selected then
			content.is_bought = true
			content.button_hotspot.disable_button = true
			selected_power_ups = selected_power_ups + 1
		elseif max_selectable_power_ups_reached or max_power_ups_reached then
			content.button_hotspot.disable_button = true
		else
			content.is_bought = false
			content.button_hotspot.disable_button = false
		end
	end

	self:_handle_input(dt)
	self:_update_background_animations(dt)
	self:draw(dt)
end

DeusCursedChestView._handle_input = function (self, dt)
	for _, power_up_data in ipairs(self._power_up_data) do
		local widget = power_up_data.widget

		if self:_is_button_pressed(widget) then
			local power_up = power_up_data.power_up
			power_up_data.selected = true

			Unit.set_data(self._interactable, "power_ups", self._power_up_data)

			local run_controller = self._deus_run_controller

			run_controller:add_power_ups({
				power_up_data.power_up
			}, REAL_PLAYER_LOCAL_ID)

			local buff_system = Managers.state.entity:system("buff_system")
			local talent_interface = Managers.backend:get_talents_interface()
			local deus_backend = Managers.backend:get_interface("deus")
			local local_player = Managers.player:local_player()
			local player_unit = local_player.player_unit
			local own_peer_id = self._deus_run_controller:get_own_peer_id()
			local profile_index, career_index = run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

			DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, run_controller, player_unit, profile_index, career_index)

			self._circle_max_speed_modifier = POWER_UP_SELECTED_CIRCLE_SPEED

			self:_play_sound(SOUND_EVENTS.power_up_unlocked)

			local deus_cursed_chest_extension = ScriptUnit.has_extension(self._interactable, "deus_cursed_chest_system")

			if deus_cursed_chest_extension then
				deus_cursed_chest_extension:on_reward_collected()
			end

			Managers.state.event:trigger("present_rewards", {
				{
					type = "deus_power_up",
					power_up = power_up
				}
			})
			self:_close()
		end

		self:_update_button_hover_sound(widget)
	end

	local widgets_by_name = self._widgets_by_name
	local input_service = self._input_manager:get_service(self._input_service_name)
	local exit_widget = widgets_by_name.exit_button
	local exit_pressed = self:_is_button_pressed(exit_widget)

	if exit_pressed or input_service:get("toggle_menu", true) or input_service:get("back", true) then
		self:_close()
	end

	self:_update_button_hover_sound(exit_widget)
end

DeusCursedChestView.disable_toggle_menu = function (self)
	return true
end

DeusCursedChestView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusCursedChestView._close = function (self)
	self:_play_sound(SOUND_EVENTS.close_ui)
	self.ingame_ui:handle_transition("exit_menu")
end

DeusCursedChestView._acquire_input = function (self, ignore_cursor_stack)
	self:_release_input(true)

	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, input_service_name, "DeusCursedChestView")
	input_manager:block_device_except_service(input_service_name, "keyboard")
	input_manager:block_device_except_service(input_service_name, "mouse")
	input_manager:block_device_except_service(input_service_name, "gamepad")

	if not ignore_cursor_stack then
		ShowCursorStack.push()
		input_manager:enable_gamepad_cursor()
	end
end

DeusCursedChestView._release_input = function (self, ignore_cursor_stack)
	local input_manager = self._input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusCursedChestView")

	if not ignore_cursor_stack then
		ShowCursorStack.pop()
		input_manager:disable_gamepad_cursor()
	end
end

DeusCursedChestView._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

DeusCursedChestView._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

DeusCursedChestView._update_button_hover_sound = function (self, widget)
	if self:_is_button_hovered(widget) then
		self:_play_sound(SOUND_EVENTS.button_hover)
	end
end

DeusCursedChestView._animate_power_up_widget = function (self, dt, widget)
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

DeusCursedChestView._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusCursedChestView._update_background_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local speed_modifier = self._circle_speed_modifier
	local max_speed_modifier = self._circle_max_speed_modifier
	local is_almost_max_speed = math.value_inside_range(speed_modifier, max_speed_modifier - 0.2, max_speed_modifier + 0.2)

	if is_almost_max_speed then
		self._circle_max_speed_modifier = CIRCLE_SPEED
	end

	speed_modifier = math.lerp(speed_modifier, max_speed_modifier, LERP_SPEED * dt)

	for i = 1, 3 do
		local wheel_widget = widgets_by_name["background_wheel_0" .. i]
		local current_angle = wheel_widget.style.texture_id.angle
		local angle_add = 0
		local circle_speed = nil

		if i == 1 then
			circle_speed = 0.2
		elseif i == 2 then
			circle_speed = -0.1
		else
			circle_speed = 0.05
		end

		angle_add = current_angle + dt * circle_speed * speed_modifier
		wheel_widget.style.texture_id.angle = angle_add
	end

	self._circle_speed_modifier = speed_modifier
end
