local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.woods
local max_stacks_functions = MaxStackFunctions
local on_kill_killing_blow = 1
local on_kill_breed_data = 2
local on_kill_ai_unit = 3
local buff_params = {}
local wall_slow_duration = 0.2
local wall_sleep_mult = 0.5
local wall_dodge_mult = 1
settings.buff_templates = {
	weapon_bleed_dot_javelin = {
		buffs = {
			{
				duration = 4,
				name = "weapon bleed dot javelin",
				max_stacks = 1,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.5,
				time_between_dot_damages = 0.5,
				hit_zone = "neck",
				damage_profile = "bleed_maidenguard",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	thorn_sister_big_bleed = {
		buffs = {
			{
				duration = 5,
				name = "thorn sister big bleed",
				max_stacks = 3,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				hit_zone = "neck",
				damage_profile = "bleed",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	thorn_sister_passive_poison = {
		buffs = {
			{
				duration = 10,
				name = "thorn sister passive poison",
				stat_buff = "damage_taken",
				multiplier = 0.12,
				max_stacks = 1,
				remove_buff_func = "kerillian_thorn_sister_remove_buff_from_attacker",
				apply_buff_func = "start_dot_damage_kerillian",
				update_start_delay = 0.8,
				refresh_durations = true,
				time_between_dot_damages = 0.8,
				hit_zone = "neck",
				damage_profile = "thorn_sister_poison",
				update_func = "apply_dot_damage",
				perk = buff_perks.poisoned
			}
		}
	},
	thorn_sister_passive_poison_improved = {
		buffs = {
			{
				duration = 10,
				name = "thorn sister passive poison improved",
				stat_buff = "damage_taken",
				multiplier = 0.12,
				max_stacks = 2,
				remove_buff_func = "kerillian_thorn_sister_remove_buff_from_attacker",
				apply_buff_func = "start_dot_damage_kerillian",
				update_start_delay = 0.8,
				refresh_durations = true,
				time_between_dot_damages = 0.8,
				hit_zone = "neck",
				damage_profile = "thorn_sister_poison",
				update_func = "apply_dot_damage",
				perk = buff_perks.poisoned
			}
		}
	},
	thorn_sister_wall_bleed = {
		buffs = {
			{
				duration = 10,
				name = "thorn_sister_wall_bleed",
				max_stacks = 1,
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.25,
				time_between_dot_damages = 0.25,
				hit_zone = "neck",
				damage_profile = "bleed",
				update_func = "apply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	thorn_sister_wall_slow = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				name = "decrease_speed_thorn_sister_wall",
				refresh_durations = true,
				apply_buff_func = "apply_movement_buff",
				lerp_time = 0.1,
				max_stacks = 1,
				multiplier = wall_sleep_mult,
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				duration = wall_slow_duration
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				name = "decrease_crouch_speed_thorn_sister_wall",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = wall_sleep_mult,
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				},
				duration = wall_slow_duration
			},
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				name = "decrease_walk_speed_thorn_sister_wall",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 0.1,
				max_stacks = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				multiplier = wall_sleep_mult,
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				},
				duration = wall_slow_duration
			},
			{
				name = "decrease_jump_speed_thorn_sister_wall",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				multiplier = wall_sleep_mult,
				path_to_movement_setting_to_modify = {
					"jump",
					"initial_vertical_speed"
				},
				duration = wall_slow_duration
			}
		}
	},
	kerillian_thorn_passive_team_buff = {
		buffs = {
			{
				name = "kerillian_thorn_passive_team_buff",
				multiplier = 0.15,
				stat_buff = "power_level",
				max_stacks = 1,
				icon = "kerillian_thornsister_avatar"
			},
			{
				max_stacks = 1,
				name = "kerillian_thorn_passive_team_buff_2",
				stat_buff = "critical_strike_chance",
				bonus = 0.05
			}
		}
	},
	kerillian_thorn_sister_drain_poison_phasing_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "kerillian_thorn_sister_poison_phasing",
				duration = 5,
				remove_buff_func = "kerillian_thorn_sister_noclip_off",
				max_stacks = 1,
				icon = "kerillian_thornsister_big_push",
				apply_buff_func = "kerillian_thorn_sister_noclip_on"
			},
			{
				refresh_durations = true,
				name = "kerillian_thorn_sister_poison_movespeed",
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				duration = 5,
				apply_buff_func = "apply_movement_buff",
				multiplier = 1.2,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	}
}
settings.proc_functions = {
	kerillian_thorn_sister_health_conversion = function (player, buff, params, world)
		local unit = player.player_unit

		if ALIVE[unit] then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if not health_extension then
				return
			end

			local current_temporary_health = health_extension:current_temporary_health()
			local template = buff.template
			local percentage_to_convert = template.amount_to_convert
			local max_health = health_extension:get_max_health()
			local amount_to_convert = max_health * percentage_to_convert

			if current_temporary_health < amount_to_convert then
				amount_to_convert = current_temporary_health
			end

			local position = POSITION_LOOKUP[unit]

			if Managers.state.network.is_server then
				DamageUtils.heal_network(unit, unit, amount_to_convert, "health_conversion")
			else
				local network_manager = Managers.state.network
				local owner_unit_id = network_manager:unit_game_object_id(unit)
				local heal_type_id = NetworkLookup.heal_types.health_conversion

				network_manager.network_transmit:send_rpc_server("rpc_request_heal", owner_unit_id, amount_to_convert, heal_type_id)
			end

			if amount_to_convert > 0 then
				World.create_particles(world, "fx/thornsister_buff", position, Quaternion.identity())
				World.create_particles(world, "fx/thornsister_buff_screenspace", Vector3(0, 0, 0))
			end
		end
	end,
	kerillian_thorn_sister_set_back = function (player, buff, params, world)
		local player_unit = player.player_unit
		local attacker_unit = params[1]

		if ALIVE[player_unit] and ALIVE[attacker_unit] then
			local side = Managers.state.side.side_by_unit[player_unit]
			local attacker_side = Managers.state.side.side_by_unit[attacker_unit]

			if side == attacker_side then
				return
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			if not buff_extension:has_buff_type("kerillian_thorn_sister_passive_set_back_cooldown") then
				local career_extension = ScriptUnit.extension(player_unit, "career_system")

				career_extension:modify_extra_ability_charge(buff.template.amount)
				buff_extension:add_buff("kerillian_thorn_sister_passive_set_back_cooldown")
			end
		end
	end,
	thorn_sister_transfer_temp_health_at_full = function (player, buff, params, world)
		local heal_type = params[3]
		local healer_unit = params[1]
		local player_unit = player.player_unit
		local thornsister_unit = buff.attacker_unit

		if not ALIVE[thornsister_unit] or thornsister_unit == player_unit then
			return
		end

		local self_heal = healer_unit == player_unit
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if self_heal and not status_extension:is_permanent_heal(heal_type) then
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local current_health = health_extension:current_health_percent()

			if current_health == 1 then
				local heal_amount = params[2]
				local template = buff.template
				local multiplier = template.multiplier
				heal_amount = heal_amount * multiplier
				local thornsister_status_extension = ScriptUnit.has_extension(thornsister_unit, "status_system")

				if not thornsister_status_extension:is_knocked_down() then
					local thornsister_health_extension = ScriptUnit.has_extension(thornsister_unit, "health_system")
					local thornsister_current_health = thornsister_health_extension and thornsister_health_extension:current_health_percent()

					if thornsister_current_health and thornsister_current_health < 1 then
						DamageUtils.heal_network(thornsister_unit, player_unit, heal_amount, "heal_from_proc")
					end
				end
			end
		end
	end,
	add_buff_reff_buff_stack = function (player, buff, params)
		local player_unit = player.player_unit
		local triggering_unit = params[1]

		if ALIVE[player_unit] and triggering_unit == player_unit then
			local template = buff.template
			local buff_name = template.buff_to_add
			local amount_to_add = template.amount_to_add
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			for i = 1, amount_to_add do
				buff_extension:add_buff(buff_name)
			end
		end
	end,
	remove_ref_buff_stack_woods = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_remove
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buffs = buff_extension:get_stacking_buff(buff_name)

			if buffs then
				local num_stacks = #buffs

				if num_stacks > 0 then
					local buff_id = buffs[num_stacks].id

					buff_extension:remove_buff(buff_id)
				end
			end
		end
	end,
	thorn_sister_add_bleed_on_hit = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if ALIVE[player_unit] and ALIVE[hit_unit] then
			local template = buff.template
			local bleed = template.bleed
			local buff_system = Managers.state.entity:system("buff_system")
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local power_level = career_extension:get_career_power_level()
			local target_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

			if not target_buff_extension or not target_buff_extension:has_buff_perk(buff_perks.poisoned) then
				return false
			end

			local buff_params = {
				power_level = power_level,
				attacker_unit = player_unit
			}

			buff_system:add_buff_synced(hit_unit, bleed, BuffSyncType.LocalAndServer, buff_params)
		end
	end,
	kerillian_thorn_sister_crit_aoe_poison_func = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local hit_num = params[4]

		if ALIVE[player_unit] and hit_num <= 1 then
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local power_level = career_extension:get_career_power_level()
			local hit_unit = params[1]
			local position = POSITION_LOOKUP[hit_unit]
			local damage_source = "buff"
			local explosion_template = "kerillian_thorn_sister_talent_poison_aoe"
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("kerillian_thorn_sister_double_poison") then
				explosion_template = "kerillian_thorn_sister_talent_poison_aoe_improved"
			end

			local rotation = Quaternion.identity()
			local scale = 1
			local is_critical_strike = false

			area_damage_system:create_explosion(player_unit, position, rotation, explosion_template, scale, damage_source, power_level, is_critical_strike)
		end
	end,
	thorn_sister_add_melee_poison = function (player, buff, params)
		local player_unit = player.player_unit
		local hit_unit = params[1]

		if ALIVE[player_unit] and AiUtils.unit_alive(hit_unit) then
			local attack_type = params[2]

			if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
				return
			end

			local template = buff.template
			local poison = template.poison
			local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("kerillian_thorn_sister_double_poison") then
				poison = template.improved_poison
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local power_level = career_extension:get_career_power_level()
			local target_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

			if not target_buff_extension then
				return false
			end

			local buff_params = {
				power_level = power_level,
				attacker_unit = player_unit
			}

			buff_system:add_buff_synced(hit_unit, poison, BuffSyncType.LocalAndServer, buff_params)
		end
	end,
	thorn_sister_big_push = function (player, buff, params, world)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local new_action = params[1]
			local kind = new_action.kind

			if kind == "push_stagger" then
				local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
				local current_fatigue = status_extension:current_fatigue_points()

				if current_fatigue == 0 then
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					local template = buff.template
					local buff_to_add = template.buff_to_add

					buff_extension:add_buff(buff_to_add)

					local buff_to_add_2 = template.buff_to_add_2
					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:add_buff(player_unit, buff_to_add_2, player_unit, false)

					local position = POSITION_LOOKUP[player_unit]

					World.create_particles(world, "fx/thornsister_push", position, Quaternion.identity())
				end
			end
		end
	end,
	kerillian_thorn_sister_add_buff_remove = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_to_add = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(player_unit, buff_to_add, player_unit, false)

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	kerillian_thorn_sister_restore_health_on_ranged_hit = function (player, buff, params)
		local player_unit = player.player_unit
		local attack_type = params[7]

		if ALIVE[player_unit] and attack_type and (attack_type == "projectile" or attack_type == "instant_projectile") then
			if Managers.state.network.is_server then
				local amount_to_heal = buff.template.amount_to_heal

				DamageUtils.heal_network(player_unit, player_unit, amount_to_heal, "career_passive")
			end

			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

			buff_extension:remove_buff(buff.id)
		end
	end,
	kerillian_thorn_sister_wall_buff_enemies = function (player, buff, params, world, param_order)
		local player_unit = player.player_unit
		local wall_unit = buff.attacker_unit
		local target_number = params[param_order.target_number]

		if ALIVE[player_unit] and ALIVE[wall_unit] and target_number == 1 then
			local position = POSITION_LOOKUP[wall_unit]
			local template = buff.template
			local radius = template.radius
			local buff_to_add = template.buff_to_add
			local nearby_enemy_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.enemy_broadphase

			Broadphase.query(broadphase, position, radius, nearby_enemy_units)

			local side_manager = Managers.state.side
			local buff_system = Managers.state.entity:system("buff_system")

			for _, enemy_unit in pairs(nearby_enemy_units) do
				if ALIVE[enemy_unit] and side_manager:is_enemy(player_unit, enemy_unit) then
					buff_system:add_buff(enemy_unit, buff_to_add, player_unit)
				end
			end
		end
	end,
	add_buff_on_proc_thorn = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = buff.template.buff_to_add

			buff_system:add_buff(player_unit, buff_to_add, player_unit, false)
		end
	end,
	kerillian_thorn_sister_reduce_passive_on_elite = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local passive_ability = career_extension:get_passive_ability(1)
			local template = buff.template
			local time_to_remove = template.time_removed_per_kill or 0

			career_extension:modify_extra_ability_charge(time_to_remove)
		end
	end,
	kerillian_thorn_sister_team_buff_on_passive = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local side = Managers.state.side.side_by_unit[player_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_targets = #player_and_bot_units
			local range = 40
			local buff_template = buff.template
			local owner_position = POSITION_LOOKUP[player_unit]
			local range_squared = range * range
			local buff_system = Managers.state.entity:system("buff_system")

			for i = 1, num_targets do
				local target_unit = player_and_bot_units[i]
				local ally_position = POSITION_LOOKUP[target_unit]
				local distance_squared = Vector3.distance_squared(owner_position, ally_position)

				if distance_squared < range_squared then
					local buff_to_add_1 = buff_template.buff_to_add_1

					buff_system:add_buff(target_unit, buff_to_add_1, player_unit, false)
				end
			end
		end
	end
}
settings.buff_function_templates = {
	kerillian_thorn_sister_healing_wall_buff_counter_remove = function (unit, buff, params)
		if ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local num_stacks = buff_extension:num_buff_type(buff.buff_type)

			if num_stacks == 1 then
				local template = buff.template
				local buffs_to_remove = template.add_buffs_data.buffs_to_add

				for i = 1, #buffs_to_remove do
					local buff = buff_extension:get_buff_type(buffs_to_remove[i])

					if buff then
						buff.duration = 0
						buff.aborted = 0
					end
				end
			end
		end
	end,
	start_dot_damage_kerillian = function (unit, buff, params)
		if buff.template.start_flow_event then
			Unit.flow_event(unit, buff.template.start_flow_event)
		end

		local attacker_unit = buff.attacker_unit

		if ALIVE[attacker_unit] then
			local talent_extension = ScriptUnit.has_extension(attacker_unit, "talent_system")

			if talent_extension and talent_extension:has_talent("kerillian_thorn_sister_phasing") then
				local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

				if not buff_extension then
					return
				end

				buff.added_id = buff_extension:add_buff("kerillian_thorn_sister_drain_poison_phasing_tracker")

				if buff_extension:num_buff_type("kerillian_thorn_sister_drain_poison_phasing_tracker") >= 5 then
					buff_extension:add_buff("kerillian_thorn_sister_drain_poison_phasing_buff")
				end
			end
		end
	end,
	activate_stacking_buff_on_distance = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units

		for i = 1, num_units do
			local unit = player_and_bot_units[i]
			local buff_instance = buff.buff_instances and buff.buff_instances[unit]

			if ALIVE[unit] then
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)

				if not buff_instance and distance_squared <= range_squared then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)

					if buff.buff_instances then
						buff.buff_instances[unit] = server_buff_id
					else
						buff.buff_instances = {
							[unit] = server_buff_id
						}
					end
				elseif buff_instance and range_squared < distance_squared then
					buff_system:remove_server_controlled_buff(unit, buff_instance)

					buff.buff_instances[unit] = nil
				end
			elseif buff_instance then
				buff.buff_instances[unit] = nil
			end
		end
	end,
	remove_aura_stacking_buff = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local instances = buff.buff_instances

		if instances then
			local buff_system = Managers.state.entity:system("buff_system")

			for unit, instance_id in pairs(instances) do
				if ALIVE[unit] then
					buff_system:remove_server_controlled_buff(unit, instance_id)
				end
			end
		end
	end,
	kerillian_thorn_sister_passive_health_convert = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = owner_unit

		if ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local template = buff.template
			local thp_to_lose = template.thp_to_lose
			local has_thp = health_extension and thp_to_lose < health_extension:current_temporary_health()

			if buff_extension:has_buff_type("kerillian_thorn_sister_free_ability_stack") and has_thp then
				local hp_to_gain = template.hp_to_gain

				DamageUtils.heal_network(player_unit, player_unit, hp_to_gain, "career_passive")

				if thp_to_lose - hp_to_gain > 0 then
					DamageUtils.add_damage_network(player_unit, player_unit, thp_to_lose - hp_to_gain, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, player_unit)
				end
			end
		end
	end,
	kerillian_thorn_sister_add_buff_to_attacker = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_to_add = buff.template.buff_to_add
			local kerillian_unit = buff.attacker_unit
			local buff_extension = ScriptUnit.has_extension(kerillian_unit, "buff_system")

			if buff_extension then
				buff.added_id = buff_extension:add_buff(buff_to_add)
			end
		end
	end,
	kerillian_thorn_sister_remove_buff_from_attacker = function (owner_unit, buff, params)
		if buff.added_id then
			local kerillian_unit = buff.attacker_unit
			local buff_extension = ScriptUnit.has_extension(kerillian_unit, "buff_system")

			if buff_extension then
				buff_extension:remove_buff(buff.added_id)
			end
		end
	end,
	buff_system_add_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_to_add = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
		end
	end,
	kerillian_thorn_sister_noclip_on = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension then
				status_extension:add_noclip_stacking()
			end
		end
	end,
	kerillian_thorn_sister_noclip_off = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension then
				status_extension:remove_noclip_stacking()
			end
		end
	end
}
settings.max_stacks_functions = {
	kerillian_thorn_sister_avatar = function (player, sub_buff_template)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local max_stack_data = sub_buff_template.max_stack_data

			if max_stack_data then
				local buffs_to_add = max_stack_data.buffs_to_add
				local buff_system = Managers.state.entity:system("buff_system")

				for i = 1, #buffs_to_add do
					local buff_to_add = buffs_to_add[i]

					buff_system:add_buff(player_unit, buff_to_add, player_unit, false)
				end
			end
		end
	end
}
