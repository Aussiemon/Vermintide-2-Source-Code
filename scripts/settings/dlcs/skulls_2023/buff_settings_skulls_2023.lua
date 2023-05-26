local settings = DLCSettings.skulls_2023
local BUFF_DURATION = 20
local MAX_STACKS = 5
local BUFF_REFRESH_STACKS = 5
local buff_order = {
	"skulls_2023_buff_power_level",
	"skulls_2023_buff_attack_speed",
	"skulls_2023_buff_crit_chance",
	"skulls_2023_buff_movement_speed",
	"skulls_2023_buff_cooldown_regen"
}
local MIN_BUFF_DURATION = 20
local BUFF_DURATION_PER_STACK = 10
local DEBUFF_DURATION = 20

local function buff_duration_func(current_stacks)
	return MIN_BUFF_DURATION + BUFF_DURATION_PER_STACK * MAX_STACKS - BUFF_DURATION_PER_STACK * current_stacks
end

local function buff_duration_modifier_func(sub_buff_template, duration, buff_extension)
	local buff_stacks = buff_extension:num_buff_stacks("skulls_2023_buff")

	return buff_duration_func(math.min(buff_stacks, MAX_STACKS))
end

local function apply_buffs_from_stacks(target_unit, stack_count)
	local params = {
		external_optional_duration = buff_duration_func(stack_count)
	}
	local buff_system = Managers.state.entity:system("buff_system")

	for i = 1, math.min(stack_count, #buff_order) do
		buff_system:add_buff_synced(target_unit, buff_order[i], BuffSyncType.LocalAndServer, params)
	end
end

settings.buff_templates = {
	skulls_2023_buff = {
		buffs = {
			{
				name = "skulls_2023_buff",
				max_stacks = MAX_STACKS
			},
			{
				event = "on_kill",
				name = "skulls_2023_buff_kill_tracker",
				max_stacks = 1,
				buff_func = "on_kill_skulls_2023_buff"
			},
			{
				name = "skulls_2023_buff_main",
				refresh_durations = true,
				duration_end_func = "cleanup_skulls_2023_buff",
				event = "on_knocked_down",
				remove_buff_func = "remove_skulls_2023_buff",
				apply_buff_func = "apply_skulls_2023_buff",
				buff_func = "dummy_function",
				remove_on_proc = true,
				max_stacks = 1,
				reapply_buff_func = "reapply_skulls_2023_buff",
				duration = BUFF_DURATION,
				duration_modifier_func = buff_duration_modifier_func
			}
		}
	},
	skulls_2023_buff_power_level = {
		buffs = {
			{
				name = "skulls_2023_buff_power_level",
				multiplier = 0.15,
				stat_buff = "power_level",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				refresh_durations = true,
				priority_buff = true,
				remove_on_proc = true,
				max_stacks = 1,
				icon = "potion_liquid_bravado",
				duration = BUFF_DURATION
			}
		}
	},
	skulls_2023_buff_attack_speed = {
		buffs = {
			{
				name = "skulls_2023_buff_attack_speed",
				multiplier = 0.12,
				stat_buff = "attack_speed",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				refresh_durations = true,
				priority_buff = true,
				remove_on_proc = true,
				max_stacks = 1,
				icon = "grudge_mark_frenzy_debuff",
				duration = BUFF_DURATION
			}
		}
	},
	skulls_2023_buff_crit_chance = {
		buffs = {
			{
				name = "skulls_2023_buff_crit_chance",
				stat_buff = "critical_strike_chance",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				refresh_durations = true,
				priority_buff = true,
				remove_on_proc = true,
				max_stacks = 1,
				icon = "bardin_slayer_crit_chance",
				bonus = 0.2,
				duration = BUFF_DURATION
			}
		}
	},
	skulls_2023_buff_movement_speed = {
		buffs = {
			{
				priority_buff = true,
				name = "skulls_2023_buff_movement_speed",
				icon = "mutator_skulls_movement_speed",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				remove_buff_func = "remove_movement_buff",
				refresh_durations = true,
				multiplier = 1.2,
				apply_buff_func = "apply_movement_buff",
				remove_on_proc = true,
				max_stacks = 1,
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				duration = BUFF_DURATION
			}
		}
	},
	skulls_2023_buff_cooldown_regen = {
		buffs = {
			{
				name = "skulls_2023_buff_cooldown_regen",
				multiplier = 0.25,
				stat_buff = "cooldown_regen",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				refresh_durations = true,
				priority_buff = true,
				remove_on_proc = true,
				max_stacks = 1,
				icon = "mutator_skulls_cooldown_reduction",
				duration = BUFF_DURATION
			}
		}
	},
	skulls_2023_buff_refresh = {
		buffs = {
			{
				reset_on_max_stacks = true,
				name = "skulls_2023_buff_refresh",
				buff_func = "dummy_function",
				on_max_stacks_func = "skulls_2023_stack_refresh",
				icon = "buff_icon_mutator_icon_slayer_curse",
				event = "on_knocked_down",
				remove_on_proc = true,
				max_stacks = BUFF_REFRESH_STACKS
			}
		}
	},
	skulls_2023_debuff = {
		buffs = {
			{
				priority_buff = true,
				name = "skulls_2023_debuff",
				icon = "grudge_mark_cursed_debuff",
				buff_func = "dummy_function",
				event = "on_knocked_down",
				remove_buff_func = "remove_skulls_2023_debuff",
				apply_buff_func = "apply_skulls_2023_debuff",
				refresh_durations = true,
				remove_on_proc = true,
				debuff = true,
				duration = DEBUFF_DURATION,
				max_stacks = MAX_STACKS
			},
			{
				name = "skulls_2023_debuff_dot",
				damage_percentage = 0.01,
				buff_func = "dummy_function",
				event = "on_knocked_down",
				refresh_durations = true,
				remove_on_proc = true,
				update_start_delay = 1,
				max_stacks = 1,
				update_func = "update_skulls_2023_debuff_dot",
				update_frequency = 1,
				duration = DEBUFF_DURATION
			}
		}
	}
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
	apply_skulls_2023_buff = function (unit, buff, params, world)
		if not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local debuff_stacks = buff_extension:get_stacking_buff("skulls_2023_debuff")

		if debuff_stacks then
			for i = #debuff_stacks, 1, -1 do
				local buff_id = debuff_stacks[i].id

				buff_extension:remove_buff(buff_id)
			end
		end

		local buff_stacks = buff_extension:get_stacking_buff("skulls_2023_buff")
		local num_buff_stacks = #buff_stacks

		apply_buffs_from_stacks(unit, math.min(num_buff_stacks, MAX_STACKS))

		if not is_bot(unit) then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local effect_id = first_person_extension:create_screen_particles("fx/skulls_2023/screenspace_skulls_2023_buff")
			local effect_lerp = (num_buff_stacks - 1) / (MAX_STACKS - 1)
			local effect_strength = math.lerp(-0.55, 0.4, effect_lerp)

			World.set_particles_material_scalar(world, effect_id, "overlay", "shadow_amount", effect_strength)

			buff.effect_id = effect_id

			first_person_extension:play_hud_sound_event("Play_skulls_event_buff_on")
		end
	end,
	reapply_skulls_2023_buff = function (unit, buff, params, world)
		if not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_stacks = buff_extension:get_stacking_buff("skulls_2023_buff")
		local num_buff_stacks = #buff_stacks

		apply_buffs_from_stacks(unit, math.min(num_buff_stacks, MAX_STACKS))

		if not is_bot(unit) then
			local effect_id = buff.effect_id
			local effect_lerp = (num_buff_stacks - 1) / (MAX_STACKS - 1)
			local effect_strength = math.lerp(-0.55, 0.4, effect_lerp)

			World.set_particles_material_scalar(world, effect_id, "overlay", "shadow_amount", effect_strength)

			if MAX_STACKS <= num_buff_stacks and not buff.sound_played then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_skulls_event_buff_max_stacks")

				buff.sound_played = true
			end
		end
	end,
	remove_skulls_2023_buff = function (unit, buff, params, world)
		if buff.effect_id then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:stop_spawning_screen_particles(buff.effect_id)

			buff.effect_id = nil
		end

		if not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_refresh_stacks = buff_extension:get_stacking_buff("skulls_2023_buff_refresh")

		if buff_refresh_stacks then
			for i = #buff_refresh_stacks, 1, -1 do
				local buff_id = buff_refresh_stacks[i].id

				buff_extension:remove_buff(buff_id)
			end
		end

		local end_t = (buff.start_time or 0) + (buff.duration or 0)

		if end_t and end_t <= params.t then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_stacks = buff_extension:get_stacking_buff("skulls_2023_buff")
			local num_buff_stacks = buff_stacks and #buff_stacks or 0

			for i = 1, num_buff_stacks do
				buff_system:add_buff_synced(unit, "skulls_2023_debuff", BuffSyncType.LocalAndServer, {
					external_optional_value = num_buff_stacks
				})
			end
		end
	end,
	cleanup_skulls_2023_buff = function (unit, buff, params, world)
		if not ALIVE[unit] or not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local sub_buff_stacks = buff_extension:get_stacking_buff("skulls_2023_buff")

		if sub_buff_stacks then
			for i = #sub_buff_stacks, 1, -1 do
				local buff_id = sub_buff_stacks[i].id

				buff_extension:remove_buff(buff_id)
			end
		end
	end,
	apply_skulls_2023_debuff = function (unit, buff, params, world)
		if is_bot(unit) or not is_local(unit) then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local buff_stacks = buff_extension:get_stacking_buff("skulls_2023_debuff")
		local num_buff_stacks = buff_stacks and #buff_stacks or 0

		if num_buff_stacks <= 0 then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			buff.effect_id = first_person_extension:create_screen_particles("fx/skulls_2023/screenspace_skulls_2023_debuff")
			buff.effect_size_id = World.find_particles_variable(world, "fx/skulls_2023/screenspace_skulls_2023_debuff", "size")
			local effect_id = buff.effect_id
			local effect_size_id = buff.effect_size_id
			local effect_lerp = ((params.value or 1) - 1) / (MAX_STACKS - 1)
			local effect_opacity = math.lerp(1, 0.95, effect_lerp)
			local effect_size = math.lerp(5.5, 4, effect_lerp)

			World.set_particles_material_scalar(world, effect_id, "overlay", "intensity", effect_opacity)
			World.set_particles_variable(world, effect_id, effect_size_id, Vector3(effect_size * 1.33, effect_size, effect_size))
			first_person_extension:play_hud_sound_event("Play_skulls_event_buff_off")
		end
	end,
	remove_skulls_2023_debuff = function (unit, buff, params, world)
		if buff.effect_id then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

			first_person_extension:stop_spawning_screen_particles(buff.effect_id)

			buff.effect_id = nil
		end
	end,
	update_skulls_2023_debuff_dot = function (unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		local player_health_extension = ScriptUnit.extension(unit, "health_system")
		local current_health = player_health_extension:current_health()
		local min_health = 1

		if current_health > min_health then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local debuff_stacks = buff_extension:num_buff_stacks("skulls_2023_debuff")
			local max_health = player_health_extension:get_max_health()
			local damage = DamageUtils.networkify_damage(max_health * buff.template.damage_percentage * debuff_stacks)
			local modified_damage_amount = math.min(damage, current_health - min_health)

			if modified_damage_amount > 0 then
				local damage_direction = -Vector3.up()

				DamageUtils.add_damage_network(unit, unit, modified_damage_amount, "torso", "wounded_dot", nil, damage_direction)
			end
		end
	end
}
settings.proc_functions = {
	on_kill_skulls_2023_buff = function (owner_unit, buff, params)
		if not is_local(owner_unit) then
			return
		end

		local breed_killed = params[2]

		if breed_killed then
			local value = breed_killed.threat_value
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension then
				for i = 1, math.floor(value) do
					buff_extension:add_buff("skulls_2023_buff_refresh")
				end
			end
		end
	end
}
settings.max_stacks_functions = {
	skulls_2023_buff_refresh = function (owner_unit, sub_buff_template)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local buff_stacks = buff_extension:num_buff_stacks("skulls_2023_buff")

			apply_buffs_from_stacks(owner_unit, buff_stacks)
		end
	end,
	skulls_2023_stack_refresh = function (owner_unit, sub_buff_template)
		if ALIVE[owner_unit] then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff_synced(owner_unit, "skulls_2023_buff", BuffSyncType.LocalAndServer, {
				refresh_duration_only = true
			})
		end
	end
}
