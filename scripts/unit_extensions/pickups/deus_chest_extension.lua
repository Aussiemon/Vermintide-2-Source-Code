require("scripts/managers/game_mode/mechanisms/deus_weapon_generation")
require("scripts/settings/dlcs/morris/rarity_settings")
require("scripts/utils/hash_utils")

local RPCS = {
	"rpc_deus_chest_looted"
}
local REAL_PLAYER_LOCAL_ID = 1
local RELIQUARY_NEAR_DISTANCE = 10
local RELIQUARY_FAR_DISTANCE = 12
local WEAPON_CHEST_TO_SLOTS = {
	default = {
		swap_melee = {
			"melee"
		},
		swap_ranged = {
			"ranged"
		}
	},
	dr_slayer = {
		swap_melee = {
			"melee"
		},
		swap_ranged = {
			"melee",
			"ranged"
		}
	},
	es_questingknight = {
		swap_melee = {
			"melee"
		},
		swap_ranged = {
			"melee"
		}
	}
}
local LUA_UPDATE_RARITY_EVENTS = {}
local RaritySettings = RaritySettings

for rarity, _ in pairs(RaritySettings) do
	LUA_UPDATE_RARITY_EVENTS[rarity] = "lua_update_" .. rarity
end

DeusChestExtension = class(DeusChestExtension, PickupUnitExtension)

DeusChestExtension.init = function (self, extension_init_context, unit, extension_init_data)
	DeusChestExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._is_server = Managers.player.is_server
	self._profile_index = 0
	self._career_index = 0
	self._animation_state = nil
	self._sound_state = nil
	self._sound_state_interact = nil
	self._wwise_world = Managers.world:wwise_world(self.world)

	self:register_rpcs(extension_init_context.network_transmit.network_event_delegate)
end

DeusChestExtension.game_object_initialized = function (self, unit, go_id)
	if self._is_server then
		local server_chest_type = self._deus_run_controller:get_deus_weapon_chest_type()

		self:_set_server_chest_type(server_chest_type)
	end
end

DeusChestExtension.extensions_ready = function (self, world, unit)
	local mechanism = Managers.mechanism:game_mechanism()
	self._deus_run_controller = mechanism:get_deus_run_controller()

	fassert(self._deus_run_controller, "deus pickup unit can only be used in a deus run")
end

DeusChestExtension.destroy = function (self)
	self:unregister_rpcs()
end

DeusChestExtension.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
end

DeusChestExtension.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

