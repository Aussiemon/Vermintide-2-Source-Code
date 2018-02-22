BTConditions = BTConditions or {}
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

	return 
end
BTConditions.grey_seer_stagger = function (blackboard)
	if blackboard.stagger then
		if blackboard.stagger_prohibited then
			blackboard.stagger = false
		else
			return not blackboard.about_to_mount
		end
	end

	return 
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
		elseif 15 < blackboard.target_dist then
			local t = Managers.time:time("game")

			return blackboard.next_rage_time < t
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
BTConditions.can_see_ally = function (blackboard)
	return unit_alive(blackboard.target_ally_unit) and blackboard.ally_distance < 40
end
BTConditions.is_disabled = function (blackboard)
	return blackboard.is_knocked_down or blackboard.is_grabbed_by_pack_master or blackboard.is_pounced_down or blackboard.is_hanging_from_hook or blackboard.is_ledge_hanging or blackboard.is_grabbed_by_chaos_spawn
end
BTConditions.can_teleport = function (blackboard)
	local follow_unit = blackboard.ai_bot_group_extension.data.follow_unit

	if not follow_unit then
		return false
	end

	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check

	if not disable_bot_main_path_teleport_check then
		local self_unit = blackboard.unit
		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director.get_player_unit_segment(conflict_director, self_unit) or 1
		local target_segment = conflict_director.get_player_unit_segment(conflict_director, follow_unit)

		if not target_segment or target_segment < self_segment then
			return false
		end
	end

	return true
end
BTConditions.cant_reach_ally = function (blackboard)
	local follow_unit = blackboard.ai_bot_group_extension.data.follow_unit

	if not follow_unit then
		return false
	end

	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check
	local is_forwards = nil

	if not disable_bot_main_path_teleport_check then
		local self_unit = blackboard.unit
		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director.get_player_unit_segment(conflict_director, self_unit)
		local target_segment = conflict_director.get_player_unit_segment(conflict_director, follow_unit)

		if not self_segment or not target_segment then
			return false
		end

		local is_backwards = target_segment < self_segment

		if is_backwards then
			return false
		end

		is_forwards = self_segment < target_segment
	end

	local t = Managers.time:time("game")
	local navigation_extension = blackboard.navigation_extension
	local fails, last_success = navigation_extension.successive_failed_paths(navigation_extension)

	return blackboard.moving_toward_follow_position and (((disable_bot_main_path_teleport_check or is_forwards) and 1) or 5) < fails and 5 < t - last_success and not blackboard.has_teleported
end
BTConditions.bot_at_breakable = function (blackboard)
	local navigation_extension = blackboard.navigation_extension

	return navigation_extension.is_in_transition(navigation_extension) and navigation_extension.transition_type(navigation_extension) == "planks"
end
BTConditions.bot_in_melee_range = function (blackboard)
	local target_unit = blackboard.target_unit

	if not unit_alive(target_unit) then
		return false
	end

	local self_unit = blackboard.unit
	local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot
	local melee_range = nil
	local breed = Unit.get_data(target_unit, "breed")

	if blackboard.urgent_target_enemy == target_unit or blackboard.opportunity_target_enemy == target_unit or Vector3.is_valid(blackboard.taking_cover.cover_position:unbox()) then
		melee_range = (breed and breed.bot_opportunity_target_melee_range) or 3

		if wielded_slot == "slot_ranged" then
			melee_range = (breed and breed.bot_opportunity_target_melee_range_while_ranged) or 2
		end
	else
		melee_range = 12

		if wielded_slot == "slot_ranged" then
			melee_range = 10
		end
	end

	local target_aim_position = nil
	local override_aim_node_name = breed and breed.bot_melee_aim_node

	if override_aim_node_name then
		local override_aim_node = Unit.node(target_unit, override_aim_node_name)
		target_aim_position = Unit.world_position(target_unit, override_aim_node)
	else
		target_aim_position = POSITION_LOOKUP[target_unit]
	end

	local offset = target_aim_position - POSITION_LOOKUP[self_unit]
	local dist = Vector3.length(offset)
	local in_range = dist < melee_range
	local z_offset = offset.z

	return in_range and -1.5 < z_offset and z_offset < 2
