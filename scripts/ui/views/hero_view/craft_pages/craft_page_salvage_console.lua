require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/craft_pages/definitions/craft_page_salvage_console_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local NUM_CRAFT_SLOTS = definitions.NUM_CRAFT_SLOTS
local DO_RELOAD = false
CraftPageSalvageConsole = class(CraftPageSalvageConsole)
CraftPageSalvageConsole.NAME = "CraftPageSalvageConsole"

CraftPageSalvageConsole.on_enter = function (self, params, settings)
	print("[HeroWindowCraft] Enter Substate CraftPageSalvageConsole")

	self.parent = params.parent
	self.super_parent = self.parent.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.crafting_manager = Managers.state.crafting
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self.wwise_world = params.wwise_world
	self.settings = settings
	self._animations = {}

	self:create_ui_elements(params)

	self._craft_items = {}

	self:_reset_reward_materials(false)
	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:set_disabled_item_icon("salvage_item_icon")

	local counter_text = tostring(self._num_craft_items or 0)

	self:_set_craft_counter_text(counter_text, true)
	self:_start_transition_animation("on_enter")
end

CraftPageSalvageConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

CraftPageSalvageConsole.create_ui_elements = function (self, params)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self:_set_craft_button_disabled(true)
	self:_handle_craft_input_progress(0)

	widgets_by_name.max_counter_text.content.text = "/" .. tostring(CraftingSettings.NUM_SALVAGE_SLOTS)
end

CraftPageSalvageConsole.on_exit = function (self, params)
	print("[HeroWindowCraft] Exit Substate CraftPageSalvageConsole")

	self.ui_animator = nil

	if self._craft_input_time then
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end

	self.super_parent:set_disabled_item_icon(nil)
end

CraftPageSalvageConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_handle_input(dt, t)
	self:_update_animations(dt)
	self:_update_craft_items()
	self:_update_reward_material_fade_out(dt)
	self:draw(dt)
end

CraftPageSalvageConsole.post_update = function (self, dt, t)
	return
end

CraftPageSalvageConsole._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_icon_button(widgets_by_name.auto_fill_plentiful, dt)
	UIWidgetUtils.animate_icon_button(widgets_by_name.auto_fill_common, dt)
	UIWidgetUtils.animate_icon_button(widgets_by_name.auto_fill_rare, dt)
	UIWidgetUtils.animate_icon_button(widgets_by_name.auto_fill_exotic, dt)
	UIWidgetUtils.animate_icon_button(widgets_by_name.auto_fill_clear, dt)
end

