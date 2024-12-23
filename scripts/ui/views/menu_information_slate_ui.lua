-- chunkname: @scripts/ui/views/menu_information_slate_ui.lua

local definitions = local_require("scripts/ui/views/menu_information_slate_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local animation_definitions = definitions.animation_definitions
local body_parsing_data = definitions.body_parsing_data
local create_switch_panel_func = definitions.create_switch_panel_func

MenuInformationSlateUI = class(MenuInformationSlateUI)

local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
local CDN_SERVER = "cdn.fatsharkgames.se"
local CDN_URL = "information.json"

MenuInformationSlateUI.init = function (self, ui_renderer, input_service)
	self._ui_renderer = ui_renderer
	self._input_service = input_service
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}
	self._cloned_materials_by_reference = {}
	self._material_references_to_unload = {}
	self._scrollbar_alpha = 0
	self._current_information_data_index = 1
	self._information_data = {}
	self._animations = {}
	self._ui_animations = {}

	self:_fetch_backend_information()
end

MenuInformationSlateUI._start_animation = function (self, animation_name)
	if not self._information_available then
		return
	end

	local params = {
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph,
	}
	local widgets = self._widgets_by_name
	local current_anim_id = self._animations[animation_name]

	if current_anim_id then
		self._ui_animator:stop_animation(current_anim_id)
	end

	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

MenuInformationSlateUI.show = function (self)
	if self._information_data and #self._information_data > 1 then
		self:_start_animation("animate_switch_panel_in")
	end

	self:_start_animation("animate_in")
end

MenuInformationSlateUI.hide = function (self)
	if self._information_data and #self._information_data > 1 then
		self:_start_animation("animate_switch_panel_out")
	end

	self:_start_animation("animate_out")

	self._expanded = false
end

MenuInformationSlateUI._create_ui_elements = function (self)
	self:_reset()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._expanded = false
end

