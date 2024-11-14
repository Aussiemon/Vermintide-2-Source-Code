-- chunkname: @scripts/managers/achievements/achievement_templates_shovel.lua

local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local achievement_settings = DLCSettings.shovel
local rpc_increment_stat = AchievementTemplateHelper.rpc_increment_stat
local rpc_modify_stat = AchievementTemplateHelper.rpc_modify_stat
local add_levels_complete_per_hero_challenge = AchievementTemplateHelper.add_levels_complete_per_hero_challenge
local add_career_mission_count_challenge = AchievementTemplateHelper.add_career_mission_count_challenge
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
local on_hit_hit_unit = 1
local on_hit_attack_type = 2
local on_hit_hit_zone_name = 3
local on_hit_target_number = 4
local on_hit_buff_type = 5
local on_hit_is_critical = 6
local on_hit_unmodified = 7
local on_hit_unit = 8
local main_game_levels = HelmgartLevels

add_levels_complete_per_hero_challenge(achievements, "shovel_complete_all_helmgart_levels", main_game_levels, 2, "bw_necromancer", false, "unexpected_saviour", "shovel", nil, nil)

local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}

add_career_mission_count_challenge(achievements, "shovel_complete_25_missions", "completed_career_levels", "bw_necromancer", difficulties, 25, nil, "creeping_death", "shovel", nil, nil)

local SAC_VENT_TARGET = 2500

achievements.shovel_sac_vent = {
	display_completion_ui = true,
	icon = "assistive_sacrifice",
	name = "achv_sac_vent_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_sac_vent_desc"), SAC_VENT_TARGET)
	end,
	events = {
		"sacrifice_skeleton",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_sac_vent")

		return {
			completed,
			SAC_VENT_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_sac_vent") >= SAC_VENT_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if global_is_inside_inn then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit then
			return
		end

		local commander_unit = event_data[3]

		if local_player_unit ~= commander_unit then
			return
		end

		local overcharge_fraction_lost = event_data[2]

		if overcharge_fraction_lost > 0 then
			local overcharge_percentage_lost = overcharge_fraction_lost * 100

			statistics_db:modify_stat_by_amount(stats_id, "shovel_sac_vent", overcharge_percentage_lost)
		end
	end,
}

local SACRIFICE_SKELETON_COUNT = 10
local SACRIFICE_SKELETON_THRESHOLD = 0.2

achievements.shovel_sac_low = {
	display_completion_ui = true,
	icon = "easy_come_easy_go",
	name = "achv_sac_low_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_sac_low_desc"), SACRIFICE_SKELETON_COUNT, SACRIFICE_SKELETON_THRESHOLD * 100)
	end,
	events = {
		"sacrifice_skeleton",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_sac_low") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if global_is_inside_inn then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit then
			return
		end

		local commander_unit = event_data[3]

		if local_player_unit ~= commander_unit then
			return
		end

		local skeleton_unit = event_data[1]
		local health_extension = ScriptUnit.has_extension(skeleton_unit, "health_system")

		if not health_extension or health_extension:current_health_percent() > SACRIFICE_SKELETON_THRESHOLD then
			return
		end

		template_data.count = (template_data.count or 0) + 1

		if template_data.count >= SACRIFICE_SKELETON_COUNT then
			statistics_db:increment_stat(stats_id, "shovel_sac_low")
		end
	end,
}

local FAST_GENERATE_TARGET = 400
local FAST_GENERATE_TIME = 18

