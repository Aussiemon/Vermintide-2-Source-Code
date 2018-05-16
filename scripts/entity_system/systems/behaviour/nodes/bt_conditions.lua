BTConditions = BTConditions or {}

require("scripts/entity_system/systems/behaviour/nodes/bot/bt_bot_conditions")

local unit_alive = Unit.alive
local ScriptUnit = ScriptUnit

BTConditions.always_true = function (blackboard)
	return true
end

BTConditions.always_false = function (blackboard)
	return false
end

BTConditions.spawn = function (blackboard)
	return blackboard.spawn
end

BTConditions.blocked = function (blackboard)
	return blackboard.blocked
end

BTConditions.ask_target_before_attacking = function (blackboard)
	return blackboard.attack_token
end

BTConditions.first_shots_fired = function (blackboard)
	return blackboard.first_shots_fired
end

BTConditions.stagger = function (blackboard)
	if blackboard.stagger then
		if blackboard.stagger_prohibited then
			blackboard.stagger = false
		else
			return true
		end
	end
end

BTConditions.grey_seer_stagger = function (blackboard)
	if blackboard.stagger then
		if blackboard.stagger_prohibited then
			blackboard.stagger = false
		else
			return not blackboard.about_to_mount
		end
	end
end

BTConditions.reset_attack = function (blackboard)
	return blackboard.reset_attack
end

BTConditions.lord_intro = function (blackboard)
	local t = Managers.time:time("game")

	return blackboard.intro_timer and t < blackboard.intro_timer
end

BTConditions.warlord_jump_down = function (blackboard)
	return blackboard.jump_from_pos
end

BTConditions.quick_teleport = function (blackboard)
	return blackboard.quick_teleport
end

BTConditions.fling_skaven = function (blackboard)
	return blackboard.fling_skaven
end

BTConditions.secondary_target = function (blackboard)
	return blackboard.secondary_target
end

BTConditions.quick_jump = function (blackboard)
	return blackboard.high_ground_opportunity
end

BTConditions.ninja_vanish = function (blackboard)
	return blackboard.ninja_vanish
end

BTConditions.target_changed = function (blackboard)
	return blackboard.target_changed
end

BTConditions.victim_grabbed = function (blackboard)
	return blackboard.has_grabbed_victim
end

BTConditions.target_changed_and_distant = function (blackboard)
	if blackboard.target_changed then
		if blackboard.previous_target_unit == nil then
			return true
		elseif blackboard.target_dist and blackboard.target_dist > 15 then
			local t = Managers.time:time("game")

			return blackboard.next_rage_time and blackboard.next_rage_time < t
		else
			blackboard.target_changed = nil
		end
	end

	return false
end

BTConditions.stormfiend_boss_rage = function (blackboard)
	return blackboard.intro_rage
end

BTConditions.ratogre_target_reachable = function (blackboard)
	return blackboard.jump_slam_data or not blackboard.target_outside_navmesh or (blackboard.target_dist and blackboard.target_dist <= blackboard.breed.reach_distance)
end

BTConditions.chaos_spawn_grabbed_combat = function (blackboard)
	return not AiUtils.unit_knocked_down(blackboard.victim_grabbed) and not blackboard.wants_to_throw
end

BTConditions.chaos_spawn_grabbed_throw = function (blackboard)
	local knocked_down = AiUtils.unit_knocked_down(blackboard.victim_grabbed)

	return knocked_down or blackboard.wants_to_throw
end

BTConditions.path_found = function (blackboard)
	return not blackboard.no_path_found
end

BTConditions.ratogre_jump_dist = function (blackboard)
	return not blackboard.target_outside_navmesh and blackboard.target_dist and blackboard.target_dist <= 15
end

BTConditions.ratogre_walking = function (blackboard)
	return blackboard.ratogre_walking
end

BTConditions.escorting_rat_ogre = function (blackboard)
	return blackboard.escorting_rat_ogre
end

BTConditions.in_vortex = function (blackboard)
	return blackboard.in_vortex
end

BTConditions.in_gravity_well = function (blackboard)
	return blackboard.gravity_well_position
end

