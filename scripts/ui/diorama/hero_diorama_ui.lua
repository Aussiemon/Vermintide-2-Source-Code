-- chunkname: @scripts/ui/diorama/hero_diorama_ui.lua

local definitions = local_require("scripts/ui/diorama/hero_diorama_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local DO_RELOAD = false
local OVERLAY_FADE_DURATION = 0.8

HeroDioramaUI = class(HeroDioramaUI)
HeroDioramaUI.unique_id = HeroDioramaUI.unique_id or 0

HeroDioramaUI.init = function (self, ingame_ui_context, settings)
	self._settings = settings
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._ingame_ui_context = ingame_ui_context
	self._player_manager = ingame_ui_context.player_manager

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)
	self._instance_id = self:_get_unique_id()
	self._animations = {}
	self._active = false
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}

	self:_create_ui_elements()

	self._viewport_active = true
end

HeroDioramaUI._get_unique_id = function (self)
	local unique_id = HeroDioramaUI.unique_id

	HeroDioramaUI.unique_id = unique_id + 1

	return unique_id
end

HeroDioramaUI._create_ui_elements = function (self)
	DO_RELOAD = false

	if self._viewport_widget then
		self:_unload_level_package()
		self:_unload_diorama_package()
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets_by_name = widgets_by_name
	self._widgets = widgets
	self._viewport_widget_definition = self:_create_viewport_definition()

	local resource_id = "diorama_test"
	local asynchronous = true
	local cb = callback(self, "_cb_diorama_package_loaded")

	Managers.package:load("resource_packages/dlcs/carousel_diorama", resource_id, cb, asynchronous)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	self:update_position()
	self:_reset_overlay()
end

HeroDioramaUI._cb_level_package_loaded = function (self)
	self._level_package_loaded = true
end

HeroDioramaUI._cb_diorama_package_loaded = function (self)
	self._diorama_package_loaded = true

	local level_package_name = self._viewport_widget_definition.style.viewport.level_package_name
	local resource_id = self:_resource_id()
	local asynchronous = true
	local cb = callback(self, "_cb_level_package_loaded")

	Managers.package:load(level_package_name, resource_id, cb, asynchronous)
end

HeroDioramaUI.fade_in = function (self, duration)
	self._fade_in_duration = duration
	self._fade_timer = 0
end

HeroDioramaUI.fade_out = function (self, duration)
	self._fade_out_duration = duration
	self._fade_timer = 0
end

HeroDioramaUI._fade_out_overlay = function (self)
	self._overlay_fade_out_time = 0
end

HeroDioramaUI._reset_overlay = function (self)
	local widget = self._widgets_by_name.overlay

	widget.alpha_multiplier = 1
	self._overlay_fade_out_time = nil
	self._destroy_previewer_on_fade_out = true
end

HeroDioramaUI._update_overlay_fade_out_animation = function (self, dt)
	local time = self._overlay_fade_out_time

	if not time then
		return
	end

	time = time + dt

	local progress = math.min(time / OVERLAY_FADE_DURATION, 1)
	local widget = self._widgets_by_name.overlay

	widget.alpha_multiplier = 1 - progress

	if progress == 1 then
		self._overlay_fade_out_time = nil
	else
		self._overlay_fade_out_time = time
	end
end

HeroDioramaUI._update_fade_animations = function (self, dt)
	self:_update_fade_in_animation(dt)
	self:_update_fade_out_animation(dt)
	self:_update_overlay_fade_out_animation(dt)
end

HeroDioramaUI._update_fade_in_animation = function (self, dt)
	local time = self._fade_timer
	local fade_duration = self._fade_in_duration

	if not time or not fade_duration then
		return
	end

	time = time + dt

	local progress = math.min(time / fade_duration, 1)
	local render_settings = self._render_settings

	render_settings.alpha_multiplier = progress

	if progress == 1 then
		self._fade_in_duration = nil
		self._fade_timer = nil
	else
		self._fade_timer = time
	end
end

HeroDioramaUI._update_fade_out_animation = function (self, dt)
	local time = self._fade_timer
	local fade_duration = self._fade_out_duration

	if not time or not fade_duration then
		return
	end

	time = time + dt

	local progress = math.min(time / fade_duration, 1)
	local render_settings = self._render_settings

	render_settings.alpha_multiplier = 1 - progress

	if progress == 1 then
		self._fade_out_duration = nil
		self._fade_timer = nil
	else
		self._fade_timer = time
	end
end

HeroDioramaUI.set_viewport_active = function (self, active)
	self._viewport_active = active
end

