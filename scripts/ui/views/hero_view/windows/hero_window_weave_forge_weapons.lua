require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_weapons_definitions")
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
local top_hdr_widget_definitions = definitions.top_hdr_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_weapon_entry_widget = definitions.create_weapon_entry_widget
local create_property_option = definitions.create_property_option
local create_trait_option = definitions.create_trait_option
local create_divider_option = definitions.create_divider_option
local create_item_block_option = definitions.create_item_block_option
local create_item_stamina_option = definitions.create_item_stamina_option
local create_item_ammunition_option = definitions.create_item_ammunition_option
local create_item_keywords_option = definitions.create_item_keywords_option
local create_item_overheat_option = definitions.create_item_overheat_option
local DO_RELOAD = false
local LIST_SPACING = 10
local EQUIP_PULSE_DURATION = 0.3
local UNLOCK_ITEM_REQUEST_LIMIT = 1.6
HeroWindowWeaveForgeWeapons = class(HeroWindowWeaveForgeWeapons)
HeroWindowWeaveForgeWeapons.NAME = "HeroWindowWeaveForgeWeapons"

HeroWindowWeaveForgeWeapons.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowWeaveForgeWeapons")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	self._animations = {}
	self._ui_animations = {}
	self._scrollbars = {}

	self:create_ui_elements(params, offset)

	local hero_name = params.hero_name
	local career_index = params.career_index
	local profile_index = params.profile_index
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	self._career_name = career_name
	self._hero_name = hero_name
	local selected_slot_name = params.selected_slot_name
	self._selected_slot_name = selected_slot_name
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local ui_onboarding_state = WeaveOnboardingUtils.get_ui_onboarding_state(ingame_ui_context.statistics_db, local_player:stats_id())
	local weapon_crafting_tutorial_completed = WeaveOnboardingUtils.tutorial_completed(ui_onboarding_state, WeaveUITutorials.equip_weapon)
	self._crafting_tutorial = not weapon_crafting_tutorial_completed

	self:_update_button_visibility()

	if self._crafting_tutorial then
		local widgets_by_name = self._widgets_by_name
		local unlock_button = widgets_by_name.unlock_button
		unlock_button.content.highlighted = true
		self._ui_animations.unlock_button_pulse = UIAnimation.init(UIAnimation.pulse_animation, unlock_button.style.texture_highlight.color, 1, 100, 255, 2)
	end

	self:_setup_weapon_list()
	self:_sync_backend_loadout()
	Managers.state.event:trigger("weave_forge_weapons_entered")
end

HeroWindowWeaveForgeWeapons._start_transition_animation = function (self, animation_name)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowWeaveForgeWeapons._setup_weapon_list = function (self)
	local backend_manger = Managers.backend
	local backend_interface_items = backend_manger:get_interface("items")
	local selected_slot_name = self._selected_slot_name
	local career_name = self._career_name
	local career_settings = CareerSettings[career_name]
	local item_slot_types_by_slot_name = career_settings.item_slot_types_by_slot_name
	local approved_item_slot_types = item_slot_types_by_slot_name[selected_slot_name]
	local weapon_layout = {}

	for key, item_data in pairs(ItemMasterList) do
		local rarity = item_data.rarity

		if rarity == "magic" then
			local slot_type = item_data.slot_type

			if table.contains(approved_item_slot_types, slot_type) then
				local can_wield = item_data.can_wield

				if table.contains(can_wield, career_name) then
					local required_unlock_item_key = item_data.required_unlock_item
					local required_item = backend_interface_items:get_item_from_key(required_unlock_item_key)
					local item = backend_interface_items:get_item_from_key(key)

					if required_item or item then
						local backend_id = item and item.backend_id
						weapon_layout[#weapon_layout + 1] = {
							key = key,
							item_data = item_data,
							backend_id = backend_id
						}
					end
				end
			end
		end
	end

	if self._crafting_tutorial then
		local backend_interface_weaves = backend_manger:get_interface("weaves")

		for i = #weapon_layout, 1, -1 do
			local item = weapon_layout[i]
			local item_cost = backend_interface_weaves:magic_item_cost(item.key)

			if item_cost and item_cost > 0 then
				table.remove(weapon_layout, i)
			end
		end
	end

	self:_populate_list(weapon_layout)
end

HeroWindowWeaveForgeWeapons._setup_definitions = function (self)
	if self._parent:gamepad_style_active() then
		definitions = dofile("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_weapons_console_definitions")
	else
		definitions = dofile("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_weapons_definitions")
	end

	top_widget_definitions = definitions.top_widgets
	bottom_widget_definitions = definitions.bottom_widgets
	bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
	top_hdr_widget_definitions = definitions.top_hdr_widgets
	scenegraph_definition = definitions.scenegraph_definition
	animation_definitions = definitions.animation_definitions
	create_weapon_entry_widget = definitions.create_weapon_entry_widget
	create_property_option = definitions.create_property_option
	create_trait_option = definitions.create_trait_option
	create_divider_option = definitions.create_divider_option
	create_item_block_option = definitions.create_item_block_option
	create_item_stamina_option = definitions.create_item_stamina_option
	create_item_ammunition_option = definitions.create_item_ammunition_option
	create_item_keywords_option = definitions.create_item_keywords_option
	create_item_overheat_option = definitions.create_item_overheat_option
end