BTConditions.at_smartobject = function (blackboard)
	local smartobject_is_next = blackboard.next_smart_object_data.next_smart_object_id ~= nil
	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local is_smart_objecting = blackboard.is_smart_objecting
	local moving_state = blackboard.move_state == "moving"

	return (smartobject_is_next and is_in_smartobject_range and moving_state) or is_smart_objecting
end

BTConditions.gutter_runner_at_smartobject = function (blackboard)
	if blackboard.jump_data then
		return false
	end

	return BTConditions.at_smartobject(blackboard)
end

BTConditions.ratogre_at_smartobject = function (blackboard)
	if blackboard.keep_target then
		return false
	end

	local smartobject_is_next = blackboard.next_smart_object_data.next_smart_object_id ~= nil
	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local is_smart_objecting = blackboard.is_smart_objecting
	local moving_state = blackboard.move_state == "moving"

	return (smartobject_is_next and is_in_smartobject_range and moving_state) or is_smart_objecting
end

BTConditions.stormfiend_boss_intro_jump_down = function (blackboard)
	local smartobject_is_next = blackboard.next_smart_object_data.next_smart_object_id ~= nil
	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local is_smart_objecting = blackboard.is_smart_objecting
	local is_in_intro = blackboard.jump_down_intro

	return ((smartobject_is_next and is_in_smartobject_range) or is_smart_objecting) and is_in_intro
end

BTConditions.at_teleport_smartobject = function (blackboard)
	local smart_object_type = blackboard.next_smart_object_data.smart_object_type
	local is_smart_object_teleporter = smart_object_type == "teleporters"
	local is_teleporting = blackboard.is_teleporting

	return is_smart_object_teleporter or is_teleporting
end

BTConditions.vortex_at_climb_or_jump = function (blackboard)
	local at_climb = BTConditions.at_climb_smartobject(blackboard)
	local at_jump = BTConditions.at_jump_smartobject(blackboard)

	return at_climb or at_jump or blackboard.is_flying
end

BTConditions.at_climb_smartobject = function (blackboard)
	local smart_object_type = blackboard.next_smart_object_data.smart_object_type
	local is_smart_object_ledge = smart_object_type == "ledges" or smart_object_type == "ledges_with_fence"
	local is_climbing = blackboard.is_climbing

	return is_smart_object_ledge or is_climbing
end

BTConditions.at_jump_smartobject = function (blackboard)
	local is_smart_object_jump = blackboard.next_smart_object_data.smart_object_type == "jumps"
	local is_jumping = blackboard.is_jumping

	return is_smart_object_jump or is_jumping
end

BTConditions.at_door_smartobject = function (blackboard)
	local smart_object_type = blackboard.next_smart_object_data.smart_object_type
	local is_smart_object_door = smart_object_type == "doors" or smart_object_type == "planks" or smart_object_type == "big_boy_destructible"
	local is_smashing_door = blackboard.is_smashing_door
	local is_scurrying_under_door = blackboard.is_scurrying_under_door
	local door_is_open = blackboard.next_smart_object_data.disabled

	if door_is_open then
		return false
	end

	return is_smart_object_door or is_smashing_door or is_scurrying_under_door
end

BTConditions.at_smart_object_and_door = function (blackboard)
	return BTConditions.at_smartobject(blackboard) and BTConditions.at_door_smartobject(blackboard)
end

BTConditions.has_destructible_as_target = function (blackboard)
	local target = blackboard.target_unit
	local is_destructible_static = not ScriptUnit.has_extension(target, "locomotion_system")

	return unit_alive(target) and blackboard.confirmed_player_sighting and is_destructible_static
end

BTConditions.can_see_player = function (blackboard)
	return unit_alive(blackboard.target_unit)
end

BTConditions.can_see_player_and_mounted = function (blackboard)
	return unit_alive(blackboard.target_unit) and not blackboard.knocked_off_mount
end

BTConditions.no_target = function (blackboard)
	return not unit_alive(blackboard.target_unit)
end

BTConditions.tentacle_found_target = function (blackboard)
	return unit_alive(blackboard.target_unit) and not blackboard.tentacle_satisfied
end

BTConditions.ready_to_summon = function (blackboard)
	return blackboard.ready_to_summon and (blackboard.summoning or Unit.alive(blackboard.target_unit))
end