HeroDioramaUI._update_viewport_active_state = function (self)
	local vieport_active = self._viewport_active

	if self._synced_viewport_active_state ~= vieport_active then
		local viewport_widget = self._viewport_widget
		local style = viewport_widget.style
		local viewport_style = style.viewport
		local viewport_name = viewport_style.viewport_name
		local world_name = viewport_style.world_name
		local pass_data = viewport_widget.element.pass_data[1]
		local world = pass_data.world
		local viewport = pass_data.viewport

		if vieport_active then
			if self._synced_viewport_active_state == false then
				ScriptWorld.activate_viewport(world, viewport)
			end

			self:_fade_out_overlay()
		else
			ScriptWorld.deactivate_viewport(world, viewport)
			self:_reset_overlay()
		end

		self._synced_viewport_active_state = vieport_active
	end
end

HeroDioramaUI._create_viewport_definition = function (self)
	local shading_environment = "environment/ui_store_preview"
	local instance_id = self._instance_id
	local dioramas = {
		"fire_01/tier_01",
		"fire_01/tier_02",
		"fire_01/tier_03",
		"forest_01/tier_01",
		"forest_01/tier_02",
		"forest_01/tier_03",
		"snow_01/tier_01",
		"snow_01/tier_02",
		"snow_01/tier_03",
	}
	local level = table.random(dioramas)

	return {
		scenegraph_id = "viewport",
		element = UIElements.Viewport,
		style = {
			viewport = {
				enable_sub_gui = false,
				fov = 30,
				layer = 800,
				viewport_type = "default_offscreen",
				shading_environment = shading_environment,
				world_name = "diorama_preview_" .. tostring(instance_id),
				viewport_name = "diorama_preview_viewport_" .. tostring(instance_id),
				level_name = string.format("levels/diorama/%s/world", level),
				level_package_name = string.format("resource_packages/levels/dlcs/carousel/diorama/%s", level),
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
				},
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
				offset = {
					0,
					0,
					0,
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

HeroDioramaUI._set_size = function (self, size)
	local ui_scenegraph = self._ui_scenegraph
	local background = ui_scenegraph.background
	local viewport = ui_scenegraph.viewport
	local hero_text_box = ui_scenegraph.hero_text_box
	local player_text_box = ui_scenegraph.player_text_box
	local bottom_panel = ui_scenegraph.bottom_panel
	local bottom_panel_edge = ui_scenegraph.bottom_panel_edge
	local bottom_panel_edge_size = bottom_panel_edge.size
	local bottom_panel_size = bottom_panel.size
	local hero_text_box_size = hero_text_box.size
	local player_text_box_size = player_text_box.size
	local background_size = background.size
	local viewport_size = viewport.size

	background_size[1] = math.max(size and size[1] or 500, 1)
	background_size[2] = math.max(size and size[2] or 500, 1)
	viewport_size[1] = math.max(size and size[1] or 500, 1)
	viewport_size[2] = math.max((size and size[2] or 500) - bottom_panel_size[2], 1)
	bottom_panel_size[1] = math.max(size and size[1] or 500, 1)
	bottom_panel_edge_size[1] = math.max(size and size[1] or 500, 1)
	hero_text_box_size[1] = math.max((size and size[1] or 500) - bottom_panel_size[2] * 2, 1)
	player_text_box_size[1] = math.max((size and size[1] or 500) - bottom_panel_size[2], 1)

	self:_update_panel_background()
end

HeroDioramaUI._update_panel_background = function (self, optional_color)
	local create_panel_background = definitions.create_panel_background
	local scenegraph_id = "bottom_panel"
	local size = self._ui_scenegraph[scenegraph_id].size
	local background_texture = "talent_tree_bg_01"
	local color = optional_color or {
		255,
		255,
		255,
		255,
	}
	local definition = create_panel_background(scenegraph_id, size, background_texture, color)
	local widget = UIWidget.init(definition)

	self._bottom_panel_widget = widget
end

HeroDioramaUI.update_position = function (self)
	local settings = self._settings

	if settings then
		local size = settings.size

		self:_set_size(size)

		local position = settings.position
		local vertical_alignment = settings.vertical_alignment
		local horizontal_alignment = settings.horizontal_alignment

		self:_set_position(position, horizontal_alignment, vertical_alignment)
	end
end

HeroDioramaUI._set_position = function (self, position, horizontal_alignment, vertical_alignment)
	local scenegraph = self._ui_scenegraph.background
	local current_position = scenegraph.position

	current_position[1] = position and position[1] or 0
	current_position[2] = position and position[2] or 0
	current_position[3] = position and position[3] or 0
	scenegraph.vertical_alignment = vertical_alignment or "center"
	scenegraph.horizontal_alignment = horizontal_alignment or "center"
end

HeroDioramaUI.destroy = function (self)
	self:_destroy_previewers()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self:_unload_level_package()
	self:_unload_diorama_package()

	self._ui_animator = nil
end

HeroDioramaUI._resource_id = function (self)
	return "HeroDioramaUI_" .. self._instance_id
end

HeroDioramaUI._can_create_viewport = function (self)
	if self._viewport_widget then
		return false
	end

	return self._level_package_loaded and self._cb_diorama_package_loaded
end

HeroDioramaUI.set_hero_profile = function (self, profile_index, career_index)
	if self._viewport_widget then
		self._cashed_profile_data = nil

		self:_set_hero_profile(profile_index, career_index)
	else
		self._cashed_profile_data = {
			profile_index = profile_index,
			career_index = career_index,
		}
	end
end

HeroDioramaUI._set_hero_profile = function (self, profile_index, career_index)
	self:_setup_character_previewer(profile_index, career_index)

	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	local experience = ExperienceSettings.get_versus_profile_experience()
	local level_text = ExperienceSettings.get_versus_profile_level_from_experience(experience) or ""
	local player_portrait_frame = self:_get_portrait_frame(profile_index, career_index)
	local portrait_texture = career_index and UIUtils.get_portrait_image_by_profile_index(profile_index, career_index) or "unit_frame_portrait_default"

	self:_set_portrait_frame(player_portrait_frame, level_text, portrait_texture)
	self:_set_career_name(profile_index, career_index)

	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local career_color = Colors.get_color_table_with_alpha(career_name, 255) or Colors.color_definitions.white

	self:_update_panel_background(career_color)
end

HeroDioramaUI.post_update = function (self, dt, t)
	if DO_RELOAD then
		self:_destroy_previewers()
		self:_create_ui_elements()
	end

	if self:_can_create_viewport() then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)

		local cashed_profile_data = self._cashed_profile_data

		if cashed_profile_data then
			local profile_index = cashed_profile_data.profile_index
			local career_index = cashed_profile_data.career_index

			self._cashed_profile_data = nil

			self:_set_hero_profile(profile_index, career_index)
		end
	end

	if self._viewport_widget then
		self:_update_viewport_active_state()
	end

	if self._world_previewer then
		self._world_previewer:post_update(dt, t)
	end

	if RESOLUTION_LOOKUP.modified then
		self:update_position()
	end
end

HeroDioramaUI.update = function (self, dt, t)
	if self._world_previewer and not DO_RELOAD then
		local input_disabled = true

		self._world_previewer:update(dt, t, input_disabled)
	end

	self:_update_animations(dt, t)
	self:_draw(dt)
end

HeroDioramaUI._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	self:_update_fade_animations(dt)
end

HeroDioramaUI._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local viewport_widget = self._viewport_widget

	if viewport_widget then
		render_settings.alpha_multiplier = math.min(viewport_widget.alpha_multiplier or alpha_multiplier, alpha_multiplier)

		UIRenderer.draw_widget(ui_renderer, viewport_widget)
	end

	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	if widgets then
		for i = 1, #widgets do
			local widget = widgets[i]

			render_settings.alpha_multiplier = math.min(widget.alpha_multiplier or alpha_multiplier, alpha_multiplier)

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local portrait_widget = self._portrait_widget

	if portrait_widget then
		render_settings.alpha_multiplier = math.min(portrait_widget.alpha_multiplier or alpha_multiplier, alpha_multiplier)

		UIRenderer.draw_widget(ui_top_renderer, portrait_widget)
	end

	local bottom_panel_widget = self._bottom_panel_widget

	if bottom_panel_widget then
		render_settings.alpha_multiplier = math.min(bottom_panel_widget.alpha_multiplier or alpha_multiplier, alpha_multiplier)

		UIRenderer.draw_widget(ui_top_renderer, bottom_panel_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

HeroDioramaUI._unload_level_package = function (self)
	local resource_id = self:_resource_id()
	local level_package_name = self._viewport_widget_definition.style.viewport.level_package_name

	Managers.package:unload(level_package_name, resource_id)

	self._level_package_loaded = false
end

HeroDioramaUI._unload_diorama_package = function (self)
	Managers.package:unload("resource_packages/dlcs/carousel_diorama", "diorama_test")

	self._diorama_package_loaded = false
end

HeroDioramaUI._destroy_previewers = function (self)
	local world_previewer = self._world_previewer

	if world_previewer then
		world_previewer:prepare_exit()
		world_previewer:on_exit()
		world_previewer:destroy()

		self._world_previewer = nil
	end
end

local camera_position_by_character = {
	default = {
		x = 0,
		y = 0,
		z = 0.4,
	},
}

HeroDioramaUI._setup_character_previewer = function (self, profile_index, career_index)
	self:_destroy_previewers()

	local viewport_widget = self._viewport_widget
	local world_previewer = MenuWorldPreviewer:new(self._ingame_ui_context, camera_position_by_character)

	world_previewer:on_enter(viewport_widget)
	world_previewer:set_camera_axis_offset("y", 3.5, 0.01, math.easeOutCubic)

	self._world_previewer = world_previewer

	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	local career = profile.careers[career_index]
	local career_name = career.name
	local career_settings = CareerSettings[career_name]
	local base_skin = career_settings.base_skin
	local optional_skin
	local cb = callback(self, "cb_hero_unit_spawned_preview", world_previewer, profile_name, career_index)

	world_previewer:request_spawn_hero_unit(profile_name, career_index, false, cb, 1, nil, optional_skin)

	local flags = {
		"units/diorama/podium/diorama_banner_flag_01",
		"units/diorama/podium/diorama_banner_flag_02",
	}

	cb = callback(self, "cb_flag_spawned", world_previewer)

	world_previewer:request_spawn_unit(table.random(flags), "flag", cb)

	local poles = {
		"units/diorama/podium/diorama_banner_pole_01",
		"units/diorama/podium/diorama_banner_pole_02",
	}

	cb = callback(self, "cb_pole_spawned", world_previewer)

	world_previewer:request_spawn_unit(table.random(poles), "pole", cb)

	local podiums = {
		"units/diorama/podium/diorama_podium_rock_01",
		"units/diorama/podium/diorama_podium_stone_01",
		"units/diorama/podium/diorama_podium_dwarf_01",
		"units/diorama/podium/diorama_podium_pile_of_skulls_01",
	}

	cb = callback(self, "cb_podium_spawned", world_previewer)

	world_previewer:request_spawn_unit(table.random(podiums), "podium", cb)
	self:_reset_overlay()
end

HeroDioramaUI.cb_hero_unit_spawned_preview = function (self, world_previewer, hero_name, career_index)
	world_previewer:set_hero_location({
		0,
		0,
		0.43,
	})

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
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]
			local is_weapon = slot_type == "melee" or slot_type == "ranged"

			if is_weapon then
				world_previewer:wield_weapon_slot(slot_type)
			end

			world_previewer:equip_item(item_name, slot)
		end
	end

	if preview_idle_animation then
		-- Nothing
	end

	if self._viewport_active then
		self:_fade_out_overlay()
	end
end

HeroDioramaUI.cb_flag_spawned = function (self, world_previewer, unit)
	world_previewer:set_unit_location(unit, {
		0,
		-1.5,
		0,
	})
end

HeroDioramaUI.cb_pole_spawned = function (self, world_previewer, unit)
	world_previewer:set_unit_location(unit, {
		0,
		-1.5,
		0,
	})
end

HeroDioramaUI.cb_podium_spawned = function (self, world_previewer, unit)
	world_previewer:set_unit_location(unit, {
		0,
		0,
		0,
	})
end

HeroDioramaUI._set_career_name = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local display_name = career_data.display_name
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.career_name
	local content = widget.content

	content.text = Localize(display_name)
end

HeroDioramaUI._set_hero_name = function (self, profile_index)
	local profile = SPProfiles[profile_index]
	local ingame_short_display_name = profile.ingame_short_display_name
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.hero_name
	local content = widget.content

	content.text = Localize(ingame_short_display_name)
end

HeroDioramaUI.set_player_name = function (self, text)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.player_name
	local content = widget.content

	content.text = text
end

HeroDioramaUI._set_portrait_frame = function (self, frame_settings_name, level_text, portrait_texture, optional_scale)
	local scale = optional_scale or 1
	local retained_mode = false
	local widget_definition = UIWidgets.create_portrait_frame("portrait_pivot", frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content

	widget_content.frame_settings_name = frame_settings_name
	widget_content.level_text = level_text
	self._portrait_widget = widget
end

HeroDioramaUI._get_portrait_frame = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local player_portrait_frame = "default"
	local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

	if item then
		local item_data = item.data
		local frame_name = item_data.temporary_template

		player_portrait_frame = frame_name or player_portrait_frame
	end

	return player_portrait_frame
end
