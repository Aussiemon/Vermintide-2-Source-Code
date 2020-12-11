local definitions = local_require("scripts/ui/reward_popup/reward_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
RewardPopupUI = class(RewardPopupUI)
local DO_RELOAD = true
local FAST_POPUP_SPEED_MULT_OPEN = 10
local FAST_POPUP_SPEED_MULT_CLOSE = 2.5
local INPUT_SERVICE_NAME = "rewards_popups"

RewardPopupUI.init = function (self, level_end_view_context)
	self.ui_renderer = level_end_view_context.ui_renderer
	self.ui_top_renderer = level_end_view_context.ui_top_renderer
	self.input_manager = level_end_view_context.input_manager
	self.world = level_end_view_context.world
	local wwise_world = level_end_view_context.wwise_world
	self.wwise_world = wwise_world or Managers.world:wwise_world(self.world)
	self.render_settings = {
		snap_pixel_positions = true
	}

	self:create_ui_elements()
	rawset(_G, "reward_popup_ui", self)
	self:_setup_input()
end

RewardPopupUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	self.background_top_widget = UIWidget.init(widget_definitions.background_top)
	self.background_center_widget = UIWidget.init(widget_definitions.background_center)
	self.background_bottom_widget = UIWidget.init(widget_definitions.background_bottom)
	self.background_bottom_glow_widget = UIWidget.init(widget_definitions.background_bottom_glow)
	self.background_top_glow_widget = UIWidget.init(widget_definitions.background_top_glow)
	self.screen_background_widget = UIWidget.init(widget_definitions.screen_background)

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	self._animations = {}
	self.is_visible = true
	self._speed_up_popup = false
end

RewardPopupUI.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager

	self:_setup_input()
end

RewardPopupUI.destroy = function (self)
	self:_release_input()

	self.ui_animator = nil

	self:set_visible(false)

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	rawset(_G, "reward_popup_ui", nil)
end

RewardPopupUI.set_visible = function (self, visible)
	self.is_visible = visible
end

RewardPopupUI.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	if self.input_acquired and self:is_presentation_complete() then
		self:_release_input()
	end

	if not self.is_visible or not self.draw_widgets then
		return
	end

	if not self._speed_up_popup then
		local input_service = self.input_manager:get_service(INPUT_SERVICE_NAME)

		if input_service:get("toggle_menu", true) or input_service:get("back", true) or input_service:get("skip_pressed", true) then
			self._speed_up_popup = true
		end
	end

	local is_dirty = self:_update_presentation_animation(dt)

	if self._speed_up_popup then
		local animation_data = self._animation_presentation_data

		if animation_data then
			if animation_data.end_animation_key then
				dt = dt * FAST_POPUP_SPEED_MULT_CLOSE
			else
				dt = dt * FAST_POPUP_SPEED_MULT_OPEN
			end
		end
	end

	if self:_update_animations(dt) then
		is_dirty = true
	end

	if not is_dirty then
		local resolution_modified = RESOLUTION_LOOKUP.modified

		if resolution_modified then
			is_dirty = true
		end
	end

	local animation_params = self._animation_params

	if animation_params then
		local blur_progress = animation_params.blur_progress or 1

		self:set_fullscreen_effect_enable_state(true, blur_progress)
	end

	self:draw(dt)
end

RewardPopupUI._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations_running = false

	for animation_key, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_key] = nil
		end

		animations_running = true
	end

	return animations_running
end

RewardPopupUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("end_of_level")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self.background_top_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_center_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_bottom_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_bottom_glow_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_top_glow_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.screen_background_widget)

	local animation_presentation_data = self._animation_presentation_data

	if animation_presentation_data and not animation_presentation_data.complete then
		local entries = animation_presentation_data.entries
		local entry_play_index = animation_presentation_data.entry_play_index
		local entry = entries[entry_play_index]

		if entry then
			local widgets_data = entry.widgets_data

			for _, data in ipairs(widgets_data) do
				local alpha_multiplier = data.alpha_multiplier
				render_settings.alpha_multiplier = alpha_multiplier
				local widget = data.widget

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.alpha_multiplier = nil
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

RewardPopupUI.display_presentation = function (self, data)
	self.draw_widgets = true
	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	self._animations = {}
	local animation_presentation_data = self:_setup_presentation(data)
	self._animation_presentation_data = animation_presentation_data

	self:set_visible(true)

	self._presentation_complete = false
	self._speed_up_popup = false

	self:_acquire_input()
end

RewardPopupUI.is_presentation_active = function (self)
	return self._animation_presentation_data ~= nil
end

RewardPopupUI.is_presentation_complete = function (self)
	return self._presentation_complete
end

RewardPopupUI.on_presentation_complete = function (self)
	self._presentation_complete = true
	self.draw_widgets = false

	self:set_visible(false)
	self:set_fullscreen_effect_enable_state(false)

	self._animation_presentation_data = nil
end

