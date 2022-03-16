local BLACKBOARDS = BLACKBOARDS
AnimationCallbackTemplates = {
	client = {}
}

AnimationCallbackTemplates.client.anim_cb_enable_second_hit_ragdoll = function (unit, param)
	local death_ext = ScriptUnit.extension(unit, "death_system")

	death_ext:enable_second_hit_ragdoll()
end

AnimationCallbackTemplates.client.anim_cb_push_finished = function (unit, param)
	local status_extension = ScriptUnit.has_extension(unit, "status_system")

	if status_extension then
		status_extension:set_stagger_animation_done(true)
	end
end

AnimationCallbackTemplates.server = {
	anim_cb_spawn_finished = function (unit, param)
		local blackboard = BLACKBOARDS[unit]
		blackboard.spawning_finished = true
	end,
	anim_cb_push_finished = function (unit, param)
		local blackboard = BLACKBOARDS[unit]
		blackboard.stagger_anim_done = true
	end,
	anim_cb_stunned_finished = function (unit, param)
		local blackboard = BLACKBOARDS[unit]
		blackboard.blocked = nil
	end,
	anim_cb_tp_end_enter = function (unit, param)
		local blackboard = BLACKBOARDS[unit]

		if blackboard.active_node and blackboard.active_node.anim_cb_tp_end_enter then
			blackboard.active_node:anim_cb_tp_end_enter(unit, blackboard)
		end
	end,
	anim_cb_hesitate_finished = function (unit, param)
		local blackboard = BLACKBOARDS[unit]

		if blackboard.active_node and blackboard.active_node.anim_cb_hesitate_finished then
			blackboard.active_node:anim_cb_hesitate_finished(unit, blackboard)
		end
	end,
	anim_cb_emote_finished = function (unit, param)
		local blackboard = BLACKBOARDS[unit]

		if blackboard.active_node and blackboard.active_node.anim_cb_emote_finished then
			blackboard.active_node:anim_cb_emote_finished(unit, blackboard)
		end
	end,
	anim_cb_direct_damage = function (unit, param)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(blackboard.target_unit) then
			return
		end

		local action = blackboard.action

		if not action then
			return
		end

		local active_behavior_node = blackboard.active_node

		if active_behavior_node and active_behavior_node.direct_damage then
			active_behavior_node.direct_damage(unit, blackboard)
		end

		blackboard.attacks_done = blackboard.attacks_done + 1
	end
}
local DEFAULT_SPEED_MODIFIER_ON_TARGET_DODGE_DAMAGE_DONE = 0
local DEFAULT_ROTATION_STUN_TIME_ON_DODGE_DAMAGE_DONE = 0.6
local DEFAULT_SPEED_LERP_TIME_ON_TARGET_DODGE_DAMAGE_DONE = 0.3

