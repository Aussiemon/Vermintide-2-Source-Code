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

BTConditions.ask_target_before_attacking = function (blackboard, condition_args, action)
	if blackboard.attack_token then
		return blackboard.attack_token
	end

	local want_an_attack = true
	local target_unit = blackboard.target_unit
	local target_unit_attack_intensity_extension = ScriptUnit.has_extension(target_unit, "attack_intensity_system")

	if target_unit_attack_intensity_extension then
		local attack_type = action.attack_intensity_type or "normal"
		want_an_attack = target_unit_attack_intensity_extension:want_an_attack(attack_type)
	end

	return want_an_attack
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

BTConditions.nurgling_spawned_by_altar = function (blackboard)
	return blackboard.nurgling_spawned_by_altar
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
	return blackboard.jump_slam_data or not blackboard.target_outside_navmesh or blackboard.target_dist and blackboard.target_dist <= blackboard.breed.reach_distance
end

BTConditions.chaos_spawn_grabbed_combat = function (blackboard)
	return AiUtils.unit_alive(blackboard.victim_grabbed) and not AiUtils.unit_knocked_down(blackboard.victim_grabbed) and not blackboard.wants_to_throw
end

BTConditions.chaos_spawn_grabbed_throw = function (blackboard)
	local knocked_down = AiUtils.unit_knocked_down(blackboard.victim_grabbed)

	return AiUtils.unit_alive(blackboard.victim_grabbed) and (knocked_down or blackboard.wants_to_throw)
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
	local next_smart_object_data = blackboard.next_smart_object_data
	local smartobject_is_next = next_smart_object_data.next_smart_object_id ~= nil

	if not smartobject_is_next then
		return false
	end

	local is_smart_objecting = blackboard.is_smart_objecting
	local nav_graph_system = Managers.state.entity:system("nav_graph_system")
	local smart_object_unit = next_smart_object_data.smart_object_data and next_smart_object_data.smart_object_data.unit
	local has_nav_graph_extension, nav_graph_enabled = nav_graph_system:has_nav_graph(smart_object_unit)

	if has_nav_graph_extension and not nav_graph_enabled and not is_smart_objecting then
		return false
	end

	local is_in_smartobject_range = blackboard.is_in_smartobject_range
	local moving_state = blackboard.move_state == "moving"

	return is_in_smartobject_range and moving_state or is_smart_objecting
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

	return BTConditions.at_smartobject(blackboard)
end

BTConditions.stormfiend_boss_intro_jump_down = function (blackboard)
	local is_in_intro = blackboard.jump_down_intro

	return BTConditions.at_smartobject(blackboard) and is_in_intro
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
	local is_smart_object_door = smart_object_type == "doors" or smart_object_type == "planks" or smart_object_type == "big_boy_destructible" or smart_object_type == "destructible_wall"
	local is_smashing_door = blackboard.is_smashing_door
	local is_scurrying_under_door = blackboard.is_scurrying_under_door

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

BTConditions.no_target = function (blackboard)
	return not unit_alive(blackboard.target_unit)
end

BTConditions.tentacle_found_target = function (blackboard)
	return unit_alive(blackboard.target_unit) and not blackboard.tentacle_satisfied
end

BTConditions.at_half_health = function (blackboard)
	return blackboard.current_health_percent <= 0.5
end

BTConditions.at_one_third_health = function (blackboard)
	return blackboard.current_health_percent <= 0.33
end

BTConditions.at_two_thirds_health = function (blackboard)
	return blackboard.current_health_percent <= 0.66
end

BTConditions.at_one_fifth_health = function (blackboard)
	return blackboard.current_health_percent <= 0.2
end

BTConditions.at_three_fifths_health = function (blackboard)
	return blackboard.current_health_percent <= 0.6
end

BTConditions.less_than_one_health = function (blackboard)
	return blackboard.current_health <= 1
end

BTConditions.can_transition_half_health = function (blackboard)
	return blackboard.current_health_percent <= 0.5 and not blackboard.half_transition_done
end

BTConditions.can_transition_one_third_health = function (blackboard)
	return blackboard.current_health_percent <= 0.33 and not blackboard.one_third_transition_done
end

BTConditions.dummy_not_escaped = function (blackboard)
	return not blackboard.anim_cb_escape_finished
end

BTConditions.can_transition_two_thirds_health = function (blackboard)
	return blackboard.current_health_percent <= 0.66 and not blackboard.two_thirds_transition_done
end

BTConditions.can_transition_one_fifth_health = function (blackboard)
	return blackboard.current_health_percent <= 0.2 and not blackboard.one_fifth_transition_done
end

BTConditions.can_transition_three_fifths_health = function (blackboard)
	return blackboard.current_health_percent <= 0.6 and not blackboard.three_fifths_transition_done
end

BTConditions.transitioned_half_health = function (blackboard)
	return blackboard.current_health_percent <= 0.5 and blackboard.half_transition_done
end

BTConditions.transitioned_three_fifths_health = function (blackboard)
	return blackboard.current_health_percent <= 0.6 and blackboard.three_fifths_transition_done
end

BTConditions.transitioned_one_fifth_health = function (blackboard)
	return blackboard.current_health_percent <= 0.2 and blackboard.one_fifth_transition_done
end

BTConditions.transitioned_one_third_health = function (blackboard)
	return blackboard.current_health_percent <= 0.33 and blackboard.one_third_transition_done
end

BTConditions.transitioned_two_thirds_health = function (blackboard)
	return blackboard.current_health_percent <= 0.66 and blackboard.two_thirds_transition_done
end

BTConditions.sorcerer_allow_tricke_spawn = function (blackboard)
	return blackboard.sorcerer_allow_tricke_spawn
