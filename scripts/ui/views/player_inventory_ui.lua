local definitions = local_require("scripts/ui/views/player_inventory_ui_definitions")

require("scripts/settings/inventory_settings")

PlayerInventoryUI = class(PlayerInventoryUI)
local SLOTS_LIST = InventorySettings.weapon_slots
local GAMEPAD_SLOTS_LIST = {}

for i, slot in ipairs(SLOTS_LIST) do
	local slot_name = slot.name

	if slot_name == "slot_melee" or slot_name == "slot_ranged" then
		GAMEPAD_SLOTS_LIST[i] = slot
	end
end

local consumable_slots = {
	slot_healthkit = 1,
	slot_grenade = 3,
	slot_potion = 2
}
local temp_slot_texture_mapping = {
	slot_healthkit = "consumables_medpack",
	slot_grenade = "consumables_frag",
	slot_potion = "consumables_potion_01"
}
local stance_bar_glow_pulse_lookup_table = {}
local stance_bar_lit_glow_out_lookup_table = {}
local stance_bar_glow_fade_out_lookup_table = {}
local inventory_entry_root_lookup_table = {}
local inventory_slot_lookup_table = {}
local ammo_text_1_flash_lookup_table = {}
local ammo_text_2_flash_lookup_table = {}
local ammo_text_1_pulse_lookup_table = {}
local ammo_text_2_pulse_lookup_table = {}
local hud_icon_texture_lit_lookup_table = {}
local inventory_entry_background_lookup_table = {}
local inventory_entry_lookup_table = {}
local inventory_entry_icon_lookup_table = {}
local inventory_entry_stance_bar_lookup_table = {}
local inventory_entry_stance_bar_fill_lookup_table = {}
local inventory_entry_stance_bar_lit_lookup_table = {}
local inventory_entry_stance_bar_glow_lookup_table = {}

PlayerInventoryUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.platform = PLATFORM
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.slot_equip_animations = {}
	self.slot_animations = {}
	self.ui_animations = {}

	self:create_ui_elements()

	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.render_settings = {
		snap_pixel_positions = true
	}
	local gamepad_active = self.input_manager:is_device_active("gamepad")
	self._visible = not gamepad_active
end

PlayerInventoryUI.destroy = function (self)
	self:set_visible(false)
end

local inventory_widget_definitions = {
	definitions.top_inventory_widget_definition,
	definitions.inventory_widget_definition,
	definitions.small_inventory_widget_definition,
	definitions.small_inventory_widget_definition,
	definitions.small_inventory_widget_definition
}

PlayerInventoryUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	local widget_definitions = definitions.inventory_entry_definitions
	self.inventory_slots_widgets = {}

	for i = 1, #widget_definitions, 1 do
		self.inventory_slots_widgets[i] = UIWidget.init(widget_definitions[i])
	end

	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.inventory_widgets = {}

	for i, widget in ipairs(inventory_widget_definitions) do
		if not inventory_slot_lookup_table[i] then
			inventory_slot_lookup_table[i] = "inventory_slot_" .. i
		end

		widget.scenegraph_id = inventory_slot_lookup_table[i]
		self.inventory_widgets[i] = UIWidget.init(widget)
	end
end

PlayerInventoryUI.set_visible = function (self, visible)
	if visible then
		local gamepad_active = self.input_manager:is_device_active("gamepad")

		if gamepad_active then
			visible = false
		end
	end

	for i, slot in ipairs(SLOTS_LIST) do
		local widget = self.inventory_slots_widgets[i]

		UIRenderer.set_element_visible(self.ui_renderer, widget.element, visible)
	end

	self._visible = visible
end

local function get_ammunition_count(left_hand_wielded_unit, right_hand_wielded_unit, item_template)
	local ammo_extension = nil

	if not item_template.ammo_data then
		return
	end

	local ammo_unit_hand = item_template.ammo_data.ammo_hand

	if ammo_unit_hand == "right" then
		ammo_extension = ScriptUnit.extension(right_hand_wielded_unit, "ammo_system")
	elseif ammo_unit_hand == "left" then
		ammo_extension = ScriptUnit.extension(left_hand_wielded_unit, "ammo_system")
	else
		return
	end

	local single_clip = ammo_extension:using_single_clip()
	local ammo_count = ammo_extension:ammo_count()
	local remaining_ammo = ammo_extension:remaining_ammo()

	return ammo_count, not single_clip and remaining_ammo
end

