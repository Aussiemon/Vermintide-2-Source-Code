-- chunkname: @scripts/managers/achievements/achievement_templates_cog.lua

local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.cog
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_weapon_kill_challenge = AchievementTemplateHelper.add_weapon_kill_challenge
local add_career_mission_count_challenge = AchievementTemplateHelper.add_career_mission_count_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local add_weapon_kills_per_breeds_challenge = AchievementTemplateHelper.add_weapon_kills_per_breeds_challenge
local add_multi_stat_count_challenge = AchievementTemplateHelper.add_multi_stat_count_challenge
local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_stat_count_challenge = AchievementTemplateHelper.add_stat_count_challenge
local XB1_ACHIEVEMENT_ID = {}
local PS4_ACHIEVEMENT_ID = {}

local function rpc_increment_stat(unit, stat_name)
	local player = Managers.player:unit_owner(unit)

	if player and not player.bot_player then
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

local register_damage_stats_id = 1
local register_damage_victim_unit = 2
local register_damage_damage_data = 3
local register_damage_attacker_unit = 4
local register_damage_target_breed = 5
local rat_ogre_stagger_victim_unit = 1
local rat_ogre_stagger_blackboard = 2
local rat_ogre_stagger_attacker_unit = 3
local crank_gun_fire_unit = 1
local crank_gun_fire_spin_up_time = 2
local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4
local on_grenade_thrown_owner_unit = 1
local on_grenade_thrown_action = 2
local ammo_used_owner_unit = 1
local on_hit_hit_unit = 1
local on_hit_attack_type = 2
local on_hit_hit_zone_name = 3
local on_hit_target_number = 4
local on_hit_buff_type = 5
local on_hit_is_critical = 6
local on_hit_unmodified = 7
local on_hit_unit = 8
local clutch_pump_owner_unit = 1
local register_completed_level_difficulty_name = 1
local register_completed_level_level_id = 2
local register_completed_level_career_name = 3
local register_completed_level_player = 4
local explosive_barrel_stats_id = 1
local explosive_barrel_destroyed_unit = 2
local explosive_barrel_destroyed_damage_data = 3

