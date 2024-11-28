-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_gotwf_item_preview.lua

require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_item_preview_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local top_widget_definitions = definitions.top_widgets
local loading_widget_definitions = definitions.loading_widgets
local create_claimed_widget_func = definitions.create_claimed_widget
local create_painting_widget = definitions.create_painting_widget
local create_texture_widget = definitions.create_texture_widget
local animation_definitions = definitions.animation_definitions
local LIST_SPACING = 10
local LIST_MAX_WIDTH = 800
local CONSOLE_PRICE_WIDTH = 140
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"

HeroWindowGotwfItemPreview = class(HeroWindowGotwfItemPreview)
HeroWindowGotwfItemPreview.NAME = "HeroWindowGotwfItemPreview"

HeroWindowGotwfItemPreview.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowGotwfItemPreview")

	self._params = params
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context

	local ui_renderer, ui_top_renderer = self._parent:get_renderers()

	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._animations = {}
	self._ui_animations = {}
	self._loaded_package_names = {}
	self._cloned_materials_by_reference = {}

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter")
end

HeroWindowGotwfItemPreview._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = self._top_widgets_by_name
	local old_anim_id = self._animations[animation_name]

	if old_anim_id then
		self._ui_animator:stop_animation(old_anim_id)

		self._animations[animation_name] = nil
	end

	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowGotwfItemPreview._create_viewport_definition = function (self)
	local shading_environment = "environment/ui_store_preview"

	return {
		scenegraph_id = "viewport",
		element = UIElements.Viewport,
		style = {
			viewport = {
				enable_sub_gui = false,
				fov = 65,
				horizontal_alignment = "center",
				layer = 990,
				level_name = "levels/ui_store_preview/world",
				vertical_alignment = "center",
				viewport_name = "item_preview_viewport",
				viewport_type = "default_forward",
				world_name = "item_preview",
				shading_environment = shading_environment,
				object_sets = LevelResource.object_set_names("levels/ui_store_preview/world"),
				camera_position = {
					0,
					0,
					0,
				},
				camera_lookat = {
					0,
					0,
					0,
				},
				viewport_size = {
					600,
					500,
				},
			},
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
	}
end

HeroWindowGotwfItemPreview._create_ui_elements = function (self, params, offset)
	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local top_widgets = {}
	local top_widgets_by_name = {}

	for name, widget_definition in pairs(top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		top_widgets[#top_widgets + 1] = widget
		top_widgets_by_name[name] = widget
	end

	self._top_widgets = top_widgets
	self._top_widgets_by_name = top_widgets_by_name

	local claimed_widget_definition = create_claimed_widget_func(self._ui_renderer)
	local widget = UIWidget.init(claimed_widget_definition)

	self._top_widgets[#self._top_widgets + 1] = widget
	self._top_widgets_by_name.claimed = widget

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

HeroWindowGotwfItemPreview.on_exit = function (self, params, force_unload)
	print("[HeroViewWindow] Exit Substate HeroWindowGotwfItemPreview")

	self._ui_animator = nil
	self._has_exited = true

	self:_destroy_previewers()
	self:_destroy_viewport_gui()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	local loaded_package_names = self._loaded_package_names

	for reference_name, package_name in pairs(loaded_package_names) do
		self:_unload_texture_by_reference(reference_name)
	end
end

HeroWindowGotwfItemPreview.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_sync_layout_path()
	self:_update_previewers(dt, t)
end

HeroWindowGotwfItemPreview._update_previewers = function (self, dt, t)
	if self._selected_product then
		local input_service = self._parent:window_input_service()
		local input_handled, input_hovered = false, false

		if self._world_previewer then
			local parent = self._parent
			local input_disabled = parent:input_blocked()

			self._world_previewer:update(dt, t, input_disabled)
		end

		if self._item_previewer then
			local viewport_button = self._top_widgets_by_name.viewport_button
			local is_hover = UIUtils.is_button_hover(viewport_button)
			local gamepad_active = Managers.input:is_device_active("gamepad")
			local allow_preview_input = not input_handled and not input_hovered and (gamepad_active or is_hover)

			self._item_previewer:update(dt, t, allow_preview_input and input_service)
		end
	end
end

HeroWindowGotwfItemPreview._register_object_sets = function (self, viewport_widget, viewport_definition)
	local viewport_definition_style = viewport_definition.style.viewport
	local viewport_widget_style = viewport_widget.style
	local viewport_widget_content = viewport_widget.content
	local viewport_widget_element = viewport_widget.element
	local pass_data = viewport_widget_element.pass_data[1]
	local level_name = viewport_definition_style.level_name
	local object_sets = {}
	local available_level_sets = LevelResource.object_set_names(level_name)

	for _, set_name in ipairs(available_level_sets) do
		object_sets[set_name] = {
			set_enabled = true,
			units = LevelResource.unit_indices_in_object_set(level_name, set_name),
		}
	end

	viewport_widget_content.object_set_data = {
		world = pass_data.world,
		level = pass_data.level,
		object_sets = object_sets,
		level_name = level_name,
	}

	self:_show_object_set(nil, true)
end

HeroWindowGotwfItemPreview._show_object_set = function (self, object_set_name, force_disable)
	if not self._viewport_widget then
		print("[HeroWindowGotwfItemPreview:show_object_set] Viewport not initiated")

		return
	end

	local viewport_widget_content = self._viewport_widget.content
	local object_set_data = viewport_widget_content.object_set_data
	local world = object_set_data.world
	local level = object_set_data.level
	local level_name = object_set_data.level_name
	local object_sets = object_set_data.object_sets

	if not object_sets[object_set_name] and not force_disable then
		print(string.format("[HeroWindowGotwfItemPreview:show_object_set] No object set called %q in level %q", object_set_name, level_name))

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

	print("Showing object set:", object_set_name)
end

HeroWindowGotwfItemPreview._update_environment = function (self, item_preview_environment, force_default)
	if not self._viewport_widget then
		return
	end

	local item_preview_environment = item_preview_environment or "default"
	local viewport_widget_content = self._viewport_widget.content
	local object_set_data = viewport_widget_content.object_set_data
	local world = object_set_data.world
	local shading_settings = World.get_data(world, "shading_settings")

	shading_settings[1] = force_default and "default" or item_preview_environment
end

HeroWindowGotwfItemPreview._destroy_viewport_gui = function (self)
	if self._viewport_gui then
		local world = Managers.world:world("item_preview")

		World.destroy_gui(world, self._viewport_gui)

		self._viewport_gui = nil
	end
end

HeroWindowGotwfItemPreview._create_viewport_gui = function (self)
	local world = Managers.world:world("item_preview")
	local is_tutorial = false
	local is_in_inn = self._is_in_inn
	local mechanism_key = Managers.mechanism:current_mechanism_name()

	self._viewport_gui = World.create_screen_gui(world, "immediate", "material", "materials/ui/ui_1080p_lock_test")

	local w, h = Gui.resolution()

	self._gui_resolution = {
		w,
		h,
	}
end

HeroWindowGotwfItemPreview.post_update = function (self, dt, t)
	if self._viewport_widget_definition and not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)

		self:_register_object_sets(self._viewport_widget, self._viewport_widget_definition)
	end

	self:_update_loading_overlay_fadeout_animation(dt)
	self:_update_delayed_item_unit_presentation(dt)

	if self._viewport_widget then
		self:_sync_presentation_item()
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

HeroWindowGotwfItemPreview._update_animations = function (self, dt)
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

	self:_update_title_edge_animation(dt)
end

HeroWindowGotwfItemPreview._exit = function (self)
	self.exit = true
end

HeroWindowGotwfItemPreview._get_alpha_multiplier = function (self, widget, alpha_multiplier)
	local render_settings = self._render_settings
	local widget_alpha_multiplier = widget.alpha_multiplier

	if widget_alpha_multiplier then
		return math.min(widget_alpha_multiplier, alpha_multiplier)
	end

	return alpha_multiplier
end

HeroWindowGotwfItemPreview.draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._top_widgets) do
		render_settings.alpha_multiplier = self:_get_alpha_multiplier(widget, alpha_multiplier)

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._item_texture_widget then
		render_settings.alpha_multiplier = self:_get_alpha_multiplier(self._item_texture_widget, alpha_multiplier)

		UIRenderer.draw_widget(ui_top_renderer, self._item_texture_widget)
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
		UIRenderer.end_pass(ui_renderer)
		self:_render_viewport_mask()
	end

	render_settings.alpha_multiplier = alpha_multiplier
end

local EMPTY_TABLE = {}

HeroWindowGotwfItemPreview._render_viewport_mask = function (self)
	local w, h = Application.resolution()
	local gui_resolution = self._gui_resolution or EMPTY_TABLE

	if not self._viewport_gui or gui_resolution[1] ~= w or gui_resolution[2] ~= h then
		self:_destroy_viewport_gui()
		self:_create_viewport_gui()
	end

	local viewport_gui = self._viewport_gui
	local viewport_widget = self._viewport_widget
	local viewport_widget_content = viewport_widget.content
	local viewport_size_x = viewport_widget_content.viewport_size_y
	local viewport_size_y = viewport_widget_content.viewport_size_y
	local x, y = viewport_size_x * w * 0.285, viewport_size_y * h * 0.26

	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(0, 0, 2), Vector2(x, y))
	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(w * viewport_size_x - x, 0, 2), Vector2(x, y))

	local x, y = x, viewport_size_y * h * 0.2

	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(0, h * viewport_size_y - y, 2), Vector2(x, y))
	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(w * viewport_size_x - x, h * viewport_size_y - y, 2), Vector2(x, y))

	local x, y = viewport_size_x * w * 0.09, viewport_size_y * h

	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(0, 0, 2), Vector2(x, y))
	Gui.bitmap(viewport_gui, "gui_lock_test_viewport_mask", Vector3(w * viewport_size_x - x, 0, 2), Vector2(x, y))
