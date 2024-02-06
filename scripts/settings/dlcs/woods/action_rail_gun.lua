-- chunkname: @scripts/settings/dlcs/woods/action_rail_gun.lua

ActionRailGun = class(ActionRailGun, ActionRangedBase)

ActionRailGun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionRailGun.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionRailGun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionRailGun.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local on_shoot_particle_fx = new_action.on_shoot_particle_fx

	if on_shoot_particle_fx and not self.is_bot then
		local unit = self.first_person_unit
		local node_name = on_shoot_particle_fx.node_name

		self._on_shoot_particle_fx_node = Unit.has_node(unit, node_name) and Unit.node(unit, node_name) or 0
		self._on_shoot_particle_fx = on_shoot_particle_fx
	end
end

ActionRailGun.shoot = function (self, num_shots_this_frame, shots_fired, num_shots_total)
	local on_shoot_particle_fx = self._on_shoot_particle_fx

	if on_shoot_particle_fx then
		local is_first_person = not self.is_bot

		if is_first_person then
			local unit = self.first_person_unit
			local node_position = Unit.world_position(unit, self._on_shoot_particle_fx_node)

			World.create_particles(self.world, on_shoot_particle_fx.effect, node_position)
		end
	end

	return ActionRailGun.super.shoot(self, num_shots_this_frame, shots_fired, num_shots_total)
end

ActionRailGun.finish = function (self, reason)
	ActionRailGun.super.finish(self, reason)
	self:_proc_spell_used(self.owner_buff_extension)
end
