-- chunkname: @scripts/settings/dlcs/cog/buff_settings_cog.lua

require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.cog

settings.buff_templates = {
	bardin_engineer_pump_max_overheat_check = {
		buffs = {
			{
				duration = 2,
				max_stacks = 1,
				name = "bardin_engineer_pump_max_overheat_check",
				on_max_stacks_overflow_func = "add_remove_buffs",
				refresh_durations = true,
				max_stack_data = {
					talent_buffs = {
						bardin_engineer_overclock = {
							buffs_to_add = {
								{
									name = "bardin_engineer_pump_overclock_buff",
								},
							},
							buffs_to_add_if_missing = {
								{
									name = "bardin_engineer_pump_max_exhaustion_buff",
								},
							},
						},
					},
				},
			},
		},
	},
	bardin_engineer_pump_max_exhaustion_buff = {
		buffs = {
			{
				apply_buff_func = "bardin_engineer_animation_slow_down_add",
				debuff = true,
				duration = 5,
				icon = "bardin_engineer_pump_max_exhaustion_buff_icon",
				max_stacks = 1,
				name = "bardin_engineer_pump_max_exhaustion_buff",
				priority_buff = true,
				remove_buff_func = "bardin_engineer_animation_slow_down_remove",
				perks = {
					buff_perks.exhausted,
				},
			},
		},
	},
	bardin_engineer_pump_overclock_buff = {
		buffs = {
			{
				apply_buff_func = "bardin_engineer_overclock_damage",
				duration = 12,
				health_to_lose_per_stack = 4,
				icon = "bardin_engineer_4_2",
				max_health_loss = 10,
				max_stacks = 3,
				name = "bardin_engineer_pump_overclock_buff",
				on_max_stacks_overflow_func = "reapply_buff",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
				bonus = CareerConstants.dr_engineer.talent_4_2_crit,
				cooldown_amount = CareerConstants.dr_engineer.talent_4_2_cooldown,
			},
		},
	},
}
settings.proc_functions = {
	add_debuff_on_drakefire_hit = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local target_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[target_unit] then
			local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
			local wielded_slot_data = inventory_extension:get_wielded_slot_item_template()

			if wielded_slot_data and wielded_slot_data.weapon_type == "DRAKEFIRE" then
				local buff_system = Managers.state.entity:system("buff_system")
				local template = buff.template
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(target_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	bardin_engineer_piston_power_add = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attack_type = params[2]

			if attack_type ~= "heavy_attack" then
				return
			end

			local template = buff.template
			local buff_to_add = template.buff_to_add
			local buff_to_remove = template.buff_to_remove
			local buff_to_check = template.buff_to_check
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if buff_extension:has_buff_type(buff_to_remove) then
				local has_buff_to_remove = buff_extension:get_non_stacking_buff(buff_to_remove)

				if has_buff_to_remove then
					buff_extension:remove_buff(has_buff_to_remove.id)
				end

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
				buff_extension:add_buff(buff_to_check)

				local status_extension = ScriptUnit.extension(owner_unit, "status_system")

				status_extension:remove_all_fatigue()
			end
		end
	end,
	bardin_engineer_piston_power_sound = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local kind = params[1].charge_value

			if kind and kind == "heavy_attack" then
				local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

				first_person_extension:play_hud_sound_event("talent_power_swing")
			end
		end
	end,
	bardin_engineer_power_on_next_range = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local action = params[1]

			if action and action.ranged_attack then
				local buff_system = Managers.state.entity:system("buff_system")
				local template = buff.template
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)

				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

				buff_extension:remove_buff(buff.id)
			end
		end
	end,
}
settings.buff_function_templates = {
	bardin_engineer_animation_slow_down_add = function (unit, buff, params)
		if ALIVE[unit] then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				local first_person_unit = first_person_extension:get_first_person_unit()

				Unit.animation_event(first_person_unit, "cooldown_locked")

				local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
				local slot_data = inventory_extension:get_wielded_slot_data()

				if slot_data.id == "slot_career_skill_weapon" then
					local right_unit_1p = slot_data.right_unit_1p
					local left_unit_1p = slot_data.left_unit_1p
					local right_weapon_extension = ScriptUnit.has_extension(right_unit_1p, "weapon_system")
					local left_weapon_extension = ScriptUnit.has_extension(left_unit_1p, "weapon_system")
					local weapon_extension = right_weapon_extension or left_weapon_extension

					weapon_extension:stop_action("action_complete")
				end
			end
		end
	end,
	bardin_engineer_animation_slow_down_remove = function (unit, buff, params)
		if ALIVE[unit] then
			local first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")

			if first_person_extension then
				first_person_extension:animation_set_variable("crank_speed", 1)
			end
		end
	end,
	bardin_engineer_piston_power_add_apply = function (unit, buff, params)
		local player_unit = unit

		if ALIVE[player_unit] then
			local template = buff.template
			local buff_to_remove = template.buff_to_remove
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:add_buff(buff_to_remove)
		end
	end,
	bardin_engineer_bomb_grant = function (unit, buff, params)
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local t = Managers.time:time("game")
		local slot_name = "slot_grenade"
		local slot_data = inventory_extension:get_slot_data(slot_name)
		local can_store = inventory_extension:can_store_additional_item(slot_name)

		if slot_data and not can_store then
			buff.is_full = true

			return t
		elseif buff.is_full then
			buff.is_full = false

			local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

			if buff_ext then
				buff_ext:add_buff(buff.template.cooldown_buff)
			end

			return t + buff.template.update_frequency
		end

		local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

		if buff_ext then
			buff_ext:add_buff(buff.template.cooldown_buff)
		end

		local pick_frag

		pick_frag, buff._state = PseudoRandomDistribution.flip_coin(buff._state, 0.5)

		local frag_settings = AllPickups.frag_grenade_t1
		local fire_settings = AllPickups.fire_grenade_t1

		if fire_settings.slot_name ~= slot_name then
			fire_settings = frag_settings
		end

		if frag_settings.slot_name ~= slot_name then
			if frag_settings == fire_settings then
				return
			end

			frag_settings = fire_settings
		end

		local pickup_settings = pick_frag and frag_settings or fire_settings
		local item_name = pickup_settings.item_name
		local item_data = ItemMasterList[item_name]
		local player = Managers.player:owner(unit)

		if player and not player.remote then
			if not slot_data then
				local extra_extension_init_data = {}

				inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)

				local go_id = Managers.state.unit_storage:go_id(unit)
				local slot_id = NetworkLookup.equipment_slots[slot_name]
				local item_id = NetworkLookup.item_names[item_name]
				local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

				if go_id then
					if Managers.state.network.is_server then
						network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
					else
						network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
					end
				end
			elseif can_store then
				inventory_extension:store_additional_item(slot_name, item_data)
			end
		end
	end,
	bardin_engineer_overclock_damage = function (unit, buff, params)
		local career_extension = ScriptUnit.has_extension(unit, "career_system")

		if career_extension then
			local cooldown_amount = buff.template.cooldown_amount

			career_extension:reduce_activated_ability_cooldown_percent(cooldown_amount)
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_type = buff.template.name
		local num_overclock_stacks = buff_extension:num_buff_stacks(buff_type)
		local damage = math.clamp(num_overclock_stacks * buff.template.health_to_lose_per_stack, 0, buff.template.max_health_loss)

		DamageUtils.add_damage_network(unit, unit, damage, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, unit)
	end,
}
