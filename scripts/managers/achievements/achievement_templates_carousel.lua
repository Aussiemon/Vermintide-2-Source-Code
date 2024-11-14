-- chunkname: @scripts/managers/achievements/achievement_templates_carousel.lua

local ObjectiveTags = require("scripts/entity_system/systems/objective/objective_tags")
local achievements = AchievementTemplates.achievements
local register_kill_stats_id = 1
local register_kill_victim_unit = 2
local register_kill_damage_data = 3
local register_kill_victim_breed = 4
local register_knockdown_stats_id = 1
local register_knockdown_victim_unit = 2
local register_knockdown_attacker_player = 3
local register_knockdown_victim_breed = 4
local register_damage_stats_id = 1
local register_damage_victim_unit = 2
local register_damage_damage_data = 3
local register_damage_attacker_unit = 4
local register_damage_target_breed = 5
local register_player_disabled_victim_unit = 1
local register_revive_reviver_unit = 1
local register_revive_revivee_unit = 2
local register_block_broken_blocking_unit = 1
local register_block_broken_attaker_unit = 2
local register_objective_completed_objective_data = 1
local register_objective_completed_hero_party_id = 2
local register_objective_completed_objective_extension = 3
local on_troll_vomit_hit_victim_unit = 1
local on_troll_vomit_hit_attacker_player_unit = 2

achievements.vs_disable_reviving_hero = {
	desc = "achv_disable_reviving_hero_vs_desc",
	display_completion_ui = true,
	icon = "revive_interrupt",
	name = "achv_disable_reviving_hero_vs_name",
	required_dlc = "carousel",
	events = {
		"register_player_disabled",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_player_disabled_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit
		local status_ext = ScriptUnit.extension(victim_unit, "status_system")
		local disabler_unit = status_ext:get_disabler_unit()

		if not ALIVE[local_player_unit] or local_player_unit ~= disabler_unit then
			return
		end

		statistics_db:increment_stat(stats_id, "vs_disable_reviving_hero")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_disable_reviving_hero") >= 1
	end,
}
achievements.vs_kill_invisible_hero = {
	desc = "achv_kill_invisible_hero_vs_desc",
	display_completion_ui = true,
	icon = "kill_invisible",
	name = "achv_kill_invisible_hero_vs_name",
	required_dlc = "carousel",
	events = {
		"register_knockdown",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_knockdown_victim_unit]
		local attacker_player = event_data[register_knockdown_attacker_player]
		local attacker_unit = attacker_player and attacker_player.player_unit
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit
		local health_ext = ScriptUnit.has_extension(victim_unit, "health_system")

		if health_ext then
			local local_player_unique_id = local_player:unique_id()
			local is_recent_attacker = health_ext:was_attacked_by(local_player_unique_id)

			if is_recent_attacker then
				attacker_unit = local_player_unit
			end
		end

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local attacker_breed = Unit.get_data(attacker_unit, "breed")

		if not attacker_breed or not attacker_breed.special and not attacker_breed.boss then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if status_ext and status_ext:is_invisible() then
			statistics_db:increment_stat(stats_id, "vs_kill_invisible_hero")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_kill_invisible_hero") >= 1
	end,
}

local values = {
	50,
	500,
	1250,
	2500,
	5000,
}

for i = 1, #values do
	local always_run = false
	local events, event_func

	if i == 1 then
		always_run = true
		events = {
			"register_kill",
		}

		function event_func(statistics_db, stats_id, template_data, event_name, event_data)
			local current_mechanism_name = Managers.mechanism:current_mechanism_name()

			if current_mechanism_name ~= "versus" then
				return
			end

			local victim_unit = event_data[register_kill_victim_unit]
			local damage_data = event_data[register_kill_damage_data]
			local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
			local local_player = Managers.player:local_player()
			local local_player_unit = local_player.player_unit
			local health_ext = ScriptUnit.has_extension(victim_unit, "health_system")

			if health_ext then
				local local_player_unique_id = local_player:unique_id()
				local is_recent_attacker = health_ext:was_attacked_by(local_player_unique_id)

				if is_recent_attacker then
					attacker_unit = local_player_unit
				end
			end

			if not attacker_unit or local_player_unit ~= attacker_unit then
				return
			end

			local victim_breed = event_data[register_kill_victim_breed]

			if not victim_breed.special then
				return
			end

			statistics_db:increment_stat(stats_id, "vs_hero_eliminations")
		end
	end

	achievements["vs_hero_eliminations_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_hero_eliminations",
		required_dlc = "carousel",
		name = "achv_hero_eliminations_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_hero_eliminations_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "hero_eliminations_" .. i,
		always_run = always_run,
		events = events,
		on_event = event_func,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "vs_hero_eliminations") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_eliminations"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local value = 50

achievements.vs_hero_monster_kills = {
	display_completion_ui = true,
	icon = "kill_x_monsters",
	name = "achv_hero_monster_kills_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_monster_kills_vs_desc"), value)
	end,
	events = {
		"register_kill",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit
		local health_ext = ScriptUnit.has_extension(victim_unit, "health_system")

		if health_ext then
			local local_player_unique_id = local_player:unique_id()
			local is_recent_attacker = health_ext:was_attacked_by(local_player_unique_id)

			if is_recent_attacker then
				attacker_unit = local_player_unit
			end
		end

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local victim_breed = event_data[register_kill_victim_breed]

		if not victim_breed.boss then
			return
		end

		statistics_db:increment_stat(stats_id, "vs_hero_monster_kill")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_monster_kill") >= value
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_monster_kill"), total)

		return {
			count,
			total,
		}
	end,
}

