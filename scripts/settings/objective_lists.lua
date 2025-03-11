-- chunkname: @scripts/settings/objective_lists.lua

local ObjectiveTypes = require("scripts/entity_system/systems/objective/objective_types")
local ObjectiveTags = require("scripts/entity_system/systems/objective/objective_tags")

ObjectiveLists = {}

local points_multiplier = 1
local reach_points = 10
local interact_points = 10
local payload_points = 1
local capture_points = 1
local safe_room_points = 10
local socket_points = 20
local target_points = 10
local survive_points = 1
local waystone_points = 10

local function increment_func(existing_value)
	return (existing_value or 0) + 1
end

ObjectiveLists.bell_pvp_set_1 = {
	{
		versus_volume_objective_SZ01 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_bell_reach_SZ_01",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_01 = {
			description = "level_objective_description_bell_01",
			volume_name = "versus_bell_reach_01",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_objective_01 = {
			capture_time = 180,
			description = "level_objective_description_bell_02",
			num_sections = 90,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_alley = {
			description = "level_objective_description_bell_alley",
			volume_name = "versus_bell_reach_alley",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_008 = {
			description = "level_objective_description_bell_02_B",
			volume_name = "versus_bell_reach_01_B",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_02 = {
			description = "level_objective_description_bell_03",
			volume_name = "versus_bell_reach_02",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_socket_objective_01 = {
			close_to_win_on_section = 3,
			description = "level_objective_description_bell_04",
			num_sockets = 3,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			score_per_socket = socket_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
			almost_done = function (self, active_objectives)
				local num_sockets = self.num_sockets
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() >= (num_sockets - 1.5) / num_sockets then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_03 = {
			description = "level_objective_description_bell_05",
			play_safehouse_vo = true,
			volume_name = "versus_reach_waystone_round_1",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.bell_pvp_set_2 = {
	{
		versus_volume_objective_SZ02 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_bell_reach_SZ_02",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_04 = {
			description = "level_objective_description_bell_06",
			volume_name = "versus_bell_reach_03",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_payload_objective_01 = {
			description = "level_objective_description_bell_07",
			num_sections = 90,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_payload,
			score_per_section = payload_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.8 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_07_B = {
			description = "level_objective_description_bell_07_B",
			volume_name = "versus_reach_objective_04_B",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_07 = {
			description = "level_objective_description_bell_08A",
			volume_name = "versus_bell_reach_04",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_05 = {
			description = "level_objective_description_bell_08",
			volume_name = "versus_reach_bell",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_01 = {
			close_to_win_on_section = 3,
			description = "level_objective_description_bell_09",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_target,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 3 then
					return true
				end
			end,
			sub_objectives = {
				sub_sub_objective_container_01 = {
					description = "level_objective_description_bell_09",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points * 3,
					sub_objectives = {
						versus_target_objective_bell_01 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_02 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_03 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
					},
				},
				sub_sub_objective_container_02 = {
					description = "level_objective_description_bell_09",
					score_for_completion = target_points * 3,
					sub_objectives = {
						versus_target_objective_bell_04 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_05 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_06 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
					},
				},
				sub_sub_objective_container_03 = {
					description = "level_objective_description_bell_09",
					score_for_completion = target_points * 3,
					sub_objectives = {
						versus_target_objective_bell_07 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_08 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
						versus_target_objective_bell_09 = {
							description = "level_objective_description_bell_09",
							objective_tag = ObjectiveTags.objective_tag_chains,
							objective_type = ObjectiveTypes.objective_target,
						},
					},
				},
			},
		},
	},
	{
		versus_volume_objective_08 = {
			description = "level_objective_description_bell_10",
			volume_name = "versus_bell_reach_05",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_06 = {
			description = "level_objective_description_bell_10",
			play_arrive_vo = true,
			play_waystone_vo = true,
			volume_name = "versus_reach_waystone",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = waystone_points,
		},
	},
}
ObjectiveLists.military_pvp_set_1 = {
	{
		versus_volume_objective_sz_01 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_military_sz_01",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_first_alley = {
			description = "level_objective_description_military_alley",
			volume_name = "versus_military_reach_first_alley",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_franz = {
			description = "level_objective_description_military_01",
			volume_name = "versus_military_reach_franz",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_socket_objective_01 = {
			close_to_win_on_section = 2,
			description = "level_objective_description_military_02",
			num_sockets = 2,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			score_per_socket = socket_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local num_sockets = self.num_sockets
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() >= (num_sockets - 1.5) / num_sockets then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_02 = {
			description = "level_objective_description_military_03",
			volume_name = "versus_military_reach_02",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_objective_military_001 = {
			description = "level_objective_description_military_04",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_survive_objective_01 = {
			description = "level_objective_description_military_05",
			num_sections = 40,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 90,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_volume_objective_02B = {
			description = "level_objective_description_military_06",
			play_safehouse_vo = true,
			volume_name = "versus_military_reach_02B",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.military_pvp_set_2 = {
	{
		versus_volume_objective_sz_02 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_military_sz_02",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_03 = {
			description = "level_objective_description_military_07",
			volume_name = "versus_military_reach_03",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_03_B = {
			description = "level_objective_description_military_07_B",
			volume_name = "versus_military_reach_03_B",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_04 = {
			description = "level_objective_description_military_09",
			volume_name = "versus_military_reach_04",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_point_objective_003 = {
			capture_time = 180,
			description = "level_objective_description_military_10",
			num_sections = 90,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_05 = {
			close_to_win_on_completion = true,
			description = "level_objective_description_military_11",
			volume_name = "versus_military_reach_05",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_objective_military_002 = {
			description = "level_objective_description_military_12",
			mission_name = "military_move_along_wall",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_activate = {
				objective_part = 1,
			},
			on_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_survive_objective_03 = {
			description = "level_objective_description_military_12_B",
			num_sections = 20,
			play_arrive_vo = true,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 33,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				objective_part = 2,
			},
			on_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_socket_objective_02 = {
			description = "level_objective_description_military_13",
			num_sockets = 1,
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			score_per_socket = socket_points,
			on_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_mission_objective_002 = {
			description = "level_objective_description_military_14",
			mission_name = "military_open_gate",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_volume_objective_06 = {
			description = "level_objective_description_military_15",
			play_safehouse_vo = true,
			volume_name = "versus_military_reach_06",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.military_pvp_set_3 = {
	{
		versus_volume_objective_sz_03 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_military_sz_03",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_07 = {
			description = "level_objective_description_military_16",
			volume_name = "versus_military_reach_07",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_point_objective_004 = {
			capture_time = 210,
			description = "level_objective_description_military_17",
			num_sections = 95,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_08 = {
			description = "level_objective_description_military_18",
			volume_name = "versus_military_reach_08",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_mission_objective_004 = {
			description = "level_objective_description_military_19",
			mission_name = "military_ring_bell",
			play_arrive_vo = true,
			score_for_completion = interact_points,
			objective_type = ObjectiveTypes.objective_interact,
		},
	},
	{
		versus_survive_objective_02 = {
			description = "level_objective_description_military_20",
			num_sections = 95,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 190,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_09 = {
			description = "level_objective_description_military_21",
			play_waystone_vo = true,
			volume_name = "versus_military_reach_09",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = reach_points,
		},
	},
}
ObjectiveLists.farmlands_pvp_set_1 = {
	{
		versus_volume_objective_farmlands_sz_01 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "volume_versus_reach_sz_01",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_farmlands_01 = {
			description = "level_objective_description_farmlands_01",
			volume_name = "volume_versus_reach_001",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_01_farm = {
			description = "level_objective_description_farmlands_01_farm",
			volume_name = "versus_reach_001_farm",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_02_road = {
			description = "level_objective_description_farmlands_02_road",
			volume_name = "versus_reach_02_road",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_02 = {
			description = "level_objective_description_farmlands_03",
			volume_name = "volume_versus_reach_002",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_01 = {
			description = "level_objective_description_farmlands_04",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_target,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_target_objective_001 = {
					description = "level_objective_description_farmlands_04",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_002 = {
					description = "level_objective_description_farmlands_04",
					score_for_completion = target_points,
					objective_type = ObjectiveTypes.objective_target,
				},
				versus_target_objective_003 = {
					description = "level_objective_description_farmlands_04",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_004 = {
					description = "level_objective_description_farmlands_04",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_005 = {
					description = "level_objective_description_farmlands_04",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_006 = {
					description = "level_objective_description_farmlands_04",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
			},
		},
	},
	{
		versus_volume_objective_farmlands_03 = {
			description = "level_objective_description_farmlands_05",
			volume_name = "volume_versus_reach_003",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_04 = {
			description = "level_objective_description_farmlands_06",
			volume_name = "volume_versus_reach_004",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_mission_objective_farmlands_key = {
			description = "level_objective_description_farmlands_07",
			mission_name = "versus_mission_farmlands_key",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_mission_objective_open_barn = {
			description = "level_objective_description_farmlands_08",
			mission_name = "versus_mission_objective_barn",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_mission_objective_monster = {
			description = "level_objective_description_farmlands_09",
			mission_name = "versus_mission_monster",
			play_arrive_vo = true,
			play_complete_vo = true,
			score_for_completion = 30,
			objective_type = ObjectiveTypes.objective_survive,
			vo_context_on_activate = {
				current_objective = "three",
			},
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_socket_objective_01 = {
			description = "level_objective_description_farmlands_09_B",
			num_sockets = 1,
			objective_type = ObjectiveTypes.objective_socket,
			score_per_socket = socket_points,
			almost_done = function (self, active_objectives)
				local num_sockets = self.num_sockets
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() >= (num_sockets - 1.5) / num_sockets then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_farmlands_05 = {
			description = "level_objective_description_farmlands_10",
			play_safehouse_vo = true,
			volume_name = "volume_versus_reach_005",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.farmlands_pvp_set_2 = {
	{
		versus_volume_objective_farmlands_sz_02 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "volume_versus_reach_sz_02",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_farmlands_06 = {
			description = "level_objective_description_farmlands_11",
			volume_name = "volume_versus_reach_006",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_point_objective_road = {
			capture_time = 180,
			description = "level_objective_description_farmlands_12",
			num_sections = 80,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_farmlands_06_B = {
			description = "level_objective_description_farmlands_11_B",
			volume_name = "volume_versus_reach_006_B",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_07 = {
			description = "level_objective_description_farmlands_13",
			volume_name = "volume_versus_reach_007",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_farmlands_08 = {
			description = "level_objective_description_farmlands_14",
			volume_name = "volume_versus_reach_008",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_objective_prisoners_streets = {
			description = "level_objective_description_farmlands_15",
			objective_type = ObjectiveTypes.objective_interact,
			objective_tag = ObjectiveTags.objective_tag_prisoner,
			score_for_completion = interact_points,
		},
	},
	{
		sub_objective_container_prisoners_01 = {
			description = "level_objective_description_farmlands_16",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_interact_objective_prisoners_001 = {
					description = "level_objective_description_farmlands_16",
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_002 = {
					description = "level_objective_description_farmlands_16",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_003 = {
					description = "level_objective_description_farmlands_16",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_004 = {
					description = "level_objective_description_farmlands_16",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
			},
		},
	},
	{
		sub_objective_container_prisoners_02 = {
			description = "level_objective_description_farmlands_17",
			objective_type = ObjectiveTypes.objective_interact,
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_interact_objective_prisoners_005 = {
					description = "level_objective_description_farmlands_17",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_006 = {
					description = "level_objective_description_farmlands_17",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
			},
		},
	},
	{
		sub_objective_container_prisoners_03 = {
			description = "level_objective_description_farmlands_18",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			objective_tag = ObjectiveTags.objective_tag_prisoner,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_interact_objective_prisoners_007 = {
					description = "level_objective_description_farmlands_18",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_008 = {
					description = "level_objective_description_farmlands_18",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_009 = {
					description = "level_objective_description_farmlands_18",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_010 = {
					description = "level_objective_description_farmlands_18",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
			},
		},
	},
	{
		versus_volume_objective_farmlands_end = {
			description = "level_objective_description_farmlands_19",
			play_waystone_vo = true,
			volume_name = "volume_versus_reach_009",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = waystone_points,
		},
	},
}
ObjectiveLists.fort_pvp_set_1 = {
	{
		versus_volume_objective_001 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_reach_001",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_002 = {
			description = "level_objective_description_fort_01",
			volume_name = "versus_reach_002",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_point_objective_001 = {
			capture_time = 120,
			description = "level_objective_description_fort_02",
			num_sections = 50,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_002_B_road = {
			description = "level_objective_description_fort_02_B",
			volume_name = "versus_reach_002_B_road",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_003 = {
			description = "level_objective_description_fort_03",
			volume_name = "versus_reach_003",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_payload_objective_01 = {
			description = "level_objective_description_fort_04",
			num_sections = 70,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_payload,
			score_per_section = payload_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.8 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_004 = {
			description = "level_objective_description_fort_05",
			volume_name = "versus_reach_004",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_005 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_arrive_vo = true,
			play_safehouse_vo = true,
			volume_name = "versus_reach_005",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.fort_pvp_set_2 = {
	{
		versus_volume_objective_006 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_reach_006",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_007 = {
			description = "level_objective_description_fort_06",
			volume_name = "versus_reach_007",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_fort_interact_001 = {
			description = "level_objective_description_fort_07",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_activate = {
				objective_part = 1,
			},
			vo_context_on_complete = {
				objective_part = 2,
			},
		},
	},
	{
		sub_objective_container_bells = {
			description = "level_objective_description_fort_07_B",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			sub_objectives = {
				versus_interact_fort_tower_001 = {
					description = "level_objective_description_fort_07_B",
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = interact_points,
				},
				versus_interact_fort_tower_002 = {
					description = "level_objective_description_fort_07_B",
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = interact_points,
				},
				versus_interact_fort_tower_003 = {
					description = "level_objective_description_fort_07_B",
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = interact_points,
				},
			},
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_008 = {
			description = "level_objective_description_fort_08",
			volume_name = "versus_reach_008",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_009 = {
			description = "level_objective_description_fort_09",
			volume_name = "versus_reach_009",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_payload_objective_02 = {
			description = "level_objective_description_fort_10",
			num_sections = 90,
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_payload,
			score_per_section = payload_points,
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.8 then
					return true
				end
			end,
		},
	},
	{
		versus_mission_objective_breach_wall = {
			description = "level_objective_description_fort_11",
			mission_name = "mission_fort_breach_wall",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_volume_objective_010 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_safehouse_vo = true,
			volume_name = "versus_reach_010",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.fort_pvp_set_3 = {
	{
		versus_volume_objective_011 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_reach_011",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_012 = {
			description = "level_objective_description_fort_12",
			volume_name = "versus_reach_012",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_cannon_balls = {
			description = "level_objective_description_fort_13",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_socket_objective_01 = {
					description = "level_objective_description_fort_13",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
				versus_socket_objective_02 = {
					description = "level_objective_description_fort_13",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
			},
		},
	},
	{
		versus_interact_objective_elevator = {
			description = "level_objective_description_fort_14",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_volume_objective_013 = {
			description = "level_objective_description_fort_15",
			volume_name = "versus_reach_013",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_014 = {
			description = "level_objective_description_fort_16",
			volume_name = "versus_reach_014",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interaction_fort_portcullis = {
			description = "level_objective_description_fort_17",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_activate = {
				objective_part = 1,
			},
			vo_context_on_complete = {
				objective_part = 2,
			},
		},
	},
	{
		versus_survive_objective_fort_portcullis = {
			description = "level_objective_description_military_20",
			num_sections = 10,
			play_arrive_vo = true,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 25,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "three",
				objective_part = 1,
			},
		},
	},
	{
		versus_volume_objective_015 = {
			description = "level_objective_description_fort_17_B",
			volume_name = "versus_reach_015",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_cannons = {
			description = "level_objective_description_fort_18",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			sub_objectives = {
				versus_interact_cannon_01 = {
					description = "level_objective_description_fort_18",
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = socket_points + interact_points,
				},
				versus_interact_cannon_02 = {
					description = "level_objective_description_fort_18",
					objective_type = ObjectiveTypes.objective_interact,
					score_for_completion = socket_points + interact_points,
				},
			},
		},
	},
	{
		versus_socket_objective_fort = {
			description = "level_objective_description_military_13",
			num_sockets = 1,
			objective_type = ObjectiveTypes.objective_socket,
			score_per_socket = socket_points,
			on_last_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_interact_cannon_03 = {
			description = "level_objective_description_fort_20",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
		},
	},
	{
		versus_volume_objective_016 = {
			description = "level_objective_description_fort_21",
			play_waystone_vo = true,
			volume_name = "volume_versus_reach_end_dome",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = waystone_points,
		},
	},
}
ObjectiveLists.forest_ambush_pvp_set_1 = {
	{
		versus_volume_objective_01 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_forest_ambush_reach_001",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_02 = {
			description = "level_objective_description_forest_ambush_01",
			volume_name = "versus_forest_ambush_reach_002",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_01 = {
			description = "level_objective_description_forest_ambush_02",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_target,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_target_objective_001 = {
					description = "level_objective_description_forest_ambush_02",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_002 = {
					description = "level_objective_description_forest_ambush_02",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_003 = {
					description = "level_objective_description_forest_ambush_02",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_004 = {
					description = "level_objective_description_forest_ambush_02",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
				versus_target_objective_005 = {
					description = "level_objective_description_forest_ambush_02",
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
				},
			},
		},
	},
	{
		versus_volume_objective_03 = {
			description = "level_objective_description_forest_ambush_03",
			volume_name = "versus_forest_ambush_reach_003",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_04 = {
			description = "level_objective_description_forest_ambush_04",
			volume_name = "versus_forest_ambush_reach_004",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_payload_objective_01 = {
			description = "level_objective_description_forest_ambush_05",
			num_sections = 20,
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_payload,
			score_per_section = payload_points,
			vo_context_on_activate = {
				objective_part = 1,
			},
			vo_context_on_complete = {
				objective_part = 2,
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.8 then
					return true
				end
			end,
		},
	},
	{
		versus_survive_objective_02 = {
			description = "mission_bastion_survive",
			num_sections = 30,
			play_arrive_vo = true,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 120,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_volume_objective_05 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_safehouse_vo = true,
			volume_name = "versus_forest_ambush_reach_005",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.forest_ambush_pvp_set_2 = {
	{
		versus_volume_objective_06 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_forest_ambush_reach_006",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_07 = {
			description = "level_objective_description_forest_ambush_07",
			volume_name = "versus_forest_ambush_reach_007",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_doomwheels_01 = {
			description = "level_objective_description_forest_ambush_08",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_socket_objective_doomwheels_001 = {
					description = "level_objective_description_forest_ambush_08",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
				versus_socket_objective_doomwheels_002 = {
					description = "level_objective_description_forest_ambush_08",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
				versus_socket_objective_doomwheels_003 = {
					description = "level_objective_description_forest_ambush_08",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
			},
		},
	},
	{
		versus_volume_objective_08_B = {
			description = "level_objective_description_forest_ambush_08_B",
			volume_name = "versus_forest_ambush_reach_008_B",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_08 = {
			description = "level_objective_description_forest_ambush_09",
			volume_name = "versus_forest_ambush_reach_008",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_gargoyle_heads_01 = {
			description = "level_objective_description_forest_ambush_11",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_socket,
			vo_context_on_complete = {
				current_objective = "three",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_socket_objective_gargoyles_001 = {
					description = "level_objective_description_forest_ambush_11",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
				versus_socket_objective_gargoyles_002 = {
					description = "level_objective_description_forest_ambush_11",
					objective_type = ObjectiveTypes.objective_socket,
					score_for_completion = socket_points,
				},
			},
		},
	},
	{
		versus_volume_objective_09 = {
			description = "level_objective_description_forest_ambush_10",
			volume_name = "versus_forest_ambush_reach_009",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_prisoners_01 = {
			description = "level_objective_description_forest_ambush_11_B",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_interact_objective_prisoners_001 = {
					description = "level_objective_description_forest_ambush_11_B",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_002 = {
					description = "level_objective_description_forest_ambush_11_B",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_003 = {
					description = "level_objective_description_forest_ambush_11_B",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_004 = {
					description = "level_objective_description_forest_ambush_11_B",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
				versus_interact_objective_prisoners_005 = {
					description = "level_objective_description_forest_ambush_11_B",
					objective_type = ObjectiveTypes.objective_interact,
					objective_tag = ObjectiveTags.objective_tag_prisoner,
					score_for_completion = interact_points,
				},
			},
		},
	},
	{
		versus_volume_objective_010 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_safehouse_vo = true,
			volume_name = "versus_forest_ambush_reach_010",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.forest_ambush_pvp_set_3 = {
	{
		versus_volume_objective_011 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_forest_ambush_reach_011",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_012 = {
			description = "level_objective_description_forest_ambush_12",
			volume_name = "versus_forest_ambush_reach_012",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_point_001 = {
			capture_time = 180,
			description = "level_objective_description_forest_ambush_12_B",
			num_sections = 80,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
		},
	},
	{
		versus_volume_objective_013 = {
			description = "level_objective_description_forest_ambush_13",
			volume_name = "versus_forest_ambush_reach_013",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_ring_bell = {
			description = "level_objective_description_forest_ambush_14",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_survive_objective_01 = {
			description = "level_objective_description_forest_ambush_15",
			num_sections = 100,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 180,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_014 = {
			description = "level_objective_description_forest_ambush_16",
			play_waystone_vo = true,
			volume_name = "versus_forest_ambush_reach_014",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = waystone_points,
		},
	},
}
ObjectiveLists.dwarf_exterior_pvp_set_1 = {
	{
		versus_volume_objective_exterior_sz01 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_exterior_reach_sz01",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_exterior_001 = {
			description = "level_objective_description_exterior_01",
			volume_name = "versus_exterior_reach_001",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_exterior_002 = {
			description = "level_objective_description_exterior_02",
			volume_name = "versus_exterior_reach_002",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_exterior_003 = {
			description = "level_objective_description_exterior_03",
			volume_name = "versus_exterior_reach_003",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_capture_objective_01 = {
			capture_time = 180,
			description = "level_objective_description_exterior_04",
			num_sections = 25,
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_capture_point,
			score_per_section = capture_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.75 then
					return true
				end
			end,
		},
	},
	{
		versus_volume_objective_exterior_005 = {
			description = "level_objective_description_exterior_05",
			volume_name = "versus_exterior_reach_005",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_objective_exterior_001 = {
			description = "level_objective_description_exterior_06_A",
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_activate = {
				objective_part = 1,
			},
		},
	},
	{
		versus_survive_objective_01 = {
			description = "level_objective_description_exterior_07_A",
			dialogue_event = "vs_mg_dwarf_external_windlass_reminder",
			num_sections = 5,
			play_dialogue_event_on_complete = true,
			score_for_completion = 0,
			time_for_completion = 20,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			on_last_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_interact_objective_exterior_002 = {
			description = "level_objective_description_exterior_06_B",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_activate = {
				objective_part = 2,
			},
		},
	},
	{
		versus_survive_objective_02 = {
			description = "level_objective_description_exterior_07_B",
			dialogue_event = "vs_mg_dwarf_external_windlass_reminder",
			num_sections = 5,
			play_dialogue_event_on_complete = true,
			score_for_completion = 0,
			time_for_completion = 20,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			on_last_leaf_complete_sound_event = {
				dark_pact = "versus_hud_sub_objective_completed_pactsworn",
				heroes = "versus_hud_sub_objective_completed_heroes",
			},
		},
	},
	{
		versus_interact_objective_exterior_003 = {
			description = "level_objective_description_exterior_06_C",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_survive_objective_03 = {
			description = "level_objective_description_exterior_07_C",
			num_sections = 5,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 20,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
		},
	},
	{
		versus_volume_objective_exterior_006 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_safehouse_vo = true,
			volume_name = "versus_exterior_reach_006",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.dwarf_exterior_pvp_set_2 = {
	{
		versus_volume_objective_exterior_007 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_exterior_reach_007",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_exterior_008 = {
			description = "level_objective_description_exterior_08",
			volume_name = "versus_exterior_reach_008",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_payload_objective_exterior_01 = {
			description = "level_objective_description_exterior_09",
			num_sections = 70,
			play_arrive_vo = true,
			objective_type = ObjectiveTypes.objective_payload,
			score_per_section = payload_points,
			vo_context_on_complete = {
				current_objective = "two",
			},
			almost_done = function (self, active_objectives)
				local objective_name = active_objectives[1]
				local objective_extension = Managers.state.entity:system("objective_system"):extension_by_objective_name(objective_name)

				if objective_extension:get_percentage_done() > 0.8 then
					return true
				end
			end,
		},
	},
	{
		versus_interact_objective_black_powder = {
			description = "level_objective_description_exterior_09_B",
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_volume_objective_exterior_011 = {
			description = "level_objective_description_exterior_11",
			volume_name = "versus_exterior_reach_011",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_mad_dog = {
			close_to_win_on_sub_objective = 2,
			description = "level_objective_description_exterior_12",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_target,
			vo_context_on_activate = {
				objective_part = 1,
			},
			vo_context_on_complete = {
				current_objective = "safe_room",
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_capture_objective_mine_001 = {
					always_show_objective_marker = true,
					capture_time = 80,
					description = "level_objective_description_exterior_12",
					dialogue_event = "vs_mg_dwarf_external_capture_points_reminder",
					num_sections = 30,
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_capture_point,
					score_per_section = capture_points,
					vo_context_on_complete = {
						objective_part = increment_func,
					},
				},
				versus_capture_objective_mine_002 = {
					always_show_objective_marker = true,
					capture_time = 80,
					description = "level_objective_description_exterior_12",
					dialogue_event = "vs_mg_dwarf_external_capture_points_reminder",
					num_sections = 30,
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_capture_point,
					score_per_section = capture_points,
					vo_context_on_complete = {
						objective_part = increment_func,
					},
				},
				versus_capture_objective_mine_003 = {
					always_show_objective_marker = true,
					capture_time = 80,
					description = "level_objective_description_exterior_12",
					dialogue_event = "vs_mg_dwarf_external_capture_points_reminder",
					num_sections = 30,
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_capture_point,
					score_per_section = capture_points,
					vo_context_on_complete = {
						objective_part = increment_func,
					},
				},
			},
		},
	},
	{
		versus_volume_objective_exterior_012 = {
			description = "level_objective_description_vs_reach_safe_zone",
			play_safehouse_vo = true,
			volume_name = "versus_exterior_reach_012",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = safe_room_points,
		},
	},
}
ObjectiveLists.dwarf_exterior_pvp_set_3 = {
	{
		versus_volume_objective_sz_03 = {
			description = "level_objective_description_vs_safe_zone",
			score_for_completion = 0,
			volume_name = "versus_exterior_reach_013",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			vo_context_on_activate = {
				current_objective = "start_zone",
			},
			vo_context_on_complete = {
				current_objective = "one",
			},
		},
	},
	{
		versus_volume_objective_exterior_014 = {
			description = "level_objective_description_exterior_14",
			volume_name = "versus_exterior_reach_014",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_exterior_015 = {
			description = "level_objective_description_exterior_15",
			volume_name = "versus_exterior_reach_015",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_interact_objective_bombcart = {
			description = "level_objective_description_exterior_20",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_complete = {
				current_objective = "two",
				objective_part = 0,
			},
		},
	},
	{
		versus_volume_objective_exterior_016 = {
			description = "level_objective_description_exterior_16",
			volume_name = "versus_exterior_reach_016",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		versus_volume_objective_exterior_017 = {
			description = "level_objective_description_exterior_17",
			volume_name = "versus_exterior_reach_017",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
			vo_context_on_complete = {
				objective_part = 1,
			},
		},
	},
	{
		versus_volume_objective_exterior_018 = {
			description = "level_objective_description_exterior_18",
			play_arrive_vo = true,
			volume_name = "versus_exterior_reach_018",
			volume_type = "any_alive",
			objective_type = ObjectiveTypes.objective_reach,
			score_for_completion = reach_points,
		},
	},
	{
		sub_objective_container_01 = {
			description = "level_objective_description_exterior_19",
			play_arrive_vo = true,
			play_complete_vo = true,
			objective_type = ObjectiveTypes.objective_target,
			vo_context_on_activate = {
				destroyed_chains = 0,
				objective_part = 2,
			},
			vo_context_on_complete = {
				objective_part = 3,
			},
			almost_done = function (self, active_objectives)
				local objective_system = Managers.state.entity:system("objective_system")
				local num_total = objective_system:num_current_sub_objectives()
				local num_completed = objective_system:num_current_completed_sub_objectives()

				if num_total - num_completed <= 1 then
					return true
				end
			end,
			sub_objectives = {
				versus_target_objective_001 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
				versus_target_objective_002 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					score_for_completion = target_points,
					objective_type = ObjectiveTypes.objective_target,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
				versus_target_objective_003 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
				versus_target_objective_004 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
				versus_target_objective_005 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
				versus_target_objective_006 = {
					description = "level_objective_description_exterior_19",
					dialogue_event = "vs_mg_dwarf_external_chains_reminder",
					play_dialogue_event_on_complete = true,
					objective_type = ObjectiveTypes.objective_target,
					score_for_completion = target_points,
					vo_context_on_complete = {
						destroyed_chains = increment_func,
					},
				},
			},
		},
	},
	{
		versus_interact_objective_bombcart_again = {
			description = "level_objective_description_exterior_20",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
			vo_context_on_complete = {
				objective_part = 4,
			},
		},
	},
	{
		versus_survive_objective_05 = {
			description = "level_objective_description_exterior_20_B",
			dialogue_event = "vs_mg_dwarf_external_ignite_bomb",
			num_sections = 50,
			play_dialogue_event_on_complete = true,
			score_for_completion = 0,
			time_for_completion = 30,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
		},
	},
	{
		versus_interact_objective_ignite_bomb = {
			description = "level_objective_description_exterior_21",
			objective_type = ObjectiveTypes.objective_interact,
			score_for_completion = interact_points,
		},
	},
	{
		versus_survive_objective_04 = {
			description = "level_objective_description_exterior_22",
			num_sections = 40,
			play_complete_vo = true,
			score_for_completion = 0,
			time_for_completion = 20,
			objective_type = ObjectiveTypes.objective_survive,
			score_per_section = survive_points,
			vo_context_on_complete = {
				current_objective = "waystone",
			},
		},
	},
	{
		versus_volume_objective_exterior_019 = {
			description = "level_objective_description_exterior_23",
			play_waystone_vo = true,
			volume_name = "versus_exterior_reach_019",
			volume_type = "all_alive",
			objective_type = ObjectiveTypes.objective_safehouse,
			score_for_each_player_inside = reach_points,
		},
	},
}
ObjectiveLists.weave_1 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_2 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_3 = {
	{
		kill_enemies = {},
		capture_point_004 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		capture_point_005 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_4 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_5 = {
	{
		kill_enemies = {},
		capture_point_003 = {
			is_scored = true,
			sort_index = 3,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
			end,
		},
		capture_point_001 = {
			is_scored = true,
			sort_index = 1,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			sort_index = 2,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_6 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_7 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_gutter_runner", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_002 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
	},
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_minotaur", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_003 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn_nodelay", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_8 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_9 = {
	{
		kill_enemies = {},
		capture_point_001 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_chaos", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_chaos", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_6_boss_event_skaven", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_6_boss_event_skaven", spawner_id)
			end,
		},
		capture_point_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_event_beastmen", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_event_beastmen", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_10 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_11 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_12 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_004 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_008 = {
			template_name = "gargoyle_head_spawner",
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_008 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "gargoyle_head_spawner",
		},
	},
}
ObjectiveLists.weave_13 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_14 = {
	{
		kill_enemies = {},
		capture_point_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
			end,
		},
		capture_point_001 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		capture_point_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_15 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_16 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
			end,
		},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_001 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_007 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_17 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_18 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_001 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_chaos_warriors", spawner_id)
			end,
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_007 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_specials_small", spawner_id)
			end,
		},
	},
	{
		kill_enemies = {},
		weave_limited_item_track_spawner_006 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_explosive_barrel_socket_003 = {
			is_scored = true,
		},
	},
}
ObjectiveLists.weave_19 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_20 = {
	{
		kill_enemies = {},
		capture_point_006 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
			end,
		},
		capture_point_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_event_beastmen", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_event_beastmen", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_21 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_22 = {
	{
		kill_enemies = {},
		weave_target_spawner_006 = {
			is_scored = true,
		},
		weave_target_spawner_040 = {
			is_scored = true,
		},
		weave_target_spawner_010 = {
			is_scored = true,
		},
		weave_target_spawner_041 = {
			is_scored = true,
		},
		weave_target_spawner_011 = {
			is_scored = true,
		},
		weave_target_spawner_045 = {
			is_scored = true,
		},
		weave_target_spawner_020 = {
			is_scored = true,
		},
		weave_target_spawner_024 = {
			is_scored = true,
		},
		weave_target_spawner_030 = {
			is_scored = true,
		},
		weave_target_spawner_032 = {
			is_scored = true,
		},
	},
}
ObjectiveLists.weave_23 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_002 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_002 = {
			template_name = "gargoyle_head_spawner",
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_004 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_009 = {
			template_name = "gargoyle_head_spawner",
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_007 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_008 = {
			template_name = "gargoyle_head_spawner",
		},
	},
}
ObjectiveLists.weave_24 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_chaos_spawn", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_009 = {
			template_name = "magic_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_25 = {
	{
		kill_enemies = {},
		capture_point_007 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
			end,
		},
		capture_point_008 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_3_event", spawner_id)
			end,
		},
		capture_point_005 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_26 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_27 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_007 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_001 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_specials_small", spawner_id)
			end,
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_minotaur_nodelay", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_006 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_specials_medium", spawner_id)
			end,
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_004 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_specials_raid", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_28 = {
	{
		kill_enemies = {},
		weave_target_spawner_001 = {
			is_scored = true,
		},
		weave_target_spawner_005 = {
			is_scored = true,
		},
		weave_target_spawner_006 = {
			is_scored = true,
		},
		weave_target_spawner_007 = {
			is_scored = true,
		},
		weave_target_spawner_016 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_skaven", spawner_id)
			end,
		},
		weave_target_spawner_022 = {
			is_scored = true,
		},
		weave_target_spawner_031 = {
			is_scored = true,
		},
		weave_target_spawner_034 = {
			is_scored = true,
		},
		weave_target_spawner_041 = {
			is_scored = true,
		},
		weave_target_spawner_043 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_skaven", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_29 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre", spawner_id)
			end,
		},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_001 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_specials_raid", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_30 = {
	{
		kill_enemies = {},
		weave_target_spawner_004 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre_nodelay", spawner_id)
			end,
		},
		weave_target_spawner_006 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_target_spawner_028 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_minotaur_nodelay", spawner_id)
			end,
		},
		weave_target_spawner_024 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
			end,
		},
		weave_target_spawner_035 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend_nodelay", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_31 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_007 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_007 = {
			template_name = "gargoyle_head_spawner",
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_004 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_002 = {
			template_name = "gargoyle_head_spawner",
		},
	},
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_002 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_005 = {
			template_name = "gargoyle_head_spawner",
		},
	},
}
ObjectiveLists.weave_32 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_33 = {
	{
		kill_enemies = {},
		weave_target_spawner_001 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_005 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_009 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_013 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_011 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_012 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_022 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_028 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_016 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
		weave_target_spawner_015 = {
			is_scored = true,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_special_mixed", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_34 = {
	{
		kill_enemies = {},
		capture_point_001 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_3_event_no_chaos", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_3_event_no_chaos", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_specials_raid", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_specials_raid", spawner_id)
			end,
		},
		capture_point_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
		},
		capture_point_004 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_medium_no_chaos", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_medium_no_chaos", spawner_id)
			end,
		},
		capture_point_008 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small_no_chaos", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_small_no_chaos", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_35 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_gutter_runner", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_003 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("objective_event_beastmen", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_36 = {
	{
		kill_enemies = {},
		weave_target_spawner_001 = {
			is_scored = true,
		},
		weave_target_spawner_002 = {
			is_scored = true,
		},
		weave_target_spawner_004 = {
			is_scored = true,
		},
		weave_target_spawner_005 = {
			is_scored = true,
		},
		weave_target_spawner_006 = {
			is_scored = true,
		},
		weave_target_spawner_007 = {
			is_scored = true,
		},
		weave_target_spawner_008 = {
			is_scored = true,
		},
		weave_target_spawner_009 = {
			is_scored = true,
		},
		weave_target_spawner_011 = {
			is_scored = true,
		},
		weave_target_spawner_010 = {
			is_scored = true,
		},
		weave_target_spawner_014 = {
			is_scored = true,
		},
		weave_target_spawner_016 = {
			is_scored = true,
		},
		weave_target_spawner_018 = {
			is_scored = true,
		},
		weave_target_spawner_019 = {
			is_scored = true,
		},
		weave_target_spawner_023 = {
			is_scored = true,
		},
		weave_target_spawner_024 = {
			is_scored = true,
		},
		weave_target_spawner_027 = {
			is_scored = true,
		},
		weave_target_spawner_026 = {
			is_scored = true,
		},
	},
}
ObjectiveLists.weave_37 = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_stormfiend", spawner_id)
			end,
		},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_rat_ogre", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_002 = {
			template_name = "explosive_barrel_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_38 = {
	{
		kill_enemies = {},
		capture_point_001 = {
			is_scored = true,
			timer = 25,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_chaos", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_chaos", spawner_id)
			end,
		},
		capture_point_002 = {
			is_scored = true,
			timer = 25,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
			end,
		},
		capture_point_003_skaven = {
			is_scored = true,
			timer = 25,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
		},
		capture_point_006_skaven = {
			is_scored = true,
			timer = 25,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_6_boss_event_skaven", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_6_boss_event_skaven", spawner_id)
			end,
		},
		capture_point_007 = {
			is_scored = true,
			timer = 25,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_large", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_39 = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_006 = {
			is_scored = true,
		},
		weave_limited_item_track_spawner_003 = {
			template_name = "gargoyle_head_spawner",
		},
	},
}
ObjectiveLists.weave_40 = {
	{
		kill_enemies = {},
	},
}
ObjectiveLists.weave_woods_3_cps = {
	{
		kill_enemies = {},
		capture_point_001 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		capture_point_007 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_medium", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_1_event_medium", spawner_id)
			end,
		},
		capture_point_008 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_2_event", spawner_id)
			end,
			on_complete_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:stop_terror_event("capture_point_2_event", spawner_id)
			end,
		},
	},
}
ObjectiveLists.weave_woods_3_cps = {
	{
		kill_enemies = {},
		weave_explosive_barrel_socket_007 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_explosive_barrel_socket_004 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large_skaven", spawner_id)
			end,
		},
		weave_explosive_barrel_socket_003 = {
			is_scored = true,
			on_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_boss_chaos_troll", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_001 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_chaos_warriors", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_006 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("weave_spot_event_skaven_specials_medium", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_004 = {
			template_name = "gargoyle_head_spawner",
			on_first_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_chaos", spawner_id)
			end,
		},
	},
}
ObjectiveLists["weave_27 - Copy"] = {
	{
		kill_enemies = {},
		weave_prop_skaven_doom_wheel_01_spawner_001 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_prop_skaven_doom_wheel_01_spawner_002 = {
			is_scored = true,
			timer = 10,
			on_socket_start_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_small", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_003 = {
			template_name = "explosive_barrel_spawner",
			on_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_4_event", spawner_id)
			end,
		},
		weave_limited_item_track_spawner_006 = {
			template_name = "explosive_barrel_spawner",
			on_pickup_func = function (unit)
				local spawner_id = Unit.get_data(unit, "terror_event_spawner_id")

				Managers.weave:start_terror_event("capture_point_1_event_large", spawner_id)
			end,
		},
	},
}

local data_by_name = {}

for lists_name, lists in pairs(ObjectiveLists) do
	for list_i, list in ipairs(lists) do
		table.clear(data_by_name)

		for objective_name, objective_data in pairs(list) do
			fassert(not data_by_name[objective_name] or table.is_empty(objective_data) or data_by_name[objective_name] == objective_data, "[ObjectiveLists] An objective set may not include multiple objectives of the same name, unless they don't contain any data or point to the same objective data reference. %s was found twice in list number %s in %s", objective_name, list_i, lists_name)

			data_by_name[objective_name] = objective_data
		end
	end
end
