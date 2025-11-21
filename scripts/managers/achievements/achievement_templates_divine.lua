-- chunkname: @scripts/managers/achievements/achievement_templates_divine.lua

local add_event_challenge = AchievementTemplateHelper.add_event_challenge
local add_levels_complete_challenge = AchievementTemplateHelper.add_levels_complete_challenge
local add_meta_challenge = AchievementTemplateHelper.add_meta_challenge
local PLACEHOLDER_ICON = AchievementTemplateHelper.PLACEHOLDER_ICON
local achievements = AchievementTemplates.achievements
local add_console_achievements = AchievementTemplateHelper.add_console_achievements
local rpc_increment_stat_unique_id = AchievementTemplateHelper.rpc_increment_stat_unique_id
local XB1_ACHIEVEMENT_ID = {
	divine_collectible_challenge = 132,
	divine_complete_legend = 131,
	divine_generator_challenge = 133,
}
local PS4_ACHIEVEMENT_ID = {
	divine_generator_challenge = "096",
}
local portals = {
	LevelSettings.dlc_reikwald_river,
}
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm",
}
local player_facing_diff_names = {
	cataclysm = "cataclysm",
	hard = "veteran",
	harder = "champion",
	hardest = "legend",
	normal = "recruit",
}
local all_difficulties = {}

for i = 1, #difficulties do
	local difficulty_name = difficulties[i]
	local name = "divine_complete_" .. player_facing_diff_names[difficulty_name]
	local icon = "achv_divine_complete_" .. player_facing_diff_names[difficulty_name] .. "_icon"

	all_difficulties[i] = name

	add_levels_complete_challenge(achievements, name, portals, DifficultySettings[difficulty_name].rank, icon, nil, XB1_ACHIEVEMENT_ID[name], PS4_ACHIEVEMENT_ID[name])
end

local NAUTICAL_MILES = 1
local METERS_TO_TRAVEL = 1852 * NAUTICAL_MILES
local BOAT_TRAVEL_DISTANCE = 765