achievements.shovel_fast_generate = {
	display_completion_ui = true,
	icon = "unlimited_power",
	name = "achv_fast_generate_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_fast_generate_desc"), FAST_GENERATE_TARGET, FAST_GENERATE_TIME)
	end,
	events = {
		"overcharge_gained",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_fast_generate") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if global_is_inside_inn then
			return
		end

		local source_unit = event_data[3]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit or local_player_unit ~= source_unit then
			return
		end

		local career_extension = ScriptUnit.has_extension(local_player_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
			return
		end

		local fraction_gained = event_data[2]

		if fraction_gained <= 0 then
			return
		end

		local percentage_gained = fraction_gained * 100

		template_data.total_amount = (template_data.total_amount or 0) + percentage_gained

		local instances = template_data.instances or {}

		template_data.instances = instances

		local t = Managers.time:time("game")
		local instance = {
			time = t,
			overcharge = percentage_gained,
		}

		table.insert(instances, instance)

		repeat
			local oldest = instances[1]

			if oldest.time > t - FAST_GENERATE_TIME then
				break
			end

			local cut_instance = table.remove(instances, 1)

			template_data.total_amount = template_data.total_amount - cut_instance.overcharge
		until false

		if template_data.total_amount > FAST_GENERATE_TARGET then
			statistics_db:increment_stat(stats_id, "shovel_fast_generate")
		end
	end,
}

local COMMAND_ELITE_TARGET = 30

achievements.shovel_command_elite = {
	display_completion_ui = true,
	icon = "dead_reckoning",
	name = "achv_command_elite_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_command_elite_desc"), COMMAND_ELITE_TARGET)
	end,
	events = {
		"command_attack_unit",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_command_elite")

		return {
			completed,
			COMMAND_ELITE_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_command_elite") >= COMMAND_ELITE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local controlled_unit = event_data[1]
		local commander_system = Managers.state.entity:system("ai_commander_system")
		local controlled_owner = commander_system:get_commander_unit(controlled_unit)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit or local_player_unit ~= controlled_owner then
			return
		end

		local target_unit = event_data[2]
		local breed = Unit.get_data(target_unit, "breed")

		if not breed or not breed.elite then
			return
		end

		local buff_ext = ScriptUnit.has_extension(target_unit, "buff_system")

		if not buff_ext or buff_ext:get_stacking_buff("command_elite_challenge_tracker") then
			return
		end

		buff_ext:add_buff("command_elite_challenge_tracker")
		statistics_db:increment_stat(stats_id, "shovel_command_elite")
	end,
}

local SKELETON_ATTACK_BIG_TARGET = 30
local SKELETON_ATTACK_BIG_TIME = 2

achievements.shovel_skeleton_attack_big = {
	always_run = true,
	display_completion_ui = true,
	icon = "sally_forth",
	name = "achv_skeleton_attack_big_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_skeleton_attack_big_desc"), SKELETON_ATTACK_BIG_TIME)
	end,
	events = {
		"on_damage_dealt",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_skeleton_attack_big") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local damage_done = event_data[3]

		if damage_done <= 0 then
			return
		end

		local attacker_unit = event_data[2]
		local commander_system = Managers.state.entity:system("ai_commander_system")
		local controlled_owner = commander_system:get_commander_unit(attacker_unit)

		if not controlled_owner then
			return
		end

		local player = Managers.player:owner(controlled_owner)

		if not player then
			return
		end

		if template_data[player:stats_id()] then
			return
		end

		local attacked_unit = event_data[1]
		local t = Managers.time:time("game")
		local damaged_enemies = template_data.damaged_enemies or {}

		if not damaged_enemies[attacked_unit] then
			template_data.count = (template_data.count or 0) + 1
		end

		damaged_enemies[attacked_unit] = t
		template_data.damaged_enemies = damaged_enemies

		if template_data.count >= SKELETON_ATTACK_BIG_TARGET then
			local cutoff_time = t - SKELETON_ATTACK_BIG_TIME

			for damaged_enemy, time in pairs(damaged_enemies) do
				if time < cutoff_time then
					damaged_enemies[damaged_enemy] = nil
					template_data.count = template_data.count - 1
				end
			end

			if template_data.count >= SKELETON_ATTACK_BIG_TARGET then
				template_data[player:stats_id()] = true

				rpc_increment_stat(controlled_owner, "shovel_skeleton_attack_big")
			end
		end
	end,
}

local SKELETON_DEFEND_TARGET = 400
local SKELETON_DEFEND_TIME = 10

