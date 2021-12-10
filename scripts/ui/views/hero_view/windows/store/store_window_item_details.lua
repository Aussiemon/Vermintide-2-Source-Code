local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_item_details_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_career_icon = definitions.create_career_icon
StoreWindowItemDetails = class(StoreWindowItemDetails)
StoreWindowItemDetails.NAME = "StoreWindowItemDetails"

StoreWindowItemDetails.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowItemDetails")

	self._params = params
	self._parent = params.parent
	local ui_renderer, ui_top_renderer = self._parent:get_renderers()
	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
	self._parent:set_list_details_visibility(true)
	self._parent:set_list_details_length(680, 0.3)
	self._parent:change_generic_actions("default")
end

StoreWindowItemDetails._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StoreWindowItemDetails._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

StoreWindowItemDetails.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowItemDetails")

	self._ui_animator = nil
end

StoreWindowItemDetails.update = function (self, dt, t)
	self:_sync_presentation_item()
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowItemDetails.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StoreWindowItemDetails._update_animations = function (self, dt)
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
end

StoreWindowItemDetails._sync_presentation_item = function (self)
	local params = self._params
	local selected_product = params.selected_product

	if selected_product ~= self._selected_product then
		local reset_presentation = not self._selected_product or self._selected_product.product_id ~= selected_product.product_id
		self._selected_product = selected_product

		if reset_presentation then
			local product_type = selected_product.type

			if product_type == "item" then
				local item = selected_product.item

				self:_present_item(item)

				self._show_loading_overlay = true
			elseif product_type == "dlc" then
				local dlc_settings = selected_product.dlc_settings

				self:_present_dlc(dlc_settings)
			end
		end
	end
end

StoreWindowItemDetails._present_dlc = function (self, settings)
	local title_text = settings.name
	local description_text = settings.information_text
	local sub_title_text = "dlc1_2_dlc_level_locked_tooltip"

	self:_set_title_text(Localize(title_text))
	self:_set_sub_title_text(Localize(sub_title_text))
	self:_set_description_text(Localize(description_text))
end

StoreWindowItemDetails._present_item = function (self, item)
	local item_data = item.data
	local item_key = item_data.key
	local item_rarity = item_data.rarity
	local item_type = item_data.item_type
	local can_wield = item_data.can_wield
	local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)
	local profile = SPProfiles[profile_index]
	local hero_display_name = profile.character_name
	local sub_title_text = ""

	if item_type == "weapon_skin" then
		sub_title_text = Localize(item_data.matching_item_key)
	else
		sub_title_text = Localize(item_type)
	end

	local inventory_icon, display_name, description = UIUtils.get_ui_information_from_item(item)
	local title_text_color = Colors.get_color_table_with_alpha(item_rarity, 255)

	self:_setup_career_icons(can_wield)
	self:_set_title_text(Localize(display_name))
	self:_set_title_text_color(title_text_color)
	self:_set_hero_text(Localize(hero_display_name))
	self:_set_sub_title_text(sub_title_text)
	self:_set_description_text(Localize(description))
	self:_set_item_icon(inventory_icon)
end

StoreWindowItemDetails._get_hero_wield_info_by_item = function (self, item)
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

StoreWindowItemDetails._setup_career_icons = function (self, careers)
	local scenegraph_id = "career_icons"
	local widget_definition = create_career_icon(scenegraph_id)
	local career_icon_widgets = {}

	if careers then
		local amount = #careers
		local step_size = 60
		local total_length = step_size * amount
		local offset_x = -(total_length / 2 + step_size / 2)

		for i = 1, amount, 1 do
			local career_name = careers[i]
			local settings = CareerSettings[career_name]
			local display_name = settings.display_name
			offset_x = offset_x + step_size
			local widget = UIWidget.init(widget_definition)
			widget.offset[1] = offset_x
			local tooltip_data = widget.content.tooltip
			tooltip_data.title = Localize(display_name)
			tooltip_data.description = Localize("menu_store_product_wieldable_tooltip_desc")
			widget.content.icon = settings.store_tag_icon or "store_tag_icon_" .. career_name
			career_icon_widgets[i] = widget
		end
	end

	self._career_icon_widgets = career_icon_widgets
end

StoreWindowItemDetails._set_item_icon = function (self, texture)
	local widget = self._widgets_by_name.item_icon
	widget.content.texture_id = texture
end

StoreWindowItemDetails._set_title_text_color = function (self, text_color)
	local widget = self._widgets_by_name.title_text
	widget.style.text.text_color = text_color
end

StoreWindowItemDetails._set_title_text = function (self, text)
	local widget = self._widgets_by_name.title_text
	widget.content.text = text
	local scenegraph_id = widget.scenegraph_id
	local default_scenegraph = scenegraph_definition[scenegraph_id]
	local default_size = default_scenegraph.size
	local ui_top_renderer = self._ui_top_renderer
	local text_style = widget.style.text
	local height = UIUtils.get_text_height(ui_top_renderer, default_size, text_style, text)
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph[scenegraph_id].size[2] = height
	ui_scenegraph.description_text.size[2] = 250 - height
end

StoreWindowItemDetails._set_hero_text = function (self, text)
	local widget = self._widgets_by_name.hero_text
	widget.content.text = text
end

StoreWindowItemDetails._set_sub_title_text = function (self, text)
	local widget = self._widgets_by_name.sub_title_text
	widget.content.text = text
	local ui_top_renderer = self._ui_top_renderer
	local text_style = widget.style.text
	local length = UIUtils.get_text_width(ui_top_renderer, text_style, text)
	local scenegraph_id = widget.scenegraph_id
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph[scenegraph_id].size[1] = length + 20
end

StoreWindowItemDetails._set_description_text = function (self, text)
	local widget = self._widgets_by_name.description_text
	widget.content.text = text
end

StoreWindowItemDetails._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowItemDetails._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end
end

StoreWindowItemDetails._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StoreWindowItemDetails._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StoreWindowItemDetails._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StoreWindowItemDetails._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()
end

StoreWindowItemDetails._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local career_icon_widgets = self._career_icon_widgets

	if career_icon_widgets then
		for _, widget in ipairs(career_icon_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StoreWindowItemDetails._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowItemDetails._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self._gamepad_active_last_frame == nil

	if gamepad_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false
	end
end

return
