-- chunkname: @scripts/settings/dlcs/belakor/belakor_death_reactions.lua

local death_reactions = {
	tiny_explosive_barrel = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local attacker_unit = killing_blow[DamageDataIndex.ATTACKER]
				local data = {
					explode_time = explode_time,
					killer_unit = attacker_unit,
				}
				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local damage_data = health_extension.last_damage_data
				local attacker_unique_id = damage_data.attacker_unique_id
				local attacker_player = Managers.player:player_from_unique_id(attacker_unique_id)
				local stats_id = attacker_player and attacker_player:stats_id()

				Managers.state.achievement:trigger_event("explosive_barrel_destroyed", stats_id, unit, killing_blow)

				local death_extension = ScriptUnit.extension(unit, "death_system")

				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand then
						if not health_extension.thrown then
							local position = POSITION_LOOKUP[unit]
							local rotation = Unit.local_rotation(unit, 0)
							local explosion_template = "tiny_explosive_barrel"
							local item_name = health_extension.item_name
							local owner_unit = health_extension.owner_unit

							Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name, nil, false)

							local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
							local equipment = inventory_extension:equipment()
							local slot_name = equipment.wielded_slot

							inventory_extension:destroy_slot(slot_name)
							inventory_extension:wield_previous_weapon()
						end
					else
						local position = POSITION_LOOKUP[unit]
						local rotation = Unit.local_rotation(unit, 0)
						local explosion_template = "tiny_explosive_barrel"
						local item_name = health_extension.item_name
						local last_damage_data = health_extension.last_damage_data
						local network_manager = Managers.state.network
						local last_attacker_unit = network_manager:game_object_or_level_unit(last_damage_data.attacker_unit_id, false) or unit

						Managers.state.entity:system("area_damage_system"):create_explosion(last_attacker_unit, position, rotation, explosion_template, 1, item_name, nil, false)

						if last_attacker_unit then
							local buff_extension = ScriptUnit.has_extension(last_attacker_unit, "buff_system")

							if buff_extension then
								buff_extension:trigger_procs("on_barrel_exploded", position, rotation, item_name, unit)
							end
						end
					end

					data.exploded = true
				elseif network_time >= data.explode_time + 0.5 then
					Managers.state.unit_spawner:mark_for_deletion(unit)

					return DeathReactions.IS_DONE
				end
			end,
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local network_time = Managers.state.network:network_time()
				local explode_time = network_time
				local data = {
					explode_time = explode_time,
					killer_unit = killing_blow[DamageDataIndex.ATTACKER],
				}
				local health_extension = ScriptUnit.has_extension(unit, "health_system")
				local damage_data = health_extension.last_damage_data
				local attacker_unique_id = damage_data.attacker_unique_id
				local attacker_player = Managers.player:player_from_unique_id(attacker_unique_id)
				local stats_id = attacker_player and attacker_player:stats_id()

				Managers.state.achievement:trigger_event("explosive_barrel_destroyed", stats_id, unit, killing_blow)

				local death_extension = ScriptUnit.extension(unit, "death_system")

				death_extension.death_has_started = true

				return data, DeathReactions.IS_NOT_DONE
			end,
			update = function (unit, dt, context, t, data)
				local network_time = Managers.state.network:network_time()

				if not data.exploded then
					Unit.flow_event(unit, "exploding_barrel_detonate")
					Unit.set_unit_visibility(unit, false)

					local health_extension = ScriptUnit.extension(unit, "health_system")

					if health_extension.in_hand and not health_extension.thrown then
						local position = POSITION_LOOKUP[unit]
						local rotation = Unit.local_rotation(unit, 0)
						local explosion_template = "tiny_explosive_barrel"
						local item_name = health_extension.item_name
						local owner_unit = health_extension.owner_unit

						Managers.state.entity:system("area_damage_system"):create_explosion(owner_unit, position, rotation, explosion_template, 1, item_name, nil, false)

						local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
						local equipment = inventory_extension:equipment()
						local slot_name = equipment.wielded_slot

						inventory_extension:destroy_slot(slot_name)
						inventory_extension:wield_previous_weapon()
					end

					data.exploded = true
				elseif network_time >= data.explode_time + 0.5 then
					return DeathReactions.IS_DONE
				end
			end,
		},
	},
}

return death_reactions
