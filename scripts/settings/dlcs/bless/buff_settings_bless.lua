-- chunkname: @scripts/settings/dlcs/bless/buff_settings_bless.lua

require("scripts/settings/profiles/career_constants")

local stagger_types = require("scripts/utils/stagger_types")
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local settings = DLCSettings.bless
local on_damage_taken_damage_amount = 2
local on_damage_taken_damage_type = 3

settings.buff_templates = {
	victor_priest_activated_ability_invincibility = {
		activation_sound = "career_ability_priest_buff_shield",
		buffs = {
			{
				apply_buff_func = "victor_priest_on_career_skill_applied",
				duration = 5,
				icon = "victor_priest_activated_ability",
				max_stacks = 1,
				name = "victor_priest_activated_ability_invincibility",
				priority_buff = true,
				reapply_buff_func = "victor_priest_on_career_skill_applied",
				refresh_durations = true,
				remove_buff_func = "victor_priest_on_career_skill_removed",
				update_func = "victor_priest_on_career_skill_update",
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	victor_priest_activated_ability_nuke = {
		activation_sound = "career_ability_priest_buildup",
		deactivation_sound = "career_ability_priest_buildup_stop",
		buffs = {
			{
				apply_buff_func = "victor_priest_activated_ability_nuke_start",
				duration = 5,
				max_stacks = 1,
				name = "victor_priest_activated_ability_nuke",
				priority_buff = true,
				reapply_buff_func = "victor_priest_activated_ability_nuke_start",
				refresh_durations = true,
				remove_buff_func = "victor_priest_activated_ability_nuke",
			},
		},
	},
	victor_priest_activated_noclip = {
		buffs = {
			{
				apply_buff_func = "victor_priest_activated_noclip_apply",
				duration = 5,
				max_stacks = 1,
				name = "victor_priest_activated_noclip",
				push_cooldown = 1,
				push_radius = 1.5,
				refresh_durations = true,
				remove_buff_func = "victor_priest_activated_noclip_remove",
				stagger_distance = 1,
				update_frequency = 0.1,
				update_func = "victor_priest_activated_noclip_update",
				perks = {
					buff_perks.no_ranged_knockback,
				},
				stagger_impact = {
					stagger_types.medium,
					stagger_types.none,
					stagger_types.none,
					stagger_types.none,
					stagger_types.none,
				},
				no_clip_filter = {
					true,
					false,
					false,
					false,
					false,
					false,
				},
			},
		},
	},
	victor_priest_nuke_dot = {
		buffs = {
			{
				apply_buff_func = "start_dot_damage",
				damage_profile = "burning_dot",
				damage_type = "burninating",
				duration = 5,
				name = "victor_priest_nuke_dot",
				time_between_dot_damages = 0.7,
				update_func = "apply_dot_damage",
				update_start_delay = 0.7,
				perks = {
					buff_perks.burning,
				},
			},
		},
	},
	victor_priest_book_buff_attack_speed = {
		buffs = {
			{
				icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
				max_stacks = 1,
				multiplier = 0.1,
				name = "victor_priest_book_buff_attack_speed",
				stat_buff = "attack_speed",
			},
			{
				bonus = 0.05,
				max_stacks = 1,
				name = "victor_priest_book_buff_crit",
				stat_buff = "critical_strike_chance",
			},
		},
	},
	victor_priest_book_buff_heal_on_damage = {
		buffs = {
			{
				buff_func = "victor_priest_book_buff_heal_on_kill_proc",
				event = "on_kill",
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				max_stacks = 1,
				name = "victor_priest_book_buff_heal_on_damage",
			},
		},
	},
	victor_priest_book_buff_stamina = {
		buffs = {
			{
				max_stacks = 1,
				multiplier = -0.3,
				name = "victor_priest_book_buff_block_cost",
				stat_buff = "block_cost",
			},
			{
				bonus = 6,
				max_stacks = 1,
				name = "victor_priest_book_buff_stamina",
				stat_buff = "max_fatigue",
			},
			{
				max_stacks = 1,
				multiplier = 0.5,
				name = "victor_priest_book_buff_push_angle",
				stat_buff = "block_angle",
			},
		},
	},
	victor_priest_passive_aftershock = {
		activation_sound = "career_priest_fury_start",
		deactivation_sound = "career_priest_fury_stop",
		buffs = {
			{
				buff_func = "add_buff_to_hit_enemy",
				buff_to_add = "victor_priest_passive_smite",
				buff_to_add_upgraded = "victor_priest_passive_smite_upgraded",
				event = "on_damage_dealt",
				icon = "victor_priest_passive",
				max_stacks = 1,
				name = "victor_priest_passive_aftershock",
			},
		},
	},
	victor_priest_passive_smite = {
		buffs = {
			{
				damage_multiplier = 0.2,
				damage_profile = "light_push",
				duration = 0.3,
				name = "victor_priest_passive_smite",
				remove_buff_func = "victor_priest_activated_ability_aftershock_update",
			},
		},
	},
	victor_priest_passive_smite_upgraded = {
		buffs = {
			{
				damage_multiplier = 0.4,
				damage_profile = "medium_push",
				duration = 0.8,
				name = "victor_priest_passive_smite",
				remove_buff_func = "victor_priest_activated_ability_aftershock_update",
			},
		},
	},
}
settings.proc_functions = {
	add_buff_to_hit_enemy = function (owner_unit, buff, params, world)
		local hit_unit = params[1]
		local attack_type = params[7]

		if ALIVE[owner_unit] and ALIVE[hit_unit] and attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_to_add = buff.template.buff_to_add
			local talent_extension = ScriptUnit.has_extension(owner_unit, "talent_system")
			local has_talent = talent_extension and talent_extension:has_talent("victor_priest_4_2")

			if has_talent then
				buff_to_add = buff.template.buff_to_add_upgraded
			end

			local target_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

			if target_buff_extension then
				local values = {
					external_optional_value = params[3],
					attacker_unit = owner_unit,
				}

				target_buff_extension:add_buff(buff_to_add, values)
			end
		end
	end,
	victor_priest_4_1_on_push = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local new_action = params[1]
			local kind = new_action.kind

			if kind == "push_stagger" then
				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

				if not career_extension then
					return
				end

				local passive_ability = career_extension:get_passive_ability()

				if passive_ability and passive_ability:is_active() then
					local area_damage_system = Managers.state.entity:system("area_damage_system")
					local position = POSITION_LOOKUP[owner_unit]
					local career_power_level = career_extension:get_career_power_level()

					area_damage_system:create_explosion(owner_unit, position, Quaternion.identity(), "victor_priest_melee_explosion", 1, "career_ability", career_power_level, false)

					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					first_person_extension:play_hud_sound_event("career_talent_priest_unbreakable_push")
				end
			end
		end
	end,
	add_buff_to_first_hit_enemy = function (owner_unit, buff, params)
		local hit_unit = params[1]
		local attack_type = params[7]
		local hit_index = params[8]

		if hit_index and hit_index > 1 then
			return
		end

		if ALIVE[owner_unit] and ALIVE[hit_unit] and attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local buff_to_add = buff.template.buff_to_add
			local target_buff_extension = ScriptUnit.has_extension(hit_unit, "buff_system")

			if target_buff_extension then
				local values = {
					external_optional_value = params[3],
					attacker_unit = owner_unit,
				}

				target_buff_extension:add_buff(buff_to_add, values)
			end
		end
	end,
	victor_priest_book_buff_heal_on_kill_proc = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local side = Managers.state.side.side_by_unit[owner_unit]
			local breed = params[2]
			local amount_to_heal = breed.bloodlust_health or 0

			amount_to_heal = amount_to_heal / 2

			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

			for i = 1, #player_and_bot_units do
				local unit = player_and_bot_units[i]

				if HEALTH_ALIVE[unit] then
					local status_extension = ScriptUnit.extension(unit, "status_system")

					if not status_extension:is_knocked_down() and not status_extension:is_assisted_respawning() then
						DamageUtils.heal_network(unit, owner_unit, amount_to_heal, "career_passive")
					end
				end
			end
		end
	end,
	add_buff_on_elite_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local killing_blow = params[1]
			local killer_unit = killing_blow[DamageDataIndex.ATTACKER]

			if killer_unit == owner_unit then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

				buff_extension:add_buff(buff.template.buff_to_add)
			end
		end
	end,
	victor_priest_store_damage = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			if not buff.damage_table then
				buff.damage_table = {}
			end

			local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

			if status_extension and status_extension:is_knocked_down() then
				return
			end

			local inital_damage_taken = params[2]
			local damage_taken = inital_damage_taken
			local t = Managers.time:time("game")
			local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")
			local current_temporary_health = health_extension and health_extension:current_temporary_health()

			if current_temporary_health then
				damage_taken = damage_taken - current_temporary_health

				if damage_taken <= 0 then
					local data = {
						temp_hp = true,
						t = t,
						damage_taken = inital_damage_taken,
					}

					table.insert(buff.damage_table, data)
				elseif damage_taken == inital_damage_taken then
					local data = {
						temp_hp = false,
						t = t,
						damage_taken = inital_damage_taken,
					}

					table.insert(buff.damage_table, data)
				else
					local data = {
						temp_hp = true,
						t = t,
						damage_taken = current_temporary_health,
					}

					table.insert(buff.damage_table, data)

					data = {
						temp_hp = false,
						t = t,
						damage_taken = damage_taken,
					}

					table.insert(buff.damage_table, data)
				end
			end

			buff.list_dirty = true

			while buff.list_dirty do
				if t - buff.damage_table[1].t > buff.template.heal_window then
					table.remove(buff.damage_table, 1)
				else
					buff.list_dirty = false
				end
			end
		end
	end,
	victor_priest_damage_stagger = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local damage_type = params[on_damage_taken_damage_type]
			local valid_damage_type = damage_type ~= "life_tap" and damage_type ~= "knockdown_bleed"

			if not valid_damage_type then
				return false
			end

			local damage_amount = params[on_damage_taken_damage_amount]
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local template = buff.template
			local staggered_damage_taken = template.staggered_damage_taken
			local percent_non_mitigated_damage = 1 - staggered_damage_taken
			local percent_to_absorb = staggered_damage_taken / percent_non_mitigated_damage
			local damage_to_take = damage_amount * percent_to_absorb
			local percentage_of_original = (damage_amount + damage_to_take) * template.percentage_to_take
			local buff_params = {
				external_optional_value = percentage_of_original,
			}
			local damage_stagger_dot = buff_extension:get_buff_type("damage_stagger")

			if damage_stagger_dot then
				local current_damage = damage_stagger_dot.value
				local current_damage_dealt = damage_stagger_dot.damage_dealt or 0
				local remaining_damage = current_damage - current_damage_dealt
				local new_damage = percentage_of_original + remaining_damage

				damage_stagger_dot.value = new_damage
				damage_stagger_dot.damage_dealt = 0

				local t = Managers.time:time("game")

				damage_stagger_dot.start_time = t
			end

			local buff_to_add = template.buff_to_add

			buff_extension:add_buff(buff_to_add, buff_params)
		end
	end,
	add_buff_on_num_targets_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_template = buff.template
			local num_targets = buff_template.num_targets
			local target_number = params[4]

			if target_number < num_targets then
				return
			end

			local attack_type = params[2]

			if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
				return
			end

			local block_buff = buff_template.block_buff
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if block_buff and buff_extension:has_buff_type(block_buff) then
				return
			end

			local buff_name = buff_template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, buff_name, owner_unit, false)
		end
	end,
	victor_priest_knockback_on_hit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]

			if target_number > 1 then
				return
			end

			local attack_type = params[2]

			if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
				return
			end

			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()
			local hit_unit = params[1]
			local postion = POSITION_LOOKUP[hit_unit]
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system:create_explosion(owner_unit, postion, Quaternion.identity(), "victor_priest_melee_explosion", 1, "career_ability", career_power_level, false)

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff(buff.template.buff_to_add)
			buff_extension:remove_buff(buff.id)
		end
	end,
	victor_priest_add_buff_first_target = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local target_number = params[4]

			if target_number > 1 then
				return
			end

			if not buff.buff_ids then
				buff.buff_ids = {}
			end

			local buff_name = buff.template.buff_to_add
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff.buff_ids[#buff.buff_ids + 1] = buff_extension:add_buff(buff_name)
		end
	end,
	victor_priest_passive_resource = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local fury_to_add
			local template = buff.template
			local breed_data = params[2]

			if breed_data.elite then
				fury_to_add = template.fury_on_elite
			elseif breed_data.special then
				fury_to_add = template.fury_on_special
			elseif breed_data.boss then
				fury_to_add = template.fury_on_boss
			else
				fury_to_add = template.fury_on_normal
			end

			local overcharge_extension = ScriptUnit.has_extension(owner_unit, "overcharge_system")

			if overcharge_extension then
				overcharge_extension:add_charge(fury_to_add)
			end
		end
	end,
	victor_priest_passive_resource_activate = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local overcharge_extension = ScriptUnit.has_extension(owner_unit, "overcharge_system")

			if not overcharge_extension then
				return
			end

			if not overcharge_extension:is_above_critical_limit() then
				return
			end

			local attack_type = params[2]

			if not attack_type or attack_type ~= "heavy_attack" then
				return
			end

			local buff_to_add = buff.template.buff_to_add
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local has_buff = buff_extension:get_buff_type(buff_to_add)

			if not has_buff then
				buff_extension:add_buff(buff_to_add)

				local player = Managers.player:owner(owner_unit)
				local is_local = player and not player.remote

				if is_local then
					local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
					local event_data = FrameTable.alloc_table()

					dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)

					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					first_person_extension:play_hud_sound_event("career_ability_priest_cast_t1")
					first_person_extension:play_remote_unit_sound_event("career_ability_priest_cast_t1", owner_unit, 0)
				end
			end
		end
	end,
	victor_priest_4_3_heal_on_kill = function (owner_unit, buff, params)
		local is_server = Managers.state.network.is_server

		if not is_server then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if not buff_extension or not buff_extension:has_buff_type("victor_priest_passive_aftershock") then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local breed = params[2]

		if breed and not breed.is_hero then
			local heal_amount = breed.bloodlust_health or 0
			local side = Managers.state.side.side_by_unit[owner_unit]

			if not side then
				return
			end

			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units

			heal_amount = heal_amount * 0.5

			for i = 1, num_units do
				local unit = player_and_bot_units[i]

				if ALIVE[unit] then
					DamageUtils.heal_network(unit, owner_unit, heal_amount, "career_passive")
				end
			end
		end
	end,
}
settings.buff_function_templates = {
	victor_priest_passive_active_update = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local overcharge_extension = ScriptUnit.has_extension(owner_unit, "overcharge_system")

			if not overcharge_extension then
				return
			end

			local template = buff.template
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local t = Managers.time:time("game")
			local fury_to_remove = template.fury_to_remove + math.floor((t - buff.start_time) / 2) / 15

			overcharge_extension:remove_charge(fury_to_remove)

			if overcharge_extension:get_overcharge_value() <= 0 then
				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	victor_priest_passive_grow = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			if not buff.stack_ids then
				buff.stack_ids = {}
			end

			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			if buff_extension:get_buff_type("victor_priest_righteous_fury_active_buff") then
				buff.stack_ids[#buff.stack_ids + 1] = buff_extension:add_buff(buff.template.buff_to_add)
			elseif #buff.stack_ids > 0 then
				for i = 1, #buff.stack_ids do
					buff_extension:remove_buff(buff.stack_ids[i])
				end

				buff.stack_ids = {}
			end
		end
	end,
	victor_priest_delayed_buff_remove = function (owner_unit, buff, params)
		local player_unit = owner_unit

		if ALIVE[player_unit] then
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local buff_list_buff = buff_extension:get_non_stacking_buff(buff.template.buff_list_buff)

			if buff_list_buff then
				local buff_list = buff_list_buff.buff_ids

				if buff_list then
					for i = 1, #buff_list do
						buff_extension:queue_remove_buff(buff_list[i])
					end
				end
			end
		end
	end,
	victor_priest_deal_damage_on_remove = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local attacker_unit = buff.attacker_unit
			local damage = buff.value

			if not damage or damage <= 0 then
				return
			end

			local multiplier = 0.2
			local buff_extension = ScriptUnit.extension(attacker_unit, "buff_system")

			if buff_extension then
				local num_buffs = buff_extension:num_buff_type("victor_priest_4_2_stack")

				multiplier = multiplier + 0.02 * num_buffs
			end

			local damage_to_deal = damage * multiplier

			DamageUtils.add_damage_network(owner_unit, attacker_unit, damage_to_deal, "torso", "buff", nil, Vector3(0, 0, 0), "career_ability", nil, attacker_unit)

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()
			local position = POSITION_LOOKUP[owner_unit] + Vector3.up() * 0.5
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system:create_explosion(attacker_unit, position, Quaternion.identity(), "victor_priest_career_skill_aftershock", 1, "career_ability", career_power_level, false)
		end
	end,
	victor_priest_activated_ability_aftershock_update = function (owner_unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		local attacker_unit = buff.attacker_unit

		if ALIVE[owner_unit] and ALIVE[attacker_unit] then
			local enemy_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if not enemy_extension then
				return
			end

			local damage = buff.value

			if not damage or damage <= 0 then
				return
			end

			local multiplier = buff.template.damage_multiplier
			local damage_to_deal = damage * multiplier

			DamageUtils.add_damage_network(owner_unit, attacker_unit, damage_to_deal, "torso", "buff", nil, Vector3(0, 0, 0), "career_ability", nil, attacker_unit)

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()
			local position = POSITION_LOOKUP[owner_unit] + Vector3.up() * 0.5
			local weapon_system = Managers.state.entity:system("weapon_system")
			local damage_source = "career_ability"
			local damage_source_id = NetworkLookup.damage_sources[damage_source]
			local network_manager = Managers.state.network
			local attacker_unit_id = network_manager:unit_game_object_id(attacker_unit)
			local hit_unit_id = network_manager:unit_game_object_id(owner_unit)
			local hit_zone_id = NetworkLookup.hit_zones.body
			local damage_profile = buff.template.damage_profile
			local damage_profile_id = NetworkLookup.damage_profiles[damage_profile]
			local hit_unit_pos = POSITION_LOOKUP[owner_unit] or 0
			local attacker_pos = POSITION_LOOKUP[attacker_unit] or 0
			local attack_direction = Vector3.normalize(hit_unit_pos - attacker_pos)

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, position, attack_direction, damage_profile_id, "power_level", career_power_level)

			local effect_name = "fx/wp_enemy_explosion"

			if not Unit.has_node(owner_unit, "j_neck") then
				return
			end

			local game_object_id = Managers.state.unit_storage:go_id(owner_unit)

			if game_object_id then
				local effect_name_id = NetworkLookup.effects[effect_name]
				local spawn_node_id = Unit.node(owner_unit, "j_neck")

				network_manager:rpc_play_particle_effect_no_rotation(nil, effect_name_id, game_object_id, spawn_node_id, Vector3.zero(), false)

				local player = Managers.player:owner(attacker_unit)

				if player then
					local audio_event_self = "career_priest_fury_smite"
					local audio_event_other = "career_priest_fury_smite_husk"

					if player.remote then
						WwiseUtils.trigger_unit_event(world, audio_event_other, owner_unit, spawn_node_id)

						local peer_id = player:network_id()
						local sound_event_self_id = NetworkLookup.sound_events[audio_event_self]

						network_manager.network_transmit:send_rpc("rpc_server_audio_unit_event", peer_id, sound_event_self_id, game_object_id, false, spawn_node_id)

						local sound_event_other_id = NetworkLookup.sound_events[audio_event_other]

						network_manager.network_transmit:send_rpc_clients_except("rpc_server_audio_unit_event", peer_id, sound_event_other_id, game_object_id, false, spawn_node_id)
					else
						WwiseUtils.trigger_unit_event(world, audio_event_self, owner_unit, spawn_node_id)

						local sound_event_other_id = NetworkLookup.sound_events[audio_event_other]

						network_manager.network_transmit:send_rpc_clients("rpc_server_audio_unit_event", sound_event_other_id, game_object_id, false, spawn_node_id)
					end
				end
			end
		end
	end,
	victor_priest_on_career_skill_applied = function (owner_unit, buff, params, world)
		local third_person_effect = "fx/wp_immortality_allies"
		local local_screen_space_effect = "fx/wp_immortality_self"
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local owner_player = player_manager:unit_owner(owner_unit)
		local is_local_player = owner_player == local_player

		if is_local_player then
			local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

			if first_person_extension then
				if buff.screen_space_id then
					first_person_extension:destroy_screen_particles(buff.screen_space_id)
				end

				buff.screen_space_id = first_person_extension:create_screen_particles(local_screen_space_effect)
			end
		else
			local node = Unit.node(owner_unit, "j_spine") or 0
			local attach_pos = Unit.world_position(owner_unit, node)

			buff._tp_node = node

			if buff.third_person_effect_id then
				World.destroy_particles(world, buff.third_person_effect_id)
			end

			buff.third_person_effect_id = World.create_particles(world, third_person_effect, attach_pos)

			World.set_particles_life_time(world, buff.third_person_effect_id, buff.duration)
		end

		local attacker_unit = buff.attacker_unit

		Managers.state.achievement:trigger_event("register_shield_applied", owner_unit, attacker_unit)

		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] and ALIVE[attacker_unit] then
			local talent_extension = ScriptUnit.has_extension(attacker_unit, "talent_system")

			if not talent_extension then
				return
			end

			if talent_extension:has_talent("victor_priest_6_3") then
				local status_extension = ScriptUnit.has_extension(owner_unit, "status_system")

				if status_extension and status_extension:is_knocked_down() then
					StatusUtils.set_revived_network(owner_unit, true, attacker_unit)
					CharacterStateHelper.play_animation_event(owner_unit, "revive_complete")
					StatisticsUtil.register_revive(attacker_unit, owner_unit, Managers.player:statistics_db())
				end

				local heal_window = BuffTemplates.victor_priest_6_3_buff.buffs[1].heal_window or 3
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local damage_store_buff = buff_extension:get_buff_type("victor_priest_6_3_buff")

				if damage_store_buff then
					buff.heal_amount = 0

					local damage_table = damage_store_buff.damage_table

					if not damage_table then
						return
					end

					local temp_hp_tot = 0
					local perm_hp_tot = 0

					for i = 1, #damage_table do
						local t = Managers.time:time("game")
						local damage_instance = damage_table[i]

						if damage_instance.t and heal_window > t - damage_instance.t then
							if damage_instance.temp_hp then
								temp_hp_tot = temp_hp_tot + damage_instance.damage_taken
							else
								perm_hp_tot = perm_hp_tot + damage_instance.damage_taken
							end

							local damage_amount = damage_instance.damage_taken

							buff.heal_amount = buff.heal_amount + damage_amount
						end
					end

					damage_store_buff.damage_table = {}

					if buff.heal_amount > 0 then
						params = {
							attacker_unit = attacker_unit,
							external_optional_value = {
								temp_hp = temp_hp_tot,
								perm_hp = perm_hp_tot,
							},
						}

						buff_extension:add_buff("victor_priest_6_3_delayed_heal", params)

						local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

						if first_person_extension then
							first_person_extension:play_hud_sound_event("career_talent_priest_heal")
						end
					end
				end
			end
		end
	end,
	victor_priest_6_1_removed = function (owner_unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local data = buff.value

			if data.perm_hp > 0 then
				DamageUtils.heal_network(owner_unit, buff.attacker_unit, data.perm_hp, "career_passive")
			end

			if data.temp_hp > 0 then
				DamageUtils.heal_network(owner_unit, buff.attacker_unit, data.temp_hp, "heal_from_proc")
			end
		end
	end,
	victor_priest_on_career_skill_removed = function (owner_unit, buff, params, world)
		if buff.screen_space_id then
			local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

			if first_person_extension then
				first_person_extension:destroy_screen_particles(buff.screen_space_id)
			end
		end

		if buff.third_person_effect_id then
			World.destroy_particles(world, buff.third_person_effect_id)
		end
	end,
	victor_priest_on_career_skill_update = function (owner_unit, buff, params, world)
		if buff.third_person_effect_id then
			if ALIVE[owner_unit] then
				local node = buff._tp_node or 0
				local attach_pos = Unit.world_position(owner_unit, node)

				World.move_particles(world, buff.third_person_effect_id, attach_pos)
			else
				World.destroy_particles(world, buff.third_person_effect_id)

				buff.third_person_effect_id = nil
			end
		end
	end,
	damage_stagger_dot = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[unit] then
			local template = buff.template
			local update_frequency = template.update_frequency
			local duration = template.duration
			local health_extension = ScriptUnit.has_extension(unit, "health_system")
			local damage = buff.value
			local damage_per_tick = damage / math.round(duration / update_frequency)
			local current_health = health_extension:current_health()

			if current_health <= damage_per_tick then
				damage_per_tick = current_health - 5
			end

			if health_extension and damage_per_tick > 0 then
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local buff_to_remove = buff_extension:get_buff_type("victor_priest_4_3_buff")

				if buff_to_remove and not buff_extension:has_buff_perk("invulnerable") then
					buff_extension:remove_buff(buff_to_remove.id)
				end

				Managers.state.achievement:trigger_event("bless_delay_damage", unit, damage_per_tick)
				DamageUtils.add_damage_network(unit, unit, damage_per_tick, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, unit)

				if not buff.damage_dealt then
					buff.damage_dealt = 0
				end

				buff.damage_dealt = buff.damage_dealt + damage_per_tick
			end
		end
	end,
	victor_priest_activated_ability_nuke_start = function (owner_unit, buff, params, world)
		local third_person_effect = "fx/wp_explosion_allies"
		local local_screen_space_effect = "fx/wp_explosion_self"
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local owner_player = player_manager:unit_owner(owner_unit)
		local is_local_player = owner_player == local_player

		if is_local_player then
			local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

			if first_person_extension then
				buff.screen_space_id = first_person_extension:create_screen_particles(local_screen_space_effect)
			end
		else
			local node = Unit.node(owner_unit, "j_spine")

			buff.third_person_effect_id = ScriptWorld.create_particles_linked(world, third_person_effect, owner_unit, node, "destroy")
		end

		local player = Managers.player:owner(owner_unit)
		local is_husk = player and (player.remote or player.bot_player) or false

		if ALIVE[owner_unit] and is_husk then
			WwiseUtils.trigger_unit_event(world, "career_ability_priest_buildup_husk", owner_unit, 0)
		end
	end,
	victor_priest_activated_ability_nuke = function (owner_unit, buff, params, world)
		if buff.screen_space_id then
			local first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

			if first_person_extension then
				first_person_extension:destroy_screen_particles(buff.screen_space_id)
			end
		end

		if buff.third_person_effect_id then
			World.destroy_particles(world, buff.third_person_effect_id)
		end

		local attacker_unit = buff.attacker_unit

		if not ALIVE[attacker_unit] then
			return
		end

		local node = Unit.node(owner_unit, "j_spine")
		local position = Unit.world_position(owner_unit, node) or POSITION_LOOKUP[owner_unit]

		if not position then
			return
		end

		local explosion_template_name = "victor_priest_activated_ability_nuke"
		local explosion_template = ExplosionTemplates[explosion_template_name]
		local rotation = Unit.local_rotation(owner_unit, 0)
		local scale = 1
		local damage_source = "career_ability"
		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")
		local career_power_level = career_extension:get_career_power_level()
		local is_server = Managers.state.network.is_server
		local player = Managers.player:owner(owner_unit)
		local is_husk = player and (player.remote or player.bot_player) or false

		if ALIVE[owner_unit] and is_husk then
			WwiseUtils.trigger_unit_event(world, "career_ability_priest_buildup_husk_stop", owner_unit, 0)
		end

		DamageUtils.create_explosion(world, attacker_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, attacker_unit, career_power_level, false, owner_unit)
	end,
	victor_priest_activated_noclip_apply = function (owner_unit, buff, params, world)
		local locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")

		if locomotion_extension.apply_no_clip_filter then
			locomotion_extension:apply_no_clip_filter(buff.template.no_clip_filter, "victor_priest_activated_noclip")
		end

		if Managers.state.network.is_server then
			buff.broadphase_results = {}
			buff.pushed_units = {}

			local proximity_system = Managers.state.entity:system("proximity_system")

			buff.broadphase = proximity_system.enemy_broadphase
		end
	end,
	victor_priest_activated_noclip_remove = function (owner_unit, buff, params, world)
		local locomotion_extension = ScriptUnit.extension(owner_unit, "locomotion_system")

		if locomotion_extension.remove_no_clip_filter then
			locomotion_extension:remove_no_clip_filter("victor_priest_activated_noclip")
		end
	end,
	victor_priest_activated_noclip_update = function (owner_unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local push_cooldown = template.push_cooldown
		local push_radius = template.push_radius
		local stagger_impact = template.stagger_impact
		local stagger_distance = template.stagger_distance
		local broadphase_results = buff.broadphase_results
		local pushed_units = buff.pushed_units
		local broadphase = buff.broadphase
		local t = params.t
		local position = POSITION_LOOKUP[owner_unit]
		local num_results = Broadphase.query(broadphase, position, push_radius, broadphase_results)

		for i = 1, num_results do
			local hit_unit = broadphase_results[i]
			local push_t = pushed_units[hit_unit] or 0

			if push_t < t then
				pushed_units[hit_unit] = t + push_cooldown

				local hit_unit_pos = POSITION_LOOKUP[hit_unit]
				local push_direction = Vector3.normalize(hit_unit_pos - position)

				AiUtils.stagger_target(owner_unit, hit_unit, stagger_distance, stagger_impact, push_direction, t)
			end
		end

		table.clear(broadphase_results)
	end,
}
