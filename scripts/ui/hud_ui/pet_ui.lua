-- chunkname: @scripts/ui/hud_ui/pet_ui.lua

require("scripts/unit_extensions/ai_commander/ai_commander_extension")

local definitions = local_require("scripts/ui/hud_ui/pet_ui_definitions")
local SKULL_TEXTURES = definitions.SKULL_TEXTURES
local SKULL_GLOW_TEXTURES = definitions.SKULL_GLOW_TEXTURES
local RETAINED_MODE_ENABLED = definitions.RETAINED_MODE_ENABLED

PetUI = class(PetUI)

PetUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._global_pet_counter = 0
	self._last_amount_pets = 0
	self._last_resolution = {}

	self:_create_ui_elements()
end

PetUI.destroy = function (self, parent, ingame_ui_context)
	for _, widget in pairs(self._pet_widget_by_unit) do
		local marker_id = widget.content.marker_id

		if marker_id then
			Managers.state.event:trigger("remove_world_marker", marker_id)
		end
	end

	if RETAINED_MODE_ENABLED then
		self:_destroy_all_widgets()
	end
end

PetUI._destroy_all_widgets = function (self)
	for _, widget in pairs(self._pet_widget_list) do
		UIWidget.destroy(self._ui_renderer, widget)
	end

	UIWidget.destroy(self._ui_renderer, self._container_widget)
end

PetUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	self._pet_widget_by_unit = {}
	self._pet_widget_list = {}
	self._pet_widget_animation_ids = {}
	self._pet_attack_status = {}
	self._container_widget = UIWidget.init(definitions.container_widget_definition)

	local gui = self._ui_renderer.gui
	local retained_gui = self._ui_renderer.gui_retained

	self._container_widget.content.materials = {
		Gui.material(gui, "necromancer_command_coin_follow"),
		Gui.material(gui, "necromancer_command_coin_attack"),
		Gui.material(gui, "necromancer_command_coin_defend"),
		Gui.material(gui, "necromancer_command_coin"),
	}
	self._container_widget.content.retained_materials = {
		Gui.material(retained_gui, "necromancer_command_coin_follow"),
		Gui.material(retained_gui, "necromancer_command_coin_attack"),
		Gui.material(retained_gui, "necromancer_command_coin_defend"),
		Gui.material(retained_gui, "necromancer_command_coin"),
	}
	self._dirty = true
end

PetUI.set_visible = function (self, visible)
	self._is_visible = visible

	self:_set_elements_visible(visible)
end

PetUI._set_elements_visible = function (self, visible)
	local ui_renderer = self._ui_renderer

	UIRenderer.set_element_visible(ui_renderer, self._container_widget.element, visible)

	for _, widget in ipairs(self._pet_widget_list) do
		UIRenderer.set_element_visible(ui_renderer, widget.element)
	end

	self._retained_elements_visible = visible

	self:_set_all_dirty()
end

PetUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
	self._dirty = true
end

PetUI._set_all_dirty = function (self)
	UIUtils.mark_dirty(self._pet_widget_list)
	self:_set_widget_dirty(self._container_widget)
end

