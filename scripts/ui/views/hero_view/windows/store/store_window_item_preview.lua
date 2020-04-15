require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_item_preview_definitions")
local dlc_top_widget_definitions = definitions.dlc_top_widgets
local dlc_bottom_widget_definitions = definitions.dlc_bottom_widgets
local item_widgets_definitions = definitions.item_widgets
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local loading_widget_definitions = definitions.loading_widgets
local create_dlc_entry_definition = definitions.create_dlc_entry_definition
local generic_input_actions = definitions.generic_input_actions
local LIST_SPACING = 10
local LIST_MAX_WIDTH = 800
local CONSOLE_PRICE_WIDTH = 140
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
local DO_RELOAD = false
StoreWindowItemPreview = class(StoreWindowItemPreview)
StoreWindowItemPreview.NAME = "StoreWindowItemPreview"

StoreWindowItemPreview.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowItemPreview")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	local ui_renderer, ui_top_renderer = self._parent:get_renderers()
	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")

	local title_edge_length = scenegraph_definition.title_text.size[1] + 50

	self:_set_title_edge_length(title_edge_length, 0.01)

	self._current_generic_input_action = nil
end

StoreWindowItemPreview._set_window_expanded = function (self, expand)
	local title_edge_length = scenegraph_definition.title_text.size[1] + 50

	if expand then
		self:_start_transition_animation("expand")
		self:_set_title_edge_length(0, 0.3)
	else
		self:_start_transition_animation("collapse")
		self:_set_title_edge_length(title_edge_length, 0.3)
	end

	local details_button = self._item_widgets_by_name.details_button
	details_button.content.button_hotspot.is_selected = not details_button.content.button_hotspot.is_selected
	self._expanded = expand
end