end

HeroWindowGotwfItemPreview._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowGotwfItemPreview._start_loading_overlay = function (self)
	self._show_loading_overlay = true
	self._fadeout_loading_overlay = nil
	self._fadeout_progress = nil

	local loading_widgets_by_name = self._loading_widgets_by_name
	local loading_icon = loading_widgets_by_name.loading_icon

	loading_icon.style.texture_id.color[1] = 255
end

HeroWindowGotwfItemPreview._update_loading_overlay_fadeout_animation = function (self, dt)
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

HeroWindowGotwfItemPreview._destroy_previewers = function (self)
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

	self._item_texture_widget = nil
end

HeroWindowGotwfItemPreview._sync_presentation_item = function (self, force_update)
	local params = self._params
	local selected_product = params.selected_item

	if selected_product ~= self._selected_product or force_update then
		local reset_presentation = not selected_product or not self._selected_product or self._selected_product.item_id ~= selected_product.item_id or selected_product.reward_type == "currency"

		self._selected_product = selected_product

		local item = selected_product

		if reset_presentation then
			self._delayed_item_unit_presentation_delay = nil

			self:_destroy_previewers()

			if self._selected_product then
				self:_start_loading_overlay()
				self:_present_item(item)
			end
		end
	end
end

local EMPTY_TABLE = {}