achievements.divine_nautical_miles_challenge = {
	desc = "achv_divine_nautical_miles_challenge_desc",
	display_completion_ui = true,
	icon = "achv_divine_nautical_miles_challenge_icon",
	name = "achv_divine_nautical_miles_challenge_name",
	events = {
		"divine_nautical_miles_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "divine_nautical_miles_challenge") >= METERS_TO_TRAVEL
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:modify_stat_by_amount(stats_id, "divine_nautical_miles_challenge", BOAT_TRAVEL_DISTANCE)
	end,
	progress = function (statistics_db, stats_id, template_data)
		local meters_travelled = statistics_db:get_persistent_stat(stats_id, "divine_nautical_miles_challenge")
		local nautical_miles_travelled = math.floor(meters_travelled * 0.539957) * 0.001

		return {
			nautical_miles_travelled,
			NAUTICAL_MILES,
		}
	end,
	progress_text_format_func = function (current, required)
		return string.format("%.1f / %d", current, required)
	end,
}

local ANCHOR_TIMER = 60
local NUM_ANCHOR_EVENTS = 3

achievements.divine_anchor_challenge = {
	always_run = true,
	display_completion_ui = true,
	icon = "achv_divine_anchor_challenge_icon",
	name = "achv_divine_anchor_challenge_name",
	desc = function ()
		return string.format(Localize("achv_divine_anchor_challenge_desc"), ANCHOR_TIMER)
	end,
	events = {
		"divine_anchor_attached",
		"divine_anchor_destroyed",
		"divine_anchor_challenge_completed",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "divine_anchor_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		if not Managers.state.network or not Managers.state.network.is_server then
			return
		end

		local t = Managers.time:time("game")

		if event_name == "divine_anchor_attached" then
			if template_data.total_time == nil then
				template_data.total_time = 0
				template_data.num_events_done = 0
			end

			template_data.attached_timestamp = t
			template_data.num_events_done = template_data.num_events_done + 1
			template_data.players_at_start = template_data.players_at_start or table.keys(Managers.player:human_players())
		elseif event_name == "divine_anchor_destroyed" and template_data.attached_timestamp then
			local time_since_attached = t - template_data.attached_timestamp

			template_data.total_time = template_data.total_time + time_since_attached
		end

		if event_name == "divine_anchor_challenge_completed" and ANCHOR_TIMER > template_data.total_time and template_data.num_events_done >= NUM_ANCHOR_EVENTS then
			local valid_players = template_data.players_at_start

			for i = 1, #valid_players do
				rpc_increment_stat_unique_id(valid_players[i], "divine_anchor_challenge")
			end
		end
	end,
}

local SINK_SHIPS_TIMER = 45

achievements.divine_sink_ships_challenge = {
	display_completion_ui = true,
	icon = "achv_divine_sink_ships_challenge_icon",
	name = "achv_divine_sink_ships_challenge_name",
	desc = function ()
		return string.format(Localize("achv_divine_sink_ships_challenge_desc"), SINK_SHIPS_TIMER)
	end,
	events = {
		"divine_sink_ships_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "divine_sink_ships_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local t = Managers.time:time("game")
		local challenge_start = event_data[1]

		if challenge_start then
			template_data.challenge_over_t = t + SINK_SHIPS_TIMER
		elseif not template_data.challenge_over_t then
			return
		elseif t < template_data.challenge_over_t then
			statistics_db:increment_stat(stats_id, "divine_sink_ships_challenge")
		end
	end,
}
achievements.divine_cannon_challenge = {
	display_completion_ui = true,
	icon = "achv_divine_cannon_challenge_icon",
	name = "achv_divine_cannon_challenge_name",
	desc = function ()
		return string.format(Localize("achv_divine_cannon_challenge_desc"))
	end,
	events = {
		"divine_cannon_challenge",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "divine_cannon_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		statistics_db:increment_stat(stats_id, "divine_cannon_challenge")
	end,
}
achievements.divine_chaos_warrior_challenge = {
	always_run = true,
	display_completion_ui = true,
	icon = "achv_divine_chaos_warrior_challenge_icon",
	name = "achv_divine_chaos_warrior_challenge_name",
	desc = function ()
		return string.format(Localize("achv_divine_chaos_warrior_challenge_desc"))
	end,
	events = {
		"on_damage_dealt",
	},
	completed = function (statistics_db, stats_id, template_data)
		return statistics_db:get_persistent_stat(stats_id, "divine_chaos_warrior_challenge") >= 1
	end,
	on_event = function (statistics_db, stats_id, template_data, event_name, event_data)
		local damage_source = event_data[9]

		if damage_source ~= "sawblade_instant_kill" then
			return
		end

		local level_key = Managers.state.game_mode:level_key()

		if not level_key or level_key ~= "dlc_reikwald_river" then
			return
		end

		local victim_unit = event_data[1]
		local breed = victim_unit and Unit.get_data(victim_unit, "breed")
		local breed_name = breed and breed.name

		if breed_name == "chaos_warrior" or breed_name == "chaos_bulwark" then
			statistics_db:increment_stat_and_sync_to_clients("divine_chaos_warrior_challenge")
		end
	end,
}
divine_all_challenges = table.clone(all_difficulties)

table.remove(divine_all_challenges, #divine_all_challenges)

divine_all_challenges[#divine_all_challenges + 1] = "divine_nautical_miles_challenge"
divine_all_challenges[#divine_all_challenges + 1] = "divine_sink_ships_challenge"
divine_all_challenges[#divine_all_challenges + 1] = "divine_cannon_challenge"
divine_all_challenges[#divine_all_challenges + 1] = "divine_chaos_warrior_challenge"

add_meta_challenge(achievements, "divine_all_challenges", divine_all_challenges, "achv_divine_complete_all_icon", nil, nil, nil)
add_console_achievements(XB1_ACHIEVEMENT_ID, PS4_ACHIEVEMENT_ID)
