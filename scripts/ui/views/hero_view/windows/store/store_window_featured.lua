local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_featured_definitions")
local widget_definitions = definitions.widgets
local content_widget_definitions = definitions.content_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local SLIDESHOW_WAIT_TIME = 8
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
StoreWindowFeatured = class(StoreWindowFeatured)
StoreWindowFeatured.NAME = "StoreWindowFeatured"

StoreWindowFeatured.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowFeatured")

	self._params = params
	self._parent = params.parent
	local ui_renderer, ui_top_renderer = self._parent:get_renderers()
	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		alpha_multiplier = 0,
		content_alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)

	self._cloned_materials_by_reference = {}
	self._material_references_to_unload = {}
	self._is_open = true
	local parent = self._parent
	local path = parent:get_store_path()
	local path_structure = StoreLayoutConfig.structure
	local pages = StoreLayoutConfig.pages
	local current_page = pages[path[#path]]
	local slideshow_content = current_page.slideshow and table.clone(current_page.slideshow)
	local grid_content = current_page.grid and table.clone(current_page.grid)

	if slideshow_content and #slideshow_content == 0 then
		slideshow_content = self:_get_default_featured_slideshow_content()
	end

	if grid_content and #grid_content == 0 then
		grid_content = self:_get_default_featured_grid_content()
	end

	local content_widgets_by_name = self._content_widgets_by_name

	self:_setup_slideshow(content_widgets_by_name.slideshow, slideshow_content)
	self:_setup_grid_products(grid_content)
	self:_start_transition_animation("on_enter")
	self._parent:set_list_details_visibility(false)
	Managers.telemetry.events:store_breadcrumbs_changed({
		{
			content = {
				page_name = "featured",
				text = "Featured"
			}
		}
	})
end

StoreWindowFeatured._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {
		widgets_by_name = self._widgets_by_name,
		grid_widgets = self._grid_widgets
	}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StoreWindowFeatured._create_ui_elements = function (self, params, offset)
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
	local content_widgets = {}
	local content_widgets_by_name = {}

	for name, widget_definition in pairs(content_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		content_widgets[#content_widgets + 1] = widget
		content_widgets_by_name[name] = widget
	end

	self._content_widgets = content_widgets
	self._content_widgets_by_name = content_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

StoreWindowFeatured.on_exit = function (self, params, force_unload)
	print("[HeroViewWindow] Exit Substate StoreWindowFeatured")

	self._ui_animator = nil
	self._is_open = false

	self:_reset_cloned_materials()
	self:_destroy_product_widgets(force_unload)
end

StoreWindowFeatured.update = function (self, dt, t)
	self:_handle_gamepad_activity()
	self:_update_animations(dt)
	self:_draw(dt)
end

StoreWindowFeatured.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

StoreWindowFeatured._update_animations = function (self, dt)
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

StoreWindowFeatured._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

StoreWindowFeatured._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowFeatured._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StoreWindowFeatured._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

StoreWindowFeatured._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

StoreWindowFeatured._handle_input = function (self, dt, t)
	local parent = self._parent
	local content_widgets_by_name = self._content_widgets_by_name
	local slideshow_widget = content_widgets_by_name.slideshow
	local input_service = parent:window_input_service()
	local list_index = self:_list_index_pressed()

	if list_index then
		self:_play_sound("Play_hud_store_button_select")
		self:_on_list_index_pressed(list_index)
	end

	if self._gamepad_active_last_frame then
		local confirm_press = input_service:get("confirm_press")

		if self._slideshow_selected then
			if confirm_press then
				self:_on_slideshow_pressed(slideshow_widget)
			elseif input_service:get("move_right_hold_continuous") then
				self:_select_slideshow_widget(false)
				self:_on_list_index_selected(1)
			end
		elseif confirm_press then
			self:_on_list_index_pressed(self._selected_gamepad_grid_index)
		else
			self:_handle_gamepad_grid_selection(input_service)
		end
	end

	self:_handle_slideshow_logic(slideshow_widget, dt)
	self:_animate_grid_entries(dt)
end

StoreWindowFeatured._draw = function (self, dt)
	local parent = self._parent
	local ui_top_renderer = self._ui_top_renderer
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 0
	local content_alpha_multiplier = render_settings.content_alpha_multiplier or 0

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.alpha_multiplier = math.min(content_alpha_multiplier or alpha_multiplier)

	for _, widget in ipairs(self._content_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local grid_widgets = self._grid_widgets

	if grid_widgets then
		for _, widget in ipairs(grid_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

StoreWindowFeatured._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowFeatured._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self._gamepad_active_last_frame == nil

	if gamepad_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true

			if not self._selected_gamepad_grid_index then
				self:_select_slideshow_widget(true)
			end
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false

		self:_select_slideshow_widget(false)
		self:_on_list_index_selected(nil)
	end
end

StoreWindowFeatured._list_index_pressed = function (self)
	local grid_widgets = self._grid_widgets

	if grid_widgets then
		for index, widget in ipairs(grid_widgets) do
			local content = widget.content
			local hotspot = content.hotspot or content.button_hotspot

			if hotspot and hotspot.on_release then
				hotspot.on_release = false

				return index
			end
		end
	end
end

StoreWindowFeatured._animate_grid_entries = function (self, dt)
	local parent = self._parent
	local grid_widgets = self._grid_widgets

	for _, widget in ipairs(grid_widgets) do
		local content = widget.content
		local style = widget.style
		local hotspot = content.button_hotspot or content.hotspot

		if hotspot.on_hover_enter then
			self:_play_sound("Play_hud_store_button_hover")

			hotspot.on_hover_enter = false
		end

		parent:animate_store_product(widget, dt)
	end
end

StoreWindowFeatured._create_product_widgets = function (self, layout)
	local widgets = {}
	local parent = self._parent
	local scenegraph_id = "item_root"
	local masked = false

	for i, entry in ipairs(layout) do
		local widget = parent:create_item_widget(entry, scenegraph_id, masked)

		parent:populate_product_widget(widget, entry)

		widgets[i] = widget
	end

	self._grid_widgets = widgets

	self:_align_grid_widgets()
end

StoreWindowFeatured._destroy_product_widgets = function (self, force_unload)
	local parent = self._parent
	local layout = self._layout
	local widgets = self._grid_widgets

	for i, entry in ipairs(layout) do
		local widget = widgets[i]

		parent:destroy_product_widget(widget, entry, force_unload)
	end
end

StoreWindowFeatured._align_grid_widgets = function (self)
	local max_width = 800
	local spacing = 10
	local total_height = 0
	local widget_position_x = 0
	local widget_position_y = 0
	local row = 1
	local column = 1
	local gamepad_navigation = {}
	local widgets = self._grid_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local width = size[1]
		local height = size[2]
		local change_row = max_width < widget_position_x + width

		if change_row then
			column = 1
			row = row + 1
			widget_position_x = 0
			widget_position_y = widget_position_y - (height + spacing)
		end

		offset[1] = widget_position_x
		offset[2] = widget_position_y
		content.row = row
		content.column = column
		widget_position_x = widget_position_x + width + spacing

		if index == num_widgets then
			total_height = math.abs(widget_position_y - height)
		end

		if not gamepad_navigation[row] then
			gamepad_navigation[row] = {}
		end

		gamepad_navigation[row][column] = index
		column = column + 1
	end

	self._gamepad_navigation = gamepad_navigation
	self._total_list_height = total_height
end

StoreWindowFeatured._get_default_featured_slideshow_content = function (self)
	local default_slideshow_content = {}

	for index, dlc_settings in ipairs(StoreDlcSettings) do
		if PLATFORM == "win32" or not dlc_settings.disable_on_consoles then
			default_slideshow_content[#default_slideshow_content + 1] = {
				product_type = "dlc",
				texture = dlc_settings.slideshow_texture,
				description = dlc_settings.slideshow_text,
				header = dlc_settings.name,
				product_id = dlc_settings.dlc_name
			}
		end
	end

	return default_slideshow_content
end

StoreWindowFeatured._get_default_featured_grid_content = function (self)
	local default_grid_content = {}
	local peddler_interface = Managers.backend:get_interface("peddler")
	local peddler_items = peddler_interface:get_peddler_stock()
	local backend_common = Managers.backend:get_interface("common")
	local hero_filter = "can_wield_by_current_hero and not owned"
	local hero_items = backend_common:filter_items(peddler_items, hero_filter)
	local os_time = os.time() * 1000

	local function comparator(a, b)
		local sale_percentage_a = a.current_prices.SM / a.regular_prices.SM
		local sale_percentage_b = b.current_prices.SM / b.regular_prices.SM

		if sale_percentage_a ~= sale_percentage_b then
			return sale_percentage_a < sale_percentage_b
		end

		local a_end_time = a.end_time or math.huge
		local b_end_time = b.end_time or math.huge
		local a_time_left = a_end_time - os_time
		local b_time_left = b_end_time - os_time

		return a_time_left < b_time_left
	end

	table.sort(hero_items, comparator)

	for i = 1, 9, 1 do
		default_grid_content[i] = hero_items[i]
	end

	return default_grid_content
end

StoreWindowFeatured._setup_grid_products = function (self, grid_content)
	local layout = {}

	for i = 1, #grid_content, 1 do
		local product_data = grid_content[i]
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
		end

		if product then
			layout[#layout + 1] = product
		end
	end

	self._layout = layout

	self:_create_product_widgets(layout)
end

StoreWindowFeatured._get_dlc_settings = function (self, product_id)
	for _, settings in ipairs(StoreDlcSettings) do
		if settings.dlc_name == product_id then
			return settings
		end
	end

	return nil
end

StoreWindowFeatured._setup_slideshow = function (self, widget, data)
	local slideshow_content = {}
	self._reference_id = (self._reference_id or 0) + 1

	for index, slideshow in ipairs(data) do
		local valid = false
		local product_id = slideshow.product_id

		if product_id then
			local product_type = slideshow.product_type

			if product_type == "dlc" and self:_get_dlc_settings(product_id) then
				valid = true
			elseif product_type == "item" and self._parent:get_item_by_key(product_id) then
				valid = true
			end
		else
			valid = true
		end

		if valid then
			local backend_texture_name = slideshow.backend_texture

			if backend_texture_name then
				local reference_name = "slideshow_" .. index .. "_" .. self._reference_id
				local material_name = self:_setup_backend_image_material(reference_name, backend_texture_name)
				slideshow.reference_name = reference_name
				slideshow.texture = material_name
			else
				slideshow.texture = slideshow.texture or "icons_placeholder"
			end

			slideshow_content[#slideshow_content + 1] = slideshow
		end
	end

	local num_entries = #slideshow_content
	local draw_slideshow = num_entries > 0
	local content = widget.content
	content.visible = draw_slideshow

	if draw_slideshow then
		local style = widget.style
		local list_style = style.list_style
		local default_size = content.size
		local default_width = default_size[1]
		list_style.num_draws = num_entries
		local page_thumb_width = list_style.size[1]
		local total_page_thumb_width = page_thumb_width * num_entries
		list_style.offset[1] = default_width / 2 - total_page_thumb_width / 2
		content.slideshow_content = slideshow_content
		content.wait_time = SLIDESHOW_WAIT_TIME

		self:_set_slideshow_selected_read_index(widget, 1)
		self:_set_slideshow_animation_progress(widget, 1)

		content.progress = 1
		content.initialized = true
	end
end

StoreWindowFeatured._setup_backend_image_material = function (self, reference_name, texture_name, masked)
	local material_name = "StoreWindowFeatured_" .. reference_name
	local gui = self._ui_top_renderer.gui
	local template_material_name = (masked and "template_store_diffuse_masked") or "template_store_diffuse"

	self:_create_material_instance(gui, material_name, template_material_name, reference_name)

	local cdn = Managers.backend:get_interface("cdn")
	local cb = callback(self, "_cb_on_backend_url_loaded", gui, reference_name, texture_name, material_name)

	cdn:get_resource_urls({
		texture_name
	}, cb)

	return material_name
end

StoreWindowFeatured._cb_on_backend_url_loaded = function (self, gui, reference_name, texture_name, material_name, result)
	local texture_url = result[texture_name]

	if not texture_url then
		return
	end

	if self._is_open == false then
		return
	end

	self._material_references_to_unload[reference_name] = true
	local cb = callback(self, "_cb_on_backend_image_loaded", gui, reference_name, material_name)

	Managers.url_loader:load_resource(reference_name, texture_url, cb, texture_name)
end

StoreWindowFeatured._cb_on_backend_image_loaded = function (self, gui, reference_name, material_name, texture_resource)
	if not self._cloned_materials_by_reference[reference_name] then
		return
	end

	if texture_resource then
		local ui_top_renderer = self._ui_top_renderer
		local gui = ui_top_renderer.gui

		self:_set_material_diffuse_by_resource(gui, material_name, texture_resource)
	else
		self._material_references_to_unload[reference_name] = nil

		Application.warning(string.format("[StoreWindowFeatured] - Failed loading image for reference name: (%s)", reference_name))
	end
end

StoreWindowFeatured._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

StoreWindowFeatured._set_material_diffuse_by_resource = function (self, gui, material_name, texture_resource)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_resource(material, "diffuse_map", texture_resource)
	end
end

StoreWindowFeatured._set_material_diffuse_by_path = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

StoreWindowFeatured._handle_slideshow_logic = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local wait_time = content.wait_time

	if not content.initialized then
		return
	end

	self._parent:animate_store_product(widget, dt)

	local slideshow_content = content.slideshow_content
	local num_slideshows = #slideshow_content
	local list_style = style.list_style
	local item_styles = list_style.item_styles
	local list_content = content.list_content
	local thumb_pressed = false

	for i = 1, num_slideshows, 1 do
		local page_thumb_hotspot = list_content[i].button_hotspot
		local page_thumb_style = item_styles[i]

		self:_update_hotspot_progress(page_thumb_hotspot, dt)

		local hover_progress = page_thumb_hotspot.hover_progress
		local selection_progress = page_thumb_hotspot.selection_progress
		local combined_progress = math.max(hover_progress, selection_progress)
		page_thumb_style.icon.color[1] = 255 * combined_progress

		if page_thumb_hotspot.on_hover_enter then
			self:_play_sound("Play_hud_store_button_hover")
		end

		if page_thumb_hotspot.on_pressed then
			self:_set_slideshow_selected_read_index(widget, i)

			content.progress = 1

			self:_set_slideshow_animation_progress(widget, 1)
			self:_play_sound("Play_hud_store_button_select")

			thumb_pressed = true
		end

		page_thumb_hotspot.is_selected = i == content.read_index
	end

	if not thumb_pressed and self:_is_button_pressed(widget) then
		self:_on_slideshow_pressed(widget)
	end

	local delay_timer = content.delay_timer

	if delay_timer then
		delay_timer = math.max(delay_timer - dt, 0)
		local delay_progress = 1 - delay_timer / wait_time
		local timer_bar_style = style.timer_bar
		local timer_bar_texture_width = timer_bar_style.texture_width
		local timer_bar_size = timer_bar_style.texture_size

		if delay_timer == 0 then
			content.delay_timer = nil
			timer_bar_size[1] = 0
		else
			content.delay_timer = delay_timer
			timer_bar_size[1] = math.floor(delay_progress * timer_bar_texture_width)
		end

		return
	end

	local progress = content.progress or 1
	progress = progress - dt * 0.3
	local current_read_index = content.read_index or 1
	local read_index = current_read_index

	if progress >= 1 then
		read_index = (read_index - 1 - 1) % num_slideshows + 1

		self:_set_slideshow_selected_read_index(widget, read_index)
	elseif progress <= 0 then
		read_index = ((read_index + 1) - 1) % num_slideshows + 1

		self:_set_slideshow_selected_read_index(widget, read_index)
	end

	progress = progress % 1
	content.progress = progress
	local anim_progress = math.smoothstep(progress, 0, 1)

	self:_set_slideshow_animation_progress(widget, anim_progress)
end

StoreWindowFeatured._set_slideshow_selected_read_index = function (self, widget, index)
	local content = widget.content
	local slideshow_content = content.slideshow_content
	local slide_content = slideshow_content[index]
	local wait_time = content.wait_time
	content.read_index = index
	content.delay_timer = wait_time
	local header = slide_content.header or slide_content.backend_header
	local description = slide_content.description or slide_content.backend_description
	content.title_text = Localize(header)
	content.description_text = Localize(description)
end

StoreWindowFeatured._on_slideshow_pressed = function (self, widget)
	local content = widget.content
	local read_index = content.read_index
	local slideshow_content = content.slideshow_content
	local slide_content = slideshow_content[read_index]
	local path = slide_content.path
	local product_id = slide_content.product_id
	local parent = self._parent

	if product_id then
		parent:go_to_product(product_id, path)
	elseif path then
		parent:go_to_store_path(path)
	end
end

StoreWindowFeatured._on_list_index_selected = function (self, index)
	local row, column = nil
	local widgets = self._grid_widgets
	local num_widgets = #widgets

	for widget_index, widget in ipairs(widgets) do
		local content = widget.content
		local hotspot = content.hotspot
		local is_selected = widget_index == index
		hotspot.is_selected = is_selected

		if is_selected then
			row = content.row
			column = content.column
			hotspot.on_hover_enter = true
		end
	end

	self._previous_gamepad_grid_index = self._selected_gamepad_grid_index
	self._previous_gamepad_grid_row = self._selected_gamepad_grid_row
	self._previous_gamepad_grid_column = self._selected_gamepad_grid_column
	self._selected_gamepad_grid_index = index
	self._selected_gamepad_grid_row = row
	self._selected_gamepad_grid_column = column
end

StoreWindowFeatured._on_list_index_pressed = function (self, index)
	local layout = self._layout
	local entry = layout[index]
	local product_id = entry.product_id
	local parent = self._parent

	parent:go_to_product(product_id)
end

StoreWindowFeatured._set_slideshow_animation_progress = function (self, widget, progress)
	local content = widget.content
	local style = widget.style
	local slideshow_content = content.slideshow_content
	local num_slideshows = #slideshow_content
	local read_index = content.read_index or 1
	local default_size = content.size
	local default_width = default_size[1]

	for i = 1, 2, 1 do
		local id = "icon_" .. i
		local icon_content = content[id]
		local icon_style = style[id]
		local uvs = icon_content.uvs
		local size = icon_style.texture_size
		local offset = icon_style.offset
		local local_read_index = read_index

		if i == 1 then
			uvs[1][1] = 1 - progress
			size[1] = math.floor(default_width * progress)
		else
			uvs[2][1] = 1 - progress
			size[1] = math.floor(default_width * (1 - progress))
			offset[1] = math.floor(default_width - size[1])
			local_read_index = ((read_index + 1) - 1) % num_slideshows + 1
		end

		local slideshow = slideshow_content[local_read_index]
		local texture = slideshow.texture
		icon_content.texture_id = texture
	end
end

StoreWindowFeatured._update_hotspot_progress = function (self, hotspot, dt)
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

	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

StoreWindowFeatured._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[StoreWindowFeatured] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

StoreWindowFeatured._reset_cloned_materials = function (self)
	local ui_top_renderer = self._ui_top_renderer
	local gui = ui_top_renderer.gui
	local material_references_to_unload = self._material_references_to_unload
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	for reference_name, material_name in pairs(cloned_materials_by_reference) do
		if material_references_to_unload[reference_name] then
			material_references_to_unload[reference_name] = nil

			Managers.url_loader:unload_resource(reference_name)
		end

		if self:_is_unique_reference_to_material(reference_name) then
			self:_set_material_diffuse_by_path(gui, material_name, PRODUCT_PLACEHOLDER_TEXTURE_PATH)
		end

		cloned_materials_by_reference[reference_name] = nil
	end
end

StoreWindowFeatured._handle_gamepad_grid_selection = function (self, input_service)
	local current_index = self._selected_gamepad_grid_index

	if not current_index then
		return
	end

	local current_selected_row = self._selected_gamepad_grid_row
	local current_selected_column = self._selected_gamepad_grid_column
	local previous_selected_row = self._previous_gamepad_grid_row
	local previous_selected_column = self._previous_gamepad_grid_column
	local new_index = nil
	local gamepad_navigation = self._gamepad_navigation
	local num_rows = #gamepad_navigation

	for row, columns in ipairs(gamepad_navigation) do
		local num_columns_on_row = #columns

		for column, index in ipairs(columns) do
			if index == current_index then
				if input_service:get("move_left_hold_continuous") then
					if column == 1 then
						self:_select_slideshow_widget(true)
						self:_on_list_index_selected(nil)

						return

						break
					end

					new_index = columns[column - 1]

					break
				end

				if input_service:get("move_right_hold_continuous") then
					new_index = columns[column + 1]

					break
				end

				if input_service:get("move_up_hold_continuous") then
					if row > 1 and num_columns_on_row == 1 and previous_selected_row and previous_selected_column then
						new_index = gamepad_navigation[row - 1][previous_selected_column]

						break
					end

					local next_row_columns = gamepad_navigation[row - 1]
					local next_column = math.min(column, #next_row_columns)
					new_index = next_row_columns[next_column]

					break
				end

				if input_service:get("move_down_hold_continuous") and row < num_rows and num_columns_on_row == 1 and previous_selected_row and previous_selected_column then
					local next_row_columns = gamepad_navigation[row + 1]
					local next_column = math.min(previous_selected_column, #next_row_columns)
					new_index = next_row_columns[next_column]

					break
				end

				local next_row_columns = gamepad_navigation[row + 1]
				local next_column = math.min(column, #next_row_columns)
				new_index = next_row_columns[next_column]

				break
			end
		end
	end

	if new_index and new_index ~= current_index then
		self:_on_list_index_selected(new_index)
	end
end

StoreWindowFeatured._select_slideshow_widget = function (self, is_selected)
	local content_widgets_by_name = self._content_widgets_by_name
	local slideshow = content_widgets_by_name.slideshow
	slideshow.content.hotspot.is_selected = is_selected
	slideshow.content.hotspot.on_hover_enter = is_selected
	self._slideshow_selected = is_selected
end

return