HeroWindowGotwfItemPreview._present_item = function (self, item)
	local slot_type, item_type
	local item_id = item.item_id
	local reward_type = item.reward_type
	local masterlist_item = EMPTY_TABLE
	local painting

	if reward_type == "keep_decoration_painting" then
		painting = Paintings[item.item_id]
	elseif reward_type == "chips" then
		masterlist_item = Currencies[item.item_id]
	elseif reward_type == "currency" then
		masterlist_item = BackendUtils.get_fake_currency_item(item.currency_code, item.amount)
	else
		masterlist_item = ItemMasterList[item.item_id]
	end

	if not masterlist_item then
		return
	end

	local item_type = masterlist_item.item_type
	local slot_type = masterlist_item.slot_type
	local can_wield = masterlist_item.can_wield
	local display_name = masterlist_item.display_name
	local item_preview_environment = masterlist_item.item_preview_environment
	local item_preview_object_set_name = masterlist_item.item_preview_object_set_name
	local type_title_text = ""
	local disclaimer_text = ""
	local description_text = ""
	local amount_text = ""
	local sub_title_text, career_title_text = self:_get_can_wield_display_text(can_wield)

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		local matching_item_type = ItemMasterList[masterlist_item.matching_item_key].item_type

		type_title_text = Localize(matching_item_type)
		disclaimer_text = Localize(item_type)
		item_preview_environment = item_preview_environment or "weapons_default_01"
		item_preview_object_set_name = item_preview_object_set_name or "flow_weapon_lights"
	elseif slot_type == "hat" then
		type_title_text = Localize(item_type)
		item_preview_environment = item_preview_environment or "hats_default_01"
		item_preview_object_set_name = item_preview_object_set_name or "flow_hat_lights"
	elseif slot_type == "skin" then
		type_title_text = Localize(item_type)
		disclaimer_text = Localize("menu_store_product_hero_skin_disclaimer_desc")
		item_preview_object_set_name = item_preview_object_set_name or "flow_character_lights"
	elseif painting then
		display_name = painting.display_name
		type_title_text = Localize("interaction_painting")
		description_text = Localize(painting.description)
		sub_title_text = ""
		career_title_text = ""
	elseif slot_type == "chips" then
		local amount = item.amount

		type_title_text = Localize(item_type)
		description_text = Localize(masterlist_item.description)
		amount_text = amount and amount .. " " .. Localize("menu_store_panel_currency_tooltip_title") or ""
		sub_title_text = ""
		career_title_text = ""
	elseif slot_type == "versus_currency_name" then
		local amount = item.amount

		description_text = Localize(masterlist_item.description)
		amount_text = amount and string.format(Localize("achv_menu_vs_currency_reward_claimed"), amount) or ""
		type_title_text = Localize("hero_view_prestige_reward")
		display_name = "versus_currency_name"
		sub_title_text = ""
		career_title_text = ""
	elseif slot_type == "crafting_material" then
		local amount = item.amount

		type_title_text = Localize(item_type)
		description_text = Localize(masterlist_item.description)
		amount_text = amount and amount .. " " .. Localize(masterlist_item.display_name) or ""
		sub_title_text = ""
		career_title_text = ""
	else
		type_title_text = Localize(item_type)
		description_text = Localize(masterlist_item.description)
		sub_title_text = ""
		career_title_text = ""
	end

	if reward_type == "bundle_item" then
		local bundle_item_id = item.bundle_item_id
		local bundle_item = ItemMasterList[bundle_item_id]

		type_title_text = bundle_item.information_text and Localize(bundle_item.information_text) or type_title_text
		description_text = bundle_item.description and Localize(bundle_item.description) or description_text
		sub_title_text = ""
		career_title_text = ""
	end

	self:_show_object_set(item_preview_object_set_name)
	self:_update_environment(item_preview_environment)
	self:_set_title_name(Localize(display_name))
	self:_set_sub_title_name(sub_title_text)
	self:_set_description_text(description_text)
	self:_set_sub_title_alpha_multiplier(1)
	self:_set_type_title_name(type_title_text)
	self:_set_career_title_name(career_title_text)
	self:_set_disclaimer_text(disclaimer_text)
	self:_set_amount_text(amount_text)
	self:_update_claimed_status()
	self:_start_transition_animation("info_animation")

	self._delayed_item_unit_presentation_delay = 0.3
