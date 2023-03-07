local definitions = local_require("scripts/ui/reward_popup/reward_popup_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animations
local PADDING = definitions.item_list_padding
RewardPopupUI = class(RewardPopupUI)
local FAST_POPUP_SPEED_MULT_OPEN = 10
local FAST_POPUP_SPEED_MULT_CLOSE = 2.5
local INPUT_SERVICE_NAME = "rewards_popups"

local function speed_up_popup_pressed(input_service)
	return input_service:get("toggle_menu", true) or input_service:get("back", true) or input_service:get("skip_pressed", true) or input_service:get("left_press")
end

RewardPopupUI.init = function (self, level_end_view_context)
	self._ui_top_renderer = level_end_view_context.ui_top_renderer
	self._input_manager = level_end_view_context.input_manager
	self.world = level_end_view_context.world or level_end_view_context.ui_renderer.world
	local wwise_world = level_end_view_context.wwise_world
	self._wwise_world = wwise_world or level_end_view_context.world_manager:wwise_world(self.world)
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._skip_blur = false

	self:create_ui_elements()
	self:_setup_input()
end

RewardPopupUI.create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	self.background_top_widget = UIWidget.init(widget_definitions.background_top)
	self.background_center_widget = UIWidget.init(widget_definitions.background_center)
	self.background_bottom_widget = UIWidget.init(widget_definitions.background_bottom)
	self.background_bottom_glow_widget = UIWidget.init(widget_definitions.background_bottom_glow)
	self.background_top_glow_widget = UIWidget.init(widget_definitions.background_top_glow)
	self.screen_background_widget = UIWidget.init(widget_definitions.screen_background)
	self.deus_background_top_widget = UIWidget.init(widget_definitions.deus_background_top)
	self.deus_background_bottom_widget = UIWidget.init(widget_definitions.deus_background_bottom)
	self.deus_background_top_glow_widget = UIWidget.init(widget_definitions.deus_background_top_glow)
	self.deus_background_bottom_glow_widget = UIWidget.init(widget_definitions.deus_background_bottom_glow)
	self.claim_button_widget = UIWidget.init(widget_definitions.claim_button)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	self._is_visible = true
	self._speed_up_popup = false
	self._done_reset_speed_up_popup = false
end

RewardPopupUI.set_input_manager = function (self, input_manager)
	self._input_manager = input_manager

	self:_setup_input()
end

RewardPopupUI.destroy = function (self)
	self:_release_input()

	self._ui_animator = nil

	self:set_visible(false)

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end
end

RewardPopupUI.set_visible = function (self, visible)
	self._is_visible = visible
end

RewardPopupUI.update = function (self, dt)
	if self.input_acquired and self:is_presentation_complete() then
		self:_release_input()
	end

	if not self._is_visible or not self._draw_widgets then
		return
	end

	if not self._speed_up_popup and not self._handling_claim_button then
		local input_service = self._input_manager:get_service(INPUT_SERVICE_NAME)

		if speed_up_popup_pressed(input_service) then
			self._speed_up_popup = true
		end
	else
		local animation_data = self._animation_presentation_data

		if animation_data then
			if animation_data.end_animation_key then
				dt = dt * FAST_POPUP_SPEED_MULT_CLOSE
			else
				dt = dt * FAST_POPUP_SPEED_MULT_OPEN
			end
		end
	end

	self:_update_presentation_animation(dt)
	self:_update_animations(dt)

	local animation_params = self._animation_params

	if animation_params then
		local blur_progress = animation_params.blur_progress or 1

		self:set_fullscreen_effect_enable_state(true, blur_progress)
	end

	self:draw(dt)
end

RewardPopupUI._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self._ui_animator

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
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service(INPUT_SERVICE_NAME)
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self.background_top_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_center_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_bottom_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_bottom_glow_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.background_top_glow_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.screen_background_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.deus_background_top_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.deus_background_bottom_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.deus_background_bottom_glow_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.deus_background_top_glow_widget)

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

		if IS_WINDOWS and animation_presentation_data.claim_button then
			local button_widget = self.claim_button_widget

			UIWidgetUtils.animate_default_button(button_widget, dt)

			render_settings.alpha_multiplier = button_widget.content.alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, button_widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._handling_claim_button and self._menu_input_description and self._input_manager:is_device_active("gamepad") then
		self._menu_input_description:set_input_description(nil)
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

