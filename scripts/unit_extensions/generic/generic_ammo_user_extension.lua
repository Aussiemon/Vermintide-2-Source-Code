script_data.infinite_ammo = script_data.infinite_ammo or Development.parameter("infinite_ammo")
GenericAmmoUserExtension = class(GenericAmmoUserExtension)

GenericAmmoUserExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	self.item_name = extension_init_data.item_name
	self._is_server = Managers.player.is_server
	local ammo_percent = extension_init_data.ammo_percent or 1
	local ammo_data = extension_init_data.ammo_data
	self._reload_time = ammo_data.reload_time
	self._override_reload_time = nil
	self._override_reload_anim = nil
	self._single_clip = ammo_data.single_clip
	self._max_ammo = ammo_data.max_ammo
	self._start_ammo = math.round(ammo_percent * self._max_ammo)
	self._ammo_per_clip = ammo_data.ammo_per_clip or self._max_ammo
	self._ammo_per_reload = ammo_data.ammo_per_reload
	self._current_ammo = 0
	self._original_max_ammo = self._max_ammo
	self._original_ammo_percent = ammo_percent
	self._original_ammo_per_clip = self._ammo_per_clip
	self._ammo_immediately_available = ammo_data.ammo_immediately_available or false
	self._reload_on_ammo_pickup = ammo_data.reload_on_ammo_pickup or false
	self._play_reload_anim_on_wield_reload = ammo_data.play_reload_anim_on_wield_reload
	self._has_wield_reload_anim = ammo_data.has_wield_reload_anim
	self._destroy_when_out_of_ammo = ammo_data.destroy_when_out_of_ammo
	self._unwield_when_out_of_ammo = ammo_data.unwield_when_out_of_ammo
	self._ammo_type = ammo_data.ammo_type or "default"
	self._ammo_kind = ammo_data.ammo_kind or "default"
	self._play_reload_animation = true
	self._reload_event = extension_init_data.reload_event
	self.pickup_reload_event_1p = extension_init_data.pickup_reload_event_1p
	self._last_reload_event = extension_init_data.last_reload_event or self._reload_event
	self._no_ammo_reload_event = extension_init_data.no_ammo_reload_event
	self.slot_name = extension_init_data.slot_name

	if ScriptUnit.has_extension(self.owner_unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
		self.first_person_extension = first_person_extension
		self.first_person_unit = first_person_extension:get_first_person_unit()
	end

	self._should_update_anim_ammo = self.first_person_unit and ammo_data.should_update_anim_ammo

	if self._should_update_anim_ammo then
		self._anim_ammo_variable_id = Unit.animation_find_variable(self.first_person_unit, "ammo_count")
	end
end

GenericAmmoUserExtension.extensions_ready = function (self, world, unit)
	self:apply_buffs()
	self:_update_anim_ammo()
end

GenericAmmoUserExtension.apply_buffs = function (self)
	if self.slot_name == "slot_ranged" or self.slot_name == "slot_career_skill_weapon" then
		self:_apply_buffs()
	end

	self:reset()
end

GenericAmmoUserExtension._apply_buffs = function (self)
	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")
	self.owner_buff_extension = buff_extension
	self._ammo_per_clip = math.ceil(buff_extension:apply_buffs_to_value(self._original_ammo_per_clip, "clip_size"))
	self._max_ammo = math.ceil(buff_extension:apply_buffs_to_value(self._original_max_ammo, "total_ammo"))
	self._start_ammo = math.round(self._original_ammo_percent * self._max_ammo)
end

GenericAmmoUserExtension.refresh_buffs = function (self)
	local ammo_percent = self:total_ammo_fraction()

	self:_apply_buffs()

	local max_available_ammo = self._start_ammo - self._current_ammo
	local available_ammo = self._available_ammo or math.huge
	self._available_ammo = math.min(max_available_ammo, available_ammo)

	if ammo_percent == 1 then
		self:reset()
	end
end

GenericAmmoUserExtension.destroy = function (self)
	return
end

GenericAmmoUserExtension.reset = function (self)
	if self._ammo_immediately_available then
		self._current_ammo = self._start_ammo
	else
		self._current_ammo = math.min(self._ammo_per_clip, self._start_ammo)
	end

	self._available_ammo = self._start_ammo - self._current_ammo
	self._shots_fired = 0

	self:_update_anim_ammo()
end

GenericAmmoUserExtension.update = function (self, unit, input, dt, context, t)
	local player_manager = Managers.player
	local owner_player = player_manager:owner(self.owner_unit)

	if self._queued_reload then
		if self:can_reload() then
			self:start_reload(true)
		end

		self._queued_reload = false
	end

	if self._shots_fired > 0 then
		self._current_ammo = self._current_ammo - self._shots_fired
		self._shots_fired = 0

		fassert(self._current_ammo >= 0)

		if self._current_ammo == 0 then
			if not owner_player or not owner_player.bot_player then
				Unit.flow_event(unit, "used_last_ammo_clip")
			end

			if self._available_ammo == 0 then
				if self._destroy_when_out_of_ammo then
					local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")
					local status_extension = ScriptUnit.has_extension(self.owner_unit, "status_system")

					inventory_extension:destroy_slot(self.slot_name, false, true)

					local grabbed_by_packmaster = status_extension and CharacterStateHelper.pack_master_status(status_extension)

					if not grabbed_by_packmaster then
						inventory_extension:wield_previous_weapon()
					end
				elseif self._unwield_when_out_of_ammo then
					local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

					inventory_extension:wield_previous_weapon()
				else
					local player = Managers.player:unit_owner(self.owner_unit)
					local item_name = self.item_name
					local position = POSITION_LOOKUP[self.owner_unit]

					Managers.telemetry.events:player_ammo_depleted(player, item_name, position)
				end

				Unit.flow_event(unit, "used_last_ammo")
			end
		end
	end

	if self._next_reload_time and self._next_reload_time < t then
		if not self._start_reloading then
			local buff_extension = self.owner_buff_extension
			local missing_in_clip = self._ammo_per_clip - self._current_ammo
			local reload_amount = (self._ammo_per_reload and self._ammo_per_reload <= missing_in_clip and self._ammo_per_reload) or missing_in_clip
			reload_amount = math.min(reload_amount, self._available_ammo)
			self._current_ammo = self._current_ammo + reload_amount

			if buff_extension then
				local no_ammo_consumed = buff_extension:has_buff_type("no_ammo_consumed")
				local markus_huntsman_ability = buff_extension:has_buff_type("markus_huntsman_activated_ability") or buff_extension:has_buff_type("markus_huntsman_activated_ability_duration")
				local twitch_no_ammo_reloads = buff_extension:has_buff_type("twitch_no_overcharge_no_ammo_reloads")

				if not no_ammo_consumed and not markus_huntsman_ability and not twitch_no_ammo_reloads then
					self._available_ammo = self._available_ammo - reload_amount
				end

				buff_extension:trigger_procs("on_reload")
				self:_update_anim_ammo()
			end

			if not LEVEL_EDITOR_TEST and not self._is_server then
				local peer_id = owner_player:network_id()
				local local_player_id = owner_player:local_player_id()
				local event_id = NetworkLookup.proc_events.on_reload

				Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
			end
		end

		self._start_reloading = nil
		local num_missing = self._ammo_per_clip - self._current_ammo

		if num_missing > 0 and self._available_ammo > 0 then
			local reload_time = self._override_reload_time or self._reload_time
			self._override_reload_time = nil
			local unmodded_reload_time = reload_time

			if self.owner_buff_extension then
				reload_time = self.owner_buff_extension:apply_buffs_to_value(reload_time, "reload_speed")
			end

			self._next_reload_time = t + reload_time

			if self._play_reload_animation then
				Unit.set_flow_variable(self.unit, "wwise_reload_speed", unmodded_reload_time / reload_time)
				self:start_reload_animation(reload_time)

				if not owner_player.bot_player then
					Managers.state.controller_features:add_effect("rumble", {
						rumble_effect = "reload_start"
					})
				end
			end
		else
			self._next_reload_time = nil

			if not owner_player.bot_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "reload_over"
				})
			end
		end
	end
