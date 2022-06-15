VolumeFilters = VolumeFilters or {}
GenericVolumeTemplates = GenericVolumeTemplates or {}
GenericVolumeTemplates.functions = {
	damage_volume = {
		generic_dot = {
			on_enter = function (unit, dt, t, data)
				local params = {
					t = t,
					attacker_unit = unit,
					external_optional_bonus = {
						damage = data.settings.damage,
						time_between_damage = data.settings.time_between_damage
					}
				}
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				data[unit] = buff_extension:add_buff("damage_volume_generic_dot", params)
			end,
			on_exit = function (unit, data)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				buff_extension:remove_buff(data[unit])

				data[unit] = nil
			end
		},
		generic_insta_kill = {
			on_enter = function (unit, dt, t, data)
				local health_extension = ScriptUnit.extension(unit, "health_system")

				health_extension:entered_kill_volume(t)
			end
		},
		heroes_insta_kill = {
			on_enter = function (unit, dt, t, data)
				if Managers.state.side:versus_is_hero(unit) then
					local health_extension = ScriptUnit.extension(unit, "health_system")

					health_extension:entered_kill_volume(t)
				end
			end
		},
		dark_pact_insta_kill = {
			on_enter = function (unit, dt, t, data)
				if Managers.state.side:versus_is_dark_pact(unit) then
					local health_extension = ScriptUnit.extension(unit, "health_system")

					health_extension:entered_kill_volume(t)
				end
			end
		},
		catacombs_corpse_pit = {
			on_enter = function (unit, dt, t, data)
				local buff_system = Managers.state.entity:system("buff_system")
				local is_server_controlled = true
				data[unit] = buff_system:add_buff(unit, "catacombs_corpse_pit", unit, is_server_controlled)
			end,
			on_exit = function (unit, data)
				local buff_id = data[unit]

				if buff_id == nil then
					return
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:remove_server_controlled_buff(unit, buff_id)

				data[unit] = nil
			end
		},
		cemetery_plague_floor = {
			on_enter = function (unit, dt, t, data)
				local buff_system = Managers.state.entity:system("buff_system")
				local is_server_controlled = true
				data[unit] = buff_system:add_buff(unit, "cemetery_plague_floor", unit, is_server_controlled)
			end,
			on_exit = function (unit, data)
				local buff_id = data[unit]

				if buff_id == nil then
					return
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:remove_server_controlled_buff(unit, buff_id)

				data[unit] = nil
			end
		}
	},
	movement_volume = {
		generic_slowdown = {
			on_enter = function (unit, dt, t, data)
				local buff_system = Managers.state.entity:system("buff_system")
				local multiplier = data.settings.speed_multiplier

				buff_system:add_volume_buff_multiplier(unit, "movement_volume_generic_slowdown", multiplier)
			end,
			on_exit = function (unit, data)
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:remove_volume_buff_multiplier(unit, "movement_volume_generic_slowdown")
			end
		}
	},
	location_volume = {
		area_indication = {
			on_enter = function (unit, dt, t, data)
				local player = Managers.player:owner(unit)
				local location = data.params.location

				if player.local_player then
					local hud_extension = ScriptUnit.extension(unit, "hud_system")

					hud_extension:set_current_location(location)
				elseif player.remote then
					local unit_id = Managers.state.unit_storage:go_id(unit)
					local location_id = NetworkLookup.locations[location]
					local channel_id = PEER_ID_TO_CHANNEL[player.peer_id]

					RPC.rpc_set_current_location(channel_id, unit_id, location_id)
				end
			end
		}
	},
	trigger_volume = {
		all_alive_humans_outside = {
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_triggered

					if event then
						Level.trigger_event(data.level, event)
					end

					local on_triggered = data.params.on_triggered

					if on_triggered then
						on_triggered()
					end
				end
			end
		},
		all_alive_players_outside = {
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_triggered

					if event then
						Level.trigger_event(data.level, event)
					end

					local on_triggered = data.params.on_triggered

					if on_triggered then
						on_triggered()
					end
				end
			end
		},
		all_alive_players_outside_no_alive_inside = {
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_triggered

					if event then
						Level.trigger_event(data.level, event)
					end

					local on_triggered = data.params.on_triggered

					if on_triggered then
						on_triggered()
					end
				end
			end
		},
		all_alive_players_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered
				local should_trigger_enter_event = not data.all_players_inside

				if event and should_trigger_enter_event then
					Level.trigger_event(data.level, event)

					data.all_players_inside = true
				end

				local on_triggered = data.params.on_triggered

				if should_trigger_enter_event and on_triggered then
					on_triggered()
				end
			end,
			on_exit = function (unit, data)
				local event = data.params.event_on_exit
				local should_trigger_exit_event = data.all_players_inside

				if event and should_trigger_exit_event then
					Level.trigger_event(data.level, event)

					data.all_players_inside = false
				end

				local on_exit = data.params.callback_on_exit

				if should_trigger_exit_event and on_exit then
					on_exit()
				end
			end
		},
		all_non_disabled_players_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered
				local should_trigger_enter_event = not data.all_players_inside

				if event and should_trigger_enter_event then
					Level.trigger_event(data.level, event)

					data.all_players_inside = true
				end

				local on_triggered = data.params.on_triggered

				if should_trigger_enter_event and on_triggered then
					on_triggered()
				end
			end,
			on_exit = function (unit, data)
				local event = data.params.event_on_exit
				local should_trigger_exit_event = data.all_players_inside

				if event and should_trigger_exit_event then
					Level.trigger_event(data.level, event)

					data.all_players_inside = false
				end

				local on_exit = data.params.on_exit

				if should_trigger_exit_event and on_exit then
					on_exit()
				end
			end
		},
		non_disabled_players_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered
				local should_trigger_enter_event = not data.params.player_entered

				if event and should_trigger_enter_event then
					Level.trigger_event(data.level, event)

					data.params.player_entered = true
				end

				local on_triggered = data.params.on_triggered

				if should_trigger_enter_event and on_triggered then
					on_triggered()
				end
			end,
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_exit

					if event then
						Level.trigger_event(data.level, event)
					end

					local on_exit = data.params.on_exit

					if on_exit then
						on_exit()
					end

					data.params.player_entered = false
				end
			end
		},
		ai_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered

				if event then
					Level.trigger_event(data.level, event)
				end

				local on_triggered = data.params.on_triggered

				if on_triggered then
					on_triggered()
				end
			end
		},
		players_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered
				local should_trigger_enter_event = not data.params.player_entered

				if event and should_trigger_enter_event then
					Level.trigger_event(data.level, event)

					data.params.player_entered = true
				end

				local on_triggered = data.params.on_triggered

				if should_trigger_enter_event and on_triggered then
					on_triggered()
				end
			end,
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_exit

					if event then
						Level.trigger_event(data.level, event)
					end

					data.params.player_entered = false
					local on_exit = data.params.on_exit

					if on_exit then
						on_exit()
					end
				end
			end
		}
	},
	despawn_volume = {
		pickup_projectiles = {
			on_enter = function (unit, dt, t, data)
				local kill_volume_handler_extension = ScriptUnit.has_extension(unit, "kill_volume_handler_system")

				if kill_volume_handler_extension and kill_volume_handler_extension:on_hit_kill_volume() then
					return
				end

				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		}
	}
}
GenericVolumeTemplates.functions.damage_volume.warpstone_meteor = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.generic_fire = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.ai_insta_kill = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.player_insta_kill = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.generic_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.ai_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.player_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.pactsworn_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.dark_pact_insta_kill
GenericVolumeTemplates.functions.damage_volume.heroes_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.heroes_insta_kill
GenericVolumeTemplates.functions.damage_volume.ai_kill_dot = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.ai_kill_dot_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.skaven_molten_steel = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.filters = {
	unit_not_disabled = function (unit, data)
		local status_extension = ScriptUnit.extension(unit, "status_system")

		return not status_extension:is_disabled()
	end,
	unit_not_disabled_outside_or_disabled_inside_and_not_all_disabled_inside = function (unit, data)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local is_disabled = status_extension:is_disabled()
		local volume_system = Managers.state.entity:system("volume_system")
		local is_inside = volume_system:player_inside(data.volume_name, unit)
		local all_inside_disabled = volume_system:all_human_players_inside_disabled(data.volume_name)
		local is_inside_and_disabled = is_disabled and is_inside
		local is_outside_and_not_disabled = not is_inside and not is_disabled
		local result = (not is_inside_and_disabled and not is_outside_and_not_disabled) or not not all_inside_disabled

		return result
	end,
	all_alive_players_inside = function (unit, data)
		local volume_system = Managers.state.entity:system("volume_system")

		return volume_system:all_alive_or_respawned_human_players_inside(data.volume_name)
	end,
	all_non_disabled_players_inside = function (unit, data)
		local volume_system = Managers.state.entity:system("volume_system")

		return volume_system:all_alive_human_players_inside(data.volume_name)
	end
}

return