DeusChestExtension.update = function (self, unit, input, dt, context, t)
	local player = Managers.player:local_player()
	local player_unit = player.player_unit

	if not self._inventory_extension or self._player_unit ~= player_unit then
		self._inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")
		self._player = player
		self._player_unit = player_unit
	end

	if not player_unit or not ALIVE[player_unit] then
		return
	end

	local go_id = self._go_id or Managers.state.unit_storage:go_id(self.unit)
	local deus_run_controller = self._deus_run_controller
	local own_peer_id = deus_run_controller:get_own_peer_id()
	local profile_index, career_index = deus_run_controller:get_player_profile(own_peer_id, REAL_PLAYER_LOCAL_ID)

	if go_id and (profile_index ~= self._profile_index or career_index ~= self._career_index) then
		local server_chest_type = self:_get_server_chest_type()

		if server_chest_type then
			local current_node = self._deus_run_controller:get_current_node()
			local seed = HashUtils.fnv32_hash(go_id .. "_" .. current_node.weapon_pickup_seed)
			local rarity = self:_setup_rarity(seed, server_chest_type)

			Unit.flow_event(self.unit, "lua_update_" .. server_chest_type)

			if server_chest_type == DEUS_CHEST_TYPES.power_up then
				self:_generate_stored_power_up(seed)
				Unit.set_data(self.unit, "interaction_data", "hud_description", "deus_weapon_chest_power_up_hud_desc")
				Unit.set_data(self.unit, "interaction_data", "hud_action", "deus_weapon_chest_power_up_action")
			elseif server_chest_type == DEUS_CHEST_TYPES.upgrade then
				Unit.set_data(self.unit, "interaction_data", "hud_description", "deus_weapon_chest_upgrade_hud_desc")
				Unit.set_data(self.unit, "interaction_data", "hud_action", "deus_weapon_chest_upgrade_action")
			else
				local profile = SPProfiles[profile_index]
				local career_name = profile and profile.careers[career_index].name
				local slots_by_career = WEAPON_CHEST_TO_SLOTS[career_name] or WEAPON_CHEST_TO_SLOTS.default
				local slots = slots_by_career[server_chest_type]

				self:_generate_stored_weapon(slots, rarity, go_id, profile_index, career_index)

				local slot = nil

				if server_chest_type == DEUS_CHEST_TYPES.swap_melee then
					slot = "melee"
				elseif server_chest_type == DEUS_CHEST_TYPES.swap_ranged then
					slot = "ranged"
				end

				Unit.set_data(self.unit, "interaction_data", "hud_description", "deus_weapon_chest_swap_" .. slot .. "_hud_desc")
				Unit.set_data(self.unit, "interaction_data", "hud_action", "deus_weapon_chest_swap_" .. slot .. "_action")
			end

			local game_session = Managers.state.network:game()
			local collected_by_peers = GameSession.game_object_field(game_session, go_id, "collected_by_peers")
			local peer_id = deus_run_controller:get_own_peer_id()
			local is_purchased = self._is_purchased
			local new_is_purchased = table.contains(collected_by_peers, peer_id)

			if is_purchased ~= new_is_purchased and new_is_purchased == true then
				self._is_purchased = new_is_purchased
				self._animation_state = "looted"

				Unit.flow_event(self.unit, "lua_update_collected")
			end

			self._profile_index = profile_index
			self._career_index = career_index
			self._go_id = go_id
			self._chest_type = server_chest_type
		end
	end

	self:update_upgrade_chest_color()
	self:_update_chest_interaction_time()

	if self._animation_state ~= "looted" then
		self:_update_chest_animation_and_sound_state(unit)
	end
end

DeusChestExtension._update_chest_interaction_time = function (self)
	local interaction_length = (self:can_be_unlocked() and 0.5) or 0

	if interaction_length ~= self._interaction_length then
		Unit.set_data(self.unit, "interaction_data", "interaction_length", interaction_length)

		self._interaction_length = interaction_length
	end
end

DeusChestExtension.update_upgrade_chest_color = function (self)
	if self._chest_type ~= DEUS_CHEST_TYPES.upgrade then
		return
	end

	local rarity = self._rarity

	if not rarity then
		return
	end

	if self._is_purchased then
		return
	end

	local wielded_weapon = self:_get_wielded_weapon()

	if not wielded_weapon then
		return
	end

	local weapon_rarity_order = RaritySettings[wielded_weapon.rarity].order
	local chest_rarity_order = RaritySettings[rarity].order
	local event = nil

	if chest_rarity_order <= weapon_rarity_order then
		event = "lua_interact_disabled"
	else
		event = LUA_UPDATE_RARITY_EVENTS[rarity]
	end

	if not self._prev_update_upgrade_chest_color_event or self._prev_update_upgrade_chest_color_event ~= event then
		Unit.flow_event(self.unit, event)

		self._prev_update_upgrade_chest_color_event = event
	end
end

DeusChestExtension.can_interact = function (self)
	if self._is_purchased then
		return false
	end

	local player_unit = self._player_unit
	local inventory_extension = self._inventory_extension

	if not player_unit or not ALIVE[player_unit] or not inventory_extension then
		return false
	end

	local resyncing_loadout = inventory_extension:resyncing_loadout()

	if resyncing_loadout then
		return false
	end

	return true
end

DeusChestExtension.get_interact_hud_description = function (self)
	if self._is_purchased then
		return "deus_weapon_chest_already_picked_up_hud_desc"
	else
		return "deus_weapon_chest_hud_desc"
	end
end