RewardPopupUI.display_presentation = function (self, data)
	self._draw_widgets = true
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	local animation_presentation_data = self:_setup_presentation(data)
	self._animation_presentation_data = animation_presentation_data

	self:set_visible(true)

	self._presentation_complete = false
	self._speed_up_popup = false
	self._done_reset_speed_up_popup = false

	if not data.keep_input then
		self:_acquire_input()
	end
end

RewardPopupUI.is_presentation_active = function (self)
	return self._animation_presentation_data ~= nil
end

RewardPopupUI.is_presentation_complete = function (self)
	return self._presentation_complete
end

RewardPopupUI.on_presentation_complete = function (self)
	self._presentation_complete = true
	self._draw_widgets = false

	self:set_visible(false)
	self:set_fullscreen_effect_enable_state(false)

	self._animation_presentation_data = nil
end

RewardPopupUI.start_presentation_animation = function (self, animation_name, widgets)
	local params = {
		wwise_world = self._wwise_world
	}
	widgets = widgets or {
		background_top = self.background_top_widget,
		background_center = self.background_center_widget,
		background_bottom = self.background_bottom_widget,
		background_bottom_glow = self.background_bottom_glow_widget,
		background_top_glow = self.background_top_glow_widget,
		claim_button = self.claim_button_widget,
		deus_background_top = self.deus_background_top_widget,
		deus_background_bottom = self.deus_background_bottom_widget,
		deus_background_bottom_glow = self.deus_background_bottom_glow_widget,
		deus_background_top_glow = self.deus_background_top_glow_widget
	}
	local animation_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	local animation_key = animation_name .. animation_id
	self._animations[animation_key] = animation_id
	self._animation_params = params

	return animation_key
end

local function set_xy(style, x, y)
	local offset = style.offset
	offset[1] = x
	offset[2] = y
end

RewardPopupUI._hacky_get_tooltip_size = function (self, widget)
	local ui_top_renderer = self._ui_top_renderer
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier
	render_settings.alpha_multiplier = 0

	UIRenderer.begin_pass(ui_top_renderer, self._ui_scenegraph, FAKE_INPUT_SERVICE, 0, nil, render_settings)
	UIRenderer.draw_widget(ui_top_renderer, widget)
	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier

	return widget.style.item.item_presentation_height
end

