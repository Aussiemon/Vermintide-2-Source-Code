require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_forge_overview_definitions")
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
local top_hdr_widget_definitions = definitions.top_hdr_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local weapon_crafting_tutorial_definitions = definitions.weapon_crafting_tutorial_definitions
local DO_RELOAD = false
local UPGRADE_REQUEST_LIMIT = 1.6
HeroWindowWeaveForgeOverview = class(HeroWindowWeaveForgeOverview)
HeroWindowWeaveForgeOverview.NAME = "HeroWindowWeaveForgeOverview"

HeroWindowWeaveForgeOverview.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowWeaveForgeOverview")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._statistics_db = ingame_ui_context.statistics_db
	local statistics_db = self._statistics_db
	local stats_id = self._stats_id
	local onboarding_step = WeaveOnboardingUtils.get_onboarding_step(statistics_db, stats_id)
	local ui_onboarding_state = WeaveOnboardingUtils.get_ui_onboarding_state(statistics_db, stats_id)
	self.weapon_crafting_tutorial = not WeaveOnboardingUtils.tutorial_completed(ui_onboarding_state, WeaveUITutorials.equip_weapon) and WeaveOnboardingUtils.reached_requirements(onboarding_step, WeaveUITutorials.equip_weapon)
	self.forge_upgrade_tutorial = not WeaveOnboardingUtils.tutorial_completed(ui_onboarding_state, WeaveUITutorials.forge_upgrade) and WeaveOnboardingUtils.reached_requirements(onboarding_step, WeaveUITutorials.forge_upgrade)
	self.amulet_introduced = WeaveOnboardingUtils.reached_requirements(onboarding_step, WeaveUITutorials.amulet)
	self._animations = {}
	self._ui_animations = {}

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

	self:_sync_backend_loadout()
end

HeroWindowWeaveForgeOverview._start_transition_animation = function (self, animation_name)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowWeaveForgeOverview.create_ui_elements = function (self, params, offset)
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
	local viewport_button_1 = self._widgets_by_name.viewport_button_1
	local viewport_button_2 = self._widgets_by_name.viewport_button_2
	local viewport_button_3 = self._widgets_by_name.viewport_button_3
	viewport_button_1.content.hotspot.allow_multi_hover = true
	viewport_button_2.content.hotspot.allow_multi_hover = true
	viewport_button_3.content.hotspot.allow_multi_hover = true
	widgets_by_name.upgrade_text.alpha_multiplier = 0
	widgets_by_name.upgrade_bg.alpha_multiplier = 0
	widgets_by_name.skull_circle.alpha_multiplier = 0
	widgets_by_name.skull_circle_shade.alpha_multiplier = 0
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	if self.forge_upgrade_tutorial then
		local upgrade_button = widgets_by_name.upgrade_button
		upgrade_button.content.highlighted = true
		self._ui_animations.upgrade_button_pulse = UIAnimation.init(UIAnimation.pulse_animation, upgrade_button.style.texture_highlight.color, 1, 100, 255, 2)
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