MenuInformationSlateUI._reset = function (self)
	for key, id in pairs(self._animations) do
		self._ui_animator:stop_animation(id)
	end

	table.clear(self._animations)
	table.clear(self._ui_animations)

	local widgets = {}
	local widgets_by_name = {}

	for widget_name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets_by_name[widget_name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._body_widgets = {}
end

MenuInformationSlateUI._fetch_backend_information = function (self)
	if IS_CONSOLE then
		self:_fetch_cdn_data(CDN_URL, callback(self, "_parse_cdn_data"))
	else
		local information_data_json = Managers.backend:get_title_data("information")
		local information_data = information_data_json and cjson.decode(information_data_json)

		if information_data then
			self._information_data = information_data

			local slate_data = information_data[1] or information_data

			self:_create_ui_elements()
			self:_parse_information_data(slate_data)

			if #self._information_data > 1 then
				self:_create_switch_panel()
				self:_start_animation("animate_switch_panel_in")
			end

			self:_start_animation("animate_in")
		end
	end
end

local function _callback_wrapper(success, http_code, response_headers, data, userdata_callback)
	local info = {
		done = false,
	}

	if success and http_code >= 200 and http_code < 300 then
		info.done = true
		info.data = data
	end

	userdata_callback(info)
end

MenuInformationSlateUI._fetch_cdn_data = function (self, url, callback)
	if rawget(_G, "Http") then
		local message = Http.get_uri(CDN_SERVER, 80, url)

		if message then
			local is_ok = string.find(message, "HTTP/1.1 200 OK") or string.find(message, "HTTP/1.0 200 OK")

			if is_ok then
				local start_idx, end_idx = string.find(message, "\r\n\r\n")
				local formatted_message = ""

				if end_idx then
					formatted_message = string.sub(message, end_idx + 1)
				end

				local info = {
					done = true,
					success = true,
					message = formatted_message,
				}

				callback(info)
			else
				local info = {
					done = true,
					message = "CDN data fetch failed",
					success = false,
				}

				callback(info)
			end
		else
			local info = {
				done = true,
				message = "CDN data not available",
				success = false,
			}

			callback(info)
		end
	else
		local info = {
			done = true,
			message = "This executable is built without Http. Menu Slate UI will be unavailable.",
			success = false,
		}

		callback(info)
	end
end

MenuInformationSlateUI._parse_cdn_data = function (self, info)
	if not info.success then
		Application.warning("[MenuInformationSlateUI] " .. info.message)

		return
	end

	local json_data = info.message
	local data = json_data and cjson.decode(json_data)

	if data then
		self._information_data = data

		local slate_data = data[1] or data

		self:_create_ui_elements()
		self:_parse_information_data(slate_data)

		if #self._information_data > 1 then
			self:_create_switch_panel()
			self:_start_animation("animate_switch_panel_in")
		end

		self:_start_animation("animate_in")
	end
end

MenuInformationSlateUI._create_switch_panel = function (self)
	self._ui_scenegraph.panel.local_position[2] = scenegraph_definition.panel.position[2] - 50

	local switch_panel_widget_def = create_switch_panel_func(self._information_data)
	local switch_panel_widget = UIWidget.init(switch_panel_widget_def)

	switch_panel_widget.content.current_index = self._current_information_data_index
	self._switch_widget = switch_panel_widget
	self._widgets_by_name.switch_panel = switch_panel_widget
end

MenuInformationSlateUI._parse_information_data = function (self, information_data)
	local alert_type = information_data.alert_name
	local alert_color = information_data.alert_color
	local header = information_data.header
	local sub_header = information_data.sub_header
	local widget = self._widgets_by_name.alert_name

	widget.content.text = alert_type

	local widget = self._widgets_by_name.dot

	widget.style.texture_id.color = alert_color

	local widget = self._widgets_by_name.dot_glow

	widget.style.texture_id.color = alert_color

	local widget = self._widgets_by_name.top_banner

	widget.style.rect.color = alert_color

	local widget = self._widgets_by_name.header

	widget.content.text = header

	local widget = self._widgets_by_name.sub_header

	widget.content.text = sub_header

	local body = information_data.body
	local offset = 0

	for idx, section_data in ipairs(body) do
		local section_type = section_data.type
		local func = self["_parse_" .. section_type .. "_data"]

		if func then
			offset = func(self, section_data, idx, offset)
		else
			fassert(false, "[MenuInformationSlateUi] There is no parse function for type %q", section_type)
		end
	end

	local excess = math.abs(offset) - 590

	if excess > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "body_anchor"
		local scroll_area_anchor_scenegraph_id = "scrolbar_window"
		local excess_area = excess
		local enable_auto_scroll = false
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	else
		self._scrollbar_ui = nil

		local scroll_area_scenegraph_id = "body_anchor"

		self._ui_scenegraph[scroll_area_scenegraph_id].local_position[2] = 0
	end

	self._information_available = true
end

MenuInformationSlateUI._parse_text_data = function (self, data, idx, offset)
	local text_body_parsing_data = body_parsing_data.text
	local spacing = text_body_parsing_data.spacing
	local text_style = table.clone(text_body_parsing_data.default_text_style)

	text_style.font_size = data.font_size or text_style.font_size
	text_style.font_type = data.font_type or text_style.font_type
	text_style.text_color = data.color or text_style.text_color

	local text = data.text
	local hint = data.hint
	local font, size_of_font = UIFontByResolution(text_style)
	local font_material, font_size = font[1], size_of_font
	local gui = self._ui_renderer.gui
	local _, font_min, font_max = UIGetFontHeight(gui, text_style.font_type, font_size)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max - font_min) * inv_scale

	if hint == "bullet_points" then
		text_style.offset[1] = 20
		offset = offset + spacing

		local bullet_points = string.split_deprecated(text, "|")

		for bullet_point_idx, bullet_point in ipairs(bullet_points) do
			local bullet_point_text_style = table.clone(text_style)

			bullet_point_text_style.area_size = {
				405,
				50,
			}

			local widget_definition = UIWidgets.create_simple_text(bullet_point, "body_anchor", nil, nil, bullet_point_text_style)
			local widget = UIWidget.init(widget_definition)

			self._body_widgets[#self._body_widgets + 1] = widget
			self._widgets_by_name["text_" .. idx .. "_bullet_point_" .. bullet_point_idx] = widget
			widget.offset[2] = offset

			local masked = true
			local widget_definition = UIWidgets.create_simple_texture("dot", "body_anchor", masked, nil, {
				255,
				192,
				192,
				192,
			}, {
				0,
				offset - 3,
				1,
			}, {
				20,
				20,
			})

			widget_definition.style.texture_id.horizontal_alignment = "left"
			widget_definition.style.texture_id.vertical_alignment = "top"

			local dot_widget = UIWidget.init(widget_definition)

			self._body_widgets[#self._body_widgets + 1] = dot_widget
			self._widgets_by_name["text_" .. idx .. "_bullet_point_dot_" .. bullet_point_idx] = dot_widget

			local rows, return_indices = UIRenderer.word_wrap(self._ui_renderer, bullet_point, font_material, font_size, 405)

			widget.widget_height = full_font_height * #rows
			dot_widget.widget_height = widget.widget_height
			offset = offset - widget.widget_height - (#rows > 1 and spacing * 0.5 or 0)
		end

		offset = offset - spacing
	else
		local widget_definition = UIWidgets.create_simple_text(text, "body_anchor", nil, nil, text_style)
		local widget = UIWidget.init(widget_definition)

		self._body_widgets[#self._body_widgets + 1] = widget
		self._widgets_by_name["text_" .. idx] = widget
		widget.offset[2] = offset

		local rows, return_indices = UIRenderer.word_wrap(self._ui_renderer, text, font_material, font_size, self._ui_scenegraph.body_anchor.size[1])

		widget.widget_height = full_font_height * #rows
		offset = offset - widget.widget_height - spacing
	end

	return offset
end

MenuInformationSlateUI._parse_image_data = function (self, data, idx, offset)
	local image_body_parsing_data = body_parsing_data.image
	local image_name = data.image_name
	local image_size = data.image_size
	local masked = true
	local reference_name = "image_" .. idx
	local widget_height = image_size[2]

	local function widget_cb()
		local material = self._cloned_materials_by_reference[reference_name]
		local widget_definition = UIWidgets.create_simple_texture(material, "body_anchor")

		widget_definition.style.texture_id.horizontal_alignment = "left"
		widget_definition.style.texture_id.vertical_alignment = "top"

		local widget = UIWidget.init(widget_definition)

		widget.offset[2] = offset
		widget.style.texture_id.texture_size = image_size
		self._body_widgets[#self._body_widgets + 1] = widget
		self._widgets_by_name[reference_name] = widget
		widget.widget_height = widget_height
		widget.is_image = true
	end

	self:_setup_backend_image_material(image_name, masked, reference_name, widget_cb)

	return offset - widget_height - image_body_parsing_data.spacing
end

MenuInformationSlateUI._setup_backend_image_material = function (self, texture_name, masked, reference_name, widget_cb)
	local reference_name = reference_name or texture_name
	local material_name = "MenuInformationSlateUI_" .. reference_name
	local template_material_name = masked and "template_diffuse_masked" or "template_diffuse"

	self:_create_material_instance(material_name, template_material_name, reference_name)

	if IS_CONSOLE then
		self._material_references_to_unload[reference_name] = true

		local use_amazon_cdn_fallback = false
		local cb = callback(self, "_cb_on_backend_image_loaded", material_name, reference_name, widget_cb, texture_name, use_amazon_cdn_fallback)

		Managers.url_loader:load_resource(reference_name, "http://" .. CDN_SERVER .. "/" .. texture_name .. ".dds", cb, Application.guid())
	else
		local cdn = Managers.backend:get_interface("cdn")
		local cb = callback(self, "_cb_on_backend_url_loaded", texture_name, reference_name, material_name, widget_cb)

		cdn:get_resource_urls({
			texture_name,
		}, cb)
	end
end

MenuInformationSlateUI._create_material_instance = function (self, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(self._ui_renderer.gui, new_material_name, template_material_name)
end

MenuInformationSlateUI._cb_on_backend_url_loaded = function (self, texture_name, reference_name, material_name, widget_cb, result)
	local texture_url = result[texture_name]

	if not texture_url then
		local use_amazon_cdn_fallback = false

		self._material_references_to_unload[reference_name] = true

		local cb = callback(self, "_cb_on_backend_image_loaded", material_name, reference_name, widget_cb, texture_name, use_amazon_cdn_fallback)

		Managers.url_loader:load_resource(reference_name, "http://" .. CDN_SERVER .. "/vermintide2/" .. texture_name .. ".dds", cb, Application.guid())

		return
	end

	self._material_references_to_unload[reference_name] = true

	local use_amazon_cdn_fallback = true
	local cb = callback(self, "_cb_on_backend_image_loaded", material_name, reference_name, widget_cb, texture_name, use_amazon_cdn_fallback)

	Managers.url_loader:load_resource(reference_name, texture_url, cb, texture_name)
end

MenuInformationSlateUI._cb_on_backend_image_loaded = function (self, material_name, reference_name, widget_cb, texture_name, use_amazon_cdn_fallback, texture_resource)
	if not self._cloned_materials_by_reference[reference_name] then
		return
	end

	if texture_resource then
		self:_set_material_diffuse_by_resource(material_name, texture_resource)
		widget_cb()
	elseif use_amazon_cdn_fallback then
		local use_amazon_cdn_fallback = false

		self._material_references_to_unload[reference_name] = true

		local cb = callback(self, "_cb_on_backend_image_loaded", material_name, reference_name, widget_cb, texture_name, use_amazon_cdn_fallback)

		Managers.url_loader:load_resource(reference_name, "http://" .. CDN_SERVER .. "/vermintide2/" .. texture_name .. ".dds", cb, Application.guid())
	else
		self._material_references_to_unload[reference_name] = nil

		Application.warning(string.format("[StoreWindowFeatured] - Failed loading image for reference name: (%s)", reference_name))
	end
end

MenuInformationSlateUI._set_material_diffuse_by_resource = function (self, material_name, texture_resource)
	local material = Gui.material(self._ui_renderer.gui, material_name)

	if material then
		Material.set_resource(material, "diffuse_map", texture_resource)
	end
end

MenuInformationSlateUI._update_input = function (self, dt, t)
	local input_pressed = IS_CONSOLE and self._input_service:get("start_press") or self._input_service:get("special_1_press")

	input_pressed = input_pressed or UIUtils.is_button_pressed(self._widgets_by_name.more_information, "hotspot")
	input_pressed = input_pressed or UIUtils.is_button_pressed(self._widgets_by_name.less_information, "hotspot")

	local is_animating = self._animations.expand or self._animations.collapse

	if input_pressed and not is_animating then
		if not self._expanded then
			self._expanded = true

			self:_start_animation("expand")
			self:_play_sound("play_gui_info_slate_more_information_open")
		else
			self._expanded = false

			self:_start_animation("collapse")
			self:_play_sound("play_gui_info_slate_more_information_close")
		end

		return
	elseif UIUtils.is_button_hover_enter(self._widgets_by_name.more_information, "hotspot") or UIUtils.is_button_hover_enter(self._widgets_by_name.less_information, "hotspot") then
		self:_play_sound("play_gui_info_slate_more_information_hover")
	end

	if #self._information_data > 1 then
		local old_index = self._current_information_data_index
		local widget = self._widgets_by_name.switch_panel

		for i = 1, #self._information_data do
			local slate_name = "slate_" .. i

			if UIUtils.is_button_pressed(widget, slate_name .. "_hotspot") then
				self:_play_sound("play_gui_info_slate_tab_clicked")

				if i ~= self._current_information_data_index then
					self._current_information_data_index = i

					break
				end
			elseif UIUtils.is_button_hover_enter(widget, slate_name .. "_hotspot") then
				self:_play_sound("play_gui_info_slate_tab_hover")

				break
			end
		end

		if UIUtils.is_button_pressed(widget, "left_arrow_hotspot") or self._input_service:get("previous") or IS_WINDOWS and self._input_service:get("left") then
			self._current_information_data_index = math.max(self._current_information_data_index - 1, 1)

			self:_play_sound("play_gui_info_slate_tab_arrow_clicked")
		elseif UIUtils.is_button_pressed(widget, "right_arrow_hotspot") or self._input_service:get("next") or IS_WINDOWS and self._input_service:get("right") then
			self._current_information_data_index = math.min(self._current_information_data_index + 1, #self._information_data)

			self:_play_sound("play_gui_info_slate_tab_arrow_clicked")
		elseif UIUtils.is_button_hover_enter(widget, "left_arrow_hotspot") or UIUtils.is_button_hover_enter(widget, "right_arrow_hotspot") then
			self:_play_sound("play_gui_info_slate_tab_arrow_hover")
		end

		if old_index ~= self._current_information_data_index then
			self:_populate_info_slate()
		end
	end
end

MenuInformationSlateUI._populate_info_slate = function (self)
	local slate_data = self._information_data[self._current_information_data_index]

	self:_reset()
	self:_parse_information_data(slate_data)
	self:_create_switch_panel()

	self._expanded = false

	self:_start_animation("collapse_instantly")
	self:_start_animation("animate_in")
	self:_play_sound("play_gui_info_slate_tab_changed")
end

MenuInformationSlateUI._update_animations = function (self, dt, t)
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

MenuInformationSlateUI.update = function (self, dt, t)
	if not self._information_available then
		return
	end

	self:_update_animations(dt, t)
	self:_update_input(dt, t)
	self:_draw(dt, t)
end

MenuInformationSlateUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_service
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._expanded or not table.is_empty(self._animations) then
		local anchor_offset = self._ui_scenegraph.body_anchor.local_position[2]
		local start_pos = 0
		local end_pos = -definitions.panel_scroll_area

		for _, widget in ipairs(self._body_widgets) do
			local widget_offset = widget.offset[2] + anchor_offset
			local widget_end_point = widget_offset - widget.widget_height

			if widget_end_point < start_pos and end_pos < widget_offset then
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	if self._switch_widget then
		local alpha_multiplier = render_settings.alpha_multiplier

		render_settings.alpha_multiplier = self._switch_widget.content.alpha_value

		UIRenderer.draw_widget(ui_renderer, self._switch_widget)

		render_settings.alpha_multiplier = alpha_multiplier
	end

	UIRenderer.end_pass(ui_renderer)

	if self._expanded then
		local alpha_multiplier = render_settings.alpha_multiplier

		render_settings.alpha_multiplier = render_settings.scrollbar_alpha

		if self._scrollbar_ui then
			self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
		end

		render_settings.alpha_multiplier = alpha_multiplier
	end
end

MenuInformationSlateUI.destroy = function (self)
	self:_reset_cloned_materials()
end

MenuInformationSlateUI._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[MenuInformationSlateUI] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

MenuInformationSlateUI._set_material_diffuse_by_path = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

MenuInformationSlateUI._reset_cloned_materials = function (self)
	local ui_renderer = self._ui_renderer
	local gui = ui_renderer.gui
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

MenuInformationSlateUI._play_sound = function (self, event)
	return Managers.music:trigger_event(event)
end