HeroWindowWeaveForgeWeapons.create_ui_elements = function (self, params, offset)
	self:_setup_definitions()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local top_widgets = {}
	local bottom_widgets = {}
	local top_hdr_widgets = {}
	local bottom_hdr_widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		top_widgets[#top_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bottom_widgets[#bottom_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(bottom_hdr_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bottom_hdr_widgets[#bottom_hdr_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(top_hdr_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		top_hdr_widgets[#top_hdr_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._top_widgets = top_widgets
	self._bottom_widgets = bottom_widgets
	self._top_hdr_widgets = top_hdr_widgets
	self._bottom_hdr_widgets = bottom_hdr_widgets
	self._widgets_by_name = widgets_by_name
	widgets_by_name.upgrade_bg.alpha_multiplier = 0
	widgets_by_name.upgrade_text.alpha_multiplier = 0
	widgets_by_name.upgrade_effect.alpha_multiplier = 0
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

HeroWindowWeaveForgeWeapons._initialize_viewports = function (self)
	local item = self._params.selected_item
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local backend_interface_items = backend_manger:get_interface("items")
	local widgets_by_name = self._widgets_by_name
	local is_amulet = item ~= nil
	local scenegraph_id = "viewport"
	local viewport_definition = self:_create_viewport_definition(scenegraph_id)
	local widget = UIWidget.init(viewport_definition)
	local backend_id = item and item.backend_id
	local magic_level = 0
	local power_level = 0
	local data = {
		widget = widget,
		item = item,
		equip_button = widgets_by_name.equip_button,
		customize_button = widgets_by_name.customize_button,
		unlock_button = widgets_by_name.unlock_button,
		magic_level = magic_level,
		power_level = power_level
	}
	self._viewport_data = data
	local selected_item = self._params.selected_item
	local selected_item_data = selected_item.data
	local item_key = selected_item_data.key
	local index = self:_list_index_by_item_key(item_key)

	self:_on_list_index_selected(index)
end

HeroWindowWeaveForgeWeapons._create_item_previewer = function (self, viewport_widget, item, activate_spin)
	local item_data = item.data
	local item_key = item_data.key or item.key
	local slot_type = item_data.slot_type
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world
	local preview_position = {
		0,
		2.5,
		0
	}
	local display_unit_key = nil
	local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, nil, nil, display_unit_key)
	local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key, activate_spin)

	item_previewer:register_spawn_callback(callback)
	item_previewer:activate_auto_spin()

	return item_previewer
end

HeroWindowWeaveForgeWeapons.cb_unit_spawned_item_preview = function (self, item_previewer, item_key, activate_spin)
	local ignore_spin = not activate_spin

	item_previewer:present_item(item_key, ignore_spin)
end

HeroWindowWeaveForgeWeapons._create_viewport_definition = function (self, scenegraph_id)
	local shading_environment = "environment/ui_weave_forge_preview"

	return {
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 840,
				viewport_type = "default_forward",
				enable_sub_gui = false,
				fov = 20,
				shading_environment = shading_environment,
				world_name = "weave_forge_item_preview_" .. scenegraph_id,
				viewport_name = "weave_forge_item_preview_" .. scenegraph_id,
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
		},
		scenegraph_id = scenegraph_id
	}
end

HeroWindowWeaveForgeWeapons.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowWeaveForgeWeapons")

	self._ui_animator = nil
	local viewport_data = self._viewport_data

	if viewport_data then
		local ui_renderer = self._ui_renderer
		local item_previewer = viewport_data.item_previewer

		if item_previewer then
			item_previewer:destroy()
		end

		local widget = viewport_data.widget

		UIWidget.destroy(ui_renderer, widget)

		self._viewport_data = nil
	end
end

HeroWindowWeaveForgeWeapons.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local viewport_data = self._viewport_data

	if viewport_data then
		local item_previewer = viewport_data.item_previewer
		local widget = viewport_data.widget

		if item_previewer then
			local is_hover = self:_is_button_hover(widget)
			local allow_preview_input = gamepad_active or is_hover

			item_previewer:update(dt, t, allow_preview_input and input_service)
		end
	end

	self:_update_animations(dt)
	self:_update_scrollbar_positions()

	if self._viewport_data then
		self:_draw(dt)
	end

	local unlock_item_done_time = self._unlock_item_done_time

	if unlock_item_done_time and unlock_item_done_time < t then
		local response = self._unlock_item_response

		if response ~= nil then
			self:_on_unlock_item_done(response)

			self._unlock_item_done_time = nil
			self._unlock_item_response = nil
		end
	end
end

HeroWindowWeaveForgeWeapons._update_button_visibility = function (self)
	local equip_button = self._widgets_by_name.equip_button
	local equip_button_content = equip_button.content
	local customize_button = self._widgets_by_name.customize_button
	local customize_button_content = customize_button.content
	equip_button_content.visible = not self._crafting_tutorial
	customize_button_content.visible = not self._crafting_tutorial
end

HeroWindowWeaveForgeWeapons.post_update = function (self, dt, t)
	if not self._viewport_data then
		self:_initialize_viewports()
	end

	local viewport_data = self._viewport_data

	if viewport_data then
		local item_previewer = viewport_data.item_previewer

		if item_previewer then
			item_previewer:post_update(dt, t)
		end

		self:_handle_input(dt, t)
	end
end

HeroWindowWeaveForgeWeapons._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
	local viewport_data = self._viewport_data

	if viewport_data then
		local customize_button = viewport_data.customize_button

		if customize_button then
			UIWidgetUtils.animate_default_button(customize_button, dt)
		end

		local equip_button = viewport_data.equip_button

		if equip_button then
			UIWidgetUtils.animate_default_button(equip_button, dt)
		end

		local unlock_button = viewport_data.unlock_button

		if unlock_button then
			UIWidgetUtils.animate_default_button(unlock_button, dt)
		end
	end

	self:_update_item_pulse_animation(dt)
end

HeroWindowWeaveForgeWeapons._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		if not hotspot.is_selected then
			return true
		end
	end
end

HeroWindowWeaveForgeWeapons._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_hover
end

HeroWindowWeaveForgeWeapons._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowWeaveForgeWeapons._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end

HeroWindowWeaveForgeWeapons._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

HeroWindowWeaveForgeWeapons._list_index_pressed = function (self, widgets)
	for index, widget in ipairs(widgets) do
		local content = widget.content
		local hotspot = content.hotspot or content.button_hotspot

		if hotspot and hotspot.on_release then
			hotspot.on_release = false

			return index
		end
	end
end