end

GenericAmmoUserExtension.start_reload_animation = function (self, reload_time)
	if self.pickup_reload_event_1p then
		local pickup_reload_event_1p = self.pickup_reload_event_1p

		if self.first_person_extension then
			local first_person_extension = self.first_person_extension

			first_person_extension:animation_event(pickup_reload_event_1p)
		end
	end

	local reload_event = self._reload_event
	local num_missing = self._ammo_per_clip - self._current_ammo

	if self.reloaded_from_zero_ammo then
		self.reloaded_from_zero_ammo = nil

		if self._no_ammo_reload_event then
			reload_event = self._no_ammo_reload_event
		end
	elseif num_missing == 1 or self._available_ammo == 1 then
		reload_event = self._last_reload_event
	end

	reload_event = self._override_reload_anim or reload_event
	self._override_reload_anim = nil

	if reload_event then
		if self.first_person_extension then
			local first_person_extension = self.first_person_extension

			first_person_extension:animation_set_variable("reload_time", reload_time)
			first_person_extension:animation_event(reload_event)
		end

		local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
		local event_id = NetworkLookup.anims[reload_event]

		if not LEVEL_EDITOR_TEST then
			if self._is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end
	end
end

GenericAmmoUserExtension.remove_ammo = function (self, amount)
	if self._available_ammo == 0 and self._current_ammo == 0 then
		return
	end

	local floored_ammo = math.floor(math.clamp(self._available_ammo - amount, 0, self._max_ammo))
	self._available_ammo = floored_ammo
