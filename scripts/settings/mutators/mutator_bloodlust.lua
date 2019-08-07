return {
	description = "description_mutator_bloodlust",
	display_name = "display_name_mutator_bloodlust",
	debuff_start_time = 4.25,
	icon = "mutator_icon_bloodlust",
	amount_of_stacks_per_breed = {
		chaos_vortex_sorcerer = 2,
		skaven_plague_monk = 3,
		chaos_berzerker = 3,
		skaven_ratling_gunner = 2,
		skaven_poison_wind_globadier = 2,
		skaven_warpfire_thrower = 2,
		chaos_raider = 3,
		skaven_gutter_runner = 2,
		skaven_loot_rat = 2,
		skaven_pack_master = 2,
		skaven_stormfiend = 10,
		chaos_warrior = 5,
		skaven_rat_ogre = 10,
		chaos_troll = 10,
		chaos_spawn = 10,
		chaos_corruptor_sorcerer = 2,
		skaven_storm_vermin_commander = 3,
		skaven_storm_vermin = 3,
		skaven_storm_vermin_with_shield = 3
	},
	add_buff = function (buff_system, player_unit, buff_name)
		buff_system:add_buff(player_unit, buff_name, player_unit)
	end,
	add_debuff = function (buffs, buff_system, player_unit, buff_name)
		local is_server_controlled = true
		local server_buff_id = buff_system:add_buff(player_unit, buff_name, player_unit, is_server_controlled)
		buffs[#buffs + 1] = server_buff_id
	end,
	remove_buff = function (buffs, buff_system, player_unit)
		local num_buffs = #buffs
		local server_buff_id = buffs[num_buffs]

		buff_system:remove_server_controlled_buff(player_unit, server_buff_id)

		buffs[num_buffs] = nil
	end,
	server_start_function = function (context, data)
		data.player_units = {}
		data.buff_system = Managers.state.entity:system("buff_system")
		data.player_manager = Managers.player
		data.buff_name = "mutator_bloodlust"
		data.debuff_name = "mutator_bloodlust_debuff"
	end,
	server_update_function = function (context, data)
		local t = Managers.time:time("game")
		local template = data.template
		local player_units = data.player_units

		for unit, unit_data in pairs(player_units) do
			if not Unit.alive(unit) then
				player_units[unit] = nil
			elseif AiUtils.unit_knocked_down(unit) then
				local buffs = unit_data.buffs
				local num_buffs = #buffs

				for i = 1, num_buffs, 1 do
					template.remove_buff(buffs, data.buff_system, unit)
				end

				player_units[unit] = nil
			elseif unit_data.add_debuff_at_t <= t then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local has_debuff = buff_extension:has_buff_type(data.debuff_name)

				if not has_debuff then
					local buffs = unit_data.buffs

					template.add_debuff(buffs, data.buff_system, unit, data.debuff_name)
				end
			end
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit)
		if not data.player_manager:is_player_unit(killer_unit) then
			return
		end

		local player = Managers.player:owner(killer_unit)
		local is_bot = player and not player:is_player_controlled()

		if is_bot then
			return
		end

		local buff_extension = ScriptUnit.extension(killer_unit, "buff_system")
		local has_debuff = buff_extension:has_buff_type(data.debuff_name)
		local template = data.template

		if has_debuff then
			template.remove_buff(data.player_units[killer_unit].buffs, data.buff_system, killer_unit, data.debuff_name)
		end

		local player_units = data.player_units

		if not player_units[killer_unit] then
			player_units[killer_unit] = {
				buffs = {}
			}
		end

		local breed_name = BLACKBOARDS[killed_unit].breed.name
		local unit_data = player_units[killer_unit]
		local amount_of_stacks = template.amount_of_stacks_per_breed[breed_name] or 1

		for i = 1, amount_of_stacks, 1 do
			template.add_buff(data.buff_system, killer_unit, data.buff_name)
		end

		unit_data.add_debuff_at_t = Managers.time:time("game") + template.debuff_start_time
	end
}