end

HeroWindowGotwfItemPreview._update_claimed_status = function (self)
	local claimed = self._params.selected_item_claimed
	local already_owned = self._params.selected_item_already_owned
	local widget = self._top_widgets_by_name.claimed

	widget.content.visible = claimed
	widget.content.already_owned = already_owned
end

HeroWindowGotwfItemPreview._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

HeroWindowGotwfItemPreview._set_material_diffuse = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

HeroWindowGotwfItemPreview._load_texture_package = function (self, package_name, reference_name, callback)
	local asynchronous = true
	local prioritize = false

	Managers.package:load(package_name, reference_name, callback, asynchronous, prioritize)

	local loaded_package_names = self._loaded_package_names

	loaded_package_names[reference_name] = package_name
end

HeroWindowGotwfItemPreview._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[HeroWindowGotwfItemPreview] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

HeroWindowGotwfItemPreview._unload_texture_by_reference = function (self, reference_name)
	local loaded_package_names = self._loaded_package_names
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local package_name = loaded_package_names[reference_name]

	fassert(package_name, "[HeroWindowGotwfOverview] - Could not find a package to unload for reference name: (%s)", reference_name)
	Managers.package:unload(package_name, reference_name)

	loaded_package_names[reference_name] = nil

	if self:_is_unique_reference_to_material(reference_name) then
		local material_name = cloned_materials_by_reference[reference_name]
		local ui_top_renderer = self._ui_top_renderer
		local top_gui = ui_top_renderer.gui

		self:_set_material_diffuse(top_gui, material_name, PRODUCT_PLACEHOLDER_TEXTURE_PATH)
	end

	cloned_materials_by_reference[reference_name] = nil
