require("scripts/ui/views/menu_world_previewer")

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_item_customization_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local widget_definitions = definitions.widgets
local crafting_widget_definitions = definitions.crafting_widgets
local info_widget_definitions = definitions.info_widgets
local weapon_illusion_base_widgets_definitions = definitions.weapon_illusion_base_widgets
local trait_reroll_widget_definitions = definitions.trait_reroll_widgets
local upgrade_widget_definitions = definitions.upgrade_widgets
local property_reroll_widget_definitions = definitions.property_reroll_widgets
local viewport_widget_definition = definitions.viewport_widget
local create_property_option = definitions.create_property_option
local create_trait_option = definitions.create_trait_option
local create_illusion_button = definitions.create_illusion_button
local background_rect_definition = definitions.background_rect
local generic_input_actions = definitions.generic_input_actions
local states = {
	item_setting = {
		setup_function = "_state_setup_overview",
		craft_complete_func_name = "_apply_weapon_skin_craft_complete",
		gamepad_input_func = "_update_skin_gamepad_input",
		transition_time = 0.3,
		fov = 30,
		draw_function = "_state_draw_overview",
		camera_position = {
			0,
			0,
			0
		}
	},
	item_properties = {
		setup_function = "_state_setup_property_reroll",
		craft_complete_func_name = "_state_setup_property_reroll",
		transition_time = 0.3,
		fov = 30,
		draw_function = "_state_draw_property_reroll",
		camera_position = {
			0,
			-1,
			0
		},
		recipe_by_slot_type = {
			trinket = "reroll_jewellery_properties",
			ranged = "reroll_weapon_properties",
			necklace = "reroll_jewellery_properties",
			ring = "reroll_jewellery_properties",
			melee = "reroll_weapon_properties"
		}
	},
	item_trait = {
		setup_function = "_state_setup_trait_reroll",
		craft_complete_func_name = "_state_setup_trait_reroll",
		transition_time = 0.3,
		fov = 30,
		draw_function = "_state_draw_trait_reroll",
		camera_position = {
			0,
			-1,
			0
		},
		recipe_by_slot_type = {
			trinket = "reroll_jewellery_traits",
			ranged = "reroll_weapon_traits",
			necklace = "reroll_jewellery_traits",
			ring = "reroll_jewellery_traits",
			melee = "reroll_weapon_traits"
		}
	},
	item_upgrade = {
		setup_function = "_state_setup_upgrade",
		craft_complete_func_name = "_upgrade_item_craft_complete",
		transition_time = 0.3,
		fov = 30,
		draw_function = "_state_draw_upgrade",
		camera_position = {
			0,
			-1,
			0
		},
		recipe_by_rarity = {
			common = "upgrade_item_rarity_rare",
			plentiful = "upgrade_item_rarity_common",
			rare = "upgrade_item_rarity_exotic",
			exotic = "upgrade_item_rarity_unique"
		}
	}
}
HeroWindowItemCustomization = class(HeroWindowItemCustomization)
HeroWindowItemCustomization.NAME = "HeroWindowItemCustomization"

HeroWindowItemCustomization.on_enter = function (self, params)
	print("[HeroViewWindow] Enter Substate HeroWindowItemCustomization")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._career_index = params.career_index
	self._profile_index = params.profile_index
	local hero_data = SPProfiles[self._profile_index]
	local career_data = hero_data.careers[self._career_index]
	self._career_name = career_data.name
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._state_render_settings = {
		alpha_multiplier = 0
	}
	self._animations = {}
	self._ui_animations = {}
	self._animation_callbacks = {}
	self._craft_progress = 0
	local item = params.item_to_customize
	self._item_backend_id = item.backend_id

	self:_create_ui_elements()
	self:_setup_menu_input_description()
	self:_present_item(item)
	self:_find_equipment_slot()
	self:_setup_availble_states(item)
	self:_option_selected(1, true)
	self:_start_transition_animation("on_enter")
end

HeroWindowItemCustomization._setup_menu_input_description = function (self)
	local gui_layer = UILayer.default + 30
	local input_service = self._parent:window_input_service()
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 5, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
end