RewardPopupUI.start_presentation_animation = function (self, animation_name, widgets)
	local params = {
		wwise_world = self.wwise_world
	}

	if not widgets then
		local widgets = {
			background_top = self.background_top_widget,
			background_center = self.background_center_widget,
			background_bottom = self.background_bottom_widget,
			background_bottom_glow = self.background_bottom_glow_widget,
			background_top_glow = self.background_top_glow_widget
		}
	end

	local animation_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	local animation_key = animation_name .. animation_id
	self._animations[animation_key] = animation_id
	self._animation_params = params

	return animation_key
end

RewardPopupUI._setup_entry_widget = function (self, entry_data, index)
	local value = entry_data.value
	local widget_type = entry_data.widget_type
	local ignore_height = entry_data.ignore_height
	local widget_definitions = definitions.widget_definitions
	local widget = UIWidget.init(widget_definitions[widget_type])
	local scenegraph_id = widget.scenegraph_id
	local widget_scenegraph_size = scenegraph_definition[scenegraph_id].size
	local widget_size = self.ui_scenegraph[scenegraph_id].size
	local fake_size = {
		0,
		0
	}
	local widget_height = 0

	if widget_type == "title" or widget_type == "level" then
		widget.content.text = value
		local style = widget.style.text
		widget_size[2] = UIUtils.get_text_height(self.ui_renderer, widget_scenegraph_size, style, value)
		widget_height = widget_size[2]
	elseif widget_type == "description" then
		widget.content.title_text = value[1]
		widget.content.text = value[2]
		local text_style = widget.style.text
		local title_text_style = widget.style.title_text
		local text_height = UIUtils.get_text_height(self.ui_renderer, widget_scenegraph_size, text_style, value[1])
		local title_text_height = UIUtils.get_text_height(self.ui_renderer, widget_scenegraph_size, title_text_style, value[2])
		widget_size[2] = text_height + title_text_height
		widget_height = widget_size[2]
	elseif widget_type == "texture" or widget_type == "icon" then
		widget.content.texture_id = value
		local style = widget.style.texture_id
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(value)
		local texture_size = texture_settings.size
		widget_size = style.texture_size
		widget_size[1] = texture_size[1]
		widget_size[2] = texture_size[2]
		style.offset[3] = index

		if widget.style.frame then
			widget.style.frame.offset[3] = index + 1
		end

		widget_height = widget_size[2] / 2
	elseif widget_type == "weapon_skin" or widget_type == "skin" then
		local data = value.data
		local rarity = value.rarity or data.rarity
		widget.content.texture_id = value.icon or data.inventory_icon
		widget.content.rarity_texture = UISettings.item_rarity_textures[rarity]
		widget_height = 0
	elseif widget_type == "career" then
		local career_settings = CareerSettings[value]
		local texture = "small_" .. career_settings.portrait_image
		widget.content.texture_id = texture
		widget_size[1] = 60
		widget_size[2] = 70
	elseif widget_type == "item" then
		local backend_id = value.backend_id
		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_id(backend_id)
		local rarity = item.rarity
		local inventory_icon, _, _ = UIUtils.get_ui_information_from_item(item)
		local style = widget.style.texture_id
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inventory_icon)
		local texture_size = texture_settings.size
		widget.content.texture_id = inventory_icon
		widget.content.rarity_texture = UISettings.item_rarity_textures[rarity]
		widget_height = 0
	elseif widget_type == "loot_chest" then
		local item_template = ItemMasterList[value]
		local rarity = item_template.rarity
		local item_icon = item_template.inventory_icon
		local style = widget.style.texture_id
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(item_icon)
		local texture_size = texture_settings.size
		widget.content.texture_id = item_icon
		widget_height = 0
	end

	return widget, (ignore_height and 0) or widget_height
end

RewardPopupUI._setup_presentation = function (self, presentation_data)
	local amount = #presentation_data
	local entries = {}
	local animation_data = {
		end_animation = "close",
		start_animation = "open",
		entry_play_index = 1,
		started = false,
		animations_played = 0,
		animation_wait_time = 0.5,
		animation_time = 0,
		animations_list = {
			"present_entry"
		},
		amount = amount,
		entries = entries
	}
	local spacing = 20
	local min_height = 80

	for i, presentation_entries in ipairs(presentation_data) do
		local widgets_data = {}
		local data = {
			animations_played = 0,
			index = i,
			widgets_data = widgets_data
		}
		local highest_height = 0

		for j, presentation_entry in ipairs(presentation_entries) do
			local widget, height = self:_setup_entry_widget(presentation_entry, j)
			local value = presentation_entry.value
			local widget_type = presentation_entry.widget_type
			widgets_data[j] = {
				alpha_multiplier = 0,
				widget = widget,
				height = height,
				value = value,
				widget_type = widget_type
			}

			if highest_height < height then
				highest_height = height
			end
		end

		data.highest_height = highest_height
		entries[i] = data

		if min_height < highest_height then
			min_height = highest_height
		end
	end

	print("min_height", min_height)

	scenegraph_definition.background_center.size[2] = min_height + spacing

	return animation_data