achievements.shovel_skeleton_defend = {
	always_run = true,
	display_completion_ui = true,
	icon = "wall_of_bone",
	name = "achv_skeleton_defend_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_skeleton_defend_desc"), SKELETON_DEFEND_TARGET, SKELETON_DEFEND_TIME)
	end,
	events = {
		"on_damage_dealt",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_skeleton_defend") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local attacked_unit = event_data[1]
		local commander_system = Managers.state.entity:system("ai_commander_system")
		local controlled_owner = commander_system:get_commander_unit(attacked_unit)

		if not controlled_owner then
			return
		end

		local player = Managers.player:owner(controlled_owner)

		if not player then
			return
		end

		if template_data[player:stats_id()] then
			return
		end

		local bb = BLACKBOARDS[attacked_unit]

		if not bb or bb.command_state ~= CommandStates.StandingGround then
			return
		end

		local attacker_unit = event_data[2]

		if Managers.state.side:is_ally(attacked_unit, attacker_unit) then
			return
		end

		local damage_amount = event_data[3]

		if damage_amount <= 0 then
			return
		end

		template_data.total_amount = (template_data.total_amount or 0) + damage_amount

		local instances = template_data.instances or {}

		template_data.instances = instances

		local t = Managers.time:time("game")
		local instance = {
			time = t,
			damage = damage_amount,
		}

		table.insert(instances, instance)

		repeat
			local oldest = instances[1]

			if oldest.time > t - SKELETON_DEFEND_TIME then
				break
			end

			local cut_instance = table.remove(instances, 1)

			template_data.total_amount = template_data.total_amount - cut_instance.damage
		until false

		if template_data.total_amount > SKELETON_DEFEND_TARGET then
			template_data[player:stats_id()] = true

			rpc_increment_stat(controlled_owner, "shovel_skeleton_defend")
		end
	end,
}

local MANY_SKELETONS_TARGET = 24

achievements.shovel_many_skeletons = {
	display_completion_ui = true,
	icon = "deaths_company",
	name = "achv_many_skeletons_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_many_skeletons_desc"), MANY_SKELETONS_TARGET)
	end,
	events = {
		"on_controlled_unit_added",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_many_skeletons") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local commander_unit = event_data[2]
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		if not player_unit or player_unit ~= commander_unit then
			return
		end

		local commander_extension = event_data[3]

		if commander_extension:get_controlled_units_count() >= MANY_SKELETONS_TARGET then
			statistics_db:increment_stat(stats_id, "shovel_many_skeletons")
		end
	end,
}

local MELEE_BALEFIRE_TARGET = 150

achievements.shovel_melee_balefire = {
	display_completion_ui = true,
	icon = "flames_forever",
	name = "achv_melee_balefire_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_melee_balefire_desc"), MELEE_BALEFIRE_TARGET)
	end,
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_melee_balefire")

		return {
			completed,
			MELEE_BALEFIRE_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_melee_balefire") >= MELEE_BALEFIRE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local burning_balefire, applied_this_frame = Managers.state.status_effect:has_status(victim_unit, "burning_balefire")

		if not burning_balefire or applied_this_frame then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
			return
		end

		local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

		if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		statistics_db:increment_stat(stats_id, "shovel_melee_balefire")
	end,
}

local FAST_STAFF_ATTACK_TARGET = 8

achievements.shovel_fast_staff_attack = {
	always_run = true,
	display_completion_ui = true,
	icon = "mistress_of_the_stave",
	name = "achv_fast_staff_attack_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_fast_staff_attack_desc"), FAST_STAFF_ATTACK_TARGET)
	end,
	events = {
		"register_ai_stagger",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_fast_staff_attack") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local attacked_unit = event_data[1]
		local attacked_bb = BLACKBOARDS[attacked_unit]

		if not attacked_bb or not attacked_bb.breed.elite then
			return
		end

		local damage_profile = event_data[3]

		if damage_profile.name ~= "death_staff_curse" then
			return
		end

		local instigator = event_data[2]
		local player = Managers.player:owner(instigator)

		if not player or player.bot_player then
			return
		end

		if template_data[player:stats_id()] then
			return
		end

		local career_extension = ScriptUnit.has_extension(instigator, "career_system")

		if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
			return
		end

		local stagger_instances = template_data.stagger_instances or {}

		template_data.stagger_instances = stagger_instances

		local t = Managers.time:time("game")

		if not stagger_instances[attacked_unit] then
			template_data.num_staggers = (template_data.num_staggers or 0) + 1
		end

		stagger_instances[attacked_unit] = t

		local stagger_duration = 1.75

		if template_data.num_staggers >= FAST_STAFF_ATTACK_TARGET then
			for unit, stagger_t in pairs(stagger_instances) do
				local bb = BLACKBOARDS[unit]
				local still_in_stagger = not bb or bb.stagger_time

				if not still_in_stagger or t > stagger_t + stagger_duration then
					stagger_instances[unit] = nil
					template_data.num_staggers = template_data.num_staggers - 1
				end
			end
		end

		if template_data.num_staggers >= FAST_STAFF_ATTACK_TARGET then
			template_data[player:stats_id()] = true

			rpc_increment_stat(instigator, "shovel_fast_staff_attack")
		end
	end,
}