DeusChestExtension.get_purchase_cost = function (self)
	local chest_type = self._chest_type

	if chest_type == DEUS_CHEST_TYPES.upgrade or chest_type == DEUS_CHEST_TYPES.swap_melee or chest_type == DEUS_CHEST_TYPES.swap_ranged then
		local wielded_weapon = self:_get_wielded_weapon()
		local equipped_rarity = wielded_weapon.rarity

		return DeusCostSettings.deus_chest[chest_type][equipped_rarity][self._rarity]
	elseif chest_type == DEUS_CHEST_TYPES.power_up then
		return DeusCostSettings.deus_chest.power_up
	end

	return math.huge
end

DeusChestExtension.purchase = function (self)
	local purchase_cost = self:get_purchase_cost()

	self._deus_run_controller:purchase_chest(self._rarity, self._chest_type, purchase_cost)

	self._is_purchased = true

	Unit.flow_event(self.unit, "lua_update_collected")

	self._animation_state = "looted"

	if not self._is_server then
		local go_id = Managers.state.unit_storage:go_id(self.unit)

		Managers.state.network.network_transmit:send_rpc_server("rpc_deus_chest_looted", go_id)
	end
end

DeusChestExtension._get_wielded_weapon = function (self)
	local inventory_extension = self._inventory_extension

	if not inventory_extension then
		return
	end

	local deus_run_controller = self._deus_run_controller
	local melee_weapon, ranged_weapon = deus_run_controller:get_own_loadout()
	local wielded_slot_name = inventory_extension:get_wielded_slot_name()
	local weapon_slot_name = (wielded_slot_name == "slot_melee" and "slot_melee") or "slot_ranged"
	local wielded_weapon = (weapon_slot_name == "slot_melee" and melee_weapon) or ranged_weapon

	return wielded_weapon, weapon_slot_name
end

DeusChestExtension.on_interact = function (self)
	if self._chest_type == DEUS_CHEST_TYPES.upgrade then
		local wielded_weapon, wielded_slot_name = self:_get_wielded_weapon()

		if wielded_weapon and wielded_weapon ~= self._previous_wielded_weapon then
			self:_generate_upgraded_weapon(wielded_weapon, wielded_slot_name, self._rarity, self._go_id, self._profile_index, self._career_index)

			self._previous_wielded_weapon = wielded_weapon
		end
	end
end

DeusChestExtension._setup_rarity = function (self, seed, chest_type)
	if chest_type == DEUS_CHEST_TYPES.power_up then
		return nil
	else
		local current_node = self._deus_run_controller:get_current_node()
		local difficulty = self._deus_run_controller:get_run_difficulty()
		local progress = current_node.run_progress
		self._rarity = DeusWeaponGeneration.get_random_rarity(difficulty, progress, seed)

		Unit.flow_event(self.unit, "lua_update_" .. self._rarity)

		return self._rarity
	end
end

DeusChestExtension.get_rarity = function (self)
	if self._chest_type == DEUS_CHEST_TYPES.power_up then
		local power_up = self._stored_purchase

		return power_up.rarity
	else
		return self._rarity
	end
end

DeusChestExtension.get_stored_purchase = function (self)
	if self._chest_type == DEUS_CHEST_TYPES.power_up then
		local deus_run_controller = self._deus_run_controller
		local peer_id = deus_run_controller:get_own_peer_id()
		local power_up_name = self._stored_purchase.name
		local max_reached = deus_run_controller:reached_max_power_ups(peer_id, power_up_name)

		if max_reached then
			local go_id = self._go_id or Managers.state.unit_storage:go_id(self.unit)
			local current_node = self._deus_run_controller:get_current_node()
			local seed = HashUtils.fnv32_hash(go_id .. "_" .. current_node.weapon_pickup_seed)

			self:_generate_stored_power_up(seed)
		end
	end

	return self._stored_purchase
end

DeusChestExtension.get_chest_type = function (self)
	return self._chest_type
end

DeusChestExtension._generate_stored_power_up = function (self, seed)
	local power_ups = self._deus_run_controller:generate_random_power_ups(DeusPowerUpSettings.weapon_chest_choice_amount, DeusPowerUpAvailabilityTypes.weapon_chest, seed)
	self._stored_purchase = power_ups[1]