BTConditions.ready_to_summon_vortex = function (blackboard)
	return blackboard.current_spell_name == "vortex"
end

BTConditions.ready_to_summon_plague_wave = function (blackboard)
	return blackboard.current_spell_name == "plague_wave"
end

BTConditions.ready_to_summon_tentacle = function (blackboard)
	return blackboard.current_spell_name == "tentacle"
end

BTConditions.ready_to_cast_missile = function (blackboard)
	return blackboard.current_spell_name == "magic_missile"
end

BTConditions.ready_to_cast_seeking_bomb_missile = function (blackboard)
	return blackboard.current_spell_name == "seeking_bomb_missile"
end

BTConditions.sorcerer_in_defensive_mode = function (blackboard)
	return blackboard.mode == "defensive" and not blackboard.is_summoning
end

BTConditions.sorcerer_in_setup_mode = function (blackboard)
	return blackboard.mode == "setup" and not blackboard.setup_done
end

BTConditions.escape_teleport = function (blackboard)
	return blackboard.escape_teleport
end

BTConditions.defensive_mode_starts = function (blackboard)
	return blackboard.phase == "defensive_starts"
end

BTConditions.sorcerer_defensive_combat = function (blackboard)
	return blackboard.phase == "defensive_combat"
end

BTConditions.defensive_mode_ends = function (blackboard)
	return blackboard.phase == "defensive_ends"
end

BTConditions.ready_to_explode = function (blackboard)
	return blackboard.ready_to_summon
end

BTConditions.player_spotted = function (blackboard)
	return unit_alive(blackboard.target_unit) and not blackboard.confirmed_player_sighting
end

BTConditions.in_melee_range = function (blackboard)
	return unit_alive(blackboard.target_unit) and blackboard.in_melee_range
end

BTConditions.approach_target = function (blackboard)
	return blackboard.approach_target
end

BTConditions.comitted_to_target = function (blackboard)
	return blackboard.target_unit or blackboard.comitted_to_target
end

BTConditions.in_sprint_dist = function (blackboard)
	return blackboard.closing or blackboard.target_dist > 7
end

BTConditions.in_run_dist = function (blackboard)
	return blackboard.target_dist <= 7
end

BTConditions.troll_downed = function (blackboard)
	return blackboard.can_get_downed and blackboard.downed_state
end

BTConditions.needs_to_crouch = function (blackboard)
	return blackboard.needs_to_crouch and BTConditions.ratogre_target_reachable(blackboard)
end

BTConditions.reset_utility = function (blackboard)
	return not blackboard.reset_utility
end

BTConditions.is_alerted = function (blackboard)
	local alerted = unit_alive(blackboard.target_unit) and blackboard.is_alerted and (not blackboard.confirmed_player_sighting or blackboard.hesitating)
	local is_taunted = unit_alive(blackboard.taunt_unit)
	local taunt_hesitate = is_taunted and not blackboard.taunt_hesitate_finished and not blackboard.no_taunt_hesitate

	return alerted or taunt_hesitate
end

BTConditions.confirmed_player_sighting = function (blackboard)
	return unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting
end

BTConditions.player_controller_is_alive = function (blackboard)
	return blackboard.player_controller and unit_alive(blackboard.player_controller) and not blackboard.target_is_in_combat
end

BTConditions.player_controller_is_in_combat = function (blackboard)
	return blackboard.player_controller and blackboard.target_is_in_combat
end

BTConditions.suiciding_whilst_staggering = function (blackboard)
	return blackboard.stagger and blackboard.suicide_run ~= nil and blackboard.suicide_run.explosion_started
end

BTConditions.has_goal_destination = function (blackboard)
	return blackboard.goal_destination ~= nil
end

BTConditions.should_mount_unit = function (blackboard)
	return blackboard.should_mount_unit ~= nil
end

BTConditions.is_falling = function (blackboard)
	return blackboard.is_falling or blackboard.fall_state ~= nil
end

BTConditions.is_gutter_runner_falling = function (blackboard)
	return not blackboard.high_ground_opportunity and not blackboard.pouncing_target and (blackboard.is_falling or blackboard.fall_state ~= nil)
end

BTConditions.pack_master_needs_hook = function (blackboard)
	return blackboard.needs_hook
end