PetUI._create_pet_widget = function (self, pet_unit)
	local index = #self._pet_widget_list + 1
	local widget = UIWidget.init(definitions.pet_widget_definition)
	local content = widget.content
	local skull_index = math.random(index, #SKULL_TEXTURES)

	SKULL_TEXTURES[skull_index], SKULL_TEXTURES[index] = SKULL_TEXTURES[index], SKULL_TEXTURES[skull_index]
	SKULL_GLOW_TEXTURES[skull_index], SKULL_GLOW_TEXTURES[index] = SKULL_GLOW_TEXTURES[index], SKULL_GLOW_TEXTURES[skull_index]
	widget.content.icon = SKULL_TEXTURES[index] or SKULL_TEXTURES[1]
	widget.content.icon_glow = SKULL_GLOW_TEXTURES[index] or SKULL_GLOW_TEXTURES[1]
	self._pet_widget_by_unit[pet_unit] = widget
	content.unit = pet_unit
	self._global_pet_counter = self._global_pet_counter + 1
	content.order_index = self._global_pet_counter
	self._pet_widget_list[index] = widget

	local spawn_animation_id = self._ui_animator:start_animation("spawn_skeleton", widget, definitions.scenegraph_definition)

	self._pet_widget_animation_ids[widget] = spawn_animation_id

	return widget
end

local function action_input_name(input_service_name, keymap_name)
	local player_input_service = Managers.input:get_service(input_service_name)
	local command_keymapping = player_input_service and player_input_service:get_keymapping(keymap_name)
	local device = command_keymapping and command_keymapping[1]
	local button_id = command_keymapping and command_keymapping[2]
	local button_name

	if button_id ~= UNASSIGNED_KEY then
		if device == "keyboard" then
			button_name = Keyboard.button_name(button_id)
		elseif device == "mouse" then
			button_name = Mouse.button_name(button_id)
		elseif device == "gamepad" then
			button_name = Pad1.button_name(button_id)
		end
	end

	return button_name or "???"
end

PetUI._pet_ui_available = function (self, player)
	local ui_was_available = self._ui_available
	local career_name = player and player:career_name()
	local career_settings = CareerSettings[career_name]

	if not career_settings.show_pet_ui then
		if RETAINED_MODE_ENABLED and ui_was_available then
			self:destroy()
		end

		table.clear(self._pet_widget_by_unit)
		table.clear(self._pet_widget_list)

		self._ui_available = false
	else
		if RETAINED_MODE_ENABLED and not ui_was_available then
			self:_set_all_dirty()
		end

		self._ui_available = true
	end

	return self._ui_available
end

local TO_REMOVE = {}

PetUI._update_animations = function (self, dt)
	table.clear(TO_REMOVE)

	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local change_command_state_anim = self._change_command_state_anim

	if change_command_state_anim then
		if not ui_animator:is_animation_completed(change_command_state_anim) then
			self:_set_widget_dirty(self._container_widget)
		else
			self._change_command_state_anim = nil
		end
	end

	for widget, spawn_anim_id in pairs(self._pet_widget_animation_ids) do
		if not ui_animator:is_animation_completed(spawn_anim_id) then
			self:_set_widget_dirty(widget)
		else
			TO_REMOVE[#TO_REMOVE + 1] = widget
		end
	end

	for i = 1, #TO_REMOVE do
		local widget = TO_REMOVE[i]

		self._pet_widget_animation_ids[widget] = nil
	end
end

local function _compare_content_order_index(a, b)
	return a.content.order_index < b.content.order_index
end

PetUI._update_pet_container = function (self, dt, t, player)
	local player_unit = player.player_unit
	local commander_extension = ScriptUnit.has_extension(player_unit, "ai_commander_system")
	local controlled_units = commander_extension:get_controlled_units()
	local first_controlled_unit = next(controlled_units)
	local command_state = first_controlled_unit and commander_extension:command_state(first_controlled_unit) or CommandStates.Following
	local container_widget = self._container_widget

	if command_state ~= self._last_command_state and self._ui_animator:is_animation_completed(self._change_command_state_anim) then
		self._change_command_state_anim = self._ui_animator:start_animation("change_command_state", container_widget, definitions.scenegraph_definition, command_state)
		self._last_command_state = command_state
	end

	if not container_widget.content.initialized then
		container_widget.content.initialized = true
		container_widget.content.help_text = string.format("{#color(255,168,0)}[%s]{#reset()} to attack", Utf8.upper(action_input_name("Player", "action_one"))) .. string.format("\n{#color(255,168,0)}[%s]{#reset()} to hold a position", Utf8.upper(action_input_name("Player", "action_two_hold"))) .. string.format("\n{#color(255,168,0)}[%s]{#reset()} to dark pact", Utf8.upper(action_input_name("Player", "weapon_reload")))
	end

	local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
	local did_show_glow = container_widget.content.show_glow

	container_widget.content.show_glow = not not buff_extension:get_buff_type("sienna_necromancer_6_3_available_charge")

	if did_show_glow ~= container_widget.content.show_glow then
		self:_set_widget_dirty(container_widget)
	end

	local pet_widget_by_unit = self._pet_widget_by_unit
	local pet_widget_list = self._pet_widget_list
	local pet_attack_status = self._pet_attack_status
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")
	local wielded_item_template = inventory_extension and inventory_extension:get_wielded_slot_item_template()
	local in_command_mode = not not wielded_item_template and not not wielded_item_template.is_command_utility_weapon
	local reposition_widgets = false

	for unit in pairs(controlled_units) do
		local has_template = commander_extension:pet_ui_data(unit)

		if has_template and HEALTH_ALIVE[unit] then
			if not pet_widget_by_unit[unit] then
				local widget = self:_create_pet_widget(unit)

				reposition_widgets = true

				self:add_pet_nameplate(unit, widget)
			end

			local pet_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
			local buff_active = pet_buff_extension and pet_buff_extension:has_buff_type("skeleton_command_attack_boost")
			local pet_widget = pet_widget_by_unit[unit]

			if buff_active and not pet_attack_status[unit] then
				local spawn_animation_id = self._ui_animator:start_animation("fade_in_skull_glow", pet_widget, definitions.scenegraph_definition)

				self._pet_widget_animation_ids[pet_widget] = spawn_animation_id
			elseif not buff_active and pet_attack_status[unit] then
				local spawn_animation_id = self._ui_animator:start_animation("fade_out_skull_glow", pet_widget, definitions.scenegraph_definition)

				self._pet_widget_animation_ids[pet_widget] = spawn_animation_id
			end

			pet_attack_status[unit] = buff_active
		end
	end

	if Application.user_setting("numeric_ui") then
		local num_pets = commander_extension:get_controlled_units_count()

		if (self._last_amount_pets or 0) ~= num_pets then
			container_widget.content.pet_amount_text = num_pets
			container_widget.content.pet_amount_text_shadow = num_pets
			self._last_amount_pets = num_pets

			self:_set_widget_dirty(container_widget)
		end
	end

	local hovered_unit, fallback_unit = commander_extension:hovered_friendly_unit()
	local closest_hovered_unit = hovered_unit or fallback_unit

	for index = #pet_widget_list, 1, -1 do
		local widget = pet_widget_list[index]
		local content = widget.content
		local pet_unit = content.unit
		local keep = commander_extension and self:_update_pet_widget(widget, commander_extension, in_command_mode, closest_hovered_unit)

		if not keep then
			pet_widget_by_unit[pet_unit] = nil

			local marker_id = widget.content.marker_id

			if marker_id then
				Managers.state.event:trigger("remove_world_marker", marker_id)

				widget.content.marker_id = false
				widget.content.marker_widget = nil
			end

			if RETAINED_MODE_ENABLED then
				UIWidget.destroy(self._ui_renderer, widget)
			end

			table.remove(pet_widget_list, index)

			reposition_widgets = true
		end
	end

	if reposition_widgets then
		table.sort(self._pet_widget_list, _compare_content_order_index)

		local count = #self._pet_widget_list

		for index, widget in pairs(self._pet_widget_list) do
			definitions.reposition_widget(widget, index, count)
			self:_set_widget_dirty(widget)
		end
	end
end

PetUI.add_pet_nameplate = function (self, unit, widget)
	if self._show_nameplates then
		Managers.state.event:trigger("add_world_marker_unit", "pet_nameplate", unit, function (marker_id, marker_widget)
			if widget.content.marker_id ~= false then
				widget.content.marker_id = marker_id
				widget.content.marker_widget = marker_widget
				marker_widget.content.text = "Skeleton"
			end
		end)
	end
end

PetUI.update = function (self, dt, t, player)
	if not self._is_visible then
		return
	end

	if not self:_pet_ui_available(player) then
		return
	end

	self:_update_animations(dt, t, player)
	self:_update_pet_container(dt, t, player)
	self:_handle_resolution_modified()
	self:_handle_gamepad_activity()
	self:_draw(dt, t)
end

PetUI._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self._gamepad_active_last_frame == nil

	if gamepad_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true
			self._ui_scenegraph.container.local_position[1] = 435
			self._ui_scenegraph.container.local_position[2] = 10

			self:_set_all_dirty()
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false
		self._ui_scenegraph.container.local_position[1] = 460
		self._ui_scenegraph.container.local_position[2] = 0

		self:_set_all_dirty()
	end
end

PetUI._handle_resolution_modified = function (self)
	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h

	if self._last_resolution.res_w ~= w or self._last_resolution.res_h ~= h then
		self:_set_all_dirty()

		self._last_resolution.res_w = w
		self._last_resolution.res_h = h
	end
end

PetUI.resolution_modified = function (self)
	self:_set_all_dirty()
end

PetUI._draw = function (self, dt, t)
	if not self._dirty and RETAINED_MODE_ENABLED then
		return
	end

	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, FAKE_INPUT_SERVICE, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._container_widget)
	UIRenderer.draw_all_widgets(ui_renderer, self._pet_widget_list)
	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

PetUI._update_pet_widget = function (self, widget, commander_extension, in_command_mode, hovered_unit)
	local content = widget.content
	local pet_unit = content.unit
	local template, current_hp, max_hp = commander_extension:pet_ui_data(pet_unit)

	if not template then
		return false
	end

	local marker_widget = content.marker_widget

	if marker_widget then
		marker_widget.content.visible = in_command_mode

		local pet_ui_type = template.pet_ui_type

		if pet_ui_type == "health" then
			marker_widget.content.progress = current_hp / max_hp
		end
	end

	local was_highlighted = content.is_highlighted

	content.is_highlighted = in_command_mode and pet_unit == hovered_unit

	if was_highlighted ~= content.is_highlighted then
		self:_set_widget_dirty(widget)
	end

	return true
end