PlayerInventoryUI.overcharge_amount = function (self, unit)
	local overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	local overcharge_fraction = overcharge_extension:overcharge_fraction()
	local threshold_fraction = overcharge_extension:threshold_fraction()
	local anim_blend_overcharge = overcharge_extension:get_anim_blend_overcharge()

	return overcharge_fraction, threshold_fraction, anim_blend_overcharge
end

PlayerInventoryUI.update = function (self, dt, t, my_player)
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local ui_renderer = self.ui_renderer

	if gamepad_active then
		if not self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = true

			self:on_gamepad_activated()
		end
	elseif self.gamepad_active_last_frame then
		self.gamepad_active_last_frame = false

		self:on_gamepad_deactivated()
	end

	if self.stance_bar_lit_animation then
		UIAnimation.update(self.stance_bar_lit_animation, dt)

		if UIAnimation.completed(self.stance_bar_lit_animation) then
			self.stance_bar_lit_animation = nil
		end
	end

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	if not self._visible then
		return
	end

	self:update_slot_animations(dt)
	self:update_inventory_slots_positions(dt)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	if RESOLUTION_LOOKUP.modified then
		for i, slot in ipairs(SLOTS_LIST) do
			local widget = self.inventory_slots_widgets[i]
			widget.element.dirty = true
		end
	end

	if my_player then
		local profile_index = my_player:profile_index()

		if profile_index ~= self.profile_index then
			self.selected_index = nil
			self.profile_index = profile_index
		end

		self:update_inventory_slots(dt, ui_scenegraph, ui_renderer, my_player)
	end

	UIRenderer.end_pass(ui_renderer)
end

PlayerInventoryUI.on_gamepad_activated = function (self)
	local gamepad_layout = Application.user_setting("gamepad_layout")

	self:set_visible(false)
end

PlayerInventoryUI.on_gamepad_deactivated = function (self)
	self:set_visible(true)
end