end

HeroWindowGotwfItemPreview._delayed_item_unit_presentation = function (self, item)
	local reward_type = item.reward_type

	if reward_type == "keep_decoration_painting" then
		self:_setup_painting_presentation(item)
	else
		self:_setup_item_presentation(item)
	end
end

HeroWindowGotwfItemPreview._setup_painting_presentation = function (self, item)
	local item_name = item.item_id
	local painting_data = Paintings[item_name]

	if not painting_data or item_name == "hidden" then
		return
	end

	local ui_top_renderer = self._ui_top_renderer
	local top_gui = ui_top_renderer.gui
	local package_name
	local subpath = "keep_painting_" .. item_name
	local no_package_required = string.find(item_name, "_none") ~= nil

	if not no_package_required then
		package_name = "resource_packages/keep_paintings/" .. subpath
	end

	self._reference_id = (self._reference_id or 0) + 1

	local reference_name = item_name .. "_" .. self._reference_id
	local texture_name = "keep_painting_" .. item_name
	local template_material_name = "template_store_diffuse_masked"

	self:_create_material_instance(top_gui, texture_name, template_material_name, reference_name)

	local function callback()
		local widget_definition = create_painting_widget()
		local widget = UIWidget.init(widget_definition)
		local content = widget.content
		local style = widget.style

		self._item_texture_widget = widget

		local texture_path = "units/gameplay/keep_paintings/materials/" .. subpath .. "/" .. subpath .. "_df"

		self:_set_material_diffuse(top_gui, texture_name, texture_path)

		local icon_scale = 2
		local base_size = 150 * icon_scale
		local padding = 0.125

		if painting_data.orientation == "horizontal" then
			content.painting = {
				texture_id = texture_name,
				uvs = {
					{
						0,
						padding,
					},
					{
						1,
						1 - padding,
					},
				},
			}
			style.painting.texture_size = {
				base_size,
				base_size * (1 - 2 * padding),
			}
			style.painting_frame.area_size = {
				base_size,
				base_size * (1 - 2 * padding),
			}
		else
			content.painting = {
				texture_id = texture_name,
				uvs = {
					{
						padding,
						0,
					},
					{
						1 - padding,
						1,
					},
				},
			}
			style.painting.texture_size = {
				base_size * (1 - 2 * padding),
				base_size,
			}
			style.painting_frame.area_size = {
				base_size * (1 - 2 * padding),
				base_size,
			}
		end

		self._fadeout_loading_overlay = true

		Renderer.request_textures_to_highest_mip_level()
	end

	if no_package_required then
		callback()
	else
		self:_load_texture_package(package_name, reference_name, callback)
	end
end