HeroWindowWeaveForgeWeapons._is_list_hovered = function (self, widget)
	return widget.content.hotspot.is_hover or false
end

HeroWindowWeaveForgeWeapons._sync_backend_loadout = function (self)
	local backend_manger = Managers.backend
	local backend_interface_items = backend_manger:get_interface("items")
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local equipped_backend_id = backend_interface_weaves:get_loadout_item_id(career_name, self._selected_slot_name)
	local max_magic_level = backend_interface_weaves:max_magic_level()
	local scrollbars = self._scrollbars
	local scrollbar_data = scrollbars.weapons
	local list_widgets = scrollbar_data.list_widgets

	for i, widget in ipairs(list_widgets) do
		local content = widget.content
		local item_key = content.key
		local item = nil

		if not self._crafting_tutorial then
			item = backend_interface_items:get_item_from_key(item_key)
		end

		local backend_id = item and item.backend_id
		local item_power = backend_id and backend_interface_weaves:get_item_power_level(backend_id) or 0
		item_power = UIUtils.presentable_hero_power_level_weaves(item_power)
		local magic_level = backend_id and backend_interface_weaves:get_item_magic_level(backend_id) or 0
		content.locked = not backend_id
		content.backend_id = backend_id
		content.equipped = backend_id and backend_interface_weaves:has_loadout_item_id(career_name, backend_id)
		content.equipped_in_another_slot = content.equipped and backend_id ~= equipped_backend_id
		content.power_text = item_power
		content.item_power = item_power
		content.magic_level = magic_level
		content.level_progress = magic_level / max_magic_level
	end

	local equipable_item = self._selected_backend_id ~= nil
	local is_selected_item_equipped = self._selected_backend_id and backend_interface_weaves:has_loadout_item_id(career_name, self._selected_backend_id)

	self:_update_equip_button_status(equipable_item, is_selected_item_equipped)
end

HeroWindowWeaveForgeWeapons._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowWeaveForgeWeapons._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._parent:window_input_service()
	local scrollbars = self._scrollbars

	if scrollbars then
		for _, scrollbar_data in pairs(scrollbars) do
			local scrollbar_logic = scrollbar_data.scrollbar_logic

			scrollbar_logic:update(dt, t)
		end

		local weapon_scrollbar_data = scrollbars.weapons

		if weapon_scrollbar_data then
			local list_mask_widget = weapon_scrollbar_data.list_mask_widget
			local is_list_hovered = self:_is_list_hovered(list_mask_widget)
			local list_widgets = weapon_scrollbar_data.list_widgets

			if list_widgets and is_list_hovered then
				for i, widget in ipairs(list_widgets) do
					if self:_is_button_hover_enter(widget) then
						self:_play_sound("play_gui_equipment_button_hover")
					end
				end

				local list_index = self:_list_index_pressed(list_widgets)

				if list_index and list_index ~= self._selected_list_index then
					self:_on_list_index_selected(list_index)
					self:_play_sound("menu_magic_forge_select_weapon")
				end
			end

			self:_animate_weapon_lists_widgets(list_widgets, dt, is_list_hovered)
		end
	end

	local params = self._params
	local viewport_data = self._viewport_data

	if viewport_data then
		local equip_button = viewport_data.equip_button
		local customize_button = viewport_data.customize_button
		local unlock_button = viewport_data.unlock_button
		customize_button.content.button_hotspot.disable_button = self._selected_backend_id == nil

		if self:_is_button_hover_enter(equip_button) or self:_is_button_hover_enter(customize_button) or self:_is_button_hover_enter(unlock_button) then
			self:_play_sound("Play_hud_hover")
		end

		if self:_is_button_pressed(equip_button) and self._selected_backend_id then
			self:_equip_item(self._selected_backend_id)
			self:_play_sound("menu_magic_forge_equip_weapon")
		elseif self:_is_button_pressed(unlock_button) and self._selected_item_id then
			self:_unlock_item(self._selected_item_id)
		elseif self:_is_button_pressed(customize_button) then
			local item = viewport_data.item

			if item then
				params.selected_item = item

				parent:set_layout_by_name("weave_properties")
			end
		end
	end
end

HeroWindowWeaveForgeWeapons._on_list_index_selected = function (self, index)
	local scrollbars = self._scrollbars
	local scrollbar_data = scrollbars.weapons
	local list_widgets = scrollbar_data.list_widgets
	local is_item_equipped = false

	for i, widget in ipairs(list_widgets) do
		local content = widget.content
		local item_key = content.key
		local backend_id = content.backend_id
		local hotspot = content.button_hotspot
		local is_selected = i == index
		hotspot.is_selected = is_selected

		if is_selected then
			is_item_equipped = content.equipped
			self._selected_backend_id = self:_present_item(item_key)
			self._selected_item_id = item_key
		end
	end

	self._selected_list_index = index
	local equipable_item = self._selected_backend_id ~= nil

	self:_update_equip_button_status(equipable_item, is_item_equipped)
end

HeroWindowWeaveForgeWeapons._update_equip_button_status = function (self, equipable_item, is_item_equipped)
	local viewport_data = self._viewport_data

	if viewport_data then
		local equip_button = viewport_data.equip_button
		local can_equip = equipable_item and not is_item_equipped
		local equip_button_text = can_equip and Localize("menu_weave_forge_equip_weapon_button") or Localize("menu_weave_forge_equipped_weapon_button")
		equip_button.content.button_hotspot.disable_button = not can_equip
		equip_button.content.title_text = equip_button_text
	end
end

HeroWindowWeaveForgeWeapons._list_index_by_item_key = function (self, item_key)
	local scrollbars = self._scrollbars
	local scrollbar_data = scrollbars.weapons
	local list_widgets = scrollbar_data.list_widgets

	for i, widget in ipairs(list_widgets) do
		local content = widget.content

		if content.key == item_key then
			return i
		end
	end

	return 1
end

