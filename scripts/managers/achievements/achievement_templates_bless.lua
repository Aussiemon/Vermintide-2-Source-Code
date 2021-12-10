-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.woods
local rpc_increment_stat = AchievementTemplateHelper.rpc_increment_stat
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_career_mission_count_challenge = AchievementTemplateHelper.add_career_mission_count_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge

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
local register_damage_stats_id = 1
local register_damage_victim_unit = 2
local register_damage_damage_data = 3
local register_damage_attacker_unit = 4
local register_damage_target_breed = 5
local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4
local on_hit_hit_unit = 1
local on_hit_attack_type = 2
local on_hit_hit_zone_name = 3
local on_hit_target_number = 4
local on_hit_buff_type = 5
local on_hit_is_critical = 6
local on_hit_unmodified = 7
local on_hit_unit = 8
local main_game_levels = HelmgartLevels

add_levels_complete_per_hero_challenge(achievements, "bless_complete_all_helmgart_levels", main_game_levels, 2, "wh_priest", false, "achievement_trophy_bless_complete_all_helmgart_levels_wh_priest", "bless", nil, nil)

local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}

add_career_mission_count_challenge(achievements, "bless_complete_25_missions", "completed_career_levels", "wh_priest", difficulties, 25, nil, "achievement_trophy_bless_complete_25_missions_wh_priest", "bless", nil, nil)

