-- chunkname: @scripts/ui/hint_ui/hint_templates.lua

local ObjectiveTypes = dofile("scripts/settings/objective_templates_vs")

HintTemplates = HintTemplates or {}
HintTemplates.first_time_pactsworn = {
	data = {
		body_text = "vs_hint_ghost_mode_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 20,
		foot_text = "vs_hint_ghost_mode_foot",
		game_mode_key = "versus",
		icon = "objective_ghost_mode",
		mechanism_name = "versus",
		side = "dark_pact",
		title_text = "vs_hint_ghost_mode_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "ghost_mode_exit",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()
					local local_player_unit = local_player.player_unit
					local ghost_mode_ext = ScriptUnit.has_extension(local_player_unit, "ghost_mode_system")
					local is_in_ghost_mode = ghost_mode_ext and ghost_mode_ext:is_in_ghost_mode()
					local is_dark_pact = side_name and side_name == data.side

					if is_dark_pact and is_in_ghost_mode then
						return true
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.horde_ability = {
	data = {
		body_text = "vs_hint_horde_ability_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 20,
		foot_text = "vs_hint_horde_ability_foot",
		game_mode_key = "versus",
		icon = "objective_horde",
		mechanism_name = "versus",
		side = "dark_pact",
		title_text = "vs_hint_horde_ability_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "versus_horde_ability",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local player_unit = local_player.player_unit

						if ALIVE[player_unit] then
							local horde_ability_extension = ScriptUnit.has_extension(player_unit, "versus_horde_ability_system")

							if horde_ability_extension then
								local ability_charge = horde_ability_extension:get_ability_charge(t)
								local ability_cooldown = horde_ability_extension:cooldown()

								if ability_charge and ability_cooldown <= ability_charge then
									return true
								end
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.scoring_points = {
	data = {
		body_text = "vs_hint_scoring_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 20,
		foot_text = "vs_hint_scoring_foot",
		game_mode_key = "versus",
		icon = "objective_points",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_scoring_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local player_unit = local_player.player_unit

						if ALIVE[player_unit] then
							return true
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.block_parry = {
	data = {
		body_text = "vs_hint_block_parry_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_block_parry_foot",
		icon = "objective_block",
		mechanism = "versus",
		side = "dark_pact",
		title_text = "vs_hint_block_parry_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "action_two",
			input_service_name = "Player",
		},
	},
}
HintTemplates.dodge = {
	data = {
		body_text = "vs_hint_dodge_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_dodge_foot",
		icon = "objective_dodge",
		mechanism = "versus",
		side = "dark_pact",
		title_text = "vs_hint_dodge_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "dodge_hold",
			input_service_name = "Player",
		},
	},
}
HintTemplates.early_win = {
	data = {
		body_text = "vs_hint_early_win_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_early_win_foot",
		icon = "objective_win",
		mechanism = "versus",
		side = "dark_pact",
		title_text = "vs_hint_early_win_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "    ",
			input_service_name = "Player",
		},
	},
}
HintTemplates.healing = {
	data = {
		body_text = "vs_hint_healing_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_healing_foot",
		game_mode_key = "versus",
		icon = "objective_heal",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_healing_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "wield_3",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local player_unit = local_player.player_unit

						if ALIVE[player_unit] then
							local status_extension = ScriptUnit.extension(player_unit, "status_system")
							local health_extension = ScriptUnit.extension(player_unit, "health_system")
							local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
							local has_healing_item = inventory_extension:get_slot_data("slot_healthkit")
							local is_dead = status_extension and status_extension:is_dead()
							local total_health_percent = is_dead and 0 or health_extension:current_health_percent()

							if total_health_percent <= 0.2 and has_healing_item then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.bombs = {
	data = {
		body_text = "vs_hint_bombs_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_bombs_foot",
		game_mode_key = "versus",
		icon = "objective_bomb",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_bombs_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "wield_5",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local player_unit = local_player.player_unit

						if ALIVE[player_unit] then
							local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
							local has_bomb_item = inventory_extension:get_slot_data("slot_grenade")

							if has_bomb_item then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.wounds = {
	data = {
		body_text = "vs_hint_wounds_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_wounds_foot",
		game_mode_key = "versus",
		icon = "objective_wound",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_wounds_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "versus_horde_ability",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local player_unit = local_player.player_unit

						if ALIVE[player_unit] then
							local status_extension = ScriptUnit.extension(player_unit, "status_system")
							local last_wound = status_extension:wounded_and_on_last_wound()

							if last_wound then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.loadouts_01 = {
	data = {
		body_text = "vs_hint_loadouts_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_loadouts_foot",
		icon = "objective_loadout",
		mechanism = "versus",
		side = "dark_pact",
		title_text = "vs_hint_loadouts_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "versus_horde_ability",
			input_service_name = "Player",
		},
	},
}
HintTemplates.all_chat = {
	data = {
		body_text = "vs_hint_chat_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_chat_foot",
		game_mode_key = "versus",
		icon = "objective_chat",
		mechanism_name = "versus",
		title_text = "vs_hint_chat_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "activate_chat_input",
			input_service_name = "chat_input",
		},
	},
	condition_function = function (data, dt, t)
		if Managers.input:is_device_active("gamepad") then
			return false
		end

		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local chat_manager = Managers.chat

			if chat_manager:chat_is_focused() then
				local view_name = Managers.chat:current_view_and_color()

				if view_name == "All" then
					return true
				end
			end
		end

		return false
	end,
}
HintTemplates.capture_objective = {
	data = {
		body_text = "vs_hint_capture_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_capture_objective_foot",
		game_mode_key = "versus",
		icon = "objective_capture_point",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_capture_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_capture_point" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.payload_objective = {
	data = {
		body_text = "vs_hint_payload_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_payload_objective_foot",
		game_mode_key = "versus",
		icon = "objective_payload",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_payload_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_payload" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.safe_zone = {
	data = {
		body_text = "vs_hint_safe_zone_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_safe_zone_foot",
		game_mode_key = "versus",
		icon = "objective_safehouse",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_safe_zone_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_safehouse" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.socket_objective = {
	data = {
		body_text = "vs_hint_socket_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_socket_objective_foot",
		game_mode_key = "versus",
		icon = "objective_socket",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_socket_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_socket" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.target_objective = {
	data = {
		body_text = "vs_hint_target_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_target_objective_foot",
		game_mode_key = "versus",
		icon = "objective_target",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_target_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_target" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.survive_event = {
	data = {
		body_text = "vs_hint_survive_event_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_survive_event_foot",
		game_mode_key = "versus",
		icon = "objective_survive",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_survive_event_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_survive" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.interact_objective = {
	data = {
		body_text = "vs_hint_interact_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_interact_objective_foot",
		game_mode_key = "versus",
		icon = "objective_interact",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_interact_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
		input_data = {
			input_action = "interact",
			input_service_name = "Player",
		},
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()

							if objective_type == "objective_interact" then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
HintTemplates.reach_objective = {
	data = {
		body_text = "vs_hint_reach_objective_body",
		class_name = "HintUIVersusHowToPlay",
		duration = 15,
		foot_text = "vs_hint_reach_objective_foot",
		game_mode_key = "versus",
		icon = "objective_reach",
		mechanism_name = "versus",
		side = "heroes",
		title_text = "vs_hint_reach_objective_title",
		definitions = local_require("scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions"),
	},
	condition_function = function (data, dt, t)
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local game_mode_key = Managers.state.game_mode:game_mode_key()

		if mechanism_name == data.mechanism_name and game_mode_key == data.game_mode_key then
			local local_player = Managers.player and Managers.player:local_player()

			if local_player then
				local local_party = local_player:get_party()
				local local_side = local_party and Managers.state.side.side_by_party[local_party]

				if local_side then
					local side_name = local_side:name()

					if side_name == data.side then
						local objective_system = Managers.state.entity:system("objective_system")

						if objective_system and objective_system:is_active() then
							local objective_type = objective_system:current_objective_type()
							local is_first_objective = objective_system:current_objective_index() == 1

							if objective_type == "objective_reach" and not is_first_objective then
								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
}
