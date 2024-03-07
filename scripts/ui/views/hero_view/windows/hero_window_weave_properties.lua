-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_weave_properties.lua

require("scripts/helpers/weave_utils")
require("scripts/settings/weaves/weave_loadout/weave_loadout_settings")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_properties_definitions")
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
local top_hdr_widget_definitions = definitions.top_hdr_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local scrollbar_widget_definition = definitions.scrollbar_widget
local create_menu_option_trait_definition = definitions.create_menu_option_trait_definition
local create_menu_option_talent_definition = definitions.create_menu_option_talent_definition
local create_menu_option_property_definition = definitions.create_menu_option_property_definition
local create_trait_slot_definition = definitions.create_trait_slot_definition
local create_talent_slot_definition = definitions.create_talent_slot_definition
local create_property_slot_definition = definitions.create_property_slot_definition
local OPTIONS_MASK_MARGIN = 100
local OPTIONS_MASK_OFFSET = 40
local SLOT_SELECT_ANIM_DURATION = 0.3
local UPGRADE_REQUEST_LIMIT = 1.6
local amulet_slot_layout = {
	{
		amount_per_layer = 6,
		degrees = 180,
		max_amount = 6,
		name = "talent",
		radius = 178,
	},
	{
		amount_per_layer = 3,
		degrees = 90,
		max_amount = 3,
		name = "trait",
		radius = 370,
	},
	{
		amount_per_layer = 10,
		degrees = 180,
		inherent_parent = "trait",
		max_amount = 30,
		name = "property",
		radius = 100,
		start_angle = 2.827433385,
		layer_settings = {
			{
				amount_per_layer = 10,
				degrees = 324,
				radius = 100,
			},
			{
				amount_per_layer = 10,
				degrees = 324,
				radius = 100,
			},
			{
				amount_per_layer = 10,
				degrees = 324,
				radius = 100,
			},
		},
	},
}
local weapon_slot_layout = {
	{
		amount_per_layer = 1,
		degrees = 90,
		max_amount = 1,
		name = "trait",
		radius = 370,
	},
	{
		amount_per_layer = 10,
		degrees = 324,
		inherent_parent = "trait",
		max_amount = 10,
		name = "property",
		radius = 100,
		start_angle = 2.827433385,
	},
}
local localized_strings = {
	trait_cost = Localize("menu_weave_forge_options_mastery_trait_cost_prefix"),
	talent_cost = Localize("menu_weave_forge_options_mastery_talent_cost_prefix"),
	property_cost = Localize("menu_weave_forge_options_mastery_property_cost_prefix"),
	property_cost_cap = Localize("menu_weave_forge_options_mastery_property_cost_cap"),
	trait_cost_cap = Localize("menu_weave_forge_options_mastery_trait_cost_cap"),
	talent_cost_cap = Localize("menu_weave_forge_options_mastery_talent_cost_cap"),
	forge_level_too_low = Localize("menu_weave_forge_level_too_low"),
	forge_level_requirement = Localize("menu_weave_forge_level_required"),
	melee = Localize("inventory_screen_melee_weapon_title"),
	ranged = Localize("inventory_screen_ranged_weapon_title"),
	ranged_ammo = Localize("inventory_screen_ranged_weapon_title"),
	ranged_heat = Localize("inventory_screen_ranged_weapon_title"),
	ranged_energy = Localize("inventory_screen_ranged_weapon_title"),
	slot_clear_input_description_property = IS_WINDOWS and Localize("menu_weave_forge_option_property_remove_desc") or "",
	slot_clear_input_description_trait = IS_WINDOWS and Localize("menu_weave_forge_option_trait_remove_desc") or "",
	slot_clear_input_description_talent = IS_WINDOWS and Localize("menu_weave_forge_option_talent_remove_desc") or "",
	tooltip_slot_title_trait = Localize("menu_weave_forge_option_tooltip_title_trait"),
	tooltip_slot_title_talent = Localize("menu_weave_forge_option_tooltip_title_talent"),
	tooltip_slot_title_property = Localize("menu_weave_forge_option_tooltip_title_property"),
	unlock_description_talent = Localize("menu_weave_forge_slot_unlock_description_talent"),
	unlock_description_property = Localize("menu_weave_forge_slot_unlock_description_property"),
	unlock_description_trait = Localize("menu_weave_forge_slot_unlock_description_trait"),
	unlock_slot_title = Localize("menu_weave_forge_slot_unlock_slot_title"),
	unlock_talent_title = Localize("menu_weave_forge_slot_unlock_talent_title"),
}
local menu_option_category_localized_strings = {
	property = {
		offence_accessory = Localize("menu_weave_forge_options_sub_title_properties_offensive"),
		defence_accessory = Localize("menu_weave_forge_options_sub_title_properties_defensive"),
		utility_accessory = Localize("menu_weave_forge_options_sub_title_properties_utility"),
	},
	trait = {
		offence_accessory = Localize("menu_weave_forge_options_sub_title_traits_offensive"),
		defence_accessory = Localize("menu_weave_forge_options_sub_title_traits_defensive"),
		utility_accessory = Localize("menu_weave_forge_options_sub_title_traits_utility"),
	},
	talent = {
		Localize("menu_weave_forge_options_sub_title_talents_tier_1"),
		Localize("menu_weave_forge_options_sub_title_talents_tier_2"),
		Localize("menu_weave_forge_options_sub_title_talents_tier_3"),
		Localize("menu_weave_forge_options_sub_title_talents_tier_4"),
		Localize("menu_weave_forge_options_sub_title_talents_tier_5"),
		(Localize("menu_weave_forge_options_sub_title_talents_tier_6")),
	},
}

HeroWindowWeaveProperties = class(HeroWindowWeaveProperties)
HeroWindowWeaveProperties.NAME = "HeroWindowWeaveProperties"

HeroWindowWeaveProperties.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowWeaveProperties")

	self._params = params
	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._ingame_ui_context = ingame_ui_context
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

	local slot_layout, slots_progression
	local selected_item = self:_selected_item()

	if selected_item then
		slots_progression = table.clone(WeaveWeaponProgression)

		local item_data = selected_item.data

		slot_layout = weapon_slot_layout

		local progression_properties = slots_progression.properties

		if progression_properties then
			for _, slot_unlock in ipairs(progression_properties) do
				slot_unlock.category = item_data.property_table_name
			end
		end

		local progression_traits = slots_progression.traits

		if progression_traits then
			for _, slot_unlock in ipairs(progression_traits) do
				slot_unlock.category = item_data.trait_table_name
			end
		end

		self:_play_sound("menu_magic_forge_enter_customize_weapon_menu")
	else
		slots_progression = table.clone(WeaveCareerProgression)
		slot_layout = amulet_slot_layout

		self:_play_sound("menu_magic_forge_enter_customize_amulet_menu")
	end

	self._slots_progression = slots_progression

	self:_create_slot_grid(slot_layout, slots_progression)
	self:_setup_menu_options(career_name, slots_progression)
	self:_sync_backend_loadout()
	self:_start_transition_animation("on_enter")
	Managers.state.event:trigger("weave_forge_upgrade_item_entered")

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local ui_onboarding_state = WeaveOnboardingUtils.get_ui_onboarding_state(ingame_ui_context.statistics_db, local_player:stats_id())
	local upgrage_tutorial_completed = WeaveOnboardingUtils.tutorial_completed(ui_onboarding_state, WeaveUITutorials.mastery)
	local onboarding_step = WeaveOnboardingUtils.get_onboarding_step(ingame_ui_context.statistics_db, local_player:stats_id())
	local upgrage_tutorial_reached = WeaveOnboardingUtils.reached_requirements(onboarding_step, WeaveUITutorials.mastery)

	self.upgrage_tutorial = not upgrage_tutorial_completed and upgrage_tutorial_reached

	if self.upgrage_tutorial then
		local widgets_by_name = self._widgets_by_name
		local upgrade_button = widgets_by_name.upgrade_button

		upgrade_button.content.highlighted = true
		self._ui_animations.upgrade_button_pulse = UIAnimation.init(UIAnimation.pulse_animation, upgrade_button.style.texture_highlight.color, 1, 100, 255, 2)
	end
end

