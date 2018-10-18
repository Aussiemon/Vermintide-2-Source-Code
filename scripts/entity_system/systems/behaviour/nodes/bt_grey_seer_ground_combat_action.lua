require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTGreySeerGroundCombatAction = class(BTGreySeerGroundCombatAction, BTNode)
local PLAYER_POSITIONS = PLAYER_POSITIONS
local PLAYER_UNITS = PLAYER_UNITS

BTGreySeerGroundCombatAction.init = function (self, ...)
	BTGreySeerGroundCombatAction.super.init(self, ...)
end

BTGreySeerGroundCombatAction.name = "BTGreySeerGroundCombatAction"

BTGreySeerGroundCombatAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	Managers.state.network:anim_event(unit, "to_combat")
	Managers.state.network:anim_event(unit, "idle_eat_warpstone")

	local current_phase = blackboard.current_phase
	local breed = blackboard.breed
	local spell_data = blackboard.spell_data or {}
	spell_data.warp_lightning_spell_cooldown = action.warp_lightning_spell_cooldown[current_phase]
	spell_data.vermintide_spell_cooldown = action.vermintide_spell_cooldown[current_phase]
	spell_data.teleport_spell_cooldown = action.teleport_spell_cooldown[current_phase]
	spell_data.warp_lightning_spell_timer = spell_data.warp_lightning_spell_timer or t + 2
	spell_data.vermintide_spell_timer = spell_data.vermintide_spell_timer or t + 5
	spell_data.teleport_spell_timer = spell_data.teleport_spell_timer or t + 6
	blackboard.spell_data = spell_data

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local final_phase_data = blackboard.final_phase_data or {}
	blackboard.final_phase_data = final_phase_data
	final_phase_data.num_teleports = final_phase_data.num_teleports or 1
	final_phase_data.spawn_allies_timer = final_phase_data.spawn_allies_timer or t + 3
	final_phase_data.teleport_timer = final_phase_data.teleport_timer or t
	local health_extension = ScriptUnit.extension(unit, "health_system")
	health_extension.is_invincible = false
end

BTGreySeerGroundCombatAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil

	blackboard.navigation_extension:set_enabled(true)
end

local Unit_alive = Unit.alive

BTGreySeerGroundCombatAction.run = function (self, unit, blackboard, t, dt)
	local ready_to_cast = self:update_spells(unit, blackboard, t)

	Profiler.start("grey_seer_ground_combat")

	if ready_to_cast then
		blackboard.ready_to_summon = true

		Profiler.stop("grey_seer_ground_combat")

		return "done"
	else
		Profiler.stop("grey_seer_ground_combat")

		return "running"
	end
end

BTGreySeerGroundCombatAction.update_spells = function (self, unit, blackboard, t)
	local current_phase = blackboard.current_phase
	local ready_to_summon = false
	local position = POSITION_LOOKUP[unit]
	local target_unit_direction = blackboard.target_unit and position - POSITION_LOOKUP[blackboard.target_unit]

	self:update_warp_lightning_spell(unit, blackboard, t, position, target_unit_direction)
	self:update_vermintide_spell(unit, blackboard, t, position, target_unit_direction)

	if current_phase < 4 then
		ready_to_summon = self:update_regular_spells(unit, blackboard, t)
	elseif current_phase == 4 then
		ready_to_summon = self:update_final_phase(unit, blackboard, t)
	end

	return ready_to_summon
end