HeroWindowWeaveForgeOverview._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowWeaveForgeOverview._initialize_viewports = function (self)
	local weapon_crafting_tutorial = self.weapon_crafting_tutorial
	local amulet_introduced = self.amulet_introduced
	local slots = {
		{
			slot_name = "slot_melee",
			no_item_sub_title_text = "inventory_screen_melee_weapon_title",
			no_item_for_tutorial = weapon_crafting_tutorial
		},
		{
			unit_name = "units/ui/pup_weave_amulet/pup_weave_amulet",
			package_name = "units/ui/pup_weave_amulet/pup_weave_amulet",
			optional_title = Localize("weave_amulet_name"),
			hidden_for_tutorial = not amulet_introduced
		},
		{
			slot_name = "slot_ranged",
			no_item_sub_title_text = "inventory_screen_ranged_weapon_title",
			no_item_for_tutorial = weapon_crafting_tutorial
		}
	}
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local backend_interface_items = backend_manger:get_interface("items")
	local widgets_by_name = self._widgets_by_name
	local viewports_data = {}

	for i, slot_data in ipairs(slots) do
		local slot_name = slot_data.slot_name
		local package_name = slot_data.package_name
		local unit_name = slot_data.unit_name
		local optional_title = slot_data.optional_title
		local optional_sub_title = slot_data.optional_sub_title
		local hidden_for_tutorial = slot_data.hidden_for_tutorial
		local no_item_for_tutorial = slot_data.no_item_for_tutorial
		local scenegraph_id = "viewport_" .. i
		local invert_rendering = i == #slots
		local viewport_definition = self:_create_viewport_definition(scenegraph_id, invert_rendering)
		local widget = UIWidget.init(viewport_definition)
		widget.content.visible = not hidden_for_tutorial
		local backend_id = slot_name and backend_interface_weaves:get_loadout_item_id(career_name, slot_name)
		local item = backend_id and backend_interface_items:get_item_from_id(backend_id)
		local item_x_offset = -0.8
		local invert_start_rotation = false
		local item_previewer = not no_item_for_tutorial and item and self:_create_item_previewer(widget, item, item_x_offset, invert_start_rotation)
		local unit_previewer = package_name and self:_create_unit_previewer(widget, unit_name, package_name)
		local magic_level = 0
		local power_level = 0
		local title_text = optional_title or ""
		local sub_title_text = optional_sub_title or ""

		if no_item_for_tutorial then
			title_text = Localize("menu_weave_tutorial_athanor_01_empty_state_no_weapon")
			sub_title_text = Localize(slot_data.no_item_sub_title_text)
			power_level = nil
		elseif item then
			magic_level = backend_interface_weaves:get_item_magic_level(backend_id) or 0
			power_level = item.power_level or 0
			power_level = UIUtils.presentable_hero_power_level_weaves(power_level)
			local item_data = item.data
			title_text = Localize(item_data.display_name)
			sub_title_text = Localize(item_data.item_type)
		else
			magic_level = backend_interface_weaves:get_career_magic_level(career_name) or 0
			power_level = backend_interface_weaves:get_career_power_level(career_name)
			power_level = power_level and UIUtils.presentable_hero_power_level_weaves(power_level)
			local career_settings = CareerSettings[career_name]
			sub_title_text = Localize(career_settings.display_name)
		end

		local panel_divider_widget = widgets_by_name["viewport_panel_divider_" .. i]
		local panel_divider_left = widgets_by_name["viewport_panel_divider_left_" .. i]
		local panel_divider_right = widgets_by_name["viewport_panel_divider_right_" .. i]
		local level_text_widget = widgets_by_name["viewport_level_value_" .. i]
		local level_title_widget = widgets_by_name["viewport_level_title_" .. i]
		level_text_widget.content.text = magic_level
		level_text_widget.content.visible = not hidden_for_tutorial and not no_item_for_tutorial
		level_title_widget.content.visible = not hidden_for_tutorial and not no_item_for_tutorial
		local power_text_widget = widgets_by_name["viewport_power_value_" .. i]
		local power_title_widget = widgets_by_name["viewport_power_title_" .. i]
		power_text_widget.content.visible = power_level ~= nil and not hidden_for_tutorial
		power_title_widget.content.visible = power_level ~= nil and not hidden_for_tutorial
		panel_divider_widget.content.visible = power_level ~= nil and not hidden_for_tutorial
		panel_divider_left.content.visible = not hidden_for_tutorial
		panel_divider_right.content.visible = not hidden_for_tutorial

		if power_level then
			power_text_widget.content.text = power_level
		else
			self._ui_scenegraph[level_text_widget.scenegraph_id].local_position[1] = 0
			self._ui_scenegraph[level_title_widget.scenegraph_id].local_position[1] = 0
		end

		local title_widget = widgets_by_name["viewport_title_" .. i]
		title_widget.content.text = title_text
		title_widget.content.visible = not hidden_for_tutorial
		local sub_title_widget = widgets_by_name["viewport_sub_title_" .. i]
		sub_title_widget.content.text = sub_title_text
		sub_title_widget.content.visible = not hidden_for_tutorial
		local viewport_button_widget = widgets_by_name["viewport_button_" .. i]
		local viewport_button_highlight_widget = widgets_by_name["viewport_button_highlight_" .. i]
		local viewport_button_text_highlight_widget = widgets_by_name["viewport_button_text_highlight_" .. i]
		viewport_button_widget.content.hotspot.disable_button = (hidden_for_tutorial or no_item_for_tutorial) == true
		local change_button = widgets_by_name["change_button_" .. i]

		if change_button and weapon_crafting_tutorial then
			change_button.content.highlighted = true
			self._ui_animations["change_button_pulse" .. i] = UIAnimation.init(UIAnimation.pulse_animation, change_button.style.texture_highlight.color, 1, 100, 255, 2)
		end

		local data = {
			widget = widget,
			viewport_button = viewport_button_widget,
			viewport_button_highlight = viewport_button_highlight_widget,
			viewport_button_text_highlight = viewport_button_text_highlight_widget,
			item_previewer = item_previewer,
			unit_previewer = unit_previewer,
			package_name = package_name,
			unit_name = unit_name,
			item = item,
			slot_name = slot_name,
			change_button = change_button,
			magic_level = magic_level,
			power_level = power_level
		}
		viewports_data[i] = data
	end

	if weapon_crafting_tutorial then
		local tutorial_widgets = self._top_widgets

		for name, widget_definition in pairs(weapon_crafting_tutorial_definitions) do
			local widget = UIWidget.init(widget_definition)
			tutorial_widgets[#tutorial_widgets + 1] = widget
		end
	end

	self._viewports_data = viewports_data
end

HeroWindowWeaveForgeOverview._create_item_previewer = function (self, viewport_widget, item, x_offset, invert_start_rotation)
	local item_data = item.data
	local item_key = item_data.key
	local slot_type = item_data.slot_type
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world
	local preview_position = {
		x_offset,
		3,
		0
	}
	local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, nil, invert_start_rotation)
	local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key)

	item_previewer:register_spawn_callback(callback)
	item_previewer:activate_auto_spin()

	return item_previewer