RewardPopupUI._setup_entry_widget = function (self, entry_data, index)
	local widget_definitions = definitions.widget_definitions
	local value = entry_data.value
	local widget_type = entry_data.widget_type and widget_definitions[entry_data.widget_type] and entry_data.widget_type or "item"
	local ignore_height = entry_data.ignore_height
	local widget = UIWidget.init(widget_definitions[widget_type])
	local scenegraph_id = widget.scenegraph_id
	local widget_scenegraph_size = scenegraph_definition[scenegraph_id].size
	local widget_size = self._ui_scenegraph[scenegraph_id].size
	local widget_height = 0

	if widget_type == "title" or widget_type == "level" then
		widget.content.text = value
		local style = widget.style.text
		widget_size[2] = UIUtils.get_text_height(self._ui_top_renderer, widget_scenegraph_size, style, value)
		widget_height = widget_size[2]
	elseif widget_type == "description" then
		widget.content.title_text = value[1]
		widget.content.text = value[2]
		local text_style = widget.style.text
		local title_text_style = widget.style.title_text
		local ui_top_renderer = self._ui_top_renderer
		local text_height = UIUtils.get_text_height(ui_top_renderer, widget_scenegraph_size, text_style, value[1])
		local title_text_height = UIUtils.get_text_height(ui_top_renderer, widget_scenegraph_size, title_text_style, value[2])
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
	elseif widget_type == "weapon_skin" or widget_type == "skin" or widget_type == "keep_decoration_painting" then
		local data = value.data
		local rarity = value.rarity or data.rarity
		widget.content.texture_id = value.icon or data.inventory_icon
		widget.content.rarity_texture = UISettings.item_rarity_textures[rarity]
		widget_height = 0
	elseif widget_type == "career" then
		local career_settings = CareerSettings[value]
		local texture = "small_" .. career_settings.portrait_image
		widget.content.texture_id = texture
	elseif widget_type == "item" or widget_type == "frame" then
		local backend_id = value.backend_id
		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_id(backend_id)
		local rarity = item.rarity or item.data and item.data.rarity or "plentiful"
		local inventory_icon = UIUtils.get_ui_information_from_item(item)
		widget.content.texture_id = inventory_icon
		widget.content.rarity_texture = UISettings.item_rarity_textures[rarity]
		widget_height = 0
	elseif widget_type == "item_list" then
		local content = widget.content
		local style = widget.style
		local item_count = #value
		local max_columns = definitions.item_list_max_columns
		local rows_minus_1 = math.ceil(item_count / max_columns) - 1
		content.cursor_x = 1
		content.cursor_y = 1
		content.rows = rows_minus_1 + 1
		content.cols = math.min(max_columns, item_count)
		content.item_count = item_count

		for i = 1, item_count do
			local rarity_key = "rarity" .. i
			local icon_key = "icon" .. i
			local frame_key = "frame" .. i
			local illusion_key = "illusion" .. i
			local tooltip_key = "tooltip" .. i
			local item_key = "item" .. i
			local size_and_padding = 80 + PADDING
			local x = size_and_padding * ((i - 1) % max_columns)
			local y = size_and_padding * (rows_minus_1 - math.floor((i - 1) / max_columns))

			if i > rows_minus_1 * max_columns then
				x = x + size_and_padding * 0.5 * (-item_count % max_columns)
			end

			set_xy(style[rarity_key], x, y)
			set_xy(style[icon_key], x, y)
			set_xy(style[frame_key], x, y)
			set_xy(style[illusion_key], x, y)
			set_xy(style[tooltip_key], x, y)

			if i == 1 then
				set_xy(style.cursor, x, y)
			end

			local item = value[i]
			local item_data = item.data
			local rarity = item.rarity or item_data and item_data.rarity or "plentiful"
			content[icon_key] = UIUtils.get_ui_information_from_item(item) or "icons_placeholder"
			content[rarity_key] = UISettings.item_rarity_textures[rarity] or "icons_placeholder"
			content[item_key] = item
			content[illusion_key] = item_data and item_data.item_type == "weapon_skin"
		end

		for i = item_count + 1, definitions.item_list_max_rows * max_columns do
			content["item_" .. i] = nil
		end

		widget_height = 210 + (80 + PADDING) * rows_minus_1
	elseif widget_type == "deus_item" then
		local backend_id = value.backend_id
		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_id(backend_id)
		local rarity = item.rarity or item.data and item.data.rarity or "plentiful"
		local inventory_icon, _, _ = UIUtils.get_ui_information_from_item(item)
		widget.content.texture_id = inventory_icon
		widget.content.rarity_texture = UISettings.item_rarity_textures[rarity]
		widget_height = 0
	elseif widget_type == "deus_icon" then
		local player = Managers.player:local_player()
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		widget.content.icon = DeusPowerUpUtils.get_power_up_icon(value, profile_index, career_index)
		widget_height = 0
	elseif widget_type == "deus_item_tooltip" or widget_type == "item_tooltip" then
		local backend_id = value.backend_id
		local item_interface = Managers.backend:get_interface("items")
		local item = item_interface:get_item_from_id(backend_id)
		widget.content.item = item
		widget.style.item.draw_end_passes = true
		local tooltip_height = self:_hacky_get_tooltip_size(widget)
		widget_height = tooltip_height - 20
	elseif widget_type == "deus_power_up" then
		local power_up = DeusPowerUps[value.rarity][value.name]
		local player = Managers.player:local_player()
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		local rarity = power_up.rarity
		local rarity_settings = RaritySettings[rarity]
		local content = widget.content
		content.title_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
		content.rarity_text = Localize(rarity_settings.display_name)
		widget.style.icon_frame.color = rarity_settings.frame_color
		widget.style.icon_glow.color = rarity_settings.color
		content.description_text = DeusPowerUpUtils.get_power_up_description(power_up, profile_index, career_index)
		content.icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
		local style = widget.style
		local rarity_color = Colors.get_table(rarity)
		style.rarity_text.text_color = rarity_color
		widget_height = 160
	elseif widget_type == "loot_chest" then
		local item_template = ItemMasterList[value]
		local item_icon = item_template.inventory_icon
		widget.content.texture_id = item_icon
		widget_height = 0
	end

	return widget, ignore_height and 0 or widget_height
