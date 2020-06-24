InGameChallengeRewards = InGameChallengeRewards or {}
local PickupSpawnType = CreateStrictEnumTable("DropIfFull", "AlwaysDrop", "NeverDrop", "Replace")
InGameChallengeRewards.test_buff = {
	target = "party",
	type = "buff",
	buffs = {
		"twitch_speed_boost"
	}
}
InGameChallengeRewards.test_pickup = {
	pickup_type = "damage_boost_potion",
	target = "party",
	type = "pickup",
	pickup_spawn_type = PickupSpawnType.DropIfFull
}
InGameChallengeRewards.markus_questing_knight_passive_cooldown_reduction_buff = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_cooldown_reduction"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_cooldown_reduction_buff_improved = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_cooldown_reduction_improved"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_attack_speed_buff = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_attack_speed"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_attack_speed_buff_improved = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_attack_speed_improved"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_power_level_buff = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_power_level"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_power_level_buff_improved = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_power_level_improved"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_damage_taken_buff = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_damage_taken"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_damage_taken_buff_improved = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_damage_taken_improved"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_health_regen_buff = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_health_regen"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_health_regen_buff_improved = {
	server_controlled = true,
	target = "party",
	type = "buff",
	buffs = {
		"markus_questing_knight_passive_health_regen_improved"
	}
}
InGameChallengeRewards.markus_questing_knight_passive_speed_potion = {
	sound = "Play_hud_grail_knight_stamina",
	pickup_type = "speed_boost_potion",
	type = "pickup",
	icon = "icon_objective_potion",
	target = "owner",
	pickup_spawn_type = PickupSpawnType.DropIfFull
}
InGameChallengeRewards.markus_questing_knight_passive_strength_potion = {
	sound = "Play_hud_grail_knight_charge",
	pickup_type = "damage_boost_potion",
	type = "pickup",
	icon = "icon_objective_potion",
	target = "owner",
	pickup_spawn_type = PickupSpawnType.DropIfFull
}
InGameChallengeRewards.markus_questing_knight_passive_concentration_potion = {
	sound = "Play_hud_grail_knight_power",
	pickup_type = "cooldown_reduction_potion",
	type = "pickup",
	icon = "icon_objective_potion",
	target = "owner",
	pickup_spawn_type = PickupSpawnType.DropIfFull
}
local BoonReactivationRules = {
	questing_knight = function (player_unique_id)
		local status = Managers.party:get_status_from_unique_id(player_unique_id)

		if status then
			local profile_index = status.profile_index
			local career_index = status.career_index
			local profile = SPProfiles[profile_index]
			local career_settings = profile and profile.careers[career_index]

			return career_settings and career_settings == CareerSettings.es_questingknight
		end

		return false
	end
}
InGameChallengeRewards.test_boon = {
	reward_id = "test_pickup",
	type = "boon",
	consume_type = "venture",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_cooldown_reduction = {
	reward_id = "markus_questing_knight_passive_cooldown_reduction_buff",
	sound = "Play_hud_grail_knight_stamina",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_cdr",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_cooldown_reduction_improved = {
	reward_id = "markus_questing_knight_passive_cooldown_reduction_buff_improved",
	sound = "Play_hud_grail_knight_stamina",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_cdr",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_attack_speed = {
	reward_id = "markus_questing_knight_passive_attack_speed_buff",
	sound = "Play_hud_grail_knight_attack",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_attack_speed",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_attack_speed_improved = {
	reward_id = "markus_questing_knight_passive_attack_speed_buff_improved",
	sound = "Play_hud_grail_knight_attack",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_attack_speed",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_power_level = {
	reward_id = "markus_questing_knight_passive_power_level_buff",
	sound = "Play_hud_grail_knight_power",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_power_level",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_power_level_improved = {
	reward_id = "markus_questing_knight_passive_power_level_buff_improved",
	sound = "Play_hud_grail_knight_power",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_power_level",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_damage_taken = {
	reward_id = "markus_questing_knight_passive_damage_taken_buff",
	sound = "Play_hud_grail_knight_tank",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_damage_taken",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_damage_taken_improved = {
	reward_id = "markus_questing_knight_passive_damage_taken_buff_improved",
	sound = "Play_hud_grail_knight_tank",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_damage_taken",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_health_regen = {
	reward_id = "markus_questing_knight_passive_health_regen_buff",
	sound = "Play_hud_grail_knight_heal",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_health_regen",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}
InGameChallengeRewards.markus_questing_knight_passive_health_regen_improved = {
	reward_id = "markus_questing_knight_passive_health_regen_buff_improved",
	sound = "Play_hud_grail_knight_heal",
	type = "boon",
	consume_type = "venture",
	icon = "icon_objective_health_regen",
	target = "party",
	consume_value = 1,
	reactivation_rule = BoonReactivationRules.questing_knight
}

local function copy_buff_values(name, value_type)
	InGameChallengeRewards[name].description_values = {
		{
			value_type = "percent",
			value_fmt = "%+d%%",
			value = BuffTemplates[name].buffs[1].multiplier
		}
	}
	local name_improved = name .. "_improved"
	InGameChallengeRewards[name_improved].description_values = {
		{
			value_type = "percent",
			value_fmt = "%+d%%",
			value = BuffTemplates[name_improved].buffs[1].multiplier
		}
	}
end

copy_buff_values("markus_questing_knight_passive_cooldown_reduction")
copy_buff_values("markus_questing_knight_passive_attack_speed")
copy_buff_values("markus_questing_knight_passive_power_level")
copy_buff_values("markus_questing_knight_passive_damage_taken")

InGameChallengeRewardTypes = {
	buff = function (reward_data, target_units, reward_instigator)
		local buff_system = Managers.state.entity:system("buff_system")
		local buffs = reward_data.buffs
		local server_controlled = reward_data.server_controlled
		local return_data = {}

		for i = 1, #target_units, 1 do
			local unit = target_units[i]

			if unit and Unit.alive(unit) then
				local server_buff_ids = {}

				for buff_id = 1, #buffs, 1 do
					server_buff_ids[buff_id] = buff_system:add_buff(unit, buffs[buff_id], unit, server_controlled)
				end

				return_data[unit] = server_buff_ids
			end
		end

		return return_data
	end,
	pickup = function (reward_data, target_units, reward_instigator)
		local pickup_type = reward_data.pickup_type
		local network_transmit = Managers.state.network.network_transmit
		local pickup_system = Managers.state.entity:system("pickup_system")

		for i = 1, #target_units, 1 do
			local unit = target_units[i]

			if unit and Unit.alive(unit) then
				local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
				local pickup_settings = AllPickups[pickup_type]
				local slot_name = pickup_settings.slot_name
				local item_name = pickup_settings.item_name
				local slot_data = inventory_extension:get_slot_data(slot_name)

				if reward_data.pickup_spawn_type ~= PickupSpawnType.Replace and (slot_data or reward_data.pickup_spawn_type == PickupSpawnType.AlwaysDrop) then
					if reward_data.pickup_spawn_type ~= PickupSpawnType.NeverDrop then
						local position = POSITION_LOOKUP[unit]

						pickup_system:buff_spawn_pickup(pickup_type, position, true)
					end
				else
					local go_id = Managers.state.unit_storage:go_id(unit)
					local slot_id = NetworkLookup.equipment_slots[slot_name]
					local item_id = NetworkLookup.item_names[item_name]
					local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]
					local player = Managers.player:owner(unit)
					local is_remote = player and player.remote

					if is_remote then
						network_transmit:send_rpc("rpc_add_inventory_slot_item", player.peer_id, go_id, slot_id, item_id, weapon_skin_id)
					else
						network_transmit:queue_local_rpc("rpc_add_inventory_slot_item", go_id, slot_id, item_id, weapon_skin_id)
					end
				end
			end
		end
	end,
	boon = function (reward_data, target_units, reward_instigator)
		local owner = Managers.player:player_from_unique_id(reward_instigator)

		if owner then
			Managers.boon:add_boon(reward_instigator, reward_data.reward_id, reward_data.consume_type, reward_data.consume_value, reward_data.reactivation_rule)
		end
	end
}
InGameChallengeRewardRevokeTypes = {
	buff = function (reward_data, target_units, reward_instigator, additional_data)
		if not reward_data.server_controlled then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, #target_units, 1 do
			local unit = target_units[i]
			local server_buff_ids = additional_data[unit]

			if unit and Unit.alive(unit) and server_buff_ids then
				for buff_idx = 1, #server_buff_ids, 1 do
					buff_system:remove_server_controlled_buff(unit, server_buff_ids[buff_idx])
				end
			end
		end
	end
}
local empty_table = {}
InGameChallengeRewardTargets = {
	owner = function (owner_unique_id)
		local owner = Managers.player:player_from_unique_id(owner_unique_id)

		if owner then
			return {
				owner.player_unit
			}
		end

		return empty_table
	end,
	party = function (owner_unique_id)
		local party_manager = Managers.party
		local status = party_manager:get_status_from_unique_id(owner_unique_id)
		local party_members = status and party_manager:get_players_in_party(status.party_id)

		if party_members then
			local targets = {}
			local target_idx = 0

			for i = 1, #party_members, 1 do
				local player = party_members[i].player
				local unit = player and player.player_unit

				if unit then
					target_idx = target_idx + 1
					targets[target_idx] = unit
				end
			end

			return targets
		end

		return empty_table
	end
}

return
