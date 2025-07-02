-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_cosmetics_loadout_pose_inventory_console.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_cosmetics_loadout_pose_inventory_console_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local create_illusion_button = definitions.create_illusion_button
local weapon_illusion_base_widgets_definitions = definitions.weapon_illusion_base_widgets
local DO_RELOAD = false
local INPUT_ACTION_NEXT = "trigger_cycle_next"
local INPUT_ACTION_PREVIOUS = "trigger_cycle_previous"

local function item_sort_func(item_1, item_2)
	local item_data_1 = item_1.data
	local item_data_2 = item_2.data
	local item_key_1 = item_data_1.key
	local item_key_2 = item_data_2.key
	local item_1_power_level = item_1.power_level or 0
	local item_2_power_level = item_2.power_level or 0
	local item_1_backend_id = item_1.backend_id
	local item_2_backend_id = item_2.backend_id
	local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id, item_1)
	local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id, item_2)

	if item_1_favorited == item_2_favorited then
		if item_1_power_level == item_2_power_level then
			local item_1_rarity = item_1.rarity or item_data_1.rarity
			local item_2_rarity = item_2.rarity or item_data_2.rarity
			local item_rarity_order = UISettings.item_rarity_order
			local item_1_rarity_order = item_rarity_order[item_1_rarity]
			local item_2_rarity_order = item_rarity_order[item_2_rarity]

			if item_1_rarity_order == item_2_rarity_order then
				local item_type_1 = Localize(item_data_1.item_type)
				local item_type_2 = Localize(item_data_2.item_type)

				if item_type_1 == item_type_2 then
					local _, item_1_display_name = UIUtils.get_ui_information_from_item(item_1)
					local _, item_2_display_name = UIUtils.get_ui_information_from_item(item_2)
					local item_name_1 = Localize(item_1_display_name)
					local item_name_2 = Localize(item_2_display_name)

					return item_name_1 < item_name_2
				else
					return item_type_1 < item_type_2
				end
			else
				return item_1_rarity_order < item_2_rarity_order
			end
		else
			return item_2_power_level < item_1_power_level
		end
	elseif item_1_favorited then
		return true
	else
		return false
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole = class(HeroWindowCosmeticsLoadoutPoseInventoryConsole)
HeroWindowCosmeticsLoadoutPoseInventoryConsole.NAME = "HeroWindowCosmeticsLoadoutPoseInventoryConsole"

HeroWindowCosmeticsLoadoutPoseInventoryConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCosmeticsLoadoutPoseInventoryConsole")

	self._params = params
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._world_previewer = params.world_previewer

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self._player_manager = player_manager
	self._peer_id = ingame_ui_context.peer_id
	self._hero_name = params.hero_name
	self._career_index = params.career_index
	self._profile_index = params.profile_index

	local profile = SPProfiles[self._profile_index]
	local career_data = profile.careers[self._career_index]

	self._career_name = career_data.name
	self._current_input_description = "default"
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_input_buttons()

	local params = {
		profile_index = params.profile_index,
		career_index = params.career_index,
	}
	local item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self._hero_name, self._career_index, params)

	self._item_grid = item_grid

	item_grid:mark_locked_items(true)
	item_grid:disable_locked_items(true)
	item_grid:disable_unwieldable_items(true)
	item_grid:mark_equipped_weapon_pose_parent(true)
	item_grid:disable_item_drag()
	item_grid:apply_item_sorting_function(item_sort_func)
	self:_set_item_compare_enable_state(false)
	self:_show_equipped_weapon_pose()

	local player_unit = local_player and local_player.player_unit

	if player_unit then
		local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

		if inventory_extension then
			inventory_extension:check_and_drop_pickups("enter_inventory")
		end
	end

	self:_start_transition_animation("on_enter")
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._show_equipped_weapon_pose = function (self)
	local backend_items = Managers.backend:get_interface("items")
	local current_weapon_pose_id = backend_items:get_loadout_item_id(self._career_name, "slot_pose")

	if not current_weapon_pose_id then
		return
	end

	local current_weapon_pose_item = backend_items:get_item_from_id(current_weapon_pose_id)
	local current_weapon_pose_item_data = current_weapon_pose_item.data
	local current_weapon_pose_parent = current_weapon_pose_item_data.parent
	local current_weapon_pose_parent_item = rawget(ItemMasterList, current_weapon_pose_parent)

	if current_weapon_pose_parent_item then
		current_weapon_pose_parent_item = table.clone(current_weapon_pose_parent_item)

		local current_weapon_pose_skin = backend_items:get_equipped_weapon_pose_skin(current_weapon_pose_parent)
		local skin

		if current_weapon_pose_skin then
			skin = current_weapon_pose_skin
		end

		self._parent:set_temporary_loadout_item({
			data = current_weapon_pose_parent_item,
			skin = skin,
		})
		self._parent:set_character_pose_animation(current_weapon_pose_item_data.data.anim_event)
	end