end
BTConditions.has_priority_or_opportunity_target = function (blackboard)
	local target = blackboard.target_unit

	if not Unit.alive(target) then
		return false
	end

	local dist = 25
	local result = (target == blackboard.priority_target_enemy and blackboard.priority_target_distance < dist) or (target == blackboard.urgent_target_enemy and blackboard.urgent_target_distance < dist)

	return result
end
BTConditions.has_target_and_ammo_greater_than = function (blackboard, args)
	local target_unit = blackboard.target_unit

	if not unit_alive(target_unit) or Unit.get_data(target_unit, "breed") == nil then
		return false
	end

	local inventory_extension = blackboard.inventory_extension
	local current, max = inventory_extension.current_ammo_status(inventory_extension, "slot_ranged")
	local ammo_ok = not current or args.ammo_percentage < current/max
	local overcharge_extension = blackboard.overcharge_extension
	local overcharge_limit_type = args.overcharge_limit_type
	local current_oc, threshold_oc, max_oc = overcharge_extension.current_overcharge_status(overcharge_extension)
	local overcharge_ok = current_oc == 0 or (overcharge_limit_type == "threshold" and current_oc/threshold_oc < args.overcharge_limit) or (overcharge_limit_type == "maximum" and current_oc/max_oc < args.overcharge_limit)
	local obstruction = blackboard.ranged_obstruction_by_static
	local t = Managers.time:time("game")
	local obstructed = obstruction and obstruction.unit == blackboard.target_unit and obstruction.timer + 3 < t

	return ammo_ok and overcharge_ok and not obstructed
end
BTConditions.can_loot = function (blackboard)
	local play_go_system = Managers.state.entity:system("play_go_tutorial_system")

	if play_go_system and not play_go_system.bot_loot_enabled(play_go_system) then
		return false
	end

	local max_dist = 3.2

	return (blackboard.health_pickup and blackboard.allowed_to_take_health_pickup and blackboard.health_dist < max_dist and blackboard.health_pickup == blackboard.interaction_unit) or (blackboard.ammo_pickup and blackboard.needs_ammo and blackboard.ammo_dist < max_dist and blackboard.ammo_pickup == blackboard.interaction_unit) or (blackboard.mule_pickup and blackboard.mule_pickup == blackboard.interaction_unit and blackboard.mule_pickup_dist_squared < max_dist*max_dist)