local STAFF_BALEFIRE_TARGET = 250

achievements.shovel_staff_balefire = {
	always_run = true,
	display_completion_ui = true,
	icon = "still_fiery_darlings",
	name = "achv_staff_balefire_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_staff_balefire_desc"), STAFF_BALEFIRE_TARGET)
	end,
	events = {
		"on_dot_applied",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_staff_balefire") >= STAFF_BALEFIRE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local attacker_unit = event_data[3]
		local player = Managers.player:owner(attacker_unit)

		if not player or player.bot_player then
			return
		end

		local damage_source = event_data[2]

		if damage_source ~= "bw_necromancy_staff" then
			return
		end

		local dot_template_name = event_data[1]

		if not BalefireDots[dot_template_name] then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
			return
		end

		local counter = template_data.counter or {}

		template_data.counter = counter
		counter[attacker_unit] = (counter[attacker_unit] or 0) + 1

		if counter[attacker_unit] <= STAFF_BALEFIRE_TARGET then
			rpc_increment_stat(attacker_unit, "shovel_staff_balefire")
		end
	end,
}

local BIG_SUCK_TARGET = 25

achievements.shovel_big_suck = {
	display_completion_ui = true,
	icon = "drained",
	name = "achv_big_suck_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_big_suck_desc"), BIG_SUCK_TARGET)
	end,
	events = {
		"register_kill",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_big_suck")

		return {
			completed,
			BIG_SUCK_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_big_suck") >= BIG_SUCK_TARGET
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

		if not breed or breed.name ~= "chaos_warrior" then
			return
		end

		local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local item = rawget(ItemMasterList, damage_source)
		local is_necro_staff = item and item.item_type == "bw_necromancy_staff"

		if not is_necro_staff then
			return
		end

		local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

		if attack_type ~= "heavy_instant_projectile" then
			return
		end

		local career_extension = ScriptUnit.has_extension(attacker_unit, "career_system")

		if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
			return
		end

		statistics_db:increment_stat(stats_id, "shovel_big_suck")
	end,
}

local BIG_CLEAVE_NUM_ENEMIES = 15
local BIG_CLEAVE_TARGET = 5

achievements.shovel_big_cleave = {
	display_completion_ui = true,
	icon = "reaping_time",
	name = "achv_big_cleave_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_big_cleave_desc"), BIG_CLEAVE_NUM_ENEMIES, BIG_CLEAVE_TARGET)
	end,
	events = {
		"on_hit",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_big_cleave") >= BIG_CLEAVE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_source = event_data[9]

		if damage_source ~= "bw_ghost_scythe" then
			return
		end

		local damage_type = event_data[2]

		if damage_type == "aoe" then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local attacker_unit = event_data[8]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local target_number = event_data[4]

		if target_number == BIG_CLEAVE_NUM_ENEMIES + 1 then
			statistics_db:increment_stat(stats_id, "shovel_big_cleave")
		end
	end,
}

local HEADSHOT_SCYTHE_TARGET = 100

