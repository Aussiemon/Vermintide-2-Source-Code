-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_gotwf_overview.lua

require("scripts/ui/reward_popup/reward_popup_ui")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_overview_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local lock_widget_definitions = definitions.lock_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local background_widget_definitions = definitions.background_widgets
local viewport_widget_definitions = definitions.viewport_widgets
local create_item_definition_func = definitions.create_item_definition_func
local create_simple_item = definitions.create_simple_item
local create_claim_button = definitions.create_claim_button
local animation_definitions = definitions.animation_definitions
local gotwf_item_size = definitions.gotwf_item_size
local icon_scale = definitions.icon_scale
local generic_input_actions = definitions.generic_input_actions
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"
local NUM_VISIBLE_ITEMS = 7
local ITEM_SIZE = {
	260 * icon_scale,
	220 * icon_scale,
}
local item_backgrounds_by_rarirty = {
	common = "store_thumbnail_bg_common",
	exotic = "store_thumbnail_bg_exotic",
	magic = "store_thumbnail_bg_magic",
	plentiful = "store_thumbnail_bg_plentiful",
	promo = "store_thumbnail_bg_promo",
	rare = "store_thumbnail_bg_rare",
	unique = "store_thumbnail_bg_unique",
}

HeroWindowGotwfOverview = class(HeroWindowGotwfOverview)
HeroWindowGotwfOverview.NAME = "HeroWindowGotwfOverview"

HeroWindowGotwfOverview.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowGotwfOverview")

	local ingame_ui_context = params.ingame_ui_context

	self._params = params
	self._parent = params.parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._wwise_world = params.wwise_world
	self._render_settings = {
		snap_pixel_positions = false,
	}
	self._gamepad_was_active = false
	self._steps = 0
	self._hold_left_timer = 0
	self._hold_right_timer = 0
	self._ready = false
	self._loaded_package_names = {}
	self._cloned_materials_by_reference = {}
	self._animations = {}
	self._ui_animations = {}
	self._ui_animations_callbacks = {}

	self:_reset_current_item()
	self:_init_scenegraph()
	self:_create_background_ui_elements()
	self:_sync_backend_gotwf()

	local skip_mark_all_as_seen = true

	self._parent:change_generic_actions(generic_input_actions.default, skip_mark_all_as_seen)
	self:_play_sound("Play_amb_gotwf_loop")
end

HeroWindowGotwfOverview._reset_current_item = function (self)
	self._params.selected_item = nil
	self._params.selected_item_index = nil
	self._params.selected_item_claimed = nil
	self._params.selected_item_already_owned = nil
end

HeroWindowGotwfOverview._sync_backend_gotwf = function (self)
	self._synced = false

	local backend_manger = Managers.backend
	local backend_interface_peddler = backend_manger:get_interface("peddler")

	backend_interface_peddler:refresh_login_rewards(callback(self, "gotwf_data_cb"))
end

HeroWindowGotwfOverview.gotwf_data_cb = function (self, login_rewards)
	self._login_rewards = login_rewards

	if login_rewards.event_type ~= "calendar" then
		self._popup_id = Managers.popup:queue_popup(Localize("event_gotfw_available_soon"), Localize("event_gotfw_name"), "go_back", Localize("menu_ok"))

		return
	end

	self._synced = true
end

HeroWindowGotwfOverview._start_transition_animation = function (self, animation_name)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings,
		num_items = self._login_rewards.total_rewards,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowGotwfOverview._start_item_rotation_animation = function (self, item_widget, reward_index)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings,
		item_widget = item_widget,
		reward_index = reward_index,
	}
	local animation_name = "item_rotation"
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id

	self._parent:block_input()

	self._ui_animations_callbacks[animation_name] = function ()
		self._parent:unblock_input()
	end
end

HeroWindowGotwfOverview._init_scenegraph = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
end