end

RewardPopupUI._setup_presentation = function (self, presentation_data)
	local amount = #presentation_data
	local entries = {}
	local animation_data = {
		end_animation = "close",
		start_animation = "open",
		started = false,
		animations_played = 0,
		entry_play_index = 1,
		amount = amount,
		entries = entries
	}
	local presentation_animation_data = presentation_data.animation_data or {}

	for key, value in pairs(presentation_animation_data) do
		animation_data[key] = value
	end

	local animation_wait_time = presentation_animation_data.animation_wait_time
	animation_wait_time = animation_wait_time or animation_data.claim_button and 0 or 2
	local spacing = 20
	local min_height = 80
	self._skip_blur = presentation_data.skip_blur

	for i = 1, #presentation_data do
		local presentation_entries = presentation_data[i]
		local widgets_data = {}
		local data = {
			enter_animation = "entry_enter",
			exit_animation = "entry_exit",
			index = i,
			widgets_data = widgets_data,
			animation_wait_time = animation_wait_time
		}
		local highest_height = 0

		for j = 1, #presentation_entries do
			local presentation_entry = presentation_entries[j]
			local widget, height = self:_setup_entry_widget(presentation_entry, j)
			widgets_data[j] = {
				alpha_multiplier = 0,
				widget = widget,
				height = height,
				value = presentation_entry.value,
				widget_type = presentation_entry.widget_type
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

	scenegraph_definition.background_center.size[2] = min_height + spacing

	return animation_data
end

RewardPopupUI._align_entry_widgets = function (self, entry)
	local ui_scenegraph = self._ui_scenegraph
	local widgets_data = entry.widgets_data

	for i = 1, #widgets_data do
		local data = widgets_data[i]
		local widget = data.widget
		local scenegraph_id = widget.scenegraph_id
		local widget_position = ui_scenegraph[scenegraph_id].local_position
		widget_position[2] = 0
	end
end

RewardPopupUI._play_animation = function (self, data, anim_name, anim_data)
	local anim_key_name = anim_name .. "_key"
	local anim_key = data[anim_key_name]

	if not anim_key then
		data[anim_key_name] = self:start_presentation_animation(data[anim_name], anim_data)

		return true
	elseif self._animations[anim_key] then
		return true
	end
end

RewardPopupUI._update_presentation_animation = function (self, dt)
	local animation_data = self._animation_presentation_data

	if not animation_data or animation_data.complete then
		return
	end

	if self:_play_animation(animation_data, "start_animation") then
		return
	end

	local entry_play_index = animation_data.entry_play_index
	local entries = animation_data.entries
	local entry = entries[entry_play_index]

	if not entry.aligned then
		self:_align_entry_widgets(entry)

		entry.aligned = true
	end

	if self:_play_animation(entry, "enter_animation", entry.widgets_data) then
		return
	end

	if animation_data.claim_button then
		self._handling_claim_button = true

		if not entry.claimed then
			return self:_handle_input(entry)
		end

		self._handling_claim_button = false
	end

	if not self._done_reset_speed_up_popup then
		self._done_reset_speed_up_popup = true
		self._speed_up_popup = false
	end

	local animation_wait_time = entry.animation_wait_time

	if animation_wait_time then
		animation_wait_time = animation_wait_time - dt

		if animation_wait_time > 0 then
			entry.animation_wait_time = animation_wait_time
		else
			entry.animation_wait_time = nil
		end

		return
	end

	if self:_play_animation(entry, "exit_animation", entry.widgets_data) then
		return
	elseif entry_play_index < #entries then
		animation_data.entry_play_index = entry_play_index + 1

		return
	end

	if self:_play_animation(animation_data, "end_animation") then
		return
	end

	animation_data.complete = true

	self:on_presentation_complete()
end

RewardPopupUI._handle_input = function (self, entry)
	local input_service = self:input_service()
	entry.claimed = entry.claimed or input_service:get("skip_pressed", true) or input_service:get("confirm_press", true) or UIUtils.is_button_pressed(self.claim_button_widget)
	local i = table.find_by_key(entry.widgets_data, "widget_type", "item_list")

	if not i then
		return
	end

	local widget = entry.widgets_data[i].widget
	local content = widget.content
	local modified = false
	local cursor_x = content.cursor_x
	local cursor_y = content.cursor_y
	local max_columns = definitions.item_list_max_columns
	local rows = content.rows
	local last_row_columns = content.item_count % max_columns

	if last_row_columns == 0 then
		last_row_columns = max_columns
	end

	if cursor_y < rows and input_service:get("move_down") then
		cursor_y = cursor_y + 1
		modified = true

		if cursor_y == rows then
			cursor_x = math.clamp(cursor_x - math.floor(0.5 * (max_columns - last_row_columns)), 1, last_row_columns)
		end
	elseif cursor_y > 1 and input_service:get("move_up") then
		if cursor_y == rows then
			cursor_x = cursor_x + math.floor(0.5 * (max_columns - last_row_columns))
		end

		cursor_y = cursor_y - 1
		modified = true
	end

	if cursor_x > 1 and input_service:get("move_left") then
		cursor_x = cursor_x - 1
		modified = true
	elseif cursor_x < (cursor_y == rows and last_row_columns or max_columns) and input_service:get("move_right") then
		cursor_x = cursor_x + 1
		modified = true
	end

	if modified then
		content.cursor_x = cursor_x
		content.cursor_y = cursor_y
		local selected_i = 1 + cursor_x - 1 + (cursor_y - 1) * max_columns
		content.selected_i = selected_i
		local selected_pos = widget.style["icon" .. selected_i].offset

		set_xy(widget.style.cursor, selected_pos[1], selected_pos[2])
	elseif input_service:get("right_stick_press") then
		if content.selected_i then
			content.selected_i = nil
		else
			content.selected_i = 1 + cursor_x - 1 + (cursor_y - 1) * max_columns
		end
	end

	return true
end

RewardPopupUI.set_fullscreen_effect_enable_state = function (self, enabled, progress)
	if self._skip_blur then
		return
	end

	local world = self.world
	local shading_env = World.get_data(world, "shading_environment")
	progress = progress or enabled and 1 or 0

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", enabled and 1 or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", enabled and progress * 0.75 or 0)
		ShadingEnvironment.apply(shading_env)

		self.screen_background_widget.style.rect.color[1] = 100 * progress
	end

	self._fullscreen_effect_enabled = enabled