end

GenericAmmoUserExtension.add_ammo = function (self, amount)
	if self._destroy_when_out_of_ammo then
		return
	end

	if self._available_ammo == 0 and self._current_ammo == 0 then
		self.reloaded_from_zero_ammo = true
		local player = Managers.player:unit_owner(self.owner_unit)
		local item_name = self.item_name
		local position = POSITION_LOOKUP[self.owner_unit]

		Managers.telemetry.events:player_ammo_refilled(player, item_name, position)

		local buff_extension = self.owner_buff_extension

		if buff_extension then
			buff_extension:trigger_procs("on_gained_ammo_from_no_ammo")

			if not LEVEL_EDITOR_TEST and not self._is_server then
				local player_manager = Managers.player
				local owner_player = player_manager:owner(self.owner_unit)
				local peer_id = owner_player:network_id()
				local local_player_id = owner_player:local_player_id()
				local event_id = NetworkLookup.proc_events.on_gained_ammo_from_no_ammo

				Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
			end
		end
	end

	local floored_ammo = nil

	if amount and self._ammo_immediately_available then
		floored_ammo = math.floor(math.clamp(self._current_ammo + amount, 0, self._max_ammo))
		self._current_ammo = floored_ammo
	elseif amount then
		floored_ammo = math.floor(math.clamp(self._available_ammo + amount, 0, self._max_ammo - (self._current_ammo - self._shots_fired)))
		self._available_ammo = floored_ammo
	elseif self._ammo_immediately_available then
		self._current_ammo = self._max_ammo
	else
		self._available_ammo = self._max_ammo - (self._current_ammo - self._shots_fired)
	end

	self:_update_anim_ammo()
end

GenericAmmoUserExtension.add_ammo_to_reserve = function (self, amount)
	local prev_available_ammo = self._available_ammo

	if self._ammo_immediately_available then
		self._current_ammo = math.min(self._max_ammo, self._current_ammo + amount)
	else
		local ammo_count = self:ammo_count()
		self._available_ammo = math.min(self._max_ammo - ammo_count, self._available_ammo + amount)
	end

	local buff_extension = self.owner_buff_extension

	buff_extension:trigger_procs("on_gained_ammo_from_no_ammo")

	if not LEVEL_EDITOR_TEST and not self._is_server then
		local player_manager = Managers.player
		local owner_player = player_manager:owner(self.owner_unit)
		local peer_id = owner_player:network_id()
		local local_player_id = owner_player:local_player_id()
		local event_id = NetworkLookup.proc_events.on_gained_ammo_from_no_ammo

		Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
	end

	if prev_available_ammo == 0 and self._current_ammo == 0 and self:can_reload() then
		self._queued_reload = true
	end

	self:_update_anim_ammo()
end

GenericAmmoUserExtension.use_ammo = function (self, ammo_used)
	if not self._destroy_when_out_of_ammo and script_data.infinite_ammo then
		ammo_used = 0
	end

	local buff_extension = self.owner_buff_extension
	local infinite_ammo = false

	if buff_extension then
		infinite_ammo = buff_extension:has_buff_perk("infinite_ammo")
	end

	if infinite_ammo then
		ammo_used = 0
	end

	self._shots_fired = self._shots_fired + ammo_used

	if buff_extension then
		buff_extension:trigger_procs("on_ammo_used")
		Managers.state.achievement:trigger_event("ammo_used", self.owner_unit)

		if self:total_remaining_ammo() == 0 then
			buff_extension:trigger_procs("on_last_ammo_used")
		end

		if not LEVEL_EDITOR_TEST and not self._is_server then
			local player_manager = Managers.player
			local owner_player = player_manager:owner(self.owner_unit)
			local peer_id = owner_player:network_id()
			local local_player_id = owner_player:local_player_id()
			local event_id = NetworkLookup.proc_events.on_ammo_used

			Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)

			if self:total_remaining_ammo() == 0 then
				event_id = NetworkLookup.proc_events.on_last_ammo_used

				Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
			end
		end
	end

	self:_update_anim_ammo()
	fassert(self:ammo_count() >= 0, "ammo went below 0")