HeroWindowGotwfItemPreview._setup_item_presentation = function (self, item)
	local item_key = item.item_id
	local reward_type = item.reward_type
	local masterlist_item

	if reward_type == "chips" then
		masterlist_item = Currencies[item_key]
	elseif reward_type == "currency" then
		masterlist_item, item_key = BackendUtils.get_fake_currency_item(item.currency_code, item.amount)
	else
		masterlist_item = ItemMasterList[item_key]
	end

	local slot_type = masterlist_item.slot_type
	local viewport_widget = self._viewport_widget
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "weapon_skin" then
		local preview_position = {
			0,
			0,
			0,
		}
		local unique_id, invert_start_rotation, display_unit_key = nil, true
		local use_highest_mip_levels = true
		local camera = ScriptViewport.camera(viewport)

		ScriptCamera.set_local_rotation(camera, QuaternionBox(0, 0, 1, 0):unbox())

		local item = {
			data = masterlist_item,
		}
		local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, unique_id, invert_start_rotation, display_unit_key, use_highest_mip_levels)
		local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key)

		item_previewer:activate_auto_spin()
		item_previewer:register_spawn_callback(callback)

		self._item_previewer = item_previewer
	elseif slot_type == "hat" then
		local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, UISettings.hero_hat_camera_position_by_character, "HeroWindowGotwfItemPreview")

		world_previewer:on_enter(viewport_widget)

		self._world_previewer = world_previewer

		local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(masterlist_item)
		local career_settings = CareerSettings[career_name]
		local base_skin = career_settings.base_skin

		self:_spawn_hero_with_hat(world_previewer, profile_name, career_index, base_skin, item_key)
	elseif slot_type == "skin" then
		local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, UISettings.hero_skin_camera_position_by_character, "HeroWindowGotwfItemPreview")

		world_previewer:on_enter(viewport_widget)

		self._world_previewer = world_previewer

		local optional_skin = item_key
		local profile_name, profile_index, career_name, career_index = self:_get_hero_wield_info_by_item(masterlist_item)

		self:_spawn_hero_skin(world_previewer, profile_name, career_index, optional_skin)
	elseif slot_type == "frame" then
		local scenegraph_id = "item_texture"
		local frame_name = masterlist_item.temporary_template or "default"
		local scale = 1.5
		local offset
		local masked = false
		local skip_offset = true
		local widget_definition = UIWidgets.create_base_portrait_frame(scenegraph_id, frame_name, scale, offset, masked, skip_offset)

		self._item_texture_widget = UIWidget.init(widget_definition)
		self._fadeout_loading_overlay = true
	elseif slot_type == "loot_chest" or slot_type == "chips" or slot_type == "crafting_material" or slot_type == "versus_currency_name" then
		self._reference_id = (self._reference_id or 0) + 1

		local reference_name = item_key .. "_" .. self._reference_id

		if slot_type == "chips" then
			item_key = "shillings_medium"
		elseif slot_type == "versus_currency_name" then
			item_key = "versus_currency_small"
		elseif slot_type == "loot_chest" then
			item_key = "loot_chest_generic"
		end

		local store_icon_override_key = masterlist_item.store_icon_override_key
		local texture_name = "store_item_icon_" .. (store_icon_override_key or item_key)
		local package_name = "resource_packages/store/item_icons/" .. texture_name
		local package_available = Application.can_get("package", package_name)

		if package_available then
			local texture_id
			local scenegraph_id = "item_texture"
			local masked, retained, color, offset
			local texture_size = {
				390,
				330,
			}
			local widget_definition = create_texture_widget(texture_id, scenegraph_id, masked, retained, color, offset, texture_size)
			local widget = UIWidget.init(widget_definition)
			local content = widget.content

			content.reference_name = reference_name

			local ui_top_renderer = self._ui_top_renderer
			local top_gui = ui_top_renderer.gui
			local new_material_name = masked and texture_name .. "_masked" or texture_name
			local template_material_name = masked and "template_store_diffuse_masked" or "template_store_diffuse"

			self:_create_material_instance(top_gui, new_material_name, template_material_name, reference_name)

			local function callback()
				local texture_path = "gui/1080p/single_textures/store_item_icons/" .. texture_name .. "/" .. texture_name

				self:_set_material_diffuse(top_gui, new_material_name, texture_path)

				content.texture_id = new_material_name
				self._fadeout_loading_overlay = true
			end

			self:_load_texture_package(package_name, reference_name, callback)

			self._item_texture_widget = widget
		else
			Application.warning("Icon package not accessable for product_id: (%s) and texture_name: (%s)", item_key, texture_name)
		end
	end