CraftPageSalvageConsole._handle_input = function (self, dt, t)
	local parent = self.parent

	if parent:waiting_for_craft() or self._craft_result then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local super_parent = self.super_parent
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.super_parent:window_input_service()
	local widget = widgets_by_name.craft_button
	local is_button_enabled = not widget.content.button_hotspot.disable_button
	local auto_fill_rarity = nil

	if UIUtils.is_button_pressed(widgets_by_name.auto_fill_plentiful) then
		auto_fill_rarity = "plentiful"
	end

	if UIUtils.is_button_pressed(widgets_by_name.auto_fill_common) then
		auto_fill_rarity = "common"
	end

	if UIUtils.is_button_pressed(widgets_by_name.auto_fill_rare) then
		auto_fill_rarity = "rare"
	end

	if UIUtils.is_button_pressed(widgets_by_name.auto_fill_exotic) then
		auto_fill_rarity = "exotic"
	end

	self.super_parent:set_auto_fill_rarity(auto_fill_rarity)

	local clear_input = UIUtils.is_button_pressed(widgets_by_name.auto_fill_clear)
	local craft_input_held = UIUtils.is_button_held(widgets_by_name.craft_button)
	local craft_input_gamepad = is_button_enabled and gamepad_active and input_service:get("refresh_hold")
	local craft_input_accepted = false

	if input_service:get("special_1") or clear_input then
		self:reset()
	elseif craft_input_held or craft_input_gamepad then
		if not self._craft_input_time then
			self._craft_input_time = 0

			self:_play_sound("play_gui_craft_forge_button_begin")
		else
			self._craft_input_time = self._craft_input_time + dt
		end

		local max_time = UISettings.crafting_progress_time
		local progress = math.min(self._craft_input_time / max_time, 1)
		craft_input_accepted = self:_handle_craft_input_progress(progress)

		WwiseWorld.set_global_parameter(self.wwise_world, "craft_forge_button_progress", progress)
	elseif self._craft_input_time then
		self._craft_input_time = nil

		self:_handle_craft_input_progress(0)
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end

	if craft_input_accepted then
		local craft_items = self._craft_items
		local items = {}

		for backend_id, _ in pairs(craft_items) do
			items[#items + 1] = backend_id
		end

		local recipe_available = parent:craft(items)

		if recipe_available then
			self:_set_craft_button_disabled(true)
			self:_play_sound("play_gui_craft_forge_button_completed")
			self:_play_sound("play_gui_craft_forge_begin")
		end
	end
end

CraftPageSalvageConsole._handle_craft_input_progress = function (self, progress)
	return self.parent:_set_input_progress(progress)
end

CraftPageSalvageConsole.craft_result = function (self, result, error, reset_slots)
	if not error then
		self._craft_result = result
	end
end

CraftPageSalvageConsole.reset = function (self)
	for backend_id, _ in pairs(self._craft_items) do
		self:_remove_craft_item(backend_id)
	end

	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()

	self._material_fade_out_time = 0
end

CraftPageSalvageConsole.present_results = function (self)
	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()
end

CraftPageSalvageConsole.on_craft_completed = function (self)
	local result = self._craft_result

	table.clear(self._craft_items)

	local num_reward_items = 0

	for index, data in pairs(result) do
		num_reward_items = num_reward_items + 1
	end

	self:_reset_reward_materials(true)

	local ignore_sound = true

	for index, data in pairs(result) do
		local backend_id = data[1]
		local amount = data[3]

		self:_set_reward_material_by_index(backend_id, amount)
	end

	self._num_craft_items = 0

	self:_set_craft_button_disabled(true)

	self._craft_result = nil

	self:_set_craft_counter_text("", false)

	self._presenting_rewards = true
end

CraftPageSalvageConsole._update_craft_items = function (self)
	local super_parent = self.super_parent
	local pressed_backend_id, is_drag_item = super_parent:get_pressed_item_backend_id()

	if pressed_backend_id then
		if self:_has_added_item_by_id(pressed_backend_id) then
			self:_remove_craft_item(pressed_backend_id)
		elseif (self._num_craft_items or 0) < CraftingSettings.NUM_SALVAGE_SLOTS then
			self:_add_craft_item(pressed_backend_id)
		end
	end

	local selected_items_backend_ids = super_parent:get_selected_items_backend_ids()

	if selected_items_backend_ids then
		local item_added = false

		for _, selected_backend_id in ipairs(selected_items_backend_ids) do
			if not self:_has_added_item_by_id(selected_backend_id) and (self._num_craft_items or 0) < CraftingSettings.NUM_SALVAGE_SLOTS then
				item_added = true

				self:_add_craft_item(selected_backend_id, true)
			end
		end

		if item_added then
			self:_play_sound("play_gui_craft_item_drop")
		end
	end
end

CraftPageSalvageConsole._remove_craft_item = function (self, backend_id)
	local craft_items = self._craft_items

	if backend_id then
		self.super_parent:set_disabled_backend_id(backend_id, false)

		craft_items[backend_id] = nil
		self._num_craft_items = math.max((self._num_craft_items or 0) - 1, 0)

		if self._num_craft_items == 0 then
			self:_set_craft_button_disabled(true)
		else
			self:_set_craft_button_disabled(false)
		end

		local counter_text = tostring(self._num_craft_items)

		self:_set_craft_counter_text(counter_text, true)
		self:_play_sound("play_gui_craft_item_drag")
	end
end

CraftPageSalvageConsole._add_craft_item = function (self, backend_id, ignore_sound, specific_amount)
	if self._presenting_rewards then
		self:_on_craft_material_fade_complete()
	end

	if self._num_craft_items == 0 then
		table.clear(self._craft_items)
	end

	local craft_items = self._craft_items
	craft_items[backend_id] = true
	local item_interface = Managers.backend:get_interface("items")
	local item = backend_id and item_interface:get_item_from_id(backend_id)

	self.super_parent:set_disabled_backend_id(backend_id, true)

	self._num_craft_items = (self._num_craft_items or 0) + 1

	if self._num_craft_items > 0 then
		self:_set_craft_button_disabled(false)
	end

	local counter_text = tostring(self._num_craft_items)

	self:_set_craft_counter_text(counter_text, true)

	if backend_id and not ignore_sound then
		self:_play_sound("play_gui_craft_item_drop")
	end
end

CraftPageSalvageConsole._set_craft_counter_text = function (self, counter_text, visible)
	if self._presenting_rewards then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local counter_text_widget = widgets_by_name.counter_text
	local max_counter_text_widget = widgets_by_name.max_counter_text
	counter_text_widget.content.text = tostring(counter_text)
	counter_text_widget.content.visible = visible
	max_counter_text_widget.content.visible = visible
end

CraftPageSalvageConsole._set_craft_button_disabled = function (self, disabled)
	self._widgets_by_name.craft_button.content.button_hotspot.disable_button = disabled
	local input_settings = (not disabled and self.settings.name) or "disabled"

	if (self._num_craft_items or 0) < CraftingSettings.NUM_SALVAGE_SLOTS then
		input_settings = input_settings .. "_auto"
	end

	self.parent:set_input_description(input_settings)
end

CraftPageSalvageConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

CraftPageSalvageConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.super_parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

CraftPageSalvageConsole._play_sound = function (self, event)
	self.super_parent:play_sound(event)
end

CraftPageSalvageConsole._set_craft_button_text = function (self, text, localize)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.craft_button
	widget.content.button_text = (localize and Localize(text)) or text
end

CraftPageSalvageConsole._has_added_item_by_id = function (self, backend_id)
	return self._craft_items[backend_id]
end

CraftPageSalvageConsole._update_reward_material_fade_out = function (self, dt)
	local material_fade_out_time = self._material_fade_out_time

	if material_fade_out_time then
		local max_time = 2
		material_fade_out_time = math.min(material_fade_out_time + dt, max_time)
		local progress = 1 - material_fade_out_time / max_time
		local anim_progress = math.easeOutCubic(progress)

		self:_set_reward_material_alpha_fraction(anim_progress)

		if progress == 0 then
			self:_on_craft_material_fade_complete()
		else
			self._material_fade_out_time = material_fade_out_time
		end
	end
end

CraftPageSalvageConsole._on_craft_material_fade_complete = function (self)
	self._presenting_rewards = nil

	self:_reset_reward_materials(false)

	local counter_text = tostring(self._num_craft_items or 0)

	self:_set_craft_counter_text(counter_text)

	self._material_fade_out_time = nil
end

CraftPageSalvageConsole._set_reward_material_alpha_fraction = function (self, fraction)
	local alpha = 255 * fraction
	local widgets_by_name = self._widgets_by_name

	for i = 1, 6, 1 do
		local widget = widgets_by_name["material_text_" .. i]
		local style = widget.style
		local text_style = style.text
		local text_shadow_style = style.text_shadow
		local icon_style = style.icon
		text_style.text_color[1] = alpha
		text_shadow_style.text_color[1] = alpha
		icon_style.color[1] = alpha
	end
end

CraftPageSalvageConsole._set_reward_material_alpha_fraction = function (self, fraction)
	local alpha = 255 * fraction
	local widgets_by_name = self._widgets_by_name

	for i = 1, 6, 1 do
		local widget = widgets_by_name["material_text_" .. i]
		local style = widget.style
		local text_style = style.text
		local text_shadow_style = style.text_shadow
		local icon_style = style.icon
		text_style.text_color[1] = alpha
		text_shadow_style.text_color[1] = alpha
		icon_style.color[1] = alpha
	end

	widgets_by_name.material_cross.style.texture_id.color[1] = alpha
end

CraftPageSalvageConsole._reset_reward_materials = function (self, visible)
	local material_textures = UISettings.crafting_material_icons_small
	local material_presentation_order = UISettings.crafting_material_order_by_item_key
	local widgets_by_name = self._widgets_by_name

	for item_key, index in pairs(material_presentation_order) do
		local widget = widgets_by_name["material_text_" .. index]
		local content = widget.content
		local texture = material_textures[item_key]
		content.icon = texture
		content.visible = visible
		content.text = "0"

		self:_set_material_enabled_state(index, false)
	end

	self:_set_reward_material_alpha_fraction(1)

	widgets_by_name.material_cross.content.visible = visible
end

CraftPageSalvageConsole._set_material_enabled_state = function (self, index, enabled)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name["material_text_" .. index]
	local style = widget.style
	local text_style = style.text
	local icon_style = style.icon
	local color_value = (enabled and 255) or 100
	local text_color = text_style.text_color
	text_color[2] = color_value
	text_color[3] = color_value
	text_color[4] = color_value
	local icon_color = icon_style.color
	icon_color[2] = color_value
	icon_color[3] = color_value
	icon_color[4] = color_value
	icon_style.saturated = not enabled
end

CraftPageSalvageConsole._set_reward_material_by_index = function (self, backend_id, amount_text)
	local material_presentation_order = UISettings.crafting_material_order_by_item_key
	local item_interface = Managers.backend:get_interface("items")
	local item_key = item_interface:get_key(backend_id)
	local index = material_presentation_order[item_key]
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name["material_text_" .. index]
	local content = widget.content
	content.visible = true
	content.text = amount_text
	content.item = {
		data = table.clone(ItemMasterList[item_key])
	}

	self:_set_material_enabled_state(index, true)
end

return