HeroWindowWeaveProperties._start_transition_animation = function (self, animation_name)
	local params = {
		parent = self._parent,
		render_settings = self._render_settings,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowWeaveProperties._selected_item = function (self)
	local params = self._params

	return params.selected_item
end

HeroWindowWeaveProperties._selected_unit_name = function (self)
	local params = self._params

	return params.selected_unit_name
end

HeroWindowWeaveProperties._setup_definitions = function (self)
	if self._parent:gamepad_style_active() then
		definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_properties_console_definitions")
	else
		definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_weave_properties_definitions")
	end

	top_widget_definitions = definitions.top_widgets
	bottom_widget_definitions = definitions.bottom_widgets
	bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
	top_hdr_widget_definitions = definitions.top_hdr_widgets
	scenegraph_definition = definitions.scenegraph_definition
	animation_definitions = definitions.animation_definitions
	scrollbar_widget_definition = definitions.scrollbar_widget
	create_menu_option_trait_definition = definitions.create_menu_option_trait_definition
	create_menu_option_talent_definition = definitions.create_menu_option_talent_definition
	create_menu_option_property_definition = definitions.create_menu_option_property_definition
	create_trait_slot_definition = definitions.create_trait_slot_definition
	create_talent_slot_definition = definitions.create_talent_slot_definition
	create_property_slot_definition = definitions.create_property_slot_definition
end

HeroWindowWeaveProperties.create_ui_elements = function (self, params, offset)
	self:_setup_definitions()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

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
	widgets_by_name.viewport_background.alpha_multiplier = 1
	widgets_by_name.viewport_background_fade.alpha_multiplier = 1
	widgets_by_name.upgrade_text.alpha_multiplier = 0
	widgets_by_name.upgrade_bg.alpha_multiplier = 0
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._viewport_widget_definition = self:_create_viewport_definition()

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	self:_disable_locked_slot_description()
end

local function sort_entry_by_unlock_order(entry_a, entry_b)
	local unlock_level_a = entry_a.required_forge_level
	local unlock_level_b = entry_b.required_forge_level

	return unlock_level_a < unlock_level_b
end

HeroWindowWeaveProperties._setup_menu_options = function (self, career_name, slots_progression)
	local menu_options = {}
	local masked = true
	local selected_item = self:_selected_item()
	local list_scenegraph_id = "options_scroll_field"
	local list_draw_length = self:_options_mask_height()
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local forge_level = backend_interface_weaves:get_forge_level()
	local progression_properties = slots_progression.properties
	local progression_traits = slots_progression.traits
	local progression_talents = slots_progression.talents

	if progression_traits then
		local scenegraph_id = "option_trait"
		local widget_size = scenegraph_definition[scenegraph_id].size
		local widget_definition = create_menu_option_trait_definition(scenegraph_id, widget_size, masked)
		local menu_option_key = "trait"
		local menu_option = {}

		menu_options[menu_option_key] = menu_option

		for _, slot_unlock in ipairs(progression_traits) do
			local category = slot_unlock.category
			local traits = WeaveTraits.categories[category]
			local entries = {}

			for _, trait_key in ipairs(traits) do
				local trait_data = WeaveTraits.traits[trait_key]
				local required_forge_level = backend_interface_weaves:get_trait_required_forge_level(trait_key) or 0
				local display_name = trait_data.display_name
				local trait_advanced_description = trait_data.advanced_description
				local trait_icon = trait_data.icon
				local title_text = Localize(display_name)
				local description_text = ""

				if trait_advanced_description then
					description_text = UIUtils.get_trait_description(trait_key, trait_data)
				end

				local widget = UIWidget.init(widget_definition)
				local entry = {
					title = title_text,
					text = description_text,
					icon = trait_icon or "icons_placeholder",
					category = category,
					key = trait_key,
					widget = widget,
					required_forge_level = required_forge_level,
				}

				entries[#entries + 1] = entry
			end

			table.sort(entries, sort_entry_by_unlock_order)

			local spacing = 10
			local num_entries = #entries
			local entry_height = widget_size[2]
			local total_length = entry_height * num_entries + spacing * (num_entries + 1)
			local scroll_length = math.max(total_length - list_draw_length, 0)
			local draw_count = math.ceil(list_draw_length / (entry_height + spacing))
			local scrollbar_widget = UIWidget.init(scrollbar_widget_definition)
			local scrollbar_logic = self:_initialize_scrollbar(scrollbar_widget, total_length, list_scenegraph_id, spacing)
			local sub_display_name

			if selected_item then
				local item_data = selected_item.data

				sub_display_name = localized_strings[item_data.slot_type]
			else
				sub_display_name = menu_option_category_localized_strings[menu_option_key][category]
			end

			menu_option[category] = {
				root_scenegraph_id = "option_trait",
				scrolled_length = 0,
				draw_count = draw_count,
				spacing = spacing,
				total_length = total_length,
				scroll_length = scroll_length,
				scrollbar_widget = scrollbar_widget,
				scrollbar_logic = scrollbar_logic,
				name = category,
				display_name = Localize("menu_weave_forge_options_title_traits"),
				sub_display_name = sub_display_name,
				entries = entries,
				widget_size = widget_size,
				scroll_content = {
					scroll_progress = 0,
				},
			}
		end
	end

	if progression_talents then
		local scenegraph_id = "option_talent"
		local widget_size = scenegraph_definition[scenegraph_id].size
		local widget_definition = create_menu_option_talent_definition(scenegraph_id, widget_size, masked)
		local hero_name = self._hero_name
		local menu_option_key = "talent"
		local menu_option = {}

		menu_options[menu_option_key] = menu_option

		for _, slot_unlock in ipairs(progression_talents) do
			local category = slot_unlock.category
			local loadout_settings = WeaveLoadoutSettings[career_name]
			local talent_tree = loadout_settings.talent_tree
			local talents = talent_tree[category]
			local entries = {}

			for _, talent_name in ipairs(talents) do
				local talent_id = TalentIDLookup[talent_name].talent_id
				local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)
				local required_forge_level = backend_interface_weaves:get_talent_required_forge_level(talent_name) or 0
				local icon = talent_data and talent_data.icon or "icons_placeholder"
				local title_text = talent_data and Localize(talent_data.name) or "Undefined"
				local description_text = talent_data and UIUtils.get_talent_description(talent_data) or "Undefined"
				local widget = UIWidget.init(widget_definition)
				local entry = {
					title = title_text,
					text = description_text,
					icon = icon,
					category = category,
					key = talent_name,
					widget = widget,
					required_forge_level = required_forge_level,
				}

				entries[#entries + 1] = entry
			end

			table.sort(entries, sort_entry_by_unlock_order)

			local spacing = 0
			local num_entries = #entries
			local entry_height = widget_size[2]
			local total_length = entry_height * num_entries + spacing * (num_entries + 1)
			local scroll_length = math.max(total_length - list_draw_length, 0)
			local scrollbar_widget = UIWidget.init(scrollbar_widget_definition)
			local draw_count = math.ceil(list_draw_length / (entry_height + spacing))
			local scrollbar_logic = self:_initialize_scrollbar(scrollbar_widget, scroll_length, list_scenegraph_id, spacing)
			local sub_display_name

			if selected_item then
				local item_data = selected_item.data

				sub_display_name = localized_strings[item_data.slot_type]
			else
				sub_display_name = menu_option_category_localized_strings[menu_option_key][category]
			end

			menu_option[category] = {
				root_scenegraph_id = "option_talent",
				scrolled_length = 0,
				draw_count = draw_count,
				spacing = spacing,
				total_length = total_length,
				scroll_length = scroll_length,
				scrollbar_widget = scrollbar_widget,
				scrollbar_logic = scrollbar_logic,
				name = category,
				display_name = Localize("menu_weave_forge_options_title_talents"),
				sub_display_name = sub_display_name,
				entries = entries,
				widget_size = widget_size,
				scroll_content = {
					scroll_progress = 0,
				},
			}
		end
	end

	if progression_properties then
		local scenegraph_id = "option_propery"
		local widget_size = scenegraph_definition[scenegraph_id].size
		local widget_definition = create_menu_option_property_definition(scenegraph_id, widget_size, masked)
		local menu_option_key = "property"
		local menu_option = {}

		menu_options[menu_option_key] = menu_option

		for _, slot_unlock in ipairs(progression_properties) do
			local category = slot_unlock.category
			local properties = WeaveProperties.categories[category]
			local entries = {}

			for _, property_key in ipairs(properties) do
				local property_data = WeaveProperties.properties[property_key]
				local required_forge_level = backend_interface_weaves:get_property_required_forge_level(property_key) or 0
				local buff_name = property_data.buff_name
				local buff_template = BuffUtils.get_buff_template(buff_name)
				local buff_data = buff_template.buffs[1]
				local has_multiplier = buff_data.variable_multiplier ~= nil
				local icon = property_data.icon or "icons_placeholder"
				local display_name = property_data.display_name
				local mastery_costs = backend_interface_weaves:get_property_mastery_costs(property_key)
				local title_text = UIUtils.get_weave_property_description(property_key, property_data, mastery_costs)
				local widget = UIWidget.init(widget_definition)
				local entry = {
					title = title_text,
					icon = icon,
					category = category,
					key = property_key,
					widget = widget,
					required_forge_level = required_forge_level,
				}

				entries[#entries + 1] = entry
			end

			table.sort(entries, sort_entry_by_unlock_order)

			local spacing = 20
			local num_entries = #entries
			local entry_height = widget_size[2]
			local total_length = entry_height * num_entries + spacing * (num_entries + 1)
			local scroll_length = math.max(total_length - list_draw_length, 0)
			local scrollbar_widget = UIWidget.init(scrollbar_widget_definition)
			local draw_count = math.ceil(list_draw_length / (entry_height + spacing))
			local scrollbar_logic = self:_initialize_scrollbar(scrollbar_widget, total_length, list_scenegraph_id, spacing)
			local sub_display_name

			if selected_item then
				local item_data = selected_item.data

				sub_display_name = localized_strings[item_data.slot_type]
			else
				sub_display_name = menu_option_category_localized_strings[menu_option_key][category]
			end

			menu_option[category] = {
				root_scenegraph_id = "option_propery",
				scrolled_length = 0,
				draw_count = draw_count,
				spacing = spacing,
				total_length = total_length,
				scroll_length = scroll_length,
				scrollbar_widget = scrollbar_widget,
				scrollbar_logic = scrollbar_logic,
				name = category,
				display_name = Localize("menu_weave_forge_options_title_properties"),
				sub_display_name = sub_display_name,
				entries = entries,
				widget_size = widget_size,
				scroll_content = {
					scroll_progress = 0,
				},
			}
		end
	end

	self._menu_options = menu_options
end

HeroWindowWeaveProperties._populate_menu_widgets = function (self)
	local menu_options = self._menu_options

	for menu_option_key, options in pairs(menu_options) do
		for _, menu_data in pairs(options) do
			local entries = menu_data.entries

			for i, entry in ipairs(entries) do
				self:_populate_menu_option_widget(entry, menu_option_key)
			end
		end
	end
end

HeroWindowWeaveProperties._populate_menu_option_widget = function (self, entry_data, menu_option)
	local widget = entry_data.widget
	local content = widget.content
	local offset = widget.offset
	local style = widget.style
	local size = content.size
	local title = entry_data.title
	local text = entry_data.text
	local icon = entry_data.icon

	if title then
		content.title_text = title
	end

	if text then
		content.text = text:gsub("\n\n", "\n")
	end

	if icon then
		content.icon = icon
	end

	local forge_level = self._forge_level
	local required_forge_level = entry_data.required_forge_level
	local locked = forge_level < required_forge_level
	local button_hotspot = content.button_hotspot

	button_hotspot.disable_button = locked

	local current_mastery = self._current_mastery or 0
	local loadout = self._loadout
	local backend_interface_weaves = Managers.backend:get_interface("weaves")

	if menu_option == "talent" then
		local talent_key = entry_data.key
		local used_amount = 0
		local current_talents = loadout.talent

		if current_talents then
			local slot_index = current_talents[talent_key]

			used_amount = slot_index or 0
		end

		content.used_amount = used_amount

		local num_uses = 1
		local cost = backend_interface_weaves:get_talent_mastery_cost(talent_key)
		local value_text = not locked and used_amount < num_uses and tostring(cost)
		local price_text

		if value_text then
			price_text = localized_strings.talent_cost .. " " .. value_text
		elseif locked then
			price_text = localized_strings.forge_level_requirement .. " " .. tostring(required_forge_level)
		else
			price_text = localized_strings.talent_cost_cap
		end

		local can_afford = cost <= current_mastery

		self:_align_menu_option_price_text(style, content.price_icon, price_text, value_text, can_afford, locked)

		content.total_uses = num_uses
		content.price_text = price_text
		entry_data.next_cost = cost
		entry_data.can_override_occupied_slots = true
	elseif menu_option == "trait" then
		local trait_key = entry_data.key
		local trait_data = WeaveTraits.traits[trait_key]
		local used_amount = 0
		local current_traits = loadout.trait

		if current_traits then
			local slot_index = current_traits[trait_key]

			used_amount = slot_index or 0
		end

		content.used_amount = used_amount

		local num_uses = 1
		local cost = backend_interface_weaves:get_trait_mastery_cost(trait_key)
		local value_text = not locked and used_amount < num_uses and tostring(cost)
		local price_text

		if value_text then
			price_text = localized_strings.trait_cost .. " " .. value_text
		elseif locked then
			price_text = localized_strings.forge_level_requirement .. " " .. tostring(required_forge_level)
		else
			price_text = localized_strings.trait_cost_cap
		end

		local can_afford = cost <= current_mastery

		self:_align_menu_option_price_text(style, content.price_icon, price_text, value_text, can_afford, locked)

		content.total_uses = num_uses
		content.price_text = price_text
		entry_data.next_cost = cost
		entry_data.can_override_occupied_slots = true
	elseif menu_option == "property" then
		local property_key = entry_data.key
		local property_data = WeaveProperties.properties[property_key]
		local description_values = property_data.description_values
		local value_type = description_values[1].value_type
		local used_amount = 0
		local current_properties = loadout.property

		if current_properties then
			local slot_indices = current_properties[property_key]

			used_amount = slot_indices and #slot_indices or 0
		end

		local costs = backend_interface_weaves:get_property_mastery_costs(property_key)
		local total_value_text = UIUtils.get_weave_property_value_text(property_key, property_data, costs, used_amount)

		content.total_value_text = total_value_text
		content.used_amount = used_amount

		local num_uses = #costs
		local next_cost = used_amount < num_uses and costs[used_amount + 1] or nil
		local value_text = not locked and next_cost and tostring(next_cost)
		local price_text

		if value_text then
			price_text = localized_strings.property_cost .. " " .. value_text
		elseif locked then
			price_text = localized_strings.forge_level_requirement .. " " .. tostring(required_forge_level)
		else
			price_text = localized_strings.property_cost_cap
		end

		local can_afford = next_cost and next_cost <= current_mastery

		self:_align_menu_option_price_text(style, content.price_icon, price_text, value_text, can_afford, locked)

		content.total_uses = num_uses
		content.price_text = price_text
		entry_data.next_cost = next_cost

		local default_text_length = UTF8Utils.string_length(title)
		local end_index = string.find(title, " ", 1)
		local value_string = string.sub(title, 1, end_index)
		local value_string_length = UTF8Utils.string_length(value_string)
		local text_style = style.title_text

		if text_style then
			local color_override_table = text_style.color_override_table

			color_override_table.start_index = value_string_length
			color_override_table.end_index = default_text_length

			local color_override = text_style.color_override

			color_override[1] = color_override_table
		end
	end
end

local mastery_price_colors = {
	affordable = {
		255,
		121,
		193,
		229,
	},
	unaffordable = {
		255,
		200,
		0,
		0,
	},
}

HeroWindowWeaveProperties._align_menu_option_price_text = function (self, style, price_icon, price_text, value_text, can_afford, locked)
	local ui_renderer = self._ui_renderer
	local price_text_style = style.price_text
	local price_icon_width = 0

	if value_text then
		local value_string_length = UTF8Utils.string_length(value_text)
		local default_text_length = UTF8Utils.string_length(price_text)
		local color_override_table = price_text_style.color_override_table

		color_override_table.start_index = default_text_length - value_string_length
		color_override_table.end_index = default_text_length

		local color_override = price_text_style.color_override

		color_override[1] = color_override_table
		color_override_table.color = can_afford and mastery_price_colors.affordable or mastery_price_colors.unaffordable

		local price_icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(price_icon)
		local price_icon_size = price_icon_texture_settings.size

		price_icon_width = price_icon_size[1]
	elseif locked then
		local price_icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(price_icon)
		local price_icon_size = price_icon_texture_settings.size

		price_icon_width = price_icon_size[1]
	else
		local color_override = price_text_style.color_override

		color_override[1] = nil
	end

	local spacing = 0
	local style_price_text = locked and style.price_text_disabled or style.price_text
	local price_text_width = UIUtils.get_text_width(ui_renderer, style_price_text, price_text)
	local total_price_width = price_icon_width + price_text_width + spacing

	if locked then
		local price_text_offset = -(total_price_width / 2 - price_text_width / 2) + (price_icon_width / 2 + 5)

		style_price_text.offset[1] = style_price_text.default_offset[1] + price_text_offset

		local style_price_text_shadow = style.price_text_shadow

		style_price_text_shadow.offset[1] = style_price_text_shadow.default_offset[1] + price_text_offset

		local price_icon_offset = price_text_offset - (price_text_width / 2 + price_icon_width / 2)
		local style_lock_icon = style.lock_icon

		style_lock_icon.offset[1] = style_lock_icon.default_offset[1] + price_icon_offset
	else
		local price_text_offset = -(total_price_width / 2 - (price_text_width / 2 + 5))

		style_price_text.offset[1] = style_price_text.default_offset[1] + price_text_offset

		local style_price_text_shadow = style.price_text_shadow

		style_price_text_shadow.offset[1] = style_price_text_shadow.default_offset[1] + price_text_offset

		local style_price_icon = style.price_icon

		style_price_icon.offset[1] = style_price_icon.default_offset[1] + price_text_offset + price_icon_width / 2 + price_text_width / 2 + spacing
	end
end

HeroWindowWeaveProperties._create_viewport_definition = function (self)
	local shading_environment = "environment/ui_weave_forge_preview"

	return {
		scenegraph_id = "viewport",
		element = UIElements.Viewport,
		style = {
			viewport = {
				enable_sub_gui = false,
				fov = 20,
				layer = 840,
				viewport_name = "item_preview_viewport",
				viewport_type = "default_forward",
				world_name = "item_preview",
				shading_environment = shading_environment,
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
			},
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
	}
end

HeroWindowWeaveProperties._create_cluster_background = function (self, index, position_x, position_y)
	local widgets_by_name = self._widgets_by_name
	local texture_background = "athanor_skilltree_cluster_" .. index
	local texture_background_effect = "athanor_skilltree_cluster_effect_" .. index
	local scenegraph_id = "slot_cluster"
	local widget_definition_default = UIWidgets.create_simple_texture(texture_background, scenegraph_id, nil, nil, {
		150,
		255,
		255,
		255,
	})
	local widget_definition_effect = UIWidgets.create_simple_texture(texture_background_effect, scenegraph_id, nil, nil, {
		255,
		138,
		0,
		147,
	}, 1)
	local default_widget = UIWidget.init(widget_definition_default)

	self._bottom_widgets[#self._bottom_widgets + 1] = default_widget
	widgets_by_name["cluster_background_" .. index] = default_widget
	default_widget.offset[1] = position_x
	default_widget.offset[2] = position_y

	local effect_widget = UIWidget.init(widget_definition_effect)

	self._bottom_hdr_widgets[#self._bottom_hdr_widgets + 1] = effect_widget
	widgets_by_name["cluster_background_effect_" .. index] = effect_widget
	effect_widget.offset[1] = position_x
	effect_widget.offset[2] = position_y
end

HeroWindowWeaveProperties._create_slot_grid = function (self, slot_layout, slots_progression)
	local function add_entry(self, slots_progression, slot_table, layout, layer_settings, parent_x, parent_y, layer_index)
		local name = layout.name
		local max_amount = layout.max_amount
		local amount_per_layer = layout.amount_per_layer
		local degrees = layout.degrees
		local radius = layout.radius
		local widget_definition, progression_table

		if name == "trait" then
			widget_definition = create_trait_slot_definition("slot_root", {
				80,
				80,
			})
			progression_table = slots_progression.traits
		elseif name == "talent" then
			widget_definition = create_talent_slot_definition("slot_root", {
				100,
				100,
			})
			progression_table = slots_progression.talents
		elseif name == "property" then
			widget_definition = create_property_slot_definition("slot_root", {
				50,
				50,
			})
			progression_table = slots_progression.properties
		end

		parent_x = parent_x or 0
		parent_y = parent_y or 0

		local layers = 1
		local start_angle = layout.start_angle or math.pi / 2

		for i = 1, layers do
			local layer_start_angle_increment = layout.layer_start_angle_increment

			if layer_start_angle_increment then
				start_angle = start_angle + ((layer_index or i) - 1) * layer_start_angle_increment
			end

			local settings = layer_settings and layer_settings[i]

			amount_per_layer = settings and settings.amount_per_layer or amount_per_layer
			degrees = settings and settings.degrees or degrees
			radius = settings and settings.radius or radius

			local radians = math.degrees_to_radians(degrees)
			local start_index = #slot_table + 1
			local num_slots_to_add = math.min(amount_per_layer, max_amount - #slot_table)
			local radians_split_count = math.max(amount_per_layer - 1, 1)
			local radians_per_slot = radians / radians_split_count
			local slot_start_angle = start_angle - radians_per_slot * amount_per_layer / 2 + radians_per_slot / 2
			local slot_counter = 0

			for k = start_index, start_index + num_slots_to_add - 1 do
				slot_counter = slot_counter + 1

				local slot_angle = slot_start_angle + (slot_counter - 1) * radians_per_slot
				local position_x = math.sin(slot_angle) * radius
				local position_y = math.cos(slot_angle) * radius
				local widget = UIWidget.init(widget_definition)

				if name == "trait" then
					self:_create_cluster_background(k, position_x, position_y)
				end

				local entry_index = #slot_table + 1
				local entry_progression = progression_table[entry_index]
				local entry = {
					widget_type = name,
					widget = widget,
					x = math.floor(parent_x + position_x),
					y = math.floor(parent_y + position_y),
					index = entry_index,
					category = entry_progression and entry_progression.category,
					unlock_level = entry_progression and entry_progression.unlock_level,
				}

				slot_table[entry_index] = entry
			end
		end
	end

	local slots = {}
	local complete = false

	while not complete do
		complete = true

		for index, slots_layout in ipairs(slot_layout) do
			local slot_entries
			local inherent_parent = slots_layout.inherent_parent
			local layer_settings = slots_layout.layer_settings
			local name = slots_layout.name

			if not slots[name] then
				if not inherent_parent then
					slot_entries = {}

					add_entry(self, slots_progression, slot_entries, slots_layout, layer_settings)

					complete = false
				elseif slots[inherent_parent] then
					slot_entries = {}

					local parent_slots = slots[inherent_parent]

					for i = 1, #parent_slots do
						local parent_slot = parent_slots[i]
						local parent_x = parent_slot.x
						local parent_y = parent_slot.y

						add_entry(self, slots_progression, slot_entries, slots_layout, layer_settings, parent_x, parent_y, i)
					end

					complete = false
				end
			end

			if slot_entries then
				slots[name] = slot_entries
			end
		end
	end

	self._slots = slots

	local category_slots_by_type = {}

	for slot_type, type_slots in pairs(slots) do
		if not category_slots_by_type[slot_type] then
			category_slots_by_type[slot_type] = {}
		end

		local slots_type_categories = category_slots_by_type[slot_type]

		for _, slot in ipairs(type_slots) do
			local category = slot.category

			if not slots_type_categories[category] then
				slots_type_categories[category] = {}
			end

			local category_slots = slots_type_categories[category]

			category_slots[#category_slots + 1] = slot
		end
	end

	self._category_slots_by_type = category_slots_by_type
end

HeroWindowWeaveProperties.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowWeaveProperties")

	self._ui_animator = nil

	self:_destroy_previewers()

	if self._viewport_widget then
		UIWidget.destroy(self._ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	Managers.backend:commit()
end

HeroWindowWeaveProperties.update = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()
	local widgets_by_name = self._widgets_by_name
	local viewport_button = widgets_by_name.viewport_button
	local is_hover = self:_is_button_hover(viewport_button)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local allow_preview_input = gamepad_active or is_hover
	local item_previewer = self._item_previewer

	if item_previewer then
		item_previewer:update(dt, t, allow_preview_input and input_service)
	end

	local unit_previewer = self._unit_previewer

	if unit_previewer then
		unit_previewer:update(dt, t, allow_preview_input and input_service)
	end

	local options_list_button = widgets_by_name.options_list_button
	local options_list_hovering = self:_is_button_hover(options_list_button)
	local active_menu_option = self._active_menu_option
	local active_menu_category = self._active_menu_category

	if active_menu_option and active_menu_category then
		local menu_options = self._menu_options
		local options = menu_options[active_menu_option]
		local option = options[active_menu_category]
		local scrollbar_logic = option.scrollbar_logic

		if scrollbar_logic then
			scrollbar_logic:update(dt, t, not options_list_hovering)
		end
	end

	self:_update_animations(dt)
	self:_draw(dt)

	local upgrade_done_time = self._upgrade_magic_level_done_time

	if upgrade_done_time and upgrade_done_time < t then
		local response = self._upgrade_magic_level_response

		if response ~= nil then
			self:_upgrade_magic_level_done(response)

			self._upgrade_magic_level_done_time = nil
			self._upgrade_magic_level_response = nil
		end
	end
end

HeroWindowWeaveProperties.post_update = function (self, dt, t)
	if self._viewport_widget_definition and not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)
	end

	if self._viewport_widget and not self._previewer_initialized then
		self._previewer_initialized = true

		local selected_item = self:_selected_item()
		local selected_unit_name = self:_selected_unit_name()
		local viewport_widget = self._viewport_widget

		if selected_item then
			self._item_previewer = self:_create_item_previewer(viewport_widget, selected_item)
		elseif selected_unit_name then
			self._unit_previewer = self:_create_unit_previewer(viewport_widget, selected_unit_name, selected_unit_name)
		end
	end

	if self._item_previewer then
		self._item_previewer:post_update(dt, t)
	end

	if self._unit_previewer then
		self._unit_previewer:post_update(dt, t)
	end

	self:_handle_input(dt, t)
end

HeroWindowWeaveProperties._update_background_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local degrees = 360
	local radians = math.degrees_to_radians(degrees)
	local overall_speed = 1 + 4 * self._upgrading_anim_progress

	for i = 1, 3 do
		local wheel_widget = widgets_by_name["wheel_ring_" .. i]
		local wheel_hdr_widget = widgets_by_name["hdr_wheel_ring_" .. i]
		local current_angle = wheel_widget.style.texture_id.angle
		local angle_add = 0

		if i == 1 then
			local speed = dt * 0.014 * overall_speed

			angle_add = (current_angle + radians * speed) % radians
		elseif i == 2 then
			local speed = dt * 0.012 * overall_speed

			angle_add = (current_angle - radians * speed) % -radians
		elseif i == 3 then
			local speed = dt * 0.011 * overall_speed

			angle_add = (current_angle + radians * speed) % radians
		end

		wheel_widget.style.texture_id.angle = angle_add
		wheel_hdr_widget.style.texture_id.angle = angle_add
	end

	local pulse_speed = 2.5
	local progress = 0.5 + math.sin(Managers.time:time("ui") * pulse_speed) * 0.5

	self:_set_background_bloom_intensity(progress)
end

HeroWindowWeaveProperties._set_background_bloom_intensity = function (self, fraction)
	local min = 1.39
	local max = 2 + 30 * self._upgrading_anim_progress
	local value = min + math.clamp(fraction, 0, 1) * max
	local parent = self._parent
	local hdr_renderer = parent:hdr_renderer()
	local gui = hdr_renderer.gui
	local widgets_by_name = self._widgets_by_name
	local hdr_background_wheel = widgets_by_name.hdr_background_wheel
	local texture_background_wheel = hdr_background_wheel.content.texture_id
	local gui_material_background_wheel = Gui.material(gui, texture_background_wheel)

	Material.set_scalar(gui_material_background_wheel, "noise_intensity", value)

	for i = 1, 3 do
		local hdr_wheel_ring = widgets_by_name["hdr_wheel_ring_" .. i]
		local texture_wheel_ring = hdr_wheel_ring.content.texture_id
		local gui_material_wheel_ring = Gui.material(gui, texture_wheel_ring)

		Material.set_scalar(gui_material_wheel_ring, "noise_intensity", value)

		local cluster_widget = widgets_by_name["cluster_background_effect_" .. i]

		if cluster_widget then
			local texture_cluster = cluster_widget.content.texture_id
			local gui_material_cluster = Gui.material(gui, texture_cluster)

			Material.set_scalar(gui_material_cluster, "noise_intensity", value)
		end
	end
end

HeroWindowWeaveProperties._update_animations = function (self, dt)
	local params = self._params
	local is_upgrading = params.upgrading
	local upgrading_anim_progress = self._upgrading_anim_progress or 0
	local upgrading_speed = 3

	if is_upgrading then
		upgrading_anim_progress = math.min(upgrading_anim_progress + dt * upgrading_speed, 1)
	else
		upgrading_anim_progress = math.max(upgrading_anim_progress - dt * upgrading_speed, 0)
	end

	self._upgrading_anim_progress = upgrading_anim_progress

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

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_default_button(widgets_by_name.upgrade_button, dt)
	UIWidgetUtils.animate_default_button(widgets_by_name.clear_button, dt)
	self:_animate_menu_widgets(dt)
	self:_update_background_animations(dt)
	self:_animate_mastery_amount(dt)
end

HeroWindowWeaveProperties._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		if not hotspot.is_selected then
			return true
		end
	end
end

HeroWindowWeaveProperties._is_button_hover = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover
end

HeroWindowWeaveProperties._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowWeaveProperties._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end

HeroWindowWeaveProperties._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

HeroWindowWeaveProperties._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.is_hover or false
end

HeroWindowWeaveProperties._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._parent:window_input_service()
	local upgrade_button = widgets_by_name.upgrade_button
	local clear_button = widgets_by_name.clear_button

	if self:_is_button_hover_enter(upgrade_button) or self:_is_button_hover_enter(clear_button) then
		self:_play_sound("Play_hud_hover")
	end

	if self:_is_button_pressed(upgrade_button) then
		self:_upgrade_magic_level()
	elseif self:_is_button_pressed(clear_button) then
		self:_clear_slots(self._active_menu_option, self._active_menu_category)
	end
end

HeroWindowWeaveProperties._upgrade_magic_level = function (self)
	self._params.upgrading = true

	self._parent:block_input()

	local time = Managers.time:time("ui")

	self._upgrade_magic_level_done_time = time + UPGRADE_REQUEST_LIMIT
	self._upgrade_magic_level_response = nil

	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button

	upgrade_button.content.upgrading = true
	upgrade_button.content.button_hotspot.disable_button = true

	local career_name = self._career_name
	local item = self:_selected_item()
	local item_backend_id = item and item.backend_id
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local callback = callback(self, "_upgrade_magic_level_cb")

	if item_backend_id then
		backend_interface_weaves:upgrade_item_magic_level(item_backend_id, callback)
	else
		backend_interface_weaves:upgrade_career_magic_level(career_name, callback)
	end
end

HeroWindowWeaveProperties._upgrade_magic_level_cb = function (self, success)
	print("_upgrade_magic_level_cb")

	self._upgrade_magic_level_response = success
end

HeroWindowWeaveProperties._upgrade_magic_level_done = function (self, success)
	self._params.upgrading = nil

	self._parent:unblock_input()

	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button

	upgrade_button.content.upgrading = false
	upgrade_button.content.button_hotspot.disable_button = false

	self:_sync_backend_loadout(success)

	local selected_item = self:_selected_item()

	if selected_item then
		self:_play_sound("menu_magic_forge_weapon_upgrade")
	else
		self:_play_sound("menu_magic_forge_amulet_upgrade")
	end

	Managers.state.event:trigger("weave_forge_item_upgraded")

	if self.upgrage_tutorial then
		self.upgrage_tutorial = false

		local widgets_by_name = self._widgets_by_name
		local upgrade_button = widgets_by_name.upgrade_button

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

HeroWindowWeaveProperties._magic_level = function (self)
	return self._current_magic_level or 0
end

HeroWindowWeaveProperties._sync_backend_loadout = function (self, upgraded)
	local career_name = self._career_name
	local item = self:_selected_item()
	local item_backend_id = item and item.backend_id
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local properties = backend_interface_weaves:get_loadout_properties(career_name, item_backend_id)
	local traits = backend_interface_weaves:get_loadout_traits(career_name, item_backend_id)
	local talents = not item_backend_id and backend_interface_weaves:get_loadout_talents(career_name)
	local initial_mastery, current_mastery = backend_interface_weaves:get_mastery(career_name, item_backend_id)
	local play_sound = self._current_mastery ~= nil

	self:_set_mastery_amount(initial_mastery, current_mastery, play_sound)

	local title_text = ""
	local sub_title_text = ""
	local magic_level, max_magic_level, magic_power

	if item_backend_id then
		max_magic_level = backend_interface_weaves:max_magic_level()
		magic_level = backend_interface_weaves:get_item_magic_level(item_backend_id)
		magic_power = backend_interface_weaves:get_item_power_level(item_backend_id)
		magic_power = UIUtils.presentable_hero_power_level_weaves(magic_power)

		local item_data = item.data

		title_text = Localize(item_data.display_name)
		sub_title_text = Localize(item_data.item_type)
	else
		title_text = Localize("weave_amulet_name")
		max_magic_level = backend_interface_weaves:max_magic_level()
		magic_level = backend_interface_weaves:get_career_magic_level(career_name)
		magic_power = backend_interface_weaves:get_career_power_level(career_name)
		magic_power = magic_power and UIUtils.presentable_hero_power_level_weaves(magic_power)

		local career_settings = CareerSettings[career_name]

		sub_title_text = Localize(career_settings.display_name)
	end

	self._current_magic_level = magic_level

	self:_set_title_text(title_text, sub_title_text)

	local widgets_by_name = self._widgets_by_name
	local panel_divider_widget = widgets_by_name.viewport_panel_divider
	local level_text_widget = widgets_by_name.viewport_level_value
	local level_title_widget = widgets_by_name.viewport_level_title

	level_text_widget.content.text = magic_level

	local power_text_widget = widgets_by_name.viewport_power_value
	local power_title_widget = widgets_by_name.viewport_power_title

	power_text_widget.content.visible = magic_power ~= nil
	power_title_widget.content.visible = magic_power ~= nil
	panel_divider_widget.content.visible = magic_power ~= nil

	if magic_power then
		power_text_widget.content.text = magic_power
	else
		self._ui_scenegraph[level_text_widget.scenegraph_id].local_position[1] = 0
		self._ui_scenegraph[level_title_widget.scenegraph_id].local_position[1] = 0
	end

	local forge_level = backend_interface_weaves:get_forge_level()

	self._forge_level = forge_level

	local forge_progression_steps = backend_interface_weaves:forge_max_level()
	local is_max_forge_level = forge_progression_steps == forge_level
	local magic_level_cap = backend_interface_weaves:forge_magic_level_cap()
	local essence_amount = backend_interface_weaves:get_essence()
	local upgrade_cost

	if item_backend_id then
		upgrade_cost = backend_interface_weaves:magic_item_upgrade_cost(item_backend_id)
	else
		upgrade_cost = backend_interface_weaves:career_upgrade_cost(career_name)
	end

	local is_max_level = max_magic_level <= magic_level
	local can_afford_upgrade = upgrade_cost and upgrade_cost <= essence_amount
	local magic_cap_reached = not is_max_level and magic_level_cap <= magic_level

	self:_set_essence_upgrade_cost(not is_max_level and upgrade_cost, can_afford_upgrade, magic_cap_reached)

	local slots = self._slots

	self._loadout = {
		trait = traits,
		talent = talents,
		property = properties,
	}

	if properties then
		local properties_index_map = {}

		for key, slot_indices in pairs(properties) do
			for _, slot_index in ipairs(slot_indices) do
				properties_index_map[slot_index] = key
			end
		end

		local slot_type = "property"
		local type_slots = slots[slot_type]
		local slot_type_strings = menu_option_category_localized_strings[slot_type]

		for slot_index, slot in ipairs(type_slots) do
			local slot_category = slot.category
			local unlock_level = slot.unlock_level
			local widget = slot.widget
			local content = widget.content
			local property_key = properties_index_map[slot_index]
			local add_tooltip = magic_level < unlock_level or property_key
			local tooltip_data = add_tooltip and {} or nil

			content.tooltip = tooltip_data

			local is_new = unlock_level == magic_level and upgraded

			if is_new then
				content.new = is_new
				content.new_effect_timer = 0
			end

			local tooltip_slot_title = localized_strings.tooltip_slot_title_property
			local tooltip_slot_sub_title = slot_type_strings[slot_category] or localized_strings[slot_category]

			if property_key then
				if not slot.presentation_data then
					slot.presentation_data = {
						animation_duration = 0.4,
					}
				end

				local property_data = WeaveProperties.properties[property_key]
				local mastery_costs = backend_interface_weaves:get_property_mastery_costs(property_key)
				local slot_indices = properties[property_key]
				local num_uses = #slot_indices
				local cost_value = mastery_costs[num_uses]
				local display_name = property_data.display_name
				local title_text = UIUtils.get_weave_property_description(property_key, property_data, mastery_costs)
				local icon = property_data.icon or "icons_placeholder"
				local presentation_data = slot.presentation_data

				presentation_data.icon = icon
				presentation_data.key = property_key
				presentation_data.value = cost_value

				if tooltip_data then
					tooltip_data.property_title = title_text
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.input = localized_strings.slot_clear_input_description_property
					tooltip_data.value = Localize("menu_weave_forge_option_tooltip_value_title") .. " " .. cost_value
				end
			else
				if tooltip_data then
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.input = string.format(localized_strings.unlock_slot_title, unlock_level)
				end

				slot.presentation_data = nil
			end
		end
	end

	if traits then
		local slot_type = "trait"
		local type_slots = slots[slot_type]
		local slot_type_strings = menu_option_category_localized_strings[slot_type]

		for slot_index, slot in ipairs(type_slots) do
			local slot_category = slot.category
			local unlock_level = slot.unlock_level
			local widget = slot.widget
			local content = widget.content
			local trait_key = table.find(traits, slot_index)
			local add_tooltip = magic_level < unlock_level or trait_key
			local tooltip_data = add_tooltip and {} or nil

			content.tooltip = tooltip_data

			local is_new = unlock_level == magic_level and upgraded

			if is_new then
				content.new = is_new
				content.new_effect_timer = 0
			end

			local tooltip_slot_title = localized_strings.tooltip_slot_title_trait
			local tooltip_slot_sub_title = slot_type_strings[slot_category] or localized_strings[slot_category]

			if trait_key then
				if not slot.presentation_data then
					slot.presentation_data = {
						animation_duration = 0.4,
					}
				end

				local trait_data = WeaveTraits.traits[trait_key]
				local icon = trait_data.icon or "icons_placeholder"
				local cost_value = backend_interface_weaves:get_trait_mastery_cost(trait_key)
				local display_name = trait_data.display_name
				local trait_advanced_description = trait_data.advanced_description
				local trait_icon = trait_data.icon
				local presentation_data = slot.presentation_data

				presentation_data.icon = icon
				presentation_data.key = trait_key
				presentation_data.value = cost_value

				local title_text = Localize(display_name)
				local description_text = ""

				if trait_advanced_description then
					description_text = UIUtils.get_trait_description(trait_key, trait_data)
				end

				if tooltip_data then
					tooltip_data.trait_title = Localize(display_name)
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.description = description_text
					tooltip_data.input = localized_strings.slot_clear_input_description_trait
					tooltip_data.value = Localize("menu_weave_forge_option_tooltip_value_title") .. " " .. cost_value
				end
			else
				if tooltip_data then
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.input = string.format(localized_strings.unlock_slot_title, unlock_level)
				end

				slot.presentation_data = nil
			end
		end
	end

	if talents then
		local slot_type = "talent"
		local type_slots = slots[slot_type]
		local slot_type_strings = menu_option_category_localized_strings[slot_type]
		local hero_name = self._hero_name

		for slot_index, slot in ipairs(type_slots) do
			local slot_category = slot.category
			local unlock_level = slot.unlock_level
			local widget = slot.widget
			local content = widget.content
			local tooltip_slot_title = localized_strings.tooltip_slot_title_talent
			local tooltip_slot_sub_title = slot_type_strings[slot_category] or localized_strings[slot_category]
			local talent_key = table.find(talents, slot_index)
			local add_tooltip = magic_level < unlock_level or talent_key
			local tooltip_data = add_tooltip and {} or nil

			content.tooltip = tooltip_data

			local is_new = unlock_level == magic_level and upgraded

			if is_new then
				content.new = is_new
				content.new_effect_timer = 0
			end

			if talent_key then
				if not slot.presentation_data then
					slot.presentation_data = {
						animation_duration = 0.4,
					}
				end

				local talent_id = TalentIDLookup[talent_key].talent_id
				local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)
				local cost_value = backend_interface_weaves:get_talent_mastery_cost(talent_key)
				local icon = talent_data and talent_data.icon or "icons_placeholder"
				local presentation_data = slot.presentation_data

				presentation_data.icon = icon
				presentation_data.key = talent_key
				presentation_data.value = cost_value

				if tooltip_data then
					tooltip_data.talent_title = talent_data and Localize(talent_data.name) or "n/a"
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.description = talent_data and UIUtils.get_talent_description(talent_data) or "n/a"
					tooltip_data.input = localized_strings.slot_clear_input_description_talent
					tooltip_data.value = Localize("menu_weave_forge_option_tooltip_value_title") .. " " .. cost_value
				end
			else
				if tooltip_data then
					tooltip_data.sub_title = tooltip_slot_title .. " - " .. tooltip_slot_sub_title
					tooltip_data.input = string.format(localized_strings.unlock_talent_title, unlock_level)
				end

				slot.presentation_data = nil
			end
		end
	end

	self:_populate_menu_widgets()

	local can_clear_slots = false

	if self._active_menu_option and self._active_menu_category then
		can_clear_slots = self:_can_clear_slots(self._active_menu_option, self._active_menu_category)
	end

	self:_set_clear_button_enabled_state(can_clear_slots)
	self:_setup_upgrade_tooltip(magic_level, max_magic_level, item)
end

HeroWindowWeaveProperties._setup_upgrade_tooltip = function (self, magic_level, max_magic_level, item)
	local widgets_by_name = self._widgets_by_name
	local upgrade_button = widgets_by_name.upgrade_button
	local upgrade_tooltip_data
	local next_magic_level = magic_level + 1

	if next_magic_level <= max_magic_level then
		upgrade_tooltip_data = {
			title = string.format(Localize("menu_weave_forge_tooltip_upgrade_item_title"), next_magic_level),
			sub_title = string.format(Localize("menu_weave_forge_tooltip_upgrade_item_description"), max_magic_level),
			upgrade_effect_title = Localize("menu_weave_forge_tooltip_upgrade_item_effect_title"),
		}

		local is_item = item ~= nil
		local progression_table = is_item and WeaveWeaponProgression or WeaveCareerProgression
		local progression_properties = progression_table.properties

		if progression_properties then
			local counter = 0

			for slot_index, data in pairs(progression_properties) do
				local unlock_level = data.unlock_level

				if unlock_level == next_magic_level then
					counter = counter + 1
				end
			end

			if counter > 0 then
				local suffix = counter > 1 and Localize("menu_weave_forge_tooltip_upgrade_property_slots") or Localize("menu_weave_forge_tooltip_upgrade_property_slot")

				upgrade_tooltip_data.upgrade_property_text = "+" .. counter .. " " .. suffix
			end
		end

		local progression_talents = progression_table.talents

		if progression_talents then
			local counter = 0

			for slot_index, data in pairs(progression_talents) do
				local unlock_level = data.unlock_level

				if unlock_level == next_magic_level then
					counter = counter + 1
				end
			end

			if counter > 0 then
				upgrade_tooltip_data.upgrade_talent_text = "+" .. counter .. " " .. Localize("menu_weave_forge_tooltip_upgrade_talent_slot")
			end
		end

		local progression_traits = progression_table.traits

		if progression_traits then
			local counter = 0

			for slot_index, data in pairs(progression_traits) do
				local unlock_level = data.unlock_level

				if unlock_level == next_magic_level then
					counter = counter + 1
				end
			end

			if counter > 0 then
				local suffix = counter > 1 and Localize("menu_weave_forge_tooltip_upgrade_trait_slots") or Localize("menu_weave_forge_tooltip_upgrade_trait_slot")

				upgrade_tooltip_data.upgrade_trait_text = "+" .. counter .. " " .. suffix
			end
		end

		local mastery_per_level = is_item and WeaveMasterySettings.item_mastery_per_magic_level or WeaveMasterySettings.career_mastery_per_magic_level

		upgrade_tooltip_data.upgrade_mastery_text = "+" .. mastery_per_level .. " " .. Localize("menu_weave_forge_tooltip_mastery_title")

		if is_item then
			local power_level_per_magic_level = PowerLevelFromMagicLevel.power_level_per_magic_level

			upgrade_tooltip_data.upgrade_power_text = "+" .. power_level_per_magic_level .. " " .. Localize("menu_weave_forge_loadout_power_title")
		end
	end

	upgrade_button.content.tooltip = upgrade_tooltip_data
end

HeroWindowWeaveProperties._set_essence_upgrade_cost = function (self, essence_amount, can_afford, magic_cap_reached)
	local widgets_by_name = self._widgets_by_name
	local widget_warning = widgets_by_name.upgrade_essence_warning
	local widget_button = widgets_by_name.upgrade_button
	local button_content = widget_button.content
	local button_style = widget_button.style
	local button_text = ""

	if essence_amount then
		local value_string = UIUtils.comma_value(essence_amount)

		button_text = Localize("menu_weave_forge_upgrade_loadout_button") .. " " .. value_string

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
		button_style.price_icon.offset[1] = text_offset + icon_width / 2 + text_width / 2 + spacing
		button_style.price_icon_disabled.offset[1] = button_style.price_icon.offset[1]
		button_style.price_icon.color[1] = 255
		button_style.price_icon_disabled.color[1] = 255
	else
		button_text = Localize("menu_weave_forge_upgrade_loadout_button_cap")
		button_style.title_text.offset[1] = button_style.title_text.default_offset[1]
		button_style.title_text_shadow.offset[1] = button_style.title_text_shadow.default_offset[1]
		button_style.title_text_disabled.offset[1] = button_style.title_text_disabled.default_offset[1]
		button_style.price_icon.color[1] = 0
		button_style.price_icon_disabled.color[1] = 0
	end

	widget_warning.content.visible = magic_cap_reached ~= nil and magic_cap_reached or false
	button_content.button_hotspot.disable_button = script_data["eac-untrusted"] or magic_cap_reached or not essence_amount or not can_afford
	button_content.title_text = button_text
end

HeroWindowWeaveProperties._draw_slots = function (self, ui_renderer, dt)
	local slots = self._slots
	local selecting_slot = false
	local parent = self._parent
	local input_service = parent:window_input_service()
	local magic_level = self:_magic_level()
	local hover_enter = false
	local hover_exit = false

	for type_index, type_slots in pairs(slots) do
		local num_slots = #type_slots

		for i = 1, num_slots do
			local slot = type_slots[i]
			local presentation_data = slot.presentation_data
			local widget = slot.widget
			local category = slot.category
			local widget_type = slot.widget_type
			local unlock_level = slot.unlock_level
			local content = widget.content
			local style = widget.style
			local locked = magic_level < unlock_level

			content.locked = locked

			if widget_type == "talent" then
				local text

				text = i == 1 and "I" or i == 2 and "II" or i == 3 and "III" or i == 4 and "IV" or i == 5 and "V" or "VI"
				content.text = text
			end

			local key = presentation_data and presentation_data.key

			content.highlight = self._highlighted_key and self._highlighted_key == key

			if presentation_data then
				content.icon = presentation_data.icon

				local animation_duration = presentation_data.animation_duration

				if animation_duration then
					local animation_time = presentation_data.animation_time or animation_duration
					local animation_progress = 1 - animation_time / animation_duration

					if animation_progress == 1 then
						presentation_data.animation_time = nil
						presentation_data.animation_duration = nil
					else
						presentation_data.animation_time = math.max(animation_time - dt, 0)
					end

					self:_animate_slot_fill(slot, animation_progress)
				end
			else
				content.icon = nil
			end

			local x = slot.x
			local y = slot.y
			local offset = widget.offset

			offset[3] = 0
			offset[2] = y
			offset[1] = x

			self:_animate_slot(slot, dt)
			UIRenderer.draw_widget(ui_renderer, widget)

			local button_hotspot = content.button_hotspot

			if button_hotspot.on_hover_enter then
				self:_play_sound("menu_magic_forge_hover_slot")

				if presentation_data then
					hover_enter = true
				end

				if content.new then
					content.new = nil
				end
			end

			if button_hotspot.on_hover_exit then
				hover_exit = true
			end

			if button_hotspot.on_pressed then
				if locked then
					self:_set_grid_slot_selected(slot)
					self:_set_locked_slot_description(widget_type, category, unlock_level)
					self:_enable_menu_options(false)
				else
					if self._active_menu_category ~= category or widget_type ~= self._active_menu_option then
						self:_enable_menu_options(true, widget_type, category)
					end

					self:_disable_locked_slot_description()
					self:_set_grid_slot_selected()
				end
			elseif button_hotspot.on_right_click then
				if presentation_data then
					local key = presentation_data.key

					self:_clear_slot(slot, key, widget_type)
				end
			elseif button_hotspot.is_hover and input_service:get("special_1") and presentation_data then
				local key = presentation_data.key

				self:_clear_slot(slot, key, widget_type)
			end
		end
	end

	if hover_enter then
		parent:set_input_description("remove")
	elseif hover_exit then
		parent:set_input_description(nil)
	end
end

HeroWindowWeaveProperties._set_grid_slot_selected = function (self, selected_slot)
	local slots = self._slots

	for type_index, type_slots in pairs(slots) do
		local num_slots = #type_slots

		for i = 1, num_slots do
			local slot = type_slots[i]
			local is_selected = slot == selected_slot
			local widget = slot.widget
			local content = widget.content
			local button_hotspot = content.button_hotspot

			button_hotspot.is_selected = is_selected
		end
	end
end

HeroWindowWeaveProperties._set_locked_slot_description = function (self, widget_type, category, required_level)
	local enabled = widget_type ~= nil and category ~= nil and required_level ~= nil
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.locked_slot_description
	local content = widget.content

	if enabled then
		local menu_options = self._menu_options
		local options = menu_options[widget_type]
		local category_option = options[category]
		local display_name = category_option.display_name
		local sub_display_name = category_option.sub_display_name
		local icon
		local description_text = ""
		local sub_title_text = ""

		if widget_type == "trait" then
			icon = "icon_trait"
			sub_title_text = string.format(localized_strings.unlock_slot_title, required_level)
			description_text = localized_strings.unlock_description_trait
		elseif widget_type == "talent" then
			icon = "icon_talent"
			sub_title_text = sub_display_name .. " - " .. string.format(localized_strings.unlock_talent_title, required_level)
			description_text = localized_strings.unlock_description_talent
		elseif widget_type == "property" then
			icon = "icon_property"
			sub_title_text = string.format(localized_strings.unlock_slot_title, required_level)
			description_text = localized_strings.unlock_description_property
		end

		local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon)
		local icon_size = icon_settings.size
		local style = widget.style
		local icon_style = style.icon
		local icon_style_size = icon_style.texture_size

		icon_style_size[1] = icon_size[1]
		icon_style_size[2] = icon_size[2]
		content.icon = icon
		content.title_text = display_name
		content.sub_title_text = sub_title_text
		content.description_text = description_text
	end

	content.visible = enabled
end

HeroWindowWeaveProperties._disable_locked_slot_description = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.locked_slot_description

	widget.content.visible = false
end

HeroWindowWeaveProperties._animate_menu_widgets = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local hover_approved = self:_is_button_hover(widgets_by_name.options_list_button)
	local menu_options = self._menu_options

	for menu_option_key, options in pairs(menu_options) do
		for _, menu_data in pairs(options) do
			local entries = menu_data.entries

			for i, entry in ipairs(entries) do
				self:_animate_menu_option_entry(entry, menu_option_key, hover_approved, dt)
			end
		end
	end
end

HeroWindowWeaveProperties._animate_menu_option_entry = function (self, entry, menu_option, hover_approved, dt)
	local widget = entry.widget
	local content = widget.content
	local locked = content.locked
	local style = widget.style
	local hotspot = content.hotspot or content.button_hotspot
	local disabled = hotspot.disable_button
	local highlight_slot = false
	local is_hover = hotspot.is_hover

	if not hover_approved then
		is_hover = false
	end

	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local highlight_progress = hotspot.highlight_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 15

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if highlight_slot then
		highlight_progress = math.min(highlight_progress + dt * speed, 1)
	else
		highlight_progress = math.max(highlight_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	local background_color = disabled and 100 or 255

	style.background.color[2] = background_color
	style.background.color[3] = background_color
	style.background.color[4] = background_color
	style.frame.color[2] = background_color
	style.frame.color[3] = background_color
	style.frame.color[4] = background_color
	style.hover.color[1] = 255 * hover_progress

	local used_amount = content.used_amount
	local has_value = used_amount >= 1
	local value_progress = hotspot.value_progress or 0

	if has_value then
		value_progress = math.min(value_progress + dt * speed, 1)
	else
		value_progress = math.max(value_progress - dt * speed, 0)
	end

	style.value_glow.color[1] = 255 * value_progress

	if style.icon_equipped_frame then
		style.icon_equipped_frame.color[1] = 255 * value_progress
	end

	hotspot.value_progress = value_progress
	hotspot.hover_progress = hover_progress
	hotspot.highlight_progress = highlight_progress
	hotspot.selection_progress = selection_progress
end

HeroWindowWeaveProperties._animate_slot = function (self, slot, dt)
	local active_menu_option = self._active_menu_option
	local active_menu_category = self._active_menu_category
	local category = slot.category
	local widget_type = slot.widget_type
	local unlock_level = slot.unlock_level
	local presentation_data = slot.presentation_data
	local widget = slot.widget
	local widget_type = slot.widget_type
	local content = widget.content
	local locked = content.locked
	local new = content.new
	local style = widget.style
	local hotspot = content.hotspot or content.button_hotspot
	local highlight_slot = not locked and active_menu_category == category and widget_type == active_menu_option
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local highlight_progress = hotspot.highlight_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 15

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if highlight_slot then
		highlight_progress = math.min(highlight_progress + dt * speed, 1)
	else
		highlight_progress = math.max(highlight_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	local new_pulse_speed = 4
	local new_progress = 0.5 + math.sin(Managers.time:time("ui") * new_pulse_speed) * 0.5

	style.highlight_texture.color[1] = 255 * highlight_progress
	style.hover.color[1] = 255 * (new and new_progress or hover_progress)

	local slot_locked_style = style.slot_locked

	Colors.lerp_color_tables(slot_locked_style.default_color, slot_locked_style.hover_color, combined_progress, slot_locked_style.color)

	hotspot.hover_progress = hover_progress
	hotspot.highlight_progress = highlight_progress
	hotspot.selection_progress = selection_progress
end

HeroWindowWeaveProperties._animate_slot_fill = function (self, slot, progress)
	local presentation_data = slot.presentation_data
	local widget = slot.widget
	local widget_type = slot.widget_type
	local content = widget.content
	local style = widget.style
	local style_slot = style.slot

	if style_slot then
		local anim_progress = math.easeOutCubic(progress)
		local color = style_slot.color

		color[1] = 255 * anim_progress
	end

	local style_fill_effect = style.fill_effect

	if style_fill_effect then
		local color = style_fill_effect.color
		local size = style_fill_effect.size
		local offset = style_fill_effect.offset
		local default_size = style_fill_effect.default_size
		local default_offset = style_fill_effect.default_offset
		local anim_progress = math.easeOutCubic(progress)
		local size_increase = 40 * anim_progress

		size[1] = default_size[1] + size_increase
		size[2] = default_size[2] + size_increase
		offset[1] = default_offset[1] - size_increase / 2
		offset[2] = default_offset[2] - size_increase / 2
		color[1] = 255 * (1 - anim_progress)
	end
end

HeroWindowWeaveProperties._enable_menu_options = function (self, enabled, widget_type, category)
	local menu_options = self._menu_options
	local options = menu_options[widget_type]

	self._active_menu_option = enabled and widget_type or nil
	self._active_menu_category = enabled and category or nil

	if enabled then
		for category_key, option in pairs(options) do
			local correct_option = category_key == category

			option.anim_duration = correct_option and 0 or nil
		end

		if widget_type == "trait" then
			self:_play_sound("menu_magic_forge_open_slot_option_trait")
		elseif widget_type == "talent" then
			self:_play_sound("menu_magic_forge_open_slot_option_talent")
		elseif widget_type == "property" then
			self:_play_sound("menu_magic_forge_open_slot_option_property")
		end

		local category_option = options[category]
		local display_name = category_option.display_name
		local sub_display_name = category_option.sub_display_name

		self:_set_options_title(display_name, sub_display_name)

		local can_clear_slots = false

		if self._active_menu_option and self._active_menu_category then
			can_clear_slots = self:_can_clear_slots(self._active_menu_option, self._active_menu_category)
		end

		self:_set_clear_button_enabled_state(can_clear_slots)
	else
		self:_set_options_title("", "")
		self:_set_clear_button_enabled_state(false)
	end
end

HeroWindowWeaveProperties._set_overlay_alpha = function (self, alpha)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.window_overlay

	widget.style.rect.color[1] = alpha
end

HeroWindowWeaveProperties._options_mask_height = function (self)
	local mask_size = scenegraph_definition.options_scroll_field.size

	return mask_size[2]
end

local draw_offset = {
	0,
	0,
	0,
}

HeroWindowWeaveProperties._draw_menu_selection = function (self, ui_renderer, render_settings, dt)
	local active_menu_option = self._active_menu_option
	local active_menu_category = self._active_menu_category

	if not active_menu_option or not active_menu_category then
		return
	end

	local parent = self._parent
	local input_service = parent:window_input_service()
	local menu_options = self._menu_options
	local options = menu_options[active_menu_option]
	local options_list_button = self._widgets_by_name.options_list_button
	local list_hovered = self:_is_button_hovered(options_list_button)
	local list_hovering = self:_is_button_hover(options_list_button)
	local draw_length = self:_options_mask_height()

	for _, menu_data in pairs(options) do
		local anim_duration = menu_data.anim_duration
		local draw = anim_duration ~= nil

		if draw then
			local time_left = math.min(anim_duration + dt, SLOT_SELECT_ANIM_DURATION)
			local anim_progress = math.easeOutCubic(time_left / SLOT_SELECT_ANIM_DURATION)

			menu_data.anim_duration = time_left

			local widget_size = menu_data.widget_size
			local entries = menu_data.entries
			local num_entries = #entries
			local curve_multiplier = 0.00058
			local entry_height = widget_size[2]
			local spacing = menu_data.spacing or 0
			local total_length = menu_data.total_length
			local scroll_length = menu_data.scroll_length
			local draw_count = menu_data.draw_count

			if scroll_length > 0 then
				local scrollbar_logic = menu_data.scrollbar_logic
				local scrolling = scrollbar_logic:is_scrolling()

				if scrolling then
					render_settings.snap_pixel_positions = false
				end
			end

			local scrolled_length = 0
			local scrollbar_widget = menu_data.scrollbar_widget

			if scrollbar_widget then
				scrolled_length = self:_update_menu_option_scrollbar_position(menu_data)

				UIRenderer.draw_widget(ui_renderer, scrollbar_widget)
			end

			draw_offset[2] = math.ceil(scrolled_length)

			local index_offset = self:_calculate_list_index_offset(total_length, draw_length, entry_height, spacing, scrolled_length)
			local index_pressed, right_clicked, index_hovered, index_hover_enter, index_hover_exit = self:_draw_selection_menu_widget(ui_renderer, widget_size, spacing, active_menu_option, entries, index_offset, draw_count, draw_offset, curve_multiplier, scrolled_length, anim_progress)

			if list_hovered then
				if index_hover_enter then
					self:_play_sound("menu_magic_forge_hover_slot_category")
				end

				if index_hovered then
					local entry = entries[index_hovered]
					local key = entry.key

					self._highlighted_key = key

					local slot = self:_find_slot_by_key(key, active_menu_option, active_menu_category)

					if slot then
						parent:set_input_description("remove")
					else
						parent:set_input_description(nil)
					end
				else
					self._highlighted_key = nil

					parent:set_input_description(nil)
				end
			end

			if index_pressed and list_hovered then
				local entry = entries[index_pressed]
				local key = entry.key
				local next_cost = entry.next_cost

				if key then
					if right_clicked or input_service:get("special_1") then
						local slot = self:_find_slot_by_key(key, active_menu_option, active_menu_category)

						if slot then
							self:_clear_slot(slot, key, active_menu_option)
						end
					else
						local allow_occupied_slots = entry.can_override_occupied_slots
						local next_slot, occupied = self:_find_next_available_slot(active_menu_option, active_menu_category)

						if not next_slot and allow_occupied_slots then
							next_slot, occupied = self:_find_next_available_slot(active_menu_option, active_menu_category, allow_occupied_slots)
						end

						if next_slot and next_cost then
							local current_mastery = self._current_mastery or 0
							local approved = not occupied and next_cost <= current_mastery

							if occupied then
								local presentation_data = next_slot.presentation_data
								local occupied_key = presentation_data.key
								local occupied_value = presentation_data.value
								local can_afford = next_cost <= current_mastery + occupied_value

								approved = can_afford and occupied_key ~= key

								if approved and occupied_key then
									self:_clear_slot(next_slot, occupied_key, active_menu_option)
								end
							end

							if approved then
								self:_add_key_to_slot(next_slot, key, active_menu_option)
								self:_sync_backend_loadout()
							end
						end
					end
				end
			end
		end
	end
end

HeroWindowWeaveProperties._highlight_slots_by_key = function (self, key, menu_option)
	local slots = self._slots

	for name, type_slots in pairs(slots) do
		local correct_type = name == menu_option
		local num_slots = #type_slots

		for i = 1, num_slots do
			local slot = type_slots[i]
			local presentation_data = slot.presentation_data

			if presentation_data then
				presentation_data.highlight = correct_type and presentation_data.key == key
			end
		end
	end
end

HeroWindowWeaveProperties._find_slot_by_key = function (self, key, menu_option)
	local loadout = self._loadout
	local loadout_keys = loadout[menu_option]
	local slot_indices = loadout_keys[key]
	local index

	if type(slot_indices) == "table" then
		index = slot_indices[#slot_indices]
	else
		index = slot_indices
	end

	if index then
		local slots = self._slots
		local type_slots = slots[menu_option]
		local slot = type_slots[index]

		return slot
	end
end

HeroWindowWeaveProperties._find_next_available_slot = function (self, menu_option, menu_category, allow_occupied_slots)
	local category_slots_by_type = self._category_slots_by_type
	local slot_categories = category_slots_by_type[menu_option]
	local category_slots = slot_categories[menu_category]
	local num_category_slots = #category_slots
	local magic_level = self:_magic_level()
	local start_index = 1
	local index = start_index
	local continue = true

	while continue do
		local slot = category_slots[index]
		local presentation_data = slot.presentation_data
		local unlock_level = slot.unlock_level
		local occupied = presentation_data ~= nil
		local valid = allow_occupied_slots or not occupied

		if valid and unlock_level <= magic_level then
			return slot, occupied
		end

		index = math.index_wrapper(index + 1, num_category_slots)

		if index == start_index then
			continue = false
		end
	end
end

HeroWindowWeaveProperties._set_clear_button_enabled_state = function (self, enabled)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.clear_button

	widget.content.button_hotspot.disable_button = not enabled
end

HeroWindowWeaveProperties._can_clear_slots = function (self, active_menu_option, active_category)
	local loadout = self._loadout
	local loadout_slots = loadout[active_menu_option]
	local career_name = self._career_name

	if active_menu_option == "property" then
		if loadout_slots then
			local properties_to_remove = {}
			local category_properties = WeaveProperties.categories[active_category]

			for property_key, slot_indices in pairs(loadout_slots) do
				for _, slot_index in ipairs(slot_indices) do
					if table.contains(category_properties, property_key) then
						return true
					end
				end
			end
		end
	elseif active_menu_option == "trait" then
		local category_traits = WeaveTraits.categories[active_category]

		for trait_key, slot_index in pairs(loadout_slots) do
			if table.contains(category_traits, trait_key) then
				return true
			end
		end
	elseif active_menu_option == "talent" then
		local loadout_settings = WeaveLoadoutSettings[career_name]
		local talent_tree = loadout_settings.talent_tree
		local category_talents = talent_tree[active_category]

		for talent_key, slot_index in pairs(loadout_slots) do
			if table.contains(category_talents, talent_key) then
				return true
			end
		end
	end

	return false
end

HeroWindowWeaveProperties._clear_slots = function (self, menu_option, category)
	if not menu_option or not category then
		return
	end

	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local item = self:_selected_item()
	local item_backend_id = item and item.backend_id
	local loadout = self._loadout
	local loadout_slots = loadout[menu_option]

	if menu_option == "property" then
		if loadout_slots then
			local properties_to_remove = {}
			local category_properties = WeaveProperties.categories[category]

			for property_key, slot_indices in pairs(loadout_slots) do
				for _, slot_index in ipairs(slot_indices) do
					if table.contains(category_properties, property_key) then
						properties_to_remove[slot_index] = property_key
					end
				end
			end

			for slot_index, property_key in pairs(properties_to_remove) do
				backend_interface_weaves:remove_loadout_property(career_name, property_key, slot_index, item_backend_id)
			end
		end
	elseif menu_option == "trait" then
		local category_traits = WeaveTraits.categories[category]

		for trait_key, slot_index in pairs(loadout_slots) do
			if table.contains(category_traits, trait_key) then
				backend_interface_weaves:remove_loadout_trait(career_name, trait_key, item_backend_id)
			end
		end
	elseif menu_option == "talent" then
		local loadout_settings = WeaveLoadoutSettings[career_name]
		local talent_tree = loadout_settings.talent_tree
		local category_talents = talent_tree[category]

		for talent_key, slot_index in pairs(loadout_slots) do
			if table.contains(category_talents, talent_key) then
				backend_interface_weaves:remove_loadout_talent(career_name, talent_key)
			end
		end
	end

	self:_sync_backend_loadout()
end

HeroWindowWeaveProperties._clear_slot = function (self, slot, key, menu_option)
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local item = self:_selected_item()
	local item_backend_id = item and item.backend_id
	local slot_index = slot.index

	if menu_option == "property" then
		backend_interface_weaves:remove_loadout_property(career_name, key, slot_index, item_backend_id)
	elseif menu_option == "trait" then
		backend_interface_weaves:remove_loadout_trait(career_name, key, item_backend_id)
	elseif menu_option == "talent" then
		backend_interface_weaves:remove_loadout_talent(career_name, key)
	end

	self:_play_sound("menu_magic_forge_remove_from_slot")
	self:_sync_backend_loadout()
end

HeroWindowWeaveProperties._add_key_to_slot = function (self, slot, key, menu_option)
	local career_name = self._career_name
	local backend_manger = Managers.backend
	local backend_interface_weaves = backend_manger:get_interface("weaves")
	local item = self:_selected_item()
	local item_backend_id = item and item.backend_id
	local slot_index = slot.index

	if menu_option == "property" then
		backend_interface_weaves:set_loadout_property(career_name, key, slot_index, item_backend_id)
		self:_play_sound("menu_magic_forge_add_property_to_slot")
	elseif menu_option == "trait" then
		backend_interface_weaves:set_loadout_trait(career_name, key, slot_index, item_backend_id)
		self:_play_sound("menu_magic_forge_add_trate_to_slot")
	elseif menu_option == "talent" then
		backend_interface_weaves:set_loadout_talent(career_name, key, slot_index)
		self:_play_sound("menu_magic_forge_add_talent_to_slot")
	end
end

HeroWindowWeaveProperties._calculate_list_index_offset = function (self, total_length, draw_length, entry_height, spacing, scrolled_length)
	local excess_length = total_length - draw_length
	local max_index_offset = math.max(excess_length / (entry_height + spacing), 0)
	local num_entries_scrolled = math.clamp(math.floor(scrolled_length / (entry_height + spacing)), 0, max_index_offset)

	return num_entries_scrolled
end

HeroWindowWeaveProperties._draw_selection_menu_widget = function (self, ui_renderer, widget_size, spacing, menu_option, entries, index_offset, draw_count, draw_offset, curve_multiplier, scrolled_length, anim_progress)
	local input_service = self._parent:window_input_service()
	local start_index = 1 + index_offset
	local num_entries = #entries
	local end_index = math.min(start_index + draw_count, num_entries)
	local num_draws = end_index - start_index + 1
	local entry_height = widget_size[2]
	local start_height = 0

	if draw_count <= num_entries then
		local mask_height = self:_options_mask_height()

		start_height = mask_height / 2 + entry_height / 2
	else
		start_height = entry_height * (num_entries + 1) / 2 + spacing * (num_entries + 1) / 2
	end

	local start_x = draw_offset[1]
	local start_y = draw_offset[2]
	local start_z = 0
	local index_pressed, index_hovered, index_hover_enter, index_hover_exit, right_clicked

	for i = start_index, num_draws + index_offset do
		local entry_data = entries[i]
		local widget = entry_data.widget
		local content = widget.content
		local offset = widget.offset
		local style = widget.style
		local button_hotspot = content.button_hotspot
		local debug_style = style.debug
		local y = start_height - (entry_height + spacing) * i * anim_progress

		offset[3] = start_z
		offset[2] = start_y + y
		offset[1] = start_x + -curve_multiplier * offset[2]^2

		UIRenderer.draw_widget(ui_renderer, widget)

		if button_hotspot.on_hover_enter then
			index_hover_enter = i
		end

		if button_hotspot.on_hover_exit then
			index_hover_exit = i
		end

		if button_hotspot.is_hover then
			index_hovered = i
		end

		if button_hotspot.on_pressed or button_hotspot.on_double_click then
			index_pressed = i
		elseif button_hotspot.on_right_click or input_service:get("special_1") and button_hotspot.is_hover then
			index_pressed = i
			right_clicked = true
		end
	end

	return index_pressed, right_clicked, index_hovered, index_hover_enter, index_hover_exit
end

HeroWindowWeaveProperties._draw = function (self, dt)
	local parent = self._parent
	local ui_renderer = self._parent:get_ui_renderer()
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
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
		local widget_snap_pixel_positions = widget.content.snap_pixel_positions

		if widget_snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget_snap_pixel_positions
		else
			render_settings.snap_pixel_positions = snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	render_settings.snap_pixel_positions = snap_pixel_positions

	self:_draw_slots(ui_top_renderer, dt)
	self:_draw_menu_selection(ui_top_renderer, render_settings, dt)

	render_settings.snap_pixel_positions = snap_pixel_positions
	render_settings.alpha_multiplier = alpha_multiplier

	if self._viewport_widget then
		UIRenderer.draw_widget(ui_top_renderer, self._viewport_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_widgets) do
		local widget_snap_pixel_positions = widget.content.snap_pixel_positions

		if widget_snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget_snap_pixel_positions
		else
			render_settings.snap_pixel_positions = snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

HeroWindowWeaveProperties._calculate_background_fraction = function (self, size)
	local texture_name = "athanor_skilltree_background"
	local texture_height = 900
	local size_height = size[2]
	local fraction = size_height / texture_height

	return fraction
end

HeroWindowWeaveProperties._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowWeaveProperties._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

HeroWindowWeaveProperties._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

HeroWindowWeaveProperties._get_hero_wield_info_by_item = function (self, item)
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

HeroWindowWeaveProperties._destroy_previewers = function (self)
	local item_previewer = self._item_previewer

	if item_previewer then
		item_previewer:destroy()

		self._item_previewer = nil
	end

	local unit_previewer = self._unit_previewer

	if unit_previewer then
		unit_previewer:destroy()

		self._unit_previewer = nil
	end
end

HeroWindowWeaveProperties._set_options_title = function (self, title_text, sub_title_text)
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.title_text.content.text = title_text
	widgets_by_name.sub_title_text.content.text = sub_title_text
end

HeroWindowWeaveProperties._set_mastery_amount = function (self, initial_mastery, current_mastery, play_sound)
	self._previous_mastery = self._current_mastery or 0
	self._current_mastery = current_mastery
	self._mastery_anim_time = 0

	if play_sound then
		if self._previous_mastery < self._current_mastery then
			self:_play_sound("menu_magic_forge_mastery_counter_increase")
		else
			self:_play_sound("menu_magic_forge_mastery_counter_decrease")
		end
	end
end

HeroWindowWeaveProperties._set_title_text = function (self, title_text, sub_title_text)
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.viewport_title.content.text = title_text
	widgets_by_name.viewport_sub_title.content.text = sub_title_text
end

HeroWindowWeaveProperties._animate_mastery_amount = function (self, dt)
	local time = self._mastery_anim_time

	if not time then
		return
	end

	local max_time = 0.3
	local progress = time / max_time
	local anim_progress = math.easeOutCubic(progress)

	time = math.min(time + dt, max_time)

	local start_mastery = self._previous_mastery
	local end_mastery = self._current_mastery
	local diff = (end_mastery - start_mastery) * anim_progress
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.mastery_text

	widget.content.text = tostring(math.round(start_mastery + diff))

	if time == max_time then
		self._mastery_anim_time = nil
	else
		self._mastery_anim_time = time
	end
end

HeroWindowWeaveProperties._create_item_previewer = function (self, viewport_widget, item)
	local item_data = item.data
	local item_key = item_data.key
	local slot_type = item_data.slot_type
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world
	local preview_position = {
		-0.85,
		3,
		0,
	}
	local unique_id, invert_start_rotation, display_unit_key, use_highest_mip_levels, delayed_spawn
	local career_name_override = self._career_name
	local item_previewer = LootItemUnitPreviewer:new(item, preview_position, world, viewport, unique_id, invert_start_rotation, display_unit_key, use_highest_mip_levels, delayed_spawn, career_name_override)
	local callback = callback(self, "cb_unit_spawned_item_preview", item_previewer, item_key)

	item_previewer:register_spawn_callback(callback)
	item_previewer:activate_auto_spin()

	return item_previewer
end

HeroWindowWeaveProperties._create_unit_previewer = function (self, viewport_widget, unit_name, package_name)
	local viewport_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_pass_data.viewport
	local world = viewport_pass_data.world
	local preview_position = {
		-0.8,
		2.5,
		0.05,
	}
	local unit_previewer = UIUnitPreviewer:new(unit_name, package_name, preview_position, world, viewport)
	local callback = callback(self, "cb_unit_spawned_unit_preview", unit_previewer, unit_name)

	unit_previewer:register_spawn_callback(callback)
	unit_previewer:activate_auto_spin()

	return unit_previewer
end

HeroWindowWeaveProperties.cb_unit_spawned_unit_preview = function (self, unit_previewer, unit_name)
	print("cb_unit_spawned_unit_preview", unit_previewer, unit_name)
end

HeroWindowWeaveProperties._spawn_hero_skin = function (self, world_previewer, hero_name, career_index, optional_skin)
	local callback = callback(self, "cb_hero_unit_spawned_skin_preview", world_previewer, hero_name, career_index)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroWindowWeaveProperties._spawn_hero_with_hat = function (self, world_previewer, hero_name, career_index, optional_skin, item_name)
	local callback = callback(self, "cb_hero_unit_spawned_hat_preview", world_previewer, hero_name, career_index, item_name)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, false, callback, 1, nil, optional_skin)
end

HeroWindowWeaveProperties.cb_hero_unit_spawned_skin_preview = function (self, world_previewer, hero_name, career_index)
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

HeroWindowWeaveProperties.cb_hero_unit_spawned_hat_preview = function (self, world_previewer, hero_name, career_index, hat_item_name)
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

HeroWindowWeaveProperties.cb_unit_spawned_item_preview = function (self, item_previewer, item_key)
	local ignore_spin = true

	item_previewer:present_item(item_key, ignore_spin)

	self._fadeout_loading_overlay = true
end

HeroWindowWeaveProperties._initialize_scrollbar = function (self, scrollbar_widget, content_length, list_scenegraph_id, spacing)
	local widget_scenegraph_id = scrollbar_widget.scenegraph_id
	local scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local list_size = scenegraph_definition[list_scenegraph_id].size
	local scrollbar_size = scenegraph_definition[widget_scenegraph_id].size
	local draw_length = list_size[2]
	local scrollbar_length = scrollbar_size[2]
	local step_size = 220 + spacing * 1.5
	local scroll_step_multiplier = 1

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	return scrollbar_logic
end

HeroWindowWeaveProperties._update_menu_option_scrollbar_position = function (self, menu_option)
	local ui_scenegraph = self._ui_scenegraph
	local scrollbar_logic = menu_option.scrollbar_logic
	local root_scenegraph_id = menu_option.root_scenegraph_id
	local scrolled_length = menu_option.scrolled_length
	local new_scroll_length = scrollbar_logic:get_scrolled_length()

	if new_scroll_length ~= scrolled_length then
		menu_option.scrolled_length = new_scroll_length

		return new_scroll_length
	end

	return scrolled_length
end
