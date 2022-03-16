local settings = DLCSettings.penny_part_3
settings.breeds = {
	"scripts/settings/breeds/breed_chaos_exalted_sorcerer_drachenfels"
}
settings.behaviour_trees_precompiled = {
	"scripts/entity_system/systems/behaviour/nodes/generated/bt_selector_chaos_exalted_sorcerer_drachenfels"
}
settings.anim_lookup = {
	"attack_float_01",
	"attack_float_02",
	"attack_float_01_fwd",
	"attack_float_02_fwd",
	"attack_float_03",
	"attack_float_06",
	"attack_float_03_fwd",
	"attack_float_06_fwd",
	"attack_close_01",
	"attack_close_02",
	"attack_close_03",
	"attack_float_special",
	"attack_float_combo_01",
	"float_teleport_start",
	"float_teleport_end",
	"teleport_defensive",
	"to_exhausted",
	"toggle_movement",
	"teleport_to_aoe",
	"teleport_to_flying",
	"float_teleport_death_end"
}
settings.behaviour_trees = {
	"scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_drachenfels_behavior"
}
settings.behaviour_tree_nodes = {
	"scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_chaos_sorcerer_charge_action",
	"scripts/entity_system/systems/behaviour/nodes/chaos_sorcerer/bt_swarm_action"
}

local function setup_sorcerer_boss_drachenfels_spawning(unit, blackboard, data)
	local call_position = nil
	local spawner = ConflictUtils.get_random_spawner_with_id("sorcerer_boss_drachenfels")

	if spawner then
		call_position = Unit.local_position(spawner, 0)
		local fwd = Vector3.normalize(Vector3.flat(Quaternion.forward(ScriptUnit.extension(spawner, "spawner_system"):spawn_rotation())))
		data.spawn_forward = Vector3Box(fwd)
		local spawners = {
			ConflictUtils.get_random_spawner_with_id("sorcerer_boss_drachenfels_minion")
		}

		print("found spawner for sorcerer_boss_drachenfels_minion:", spawners[1])

		spawners[2] = ConflictUtils.get_random_spawner_with_id("sorcerer_boss_drachenfels_minion", spawners[1])

		print("found spawner for sorcerer_boss_drachenfels_minion:", spawners[2])

		data.spawners = spawners
		blackboard.defensive_spawner = spawner
	else
		local dummy_action = {
			spawn_group = "default",
			use_fallback_spawners = true
		}
		call_position = BTSpawnAllies.find_spawn_point(unit, blackboard, dummy_action, data)
	end

	return call_position
end