StoreWindowItemPreview._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = self._top_widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StoreWindowItemPreview._create_viewport_definition = function (self)
	local shading_environment = "environment/ui_store_preview"

	return {
		scenegraph_id = "viewport",
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 990,
				world_name = "item_preview",
				viewport_type = "default_forward",
				viewport_name = "item_preview_viewport",
				enable_sub_gui = false,
				fov = 65,
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

StoreWindowItemPreview._create_ui_elements = function (self, params, offset)
	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local dlc_top_widgets = {}
	local dlc_top_widgets_by_name = {}

	for name, widget_definition in pairs(dlc_top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		dlc_top_widgets[#dlc_top_widgets + 1] = widget
		dlc_top_widgets_by_name[name] = widget
	end

	self._dlc_top_widgets = dlc_top_widgets
	self._dlc_top_widgets_by_name = dlc_top_widgets_by_name
	local dlc_bottom_widgets = {}
	local dlc_bottom_widgets_by_name = {}

	for name, widget_definition in pairs(dlc_bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		dlc_bottom_widgets[#dlc_bottom_widgets + 1] = widget
		dlc_bottom_widgets_by_name[name] = widget
	end

	self._dlc_bottom_widgets = dlc_bottom_widgets
	self._dlc_bottom_widgets_by_name = dlc_bottom_widgets_by_name
	local item_widgets = {}
	local item_widgets_by_name = {}

	for name, widget_definition in pairs(item_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)
		item_widgets[#item_widgets + 1] = widget
		item_widgets_by_name[name] = widget
	end

	self._item_widgets = item_widgets
	self._item_widgets_by_name = item_widgets_by_name
	local bottom_widgets = {}
	local bottom_widgets_by_name = {}

	for name, widget_definition in pairs(bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bottom_widgets[#bottom_widgets + 1] = widget
		bottom_widgets_by_name[name] = widget
	end

	self._bottom_widgets = bottom_widgets
	self._bottom_widgets_by_name = bottom_widgets_by_name
	local top_widgets = {}
	local top_widgets_by_name = {}

	for name, widget_definition in pairs(top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		top_widgets[#top_widgets + 1] = widget
		top_widgets_by_name[name] = widget
	end

	self._top_widgets = top_widgets
	self._top_widgets_by_name = top_widgets_by_name
	local loading_widgets = {}
	local loading_widgets_by_name = {}

	for name, widget_definition in pairs(loading_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		loading_widgets[#loading_widgets + 1] = widget
		loading_widgets_by_name[name] = widget
	end

	self._loading_widgets = loading_widgets
	self._loading_widgets_by_name = loading_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._viewport_widget_definition = self:_create_viewport_definition()
end

StoreWindowItemPreview.on_exit = function (self, params, force_unload)
	print("[HeroViewWindow] Exit Substate StoreWindowItemPreview")

	self._ui_animator = nil
	self._has_exited = true

	self:_destroy_dlc_product_widgets(force_unload)
	self:_destroy_previewers()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._parent:change_generic_actions(generic_input_actions.default)
end

StoreWindowItemPreview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_animations(dt)
	self:_sync_layout_path()

	if self._selected_product then
		local input_service = self._parent:window_input_service()
		local input_handled, input_hovered = self:_handle_input(input_service, dt, t)

		if self._world_previewer then
			local parent = self._parent
			local input_disabled = parent:input_blocked()

			self._world_previewer:update(dt, t, input_disabled)
		end

		if self._item_previewer then
			local viewport_button = self._top_widgets_by_name.viewport_button
			local is_hover = self:_is_button_hover(viewport_button)
			local gamepad_active = Managers.input:is_device_active("gamepad")
			local allow_preview_input = not input_handled and not input_hovered and (gamepad_active or is_hover)

			self._item_previewer:update(dt, t, allow_preview_input and input_service)
		end
	end
end

StoreWindowItemPreview.post_update = function (self, dt, t)
	if self._viewport_widget_definition and not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)
	end

	self:_update_loading_overlay_fadeout_animation(dt)
	self:_update_delayed_item_unit_presentation(dt)

	if self._viewport_widget then
		local force_update = false

		if self:_sync_products_version() then
			force_update = self._selected_product ~= nil
		end

		self:_sync_presentation_item(force_update)
	end

	if self._world_previewer then
		self._world_previewer:post_update(dt, t)
	end

	if self._item_previewer then
		self._item_previewer:post_update(dt, t)
	end

	if self._selected_product then
		self:draw(dt)
	end
end

StoreWindowItemPreview._sync_products_version = function (self)
	local parent = self._parent
	local products_version_id = parent:products_version_id()

	if products_version_id ~= self._products_version_id then
		self._products_version_id = products_version_id

		return true
	end

	return false
end

StoreWindowItemPreview._update_animations = function (self, dt)
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

	if self._dlc_list_initialized then
		self:_animate_dlc_list_entries(dt)
	end

	local top_widgets_by_name = self._top_widgets_by_name
	local unlock_button = top_widgets_by_name.unlock_button

	UIWidgetUtils.animate_default_button(unlock_button, dt)

	if not self._dlc_presentation_active then
		self:_animate_detail_button(dt)
	end

	self:_update_title_edge_animation(dt)
end

StoreWindowItemPreview._animate_dlc_list_entries = function (self, dt)
	local parent = self._parent
	local list_hovered = self:_is_dlc_list_hovered()

	if self._gamepad_active_last_frame then
		list_hovered = true
	end

	local dlc_list_widgets = self._dlc_list_widgets

	for _, widget in ipairs(dlc_list_widgets) do
		local content = widget.content
		local style = widget.style
		local hotspot = content.button_hotspot or content.hotspot

		if hotspot and hotspot.on_hover_enter then
			self:_play_sound("Play_hud_store_button_hover")

			hotspot.on_hover_enter = false
		end

		parent:animate_store_product(widget, dt, list_hovered)
	end
end

StoreWindowItemPreview._is_dlc_list_hovered = function (self)
	local list_mask = self._dlc_top_widgets_by_name.list

	return list_mask.content.list_hotspot.is_hover or false
end

StoreWindowItemPreview._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

StoreWindowItemPreview._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StoreWindowItemPreview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowItemPreview._dlc_list_index_pressed = function (self)
	local list_widgets = self._dlc_list_widgets

	if list_widgets then
		for index, widget in ipairs(list_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return index
			end
		end
	end
end

StoreWindowItemPreview._handle_input = function (self, input_service, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local top_widgets_by_name = self._top_widgets_by_name
	local item_widgets_by_name = self._item_widgets_by_name
	local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
	local unlock_button = top_widgets_by_name.unlock_button
	local details_button = item_widgets_by_name.details_button
	local input_handled = false
	local input_hovered = false

	if self:_is_button_hovered(unlock_button) or self:_is_button_hovered(details_button) then
		self:_play_sound("Play_hud_hover")

		input_hovered = true
	elseif self:_is_button_hover(unlock_button) or self:_is_button_hover(details_button) then
		input_hovered = true
	end

	if self._dlc_presentation_active then
		if self._draw_fullscreen_video and Managers.input:any_input_released() then
			self:_stop_fullscreen_video()

			input_handled = true
		end

		if self._dlc_list_initialized then
			if self:_is_dlc_list_hovered() then
				local list_index = self:_dlc_list_index_pressed()

				if list_index then
					local layout = self._dlc_layout
					local entry = layout[list_index]
					local product_id = entry.product_id
					local product_type = entry.type
					local settings = entry.settings

					if product_type == "dlc_header_video" then
						local material_name = settings.material_name
						local resource = settings.resource
						local sound_event = settings.sound_event

						self._parent:start_fullscreen_video(material_name, resource, sound_event)
					end
				end
			end

			self._dlc_scrollbar_logic:update(dt, t)
			self:_update_dlc_scroll_position()
		end
	end

	local confirm_press = input_service:get("confirm_press")

	if (self:_is_button_pressed(unlock_button) or confirm_press) and not self:_owns_product() then
		self:_play_sound("Play_hud_store_buy_window")

		local selected_product = self._selected_product

		parent:product_purchase_request(selected_product)

		input_handled = true
	end

	local special_press = input_service:get("special_1_press")

	if (self:_is_button_pressed(details_button) or special_press) and self:_detailed_view_available() then
		self:_play_sound("Play_hud_select")

		local path = parent:get_store_path()
		local new_path = table.clone(path)

		if path[#path] == "item_details" then
			new_path[#new_path] = nil
		else
			new_path[#new_path + 1] = "item_details"
		end

		parent:go_to_store_path(new_path)

		input_handled = true
	end

	return input_handled, input_hovered
end

StoreWindowItemPreview._exit = function (self)
	self.exit = true
end

StoreWindowItemPreview._get_alpha_multiplier = function (self, widget, alpha_multiplier)
	local render_settings = self._render_settings
	local widget_alpha_multiplier = widget.alpha_multiplier

	if widget_alpha_multiplier then
		return math.min(widget_alpha_multiplier, alpha_multiplier)
	end

	return alpha_multiplier
end

StoreWindowItemPreview.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._dlc_presentation_active then
		for _, widget in ipairs(self._dlc_top_widgets) do
			render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	else
		for _, widget in ipairs(self._item_widgets) do
			render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	for _, widget in ipairs(self._top_widgets) do
		render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._dlc_list_initialized then
		local dlc_list_widgets = self._dlc_list_widgets

		if dlc_list_widgets then
			local render_all = self:_update_visible_list_entries()

			for _, widget in ipairs(dlc_list_widgets) do
				if render_all or widget.content.visible then
					render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

					UIRenderer.draw_widget(ui_top_renderer, widget)
				end
			end
		end
	end

	if self._show_loading_overlay then
		for _, widget in ipairs(self._loading_widgets) do
			render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)

		if self._dlc_presentation_active then
			for _, widget in ipairs(self._dlc_bottom_widgets) do
				render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end

		for _, widget in ipairs(self._bottom_widgets) do
			render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.end_pass(ui_renderer)
	end

	render_settings.alpha_multiplier = alpha_multiplier
end

StoreWindowItemPreview._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowItemPreview._start_loading_overlay = function (self)
	self._show_loading_overlay = true
	self._fadeout_loading_overlay = nil
	self._fadeout_progress = nil
	local loading_widgets_by_name = self._loading_widgets_by_name
	local loading_icon = loading_widgets_by_name.loading_icon
	loading_icon.style.texture_id.color[1] = 255
end

StoreWindowItemPreview._update_loading_overlay_fadeout_animation = function (self, dt)
	if not self._fadeout_loading_overlay and self._show_loading_overlay then
		return
	end

	local loading_widgets_by_name = self._loading_widgets_by_name
	local start = 255
	local target = 0
	local speed = 9
	local progress = math.min(1, (self._fadeout_progress or 0) + speed * dt)
	local alpha = math.lerp(start, target, math.easeInCubic(progress))
	local loading_icon = loading_widgets_by_name.loading_icon
	loading_icon.style.texture_id.color[1] = alpha
	self._fadeout_progress = progress

	if progress == 1 then
		self._fadeout_loading_overlay = nil
		self._fadeout_progress = nil
		self._show_loading_overlay = false
	end
end

StoreWindowItemPreview._destroy_previewers = function (self)
	local item_previewer = self._item_previewer

	if item_previewer then
		item_previewer:destroy()

		self._item_previewer = nil
	end

	local world_previewer = self._world_previewer

	if world_previewer then
		world_previewer:prepare_exit()
		world_previewer:on_exit()
		world_previewer:destroy()

		self._world_previewer = nil
	end
end

StoreWindowItemPreview._sync_presentation_item = function (self, force_update)
	local params = self._params
	local selected_product = params.selected_product

	if selected_product ~= self._selected_product or force_update then
		local reset_presentation = not self._selected_product or self._selected_product.product_id ~= selected_product.product_id
		self._selected_product = selected_product
		local already_owned = false
		local can_afford = true
		local dlc_name = nil
		local product_id = selected_product.product_id
		local product_type = selected_product.type

		if product_type == "item" then
			local item = selected_product.item
			local backend_items = Managers.backend:get_interface("items")
			local item_key = item.key
			dlc_name = item.dlc_name
			already_owned = backend_items:has_item(item_key) or backend_items:has_weapon_illusion(item_key)

			if item.dlc_name then
				can_afford = true
			else
				can_afford = self._parent:can_afford_item(item)
			end
		elseif product_type == "dlc" then
			local dlc_settings = selected_product.dlc_settings
			dlc_name = dlc_settings.dlc_name
			already_owned = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		self:_set_unlock_button_states(already_owned, can_afford)

		if reset_presentation then
			self._delayed_item_unit_presentation_delay = nil

			self:_destroy_previewers()

			local unlock_button_width_offset = 0

			if product_type == "item" then
				local item = selected_product.item

				self:_start_loading_overlay()
				self:_present_item(item)
			elseif product_type == "dlc" then
				self._show_loading_overlay = false
				local dlc_settings = selected_product.dlc_settings

				self:_present_dlc(dlc_settings, product_id)

				unlock_button_width_offset = -49
			end

			self:_update_unlock_button_width(unlock_button_width_offset, already_owned, dlc_name)
		end
	end
end

StoreWindowItemPreview._present_dlc = function (self, settings, product_id)
	local dlc_name = settings.dlc_name
	local title_text = settings.name
	local sub_title_text = "dlc1_2_dlc_level_locked_tooltip"

	self:_set_title_name(Localize(title_text))
	self:_set_sub_title_name(Localize(sub_title_text))
	self:_set_sub_title_alpha_multiplier(1)
	self:_set_type_title_name("")
	self:_set_career_title_name("")
	self:_set_disclaimer_text("")
	self:_set_expire_timer_text("")
	self:_set_price(nil, dlc_name)

	self._dlc_presentation_active = true
	self._item_widgets_by_name.details_button.content.visible = false

	if self:_owns_product() then
		self._current_generic_input_action = "dlc_preview_owned"

		self._parent:change_generic_actions(generic_input_actions.dlc_preview_owned)
	else
		self._current_generic_input_action = "dlc_preview_purchase"

		self._parent:change_generic_actions(generic_input_actions.dlc_preview_purchase)
	end

	local scrollbar_widget = self._dlc_top_widgets_by_name.list_scrollbar
	self._dlc_scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local layout = settings.layout

	self:_dlc_component_layout(layout)
end

StoreWindowItemPreview._present_item = function (self, item)
	if not self._detail_button_hidden then
		self._item_widgets_by_name.details_button.content.visible = true
	end

	self._dlc_presentation_active = false
	local item_data = item.data
	local item_type = item_data.item_type
	local slot_type = item_data.slot_type
	local can_wield = item_data.can_wield
	local end_time = item.end_time
	local dlc_name = item.dlc_name

	if dlc_name then
		self:_set_price(nil, dlc_name)
	else
		local currency_type = "SM"
		local regular_prices = item.regular_prices
		local current_prices = item.current_prices
		local price = current_prices[currency_type] or regular_prices[currency_type]

		self:_set_price(price)
	end

	local type_title_text = ""
	local disclaimer_text = ""
	local sub_title_text, career_title_text = self:_get_can_wield_display_text(can_wield)

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		type_title_text = Localize(item_data.matching_item_key)
		disclaimer_text = Localize(item_type)
	elseif slot_type == "hat" then
		type_title_text = Localize(item_type)
	elseif slot_type == "skin" then
		type_title_text = Localize(item_type)
		disclaimer_text = Localize("menu_store_product_hero_skin_disclaimer_desc")
	end

	local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

	self:_set_title_name(Localize(display_name))
	self:_set_sub_title_name(sub_title_text)
	self:_set_sub_title_alpha_multiplier(1)
	self:_set_type_title_name(type_title_text)
	self:_set_career_title_name(career_title_text)
	self:_set_disclaimer_text(disclaimer_text)

	local expire_timer_text = (end_time and self:_calculate_expire_timer_text(end_time)) or ""

	self:_set_expire_timer_text(expire_timer_text)

	self._delayed_item_unit_presentation_delay = 0.3

	if self:_owns_product() then
		self._current_generic_input_action = "item_preview_owned"

		self._parent:change_generic_actions(generic_input_actions.item_preview_owned)
	else
		self._current_generic_input_action = "item_preview_purchase"

		self._parent:change_generic_actions(generic_input_actions.item_preview_purchase)
	end
end

StoreWindowItemPreview._delayed_item_unit_presentation = function (self, item)
	local item_data = item.data
	local item_key = item_data.key
	local slot_type = item_data.slot_type
	local viewport_widget = self._viewport_widget
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		local preview_position = {
			0,
			0,
			0
		}
		local unique_id, invert_start_rotation, display_unit_key = nil
		local use_highest_mip_levels = true
		local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, unique_id, invert_start_rotation, display_unit_key, use_highest_mip_levels)
		local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key)

		item_previewer:activate_auto_spin()
		item_previewer:register_spawn_callback(callback)

		self._item_previewer = item_previewer
	elseif slot_type == "hat" then
		local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, UISettings.hero_hat_camera_position_by_character)

		world_previewer:on_enter(viewport_widget)

		self._world_previewer = world_previewer
		local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)
		local career_settings = CareerSettings[career_name]
		local base_skin = career_settings.base_skin
		local item_name = item_data.key

		self:_spawn_hero_with_hat(world_previewer, profile_name, career_index, base_skin, item_name)
	elseif slot_type == "skin" then
		local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, UISettings.hero_skin_camera_position_by_character)

		world_previewer:on_enter(viewport_widget)

		self._world_previewer = world_previewer
		local optional_skin = item_data.name
		local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)

		self:_spawn_hero_skin(world_previewer, profile_name, career_index, optional_skin)
	end
end

StoreWindowItemPreview._update_delayed_item_unit_presentation = function (self, dt)
	local delay = self._delayed_item_unit_presentation_delay

	if not delay then
		return
	end

	delay = math.max(delay - dt, 0)

	if delay == 0 then
		self._delayed_item_unit_presentation_delay = nil
		local selected_product = self._selected_product
		local item = selected_product.item

		self:_delayed_item_unit_presentation(item)
	else
		self._delayed_item_unit_presentation_delay = delay
	end
end

StoreWindowItemPreview._set_price = function (self, price, dlc_name)
	local widget = self._top_widgets_by_name.unlock_button
	local content = widget.content

	if price then
		content.currency_text = tostring(price)
	end

	content.present_currency = price ~= nil

	if dlc_name and PLATFORM ~= "win32" then
		self:_handle_platform_price_data(widget, dlc_name)
	else
		content.real_currency = false
	end
end

StoreWindowItemPreview._handle_platform_price_data = function (self, widget, dlc_name)
	local backend_store = Managers.backend:get_interface("peddler")
	local price_data = backend_store:get_app_price(dlc_name)

	if not price_data then
		Application.warning(string.format("[StoreWindowItemPreview] Missing pricing info for %q", dlc_name))

		price_data = {}
	end

	if PLATFORM == "ps4" then
		self:_setup_ps4_price_data(widget, price_data)
	elseif PLATFORM == "xb1" then
		self:_setup_xb1_price_data(widget, price_data)
	end
end

StoreWindowItemPreview._setup_ps4_price_data = function (self, widget, price_data)
	local content = widget.content
	local style = widget.style
	local spacing = 20
	local size = content.size
	local is_plus_price = price_data.is_plus_price
	local has_ps_plus = Managers.account:has_access("playstation_plus")
	local original_price = price_data.original_price
	local display_original_price = price_data.display_original_price
	local display_price = price_data.display_price
	local display_plus_upsell_price = price_data.display_plus_upsell_price
	local console_first_price_style = style.console_first_price_text
	local console_secondary_price_style = style.console_secondary_price_text
	local console_third_price_style = style.console_third_price_text
	local psplus_icon_style = style.psplus_icon
	local console_secondary_price_stroke_style = style.console_secondary_price_stroke
	local console_third_price_stroke_style = style.console_third_price_stroke

	if not original_price and not display_plus_upsell_price and not is_plus_price then
		content.console_first_price_text = display_original_price or display_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = ""
		content.console_third_price_text = ""
		content.show_ps4_plus = false
		content.show_secondary_stroke = false
		content.show_third_stroke = false
	elseif original_price and not display_plus_upsell_price and not is_plus_price then
		content.console_first_price_text = display_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = display_original_price or Localize("dlc_price_unavailable")
		content.console_third_price_text = ""
		content.show_ps4_plus = false
		content.show_secondary_stroke = true
		content.show_third_stroke = false
	elseif original_price and not display_plus_upsell_price and is_plus_price then
		content.console_first_price_text = display_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = display_original_price or Localize("dlc_price_unavailable")
		content.console_third_price_text = ""
		content.show_ps4_plus = true
		content.show_secondary_stroke = has_ps_plus
		content.show_third_stroke = false
	elseif not original_price and display_plus_upsell_price and not is_plus_price then
		content.console_first_price_text = display_plus_upsell_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = display_price or Localize("dlc_price_unavailable")
		content.console_third_price_text = ""
		content.show_ps4_plus = true
		content.show_secondary_stroke = false
		content.show_third_stroke = false
	elseif original_price and display_plus_upsell_price and not is_plus_price then
		content.console_first_price_text = display_plus_upsell_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = display_price or Localize("dlc_price_unavailable")
		content.console_third_price_text = display_original_price or Localize("dlc_price_unavailable")
		content.show_ps4_plus = true
		content.show_secondary_stroke = false
		content.show_third_stroke = true
	else
		content.console_first_price_text = display_price or display_original_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = ""
		content.console_third_price_text = ""
		content.show_ps4_plus = false
		content.show_secondary_stroke = false
		content.show_third_stroke = false
	end

	local console_first_price_text_length = UIUtils.get_text_width(self._ui_top_renderer, console_first_price_style, content.console_first_price_text)
	local console_secondary_price_text_length = UIUtils.get_text_width(self._ui_top_renderer, console_secondary_price_style, content.console_secondary_price_text)
	local console_third_price_text_length = UIUtils.get_text_width(self._ui_top_renderer, console_third_price_style, content.console_third_price_text)
	local starting_point = CONSOLE_PRICE_WIDTH

	if content.console_secondary_price_text == "" then
		starting_point = starting_point - console_first_price_text_length * 0.5
	elseif content.console_third_price_text == "" then
		starting_point = starting_point - (console_secondary_price_text_length + spacing * 0.5) * 0.5
	else
		starting_point = starting_point - (console_secondary_price_text_length + spacing * 0.5 + console_third_price_text_length) * 0.5
	end

	console_third_price_style.offset[1] = -starting_point - console_secondary_price_text_length - spacing * 0.5
	console_secondary_price_stroke_style.texture_size = {
		console_secondary_price_text_length,
		1
	}
	console_third_price_stroke_style.offset[1] = -starting_point - console_secondary_price_text_length - spacing * 0.5
	console_third_price_stroke_style.texture_size = {
		console_third_price_text_length,
		1
	}
	console_first_price_style.offset[1] = -starting_point
	console_secondary_price_style.offset[1] = -starting_point
	console_secondary_price_stroke_style.offset[1] = -starting_point
	psplus_icon_style.offset[1] = -starting_point - console_first_price_text_length - spacing * 0.25

	if content.console_secondary_price_text == "" then
		console_first_price_style.vertical_alignment = "center"
	else
		console_first_price_style.vertical_alignment = "bottom"
	end

	content.real_currency = true
end

StoreWindowItemPreview._setup_xb1_price_data = function (self, widget, price_data)
	local content = widget.content
	local style = widget.style
	local spacing = 20
	local size = content.size
	local availability = (price_data.availabilities and price_data.availabilities[1]) or {}
	local display_original_price = availability.DisplayListPrice
	local display_price = availability.DisplayPrice

	if display_price == display_original_price then
		content.console_first_price_text = display_original_price or display_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = ""
		content.show_secondary_stroke = false
	elseif display_price ~= display_original_price then
		content.console_first_price_text = display_price or Localize("dlc_price_unavailable")
		content.console_secondary_price_text = display_original_price or Localize("dlc_price_unavailable")
		content.show_secondary_stroke = true
	end

	local console_first_price_style = style.console_first_price_text
	local console_secondary_price_style = style.console_secondary_price_text
	local console_secondary_price_stroke_style = style.console_secondary_price_stroke
	local console_first_price_text_length = UIUtils.get_text_width(self._ui_top_renderer, console_first_price_style, content.console_first_price_text)
	local console_secondary_price_text_length = UIUtils.get_text_width(self._ui_top_renderer, console_secondary_price_style, content.console_secondary_price_text)
	local starting_point = CONSOLE_PRICE_WIDTH

	if content.show_secondary_stroke then
		starting_point = starting_point - console_secondary_price_text_length * 0.5
	else
		starting_point = starting_point - console_first_price_text_length * 0.5
	end

	console_first_price_style.offset[1] = -starting_point
	console_secondary_price_stroke_style.offset[1] = -starting_point
	console_secondary_price_stroke_style.texture_size = {
		console_secondary_price_text_length,
		2
	}
	console_secondary_price_stroke_style.vertical_alignment = "bottom"
	console_secondary_price_style.offset[1] = -starting_point
	console_secondary_price_style.offset[2] = 25
	console_secondary_price_style.vertical_alignment = "bottom"

	if content.show_secondary_stroke then
		console_first_price_style.vertical_alignment = "bottom"
		console_first_price_style.base_color = {
			255,
			255,
			255,
			0
		}
		console_secondary_price_stroke_style.color = {
			255,
			90,
			90,
			90
		}
		console_secondary_price_style.text_color = {
			255,
			90,
			90,
			90
		}
	else
		console_first_price_style.vertical_alignment = "center"
		console_first_price_style.base_color = {
			255,
			255,
			255,
			255
		}
		console_secondary_price_stroke_style.color = {
			255,
			255,
			255,
			255
		}
		console_secondary_price_style.text_color = {
			255,
			255,
			255,
			255
		}
	end

	content.real_currency = true
end

StoreWindowItemPreview._set_unlock_button_states = function (self, already_owned, can_afford)
	local enabled = not already_owned and can_afford
	local widget = self._top_widgets_by_name.unlock_button
	widget.content.button_hotspot.disable_button = not enabled
	widget.content.owned = already_owned
end

StoreWindowItemPreview._owns_product = function (self)
	local widget = self._top_widgets_by_name.unlock_button
	local disable_button = widget.content.button_hotspot.disable_button

	return disable_button
end

StoreWindowItemPreview._detailed_view_available = function (self)
	local visible = self._item_widgets_by_name.details_button.content.visible

	return visible
end

StoreWindowItemPreview._set_title_name = function (self, text)
	local widget = self._top_widgets_by_name.title_text
	widget.content.text = text
end

StoreWindowItemPreview._set_sub_title_name = function (self, text)
	local widget = self._top_widgets_by_name.sub_title_text
	widget.content.text = text
end

StoreWindowItemPreview._set_sub_title_alpha_multiplier = function (self, alpha_multiplier)
	local widget = self._top_widgets_by_name.sub_title_text
	widget.alpha_multiplier = alpha_multiplier
end

StoreWindowItemPreview._set_type_title_name = function (self, text)
	local widget = self._top_widgets_by_name.type_title_text
	widget.content.text = text
end

StoreWindowItemPreview._set_career_title_name = function (self, text)
	local widget = self._top_widgets_by_name.career_title_text
	widget.content.text = text
end

StoreWindowItemPreview._set_disclaimer_text = function (self, text)
	self._disclaimer_text = text
	local widget = self._top_widgets_by_name.disclaimer_text
	widget.content.text = text

	self:_update_info_text_alignment()
end

StoreWindowItemPreview._set_expire_timer_text = function (self, text)
	self._expire_text = text
	local widget = self._top_widgets_by_name.expire_timer_text
	widget.content.text = text

	self:_update_info_text_alignment()
end

StoreWindowItemPreview._update_info_text_alignment = function (self)
	local expire_widget = self._top_widgets_by_name.expire_timer_text
	local disclaimer_widget = self._top_widgets_by_name.disclaimer_text
	local divider_widget = self._top_widgets_by_name.disclaimer_divider
	local has_expire_text = self._expire_text and self._expire_text ~= ""
	local has_disclaimer_text = self._disclaimer_text and self._disclaimer_text ~= ""
	local text_widget_1, text_widget_2 = nil

	if has_expire_text then
		if has_disclaimer_text then
			text_widget_1 = expire_widget
			text_widget_2 = disclaimer_widget
		else
			text_widget_2 = expire_widget
		end
	elseif has_disclaimer_text then
		text_widget_2 = disclaimer_widget
	end

	local has_info_text = has_expire_text or has_disclaimer_text
	local ui_renderer = self._ui_renderer
	local text_1_width = (text_widget_1 and UIUtils.get_text_width(ui_renderer, text_widget_1.style.text, text_widget_1.content.text)) or 0
	local text_2_width = (text_widget_2 and UIUtils.get_text_width(ui_renderer, text_widget_2.style.text, text_widget_2.content.text)) or 0
	local spacing = 14
	local divider_width = scenegraph_definition[divider_widget.scenegraph_id].size[1]
	local total_length = text_1_width + text_2_width + divider_width
	local text_1_x = text_1_width / 2 - total_length / 2 - spacing / 2
	local divider_x = text_1_x + text_1_width / 2 + divider_width / 2 + spacing / 2
	local text_2_x = divider_x + text_2_width / 2 + divider_width / 2 + spacing / 2

	if text_widget_1 then
		text_widget_1.offset[1] = text_1_x
	end

	if text_widget_2 then
		text_widget_2.offset[1] = text_2_x
	end

	divider_widget.offset[1] = divider_x
	divider_widget.content.visible = has_info_text
end

local month_lookup = {
	"datetime_january",
	"datetime_february",
	"datetime_march",
	"datetime_april",
	"datetime_may",
	"datetime_june",
	"datetime_july",
	"datetime_august",
	"datetime_september",
	"datetime_october",
	"datetime_november",
	"datetime_december"
}

StoreWindowItemPreview._calculate_expire_timer_text = function (self, end_time)
	local time_left = end_time / 1000 - os.time()
	local seconds = math.max(time_left, 0)
	local minutes = math.floor(seconds / 60)
	local hours = math.floor(minutes / 60)
	local days = math.floor(hours / 24)

	if days > 7 then
		local timer_text = Localize("menu_store_expire_timer_expires") .. " "
		local end_date = os.date("*t", end_time / 1000)
		local month = end_date.month
		local day = end_date.day
		timer_text = timer_text .. string.format(Localize(month_lookup[month]), day)

		return timer_text
	end

	local timer_text = Localize("menu_store_expire_timer_expires_in") .. " "

	if days > 0 then
		local day_string = (days == 1 and "datetime_day") or "datetime_days"
		timer_text = timer_text .. string.format(Localize(day_string), days)

		return timer_text
	end

	if hours > 0 then
		local hour_string = (hours == 1 and "datetime_hour") or "datetime_hours"
		timer_text = timer_text .. string.format(Localize(hour_string), hours)

		return timer_text
	end

	if minutes > 0 then
		local minute_string = (minutes == 1 and "datetime_minute") or "datetime_minutes"
		timer_text = timer_text .. string.format(Localize(minute_string), minutes)

		return timer_text
	end

	local seconds_left = math.max(time_left / 1000, 0)
	local second_string = (seconds == 1 and "datetime_second") or "datetime_seconds"
	timer_text = timer_text .. string.format(Localize(second_string), seconds)

	return timer_text
end

StoreWindowItemPreview.cb_unit_spawned_item_preview = function (self, item_previewer, item_key)
	local ignore_spin = true

	item_previewer:present_item(item_key, ignore_spin)

	self._fadeout_loading_overlay = true
end

StoreWindowItemPreview._spawn_hero_skin = function (self, world_previewer, hero_name, career_index, optional_skin)
	local callback = callback(self, "cb_hero_unit_spawned_skin_preview", world_previewer, hero_name, career_index)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

StoreWindowItemPreview._spawn_hero_with_hat = function (self, world_previewer, hero_name, career_index, optional_skin, item_name)
	local callback = callback(self, "cb_hero_unit_spawned_hat_preview", world_previewer, hero_name, career_index, item_name)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

StoreWindowItemPreview.cb_hero_unit_spawned_skin_preview = function (self, world_previewer, hero_name, career_index)
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_idle_animation = "store_idle"
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_data in ipairs(preview_items) do
			local item_name = item_data.item_name
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type

			if slot_type ~= "melee" and slot_type ~= "ranged" then
				local slot_names = InventorySettings.slot_names_by_type[slot_type]
				local slot_name = slot_names[1]
				local slot = InventorySettings.slots_by_name[slot_name]

				world_previewer:equip_item(item_name, slot)
			end
		end
	end

	if preview_idle_animation then
		world_previewer:play_character_animation(preview_idle_animation)
	end

	self._fadeout_loading_overlay = true
end

StoreWindowItemPreview.cb_hero_unit_spawned_hat_preview = function (self, world_previewer, hero_name, career_index, hat_item_name)
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_idle_animation = "store_idle"
	local preview_items = career_settings.preview_items
	local hat_slot = InventorySettings.slots_by_name.slot_hat

	world_previewer:equip_item(hat_item_name, hat_slot)

	if preview_items then
		for _, item_data in ipairs(preview_items) do
			local item_name = item_data.item_name
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type

			if slot_type ~= "melee" and slot_type ~= "ranged" and slot_type ~= "hat" then
				local slot_names = InventorySettings.slot_names_by_type[slot_type]
				local slot_name = slot_names[1]
				local slot = InventorySettings.slots_by_name[slot_name]

				world_previewer:equip_item(item_name, slot)
			end
		end
	end

	if preview_idle_animation then
		world_previewer:play_character_animation(preview_idle_animation)
	end

	self._fadeout_loading_overlay = true
end

StoreWindowItemPreview._get_can_wield_display_text = function (self, can_wield)
	local hero_text = ""
	local career_text = ""

	if can_wield then
		local added_heroes = 0
		local added_careers = 0

		for _, career_name in ipairs(can_wield) do
			local career_settings = CareerSettings[career_name]
			local profile_name = career_settings.profile_name
			local profile_index = FindProfileIndex(profile_name)
			local profile = SPProfiles[profile_index]
			local hero_display_name = profile.character_name

			if added_careers > 0 then
				career_text = career_text .. ", "
			end

			added_careers = added_careers + 1
			local career_display_name = career_settings.display_name
			career_text = career_text .. Localize(career_display_name)
			local hero_display_name_localized = Localize(hero_display_name)

			if not string.find(hero_text, hero_display_name_localized) then
				if added_heroes > 0 then
					hero_text = hero_text .. ", "
				end

				added_heroes = added_heroes + 1
				hero_text = hero_text .. hero_display_name_localized
			end
		end
	end

	return hero_text, career_text
end

StoreWindowItemPreview._get_hero_wield_info_by_item = function (self, item)
	local item_data = item.data
	local can_wield = item_data.can_wield
	local career_name = can_wield[1]

	for _, profile_settings in ipairs(SPProfiles) do
		local careers = profile_settings.careers

		for index, career_settings in ipairs(careers) do
			if career_settings.name == career_name then
				local profile_name = profile_settings.display_name
				local profile_index = FindProfileIndex(profile_name)
				local career_index = career_settings.sort_order

				return profile_name, profile_index, career_name, career_index
			end
		end
	end
end

StoreWindowItemPreview._sync_layout_path = function (self)
	local parent = self._parent
	local path = parent:get_store_path()
	local path_structure = StoreLayoutConfig.structure
	local pages = StoreLayoutConfig.pages
	local saved_path = self._saved_path or {}
	local path_differs = false
	local path_length = #path
	local saved_path_length = #saved_path

	if path_length ~= saved_path_length then
		path_differs = true
	else
		for i = 1, #path, 1 do
			if path[i] ~= saved_path[i] then
				path_differs = true

				break
			end
		end
	end

	if path_differs then
		local page_name = path[#path]

		if page_name == "item_details" then
			if not self._expanded then
				self:_set_window_expanded(true)
			end

			local previous_page_name = path[path_length - 1]

			if not previous_page_name or pages[previous_page_name].layout ~= "item_list" then
				self:_hide_detail_button_assets()
			end
		elseif self._expanded then
			self:_set_window_expanded(false)
		end

		self._saved_path = table.clone(path)
	end
end

StoreWindowItemPreview._hide_detail_button_assets = function (self)
	local item_widgets_by_name = self._item_widgets_by_name
	item_widgets_by_name.details_button.content.visible = false
	item_widgets_by_name.details_button_bg.content.visible = false
	item_widgets_by_name.title_edge_detail.content.visible = false
	item_widgets_by_name.title_edge.content.visible = false
	self._detail_button_hidden = true

	if self._current_generic_input_action then
		local hide_detail_input_action = generic_input_actions[self._current_generic_input_action .. "_no_details"]

		if hide_detail_input_action then
			self._parent:change_generic_actions(hide_detail_input_action)
		end
	end
end

StoreWindowItemPreview._animate_detail_button = function (self, dt)
	local item_widgets_by_name = self._item_widgets_by_name
	local widget = item_widgets_by_name.details_button
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	style.normal_glow.color[1] = 255 * hover_progress
	style.expanded_glow.color[1] = 255 * hover_progress
	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

StoreWindowItemPreview._set_title_edge_length = function (self, length, animation_duration)
	local ui_scenegraph = self._ui_scenegraph
	local item_widgets_by_name = self._item_widgets_by_name
	local title_edge_detail = item_widgets_by_name.title_edge_detail
	local title_edge_detail_size = scenegraph_definition[title_edge_detail.scenegraph_id].size
	local target_length = math.max(length - title_edge_detail_size[1], 0)
	local title_edge = item_widgets_by_name.title_edge
	local start_length = ui_scenegraph[title_edge.scenegraph_id].size[1]
	local title_edge_animation_data = self._title_edge_animation_data or {}
	self._title_edge_animation_data = title_edge_animation_data
	title_edge_animation_data.duration = animation_duration
	title_edge_animation_data.total_duration = animation_duration
	title_edge_animation_data.target_length = target_length
	title_edge_animation_data.start_length = start_length
end

StoreWindowItemPreview._update_title_edge_animation = function (self, dt)
	local title_edge_animation_data = self._title_edge_animation_data

	if not title_edge_animation_data then
		return
	end

	local duration = title_edge_animation_data.duration

	if not duration then
		return
	end

	duration = math.max(duration - dt, 0)
	local start_length = title_edge_animation_data.start_length
	local target_length = title_edge_animation_data.target_length
	local total_duration = title_edge_animation_data.total_duration
	local easing = math.easeOutCubic
	local progress = 1 - duration / total_duration
	local anim_progress = easing(progress)
	local animation_length = (target_length - start_length) * anim_progress
	local current_length = start_length + animation_length
	local item_widgets_by_name = self._item_widgets_by_name
	local title_edge = item_widgets_by_name.title_edge
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph[title_edge.scenegraph_id].size[1] = current_length

	if duration == 0 then
		title_edge_animation_data.duration = nil
	else
		title_edge_animation_data.duration = duration
	end
end

StoreWindowItemPreview._update_unlock_button_width = function (self, width_offset, already_owned, dlc_name)
	local top_widgets_by_name = self._top_widgets_by_name
	local widget = top_widgets_by_name.unlock_button
	local content = widget.content
	local present_currency = content.present_currency
	local style = widget.style
	local side_padding = 65
	local frame_width = content.frame_width
	local title_text = (already_owned and Localize(content.owned_text)) or content.title_text
	local title_text_style = style.title_text
	local title_text_width = self:_get_text_width(title_text_style, title_text)

	if PLATFORM ~= "win32" and dlc_name and not already_owned then
		title_text_width = CONSOLE_PRICE_WIDTH
	end

	title_text_style.offset[1] = side_padding
	style.title_text_disabled.offset[1] = side_padding
	style.title_text_write_mask.offset[1] = side_padding
	style.title_text_shadow.offset[1] = side_padding + 2
	local currency_icon_style = style.currency_icon
	local currency_icon_disabled_style = style.currency_icon_disabled
	local currency_icon_width = (present_currency and not already_owned and currency_icon_style.texture_size[1]) or 0
	currency_icon_style.offset[1] = side_padding + title_text_width
	currency_icon_disabled_style.offset[1] = currency_icon_style.offset[1]
	local currency_text = (present_currency and not already_owned and "9999") or ""
	local currency_text_style = style.currency_text
	local currency_text_disabled_style = style.currency_text_disabled
	local currency_text_width = self:_get_text_width(currency_text_style, currency_text)
	currency_text_style.offset[1] = side_padding + title_text_width + currency_icon_width
	currency_text_disabled_style.offset[1] = currency_text_style.offset[1]
	style.currency_text_shadow.offset[1] = currency_text_style.offset[1] + 2
	local total_width = currency_icon_width + title_text_width + currency_text_width + side_padding * 2
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.unlock_button.size[1] = total_width
	content.size[1] = total_width - 20
	content.size[2] = 50
	style.glass_top.size[1] = total_width
	style.hover_glow.size[1] = total_width
	style.background_fade.size[1] = total_width - frame_width * 2
	style.title_text_gradient.texture_size[1] = total_width
	style.owned_overlay.texture_size[1] = total_width
	style.owned_text_gradient.texture_size[1] = total_width
	local owned_overlay_content = content.owned_overlay
	local owned_overlay_uvs = owned_overlay_content.uvs
	local owned_overlay_fraction = math.clamp(total_width / 684, 0, 1) * 0.5
	owned_overlay_uvs[1][1] = 0.5 - owned_overlay_fraction
	owned_overlay_uvs[2][1] = 0.5 + owned_overlay_fraction
	local owned_text = content.owned_text
	local owned_text_style = style.owned_text_write_mask
	local owned_text_length = self:_get_text_width(owned_text_style, owned_text)
	owned_text_style.offset[1] = style.owned_icon.texture_size[1] * 0.5
	style.owned_icon.offset[1] = -(owned_text_length * 0.5)
	style.owned_icon_bg.offset[1] = -(owned_text_length * 0.5)
	widget.offset[1] = width_offset or 0
end

StoreWindowItemPreview._get_text_width = function (self, text_style, text)
	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_renderer = self._ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)

	return text_width
end

StoreWindowItemPreview._initialize_dlc_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_window.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 220 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local dlc_scrollbar_logic = self._dlc_scrollbar_logic

	dlc_scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	dlc_scrollbar_logic:set_scroll_percentage(0)
end

StoreWindowItemPreview._update_dlc_scroll_position = function (self)
	local dlc_scrollbar_logic = self._dlc_scrollbar_logic
	local length = dlc_scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list.local_position[2] = length
		self._scrolled_length = length
		local sub_title_alpha_multiplier = 1 - math.min(length / 100, 1)

		self:_set_sub_title_alpha_multiplier(sub_title_alpha_multiplier)
	end
end

StoreWindowItemPreview._update_visible_list_entries = function (self)
	local dlc_scrollbar_logic = self._dlc_scrollbar_logic
	local enabled = dlc_scrollbar_logic:enabled()

	if not enabled then
		return true
	end

	local scroll_percentage = dlc_scrollbar_logic:get_scroll_percentage()
	local scrolled_length = dlc_scrollbar_logic:get_scrolled_length()
	local scroll_length = dlc_scrollbar_logic:get_scroll_length()
	local list_window_size = scenegraph_definition.list_window.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local widgets = self._dlc_list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
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

StoreWindowItemPreview._scroll_to_list_index = function (self, index)
	local dlc_scrollbar_logic = self._dlc_scrollbar_logic
	local enabled = dlc_scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = dlc_scrollbar_logic:get_scroll_percentage()
		local scrolled_length = dlc_scrollbar_logic:get_scrolled_length()
		local scroll_length = dlc_scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._dlc_list_widgets

		if list_widgets then
			local widget = list_widgets[index]
			local content = widget.content
			local offset = widget.offset
			local size = content.size
			local height = size[2]
			local start_position_top = math.abs(offset[2])
			local start_position_bottom = start_position_top + height
			local percentage_difference = nil

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				dlc_scrollbar_logic:set_scroll_percentage(scroll_percentage)
			end
		end
	end
end

StoreWindowItemPreview._get_scrollbar_percentage_by_index = function (self, index)
	local dlc_scrollbar_logic = self._dlc_scrollbar_logic
	local enabled = dlc_scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = dlc_scrollbar_logic:get_scroll_percentage()
		local scrolled_length = dlc_scrollbar_logic:get_scrolled_length()
		local scroll_length = dlc_scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_widgets = self._dlc_list_widgets

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

StoreWindowItemPreview._dlc_component_layout = function (self, layout)
	self:_destroy_dlc_product_widgets()

	local parent = self._parent
	local dlc_layout = {}

	for i = 1, #layout, 1 do
		local product_data = layout[i]
		local product_id = product_data.id
		local product_type = product_data.type
		local product = nil

		if product_type == "dlc" then
			local dlc_settings = self:_get_dlc_settings(product_id)

			if dlc_settings then
				product = {
					dlc_settings = dlc_settings,
					type = product_type,
					product_id = product_id
				}
			end
		elseif product_type == "item" then
			local item = self._parent:get_item_by_key(product_id)

			if item then
				product = {
					item = item,
					type = product_type,
					product_id = product_id
				}
			end
		else
			product = {
				type = product_type,
				settings = product_data.settings,
				product_id = product_id
			}
		end

		if product then
			dlc_layout[#dlc_layout + 1] = product
		end
	end

	self._dlc_layout = dlc_layout

	self:_create_dlc_product_widgets(dlc_layout)

	self._dlc_list_initialized = true
end

StoreWindowItemPreview._create_dlc_product_widgets = function (self, layout)
	local widgets = {}
	local parent = self._parent
	local scenegraph_id = "item_root"
	local masked = true

	for i, entry in ipairs(layout) do
		local widget = parent:create_item_widget(entry, scenegraph_id, masked)

		parent:populate_product_widget(widget, entry)

		widgets[i] = widget
	end

	self._dlc_list_widgets = widgets

	self:_align_dlc_widgets()
	self:_initialize_dlc_scrollbar()
end

StoreWindowItemPreview._destroy_dlc_product_widgets = function (self, force_unload)
	local parent = self._parent
	local layout = self._dlc_layout
	local widgets = self._dlc_list_widgets

	if widgets and layout then
		for i, entry in ipairs(layout) do
			local widget = widgets[i]

			parent:destroy_product_widget(widget, entry, force_unload)
		end
	end
end

StoreWindowItemPreview._align_dlc_widgets = function (self)
	local total_height = 0
	local widget_position_x = 0
	local widget_position_y = 0
	local row = 1
	local column = 1
	local previous_height = 0
	local row_heighest_height = 0
	local widgets = self._dlc_list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local width = size[1]
		local height = size[2]
		local change_row = LIST_MAX_WIDTH < widget_position_x + width

		if change_row then
			column = 1
			row = row + 1
			widget_position_x = 0
			widget_position_y = widget_position_y - (row_heighest_height + LIST_SPACING)
			row_heighest_height = 0
		end

		offset[1] = widget_position_x
		offset[2] = widget_position_y
		widget.default_offset = table.clone(offset)
		content.row = row
		content.column = column
		widget_position_x = widget_position_x + width + LIST_SPACING

		if index == num_widgets then
			total_height = math.abs(widget_position_y - height)
		end

		column = column + 1
		previous_height = height

		if row_heighest_height < height then
			row_heighest_height = height
		end
	end

	self._total_list_height = total_height
end

return
