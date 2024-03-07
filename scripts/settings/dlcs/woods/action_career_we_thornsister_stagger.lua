-- chunkname: @scripts/settings/dlcs/woods/action_career_we_thornsister_stagger.lua

ActionCareerWEThornsisterStagger = class(ActionCareerWEThornsisterStagger, ActionBase)

ActionCareerWEThornsisterStagger.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEThornsisterStagger.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._network_transmit = Managers.state.network.network_transmit
end

ActionCareerWEThornsisterStagger.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerWEThornsisterStagger.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self:_play_vo()

	local career_extension = self.career_extension

	career_extension:start_activated_ability_cooldown()

	local target_data = chain_action_data

	if target_data then
		local is_server = self.is_server
		local is_husk = false
		local explosion_template_name = "we_thornsister_career_skill_stagger_spell"
		local explosion_template = ExplosionUtils.get_template(explosion_template_name)
		local scale = 1
		local damage_source = "career_ability"
		local career_power_level = career_extension:get_career_power_level()
		local owner_unit = self.owner_unit
		local position = POSITION_LOOKUP[owner_unit]
		local rotation = Quaternion.look(target_data.direction:unbox(), Vector3.up())

		DamageUtils.create_explosion(self.world, owner_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, owner_unit, career_power_level, false, owner_unit)

		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)
		local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
		local damage_source_id = NetworkLookup.damage_sources[damage_source]

		if is_server then
			network_transmit:send_rpc_clients("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false, owner_unit_go_id)
		else
			network_transmit:send_rpc_server("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false, owner_unit_go_id)
		end
	end
end

ActionCareerWEThornsisterStagger.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionCareerWEThornsisterStagger.finish = function (self, reason)
	self.inventory_extension:wield_previous_non_level_slot()
end

ActionCareerWEThornsisterStagger._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
