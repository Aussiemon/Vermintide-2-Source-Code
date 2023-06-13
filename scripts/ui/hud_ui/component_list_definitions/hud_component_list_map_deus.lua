local adventure_settings = local_require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure")
local common_settings = require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_deus_common")
local components = {
	{
		class_name = "IngameNewsTickerUI",
		filename = "scripts/ui/hud_ui/ingame_news_ticker_ui",
		visibility_groups = {
			"entering_mission",
			"hero_selection_popup",
			"mission_vote",
			"game_mode_disable_hud",
			"cutscene",
			"realism",
			"dead",
			"alive"
		},
		validation_function = function (context, is_in_inn)
			local disable_news_ticker = script_data.disable_news_ticker

			return not disable_news_ticker
		end
	},
	{
		use_hud_scale = true,
		class_name = "TwitchVoteUI",
		filename = "scripts/ui/hud_ui/twitch_vote_ui",
		visibility_groups = {
			"realism",
			"alive",
			"dead"
		},
		validation_function = function (context, is_in_inn)
			local use_twitch_ui = true

			return use_twitch_ui
		end
	},
	{
		class_name = "IngamePlayerListUI",
		filename = GameSettingsDevelopment.use_new_tab_menu and "scripts/ui/views/ingame_player_list_ui_v2" or "scripts/ui/views/ingame_player_list_ui",
		visibility_groups = {
			"tab_menu",
			"realism",
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "SubtitleGui",
		filename = "scripts/ui/views/subtitle_gui",
		visibility_groups = {
			"cutscene",
			"realism",
			"dead",
			"alive"
		},
		validation_function = function (context, is_in_inn)
			if is_in_inn then
				return true
			else
				local use_twitch_ui = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

				if not use_twitch_ui then
					return true
				end
			end
		end
	},
	{
		use_hud_scale = true,
		class_name = "DeusRunStatsView",
		filename = "scripts/ui/views/deus_menu/deus_run_stats_view",
		visibility_groups = {
			"deus_run_stats",
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	}
}

DLCUtils.append("ingame_hud_components", components)
table.append(components, common_settings.components)

local visibility_groups = {}

table.append(visibility_groups, common_settings.visibility_groups)
table.append(visibility_groups, adventure_settings.visibility_groups)

return {
	components = components,
	visibility_groups = visibility_groups
}
