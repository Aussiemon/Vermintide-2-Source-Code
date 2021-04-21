require("scripts/ui/views/deus_menu/deus_inspect_ui")

DeusInspectView = class(DeusInspectView)
local REAL_PLAYER_LOCAL_ID = 1

DeusInspectView.init = function (self, parent, ingame_ui_context)
	self._ui = DeusInspectUI:new(ingame_ui_context)
	self._ingame_hud = parent
	self._is_server = ingame_ui_context.is_server
	self._deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
	local input_service_name = "deus_inspect_view"
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager
	self._input_service_name = input_service_name

	input_manager:create_input_service(input_service_name, "PlayerControllerKeymaps", "PlayerControllerFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "gamepad")

	self._melee = nil
	self._ranged = nil
	self._potion_slot = nil
	self._grenade_slot = nil
	self._healing_slot = nil
end

DeusInspectView.update = function (self, dt, t)
	local input_service = self._input_manager:get_service(self._input_service_name)
	self._ui_active = input_service:get("action_inspect_hold", false)

	if self._ui_active then
		local melee, ranged = self._deus_run_controller:get_own_loadout()
		local own_peer_id = self._deus_run_controller:get_own_peer_id()
		local healing_slot = self._deus_run_controller:get_player_consumable_healthkit_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)
		local potion_slot = self._deus_run_controller:get_player_consumable_potion_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)
		local grenade_slot = self._deus_run_controller:get_player_consumable_grenade_slot(own_peer_id, REAL_PLAYER_LOCAL_ID)

		if self._melee ~= melee or self._ranged ~= ranged or self._potion_slot ~= potion_slot or self._grenade_slot ~= grenade_slot or self._healing_slot ~= healing_slot then
			self._ui:set_loadout(melee, ranged, healing_slot, potion_slot, grenade_slot)

			self._melee = melee
			self._ranged = ranged
			self._potion_slot = potion_slot
			self._grenade_slot = grenade_slot
			self._healing_slot = healing_slot
		end

		self._ui:update(dt, t, input_service)
	end
end

DeusInspectView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusInspectView.is_ui_active = function (self)
	return self._ui_active
end

DeusInspectView.destroy = function (self)
	return
end

return
