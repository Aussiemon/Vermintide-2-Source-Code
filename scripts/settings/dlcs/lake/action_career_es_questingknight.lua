-- chunkname: @scripts/settings/dlcs/lake/action_career_es_questingknight.lua

ActionCareerESQuestingKnight = class(ActionCareerESQuestingKnight, ActionSweep)

ActionCareerESQuestingKnight.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerESQuestingKnight.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
end

ActionCareerESQuestingKnight.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerESQuestingKnight.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._combo_no_wield = new_action.combo_no_wield or false
	self._hit_fx_triggered = false
	self._cooldown_started = false

	self:_play_vo()
	self:_play_vfx()
	self.inventory_extension:check_and_drop_pickups("career_ability")
	self.status_extension:set_stagger_immune(true)
end

ActionCareerESQuestingKnight.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	ActionCareerESQuestingKnight.super.client_owner_post_update(self, dt, t, world, can_damage, current_time_in_action)

	if not self._hit_fx_triggered and self._started_damage_window then
		self._hit_fx_triggered = true

		local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
		local rot = first_person_extension:current_rotation()
		local direction = Vector3.flat(Quaternion.forward(rot))
		local network_manager = Managers.state.network
		local effect_name = "fx/grail_knight_active_ability"
		local effect_name_id = NetworkLookup.effects[effect_name]
		local node_id = 0
		local vfx_settings = self.current_action.vfx_settings
		local forward_offset = vfx_settings.forward or 0
		local up_offset = vfx_settings.up or 0
		local start_position = POSITION_LOOKUP[self.owner_unit] + direction * forward_offset + Vector3.up() * up_offset
		local rotation_offset = vfx_settings.pitch and Quaternion.multiply(rot, Quaternion(Vector3.right(), vfx_settings.pitch)) or Quaternion.identity()

		network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, start_position, rotation_offset, false)
	end
end

ActionCareerESQuestingKnight.finish = function (self, reason, data)
	ActionCareerESQuestingKnight.super.finish(self, reason, data)
	self.inventory_extension:stop_weapon_fx("career_action", true)

	local new_action_settings = data and data.new_action_settings
	local is_ability_cancel = new_action_settings and new_action_settings.is_ability_cancel

	if is_ability_cancel or not self._combo_no_wield or reason ~= "new_interupting_action" then
		self.status_extension:set_stagger_immune(false)
		self.inventory_extension:wield_previous_non_level_slot()
	end

	local career_extension = self.career_extension

	if not self._cooldown_started and self.has_been_within_damage_window then
		self._cooldown_started = true

		career_extension:start_activated_ability_cooldown()
	end
end

ActionCareerESQuestingKnight._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionCareerESQuestingKnight._play_vfx = function (self)
	self.inventory_extension:start_weapon_fx("career_action", true)
end