settings.bt_enter_hooks = {
	on_chaos_exalted_sorcerer_drachenfels_intro_enter = function (unit, blackboard, t)
		local level_analysis = Managers.state.conflict.level_analysis
		local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_intro

		if node_units then
			local node_unit = node_units[1]
			local pos = Unit.local_position(node_unit, 0)
			local rot = Unit.local_rotation(node_unit, 0)
			blackboard.quick_teleport_exit_pos = Vector3Box(pos)
			blackboard.quick_teleport = true

			Unit.set_local_rotation(unit, 0, rot)

			local health_extension = ScriptUnit.extension(unit, "health_system")
			health_extension.is_invincible = true
		else
			print("Found no generic AI node (sorcerer_boss_drachenfels_intro) for lord intro, ", unit)

			blackboard.intro_timer = nil
		end

		LevelHelper:flow_event(blackboard.world, "spawn_shield")
		blackboard.health_extension:set_min_health_percentage(0.65)
	end,
	stop_fly_sound = function (unit, blackboard, t)
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_sorcerer_boss_fly_stop", unit)
	end,
	sorcerer_drachenfels_begin_defensive_mode = function (unit, blackboard, t)
		local data = {
			stay_still = true,
			end_time = math.huge
		}
		local call_position = setup_sorcerer_boss_drachenfels_spawning(unit, blackboard, data)
		blackboard.defensive_phase_duration = blackboard.defensive_phase_max_duration
		blackboard.spawning_allies = data
		blackboard.quick_teleport_exit_pos = Vector3Box(call_position)
		blackboard.quick_teleport = true
		data.call_position = blackboard.quick_teleport_exit_pos
		blackboard.has_call_position = true
		local health_extension = blackboard.health_extension
		blackboard.teleport_health_percent = health_extension:current_health_percent() - 0.1
		blackboard.spell_count = 0
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("ebh_summon", event_data)
	end,
	sorcerer_drachenfels_re_enter_defensive_mode = function (unit, blackboard, t)
		local data = {
			stay_still = true,
			end_time = math.huge
		}
		local level_analysis = Managers.state.conflict.level_analysis
		local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_intro
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)
		blackboard.spawning_allies = data
		blackboard.quick_teleport_exit_pos = Vector3Box(pos)
		blackboard.quick_teleport = true
		data.call_position = blackboard.quick_teleport_exit_pos
		blackboard.has_call_position = true

		LevelHelper:flow_event(blackboard.world, "spawn_shield")

		local health_extension = blackboard.health_extension
		health_extension.is_invincible = true

		if not blackboard.two_thirds_transition_done and not blackboard.one_third_transition_done then
			health_extension:set_min_health_percentage(0.32)
		elseif not blackboard.one_third_transition_done then
			health_extension:set_min_health_percentage(0)
		end

		blackboard.teleport_health_percent = blackboard.health_extension:current_health_percent() - 0.1
		blackboard.spell_count = 0
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("ebh_summon", event_data)
	end,
	teleport_spawn_sequence_drachenfels = function (unit, blackboard, t)
		local data = {
			stay_still = true,
			end_time = math.huge
		}

		setup_sorcerer_boss_drachenfels_spawning(unit, blackboard, data)

		blackboard.spawning_allies = data
	end,
	trickle_spawn_drachenfels = function (unit, blackboard, t)
		local data = {
			stay_still = true,
			end_time = math.huge
		}

		setup_sorcerer_boss_drachenfels_spawning(unit, blackboard, data)

		blackboard.spawning_allies = data
	end,
	teleport_to_center_drachenfels = function (unit, blackboard, t)
		local data = {
			stay_still = true,
			end_time = math.huge
		}

		setup_sorcerer_boss_drachenfels_spawning(unit, blackboard, data)

		blackboard.spawning_allies = data
		local level_analysis = Managers.state.conflict.level_analysis
		local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_center
		local center_unit = node_units[1]
		local teleport_pos = Unit.local_position(center_unit, 0)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil

			return
		end
	end
}
settings.bt_leave_hooks = {
	sorcerer_drachenfels_go_offensive = function (unit, blackboard, t)
		blackboard.mode = "offensive"
		blackboard.health_extension.is_invincible = false
		blackboard.ring_cooldown = blackboard.ring_total_cooldown

		LevelHelper:flow_event(blackboard.world, "destroy_shield")
	end,
	transition_at_two_thirds = function (unit, blackboard, t)
		blackboard.two_thirds_transition_done = true
	end,
	transition_at_one_third = function (unit, blackboard, t)
		blackboard.one_third_transition_done = true
	end,
	transition_at_one_fifth = function (unit, blackboard, t)
		blackboard.one_fifth_transition_done = true
	end,
	transition_at_three_fifths = function (unit, blackboard, t)
		blackboard.three_fifths_transition_done = true
	end,
	sorcerer_drachenfels_go_offensive_intense = function (unit, blackboard, t)
		blackboard.mode = "offensive"
		blackboard.health_extension.is_invincible = false
		blackboard.ring_cooldown = blackboard.ring_total_cooldown

		Unit.flow_event(unit, "lua_mover_blocker_on")

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_sorcerer_boss_fly_start", unit)

		if blackboard.one_third_transition_done then
			blackboard.third_phase_in_progress = true
		end

		LevelHelper:flow_event(blackboard.world, "destroy_shield")
	end,
	sorcerer_drachenfels_go_defensive = function (unit, blackboard, t)
		blackboard.mode = "defensive"
		blackboard.phase = "defensive_starts"
		blackboard.setup_done = true
	end,
	sorcerer_drachenfels_re_enter_defensive = function (unit, blackboard, t)
		blackboard.mode = "defensive"
		blackboard.phase = "defensive_starts"
		blackboard.transition_done = true
	end,
	on_drachenfels_sorcerer_intro_leave = function (unit, blackboard, t)
		if AiUtils.unit_alive(unit) and not blackboard.exit_last_action then
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			GameSession.set_game_object_field(game, go_id, "show_health_bar", true)
			Managers.state.event:trigger("boss_health_bar_set_prioritized_unit", unit, "lord")
			Managers.state.conflict:add_angry_boss(1, blackboard)

			blackboard.is_angry = true
			blackboard.intro_timer = nil
		end

		local side = Managers.state.side:get_side_from_name("heroes")
		local player_units = side.PLAYER_AND_BOT_UNITS

		for _, player_unit in pairs(player_units) do
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			health_extension.is_invincible = false
		end

		blackboard.stagger = nil
		blackboard.stagger_immune_time = t + 2
		blackboard.stagger_priority = nil
	end
}
settings.utility_considerations_file_names = {
	"scripts/settings/dlcs/penny/penny_utility_considerations"
}
settings.unit_extension_templates = {
	"scripts/settings/dlcs/penny/penny_unit_extension_templates"
}
settings.ai_breed_snippets_file_names = {
	"scripts/settings/dlcs/penny/penny_ai_breed_snippets"
}
settings.enemy_package_loader_breed_categories = {
	level_specific = {
		"chaos_exalted_sorcerer_drachenfels"
	}
}

return