local bless_heal_allies_amount = 1500
achievements.bless_heal_allies = {
	name = "achv_bless_heal_allies_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_heal_allies_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_bless_heal_allies",
	required_dlc = "bless",
	events = {
		"register_heal"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_heal_allies")

		return {
			completed,
			bless_heal_allies_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_heal_allies_amount <= statistics_db:get_persistent_stat(stats_id, "bless_heal_allies")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local healer_unit = event_data[1]
		local healed_unit = event_data[2]
		local heal_amount = event_data[3]
		local heal_type = event_data[4]
		local local_player_unit = Managers.player:local_player().player_unit

		if not healed_unit or local_player_unit ~= healer_unit then
			return
		end

		if healer_unit == healed_unit then
			return
		end

		local career_extension = ScriptUnit.has_extension(healer_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		statistics_db:modify_stat_by_amount(stats_id, "bless_heal_allies", heal_amount)
	end
}
local bless_saved_by_perk_amount = 5
achievements.bless_saved_by_perk = {
	name = "achv_bless_saved_by_perk_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_saved_by_perk_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_bless_saved_by_perk",
	required_dlc = "bless",
	events = {
		"register_damage_taken",
		"player_dead",
		"player_knocked_down"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_saved_by_perk")

		return {
			completed,
			bless_saved_by_perk_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_saved_by_perk_amount <= statistics_db:get_persistent_stat(stats_id, "bless_saved_by_perk")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_damage_taken" then
			local victim_unit = event_data[1]
			local damage_data = event_data[2]

			if not damage_data then
				return
			end

			local local_player_unit = Managers.player:local_player().player_unit

			if not victim_unit or local_player_unit ~= victim_unit then
				return
			end

			local career_extension = ScriptUnit.has_extension(victim_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "wh_priest" then
				return
			end

			local health_extension = ScriptUnit.extension(victim_unit, "health_system")
			local current_health = health_extension:current_health()
			local damage_amount = damage_data[DamageDataIndex.DAMAGE_AMOUNT]
			local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]
			local result = current_health - damage_amount

			if result < 6 and damage_type == "life_tap" then
				local timer_handles = template_data.timer_handles or {}
				template_data.timer_handles = timer_handles
				local current_victim_handle = timer_handles[victim_unit]

				if not current_victim_handle or not current_victim_handle.valid then
					timer_handles[victim_unit] = Managers.state.achievement:register_timed_event("bless_saved_by_perk", "on_timed_event", 5, victim_unit)
				end
			end
		elseif template_data.timer_handles then
			local player = event_data[1]
			local victim_unit = player and player.player_unit
			local timer_handles = template_data.timer_handles
			local current_victim_handle = timer_handles[victim_unit]

			if current_victim_handle and current_victim_handle.valid then
				timer_handles[victim_unit] = Managers.state.achievement:cancel_timed_event(current_victim_handle)
				timer_handles[victim_unit] = nil
			end
		end
	end,
	on_timed_event = function (statistics_db, stats_id, template_data, event_data)
		local victim_unit = event_data

		if ALIVE[victim_unit] and AiUtils.unit_alive(victim_unit) then
			statistics_db:increment_stat(stats_id, "bless_saved_by_perk")

			template_data.timer_handles[victim_unit] = nil
		end
	end
}
bless_book_run_amount = 5
achievements.bless_book_run = {
	name = "achv_bless_book_run_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_book_run_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_bless_book_run",
	required_dlc = "bless",
	events = {
		"register_completed_level"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_book_run")

		return {
			completed,
			bless_book_run_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_book_run_amount <= statistics_db:get_persistent_stat(stats_id, "bless_book_run")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local career_name = event_data[3]

		if career_name == "wh_priest" then
			local player = event_data[4]

			if player and not player.bot_player then
				local player_unit = player.player_unit
				local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

				if not inventory_extension then
					return
				end

				local slot_data_tome = inventory_extension:get_slot_data("slot_healthkit")
				local slot_data_grim = inventory_extension:get_slot_data("slot_potion")

				if not slot_data_grim or not slot_data_tome then
					return
				end

				local tome_template = slot_data_tome.item_template
				local grim_template = slot_data_grim.item_template

				if tome_template.is_grimoire and grim_template.is_grimoire then
					statistics_db:increment_stat(stats_id, "bless_book_run")
				end
			end
		end
	end
}
local bless_fast_shield_amount = 10
local bless_fast_shield_window = 1
achievements.bless_fast_shield = {
	name = "achv_bless_fast_shield_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_fast_shield_desc",
	display_completion_ui = true,
	icon = "achievement_trophy_bless_fast_shield",
	required_dlc = "bless",
	events = {
		"register_shield_applied",
		"register_player_disabled"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_fast_shield")

		return {
			completed,
			bless_fast_shield_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_fast_shield_amount <= statistics_db:get_persistent_stat(stats_id, "bless_fast_shield")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "register_shield_applied" then
			local shielded_unit = event_data[1]
			local priest_unit = event_data[2]
			local local_player_unit = Managers.player:local_player().player_unit

			if not shielded_unit or local_player_unit ~= priest_unit then
				return
			end

			local status_extension = ScriptUnit.has_extension(shielded_unit, "status_system")

			if not status_extension then
				return
			end

			local is_incapacitated = status_extension:is_pounced_down() or status_extension:is_grabbed_by_pack_master() or status_extension:is_grabbed_by_corruptor()

			if not is_incapacitated then
				return
			end

			local incapacitated_t = template_data.incapacitated_units[shielded_unit]

			if not incapacitated_t then
				return
			end

			local time_of_shielding = Managers.time:time("game")
			local timing = time_of_shielding - incapacitated_t

			if timing <= bless_fast_shield_window and timing >= 0 then
				statistics_db:increment_stat(stats_id, "bless_fast_shield")
			end
		else
			local incapacitated_units = template_data.incapacitated_units or {}
			local current_t = Managers.time:time("game")

			for unit, incapacitated_t in pairs(incapacitated_units) do
				if not ALIVE[unit] or bless_fast_shield_window < current_t - incapacitated_t then
					incapacitated_units[unit] = nil
				end
			end

			local unit = event_data[1]
			incapacitated_units[unit] = current_t
			template_data.incapacitated_units = incapacitated_units
		end
	end
}
local bless_unbreakable_damage_block_amount = 500
achievements.bless_unbreakable_damage_block = {
	display_completion_ui = true,
	name = "achv_bless_unbreakable_damage_block_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_unbreakable_damage_block_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_unbreakable_damage_block",
	required_dlc = "bless",
	events = {
		"bless_delay_damage"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_unbreakable_damage_block")

		return {
			completed,
			bless_unbreakable_damage_block_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_unbreakable_damage_block_amount <= statistics_db:get_persistent_stat(stats_id, "bless_unbreakable_damage_block")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local victim_unit = event_data[1]
		local damage_amount = event_data[2]
		local local_player_unit = Managers.player:local_player().player_unit

		if not damage_amount or not victim_unit or local_player_unit ~= victim_unit then
			return
		end

		local buff_extension = ScriptUnit.has_extension(victim_unit, "buff_system")

		if not buff_extension then
			return
		end

		if buff_extension:num_buff_stacks("victor_priest_activated_ability_invincibility") <= 0 and buff_extension:num_buff_stacks("victor_priest_activated_ability_invincibility_improved") <= 0 then
			return
		end

		damage_amount = DamageUtils.networkify_damage(damage_amount)

		statistics_db:modify_stat_by_amount(stats_id, "bless_unbreakable_damage_block", damage_amount)
	end
}
local bless_punch_back_time_window = 3
achievements.bless_punch_back = {
	required_dlc = "bless",
	name = "achv_bless_punch_back_name",
	required_dlc_extra = "bless",
	display_completion_ui = true,
	desc = "achv_bless_punch_back_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_punch_back",
	always_run = true,
	events = {
		"register_damage_taken",
		"register_damage"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_punch_back") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		if event_name == "register_damage_taken" then
			local victim_unit = event_data[1]
			local damage_data = event_data[2]
			local attacker_unit = damage_data and damage_data[DamageDataIndex.ATTACKER]

			if not ALIVE[attacker_unit] or not ALIVE[victim_unit] then
				return
			end

			local career_extension = ScriptUnit.has_extension(victim_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "wh_priest" then
				return
			end

			local attacker_bb = BLACKBOARDS[attacker_unit]
			local attacker_breed = attacker_bb and attacker_bb.breed

			if attacker_breed and attacker_breed.name ~= "chaos_warrior" then
				return
			end

			local ai_extension = ScriptUnit.has_extension(attacker_unit, "ai_system")
			local bt_node_name = ai_extension and ai_extension:current_action_name()

			if bt_node_name == "special_attack_quick" then
				local t = Managers.time:time("game")

				if not template_data.last_hit then
					template_data.last_hit = {
						[attacker_unit] = t
					}
					template_data.last_hit_n = 1
				else
					template_data.last_hit[attacker_unit] = t
					template_data.last_hit_n = template_data.last_hit_n + 1
				end

				if template_data.last_hit_n >= 10 then
					local last_hit_buffer = template_data.last_hit
					local last_hit_n = template_data.last_hit_n

					for unit, attack_t in nil do
						if not ALIVE[unit] or t > attack_t + bless_punch_back_time_window then
							last_hit_buffer[unit] = nil
							last_hit_n = last_hit_n - 1
						end
					end

					template_data.last_hit_n = last_hit_n
				end
			end
		elseif template_data.last_hit then
			local victim_unit = event_data[register_damage_victim_unit]
			local last_attack_t = template_data.last_hit[victim_unit]

			if last_attack_t then
				local damage_data = event_data[register_damage_damage_data]
				local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]
				local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
				local is_punch_attack = damage_source == "wh_2h_hammer" and damage_type == "stab_smiter"
				local t = Managers.time:time("game")

				if is_punch_attack and t - last_attack_t <= bless_punch_back_time_window then
					local attacker_unit = event_data[register_damage_attacker_unit]

					rpc_increment_stat(attacker_unit, "bless_punch_back")
				else
					template_data.last_hit[victim_unit] = nil
					template_data.last_hit_n = template_data.last_hit_n - 1
				end
			end
		end
	end
}
achievements.bless_cluch_revive = {
	display_completion_ui = true,
	name = "achv_bless_cluch_revive_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_cluch_revive_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_cluch_revive",
	required_dlc = "bless",
	events = {
		"register_revive"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_cluch_revive") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local reviver = event_data[1]
		local revivee = event_data[2]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not ALIVE[revivee] or not ALIVE[reviver] or local_player_unit ~= reviver then
			return
		end

		local career_extension = ScriptUnit.has_extension(reviver, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local buff_extension = ScriptUnit.has_extension(reviver, "buff_system")

		if not buff_extension then
			return
		end

		if buff_extension:num_buff_stacks("victor_priest_activated_ability_invincibility") <= 0 and buff_extension:num_buff_stacks("victor_priest_activated_ability_invincibility_improved") <= 0 then
			return
		end

		local side = Managers.state.side.side_by_unit[reviver]

		if not side then
			return
		end

		local player_units = side.PLAYER_AND_BOT_UNITS

		if not player_units then
			return
		end

		for i = 1, #player_units, 1 do
			local other_player = player_units[i]

			if other_player ~= reviver then
				local status_ext = ScriptUnit.has_extension(other_player, "status_system")

				if status_ext and not status_ext:is_knocked_down() and not status_ext:is_dead() and not status_ext:is_ready_for_assisted_respawn() then
					return
				end
			end
		end

		statistics_db:increment_stat(stats_id, "bless_cluch_revive")
	end
}
local bless_ranged_raki_count = 2
local bless_ranged_raki_breeds = {
	skaven_ratling_gunner = true,
	skaven_warpfire_thrower = true
}
achievements.bless_ranged_raki = {
	display_completion_ui = true,
	name = "achv_bless_ranged_raki_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_ranged_raki_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_ranged_raki",
	required_dlc = "bless",
	events = {
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_ranged_raki") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local breed = event_data[register_kill_victim_breed]

		if not breed or not bless_ranged_raki_breeds[breed.name] then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if not buff_extension then
			return
		end

		local current_buff = buff_extension:get_buff_type("victor_priest_activated_ability_invincibility") or buff_extension:get_buff_type("victor_priest_activated_ability_invincibility_improved")

		if current_buff then
			if not template_data.last_buff_id or not current_buff or template_data.last_buff_id ~= current_buff.id then
				template_data.last_buff_id = current_buff.id
				template_data.kill_count = 0
			end

			template_data.kill_count = template_data.kill_count + 1

			if bless_ranged_raki_count <= template_data.kill_count then
				statistics_db:increment_stat(stats_id, "bless_ranged_raki")
			end
		end
	end
}
local bless_chaos_warriors_count = 5
achievements.bless_chaos_warriors = {
	display_completion_ui = true,
	name = "achv_bless_chaos_warriors_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_chaos_warriors_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_chaos_warriors",
	required_dlc = "bless",
	events = {
		"register_kill",
		"righteous_fury_start",
		"righteous_fury_end",
		"player_dead"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_chaos_warriors") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if event_name == "righteous_fury_start" and event_data[2] then
			template_data.righteous_fury_active = true
			template_data.kill_count = 0
		elseif (event_name == "righteous_fury_end" and event_data[2]) or (event_name == "player_dead" and event_data[1] and event_data[1].local_player) then
			template_data.righteous_fury_active = false
		elseif template_data.righteous_fury_active then
			local breed = event_data[register_kill_victim_breed]

			if breed and breed.name == "chaos_warrior" then
				template_data.kill_count = template_data.kill_count + 1

				if bless_chaos_warriors_count <= template_data.kill_count then
					statistics_db:increment_stat(stats_id, "bless_chaos_warriors")
				end
			end
		end
	end
}
local bless_very_righteous_length = 50
achievements.bless_very_righteous = {
	display_completion_ui = true,
	name = "achv_bless_very_righteous_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_very_righteous_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_very_righteous",
	required_dlc = "bless",
	events = {
		"righteous_fury_start",
		"righteous_fury_end",
		"player_dead"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_very_righteous") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local t = Managers.time:time("game")

		if event_name == "righteous_fury_start" and event_data[2] then
			template_data.righteous_fury_active = t
		elseif (event_name == "righteous_fury_end" and event_data[2]) or (event_name == "player_dead" and event_data[1] and event_data[1].local_player) then
			local last_activated_t = template_data.righteous_fury_active

			if last_activated_t and bless_very_righteous_length <= t - last_activated_t then
				statistics_db:increment_stat(stats_id, "bless_very_righteous")
			end
		end
	end
}
local bless_smite_enemies_amount = 250
achievements.bless_smite_enemies = {
	display_completion_ui = true,
	name = "achv_bless_smite_enemies_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_smite_enemies_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_smite_enemies",
	required_dlc = "bless",
	events = {
		"register_kill"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_smite_enemies")

		return {
			completed,
			bless_smite_enemies_amount
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_smite_enemies_amount <= statistics_db:get_persistent_stat(stats_id, "bless_smite_enemies")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data and damage_data[DamageDataIndex.ATTACKER]

		if not ALIVE[attacker_unit] then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_type = damage_data and damage_data[DamageDataIndex.DAMAGE_TYPE]
		local damage_source = damage_data and damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_type ~= "buff" or damage_source ~= "career_ability" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		statistics_db:increment_stat(stats_id, "bless_smite_enemies")
	end
}
local bless_great_hammer_headshots_count = 40
achievements.bless_great_hammer_headshots = {
	display_completion_ui = true,
	name = "achv_bless_great_hammer_headshots_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_great_hammer_headshots_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_great_hammer_headshots",
	required_dlc = "bless",
	events = {
		"on_hit"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_great_hammer_headshots")

		return {
			completed,
			bless_great_hammer_headshots_count
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_great_hammer_headshots_count <= statistics_db:get_persistent_stat(stats_id, "bless_great_hammer_headshots")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local attacker_unit = event_data[on_hit_unit]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not ALIVE[attacker_unit] or not local_player_unit or local_player_unit ~= attacker_unit then
			return
		end

		local hit_zone_name = event_data[on_hit_hit_zone_name]

		if hit_zone_name ~= "head" then
			return
		end

		local attack_type = event_data[on_hit_attack_type]

		if attack_type ~= "heavy_attack" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

		if inventory_extension then
			local slot_data = inventory_extension:get_wielded_slot_data()
			local item_data = slot_data and slot_data.item_data

			if item_data and item_data.name == "wh_2h_hammer" then
				statistics_db:increment_stat(stats_id, "bless_great_hammer_headshots")
			end
		end
	end
}
local bless_kill_specials_hammer_book_map = {
	skaven_ratling_gunner = 8,
	skaven_poison_wind_globadier = 2,
	chaos_corruptor_sorcerer = 32,
	chaos_vortex_sorcerer = 64,
	skaven_pack_master = 4,
	skaven_warpfire_thrower = 16,
	beastmen_standard_bearer = 128,
	skaven_gutter_runner = 1
}
local bless_kill_specials_hammer_book_map_n = 8
local bless_kill_specials_hammer_book_complete = 255
achievements.bless_kill_specials_hammer_book = {
	display_completion_ui = true,
	name = "achv_bless_kill_specials_hammer_book_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_kill_specials_hammer_book_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_kill_specials_hammer_book",
	required_dlc = "bless",
	events = {
		"register_kill"
	},
	progress = function (statistics_db, stats_id, template_data)
		local killed_specials_n = 0
		local killed_specials_bitfield = statistics_db:get_persistent_stat(stats_id, "bless_kill_specials_hammer_book")

		for breed_name, mask in pairs(bless_kill_specials_hammer_book_map) do
			if bit.band(killed_specials_bitfield, mask) == mask then
				killed_specials_n = killed_specials_n + 1
			end
		end

		return {
			killed_specials_n,
			bless_kill_specials_hammer_book_map_n
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_kill_specials_hammer_book_complete <= statistics_db:get_persistent_stat(stats_id, "bless_kill_specials_hammer_book")
	end,
	requirements = function (statistics_db, stats_id)
		local out_table = {}
		local out_n = 0
		local killed_specials_bitfield = statistics_db:get_persistent_stat(stats_id, "bless_kill_specials_hammer_book")

		for breed_name, mask in pairs(bless_kill_specials_hammer_book_map) do
			local completed = bit.band(killed_specials_bitfield, mask) == mask
			out_n = out_n + 1
			out_table[out_n] = {
				name = breed_name,
				completed = completed
			}
		end

		return out_table
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local breed = event_data[register_kill_victim_breed]

		if not breed then
			return
		end

		local mask = bless_kill_specials_hammer_book_map[breed.name]

		if not mask then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "wh_hammer_book" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

		if not inventory_extension then
			return
		end

		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)
		local current_sub_action = current_action_settings and current_action_settings.lookup_data.sub_action_name

		if current_sub_action ~= "heavy_attack_stab_charged" and current_sub_action ~= "heavy_attack_left_charged" then
			return
		end

		local killed_specials_bitfield = statistics_db:get_persistent_stat(stats_id, "bless_kill_specials_hammer_book")

		if bit.band(killed_specials_bitfield, mask) == 0 then
			killed_specials_bitfield = bit.bor(killed_specials_bitfield, mask)

			statistics_db:set_stat(stats_id, "bless_kill_specials_hammer_book", killed_specials_bitfield)
		end
	end
}
achievements.bless_mighty_blow = {
	display_completion_ui = true,
	name = "achv_bless_mighty_blow_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_mighty_blow_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_mighty_blow",
	required_dlc = "bless",
	events = {
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_mighty_blow") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local breed = event_data[register_kill_victim_breed]

		if not breed or breed.name ~= "chaos_exalted_champion_warcamp" then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data and damage_data[DamageDataIndex.ATTACKER]

		if not ALIVE[attacker_unit] then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit or local_player_unit ~= attacker_unit then
			return
		end

		local damage_type = damage_data and damage_data[DamageDataIndex.DAMAGE_TYPE]
		local damage_source = damage_data and damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local is_punch_attack = damage_source == "wh_2h_hammer" and damage_type == "stab_smiter"

		if not is_punch_attack then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		statistics_db:increment_stat(stats_id, "bless_mighty_blow")
	end
}
local bless_block_attacks_count = 800
achievements.bless_block_attacks = {
	required_dlc = "bless",
	name = "achv_bless_block_attacks_name",
	required_dlc_extra = "bless",
	display_completion_ui = true,
	desc = "achv_bless_block_attacks_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_block_attacks",
	always_run = true,
	events = {
		"register_damage_resisted_immune"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_block_attacks")

		return {
			completed,
			bless_block_attacks_count
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_block_attacks_count <= statistics_db:get_persistent_stat(stats_id, "bless_block_attacks")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local victim_unit = event_data[1]
		local attacker_unit = event_data[2]
		local damage_type = event_data[3]

		if not ALIVE[attacker_unit] or not ALIVE[victim_unit] then
			return
		end

		if victim_unit == attacker_unit then
			return
		end

		if damage_type == "buff" or damage_type == "push" then
			return
		end

		local buff_extension = ScriptUnit.has_extension(victim_unit, "buff_system")

		if not buff_extension then
			return
		end

		local current_buff = buff_extension:get_buff_type("victor_priest_activated_ability_invincibility") or buff_extension:get_buff_type("victor_priest_activated_ability_invincibility_improved")

		if not current_buff then
			return
		end

		local source_unit = current_buff.attacker_unit

		if ALIVE[source_unit] then
			rpc_increment_stat(source_unit, "bless_block_attacks")
		end
	end
}
local bless_righteous_stagger_count = 800
achievements.bless_righteous_stagger = {
	required_dlc = "bless",
	name = "achv_bless_righteous_stagger_name",
	required_dlc_extra = "bless",
	display_completion_ui = true,
	desc = "achv_bless_righteous_stagger_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_righteous_stagger",
	always_run = true,
	events = {
		"register_ai_stagger"
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "bless_righteous_stagger")

		return {
			completed,
			bless_righteous_stagger_count
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return bless_righteous_stagger_count <= statistics_db:get_persistent_stat(stats_id, "bless_righteous_stagger")
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local target_unit = event_data[1]
		local attacker_unit = event_data[2]

		if not ALIVE[attacker_unit] or not ALIVE[target_unit] then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local passive = career_extension:get_passive_ability(1)

		if passive and passive:is_active() then
			rpc_increment_stat(attacker_unit, "bless_righteous_stagger")
		end
	end
}
local bless_charged_hammer_hit_count = 60
local bless_charged_hammer_hit_window = 0.2
achievements.bless_charged_hammer = {
	display_completion_ui = true,
	name = "achv_bless_charged_hammer_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_charged_hammer_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_charged_hammer",
	required_dlc = "bless",
	events = {
		"register_damage"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_charged_hammer") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local damage_data = event_data[register_damage_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

		if damage_source ~= "wh_hammer_book" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local inventory_extension = ScriptUnit.has_extension(attacker_unit, "inventory_system")

		if not inventory_extension then
			return
		end

		local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
		local current_action_settings = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)
		local current_sub_action = current_action_settings and current_action_settings.lookup_data.sub_action_name

		if current_sub_action ~= "heavy_attack_stab_charged" and current_sub_action ~= "heavy_attack_left_charged" then
			return
		end

		local t = Managers.time:time("game")

		if not template_data.first_hit_t or t > template_data.first_hit_t + bless_charged_hammer_hit_window then
			template_data.first_hit_t = t
			template_data.hit_count = 0
			template_data.victim_units = {}
		end

		local victim_unit = event_data[register_damage_victim_unit]

		if t <= template_data.first_hit_t + bless_charged_hammer_hit_window and not template_data.victim_units[victim_unit] then
			template_data.hit_count = template_data.hit_count + 1
			template_data.victim_units[victim_unit] = true

			if bless_charged_hammer_hit_count <= template_data.hit_count then
				statistics_db:increment_stat(stats_id, "bless_charged_hammer")
			end
		end
	end
}
local bless_protected_killing_count = 50
achievements.bless_protected_killing = {
	display_completion_ui = true,
	name = "achv_bless_protected_killing_name",
	required_dlc_extra = "bless",
	desc = "achv_bless_protected_killing_desc",
	required_career = "wh_priest",
	icon = "achievement_trophy_bless_protected_killing",
	required_dlc = "bless",
	events = {
		"register_kill"
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "bless_protected_killing") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local career_extension = ScriptUnit.has_extension(local_player_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "wh_priest" then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

		if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if buff_extension then
			local buff = buff_extension:get_buff_type("victor_priest_activated_ability_invincibility") or buff_extension:get_buff_type("victor_priest_activated_ability_invincibility_improved")

			if buff then
				buff._bless_protected_killing_count = (buff._bless_protected_killing_count or 0) + 1

				if bless_protected_killing_count <= buff._bless_protected_killing_count then
					statistics_db:increment_stat(stats_id, "bless_protected_killing")
				end
			end
		end
	end
}
local all_challenges = {
	"bless_complete_all_helmgart_levels_wh_priest",
	"bless_complete_25_missions_wh_priest",
	"bless_saved_by_perk",
	"bless_book_run",
	"bless_heal_allies",
	"bless_fast_shield",
	"bless_unbreakable_damage_block",
	"bless_punch_back",
	"bless_cluch_revive",
	"bless_ranged_raki",
	"bless_chaos_warriors",
	"bless_very_righteous",
	"bless_smite_enemies",
	"bless_great_hammer_headshots",
	"bless_kill_specials_hammer_book",
	"bless_mighty_blow",
	"bless_block_attacks",
	"bless_righteous_stagger",
	"bless_charged_hammer",
	"bless_protected_killing"
}

add_meta_challenge(achievements, "complete_all_warrior_priest_challenges", all_challenges, "achievement_trophy_complete_all_warrior_priest_challenges", "bless", nil, nil)

return