achievements.shovel_headshot_scythe = {
	display_completion_ui = true,
	icon = "ripe_harvest",
	name = "achv_headshot_scythe_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_headshot_scythe_desc"), HEADSHOT_SCYTHE_TARGET)
	end,
	events = {
		"on_hit",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_headshot_scythe")

		return {
			completed,
			HEADSHOT_SCYTHE_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_headshot_scythe") >= HEADSHOT_SCYTHE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_source = event_data[9]

		if damage_source ~= "bw_ghost_scythe" then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local attacker_unit = event_data[8]

		if attacker_unit and local_player_unit ~= attacker_unit then
			return
		end

		local hit_zone_name = event_data[3]

		if hit_zone_name == "head" then
			statistics_db:increment_stat(stats_id, "shovel_headshot_scythe")
		end
	end,
}

local STAFF_GANDALF_GRACE_PERIOD = 3
local STAFF_GANDALF_MIN_Z_DIFFERENCE = 4

local function _staff_gandalf_check_tracked_unit(knockback_data, victim_unit)
	local knockback_position = knockback_data.knockback_position:unbox()
	local position = Unit.is_valid(victim_unit) and not Unit.is_frozen(victim_unit) and Unit.local_position(victim_unit, 0)

	if not position or knockback_position[3] - position[3] < STAFF_GANDALF_MIN_Z_DIFFERENCE then
		return false
	end

	return true
end

achievements.shovel_staff_gandalf = {
	desc = "achv_staff_gandalf_desc",
	display_completion_ui = true,
	icon = "whoosh_clang",
	name = "achv_staff_gandalf_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	events = {
		"register_kill",
		"on_hit",
		"necromancer_staff_gandalf_delayed_check",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_staff_gandalf") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local t = Managers.time:time("game")

		if event_name == "register_kill" then
			local victim_unit = event_data[register_kill_victim_unit]
			local unit_data = template_data.tracked_units and template_data.tracked_units[victim_unit]

			if not unit_data then
				return
			end

			local knockback_time = unit_data.knockback_time

			if t - knockback_time > STAFF_GANDALF_GRACE_PERIOD then
				return false
			end

			if _staff_gandalf_check_tracked_unit(unit_data, victim_unit) then
				statistics_db:increment_stat(stats_id, "shovel_staff_gandalf")

				return
			end
		elseif event_name == "on_hit" then
			local victim_unit = event_data[1]
			local breed = Unit.get_data(victim_unit, "breed")

			if not breed or breed.name ~= "chaos_warrior" then
				return
			end

			local damage_source = event_data[9]

			if damage_source ~= "bw_ghost_scythe" then
				return
			end

			local attack_type = event_data[2]

			if attack_type ~= "aoe" then
				return
			end

			local player = Managers.player:local_player()
			local player_unit = player and player.player_unit
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")

			if not career_extension or career_extension:career_name() ~= "bw_necromancer" then
				return
			end

			local passive = career_extension:get_passive_ability_by_name("bw_necromancer")

			passive:achievement_staff_gandalf_trigger(victim_unit, t, math.max(STAFF_GANDALF_GRACE_PERIOD, 6))

			template_data.tracked_units = template_data.tracked_units or {}

			local existing_data = template_data.tracked_units[victim_unit]

			if existing_data then
				existing_data.knockback_time = t

				existing_data.knockback_position:store(POSITION_LOOKUP[victim_unit])
			else
				template_data.tracked_units[victim_unit] = {
					knockback_time = t,
					knockback_position = Vector3Box(POSITION_LOOKUP[victim_unit]),
				}
			end
		else
			local victim_unit = event_data[1]
			local unit_data = template_data.tracked_units[victim_unit]

			if _staff_gandalf_check_tracked_unit(unit_data, victim_unit) then
				statistics_db:increment_stat(stats_id, "shovel_staff_gandalf")

				return
			end
		end
	end,
}

local SKELETON_BALEFIRE_TARGET = 500

achievements.shovel_skeleton_balefire = {
	always_run = true,
	display_completion_ui = true,
	icon = "unrestful_bonefire",
	name = "achv_skeleton_balefire_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_skeleton_balefire_desc"), SKELETON_BALEFIRE_TARGET)
	end,
	events = {
		"on_damage_dealt",
	},
	progress = function (statistics_db, stats_id, template_data)
		local completed = statistics_db:get_persistent_stat(stats_id, "shovel_skeleton_balefire")

		return {
			completed,
			SKELETON_BALEFIRE_TARGET,
		}
	end,
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_skeleton_balefire") >= SKELETON_BALEFIRE_TARGET
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network.is_server then
			return
		end

		local attacker_unit = event_data[2]
		local commander_system = Managers.state.entity:system("ai_commander_system")
		local controlled_owner = commander_system:get_commander_unit(attacker_unit)

		if not controlled_owner then
			return
		end

		local player = Managers.player:owner(controlled_owner)

		if not player then
			return
		end

		if template_data[player:stats_id()] then
			return
		end

		local attacked_unit = event_data[1]
		local burning_balefire, applied_this_frame = Managers.state.status_effect:has_status(attacked_unit, "burning_balefire")

		if not burning_balefire or applied_this_frame then
			return
		end

		template_data.count = template_data.count or {}
		template_data.count[controlled_owner] = (template_data.count[controlled_owner] or 0) + 1

		if template_data.count[controlled_owner] <= SKELETON_BALEFIRE_TARGET then
			rpc_increment_stat(controlled_owner, "shovel_skeleton_balefire")
		else
			template_data[player:stats_id()] = true
		end
	end,
}

