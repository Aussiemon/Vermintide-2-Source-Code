-- chunkname: @scripts/settings/dlcs/lake/buff_settings_lake.lua

local settings = DLCSettings.lake
local buff_params = {}

settings.buff_templates = {
	markus_questing_knight_passive_cooldown_reduction = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_cdr",
				max_stacks = 1,
				multiplier = 0.1,
				name = "markus_questing_knight_passive_cooldown_reduction",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	markus_questing_knight_passive_cooldown_reduction_improved = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_cdr",
				max_stacks = 1,
				multiplier = 0.15,
				name = "markus_questing_knight_passive_cooldown_reduction_improved",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	markus_questing_knight_passive_attack_speed = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_attackspeed",
				max_stacks = 1,
				multiplier = 0.05,
				name = "markus_questing_knight_passive_attack_speed",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_questing_knight_passive_attack_speed_improved = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_attackspeed",
				max_stacks = 1,
				multiplier = 0.075,
				name = "markus_questing_knight_passive_attack_speed_improved",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_questing_knight_passive_power_level = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_powerlevel",
				max_stacks = 1,
				multiplier = 0.1,
				name = "markus_questing_knight_passive_power_level",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_questing_knight_passive_power_level_improved = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_powerlevel",
				max_stacks = 1,
				multiplier = 0.15,
				name = "markus_questing_knight_passive_power_level_improved",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_questing_knight_passive_damage_taken = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_damage_taken",
				max_stacks = 1,
				multiplier = -0.1,
				name = "markus_questing_knight_passive_damage_taken",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_questing_knight_passive_damage_taken_improved = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_damage_taken",
				max_stacks = 1,
				multiplier = -0.15,
				name = "markus_questing_knight_passive_damage_taken_improved",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_questing_knight_passive_health_regen = {
		buffs = {
			{
				apply_buff_func = "health_regen_start",
				heal = 1,
				heal_type = "career_passive",
				icon = "markus_questing_knight_buff_health_regen",
				max_stacks = 1,
				name = "markus_questing_knight_passive_health_regen",
				priority_buff = true,
				time_between_heal = 5,
				update_func = "health_regen_update",
			},
		},
	},
	markus_questing_knight_passive_health_regen_improved = {
		buffs = {
			{
				apply_buff_func = "health_regen_start",
				heal = 1,
				heal_type = "career_passive",
				icon = "markus_questing_knight_buff_health_regen",
				max_stacks = 1,
				name = "markus_questing_knight_passive_health_regen_improved",
				time_between_heal = 2.5,
				update_func = "health_regen_update",
			},
		},
	},
}
settings.proc_functions = {
	markus_questing_knight_spread_temp_health = function (owner_unit, buff, params)
		local healer_unit = params[1]
		local heal_type = params[3]
		local healed_self = healer_unit == owner_unit
		local temp_health_gain = heal_type == "heal_from_proc"

		if ALIVE[owner_unit] and Managers.player.is_server and healed_self and temp_health_gain then
			local buff_template = buff.template
			local range = buff_template.range
			local range_squared = range * range
			local healer_position = POSITION_LOOKUP[healer_unit]
			local side = Managers.state.side.side_by_unit[owner_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local closest_ally, closest_distance = nil, 500

			for i = 1, #player_and_bot_units do
				local allied_unit = player_and_bot_units[i]

				if allied_unit ~= healer_unit and Unit.alive(allied_unit) then
					local unit_position = POSITION_LOOKUP[allied_unit]
					local distance_squared = Vector3.distance_squared(healer_position, unit_position)

					if distance_squared < range_squared and distance_squared < closest_distance then
						closest_ally = allied_unit
						closest_distance = distance_squared
					end
				end
			end

			if closest_ally then
				local healed_unit = closest_ally
				local heal_amount = params[2]
				local multiplier = buff_template.multiplier

				heal_amount = heal_amount * multiplier

				local heal_type = "heal_from_proc"

				DamageUtils.heal_network(healed_unit, owner_unit, heal_amount, heal_type)
			end
		end
	end,
	add_heal_percent_of_damage_taken_over_time_buff = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local attacker_unit = params[1]
			local damage_amount = params[2]
			local breed = AiUtils.unit_breed(attacker_unit)

			if breed and not breed.is_hero then
				local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")

				if health_extension and damage_amount < health_extension:current_health() then
					local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
					local buff_template = buff.template
					local heal_amount = buff_template.heal_amount_fraction * damage_amount
					local buff_to_add = buff_template.buff_to_add

					table.clear(buff_params)

					buff_params.external_optional_bonus = heal_amount

					buff_extension:add_buff(buff_to_add, buff_params)
				end
			end
		end
	end,
	check_for_instantly_killing_crit = function (owner_unit, buff, params, world, param_order)
		if not Managers.player.is_server then
			return
		end

		local hit_unit = params[param_order.attacked_unit]
		local damage_amount = params[param_order.damage_amount]
		local is_critical_strike = params[param_order.is_critical_strike]
		local modifables_params = params[param_order.PROC_MODIFIABLE]

		if is_critical_strike and ALIVE[owner_unit] and ALIVE[hit_unit] then
			local enemy_health_extension = ScriptUnit.extension(hit_unit, "health_system")
			local buff_template = buff.template
			local breed = Unit.get_data(hit_unit, "breed")
			local boss = breed and breed.boss
			local damage_multiplier = buff_template.damage_multiplier

			if boss then
				damage_multiplier = buff_template.boss_damage_multiplier
			end

			local modified_damage_check = damage_amount * damage_multiplier
			local proc_chance = buff_template.proc_chance
			local target_health = enemy_health_extension:current_health()

			if target_health <= modified_damage_check then
				local roll = math.random()
				local kill_target = roll < proc_chance

				if kill_target then
					modifables_params.damage_amount = target_health
				end
			end
		end
	end,
	markus_questing_knight_boss_kill_func = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
			local increased_duration_talent = talent_extension:has_talent("markus_questing_knight_passive_longer_duration", "empire_soldier", true)
			local buff_to_add

			buff_to_add = increased_duration_talent and "markus_questing_knight_passive_boss_kill_buff_increased_duration" or "markus_questing_knight_passive_boss_kill_buff"

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff(buff_to_add)

			local parent_buff = buff_extension:get_non_stacking_buff("markus_questing_knight_passive_boss_kill")

			if parent_buff then
				buff_extension:remove_buff(parent_buff.id)
			end
		end
	end,
	markus_questing_knight_ability_kill_buff_func = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local killing_blow_table = params[1]
			local killing_blow_damage_source = killing_blow_table[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if killing_blow_table and killing_blow_damage_source == "markus_questingknight_career_skill_weapon" then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local buff_template = buff.template
				local buff_to_add = buff_template.buff_to_add

				if buff_extension then
					buff_extension:add_buff(buff_to_add)
				end
			end
		end
	end,
}
settings.buff_function_templates = {
	update_markus_questing_knight_passive_aura = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
		local super_buff_talent = talent_extension:has_talent("markus_questing_knight_passive_longer_duration", "empire_soldier", true)
		local tank_buff_talent = talent_extension:has_talent("markus_questing_knight_passive_tanking_improved", "empire_soldier", true)
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_list = {
			{
				apply_to_party = true,
				apply_to_self = false,
				buff_to_add = "markus_questing_knight_boss_aura_party",
				apply = buff_extension:has_buff_perk("boss_aura"),
			},
			{
				apply_to_party = true,
				apply_to_self = false,
				buff_to_add = "markus_questing_knight_specials_aura_party",
				apply = buff_extension:has_buff_perk("specials_aura"),
			},
			{
				apply_to_party = true,
				apply_to_self = false,
				buff_to_add = "markus_questing_knight_elites_aura_party",
				apply = buff_extension:has_buff_perk("elites_aura"),
			},
			{
				apply_to_party = true,
				apply_to_self = true,
				buff_to_add = "markus_questing_knight_super_aura_party",
				apply = super_buff_talent and buff_extension:has_buff_perk("boss_aura") and buff_extension:has_buff_perk("specials_aura") and buff_extension:has_buff_perk("elites_aura"),
			},
			{
				apply_to_party = false,
				apply_to_self = true,
				buff_to_add = "markus_questing_knight_passive_tank_buff",
				apply = tank_buff_talent and (buff_extension:has_buff_perk("boss_aura") or buff_extension:has_buff_perk("specials_aura") or buff_extension:has_buff_perk("elites_aura")),
			},
		}
		local num_buffs = #buff_list

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) then
				for b = 1, num_buffs do
					local current_buff = buff_list[b]
					local apply = current_buff.apply and (unit == owner_unit and current_buff.apply_to_self or unit ~= owner_unit and current_buff.apply_to_party)
					local buff_to_add = current_buff.buff_to_add
					local unit_position = POSITION_LOOKUP[unit]
					local distance_squared = Vector3.distance_squared(owner_position, unit_position)
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					if range_squared < distance_squared or not apply then
						local buff = buff_extension:get_non_stacking_buff(buff_to_add)

						if buff then
							local buff_id = buff.server_id

							if buff_id then
								buff_system:remove_server_controlled_buff(unit, buff_id)
							end
						end
					end

					if distance_squared < range_squared and apply and not buff_extension:has_buff_type(buff_to_add) then
						local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
						local buff = buff_extension:get_non_stacking_buff(buff_to_add)

						if buff then
							buff.server_id = server_buff_id
						end
					end
				end
			end
		end

		if Unit.alive(owner_unit) then
			local avatar_talent = talent_extension:has_talent("markus_questing_knight_passive_convert_to_avatar_buff", "empire_soldier", true)

			if not avatar_talent then
				return
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local all_buffs_active = buff_extension:has_buff_perk("boss_aura") and buff_extension:has_buff_perk("specials_aura") and buff_extension:has_buff_perk("elites_aura")

			if all_buffs_active then
				local boss_buff = buff_extension:get_non_stacking_buff("markus_questing_knight_passive_boss_kill_buff")
				local specials_buff = buff_extension:get_non_stacking_buff("markus_questing_knight_passive_special_kill_buff")
				local elite_buff = buff_extension:get_non_stacking_buff("markus_questing_knight_passive_elite_kill_buff")

				buff_extension:remove_buff(boss_buff.id)
				buff_extension:remove_buff(specials_buff.id)
				buff_extension:remove_buff(elite_buff.id)
				buff_extension:add_buff("markus_questing_knight_passive_avatar_buff_crit")
				buff_extension:add_buff("markus_questing_knight_passive_avatar_buff_attack_speed")
			end
		end
	end,
	refund_damage_taken = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[unit] then
			local heal_amount = buff.bonus

			DamageUtils.heal_network(unit, unit, heal_amount, "heal_from_proc")
		end
	end,
}
