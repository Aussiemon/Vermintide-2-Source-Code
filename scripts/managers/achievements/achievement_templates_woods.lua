local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.woods
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_weapon_kill_challenge = AchievementTemplateHelper.add_weapon_kill_challenge
local add_career_mission_count_challenge = AchievementTemplateHelper.add_career_mission_count_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local add_weapon_kills_per_breeds_challenge = AchievementTemplateHelper.add_weapon_kills_per_breeds_challenge
local add_multi_stat_count_challenge = AchievementTemplateHelper.add_multi_stat_count_challenge
local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_stat_count_challenge = AchievementTemplateHelper.add_stat_count_challenge

local function rpc_increment_stat(unit, stat_name)
	local player = Managers.player:unit_owner(unit)

	if player and not player.bot_player then
		local peer_id = player:network_id()
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

local XB1_ACHIEVEMENT_ID = {}
local PS4_ACHIEVEMENT_ID = {}
local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4
local register_damage_stats_id = 1
local register_damage_victim_unit = 2
local register_damage_damage_data = 3
local register_damage_attacker_unit = 4
local register_damage_target_breed = 5
achievements.woods_javelin_melee = {
	name = "achv_woods_javelin_melee_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_javelin_melee_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_catch_a_dying_breath",
	required_dlc = "woods",
	events = {
		"register_kill"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_javelin_melee_kills")

		return {
			completed,
			500
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_javelin_melee_kills") >= 500
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "we_javelin" then
			return
		end

		local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

		if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "we_thornsister" then
				return
			end

			statistics_db:increment_stat(stats_id, "woods_javelin_melee_kills")
		end
	end
}
achievements.woods_javelin_combo = {
	name = "achv_woods_javelin_combo_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_javelin_combo_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_dance_of_the_willow",
	required_dlc = "woods",
	events = {
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_javelin_combo") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "we_javelin" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local victim_breed = event_data[register_kill_victim_breed]
		local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

		if attack_type and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			if victim_breed and victim_breed.elite then
				template_data.timed_kill = Managers.time:time("game")
			end
		elseif attack_type and attack_type == "projectile" and template_data.timed_kill and victim_breed and victim_breed.special then
			local t = Managers.time:time("game")
			local margain = t - template_data.timed_kill

			if margain > 0 and margain < 3 then
				statistics_db:increment_stat(stats_id, "woods_javelin_combo")
			end
		end
	end
}
achievements.woods_wall_kill_grind = {
	name = "achv_woods_wall_kill_grind_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_wall_kill_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_the_awakening_of_the_woods",
	required_dlc = "woods",
	events = {
		"register_kill"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_wall_kill")

		return {
			completed,
			500
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_wall_kill") > 500
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "career_ability" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		statistics_db:increment_stat(stats_id, "woods_wall_kill")
	end
}
achievements.woods_lifted_kill = {
	name = "achv_woods_lifted_kill_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_lifted_kill_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_ancients_vengeful_embrace",
	required_dlc = "woods",
	events = {
		"register_kill"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_lift_kills")

		return {
			completed,
			250
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_lift_kills") >= 250
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if not attacker_unit then
			return false
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local bb = BLACKBOARDS[victim_unit]

		if not bb then
			return
		end

		if bb.in_vortex then
			rpc_increment_stat(attacker_unit, "woods_lift_kills")
		end
	end
}
achievements.woods_triple_lift = {
	name = "achv_woods_triple_lift_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_triple_lift_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_away_with_the_faeries",
	required_dlc = "woods",
	events = {
		"vortex_caught_unit"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_triple_lift") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local attacker_unit = event_data[1]
		local lifted_unit = event_data[2]
		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local lifted_bb = BLACKBOARDS[lifted_unit]
		local lifted_breed = lifted_bb.breed

		if not lifted_breed or not lifted_breed.special then
			return
		end

		if not template_data.lifted_units then
			template_data.lifted_units = {}
		end

		template_data.lifted_units[lifted_unit] = true
		local num_vortexed_units = 0

		for unit, data in pairs(template_data.lifted_units) do
			if AiUtils.unit_alive(unit) then
				local bb = BLACKBOARDS[unit]

				if bb and bb.in_vortex_state and (bb.in_vortex_state == "in_vortex_init" or bb.in_vortex_state == "in_vortex") then
					num_vortexed_units = num_vortexed_units + 1
				else
					template_data.lifted_units[unit] = nil
				end
			else
				template_data.lifted_units[unit] = nil
			end
		end

		if num_vortexed_units >= 3 then
			rpc_increment_stat(attacker_unit, "woods_triple_lift")
		end
	end
}
achievements.woods_heal_grind = {
	name = "achv_woods_heal_grind_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_heal_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_handmaiden_of_isha",
	required_dlc = "woods",
	events = {
		"register_heal"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_amount_healed")

		return {
			completed,
			2000
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_amount_healed") > 2000
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local healing_unit = event_data[1]
		local local_player_unit = Managers.player:local_player().player_unit

		if not healing_unit or local_player_unit ~= healing_unit then
			return
		end

		local heal_type = event_data[4]
		local amount_healed = event_data[3]

		if heal_type == "heal_from_proc" or heal_type == "career_skill" then
			return
		end

		local career_extension = ScriptUnit.has_extension(healing_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local old_amount = statistics_db:get_persistent_stat(stats_id, "woods_amount_healed")
		local new_amount = old_amount + amount_healed

		statistics_db:set_stat(stats_id, "woods_amount_healed", new_amount)
	end
}
achievements.woods_bleed_grind = {
	name = "achv_woods_bleed_grind_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_bleed_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_well_earned_agony",
	required_dlc = "woods",
	events = {
		"register_damage"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_bleed_tics")

		return {
			completed,
			2000
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_bleed_tics") > 2000
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_damage_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

		if not damage_type or damage_type ~= "bleed" then
			return
		end

		local attacker_unit = event_data[register_damage_attacker_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		statistics_db:increment_stat(stats_id, "woods_bleed_tics")
	end
}
achievements.woods_chaos_pinata = {
	name = "achv_woods_chaos_pinata_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_chaos_pinata_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_together_we",
	required_dlc = "woods",
	events = {
		"vortex_caught_unit",
		"register_damage",
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_chaos_pinata") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		if event_name == "vortex_caught_unit" then
			local attacker_unit = event_data[1]
			local lifted_unit = event_data[2]
			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "we_thornsister" then
				return
			end

			local lifted_bb = BLACKBOARDS[lifted_unit]
			local lifted_breed = lifted_bb.breed

			if not lifted_breed or not lifted_breed.name or lifted_breed.name ~= "chaos_warrior" then
				return
			end

			if not template_data.lifted_units then
				template_data.lifted_units = {}
			end

			template_data.lifted_units[lifted_unit] = {}

			for unit, data in pairs(template_data.lifted_units) do
				if not AiUtils.unit_alive(unit) then
					template_data.lifted_units[unit] = nil
				end
			end
		elseif event_name == "register_damage" then
			local victim_unit = event_data[register_damage_victim_unit]

			if not template_data.lifted_units or not template_data.lifted_units[victim_unit] then
				return
			end

			local damage_data = event_data[register_damage_damage_data]
			local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

			if not attack_type or (attack_type ~= "light_attack" and attack_type ~= "heavy_attack") then
				return
			end

			local attacker_unit = event_data[register_damage_attacker_unit]

			if not attacker_unit then
				return
			end

			local unit_list = template_data.lifted_units[victim_unit]
			local attacker_breed = Unit.get_data(attacker_unit, "breed")

			if attacker_breed and attacker_breed.is_hero then
				unit_list[attacker_unit] = true
			end
		else
			local victim_unit = event_data[register_kill_victim_unit]

			if not template_data.lifted_units or not template_data.lifted_units[victim_unit] then
				return
			end

			local bb = BLACKBOARDS[victim_unit]

			if bb and bb.in_vortex_state and (bb.in_vortex_state == "in_vortex_init" or bb.in_vortex_state == "in_vortex") then
				local num_hits = 0
				local sott_unit = nil

				for unit, data in pairs(template_data.lifted_units[victim_unit]) do
					num_hits = num_hits + 1
					local career_extension = ScriptUnit.has_extension(unit, "career_system")

					if career_extension and career_extension:career_name() == "we_thornsister" then
						sott_unit = unit
					end
				end

				if num_hits >= 2 and sott_unit then
					rpc_increment_stat(sott_unit, "woods_chaos_pinata")
				end
			end
		end
	end
}
achievements.woods_ability_combo = {
	name = "achv_woods_ability_combo_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_ability_combo_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_rippling_radiance",
	required_dlc = "woods",
	events = {
		"any_ability_used"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_ability_combo") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player_unit = Managers.player:local_player().player_unit
		local career_extension = ScriptUnit.has_extension(local_player_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local using_unit = event_data[1]
		local using_career_extension = ScriptUnit.has_extension(using_unit, "career_system")

		if not using_career_extension or using_career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local level_transition_handler = Managers.level_transition_handler
		local level_key = level_transition_handler:get_current_level_keys()
		local level_settings = LevelSettings[level_key]
		local is_hub_level = level_settings and level_settings.hub_level

		if is_hub_level then
			return
		end

		local t = Managers.time:time("game")

		if not template_data.use_times then
			template_data.use_times = {}
		end

		local use_times = template_data.use_times

		if #use_times >= 5 then
			table.remove(use_times, 1)
		end

		use_times[#use_times + 1] = t

		if #use_times >= 5 then
			local passed = true
			local time_to_check = use_times[1]

			for i = 1, #use_times, 1 do
				local checked_time = use_times[i]

				if checked_time - time_to_check > 10 then
					passed = false
				end
			end

			if passed then
				statistics_db:increment_stat(stats_id, "woods_ability_combo")
			end
		end
	end
}
achievements.woods_wall_tank = {
	name = "achv_woods_wall_tank_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_wall_tank_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_roots_of_ages",
	required_dlc = "woods",
	events = {
		"register_thorn_wall_damage"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_wall_hits_soaked")

		return {
			completed,
			1000
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_wall_hits_soaked") > 1000
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player_unit = Managers.player:local_player().player_unit
		local career_extension = ScriptUnit.has_extension(local_player_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local thorn_wall_unit = event_data[1]
		local attacker_unit = event_data[2]
		local attack_type = event_data[4]
		local attacker_breed = Unit.get_data(attacker_unit, "breed")

		if attacker_breed and not attacker_breed.is_hero then
			if attack_type then
				if attack_type ~= "projectile" then
					statistics_db:increment_stat(stats_id, "woods_wall_hits_soaked")
				end
			else
				statistics_db:increment_stat(stats_id, "woods_wall_hits_soaked")
			end
		end
	end
}
achievements.woods_wall_block_ratling = {
	name = "achv_woods_wall_block_ratling_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_wall_block_ratling_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_sheltering_thicket",
	required_dlc = "woods",
	events = {
		"register_thorn_wall_damage"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_ratling_shots_soaked")

		return {
			completed,
			500
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_ratling_shots_soaked") > 500
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player_unit = Managers.player:local_player().player_unit
		local career_extension = ScriptUnit.has_extension(local_player_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local thorn_wall_unit = event_data[1]
		local attacker_unit = event_data[2]
		local attack_type = event_data[4]
		local attacker_breed = Unit.get_data(attacker_unit, "breed")

		if attacker_breed and attacker_breed.name == "skaven_ratling_gunner" and attack_type and attack_type == "projectile" then
			statistics_db:increment_stat(stats_id, "woods_ratling_shots_soaked")
		end
	end
}
achievements.woods_bleed_boss = {
	name = "achv_woods_bleed_boss_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_bleed_boss_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_an_offering_of_pain",
	required_dlc = "woods",
	events = {
		"register_damage",
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_bleed_boss") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_damage" then
			local target_breed = event_data[register_damage_target_breed]

			if not target_breed or not target_breed.boss then
				return
			end

			local damage_data = event_data[register_damage_damage_data]
			local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

			if not damage_type or damage_type ~= "bleed" then
				return
			end

			local attacker_unit = event_data[register_damage_attacker_unit]
			local local_player_unit = Managers.player:local_player().player_unit

			if not attacker_unit or local_player_unit ~= attacker_unit then
				return
			end

			local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "we_thornsister" then
				return
			end

			local target_unit = event_data[register_damage_victim_unit]

			if not template_data.target_bosses then
				template_data.target_bosses = {}
			end

			if not template_data.target_max_healths then
				template_data.target_max_healths = {}
			end

			if not template_data.target_bosses[target_unit] then
				template_data.target_bosses[target_unit] = 0
			end

			template_data.target_bosses[target_unit] = template_data.target_bosses[target_unit] + damage_data[DamageDataIndex.DAMAGE_AMOUNT]
			local target_health_extension = ScriptUnit.has_extension(target_unit, "health_system")

			if not target_health_extension then
				return
			end

			local max_health = template_data.target_max_healths[target_unit]

			if not max_health then
				max_health = target_health_extension:get_max_health()
				template_data.target_max_healths[target_unit] = max_health
			end

			local damage_percent = template_data.target_bosses[target_unit] / max_health

			if damage_percent > 0.2 then
				statistics_db:increment_stat(stats_id, "woods_bleed_boss")
			end
		else
			if not template_data.target_bosses then
				return
			end

			local victim_breed = event_data[register_kill_victim_breed]

			if victim_breed.boss then
				for unit, damage_total in pairs(template_data.target_bosses) do
					if not AiUtils.unit_alive(unit) then
						template_data.target_bosses[unit] = nil

						if template_data.target_max_healths and template_data.target_max_healths[unit] then
							template_data.target_max_healths[unit] = nil
						end
					end
				end
			end
		end
	end
}
achievements.woods_wall_kill_gutter = {
	name = "achv_woods_wall_kill_gutter_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_wall_kill_gutter_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_shall_not_pass",
	required_dlc = "woods",
	events = {
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_wall_kill_gutter") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local target_breed = event_data[register_kill_victim_breed]

		if not target_breed or not target_breed.name or target_breed.name ~= "skaven_gutter_runner" then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "career_ability" then
			return
		end

		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local bb = BLACKBOARDS[victim_unit]
		local jump_data = bb.jump_data
		local node_name = bb.btnode_name

		if node_name and node_name == "crazy_jump" and jump_data and jump_data.state and jump_data.state == "in_air" then
			rpc_increment_stat(attacker_unit, "woods_wall_kill_gutter")
		end
	end
}
achievements.woods_wall_dual_save = {
	name = "achv_woods_wall_dual_save_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_wall_dual_save_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_thorny_rescue",
	required_dlc = "woods",
	events = {
		"register_damage"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_wall_dual_save") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local damage_data = event_data[register_damage_damage_data]
		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "career_ability" then
			return
		end

		local target_breed = event_data[register_damage_target_breed]

		if not target_breed or not target_breed.special then
			return
		end

		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local bb = BLACKBOARDS[victim_unit]

		if not target_breed.name then
			return
		end

		local hit_disabling_special = false

		if target_breed.name == "skaven_pack_master" then
			local action = bb.action
			local action_name = action and action.name

			if action_name == "pull" or action_name == "initial_pull" or action_name == "drag" or action_name == "hoist" then
				hit_disabling_special = true
			end
		elseif target_breed.name == "skaven_gutter_runner" then
			if bb.pouncing_target then
				hit_disabling_special = true
			end
		elseif target_breed.name == "chaos_corruptor_sorcerer" and bb.grabbed_unit then
			hit_disabling_special = true
		end

		if hit_disabling_special then
			local t = Managers.time:time("game")
			local last_interrupt = template_data.last_timed_interrupt

			if last_interrupt then
				local margain = t - last_interrupt

				if margain < 0.5 and margain > -0.1 then
					rpc_increment_stat(attacker_unit, "woods_wall_dual_save")
				end
			end

			template_data.last_timed_interrupt = t
		end
	end
}
achievements.woods_free_ability_grind = {
	name = "achv_woods_free_ability_grind_name",
	required_dlc_extra = "woods",
	desc = "achv_woods_free_ability_grind_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_thornsister_weaves_bounty",
	required_dlc = "woods",
	events = {
		"free_cast_used"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "woods_free_abilities_used")

		return {
			completed,
			50
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "woods_free_abilities_used") > 50
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local buffing_unit = event_data[2]
		local career_extension = ScriptUnit.has_extension(buffing_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "we_thornsister" then
			return
		end

		rpc_increment_stat(buffing_unit, "woods_free_abilities_used")
	end
}
local act_1_levels = GameActs.act_1
local act_2_levels = GameActs.act_2
local act_3_levels = GameActs.act_3
local main_game_levels = HelmgartLevels
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest"
}

for i = 1, #difficulties, 1 do
	local difficulty_key = difficulties[i]
	local difficulty_name = DifficultyMapping[difficulty_key]
	local name = "woods_complete_all_helmgart_levels_" .. difficulty_name
	local icon = "achievement_trophy_" .. difficulty_name .. "_thornsister"

	add_levels_complete_per_hero_challenge(achievements, name, main_game_levels, DifficultySettings[difficulty_key].rank, "we_thornsister", false, icon, "woods", nil, nil)
end

local diff = DifficultySettings.hardest.rank

add_career_mission_count_challenge(achievements, "woods_complete_25_missions", "completed_career_levels", "we_thornsister", difficulties, 25, nil, "achievement_trophy_thornsister_bitter_rose_among_thorns", "woods", nil, nil)

local all_challenges = {
	"woods_complete_all_helmgart_levels_recruit_we_thornsister",
	"woods_complete_all_helmgart_levels_veteran_we_thornsister",
	"woods_complete_all_helmgart_levels_champion_we_thornsister",
	"woods_complete_all_helmgart_levels_legend_we_thornsister",
	"woods_complete_25_missions_we_thornsister",
	"woods_javelin_melee",
	"woods_lifted_kill",
	"woods_javelin_combo",
	"woods_triple_lift",
	"woods_heal_grind",
	"woods_wall_kill_grind",
	"woods_bleed_grind",
	"woods_chaos_pinata",
	"woods_bleed_boss",
	"woods_wall_kill_gutter",
	"woods_wall_dual_save",
	"woods_ability_combo",
	"woods_wall_tank",
	"woods_wall_block_ratling",
	"woods_free_ability_grind"
}

add_meta_challenge(achievements, "complete_all_thorn_sister_challenges", all_challenges, "achievement_trophy_thornsister_reborn_through_the_weave", "woods", nil, nil)

return