end

local EMPTY_TABLE = {}

HeroWindowCosmeticsLoadoutPoseInventoryConsole._start_transition_animation = function (self, animation_name, widgets)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self._render_settings,
	}
	local widgets = widgets or EMPTY_TABLE
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._illusion_widgets = {}
	self._illusion_base_widgets = {}

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.controller_description

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 7, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.item_tooltip.content.profile_index = self._params.profile_index
	widgets_by_name.item_tooltip.content.career_index = self._params.career_index
	widgets_by_name.item_tooltip_compare.content.profile_index = self._params.profile_index
	widgets_by_name.item_tooltip_compare.content.career_index = self._params.career_index
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._input_service = function (self)
	local parent = self._parent

	if parent:is_friends_list_active() then
		return FAKE_INPUT_SERVICE
	end

	return parent:window_input_service()
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.set_focus = function (self, focused)
	self._focused = focused
	self._render_settings.alpha_multiplier = focused and 1 or 0.5
	self._widgets_by_name.item_tooltip.content.visible = focused
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCosmeticsLoadoutPoseInventoryConsole")

	self.ui_animator = nil

	self._item_grid:destroy()

	self._item_grid = nil

	self._menu_input_description:destroy()

	self._menu_input_description = nil

	self._parent:set_character_pose_animation(nil)
	self._parent:clear_temporary_loadout()
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self._item_grid:update(dt, t)
	self:_update_animations(dt)
	self:_update_selected_cosmetic_slot_index()
	self:_update_loadout_sync()
	self:_update_page_info()
	self:_update_input_description()
	self:_update_illusions(dt, t)
	self:_update_remove_button_state(dt, t)

	if self._focused then
		self:_handle_gamepad_activity()
		self:_update_selected_item_tooltip()
		self:_handle_input(dt, t)
		self:_handle_gamepad_input(dt, t)
	end

	self:draw(dt)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.post_update = function (self, dt, t)
	return
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_illusions = function (self, dt, t)
	local illusion_widgets = self._illusion_widgets

	if table.is_empty(illusion_widgets) then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local is_hovering = false

	for index, widget in ipairs(illusion_widgets) do
		if UIUtils.is_button_pressed(widget) then
			local mark_as_equipped = false
			local skip_wield_anim = true

			self:_on_illusion_index_pressed(index, mark_as_equipped, skip_wield_anim)

			return
		elseif UIUtils.is_button_hover_enter(widget) then
			self:_play_sound("play_gui_equipment_inventory_hover")

			local content = widget.content
			local skin_key = content.skin_key
			local skin_data = WeaponSkins.skins[skin_key]
			local widgets_by_name = self._widgets_by_name

			widgets_by_name.illusions_name.content.text = Localize(skin_data.display_name)

			return
		elseif UIUtils.is_button_hover(widget) then
			is_hovering = true
		end
	end

	if not is_hovering then
		local widget = illusion_widgets[self._selected_skin_index]
		local content = widget.content
		local skin_key = content.skin_key
		local skin_data = WeaponSkins.skins[skin_key]

		widgets_by_name.illusions_name.content.text = Localize(skin_data.display_name)
	end

	if UIUtils.is_button_pressed(widgets_by_name.apply_illusion_button) then
		self:_apply_illusion()
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_remove_button_state = function (self, dt, t)
	local backend_items = Managers.backend:get_interface("items")
	local backend_id = BackendUtils.get_loadout_item_id(self._career_name, "slot_pose")
	local item = backend_id and backend_items:get_item_from_id(backend_id)
	local item_key = item and item.key
	local widget = self._widgets_by_name.button_remove

	UIUtils.enable_button(widget, not item_key or item_key ~= "default_weapon_pose_01")
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._apply_illusion = function (self)
	local illusion_widgets = self._illusion_widgets
	local selected_skin_index = self._selected_skin_index
	local widget = illusion_widgets[selected_skin_index]
	local content = widget.content
	local locked = content.locked

	if not locked then
		local skin_key = content.skin_key
		local item_data = ItemMasterList[skin_key]
		local backend_items = Managers.backend:get_interface("items")
		local blueprint_item_key = string.gsub(self._selected_blueprint_name, "^vs_", "")
		local matching_item_key = item_data.matching_item_key

		if matching_item_key == blueprint_item_key then
			local weapon_pose_skin_backend_id, _ = backend_items:get_weapon_skin_from_skin_key(skin_key)

			backend_items:set_weapon_pose_skin(blueprint_item_key, weapon_pose_skin_backend_id)

			local mark_as_equipped = true
			local skip_wield_anim = true

			self:_select_illusion_by_key(skin_key, mark_as_equipped, skip_wield_anim)

			local current_weapon_pose_id = backend_items:get_loadout_item_id(self._career_name, "slot_pose")
			local current_weapon_pose_item = backend_items:get_item_from_id(current_weapon_pose_id)
			local current_weapon_pose_data = current_weapon_pose_item and current_weapon_pose_item.data
			local current_weapon_pose_parent = current_weapon_pose_data and current_weapon_pose_data.parent

			if blueprint_item_key == current_weapon_pose_parent then
				local local_player = Managers.player:local_player()

				CosmeticUtils.update_cosmetic_slot(local_player, "slot_pose", current_weapon_pose_item.key)
			end
		end
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_input_description = function (self)
	local new_input_desc = "default"

	if self._selected_blueprint_name then
		if self._gamepad_illusion_buttons_active then
			local widgets_by_name = self._widgets_by_name
			local widget_apply_illusion_button = widgets_by_name.apply_illusion_button

			if widget_apply_illusion_button.content.visible then
				new_input_desc = "apply_weapon_skin"
			else
				new_input_desc = "weapon_skin"
			end
		else
			new_input_desc = "pose_selection"
		end
	end

	if new_input_desc ~= self._current_input_description then
		self._menu_input_description:change_generic_actions(generic_input_actions[new_input_desc])

		self._current_input_description = new_input_desc
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._set_item_compare_enable_state = function (self, enabled)
	self._widgets_by_name.item_tooltip_compare.content.visible = enabled
	self._draw_item_compare = enabled
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_equipped_item_tooltip = function (self)
	local slot_index = self._selected_cosmetic_slot_index
	local slot = InventorySettings.slots_by_cosmetic_index[slot_index]
	local slot_name = slot.name
	local item_interface = Managers.backend:get_interface("items")
	local backend_id = BackendUtils.get_loadout_item_id(self._career_name, slot_name)
	local item = backend_id and item_interface:get_item_from_id(backend_id)
	local widget = self._widgets_by_name.item_tooltip_compare

	widget.content.item = item
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_selected_item_tooltip = function (self)
	local selected_item = self._item_grid:selected_item()
	local backend_id = selected_item and selected_item.backend_id

	if backend_id ~= self._selected_backend_id then
		local widget = self._widgets_by_name.item_tooltip

		widget.content.item = selected_item
	end

	self._selected_backend_id = backend_id
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_arrow_button(page_button_next, dt)
	UIWidgetUtils.animate_arrow_button(page_button_previous, dt)

	if not table.is_empty(self._illusion_base_widgets) then
		UIWidgetUtils.animate_default_button(widgets_by_name.apply_illusion_button, dt)
	end

	UIWidgetUtils.animate_default_button(widgets_by_name.button_remove, dt)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._handle_gamepad_input = function (self, dt, t)
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		return
	end

	local parent = self._parent
	local input_service = self:_input_service()
	local item_grid = self._item_grid

	if self._gamepad_illusion_buttons_active then
		local selected_skin_index = self._selected_skin_index
		local illusion_widgets = self._illusion_widgets

		if input_service:get("special_1", true) or input_service:get("back_menu", true) then
			self:_toggle_gamepad_illusion_buttons()

			return
		elseif input_service:get("confirm", true) then
			self:_apply_illusion()

			return
		end

		local modified = false

		if selected_skin_index > 1 and input_service:get("move_left_hold_continuous") then
			selected_skin_index = selected_skin_index - 1
			modified = true
		elseif selected_skin_index < #illusion_widgets and input_service:get("move_right_hold_continuous") then
			selected_skin_index = selected_skin_index + 1
			modified = true
		end

		if modified then
			local mark_as_equipped = false
			local skip_wield_anim = true

			self:_on_illusion_index_pressed(selected_skin_index, mark_as_equipped, skip_wield_anim)
		end
	else
		if item_grid:handle_gamepad_selection(input_service) then
			self:_play_sound("play_gui_inventory_item_hover")
		end

		if input_service:get("confirm", true) then
			local selected_item, is_equipped = item_grid:selected_item()

			if selected_item then
				local item_data = selected_item.data
				local slot_type = item_data.slot_type

				if slot_type == "weapon_pose" then
					local apply_illusion_button_widget = self._widgets_by_name.apply_illusion_button

					if apply_illusion_button_widget.content.visible then
						self:_apply_illusion()
					elseif not is_equipped then
						parent:_set_loadout_item(selected_item)
						self:_play_sound("play_gui_equipment_equip_hero")
					end
				else
					local item_name = item_data.name

					self._selected_blueprint_item = table.clone(selected_item)
					self._selected_blueprint_name = item_name

					local item_filter = "weapon_pose_parent == " .. string.gsub(self._selected_blueprint_name, "^vs_", "")

					self:_change_item_filter(item_filter)
					self._parent:set_temporary_loadout_item(selected_item)
					self:_setup_illusions(selected_item)
				end
			end
		elseif input_service:get("special_1", true) then
			self:_toggle_gamepad_illusion_buttons()
		else
			local selected_item, is_equipped = item_grid:selected_item()

			if selected_item then
				local selected_item_data = selected_item.data
				local selected_slot_type = selected_item_data.slot_type

				if selected_slot_type == "weapon_pose" then
					local anim_event = selected_item_data.data.anim_event

					if self._current_anim_event ~= anim_event then
						self._parent:set_character_pose_animation(anim_event)

						self._current_anim_event = anim_event
					end
				end
			elseif self._current_anim_event then
				self._parent:clear_character_animation()

				self._current_anim_event = nil
				self._current_hovered_item = nil
			end
		end

		if self._selected_blueprint_name and (input_service:get("back_menu", true) or input_service:get("toggle_menu", true)) then
			self:_back()
		elseif input_service:get("refresh") then
			self:_equip_default()

			return
		end

		local page_index = self._current_page
		local total_pages = self._total_pages

		if page_index and total_pages then
			if page_index < total_pages and input_service:get(INPUT_ACTION_NEXT) then
				item_grid:set_item_page(page_index + 1)
				self:_play_sound("play_gui_equipment_inventory_next_click")

				local first_item = item_grid:get_item_in_slot(1, 1)

				item_grid:set_item_selected(first_item)
			elseif page_index > 1 and input_service:get(INPUT_ACTION_PREVIOUS) then
				item_grid:set_item_page(page_index - 1)
				self:_play_sound("play_gui_equipment_inventory_next_click")

				local first_item = item_grid:get_item_in_slot(1, 1)

				item_grid:set_item_selected(first_item)
			end
		end
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._toggle_gamepad_illusion_buttons = function (self)
	self._gamepad_illusion_buttons_active = not self._gamepad_illusion_buttons_active
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local parent = self._parent
	local item_grid = self._item_grid
	local allow_single_press = self._selected_blueprint_name == nil
	local item, is_equipped = item_grid:is_item_pressed(allow_single_press)
	local hovered_item, _ = item_grid:get_item_hovered()
	local input_service = self:_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		return
	end

	if self._selected_blueprint_name and input_service:get("toggle_menu", true) then
		self:_back()

		return
	end

	if item_grid:is_item_hovered() then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if item_grid:handle_favorite_marking(input_service) then
		self:_play_sound("play_gui_inventory_item_hover")
	end

	if item then
		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "weapon_pose" then
			if not is_equipped then
				self:_set_loadout_item(item)
				self:_play_sound("play_gui_equipment_equip_hero")
			end
		else
			local item_name = item_data.name

			self._selected_blueprint_item = table.clone(item)
			self._selected_blueprint_name = item_name

			local item_filter = "weapon_pose_parent == " .. string.gsub(self._selected_blueprint_name, "^vs_", "")

			self:_change_item_filter(item_filter)
			self:_setup_illusions(item)
		end
	elseif hovered_item then
		local hovered_item_data = hovered_item.data
		local hovered_slot_type = hovered_item_data.slot_type

		if hovered_slot_type == "weapon_pose" then
			local anim_event = hovered_item_data.data.anim_event

			if self._current_anim_event ~= anim_event then
				self._parent:set_character_pose_animation(anim_event)

				self._current_anim_event = anim_event
				self._current_hovered_item = hovered_item
			end
		end
	end

	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	if UIUtils.is_button_hover_enter(page_button_next) or UIUtils.is_button_hover_enter(page_button_previous) then
		self:_play_sound("play_gui_inventory_next_hover")
	end

	if UIUtils.is_button_pressed(page_button_next) then
		local next_page_index = self._current_page + 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_equipment_inventory_next_click")
	elseif UIUtils.is_button_pressed(page_button_previous) then
		local next_page_index = self._current_page - 1

		item_grid:set_item_page(next_page_index)
		self:_play_sound("play_gui_equipment_inventory_next_click")
	end

	local button_remove_widget = widgets_by_name.button_remove

	if UIUtils.is_button_hover_enter(button_remove_widget) then
		self:_play_sound("play_gui_equipment_inventory_hover")
	end

	if UIUtils.is_button_pressed(button_remove_widget) then
		self:_equip_default()
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._equip_default = function (self)
	self:_play_sound("play_gui_equipment_equip_hero")

	local backend_items = Managers.backend:get_interface("items")
	local selected_item = backend_items:get_item_from_key("default_weapon_pose_01")

	if selected_item then
		self._parent:_set_loadout_item(selected_item)
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._set_loadout_item = function (self, item)
	self._parent:_set_loadout_item(item)

	local item_data = item.data
	local local_player = Managers.player:local_player()

	CosmeticUtils.update_cosmetic_slot(local_player, "slot_pose", item_data.name)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._select_illusion_by_key = function (self, key, mark_as_equipped, skip_wield_anim)
	if not key then
		return
	end

	local widgets = self._illusion_widgets

	for i, widget in ipairs(widgets) do
		local content = widget.content
		local skin_key = content.skin_key

		if skin_key == key then
			self:_on_illusion_index_pressed(i, mark_as_equipped, skip_wield_anim)

			break
		end
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._on_illusion_index_pressed = function (self, index, mark_as_equipped, skip_wield_anim)
	local illusion_widgets = self._illusion_widgets
	local widget = illusion_widgets[index]
	local content = widget.content
	local skin_key = content.skin_key

	self._skin_dirty = false

	local locked = content.locked
	local selected_blueprint_item = self._selected_blueprint_item

	selected_blueprint_item.skin = skin_key

	self._parent:clear_temporary_loadout()
	self._parent:set_temporary_loadout_item(selected_blueprint_item, skip_wield_anim)

	if not locked then
		local backend_items = Managers.backend:get_interface("items")
		local unlocked_weapon_poses = backend_items:get_unlocked_weapon_poses()
		local blueprint = self._selected_blueprint_name
		local item = ItemMasterList[blueprint]
		local current_item_key = string.gsub(item.name, "^vs_", "")
		local unlocked_weapon_poses_for_blueprint = unlocked_weapon_poses[current_item_key] or EMPTY_TABLE
		local default_skin_key = WeaponSkins.default_skins[current_item_key]
		local default_skin_backend_id, _ = backend_items:get_weapon_skin_from_skin_key(default_skin_key)
		local current_weapon_pose_skin = backend_items:get_equipped_weapon_pose_skin(current_item_key)

		if not current_weapon_pose_skin and skin_key ~= default_skin_key or current_weapon_pose_skin and current_weapon_pose_skin ~= skin_key then
			self:_enable_apply_illusion_button(true, true)
		else
			self:_enable_apply_illusion_button(false)
		end
	else
		self:_enable_apply_illusion_button(false)
	end

	local widgets_by_name = self._widgets_by_name
	local skin_data = WeaponSkins.skins[skin_key]

	widgets_by_name.illusions_name.content.text = Localize(skin_data.display_name)

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