end

GenericAmmoUserExtension.start_reload = function (self, play_reload_animation, override_reload_time, override_reload_anim)
	fassert(self:can_reload(), "Tried to start reloading without being able to reload")
	fassert(self._next_reload_time == nil, "next_reload_time is nil")

	self._override_reload_time = override_reload_time
	self._start_reloading = true
	self._next_reload_time = 0
	self._play_reload_animation = play_reload_animation
	self._override_reload_anim = override_reload_anim
	local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()
	event_data.item_name = self.item_name or "UNKNOWN ITEM"
	local event_name = "reload_started"

	dialogue_input:trigger_dialogue_event(event_name, event_data)
end

GenericAmmoUserExtension.abort_reload = function (self)
	fassert(self:is_reloading(), "Tried to abort reload while reloading")

	self._start_reloading = nil
	self._next_reload_time = nil

	Unit.flow_event(self.unit, "stop_reload_sound")

	if self.first_person_extension then
		local first_person_extension = self.first_person_extension

		first_person_extension:show_first_person_ammo(false)
	end
end

GenericAmmoUserExtension.ammo_count = function (self)
	return self._current_ammo - self._shots_fired
end

GenericAmmoUserExtension.clip_size = function (self)
	return self._ammo_per_clip
end

GenericAmmoUserExtension.clip_full = function (self)
	return self:ammo_count() == self._ammo_per_clip
end

GenericAmmoUserExtension.remaining_ammo = function (self)
	return self._available_ammo
end

GenericAmmoUserExtension.ammo_available_immediately = function (self)
	return self._ammo_immediately_available
end

GenericAmmoUserExtension.can_reload = function (self)
	if self:is_reloading() then
		return false
	end

	if self:clip_full() then
		return false
	end

	if script_data.infinite_ammo then
		return true
	end

	return self._available_ammo > 0
end

GenericAmmoUserExtension.total_remaining_ammo = function (self)
	return self:remaining_ammo() + self:ammo_count()
end

GenericAmmoUserExtension.total_ammo_fraction = function (self)
	return (self:remaining_ammo() + self:ammo_count()) / self:max_ammo()
end

GenericAmmoUserExtension.max_ammo = function (self)
	return self._max_ammo
end

GenericAmmoUserExtension.current_ammo = function (self)
	return self._current_ammo
end

GenericAmmoUserExtension.is_reloading = function (self)
	return self._next_reload_time ~= nil
end

GenericAmmoUserExtension.full_ammo = function (self)
	return self:remaining_ammo() + self:ammo_count() == self:max_ammo()
end

GenericAmmoUserExtension.using_single_clip = function (self)
	return self._single_clip
end

GenericAmmoUserExtension.reload_on_ammo_pickup = function (self)
	return self._reload_on_ammo_pickup
end

GenericAmmoUserExtension.play_reload_anim_on_wield_reload = function (self)
	return self._play_reload_anim_on_wield_reload
end

GenericAmmoUserExtension.has_wield_reload_anim = function (self)
	return self._has_wield_reload_anim
end

GenericAmmoUserExtension.ammo_type = function (self)
	return self._ammo_type
end

GenericAmmoUserExtension.ammo_kind = function (self)
	return self._ammo_kind
end

GenericAmmoUserExtension.instant_reload = function (self, bonus_ammo, reload_anim_event)
	if not bonus_ammo then
		local reload_amount = self._ammo_per_clip - self._current_ammo
		reload_amount = math.min(reload_amount, self._available_ammo)
		self._current_ammo = self._current_ammo + reload_amount
		self._available_ammo = self._available_ammo - reload_amount
		self._shots_fired = 0
	else
		self._current_ammo = self._ammo_per_clip
		self._shots_fired = 0
	end

	if reload_anim_event then
		if self.first_person_extension then
			local first_person_extension = self.first_person_extension

			first_person_extension:animation_set_variable("reload_time", math.huge)
			first_person_extension:animation_event(reload_anim_event)
		end

		if not LEVEL_EDITOR_TEST then
			local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
			local event_id = NetworkLookup.anims[reload_anim_event]

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end
	end

	self:_update_anim_ammo()
end

GenericAmmoUserExtension._update_anim_ammo = function (self)
	if not self._should_update_anim_ammo then
		return
	end

	Unit.animation_set_variable(self.first_person_unit, self._anim_ammo_variable_id, self._current_ammo - self._shots_fired)
end

return
