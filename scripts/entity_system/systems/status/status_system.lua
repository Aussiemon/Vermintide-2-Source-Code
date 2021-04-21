require("scripts/unit_extensions/generic/generic_status_extension")

StatusSystem = class(StatusSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_status_change_bool",
	"rpc_status_change_int",
	"rpc_status_change_int_and_unit",
	"rpc_set_catapulted",
	"rpc_leap_start",
	"rpc_leap_finished",
	"rpc_set_blocking",
	"rpc_set_charge_blocking",
	"rpc_player_blocked_attack",
	"rpc_set_wounded",
	"rpc_hooked_sync",
	"rpc_hot_join_sync_health_status",
	"rpc_replenish_fatigue",
	"rpc_replenish_fatigue_other_players",
	"rpc_set_stagger",
	"rpc_set_action_data",
	"rpc_set_override_blocking"
}
local extensions = {
	"GenericStatusExtension"
}

DLCUtils.map_list("status_extensions", function (file)
	extensions[#extensions + 1] = require(file)
end)

StatusSystem.init = function (self, entity_system_creation_context, system_name)
	StatusSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

StatusSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

StatusSystem.rpc_hooked_sync = function (self, channel_id, status_id, game_object_id, time_left)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_ext = ScriptUnit.extension(unit, "status_system")
	local t = Managers.time:time("game")
	local status = NetworkLookup.statuses[status_id]

	if status == "pack_master_dropping" then
		status_ext.release_falling_time = t + time_left
	elseif status == "pack_master_unhooked" then
		status_ext.release_unhook_time_left = t + time_left
	end
end

StatusSystem.rpc_set_action_data = function (self, channel_id, game_object_id, breed_id, breed_action_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_ext = ScriptUnit.extension(unit, "status_system")
	local breed_name = NetworkLookup.breeds[breed_id]
	local breed_action_name = NetworkLookup.bt_action_names[breed_action_id]

	status_ext:set_breed_action(breed_name, breed_action_name)
end

StatusSystem.rpc_status_change_bool = function (self, channel_id, status_id, status_bool, game_object_id, other_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local other_unit = self.unit_storage:unit(other_object_id)
	local status_ext = ScriptUnit.extension(unit, "status_system")
	local status = NetworkLookup.statuses[status_id]
	local level = LevelHelper:current_level(self.world)

	if status == "pushed" then
		local t = Managers.time:time("game")

		status_ext:set_pushed(status_bool, t)
	elseif status == "pounced_down" then
		status_ext:set_pounced_down(status_bool, other_unit)
	elseif status == "dead" then
		status_ext:set_dead(status_bool)
	elseif status == "knocked_down" then
		status_ext:set_knocked_down(status_bool)
	elseif status == "revived" then
		status_ext:set_revived(status_bool, other_unit)
	elseif status == "pack_master_pulling" then
		status_ext:set_pack_master("pack_master_pulling", status_bool, other_unit)
	elseif status == "pack_master_dragging" then
		status_ext:set_pack_master("pack_master_dragging", status_bool, other_unit)
	elseif status == "pack_master_hoisting" then
		status_ext:set_pack_master("pack_master_hoisting", status_bool, other_unit)
	elseif status == "pack_master_hanging" then
		status_ext:set_pack_master("pack_master_hanging", status_bool, other_unit)
	elseif status == "pack_master_dropping" then
		status_ext:set_pack_master("pack_master_dropping", status_bool, other_unit)
	elseif status == "pack_master_released" then
		status_ext:set_pack_master("pack_master_released", status_bool, other_unit)
	elseif status == "pack_master_unhooked" then
		status_ext:set_pack_master("pack_master_unhooked", status_bool, other_unit)
	elseif status == "chaos_corruptor_grabbed" then
		status_ext:set_grabbed_by_corruptor(status, status_bool, other_unit)
	elseif status == "chaos_corruptor_dragging" then
		status_ext:set_grabbed_by_corruptor(status, status_bool, other_unit)
	elseif status == "chaos_corruptor_released" then
		status_ext:set_grabbed_by_corruptor(status, status_bool, other_unit)
	elseif status == "crouching" then
		status_ext:set_crouching(status_bool)
	elseif status == "pulled_up" then
		status_ext:set_pulled_up(status_bool, other_unit)
	elseif status == "ladder_climbing" then
		local ladder_unit = Level.unit_by_index(level, other_object_id)

		status_ext:set_is_on_ladder(status_bool, ladder_unit)
	elseif status == "ledge_hanging" then
		local ledge_unit = Level.unit_by_index(level, other_object_id)

		status_ext:set_is_ledge_hanging(status_bool, ledge_unit)
	elseif status == "ready_for_assisted_respawn" then
		local flavour_unit = Level.unit_by_index(level, other_object_id)

		Managers.state.game_mode:player_respawned(status_ext.unit)
		status_ext:set_ready_for_assisted_respawn(status_bool, flavour_unit)
	elseif status == "assisted_respawning" then
		status_ext:set_assisted_respawning(status_bool, other_unit)
	elseif status == "respawned" then
		status_ext:set_respawned(status_bool)
	elseif status == "overcharge_exploding" then
		status_ext:set_overcharge_exploding(status_bool)
	elseif status == "dodging" then
		status_ext:set_is_dodging(status_bool)
	elseif status == "dodging" then
		status_ext:set_is_dodging(status_bool)
	elseif status == "grabbed_by_tentacle" then
		status_ext:set_grabbed_by_tentacle(status_bool, other_unit)

		local tentacle_spline_extension = ScriptUnit.has_extension(other_unit, "ai_supplementary_system")

		if Unit.alive(other_unit) then
			tentacle_spline_extension:set_target_unit(unit)
		end
	elseif status == "grabbed_by_chaos_spawn" then
		status_ext:set_grabbed_by_chaos_spawn(status_bool, other_unit)
	elseif status == "in_vortex" then
		status_ext:set_in_vortex(status_bool, other_unit)
	elseif status == "near_vortex" then
		status_ext:set_near_vortex(status_bool, other_unit)
	elseif status == "invisible" then
		status_ext:set_invisible(status_bool)
	elseif status == "in_end_zone" then
		status_ext:set_in_end_zone(status_bool)
	elseif status == "in_liquid" then
		status_ext:set_in_liquid(status_bool, other_unit)
	elseif status == "charged" then
		local t = Managers.time:time("game")

		status_ext:set_charged(status_bool, t)
	else
		fassert(false, "Unhandled status %s", tostring(status))
	end

	if Managers.player.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_status_change_bool", peer_id, status_id, status_bool, game_object_id, other_object_id)
	end
end

StatusSystem.rpc_status_change_int = function (self, channel_id, status_id, status_int, game_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_ext = ScriptUnit.extension(unit, "status_system")
	local status = NetworkLookup.statuses[status_id]

	if status == "grabbed_by_tentacle" then
		local sub_status = NetworkLookup[status][status_int]

		status_ext:set_grabbed_by_tentacle_status(sub_status)
	elseif status == "grabbed_by_chaos_spawn" then
		local sub_status = NetworkLookup[status][status_int]

		status_ext:set_grabbed_by_chaos_spawn_status(sub_status)
	else
		assert("Unhandled status %s", tostring(status))
	end

	if Managers.player.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_status_change_int", peer_id, status_id, status_int, game_object_id)
	end
end

StatusSystem.rpc_status_change_int_and_unit = function (self, channel_id, status_id, status_int, game_object_id, other_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local other_unit = self.unit_storage:unit(other_object_id)
	local status_ext = ScriptUnit.extension(unit, "status_system")
	local status = NetworkLookup.statuses[status_id]

	if status == "overpowered" then
		local is_overpowered = status_int ~= 0
		local overpowered_template = is_overpowered and NetworkLookup.overpowered_templates[status_int]

		status_ext:set_overpowered(is_overpowered, (is_overpowered and overpowered_template) or status_int, other_unit)
	else
		assert("Unhandled status %s", tostring(status))
	end

	if Managers.player.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_status_change_int", peer_id, status_id, status_int, game_object_id, other_object_id)
	end
end

StatusSystem.rpc_set_wounded = function (self, channel_id, game_object_id, wounded, reason_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")
	local reason = NetworkLookup.set_wounded_reasons[reason_id]

	status_extension:set_wounded(wounded, reason)
end

StatusSystem.rpc_set_catapulted = function (self, channel_id, unit_id, catapulted, velocity)
	local unit = self.unit_storage:unit(unit_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_catapulted(catapulted, velocity)

	if Managers.player.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_set_catapulted", peer_id, unit_id, catapulted, velocity)
	end
end

StatusSystem.rpc_set_override_blocking = function (self, channel_id, unit_id, blocking)
	local unit = self.unit_storage:unit(unit_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_override_blocking(blocking or nil)
end

StatusSystem.rpc_leap_start = function (self, channel_id, unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:leap_start(unit)
end

StatusSystem.rpc_leap_finished = function (self, channel_id, unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:leap_finished(unit)
end

StatusSystem.rpc_set_blocking = function (self, channel_id, game_object_id, blocking)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_blocking(blocking)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_set_blocking", peer_id, game_object_id, blocking)
	end
end

StatusSystem.rpc_set_charge_blocking = function (self, channel_id, game_object_id, charge_blocking)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit or not Unit.alive(unit) then
		return
	end

	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_charge_blocking(charge_blocking)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_set_charge_blocking", peer_id, game_object_id, charge_blocking)
	end
end

StatusSystem.rpc_player_blocked_attack = function (self, sender, game_object_id, fatigue_type_id, attacking_unit_id, fatigue_point_costs_multiplier, improved_block, attack_direction, attacker_is_level_unit)
	local unit = self.unit_storage:unit(game_object_id)
	local attacking_unit = Managers.state.network:game_object_or_level_unit(attacking_unit_id, attacker_is_level_unit)

	if not unit or not Unit.alive(unit) then
		return
	end

	local fatigue_type = NetworkLookup.fatigue_types[fatigue_type_id]
	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:blocked_attack(fatigue_type, attacking_unit, fatigue_point_costs_multiplier, improved_block, attack_direction)
end

StatusSystem.rpc_hot_join_sync_health_status = function (self, channel_id, game_object_id, wounds, ready_for_assisted_respawn, respawn_unit_game_object_id)
	local unit = self.unit_storage:unit(game_object_id)
	local status_extension = ScriptUnit.extension(unit, "status_system")
	status_extension.wounds = wounds

	if ready_for_assisted_respawn then
		status_extension:set_ready_for_assisted_respawn(ready_for_assisted_respawn, self.unit_storage:unit(respawn_unit_game_object_id))
	end
end

StatusSystem.rpc_replenish_fatigue = function (self, channel_id, game_object_id, fatigue_type_id)
	print("rpc_replenish_fatigue")

	local unit = self.unit_storage:unit(game_object_id)
	local fatigue_type = NetworkLookup.fatigue_types[fatigue_type_id]

	StatusUtils.replenish_stamina_local_players(nil, fatigue_type)
end

StatusSystem.rpc_replenish_fatigue_other_players = function (self, channel_id, fatigue_type_id)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_replenish_fatigue_other_players", peer_id, fatigue_type_id)
	end

	local fatigue_type = NetworkLookup.fatigue_types[fatigue_type_id]

	StatusUtils.replenish_stamina_local_players(nil, fatigue_type)
end

StatusSystem.rpc_set_stagger = function (self, channel_id, game_object_id, stagger, stagger_direction, stagger_length, stagger_type, stagger_time, stagger_animation_scale, always_stagger_suffered)
	local unit = self.unit_storage:unit(game_object_id)
	local status_extension = ScriptUnit.extension(unit, "status_system")

	fassert(status_extension.set_stagger_values)
	status_extension:set_stagger_values(stagger, stagger_direction, stagger_length, stagger_type, stagger_time, stagger_animation_scale, always_stagger_suffered, false)
end

return