BTGreySeerGroundCombatAction.update_final_phase = function (self, unit, blackboard, t)
	local action = blackboard.action
	local ready_to_summon = nil
	local final_phase_data = blackboard.final_phase_data
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local current_phase = blackboard.current_phase
	local teleport_position_index = final_phase_data.num_teleports or 1
	local call_position = blackboard.defensive_teleport_positions[teleport_position_index]:unbox()
	local teleport_timer = final_phase_data.teleport_timer
	local special_spawn_timer = final_phase_data.special_spawn_timer

	if current_phase == 4 and ((teleport_timer and teleport_timer < t) or action.staggers_until_teleport <= blackboard.stagger_count) then
		local projected_wanted_pos = LocomotionUtils.pos_on_mesh(blackboard.nav_world, call_position, 1, 1)
		blackboard.quick_teleport_exit_pos = Vector3Box(projected_wanted_pos)
		blackboard.quick_teleport = true
		final_phase_data.teleport_timer = t + action.final_phase_teleport_cooldown
		blackboard.current_spell_name = "teleport"
		blackboard.stagger_count = 0
		final_phase_data.num_teleports = (final_phase_data.num_teleports and final_phase_data.num_teleports + 1) or 1

		if final_phase_data.num_teleports > 4 then
			final_phase_data.num_teleports = 1
		end

		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("egs_teleport_away", event_data)

		return true
	end

	local spawn_allies_timer = final_phase_data.spawn_allies_timer

	if spawn_allies_timer < t then
		self:spawn_allies(unit, blackboard, t)

		final_phase_data.spawn_allies_timer = t + action.spawn_allies_cooldown

		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "egs_summon", DialogueSettings.default_hear_distance)

		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("egs_cast_vermintide", event_data)
	end

	ready_to_summon = self:update_regular_spells(unit, blackboard, t)

	return ready_to_summon
end

BTGreySeerGroundCombatAction.update_regular_spells = function (self, unit, blackboard, t)
	local spell_data = blackboard.spell_data
	local ready_to_summon = nil
	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local warp_lightning_timer = spell_data.warp_lightning_spell_timer
	local vemintide_timer = spell_data.vermintide_spell_timer
	local teleport_timer = spell_data.teleport_spell_timer
	local current_phase = blackboard.current_phase

	if warp_lightning_timer < t then
		blackboard.current_spell_name = "warp_lightning"
		ready_to_summon = true
		spell_data.warp_lightning_spell_timer = t + spell_data.warp_lightning_spell_cooldown
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("egs_cast_lightning", event_data)
	elseif vemintide_timer < t then
		blackboard.current_spell_name = "vermintide"
		ready_to_summon = true
		spell_data.vermintide_spell_timer = t + spell_data.vermintide_spell_cooldown
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event("egs_cast_vermintide", event_data)
	end

	return ready_to_summon
end

BTGreySeerGroundCombatAction.update_warp_lightning_spell = function (self, unit, blackboard, t, position, target_unit_direction)
	local magic_missile_spell = blackboard.magic_missile_data

	magic_missile_spell.throw_pos:store(position + Vector3.up() * 2)

	if target_unit_direction then
		magic_missile_spell.target_direction:store(target_unit_direction)
	end
end

BTGreySeerGroundCombatAction.update_vermintide_spell = function (self, unit, blackboard, t, position, target_unit_direction)
	local plague_wave_spell = blackboard.plague_wave_data

	plague_wave_spell.target_starting_pos:store(position)

	if target_unit_direction then
		plague_wave_spell.plague_wave_rot:store(Quaternion.look(target_unit_direction))
	end
end

BTGreySeerGroundCombatAction.update_teleport_spell = function (self, unit, blackboard, t, position)
	local quick_teleport_timer = blackboard.quick_teleport_timer or t
	blackboard.quick_teleport_timer = quick_teleport_timer

	if quick_teleport_timer and quick_teleport_timer < t then
		local skulk_data = blackboard.skulk_data or {}
		blackboard.skulk_data = skulk_data
		skulk_data.direction = skulk_data.direction or 1 - math.random(0, 1) * 2
		skulk_data.radius = skulk_data.radius or blackboard.target_dist
		local teleport_pos = BTChaosSorcererPlagueSkulkAction:get_skulk_target(unit, blackboard, true)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil
			blackboard.quick_teleport_timer = t + 2.5
		end
	end
end

BTGreySeerGroundCombatAction.spawn_allies = function (self, unit, blackboard, t)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local action = blackboard.action
	local strictly_not_close_to_players = true
	local silent = true
	local composition_type = action.difficulty_spawn[difficulty] or action.spawn
	local limit_spawners = nil
	local terror_event_id = action.terror_event_id
	local conflict_director = Managers.state.conflict

	conflict_director.horde_spawner:execute_event_horde(t, terror_event_id, composition_type, limit_spawners, silent, nil, strictly_not_close_to_players)
end

return