HeroWindowWeaveForgeWeapons._present_item = function (self, item_key, activate_spin)
	local viewport_data = self._viewport_data

	if viewport_data.item_previewer then
		viewport_data.item_previewer:destroy()

		viewport_data.item_previewer = nil
	end

	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local backend_interface_items = backend_manger:get_interface("items")
	local item = nil

	if not self._crafting_tutorial then
		item = backend_interface_items:get_item_from_key(item_key)
	end

	local fake_item = nil
	local locked = false

	if not item then
		local item_data = table.clone(ItemMasterList[item_key])
		item_data.key = item_key
		fake_item = {
			data = item_data,
			key = item_key
		}
		locked = true
	end

	local viewport_widget = viewport_data.widget
	local item_previewer = self:_create_item_previewer(viewport_widget, item or fake_item, activate_spin)
	viewport_data.item_previewer = item_previewer
	viewport_data.item = item
	local magic_level = 0
	local power_level = 0
	local backend_id = item and item.backend_id
	local title_text = ""
	local sub_title_text = ""

	if item then
		magic_level = backend_interface_weaves:get_item_magic_level(backend_id) or 0
		power_level = item.power_level or 0
		power_level = UIUtils.presentable_hero_power_level_weaves(power_level)
		local item_data = item.data
		title_text = Localize(item_data.display_name)
		sub_title_text = Localize(item_data.item_type)
	else
		local item_data = fake_item.data
		title_text = Localize(item_data.display_name)
		sub_title_text = Localize(item_data.item_type)
	end

	viewport_data.magic_level = magic_level
	viewport_data.power_level = power_level
	local widgets_by_name = self._widgets_by_name
	local level_text_widget = widgets_by_name.viewport_level_value
	level_text_widget.content.text = magic_level
	local power_text_widget = widgets_by_name.viewport_power_value
	power_text_widget.content.text = power_level
	local title_widget = widgets_by_name.viewport_title
	title_widget.content.text = title_text
	local sub_title_widget = widgets_by_name.viewport_sub_title
	sub_title_widget.content.text = sub_title_text

	self:_set_presentation_locked_state(locked)

	self._selected_item_locked = locked

	self:_setup_weapon_stats(item or fake_item)

	if not item then
		local current_essence_amount = backend_interface_weaves:get_essence()
		local essence_cost = backend_interface_weaves:magic_item_cost(item_key)
		local can_afford = essence_cost <= current_essence_amount

		self:_set_essence_upgrade_cost(essence_cost, can_afford)
	end

	return backend_id
end

HeroWindowWeaveForgeWeapons._set_presentation_locked_state = function (self, locked)
	local widgets_by_name = self._widgets_by_name
	local level_text_widget = widgets_by_name.viewport_level_value
	local level_title_widget = widgets_by_name.viewport_level_title
	level_text_widget.content.visible = not locked
	level_title_widget.content.visible = not locked
	local power_text_widget = widgets_by_name.viewport_power_value
	local power_title_widget = widgets_by_name.viewport_power_title
	power_text_widget.content.visible = not locked
	power_title_widget.content.visible = not locked
	local panel_divider_widget = widgets_by_name.viewport_panel_divider
	local panel_divider_left_widget = widgets_by_name.viewport_panel_divider_left
	local panel_divider_right_widget = widgets_by_name.viewport_panel_divider_right
	local unlock_button_widget = widgets_by_name.unlock_button
	panel_divider_widget.content.visible = not locked
	panel_divider_left_widget.content.visible = not locked
	panel_divider_right_widget.content.visible = not locked
	unlock_button_widget.content.visible = locked
end

HeroWindowWeaveForgeWeapons._set_essence_upgrade_cost = function (self, essence_cost, can_afford)
	local widgets_by_name = self._widgets_by_name
	local widget_button = widgets_by_name.unlock_button
	local button_content = widget_button.content
	local button_style = widget_button.style
	local button_text = ""

	if essence_cost then
		local value_string = UIUtils.comma_value(essence_cost)
		button_text = Localize("menu_weave_forge_unlock_weapon_button") .. " " .. value_string
	else
		button_text = Localize("backend_err_playfab")
	end

	local ui_renderer = self._ui_top_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, button_style.title_text, button_text)
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_content.price_icon)
	local icon_size = icon_texture_settings.size
	local icon_width = icon_size[1]
	local spacing = 0
	local total_width = icon_width + text_width + spacing
	local text_offset = -(total_width / 2 - (text_width / 2 + 5))
	button_style.title_text.offset[1] = button_style.title_text.default_offset[1] + text_offset
	button_style.title_text_shadow.offset[1] = button_style.title_text_shadow.default_offset[1] + text_offset
	button_style.title_text_disabled.offset[1] = button_style.title_text_disabled.default_offset[1] + text_offset
	button_style.price_icon.offset[1] = text_offset + icon_width / 2 + text_width / 2 + spacing
	button_style.price_icon_disabled.offset[1] = button_style.price_icon.offset[1]
	button_style.price_icon.color[1] = 255
	button_style.price_icon_disabled.color[1] = 255
	button_content.button_hotspot.disable_button = not essence_cost or not can_afford
	button_content.title_text = button_text
end

HeroWindowWeaveForgeWeapons._unlock_item = function (self, item_id)
	self._params.upgrading = true

	self._parent:block_input()

	local time = Managers.time:time("ui")
	self._unlock_item_done_time = time + UNLOCK_ITEM_REQUEST_LIMIT
	self._unlock_item_response = nil
	local widgets_by_name = self._widgets_by_name
	local unlock_button = widgets_by_name.unlock_button
	unlock_button.content.upgrading = true
	unlock_button.content.button_hotspot.disable_button = true
	local callback = callback(self, "_unlock_item_cb")

	if self._crafting_tutorial then
		callback(true)

		local world = Managers.world:world("level_world")
		local level = LevelHelper:current_level(world)

		Level.trigger_event(level, "lua_keep_vom_magic_forge_tutorial_weapon_craft")
	else
		local backend_manger = Managers.backend
		local backend_interface_weaves = backend_manger:get_interface("weaves")

		backend_interface_weaves:buy_magic_item(item_id, callback)
	end