local value = 50

achievements.vs_hero_obj_barrels = {
	display_completion_ui = true,
	icon = "socket_x_items",
	name = "achv_hero_obj_barrels_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_obj_barrels_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_data = event_data[register_objective_completed_objective_data]

		if objective_data.objective_type ~= "objective_socket" then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_obj_barrels")
		end
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_barrels"), total)

		return {
			count,
			total,
		}
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_barrels") >= value
	end,
}

local value = 50

achievements.vs_hero_obj_chains = {
	display_completion_ui = true,
	icon = "destroy_x_chains_as_team",
	name = "achv_hero_obj_chains_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_obj_chains_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_ext = event_data[register_objective_completed_objective_extension]
		local objective_tag = objective_ext:objective_tag()

		if objective_tag ~= ObjectiveTags.objective_tag_chains then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_obj_chains")
		end
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_chains"), total)

		return {
			count,
			total,
		}
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_chains") >= value
	end,
}

local value = 25

achievements.vs_hero_obj_capture = {
	display_completion_ui = true,
	icon = "contribute_x_to_capture_points",
	name = "achv_hero_obj_capture_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_obj_capture_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_data = event_data[register_objective_completed_objective_data]

		if objective_data.objective_type ~= "objective_capture_point" then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_obj_capture")
		end
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_capture"), total)

		return {
			count,
			total,
		}
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_capture") >= value
	end,
}

local values = {
	5,
	25,
	50,
	100,
	250,
}

for i = 1, #values do
	achievements["vs_wins_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_wins",
		required_dlc = "carousel",
		name = "achv_wins_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_wins_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "wins_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "vs_game_won") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_game_won"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local value = 50

achievements.vs_hero_obj_safezone = {
	display_completion_ui = true,
	icon = "safe_zone",
	name = "achv_hero_obj_safezone_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_obj_safezone_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_data = event_data[register_objective_completed_objective_data]

		if objective_data.objective_type ~= "objective_safehouse" then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_obj_safezone")
		end
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_safezone"), total)

		return {
			count,
			total,
		}
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_safezone") >= value
	end,
}

local value = 50

