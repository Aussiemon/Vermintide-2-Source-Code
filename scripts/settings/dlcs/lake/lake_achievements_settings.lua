local settings = DLCSettings.lake
settings.achievement_outline = {
	heroes = {
		categories = {
			{
				name = "inventory_name_empire_soldier",
				entries = {
					"lake_complete_all_helmgart_levels_recruit_es_questingknight",
					"lake_complete_all_helmgart_levels_veteran_es_questingknight",
					"lake_complete_all_helmgart_levels_champion_es_questingknight",
					"lake_complete_all_helmgart_levels_legend_es_questingknight",
					"lake_complete_100_missions_es_questingknight",
					"lake_mission_streak_act1_legend_es_questingknight",
					"lake_mission_streak_act2_legend_es_questingknight",
					"lake_mission_streak_act3_legend_es_questingknight",
					"lake_boss_killblow",
					"lake_charge_stagger",
					"lake_bastard_block",
					"lake_untouchable",
					"lake_speed_quest",
					"lake_timing_quest",
					"complete_all_grailknight_challenges"
				}
			}
		}
	}
}
settings.achievement_template_file_names = {
	"scripts/managers/achievements/achievement_templates_lake"
}
settings.speed_quest_complete_time = 140
settings.timing_quest_complete_margain = 5
local speed_time = nil

local function _handle_speed_quest(player, completed)
	local t = Managers.time:time("game")
	local completion_time = settings.speed_quest_complete_time

	if completed < 2 then
		speed_time = t
	elseif completed > 1 and t < completion_time then
		local peer_id = player:network_id()
		local stat_name = "lake_speed_quest"
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

local timing_time = nil

local function _handle_timing_quest(player, completed)
	local t = Managers.time:time("game")
	local completion_margain = settings.timing_quest_complete_margain

	if completed < 2 then
		timing_time = t
	elseif completed > 1 and timing_time and t < timing_time + completion_margain then
		local peer_id = player:network_id()
		local stat_name = "lake_timing_quest"
		local network_manager = Managers.state.network
		local stat_id = NetworkLookup.statistics[stat_name]

		network_manager.network_transmit:send_rpc("rpc_increment_stat", peer_id, stat_id)
	end
end

settings.achievement_events = {
	on_challenge_completed = function (_, completed_challenge)
		local player_manager = Managers.player
		local local_player = player_manager:local_player()

		if local_player then
			local player_unit = local_player.player_unit

			if not player_unit then
				return
			end

			local player = player_manager:owner(player_unit)

			if not player then
				return
			end

			local unique_id = player:unique_id()
			local completed_challenges = Managers.venture.challenge:get_completed_challenges_filtered({}, "questing_knight", unique_id)

			if not completed_challenges then
				return
			end

			local completed = #completed_challenges

			_handle_speed_quest(local_player, completed)
			_handle_timing_quest(local_player, completed)
		end
	end
}

return
