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

ActionBase.finish = function (self, reason)
	return
end

return
