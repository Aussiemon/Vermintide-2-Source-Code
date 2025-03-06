-- chunkname: @scripts/managers/achievements/achievement_templates_belakor.lua

local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.belakor
local rpc_increment_stat = AchievementTemplateHelper.rpc_increment_stat
local rpc_modify_stat = AchievementTemplateHelper.rpc_modify_stat
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local XB1_ACHIEVEMENT_ID = {}
local PS4_ACHIEVEMENT_ID = {}
local register_damage_stats_id = 1
local register_damage_victim_unit = 2
local register_damage_damage_data = 3
local register_damage_attacker_unit = 4
local register_damage_target_breed = 5
local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4

achievements.blk_complete_arena = {
	desc = "achv_blk_complete_arena_desc",
	display_completion_ui = true,
	icon = "achievement_morris_complete_arena",
	name = "achv_blk_complete_arena_name",
	completed = function (statistics_db, stats_id)
		return AchievementTemplateHelper.check_level(statistics_db, stats_id, "arena_belakor")
	end,
}
achievements.blk_three_champions = {
	desc = "achv_blk_three_champions_desc",
	display_completion_ui = true,
	icon = "achievement_morris_shadow_champions_active",
	name = "achv_blk_three_champions_name",
	events = {
		"register_lieutenant_spawned",
		"register_kill",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_three_champions") > 0
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_lieutenant_spawned" then
			if not template_data.num_champs then
				template_data.num_champs = 0
			end

			template_data.num_champs = template_data.num_champs + 1

			if template_data.num_champs >= 3 then
				statistics_db:increment_stat(stats_id, "blk_three_champions")
			end
		else
			if not template_data.num_champs then
				template_data.num_champs = 0
			end

			local killed_breed = event_data[register_kill_victim_breed]

			if killed_breed and killed_breed.name and killed_breed.name == "shadow_lieutenant" then
				template_data.num_champs = template_data.num_champs - 1
			end
		end
	end,
}
achievements.blk_fast_arena = {
	desc = "achv_blk_fast_arena_desc",
	display_completion_ui = true,
	icon = "achievement_morris_complete_arena_fast",
	name = "achv_blk_fast_arena_name",
	events = {
		"register_locus_destroyed",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_fast_arena") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_t = Managers.time:time("game")

		if not template_data.locus_destroyed then
			template_data.locus_destroyed = 0
		end

		template_data.locus_destroyed = template_data.locus_destroyed + 1

		if template_data.locus_destroyed >= 3 and current_t <= 240 then
			statistics_db:increment_stat(stats_id, "blk_fast_arena")
		end
	end,
}

local totem_life_time_threshold = 10

achievements.blk_fast_kill_totems = {
	desc = "achv_blk_fast_kill_totems_desc",
	display_completion_ui = true,
	icon = "achievement_morris_complete_arena_totems_destroyed",
	name = "achv_blk_fast_kill_totems_name",
	events = {
		"register_totem_state_change",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_fast_kill_totems") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not template_data.failed then
			if event_name == "register_totem_state_change" then
				if not template_data.totem_life_time then
					template_data.totem_life_time = {}
				end

				if not template_data.active_totems then
					template_data.active_totems = 0
				end

				local current_t = Managers.time:time("game")
				local spawned_unit = event_data[1]
				local has_spawned = event_data[2]

				if has_spawned == true then
					template_data.totem_life_time[spawned_unit] = current_t
				else
					local spawn_time = template_data.totem_life_time[spawned_unit]

					if spawn_time and current_t - spawn_time > totem_life_time_threshold then
						template_data.failed = true
					end

					template_data.totem_life_time[spawned_unit] = nil
				end
			elseif template_data.totem_life_time then
				local current_t = Managers.time:time("game")
				local failed = false

				for unit, spawn_t in pairs(template_data.totem_life_time) do
					if current_t - spawn_t > totem_life_time_threshold then
						failed = true

						break
					end
				end

				if not failed and Managers.state.game_mode:has_activated_mutator("curse_belakor_totems") then
					statistics_db:increment_stat(stats_id, "blk_fast_kill_totems")
				end
			end
		end
	end,
}

local synced_destruction_window = 2

achievements.blk_synced_destruction = {
	desc = "achv_blk_synced_destruction_desc",
	display_completion_ui = true,
	icon = "achievement_morris_destroy_locis",
	name = "achv_blk_synced_destruction_name",
	events = {
		"register_locus_destroyed",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_synced_destruction") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_t = Managers.time:time("game")

		if not template_data.locus_destroyed then
			template_data.locus_destroyed = {}
		end

		template_data.locus_destroyed[#template_data.locus_destroyed + 1] = current_t

		if #template_data.locus_destroyed >= 3 and template_data.locus_destroyed[#template_data.locus_destroyed] - template_data.locus_destroyed[1] <= synced_destruction_window then
			statistics_db:increment_stat(stats_id, "blk_synced_destruction")
		end
	end,
}
achievements.blk_white_run = {
	desc = "achv_blk_white_run_desc",
	display_completion_ui = true,
	icon = "achievement_morris_complete_arena_no_upgrades",
	name = "achv_blk_white_run_name",
	events = {
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_white_run") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local mechanism = Managers.mechanism:game_mechanism()

		if not mechanism or mechanism.name ~= "Deus" then
			return
		end

		local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()
		local peer_id = deus_run_controller:get_own_peer_id()
		local cursed_shrine = deus_run_controller:get_cursed_chests_purified(peer_id)
		local coins_spent = deus_run_controller:get_coins_spent()
		local level_id = event_data[2]

		if level_id ~= "arena_belakor" then
			return
		end

		if coins_spent == 0 and cursed_shrine == 0 then
			statistics_db:increment_stat(stats_id, "blk_white_run")
		end
	end,
}
achievements.blk_clutch_skull = {
	desc = "achv_blk_clutch_skull_desc",
	display_completion_ui = true,
	icon = "achievement_morris_destroy_skulls_before_hit",
	name = "achv_blk_clutch_skull_name",
	events = {
		"register_damage",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "blk_clutch_skull")

		return {
			completed,
			5,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_clutch_skull") >= 5
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local victim_breed = event_data[register_damage_target_breed]
		local victim_unit = event_data[register_damage_victim_unit]
		local attacker_unit = event_data[register_damage_attacker_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if local_player_unit ~= attacker_unit then
			return
		end

		if victim_breed and victim_breed.name and victim_breed.name == "shadow_skull" then
			local target_pos = POSITION_LOOKUP[victim_unit]
			local side = Managers.state.side.side_by_unit[attacker_unit]

			if not side then
				return
			end

			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local num_units = #player_and_bot_units
			local saved = false

			for i = 1, num_units do
				local unit = player_and_bot_units[i]

				if Unit.alive(unit) and unit ~= attacker_unit then
					local unit_position = POSITION_LOOKUP[unit]
					local distance = Vector3.distance(target_pos, unit_position)

					if distance < 3 then
						saved = true
					end
				end
			end

			if saved then
				statistics_db:increment_stat(stats_id, "blk_clutch_skull")
			end
		end
	end,
}
achievements.blk_no_totem = {
	desc = "achv_blk_no_totem_desc",
	display_completion_ui = true,
	icon = "achievement_morris_complete_arena_totems_alive",
	name = "achv_blk_no_totem_name",
	events = {
		"register_kill",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_no_totem") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_kill" then
			local killed_breed = event_data[register_kill_victim_breed]

			if killed_breed and killed_breed.name == "shadow_totem" then
				template_data.failed = true
			end
		elseif Managers.state.game_mode:has_activated_mutator("curse_belakor_totems") and not template_data.failed then
			statistics_db:increment_stat(stats_id, "blk_no_totem")
		end
	end,
}
achievements.blk_hitless_skull = {
	desc = "achv_blk_hitless_skull_desc",
	display_completion_ui = true,
	icon = "achievement_morris_destroy_skulls_within_time",
	name = "achv_blk_hitless_skull_name",
	events = {
		"register_skull_hit",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "blk_hitless_skull") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_skull_hit" then
			local hit_unit = event_data[1]
			local local_player = Managers.player:local_player()
			local local_player_unit = local_player and local_player.player_unit

			if hit_unit == local_player_unit then
				template_data.failed = true
			end
		elseif Managers.state.game_mode:has_activated_mutator("curse_shadow_homing_skulls") and not template_data.failed then
			statistics_db:increment_stat(stats_id, "blk_hitless_skull")
		end
	end,
}

local all_challenges = {
	"blk_complete_arena",
	"blk_three_champions",
	"blk_fast_arena",
	"blk_synced_destruction",
	"blk_fast_kill_totems",
	"blk_white_run",
	"blk_clutch_skull",
	"blk_no_totem",
	"blk_hitless_skull",
}

add_meta_challenge(achievements, "complete_all_belakor_challenges", all_challenges, "achievement_morris_complete_all_challenges", nil, nil, nil)
