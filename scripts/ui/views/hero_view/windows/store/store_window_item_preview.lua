require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_item_preview_definitions")
local dlc_top_widget_definitions = definitions.dlc_top_widgets
local dlc_bottom_widget_definitions = definitions.dlc_bottom_widgets
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local loading_widget_definitions = definitions.loading_widgets
local create_dlc_entry_definition = definitions.create_dlc_entry_definition
local DO_RELOAD = false
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
StoreWindowItemPreview = class(StoreWindowItemPreview)
StoreWindowItemPreview.NAME = "StoreWindowItemPreview"

local function get_text_height(ui_renderer, size, ui_style, ui_content, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = ui_style.font_size or font_size
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = ui_content.text_start_index or 1
	local max_texts = ui_content.max_texts or #texts
	local num_texts = math.min(#texts - (text_start_index - 1), max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale * num_texts

	return full_font_height, num_texts
end

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
	self._cloned_materials_by_reference = {}
	self._loaded_package_names = {}
	self._animations = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")

	local title_edge_length = scenegraph_definition.title_text.size[1] + 50

	self:_set_title_edge_length(title_edge_length, 0.01)
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

	self._expanded = expand
end

StoreWindowItemPreview._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = self._top_widgets_by_name
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StoreWindowItemPreview._create_viewport_definition = function (self)
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
				shading_environment = "environment/blank_offscreen_chest_item",
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

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._viewport_widget_definition = self:_create_viewport_definition()
	self._dlc_top_widgets_by_name.video_fullscreen_fade.content.visible = false
end

StoreWindowItemPreview.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowItemPreview")

	self.ui_animator = nil
	self._has_exited = true

	if self._package_reference_name then
		self:_reset_cloned_materials()
		self:_unload_package_by_reference(self._package_reference_name)

		self._package_reference_name = nil
	end

	self:_destroy_video_player()
	self:_destroy_previewers()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end
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

		self:_handle_input(input_service, dt, t)

		if self._dlc_presentation_active then
			self:_update_dlc_entries_mouse_scroll_input()
			self:_update_dlc_lore_mouse_scroll_input()
		end

		if self._world_previewer then
			self._world_previewer:update(dt, t)
		end

		if self._item_previewer then
			self._item_previewer:update(dt, t)
		end
	end
end

StoreWindowItemPreview._get_layout_settings_by_name = function (self, name)
	local layout_settings = self._layout_settings
	local window_layouts = layout_settings.window_layouts

	for _, settings in ipairs(window_layouts) do
		if settings.name == name then
			return settings
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
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local top_widgets_by_name = self._top_widgets_by_name
	local unlock_button = top_widgets_by_name.unlock_button

	UIWidgetUtils.animate_default_button(unlock_button, dt)

	if self._dlc_presentation_active then
		self:_animate_dlc_video_button(dt)
	else
		self:_animate_detail_button(dt)
	end

	self:_update_title_edge_animation(dt)
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

StoreWindowItemPreview._handle_input = function (self, input_service, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local top_widgets_by_name = self._top_widgets_by_name
	local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
	local unlock_button = top_widgets_by_name.unlock_button
	local details_button = top_widgets_by_name.details_button
	local video_button = dlc_top_widgets_by_name.video_button

	if self:_is_button_hovered(unlock_button) or self:_is_button_hovered(unlock_button) or self:_is_button_hovered(video_button) then
		self:_play_sound("Play_hud_hover")
	end

	if self._dlc_presentation_active then
		if self._draw_fullscreen_video then
			if Managers.input:any_input_released() then
				self:_stop_fullscreen_video()
			end
		elseif self:_is_button_pressed(video_button) then
			self:_start_fullscreen_video()
		end
	end

	if self:_is_button_pressed(unlock_button) then
		self:_play_sound("Play_hud_store_buy_window")

		local selected_product = self._selected_product
		local product_type = selected_product.type

		if product_type == "item" then
			parent:product_purchase_request(selected_product)
		end
	end

	if self:_is_button_pressed(details_button) then
		details_button.content.button_hotspot.is_selected = not details_button.content.button_hotspot.is_selected

		self:_play_sound("Play_hud_select")

		local path = parent:get_store_path()
		local new_path = table.clone(path)

		if path[#path] == "item_details" then
			new_path[#new_path] = nil
		else
			new_path[#new_path + 1] = "item_details"
		end

		parent:go_to_store_path(new_path)
	end
end

StoreWindowItemPreview._start_fullscreen_video = function (self)
	local ui_top_renderer = self._ui_top_renderer
	local video_player = ui_top_renderer.video_player

	VideoPlayer.reset(video_player)

	self._draw_fullscreen_video = true

	self._parent:block_input()
	self:_play_sound("Stop_hud_store_ambience")
	self:_play_sound(self._video_sound_event)

	local scenegraph_id = "video_fullscreen"
	self._video_widget.scenegraph_id = scenegraph_id
	self._dlc_top_widgets_by_name.video_fullscreen_fade.content.visible = true
	self._dlc_top_widgets_by_name.video_fullscreen_fade.content.progress = 0
end

StoreWindowItemPreview._stop_fullscreen_video = function (self)
	self._draw_fullscreen_video = false

	self._parent:unblock_input()
	self:_play_sound("Stop_hud_menu_area_music")
	self:_play_sound("Play_hud_store_ambience")

	local scenegraph_id = "video"
	self._video_widget.scenegraph_id = scenegraph_id
	self._dlc_top_widgets_by_name.video_fullscreen_fade.content.visible = false
end

StoreWindowItemPreview._exit = function (self)
	self.exit = true
end

StoreWindowItemPreview.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	if self._dlc_presentation_active then
		for _, widget in ipairs(self._dlc_top_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		if not self._draw_video_next_frame then
			if not self._has_exited then
				if self._video_created then
					self._video_created = nil
				elseif self._video_widget then
					UIRenderer.draw_widget(ui_top_renderer, self._video_widget)
				end
			end
		elseif self._draw_video_next_frame then
			self._draw_video_next_frame = nil
		end
	end

	for _, widget in ipairs(self._top_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._show_loading_overlay then
		for _, widget in ipairs(self._loading_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)

		if self._dlc_presentation_active then
			if self._dlc_entry_widgets then
				for _, widget in ipairs(self._dlc_entry_widgets) do
					UIRenderer.draw_widget(ui_renderer, widget)
				end
			end

			for _, widget in ipairs(self._dlc_bottom_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end

		for _, widget in ipairs(self._bottom_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.end_pass(ui_renderer)
	end
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
		local product_id = selected_product.product_id
		local product_type = selected_product.type

		if product_type == "item" then
			local item = selected_product.item
			local backend_items = Managers.backend:get_interface("items")
			local item_key = item.key
			already_owned = backend_items:has_item(item_key)
		elseif product_type == "dlc" then
			local dlc_settings = selected_product.dlc_settings
			local dlc_name = dlc_settings.dlc_name
			already_owned = Managers.unlock:is_dlc_unlocked(dlc_name)
		end

		self:_set_unlock_button_enabled(not already_owned)

		if reset_presentation then
			if self._package_reference_name then
				self:_reset_cloned_materials()
				self:_unload_package_by_reference(self._package_reference_name)

				self._package_reference_name = nil
			end

			self._delayed_item_unit_presentation_delay = nil

			self:_destroy_previewers()

			if product_type == "item" then
				local item = selected_product.item

				self:_start_loading_overlay()
				self:_present_item(item)
			elseif product_type == "dlc" then
				self._show_loading_overlay = false
				local dlc_settings = selected_product.dlc_settings

				self:_present_dlc(dlc_settings, product_id)
			end

			self:_update_unlock_button_width()
		end
	end
end

StoreWindowItemPreview._present_dlc = function (self, settings, product_id)
	local video_settings = settings.video_settings
	local material_name = video_settings.material_name
	local resource = video_settings.resource

	self:_setup_video_player(material_name, resource)

	self._video_sound_event = video_settings.sound_event
	local title_text = settings.name
	local sub_title_text = "dlc1_2_dlc_level_locked_tooltip"

	self:_set_title_name(Localize(title_text))
	self:_set_sub_title_name(Localize(sub_title_text))

	local store_slates = settings.store_slates
	local package_name = settings.store_texture_package
	local package_available = Application.can_get("package", package_name)

	if package_available then
		local reference_name = "StoreWindowItemPreview_" .. product_id

		local function callback()
			self:_apply_slate_material_diffuses()
		end

		self:_setup_dlc_entries(store_slates)
		self:_load_texture_package(package_name, reference_name, callback)

		self._package_reference_name = reference_name
	else
		Application.warning("DLC icon package not accessable for product_id: (%s) and package_name: (%s)", product_id, package_name)
	end

	self:_setup_dlc_lore_text()

	self._dlc_presentation_active = true
	self._top_widgets_by_name.details_button.content.visible = false
	self._top_widgets_by_name.details_disabled.content.visible = true
end

StoreWindowItemPreview._present_item = function (self, item)
	if not self._detail_button_hidden then
		self._top_widgets_by_name.details_button.content.visible = true
	end

	self._top_widgets_by_name.details_disabled.content.visible = false
	self._dlc_presentation_active = false
	local item_data = item.data
	local item_type = item_data.item_type
	local slot_type = item_data.slot_type
	local currency_type = "SM"
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local price = current_prices[currency_type] or regular_prices[currency_type]

	self:_set_price(price)

	local sub_title_text = ""

	if slot_type ~= "melee" and slot_type ~= "ranged" then
		if slot_type == "weapon_skin" then
		elseif slot_type == "hat" then
			local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)
			local profile = SPProfiles[profile_index]
			local hero_display_name = profile.character_name
			local career_settings = CareerSettings[career_name]
			local career_display_name = career_settings.display_name
			sub_title_text = Localize(hero_display_name) .. " / " .. Localize(career_display_name) .. " / " .. Localize(item_type)
		elseif slot_type == "skin" then
			local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(item)
			local profile = SPProfiles[profile_index]
			local hero_display_name = profile.character_name
			local career_settings = CareerSettings[career_name]
			local career_display_name = career_settings.display_name
			sub_title_text = Localize(hero_display_name) .. " / " .. Localize(career_display_name) .. " / " .. Localize(item_type)
		end
	end

	local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

	self:_set_title_name(Localize(display_name))
	self:_set_sub_title_name(sub_title_text)

	self._delayed_item_unit_presentation_delay = 0.3
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
		local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport)
		local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key)

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

StoreWindowItemPreview._set_price = function (self, price)
	local widget = self._top_widgets_by_name.unlock_button
	widget.content.currency_text = tostring(price)
end

StoreWindowItemPreview._set_unlock_button_enabled = function (self, enabled)
	local widget = self._top_widgets_by_name.unlock_button
	widget.content.button_hotspot.disable_button = not enabled
end

StoreWindowItemPreview._set_title_name = function (self, text)
	local widget = self._top_widgets_by_name.title_text
	widget.content.text = text
end

StoreWindowItemPreview._set_sub_title_name = function (self, text)
	local widget = self._top_widgets_by_name.sub_title_text
	widget.content.text = text
end

StoreWindowItemPreview.cb_unit_spawned_item_preview = function (self, item_previewer, item_key)
	item_previewer:present_item(item_key)

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
		for _, item_name in ipairs(preview_items) do
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
		for _, item_name in ipairs(preview_items) do
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

StoreWindowItemPreview._setup_video_player = function (self, material_name, resource)
	self:_destroy_video_player()

	local ui_top_renderer = self._ui_top_renderer

	if not ui_top_renderer.video_player then
		local set_loop = true
		local world = ui_top_renderer.world

		UIRenderer.create_video_player(ui_top_renderer, ui_top_renderer.world, resource, set_loop)
	end

	local scenegraph_id = "video"
	local widget_definition = UIWidgets.create_video(scenegraph_id, material_name)
	local video_widget = UIWidget.init(widget_definition)
	self._video_widget = video_widget
	self._video_created = true
	self._draw_video_next_frame = true
end

StoreWindowItemPreview._destroy_video_player = function (self)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local video_widget = self._video_widget

	if video_widget then
		UIWidget.destroy(ui_top_renderer, video_widget)

		self._video_widget = nil
	end

	if ui_top_renderer and ui_top_renderer.video_player then
		local world = ui_top_renderer.world

		UIRenderer.destroy_video_player(ui_top_renderer, world)
	end

	self._video_created = nil
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
	local top_widgets_by_name = self._top_widgets_by_name
	top_widgets_by_name.details_button.content.visible = false
	top_widgets_by_name.details_button_bg.content.visible = false
	top_widgets_by_name.title_edge_detail.content.visible = false
	top_widgets_by_name.title_edge.content.visible = false
	self._detail_button_hidden = true
end

StoreWindowItemPreview._setup_dlc_entries = function (self, slates)
	local dlc_entry_widgets = {}
	local total_length = 0
	local entry_scenegraph_id = "dlc_entry_root"
	local entry_size = scenegraph_definition[entry_scenegraph_id].size

	for index, slate in ipairs(slates) do
		local title_text = Localize(slate.title_text)
		local description_text = Localize(slate.description_text)
		local texture_path = slate.texture_path
		local widget = self:_create_dlc_entry(index, title_text, description_text, texture_path)
		dlc_entry_widgets[index] = widget
		local offset = widget.offset
		offset[1] = total_length
		total_length = total_length + entry_size[1]
	end

	local dlc_entry_mask_width = scenegraph_definition.dlc_entry_mask.size[1]
	self._dlc_entry_widgets = dlc_entry_widgets
	self._dlc_entries_scroll_length = math.max(total_length - dlc_entry_mask_width, 0)
	self._dlc_entries_scroll_value = 0
	local scroll_step_multiplier = 1
	local entry_width = entry_size[1]
	local scroll_amount = math.max(entry_width / self._dlc_entries_scroll_length, 0) * scroll_step_multiplier
	local dlc_bottom_widgets_by_name = self._dlc_bottom_widgets_by_name
	local scroll_widget = dlc_bottom_widgets_by_name.dlc_entry_scroll
	scroll_widget.content.scrollbar.scroll_amount = scroll_amount
	local entry_scrollbar = dlc_bottom_widgets_by_name.entry_scrollbar
	local percentage = math.min(dlc_entry_mask_width / total_length, 1)
	entry_scrollbar.content.scroll_bar_info.bar_length_percentage = percentage
	self._dlc_entries_scroll_value = 0
end

StoreWindowItemPreview._setup_dlc_lore_text = function (self)
	local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
	local lore_description_widget = dlc_top_widgets_by_name.dlc_lore_description
	local lore_description_scenegraph_id = lore_description_widget.scenegraph_id
	local lore_description_area_size = scenegraph_definition[lore_description_scenegraph_id].size
	local text_style = lore_description_widget.style.text
	local text_content = lore_description_widget.content
	local test_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	local lore_description_height = get_text_height(self._ui_renderer, lore_description_area_size, text_style, text_content, test_text)
	local total_lore_text_height = lore_description_height + 40
	local dlc_lore_mask_height = scenegraph_definition.video_window.size[2]
	local default_lore_text_height = scenegraph_definition.video.size[2]
	self._dlc_lore_scroll_height = math.max(total_lore_text_height - default_lore_text_height, 0)
	self._dlc_entries_scroll_value = 0
	local scroll_step_multiplier = 1
	local entry_width = 40
	local scroll_amount = math.max(entry_width / self._dlc_lore_scroll_height, 0) * scroll_step_multiplier
	local scroll_widget = dlc_top_widgets_by_name.dlc_lore_scroll
	scroll_widget.content.scrollbar.scroll_amount = scroll_amount
	local lore_scrollbar = dlc_top_widgets_by_name.lore_scrollbar
	local percentage = math.min(dlc_lore_mask_height / total_lore_text_height, 1)
	lore_scrollbar.content.scroll_bar_info.bar_height_percentage = percentage
end

StoreWindowItemPreview._create_dlc_entry = function (self, index, title, description, texture_path)
	local scenegraph_id = "dlc_entry_root"
	local size = scenegraph_definition[scenegraph_id].size
	local definition = create_dlc_entry_definition(scenegraph_id, size)
	local widget = UIWidget.init(definition)
	local style = widget.style
	local content = widget.content
	content.title_text = title
	content.description_text = description
	local masked = style.background.masked
	self._reference_id = (self._reference_id or 0) + 1
	local reference_name = "slate_entry_" .. self._reference_id
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
	local new_material_name = "slate_entry_" .. index
	local template_material_name = (masked and "template_store_diffuse_masked") or "template_store_diffuse"

	self:_create_material_instance(gui, new_material_name, template_material_name, reference_name)

	content.background = new_material_name
	content.texture_path = texture_path
	self._sync_slate_material_diffuses = true

	return widget
end

StoreWindowItemPreview._apply_slate_material_diffuses = function (self)
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
	local dlc_entry_widgets = self._dlc_entry_widgets

	for index, widget in ipairs(dlc_entry_widgets) do
		local content = widget.content
		local material_name = content.background
		local texture_path = content.texture_path

		self:_set_material_diffuse(gui, material_name, texture_path)
	end
end

StoreWindowItemPreview._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[StoreWindowItemPreview] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

StoreWindowItemPreview._reset_cloned_materials = function (self)
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	for reference_name, material_name in pairs(cloned_materials_by_reference) do
		if self:_is_unique_reference_to_material(reference_name) then
			self:_set_material_diffuse(gui, material_name, PRODUCT_PLACEHOLDER_TEXTURE_PATH)
		end

		cloned_materials_by_reference[reference_name] = nil
	end
end

StoreWindowItemPreview._unload_package_by_reference = function (self, reference_name)
	local loaded_package_names = self._loaded_package_names
	local package_name = loaded_package_names[reference_name]

	fassert(package_name, "[StoreWindowItemPreview] - Could not find a package to unload for reference name: (%s)", reference_name)
	Managers.package:unload(package_name, reference_name)

	loaded_package_names[reference_name] = nil
end

StoreWindowItemPreview._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

StoreWindowItemPreview._set_material_diffuse = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

StoreWindowItemPreview._load_texture_package = function (self, package_name, reference_name, callback)
	Managers.package:load(package_name, reference_name, callback, true)

	local loaded_package_names = self._loaded_package_names
	loaded_package_names[reference_name] = package_name
end

StoreWindowItemPreview._update_dlc_entries_mouse_scroll_input = function (self)
	if not self._dlc_entry_widgets then
		return
	end

	local using_scrollbar = true

	if using_scrollbar then
		local dlc_bottom_widgets_by_name = self._dlc_bottom_widgets_by_name
		local widget = dlc_bottom_widgets_by_name.dlc_entry_scroll
		local scrollbar = dlc_bottom_widgets_by_name.entry_scrollbar
		local scroll_bar_info = scrollbar.content.scroll_bar_info

		if scroll_bar_info.on_pressed then
			widget.content.scrollbar.scroll_add = nil
		end

		local mouse_scroll_value = widget.content.scrollbar.scroll_value

		if not mouse_scroll_value then
			return
		end

		local scroll_bar_value = scroll_bar_info.value
		local current_scroll_value = self._dlc_entries_scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self:_set_dlc_entries_scrollbar_value(mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self:_set_dlc_entries_scrollbar_value(scroll_bar_value)
		end
	end
end

StoreWindowItemPreview._set_dlc_entries_scrollbar_value = function (self, value)
	if not self._dlc_entry_widgets then
		return
	end

	local current_scroll_value = self._dlc_entries_scroll_value

	if value then
		local dlc_bottom_widgets_by_name = self._dlc_bottom_widgets_by_name
		local widget = dlc_bottom_widgets_by_name.entry_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		dlc_bottom_widgets_by_name.dlc_entry_scroll.content.scrollbar.scroll_value = value
		self._ui_scenegraph.dlc_entry_root.local_position[1] = -(self._dlc_entries_scroll_length * value)
		self._dlc_entries_scroll_value = value
	end
end

StoreWindowItemPreview._update_dlc_lore_mouse_scroll_input = function (self)
	local using_scrollbar = true

	if using_scrollbar then
		local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
		local widget = dlc_top_widgets_by_name.dlc_lore_scroll
		local scrollbar = dlc_top_widgets_by_name.lore_scrollbar
		local scroll_bar_info = scrollbar.content.scroll_bar_info

		if scroll_bar_info.on_pressed then
			widget.content.scrollbar.scroll_add = nil
		end

		local mouse_scroll_value = widget.content.scrollbar.scroll_value

		if not mouse_scroll_value then
			return
		end

		local scroll_bar_value = scroll_bar_info.value
		local current_scroll_value = self._dlc_lore_scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self:_set_dlc_lore_scrollbar_value(mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self:_set_dlc_lore_scrollbar_value(scroll_bar_value)
		end
	end
end

StoreWindowItemPreview._set_dlc_lore_scrollbar_value = function (self, value)
	local current_scroll_value = self._dlc_lore_scroll_value

	if value then
		local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
		local widget = dlc_top_widgets_by_name.lore_scrollbar
		local widget_scroll_bar_info = widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		dlc_top_widgets_by_name.dlc_lore_scroll.content.scrollbar.scroll_value = value
		self._ui_scenegraph.dlc_lore_root.local_position[2] = self._dlc_lore_scroll_height * value
		self._dlc_lore_scroll_value = value
	end
end

StoreWindowItemPreview._animate_dlc_video_button = function (self, dt)
	local dlc_top_widgets_by_name = self._dlc_top_widgets_by_name
	local widget = dlc_top_widgets_by_name.video_button
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
	local icon_style = style.icon
	local icon_color = icon_style.color
	icon_color[2] = 200 + 55 * hover_progress
	icon_color[3] = 200 + 55 * hover_progress
	icon_color[4] = 200 + 55 * hover_progress
	style.background.color[1] = 100 - 100 * hover_progress
	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

StoreWindowItemPreview._animate_detail_button = function (self, dt)
	local top_widgets_by_name = self._top_widgets_by_name
	local widget = top_widgets_by_name.details_button
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
	local top_widgets_by_name = self._top_widgets_by_name
	local title_edge_detail = top_widgets_by_name.title_edge_detail
	local title_edge_detail_size = scenegraph_definition[title_edge_detail.scenegraph_id].size
	local target_length = math.max(length - title_edge_detail_size[1], 0)
	local title_edge = top_widgets_by_name.title_edge
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
	local top_widgets_by_name = self._top_widgets_by_name
	local title_edge = top_widgets_by_name.title_edge
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph[title_edge.scenegraph_id].size[1] = current_length

	if duration == 0 then
		title_edge_animation_data.duration = nil
	else
		title_edge_animation_data.duration = duration
	end
end

StoreWindowItemPreview._update_unlock_button_width = function (self)
	local top_widgets_by_name = self._top_widgets_by_name
	local widget = top_widgets_by_name.unlock_button
	local content = widget.content
	local style = widget.style
	local side_padding = 65
	local frame_width = content.frame_width
	local title_text = content.title_text
	local title_text_style = style.title_text
	local title_text_width = self:_get_text_width(title_text_style, title_text)
	title_text_style.offset[1] = side_padding
	style.title_text_disabled.offset[1] = side_padding
	style.title_text_write_mask.offset[1] = side_padding
	style.title_text_shadow.offset[1] = side_padding + 2
	local currency_icon_style = style.currency_icon
	local currency_icon_width = currency_icon_style.texture_size[1]
	currency_icon_style.offset[1] = side_padding + title_text_width
	local currency_text = "9999"
	local currency_text_style = style.currency_text
	local currency_text_width = self:_get_text_width(currency_text_style, currency_text)
	currency_text_style.offset[1] = side_padding + title_text_width + currency_icon_width
	style.currency_text_shadow.offset[1] = currency_text_style.offset[1] + 2
	local total_width = currency_icon_width + title_text_width + currency_text_width + side_padding * 2
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.unlock_button.size[1] = total_width
	style.glass_top.size[1] = total_width
	style.hover_glow.size[1] = total_width
	style.background_fade.size[1] = total_width - frame_width * 2
	style.title_text_gradient.texture_size[1] = total_width
	style.disabled_overlay.texture_size[1] = total_width
	style.owned_text_gradient.texture_size[1] = total_width
	local disabled_overlay_content = content.disabled_overlay
	local disabled_overlay_uvs = disabled_overlay_content.uvs
	local disabled_overlay_fraction = math.clamp(total_width / 684, 0, 1) * 0.5
	disabled_overlay_uvs[1][1] = 0.5 - disabled_overlay_fraction
	disabled_overlay_uvs[2][1] = 0.5 + disabled_overlay_fraction
	local owned_text = content.owned_text
	local owned_text_style = style.owned_text_write_mask
	local owned_text_length = self:_get_text_width(owned_text_style, owned_text)
	owned_text_style.offset[1] = style.owned_icon.texture_size[1] * 0.5
	style.owned_icon.offset[1] = -(owned_text_length * 0.5)
	style.owned_icon_bg.offset[1] = -(owned_text_length * 0.5)
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

return