local function _keep_skeletons_alive_stop_timer(template_data, t)
	if template_data.timer_start_t then
		local elapsed_time = t - template_data.timer_start_t

		template_data.total_time = template_data.total_time + elapsed_time
	end

	template_data.timer_start_t = nil
end

local function _keep_skeletons_alive_start_timer(template_data, t)
	_keep_skeletons_alive_stop_timer(template_data, t)

	template_data.timer_start_t = t
end

local KEEP_SKELETONS_ALIVE_NUM = 4
local KEEP_SKELETONS_ALIVE_TIME_FRACTION = 0.95
local ALIVE_PERCENT_VISUAL = 95

achievements.shovel_keep_skeletons_alive = {
	display_completion_ui = true,
	icon = "the_soul_of_the_party",
	name = "achv_keep_skeletons_alive_name",
	required_career = "bw_necromancer",
	required_dlc = "shovel",
	desc = function ()
		return string.format(Localize("achv_keep_skeletons_alive_desc"), ALIVE_PERCENT_VISUAL)
	end,
	events = {
		"on_controlled_unit_added",
		"on_controlled_unit_removed",
		"on_round_started",
		"register_completed_level",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "shovel_keep_skeletons_alive") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if not local_player_unit then
			return
		end

		local career_ext = ScriptUnit.extension(local_player_unit, "career_system")

		if career_ext:career_name() ~= "bw_necromancer" then
			return
		end

		local t = Managers.time:time("game")

		if event_name == "on_round_started" then
			template_data.level_start_t = template_data.level_start_t or t
			template_data.total_time = 0
		elseif not template_data.level_start_t then
			return
		elseif event_name == "register_completed_level" then
			_keep_skeletons_alive_stop_timer(template_data, t)

			local start_t = template_data.level_start_t

			if start_t and start_t ~= t then
				local gametime = t - start_t
				local skeleton_uptime = template_data.total_time
				local uptime_fraction = skeleton_uptime / gametime

				if uptime_fraction >= KEEP_SKELETONS_ALIVE_TIME_FRACTION then
					statistics_db:increment_stat(stats_id, "shovel_keep_skeletons_alive")
				end
			end
		end

		local commander_extension = ScriptUnit.extension(local_player_unit, "ai_commander_system")
		local num_controlled_units = commander_extension:get_controlled_units_count()

		if num_controlled_units < KEEP_SKELETONS_ALIVE_NUM then
			_keep_skeletons_alive_stop_timer(template_data, t)
		else
			_keep_skeletons_alive_start_timer(template_data, t)
		end
	end,
}

local all_challenges = {
	"shovel_complete_all_helmgart_levels_bw_necromancer",
	"shovel_complete_25_missions_bw_necromancer",
	"shovel_sac_vent",
	"shovel_fast_generate",
	"shovel_command_elite",
	"shovel_skeleton_attack_big",
	"shovel_skeleton_defend",
	"shovel_many_skeletons",
	"shovel_melee_balefire",
	"shovel_fast_staff_attack",
	"shovel_staff_balefire",
	"shovel_big_suck",
	"shovel_big_cleave",
	"shovel_headshot_scythe",
	"shovel_skeleton_balefire",
	"shovel_keep_skeletons_alive",
}

add_meta_challenge(achievements, "necro_complete_all", all_challenges, "mistress_of_necromancy", "shovel", nil, nil)