end

HeroWindowWeaveForgeOverview._create_unit_previewer = function (self, viewport_widget, unit_name, package_name)
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world
	local preview_position = {
		0,
		2.8,
		0
	}
	local unit_previewer = UIUnitPreviewer:new(unit_name, package_name, preview_position, world, viewport)
	local callback = callback(self, "cb_unit_spawned_unit_preview", unit_previewer, unit_name)

	unit_previewer:register_spawn_callback(callback)
	unit_previewer:activate_auto_spin()

	return unit_previewer
end

HeroWindowWeaveForgeOverview.cb_unit_spawned_unit_preview = function (self, unit_previewer, unit_name)
	print("cb_unit_spawned_unit_preview", unit_previewer, unit_name)
end

HeroWindowWeaveForgeOverview.cb_unit_spawned_item_preview = function (self, item_previewer, item_key)
	local ignore_spin = true

	item_previewer:present_item(item_key, ignore_spin)
end

HeroWindowWeaveForgeOverview._create_viewport_definition = function (self, scenegraph_id, invert_rendering)
	local shading_environment = (invert_rendering and "environment/ui_weave_forge_preview_inverted") or "environment/ui_weave_forge_preview"

	return {
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 801,
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

HeroWindowWeaveForgeOverview.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowWeaveForgeOverview")

	self._ui_animator = nil

	if self._viewports_data then
		local ui_top_renderer = self._ui_top_renderer

		for _, data in ipairs(self._viewports_data) do
			local item_previewer = data.item_previewer

			if item_previewer then
				item_previewer:destroy()
			end

			local unit_previewer = data.unit_previewer

			if unit_previewer then
				unit_previewer:destroy()
			end

			local widget = data.widget

			UIWidget.destroy(ui_top_renderer, widget)
		end

		self._viewports_data = nil
	end
end

HeroWindowWeaveForgeOverview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._viewports_data then
		for _, data in ipairs(self._viewports_data) do
			local viewport_button = data.viewport_button
			local viewport_button_highlight = data.viewport_button_highlight
			local viewport_button_text_highlight = data.viewport_button_text_highlight
			local item_previewer = data.item_previewer
			local unit_previewer = data.unit_previewer
			local is_hover = self:_is_button_hover(viewport_button)
			local allow_preview_input = false
			local hover_progress = data.hover_progress or 0
			local hover_speed = 5
			local zoom_easing_function = nil

			if is_hover then
				hover_progress = math.min(hover_progress + dt * hover_speed, 1)
			else
				hover_progress = math.max(hover_progress - dt * hover_speed, 0)
			end

			data.hover_progress = hover_progress
			local zoom_anim_progress = math.ease_out_quad(hover_progress)
			viewport_button_highlight.alpha_multiplier = zoom_anim_progress
			viewport_button_text_highlight.alpha_multiplier = zoom_anim_progress
			local max_zoom = 0.12
			local zoom_value = max_zoom * zoom_anim_progress

			if item_previewer then
				item_previewer:set_zoom_fraction(zoom_value)
				item_previewer:update(dt, t, allow_preview_input and input_service)
			end

			if unit_previewer then
				unit_previewer:set_zoom_fraction(zoom_value)
				unit_previewer:update(dt, t, allow_preview_input and input_service)
			end
		end
	end

	local upgrade_done_time = self._upgrade_forge_done_time

	if upgrade_done_time and upgrade_done_time < t then
		local response = self._upgrade_forge_response

		if response ~= nil then
			self:_upgrade_forge_done(response)

			self._upgrade_forge_done_time = nil
			self._upgrade_forge_response = nil
		end
	end

	self:_update_animations(dt)
	self:_draw(dt)
end

HeroWindowWeaveForgeOverview.post_update = function (self, dt, t)
	if not self._viewports_data then
		self:_initialize_viewports()
	end

	if self._viewports_data then
		for _, data in ipairs(self._viewports_data) do
			local item_previewer = data.item_previewer
			local unit_previewer = data.unit_previewer

			if item_previewer then
				item_previewer:post_update(dt, t)
			end

			if unit_previewer then
				unit_previewer:post_update(dt, t)
			end
		end
	end

	self:_handle_input(dt, t)
end

HeroWindowWeaveForgeOverview._update_animations = function (self, dt)
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

	if self._viewports_data then
		for _, data in ipairs(self._viewports_data) do
			local customize_button = data.customize_button

			if customize_button then
			end

			local change_button = data.change_button

			if change_button then
				UIWidgetUtils.animate_icon_button(change_button, dt)
			end
		end
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.upgrade_button, dt)
end