achievements.cog_penta_bomb = {
	desc = "achv_cog_penta_bomb_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_penta_bomb",
	name = "achv_cog_penta_bomb_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"register_damage",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_penta_bomb") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_damage_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]
		local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		if damage_type ~= "grenade" then
			return
		end

		local target_breed = event_data[register_damage_target_breed]

		if not target_breed or not target_breed.boss then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return
		end

		local victim_unit = event_data[register_damage_victim_unit]

		if not ALIVE[template_data.current_target_unit] or template_data.current_target_unit ~= victim_unit then
			template_data.current_target_unit = victim_unit
			template_data.counter = 0
		end

		template_data.counter = template_data.counter + 1

		if template_data.counter > 4 then
			statistics_db:increment_stat(stats_id, "cog_penta_bomb")
		end
	end,
}
achievements.cog_air_bomb = {
	desc = "achv_cog_air_bomb_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_air_bomb",
	name = "achv_cog_air_bomb_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"rat_ogre_stagger",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_air_bomb") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local attacker_unit = event_data[rat_ogre_stagger_attacker_unit]
		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return false
		end

		local victim_unit = event_data[rat_ogre_stagger_victim_unit]
		local target_health_extension = ScriptUnit.has_extension(victim_unit, "health_system")
		local damage_type, hit_rec = target_health_extension:recently_damaged()

		if damage_type ~= "grenade" then
			return
		end

		local ai_extension = ScriptUnit.has_extension(victim_unit, "ai_system")
		local bt_node_name = ai_extension:current_action_name()

		if bt_node_name == "jump_slam" then
			rpc_increment_stat(attacker_unit, "cog_air_bomb")
		end
	end,
}
achievements.cog_kill_barrage = {
	desc = "achv_cog_kill_barrage_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_kill_barrage",
	name = "achv_cog_kill_barrage_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"register_kill",
		"crank_gun_fire",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_kill_barrage") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "crank_gun_fire" then
			if not template_data.time then
				template_data.time = 0
			end

			local t = Managers.time:time("game")
			local spin_up_time = event_data[crank_gun_fire_spin_up_time]

			if spin_up_time < t - template_data.time then
				template_data.kill_count = 0
			end

			template_data.time = t

			return false
		end

		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "bardin_engineer_career_skill_weapon" and damage_source ~= "bardin_engineer_career_skill_weapon_heavy" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return
		end

		template_data.kill_count = (template_data.kill_count or 0) + 1

		if template_data.kill_count >= 50 then
			statistics_db:increment_stat(stats_id, "cog_kill_barrage")
		end
	end,
}
achievements.cog_all_kill_barrage = {
	desc = "achv_cog_all_kill_barrage_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_all_kill_barrage",
	name = "achv_cog_all_kill_barrage_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"register_kill",
		"crank_gun_fire",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_all_kill_barrage") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "crank_gun_fire" then
			if not template_data.time then
				template_data.time = 0
			end

			local t = Managers.time:time("game")
			local spin_up_time = event_data[crank_gun_fire_spin_up_time]

			if spin_up_time < t - template_data.time then
				template_data.kill_count = {}
			end

			template_data.time = t

			return false
		else
			local damage_data = event_data[register_kill_damage_data]
			local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if not attacker_unit or damage_source ~= "bardin_engineer_career_skill_weapon" and damage_source ~= "bardin_engineer_career_skill_weapon_heavy" then
				return false
			end

			local local_player_unit = Managers.player:local_player().player_unit

			if local_player_unit ~= attacker_unit then
				return
			end

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			if not template_data.kill_count then
				template_data.kill_count = {}
			end

			local victim_breed = event_data[register_kill_victim_breed]

			if victim_breed then
				if victim_breed.elite then
					template_data.kill_count[1] = true
				elseif victim_breed.special then
					template_data.kill_count[2] = true
				elseif victim_breed.boss then
					template_data.kill_count[3] = true
				end

				if #template_data.kill_count >= 3 then
					statistics_db:increment_stat(stats_id, "cog_all_kill_barrage")
				end
			end
		end
	end,
}
achievements.cog_climb_kill = {
	always_run = true,
	desc = "achv_cog_climb_kill_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_climb_kill",
	name = "achv_cog_climb_kill_name",
	required_career = "dr_engineer",
	required_dlc = "cog",
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "climbing_enemies_killed")

		return {
			completed,
			100,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "climbing_enemies_killed") >= 100
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "bardin_engineer_career_skill_weapon" and damage_source ~= "bardin_engineer_career_skill_weapon_heavy" then
			return
		end

		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if not attacker_unit then
			return false
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return false
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local bb = BLACKBOARDS[victim_unit]

		if not bb then
			return
		end

		local locomotion_extension = bb.locomotion_extension

		if locomotion_extension and locomotion_extension.movement_type and locomotion_extension.movement_type == "script_driven" then
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			rpc_increment_stat(attacker_unit, "climbing_enemies_killed")
		end
	end,
}
achievements.cog_long_bomb = {
	desc = "achv_cog_long_bomb_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_long_bomb",
	name = "achv_cog_long_bomb_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"on_grenade_thrown",
		"register_kill",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_long_bomb") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "on_grenade_thrown" then
			local throw_unit = event_data[on_grenade_thrown_owner_unit]

			if not throw_unit then
				return false
			end

			local throw_position = POSITION_LOOKUP[throw_unit]

			template_data.throw_position = Vector3Box(throw_position)
		else
			if not template_data.throw_position then
				return false
			end

			local damage_data = event_data[register_kill_damage_data]
			local local_player_unit = Managers.player:local_player().player_unit
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			if attacker_unit and local_player_unit ~= attacker_unit then
				return false
			end

			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if damage_source ~= "grenade_frag_01" and damage_source ~= "grenade_frag_02" then
				return false
			end

			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			if not attacker_unit then
				return
			end

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return
			end

			local victim_breed = event_data[register_kill_victim_breed]

			if victim_breed.name == "skaven_ratling_gunner" then
				local throw_position = template_data.throw_position:unbox()
				local victim_unit = event_data[register_kill_victim_unit]
				local target_position = POSITION_LOOKUP[victim_unit]
				local distance_between = Vector3.distance(target_position, throw_position)

				if distance_between > 25 then
					statistics_db:increment_stat(stats_id, "cog_long_bomb")
				end
			end
		end
	end,
}
achievements.cog_steam_alt = {
	desc = "achv_cog_steam_alt_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_steam_alt",
	name = "achv_cog_steam_alt_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"steam_alt_fire",
		"register_damage",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_steam_alt") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "steam_alt_fire" then
			if not template_data.shot_counter then
				template_data.hit_counter = 0
				template_data.shot_counter = 0
			end

			template_data.shot_counter = template_data.shot_counter + 1

			if template_data.shot_counter - template_data.hit_counter > 1 or template_data.shot_counter - template_data.hit_counter < -1 then
				template_data.hit_counter = 0
				template_data.shot_counter = 0
			end
		else
			if not template_data.shot_counter then
				return
			end

			local damage_data = event_data[register_damage_damage_data]
			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local item = rawget(ItemMasterList, damage_source)
			local is_steam_pistol = item and item.item_type == "dr_steam_pistol"

			if not is_steam_pistol then
				return
			end

			local target_breed = event_data[register_damage_target_breed]

			if not target_breed or not target_breed.boss then
				return
			end

			local attacker_unit = event_data[register_damage_attacker_unit]
			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return
			end

			template_data.hit_counter = template_data.hit_counter + 1

			if template_data.shot_counter - template_data.hit_counter >= 1 or template_data.shot_counter - template_data.hit_counter <= -1 then
				template_data.hit_counter = 0
				template_data.shot_counter = 0
			end

			if template_data.hit_counter >= 12 then
				statistics_db:increment_stat(stats_id, "cog_steam_alt")
			end
		end
	end,
}
achievements.cog_bomb_grind = {
	desc = "achv_cog_bomb_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_bomb_grind",
	name = "achv_cog_bomb_grind_name",
	required_dlc = "cog_upgrade",
	required_dlc_extra = "cog",
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "cog_bomb_kills")

		return {
			completed,
			500,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_bomb_kills") >= 500
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

		if damage_type ~= "grenade" and damage_type ~= "grenade_glance" then
			return false
		end

		local local_player_unit = Managers.player:local_player().player_unit
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return false
		end

		if (damage_type == "burninating" or damage_type == "burn") and not DamageUtils.attacker_is_fire_bomb(attacker_unit) then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source == "grenade_frag_01" or damage_source == "grenade_frag_02" or damage_source == "dot_debuff" or damage_source == "grenade_fire_01" or damage_source == "grenade_fire_02" then
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			if damage_source == "dot_debuff" then
				attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
			end

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			statistics_db:increment_stat(stats_id, "cog_bomb_kills")
		end
	end,
}
achievements.cog_chain_headshot = {
	desc = "achv_cog_chain_headshot_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_chain_headshot",
	name = "achv_cog_chain_headshot_name",
	required_dlc = "cog",
	events = {
		"on_hit",
		"ammo_used",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_chain_headshot") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "ammo_used" then
			local attacker_unit = event_data[ammo_used_owner_unit]
			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			template_data.shots_fired = template_data.shots_fired or 0
			template_data.shots_fired = template_data.shots_fired + 1
		else
			local target_number = event_data[on_hit_target_number]
			local unit = event_data[on_hit_unit]
			local attacker_unit = event_data[on_hit_unit]
			local local_player_unit = Managers.player:local_player().player_unit

			if not attacker_unit or local_player_unit ~= attacker_unit then
				return
			end

			if target_number > 1 then
				return
			end

			local attack_type = event_data[on_hit_attack_type]

			if attack_type ~= "instant_projectile" then
				return
			end

			local hit_zone_name = event_data[on_hit_hit_zone_name]

			if hit_zone_name ~= "head" then
				return
			end

			local hit_unit = event_data[on_hit_hit_unit]
			local victim_breed = hit_unit and Unit.get_data(hit_unit, "breed")

			if not victim_breed or not victim_breed.elite then
				return
			end

			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

			if inventory_extension then
				local weapon_slot = "slot_ranged"
				local get_wielded_slot_name = inventory_extension:get_wielded_slot_name()

				if get_wielded_slot_name == weapon_slot then
					local slot_data = inventory_extension:get_slot_data(weapon_slot)
					local item_data = slot_data.item_data

					if item_data.name ~= "dr_steam_pistol" then
						return
					end

					if not template_data.combo_headshots then
						template_data.combo_headshots = 0
					end

					if not template_data.shots_fired or template_data.shots_fired - template_data.combo_headshots > 1 then
						template_data.shots_fired = 1
						template_data.combo_headshots = 0
					end

					template_data.combo_headshots = template_data.combo_headshots + 1

					if template_data.combo_headshots >= 6 then
						statistics_db:increment_stat(stats_id, "cog_chain_headshot")
					end
				end
			end
		end
	end,
}
achievements.cog_pistol_headshot_grind = {
	desc = "achv_cog_pistol_headshot_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_pistol_headshot_grind",
	name = "achv_cog_pistol_headshot_grind_name",
	required_dlc = "cog",
	events = {
		"on_hit",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "steam_pistol_headshots")

		return {
			completed,
			1000,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "steam_pistol_headshots") >= 1000
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local attack_type = event_data[on_hit_attack_type]

		if attack_type ~= "instant_projectile" then
			return
		end

		local attacker_unit = event_data[on_hit_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local hit_zone_name = event_data[on_hit_hit_zone_name]

		if hit_zone_name ~= "head" then
			return
		end

		local hit_unit = event_data[on_hit_hit_unit]
		local victim_breed = hit_unit and Unit.get_data(hit_unit, "breed")

		if not victim_breed then
			return
		end

		local unit = event_data[on_hit_unit]
		local career_extension = ScriptUnit.has_extension(unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return false
		end

		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		if inventory_extension then
			local weapon_slot = "slot_ranged"
			local get_wielded_slot_name = inventory_extension:get_wielded_slot_name()

			if get_wielded_slot_name == weapon_slot then
				local slot_data = inventory_extension:get_slot_data(weapon_slot)
				local item_data = slot_data.item_data

				if item_data.name ~= "dr_steam_pistol" then
					return
				end

				statistics_db:increment_stat(stats_id, "steam_pistol_headshots")
			end
		end
	end,
}
achievements.cog_clutch_pump = {
	desc = "achv_cog_clutch_pump_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_clutch_pump",
	name = "achv_cog_clutch_pump_name",
	required_dlc = "cog",
	events = {
		"clutch_pump",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "clutch_pumps")

		return {
			completed,
			100,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "clutch_pumps") >= 100
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_keys()
		local level_settings = level_key and LevelSettings[level_key]
		local is_hub_level = level_settings and level_settings.hub_level

		if not is_hub_level then
			statistics_db:increment_stat(stats_id, "clutch_pumps")
		end
	end,
}
achievements.cog_hammer_cliff_push = {
	desc = "achv_cog_hammer_cliff_push_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_hammer_cliff_push",
	name = "achv_cog_hammer_cliff_push_name",
	required_dlc = "cog",
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "hammer_cliff_pushes")

		return {
			completed,
			200,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "hammer_cliff_pushes") >= 200
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

		if not damage_type or damage_type ~= "volume_insta_kill" and damage_type ~= "forced" then
			return
		end

		local weapon_type = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if weapon_type and weapon_type == "suicide" then
			local victim_unit = event_data[register_kill_victim_unit]
			local target_health_extension = ScriptUnit.has_extension(victim_unit, "health_system")

			if target_health_extension then
				local recent_damages = target_health_extension:recent_damages()
				local damage_source = recent_damages[DamageDataIndex.DAMAGE_SOURCE_NAME]
				local item = rawget(ItemMasterList, damage_source)
				local is_cog_hammer = item and item.item_type == "dr_cog_hammer"

				if not is_cog_hammer then
					return
				end

				local attacker_unit = recent_damages[DamageDataIndex.ATTACKER]
				local local_player_unit = Managers.player:local_player().player_unit

				if not attacker_unit or local_player_unit ~= attacker_unit then
					return
				end

				local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

				if not career_extension or career_extension:career_name() ~= "dr_engineer" then
					return false
				end

				statistics_db:increment_stat(stats_id, "hammer_cliff_pushes")
			end
		end
	end,
}
achievements.cog_only_crank = {
	desc = "achv_cog_only_crank_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_only_crank",
	name = "achv_cog_only_crank_name",
	required_dlc = "cog",
	events = {
		"register_kill",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_only_crank") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_kill" then
			if template_data.failed then
				return false
			end

			local damage_data = event_data[register_kill_damage_data]
			local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if damage_source ~= "bardin_engineer_career_skill_weapon" and damage_source ~= "bardin_engineer_career_skill_weapon_heavy" then
				template_data.failed = true

				return false
			end
		else
			local career_name = event_data[register_completed_level_career_name]

			if career_name == "dr_engineer" and not template_data.failed then
				local player = event_data[register_completed_level_player]

				if player and not player.bot_player then
					statistics_db:increment_stat(stats_id, "cog_only_crank")
				end
			end

			template_data.failed = nil
		end
	end,
}
achievements.cog_exploding_barrel_kills = {
	desc = "achv_cog_exploding_barrel_kills_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_exploding_barrel_kills",
	name = "achv_cog_exploding_barrel_kills_name",
	required_dlc = "cog",
	events = {
		"register_kill",
		"explosive_barrel_destroyed",
	},
	completed = function (statistics_db, stats_id, template_data)
		if statistics_db:get_persistent_stat(stats_id, "cog_exploding_barrel_kills") > 0 then
			print("completed")
		end

		return statistics_db:get_persistent_stat(stats_id, "cog_exploding_barrel_kills") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_kill" then
			local damage_data = event_data[register_kill_damage_data]
			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local local_player_unit = Managers.player:local_player().player_unit
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			if attacker_unit and local_player_unit ~= attacker_unit then
				return false
			end

			if damage_source ~= "explosive_barrel" then
				return false
			end

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "dr_engineer" then
				return false
			end

			local stat_name = "cog_exploding_barrel_kills"
			local kills = statistics_db:get_local_stat("cog_exploding_barrel_kills")

			if not kills then
				return false
			end

			kills = kills + 1

			if kills >= 10 then
				statistics_db:increment_stat(stats_id, stat_name)
			else
				statistics_db:set_local_stat("cog_exploding_barrel_kills", kills)
			end
		elseif event_name == "explosive_barrel_destroyed" then
			local unit = event_data[explosive_barrel_destroyed_unit]
			local damage_data = event_data[explosive_barrel_destroyed_damage_data]
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

			if unit == attacker_unit then
				statistics_db:set_local_stat("cog_exploding_barrel_kills", nil)
			else
				statistics_db:set_local_stat("cog_exploding_barrel_kills", 0)
			end
		end
	end,
}
achievements.cog_long_crank_fire = {
	desc = "achv_cog_long_crank_fire_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_long_crank_fire",
	name = "achv_cog_long_crank_fire_name",
	required_dlc = "cog",
	events = {
		"crank_gun_fire_start",
		"crank_gun_fire",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "cog_long_crank_fire") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "crank_gun_fire_start" then
			local t = Managers.time:time("game")

			template_data.start_time = t
		elseif event_name == "crank_gun_fire" then
			local fire_start = template_data.start_time
			local t = Managers.time:time("game")
			local fire_time = t - fire_start

			if fire_time >= 40 then
				statistics_db:increment_stat(stats_id, "cog_long_crank_fire")
			end
		end
	end,
}

local elite_special_breeds = {}

for breed_name, breed in pairs(Breeds) do
	if Breeds[breed_name].elite == true then
		elite_special_breeds[#elite_special_breeds + 1] = breed_name
	end

	if Breeds[breed_name].special == true then
		elite_special_breeds[#elite_special_breeds + 1] = breed_name
	end

	if breed_name == "chaos_exalted_sorcerer" then
		elite_special_breeds[#elite_special_breeds + 1] = breed_name
	end
end

local COG_ITEM_TYPE_TO_TRACKED_WEAPON = {
	bardin_engineer_career_skill_weapon = "bardin_engineer_career_skill_weapon",
	bardin_engineer_career_skill_weapon_heavy = "bardin_engineer_career_skill_weapon_heavy",
	dr_cog_hammer = "dr_2h_cog_hammer",
	dr_steam_pistol = "dr_steam_pistol",
}
local kill_register_weapons = table.set(table.keys(COG_ITEM_TYPE_TO_TRACKED_WEAPON), nil)

achievements.cog_kill_register = {
	display_completion_ui = false,
	required_dlc = "cog",
	events = {
		"register_kill",
	},
	completed = function (statistics_db, stats_id, template_data)
		local max_count = 0

		for i = 1, #elite_special_breeds do
			local count = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "dr_steam_pistol", elite_special_breeds[i])

			max_count = max_count + count
		end

		local completed_first = max_count >= 150

		max_count = 0

		local heavy_count = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "bardin_engineer_career_skill_weapon_heavy", "skaven_ratling_gunner")

		max_count = max_count + heavy_count

		local light_count = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "bardin_engineer_career_skill_weapon", "skaven_ratling_gunner")

		max_count = max_count + light_count

		local completed_second = max_count >= 15
		local corruptor = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "dr_2h_cog_hammer", "chaos_vortex_sorcerer")
		local vortex = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "dr_2h_cog_hammer", "chaos_corruptor_sorcerer")
		local halescourge = statistics_db:get_persistent_stat(stats_id, "weapon_kills_per_breed", "dr_2h_cog_hammer", "chaos_exalted_sorcerer")
		local completed_third = corruptor >= 1 and vortex >= 1 and halescourge >= 1

		return completed_first and completed_second and completed_third
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[3]
		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local item = rawget(ItemMasterList, damage_source)
		local item_type = item and item.item_type

		if not kill_register_weapons[item_type] then
			return
		end

		local attacker_unit = damage_data and damage_data[DamageDataIndex.ATTACKER]

		if not ALIVE[attacker_unit] then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit or local_player_unit ~= attacker_unit then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "dr_engineer" then
			return false
		end

		local killed_breed = event_data[4]

		if not table.contains(elite_special_breeds, killed_breed.name) then
			return false
		end

		if killed_breed and killed_breed.name then
			local stat_source_name = COG_ITEM_TYPE_TO_TRACKED_WEAPON[item_type]

			statistics_db:increment_stat(stats_id, "weapon_kills_per_breed", stat_source_name, killed_breed.name)
		end
	end,
}
achievements.cog_missing_cog = {
	allow_in_inn = true,
	desc = "achv_cog_missing_cog_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_cog_missing_cog",
	name = "achv_cog_missing_cog_name",
	required_dlc = "cog",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "cog_missing_cog") > 0
	end,
}

