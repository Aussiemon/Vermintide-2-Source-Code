DeusUpgradeWeaponInteractionUI = class(DeusUpgradeWeaponInteractionUI, DeusSwapWeaponInteractionUI)
DeusUpgradeWeaponInteractionUI.TYPE = "upgrade"

DeusUpgradeWeaponInteractionUI.init = function (self, parent, ingame_ui_context)
	DeusUpgradeWeaponInteractionUI.super.init(self, parent, ingame_ui_context)

	self._currently_wielded_slot_name = "slot_melee"
end

DeusUpgradeWeaponInteractionUI.chest_unlock_failed = function (self, chest_type)
	if chest_type == DeusUpgradeWeaponInteractionUI.TYPE then
		self:_start_animation("chest_unlock_failed")
	end
end

DeusUpgradeWeaponInteractionUI._get_wielded_slot_name = function (self)
	local player = Managers.player:local_player()
	local player_unit = player.player_unit

	if not self._inventory_extension or self._inventory_extension_player_unit ~= player_unit then
		self._inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")
		self._inventory_extension_player_unit = player_unit
	end

	local wielded_slot_name = self._inventory_extension:get_wielded_slot_name()

	return wielded_slot_name
end

DeusUpgradeWeaponInteractionUI._populate_widget = function (self, interactable_unit, wielded_slot_name)
	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()

	if not deus_run_controller then
		return
	end

	local peer_id = deus_run_controller:get_own_peer_id()
	local soft_currency_amount = deus_run_controller:get_player_soft_currency(peer_id)
	local pickup_ext = ScriptUnit.extension(interactable_unit, "pickup_system")

	pickup_ext:on_interact()

	local cost = pickup_ext:get_purchase_cost()
	local stored_purchase = pickup_ext:get_stored_purchase()

	if not stored_purchase then
		return
	end

	local upgrade_available = true
	local melee, ranged = deus_run_controller:get_own_loadout()
	local equipped_item = (wielded_slot_name == "slot_melee" and melee) or ranged
	local rarity_settings = RaritySettings
	local weapon_rarity_order = rarity_settings[equipped_item.rarity].order
	local chest_rarity_order = rarity_settings[stored_purchase.rarity].order
	upgrade_available = weapon_rarity_order < chest_rarity_order
	local tooltip_widget = self._widgets_by_name.weapon_tooltip
	local chest_info_widget = self._widgets_by_name.chest_content
	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local others_actually_ingame = profile_synchronizer:others_actually_ingame()

	if not others_actually_ingame then
		tooltip_widget.content.item = nil
		chest_info_widget.content.show_coin_icon = false
		chest_info_widget.content.rarity_text = nil
		chest_info_widget.content.cost_text = nil
		chest_info_widget.content.reward_info_text = nil
		chest_info_widget.content.disabled_text = "reliquary_inactive_due_to_joining_player"
		self._calculate_offset = false
	elseif upgrade_available then
		tooltip_widget.content.item = equipped_item
		tooltip_widget.content.force_equipped = true
		tooltip_widget.style.item.draw_end_passes = true
		local rarity = stored_purchase.rarity
		local rarity_color = Colors.get_table(rarity)
		chest_info_widget.content.rarity_text = RaritySettings[rarity].display_name
		chest_info_widget.style.rarity.text_color = rarity_color
		chest_info_widget.content.cost_text = soft_currency_amount .. "/" .. cost
		chest_info_widget.style.cost_text.text_color = (cost <= soft_currency_amount and {
			255,
			255,
			255,
			255
		}) or {
			255,
			255,
			0,
			0
		}
		local power_level = stored_purchase.power_level
		local slot_type = (wielded_slot_name == "slot_melee" and "melee") or "ranged"
		chest_info_widget.content.reward_info_text = power_level .. " " .. Localize("deus_weapon_chest_" .. slot_type .. "_weapon_description")
		chest_info_widget.content.show_coin_icon = true
		chest_info_widget.content.disabled_text = nil
		self._calculate_offset = true
	else
		tooltip_widget.content.item = nil
		chest_info_widget.content.show_coin_icon = false
		chest_info_widget.content.rarity_text = nil
		chest_info_widget.content.cost_text = nil
		chest_info_widget.content.reward_info_text = nil
		chest_info_widget.content.disabled_text = "reliquary_inactive_rarity"
		self._calculate_offset = false
	end

	self._current_interactable_unit = interactable_unit
	self._currently_wielded_slot_name = wielded_slot_name
	self._soft_currency_amount = soft_currency_amount
	self._offset[1] = 0
	self._offset[2] = 0
	self._offset[3] = 0
end

DeusUpgradeWeaponInteractionUI._evaluate_interactable = function (self, player_unit)
	if Managers.mechanism:current_mechanism_name() ~= "deus" then
		return
	end

	local interactable_ext = ScriptUnit.extension(player_unit, "interactor_system")
	local interactable_unit = interactable_ext:interactable_unit()
	local wielded_slot_name = self:_get_wielded_slot_name()
	local network_manager = Managers.state.network
	local profile_synchronizer = network_manager.profile_synchronizer
	local others_actually_ingame = profile_synchronizer:others_actually_ingame()
	local prev_others_actually_ingame = self._others_actually_ingame
	self._others_actually_ingame = others_actually_ingame

	if self._current_interactable_unit ~= interactable_unit or wielded_slot_name ~= self._currently_wielded_slot_name or prev_others_actually_ingame ~= others_actually_ingame then
		if self._current_interactable_unit ~= interactable_unit then
			self:_start_animation("on_enter")
		end

		self:_populate_widget(interactable_unit, wielded_slot_name)
	else
		self:_check_currency(interactable_unit)
	end
end

return
