require("scripts/ui/views/deus_menu/deus_run_stats_ui")

DeusRunStatsView = class(DeusRunStatsView)
local REAL_PLAYER_LOCAL_ID = 1

DeusRunStatsView.init = function (self, parent, ingame_ui_context)
	self._ingame_hud = parent
	self._is_server = ingame_ui_context.is_server
	self._deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
	local input_service_name = "deus_run_stats_view"
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager
	self._input_service_name = input_service_name

	input_manager:create_input_service(input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "gamepad")
	input_manager:map_device_to_service(input_service_name, "mouse")

	self._ui = DeusRunStatsUi:new(ingame_ui_context, self)
end

DeusRunStatsView.on_enter = function (self)
	self._input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusRunStatsView")
end

DeusRunStatsView.on_exit = function (self)
	self._input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, self._input_service_name, "DeusRunStatsView")
end

DeusRunStatsView.update = function (self, dt, t)
	self._ui:update(dt, t)
	self:_handle_input(dt, t)
end

DeusRunStatsView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusRunStatsView.is_ui_active = function (self)
	return self._ui:active()
end

DeusRunStatsView._handle_input = function (self, dt, t)
	local input_service = self._input_manager:get_service(self._input_service_name)
	local new_active = input_service:get("hotkey_deus_inventory", false)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local ui_active = self._ui:active()

	if ui_active then
		if input_service:get("right_press") then
			self._ui:lock(true)
		end
	elseif ui_active ~= new_active and new_active == true then
		self:_update_dynamic_values()
		self:_update_inventory()

		if gamepad_active then
			self._ui:lock(true)
		end
	end

	self._ui:set_active(self._ui:locked() or new_active)
end

DeusRunStatsView.destroy = function (self)
	self._ui:destroy()
end

DeusRunStatsView._update_dynamic_values = function (self)
	local run_controller = self._deus_run_controller
	local blessings = run_controller:get_blessings()
	local blessings_keys = table.keys(DeusBlessingSettings)
	local peer_id = run_controller:get_own_peer_id()
	local power_ups = run_controller:get_player_power_ups(peer_id, REAL_PLAYER_LOCAL_ID)
	local party_power_ups = run_controller:get_party_power_ups()
	local profile_index, career_index = run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local data = {
		blessings = blessings,
		power_ups = power_ups,
		party_power_ups = party_power_ups,
		profile_index = profile_index,
		career_index = career_index
	}

	self._ui:update_dynamic_values(data)
end

DeusRunStatsView._update_inventory = function (self)
	local run_controller = self._deus_run_controller
	local melee, ranged = run_controller:get_own_loadout()
	local own_peer_id = run_controller:get_own_peer_id()
	local healing_slot = run_controller:get_player_consumable_healthkit_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local potion_slot = run_controller:get_player_consumable_potion_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)
	local grenade_slot = run_controller:get_player_consumable_grenade_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)

	if self._melee ~= melee or self._ranged ~= ranged or self._potion_slot ~= potion_slot or self._grenade_slot ~= grenade_slot or self._healing_slot ~= healing_slot then
		self._ui:set_loadout(melee, ranged, healing_slot, potion_slot, grenade_slot)

		self._melee = melee
		self._ranged = ranged
		self._potion_slot = potion_slot
		self._grenade_slot = grenade_slot
		self._healing_slot = healing_slot
	end
end

return
