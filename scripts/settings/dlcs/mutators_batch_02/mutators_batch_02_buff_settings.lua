﻿-- chunkname: @scripts/settings/dlcs/mutators_batch_02/mutators_batch_02_buff_settings.lua

local settings = DLCSettings.mutators_batch_02
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

settings.buff_templates = {
	slayer_curse_debuff = {
		buffs = {
			{
				debuff = true,
				icon = "buff_icon_mutator_icon_slayer_curse",
				name = "slayer_curse_debuff",
				perks = {
					buff_perks.slayer_curse,
				},
			},
		},
	},
	mutator_bloodlust = {
		buffs = {
			{
				duration = 4,
				icon = "bardin_slayer_crit_chance",
				max_stacks = 10,
				multiplier = 0.05,
				name = "mutator_bloodlust",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
			{
				apply_buff_func = "apply_movement_buff",
				duration = 4,
				max_stacks = 10,
				multiplier = 1.05,
				name = "mutator_bloodlust_movement",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
			{
				apply_buff_func = "apply_bloodlust",
				duration = 4,
				max_stacks = 10,
				name = "mutator_bloodlust_trigger",
				refresh_durations = true,
				remove_buff_func = "remove_bloodlust",
			},
		},
	},
	mutator_bloodlust_debuff = {
		buffs = {
			{
				apply_buff_func = "apply_bloodlust_debuff",
				damage_frequency = 1,
				damage_percentage = 0.05,
				icon = "troll_vomit_debuff",
				name = "mutator_bloodlust_debuff",
				remove_buff_func = "remove_bloodlust_debuff",
				update_func = "update_bloodlust_debuff",
			},
		},
	},
}

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

settings.buff_function_templates = {
	apply_bloodlust = function (unit, buff, params, world)
		if is_bot(unit) or not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_name = "mutator_bloodlust"
		local num_buff_stacks = buff_extension:num_buff_type(buff_name)

		if num_buff_stacks <= 1 then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local effect_id = first_person_extension:create_screen_particles("fx/screenspace_mutator_bloodlust_02")

			buff.effect_id = effect_id
		end
	end,
	remove_bloodlust = function (unit, buff, params, world)
		if is_bot(unit) or not is_local(unit) then
			return
		end

		if buff.effect_id then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:stop_spawning_screen_particles(buff.effect_id)
		end
	end,
	apply_bloodlust_debuff = function (unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		buff.next_damage_tick_t = params.t + buff.template.damage_frequency
	end,
	update_bloodlust_debuff = function (unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		local t = params.t

		if t > buff.next_damage_tick_t then
			local player_health_extension = ScriptUnit.extension(unit, "health_system")
			local max_health = player_health_extension:get_max_health()
			local current_health = player_health_extension:current_health()
			local damage = DamageUtils.networkify_damage(max_health * buff.template.damage_percentage)
			local health_left = current_health - damage

			if health_left > 0 then
				local damage_direction = -Vector3.up()

				DamageUtils.add_damage_network(unit, unit, damage, "torso", "wounded_dot", nil, damage_direction)

				buff.next_damage_tick_t = t + buff.template.damage_frequency
			end
		end
	end,
	remove_bloodlust_debuff = function (unit, buff, params, world)
		return
	end,
}