achievements.vs_hero_revive = {
	display_completion_ui = true,
	icon = "revive",
	name = "achv_hero_revive_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_revive_vs_desc"), value)
	end,
	events = {
		"register_revive",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local reviver_unit = event_data[register_revive_reviver_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not reviver_unit or local_player_unit ~= reviver_unit then
			return
		end

		statistics_db:increment_stat(stats_id, "vs_hero_revive")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_revive") >= value
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_revive"), total)

		return {
			count,
			total,
		}
	end,
}

local value = 100

achievements.vs_hero_obj_reach = {
	display_completion_ui = true,
	icon = "hero_objective_reach",
	name = "achv_hero_obj_reach_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_obj_reach_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_data = event_data[register_objective_completed_objective_data]

		if objective_data.objective_type ~= "objective_reach" or objective_data.score_for_completion == 0 then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_obj_reach")
		end
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_reach"), total)

		return {
			count,
			total,
		}
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_obj_reach") >= value
	end,
}

local value = 50

achievements.vs_hero_rescue = {
	display_completion_ui = true,
	icon = "rescue_prisoners",
	name = "achv_hero_rescue_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hero_rescue_vs_desc"), value)
	end,
	events = {
		"register_objective_completed",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local objective_ext = event_data[register_objective_completed_objective_extension]
		local objective_tag = objective_ext:objective_tag()

		if objective_tag ~= ObjectiveTags.objective_tag_prisoner then
			return
		end

		local hero_party_id = event_data[register_objective_completed_hero_party_id]
		local player = Managers.player:local_player()
		local unique_id = player:unique_id()
		local player_party = Managers.party:get_party_from_unique_id(unique_id)

		if hero_party_id == player_party.party_id then
			statistics_db:increment_stat(stats_id, "vs_hero_rescue")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hero_rescue") >= value
	end,
	progress = function (statistics_db, stats_id)
		local total = value
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hero_rescue"), total)

		return {
			count,
			total,
		}
	end,
}
achievements.vs_air_gutter_runner = {
	desc = "achv_air_gutter_runner_vs_desc",
	display_completion_ui = true,
	icon = "air_gutter_runner",
	name = "achv_air_gutter_runner_vs_name",
	required_dlc = "carousel",
	events = {
		"register_kill",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local target_breed = event_data[register_kill_victim_breed]

		if not target_breed or not target_breed.name or target_breed.name ~= "vs_gutter_runner" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if status_ext and status_ext:is_gutter_runner_leaping() then
			statistics_db:increment_stat(stats_id, "vs_air_gutter_runner")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_air_gutter_runner") >= 1
	end,
}
achievements.vs_clutch_revive = {
	desc = "achv_clutch_revive_vs_desc",
	display_completion_ui = true,
	icon = "clutch_revive",
	name = "achv_clutch_revive_vs_name",
	required_dlc = "carousel",
	events = {
		"register_revive",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local reviver_unit = event_data[register_revive_reviver_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not reviver_unit or local_player_unit ~= reviver_unit then
			return
		end

		local side = Managers.state.side:get_side_from_name("heroes")
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

		for _, player_unit in pairs(player_and_bot_units) do
			if ALIVE[player_unit] and player_unit ~= local_player_unit then
				local status_ext = ScriptUnit.has_extension(player_unit, "status_system")

				if status_ext and not status_ext:is_knocked_down() and not status_ext:is_ready_for_assisted_respawn() and not status_ext:is_dead() then
					return
				end
			end
		end

		statistics_db:increment_stat(stats_id, "vs_clutch_revive")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_clutch_revive") >= 1
	end,
}

local values = {
	10,
	50,
	100,
	250,
	500,
}

for i = 1, #values do
	achievements["vs_packmaster_eliminations_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_packmaster_eliminations",
		required_dlc = "carousel",
		name = "achv_packmaster_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_packmaster_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "packmaster_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "eliminations_as_breed", "vs_packmaster") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "eliminations_as_breed", "vs_packmaster"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local value = 50

achievements.vs_hoist_heroes = {
	display_completion_ui = true,
	icon = "hoist_heroes",
	name = "achv_hoist_heroes_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_hoist_heroes_vs_desc"), value)
	end,
	events = {
		"register_player_disabled",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_player_disabled_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local breed = Unit.get_data(victim_unit, "breed")

		if not breed.is_hero then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if not status_ext then
			return
		end

		local is_hoisted = status_ext:is_hanging_from_hook()

		if not is_hoisted then
			return
		end

		local packmaster_unit = status_ext:get_pack_master_grabber()
		local player_unit = Managers.player:local_player().player_unit

		if player_unit and player_unit == packmaster_unit then
			statistics_db:increment_stat(stats_id, "vs_hoist_heroes")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_hoist_heroes") >= value
	end,
	progress = function (statistics_db, stats_id)
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_hoist_heroes"), value)

		return {
			count,
			value,
		}
	end,
}

local value = 500

achievements.vs_drag_heroes = {
	display_completion_ui = true,
	icon = "drag_heroes",
	name = "achv_drag_heroes_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_drag_heroes_vs_desc"), value)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_drag_heroes") >= value
	end,
	progress = function (statistics_db, stats_id)
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_drag_heroes"), value)

		return {
			count,
			value,
		}
	end,
}