AnimationCallbackTemplates.server.anim_cb_damage = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local target_unit = (blackboard.smash_door and blackboard.smash_door.target_unit) or blackboard.attacking_target or blackboard.drag_target_unit
	local action = blackboard.action

	if not action then
		return
	end

	local damage = action.damage

	if not damage then
		return
	end

	local combo = blackboard.combo_attack_data

	if combo and action.combo_attacks then
		local current_attack = action.combo_attacks[combo.current_attack_name]

		if current_attack.no_abort_attack then
			blackboard.attack_aborted = false
		end
	end

	if blackboard.active_node and blackboard.active_node.attack_cooldown then
		blackboard.active_node:attack_cooldown(unit, blackboard)
	end

	if blackboard.attack_aborted then
		return
	end

	if blackboard.active_node and blackboard.active_node.anim_cb_damage then
		blackboard.active_node:anim_cb_damage(unit, blackboard)

		return
	end

	blackboard.anim_cb_damage = true

	if not Unit.alive(target_unit) or not Unit.alive(unit) then
		return
	end

	if blackboard.has_line_of_sight == false or not DamageUtils.check_distance(action, blackboard, unit, target_unit) or not DamageUtils.check_infront(unit, target_unit) then
		return
	end

	local attack_direction = action.attack_directions and action.attack_directions[blackboard.attack_anim]

	if not action.unblockable and DamageUtils.check_block(unit, target_unit, action.fatigue_type, attack_direction) then
		if blackboard.active_node and blackboard.active_node.attack_blocked then
			blackboard.active_node:attack_blocked(unit, blackboard, attack_direction)
		end

		return
	end

	AiUtils.damage_target(target_unit, unit, action, action.damage)

	if blackboard.active_node and blackboard.active_node.attack_success then
		blackboard.active_node:attack_success(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_special_damage = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local action = blackboard.action

	if not action or not action.damage then
		return
	end

	if blackboard.attack_aborted then
		return
	end

	if blackboard.active_node and blackboard.active_node.anim_cb_damage then
		blackboard.active_node:anim_cb_damage(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_reset_attack_animation_locked = function (unit, param)
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local blackboard = ai_extension:blackboard()
	blackboard.reset_attack_animation_locked = true
end

AnimationCallbackTemplates.server.anim_cb_unlink_unit = function (unit, param)
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local blackboard = ai_extension:blackboard()
	blackboard.unlink_unit = true
end

AnimationCallbackTemplates.server.anim_cb_mounted_knocked_off = function (unit, param)
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local blackboard = ai_extension:blackboard()
	blackboard.knocked_off_mount = true
	local locomotion_extension = blackboard.locomotion_extension

	LocomotionUtils.set_animation_driven_movement(unit, false, false, true)
	locomotion_extension:use_lerp_rotation(true)
	locomotion_extension:set_movement_type("snap_to_navmesh")
end

AnimationCallbackTemplates.server.anim_cb_mounting_finished = function (unit, param)
	local ai_extension = ScriptUnit.extension(unit, "ai_system")
	local blackboard = ai_extension:blackboard()
	blackboard.mounting_finished = true
end

AnimationCallbackTemplates.server.anim_cb_frenzy_damage = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local action = blackboard.action

	if not action or not action.damage then
		return
	end

	if blackboard.attack_aborted then
		return
	end

	if blackboard.active_node and blackboard.active_node.attack_cooldown then
		blackboard.active_node:attack_cooldown(unit, blackboard)
	end

	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_frenzy_damage then
		active_node:anim_cb_frenzy_damage(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_vce = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local action = blackboard.action

	if blackboard.attack_aborted then
		return
	end

	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_attack_vce then
		active_node:anim_cb_attack_vce(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_vce_long = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local action = blackboard.action

	if blackboard.attack_aborted then
		return
	end

	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_attack_vce_long then
		active_node:anim_cb_attack_vce_long(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_shout_vo = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_shout_vo then
		active_node:anim_cb_shout_vo(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_combo_damage = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local action = blackboard.action

	if not action or not action.damage then
		return
	end

	if blackboard.attack_aborted then
		return
	end

	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_combo_damage then
		active_node.anim_cb_combo_damage(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_rotation_start = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_rotation_start = true
end

AnimationCallbackTemplates.server.anim_cb_rotation_stop = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_rotation_stop = true
end

AnimationCallbackTemplates.server.anim_cb_picked_up_standard = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_picked_up_standard = true
end

AnimationCallbackTemplates.server.anim_cb_running_attack_start = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard.active_node and blackboard.active_node.anim_cb_running_attack_start then
		blackboard.active_node:anim_cb_running_attack_start(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_running_attack_end = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard.active_node and blackboard.active_node.anim_cb_running_attack_end then
		blackboard.active_node:anim_cb_running_attack_end(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_death_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_death_finished = true
end

AnimationCallbackTemplates.server.anim_cb_move = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	blackboard.anim_cb_move = true

	if not active_node or blackboard.attack_aborted then
		return
	end

	local anim_cb = active_node.anim_cb_move

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_move_stop = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_move_stop = true
end

AnimationCallbackTemplates.server.anim_cb_transform_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local anim_cb = active_node and active_node.anim_cb_transform_finished

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_throw_weapon = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local anim_cb = active_node.anim_cb_throw_weapon

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_throw_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local anim_cb = active_node and active_node.anim_cb_throw_finished

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_charge_start_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_charge_start_finished then
		active_node:anim_cb_charge_start_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_charge_charging_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_charge_charging_finished then
		active_node:anim_cb_charge_charging_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_charge_impact_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_charge_impact_finished then
		active_node:anim_cb_charge_impact_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_disable_charge_collision = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_disable_charge_collision then
		active_node:anim_cb_disable_charge_collision(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_throw = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_throw = true
end

AnimationCallbackTemplates.server.anim_cb_spawn_projectile = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_spawn_projectile = true
end

AnimationCallbackTemplates.server.anim_cb_jump_start_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.jump_start_finished = true
end

AnimationCallbackTemplates.server.anim_cb_jump_climb_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.jump_climb_finished = true
end

AnimationCallbackTemplates.server.anim_cb_start_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.start_finished = true
end

AnimationCallbackTemplates.server.anim_cb_attack_start = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if not active_node or blackboard.attack_aborted then
		return
	end

	local anim_cb = active_node.anim_cb_attack_start

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard.active_node and blackboard.active_node.anim_cb_attack_finished then
		local anim_cb = blackboard.active_node.anim_cb_attack_finished

		anim_cb(anim_cb, unit, blackboard)
	else
		blackboard.attacks_done = blackboard.attacks_done + 1
		blackboard.attack_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_escape_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_escape_finished = true
end

AnimationCallbackTemplates.server.anim_cb_attack_cooldown = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_attack_cooldown = true
end

AnimationCallbackTemplates.server.anim_cb_blocked_cooldown = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_blocked_cooldown = true
end

AnimationCallbackTemplates.server.anim_cb_summoning_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.summoning_finished = true
end

AnimationCallbackTemplates.server.anim_cb_shout_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_shout_finished = true
end

AnimationCallbackTemplates.server.anim_cb_order_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_order_finished = true
end

AnimationCallbackTemplates.server.anim_cb_scurry_under_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_scurry_under_finished = true
end

AnimationCallbackTemplates.server.anim_cb_dig_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_dig_finished = true
end

AnimationCallbackTemplates.server.anim_cb_attack_throw_score_finished = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_attack_throw_score_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_jump_start_finished = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_attack_jump_start_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_shoot_start_finished = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_attack_shoot_start_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_reload_start_finished = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_reload_start_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_windup_start_finished = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_attack_windup_start_finished = true
	end
end

AnimationCallbackTemplates.server.anim_cb_attack_shoot_random_shot = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_attack_shoot_random_shot = true
	end
end

AnimationCallbackTemplates.server.anim_cb_stormvermin_voice = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_stormvermin_voice = true
	end
end

AnimationCallbackTemplates.server.anim_cb_patrol_sound = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.anim_cb_patrol_sound = true
	end
end

AnimationCallbackTemplates.server.anim_cb_exit_shooting_hit_react = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.in_hit_reaction = nil
	end
end

AnimationCallbackTemplates.server.anim_cb_enter_shooting_hit_react = function (unit, param)
	local ai_base_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_base_extension then
		local blackboard = ai_base_extension:blackboard()
		blackboard.in_hit_reaction = true
	end
end

AnimationCallbackTemplates.server.anim_cb_place_standard = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node then
		local anim_cb = active_node.anim_cb_place_standard

		if anim_cb then
			anim_cb(active_node, unit, blackboard)
		end
	end
end

AnimationCallbackTemplates.server.anim_cb_pick_up_standard = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node then
		local anim_cb = active_node.anim_cb_pick_up_standard

		if anim_cb then
			anim_cb(active_node, unit, blackboard)
		end
	end
end

AnimationCallbackTemplates.server.anim_cb_placed_standard = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local anim_cb = active_node and active_node.anim_cb_placed_standard

	if anim_cb then
		anim_cb(active_node, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_stormvermin_push = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local target_unit = blackboard.attacking_target
	local active_node = blackboard.active_node

	if not active_node or blackboard.attack_aborted or not AiUtils.unit_alive(target_unit) then
		return
	end

	local anim_cb = active_node.anim_cb_stormvermin_push

	if anim_cb then
		anim_cb(active_node, unit, blackboard, target_unit)
	end
end

AnimationCallbackTemplates.server.anim_cb_stormvermin_push_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.attack_finished = true
end

AnimationCallbackTemplates.server.anim_cb_attack_overlap_done = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if not active_node or blackboard.attack_aborted then
		return
	end

	local anim_cb = active_node.anim_cb_attack_overlap_done

	if anim_cb then
		anim_cb(active_node, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_vomit = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if not active_node or blackboard.attack_aborted then
		return
	end

	local anim_cb = active_node.anim_cb_vomit

	if anim_cb then
		anim_cb(anim_cb, unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_vomit_end = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.is_puking = nil
end

AnimationCallbackTemplates.server.anim_cb_dodge_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_dodge_finished = true
end

AnimationCallbackTemplates.server.anim_cb_downed_end_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.downed_end_finished = true
end

AnimationCallbackTemplates.server.anim_cb_landing_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.landing_finished = true
end

AnimationCallbackTemplates.server.anim_cb_teleport_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_teleport_finished = true
end

AnimationCallbackTemplates.server.anim_cb_teleport_start_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_teleport_start_finished then
		active_node:anim_cb_teleport_start_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_teleport_end_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_teleport_end_finished then
		active_node:anim_cb_teleport_end_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_move_jump_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_move_jump_finished then
		active_node:anim_cb_move_jump_finished(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_stagger_immune = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_stagger_immune = true
end

AnimationCallbackTemplates.server.anim_cb_push_cancel = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node

	if active_node and active_node.anim_cb_push_cancel then
		active_node:anim_cb_push_cancel(unit, blackboard)
	end
end

AnimationCallbackTemplates.server.anim_cb_disable_invincibility = function (unit, param)
	local health_extension = ScriptUnit.has_extension(unit, "health_system")

	if health_extension then
		health_extension.is_invincible = false
	end
end

AnimationCallbackTemplates.server.anim_cb_combat_step_stop = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard.active_node and blackboard.active_node.anim_cb_combat_step_stop then
		blackboard.active_node:anim_cb_combat_step_stop(unit, blackboard)
	end
end

AnimationCallbackTemplates.client.anim_cb_hide_unit = function (unit, param)
	Unit.set_unit_visibility(unit, false)

	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if inventory_extension then
		inventory_extension:show_third_person_inventory(false)
	end

	local attachment_extension = ScriptUnit.has_extension(unit, "attachment_system")

	if attachment_extension then
		attachment_extension:show_attachments(false)
	end
end

AnimationCallbackTemplates.client.anim_cb_hide_weapons = function (unit, param)
	local player_manager = Managers.player
	local player = player_manager:unit_owner(unit)

	if not player then
		return
	end

	local is_local_player = player.local_player
	local allowed_to_set = true

	if is_local_player then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		allowed_to_set = not first_person_extension.first_person_mode
	end

	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if allowed_to_set and inventory_extension and inventory_extension:is_showing_third_person_inventory() then
		inventory_extension:show_third_person_inventory(false)
	end
end

AnimationCallbackTemplates.client.anim_cb_unhide_weapons = function (unit, param)
	local player_manager = Managers.player
	local player = player_manager:unit_owner(unit)

	if not player then
		return
	end

	local is_local_player = player.local_player
	local allowed_to_set = true

	if is_local_player then
		local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
		allowed_to_set = not first_person_extension.first_person_mode
	end

	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if allowed_to_set and inventory_extension and not inventory_extension:is_showing_third_person_inventory() then
		inventory_extension:show_third_person_inventory(true)
	end
end

AnimationCallbackTemplates.client.anim_cb_climb_rotation_start = function (unit, param)
	local status_extension = ScriptUnit.extension(unit, "status_system")
	status_extension.start_climb_rotation = true
end

AnimationCallbackTemplates.server.anim_cb_chew_attack = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local victim_unit = blackboard.victim_grabbed

	if not victim_unit or not Unit.alive(victim_unit) then
		return
	end

	if active_node then
		local anim_cb = active_node.anim_cb_chew_attack

		if anim_cb then
			anim_cb(active_node, unit, blackboard)
		end
	end
end

AnimationCallbackTemplates.server.anim_cb_chew_attack_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	blackboard.anim_cb_chew_attack_finished = true
end

AnimationCallbackTemplates.server.anim_cb_attack_grabbed_smash = function (unit, param)
	local blackboard = BLACKBOARDS[unit]
	local active_node = blackboard.active_node
	local victim_unit = blackboard.victim_grabbed

	if not victim_unit or not Unit.alive(victim_unit) then
		return
	end

	if active_node then
		local anim_cb = active_node.anim_cb_attack_grabbed_smash

		if anim_cb then
			anim_cb(active_node, unit, blackboard)
		end
	end
end

DLCUtils.require_list("animation_callback_template_files")

return