HeroWindowItemCustomization._find_equipment_slot = function (self)
	local backend_items = Managers.backend:get_interface("items")
	local equipment_slot_name = nil

	for _, slot_data in pairs(InventorySettings.equipment_slots) do
		equipment_slot_name = slot_data.name
		local equipped_item_backend_id = backend_items:get_loadout_item_id(self._career_name, equipment_slot_name)

		if equipped_item_backend_id == self._item_backend_id then
			break
		end
	end

	if not equipment_slot_name then
		local item = self:_get_item(self._item_backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type
		equipment_slot_name = InventorySettings.slot_names_by_type[slot_type][1]
	end

	self._equipment_slot_name = equipment_slot_name
end

HeroWindowItemCustomization._setup_availble_states = function (self, item)
	local item_data = item.data
	local item_rarity = item.rarity or item_data.rarity or "default"
	local rarity_rating_table = UISettings.item_rarity_order
	local rarity_rating = rarity_rating_table[item_rarity] or rarity_rating_table.default

	if item_rarity == "default" or item_rarity == "promo" then
		self._available_states = {
			"item_setting"
		}
	elseif rarity_rating <= rarity_rating_table.unique then
		self._available_states = {
			"item_setting",
			"item_properties",
			"item_trait"
		}
	elseif rarity_rating <= rarity_rating_table.exotic then
		self._available_states = {
			"item_setting",
			"item_properties",
			"item_trait",
			"item_upgrade"
		}
	elseif rarity_rating <= rarity_rating_table.common then
		self._available_states = {
			"item_setting",
			"item_properties",
			"item_upgrade"
		}
	elseif rarity_rating <= rarity_rating_table.plentiful then
		self._available_states = {
			"item_setting",
			"item_upgrade"
		}
	end

	self._states = {}
	local widgets_by_name = self._widgets_by_name

	for state_name, _ in pairs(states) do
		local available = table.find(self._available_states, state_name)

		if available then
			self._states[state_name] = states[state_name]
		end

		local widget = widgets_by_name[state_name]
		widget.content.visible = available
	end

	if self._state and not self._states[self._state] then
		local widget = self._widgets_by_name[self._state]
		widget.content.button_hotspot.is_selected = false
		widget.style.hover_frame.saturated = false

		self:_option_selected(1, true)
	end
end

HeroWindowItemCustomization._set_camera_position = function (self, camera_position)
	local preview_widget = self._preview_widget
	local previewer_pass_data = preview_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local camera = ScriptViewport.camera(viewport)

	ScriptCamera.set_local_position(camera, camera_position)
end

HeroWindowItemCustomization._camera_position = function (self)
	local preview_widget = self._preview_widget
	local previewer_pass_data = preview_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

HeroWindowItemCustomization._set_camera_fov = function (self, fov)
	local preview_widget = self._preview_widget
	local previewer_pass_data = preview_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local camera = ScriptViewport.camera(viewport)

	Camera.set_vertical_fov(camera, math.pi * fov / 180)
end

HeroWindowItemCustomization._camera_fov = function (self)
	local preview_widget = self._preview_widget
	local previewer_pass_data = preview_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local camera = ScriptViewport.camera(viewport)
	local vertical_fov = Camera.vertical_fov(camera)

	return math.floor(vertical_fov * 180 / math.pi)
end

HeroWindowItemCustomization._change_state = function (self, new_state)
	local same_state = self._state == new_state

	if not same_state then
		local states = self._states
		local state_data = states[new_state]

		fassert(state_data, "[HeroWindowItemCustomization:_change_state] There is no state called %s", tostring(new_state))

		self._state = new_state
		local setup_function = state_data.setup_function

		if setup_function then
			self[setup_function](self)
		end

		self._state_render_settings.alpha_multiplier = 0
	end

	self._state_start_fov = self:_camera_fov()
	local camera_position = self:_camera_position()
	self._state_start_camera_position = {
		camera_position.x,
		camera_position.y,
		camera_position.z
	}
	self._state_transition_timer = 0

	if self._skin_dirty then
		local item = self:_get_item(self._item_backend_id)

		self:_present_item(item, true)

		self._skin_dirty = nil
	end
end

HeroWindowItemCustomization._get_item = function (self, backend_id)
	self._item_backend_id = backend_id
	local backend_items = Managers.backend:get_interface("items")

	return backend_items:get_item_from_id(backend_id)
end

HeroWindowItemCustomization._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
		state_render_settings = self._state_render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowItemCustomization._create_ui_elements = function (self)
	if self._preview_widget then
		UIWidget.destroy(self._ui_top_renderer, self._preview_widget)

		self._preview_widget = nil
	end

	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_scenegraph = ui_scenegraph
	self._background_widget = UIWidget.init(background_rect_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local crafting_widgets = {}

	for name, widget_definition in pairs(crafting_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		crafting_widgets[#crafting_widgets + 1] = widget
		self._widgets_by_name[name] = widget
	end

	self._crafting_widgets = crafting_widgets

	self:_create_preview_widget()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)
end

HeroWindowItemCustomization._create_preview_widget = function (self)
	local item_preview_definition = self:_create_item_preview_widget_definition()
	local item_preview_widget = UIWidget.init(item_preview_definition)
	self._preview_widget = item_preview_widget

	self:_register_object_sets(self._preview_widget, item_preview_definition)
end

HeroWindowItemCustomization._create_item_preview_widget_definition = function (self)
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "viewport",
			style_id = "viewport"
		},
		{
			pass_type = "hotspot",
			content_id = "button_hotspot"
		}
	}
	local content = {
		activated = true,
		button_hotspot = {}
	}
	local style = {
		viewport = {
			viewport_type = "default_forward",
			layer = 962,
			shading_environment = "environment/ui_store_preview",
			viewport_name = "item_preview",
			level_name = "levels/ui_store_preview/world",
			enable_sub_gui = true,
			fov = 65,
			world_name = "item_preview",
			object_sets = LevelResource.object_set_names("levels/ui_store_preview/world"),
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
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = "item_preview"

	return widget
end

HeroWindowItemCustomization.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowItemCustomization")

	self._ui_animator = nil

	if self._previewer then
		self._previewer:destroy()
	end

	if self._preview_widget then
		UIWidget.destroy(self._ui_top_renderer, self._preview_widget)
	end

	if self._character_dirty then
		self._parent:update_skin_sync()
	end
end

HeroWindowItemCustomization.play_sound = function (self, sound_event)
	self._parent:play_sound(sound_event)
end

HeroWindowItemCustomization.update = function (self, dt, t)
	self:_handle_gamepad_activity()
	self:_update_craft_response()

	if self._item_dirty then
		self:_update_item_rarity()
		self:_update_property_option()
		self:_update_trait_option()
		self:_update_upgrade_option()

		self._item_dirty = false
	end

	self:_update_active_preview()
	self:_update_animations(dt)

	local parent = self._parent
	local input_service = parent:window_input_service()

	self:_handle_gamepad_input(input_service, dt, t)
	self:_handle_input(input_service, dt, t)

	if self._previewer then
		self._previewer:update(dt, t, input_service)
	end

	local scrollbar_logic = self._scrollbar_logic

	if scrollbar_logic then
		scrollbar_logic:update(dt, t)
	end

	self:_update_scroll_position()
	self:_draw(input_service, dt)
end

HeroWindowItemCustomization.post_update = function (self, dt, t)
	if self._previewer then
		self._previewer:post_update(dt, t)
	end
end

HeroWindowItemCustomization._register_object_sets = function (self, viewport_widget, viewport_definition)
	local viewport_definition_style = viewport_definition.style.viewport
	local viewport_widget_content = viewport_widget.content
	local viewport_widget_element = viewport_widget.element
	local pass_data = viewport_widget_element.pass_data[1]
	local level_name = viewport_definition_style.level_name
	local object_sets = {}
	local available_level_sets = LevelResource.object_set_names(level_name)

	for _, set_name in ipairs(available_level_sets) do
		object_sets[set_name] = {
			set_enabled = true,
			units = LevelResource.unit_indices_in_object_set(level_name, set_name)
		}
	end

	viewport_widget_content.object_set_data = {
		world = pass_data.world,
		level = pass_data.level,
		object_sets = object_sets,
		level_name = level_name
	}

	self:_show_object_set(nil, true)
end

HeroWindowItemCustomization._show_object_set = function (self, object_set_name, force_disable)
	if not self._preview_widget then
		print("[StoreWindowItemPreview:show_object_set] Viewport not initiated")

		return
	end

	local viewport_widget_content = self._preview_widget.content
	local object_set_data = viewport_widget_content.object_set_data
	local world = object_set_data.world
	local level = object_set_data.level
	local level_name = object_set_data.level_name
	local object_sets = object_set_data.object_sets

	if not object_sets[object_set_name] and not force_disable then
		print(string.format("[StoreWindowItemPreview:show_object_set] No object set called %q in level %q", object_set_name, level_name))

		return
	end

	for set_name, object_set_data in pairs(object_sets) do
		local set_enabled = object_set_data.set_enabled

		if set_enabled and set_name ~= object_set_name then
			local units = object_set_data.units

			for _, unit_index in ipairs(units) do
				local unit = Level.unit_by_index(level, unit_index)

				Unit.set_unit_visibility(unit, false)
			end

			object_set_data.set_enabled = false
		elseif not set_enabled and set_name == object_set_name then
			local units = object_set_data.units

			for _, unit_index in ipairs(units) do
				local unit = Level.unit_by_index(level, unit_index)

				Unit.set_unit_visibility(unit, true)

				if Unit.has_data(unit, "LevelEditor", "is_gizmo_unit") then
					local is_gizmo = Unit.get_data(unit, "LevelEditor", "is_gizmo_unit")
					local is_reflection_probe = Unit.is_a(unit, "core/stingray_renderer/helper_units/reflection_probe/reflection_probe")

					if is_gizmo and not is_reflection_probe then
						Unit.flow_event(unit, "hide_helper_mesh")
					end
				end
			end

			object_set_data.set_enabled = true
		end
	end
end

HeroWindowItemCustomization._update_environment = function (self, item_preview_environment, force_default)
	if not self._preview_widget then
		return
	end

	local item_preview_environment = item_preview_environment or "default"
	local viewport_widget_content = self._preview_widget.content
	local object_set_data = viewport_widget_content.object_set_data
	local world = object_set_data.world
	local shading_settings = World.get_data(world, "shading_settings")
	shading_settings[1] = force_default and "default" or item_preview_environment
end

HeroWindowItemCustomization._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_hover
end

HeroWindowItemCustomization._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

HeroWindowItemCustomization._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowItemCustomization._navigation_menu_disabled = function (self)
	local disabled = self._mission_selection_grid ~= nil

	return disabled
end

HeroWindowItemCustomization._handle_gamepad_input = function (self, input_service, dt, t)
	local parent = self._parent
	local input_handled = false
	local navigation_menu_disabled = self:_navigation_menu_disabled()
	local widgets_by_name = self._widgets_by_name

	if not navigation_menu_disabled then
		local state_data = self._states[self._state]
		local gamepad_input_func = state_data.gamepad_input_func

		if gamepad_input_func then
			input_handled = self[gamepad_input_func](self, input_service, dt, t)
		end

		if not input_handled then
			local input_move_up = input_service:get("move_up_hold_continuous")
			local input_move_down = input_service:get("move_down_hold_continuous")
			local input_index = self._input_index

			if input_move_down then
				input_index = math.min(input_index + 1, #self._available_states)
			elseif input_move_up then
				input_index = math.max(input_index - 1, 1)
			end

			if input_index ~= self._input_index then
				self:_handle_new_selection(input_index)
				self:_option_selected(self._input_index)

				input_handled = true
			end

			local widget = self._info_widgets_by_name.weapon_diagram

			if widget then
				widget.content.show_info = not input_handled and input_service:get("trigger_cycle_previous_hold")
			end

			if self._material_items and self._current_recipe_name and self._has_all_crafting_requirements then
				local craft_button = widgets_by_name.craft_button
				local experience_bar = widgets_by_name.experience_bar
				local craft_progress = self._craft_progress

				if craft_button.content.visible then
					local speed = 2

					if not UIUtils.is_button_held(craft_button) then
						if input_service:get("refresh_hold") or input_service:get("skip") then
							craft_progress = math.clamp(craft_progress + dt * speed, 0, 1)
						else
							craft_progress = math.max(craft_progress - dt * speed, 0)
						end
					end

					local progress = math.easeOutCubic(craft_progress)
					self._ui_scenegraph.experience_bar.size[1] = 390 * progress
					experience_bar.content.texture_id.uvs[2][1] = progress
					experience_bar.content.visible = true

					if craft_progress >= 1 then
						self:_craft(self._material_items, self._current_recipe_name)

						craft_progress = 0
					end

					self._craft_progress = craft_progress
				end
			end
		end
	end
end

HeroWindowItemCustomization._handle_input = function (self, input_service, dt, t)
	local parent = self._parent
	local input_handled = false
	local widgets_by_name = self._widgets_by_name
	local hover_index = nil

	for i = 1, #self._available_states do
		local widget_name = self._available_states[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = widget.content.button_hotspot.is_selected

		if not is_selected and self:_is_button_hover_enter(widget) then
			self:play_sound("Play_hud_hover")
		end

		if self:_is_button_hover(widget) then
			hover_index = i
		end

		if self:_is_button_pressed(widget) then
			self:_option_selected(i)

			input_handled = true
		end
	end

	local item = self:_get_item(self._item_backend_id)
	local item_key = item.key
	local default_skin = WeaponSkins.default_skins[item_key]
	local item_skin = item.skin
	local illusion_widgets = self._illusion_widgets
	local weapon_illusion_base_widgets_by_name = self._weapon_illusion_base_widgets_by_name
	local illusions_name_content = weapon_illusion_base_widgets_by_name.illusions_name.content
	local selected_skin, hover_skin = nil

	for i = 1, #illusion_widgets do
		local widget = illusion_widgets[i]

		if UIUtils.is_button_hover(widget) then
			hover_skin = widget.content.skin_key
		elseif UIUtils.is_button_selected(widget) then
			selected_skin = widget.content.skin_key
		end
	end

	local current_skin = hover_skin or selected_skin or item_skin or default_skin
	local item_data = current_skin and ItemMasterList[current_skin]
	illusions_name_content.text = item_data and Localize(item_data.display_name) or ""

	if self._material_items and self._current_recipe_name then
		local craft_button = widgets_by_name.craft_button
		local experience_bar = widgets_by_name.experience_bar
		local craft_progress = self._craft_progress
		local speed = 2

		if not input_service:get("refresh_hold") and not input_service:get("skip") then
			if UIUtils.is_button_held(craft_button) then
				craft_progress = math.clamp(craft_progress + dt * speed, 0, 1)

				if not self._playing_craft_sound then
					self:_play_sound("play_gui_craft_forge_button_begin_qol")

					self._playing_craft_sound = true
				end
			else
				craft_progress = math.max(craft_progress - dt * speed, 0)

				if self._playing_craft_sound and not self._waiting_for_craft then
					self:_play_sound("play_gui_craft_forge_button_aborted_qol")

					self._playing_craft_sound = false
				end
			end
		end

		local progress = math.easeOutCubic(craft_progress)
		self._ui_scenegraph.experience_bar.size[1] = 390 * progress
		experience_bar.content.texture_id.uvs[2][1] = progress
		experience_bar.content.visible = true

		if craft_progress >= 1 then
			self:_craft(self._material_items, self._current_recipe_name)

			craft_progress = 0
		end

		self._craft_progress = craft_progress
	end

	self._hover_index = hover_index
end

HeroWindowItemCustomization._update_active_preview = function (self)
	local input_index = self._active_selection_index or self._hover_index or self._input_index
	local selector_name = self._available_states[input_index]
	self._active_selector_preview = selector_name
end

HeroWindowItemCustomization._option_selected = function (self, input_index, ignore_sound)
	local parent = self._parent
	local selected_widget_name = self._available_states[input_index]
	local select_option = false
	local index_already_selected = input_index and self._active_selection_index == input_index

	if not ignore_sound then
		self:play_sound("Play_hud_select")
	end

	if not index_already_selected then
		select_option = true

		self:_change_state(selected_widget_name)
	end

	local mouse_active = Managers.input:is_device_active("mouse")
	local old_selection_index = self._active_selection_index
	self._active_selection_index = select_option and input_index
	local widgets_by_name = self._widgets_by_name

	for i = 1, #self._available_states do
		local widget_state_name = self._available_states[i]
		local widget = widgets_by_name[widget_state_name]
		widget.style.hover_frame.saturated = select_option and input_index == i or not mouse_active and i == old_selection_index
	end

	if select_option then
		self:_handle_new_selection(self._active_selection_index)
	elseif self._input_index then
		local gamepad_active = Managers.input:is_device_active("gamepad")

		if not gamepad_active then
			self:_handle_new_selection(nil)
		end
	end
end

HeroWindowItemCustomization._setting_option_pressed = function (self, widget)
	local content = widget.content
	local num_options = content.num_options

	for i = 1, num_options do
		local hotspot_name = "button_hotspot_" .. i
		local hotspot = content[hotspot_name]

		if hotspot.on_release or hotspot.is_selected then
			local option_key_name = "option_key_" .. i

			return content[option_key_name], hotspot.marked
		end
	end
end

HeroWindowItemCustomization._set_setting_option_selected = function (self, widget, index, select_all)
	local content = widget.content
	local num_options = content.num_options

	if num_options then
		for i = 1, num_options do
			local hotspot_name = "button_hotspot_" .. i
			local hotspot = content[hotspot_name]
			local is_selected = select_all or i == index
			hotspot.is_selected = is_selected
		end
	end
end

HeroWindowItemCustomization._handle_new_selection = function (self, input_index)
	local num_inputs = #self._available_states
	input_index = input_index and math.clamp(input_index, 1, num_inputs)
	local mouse_active = Managers.input:is_device_active("mouse")
	local widgets_by_name = self._widgets_by_name

	for i = 1, #self._available_states do
		local widget_name = self._available_states[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index
		widget.content.button_hotspot.is_selected = is_selected or i == self._active_selection_index

		if not mouse_active then
			widget.style.hover_frame.saturated = not is_selected
		end

		self:_set_setting_option_selected(widget, is_selected and 1, is_selected)
	end

	if input_index and self._input_index ~= input_index then
		self:play_sound("Play_hud_hover")
	end

	self._input_index = input_index
end

HeroWindowItemCustomization._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local ui_animations = self._ui_animations
	local animation_callbacks = self._animation_callbacks

	for anmation_name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[anmation_name] = nil

			if animation_callbacks[anmation_name] then
				animation_callbacks[anmation_name]()

				animation_callbacks[anmation_name] = nil
			end
		end
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.craft_button, dt)
	UIWidgetUtils.animate_game_option_button(widgets_by_name.item_setting, dt)
	UIWidgetUtils.animate_game_option_button(widgets_by_name.item_properties, dt)
	UIWidgetUtils.animate_game_option_button(widgets_by_name.item_trait, dt)
	UIWidgetUtils.animate_game_option_button(widgets_by_name.item_upgrade, dt)
	self:_animate_state_transition(dt)
end

HeroWindowItemCustomization._animate_state_transition = function (self, dt)
	local state_transition_timer = self._state_transition_timer

	if not state_transition_timer then
		return
	end

	local state = self._state
	local states = self._states
	local state_data = states[state]
	local transition_time = state_data.transition_time
	state_transition_timer = state_transition_timer + dt
	local progress = math.clamp(state_transition_timer / transition_time, 0, 1)
	local anim_progress = math.smoothstep(progress, 0, 1)
	local start_fov = self._state_start_fov

	if start_fov then
		local fov = state_data.fov
		local fov_difference = fov - self._state_start_fov
		local new_fov = start_fov + fov_difference * anim_progress

		self:_set_camera_fov(new_fov)
	end

	local state_start_camera_position = self._state_start_camera_position

	if state_start_camera_position then
		local camera_position = state_data.camera_position
		local target_x = camera_position and camera_position[1] or 0
		local target_y = camera_position and camera_position[2] or 0
		local target_z = camera_position and camera_position[3] or 0
		local start_x = state_start_camera_position[1]
		local start_y = state_start_camera_position[2]
		local start_z = state_start_camera_position[3]
		local x_difference = target_x - start_x
		local y_difference = target_y - start_y
		local z_difference = target_z - start_z
		local new_x = start_x + x_difference * anim_progress
		local new_y = start_y + y_difference * anim_progress
		local new_z = start_z + z_difference * anim_progress

		if x_difference ~= 0 or y_difference ~= 0 or z_difference ~= 0 then
			local new_position = Vector3(new_x, new_y, new_z)

			self:_set_camera_position(new_position)
		end
	end

	self._state_render_settings.alpha_multiplier = math.max(anim_progress, self._state_render_settings.alpha_multiplier)

	if progress == 1 then
		self._state_transition_timer = nil
	else
		self._state_transition_timer = state_transition_timer
	end
end

HeroWindowItemCustomization._draw = function (self, input_service, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local parent_scenegraph_id = nil
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local state = self._state

	if state then
		local states = self._states
		local state_data = states[state]
		local state_draw_function = state_data.draw_function

		if state_draw_function then
			render_settings.alpha_multiplier = self._state_render_settings.alpha_multiplier or 0

			self[state_data.draw_function](self, ui_top_renderer, dt)

			render_settings.alpha_multiplier = alpha_multiplier
		end
	end

	render_settings.alpha_multiplier = self._state_render_settings.alpha_multiplier or 0

	for _, widget in ipairs(self._crafting_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	render_settings.alpha_multiplier = alpha_multiplier

	if self._previewer then
		UIRenderer.draw_widget(ui_top_renderer, self._preview_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowItemCustomization._state_draw_overview = function (self, ui_renderer, dt)
	local info_widgets = self._info_widgets

	if info_widgets then
		for _, widget in ipairs(info_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local illusion_widgets = self._illusion_widgets

	if illusion_widgets and #illusion_widgets > 0 then
		local weapon_illusion_base_widgets = self._weapon_illusion_base_widgets

		for _, widget in ipairs(weapon_illusion_base_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		for _, widget in ipairs(illusion_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		local illusion_widgets = self._illusion_widgets

		for index, widget in ipairs(illusion_widgets) do
			if self:_is_button_pressed(widget) then
				self:_on_illusion_index_pressed(index)

				break
			elseif self:_is_button_hover_enter(widget) then
				self:_play_sound("play_gui_equipment_inventory_hover")
			end
		end
	end
end

HeroWindowItemCustomization._state_draw_property_reroll = function (self, ui_renderer, dt)
	local property_reroll_widgets = self._property_reroll_widgets

	if property_reroll_widgets then
		for _, widget in ipairs(property_reroll_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		local property_reroll_option_widgets = self._property_reroll_option_widgets

		if property_reroll_option_widgets then
			for _, widget in ipairs(property_reroll_option_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end

		local material_widgets = self._material_widgets

		if material_widgets then
			for _, widget in ipairs(material_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end
end

HeroWindowItemCustomization._handle_gamepad_activity = function (self)
	local force_update = self.gamepad_active_last_frame == nil
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name

			if not self._input_index then
				self._input_index = self._input_index or 1

				self:_handle_new_selection(self._input_index)
			end
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name

		if not self._active_selection_index then
			self:_handle_new_selection(nil)
		end
	end
end

HeroWindowItemCustomization._update_item_rarity = function (self)
	local item = self:_get_item(self._item_backend_id)
	local item_data = item.data
	local rarity = item.rarity or item_data.rarity
	local widgets_by_name = self._widgets_by_name
	local rarity_display_widget = widgets_by_name.rarity_display
	local rarity_display_content = rarity_display_widget.content
	local rarity_display_textures = rarity_display_content.texture_id
	local count = 0
	local rarity_order = UISettings.item_rarity_order[rarity]
	local item_rarities = UISettings.item_rarities
	local rarity_index = table.index_of(item_rarities, rarity)

	for i = 1, #item_rarities do
		local rarity_name = item_rarities[i]
		local rarity_texture = nil

		if rarity_index < i then
			rarity_texture = "item_tier_empty"
		else
			rarity_texture = "item_tier_" .. rarity_name
		end

		if UIAtlasHelper.has_texture_by_name(rarity_texture) then
			count = count + 1
			rarity_display_textures[count] = rarity_texture
		end
	end

	local rarity_color = Colors.get_color_table_with_alpha(rarity, 255)
	local item_setting_widget = widgets_by_name.item_setting
	local item_setting_content = item_setting_widget.content
	local item_setting_style = item_setting_widget.style
	local item_setting_input_text_style = item_setting_style.input_text
	local color_multiplier = 0.8
	local active_color = {
		255,
		math.floor(rarity_color[2] * color_multiplier),
		math.floor(rarity_color[3] * color_multiplier),
		math.floor(rarity_color[4] * color_multiplier)
	}
	item_setting_input_text_style.text_color = active_color
	item_setting_input_text_style.default_text_color = active_color
	item_setting_input_text_style.select_text_color = rarity_color
end

HeroWindowItemCustomization._update_property_option = function (self)
	local item = self:_get_item(self._item_backend_id)
	local properties = item.properties

	if properties then
		local properties_widget = self._widgets_by_name.item_properties
		local content = properties_widget.content
		local property_count = 0

		for property_key, property_value in pairs(properties) do
			property_count = property_count + 1
			local property_data = WeaponProperties.properties[property_key]
			local buff_name = property_data.buff_name
			local buff_template = BuffTemplates[buff_name]
			local buff_data = buff_template.buffs[1]
			local has_multiplier = buff_data.variable_multiplier ~= nil
			local property_title_text, advanced_description = UIUtils.get_property_description(property_key, property_value)
			local option_hotspot_name = "button_hotspot_" .. property_count
			local option_text_name = "option_text_" .. property_count
			content[option_hotspot_name].disable_button = false
			content[option_text_name] = property_title_text
		end
	end
end

HeroWindowItemCustomization._update_upgrade_option = function (self)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local item = self:_get_item(self._item_backend_id)
	local item_data = item.data
	local rarity = item.rarity or item_data.rarity
	local upgrade_widget = self._widgets_by_name.item_upgrade
	local scenegraph_id = upgrade_widget.scenegraph_id
	local scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = scenegraph.size
	local new_height = default_size[2]
	local content = upgrade_widget.content
	local style = upgrade_widget.style
	local rarity_name = ""
	local rarity_name_color = Colors.get_color_table_with_alpha("plentiful", 255)
	local upgrade_icons = {}

	if rarity == "plentiful" then
		rarity_name = Localize("forge_screen_common_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("common", 255)
		upgrade_icons[1] = "icon_add_property"
	elseif rarity == "common" then
		rarity_name = Localize("forge_screen_rare_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("rare", 255)
		upgrade_icons[1] = "icon_add_property"
	elseif rarity == "rare" then
		rarity_name = Localize("forge_screen_exotic_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("exotic", 255)
		upgrade_icons[1] = "icon_add_trait"
	elseif rarity == "exotic" then
		upgrade_icons[1] = "icon_upgrade_property"
		upgrade_icons[2] = "icon_upgrade_property"
		rarity_name = Localize("difficulty_veteran")
		rarity_name_color = Colors.get_color_table_with_alpha("unique", 255)
	end

	local upgrade_description_text = Localize("upgrade_description_text_" .. rarity)
	content.sub_title = upgrade_description_text
	content.locked = rarity == "unique"

	if rarity_name_color then
		local color_multiplier = 0.8
		local sub_title_style = style.sub_title
		local active_color = {
			255,
			math.floor(rarity_name_color[1] * color_multiplier),
			math.floor(rarity_name_color[2] * color_multiplier),
			math.floor(rarity_name_color[3] * color_multiplier)
		}
		sub_title_style.text_color = rarity_name_color
		sub_title_style.default_text_color = active_color
		sub_title_style.select_text_color = active_color
	end

	local text_style = style.sub_title
	local text_height = math.floor(UIUtils.get_text_height(ui_renderer, default_size, text_style, upgrade_description_text)) + 50
	new_height = new_height + text_height
	style.title_text.size[2] = new_height
	style.title_text_shadow.size[2] = new_height
	style.input_text.size[2] = new_height
	style.input_text_shadow.size[2] = new_height
	style.input_text_locked.size[2] = new_height
	style.input_text_locked_shadow.size[2] = new_height
	style.sub_title.size[2] = new_height
	style.sub_title_shadow.size[2] = new_height
	local size = ui_scenegraph[scenegraph_id].size
	size[2] = new_height
end

HeroWindowItemCustomization._update_trait_option = function (self)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local item = self:_get_item(self._item_backend_id)
	local traits = item.traits
	local properties_widget = self._widgets_by_name.item_trait
	local scenegraph_id = properties_widget.scenegraph_id
	local scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = scenegraph.size
	local new_height = default_size[2]

	if traits then
		local content = properties_widget.content
		local style = properties_widget.style

		for index, trait_key in ipairs(traits) do
			local trait_data = WeaponTraits.traits[trait_key]
			local trait_name = trait_data.display_name
			local trait_advanced_description = trait_data.advanced_description
			local trait_icon = trait_data.icon
			local title_text = Localize(trait_name)
			local description_text = UIUtils.get_trait_description(trait_key)
			content.icon_texture = trait_icon
			content.input_text = title_text
			content.sub_title = description_text
			content.locked = false
			local text_style = style.sub_title
			local text_height = math.floor(UIUtils.get_text_height(ui_renderer, default_size, text_style, description_text))
			new_height = new_height + text_height

			if new_height ~= content.size[2] then
				-- Nothing
			end

			style.title_text.size[2] = new_height
			style.title_text_shadow.size[2] = new_height
			style.input_text.size[2] = new_height
			style.input_text_shadow.size[2] = new_height
			style.sub_title.size[2] = new_height
			style.sub_title_shadow.size[2] = new_height
		end
	end

	local size = ui_scenegraph[scenegraph_id].size
	local local_position = ui_scenegraph[scenegraph_id].local_position
	size[2] = new_height
	local_position[2] = -new_height
end

HeroWindowItemCustomization._present_item = function (self, item, ignore_spin, custom_spawn_position)
	self._item_dirty = true

	self:_spawn_item_unit(item, ignore_spin, custom_spawn_position)

	local inventory_icon, display_name, description, _ = UIUtils.get_ui_information_from_item(item)
	local item_data = item.data
	local item_type = item_data.item_type
	local slot_type = item_data.slot_type
	local backend_id = item.backend_id
	local item_template = BackendUtils.get_item_template(item_data, backend_id)
	local rarity = item.rarity or item_data.rarity
	local power_level = item.power_level
	local can_upgrade = false

	if rarity == "plentiful" or rarity == "common" or rarity == "rare" or rarity == "exotic" then
		can_upgrade = true
	end

	local rarity_icon_background = UISettings.item_rarity_textures[rarity]
	local widgets_by_name = self._widgets_by_name
	local item_setting_widget = widgets_by_name.item_setting
	local item_setting_content = item_setting_widget.content
	item_setting_content.input_text = Localize(display_name)
	item_setting_content.sub_title = Localize(slot_type)
	item_setting_content.icon_texture = inventory_icon or "icons_placeholder"
	item_setting_content.icon_bg = rarity_icon_background or "icons_placeholder"
	item_setting_content.item = item
	local item_preview_object_set_name = item_data.item_preview_object_set_name or "flow_weapon_lights"
	local item_preview_environment = item_data.item_preview_environment or "weapons_default_01"

	self:_show_object_set(item_preview_object_set_name)
	self:_update_environment(item_preview_environment)
end

HeroWindowItemCustomization._spawn_item_unit = function (self, item, ignore_spin, custom_spawn_position)
	if self._previewer then
		self._previewer:destroy()
	end

	local item_data = item.data
	local item_key = item.key or item_data.key
	local preview_widget = self._preview_widget
	local previewer_pass_data = preview_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world
	local preview_position = custom_spawn_position or {
		0,
		1,
		0
	}
	local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport)
	local spawn_callback = callback(self, "cb_on_item_loaded", item_key, ignore_spin)

	item_previewer:register_spawn_callback(spawn_callback)

	self._previewer = item_previewer
end

HeroWindowItemCustomization.cb_on_item_loaded = function (self, item_key, ignore_spin)
	print("cb_on_item_loaded", item_key)

	local previewer = self._previewer

	previewer:present_item(item_key, ignore_spin)
end

HeroWindowItemCustomization._select_illusion_by_key = function (self, key, ignore_item_spawn, mark_as_equipped)
	if not key then
		return
	end

	local widgets = self._illusion_widgets

	for i, widget in ipairs(widgets) do
		local content = widget.content
		local skin_key = content.skin_key

		if skin_key == key then
			self:_on_illusion_index_pressed(i, ignore_item_spawn, mark_as_equipped)

			break
		end
	end
end

HeroWindowItemCustomization._on_illusion_index_pressed = function (self, index, ignore_item_spawn, mark_as_equipped)
	local illusion_widgets = self._illusion_widgets
	local widget = illusion_widgets[index]
	local content = widget.content
	local skin_key = content.skin_key
	local item_data = ItemMasterList[skin_key]
	self._skin_dirty = false

	if not ignore_item_spawn then
		local locked = content.locked
		local item = {
			data = item_data,
			skin = skin_key
		}

		self:_spawn_item_unit(item, true)
		table.clear(self._material_items)

		if not locked then
			local current_item = self:_get_item(self._item_backend_id)
			local current_item_key = current_item.key
			local default_skin = WeaponSkins.default_skins[current_item_key]
			local item_skin = current_item.skin or default_skin

			if skin_key ~= item_skin then
				local item_interface = Managers.backend:get_interface("items")
				local skin_backend_id, _ = item_interface:get_weapon_skin_from_skin_key(skin_key)
				self._material_items[#self._material_items + 1] = skin_backend_id

				self:_enable_craft_button(true, true)

				self._skin_dirty = true
			else
				self:_enable_craft_button(false)
			end
		else
			self:_enable_craft_button(false)
		end
	end

	local weapon_illusion_base_widgets_by_name = self._weapon_illusion_base_widgets_by_name
	weapon_illusion_base_widgets_by_name.illusions_name.content.text = Localize(item_data.display_name)
	local widgets = self._illusion_widgets

	for i, widget in ipairs(widgets) do
		local is_selected = i == index
		local content = widget.content
		local button_hotspot = content.button_hotspot
		button_hotspot.is_selected = is_selected

		if mark_as_equipped then
			content.equipped = is_selected
		end
	end

	self._selected_skin_index = index

	self:_play_sound("play_gui_equipment_equip")
end

local function sort_illusion_widgets(a, b)
	local skins = WeaponSkins.skins
	local item_rarity_order = UISettings.item_rarity_order
	local a_content = a.content
	local b_content = b.content
	local a_rarity = a_content.rarity
	local b_rarity = b_content.rarity
	local a_order = item_rarity_order[a_rarity] or 0
	local b_order = item_rarity_order[b_rarity] or 0

	return a_order > b_order
end

local EMPTY_TABLE = {}

HeroWindowItemCustomization._setup_illusions = function (self, item)
	local item_key = item.key
	local item_data = item.data
	local num_unlocked_skins = 0
	local skin_combination_table = item_data.skin_combination_table
	local weapon_skin_combinations_tables = WeaponSkins.skin_combinations[skin_combination_table] or EMPTY_TABLE
	local quest_interface = Managers.backend:get_interface("quests")
	local backend_crafting = Managers.backend:get_interface("crafting")
	local unlocked_weapon_skins = backend_crafting:get_unlocked_weapon_skins()
	local default_skin = WeaponSkins.default_skins[item_key]
	local default_skin_key = nil
	local width = 51
	local spacing = -5
	local total_width = -spacing
	local widgets = {}
	local used_skins = {}
	local rarity_settings = RaritySettings
	local widget_definition = create_illusion_button()

	for weapon_skins_rarity, weapon_skins in pairs(weapon_skin_combinations_tables) do
		if weapon_skins_rarity ~= "magic" then
			for _, skin in ipairs(weapon_skins) do
				if not used_skins[skin] then
					if not rarity_settings[weapon_skins_rarity] then
						local weapon_skin_data = WeaponSkins.skins[skin]

						if weapon_skin_data then
							weapon_skins_rarity = weapon_skin_data.rarity or weapon_skins_rarity
						end
					end

					local unlocked = unlocked_weapon_skins[skin] or skin == default_skin
					local event_skin_available = true
					local skin_item = ItemMasterList[skin] or EMPTY_TABLE
					local event_quest_requirement = skin_item.event_quest_requirement

					if not unlocked and event_quest_requirement then
						event_skin_available = quest_interface:get_quest_key(event_quest_requirement)
					end

					if event_skin_available then
						local icon_texture = "button_illusion_" .. weapon_skins_rarity

						if not UIAtlasHelper.has_texture_by_name(icon_texture) then
							icon_texture = "button_illusion_default"
						end

						if unlocked then
							num_unlocked_skins = num_unlocked_skins + 1
						else
							icon_texture = "button_illusion_locked"
						end

						local widget = UIWidget.init(widget_definition)
						widgets[#widgets + 1] = widget
						local content = widget.content
						content.skin_key = skin
						content.icon_texture = icon_texture
						content.locked = not unlocked
						content.rarity = weapon_skins_rarity
						total_width = total_width + spacing + width
						used_skins[skin] = true
					end
				end
			end
		end
	end

	if default_skin and not used_skins[default_skin] then
		local unlocked = true
		local weapon_skins_rarity = "plentiful"
		local icon_texture = "button_illusion_" .. weapon_skins_rarity

		if not UIAtlasHelper.has_texture_by_name(icon_texture) then
			icon_texture = "button_illusion_default"
		end

		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		local content = widget.content
		content.skin_key = default_skin
		content.icon_texture = icon_texture
		content.locked = not unlocked
		content.rarity = weapon_skins_rarity
		total_width = total_width + spacing + width
		num_unlocked_skins = num_unlocked_skins + 1
	end

	table.sort(widgets, sort_illusion_widgets)

	local x_offset = width / 2

	for _, widget in ipairs(widgets) do
		local offset = widget.offset
		offset[1] = -total_width / 2 + x_offset
		x_offset = x_offset + width + spacing
	end

	self._illusion_widgets = widgets
	local item_skin = item.skin or default_skin
	local ignore_item_spawn = true
	local mark_as_equipped = true

	self:_select_illusion_by_key(item_skin, ignore_item_spawn, mark_as_equipped)

	local weapon_illusion_base_widgets_by_name = self._weapon_illusion_base_widgets_by_name
	weapon_illusion_base_widgets_by_name.illusions_counter.content.text = "(" .. tostring(num_unlocked_skins) .. "/" .. tostring(#widgets) .. ")"
end

HeroWindowItemCustomization._state_setup_overview = function (self)
	local info_widgets = {}
	local info_widgets_by_name = {}

	for name, widget_definition in pairs(info_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		info_widgets[#info_widgets + 1] = widget
		info_widgets_by_name[name] = widget
	end

	self._info_widgets = info_widgets
	self._info_widgets_by_name = info_widgets_by_name
	local weapon_illusion_base_widgets = {}
	local weapon_illusion_base_widgets_by_name = {}

	for name, widget_definition in pairs(weapon_illusion_base_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)
		weapon_illusion_base_widgets[#weapon_illusion_base_widgets + 1] = widget
		weapon_illusion_base_widgets_by_name[name] = widget
	end

	self._weapon_illusion_base_widgets = weapon_illusion_base_widgets
	self._weapon_illusion_base_widgets_by_name = weapon_illusion_base_widgets_by_name
	local item = self:_get_item(self._item_backend_id)
	local inventory_icon, display_name, description, _ = UIUtils.get_ui_information_from_item(item)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local backend_id = item.backend_id
	local item_template = BackendUtils.get_item_template(item_data, backend_id)
	local rarity = item.rarity or item_data.rarity
	local power_level = item.power_level
	local feature_widgets = {}
	local widget_power = self:_create_item_feature_widget(Localize("tooltips_power"), power_level)
	feature_widgets[#feature_widgets + 1] = widget_power
	local is_weapon = slot_type == "melee" or slot_type == "ranged"

	if is_weapon then
		local keywords = item_template.tooltip_keywords

		if keywords then
			local keyword_text = ""
			local key_word_count = #keywords

			for index, keyword in ipairs(keywords) do
				keyword_text = keyword_text .. Localize(keyword)
				key_word_count = key_word_count - 1

				if key_word_count > 0 then
					keyword_text = keyword_text .. ", "
				end
			end

			local text_style = {
				word_wrap = true,
				font_size = 28,
				localize = false,
				use_shadow = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				}
			}
			local widget_keywords, description_size = self:_create_description_widget("info_keyword_text", keyword_text, text_style)
			info_widgets[#info_widgets + 1] = widget_keywords
		end
	else
		self._ui_scenegraph.info_keyword_text.size[2] = 0
	end

	self._info_widgets_by_name.keyword_divider_top.content.visible = is_weapon

	if slot_type == "melee" then
		local block_angle = item_template.block_angle
		local widget_block_angle = self:_create_item_feature_widget(Localize("tutorial_tooltip_block"), block_angle)
		feature_widgets[#feature_widgets + 1] = widget_block_angle
		local max_fatigue_points = item_template.max_fatigue_points
		local widget_stamina = self:_create_item_feature_widget(Localize("tooltips_stamina"), max_fatigue_points)
		feature_widgets[#feature_widgets + 1] = widget_stamina
	elseif slot_type == "ranged" then
		local ammo_text, ammo_texture = nil
		local ammo_data = item_template.ammo_data

		if ammo_data and not ammo_data.hide_ammo_ui then
			local single_clip = ammo_data.single_clip
			local reload_time = ammo_data.reload_time
			local max_ammo = ammo_data.max_ammo
			local ammo_per_clip = ammo_data.ammo_per_clip
			ammo_text = tostring(max_ammo)
		else
			ammo_texture = "icon_fire"
		end

		local widget_ammunition = self:_create_item_feature_widget(Localize("tooltips_ammunition"), ammo_text, ammo_texture)
		feature_widgets[#feature_widgets + 1] = widget_ammunition
		local crosshairs = UISettings.crosshair_styles.ranged
		local crosshair_style = item_template.crosshair_style
		local crosshair_data = crosshairs[crosshair_style] or UISettings.crosshair_types.default
		local widget_crosshair = self:_create_item_feature_widget("Crosshair", nil, crosshair_data.crosshair_icon)
		feature_widgets[#feature_widgets + 1] = widget_crosshair
	end

	local num_feature_widgets = #feature_widgets

	for i = 1, num_feature_widgets do
		local widget = feature_widgets[i]
		widget.offset[1] = widget.content.size[1] * (i - 1)
		info_widgets[#info_widgets + 1] = widget
	end

	if is_weapon then
		local widget_diagram = self:_create_weapon_diagram_widget(item_template)
		info_widgets[#info_widgets + 1] = widget_diagram
		info_widgets_by_name.weapon_diagram = widget_diagram
	end

	local widget_description, description_size = self:_create_description_widget("info_description_text", Localize(description))
	info_widgets[#info_widgets + 1] = widget_description
	self._ui_scenegraph.info_description_text.local_position[2] = -(description_size[2] + 10)
	self._ui_scenegraph.keyword_divider_bottom.local_position[2] = is_weapon and -10 or 350

	self:_destroy_scrollbar()
	self:_setup_illusions(item)

	self._current_recipe_name = "apply_weapon_skin"

	self:_update_state_craft_button(self._current_recipe_name, Localize("input_description_apply"), nil, nil, {
		0,
		-40,
		0
	})
	self:_enable_craft_button(false)
	self._menu_input_description:change_generic_actions(generic_input_actions.default)
end

HeroWindowItemCustomization._state_setup_property_reroll = function (self)
	local property_reroll_widgets = {}
	local property_reroll_widgets_by_name = {}

	for name, widget_definition in pairs(property_reroll_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		property_reroll_widgets[#property_reroll_widgets + 1] = widget
		property_reroll_widgets_by_name[name] = widget
	end

	self._property_reroll_widgets = property_reroll_widgets
	self._property_reroll_widgets_by_name = property_reroll_widgets_by_name
	local item = self:_get_item(self._item_backend_id)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local rarity = item.rarity or item_data.rarity
	local property_table_name = item_data.property_table_name

	if not property_table_name then
		return
	end

	local widgets = {}
	local edge_spacing = 45
	local spacing = 30
	local y_offset = edge_spacing
	local property_tables = WeaponProperties.combinations[property_table_name]
	local property_combinations = property_tables[rarity] or property_tables.common

	for property_key, property_data in pairs(WeaponProperties.properties) do
		local approved = false

		for _, property_combo in ipairs(property_combinations) do
			if table.contains(property_combo, property_key) then
				approved = true

				break
			end
		end

		if approved then
			local buff_name = property_data.buff_name
			local buff_template = BuffTemplates[buff_name]
			local buff_data = buff_template.buffs[1]
			local has_multiplier = buff_data.variable_multiplier ~= nil
			local property_name = property_data.display_name
			local value = 1
			local property_title_text, advanced_description = UIUtils.get_property_description(property_key, value)
			property_title_text = string.gsub(property_title_text, "%d", "")
			property_title_text = string.gsub(property_title_text, "%p", "")
			local text = property_title_text
			local widget = self:_create_property_option_entry(property_title_text, advanced_description)
			widgets[#widgets + 1] = widget
			widget.offset[2] = -y_offset
			y_offset = y_offset + spacing
		end
	end

	y_offset = y_offset - edge_spacing
	self._property_reroll_option_widgets = widgets
	local widget_description, description_size = self:_create_description_widget("info_description_text_2", Localize("description_crafting_recipe_weapon_reroll_properties"))
	property_reroll_widgets[#property_reroll_widgets + 1] = widget_description
	local description_text_height = description_size[2] + 10
	self._ui_scenegraph.info_description_text_2.local_position[2] = -description_text_height
	local step_size = spacing * 2

	self:_initialize_scrollbar(y_offset, step_size)

	local state_data = self._states[self._state]
	local recipe_by_slot_type = state_data.recipe_by_slot_type
	local recipe_name = recipe_by_slot_type[slot_type]
	self._current_recipe_name = recipe_name

	self:_update_state_craft_button(recipe_name, Localize("crafting_recipe_weapon_reroll_properties"), Colors.get_color_table_with_alpha("corn_flower_blue", 255))
	self._menu_input_description:change_generic_actions(generic_input_actions[self._state])
end

HeroWindowItemCustomization._enable_craft_button = function (self, enable, disable_edges)
	if script_data["eac-untrusted"] then
		enable = false
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.button_top_edge_left.content.visible = not disable_edges and enable or false
	widgets_by_name.button_top_edge_right.content.visible = not disable_edges and enable or false
	widgets_by_name.button_top_edge_glow.content.visible = not disable_edges and enable or false
	local widget_craft_button = widgets_by_name.craft_button
	widget_craft_button.content.visible = enable
	widget_craft_button.content.button_hotspot.disable_button = not enable
	local widget_experience_bar = widgets_by_name.experience_bar
	widget_experience_bar.content.visible = enable
	local widget_experience_bar_edge = widgets_by_name.experience_bar_edge
	widget_experience_bar_edge.content.visible = enable

	if not enable then
		self._menu_input_description:change_generic_actions(generic_input_actions.default)
	else
		self._menu_input_description:change_generic_actions(generic_input_actions[self._state])
	end
end

HeroWindowItemCustomization._update_state_craft_button = function (self, recipe_name, button_text, glow_color, force_disable, offset)
	local has_all_requirements, total_width = self:_create_material_requirement_widgets(recipe_name)
	total_width = math.max(total_width + 30, 100)
	local widgets_by_name = self._widgets_by_name
	local widget_button_edge_left = widgets_by_name.button_top_edge_left
	local widget_button_edge_right = widgets_by_name.button_top_edge_right
	local widget_button_top_edge_glow = widgets_by_name.button_top_edge_glow
	widget_button_edge_left.offset[1] = -total_width / 2
	widget_button_edge_right.offset[1] = total_width / 2
	self._ui_scenegraph.button_top_edge_glow.size[1] = total_width

	if glow_color then
		widget_button_top_edge_glow.style.texture_id.color = glow_color
	end

	local widget_craft_button = widgets_by_name.craft_button
	widget_craft_button.content.button_hotspot.disable_button = force_disable or not has_all_requirements or script_data["eac-untrusted"]
	widget_craft_button.content.title_text = button_text
	self._has_all_crafting_requirements = has_all_requirements
	local visible = true
	widget_button_edge_left.content.visible = visible
	widget_button_edge_right.content.visible = visible
	widget_button_top_edge_glow.content.visible = visible
	widget_craft_button.content.visible = visible
	self._ui_scenegraph.craft_button.local_position = offset or {
		0,
		0,
		0
	}
end

local FALLBACK_WEAPON_DIAGRAM = {
	0,
	0,
	0,
	0,
	0
}

HeroWindowItemCustomization._create_weapon_diagram_widget = function (self, item_template)
	local starting_offset = 0.25
	local num_steps = 8
	local step_size = (1 - starting_offset) / num_steps
	local epsilon = 0.0125
	local nodes = {}
	local weapon_diagram_data = item_template.weapon_diagram
	local light_attack = weapon_diagram_data and weapon_diagram_data.light_attack

	if not light_attack then
		Application.error(string.format("[HeroWindowItemCustomization] Missing light attack weapon diagram data for %q - Defaulting to zeros", item_template.name))

		light_attack = FALLBACK_WEAPON_DIAGRAM
	end

	local armor_piercing = math.clamp(math.floor(light_attack[DamageTypes.ARMOR_PIERCING] + 0.5), 0, num_steps - 1)
	local cleave = math.clamp(math.floor(light_attack[DamageTypes.CLEAVE] + 0.5), 0, num_steps - 1)
	local speed = math.clamp(math.floor(light_attack[DamageTypes.SPEED] + 0.5), 0, num_steps - 1)
	local stagger = math.clamp(math.floor(light_attack[DamageTypes.STAGGER] + 0.5), 0, num_steps - 1)
	local damage = math.clamp(math.floor(light_attack[DamageTypes.DAMAGE] + 0.5), 0, num_steps - 1)
	nodes[#nodes + 1] = starting_offset + step_size * armor_piercing + armor_piercing * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * cleave + cleave * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * speed + speed * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * stagger + stagger * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * damage + damage * epsilon
	local heavy_attack = weapon_diagram_data and weapon_diagram_data.heavy_attack

	if not heavy_attack then
		Application.error(string.format("[HeroWindowItemCustomization] Missing heavy attack weapon diagram data for %q - Defaulting to zeros", item_template.name))

		heavy_attack = FALLBACK_WEAPON_DIAGRAM
	end

	local armor_piercing = math.clamp(math.floor(heavy_attack[DamageTypes.ARMOR_PIERCING] + 0.5), 0, num_steps - 1)
	local cleave = math.clamp(math.floor(heavy_attack[DamageTypes.CLEAVE] + 0.5), 0, num_steps - 1)
	local speed = math.clamp(math.floor(heavy_attack[DamageTypes.SPEED] + 0.5), 0, num_steps - 1)
	local stagger = math.clamp(math.floor(heavy_attack[DamageTypes.STAGGER] + 0.5), 0, num_steps - 1)
	local damage = math.clamp(math.floor(heavy_attack[DamageTypes.DAMAGE] + 0.5), 0, num_steps - 1)
	nodes[#nodes + 1] = starting_offset + step_size * armor_piercing + armor_piercing * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * cleave + cleave * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * speed + speed * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * stagger + stagger * epsilon
	nodes[#nodes + 1] = starting_offset + step_size * damage + damage * epsilon
	local masked = false
	local scenegraph_id = "weapon_stats_diagram"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = UIWidgets.create_weapon_diagram_widget("weapon_stats_diagram", size, nodes, masked, starting_offset)
	local widget = UIWidget.init(widget_definition)

	return widget, size
end

HeroWindowItemCustomization._create_item_feature_widget = function (self, title_text, value_text, value_texture)
	local masked = false
	local scenegraph_id = "item_feature"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = UIWidgets.create_item_feature(scenegraph_id, size, title_text, value_text, value_texture, masked)
	local widget = UIWidget.init(widget_definition)

	return widget, size
end

HeroWindowItemCustomization._create_description_widget = function (self, scenegraph_id, text, text_style)
	local masked = false
	text_style = text_style or {
		word_wrap = true,
		font_size = 20,
		localize = false,
		use_shadow = true,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		font_type = masked and "hell_shark_masked" or "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			0,
			2
		}
	}
	local widget_definition = UIWidgets.create_simple_text(text, scenegraph_id, nil, nil, text_style)
	local widget = UIWidget.init(widget_definition)
	local ui_renderer = self._ui_top_renderer
	local default_size = scenegraph_definition[scenegraph_id].size
	local text_height = math.floor(UIUtils.get_text_height(ui_renderer, default_size, text_style, text))
	local size = self._ui_scenegraph[scenegraph_id].size
	size[2] = text_height

	return widget, size
end

HeroWindowItemCustomization._create_property_option_entry = function (self, text, value_range_text)
	local scenegraph_id = "property_options"
	local display_text = text .. value_range_text
	local definition = create_property_option(scenegraph_id, display_text)
	local widget = UIWidget.init(definition)
	local style = widget.style
	local text_style = style.text
	local color_override_table = text_style.color_override_table
	local value_text_length = value_range_text and UTF8Utils.string_length(value_range_text) or 0
	local default_text_length = UTF8Utils.string_length(text) or 0
	color_override_table.start_index = default_text_length + 1
	color_override_table.end_index = default_text_length + value_text_length
	text_style.color_override[1] = color_override_table

	return widget
end

HeroWindowItemCustomization._set_scroll_area_height = function (self, widget, height)
	self._ui_scenegraph.scroll_area.size[2] = height
	widget.style.mask.size[2] = height
end

HeroWindowItemCustomization._destroy_scrollbar = function (self)
	if self._scrollbar_logic then
		self._scrollbar_logic = nil
	end

	local widgets_by_name = self._widgets_by_name
	local scrollbar_widget = widgets_by_name.scrollbar
	scrollbar_widget.content.visible = false
end

HeroWindowItemCustomization._initialize_scrollbar = function (self, content_length, step_size)
	local widgets_by_name = self._widgets_by_name
	local ui_scenegraph = self._ui_scenegraph

	UISceneGraph.update_scenegraph(ui_scenegraph)

	local info_window_world_y = ui_scenegraph.info_window.world_position[2]
	local scroll_area_world_y = ui_scenegraph.property_options_title.world_position[2]
	local draw_length = scroll_area_world_y - info_window_world_y
	local draw = content_length > draw_length
	ui_scenegraph.scrollbar.size[2] = draw_length
	local scrollbar_widget = widgets_by_name.scrollbar
	scrollbar_widget.content.visible = draw
	local scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	self._scrollbar_logic = scrollbar_logic
	local scroll_step_multiplier = 1
	local scrollbar_length = draw_length

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	local scroll_area_widget = widgets_by_name.scroll_area

	self:_set_scroll_area_height(scroll_area_widget, draw_length)

	self._scrolled_length = nil

	return draw
end

HeroWindowItemCustomization._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic

	if not scrollbar_logic then
		return
	end

	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.scroll_root.local_position[2] = length
		self._scrolled_length = length
	end
end

HeroWindowItemCustomization._create_material_requirement_widgets = function (self, recipe_name)
	local recipe = crafting_recipes_by_name[recipe_name]
	local ingredients = recipe.ingredients
	local widget_definition = UIWidgets.create_craft_material_widget("material_root")
	local item_interface = Managers.backend:get_interface("items")
	local crafting_material_items = item_interface:get_filtered_items("item_type == crafting_material")
	local material_textures = UISettings.crafting_material_icons_small
	local widgets = {}
	local has_all_requirements = true

	if not self._material_items then
		self._material_items = {}
	end

	local material_items = self._material_items

	table.clear(material_items)

	for index, data in ipairs(ingredients) do
		if not data.catergory then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			local item_key = data.name
			local required_amount = data.amount
			local texture = material_textures[item_key]
			local amount_owned = 0
			local required_backend_id = nil

			for _, item in ipairs(crafting_material_items) do
				local backend_id = item.backend_id
				local item_data = item.data

				if item_data.key == item_key then
					required_backend_id = backend_id
					amount_owned = item_interface:get_item_amount(backend_id)

					break
				end
			end

			local has_required_amount = required_amount <= amount_owned
			local presentation_amount = (amount_owned < UISettings.max_craft_material_presentation_amount and tostring(amount_owned) or "*") .. "/" .. tostring(required_amount)
			local content = widget.content
			content.text = presentation_amount
			content.icon = texture
			content.warning = not has_required_amount
			content.item = {
				data = table.clone(ItemMasterList[item_key])
			}

			if has_required_amount then
				material_items[#material_items + 1] = required_backend_id
			else
				has_all_requirements = false
			end
		end
	end

	local num_materials = #material_items
	local spacing = 80
	local total_widgets_width = num_materials * spacing
	local offset_x = -(total_widgets_width / 2) + spacing / 2

	for i = 1, num_materials do
		local widget = widgets[i]
		local offset = widget.offset
		offset[1] = offset_x
		offset_x = offset_x + spacing
	end

	self._material_widgets = widgets

	return has_all_requirements, total_widgets_width
end

HeroWindowItemCustomization._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowItemCustomization._state_setup_trait_reroll = function (self)
	local trait_reroll_widgets = {}
	local trait_reroll_widgets_by_name = {}

	for name, widget_definition in pairs(trait_reroll_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		trait_reroll_widgets[#trait_reroll_widgets + 1] = widget
		trait_reroll_widgets_by_name[name] = widget
	end

	self._trait_reroll_widgets = trait_reroll_widgets
	self._trait_reroll_widgets_by_name = trait_reroll_widgets_by_name
	local item = self:_get_item(self._item_backend_id)
	local item_data = item.data
	local slot_type = item_data.slot_type
	local rarity = item.rarity or item_data.rarity
	local trait_table_name = item_data.trait_table_name

	if not trait_table_name then
		self:_enable_craft_button(false)

		return
	end

	self:_enable_craft_button(rarity)

	local widgets = {}
	local edge_spacing = 45
	local spacing = 30
	local y_offset = edge_spacing
	local trait_combinations = WeaponTraits.combinations[trait_table_name]

	for trait_key, trait_data in pairs(WeaponTraits.traits) do
		local approved = false

		for _, trait_combo in ipairs(trait_combinations) do
			if table.contains(trait_combo, trait_key) and not trait_data.crafting_disabled then
				approved = true

				break
			end
		end

		if approved then
			local trait_name = trait_data.display_name
			local trait_advanced_description = trait_data.advanced_description
			local trait_icon = trait_data.icon
			local title_text = Localize(trait_name)
			local description_text = UIUtils.get_trait_description(trait_key)
			local widget, additional_height = self:_create_trait_option_entry(title_text, description_text, trait_icon)
			widgets[#widgets + 1] = widget
			widget.offset[2] = -y_offset
			y_offset = y_offset + spacing + additional_height
		end
	end

	y_offset = y_offset - edge_spacing
	self._trait_reroll_option_widgets = widgets
	local widget_description, description_size = self:_create_description_widget("info_description_text_2", Localize("description_crafting_recipe_weapon_reroll_traits"))
	trait_reroll_widgets[#trait_reroll_widgets + 1] = widget_description
	local description_text_height = description_size[2] + 10
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.info_description_text_2.local_position[2] = -description_text_height
	local step_size = spacing * 2

	self:_initialize_scrollbar(y_offset, step_size)

	local state_data = self._states[self._state]
	local recipe_by_slot_type = state_data.recipe_by_slot_type
	local recipe_name = recipe_by_slot_type[slot_type]
	self._current_recipe_name = recipe_name

	self:_update_state_craft_button(recipe_name, Localize("crafting_recipe_weapon_reroll_traits"), Colors.get_color_table_with_alpha("font_title", 255))
	self._menu_input_description:change_generic_actions(generic_input_actions[self._state])
end

HeroWindowItemCustomization._create_trait_option_entry = function (self, title_text, description_text, icon)
	local ui_top_renderer = self._ui_top_renderer
	local scenegraph_id = "trait_options"
	local definition = create_trait_option(scenegraph_id, title_text, description_text, icon)
	local widget = UIWidget.init(definition)
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local description_text_style = style.description_text
	local description_text_size = description_text_style.size
	local text_height = math.floor(UIUtils.get_text_height(ui_top_renderer, description_text_size, description_text_style, description_text))
	local additional_height = math.floor(text_height)

	return widget, additional_height
end

HeroWindowItemCustomization._state_draw_trait_reroll = function (self, ui_renderer, dt)
	local trait_reroll_widgets = self._trait_reroll_widgets

	if trait_reroll_widgets then
		for _, widget in ipairs(trait_reroll_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		local trait_reroll_option_widgets = self._trait_reroll_option_widgets

		if trait_reroll_option_widgets then
			for _, widget in ipairs(trait_reroll_option_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end

		local material_widgets = self._material_widgets

		if material_widgets then
			for _, widget in ipairs(material_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end
end

HeroWindowItemCustomization._state_setup_upgrade = function (self)
	self:_destroy_scrollbar()

	local upgrade_widgets = {}
	local upgrade_widgets_by_name = {}

	for name, widget_definition in pairs(upgrade_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		upgrade_widgets[#upgrade_widgets + 1] = widget
		upgrade_widgets_by_name[name] = widget
	end

	self._upgrade_widgets = upgrade_widgets
	self._upgrade_widgets_by_name = upgrade_widgets_by_name
	local item = self:_get_item(self._item_backend_id)
	local item_data = item.data
	local rarity = item.rarity or item_data.rarity
	local rarity_name = ""
	local rarity_name_color = Colors.get_color_table_with_alpha("plentiful", 255)
	local upgrade_icons = {}

	if rarity == "plentiful" then
		rarity_name = Localize("forge_screen_common_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("common", 255)
		upgrade_icons[1] = "icon_add_property"
	elseif rarity == "common" then
		rarity_name = Localize("forge_screen_rare_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("rare", 255)
		upgrade_icons[1] = "icon_add_property"
	elseif rarity == "rare" then
		rarity_name = Localize("forge_screen_exotic_token_tooltip")
		rarity_name_color = Colors.get_color_table_with_alpha("exotic", 255)
		upgrade_icons[1] = "icon_add_trait"
	elseif rarity == "exotic" then
		upgrade_icons[1] = "icon_upgrade_property"
		upgrade_icons[2] = "icon_upgrade_property"
		rarity_name = Localize("difficulty_veteran")
		rarity_name_color = Colors.get_color_table_with_alpha("unique", 255)
	else
		return
	end

	local upgrade_description_text = Localize("upgrade_description_text_" .. rarity)
	local rarity_title_widget = upgrade_widgets_by_name.upgrade_rarity_name
	rarity_title_widget.content.text = rarity_name
	rarity_title_widget.style.text.text_color = rarity_name_color
	local upgrade_icons_widget = upgrade_widgets_by_name.upgrade_icons
	upgrade_icons_widget.content.texture_id = upgrade_icons
	local upgrade_description_widget = upgrade_widgets_by_name.upgrade_description_text
	upgrade_description_widget.content.text = upgrade_description_text
	local upgrade_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(upgrade_icons[1])
	local upgrade_icon_size = upgrade_icon_settings.size
	upgrade_icons_widget.style.texture_id.texture_size[1] = upgrade_icon_size[1]
	upgrade_icons_widget.style.texture_id.texture_size[2] = upgrade_icon_size[2]
	upgrade_icons_widget.style.texture_id.texture_amount = #upgrade_icons
	local widget_description, description_size = self:_create_description_widget("info_description_text_2", Localize("description_crafting_upgrade_item_rarity_common"))
	upgrade_widgets[#upgrade_widgets + 1] = widget_description
	local description_text_height = description_size[2] + 10
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.info_description_text_2.local_position[2] = -description_text_height
	local state_data = self._states[self._state]
	local recipe_by_rarity = state_data.recipe_by_rarity
	local recipe_name = recipe_by_rarity[rarity]
	self._current_recipe_name = recipe_name

	self:_update_state_craft_button(recipe_name, Localize("hero_view_crafting_upgrade"), rarity_name_color)
	self._menu_input_description:change_generic_actions(generic_input_actions[self._state])
end

HeroWindowItemCustomization._state_draw_upgrade = function (self, ui_renderer, dt)
	local upgrade_widgets = self._upgrade_widgets

	if upgrade_widgets then
		for _, widget in ipairs(upgrade_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		local material_widgets = self._material_widgets

		if material_widgets then
			for _, widget in ipairs(material_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end
end

HeroWindowItemCustomization._craft = function (self, ingredients, recipe_override)
	local item = self:_get_item(self._item_backend_id)
	local backend_id = item.backend_id
	local items = table.clone(ingredients)
	items[#items + 1] = backend_id
	local craft_id = Managers.state.crafting:craft(items, recipe_override)

	if craft_id then
		self._waiting_for_craft = true

		self._parent:block_input()

		self._current_crafting_data = {
			craft_id = craft_id,
			state_name = self._state
		}
		local widget = self._widgets_by_name.loading_icon

		self:_start_transition_animation("on_crafting_enter")

		self._ui_animations.on_crafting_enter = UIAnimation.init(UIAnimation.function_by_time, widget.style.texture_id.color, 1, 0, 255, 0.3, math.easeOutCubic)
		widget.content.active = true

		return true
	end

	return false
end

HeroWindowItemCustomization._update_craft_response = function (self)
	local craft_id = self._current_crafting_data and self._current_crafting_data.craft_id

	if not craft_id then
		return
	end

	local crafting_interface = Managers.backend:get_interface("crafting")
	local craft_complete = crafting_interface:is_craft_complete(craft_id)

	if craft_complete then
		local craft_result = crafting_interface:get_craft_result(craft_id)

		self:_craft_completed(craft_result)

		self._current_crafting_data = nil
		self._character_dirty = true
	end
end

HeroWindowItemCustomization._craft_completed = function (self, result)
	self._waiting_for_craft = false

	self._parent:unblock_input()

	local state = self._state
	local state_data = self._states[state]
	local craft_complete_func_name = state_data.craft_complete_func_name

	if craft_complete_func_name then
		self[craft_complete_func_name](self, result)
	end

	local widget = self._widgets_by_name.loading_icon

	self:_start_transition_animation("on_crafting_exit")

	self._ui_animations.on_crafting_exit = UIAnimation.init(UIAnimation.function_by_time, widget.style.texture_id.color, 1, 255, 0, 0.3, math.easeOutCubic)

	self._animation_callbacks.on_crafting_exit = function ()
		widget.content.active = false
	end

	self._item_dirty = true

	self:_play_sound("play_gui_craft_forge_end_console_qol")

	self._playing_craft_sound = false
end

HeroWindowItemCustomization._apply_weapon_skin_craft_complete = function (self, result)
	local item = self:_get_item(self._item_backend_id)
	local item_key = item.key
	local item_skin = item.skin or WeaponSkins.default_skins[item_key]
	local item_data = item.data
	local slot_type = item_data.slot_type
	local slot_name = self._equipment_slot_name or InventorySettings.slot_names_by_type[slot_type][1]

	self._parent:_set_loadout_item(item, slot_name)
	self:_present_item(item, true)

	local ignore_item_spawn = true
	local mark_as_equipped = true

	self:_select_illusion_by_key(item_skin, ignore_item_spawn, mark_as_equipped)
	self._menu_input_description:change_generic_actions(generic_input_actions.default)
	self:_enable_craft_button(false)
end

HeroWindowItemCustomization._update_skin_gamepad_input = function (self, input_service, dt, t)
	local skin_index = self._selected_skin_index or 1
	local current_skin_index = self._selected_skin_index
	local illusion_widgets = self._illusion_widgets

	if #illusion_widgets == 0 then
		return
	end

	local num_illusions = #illusion_widgets
	local input_handled = false

	if input_service:get("move_left") then
		skin_index = math.clamp(skin_index - 1, 1, num_illusions)
	elseif input_service:get("move_right") then
		skin_index = math.clamp(skin_index + 1, 1, num_illusions)
	end

	if skin_index ~= current_skin_index then
		local ignore_item_spawn = false
		local mark_as_equipped = false

		self:_on_illusion_index_pressed(skin_index, ignore_item_spawn, mark_as_equipped)

		input_handled = true
	end

	return input_handled
end

HeroWindowItemCustomization._upgrade_item_craft_complete = function (self, result)
	local old_item_backend_id = self._item_backend_id
	local backend_dlcs = Managers.backend:get_interface("dlcs")
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = result[1][1]
	local item = self:_get_item(backend_id)

	self:_present_item(item, nil, {
		0,
		2,
		0
	})

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local careers = profile_settings.careers

		for _, career in pairs(careers) do
			local career_name = career.name

			if career and not backend_dlcs:is_unreleased_career(career_name) then
				for _, slot_data in pairs(InventorySettings.equipment_slots) do
					local equipment_slot_name = slot_data.name
					local equipped_item_backend_id = backend_items:get_loadout_item_id(career_name, equipment_slot_name)

					if equipped_item_backend_id == old_item_backend_id then
						backend_items:set_loadout_item(backend_id, career_name, equipment_slot_name)
					end
				end
			end
		end
	end

	self._parent:_set_loadout_item(item, self._equipment_slot_name)
	self:_state_setup_upgrade()
	self:_setup_availble_states(item)
end
