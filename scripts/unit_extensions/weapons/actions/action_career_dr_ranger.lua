ActionCareerDRRanger = class(ActionCareerDRRanger, ActionCareerBase)
ActionCareerDRRanger.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerDRRanger.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.input_extension = ScriptUnit.extension(owner_unit, "input_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")

	return 
end
ActionCareerDRRanger.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.action_time_started = t
	self.thrown = nil
	local slot = new_action.slot_to_wield

	self.inventory_extension:wield(slot)
	self._play_vo(self)

	return 
end
ActionCareerDRRanger._create_smoke_screen = function (self)
	local owner_unit = self.owner_unit
	local world = self.world
	local is_server = self.is_server
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local status_extension = ScriptUnit.extension(owner_unit, "status_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local buff_name = "bardin_ranger_activated_ability"
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	if talent_extension.has_talent(talent_extension, "bardin_ranger_activated_ability_duration", "dwarf_ranger", true) then
		buff_name = "bardin_ranger_activated_ability_duration"
	end

	if talent_extension.has_talent(talent_extension, "bardin_ranger_activated_ability_heal", "dwarf_ranger", true) then
		local unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local heal_type_id = NetworkLookup.heal_types.career_skill

		network_transmit.send_rpc_server(network_transmit, "rpc_request_heal", unit_id, 20, heal_type_id)
	end

	local unit_spawner = Managers.state.unit_spawner
	local unit_name = "units/gameplay/line_of_sight_blocker/hemisphere_los_blocker"
	local unit_template_name = "network_synched_dummy_unit"
	local unit, unit_go_id = unit_spawner.spawn_network_unit(unit_spawner, unit_name, unit_template_name, nil, POSITION_LOOKUP[owner_unit], Quaternion.identity(), nil)
	local explosion_template_name = "bardin_ranger_activated_ability_stagger"
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local scale = explosion_template.explosion.radius

	Unit.set_local_scale(unit, 0, Vector3(scale, scale, scale))
	buff_extension.add_buff(buff_extension, buff_name, {
		attacker_unit = owner_unit,
		spawned_unit_go_id = unit_go_id
	})

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_bardin_ranger_enter", nil, true)
	first_person_extension.play_hud_sound_event(first_person_extension, "Play_career_ability_bardin_ranger_loop")

	local career_extension = ScriptUnit.extension(owner_unit, "career_system")

	career_extension.set_state(career_extension, "bardin_activate_ranger")
	status_extension.set_invisible(status_extension, true)

	return 
end
ActionCareerDRRanger._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "activate_ability", event_data)

	return 
end
ActionCareerDRRanger.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.thrown then
		return 
	end

	local current_action = self.current_action
	local throw_time = self.action_time_started + current_action.throw_time

	if throw_time <= t then
		self._create_smoke_screen(self)
		self._stagger_explosion(self)

		self.thrown = true
	end

	return 
end
ActionCareerDRRanger._stagger_explosion = function (self)
	local owner_unit = self.owner_unit
	local world = self.world
	local is_server = self.is_server
	MOOD_BLACKBOARD.skill_ranger = true
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local owner_unit_go_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local explosion_template_name = "bardin_ranger_activated_ability_stagger"
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local scale = 1
	local damage_source = "career_ability"
	local is_husk = false
	local position = POSITION_LOOKUP[owner_unit]
	local rotation = Quaternion.identity()

	DamageUtils.create_explosion(world, owner_unit, position, rotation, explosion_template.explosion, scale, damage_source, is_server, is_husk, owner_unit)

	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	if is_server then
		network_transmit.send_rpc_clients(network_transmit, "rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, 0)
	else
		network_transmit.send_rpc_server(network_transmit, "rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, 0)
	end

	local duration = 10
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	if talent_extension.has_talent(talent_extension, "bardin_ranger_activated_ability_duration", "dwarf_ranger", true) then
		duration = 14
	end

	self.career_extension:create_aoe(position, explosion_template.explosion.radius, duration, "end_ranger_activated_ability")

	return 
end
ActionCareerDRRanger.finish = function (self, reason)
	ActionCareerDRRanger.super.finish(self, reason)

	if reason ~= "action_complete" then
		return 
	end

	self.inventory_extension:wield_previous_weapon()
	self.career_extension:start_activated_ability_cooldown()

	return 
end

return 
