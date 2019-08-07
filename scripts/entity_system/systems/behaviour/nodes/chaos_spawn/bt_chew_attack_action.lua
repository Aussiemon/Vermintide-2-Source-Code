require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChewAttackAction = class(BTChewAttackAction, BTNode)
BTChewAttackAction.name = "BTChewAttackAction"

BTChewAttackAction.init = function (self, ...)
	BTChewAttackAction.super.init(self, ...)
end

BTChewAttackAction.enter = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = self

	if not Unit.alive(blackboard.victim_grabbed) then
		return
	end

	if blackboard.grabbed_state ~= "chew" then
		local animation = "attack_grabbed_eat_start"

		network_manager:anim_event(unit, animation)
		blackboard.navigation_extension:set_enabled(false)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())
		StatusUtils.set_grabbed_by_chaos_spawn_status_network(blackboard.victim_grabbed, "chewed_on")
	end

	blackboard.is_chewing = true
	blackboard.grabbed_state = "chew"
	local victim = blackboard.victim_grabbed
	local victim_profile = ScriptUnit.extension(victim, "dialogue_system").context.player_profile

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.discover_enemy_attack_distance, "attack_tag", "chaos_spawn_eating", "target_name", victim_profile)
end

BTChewAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.is_chewing = false
	blackboard.active_node = nil
	blackboard.action = nil
	blackboard.attacks_done = 0

	if reason == "aborted" and Unit.alive(blackboard.victim_grabbed) then
		StatusUtils.set_grabbed_by_chaos_spawn_network(blackboard.victim_grabbed, false, unit)

		blackboard.has_grabbed_victim = nil
		blackboard.victim_grabbed = nil
	end

	if not AiUtils.unit_alive(blackboard.victim_grabbed) then
		blackboard.has_grabbed_victim = nil
		blackboard.victim_grabbed = nil
	end
end

local Unit_alive = Unit.alive

BTChewAttackAction.run = function (self, unit, blackboard, t, dt)
	local victim_grabbed = blackboard.victim_grabbed

	if not victim_grabbed or not AiUtils.unit_alive(victim_grabbed) then
		return "done"
	end

	if blackboard.anim_cb_chew_attack_finished then
		blackboard.anim_cb_chew_attack_finished = false
	end

	if blackboard.target_dist < 4 and blackboard.chew_attacks_done >= 2 then
		return "done"
	end

	return "running"
end

BTChewAttackAction.anim_cb_chew_attack = function (self, unit, blackboard)
	local action = blackboard.action

	AiUtils.damage_target(blackboard.victim_grabbed, unit, action, action.damage)

	blackboard.chew_attacks_done = blackboard.chew_attacks_done + 1
	local heal_type = "leech"
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local heal_amount = action.health_leech[difficulty_level]
	heal_amount = heal_amount * blackboard.chew_attacks_done
	heal_amount = DamageUtils.networkify_damage(heal_amount)
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension:add_heal(unit, heal_amount, nil, heal_type)

	if action.max_chew_attacks <= blackboard.chew_attacks_done then
		blackboard.wants_to_throw = true
	end
end

return