BTConditions.look_for_players = function (blackboard)
	return blackboard.look_for_players
end

BTConditions.suicide_run = function (blackboard)
	return blackboard.current_health_percent < 0.7
end

BTConditions.should_use_interest_point = function (blackboard)
	return not blackboard.ignore_interest_points and not blackboard.confirmed_player_sighting
end

BTConditions.give_command = function (blackboard)
	return blackboard.give_command and unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting
end

BTConditions.is_fleeing = function (blackboard)
	return unit_alive(blackboard.target_unit) or blackboard.is_fleeing
end

BTConditions.loot_rat_stagger = function (blackboard)
	return BTConditions.stagger(blackboard) and not blackboard.dodge_damage_success
end

BTConditions.loot_rat_dodge = function (blackboard)
	return blackboard.dodge_vector or blackboard.is_dodging
end

BTConditions.loot_rat_flee = function (blackboard)
	return BTConditions.confirmed_player_sighting(blackboard) or blackboard.is_fleeing
end

BTConditions.can_trigger_move_to = function (blackboard)
	local t = Managers.time:time("game")
	local trigger_time = blackboard.trigger_time or 0

	return t > trigger_time and unit_alive(blackboard.target_unit)
end

BTConditions.globadier_skulked_for_too_long = function (blackboard)
	local adv_data = blackboard.advance_towards_players
	local skulk_timeout = 15

	if adv_data then
		local t = Managers.time:time("game")
		local throw_globe_data = blackboard.throw_globe_data

		if throw_globe_data and throw_globe_data.next_throw_at then
			return t > throw_globe_data.next_throw_at + skulk_timeout
		else
			return adv_data.timer > adv_data.time_until_first_throw + skulk_timeout
		end
	end

	return false
end

BTConditions.ratling_gunner_skulked_for_too_long = function (blackboard)
	if unit_alive(blackboard.target_unit) then
		local skulk_timeout = 15
		local pattern_data = blackboard.attack_pattern_data
		local last_fired = pattern_data and pattern_data.last_fired
		local t = Managers.time:time("game")
		local lurk_start = blackboard.lurk_start

		if last_fired then
			return t > last_fired + skulk_timeout
		elseif lurk_start then
			return t > lurk_start + skulk_timeout
		end
	end

	return false
end

BTConditions.should_defensive_idle = function (blackboard)
	local t = Managers.time:time("game")
	local time_since_surrounding_players = t - blackboard.surrounding_players_last

	return blackboard.defensive_mode_duration and time_since_surrounding_players >= 3
end

BTConditions.should_be_defensive = function (blackboard)
	return blackboard.defensive_mode_duration
end

BTConditions.boss_phase_two = function (blackboard)
	return blackboard.current_phase == 2
end

BTConditions.warlord_dual_wielding = function (blackboard)
	return blackboard.dual_wield_mode
end

BTConditions.warlord_halberding = function (blackboard)
	return not blackboard.dual_wield_mode
end

BTConditions.switching_weapons = function (blackboard)
	return blackboard.switching_weapons and not blackboard.defensive_mode_duration
end

BTConditions.knocked_off_mount = function (blackboard)
	return (blackboard.knocked_off_mount or not AiUtils.unit_alive(blackboard.mounted_data.mount_unit)) and AiUtils.unit_alive(blackboard.target_unit)
end

BTConditions.ready_to_cast_spell = function (blackboard)
	return blackboard.ready_to_summon and not blackboard.about_to_mount and AiUtils.unit_alive(blackboard.target_unit)
end

BTConditions.grey_seer_teleport_spell = function (blackboard)
	return blackboard.current_spell_name == "teleport" and blackboard.quick_teleport
end

BTConditions.grey_seer_vermintide_spell = function (blackboard)
	return blackboard.current_spell_name == "vermintide"
end

BTConditions.grey_seer_warp_lightning_spell = function (blackboard)
	return blackboard.current_spell_name == "warp_lightning"
end

BTConditions.grey_seer_waiting_death = function (blackboard)
	return blackboard.current_phase == 6
end

BTConditions.grey_seer_death = function (blackboard)
	return blackboard.current_phase == 5
end

BTConditions.grey_seer_call_stormfiend = function (blackboard)
	return blackboard.call_stormfiend
end

return
