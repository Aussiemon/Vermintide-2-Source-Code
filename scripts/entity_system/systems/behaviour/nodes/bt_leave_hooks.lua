BTLeaveHooks = BTLeaveHooks or {}
local BTLeaveHooks = BTLeaveHooks
local unit_alive = Unit.alive
local ScriptUnit = ScriptUnit

BTLeaveHooks.reset_fling_skaven = function (unit, blackboard, t)
	blackboard.fling_skaven = false
end

BTLeaveHooks.check_if_victim_was_grabbed = function (unit, blackboard, t)
	if blackboard.victim_grabbed then
		blackboard.has_grabbed_victim = true

		PerceptionUtils.clear_target_unit(blackboard)

		local status_extension = ScriptUnit.has_extension(blackboard.victim_grabbed, "status_system")
		local is_grabbed = status_extension and status_extension:is_grabbed_by_chaos_spawn()

		if blackboard.stagger or (is_grabbed and not AiUtils.unit_alive(unit)) then
			StatusUtils.set_grabbed_by_chaos_spawn_network(blackboard.victim_grabbed, false, unit)

			blackboard.has_grabbed_victim = nil
			blackboard.victim_grabbed = nil
		end
	end
end

BTLeaveHooks.wave_summoning_ends = function (unit, blackboard, t)
	blackboard.is_summoning = false
	blackboard.wave_cooldown = blackboard.wave_total_cooldown
end

BTLeaveHooks.summoning_ends = function (unit, blackboard, t)
	blackboard.is_summoning = false
end

BTLeaveHooks.sorcerer_next_phase = function (unit, blackboard, t)
	local phase = blackboard.phase

	if phase == "defensive_starts" then
		blackboard.phase = "defensive_combat"
	elseif phase == "defensive_combat" then
		blackboard.phase = "defensive_ends"
	else
		blackboard.phase = "defensive_completed"
	end
end

BTLeaveHooks.sorcerer_drachenfels_go_offensive = function (unit, blackboard, t)
	blackboard.mode = "offensive"
end

BTLeaveHooks.sorcerer_drachenfels_go_defensive = function (unit, blackboard, t)
	blackboard.mode = "defensive"
	blackboard.phase = "defensive_starts"
	blackboard.setup_done = true
end

BTLeaveHooks.sorcerer_drachenfels_re_enter_defensive = function (unit, blackboard, t)
	blackboard.mode = "defensive"
	blackboard.phase = "defensive_starts"
	blackboard.transition_done = true
end

BTLeaveHooks.sorcerer_setup_done = function (unit, blackboard, t)
	blackboard.mode = "offensive"
	blackboard.setup_done = true
	blackboard.phase_timer = t + 20
end

BTLeaveHooks.sorcerer_evade = function (unit, blackboard, t)
	blackboard.escape_teleport = false
end

BTLeaveHooks.reset_stormfiend_charge = function (unit, blackboard, t)
	blackboard.weakspot_hits = nil
	blackboard.weakspot_rage = nil
end

BTLeaveHooks.stormfiend_boss_mount_leave = function (unit, blackboard, t)
	return
end

BTLeaveHooks.stormfiend_boss_rage_leave = function (unit, blackboard, t)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)
	blackboard.intro_rage = nil
	local health_extension = ScriptUnit.extension(unit, "health_system")
	health_extension.is_invincible = false

	GameSession.set_game_object_field(game, go_id, "show_health_bar", true)
	Managers.state.event:trigger("show_boss_health_bar", unit)

	local conflict_director = Managers.state.conflict
	local level_analysis = conflict_director.level_analysis
	local node_units = level_analysis.generic_ai_node_units.grey_seer_intro_jump_down_to

	if node_units then
		local node_unit = node_units[1]
		local pos = Unit.local_position(node_unit, 0)
		local projected_wanted_pos = LocomotionUtils.pos_on_mesh(blackboard.nav_world, pos, 1, 1)
		blackboard.goal_destination = Vector3Box(projected_wanted_pos)
		blackboard.jump_down_intro = true
	end
end

BTLeaveHooks.stormfiend_boss_jump_down_leave = function (unit, blackboard, t)
	blackboard.jump_down_intro = nil
	blackboard.goal_destination = nil
end

local function cb_grey_seer_intro_spawn_stormfiend(unit, breed, optional_data)
	local mounted_data = optional_data.mounted_data
	local goal_destination = optional_data.goal_destination
	local blackboard = optional_data.blackboard
	local t = Managers.time:time("game")
	mounted_data.mount_unit = unit
	mounted_data.knocked_off_mounted_timer = t
	local mount_blackboard = BLACKBOARDS[unit]
	mount_blackboard.goal_destination = goal_destination
	mount_blackboard.anim_cb_move = true
	mount_blackboard.intro_rage = true
	blackboard.intro_timer = nil
end