end

BTConditions.spawned_allies_dead_or_time = function (blackboard)
	return blackboard.spawn_allies_horde and blackboard.spawn_allies_horde.is_dead or blackboard.defensive_phase_duration == 0
end

BTConditions.first_ring_summon = function (blackboard)
	return blackboard.ring_summonings_finished == 0
end

BTConditions.ready_to_summon_rings = function (blackboard)
	return blackboard.ring_cooldown == 0
end

BTConditions.ready_to_charge = function (blackboard)
	return blackboard.charge_cooldown == 0
end

BTConditions.ready_to_teleport = function (blackboard)
	return blackboard.teleport_cooldown == 0
end

BTConditions.ready_to_summon_wave = function (blackboard)
	return blackboard.wave_cooldown == 0
end

BTConditions.not_ready_to_summon_wave = function (blackboard)
	return not blackboard.ready_to_summon or not blackboard.summoning and not Unit.alive(blackboard.target_unit) or blackboard.wave_cooldown ~= 0
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
	local t = Managers.time:time("game")
	local pounce_timer_is_finished = blackboard.initial_pounce_timer < t

	return (blackboard.target_unit or blackboard.comitted_to_target) and pounce_timer_is_finished
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

BTConditions.defend = function (blackboard)
	return blackboard.defend
end

BTConditions.defend_get_in_position = function (blackboard)
	return blackboard.defend_get_in_position
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
	return blackboard.defensive_mode_duration and unit_alive(blackboard.target_unit)
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

BTConditions.warcamp_retaliation_aoe = function (blackboard)
	return Unit.alive(blackboard.target_unit) and blackboard.num_chain_stagger and blackboard.num_chain_stagger > 2
end

BTConditions.is_mounted = function (blackboard)
	local mount_unit = blackboard.mounted_data.mount_unit

	return not blackboard.knocked_off_mount and AiUtils.unit_alive(mount_unit)
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

BTConditions.grey_seer_waiting_for_pickup = function (blackboard)
	return blackboard.waiting_for_pickup
end

BTConditions.should_use_emote = function (blackboard)
	return blackboard.should_use_emote
end

BTConditions.should_wait_idle = function (blackboard)
	if blackboard.idle_time then
		local t = Managers.time:time("game")
		local time_spent_in_idle = t - blackboard.idle_time

		return time_spent_in_idle >= 3
	else
		return false
	end
end

BTConditions.beastmen_standard_bearer_place_standard = function (blackboard)
	return unit_alive(blackboard.target_unit) and not blackboard.has_placed_standard
end

BTConditions.beastmen_standard_bearer_pickup_standard = function (blackboard)
	if blackboard.ignore_standard_pickup then
		return false
	end

	local target_distance_to_standard = blackboard.target_distance_to_standard

	if blackboard.moving_to_pick_up_standard then
		return true
	else
		return blackboard.has_placed_standard and unit_alive(blackboard.target_unit) and AiUtils.unit_alive(blackboard.standard_unit) and target_distance_to_standard and blackboard.breed.pickup_standard_distance < target_distance_to_standard
	end
end

BTConditions.beastmen_standard_bearer_move_and_place_standard = function (blackboard)
	local has_move_and_place_standard_position = blackboard.move_and_place_standard

	return has_move_and_place_standard_position
end

BTConditions.ungor_archer_enter_melee_combat = function (blackboard)
	return blackboard.confirmed_player_sighting and unit_alive(blackboard.target_unit) and (blackboard.has_switched_weapons or blackboard.target_dist and blackboard.target_dist < 5)
end

BTConditions.bestigor_at_smartobject = function (blackboard)
	local in_charge_action = blackboard.charge_state ~= nil
	local at_smartobject = not in_charge_action and BTConditions.at_smartobject(blackboard)

	return at_smartobject
end

BTConditions.confirmed_player_sighting_standard_bearer = function (blackboard)
	return unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting and blackboard.has_placed_standard
end

BTConditions.standard_bearer_should_be_defensive = function (blackboard)
	local pickup_standard_distance = blackboard.breed.pickup_standard_distance
	local defensive_threshold_distance = blackboard.breed.defensive_threshold_distance
	local in_combat = unit_alive(blackboard.target_unit) and blackboard.confirmed_player_sighting and blackboard.has_placed_standard
	local target_distance_to_standard = blackboard.target_distance_to_standard
	local target_is_within_range = target_distance_to_standard and defensive_threshold_distance <= target_distance_to_standard and target_distance_to_standard <= pickup_standard_distance
	local not_attacking = blackboard.move_state ~= "attacking"

	return in_combat and target_is_within_range and not_attacking
end

BTConditions.switch_to_melee_weapon = function (blackboard)
	return BTConditions.ungor_archer_enter_melee_combat(blackboard) and not blackboard.has_switched_weapons
end

BTConditions.confirmed_player_sighting_and_has_switched_weapons = function (blackboard)
	return blackboard.confirmed_player_sighting and blackboard.has_switched_weapons
end

BTConditions.player_controller_is_alive = function (blackboard)
	return blackboard.player_controller_unit and unit_alive(blackboard.player_controller_unit) and not blackboard.target_is_in_combat
end

BTConditions.player_controller_is_in_combat = function (blackboard)
	return blackboard.player_controller_unit and blackboard.target_is_in_combat
end

BTConditions.is_in_inn = function (blackboard)
	return blackboard.inn_idle_spots and global_is_inside_inn
end

BTConditions.has_no_idle_spot = function (blackboard)
	return not blackboard.has_idle_spot
end

BTConditions.is_transported = function (blackboard)
	return blackboard.is_transported
end
