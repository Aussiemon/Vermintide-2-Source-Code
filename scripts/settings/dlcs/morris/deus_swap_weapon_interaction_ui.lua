-- chunkname: @scripts/settings/dlcs/morris/deus_swap_weapon_interaction_ui.lua

DeusSwapWeaponInteractionUI = class(DeusSwapWeaponInteractionUI)

local definitions = local_require("scripts/settings/dlcs/morris/deus_swap_weapon_interaction_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animation_definitions

DeusSwapWeaponInteractionUI.TYPE = "swap_melee"

DeusSwapWeaponInteractionUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._current_interactable_unit = nil
	self._render_settings = {
		alpha_multiplier = 0,
	}
	self._animations = {}
	self._type = "melee"
	self._soft_currency_amount = nil
	self._offset = {
		0,
		0,
		0,
	}
	self._calculate_offset = false

	self:_create_ui_elements()
	Managers.state.event:register(self, "chest_unlock_failed", "chest_unlock_failed")
end

DeusSwapWeaponInteractionUI.destroy = function (self)
	Managers.state.event:unregister("chest_unlock_failed", self)
end

DeusSwapWeaponInteractionUI.chest_unlock_failed = function (self, chest_type)
	if chest_type == DeusSwapWeaponInteractionUI.TYPE then
		self:_start_animation("chest_unlock_failed")
	end
end

DeusSwapWeaponInteractionUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets_by_name = {}
	self._widgets = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name[name] = widget
	end

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._current_interactable_unit = nil
end

DeusSwapWeaponInteractionUI._evaluate_interactable = function (self, player_unit)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism.get_deus_run_controller and mechanism:get_deus_run_controller()

	if not deus_run_controller then
		return
	end

	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")
	local wielded_slot_name = inventory_extension and inventory_extension:get_wielded_slot_name()
	local interactable_ext = ScriptUnit.extension(player_unit, "interactor_system")
	local interactable_unit = interactable_ext:interactable_unit()
	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local others_actually_ingame = profile_synchronizer:others_actually_ingame()
	local prev_others_actually_ingame = self._others_actually_ingame

	self._others_actually_ingame = others_actually_ingame

	if self._current_interactable_unit ~= interactable_unit or prev_others_actually_ingame ~= others_actually_ingame then
		self:_populate_widget(interactable_unit, wielded_slot_name)
		self:_start_animation("on_enter")
	else
		local melee_weapon, ranged_weapon = deus_run_controller:get_own_loadout()
		local weapon_slot_name = wielded_slot_name == "slot_melee" and "slot_melee" or "slot_ranged"
		local new_weapon = not self._weapon_slot_name or weapon_slot_name ~= self._weapon_slot_name

		self._weapon_slot_name = weapon_slot_name

		local peer_id = deus_run_controller:get_own_peer_id()
		local soft_currency = deus_run_controller:get_player_soft_currency(peer_id)

		if new_weapon or soft_currency ~= self._soft_currency_amount then
			self:_populate_widget(interactable_unit, wielded_slot_name)
		end
	end
end

DeusSwapWeaponInteractionUI._start_animation = function (self, animation_name)
	self._render_settings = self._render_settings or {
		alpha_multiplier = 0,
	}

	local params = {
		render_settings = self._render_settings,
	}

	self._animations[animation_name] = self._ui_animator:start_animation(animation_name, self._widgets, self._ui_scenegraph, params, nil, 0)
end

DeusSwapWeaponInteractionUI._populate_widget = function (self, interactable_unit, wielded_slot_name)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()

	if not deus_run_controller then
		return
	end

	local peer_id = deus_run_controller:get_own_peer_id()
	local soft_currency_amount = deus_run_controller:get_player_soft_currency(peer_id)
	local pickup_ext = ScriptUnit.extension(interactable_unit, "pickup_system")
	local cost = pickup_ext:get_purchase_cost()
	local stored_purchase = pickup_ext:get_stored_purchase()

	if not stored_purchase then
		return
	end

	local melee, ranged = deus_run_controller:get_own_loadout()
	local equipped_item = self._type == "melee" and melee or ranged
	local tooltip_widget = self._widgets_by_name.weapon_tooltip

	tooltip_widget.content.item = equipped_item
	tooltip_widget.style.item.draw_end_passes = true

	local chest_info_widget = self._widgets_by_name.chest_content
	local rarity = stored_purchase.rarity
	local rarity_color = Colors.get_table(rarity)

	chest_info_widget.content.rarity_text = RaritySettings[rarity].display_name
	chest_info_widget.style.rarity.text_color = rarity_color
	chest_info_widget.content.cost_text = soft_currency_amount .. "/" .. cost
	chest_info_widget.style.cost_text.text_color = cost <= soft_currency_amount and {
		255,
		255,
		255,
		255,
	} or {
		255,
		255,
		0,
		0,
	}

	local power_level = stored_purchase.power_level

	chest_info_widget.content.reward_info_text = power_level .. " " .. Localize("deus_weapon_chest_" .. self._type .. "_weapon_description")
	self._current_interactable_unit = interactable_unit
	self._soft_currency_amount = soft_currency_amount

	if self._others_actually_ingame then
		chest_info_widget.content.disabled_text = nil
		chest_info_widget.content.show_coin_icon = true
	else
		tooltip_widget.content.item = nil
		chest_info_widget.content.show_coin_icon = false
		chest_info_widget.content.rarity_text = nil
		chest_info_widget.content.cost_text = nil
		chest_info_widget.content.reward_info_text = nil
		chest_info_widget.content.disabled_text = "reliquary_inactive_due_to_joining_player"
	end

	self._calculate_offset = true
end

DeusSwapWeaponInteractionUI.update = function (self, player_unit, dt, t)
	self:_evaluate_interactable(player_unit)
	self:_update_animations(dt, t)
	self:_draw(dt, t)
	self:_update_offset(dt, t)

	return self._offset
end

DeusSwapWeaponInteractionUI._update_offset = function (self, dt, t)
	if not self._calculate_offset then
		return
	end

	local weapon_tooltip_widget = self._widgets_by_name.weapon_tooltip

	if not weapon_tooltip_widget then
		return
	end

	local style = weapon_tooltip_widget.style
	local item_style = style.item
	local item_presentation_height = item_style.item_presentation_height

	if not item_presentation_height then
		print("[DeusSwapWeaponInteractionUI] Tried to calculate the item height to early. We require the tooltip to be rendered at least once before this can be calculated")

		return
	end

	self._offset[2] = math.max(item_presentation_height - 300, 0)
	self._calculate_offset = false
end

DeusSwapWeaponInteractionUI._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			animations[animation_name] = nil
		end
	end
end

DeusSwapWeaponInteractionUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("Player")
	local render_settings = self._render_settings

	ui_scenegraph.pivot.local_position = self._offset

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for i = 1, #self._widgets do
		UIRenderer.draw_widget(ui_renderer, self._widgets[i])
	end

	UIRenderer.end_pass(ui_renderer)
end