BTLeaveHooks.on_grey_seer_intro_leave = function (unit, blackboard, t)
	if not blackboard.exit_last_action then
		local conflict_director = Managers.state.conflict
		local level_analysis = conflict_director.level_analysis
		local node_units = level_analysis.generic_ai_node_units.grey_seer_intro_stormfiend_spawn

		if node_units then
			local node_unit = node_units[1]
			local pos = Unit.local_position(node_unit, 0)
			local stormfiend_boss_breed = Breeds.skaven_stormfiend_boss
			local spawn_category = "misc"
			blackboard.knocked_off_mount = true
			blackboard.waiting_for_pickup = true
			local optional_data = {
				spawned_func = cb_grey_seer_intro_spawn_stormfiend,
				mounted_data = blackboard.mounted_data,
				goal_destination = Vector3Box(POSITION_LOOKUP[unit]),
				blackboard = blackboard
			}

			conflict_director:spawn_queued_unit(stormfiend_boss_breed, Vector3Box(pos), QuaternionBox(Unit.local_rotation(unit, 0)), spawn_category, nil, nil, optional_data)

			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("egs_call_mount_intro", event_data)
		else
			print("Found no generic AI node (grey_seer_intro_stormfiend_spawn) for grey_seer_intro_leave")
		end

		conflict_director:add_angry_boss(1, blackboard)

		blackboard.is_angry = true
	end
end

BTLeaveHooks.on_grey_seer_death_sequence_leave = function (unit, blackboard, t)
	blackboard.current_phase = 6
	local health_extension = ScriptUnit.extension(blackboard.unit, "health_system")
	health_extension.is_invincible = false

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
end

BTLeaveHooks.leave_attack_grabbed_smash = function (unit, blackboard, t)
	local victim_is_alive = Unit.alive(blackboard.victim_grabbed)

	if (blackboard.stagger and victim_is_alive) or (victim_is_alive and not AiUtils.unit_alive(unit)) then
		StatusUtils.set_grabbed_by_chaos_spawn_network(blackboard.victim_grabbed, false, unit)

		blackboard.has_grabbed_victim = nil
		blackboard.victim_grabbed = nil
	else
		blackboard.wants_to_throw = true
	end
end

BTLeaveHooks.on_lord_intro_leave = function (unit, blackboard, t)
	if AiUtils.unit_alive(unit) and not blackboard.exit_last_action then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = false
		local game = Managers.state.network:game()
		local go_id = Managers.state.unit_storage:go_id(unit)

		GameSession.set_game_object_field(game, go_id, "show_health_bar", true)
		Managers.state.event:trigger("show_boss_health_bar", unit)
		Managers.state.conflict:add_angry_boss(1, blackboard)

		blackboard.is_angry = true
		blackboard.intro_timer = nil
	end

	blackboard.stagger = nil
	blackboard.stagger_immune_time = t + 2
end

BTLeaveHooks.on_lord_warlord_intro_leave = function (unit, blackboard, t)
	if AiUtils.unit_alive(unit) and not blackboard.exit_last_action then
		local health_extension = ScriptUnit.extension(unit, "health_system")
		health_extension.is_invincible = false
		local game = Managers.state.network:game()
		local go_id = Managers.state.unit_storage:go_id(unit)

		GameSession.set_game_object_field(game, go_id, "show_health_bar", true)
		Managers.state.event:trigger("show_boss_health_bar", unit)
		Managers.state.conflict:add_angry_boss(1, blackboard)

		blackboard.is_angry = true
		blackboard.jump_down_timer = t + 5
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "to_dual_wield")

		local level_analysis = Managers.state.conflict.level_analysis
		local node_units = level_analysis.generic_ai_node_units.skaven_warlord_intro_jump_to

		if node_units then
			local center_unit = node_units[1]
			local exit_pos = Unit.local_position(center_unit, 0)
			blackboard.jump_from_pos = Vector3Box(POSITION_LOOKUP[unit])
			blackboard.exit_pos = Vector3Box(exit_pos)
		end
	end
end

BTLeaveHooks.reset_keep_target = function (unit, blackboard, t)
	blackboard.keep_target = nil
end

BTLeaveHooks.reset_chain_stagger = function (unit, blackboard, t)
	blackboard.num_chain_stagger = nil
end

BTLeaveHooks.remove_invincibility = function (unit, blackboard, t)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	health_extension.is_invincible = false
end

BTLeaveHooks.mutator_sorcerer_activate_teleport = function (unit, blackboard, t)
	if blackboard.stagger then
		blackboard.quick_teleport = true
	end
end

BTLeaveHooks.destroy_unit_leave_hook = function (unit, blackboard, t)
	Managers.state.conflict:destroy_unit(unit, blackboard, "debug")
end

BTLeaveHooks.beastmen_standard_bearer_leave_move_and_plant_standard = function (unit, blackboard, t)
	blackboard.move_and_place_standard = nil
	blackboard.stagger = nil
	local health_extension = ScriptUnit.extension(unit, "health_system")
	health_extension.is_invincible = false
end

return