end

HeroWindowWeaveForgeWeapons._unlock_item_cb = function (self, success)
	self._unlock_item_response = success

	if self._crafting_tutorial then
		self._crafting_tutorial = false
		local widgets_by_name = self._widgets_by_name
		local unlock_button = widgets_by_name.unlock_button
		unlock_button.content.highlighted = false
		self._ui_animations.unlock_button_pulse = nil

		self:_update_button_visibility()
	end

	self:_setup_weapon_list()
end

HeroWindowWeaveForgeWeapons._on_unlock_item_done = function (self, success)
	local widgets_by_name = self._widgets_by_name
	local unlock_button = widgets_by_name.unlock_button
	unlock_button.content.upgrading = false
	unlock_button.content.button_hotspot.disable_button = false
	self._params.upgrading = nil

	self._parent:unblock_input()

	if success then
		self:_play_sound("menu_magic_forge_unlock_weapon_for_crafting")

		if self._selected_item_id then
			self._selected_backend_id = self:_present_item(self._selected_item_id)
		end

		Managers.state.event:trigger("weave_forge_item_unlocked")

		local animation_name = "upgrade"
		local active_animation_id = self._animations[animation_name]

		if active_animation_id then
			self._ui_animator:stop_animation(active_animation_id)

			self._animations[animation_name] = nil
		end

		self:_start_transition_animation(animation_name)
	end

	self:_sync_backend_loadout(success)
end

HeroWindowWeaveForgeWeapons._equip_item = function (self, backend_id)
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")

	backend_interface_weaves:set_loadout_item(backend_id, career_name, self._selected_slot_name)
	self:_sync_backend_loadout()

	self._equip_pulse_duration = EQUIP_PULSE_DURATION

	Managers.state.event:trigger("weave_forge_item_equpped")
end

HeroWindowWeaveForgeWeapons._update_item_pulse_animation = function (self, dt)
	local equip_pulse_duration = self._equip_pulse_duration

	if not equip_pulse_duration then
		return
	end

	equip_pulse_duration = math.max(equip_pulse_duration - dt, 0)
	local progress = 1 - equip_pulse_duration / EQUIP_PULSE_DURATION
	local viewport_data = self._viewport_data

	if viewport_data then
		local item_previewer = viewport_data.item_previewer

		if item_previewer then
			local anim_progress = math.ease_pulse(progress)
			local max_zoom = 0.08
			local zoom_value = max_zoom * anim_progress

			item_previewer:set_zoom_fraction(zoom_value)
		end
	end

	if progress == 1 then
		self._equip_pulse_duration = nil
	else
		self._equip_pulse_duration = equip_pulse_duration
	end
end

