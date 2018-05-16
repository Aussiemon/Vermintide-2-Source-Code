local player_and_bot_units = PLAYER_AND_BOT_UNITS
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
				data.buff_id = buff_extension:add_buff("damage_volume_generic_dot", params)
			end,
			on_exit = function (unit, data)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				buff_extension:remove_buff(data.buff_id)

				data.buff_id = nil
			end
		},
		generic_insta_kill = {
			on_enter = function (unit, dt, t, data)
				local health_extension = ScriptUnit.extension(unit, "health_system")

				health_extension:die("volume_insta_kill")
			end
		},
		catacombs_corpse_pit = {
			on_enter = function (unit, dt, t, data)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local params = {
					t = t,
					attacker_unit = unit
				}
				data.buff_id = buff_extension:add_buff("catacombs_corpse_pit", params)
			end,
			on_exit = function (unit, data)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")

				buff_extension:remove_buff(data.buff_id)

				data.buff_id = nil
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

					RPC.rpc_set_current_location(player.peer_id, unit_id, location_id)
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
			end,
			on_exit = function (unit, data)
				local event = data.params.event_on_exit
				local should_trigger_exit_event = data.all_players_inside

				if event and should_trigger_exit_event then
					Level.trigger_event(data.level, event)

					data.all_players_inside = false
				end
			end
		},
		ai_inside = {
			on_enter = function (unit, dt, t, data)
				local event = data.params.event_on_triggered

				if event then
					Level.trigger_event(data.level, event)
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
			end,
			on_exit = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_exit

					if event then
						Level.trigger_event(data.level, event)
					end

					data.params.player_entered = false
				end
			end,
			on_destroy = function (unit, data)
				local volume_system = Managers.state.entity:system("volume_system")

				if not volume_system:volume_has_units_inside(data.volume_name) then
					local event = data.params.event_on_exit

					if event then
						Level.trigger_event(data.level, event)
					end

					data.params.player_entered = false
				end
			end
		}
	},
	despawn_volume = {
		pickup_projectiles = {
			on_enter = function (unit, dt, t, data)
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		}
	}
}
GenericVolumeTemplates.functions.damage_volume.warpstone_meteor = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.cemetery_plague_floor = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.ai_insta_kill = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.player_insta_kill = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.generic_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.ai_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.player_insta_kill_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_insta_kill
GenericVolumeTemplates.functions.damage_volume.ai_kill_dot = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.ai_kill_dot_no_cost = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.functions.damage_volume.skaven_molten_steel = GenericVolumeTemplates.functions.damage_volume.generic_dot
GenericVolumeTemplates.filters = {
	unit_disabled = function (unit)
		local status_extension = ScriptUnit.extension(unit, "status_system")

		return status_extension:is_disabled()
	end,
	all_players_inside = function (unit, volume_name)
		local status_extension = ScriptUnit.extension(unit, "status_system")

		if status_extension:is_disabled() then
			return
		end

		local volume_system = Managers.state.entity:system("volume_system")

		return volume_system:all_human_players_inside(volume_name)
	end
}

return