local act_1_levels = GameActs.act_1
local act_2_levels = GameActs.act_2
local act_3_levels = GameActs.act_3
local diff = DifficultySettings.hardest.rank

add_levels_complete_per_hero_challenge(achievements, "cog_mission_streak_act1_legend", act_1_levels, diff, "dr_engineer", true, "achievement_trophy_cog_mission_streak_act1_legend_dr_engineer", "cog_upgrade", nil, nil)
add_levels_complete_per_hero_challenge(achievements, "cog_mission_streak_act2_legend", act_2_levels, diff, "dr_engineer", true, "achievement_trophy_cog_mission_streak_act2_legend_dr_engineer", "cog_upgrade", nil, nil)
add_levels_complete_per_hero_challenge(achievements, "cog_mission_streak_act3_legend", act_3_levels, diff, "dr_engineer", true, "achievement_trophy_cog_mission_streak_act3_legend_dr_engineer", "cog_upgrade", nil, nil)
add_multi_stat_count_challenge(achievements, "cog_crank_kill", {
	"cog_kills_bardin_engineer_career_skill_weapon",
	"cog_kills_bardin_engineer_career_skill_weapon_heavy",
}, 3000, "achievement_trophy_cog_crank_kill", "cog_upgrade")
add_stat_count_challenge(achievements, "cog_hammer_axe_kills", "cog_kills_dr_2h_cog_hammer", 1000, nil, "achievement_trophy_cog_hammer_axe_kills", "cog_upgrade")