HeroWindowCosmeticsLoadoutPoseInventoryConsole._enable_apply_illusion_button = function (self, enable, disable_edges)
	if script_data["eac-untrusted"] then
		enable = false
	end

	local widgets_by_name = self._widgets_by_name
	local widget_apply_illusion_button = widgets_by_name.apply_illusion_button

	widget_apply_illusion_button.content.visible = enable
	widget_apply_illusion_button.content.button_hotspot.disable_button = not enable
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._get_item = function (self, backend_id)
	self._item_backend_id = backend_id

	local backend_items = Managers.backend:get_interface("items")

	return backend_items:get_item_from_id(backend_id)
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

	return b_order < a_order
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._clear_illusion_widgets = function (self)
	table.clear(self._illusion_base_widgets)
	table.clear(self._illusion_widgets)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._setup_illusions = function (self, item)
	local widgets = {}
	local widgets_by_name = self._widgets_by_name

	for name, widget_definition in pairs(weapon_illusion_base_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._illusion_base_widgets = widgets

	local item_key = string.gsub(item.key, "^vs_", "")
	local item_data = item.data
	local item = ItemMasterList[item_key]
	local item_data = item or item_data
	local num_unlocked_skins = 0
	local skin_combination_table = item_data.skin_combination_table
	local weapon_skin_combinations_tables = WeaponSkins.skin_combinations[skin_combination_table] or EMPTY_TABLE
	local quest_interface = Managers.backend:get_interface("quests")
	local backend_crafting = Managers.backend:get_interface("crafting")
	local unlocked_weapon_skins = backend_crafting:get_unlocked_weapon_skins()
	local default_skin = WeaponSkins.default_skins[item_key]
	local default_skin_key
	local width = 51
	local spacing = -5
	local total_width = -spacing
	local widgets = {}
	local used_skins = {}
	local rarity_settings = RaritySettings
	local widget_definition = create_illusion_button()

	for weapon_skins_rarity, weapon_skins in pairs(weapon_skin_combinations_tables) do
		for _, skin in ipairs(weapon_skins) do
			if not used_skins[skin] then
				if not rarity_settings[weapon_skins_rarity] then
					local weapon_skin_data = WeaponSkins.skins[skin]

					weapon_skins_rarity = weapon_skin_data and weapon_skin_data.rarity or weapon_skins_rarity
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

	local backend_items = Managers.backend:get_interface("items")
	local equipped_weapon_pose_skins = backend_items:get_equipped_weapon_pose_skins()
	local current_weapon_skin_name = equipped_weapon_pose_skins[item_key]
	local current_weapon_skin_backend_id = current_weapon_skin_name and backend_items:get_weapon_skin_from_skin_key(current_weapon_skin_name)
	local current_weapon_skin = current_weapon_skin_backend_id and backend_items:get_item_from_id(current_weapon_skin_backend_id)
	local item_skin = current_weapon_skin and current_weapon_skin.skin or item.skin or default_skin
	local mark_as_equipped = true

	self:_select_illusion_by_key(item_skin, mark_as_equipped)

	local widgets_by_name = self._widgets_by_name

	widgets_by_name.illusions_counter.content.text = "(" .. tostring(num_unlocked_skins) .. "/" .. tostring(#widgets) .. ")"

	self:_start_transition_animation("animate_illusion_widgets")
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._back = function (self)
	local category_setting = category_settings[self._current_category_index]
	local category_name = category_setting.name
	local display_name = category_setting.display_name
	local item_grid = self._item_grid

	item_grid:change_category(category_name)

	self._selected_blueprint_name = nil

	self:_play_sound("play_gui_equipment_inventory_next_click")
	self:_start_transition_animation("on_enter")

	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		local item_grid = self._item_grid
		local first_item = item_grid:get_item_in_slot(1, 1)

		item_grid:set_item_selected(first_item)
	end

	self:_show_equipped_weapon_pose()
	self:_clear_illusion_widgets()
	self._item_grid:mark_equipped_items(false)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._change_item_filter = function (self, item_filter)
	self._item_grid:change_item_filter(item_filter, true)
	self:_play_sound("play_gui_equipment_inventory_next_click")
	self:_start_transition_animation("on_enter")

	local mouse_active = Managers.input:is_device_active("mouse")

	if not mouse_active then
		local item_grid = self._item_grid
		local first_item = item_grid:get_item_in_slot(1, 1)

		item_grid:set_item_selected(first_item)
	end

	self._item_grid:mark_equipped_items(true)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_page_info = function (self)
	local current_page, total_pages = self._item_grid:get_page_info()

	if current_page ~= self._current_page or total_pages ~= self._total_pages then
		self._total_pages = total_pages
		self._current_page = current_page
		current_page = current_page or 1
		total_pages = total_pages or 1

		local widgets_by_name = self._widgets_by_name

		widgets_by_name.page_text_left.content.text = tostring(current_page)
		widgets_by_name.page_text_right.content.text = tostring(total_pages)
		widgets_by_name.page_button_next.content.hotspot.disable_button = current_page == total_pages
		widgets_by_name.page_button_previous.content.hotspot.disable_button = current_page == 1
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_selected_cosmetic_slot_index = function (self)
	local index = self._parent:get_selected_cosmetic_slot_index()

	if index ~= self._selected_cosmetic_slot_index then
		self._selected_cosmetic_slot_index = index

		self:_change_category_by_index(index)
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._update_loadout_sync = function (self)
	local item_grid = self._item_grid
	local parent = self._parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._loadout_sync_id = loadout_sync_id

		item_grid:update_items_status()
		self:_update_equipped_item_tooltip()
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self:_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if not gamepad_active or self._gamepad_illusion_buttons_active then
		for _, widget in ipairs(self._illusion_widgets) do
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		for _, widget in ipairs(self._illusion_base_widgets) do
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._change_category_by_index = function (self, index, force_update)
	if force_update then
		index = self._current_category_index or 1
	end

	if self._current_category_index == index then
		return
	end

	self._current_category_index = index

	local category_setting = category_settings[index]
	local category_name = category_setting.name
	local display_name = category_setting.display_name
	local item_grid = self._item_grid

	item_grid:change_category(category_name)

	return true
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._setup_input_buttons = function (self)
	local input_service = self._parent:window_input_service()
	local input_1_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_NEXT, true)
	local input_2_texture_data = UISettings.get_gamepad_input_texture_data(input_service, INPUT_ACTION_PREVIOUS, true)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local icon_style_input_1 = input_1_widget.style.texture_id

	icon_style_input_1.horizontal_alignment = "center"
	icon_style_input_1.vertical_alignment = "center"
	icon_style_input_1.texture_size = {
		input_1_texture_data.size[1],
		input_1_texture_data.size[2],
	}
	input_1_widget.content.texture_id = input_1_texture_data.texture

	local icon_style_input_2 = input_2_widget.style.texture_id

	icon_style_input_2.horizontal_alignment = "center"
	icon_style_input_2.vertical_alignment = "center"
	icon_style_input_2.texture_size = {
		input_2_texture_data.size[1],
		input_2_texture_data.size[2],
	}
	input_2_widget.content.texture_id = input_2_texture_data.texture
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._set_gamepad_input_buttons_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local input_1_widget = widgets_by_name.input_icon_next
	local input_2_widget = widgets_by_name.input_icon_previous
	local input_arrow_1_widget = widgets_by_name.input_arrow_next
	local input_arrow_2_widget = widgets_by_name.input_arrow_previous

	input_1_widget.content.visible = visible
	input_2_widget.content.visible = visible
	input_arrow_1_widget.content.visible = visible
	input_arrow_2_widget.content.visible = visible
end

HeroWindowCosmeticsLoadoutPoseInventoryConsole._handle_gamepad_activity = function (self)
	local mouse_active = Managers.input:is_device_active("mouse")
	local force_update = self.gamepad_active_last_frame == nil

	if not mouse_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			local item_grid = self._item_grid
			local first_item = item_grid:get_item_in_slot(1, 1)

			item_grid:set_item_selected(self._current_hovered_item or first_item)
			self:_set_gamepad_input_buttons_visibility(true)
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		local item_grid = self._item_grid

		item_grid:set_item_selected(nil)
		self:_set_gamepad_input_buttons_visibility(false)

		self._gamepad_illusion_buttons_active = false
	end
end