end

HeroWindowGotwfItemPreview._update_delayed_item_unit_presentation = function (self, dt)
	local delay = self._delayed_item_unit_presentation_delay

	if not delay then
		return
	end

	delay = math.max(delay - dt, 0)

	if delay == 0 then
		self._delayed_item_unit_presentation_delay = nil

		local selected_product = self._selected_product
		local item = selected_product

		self:_delayed_item_unit_presentation(item)
	else
		self._delayed_item_unit_presentation_delay = delay
	end
end

HeroWindowGotwfItemPreview._set_title_name = function (self, text)
	local widget = self._top_widgets_by_name.title_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._set_sub_title_name = function (self, text)
	local widget = self._top_widgets_by_name.sub_title_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._set_description_text = function (self, text)
	local widget = self._top_widgets_by_name.description_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._set_sub_title_alpha_multiplier = function (self, alpha_multiplier)
	local widget = self._top_widgets_by_name.sub_title_text

	widget.alpha_multiplier = alpha_multiplier
end

HeroWindowGotwfItemPreview._set_type_title_name = function (self, text)
	local widget = self._top_widgets_by_name.type_title_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._set_career_title_name = function (self, text)
	local widget = self._top_widgets_by_name.career_title_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._set_disclaimer_text = function (self, text)
	self._disclaimer_text = text

	local widget = self._top_widgets_by_name.disclaimer_text

	widget.content.text = text

	self:_update_info_text_alignment()
end

HeroWindowGotwfItemPreview._set_amount_text = function (self, text)
	local widget = self._top_widgets_by_name.amount_text

	widget.content.text = text
end

HeroWindowGotwfItemPreview._update_info_text_alignment = function (self)
	local expire_widget = self._top_widgets_by_name.expire_timer_text
	local disclaimer_widget = self._top_widgets_by_name.disclaimer_text
	local divider_widget = self._top_widgets_by_name.disclaimer_divider
	local has_expire_text = self._expire_text and self._expire_text ~= ""
	local has_disclaimer_text = self._disclaimer_text and self._disclaimer_text ~= ""
	local text_widget_1, text_widget_2

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
	local text_1_width = text_widget_1 and UIUtils.get_text_width(ui_renderer, text_widget_1.style.text, text_widget_1.content.text) or 0
	local text_2_width = text_widget_2 and UIUtils.get_text_width(ui_renderer, text_widget_2.style.text, text_widget_2.content.text) or 0
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

HeroWindowGotwfItemPreview.cb_unit_spawned_item_preview = function (self, item_previewer, item_key)
	local ignore_spin = true

	item_previewer:present_item(item_key, ignore_spin)

	self._fadeout_loading_overlay = true
end

HeroWindowGotwfItemPreview._spawn_hero_skin = function (self, world_previewer, hero_name, career_index, optional_skin)
	local callback = callback(self, "cb_hero_unit_spawned_skin_preview", world_previewer, hero_name, career_index)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroWindowGotwfItemPreview._spawn_hero_with_hat = function (self, world_previewer, hero_name, career_index, optional_skin, item_name)
	local callback = callback(self, "cb_hero_unit_spawned_hat_preview", world_previewer, hero_name, career_index, item_name)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroWindowGotwfItemPreview.cb_hero_unit_spawned_skin_preview = function (self, world_previewer, hero_name, career_index)
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

HeroWindowGotwfItemPreview.cb_hero_unit_spawned_hat_preview = function (self, world_previewer, hero_name, career_index, hat_item_name)
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

HeroWindowGotwfItemPreview._get_can_wield_display_text = function (self, can_wield)
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

HeroWindowGotwfItemPreview._get_hero_wield_info_by_item = function (self, item)
	local can_wield = item.can_wield
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

HeroWindowGotwfItemPreview._sync_layout_path = function (self)
	local parent = self._parent
	local old_layout_name = self._old_layout_name
	local layout_name = parent:get_layout_name()

	if layout_name ~= old_layout_name then
		self._old_layout_name = layout_name
	end
end

HeroWindowGotwfItemPreview._update_title_edge_animation = function (self, dt)
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