HeroWindowWeaveForgeWeapons._draw = function (self, dt)
	self:_update_visible_list_entries()

	local parent = self._parent
	local ui_renderer = parent:get_ui_renderer()
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = parent:window_input_service()
	local render_settings = self._render_settings
	local hdr_renderer = parent:hdr_renderer()
	local hdr_top_renderer = parent:hdr_top_renderer()
	local alpha_multiplier = render_settings.alpha_multiplier
	local snap_pixel_positions = render_settings.snap_pixel_positions

	UIRenderer.begin_pass(hdr_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._bottom_hdr_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(hdr_renderer, widget)
	end

	UIRenderer.end_pass(hdr_renderer)
	UIRenderer.begin_pass(hdr_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._top_hdr_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(hdr_top_renderer, widget)
	end

	UIRenderer.end_pass(hdr_top_renderer)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._top_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local scrollbars = self._scrollbars

	if scrollbars then
		for _, scrollbar_data in pairs(scrollbars) do
			local list_widgets = scrollbar_data.list_widgets

			for _, widget in ipairs(list_widgets) do
				render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local viewport_data = self._viewport_data

	if viewport_data then
		local widget = viewport_data.widget
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._bottom_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

local function sort_loadout_widgets(widget_a, widget_b)
	local content_a = widget_a.content
	local content_b = widget_b.content

	return content_b.magic_level < content_a.magic_level
end

HeroWindowWeaveForgeWeapons._populate_list = function (self, layout)
	local scenegraph_id = "weapon_list_entry"
	local size = scenegraph_definition[scenegraph_id].size
	local widgets = {}
	local widget_definition = create_weapon_entry_widget(scenegraph_id, size)
	local ui_renderer = self._ui_renderer
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local num_entries = #layout

	for i = 1, num_entries do
		local entry = layout[i]
		local key = entry.key
		local item_data = entry.item_data
		local icon = item_data.inventory_icon
		local item_type = Localize(item_data.item_type)
		local backend_id = entry.backend_id
		local magic_level = backend_id and backend_interface_weaves:get_item_magic_level(backend_id) or 0
		local widget = UIWidget.init(widget_definition)
		widgets[i] = widget
		local content = widget.content
		local style = widget.style
		local title_style = style.title
		local max_text_width = title_style.size[1] - 60
		content.title = UIRenderer.crop_text_width(ui_renderer, item_type, max_text_width, title_style)
		content.level_title = Localize("menu_weave_forge_magic_level_title") .. ": " .. magic_level
		content.icon = icon
		content.key = key
		content.magic_level = magic_level
	end

	if num_entries > 1 then
		table.sort(widgets, sort_loadout_widgets)
	end

	local spacing = LIST_SPACING
	local total_height = self:_align_list_widgets(widgets, spacing)
	local scrollbar_widget = self._widgets_by_name.weapon_list_scrollbar
	local list_scenegraph_id = "weapon_list_window"
	local root_scenegraph_id = "weapon_scroll_root"
	local scrollbar_logic = self:_initialize_scrollbar(scrollbar_widget, total_height, list_scenegraph_id, spacing)
	self._scrollbars.weapons = {
		total_height = total_height,
		list_widgets = widgets,
		widget = scrollbar_widget,
		scrollbar_logic = scrollbar_logic,
		spacing = spacing,
		root_scenegraph_id = root_scenegraph_id,
		list_scenegraph_id = list_scenegraph_id,
		list_mask_widget = self._widgets_by_name.weapon_list_mask
	}
end

HeroWindowWeaveForgeWeapons._align_list_widgets = function (self, widgets, spacing)
	local total_height = 0
	local num_widgets = #widgets

	for index = 1, num_widgets do
		local widget = widgets[index]
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		widget.default_offset = table.clone(offset)
		local height = size[2]
		offset[2] = -total_height
		total_height = total_height + height

		if index ~= num_widgets then
			total_height = total_height + spacing
		end
	end

	return total_height
end

HeroWindowWeaveForgeWeapons._initialize_scrollbar = function (self, scrollbar_widget, content_length, list_scenegraph_id, spacing)
	local widget_scenegraph_id = scrollbar_widget.scenegraph_id
	local scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local list_size = scenegraph_definition[list_scenegraph_id].size
	local scrollbar_size = scenegraph_definition[widget_scenegraph_id].size
	local draw_length = list_size[2]
	local scrollbar_length = scrollbar_size[2]
	local step_size = 220 + spacing * 1.5
	local scroll_step_multiplier = 1

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	return scrollbar_logic
end

HeroWindowWeaveForgeWeapons._update_scrollbar_positions = function (self)
	local scrollbars = self._scrollbars

	if scrollbars then
		local ui_scenegraph = self._ui_scenegraph

		for _, data in pairs(scrollbars) do
			local scrollbar_logic = data.scrollbar_logic
			local root_scenegraph_id = data.root_scenegraph_id
			local scrolled_length = data.scrolled_length
			local new_scroll_length = scrollbar_logic:get_scrolled_length()

			if new_scroll_length ~= scrolled_length then
				ui_scenegraph[root_scenegraph_id].local_position[2] = math.round(new_scroll_length)
				data.scrolled_length = new_scroll_length
			end
		end
	end
end

HeroWindowWeaveForgeWeapons._update_visible_list_entries = function (self)
	local scrollbars = self._scrollbars

	if scrollbars then
		local ui_scenegraph = self._ui_scenegraph

		for _, data in pairs(scrollbars) do
			local scrollbar_logic = data.scrollbar_logic
			local enabled = scrollbar_logic:enabled()

			if enabled then
				local list_scenegraph_id = data.list_scenegraph_id
				local list_widgets = data.list_widgets
				local spacing = data.spacing
				local scrolled_length = scrollbar_logic:get_scrolled_length()
				local list_size = scenegraph_definition[list_scenegraph_id].size
				local draw_padding = spacing * 2
				local draw_length = list_size[2] + draw_padding

				for index, widget in ipairs(list_widgets) do
					local offset = widget.offset
					local content = widget.content
					local size = content.size
					local widget_position = math.abs(offset[2]) + size[2]
					local is_outside = false

					if widget_position < scrolled_length - draw_padding then
						is_outside = true
					elseif draw_length < math.abs(offset[2]) - scrolled_length then
						is_outside = true
					end

					content.visible = not is_outside
				end
			end
		end
	end
end

HeroWindowWeaveForgeWeapons._get_scrollbar_percentage_by_index = function (self, scrollbar_key, index)
	local scrollbars = self._scrollbars
	local scrollbar_data = scrollbars[scrollbar_key]
	local scrollbar_logic = scrollbar_data.scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_scenegraph_id = scrollbar_data.list_scenegraph_id
		local list_size = scenegraph_definition[list_scenegraph_id].size
		local draw_length = list_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = scrollbar_data.list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2])
			local start_position_bottom = start_position_top + height
			local percentage_difference = 0

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				return scroll_percentage
			end
		end
	end

	return 0
end

HeroWindowWeaveForgeWeapons._find_closest_neighbour = function (self, scrollbar_key, column_index_list, current_index)
	local scrollbars = self._scrollbars
	local scrollbar_data = scrollbars[scrollbar_key]
	local list_widgets = scrollbar_data.list_widgets
	local current_widget = list_widgets[current_index]
	local current_widget_content = current_widget.content
	local current_widget_size = current_widget_content.size
	local current_widget_offset = current_widget.offset
	local current_coordinate_x = current_widget_size[1] * 0.5 + current_widget_offset[1]
	local shortest_distance = math.huge
	local closest_index = nil

	for _, layout_index in pairs(column_index_list) do
		local widget = list_widgets[layout_index]
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local coordinate_x = size[1] * 0.5 + offset[1]
		local distance = math.abs(coordinate_x - current_coordinate_x)

		if distance < shortest_distance then
			shortest_distance = distance
			closest_index = layout_index
		end
	end

	if closest_index then
		return closest_index
	end
end

HeroWindowWeaveForgeWeapons._animate_weapon_lists_widgets = function (self, widgets, dt, is_list_hovered)
	for index, widget in ipairs(widgets) do
		self:_animate_list_widget(widget, dt, is_list_hovered)
	end
end