end

DeusChestExtension._generate_stored_weapon = function (self, slots, rarity, go_id, profile_index, career_index)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller:get_current_node()
	local progress = current_node.run_progress
	local difficulty = deus_run_controller:get_run_difficulty()
	local weapon_pool = deus_run_controller:get_weapon_pool()
	local weapon_seed = HashUtils.fnv32_hash(string.format("%s_%s_%s_%s_%s", profile_index, career_index, current_node.weapon_pickup_seed, go_id, 1))
	local slot_chance_melee = (table.contains(slots, "melee") and 1) or 0
	local slot_chance_ranged = (table.contains(slots, "ranged") and 1) or 0
	local new_weapon = DeusWeaponGeneration.generate_weapon(difficulty, progress, rarity, weapon_seed, weapon_pool, slot_chance_melee, slot_chance_ranged)

	deus_run_controller:remove_weapon_from_pool(rarity, new_weapon.deus_item_key)

	local deus_backend = Managers.backend:get_interface("deus")

	deus_backend:grant_deus_weapon(new_weapon)
	deus_backend:refresh_deus_weapons_in_items_backend()

	self._stored_purchase = new_weapon
end

DeusChestExtension._generate_upgraded_weapon = function (self, weapon, slot_name, rarity, go_id, profile_index, career_index)
	local deus_run_controller = self._deus_run_controller
	local current_node = deus_run_controller:get_current_node()
	local progress = current_node.run_progress
	local difficulty = deus_run_controller:get_run_difficulty()
	local weapon_seed = HashUtils.fnv32_hash(string.format("%s_%s_%s_%s_%s", profile_index, career_index, current_node.weapon_pickup_seed, go_id, 1))
	local new_weapon = DeusWeaponGeneration.upgrade_item(weapon, difficulty, progress, rarity, weapon_seed)
	new_weapon.preferred_slot_name = slot_name
	local deus_backend = Managers.backend:get_interface("deus")

	deus_backend:grant_deus_weapon(new_weapon)
	deus_backend:refresh_deus_weapons_in_items_backend()

	self._stored_purchase = new_weapon

	Unit.set_data(self.unit, "interaction_data", "hud_description", "deus_weapon_chest_upgrade_hud_desc")
	Unit.set_data(self.unit, "interaction_data", "hud_action", "deus_weapon_chest_upgrade_action")
end

DeusChestExtension._get_server_chest_type = function (self)
	local game_session = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self.unit)

	if not game_session or not go_id then
		return nil
	end

	local chest_lookup = GameSession.game_object_field(game_session, go_id, "server_chest_type")

	return (chest_lookup ~= 0 and NetworkLookup.deus_chest_types[chest_lookup]) or nil
end

DeusChestExtension._set_server_chest_type = function (self, server_chest_type)
	local game_session = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self.unit)

	fassert(game_session and go_id, "setting state without network setup done")

	local chest_lookup = NetworkLookup.deus_chest_types[server_chest_type]

	GameSession.set_game_object_field(game_session, go_id, "server_chest_type", chest_lookup)
end

local sound_events = {
	unlock_chest = "hud_morris_weapon_chest_unlock",
	unlock_power_up = "morris_reliquarys_get_boon",
	close_chest_ui = "hud_morris_weapon_chest_close",
	button_hover = "hud_morris_hover",
	exchange_weapon = "hud_morris_weapon_chest_change_weapon",
	open_chest_ui = "hud_morris_weapon_chest_open",
	unlock_chest_rarity_sounds = {
		common = "play_hud_rewards_tier1",
		plentiful = "play_hud_rewards_tier1",
		exotic = "play_hud_rewards_tier3",
		rare = "play_hud_rewards_tier2",
		unique = "play_hud_rewards_tier4"
	}
}