HeroWindowWeaveForgeOverview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		if not hotspot.is_selected then
			return true
		end
	end
end

HeroWindowWeaveForgeOverview._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowWeaveForgeOverview._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroWindowWeaveForgeOverview._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end

HeroWindowWeaveForgeOverview._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_selected
end

HeroWindowWeaveForgeOverview._sync_backend_loadout = function (self)
	local backend_manger = Managers.backend
	local backend_interface_items = backend_manger:get_interface("items")
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local essence_amount = backend_interface_weaves:get_essence()
	local forge_level = backend_interface_weaves:get_forge_level()
	local forge_max_level = backend_interface_weaves:forge_max_level()

	self:_set_forge_level(forge_level)

	self._forge_level = forge_level
	local can_upgrade = forge_level < forge_max_level

	self:_set_forge_upgrade_price_by_level(can_upgrade and forge_level + 1, essence_amount)
	self:_setup_upgrade_tooltip(forge_level, forge_max_level)
end

HeroWindowWeaveForgeOverview._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._parent:window_input_service()
	local params = self._params

	if self._viewports_data then
		for index, data in ipairs(self._viewports_data) do
			local change_button = data.change_button

			if change_button and self:_is_button_hover_enter(change_button) then
				self:_play_sound("Play_hud_hover")
			end

			if change_button and self:_is_button_pressed(change_button) then
				local item = data.item
				local slot_name = data.slot_name

				if item then
					params.selected_item = item
					params.selected_slot_name = slot_name

					parent:set_layout_by_name("weave_weapon_select")

					break
				end
			end

			local viewport_button = data.viewport_button

			if viewport_button and self:_is_button_hover_enter(viewport_button) then
				self:_play_sound("menu_magic_forge_hover")
			end

			if viewport_button and self:_is_button_pressed(viewport_button) then
				local item = data.item
				local slot_name = data.slot_name
				local unit_name = data.unit_name
				params.selected_item = item
				params.selected_slot_name = slot_name
				params.selected_unit_name = unit_name

				parent:set_layout_by_name("weave_properties")

				break
			end
		end
	end

	local upgrade_button = widgets_by_name.upgrade_button

	if self:_is_button_hover_enter(upgrade_button) and not upgrade_button.content.button_hotspot.disable_button then
		self:_play_sound("Play_hud_hover")
	end

	if self:_is_button_pressed(upgrade_button) then
		self:_upgrade_forge()
	end