PlayerInventoryUI.update_inventory_slots = function (self, dt, ui_scenegraph, ui_renderer, my_player)
	local profile_synchronizer = self.profile_synchronizer
	local player_unit = my_player.player_unit
	local inventory_extension = nil
	local inventory_hud_settings = UISettings.inventory_hud
	local hud_extension = nil

	if player_unit then
		local health_extension = ScriptUnit.extension(player_unit, "health_system")
		local status_extension = ScriptUnit.extension(player_unit, "status_system")
		inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		hud_extension = ScriptUnit.extension(player_unit, "hud_system")
	end

	if inventory_extension then
		local inventory_widgets = self.inventory_widgets
		local equipment = inventory_extension:equipment()
		local slots = SLOTS_LIST
		local wielded = equipment.wielded
		local picked_up_ammo = hud_extension:get_picked_up_ammo()

		if picked_up_ammo then
			hud_extension:set_picked_up_ammo(false)
		end

		for i, slot in ipairs(slots) do
			local slot_name = slot.name
			local slot_data = equipment.slots[slot_name]
			local widget = self.inventory_slots_widgets[i]
			local widget_content = widget.content
			local widget_style = widget.style

			if not slot_data then
				if widget_content.has_data then
					widget_content.has_data = nil
				end

				if widget_content.ammo_text_1 ~= "" then
					widget_content.ammo_text_1 = ""
					widget_content.ammo_text_2 = ""
				end

				if widget_content.stance_bar then
					widget_content.stance_bar.active = false
				end

				if widget_content.icon ~= "weapon_icon_empty" then
					widget_content.icon = "weapon_icon_empty"
				end
			else
				local item_data = slot_data.item_data
				local is_wielded = wielded == slot_data.item_data
				local first_update = false
				local master_item_name = (item_data and item_data.name) or "no_master_item_found"
				local hud_icon_texture = (item_data and item_data.hud_icon) or temp_slot_texture_mapping[slot_name]

				if not hud_icon_texture_lit_lookup_table[hud_icon_texture] then
					hud_icon_texture_lit_lookup_table[hud_icon_texture] = hud_icon_texture .. "_lit"
				end

				if widget_content.icon ~= hud_icon_texture then
					widget.element.dirty = true
					widget_content.icon = hud_icon_texture

					assert(widget_content.icon, "No hud icon for weapon %s", master_item_name)

					widget_content.icon_lit = hud_icon_texture_lit_lookup_table[hud_icon_texture]
				end

				if is_wielded then
					first_update = self:on_inventory_selected_slot_changed(i)

					if first_update then
						local bar_textures = definitions.bar_textures
						local overcharge_fraction, threshold_fraction = self:overcharge_amount(player_unit)

						if not overcharge_fraction then
							widget_content.stance_bar.texture_id = bar_textures.stance_bar.bar
							widget_content.stance_bar_glow = bar_textures.stance_bar.glow
						else
							widget_content.stance_bar.texture_id = bar_textures.charge_bar.bar
							widget_content.stance_bar_glow = bar_textures.charge_bar.glow
						end
					end
				end

				if not widget_content.has_data then
					widget_content.has_data = true
				end

				local item_template = BackendUtils.get_item_template(item_data)
				local ammo_count, remaining_ammo = get_ammunition_count(slot_data.left_unit_1p, slot_data.right_unit_1p, item_template)

				if ammo_count then
					local ammo_data = item_template.ammo_data

					if ammo_data and not ammo_data.destroy_when_out_of_ammo then
						local ammo_text_1 = tostring(ammo_count)
						local ammo_text_2 = (remaining_ammo and tostring(remaining_ammo)) or ""

						if ammo_text_1 ~= widget_content.ammo_text_1 or ammo_text_2 ~= widget_content.ammo_text_2 then
							widget.element.dirty = true
							widget_content.ammo_text_1 = ammo_text_1
							widget_content.ammo_text_2 = ammo_text_2
						end

						if not ammo_text_1_flash_lookup_table[slot_name] then
							ammo_text_1_flash_lookup_table[slot_name] = slot_name .. "ammo_text_1_flash"
							ammo_text_2_flash_lookup_table[slot_name] = slot_name .. "ammo_text_2_flash"
							ammo_text_1_pulse_lookup_table[slot_name] = slot_name .. "ammo_text_1_pulse"
							ammo_text_2_pulse_lookup_table[slot_name] = slot_name .. "ammo_text_2_pulse"
						end

						if picked_up_ammo then
							self.ui_animations[ammo_text_1_flash_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.text_flash, widget_style.ammo_text_1.text_color, 1, 255, 200, 5, 0.7)
							self.ui_animations[ammo_text_2_flash_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.text_flash, widget_style.ammo_text_2.text_color, 1, 255, 200, 5, 0.7)
							self.ui_animations[ammo_text_1_pulse_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.pulse_animation3, widget_style.ammo_text_1, "font_size", 26, 24, 5, 0.7)
							self.ui_animations[ammo_text_2_pulse_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.pulse_animation3, widget_style.ammo_text_2, "font_size", 26, 24, 5, 0.7)
						end
					else
						widget_content.ammo_text_1 = ""
						widget_content.ammo_text_2 = ""
					end

					widget_content.stance_bar.active = false
				else
					local bar_progress = nil
					local overcharge_fraction, threshold_fraction, anim_blend_overcharge = self:overcharge_amount(player_unit)

					if overcharge_fraction then
						bar_progress = math.min(overcharge_fraction, 1)
					else
						bar_progress = 0
					end

					bar_progress = math.lerp(widget_content.stance_bar.bar_value, math.min(bar_progress, 1), 0.3)
					widget_content.stance_bar.active = (item_data.slot_type ~= "melee" and true) or false
					widget_content.stance_bar.bar_value = bar_progress

					if not stance_bar_glow_pulse_lookup_table[slot_name] then
						stance_bar_glow_pulse_lookup_table[slot_name] = slot_name .. "stance_bar_glow_pulse"
						stance_bar_lit_glow_out_lookup_table[slot_name] = slot_name .. "stance_bar_lit_glow_out"
						stance_bar_glow_fade_out_lookup_table[slot_name] = slot_name .. "stance_bar_glow_fade_out"
					end

					if not self.ui_animations[stance_bar_glow_pulse_lookup_table[slot_name]] and bar_progress >= 1 then
						self.ui_animations[stance_bar_glow_pulse_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.pulse_animation, widget_style.stance_bar_glow.color, 1, 0, 255, inventory_hud_settings.bar_lit_pulse_duration)
					elseif self.ui_animations[stance_bar_glow_pulse_lookup_table[slot_name]] and not self.ui_animations[stance_bar_lit_glow_out_lookup_table[slot_name]] and bar_progress < 1 then
						self.ui_animations[stance_bar_glow_pulse_lookup_table[slot_name]] = nil
						self.ui_animations[stance_bar_glow_fade_out_lookup_table[slot_name]] = UIAnimation.init(UIAnimation.function_by_time, widget_style.stance_bar_glow.color, 1, widget_style.stance_bar_glow.color[1], 0, inventory_hud_settings.bar_lit_fade_out_duration, math.easeInCubic)
					end

					widget_content.ammo_text_1 = ""
					widget_content.ammo_text_2 = ""
				end

				local stance_bar_root_offset = -26
				local default_root_offset = -5

				if not inventory_entry_root_lookup_table[i] then
					inventory_entry_root_lookup_table[i] = "inventory_entry_root_" .. i
				end

				if widget_content.stance_bar.active then
					if self.ui_scenegraph[inventory_entry_root_lookup_table[i]].local_position[1] ~= stance_bar_root_offset then
						self.ui_scenegraph[inventory_entry_root_lookup_table[i]].local_position[1] = stance_bar_root_offset
					end
				elseif self.ui_scenegraph[inventory_entry_root_lookup_table[i]].local_position[1] ~= default_root_offset then
					self.ui_scenegraph[inventory_entry_root_lookup_table[i]].local_position[1] = default_root_offset
				end
			end

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end
end