HeroWindowWeaveForgeWeapons._animate_list_widget = function (self, widget, dt, optional_hover)
	local offset = widget.offset
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot or content.hotspot
	local equipped_in_another_slot = content.equipped_in_another_slot
	local locked = content.locked
	local on_hover_enter = hotspot.on_hover_enter
	local is_hover = hotspot.is_hover

	if optional_hover ~= nil and not optional_hover then
		is_hover = false
		on_hover_enter = false
	end

	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local pulse_progress = hotspot.pulse_progress or 1
	local offset_progress = hotspot.offset_progress or 1
	local selection_progress = hotspot.selection_progress or 0
	local speed = (is_hover or is_selected) and 14 or 8
	local pulse_speed = 3
	local input_speed = 20
	local offset_speed = 5

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if on_hover_enter then
		pulse_progress = 0
	end

	pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)
	local pulse_easing_out_progress = math.easeOutCubic(pulse_progress)
	local pulse_easing_in_progress = math.easeInCubic(pulse_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
		offset_progress = math.min(offset_progress + dt * offset_speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
		offset_progress = math.max(offset_progress - dt * offset_speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress
	style.hover_frame.color[1] = hover_alpha
	local title_text_style = style.title
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_hover_text_color = title_text_style.hover_text_color

	Colors.lerp_color_tables(title_default_text_color, title_hover_text_color, combined_progress, title_text_color)

	local level_title_text_style = style.level_title
	local level_title_text_color = level_title_text_style.text_color
	local level_title_default_text_color = level_title_text_style.default_text_color
	local level_title_hover_text_color = level_title_text_style.hover_text_color

	Colors.lerp_color_tables(level_title_default_text_color, level_title_hover_text_color, combined_progress, level_title_text_color)

	local power_text_text_style = style.power_text
	local power_text_text_color = power_text_text_style.text_color
	local power_text_default_text_color = power_text_text_style.default_text_color
	local power_text_hover_text_color = power_text_text_style.hover_text_color

	Colors.lerp_color_tables(power_text_default_text_color, power_text_hover_text_color, combined_progress, power_text_text_color)

	local pulse_alpha = 255 - 255 * pulse_progress
	style.pulse_frame.color[1] = pulse_alpha
	style.icon.saturated = equipped_in_another_slot or locked
	style.icon_background.saturated = equipped_in_another_slot or locked
	hotspot.offset_progress = offset_progress
	hotspot.pulse_progress = pulse_progress
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

HeroWindowWeaveForgeWeapons._setup_weapon_stats = function (self, item)
	local career_name = self._career_name
	local item_data = item.data
	local item_backend_id = item and item.backend_id
	local item_template = BackendUtils.get_item_template(item_data, item_backend_id)
	local slot_type = item_data.slot_type
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local properties = backend_interface_weaves:get_loadout_properties(career_name, item_backend_id)
	local traits = backend_interface_weaves:get_loadout_traits(career_name, item_backend_id)
	local talents = not item_backend_id and backend_interface_weaves:get_loadout_talents(career_name)
	local entry_height = 70
	local total_height = 10
	local widgets = {}
	local divider_size = {
		0,
		entry_height
	}
	local item_option_size = {
		0,
		entry_height
	}
	local item_option_spacing = 10
	local item_title_widget = self:_create_divider_option_entry(divider_size, Localize("menu_weave_forge_weapon_stats_title"))
	widgets[#widgets + 1] = item_title_widget
	item_title_widget.offset[2] = -total_height
	total_height = total_height + entry_height
	local keywords = item_template.tooltip_keywords

	if keywords then
		local item_keyword_size = {
			0,
			50
		}
		local keywords_text = ""
		local key_word_count = #keywords

		for index, keyword in ipairs(keywords) do
			keywords_text = keywords_text .. Localize(keyword)
			key_word_count = key_word_count - 1

			if key_word_count > 0 then
				keywords_text = keywords_text .. ", "
			end
		end

		local item_keywords_widget = self:_create_item_keywords_option_entry(item_keyword_size, keywords_text)
		widgets[#widgets + 1] = item_keywords_widget
		item_keywords_widget.offset[2] = -total_height
		total_height = total_height + item_keyword_size[2] + item_option_spacing
	end

	if slot_type == ItemType.MELEE then
		local block_angle = item_template.block_angle

		if block_angle then
			local block_degrees = math.degrees_to_radians(block_angle)
			local item_block_widget = self:_create_item_block_option_entry(item_option_size, block_degrees)
			widgets[#widgets + 1] = item_block_widget
			item_block_widget.offset[2] = -total_height
			total_height = total_height + entry_height + item_option_spacing
		end

		local max_fatigue_points = item_template.max_fatigue_points

		if max_fatigue_points then
			local stamina_amount = max_fatigue_points / 2
			local item_stamina_widget = self:_create_item_stamina_option_entry(item_option_size, stamina_amount)
			widgets[#widgets + 1] = item_stamina_widget
			item_stamina_widget.offset[2] = -total_height
			total_height = total_height + entry_height + item_option_spacing
		end
	end

	if slot_type == ItemType.RANGED then
		local ammo_data = item_template.ammo_data

		if ammo_data then
			local single_clip = ammo_data.single_clip
			local reload_time = ammo_data.reload_time
			local max_ammo = ammo_data.max_ammo
			local ammo_per_clip = ammo_data.ammo_per_clip
			local hide_ammo_ui = ammo_data.hide_ammo_ui
			local ammunition_text, description_text = nil

			if single_clip then
				ammunition_text = tostring(max_ammo) .. "/0"
			elseif hide_ammo_ui then
				description_text = Localize("menu_weave_forge_weapon_ammo_burn_description")
			else
				ammunition_text = tostring(ammo_per_clip) .. "/" .. tostring(max_ammo - ammo_per_clip)
			end

			local item_ammunition_widget = self:_create_item_ammunition_option_entry(item_option_size, ammunition_text)
			widgets[#widgets + 1] = item_ammunition_widget
			item_ammunition_widget.offset[2] = -total_height
			total_height = total_height + entry_height + item_option_spacing

			if hide_ammo_ui then
				item_ammunition_widget.content.hide_ammo_ui = hide_ammo_ui
				item_ammunition_widget.content.description_text = description_text
			end
		else
			local item_overheat_widget = self:_create_item_overheat_option_entry(item_option_size)
			widgets[#widgets + 1] = item_overheat_widget
			item_overheat_widget.offset[2] = -total_height
			total_height = total_height + entry_height + item_option_spacing
		end
	end

	if traits then
		local num_traits_added = 0

		for trait_key, _ in pairs(traits) do
			num_traits_added = num_traits_added + 1
		end

		if num_traits_added > 0 then
			local traits_title_widget = self:_create_divider_option_entry(divider_size, Localize("menu_weave_forge_options_title_traits"))
			widgets[#widgets + 1] = traits_title_widget
			traits_title_widget.offset[2] = -total_height
			total_height = total_height + entry_height
		end

		local trait_size = {
			0,
			entry_height
		}

		for trait_key, _ in pairs(traits) do
			local trait_data = WeaveTraits.traits[trait_key]
			local icon = trait_data.icon or "icons_placeholder"
			local display_name = trait_data.display_name
			local trait_icon = trait_data.icon
			local title_text = Localize(display_name)
			local description_text = ""
			local trait_advanced_description = trait_data.advanced_description

			if trait_advanced_description then
				description_text = UIUtils.get_trait_description(trait_key, trait_data)
			end

			local widget, additional_height = self:_create_trait_option_entry(trait_size, title_text, description_text, icon)
			widgets[#widgets + 1] = widget
			widget.offset[2] = -total_height
			total_height = total_height + entry_height + additional_height
		end
	end

	if properties then
		local num_properties_added = 0

		for property_key, _ in pairs(properties) do
			num_properties_added = num_properties_added + 1
		end

		if num_properties_added > 0 then
			local property_title_widget = self:_create_divider_option_entry(divider_size, Localize("menu_weave_forge_options_title_properties"))
			widgets[#widgets + 1] = property_title_widget
			property_title_widget.offset[2] = -total_height
			total_height = total_height + entry_height
		end

		local properties_index_map = {}
		local property_size = {
			0,
			entry_height
		}

		for property_key, slot_indices in pairs(properties) do
			local used_amount = #slot_indices
			local property_data = WeaveProperties.properties[property_key]
			local mastery_costs = backend_interface_weaves:get_property_mastery_costs(property_key)
			local title_text = UIUtils.get_weave_property_description(property_key, property_data, mastery_costs, used_amount)
			local end_index = string.find(title_text, " ", 1)
			local value_string = string.sub(title_text, 1, end_index)
			local icon = property_data.icon or "icons_placeholder"
			local widget = self:_create_property_option_entry(property_size, title_text, value_string, icon)
			widgets[#widgets + 1] = widget
			widget.offset[2] = -total_height
			total_height = total_height + entry_height
		end
	end

	local scrollbar_widget = self._widgets_by_name.stats_list_scrollbar
	local list_scenegraph_id = "stats_list_window"
	local root_scenegraph_id = "stats_scroll_root"
	local spacing = 0
	local scrollbar_logic = self:_initialize_scrollbar(scrollbar_widget, total_height, list_scenegraph_id, spacing)
	self._scrollbars.stats = {
		total_height = total_height,
		list_widgets = widgets,
		widget = scrollbar_widget,
		scrollbar_logic = scrollbar_logic,
		spacing = spacing,
		root_scenegraph_id = root_scenegraph_id,
		list_scenegraph_id = list_scenegraph_id,
		list_mask_widget = self._widgets_by_name.stats_list_mask
	}
end

HeroWindowWeaveForgeWeapons._create_item_keywords_option_entry = function (self, size, text)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_item_keywords_option(size, scenegraph_id, masked, text)
	local widget = UIWidget.init(definition)
	local content = widget.content
	local style = widget.style
	local text_style = style.text

	return widget
end

HeroWindowWeaveForgeWeapons._create_item_overheat_option_entry = function (self, size)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_item_overheat_option(size, scenegraph_id, masked)
	local widget = UIWidget.init(definition)

	return widget
end

HeroWindowWeaveForgeWeapons._create_item_ammunition_option_entry = function (self, size, amount)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_item_ammunition_option(size, scenegraph_id, masked, amount)
	local widget = UIWidget.init(definition)

	return widget
end

HeroWindowWeaveForgeWeapons._create_item_stamina_option_entry = function (self, size, amount)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_item_stamina_option(size, scenegraph_id, masked, amount)
	local widget = UIWidget.init(definition)

	return widget
end

HeroWindowWeaveForgeWeapons._create_item_block_option_entry = function (self, size, angle)
	print("_create_item_block_option_entry", angle)

	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_item_block_option(size, scenegraph_id, masked, angle)
	local widget = UIWidget.init(definition)

	return widget
end

HeroWindowWeaveForgeWeapons._create_divider_option_entry = function (self, size, title_text)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_divider_option(size, scenegraph_id, masked, title_text)
	local widget = UIWidget.init(definition)
	local content = widget.content
	local style = widget.style
	local text_style = style.text

	return widget
end

HeroWindowWeaveForgeWeapons._create_trait_option_entry = function (self, size, title_text, description_text, icon)
	local masked = true
	local ui_renderer = self._ui_renderer
	local scenegraph_id = "stat_option"
	local definition = create_trait_option(size, scenegraph_id, masked, title_text, description_text, icon)
	local widget = UIWidget.init(definition)
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local description_text_style = style.description_text
	local description_text_size = description_text_style.size
	local text_height = math.floor(UIUtils.get_text_height(ui_renderer, description_text_size, description_text_style, description_text))
	local additional_height = math.floor(text_height)

	return widget, additional_height
end

HeroWindowWeaveForgeWeapons._create_property_option_entry = function (self, size, text, value_string, icon)
	local masked = true
	local scenegraph_id = "stat_option"
	local display_text = text
	local definition = create_property_option(size, scenegraph_id, masked, display_text, icon)
	local widget = UIWidget.init(definition)
	local style = widget.style
	local text_style = style.text
	local color_override_table = text_style.color_override_table
	local default_text_length = UTF8Utils.string_length(text) or 0
	local value_string_length = UTF8Utils.string_length(value_string)
	local text_style = style.text

	if text_style then
		local color_override_table = text_style.color_override_table
		color_override_table.start_index = value_string_length
		color_override_table.end_index = default_text_length
		local color_override = text_style.color_override
		color_override[1] = color_override_table
	end

	return widget
end
