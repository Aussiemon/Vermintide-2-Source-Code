-- chunkname: @scripts/unit_extensions/default_player_unit/ghost_mode/player_husk_ghost_mode_extension.lua

PlayerHuskGhostModeExtension = class(PlayerHuskGhostModeExtension)

PlayerHuskGhostModeExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._world = extension_init_context.world
	self._network_transmit = extension_init_context.network_transmit
	self._is_server = self._network_transmit.is_server
	self._ghost_mode_active = false
	self._is_husk = true
end

PlayerHuskGhostModeExtension.extensions_ready = function (self)
	self._inventory_extension = ScriptUnit.extension(self._unit, "inventory_system")
	self._breed = Unit.get_data(self._unit, "breed")

	local start_in_ghost_mode = true

	if start_in_ghost_mode then
		self:husk_enter_ghost_mode()
	end
end

PlayerHuskGhostModeExtension.destroy = function (self)
	self:_clear_world_marker()
end

PlayerHuskGhostModeExtension.is_in_ghost_mode = function (self)
	return self._ghost_mode_active
end

PlayerHuskGhostModeExtension.is_husk = function (self)
	return self._is_husk
end

PlayerHuskGhostModeExtension._in_same_side_as_local_player = function (self)
	if DEDICATED_SERVER then
		return false
	end

	local player = Managers.player:local_player()
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local local_player_party = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	fassert(local_player_party, "local player not in a party")

	local local_player_side = Managers.state.side.side_by_party[local_player_party]
	local unit_side = Managers.state.side.side_by_unit[self._unit]

	return unit_side == local_player_side
end

PlayerHuskGhostModeExtension._is_spectator = function (self)
	if DEDICATED_SERVER then
		return false
	end

	if self._is_spectator ~= nil then
		return self._is_spectator
	end

	local player = Managers.player:local_player()
	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()
	local player_party = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	fassert(player_party, "player not in a party")

	self._is_spectator = player_party.name == "spectators"

	return self._is_spectator
end

PlayerHuskGhostModeExtension.husk_enter_ghost_mode = function (self)
	self._ghost_mode_active = true

	if not DEDICATED_SERVER then
		local skin_unit = CosmeticsUtils.get_third_person_mesh_unit(self._unit)

		Unit.flow_event(skin_unit, "lua_entered_ghost_mode")
	end

	local inventory_extension = ScriptUnit.extension(self._unit, "inventory_system")
	local equipment = inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p

	if weapon_unit and not DEDICATED_SERVER then
		Unit.flow_event(weapon_unit, "lua_entered_ghost_mode")
	end

	local status_extension = ScriptUnit.extension(self._unit, "status_system")

	status_extension:set_ghost_mode(true)

	if self:_in_same_side_as_local_player() then
		self:_add_world_marker()
	elseif not self:_is_spectator() then
		Unit.set_unit_visibility(self._unit, false)
		self._inventory_extension:show_third_person_inventory(false)
	end

	GhostModeSystem.set_sweep_actors(self._unit, self._breed, false)
	Managers.state.event:trigger("set_new_enemy_role")
end

PlayerHuskGhostModeExtension._add_world_marker = function (self)
	self:_clear_world_marker()

	local callback = callback(self, "cb_world_marker_spawned", self._unit)

	Managers.state.event:trigger("add_world_marker_unit", "versus_pactsworn_ghostmode", self._unit, callback)
end

PlayerHuskGhostModeExtension._clear_world_marker = function (self)
	if self._marker_id then
		Managers.state.event:trigger("remove_world_marker", self._marker_id)

		self._marker_id = nil
	end
end

PlayerHuskGhostModeExtension.cb_world_marker_spawned = function (self, unit, marker_id, widget)
	local profile_index = Managers.player:owner(unit):profile_index()
	local profile = SPProfiles[profile_index]

	widget.content.icon = profile.ui_portrait
	self._marker_id = marker_id
end

PlayerHuskGhostModeExtension.husk_leave_ghost_mode = function (self)
	self._ghost_mode_active = false

	local player_unit = self._unit
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p
	local status_extension = ScriptUnit.extension(self._unit, "status_system")

	status_extension:set_ghost_mode(false)

	if self:_in_same_side_as_local_player() then
		self:_clear_world_marker()
	elseif not self:_is_spectator() then
		Unit.set_unit_visibility(player_unit, true)

		local career_extension = ScriptUnit.extension(player_unit, "career_system")
		local career_data = career_extension:career_settings()

		if not status_extension:get_unarmed() then
			self._inventory_extension:show_third_person_inventory(true)
		end
	end

	GhostModeSystem.set_sweep_actors(player_unit, self._breed, true)

	if not DEDICATED_SERVER then
		if weapon_unit then
			Unit.flow_event(weapon_unit, "lua_left_ghost_mode")
		end

		local skin_unit = CosmeticsUtils.get_third_person_mesh_unit(self._unit)

		Unit.flow_event(skin_unit, "lua_left_ghost_mode")
	end

	if self._is_server then
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")

		dialogue_input:trigger_dialogue_event("spawning")
	end
end

PlayerHuskGhostModeExtension.set_safe_spot = function (self, safe_spot)
	self._safe_spot = safe_spot
end