PlayerInventoryUI.update_inventory_slots_positions = function (self, dt)
	local scenegraph_definition = definitions.scenegraph_definition
	local selected_index = self.selected_index or 0
	local previous_selected_index = self.previous_selected_index
	local ui_scenegraph = self.ui_scenegraph
	local slot_spacing = UISettings.inventory_hud.slot_spacing
	local height_offset = 0

	for i = #SLOTS_LIST, 1, -1 do
		local slot = SLOTS_LIST[i]
		local slot_name = slot.name
		local is_consumable_slot = (consumable_slots[slot_name] and true) or false
		local size_multiplier = (is_consumable_slot and 0.9) or 0.6

		if not inventory_entry_background_lookup_table[i] then
			inventory_entry_background_lookup_table[i] = "inventory_entry_background_" .. i
		end

		local scenegraph_background_id = inventory_entry_background_lookup_table[i]
		local widget = self.inventory_slots_widgets[i]
		local next_widget_index = i - 1
		local next_widget = self.inventory_slots_widgets[next_widget_index]
		local widget_height = ui_scenegraph[scenegraph_background_id].size[2] * size_multiplier

		if not inventory_entry_root_lookup_table[i] then
			inventory_entry_root_lookup_table[i] = "inventory_entry_root_" .. i
		end

		local scenegraph_root_id = inventory_entry_root_lookup_table[i]
		ui_scenegraph[scenegraph_root_id].position[2] = height_offset + widget_height * 0.5
		height_offset = height_offset + widget_height + slot_spacing
	end
end

PlayerInventoryUI.on_inventory_selected_slot_changed = function (self, new_index)
	if self.selected_index == new_index then
		return
	end

	local duration = self:add_animation_for_slot_index(new_index, true)

	for i = 1, #SLOTS_LIST, 1 do
		if i ~= new_index then
			self:add_animation_for_slot_index(i, false, duration)
		end
	end

	self.previous_selected_index = self.selected_index
	self.selected_index = new_index

	return true
end

PlayerInventoryUI.add_animation_for_slot_index = function (self, index, selected, optional_duration)
	local animations = self.slot_animations
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_definition = definitions.scenegraph_definition

	if not inventory_entry_lookup_table[index] then
		inventory_entry_lookup_table[index] = "inventory_entry_" .. index
		inventory_entry_icon_lookup_table[index] = "inventory_entry_icon_" .. index
	end

	local scenegraph_id = inventory_entry_lookup_table[index]
	local scenegraph_icon_id = inventory_entry_icon_lookup_table[index]
	local widget = self.inventory_slots_widgets[index]
	local icon_size = ui_scenegraph[scenegraph_icon_id].size
	local default_size = definitions.scenegraph_definition[scenegraph_icon_id].size
	local default_width = default_size[1]
	local default_total_time = UISettings.inventory_hud.select_animation_duration
	local duration = optional_duration or 0

	if selected then
		if not optional_duration then
			local size_diff_fraction = 1 - (icon_size[1] - default_width) / default_width
			duration = size_diff_fraction * default_total_time
		end

		self.animating_selected_slot = true
	elseif not optional_duration then
		for _, animation_data in pairs(animations) do
			if animation_data.selected then
				duration = animation_data.total_time - animation_data.time

				break
			end
		end
	end

	local icon_current_size = ui_scenegraph[scenegraph_icon_id].size
	local icon_default_size = definitions.scenegraph_definition[scenegraph_icon_id].size
	local start_scale_fraction = icon_current_size[1] / icon_default_size[1]

	if animations[scenegraph_id] then
		local animation = animations[scenegraph_id]
		animation.total_time = duration
		animation.time = 0
		animation.selected = selected
		animation.icon_start_size = ui_scenegraph[scenegraph_icon_id].size
		animation.start_alpha = widget.style.icon.color[1]
		animation.start_selected_alpha = widget.style.background_lit.color[1]
		animation.start_scale_fraction = start_scale_fraction
		animation.target_scale_fraction = (selected and 1) or 0.8
	else
		animations[scenegraph_id] = {
			time = 0,
			total_time = duration,
			widget = self.inventory_slots_widgets[index],
			scenegraph_id = scenegraph_id,
			start_scale_fraction = start_scale_fraction,
			target_scale_fraction = (selected and 1) or 0.8,
			start_size = ui_scenegraph[scenegraph_icon_id].size,
			start_alpha = widget.style.icon.color[1],
			start_selected_alpha = widget.style.background_lit.color[1],
			selected = selected,
			index = index
		}
	end

	return duration