end

RewardPopupUI._align_presentation_widgets = function (self, widgets_data, highest_height)
	local start_height_position = highest_height / 2
	local ui_scenegraph = self.ui_scenegraph

	for _, data in ipairs(widgets_data) do
		local widget = data.widget
		local height = data.height
		local widget_type = data.widget_type
		local scenegraph_id = widget.scenegraph_id
		local widget_position = ui_scenegraph[scenegraph_id].local_position
		widget_position[2] = 0
		start_height_position = widget_position[2] - height / 2
	end
end

RewardPopupUI._update_presentation_animation = function (self, dt)
	local animation_data = self._animation_presentation_data

	if not animation_data or animation_data.complete then
		return
	end

	local running_animations = self._animations

	if animation_data.entries_done then
		if not animation_data.end_animation_key then
			local end_animation = animation_data.end_animation
			animation_data.end_animation_key = self:start_presentation_animation(end_animation)
		elseif not running_animations[animation_data.end_animation_key] then
			animation_data.end_animation_key = nil
			animation_data.complete = true

			self:on_presentation_complete()
		end
	elseif not animation_data.started then
		local start_animation = animation_data.start_animation
		animation_data.start_animation_key = self:start_presentation_animation(start_animation)
		animation_data.started = true
	elseif animation_data.start_animation_key then
		if not running_animations[animation_data.start_animation_key] then
			animation_data.start_animation_key = nil
		end
	else
		local animation_time = animation_data.animation_time

		if animation_time == 0 then
			local all_entries_started = animation_data.all_entries_started
			local entries = animation_data.entries
			local num_entries = #entries

			if all_entries_started then
				for entry_index, entry in ipairs(entries) do
					local animation_key = entry.animation_key

					if not animation_key or not running_animations[animation_key] then
						entry.animation_key = nil

						if entry_index == num_entries then
							animation_data.entries_done = true
							animation_data.animation_time = 0

							return
						end
					end
				end
			else
				local entry_play_index = animation_data.entry_play_index
				local animations_list = animation_data.animations_list
				local num_animations = #animations_list
				local entry = entries[entry_play_index]
				local animation_key = entry.animation_key

				if animation_key then
					if not running_animations[animation_key] then
						if entry.animations_played == num_animations then
							if entry_play_index == num_entries then
								animation_data.all_entries_started = true

								return
							else
								animation_data.entry_play_index = entry_play_index + 1

								return
							end
						else
							entry.animations_played = entry.animations_played + 1

							if entry.animations_played == num_animations then
								return
							end
						end
					else
						return
					end
				end

				local widgets_data = entry.widgets_data
				local highest_height = entry.highest_height
				local animations_played = entry.animations_played
				local animation_play_index = animations_played + 1
				local animation_to_play = animations_list[animation_play_index]

				if animations_played == 0 then
					self:_align_presentation_widgets(widgets_data, highest_height)
				end

				animation_key = self:start_presentation_animation(animation_to_play, widgets_data)
				entry.animation_key = animation_key
				animation_data.animation_time = animation_data.animation_wait_time

				return
			end
		else
			animation_time = math.max(animation_time - dt, 0)
			animation_data.animation_time = animation_time
		end
	end

	return true
end

RewardPopupUI.set_fullscreen_effect_enable_state = function (self, enabled, progress)
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")
	progress = progress or (enabled and 1) or 0

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and progress * 0.75) or 0)
		ShadingEnvironment.apply(shading_env)

		self.screen_background_widget.style.rect.color[1] = 100 * progress
	end

	self._fullscreen_effect_enabled = enabled
end

RewardPopupUI._setup_input = function (self)
	local input_manager = self.input_manager

	if input_manager and not self._input_set_up then
		input_manager:create_input_service(INPUT_SERVICE_NAME, "IngameMenuKeymaps", "IngameMenuFilters")
		input_manager:map_device_to_service(INPUT_SERVICE_NAME, "keyboard")
		input_manager:map_device_to_service(INPUT_SERVICE_NAME, "mouse")
		input_manager:map_device_to_service(INPUT_SERVICE_NAME, "gamepad")

		self._input_set_up = true
	end
end

RewardPopupUI._acquire_input = function (self)
	if not self.input_acquired then
		local input_manager = self.input_manager

		if input_manager and self._input_set_up then
			input_manager:capture_input({
				"keyboard",
				"gamepad",
				"mouse"
			}, 1, INPUT_SERVICE_NAME, "RewardPopupUI")
		end

		self.input_acquired = true
	end
end

RewardPopupUI._release_input = function (self)
	if self.input_acquired then
		local input_manager = self.input_manager

		if input_manager and self._input_set_up then
			input_manager:release_input({
				"keyboard",
				"gamepad",
				"mouse"
			}, 1, INPUT_SERVICE_NAME, "RewardPopupUI")
		end

		self.input_acquired = false
	end
end

return