local weapons = {
	dr_2h_cog_hammer = {
		"dr_2h_cog_hammer",
	},
	dr_steam_pistol = {
		"dr_steam_pistol",
	},
	bardin_engineer_career_skill_weapon = {
		"bardin_engineer_career_skill_weapon",
		"bardin_engineer_career_skill_weapon_heavy",
	},
}

add_weapon_kills_per_breeds_challenge(achievements, "cog_crank_kill_ratling", weapons.bardin_engineer_career_skill_weapon, {
	"skaven_ratling_gunner",
}, 15, "achievement_trophy_cog_crank_kill_ratling", "cog", true, nil, nil)
add_weapon_kills_per_breeds_challenge(achievements, "cog_steam_elite_kill", weapons.dr_steam_pistol, elite_special_breeds, 150, "achievement_trophy_cog_steam_elite_kill", "cog_upgrade", true, nil, nil)
add_weapon_kills_per_breeds_challenge(achievements, "cog_hammer_kill_storm", weapons.dr_2h_cog_hammer, {
	"chaos_vortex_sorcerer",
}, 1, nil, "cog_upgrade", false, nil, nil)
add_weapon_kills_per_breeds_challenge(achievements, "cog_hammer_kill_leech", weapons.dr_2h_cog_hammer, {
	"chaos_corruptor_sorcerer",
}, 1, nil, "cog_upgrade", false, nil, nil)
add_weapon_kills_per_breeds_challenge(achievements, "cog_hammer_kill_hale", weapons.dr_2h_cog_hammer, {
	"chaos_exalted_sorcerer",
}, 1, nil, "cog_upgrade", false, nil, nil)