end

RewardPopupUI._setup_input = function (self)
	local input_manager = self._input_manager

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
		local input_manager = self._input_manager

		if input_manager and self._input_set_up then
			input_manager:capture_input(ALL_INPUT_METHODS, 1, INPUT_SERVICE_NAME, "RewardPopupUI")

			if self._animation_presentation_data.claim_button then
				ShowCursorStack.push()

				self._cursor_shown = true
				local input_service = input_manager:get_service(INPUT_SERVICE_NAME)
				self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 5, 900, definitions.generic_input_actions.default)

				self._menu_input_description:set_input_description(nil)
			end
		end

		self.input_acquired = true
	end
end

RewardPopupUI._release_input = function (self)
	if self.input_acquired then
		local input_manager = self._input_manager

		if input_manager and self._input_set_up then
			input_manager:release_input(ALL_INPUT_METHODS, 1, INPUT_SERVICE_NAME, "RewardPopupUI")

			self._menu_input_description = nil
		end

		self.input_acquired = false
	end

	if self._cursor_shown then
		ShowCursorStack.pop()

		self._cursor_shown = false
	end
end

RewardPopupUI.input_service = function (self)
	if self._input_set_up and self.input_acquired then
		return self._input_manager:get_service(INPUT_SERVICE_NAME)
	else
		return FAKE_INPUT_SERVICE
	end
end