end
BTConditions.bot_should_heal = function (blackboard)
	local self_unit = blackboard.unit
	local inventory_ext = blackboard.inventory_extension
	local health_slot_data = inventory_ext.get_slot_data(inventory_ext, "slot_healthkit")
	local template = health_slot_data and inventory_ext.get_item_template(inventory_ext, health_slot_data)
	local can_heal_self = template and template.can_heal_self

	if not can_heal_self then
		return false
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()
	local hurt = current_health_percent <= template.bot_heal_threshold
	local target_unit = blackboard.target_unit
	local is_safe = not target_unit or ((template.fast_heal or blackboard.is_healing_self) and #blackboard.proximite_enemies == 0) or (target_unit ~= blackboard.priority_target_enemy and target_unit ~= blackboard.urgent_target_enemy and target_unit ~= blackboard.proximity_target_enemy and target_unit ~= blackboard.slot_target_enemy)
	local wounded = blackboard.status_extension:is_wounded()

	return is_safe and (hurt or blackboard.force_use_health_pickup or wounded)
end
BTConditions.can_open_door = function (blackboard)
	local can_interact = false

	if blackboard.interaction_type == "door" then
		local interaction_unit = blackboard.interaction_unit
		local door_extension = unit_alive(interaction_unit) and ScriptUnit.has_extension(interaction_unit, "door_system")

		if door_extension then
			can_interact = door_extension.get_current_state(door_extension) == "closed"
		end
	end

	return can_interact
end
BTConditions.is_slot_not_wielded = function (blackboard, args)
	local wielded_slot = blackboard.inventory_extension:equipment().wielded_slot
	local wanted_slot = args[1]

	return wielded_slot ~= wanted_slot
end
local PUSHED_COOLDOWN = 2
local BLOCK_BROKEN_COOLDOWN = 4

local function is_safe_to_block_interact(status_extension, interaction_extension, wanted_interaction_type)
	local t = Managers.time:time("game")
	local pushed_t = status_extension.pushed_at_t
	local block_broken_t = status_extension.block_broken_at_t
	local enough_fatigue = true
	local is_interacting, interaction_type = interaction_extension.is_interacting(interaction_extension)

	if not is_interacting or interaction_type ~= wanted_interaction_type then
		local current_fatigue, max_fatigue = status_extension.current_fatigue_points(status_extension)
		local stamina_left = max_fatigue - current_fatigue
		local blocked_attack_cost = PlayerUnitStatusSettings.fatigue_point_costs.blocked_attack
		enough_fatigue = current_fatigue == 0 or blocked_attack_cost < stamina_left
	end

	if enough_fatigue and pushed_t + PUSHED_COOLDOWN < t and block_broken_t + BLOCK_BROKEN_COOLDOWN < t then
		return true
	else
		return false
	end

	return 
end

local function is_there_threat_to_aid(self_unit, proximite_enemies, force_aid)
	local num_proximite_enemies = #proximite_enemies

	for i = 1, num_proximite_enemies, 1 do
		local enemy_unit = proximite_enemies[i]

		if unit_alive(enemy_unit) then
			local enemy_blackboard = BLACKBOARDS[enemy_unit]
			local enemy_breed = enemy_blackboard.breed

			if enemy_blackboard.target_unit == self_unit and (not force_aid or enemy_breed.is_bot_aid_threat) then
				return true
			end
		end
	end

	return false
end

local function can_interact_with_ally(self_unit, target_ally_unit)
	local interactable_extension = ScriptUnit.extension(target_ally_unit, "interactable_system")
	local interactor_unit = interactable_extension.is_being_interacted_with(interactable_extension)
	local can_interact_with_ally = interactor_unit == nil or interactor_unit == self_unit

	return can_interact_with_ally
end

local FLAT_MOVE_TO_EPSILON_SQ = BotConstants.default.FLAT_MOVE_TO_EPSILON^2
local Z_MOVE_TO_EPSILON = BotConstants.default.Z_MOVE_TO_EPSILON

local function has_reached_ally_aid_destination(self_position, blackboard)
	local navigation_extension = blackboard.navigation_extension
	local destination = navigation_extension.destination(navigation_extension)
	local target_ally_aid_destination = blackboard.target_ally_aid_destination:unbox()
	local has_target_ally_aid_destination = Vector3.equal(destination, target_ally_aid_destination)

	if has_target_ally_aid_destination then
		return navigation_extension.destination_reached(navigation_extension)
	else
		local offset = target_ally_aid_destination - self_position

		return math.abs(offset.z) <= Z_MOVE_TO_EPSILON and Vector3.length_squared(Vector3.flat(offset)) <= FLAT_MOVE_TO_EPSILON_SQ
	end

	return 
end

BTConditions.can_revive = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "knocked_down" then
		local interaction_extension = blackboard.interaction_extension

		if not is_safe_to_block_interact(blackboard.status_extension, interaction_extension, "revive") then
			return false
		end

		local self_unit = blackboard.unit
		local health = ScriptUnit.extension(target_ally_unit, "health_system"):current_health_percent()

		if 0.3 < health and is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local ally_distance = blackboard.ally_distance
		local is_interacting, interaction_type = interaction_extension.is_interacting(interaction_extension)

		if is_interacting and interaction_type == "revive" and ally_distance < 1 then
			return true
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end

	return 
end
BTConditions.can_heal_player = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "in_need_of_heal" then
		local interaction_extension = blackboard.interaction_extension
		local is_interacting, interaction_type = interaction_extension.is_interacting(interaction_extension)

		if is_interacting and interaction_type == "heal" then
			return true
		end

		if 0 < #blackboard.proximite_enemies then
			return false
		end

		local self_unit = blackboard.unit
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_locomotion_extension = ScriptUnit.extension(target_ally_unit, "locomotion_system")
		local ally_velocity = ally_locomotion_extension.current_velocity(ally_locomotion_extension)
		local ally_speed_sq = Vector3.length_squared(ally_velocity)
		local ally_distance = blackboard.ally_distance

		if can_interact_with_ally and (ally_destination_reached or (0.04000000000000001 < ally_speed_sq and ally_distance < 2)) then
			return true
		end
	end

	return 
end
BTConditions.can_help_in_need_player = function (blackboard, args)
	local need_type = args[1]
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == need_type then
		local self_unit = blackboard.unit
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_locomotion_extension = ScriptUnit.extension(target_ally_unit, "locomotion_system")
		local ally_velocity = ally_locomotion_extension.current_velocity(ally_locomotion_extension)
		local ally_speed_sq = Vector3.length_squared(ally_velocity)
		local ally_distance = blackboard.ally_distance

		if can_interact_with_ally and (ally_destination_reached or (0.04000000000000001 < ally_speed_sq and ally_distance < 2)) then
			return true
		end
	end

	return 
end
BTConditions.can_rescue_hanging_from_hook = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "hook" then
		if not is_safe_to_block_interact(blackboard.status_extension, blacboard.interaction_extension, "release_from_hook") then
			return false
		end

		local self_unit = blackboard.unit

		if is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end

	return 
end
BTConditions.can_rescue_ledge_hanging = function (blackboard)
	local target_ally_unit = blackboard.target_ally_unit

	if blackboard.interaction_unit == target_ally_unit and blackboard.target_ally_need_type == "ledge" then
		if not is_safe_to_block_interact(blackboard.status_extension, blackboard.interaction_extension, "pull_up") then
			return false
		end

		local self_unit = blackboard.unit

		if is_there_threat_to_aid(self_unit, blackboard.proximite_enemies, blackboard.force_aid) then
			return false
		end

		local self_position = POSITION_LOOKUP[self_unit]
		local can_interact_with_ally = can_interact_with_ally(self_unit, target_ally_unit)
		local ally_destination_reached = has_reached_ally_aid_destination(self_position, blackboard)

		if can_interact_with_ally and ally_destination_reached then
			return true
		end
	end

	return 
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
	return blackboard.closing or 7 < blackboard.target_dist
end
BTConditions.in_run_dist = function (blackboard)
	return blackboard.target_dist <= 7
end
BTConditions.troll_downed = function (blackboard)
	return blackboard.can_get_downed and blackboard.downed_state
end
BTConditions.needs_to_crouch = function (blackboard)
	return blackboard.needs_to_crouch
end
BTConditions.reset_utility = function (blackboard)
	return not blackboard.reset_utility
end
BTConditions.is_alerted = function (blackboard)
	local alerted = unit_alive(blackboard.target_unit) and blackboard.is_alerted and (not blackboard.confirmed_player_sighting or blackboard.hesitating)
	local taunt_hesitate = blackboard.taunt_unit and not blackboard.taunt_hesitate_finished and not blackboard.no_taunt_hesitate

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
BTConditions.is_transported = function (blackboard)
	return blackboard.is_transported
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

	return trigger_time < t and unit_alive(blackboard.target_unit)
end
BTConditions.globadier_skulked_for_too_long = function (blackboard)
	local adv_data = blackboard.advance_towards_players
	local skulk_timeout = 15

	if adv_data then
		local t = Managers.time:time("game")
		local throw_globe_data = blackboard.throw_globe_data

		if throw_globe_data and throw_globe_data.next_throw_at then
			return throw_globe_data.next_throw_at + skulk_timeout < t
		else
			return adv_data.time_until_first_throw + skulk_timeout < adv_data.timer
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
			return last_fired + skulk_timeout < t
		elseif lurk_start then
			return lurk_start + skulk_timeout < t
		end
	end

	return false
end
BTConditions.should_defensive_idle = function (blackboard)
	local t = Managers.time:time("game")
	local time_since_surrounding_players = t - blackboard.surrounding_players_last

	return blackboard.defensive_mode_duration and 3 <= time_since_surrounding_players
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
	return blackboard.knocked_off_mount or not AiUtils.unit_alive(blackboard.mounted_data.mount_unit)
end
BTConditions.ready_to_cast_spell = function (blackboard)
	return blackboard.ready_to_summon and not blackboard.about_to_mount
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

return 