HeroWindowGotwfOverview._create_background_ui_elements = function (self, params)
	local background_widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(background_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets_by_name[name] = widget
		background_widgets[#background_widgets + 1] = widget
	end

	self._background_widgets = background_widgets
	self._widgets_by_name = widgets_by_name
end

HeroWindowGotwfOverview._create_ui_elements = function (self, params)
	local widgets = {}
	local lock_widgets = {}
	local entry_widgets = {}
	local item_widgets = {}
	local bottom_widgets = {}
	local viewport_widgets = {}
	local claim_button_widgets = {}
	local widgets_by_name = {}

	self._item_texture_widgets = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		bottom_widgets[#bottom_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(viewport_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		viewport_widgets[#viewport_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(lock_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		lock_widgets[#lock_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local login_rewards = self._login_rewards
	local num_items = login_rewards.total_rewards

	for i = 1, num_items do
		local item_widget = self:_create_reward_widget(i)
		local claim_button_widget = self:_create_claim_button_widget(i)

		item_widgets[#item_widgets + 1] = item_widget
		claim_button_widgets[#claim_button_widgets + 1] = claim_button_widget
		widgets_by_name["claim_button_" .. i] = claim_button_widget
	end

	self._widgets = widgets
	self._lock_widgets = lock_widgets
	self._bottom_widgets = bottom_widgets
	self._item_widgets = item_widgets
	self._widgets_by_name = widgets_by_name
	self._claim_button_widgets = claim_button_widgets
	self._viewport_widgets = viewport_widgets

	self:_select_current_reward()
	self:_calculate_duration()
	self:_update_claim_button_visibility()
	self:_reset_current_item()
	self:_create_scrollbar()
	self:_create_ui_animator()
	self:_create_reward_popup()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

HeroWindowGotwfOverview._create_reward_popup = function (self)
	local reward_params = {
		wwise_world = self._wwise_world,
		ui_renderer = self._ui_renderer,
		ui_top_renderer = self._ui_top_renderer,
		input_manager = Managers.input,
	}

	self._reward_popup = RewardPopupUI:new(reward_params)
end

HeroWindowGotwfOverview._create_ui_animator = function (self)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

HeroWindowGotwfOverview._create_scrollbar = function (self)
	local excess = (#self._item_widgets - NUM_VISIBLE_ITEMS) * gotwf_item_size[1]

	self._scrollbar_ui = ScrollbarUI:new(self._ui_scenegraph, "gotwf_item_anchor", "scrollbar_area", excess, false, nil, true)
end

HeroWindowGotwfOverview._select_current_reward = function (self)
	local login_rewards = self._login_rewards
	local rewards = login_rewards.rewards
	local current_item_index = #rewards
	local item_widget = self._item_widgets[current_item_index]
	local item_widget_content = item_widget.content
	local reward_order = item_widget_content.reward_order
	local reward_index = reward_order[#reward_order]

	item_widget_content["hotspot_" .. reward_index].is_selected = true
end

HeroWindowGotwfOverview._calculate_duration = function (self)
	local login_rewards = self._login_rewards
	local gotwf_start_time = login_rewards.start_time
	local num_items = login_rewards.total_rewards
	local gotwf_end_time = login_rewards.start_time + 86400000 * (num_items - 1)
	local start_time = os.date("%x", gotwf_start_time * 0.001)
	local end_time = os.date("%x", gotwf_end_time * 0.001)
	local widget = self._widgets_by_name.gotwf_description
	local widget_content = widget.content

	widget_content.text = start_time .. " - " .. end_time
end

HeroWindowGotwfOverview._create_claim_button_widget = function (self, reward_index)
	local login_rewards = self._login_rewards
	local rewards = login_rewards.rewards
	local current_reward_index = #rewards
	local widget_definition = create_claim_button()
	local claim_button_widget = UIWidget.init(widget_definition)

	claim_button_widget.offset[1] = (reward_index - 1) * gotwf_item_size[1]
	claim_button_widget.content.reward_offset = reward_index - current_reward_index

	return claim_button_widget
end

HeroWindowGotwfOverview._create_reward_widget = function (self, reward_index)
	local gotwf_start_time = self._login_rewards.start_time
	local rewards = self._login_rewards.rewards
	local current_reward_index = #rewards
	local num_allowed_old_segments_to_claim = self._login_rewards.num_allowed_old_segments_to_claim
	local start_claim_index = math.max(current_reward_index - num_allowed_old_segments_to_claim, 1)
	local claimed = self._login_rewards.claimed_rewards[reward_index] > 0
	local reward = rewards[reward_index]
	local date = os.date("%x", gotwf_start_time * 0.001 + 86400 * (reward_index - 1))
	local masked = true
	local item_index = reward_index
	local current_reward = reward_index == current_reward_index
	local hidden = reward == nil or not claimed
	local expired = reward_index < start_claim_index
	local claimable = not claimed and not expired and reward_index <= current_reward_index
	local item_widget_definition = create_item_definition_func("gotwf_item_anchor", ITEM_SIZE, masked, item_index, current_reward, date, claimed, hidden and not claimed, expired, claimable, reward)
	local item_widget = UIWidget.init(item_widget_definition)

	if reward and claimed then
		self:_populate_item_widget(item_widget, reward_index, reward)
	end

	return item_widget
end

HeroWindowGotwfOverview._update_claim_button_visibility = function (self)
	local current_reward_index = #self._login_rewards.rewards
	local claimed_rewards = self._login_rewards.claimed_rewards
	local num_allowed_old_segments_to_claim = self._login_rewards.num_allowed_old_segments_to_claim
	local first_claimable_index = current_reward_index - num_allowed_old_segments_to_claim

	for i = 1, #self._claim_button_widgets do
		local widget = self._claim_button_widgets[i]
		local reward_offset = widget.content.reward_offset
		local reward_index = current_reward_index + reward_offset

		if current_reward_index < reward_index or reward_index < first_claimable_index or claimed_rewards[reward_index] > 0 then
			widget.content.visible = false
			widget.content.button_hotspot.disable_button = true
		end
	end
end

HeroWindowGotwfOverview._animate_list_entries = function (self, dt)
	local parent = self._parent
	local list_widgets = self._list_widgets
	local list_hovered = true

	for idx, widget in ipairs(self._item_widgets) do
		list_hovered = idx > self._steps and idx <= NUM_VISIBLE_ITEMS + self._steps

		local content = widget.content
		local style = widget.style
		local num_rewards = content.num_rewards

		for i = 1, num_rewards do
			local hotspot = content["button_hotspot_" .. i] or content["hotspot_" .. i]

			if hotspot.on_hover_enter then
				self:_play_sound("Play_hud_store_button_hover")

				hotspot.on_hover_enter = false
			end
		end

		self:_animate_item_product(widget, dt, list_hovered)
	end
end

HeroWindowGotwfOverview._animate_item_product = function (self, widget, dt, optional_hover)
	if self._animations.item_rotation then
		return
	end

	local content = widget.content
	local style = widget.style
	local num_rewards = content.num_rewards
	local item_hovered = false

	for i = num_rewards, 1, -1 do
		local index = content.reward_order[i]
		local hotspot = content["button_hotspot_" .. index] or content["hotspot_" .. index]
		local on_hover_enter = hotspot.on_hover_enter
		local is_hover = hotspot.is_hover

		if optional_hover ~= nil and not optional_hover or item_hovered then
			is_hover = false
			on_hover_enter = false
		end

		local is_selected = hotspot.is_selected
		local was_selected = hotspot.was_selected

		if not was_selected and is_selected then
			hotspot.was_selected = true
		end

		item_hovered = is_hover or item_hovered

		local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
		local input_progress = hotspot.input_progress or 0
		local hover_progress = hotspot.hover_progress or 0
		local pulse_progress = hotspot.pulse_progress or 1
		local selection_progress = hotspot.selection_progress or 0
		local speed = (is_hover or is_selected) and 14 or 3
		local pulse_speed = 3
		local input_speed = 20

		if input_pressed then
			input_progress = math.min(input_progress + dt * input_speed, 1)
		else
			input_progress = math.max(input_progress - dt * input_speed, 0)
		end

		local input_easing_out_progress = math.easeOutCubic(input_progress)
		local input_easing_in_progress = math.easeInCubic(input_progress)

		if on_hover_enter then
			pulse_progress = 0
		end

		pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)

		local pulse_easing_out_progress = math.easeOutCubic(pulse_progress)
		local pulse_easing_in_progress = math.easeInCubic(pulse_progress)

		if is_hover then
			hover_progress = math.min(hover_progress + dt * speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * speed, 0)
		end

		local hover_easing_out_progress = math.easeOutCubic(hover_progress)
		local hover_easing_in_progress = math.easeInCubic(hover_progress)

		if is_selected then
			selection_progress = math.min(selection_progress + dt * speed, 1)
		else
			selection_progress = math.max(selection_progress - dt * speed, 0)
		end

		local select_easing_out_progress = math.easeOutCubic(selection_progress)
		local select_easing_in_progress = math.easeInCubic(selection_progress)
		local combined_progress = math.max(hover_progress, selection_progress)
		local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
		local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
		local hover_alpha = 255 * combined_progress

		style["hover_frame_" .. index].color[1] = hover_alpha

		local overlay_style = style["overlay_" .. index]

		if overlay_style then
			local overlay_alpha = 80 - 80 * combined_progress

			overlay_style.color[1] = overlay_alpha
		end

		local pulse_alpha = 255 - 255 * pulse_progress

		style["pulse_frame_" .. index].color[1] = pulse_alpha
		hotspot.pulse_progress = pulse_progress
		hotspot.hover_progress = hover_progress
		hotspot.input_progress = input_progress
		hotspot.selection_progress = selection_progress
	end
end

HeroWindowGotwfOverview._populate_painting_data = function (self, widget, index, item, reward_index)
	local item_name = item.item_id
	local painting_data = Paintings[item_name]

	if not painting_data or item_name == "hidden" then
		return
	end

	local ui_top_renderer = self._ui_top_renderer
	local top_gui = ui_top_renderer.gui
	local content = widget.content
	local style = widget.style
	local package_name
	local subpath = "keep_painting_" .. item_name
	local no_package_required = string.find(item_name, "_none") ~= nil

	if not no_package_required then
		package_name = "resource_packages/keep_paintings/" .. subpath
	end

	self._reference_id = (self._reference_id or 0) + 1

	local reference_name = item_name .. "_" .. self._reference_id .. "_" .. reward_index
	local texture_name = "keep_painting_" .. item_name
	local template_material_name = "template_store_diffuse_masked"

	self:_create_material_instance(top_gui, texture_name, template_material_name, reference_name)

	local function callback()
		local texture_path = "units/gameplay/keep_paintings/materials/" .. subpath .. "/" .. subpath .. "_df"

		self:_set_material_diffuse(top_gui, texture_name, texture_path)

		local base_size = 150 * icon_scale
		local padding = 0.125

		if painting_data.orientation == "horizontal" then
			content["painting_" .. reward_index] = {
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
			style["painting_" .. reward_index].offset[2] = 20
			style["painting_" .. reward_index].texture_size = {
				base_size,
				base_size * (1 - 2 * padding),
			}
			style["painting_frame_" .. reward_index].area_size = {
				base_size,
				base_size * (1 - 2 * padding),
			}
			style["painting_frame_" .. reward_index].offset[2] = 20
		else
			content["painting_" .. reward_index] = {
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
			style["painting_" .. reward_index].offset[2] = 10
			style["painting_" .. reward_index].texture_size = {
				base_size * (1 - 2 * padding),
				base_size,
			}
			style["painting_frame_" .. reward_index].area_size = {
				base_size * (1 - 2 * padding),
				base_size,
			}
			style["painting_frame_" .. reward_index].offset[2] = 10
		end

		content.disable_loading_icon = true
	end

	if no_package_required then
		callback()
	else
		self:_load_texture_package(package_name, reference_name, callback)
	end
end

HeroWindowGotwfOverview._populate_item_widget = function (self, widget, index, reward)
	local num_rewards = #reward

	for i = num_rewards, 1, -1 do
		local item = reward[i]
		local reward_type = item.reward_type

		if reward_type == "keep_decoration_painting" then
			self:_populate_painting_data(widget, index, item, i)
		else
			self:_populate_item_data(widget, index, item, i)
		end
	end
end

HeroWindowGotwfOverview._populate_item_data = function (self, widget, index, item, reward_index)
	local item_rarity_textures = UISettings.item_rarity_textures
	local item_type_store_icons = UISettings.item_type_store_icons
	local item_name = item.item_id
	local reward_type = item.reward_type
	local masterlist_item

	if reward_type == "chips" then
		masterlist_item = Currencies[item_name]
	elseif reward_type == "currency" then
		masterlist_item, item_name = BackendUtils.get_fake_currency_item(item.currency_code, item.amount)
	else
		masterlist_item = ItemMasterList[item_name]
	end

	if not masterlist_item then
		return
	end

	local rarity = masterlist_item.rarity or "default"
	local item_type = masterlist_item.item_type
	local content = widget.content
	local style = widget.style
	local masked = style["icon_" .. reward_index].masked

	content["item_" .. reward_index] = masterlist_item

	local rarity_background = item_backgrounds_by_rarirty[rarity]

	content["background_" .. reward_index] = rarity_background

	local overlay_z = style["overlay_" .. reward_index].offset[3]
	local icon_z = style["icon_" .. reward_index].offset[3]

	style["icon_" .. reward_index].offset[3] = overlay_z
	style["overlay_" .. reward_index].offset[3] = icon_z

	local item_type_icon = item_type_store_icons[item_type]

	if rarity and item_type_icon then
		content["type_tag_icon_" .. reward_index] = item_type_icon .. "_" .. (rarity == "plentiful" and "common" or rarity)
	else
		content["type_tag_icon_" .. reward_index] = item_type_icon
	end

	local ui_top_renderer = self._ui_top_renderer
	local top_gui = ui_top_renderer.gui

	self._reference_id = (self._reference_id or 0) + 1

	local reference_name = item_name .. "_" .. self._reference_id .. "_" .. reward_index

	if item_type == "chips" then
		item_name = "shillings_medium"
	elseif item_type == "loot_chest" then
		item_name = "loot_chest_generic"
	end

	local texture_name = "store_item_icon_" .. item_name
	local package_name = "resource_packages/store/item_icons/" .. texture_name

	if item_type == "frame" then
		content.disable_loading_icon = true

		local scenegraph_id = "gotwf_item_anchor"
		local frame_name = masterlist_item.temporary_template or "default"
		local scale = 1
		local spacing = 20
		local offset = {
			10 + (index - 1) * (ITEM_SIZE[1] + spacing),
			20,
			0,
		}
		local masked = true
		local skip_offset = true
		local widget_definition = UIWidgets.create_base_portrait_frame(scenegraph_id, frame_name, scale, offset, masked, skip_offset)

		self._item_texture_widgets[#self._item_texture_widgets + 1] = UIWidget.init(widget_definition)

		local material = Gui.material(self._ui_top_renderer.gui, "portrait_frame_gotwf_01_child")

		if material then
			Material.set_scalar(material, "masked", 1)
		end
	else
		local package_available = Application.can_get("package", package_name)

		if package_available then
			content["reference_name_" .. reward_index] = reference_name
			content["icon_" .. reward_index] = nil

			local new_material_name = masked and texture_name .. "_masked" or texture_name
			local template_material_name = masked and "template_store_diffuse_masked" or "template_store_diffuse"

			self:_create_material_instance(top_gui, new_material_name, template_material_name, reference_name)

			local function callback()
				local texture_path = "gui/1080p/single_textures/store_item_icons/" .. texture_name .. "/" .. texture_name

				self:_set_material_diffuse(top_gui, new_material_name, texture_path)

				content["icon_" .. reward_index] = new_material_name
			end

			self:_load_texture_package(package_name, reference_name, callback)
		else
			Application.warning("Icon package not accessable for product_id: (%s) and texture_name: (%s)", item_name, texture_name)
		end
	end
end

HeroWindowGotwfOverview._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

HeroWindowGotwfOverview._set_material_diffuse = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

HeroWindowGotwfOverview._load_texture_package = function (self, package_name, reference_name, callback)
	local asynchronous = true
	local prioritize = false

	Managers.package:load(package_name, reference_name, callback, asynchronous, prioritize)

	local loaded_package_names = self._loaded_package_names

	loaded_package_names[reference_name] = package_name
end

HeroWindowGotwfOverview._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[HeroWindowGotwfOverview] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

HeroWindowGotwfOverview._unload_texture_by_reference = function (self, reference_name)
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

HeroWindowGotwfOverview._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowGotwfOverview.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowGotwfOverview")

	self._ui_animator = nil

	local loaded_package_names = self._loaded_package_names

	for reference_name, package_name in pairs(loaded_package_names) do
		self:_unload_texture_by_reference(reference_name)
	end

	if self._reward_popup then
		self._reward_popup:destroy()

		self._reward_popup = nil
	end

	self:_play_sound("Stop_amb_gotwf_loop")
end

HeroWindowGotwfOverview.update = function (self, dt, t)
	if self._ready then
		self:_handle_reward_popup(dt, t)
		self:_update_animations(dt)
		self:_draw(dt, t)
	else
		self:_check_ready()
	end

	self:_handle_popup()
	self:_draw_background(dt, t)
end

HeroWindowGotwfOverview._handle_reward_popup = function (self, dt, t)
	self._reward_popup:update(dt)
end

HeroWindowGotwfOverview._check_ready = function (self)
	if self._params.loading_package or not self._synced then
		return
	end

	self._ready = true

	self:_create_ui_elements(self._params)
	self:_start_transition_animation("on_enter")
end

HeroWindowGotwfOverview._handle_popup = function (self)
	local popup_id = self._popup_id

	if not popup_id then
		return
	end

	local result = Managers.popup:query_result(popup_id)

	if result then
		self._parent:set_layout_by_name("featured")
	end
end

HeroWindowGotwfOverview._claim_daily_reward = function (self, reward_offset)
	local num_allowed_old_segments_to_claim = self._login_rewards.num_allowed_old_segments_to_claim

	if num_allowed_old_segments_to_claim < math.abs(reward_offset) or reward_offset > 0 then
		return
	end

	local peddler_interface = Managers.backend:get_interface("peddler")
	local index = #self._login_rewards.rewards + (reward_offset or 0)
	local claimed_rewards = self._login_rewards.claimed_rewards

	if claimed_rewards[index] > 0 then
		return
	end

	peddler_interface:claim_login_rewards(callback(self, "_claim_reward_result_cb", index), reward_offset)

	self._force_index = #self._login_rewards.rewards + (reward_offset or 0)
	self._awaiting_result = true

	self._parent:block_input()
	self:_play_sound("Play_hud_gotwf_claim")
end

HeroWindowGotwfOverview._claim_reward_result_cb = function (self, reward_index, login_rewards)
	if login_rewards.event_type ~= "calendar" then
		self._awaiting_result = false

		self._parent:unblock_input()
		Managers.ui:handle_transition("close_active", {
			fade_in_speed = 1,
			fade_out_speed = 1,
			use_fade = true,
		})

		return
	end

	self._login_rewards = login_rewards

	local rewards = self._login_rewards.rewards[reward_index]
	local num_rewards = rewards and #rewards or 0

	if num_rewards == 0 then
		self._awaiting_result = false

		self._parent:unblock_input()

		return
	end

	self._replacement_presentation_data = self:_gather_replacement_presentation_data(reward_index)

	local item_widget = self._item_widgets[reward_index]

	item_widget.content.visible = false

	self:_update_claim_button_visibility()
	self:_reset_current_item()
	self:_start_transition_animation("hide_item_list")
	self:_start_transition_animation("lock_open")

	self._ui_animations_callbacks.lock_open = callback(self, "_start_transition_animation", "lock_close")
	self._ui_animations_callbacks.lock_close = callback(self, "_start_transition_animation", "reveal")

	self._ui_animations_callbacks.reveal = function ()
		self:_update_daily_rewards(reward_index)
		self:_start_transition_animation("show_item_list")
		self:_trigger_replacement_rewards()
	end

	Managers.backend:commit()
	self:_play_sound("Play_hud_gotwf_animation_start")
end

HeroWindowGotwfOverview._trigger_replacement_rewards = function (self)
	if not self._replacement_presentation_data then
		return
	end

	self._reward_popup:display_presentation(self._replacement_presentation_data)

	self._replacement_presentation_data = nil
end

local PRESENTATION_DATA = {}

HeroWindowGotwfOverview._gather_replacement_presentation_data = function (self, reward_index)
	local login_rewards = self._login_rewards
	local claimed_rewards = login_rewards.claimed_rewards

	if claimed_rewards[reward_index] < 2 then
		return
	end

	table.clear(PRESENTATION_DATA)

	local currency_added = self._login_rewards.currency_added
	local data = currency_added[1]

	if not data then
		return
	end

	local fake_item = {
		data = BackendUtils.get_fake_currency_item(data.code or "SM", data.amount),
	}
	local description = {}
	local _, display_name, _ = UIUtils.get_ui_information_from_item(fake_item)

	description[1] = Localize(display_name)
	description[2] = string.format(Localize("achv_menu_curreny_reward_claimed"), data.amount)

	local entry = {}

	entry[#entry + 1] = {
		widget_type = "description",
		value = description,
	}
	entry[#entry + 1] = {
		widget_type = "icon",
		value = fake_item.data.icon,
	}
	PRESENTATION_DATA[#PRESENTATION_DATA + 1] = entry
	PRESENTATION_DATA.bg_alpha = 200
	PRESENTATION_DATA.offset = {
		0,
		190,
		1,
	}

	return PRESENTATION_DATA
end

HeroWindowGotwfOverview._update_daily_rewards = function (self, reward_index)
	local item_widget = self:_create_reward_widget(reward_index)

	self._item_widgets[reward_index] = item_widget

	self:_select_current_reward(self._current_item_index)
	self:_update_selected_reward(item_widget)
	self:_update_claim_button_visibility()

	self._awaiting_result = false

	self._parent:unblock_input()
end

HeroWindowGotwfOverview._update_selected_reward = function (self, item_widget)
	local login_rewards = self._login_rewards
	local rewards = login_rewards.rewards
	local claimed_rewards = login_rewards.claimed_rewards
	local item_widget_content = item_widget.content
	local reward_order = item_widget_content.reward_order
	local internal_reward_index = reward_order[#reward_order]

	item_widget_content["hotspot_" .. internal_reward_index].is_selected = true

	local reward_index = self._current_item_index
	local reward = rewards[reward_index]
	local selected_item = reward[math.min(internal_reward_index, #reward)]
	local claimed_status = claimed_rewards[self._current_item_index]
	local is_claimed = claimed_status > 0
	local already_owned = claimed_status > 1

	self._params.selected_item = is_claimed and selected_item
	self._params.selected_item_index = is_claimed and self._current_item_index
	self._params.selected_item_claimed = is_claimed
	self._params.selected_item_already_owned = already_owned
	self._current_item_index = self._current_item_index
end

HeroWindowGotwfOverview.post_update = function (self, dt, t)
	if self._ready then
		self:_animate_list_entries(dt, t)
		self:_animate_buttons(dt, t)
		self:_handle_arrow_visibility(dt, t)
		self:_handle_input(dt, t)
		self:_handle_input_descriptions(dt, t)
	end
end

HeroWindowGotwfOverview._animate_buttons = function (self, dt, t)
	local claim_button_widgets = self._claim_button_widgets

	for _, widget in pairs(claim_button_widgets) do
		self:_animate_button(widget, dt, t)
	end
end

HeroWindowGotwfOverview._animate_button = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

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

	style.clicked_rect.color[1] = 100 * input_progress

	local hover_alpha = 255 * hover_progress

	style.hover_glow.color[1] = hover_alpha

	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)
end

HeroWindowGotwfOverview._handle_arrow_visibility = function (self, dt, t)
	if self._ui_animations.move then
		self._scrollbar_ui:force_update_progress()

		return
	end

	local left_arrow_widget = self._widgets_by_name.arrow_left
	local left_arrow_content = left_arrow_widget.content
	local right_arrow_widget = self._widgets_by_name.arrow_right
	local right_arrow_content = right_arrow_widget.content
	local num_items = self._login_rewards.total_rewards

	if num_items <= NUM_VISIBLE_ITEMS then
		left_arrow_content.visible = false
		left_arrow_content.hotspot = {}
		right_arrow_content.visible = false
		right_arrow_content.hotspot = {}
	elseif self._steps > 0 then
		left_arrow_content.visible = true

		if self._steps < num_items - NUM_VISIBLE_ITEMS then
			right_arrow_content.visible = true
		else
			right_arrow_content.visible = false
			right_arrow_content.hotspot = {}
		end
	elseif self._steps == 0 then
		left_arrow_content.visible = false
		left_arrow_content.hotspot = {}
		right_arrow_content.visible = true
	end
end

HeroWindowGotwfOverview._update_animations = function (self, dt)
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

			local anim_callback = self._ui_animations_callbacks[animation_name]

			if anim_callback then
				anim_callback()
			end
		end
	end

	if self._ui_animations.move then
		self._scrollbar_ui:force_update_progress()
	else
		local offset = math.abs(self._ui_scenegraph.gotwf_item_anchor.local_position[1])

		self._steps = math.ceil(offset / gotwf_item_size[1])
	end
end

HeroWindowGotwfOverview._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local mouse_active = Managers.input:is_device_active("mouse")
	local input_service = self._parent:window_input_service()
	local gotwf_item_anchor_scenegraph_position = self._ui_scenegraph.gotwf_item_anchor.local_position
	local num_items = self._login_rewards.total_rewards
	local current_daily_reward_index = #self._login_rewards.rewards
	local max_steps = math.max(num_items - NUM_VISIBLE_ITEMS, 0)
	local old_item_index = self._current_item_index
	local old_steps = self._steps
	local params = self._params
	local force_update = false
	local login_rewards = self._login_rewards
	local claimed_rewards = login_rewards.claimed_rewards

	if not self._current_item_index then
		self._current_item_index = current_daily_reward_index
		self._steps = math.clamp(self._current_item_index + 3 - NUM_VISIBLE_ITEMS, 0, max_steps)
		force_update = true
	elseif self._force_index then
		self._current_item_index = self._force_index
		self._steps = math.clamp(self._current_item_index + 3 - NUM_VISIBLE_ITEMS, 0, max_steps)
		force_update = true
		self._force_index = nil
	end

	local claimed_status = claimed_rewards[self._current_item_index]

	if gamepad_active and not self._gamepad_was_active then
		self._steps = math.clamp(self._current_item_index + 3 - NUM_VISIBLE_ITEMS, 0, max_steps)
		self._current_item_index = self._current_item_index or self._steps + 1
		force_update = true

		if gamepad_active then
			for i = 1, table.size(self._claim_button_widgets) do
				local claim_button_widget = self._claim_button_widgets[i]
				local claim_button_widget_content = claim_button_widget.content

				claim_button_widget_content.gamepad_selected = i == self._current_item_index
			end

			local item_widget = self._item_widgets[self._current_item_index]
			local item_widget_content = item_widget.content
			local reward_order = item_widget_content.reward_order
			local index = reward_order[#reward_order]

			item_widget_content["hotspot_" .. index].is_selected = claimed_status > 0 and true
		else
			for _, item_widget in ipairs(self._item_widgets) do
				local item_widget_content = item_widget.content
				local num_rewards = item_widget_content.num_rewards

				for i = 1, num_rewards do
					item_widget_content["hotspot_" .. i].is_selected = false
				end
			end
		end

		self._scrollbar_ui:disable_input(true)
	elseif not gamepad_active and self._gamepad_was_active then
		self._scrollbar_ui:disable_input(false)
	end

	if not self._awaiting_result and not force_update then
		local hold_left_timer, hold_right_timer = 0, 0

		if input_service:get("move_left_hold") then
			hold_left_timer = self._hold_left_timer + dt
			hold_right_timer = 0
		elseif input_service:get("move_right_hold") then
			hold_right_timer = self._hold_right_timer + dt
			hold_left_timer = 0
		else
			hold_right_timer = 0
			hold_left_timer = 0
		end

		if not mouse_active then
			if input_service:get("move_left") or hold_left_timer > 0.5 then
				if hold_left_timer > 0.5 then
					hold_left_timer = 0.4
				end

				self._current_item_index = math.clamp(self._current_item_index - 1, 1, num_items)
				self._steps = math.clamp(self._current_item_index + 3 - NUM_VISIBLE_ITEMS, 0, max_steps)
			elseif (input_service:get("move_right") or hold_right_timer > 0.5) and num_items > self._current_item_index then
				if hold_right_timer > 0.5 then
					hold_right_timer = 0.4
				end

				self._current_item_index = math.clamp(self._current_item_index + 1, 1, num_items)
				self._steps = math.clamp(self._current_item_index + 3 - NUM_VISIBLE_ITEMS, 0, max_steps)
			end

			if input_service:get("confirm_press") then
				local reward_offset = self._current_item_index - current_daily_reward_index

				self:_claim_daily_reward(reward_offset)
			elseif input_service:get("special_1_press") then
				local item_widget = self._item_widgets[self._current_item_index]
				local item_widget_content = item_widget.content
				local num_rewards = item_widget_content.num_rewards

				if num_rewards > 1 then
					old_item_index = nil

					local reward_order = item_widget_content.reward_order
					local index = reward_order[1]

					for i = 1, num_rewards do
						item_widget_content["hotspot_" .. i].is_selected = false
					end

					self:_start_item_rotation_animation(item_widget, index)
					self:_play_sound("Play_hud_gotwf_click_claimed")
				end
			end
		elseif UIUtils.is_button_pressed(widgets_by_name.arrow_right, "hotspot") then
			self._steps = math.clamp(self._steps + 1, 0, num_items - NUM_VISIBLE_ITEMS)
		elseif UIUtils.is_button_pressed(widgets_by_name.arrow_left, "hotspot") then
			self._steps = math.clamp(self._steps - 1, 0, num_items - NUM_VISIBLE_ITEMS)
		else
			for idx, item_widget in ipairs(self._item_widgets) do
				local content = item_widget.content
				local num_rewards = content.num_rewards

				for i = num_rewards, 1, -1 do
					local index = content.reward_order[i]

					if UIUtils.is_button_pressed(item_widget, "hotspot_" .. index) then
						self._current_item_index = idx

						local content = item_widget.content
						local reward_order = content.reward_order

						if content.owned then
							local reward_index = table.find(reward_order, index)

							if num_rewards > 1 and reward_index < num_rewards then
								self:_start_item_rotation_animation(item_widget, index)

								old_item_index = nil

								local num_rewards = content.num_rewards

								for i = 1, num_rewards do
									content["hotspot_" .. i].is_selected = false
								end
							end
						end

						break
					end
				end
			end

			for name, widget in pairs(self._claim_button_widgets) do
				if UIUtils.is_button_pressed(widget) then
					local reward_offset = widget.content.reward_offset

					self:_claim_daily_reward(reward_offset)

					return
				end
			end
		end

		self._hold_right_timer = hold_right_timer
		self._hold_left_timer = hold_left_timer
	end

	if self._current_item_index ~= old_item_index then
		if old_item_index then
			local old_widget = self._item_widgets[old_item_index]
			local old_widget_content = old_widget.content
			local num_rewards = old_widget_content.num_rewards

			for i = 1, num_rewards do
				old_widget_content["hotspot_" .. i].is_selected = false
			end

			local claimed_widget = self._claim_button_widgets[old_item_index]
			local claimed_widget_content = claimed_widget.content

			claimed_widget_content.gamepad_selected = false
		end

		local claimed_status = self._login_rewards.claimed_rewards[self._current_item_index]
		local is_claimed = claimed_status > 0
		local already_owned = claimed_status > 1
		local claimed_widget = self._claim_button_widgets[self._current_item_index]
		local claimed_widget_content = claimed_widget.content

		claimed_widget_content.gamepad_selected = true

		local item_widget = self._item_widgets[self._current_item_index]
		local item_widget_content = item_widget.content
		local reward_order = item_widget_content.reward_order
		local num_rewards = item_widget_content.num_rewards
		local reward_index = math.min(num_rewards, reward_order[#reward_order])

		item_widget_content["hotspot_" .. reward_index].is_selected = is_claimed

		if item_widget_content.owned then
			self:_play_sound("Play_hud_gotwf_click_claimed")
		else
			self:_play_sound("Play_hud_gotwf_click_unclaimed")
		end

		local rewards = self._login_rewards.rewards
		local current_reward = rewards[self._current_item_index]
		local item = current_reward and current_reward[reward_index]

		self._params.selected_item = is_claimed and item
		self._params.selected_item_index = is_claimed and self._current_item_index
		self._params.selected_item_claimed = is_claimed
		self._params.selected_item_already_owned = already_owned

		if is_claimed then
			self:_start_transition_animation("reveal_instant")
		else
			self:_start_transition_animation("hide_instant")
		end
	end

	if old_steps ~= self._steps or force_update then
		self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, gotwf_item_anchor_scenegraph_position, 1, gotwf_item_anchor_scenegraph_position[1], -self._steps * gotwf_item_size[1], 0.5, math.easeOutCubic)
	end

	self._gamepad_was_active = gamepad_active
end

HeroWindowGotwfOverview._handle_input_descriptions = function (self, dt, t)
	local skip_mark_all_as_seen = true
	local current_reward_index = #self._login_rewards.rewards
	local reward_offset = self._current_item_index - current_reward_index
	local reward = self._login_rewards.rewards[self._current_item_index]
	local num_rewards = reward and #reward or 1
	local claimed_rewards = self._login_rewards.claimed_rewards
	local claimed = claimed_rewards[self._current_item_index] > 0
	local num_allowed_old_segments_to_claim = self._login_rewards.num_allowed_old_segments_to_claim

	if claimed then
		if num_rewards > 1 then
			self._parent:change_generic_actions(generic_input_actions.multiple_rewards, skip_mark_all_as_seen)
		else
			self._parent:change_generic_actions(generic_input_actions.default, skip_mark_all_as_seen)
		end
	elseif reward_offset >= -num_allowed_old_segments_to_claim and reward_offset <= 0 then
		self._parent:change_generic_actions(generic_input_actions.claim_available, skip_mark_all_as_seen)
	else
		self._parent:change_generic_actions(generic_input_actions.default, skip_mark_all_as_seen)
	end
end

HeroWindowGotwfOverview._draw = function (self, dt, t)
	local parent = self._parent
	local viewport_renderer = self._parent:get_layout_renderer()
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local parent = self._parent
	local input_service = parent:window_input_service()
	local render_settings = self._render_settings
	local num_items = #self._item_widgets
	local claimed_rewards = self._login_rewards.claimed_rewards
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		render_settings.snap_pixel_positions = false
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local claimed = claimed_rewards[self._current_item_index] > 0

	if claimed or self._awaiting_result then
		for _, widget in ipairs(self._lock_widgets) do
			render_settings.snap_pixel_positions = false
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	for _, widget in ipairs(self._item_texture_widgets) do
		render_settings.snap_pixel_positions = false
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local offset = math.abs(self._ui_scenegraph.gotwf_item_anchor.local_position[1])
	local current_step = math.ceil(offset / gotwf_item_size[1])

	for idx, widget in ipairs(self._item_widgets) do
		if idx > current_step - 1 and idx <= NUM_VISIBLE_ITEMS + current_step + 1 then
			render_settings.snap_pixel_positions = false
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local offset = math.abs(self._ui_scenegraph.gotwf_item_anchor.local_position[1])
	local current_step = math.ceil(offset / gotwf_item_size[1])

	for idx, widget in ipairs(self._claim_button_widgets) do
		if idx > current_step - 1 and idx <= NUM_VISIBLE_ITEMS + current_step + 1 then
			render_settings.snap_pixel_positions = false
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_widgets) do
		render_settings.snap_pixel_positions = false
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if viewport_renderer then
		UIRenderer.begin_pass(viewport_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

		for _, widget in ipairs(self._viewport_widgets) do
			UIRenderer.draw_widget(viewport_renderer, widget)
		end

		UIRenderer.end_pass(viewport_renderer)
	end

	render_settings.alpha_multiplier = alpha_multiplier

	self._scrollbar_ui:update(dt, t, ui_top_renderer, input_service, render_settings)
end

HeroWindowGotwfOverview._draw_background = function (self, dt, t)
	local parent = self._parent
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local parent = self._parent
	local input_service = parent:window_input_service()
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	render_settings.alpha_multiplier = 1

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._background_widgets) do
		render_settings.alpha_multiplier = 1

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end
