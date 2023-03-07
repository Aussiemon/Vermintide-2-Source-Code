require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTPackMasterEscortRatOgreAction = class(BTPackMasterEscortRatOgreAction, BTNode)
BTPackMasterEscortRatOgreAction.name = "BTPackMasterEscortRatOgreAction"

BTPackMasterEscortRatOgreAction.init = function (self, ...)
	BTPackMasterEscortRatOgreAction.super.init(self, ...)
end

BTPackMasterEscortRatOgreAction.enter = function (self, unit, blackboard, t)
	blackboard.action = self._tree_node.action_data

	LocomotionUtils.set_animation_driven_movement(unit, false)

	local network_manager = Managers.state.network

	network_manager:anim_event(unit, "combat_walk")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(blackboard.breed.walk_speed)

	local locomotion = blackboard.locomotion_extension

	locomotion:set_rotation_speed(5)

	blackboard.attack_cooldown = blackboard.attack_cooldown or 0
end

BTPackMasterEscortRatOgreAction.leave = function (self, unit, blackboard, t, reason, destroy)
	Managers.state.network:anim_event(unit, "move_fwd")
end

BTPackMasterEscortRatOgreAction.run = function (self, unit, blackboard, t, dt)
	local escort_slot = blackboard.my_escort_slot

	if not escort_slot then
		return "running"
	end

	if blackboard.escorting_wait_for_rat_ogre then
		local ogre_blackboard = BLACKBOARDS[escort_slot.ogre]

		if ogre_blackboard.wait_for_ogre then
			return "running"
		else
			blackboard.escorting_wait_for_rat_ogre = false
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "combat_walk")
		end
	end

	local ogre = escort_slot.ogre
	local ogre_pos = POSITION_LOOKUP[ogre]
	local ogre_rot = Unit.local_rotation(ogre, 0)
	local ogre_fwd = Quaternion.forward(ogre_rot)
	local ogre_side = Vector3.normalize(Vector3.cross(ogre_fwd, Vector3.up()))
	local pack_master_pos = ogre_pos + ogre_fwd * 4 + ogre_side * escort_slot.side_offset
	local success, hit_pos = GwNavQueries.raycast(blackboard.nav_world, ogre_pos, pack_master_pos)

	if success then
		blackboard.navigation_extension:move_to(pack_master_pos)
	elseif hit_pos then
		blackboard.navigation_extension:move_to(hit_pos)
	end

	local ogre_blackboard = BLACKBOARDS[escort_slot.ogre]

	if ogre_blackboard.is_angry or blackboard.previous_attacker or not AiUtils.unit_alive(ogre) then
		local breed = blackboard.breed
		local ai_simple = ScriptUnit.extension(unit, "ai_system")

		ai_simple:set_perception(breed.perception, breed.target_selection)

		blackboard.escorting_rat_ogre = false
		blackboard.far_off_despawn_immunity = false

		if blackboard.previous_attacker then
			ogre_blackboard.is_angry = true
			ogre_blackboard.previous_attacker = blackboard.previous_attacker
		end
	elseif ogre_blackboard.wait_for_ogre then
		blackboard.escorting_wait_for_rat_ogre = true
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "idle")
		blackboard.navigation_extension:stop()
	end

	return "running"
end