end

HeroWindowWeaveForgeOverview._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local parent = self._parent
	local input_service = parent:window_input_service()
	local render_settings = self._render_settings
	local hdr_renderer = parent:hdr_renderer()
	local hdr_top_renderer = parent:hdr_top_renderer()
	local alpha_multiplier = render_settings.alpha_multiplier

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

	local snap_pixel_positions = render_settings.snap_pixel_positions

	for _, widget in ipairs(self._top_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if self._viewports_data then
		for _, data in ipairs(self._viewports_data) do
			local widget = data.widget
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	for _, widget in ipairs(self._bottom_widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

HeroWindowWeaveForgeOverview._set_forge_upgrade_price_by_level = function (self, forge_level, current_essence_amount)
	local backend_interface_weaves = Managers.backend:get_interface("weaves")
	local cost = backend_interface_weaves:forge_upgrade_cost()
	local can_afford = (cost and cost <= current_essence_amount) or false

	self:_set_essence_upgrade_cost(cost, can_afford)
end

HeroWindowWeaveForgeOverview._upgrade_forge_cb = function (self, success)
	self._upgrade_forge_response = success
end

HeroWindowWeaveForgeOverview._upgrade_forge_done = function (self, success)
	self._params.upgrading = nil

	self._parent:unblock_input()

	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button
	upgrade_button.content.upgrading = false

	if success then
		self:_play_sound("menu_magic_forge_forge_upgrade")
		self:_sync_backend_loadout()
		Managers.state.event:trigger("weave_forge_upgraded")

		if self.forge_upgrade_tutorial then
			self.forge_upgrade_tutorial = false
			upgrade_button.content.highlighted = false
			self._ui_animations.upgrade_button_pulse = nil
		end

		local animation_name = "upgrade"
		local active_animation_id = self._animations[animation_name]

		if active_animation_id then
			self._ui_animator:stop_animation(active_animation_id)

			self._animations[animation_name] = nil
		end

		self:_start_transition_animation(animation_name)
	end
end

HeroWindowWeaveForgeOverview._upgrade_forge = function (self)
	self._params.upgrading = true

	self._parent:block_input()

	local time = Application.time_since_launch()
	self._upgrade_forge_done_time = time + UPGRADE_REQUEST_LIMIT
	self._upgrade_forge_response = nil
	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button
	upgrade_button.content.upgrading = true
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local callback = callback(self, "_upgrade_forge_cb")

	backend_interface_weaves:upgrade_forge(callback)
end

HeroWindowWeaveForgeOverview._setup_upgrade_tooltip = function (self, athanor_level, max_athanor_level)
	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button
	local upgrade_tooltip_data = nil
	local next_athanor_level = athanor_level + 1

	if max_athanor_level >= next_athanor_level then
		upgrade_tooltip_data = {
			title = string.format(Localize("menu_weave_forge_tooltip_upgrade_athanor_title"), next_athanor_level),
			sub_title = string.format(Localize("menu_weave_forge_tooltip_upgrade_item_description"), max_athanor_level),
			divider_description = Localize("menu_weave_forge_tooltip_upgrade_athanor_description"),
			upgrade_effect_title = Localize("menu_weave_forge_tooltip_upgrade_item_effect_title")
		}
		local backend_interface_weaves = Managers.backend:get_interface("weaves")
		local property_tooltips = nil
		local properties = WeaveProperties.properties

		for property_key, property_data in pairs(properties) do
			local required_forge_level = backend_interface_weaves:get_property_required_forge_level(property_key) or 0

			if required_forge_level == next_athanor_level then
				local icon = property_data.icon or "icons_placeholder"
				local display_name = property_data.display_name
				local mastery_costs = backend_interface_weaves:get_property_mastery_costs(property_key)
				local title_text = UIUtils.get_weave_property_description(property_key, property_data, mastery_costs)
				property_tooltips = property_tooltips or {}
				property_tooltips[#property_tooltips + 1] = {
					text = title_text,
					icon = icon
				}
			end
		end

		upgrade_tooltip_data.property_unlock_table = property_tooltips
		local trait_tooltips = nil
		local weave_traits = WeaveTraits.traits

		for trait_key, trait_data in pairs(weave_traits) do
			local required_forge_level = backend_interface_weaves:get_trait_required_forge_level(trait_key) or 0

			if required_forge_level == next_athanor_level then
				local display_name = trait_data.display_name
				local trait_advanced_description = trait_data.advanced_description
				local trait_icon = trait_data.icon
				local title_text = Localize(display_name)
				local description_text = ""

				if trait_advanced_description then
					description_text = UIUtils.get_trait_description(trait_key, trait_data)
				end

				trait_tooltips = trait_tooltips or {}
				trait_tooltips[#trait_tooltips + 1] = {
					text = title_text,
					icon = trait_icon
				}
			end
		end

		upgrade_tooltip_data.trait_unlock_table = trait_tooltips
	end

	upgrade_button.content.tooltip = upgrade_tooltip_data
end

HeroWindowWeaveForgeOverview._set_essence_upgrade_cost = function (self, essence_amount, can_afford)
	local widgets_by_name = self._widgets_by_name
	local widget_button = widgets_by_name.upgrade_button
	local button_content = widget_button.content
	local button_style = widget_button.style
	local button_text = ""

	if essence_amount then
		local value_string = WeaveUtils.comma_value(essence_amount)
		button_text = Localize("menu_weave_forge_upgrade_button") .. " " .. value_string
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
		button_style.price_icon.offset[1] = button_style.title_text.offset[1] + text_width / 2 + spacing
		button_style.price_icon_disabled.offset[1] = button_style.price_icon.offset[1]
		button_style.price_icon.color[1] = 255
		button_style.price_icon_disabled.color[1] = 255
		self._can_upgrade = true
	else
		button_text = Localize("menu_weave_forge_upgrade_loadout_button_cap")
		button_style.title_text.offset[1] = button_style.title_text.default_offset[1]
		button_style.title_text_shadow.offset[1] = button_style.title_text_shadow.default_offset[1]
		button_style.title_text_disabled.offset[1] = button_style.title_text_disabled.default_offset[1]
		button_style.price_icon.color[1] = 0
		button_style.price_icon_disabled.color[1] = 0
		self._can_upgrade = false
	end

	button_content.button_hotspot.disable_button = not essence_amount or not can_afford
	button_content.title_text = button_text
end

HeroWindowWeaveForgeOverview._set_forge_level = function (self, level)
	local widgets_by_name = self._widgets_by_name
	local widget_title = widgets_by_name.forge_level_title
	local widget_value = widgets_by_name.forge_level_text
	widget_value.content.text = level
	local ui_renderer = self._ui_top_renderer
	local title_text_width = UIUtils.get_text_width(ui_renderer, widget_title.style.text, widget_title.content.text)
	local value_text_width = UIUtils.get_text_width(ui_renderer, widget_value.style.text, widget_value.content.text)
	local spacing = 10
	local total_width = title_text_width + value_text_width + spacing
	local title_text_offset = -(total_width / 2 - title_text_width / 2)
	widget_title.style.text.offset[1] = title_text_offset
	widget_title.style.text_shadow.offset[1] = title_text_offset
	widget_value.style.text.offset[1] = title_text_offset + title_text_width / 2 + value_text_width / 2 + spacing
	widget_value.style.text_shadow.offset[1] = widget_value.style.text.offset[1]
end

return
