StatusUtils = {
	set_wounded_network = function (wounded_unit, wounded, reason, t)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(wounded_unit, "status_system")

		status_extension.set_wounded(status_extension, wounded, reason, t)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, wounded_unit)
			local reason_id = NetworkLookup.set_wounded_reasons[reason]

			network_manager.network_transmit:send_rpc_clients("rpc_set_wounded", go_id, wounded, reason_id)
		end

		return 
	end,
	set_knocked_down_network = function (knocked_down_unit, knocked_down)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(knocked_down_unit, "status_system")

		status_extension.set_knocked_down(status_extension, knocked_down)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, knocked_down_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.knocked_down, knocked_down, go_id, 0)
		end

		return 
	end,
	set_revived_network = function (revived_unit, revived, reviver_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST, "Only the server is allowed to decide who is revived and who isn't since it owns damage and interactions.")

		local status_extension = ScriptUnit.extension(revived_unit, "status_system")

		status_extension.set_revived(status_extension, revived, reviver_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, revived_unit)
			local reviver_go_id = (reviver_unit and network_manager.unit_game_object_id(network_manager, reviver_unit)) or NetworkConstants.invalid_game_object_id

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.revived, revived, go_id, reviver_go_id)
		end

		return 
	end,
	set_respawned_network = function (respawned_unit, respawned, helper_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(respawned_unit, "status_system")

		if not respawned then
			status_extension.set_respawned(status_extension, respawned)

			if not LEVEL_EDITOR_TEST then
				local network_manager = Managers.state.network
				local go_id = network_manager.unit_game_object_id(network_manager, respawned_unit)
				local helper_go_id = (helper_unit and network_manager.unit_game_object_id(network_manager, helper_unit)) or NetworkConstants.invalid_game_object_id

				network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.respawned, respawned, go_id, helper_go_id)
			end
		elseif not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, respawned_unit) or 0
			local helper_go_id = (helper_unit and network_manager.unit_game_object_id(network_manager, helper_unit)) or 0
			local owner = Managers.player:owner(respawned_unit)
			local network_id = owner.network_id(owner)

			network_manager.network_transmit:send_rpc("rpc_status_change_bool", network_id, NetworkLookup.statuses.assisted_respawning, respawned, go_id, helper_go_id)
		end

		return 
	end,
	set_pulled_up_network = function (pulled_up_unit, pulled_up, helper_unit)
		local status_extension = ScriptUnit.extension(pulled_up_unit, "status_system")

		status_extension.set_pulled_up(status_extension, pulled_up, helper_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, pulled_up_unit)
			local helper_go_id = (helper_unit and network_manager.unit_game_object_id(network_manager, helper_unit)) or NetworkConstants.invalid_game_object_id

			if Managers.player.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.pulled_up, pulled_up, go_id, helper_go_id)
			else
				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.pulled_up, pulled_up, go_id, helper_go_id)
			end
		end

		return 
	end,
	set_grabbed_by_pack_master_network = function (status_name, grabbed_unit, is_grabbed, grabber_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		if not Managers.state.network:game() then
			return 
		end

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_pack_master(status_extension, status_name, is_grabbed, grabber_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local grabbed_go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local grabber_go_id = network_manager.unit_game_object_id(network_manager, grabber_unit) or NetworkConstants.invalid_game_object_id
			local status_id = NetworkLookup.statuses[status_name]

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", status_id, is_grabbed, grabbed_go_id, grabber_go_id)
		end

		return 
	end,
	set_grabbed_by_corruptor_network = function (status_name, grabbed_unit, is_grabbed, grabber_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		if not Managers.state.network:game() then
			return 
		end

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_grabbed_by_corruptor(status_extension, status_name, is_grabbed, grabber_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local grabbed_go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local grabber_go_id = network_manager.unit_game_object_id(network_manager, grabber_unit) or NetworkConstants.invalid_game_object_id
			local status_id = NetworkLookup.statuses[status_name]

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", status_id, is_grabbed, grabbed_go_id, grabber_go_id)
		end

		return 
	end,
	set_pushed_network = function (pushed_unit, pushed)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(pushed_unit, "status_system")

		status_extension.set_pushed(status_extension, pushed)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, pushed_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.pushed, pushed, go_id, 0)
		end

		return 
	end,
	set_catapulted_network = function (unit, catapulted, velocity)
		local player_manager = Managers.player
		local player = player_manager.unit_owner(player_manager, unit)

		if not player.remote then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension.set_catapulted(status_extension, catapulted, velocity)
		elseif player_manager.is_server then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, unit)
			local peer_id = player.network_id(player)

			network_manager.network_transmit:send_rpc("rpc_set_catapulted", peer_id, go_id, catapulted, velocity or Vector.zero())
		end

		return 
	end,
	set_grabbed_by_tentacle_network = function (grabbed_unit, is_grabbed, tentacle_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_grabbed_by_tentacle(status_extension, is_grabbed, tentacle_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local grabber_go_id = network_manager.unit_game_object_id(network_manager, tentacle_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.grabbed_by_tentacle, is_grabbed, go_id, grabber_go_id)
		end

		return 
	end,
	set_grabbed_by_tentacle_status_network = function (grabbed_unit, substatus)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_grabbed_by_tentacle_status(status_extension, substatus)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local substatus_id = NetworkLookup.grabbed_by_tentacle[substatus]

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_int", NetworkLookup.statuses.grabbed_by_tentacle, substatus_id, go_id)
		end

		return 
	end,
	set_grabbed_by_chaos_spawn_network = function (grabbed_unit, is_grabbed, chaos_spawn_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_grabbed_by_chaos_spawn(status_extension, is_grabbed, chaos_spawn_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local grabber_go_id = network_manager.unit_game_object_id(network_manager, chaos_spawn_unit)

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.grabbed_by_chaos_spawn, is_grabbed, go_id, grabber_go_id)
		end

		return 
	end,
	set_grabbed_by_chaos_spawn_status_network = function (grabbed_unit, substatus)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(grabbed_unit, "status_system")

		status_extension.set_grabbed_by_chaos_spawn_status(status_extension, substatus)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, grabbed_unit)
			local substatus_id = NetworkLookup.grabbed_by_chaos_spawn[substatus]

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_int", NetworkLookup.statuses.grabbed_by_chaos_spawn, substatus_id, go_id)
		end

		return 
	end,
	set_in_vortex_network = function (affected_unit, in_vortex, vortex_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(affected_unit, "status_system")

		status_extension.set_in_vortex(status_extension, in_vortex, vortex_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, affected_unit)
			local vortex_go_id = network_manager.unit_game_object_id(network_manager, vortex_unit) or NetworkConstants.invalid_game_object_id

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.in_vortex, in_vortex, go_id, vortex_go_id)
		end

		return 
	end,
	set_near_vortex_network = function (affected_unit, near_vortex, vortex_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(affected_unit, "status_system")

		status_extension.set_near_vortex(status_extension, near_vortex, vortex_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, affected_unit)
			local vortex_go_id = network_manager.unit_game_object_id(network_manager, vortex_unit) or NetworkConstants.invalid_game_object_id

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.near_vortex, near_vortex, go_id, vortex_go_id)
		end

		return 
	end,
	set_in_liquid_network = function (affected_unit, in_liquid, in_liquid_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(affected_unit, "status_system")

		status_extension.set_in_liquid(status_extension, in_liquid, in_liquid_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, affected_unit)
			local liquid_go_id = network_manager.unit_game_object_id(network_manager, in_liquid_unit) or NetworkConstants.invalid_game_object_id

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.in_liquid, in_liquid, go_id, liquid_go_id)
		end

		return 
	end,
	set_overpowered_network = function (affected_unit, overpowered, overpowered_template_name, attacking_unit)
		fassert(Managers.player.is_server or LEVEL_EDITOR_TEST)

		local status_extension = ScriptUnit.extension(affected_unit, "status_system")

		status_extension.set_overpowered(status_extension, overpowered, overpowered_template_name, attacking_unit)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, affected_unit)
			local other_go_id = network_manager.unit_game_object_id(network_manager, attacking_unit) or NetworkConstants.invalid_game_object_id
			local status_int = (overpowered and NetworkLookup.overpowered_templates[overpowered_template_name]) or 0

			network_manager.network_transmit:send_rpc_clients("rpc_status_change_int_and_unit", NetworkLookup.statuses.overpowered, status_int, go_id, other_go_id)
		end

		return 
	end,
	set_overcharge_exploding = function (unit, exploding)
		local status_extension = ScriptUnit.extension(unit, "status_system")

		status_extension.set_overcharge_exploding(status_extension, exploding)

		if not LEVEL_EDITOR_TEST then
			local network_manager = Managers.state.network
			local go_id = network_manager.unit_game_object_id(network_manager, unit)

			if Managers.player.is_server then
				network_manager.network_transmit:send_rpc_clients("rpc_status_change_bool", NetworkLookup.statuses.overcharge_exploding, exploding, go_id, 0)
			else
				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.overcharge_exploding, exploding, go_id, 0)
			end
		end

		return 
	end,
	use_soft_collision = function (unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension.is_using_transport(status_extension) or status_extension.get_inside_transport_unit(status_extension) or status_extension.is_disabled(status_extension) or status_extension.is_knocked_down(status_extension) or status_extension.is_pounced_down(status_extension)

		return not is_disabled
	end,
	replenish_stamina_local_players = function (except_unit, fatigue_type)
		local local_players = Managers.player:players_at_peer(Network.peer_id())

		if local_players then
			for _, player in pairs(local_players) do
				local player_unit = player.player_unit

				if Unit.alive(player_unit) and player_unit ~= except_unit then
					local status_ext = ScriptUnit.extension(player_unit, "status_system")

					status_ext.add_fatigue_points(status_ext, fatigue_type)
					status_ext.set_has_bonus_fatigue_active(status_ext)
				end
			end
		end

		return 
	end
}

return 
