ActionCareerDREngineerCharge = class(ActionCareerDREngineerCharge, ActionBase)

ActionCareerDREngineerCharge.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDREngineerCharge.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self.owner_unit = owner_unit
	self.audio_loop_id = "engineer_weapon_charge"

	if self.talent_extension:has_talent("bardin_engineer_pump_buff_long") then
		self._buff_to_add = "bardin_engineer_pump_buff_long"
	else
		self._buff_to_add = "bardin_engineer_pump_buff"
	end
end

ActionCareerDREngineerCharge.client_owner_start_action = function (self, new_action, t)
	ActionCareerDREngineerCharge.super.client_owner_start_action(self, new_action, t)

	self.ability_charge_timer = -new_action.initial_charge_delay

	self:start_audio_loop()
end

ActionCareerDREngineerCharge.client_owner_post_update = function (self, dt, t, world, can_damage)
	local buff_extension = self.buff_extension
	local current_action = self.current_action
	local interval = current_action.ability_charge_interval
	local charge_timer = self.ability_charge_timer + dt

	if interval <= charge_timer then
		local recharge_instances = math.floor(charge_timer / interval)
		charge_timer = charge_timer - recharge_instances * interval
		local wwise_world = self.wwise_world
		local buff_to_add = self._buff_to_add
		local num_stacks = buff_extension:num_buff_type(buff_to_add)
		local buff_type = buff_extension:get_buff_type(buff_to_add)

		if buff_type then
			if not self.last_pump_time then
				self.last_pump_time = t
			end

			local buff_template = buff_type.template

			if t - self.last_pump_time > 10 and buff_template.max_stacks <= num_stacks then
				Managers.state.achievement:trigger_event("clutch_pump", self.owner_unit)
			end

			self.last_pump_time = t
		end

		WwiseWorld.set_global_parameter(wwise_world, "engineer_charge", num_stacks + recharge_instances)

		for i = 1, recharge_instances do
			buff_extension:add_buff(buff_to_add)
		end
	end

	self.ability_charge_timer = charge_timer
	local current_cooldown = self.career_extension:current_ability_cooldown()

	if current_cooldown <= 0 then
		self.weapon_extension:stop_action("action_complete")
	end
end

ActionCareerDREngineerCharge.finish = function (self, reason)
	return
end

ActionCareerDREngineerCharge.start_audio_loop = function (self)
	local current_action = self.current_action
	local start_charge_id = current_action.charge_sound_name
	local stop_charge_id = current_action.charge_sound_stop_event

	if not start_charge_id or not stop_charge_id then
		return
	end

	local weapon_extension = self.weapon_extension
	local start_charge_husk_id = current_action.charge_sound_husk_name
	local stop_charge_husk_id = current_action.charge_sound_husk_stop_event

	weapon_extension:add_looping_audio(self.audio_loop_id, start_charge_id, stop_charge_id, start_charge_husk_id, stop_charge_husk_id)
	weapon_extension:start_looping_audio(self.audio_loop_id)
end