local main_game_levels = HelmgartLevels
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}

for i = 1, #difficulties do
	local difficulty_key = difficulties[i]
	local name = "cog_complete_all_helmgart_levels_" .. DifficultyMapping[difficulty_key]

	add_levels_complete_per_hero_challenge(achievements, name, main_game_levels, DifficultySettings[difficulty_key].rank, "dr_engineer", false, nil, "cog_upgrade", nil, nil)
end

add_career_mission_count_challenge(achievements, "cog_complete_100_missions", "completed_career_levels", "dr_engineer", difficulties, 25, nil, "achievement_trophy_cog_complete_25_missions_dr_engineer", "cog_upgrade", nil, nil)

local all_challenges = {
	"cog_climb_kill",
	"cog_chain_headshot",
	"cog_crank_kill_ratling",
	"cog_pistol_headshot_grind",
	"cog_clutch_pump",
	"cog_hammer_cliff_push",
	"cog_only_crank",
	"cog_exploding_barrel_kills",
	"cog_long_crank_fire",
	"cog_missing_cog",
	"cog_complete_100_missions_dr_engineer",
	"cog_penta_bomb",
	"cog_crank_kill",
	"cog_kill_barrage",
	"cog_all_kill_barrage",
	"cog_long_bomb",
	"cog_hammer_axe_kills",
	"cog_wizard_hammer",
	"cog_steam_elite_kill",
	"cog_steam_alt",
	"cog_bomb_grind",
}
local wizard_hammerer = {
	"cog_hammer_kill_storm",
	"cog_hammer_kill_leech",
	"cog_hammer_kill_hale",
}

add_meta_challenge(achievements, "complete_all_engineer_challenges", all_challenges, "achievement_trophy_complete_all_engineer_challenges", "cog_upgrade", nil, nil)
add_meta_challenge(achievements, "cog_wizard_hammer", wizard_hammerer, "achievement_trophy_cog_wizard_hammer", "cog_upgrade", nil, nil)
