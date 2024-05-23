﻿-- chunkname: @scripts/settings/dlcs/woods/action_spirit_storm.lua

ActionSpiritStorm = class(ActionSpiritStorm, ActionBase)

ActionSpiritStorm.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionSpiritStorm.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
end

ActionSpiritStorm.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionSpiritStorm.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action

	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

	self.owner_buff_extension = buff_extension
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.target = chain_action_data.target
	self.is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action)
end

ActionSpiritStorm.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action

	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		self:fire()

		self.state = "doing_damage"
	end

	if self.state == "doing_damage" then
		self:_proc_spell_used(self.owner_buff_extension)

		self.state = "shot"
	end
end

ActionSpiritStorm.finish = function (self, reason)
	if self.state ~= "waiting_to_shoot" and self.state ~= "shot" then
		self:_proc_spell_used(self.owner_buff_extension)
	end

	self.position = nil

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionSpiritStorm.fire = function (self, reason)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local target_unit = self.target
	local storm_spawn_position = POSITION_LOOKUP[target_unit]
	local overcharge = current_action.overcharge_amount

	if storm_spawn_position then
		local owner_unit_id = Managers.state.unit_storage:go_id(owner_unit)
		local target_unit_id = Managers.state.unit_storage:go_id(self.target)

		self.network_transmit:send_rpc_server("rpc_summon_vortex", owner_unit_id, target_unit_id)

		local target_breed = Unit.get_data(target_unit, "breed")

		if target_breed and target_breed.is_player then
			overcharge = current_action.overcharge_amount_player_target or overcharge

			if current_action.player_target_buff then
				self.owner_buff_extension:add_buff(current_action.player_target_buff)
			end
		end
	end

	if overcharge then
		local buff_extension = self.owner_buff_extension

		if self.is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge = 0
		end

		self.overcharge_extension:add_charge(overcharge)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		local play_on_husk = self.current_action.fire_sound_on_husk
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event, nil, play_on_husk)
	end

	if current_action.alert_enemies and storm_spawn_position then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, storm_spawn_position, current_action.alert_sound_range_fire)
	end
end
