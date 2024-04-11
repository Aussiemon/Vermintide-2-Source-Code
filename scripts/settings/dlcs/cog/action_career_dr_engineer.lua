-- chunkname: @scripts/settings/dlcs/cog/action_career_dr_engineer.lua

ActionCareerDREngineer = class(ActionCareerDREngineer, ActionMinigun)

local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

ActionCareerDREngineer.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDREngineer.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
end

ActionCareerDREngineer.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerDREngineer.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	if self._talent_extension:has_talent("bardin_engineer_reduced_ability_fire_slowdown") then
		self._max_rps = new_action.max_rps * 1.3
		self._current_rps = self._max_rps
	end

	Managers.state.achievement:trigger_event("crank_gun_fire_start", self.owner_unit)
end

ActionCareerDREngineer._update_attack_speed = function (self, t)
	if not self._calculated_attack_speed then
		self._attack_speed_mod = ActionUtils.get_action_time_scale(self.owner_unit, self.current_action)

		self.first_person_extension:animation_set_variable("barrel_spin_speed", self._attack_speed_mod)
	end

	ActionCareerDREngineer.super._update_attack_speed(self, t)
end

ActionCareerDREngineer._shoot = function (self, dt, t)
	self:_handle_infinite_stacks(dt, t)
	ActionCareerDREngineer.super._shoot(self, dt, t)
end

ActionCareerDREngineer._staggered_shot_done = function (self, t)
	ActionCareerDREngineer.super._staggered_shot_done(self, t)
	Managers.state.achievement:trigger_event("crank_gun_fire", self.owner_unit, 1)
	unit_flow_event(self.weapon_unit, "lua_finish_shooting")
end

ActionCareerDREngineer.finish = function (self, reason)
	ActionCareerDREngineer.super.finish(self, reason)

	local initial_rps = self._initial_rounds_per_second
	local rps_range = self._max_rps - initial_rps
	local windup = math.clamp((self._current_rps - initial_rps) / rps_range, 0, 1)

	Managers.state.event:trigger("on_engineer_weapon_spin_up", windup)
end

local INDEX_POSITION = 1
local INDEX_DISTANCE = 2

ActionCareerDREngineer.fire_hitscan = function (self, position, direction, range)
	local result = ActionCareerDREngineer.super.fire_hitscan(self, position, direction, range)
	local end_position = result and result[#result][INDEX_POSITION] or position + direction * range
	local life_time = (result and result[#result][INDEX_DISTANCE] or range) * 0.1

	self:_add_bullet_trail(end_position, life_time)
	Managers.state.event:trigger("on_engineer_weapon_fire", self._visual_heat_generation)

	return result
end

ActionCareerDREngineer._add_bullet_trail = function (self, end_position, lifetime)
	if not self.is_bot then
		local weapon_unit = self.weapon_unit

		unit_set_flow_variable(weapon_unit, "is_critical_strike", self._is_critical_strike)
		unit_set_flow_variable(weapon_unit, "hit_position", end_position)
		unit_set_flow_variable(weapon_unit, "trail_life", lifetime)
		unit_flow_event(weapon_unit, "lua_bullet_trail")
		unit_flow_event(weapon_unit, "lua_bullet_trail_set")
	end
end

ActionCareerDREngineer.get_projectile_start_position_rotation = function (self)
	return self.first_person_extension:get_projectile_start_position_rotation()
end

ActionCareerDREngineer._handle_infinite_stacks = function (self, dt, t)
	if not self._talent_extension:has_talent("bardin_engineer_pump_buff_long") then
		return
	end

	local buff_extension = self.buff_extension
	local buffs = buff_extension:get_stacking_buff("bardin_engineer_pump_buff")

	if buffs then
		if self._first_shot then
			for i = 1, #buffs do
				if buffs[i].duration then
					return
				end
			end

			local first_buff = buffs[1]

			first_buff.duration = CareerConstants.dr_engineer.talent_4_3_stack_duration
			first_buff.start_time = t
		else
			local duration_buff

			for i = 1, #buffs do
				local buff = buffs[i]

				if buff.duration then
					duration_buff = buff

					break
				end
			end

			if not duration_buff then
				duration_buff = buffs[1]
				duration_buff.duration = CareerConstants.dr_engineer.talent_4_3_stack_duration
				duration_buff.start_time = t

				return
			end
		end
	end
end
