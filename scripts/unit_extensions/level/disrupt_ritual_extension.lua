DisruptRitualExtension = class(DisruptRitualExtension)
local RPCS = {
	"rpc_client_disrupt_ritual_update"
}

DisruptRitualExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._network_transmit = extension_init_context.network_transmit
	self._network_event_delegate = extension_init_context.network_transmit.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._event_manager = Managers.state.event

	Managers.state.event:register(self, "start_disrupt_ritual", "start_disrupt_ritual")
	Managers.state.event:register(self, "player_party_changed", "player_party_changed")

	self._volume_system = Managers.state.entity:system("volume_system")
	self._tutorial_system = Managers.state.entity:system("tutorial_system")
	self._ritual_system = Managers.state.entity:system("disrupt_ritual_system")
	self._health_extension = ScriptUnit.extension(unit, "health_system")
	self._level = LevelHelper:current_level(extension_init_context.world)
	self._is_server = extension_init_context.is_server
	self._unit = unit
	self._next_tick = 0
end

DisruptRitualExtension.start_disrupt_ritual = function (self, unit, volume_name, sub_type, num_progression_events, tick_length, damage_per_tick, heal_per_tick)
	if unit ~= self._unit then
		return
	end

	self._active = true
	self._volume_name = volume_name
	local max_damage = Unit.get_data(self._unit, "health")
	self._max_damage = max_damage

	self._health_extension:set_current_damage(self._max_damage)

	self._current_damage = 0

	self._event_manager:trigger("tutorial_event_show_health_bar", self._unit, true)

	if not self._is_server then
		return
	end

	sub_type = sub_type or "any_alive_players_inside"

	if sub_type == "all_alive_players_inside" then
		self._condition_func = self._volume_system.all_alive_human_players_inside
		sub_type = "all_alive_players_inside"
	elseif sub_type == "any_alive_players_inside" then
		self._condition_func = self._volume_system.any_alive_human_players_inside
		sub_type = "players_inside"
	else
		fassert(false, "disrupt ritual has to be of type 'all_alive_players_inside' or 'any_alive_players_inside' ")
	end

	self._tick_length = tick_length
	self._num_progression_events = num_progression_events
	self._damage_per_tick = damage_per_tick
	self._heal_per_tick = heal_per_tick
	self._active = true

	self._volume_system:register_volume(volume_name, "trigger_volume", {
		sub_type = sub_type
	})

	local checkpoints = {}

	for i = 0, 100 do
		local checkpoint = Unit.get_data(self._unit, "checkpoints", i)

		if not checkpoint then
			break
		end

		if checkpoint ~= 0 then
			checkpoints[#checkpoints + 1] = checkpoint
		end
	end

	self._checkpoints = checkpoints
	self._num_checkpoints = #checkpoints
	local progression_event_thresholds = {
		[1.0] = 0,
		[num_progression_events] = max_damage
	}
	local progression_step = max_damage / num_progression_events

	for i = 2, num_progression_events - 1 do
		progression_event_thresholds[i] = progression_step * i
	end

	self._progression_event_thresholds = progression_event_thresholds
	self._num_progression_events = num_progression_events
end

DisruptRitualExtension.update = function (self, t)
	if not self._active or t < self._next_tick then
		return
	end

	self._next_tick = t + self._tick_length
	local current_damage = self._current_damage
	local checkpoints = self._checkpoints
	local current_checkpoint = self._current_checkpoint or 0
	local current_progression_event = self._current_progression_event or 0

	if self._condition_func(self._volume_system, self._volume_name) then
		self:server_apply_damage(current_damage, checkpoints, current_checkpoint, self._num_checkpoints)
	else
		self:server_heal(current_damage, checkpoints, current_checkpoint)
	end

	current_damage = self._current_damage

	self._health_extension:set_current_damage(self._max_damage - current_damage)
	self:server_update_progression_status(self._progression_event_thresholds, current_progression_event, self._num_progression_events, current_damage)
	self:print_damage(current_damage)
	self:server_send_rpc_update_clients(current_damage, self._current_checkpoint or 0, self._current_progression_event, self._volume_name)
end

DisruptRitualExtension.server_heal = function (self, current_damage, checkpoints, current_checkpoint)
	if self._increasing_damage then
		self:fire_flow_event("decreased", "damage")

		self._increasing_damage = false
	end

	local checkpoint_threshold = 0
	local updated_damage = current_damage - self._heal_per_tick

	if current_checkpoint > 0 then
		checkpoint_threshold = checkpoints[current_checkpoint]
	end

	if updated_damage < checkpoint_threshold then
		return
	end

	self._current_damage = updated_damage
end

DisruptRitualExtension.server_apply_damage = function (self, current_damage, checkpoints, current_checkpoint, num_checkpoints)
	if not self._increasing_damage then
		self:fire_flow_event("increased", "damage")

		self._increasing_damage = true
	end

	self._current_damage = current_damage + self._damage_per_tick

	if self._max_damage <= self._current_damage then
		self._tutorial_system:flow_callback_show_health_bar(self._unit, false)

		self._active = false
	end

	if current_checkpoint == num_checkpoints then
		return
	end

	local next_checkpoint = current_checkpoint + 1

	if checkpoints[next_checkpoint] <= self._current_damage then
		self._current_checkpoint = next_checkpoint

		self:fire_flow_event(next_checkpoint, "checkpoint")
		self:print_checkpoint(next_checkpoint)
	end
end

DisruptRitualExtension.server_update_progression_status = function (self, progression_event_thresholds, current_progression_event, num_progression_events, current_damage)
	local next_threshold = progression_event_thresholds[current_progression_event + 1]
	local reached_threshold = nil

	if next_threshold then
		reached_threshold = next_threshold <= current_damage
	end

	local new_event = nil

	if reached_threshold then
		new_event = current_progression_event + 1
	end

	if not new_event then
		return
	end

	self._current_progression_event = new_event

	self:fire_flow_event(new_event, "progression")
	self:print_progression_event(new_event)
end

DisruptRitualExtension.server_send_rpc_update_clients = function (self, damage, checkpoint, progression_event, volume_name)
	self._network_transmit:send_rpc_clients("rpc_client_disrupt_ritual_update", damage, checkpoint, progression_event, volume_name)
end

DisruptRitualExtension.rpc_client_disrupt_ritual_update = function (self, sender, damage, checkpoint, progression_event, volume_name)
	if not self._active or self._volume_name ~= volume_name then
		return
	end

	if self._current_damage < damage and not self._increasing_damage then
		self:fire_flow_event("increased", "damage")

		self._increasing_damage = true
	elseif damage < self._current_damage and self._increasing_damage then
		self:fire_flow_event("decreased", "damage")

		self._increasing_damage = false
	end

	self._current_damage = damage

	self._health_extension:set_current_damage(self._max_damage - damage)

	if self._current_checkpoint ~= checkpoint and checkpoint ~= 0 then
		self._current_checkpoint = checkpoint

		self:fire_flow_event(checkpoint, "checkpoint")
		self:print_checkpoint(checkpoint)
	end

	if self._current_progression_event ~= progression_event then
		self._current_progression_event = progression_event

		self:fire_flow_event(progression_event, "progression")
		self:print_progression_event(progression_event)
	end

	if self._max_damage <= damage then
		self._event_manager:trigger("tutorial_event_show_health_bar", self._unit, false)

		self._active = false
	end
end

DisruptRitualExtension.player_party_changed = function (self)
	if self._active then
		Unit.flow_event(self._unit, "show_health_bar")
	end
end

DisruptRitualExtension.fire_flow_event = function (self, event_id, event_type)
	local event_name = self._volume_name .. "_" .. event_type .. "_" .. event_id

	Level.trigger_event(self._level, event_name)
end

DisruptRitualExtension.print_damage = function (self, damage)
	print("Disrupt Ritual ", self._volume_name, " current damage: ", damage)
end

DisruptRitualExtension.print_progression_event = function (self, new_event)
	print(self._volume_name, ": Disrupt Ritual progress updated. Current progression event: ", new_event)
end

DisruptRitualExtension.print_checkpoint = function (self, checkpoint)
	print(self._volume_name, ": Disrupt Ritual checkpoint updated. Current checkpoint: ", checkpoint)
end

DisruptRitualExtension.destroy = function (self)
	self._network_event_delegate:unregister(self)
end