DeusChestExtension.can_be_unlocked = function (self)
	local can_interact = self:can_interact()

	if not can_interact then
		return false
	end

	local run_controller = self._deus_run_controller
	local own_peer_id = run_controller:get_own_peer_id()
	local soft_currency = self._deus_run_controller:get_player_soft_currency(own_peer_id)
	local unlock_cost = self:get_purchase_cost() or math.huge
	local can_unlock = script_data.unlock_all_deus_chests or unlock_cost <= soft_currency
	local chest_type = self._chest_type

	if chest_type == DEUS_CHEST_TYPES.upgrade then
		local wielded_weapon = self:_get_wielded_weapon()

		if wielded_weapon then
			local rarity_settings = RaritySettings
			local weapon_rarity_order = rarity_settings[wielded_weapon.rarity].order
			local chest_rarity_order = rarity_settings[self._rarity].order

			if chest_rarity_order <= weapon_rarity_order then
				can_unlock = false
			end
		end
	end

	if not can_unlock then
		return false
	end

	local others_actually_ingame = true

	if chest_type ~= DEUS_CHEST_TYPES.power_up then
		local network_manager = Managers.state.network
		local profile_synchronizer = network_manager.profile_synchronizer
		others_actually_ingame = profile_synchronizer:others_actually_ingame()
	end

	if not others_actually_ingame then
		return false
	end

	return true
end

DeusChestExtension.open_chest = function (self)
	local run_controller = self._deus_run_controller

	if self._chest_type == DEUS_CHEST_TYPES.power_up then
		local power_up = self._stored_purchase
		local player_unit = self._player_unit

		run_controller:add_power_ups({
			power_up
		}, REAL_PLAYER_LOCAL_ID)

		local buff_system = Managers.state.entity:system("buff_system")
		local talent_interface = Managers.backend:get_talents_interface()
		local deus_backend = Managers.backend:get_interface("deus")

		DeusPowerUpUtils.activate_deus_power_up(power_up, buff_system, talent_interface, deus_backend, run_controller, player_unit, self._profile_index, self._career_index)
		self:_play_sound(sound_events.unlock_power_up)
		self:_post_chest_unlock(self._stored_purchase)
	else
		if not self._stored_purchase then
			local wielded_weapon, wielded_slot_name = self:_get_wielded_weapon()

			self:_generate_upgraded_weapon(wielded_weapon, wielded_slot_name, self._rarity, self._go_id, self._profile_index, self._career_index)

			self._previous_wielded_weapon = wielded_weapon
		end

		self:_equip_weapon(run_controller, self._stored_purchase)

		local rarity = self:get_rarity()
		local rarity_sound = sound_events.unlock_chest_rarity_sounds[rarity]

		if rarity_sound then
			self:_play_sound(rarity_sound)
		end

		self:_post_chest_unlock(self._stored_purchase)
		self:_play_sound(sound_events.exchange_weapon)
	end
end

DeusChestExtension._equip_weapon = function (self, deus_run_controller, new_weapon)
	print("[DeusChestExtension] equipped:")
	table.dump(new_weapon, "deus_weapon")

	local backend_id = new_weapon.backend_id
	local inventory_extension = self._inventory_extension
	local profile_index = self._profile_index
	local profile = SPProfiles[profile_index]
	local career_index = self._career_index
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local slot_name = nil
	local chest_type = self._chest_type

	if chest_type == DEUS_CHEST_TYPES.swap_melee then
		slot_name = "slot_melee"
	elseif chest_type == DEUS_CHEST_TYPES.swap_ranged then
		slot_name = "slot_ranged"
	else
		slot_name = self:_get_best_slot_name(new_weapon, chest_type, career_data, inventory_extension)
	end

	BackendUtils.set_loadout_item(backend_id, career_name, slot_name)
	inventory_extension:create_equipment_in_slot(slot_name, backend_id, 1)
	deus_run_controller:save_loadout(new_weapon, slot_name)
end

