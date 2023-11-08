ActionCareerBWNecromancerCommandVent = class(ActionCareerBWNecromancerCommandVent, ActionBase)

ActionCareerBWNecromancerCommandVent.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerCommandVent.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.commander_extension = ScriptUnit.extension(owner_unit, "ai_commander_system")
	self._fp_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
	self._command_ability = self.career_extension:get_passive_ability_by_name("bw_necromancer_command")
	self._owner_unit = owner_unit
	self._world = world
end

ActionCareerBWNecromancerCommandVent.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionCareerBWNecromancerCommandVent.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local target_pet = self._command_ability:vent_command_target()
	local overcharge_fraction_to_lose = 0.7
	local _, fraction_charge_removed = self.overcharge_extension:remove_charge_fraction(overcharge_fraction_to_lose)
	local player_unit = self._owner_unit
	local player = Managers.player:owner(player_unit)

	if player and player.local_player then
		Managers.state.achievement:trigger_event("sacrifice_skeleton", target_pet, fraction_charge_removed, player_unit)
	end

	local fp_extension = self._fp_extension

	if fp_extension then
		local fp_unit = fp_extension:get_first_person_unit()
		local trail_node = Unit.node(fp_unit, "j_aim_target")
		self._sacrifice_vfx_trail = ScriptWorld.create_particles_linked(self._world, "fx/pet_skeleton_sacrifice_trail", fp_unit, trail_node, "destroy")
		local hand_node = Unit.node(fp_unit, "j_righthand")
		self._sacrifice_vfx_hand = ScriptWorld.create_particles_linked(self._world, "fx/necromancer_skeleton_sacrifice_hand", fp_unit, hand_node, "destroy")
		self._vfx_stop_t = t + 0.8
	end

	if self._talent_extension:has_talent("sienna_necromancer_4_3") then
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff_synced(player_unit, "sienna_necromancer_4_3_withering_touch", BuffSyncType.LocalAndServer)
	end

	if HEALTH_ALIVE[target_pet] then
		self._command_ability:command_sacrifice(target_pet)
	end
end

ActionCareerBWNecromancerCommandVent.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self._vfx_stop_t and self._vfx_stop_t < t then
		World.stop_spawning_particles(self._world, self._sacrifice_vfx_trail)

		self._vfx_stop_t = nil
	end
end

ActionCareerBWNecromancerCommandVent.finish = function (self, reason, data)
	World.destroy_particles(self._world, self._sacrifice_vfx_trail)
	World.destroy_particles(self._world, self._sacrifice_vfx_hand)

	self._sacrifice_vfx_trail = nil
	self._sacrifice_vfx_hand = nil
	self._vfx_destroy_t = nil
end

ActionCareerBWNecromancerCommandVent.destroy = function (self)
	return
end
