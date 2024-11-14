-- chunkname: @scripts/settings/dlcs/cog/action_career_dr_engineer_spin.lua

ActionCareerDREngineerSpin = class(ActionCareerDREngineerSpin, ActionMinigunSpin)

ActionCareerDREngineerSpin.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDREngineerSpin.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
end

ActionCareerDREngineerSpin.client_owner_start_action = function (self, new_action, t)
	ActionCareerDREngineerSpin.super.client_owner_start_action(self, new_action, t)

	self._override_visual_spinup = new_action.override_visual_spinup
	self._visual_spinup_min = new_action.visual_spinup_min
	self._visual_spinup_max = new_action.visual_spinup_max
	self._visual_spinup_time = new_action.visual_spinup_time
	self._last_update_t = t

	if self._talent_extension:has_talent("bardin_engineer_reduced_ability_fire_slowdown") then
		self._current_windup = CareerConstants.dr_engineer.talent_6_2_starting_rps

		if Managers.mechanism:current_mechanism_name() == "versus" then
			self._current_windup = CareerConstants.dr_engineer.talent_6_2_starting_rps_vs
		end
	end
end

ActionCareerDREngineerSpin.client_owner_post_update = function (self, dt, t, world, can_damage)
	ActionCareerDREngineerSpin.super.client_owner_post_update(self, dt, t, world, can_damage)

	self._last_update_t = t
end

ActionCareerDREngineerSpin.finish = function (self, reason)
	ActionCareerDREngineerSpin.super.finish(self, reason)

	local visual_spinup = self.weapon_extension:get_custom_data("windup")

	if self._override_visual_spinup then
		local time_spent = self._last_update_t - self.action_start_t
		local lerp_t = time_spent / self._visual_spinup_time

		visual_spinup = math.lerp(self._visual_spinup_min, self._visual_spinup_max, lerp_t)
	end

	Managers.state.event:trigger("on_engineer_weapon_spin_up", visual_spinup, self._override_visual_spinup)
end