DeusChestExtension._get_best_slot_name = function (self, stored_weapon, chest_type, career_data, inventory_extension)
	local slot_name = nil
	local stored_weapon_slot_type = stored_weapon.data.slot_type
	local slots = InventorySettings.slots_by_slot_index

	for _, slot in pairs(slots) do
		if stored_weapon_slot_type == slot.type then
			slot_name = slot.name
		end
	end

	local wielded_slot_name = nil
	local equipment = inventory_extension:equipment()
	local wielded_backend_id = equipment.wielded.backend_id

	for _, slot in pairs(equipment.slots) do
		local item_data = slot.item_data

		if item_data.backend_id == wielded_backend_id then
			wielded_slot_name = slot.id

			break
		end
	end

	if chest_type == DEUS_CHEST_TYPES.upgrade then
		return stored_weapon.preferred_slot_name
	else
		local wielded_slot_types = career_data.item_slot_types_by_slot_name[wielded_slot_name]
		local slot_available = wielded_slot_types and table.contains(wielded_slot_types, stored_weapon_slot_type)
		local best_slot_name = (slot_available and wielded_slot_name) or slot_name

		return best_slot_name, stored_weapon_slot_type
	end
end

DeusChestExtension._post_chest_unlock = function (self, store_purchase)
	self:_play_sound(sound_events.unlock_chest)
	self:purchase()

	local player = Managers.player:local_player()

	Managers.state.event:trigger("player_pickup_deus_weapon_chest", player)

	if store_purchase then
		if self._chest_type == DEUS_CHEST_TYPES.power_up then
			Managers.state.event:trigger("present_rewards", {
				{
					type = "deus_power_up",
					power_up = store_purchase
				}
			})
		else
			Managers.state.event:trigger("present_rewards", {
				{
					type = "deus_item_tooltip",
					backend_id = store_purchase.backend_id
				}
			})
		end
	end

	StatisticsUtil.register_open_shrine(self._chest_type)
end

DeusChestExtension._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusChestExtension._update_chest_animation_and_sound_state = function (self, chest_unit)
	local player_unit = self._player_unit
	local local_player_pos = POSITION_LOOKUP[player_unit]
	local chest_unit_pos = POSITION_LOOKUP[chest_unit]
	local distance_squared = Vector3.distance_squared(local_player_pos, chest_unit_pos)
	local interaction_extension = ScriptUnit.extension(player_unit, "interactor_system")
	local interacting_unit = interaction_extension:interactable_unit()
	local interacting_with_unit = interacting_unit == chest_unit
	local animation_state = self._animation_state
	local sound_state = self._sound_state
	local sound_state_interact = self._sound_state_interact

	if interacting_with_unit then
		animation_state = "player_interacting"
		sound_state_interact = "interact_true"
	elseif distance_squared < RELIQUARY_NEAR_DISTANCE * RELIQUARY_NEAR_DISTANCE then
		animation_state = "player_near"
		sound_state = "sound_player_near"
		sound_state_interact = "interact_false"
	elseif distance_squared > RELIQUARY_FAR_DISTANCE * RELIQUARY_FAR_DISTANCE then
		animation_state = "player_far"
		sound_state = "sound_player_far"
		sound_state_interact = "interact_false"
	end

	if animation_state ~= self._animation_state then
		self._animation_state = animation_state

		Unit.flow_event(chest_unit, animation_state)
	end

	if sound_state ~= self._sound_state then
		Unit.flow_event(chest_unit, sound_state)

		self._sound_state = sound_state
	end

	if sound_state_interact ~= self._sound_state_interact then
		Unit.flow_event(chest_unit, sound_state_interact)

		self._sound_state_interact = sound_state_interact
	end
end

DeusChestExtension.rpc_deus_chest_looted = function (self, channel_id, go_id)
	local own_go_id = Managers.state.unit_storage:go_id(self.unit)

	if go_id ~= own_go_id then
		return
	end

	local game = Managers.state.network:game()

	fassert(game and own_go_id, "setting state without network setup done")

	local collected_by_peers = GameSession.game_object_field(game, own_go_id, "collected_by_peers")
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	table.insert(collected_by_peers, peer_id)
	GameSession.set_game_object_field(game, own_go_id, "collected_by_peers", collected_by_peers)
end

return