end

PlayerInventoryUI.update_slot_animations = function (self, dt)
	local animations = self.slot_animations

	for scenegraph_id, animation_data in pairs(animations) do
		animations[scenegraph_id] = self:animate_slot_widget(animation_data, dt)
	end
end

PlayerInventoryUI.animate_slot_widget = function (self, animation_data, dt)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_definition = definitions.scenegraph_definition
	local widget = animation_data.widget
	local total_time = animation_data.total_time
	local time = animation_data.time
	local selected = animation_data.selected
	local widget_index = animation_data.index
	local start_size = animation_data.start_size
	local start_alpha = animation_data.start_alpha
	local start_scale_fraction = animation_data.start_scale_fraction
	local target_scale_fraction = animation_data.target_scale_fraction
	local start_selected_alpha = animation_data.start_selected_alpha
	local widget_content = widget.content
	local widget_style = widget.style
	local inventory_hud_settings = UISettings.inventory_hud
	time = time + dt
	local progress = math.min(time / total_time, 1)
	local smoothstep = math.smoothstep(progress, 0, 1)
	local lit_progress = math.min(progress * 2, 1)
	local lit_smoothstep = math.smoothstep(lit_progress, 0, 1)
	local ammo_progress = (selected and math.min(math.max(0, (progress - 0.8) / 0.2), 1)) or math.min(math.max(0, progress / 0.2), 1)

	if not inventory_entry_lookup_table[widget_index] then
		inventory_entry_lookup_table[widget_index] = "inventory_entry_" .. widget_index
		inventory_entry_background_lookup_table[widget_index] = "inventory_entry_background_" .. widget_index
		inventory_entry_icon_lookup_table[widget_index] = "inventory_entry_icon_" .. widget_index
	end

	if not inventory_entry_stance_bar_lookup_table[widget_index] then
		inventory_entry_stance_bar_lookup_table[widget_index] = "inventory_entry_stance_bar_" .. widget_index
		inventory_entry_stance_bar_fill_lookup_table[widget_index] = "inventory_entry_stance_bar_fill_" .. widget_index
		inventory_entry_stance_bar_lit_lookup_table[widget_index] = "inventory_entry_stance_bar_lit_" .. widget_index
		inventory_entry_stance_bar_glow_lookup_table[widget_index] = "inventory_entry_stance_bar_glow_" .. widget_index
	end

	local scenegraph_id = inventory_entry_lookup_table[widget_index]
	local scenegraph_background_id = inventory_entry_background_lookup_table[widget_index]
	local scenegraph_icon_id = inventory_entry_icon_lookup_table[widget_index]
	local scenegraph_stance_bar_id = inventory_entry_stance_bar_lookup_table[widget_index]
	local scenegraph_stance_bar_fill_id = inventory_entry_stance_bar_fill_lookup_table[widget_index]
	local scenegraph_stance_bar_lit_id = inventory_entry_stance_bar_lit_lookup_table[widget_index]
	local scenegraph_stance_bar_glow_id = inventory_entry_stance_bar_glow_lookup_table[widget_index]
	local widget_scenegraph = ui_scenegraph[scenegraph_id]
	local widget_icon_scenegraph = ui_scenegraph[scenegraph_icon_id]
	local widget_background_scenegraph = ui_scenegraph[scenegraph_background_id]
	widget.element.dirty = true
	local scale_fraction_diff = (selected and target_scale_fraction - start_scale_fraction) or start_scale_fraction - target_scale_fraction
	local new_scale_fraction = (selected and start_scale_fraction + scale_fraction_diff * smoothstep) or start_scale_fraction - scale_fraction_diff * smoothstep
	local icon_default_size = scenegraph_definition[scenegraph_icon_id].size
	widget_icon_scenegraph.size[1] = icon_default_size[1] * new_scale_fraction
	widget_icon_scenegraph.size[2] = icon_default_size[2] * new_scale_fraction
	local background_default_size = scenegraph_definition[scenegraph_background_id].size
	widget_background_scenegraph.size[1] = background_default_size[1] * new_scale_fraction
	widget_background_scenegraph.size[2] = background_default_size[2] * new_scale_fraction
	local new_lit_alpha = 0

	if selected then
		local lit_alpha_diff = 255 - start_selected_alpha
		new_lit_alpha = start_selected_alpha + lit_alpha_diff * lit_smoothstep
	else
		new_lit_alpha = start_selected_alpha - start_selected_alpha * lit_smoothstep
	end

	widget_style.background_lit.color[1] = new_lit_alpha
	widget_style.background_lit.color[1] = new_lit_alpha
	widget_style.icon_lit.color[1] = new_lit_alpha
	widget_style.icon.color[1] = 255 - new_lit_alpha
	widget_style.stance_bar_lit.color[1] = new_lit_alpha
	widget_style.stance_bar_fg.color[1] = 255 - new_lit_alpha
	local widget_stance_bar_scenegraph = ui_scenegraph[scenegraph_stance_bar_id]
	local stance_bar_default_size = scenegraph_definition[scenegraph_stance_bar_id].size
	widget_stance_bar_scenegraph.size[1] = stance_bar_default_size[1] * new_scale_fraction
	widget_stance_bar_scenegraph.size[2] = stance_bar_default_size[2] * new_scale_fraction
	local widget_stance_bar_fill_scenegraph = ui_scenegraph[scenegraph_stance_bar_fill_id]
	local stance_bar_fill_default_definitions = scenegraph_definition[scenegraph_stance_bar_fill_id]
	local stance_bar_fill_default_size = stance_bar_fill_default_definitions.size
	local stance_bar_fill_default_position = stance_bar_fill_default_definitions.position
	widget_stance_bar_fill_scenegraph.size[1] = stance_bar_fill_default_size[1] * new_scale_fraction
	widget_stance_bar_fill_scenegraph.size[2] = stance_bar_fill_default_size[2] * new_scale_fraction
	widget_stance_bar_fill_scenegraph.local_position[1] = stance_bar_fill_default_position[1] * new_scale_fraction
	widget_stance_bar_fill_scenegraph.local_position[2] = stance_bar_fill_default_position[2] * new_scale_fraction
	widget_style.stance_bar.uv_scale_pixels = 67 * new_scale_fraction
	local widget_stance_bar_glow_scenegraph = ui_scenegraph[scenegraph_stance_bar_glow_id]
	local stance_bar_glow_default_size = scenegraph_definition[scenegraph_stance_bar_glow_id].size
	widget_stance_bar_glow_scenegraph.size[1] = stance_bar_glow_default_size[1] * new_scale_fraction
	widget_stance_bar_glow_scenegraph.size[2] = stance_bar_glow_default_size[2] * new_scale_fraction
	local default_alpha = inventory_hud_settings.slot_default_alpha
	local selected_alpha = inventory_hud_settings.slot_select_alpha
	local target_alpha = (selected and selected_alpha) or default_alpha
	local icon_style = widget_style.icon

	if icon_style.color[1] ~= target_alpha then
		local alpha_diff = (selected and target_alpha - start_alpha) or start_alpha - target_alpha
		local new_alpha = (selected and start_alpha + alpha_diff * smoothstep) or start_alpha - alpha_diff * smoothstep
		icon_style.color[1] = new_alpha
		local ammo_text_style = widget_style.ammo_text_1
		local stance_bar_style = widget_style.stance_bar
		local ammo_alpha = (selected and ammo_progress * target_alpha) or (1 - ammo_progress) * selected_alpha
		stance_bar_style.color[1] = new_alpha
		ammo_text_style.text_color[1] = new_alpha
	end

	if progress < 1 then
		animation_data.time = time

		if selected and not widget_content.selected and progress > 0.8 then
			widget_content.selected = selected
		elseif not selected and widget.content.selected and ammo_progress == 1 then
			widget.content.selected = selected
		end

		return animation_data
	else
		if selected then
			self.animating_selected_slot = nil
		end

		return nil
	end
end

return