local values = {
	10,
	50,
	100,
	250,
	500,
}

for i = 1, #values do
	achievements["vs_gutter_runner_eliminations_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_gutter_runner_eliminations",
		required_dlc = "carousel",
		name = "achv_gutter_runner_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_gutter_runner_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "gutter_runner_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "eliminations_as_breed", "vs_gutter_runner") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "eliminations_as_breed", "vs_gutter_runner"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local value = 100

achievements.vs_pounce_heroes = {
	display_completion_ui = true,
	icon = "pounce_heroes",
	name = "achv_pounce_heroes_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_pounce_heroes_vs_desc"), value)
	end,
	events = {
		"register_player_disabled",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_player_disabled_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local breed = Unit.get_data(victim_unit, "breed")

		if not breed.is_hero then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if not status_ext then
			return
		end

		local is_pounced_down, pouncer_unit = status_ext:is_pounced_down()

		if not is_pounced_down then
			return
		end

		local player_unit = Managers.player:local_player().player_unit

		if player_unit and player_unit == pouncer_unit then
			statistics_db:increment_stat(stats_id, "vs_pounce_heroes")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_pounce_heroes") >= value
	end,
	progress = function (statistics_db, stats_id)
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_pounce_heroes"), value)

		return {
			count,
			value,
		}
	end,
}
achievements.vs_gas_combo_pounce = {
	desc = "achv_gas_combo_pounce_vs_desc",
	display_completion_ui = true,
	icon = "gas_combo_pounce",
	name = "achv_gas_combo_pounce_vs_name",
	required_dlc = "carousel",
	events = {
		"register_player_disabled",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_player_disabled_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local breed = Unit.get_data(victim_unit, "breed")

		if not breed.is_hero then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if not status_ext then
			return
		end

		local is_pounced_down, pouncer_unit = status_ext:is_pounced_down()

		if not is_pounced_down then
			return
		end

		local player_unit = Managers.player:local_player().player_unit

		if not ALIVE[player_unit] or player_unit ~= pouncer_unit then
			return
		end

		local area_damage_system = Managers.state.entity:system("area_damage_system")
		local area_damage_extensions = area_damage_system:get_extensions_from_extension_name("AreaDamageExtension")

		for area_damage_unit, extension_data in pairs(area_damage_extensions) do
			local radius = extension_data.radius
			local unit_position = POSITION_LOOKUP[victim_unit]
			local area_damage_position = Unit.local_position(area_damage_unit, 0)
			local distance_sq = Vector3.distance_squared(unit_position, area_damage_position)
			local is_inside_radius = distance_sq < radius * radius

			if is_inside_radius then
				statistics_db:increment_stat(stats_id, "vs_gas_combo_pounce")

				return
			end
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_gas_combo_pounce") >= 1
	end,
}

local values = {
	500,
	2500,
	5000,
	10000,
	25000,
}

for i = 1, #values do
	achievements["vs_warpfire_thrower_damage_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_warpfire_thrower_damage",
		required_dlc = "carousel",
		name = "achv_warpfire_thrower_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_warpfire_thrower_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "warpfire_thrower_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_warpfire_thrower") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_warpfire_thrower"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local WARPFIRE_KNOCKBACK_GRACE_PERIOD_ON_DISABLED = 3
local WARPFIRE_KNOCKBACK_GRACE_PERIOD_ON_KILL = 6
local WARPFIRE_KNOCKBACK_MIN_Z_DIFFERENCE = 4

local function warpfire_knockback_check_tracked_unit(knockback_data, victim_unit)
	local knockback_position = knockback_data.knockback_position:unbox()
	local position = Unit.is_valid(victim_unit) and not Unit.is_frozen(victim_unit) and Unit.local_position(victim_unit, 0)

	if not position or knockback_position[3] - position[3] < WARPFIRE_KNOCKBACK_MIN_Z_DIFFERENCE then
		return false
	end

	return true
end

achievements.vs_push_hero_off_map = {
	desc = "achv_push_hero_off_map_vs_desc",
	display_completion_ui = true,
	icon = "push_hero_off_map",
	name = "achv_push_hero_off_map_vs_name",
	required_dlc = "carousel",
	events = {
		"register_kill",
		"register_damage",
		"register_player_disabled",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "vs_push_hero_off_map") >= 1
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

			if t - knockback_time > WARPFIRE_KNOCKBACK_GRACE_PERIOD_ON_KILL then
				return false
			end

			if warpfire_knockback_check_tracked_unit(unit_data, victim_unit) then
				statistics_db:increment_stat(stats_id, "vs_push_hero_off_map")

				return
			end
		elseif event_name == "register_damage" then
			local victim_unit = event_data[register_damage_victim_unit]
			local breed = Unit.get_data(victim_unit, "breed")

			if not breed or not breed.is_hero then
				return
			end

			local player = Managers.player:local_player()
			local player_unit = player and player.player_unit
			local attacker_unit = event_data[register_damage_attacker_unit]

			if not ALIVE[player_unit] or player_unit ~= attacker_unit then
				return
			end

			local attacker_breed = Unit.get_data(attacker_unit, "breed")

			if not attacker_breed or attacker_breed.name ~= "vs_warpfire_thrower" then
				return
			end

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
		elseif event_name == "register_player_disabled" then
			local victim_unit = event_data[register_player_disabled_victim_unit]

			if not ALIVE[victim_unit] then
				return
			end

			local unit_data = template_data.tracked_units and template_data.tracked_units[victim_unit]

			if not unit_data then
				return
			end

			local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

			if not status_ext or not status_ext:get_is_ledge_hanging() then
				return
			end

			local knockback_time = unit_data.knockback_time

			if t - knockback_time > WARPFIRE_KNOCKBACK_GRACE_PERIOD_ON_DISABLED then
				return false
			end

			statistics_db:increment_stat(stats_id, "vs_push_hero_off_map")
		end
	end,
}
achievements.vs_kill_hoisted_hero = {
	desc = "achv_kill_hoisted_hero_vs_desc",
	display_completion_ui = true,
	icon = "kill_hoisted_hero",
	name = "achv_kill_hoisted_hero_vs_name",
	required_dlc = "carousel",
	events = {
		"register_kill",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit
		local health_ext = ScriptUnit.has_extension(victim_unit, "health_system")

		if health_ext then
			local local_player_unique_id = local_player:unique_id()
			local is_recent_attacker = health_ext:was_attacked_by(local_player_unique_id)

			if is_recent_attacker then
				attacker_unit = local_player_unit
			end
		end

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local target_breed = event_data[register_kill_victim_breed]

		if not target_breed.is_hero then
			return
		end

		local attacker_breed = Unit.get_data(attacker_unit, "breed")

		if attacker_breed.name ~= "vs_warpfire_thrower" then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if status_ext and status_ext:is_pack_master_hoisted() then
			statistics_db:increment_stat(stats_id, "vs_kill_hoisted_hero")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_kill_hoisted_hero") >= 1
	end,
}

local values = {
	500,
	2500,
	5000,
	10000,
	25000,
}

for i = 1, #values do
	achievements["vs_ratling_gunner_damage_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_ratling_gunner_damage",
		required_dlc = "carousel",
		name = "achv_ratling_gunner_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_ratling_gunner_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "ratling_gunner_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_ratling_gunner") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_ratling_gunner"), total)

			return {
				count,
				total,
			}
		end,
	}
end

achievements.vs_break_hero_shield = {
	desc = "achv_break_hero_shield_vs_desc",
	display_completion_ui = true,
	icon = "break_hero_shield",
	name = "achv_break_hero_shield_vs_name",
	required_dlc = "carousel",
	events = {
		"register_block_broken",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local attacker_player_unit = event_data[register_block_broken_attaker_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_player_unit or local_player_unit ~= attacker_player_unit then
			return
		end

		local blocking_player_unit = event_data[register_block_broken_blocking_unit]

		if not ALIVE[blocking_player_unit] then
			return
		end

		local blocking_breed = Unit.get_data(blocking_player_unit, "breed")

		if not blocking_breed.is_hero then
			return
		end

		local attacker_breed = Unit.get_data(attacker_player_unit, "breed")

		if attacker_breed.name ~= "vs_ratling_gunner" then
			return
		end

		statistics_db:increment_stat(stats_id, "vs_break_hero_shield")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_break_hero_shield") >= 1
	end,
}
achievements.vs_kill_ko_hero = {
	desc = "achv_kill_ko_hero_vs_desc",
	display_completion_ui = true,
	icon = "kill_ko_hero",
	name = "achv_kill_ko_hero_vs_name",
	required_dlc = "carousel",
	events = {
		"register_kill",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]
		local damage_data = event_data[register_kill_damage_data]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit
		local health_ext = ScriptUnit.has_extension(victim_unit, "health_system")

		if health_ext then
			local local_player_unique_id = local_player:unique_id()
			local is_recent_attacker = health_ext:was_attacked_by(local_player_unique_id)

			if is_recent_attacker then
				attacker_unit = local_player_unit
			end
		end

		if not attacker_unit or local_player_unit ~= attacker_unit then
			return
		end

		local target_breed = event_data[register_kill_victim_breed]

		if not target_breed.is_hero then
			return
		end

		local attacker_breed = Unit.get_data(attacker_unit, "breed")

		if attacker_breed.name ~= "vs_ratling_gunner" then
			return
		end

		local victim_unit = event_data[register_kill_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if status_ext and status_ext:is_knocked_down() then
			statistics_db:increment_stat(stats_id, "vs_kill_ko_hero")
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_kill_ko_hero") >= 1
	end,
}

local values = {
	500,
	2500,
	5000,
	10000,
	25000,
}

for i = 1, #values do
	achievements["vs_poison_wind_globadier_damage_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_poison_wind_globadier_damage",
		required_dlc = "carousel",
		name = "achv_globadier_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_globadier_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "globadier_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_poison_wind_globadier") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_poison_wind_globadier"), total)

			return {
				count,
				total,
			}
		end,
	}
end

achievements.vs_gas_combo = {
	desc = "achv_gas_combo_vs_desc",
	display_completion_ui = true,
	icon = "gas_combo",
	name = "achv_gas_combo_vs_name",
	required_dlc = "carousel",
	events = {
		"register_damage",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local damage_data = event_data[register_damage_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]
		local damage_amount = damage_data[DamageDataIndex.DAMAGE_AMOUNT]

		if damage_amount == 0 then
			return
		end

		if damage_type ~= "gas" then
			return
		end

		local attacker_player_unit = event_data[register_damage_attacker_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_player_unit or local_player_unit ~= attacker_player_unit then
			return
		end

		local attacker_breed = Unit.get_data(attacker_player_unit, "breed")

		if attacker_breed.name ~= "vs_poison_wind_globadier" then
			return
		end

		local victim_breed = event_data[register_damage_target_breed]

		if not victim_breed.is_hero then
			return
		end

		local victim_unit = event_data[register_damage_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		local status_ext = ScriptUnit.has_extension(victim_unit, "status_system")

		if status_ext and status_ext:is_disabled_by_pact_sworn() then
			statistics_db:modify_stat_by_amount(stats_id, "vs_gas_combo", damage_amount)
		end
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_gas_combo") >= 1
	end,
}

local value = 100

achievements.vs_globe_damage = {
	display_completion_ui = true,
	icon = "globadier_damage",
	name = "achv_globe_damage_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_globe_damage_vs_desc"), value)
	end,
	events = {
		"register_damage",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local damage_data = event_data[register_damage_damage_data]
		local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]
		local damage_amount = damage_data[DamageDataIndex.DAMAGE_AMOUNT]
		local attacker_unit = damage_data[DamageDataIndex.ATTACKER]

		if damage_amount == 0 then
			return
		end

		if damage_type ~= "gas" then
			return
		end

		local attacker_player_unit = event_data[register_damage_attacker_unit]
		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_player_unit or local_player_unit ~= attacker_player_unit then
			return
		end

		local attacker_breed = Unit.get_data(attacker_player_unit, "breed")

		if attacker_breed.name ~= "vs_poison_wind_globadier" then
			return
		end

		local victim_breed = event_data[register_damage_target_breed]

		if not victim_breed.is_hero then
			return
		end

		local victim_unit = event_data[register_damage_victim_unit]

		if not ALIVE[victim_unit] then
			return
		end

		if statistics_db:get_persistent_stat(stats_id, "vs_globe_damage") >= value then
			return
		end

		if template_data.current_unit ~= attacker_unit then
			statistics_db:set_stat(stats_id, "vs_globe_damage", 0)
		end

		template_data.current_unit = attacker_unit

		statistics_db:modify_stat_by_amount(stats_id, "vs_globe_damage", damage_amount)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_globe_damage") >= value
	end,
}

local values = {
	100,
	1000,
	2500,
}

for i = 1, #values do
	achievements["vs_chaos_troll_damage_" .. string.format("%02d", i)] = {
		display_completion_ui = true,
		group = "vs_chaos_troll_damage",
		required_dlc = "carousel",
		name = "achv_bile_troll_" .. string.format("%02d", i) .. "_vs_name",
		desc = function ()
			return string.format(Localize("achv_bile_troll_" .. string.format("%02d", i) .. "_vs_desc"), values[i])
		end,
		icon = "bile_troll_" .. i,
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_chaos_troll") >= values[i]
		end,
		progress = function (statistics_db, stats_id)
			local total = values[i]
			local count = math.min(statistics_db:get_persistent_stat(stats_id, "damage_dealt_as_breed", "vs_chaos_troll"), total)

			return {
				count,
				total,
			}
		end,
	}
end

local value = 100

achievements.vs_bile_troll_vomit = {
	display_completion_ui = true,
	icon = "bile_troll_vomit",
	name = "achv_bile_troll_vomit_vs_name",
	required_dlc = "carousel",
	desc = function ()
		return string.format(Localize("achv_bile_troll_vomit_vs_desc"), value)
	end,
	events = {
		"on_troll_vomit_hit",
	},
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local current_mechanism_name = Managers.mechanism:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return
		end

		local victim_unit = event_data[on_troll_vomit_hit_victim_unit]
		local attacker_player_unit = event_data[on_troll_vomit_hit_attacker_player_unit]
		local attacker_breed = Unit.get_data(attacker_player_unit, "breed")

		if attacker_breed.name ~= "vs_chaos_troll" then
			return
		end

		local local_player_unit = Managers.player:local_player().player_unit

		if not attacker_player_unit or local_player_unit ~= attacker_player_unit then
			return
		end

		if not ALIVE[victim_unit] then
			return
		end

		local victim_breed = Unit.get_data(victim_unit, "breed")

		if not victim_breed.is_hero then
			return
		end

		statistics_db:increment_stat(stats_id, "vs_bile_troll_vomit")
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vs_bile_troll_vomit") >= value
	end,
	progress = function (statistics_db, stats_id)
		local count = math.min(statistics_db:get_persistent_stat(stats_id, "vs_bile_troll_vomit"), value)

		return {
			count,
			value,
		}
	end,
}
