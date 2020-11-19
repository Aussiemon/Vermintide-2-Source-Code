ActionBase = class(ActionBase)
local unit_flow_event = Unit.flow_event

ActionBase.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.physics_world = World.get_data(world, "physics_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.first_person_unit = first_person_unit
	self.owner_unit = owner_unit
	self.owner = Managers.player:unit_owner(owner_unit)
	self.owner_player = Managers.player:owner(owner_unit)
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.weapon_system = weapon_system
	local network_manager = Managers.state.network
	self.network_manager = network_manager
	self.network_transmit = network_manager.network_transmit
	self.is_server = is_server
	self.is_bot = self.owner_player and self.owner_player.bot_player
	self._is_critical_strike = false
	self._fatigue_reset = true
end

ActionBase.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	self.current_action = new_action
	local buff_extension = ScriptUnit.has_extension(self.owner_unit, "buff_system")

	buff_extension:trigger_procs("on_start_action", new_action, t, chain_action_data, power_level, action_init_data)

	self._fatigue_reset = true
end

ActionBase._handle_critical_strike = function (self, is_critical_strike, buff_extension, hud_extension, first_person_extension, proc_type, hud_sound_event)
	if is_critical_strike then
		self:_do_critical_strike_fx(hud_extension, first_person_extension, hud_sound_event)
		self:_do_critical_strike_procs(buff_extension, proc_type)
	end
end

ActionBase._do_critical_strike_fx = function (self, hud_extension, first_person_extension, hud_sound_event)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit

	unit_flow_event(owner_unit, "vfx_critical_strike")
	unit_flow_event(first_person_unit, "vfx_critical_strike")

	if hud_extension then
		hud_extension.show_critical_indication = true
	end

	if first_person_extension and hud_sound_event then
		first_person_extension:play_hud_sound_event(hud_sound_event, nil, false)
	end
end

ActionBase._do_critical_strike_procs = function (self, buff_extension, proc_type)
	if buff_extension and proc_type then
		buff_extension:trigger_procs(proc_type)
	end
end

ActionBase._handle_fatigue = function (self, buff_extension, status_extension, new_action, check_buffs)
	local procced = nil

	if self._fatigue_reset then
		if check_buffs then
			procced = buff_extension:has_buff_perk("no_push_fatigue_cost")
		end

		if not procced then
			local cost = "action_push"

			if new_action.fatigue_cost then
				cost = new_action.fatigue_cost
			end

			if buff_extension:has_buff_perk("slayer_stamina") then
				cost = "action_stun_push"
			end

			status_extension:add_fatigue_points(cost)
			status_extension:set_has_pushed(new_action.fatigue_regen_delay)
		end

		self._fatigue_reset = false
	end
end

ActionBase._proc_spell_used = function (self, buff_extension)
	local current_action = self.current_action

	if buff_extension and current_action and current_action.is_spell then
		buff_extension:trigger_procs("on_spell_used", current_action)
	end
end

ActionBase._play_additional_animation = function (self, anim_data)
	if anim_data and anim_data.variable_name and anim_data.variable_value then
		if anim_data.third_person then
			local unit = self.owner_unit

			if unit then
				if anim_data.anim_event then
					CharacterStateHelper.play_animation_event_with_variable_float(unit, anim_data.anim_event, anim_data.variable_name, anim_data.variable_value)
				else
					CharacterStateHelper.set_animation_variable_float(unit, anim_data.variable_name, anim_data.variable_value)
				end
			end
		end

		if anim_data.first_person then
			local unit = self.first_person_unit

			if unit then
				local variable_index = Unit.animation_find_variable(unit, anim_data.variable_name)

				Unit.animation_set_variable(unit, variable_index, anim_data.variable_value)

				if anim_data.anim_event then
					Unit.animation_event(unit, anim_data.anim_event)
				end
			end
		end
	end
end

ActionBase.finish = function (self, reason)
	return
end

return
