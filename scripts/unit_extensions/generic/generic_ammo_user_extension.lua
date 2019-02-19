script_data.infinite_ammo = script_data.infinite_ammo or Development.parameter("infinite_ammo")
GenericAmmoUserExtension = class(GenericAmmoUserExtension)

GenericAmmoUserExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit
	self.item_name = extension_init_data.item_name
	local ammo_percent = extension_init_data.ammo_percent or 1
	local ammo_data = extension_init_data.ammo_data
	self.reload_time = ammo_data.reload_time
	self.override_reload_time = nil
	self.single_clip = ammo_data.single_clip
	self.max_ammo = ammo_data.max_ammo
	self.start_ammo = math.floor(ammo_percent * self.max_ammo)
	self.ammo_per_clip = ammo_data.ammo_per_clip or self.max_ammo
	self.ammo_per_reload = ammo_data.ammo_per_reload
	self.original_max_ammo = self.max_ammo
	self.original_start_ammo = self.start_ammo
	self.original_ammo_per_clip = self.ammo_per_clip
	self.ammo_immediately_available = ammo_data.ammo_immediately_available or false
	self.reload_on_ammo_pickup = ammo_data.reload_on_ammo_pickup or false
	self.play_reload_anim_on_wield_reload = ammo_data.play_reload_anim_on_wield_reload
	self.destroy_when_out_of_ammo = ammo_data.destroy_when_out_of_ammo
	self.unwield_when_out_of_ammo = ammo_data.unwield_when_out_of_ammo
	self.play_reload_animation = true
	self.reload_event = extension_init_data.reload_event
	self.last_reload_event = extension_init_data.last_reload_event or self.reload_event
	self.no_ammo_reload_event = extension_init_data.no_ammo_reload_event
	self.slot_name = extension_init_data.slot_name

	if ScriptUnit.has_extension(self.owner_unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
		self.first_person_extension = first_person_extension
	end
end

GenericAmmoUserExtension.extensions_ready = function (self, world, unit)
	self:apply_buffs()
end

GenericAmmoUserExtension.apply_buffs = function (self)
	if self.slot_name == "slot_ranged" or self.slot_name == "slot_career_skill_weapon" then
		local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")
		self.owner_buff_extension = buff_extension
		self.ammo_per_clip = math.ceil(buff_extension:apply_buffs_to_value(self.original_ammo_per_clip, "clip_size"))
		self.max_ammo = math.ceil(buff_extension:apply_buffs_to_value(self.original_max_ammo, "total_ammo"))
		self.start_ammo = math.ceil(buff_extension:apply_buffs_to_value(self.original_start_ammo, "total_ammo"))
	end

	self:reset()
end

GenericAmmoUserExtension.destroy = function (self)
	return
end

GenericAmmoUserExtension.reset = function (self)
	if self.ammo_immediately_available then
		self.current_ammo = self.start_ammo
	else
		self.current_ammo = math.min(self.ammo_per_clip, self.start_ammo)
	end

	self.available_ammo = self.start_ammo - self.current_ammo
	self.shots_fired = 0
end

GenericAmmoUserExtension.update = function (self, unit, input, dt, context, t)
	local player_manager = Managers.player
	local owner_player = player_manager:owner(self.owner_unit)

	if self.shots_fired > 0 then
		self.current_ammo = self.current_ammo - self.shots_fired
		self.shots_fired = 0

		assert(self.current_ammo >= 0)

		if self.current_ammo == 0 then
			if not owner_player or not owner_player.bot_player then
				Unit.flow_event(unit, "used_last_ammo_clip")
			end

			if self.available_ammo == 0 then
				if self.destroy_when_out_of_ammo then
					local inventory_extension = ScriptUnit.extension(self.owner_unit, "inventory_system")

					inventory_extension:destroy_slot(self.slot_name)
					inventory_extension:wield_previous_weapon()
				elseif self.unwield_when_out_of_ammo then
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

	if self.next_reload_time and self.next_reload_time < t then
		if not self.start_reloading then
			local buff_extension = self.owner_buff_extension
			local missing_in_clip = self.ammo_per_clip - self.current_ammo
			local reload_amount = (self.ammo_per_reload and self.ammo_per_reload <= missing_in_clip and self.ammo_per_reload) or missing_in_clip
			reload_amount = math.min(reload_amount, self.available_ammo)
			self.current_ammo = self.current_ammo + reload_amount

			if buff_extension then
				local no_ammo_consumed = buff_extension:has_buff_type("no_ammo_consumed")
				local markus_huntsman_ability = buff_extension:has_buff_type("markus_huntsman_activated_ability")
				local twitch_no_ammo_reloads = buff_extension:has_buff_type("twitch_no_overcharge_no_ammo_reloads")

				if not no_ammo_consumed and not markus_huntsman_ability and not twitch_no_ammo_reloads then
					self.available_ammo = self.available_ammo - reload_amount
				end

				buff_extension:trigger_procs("on_reload")
			end

			if not LEVEL_EDITOR_TEST and not player_manager.is_server then
				local peer_id = owner_player:network_id()
				local local_player_id = owner_player:local_player_id()
				local event_id = NetworkLookup.proc_events.on_reload

				Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
			end
		end

		self.start_reloading = nil
		local num_missing = self.ammo_per_clip - self.current_ammo

		if num_missing > 0 and self.available_ammo > 0 then
			local reload_time = self.override_reload_time or self.reload_time
			self.override_reload_time = nil
			local unmodded_reload_time = reload_time

			if self.owner_buff_extension then
				reload_time = self.owner_buff_extension:apply_buffs_to_value(reload_time, "reload_speed")
			end

			self.next_reload_time = t + reload_time

			if self.play_reload_animation then
				Unit.set_flow_variable(self.unit, "wwise_reload_speed", unmodded_reload_time / reload_time)
				self:start_reload_animation(reload_time)

				if not owner_player.bot_player then
					Managers.state.controller_features:add_effect("rumble", {
						rumble_effect = "reload_start"
					})
				end
			end
		else
			self.next_reload_time = nil

			if not owner_player.bot_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "reload_over"
				})
			end
		end
	end
end

GenericAmmoUserExtension.start_reload_animation = function (self, reload_time)
	local reload_event = self.reload_event
	local num_missing = self.ammo_per_clip - self.current_ammo

	if self.reloaded_from_zero_ammo then
		self.reloaded_from_zero_ammo = nil

		if self.no_ammo_reload_event then
			reload_event = self.no_ammo_reload_event
		end
	elseif num_missing == 1 or self.available_ammo == 1 then
		reload_event = self.last_reload_event
	end

	if reload_event then
		if self.first_person_extension then
			local first_person_extension = self.first_person_extension

			first_person_extension:animation_set_variable("reload_time", reload_time)
			first_person_extension:animation_event(reload_event)
		end

		local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
		local event_id = NetworkLookup.anims[reload_event]

		if not LEVEL_EDITOR_TEST then
			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end
	end
end

GenericAmmoUserExtension.add_ammo = function (self, amount)
	if self.destroy_when_out_of_ammo then
		return
	end

	if self.available_ammo == 0 and self.current_ammo == 0 then
		self.reloaded_from_zero_ammo = true
		local player = Managers.player:unit_owner(self.owner_unit)
		local item_name = self.item_name
		local position = POSITION_LOOKUP[self.owner_unit]

		Managers.telemetry.events:player_ammo_refilled(player, item_name, position)

		local buff_extension = self.owner_buff_extension

		buff_extension:trigger_procs("on_gained_ammo_from_no_ammo")

		if not LEVEL_EDITOR_TEST and not Managers.player.is_server then
			local player_manager = Managers.player
			local owner_player = player_manager:owner(self.owner_unit)
			local peer_id = owner_player:network_id()
			local local_player_id = owner_player:local_player_id()
			local event_id = NetworkLookup.proc_events.on_gained_ammo_from_no_ammo

			Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
		end
	end

	local floored_ammo = nil

	if amount and self.ammo_immediately_available then
		floored_ammo = math.floor(math.clamp(self.current_ammo + amount, 0, self.max_ammo))
		self.current_ammo = floored_ammo
	elseif amount then
		floored_ammo = math.floor(math.clamp(self.available_ammo + amount, 0, self.max_ammo - (self.current_ammo - self.shots_fired)))
		self.available_ammo = floored_ammo
	elseif self.ammo_immediately_available then
		self.current_ammo = self.max_ammo
	else
		self.available_ammo = self.max_ammo - (self.current_ammo - self.shots_fired)
	end
end

GenericAmmoUserExtension.add_ammo_to_reserve = function (self, amount)
	if self.ammo_immediately_available then
		self.current_ammo = math.min(self.max_ammo, self.current_ammo + amount)
	else
		local ammo_count = self:ammo_count()
		self.available_ammo = math.min(self.max_ammo - ammo_count, self.available_ammo + amount)
	end

	local buff_extension = self.owner_buff_extension

	buff_extension:trigger_procs("on_gained_ammo_from_no_ammo")
end

GenericAmmoUserExtension.use_ammo = function (self, ammo_used)
	if not self.destroy_when_out_of_ammo and script_data.infinite_ammo then
		ammo_used = 0
	end

	local buff_extension = self.owner_buff_extension
	local infinite_ammo = false

	if buff_extension then
		infinite_ammo = buff_extension:get_non_stacking_buff("victor_bountyhunter_passive_infinite_ammo_buff")
	end

	if infinite_ammo then
		ammo_used = 0
	end

	self.shots_fired = self.shots_fired + ammo_used

	if buff_extension then
		buff_extension:trigger_procs("on_ammo_used")

		if self:total_remaining_ammo() == 0 then
			buff_extension:trigger_procs("on_last_ammo_used")
		end

		if not LEVEL_EDITOR_TEST and not Managers.player.is_server then
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

	assert(self:ammo_count() >= 0, "ammo went below 0")
end

GenericAmmoUserExtension.start_reload = function (self, play_reload_animation, override_reload_time)
	assert(self:can_reload(), "Tried to start reloading without being able to reload")
	assert(self.next_reload_time == nil, "next_reload_time is nil")

	self.override_reload_time = override_reload_time
	self.start_reloading = true
	self.next_reload_time = 0
	self.play_reload_animation = play_reload_animation
	local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()
	event_data.item_name = self.item_name or "UNKNOWN ITEM"
	local event_name = "reload_started"

	dialogue_input:trigger_dialogue_event(event_name, event_data)
end

GenericAmmoUserExtension.abort_reload = function (self)
	assert(self:is_reloading())

	self.start_reloading = nil
	self.next_reload_time = nil

	Unit.flow_event(self.unit, "stop_reload_sound")
end

GenericAmmoUserExtension.ammo_count = function (self)
	return self.current_ammo - self.shots_fired
end

GenericAmmoUserExtension.clip_size = function (self)
	return self.ammo_per_clip
end

GenericAmmoUserExtension.remaining_ammo = function (self)
	return self.available_ammo
end

GenericAmmoUserExtension.ammo_available_immediately = function (self)
	return self.ammo_immediately_available
end

GenericAmmoUserExtension.can_reload = function (self)
	if self:is_reloading() then
		return false
	end

	if self:ammo_count() == self.ammo_per_clip then
		return false
	end

	if script_data.infinite_ammo then
		return true
	end

	return self.available_ammo > 0
end

GenericAmmoUserExtension.total_remaining_ammo = function (self)
	return self:remaining_ammo() + self:ammo_count()
end

GenericAmmoUserExtension.total_ammo_fraction = function (self)
	return (self:remaining_ammo() + self:ammo_count()) / self.max_ammo
end

GenericAmmoUserExtension.get_max_ammo = function (self)
	return self.max_ammo
end

GenericAmmoUserExtension.is_reloading = function (self)
	return self.next_reload_time ~= nil
end

GenericAmmoUserExtension.full_ammo = function (self)
	return self:remaining_ammo() + self:ammo_count() == self.max_ammo
end

GenericAmmoUserExtension.using_single_clip = function (self)
	return self.single_clip
end

GenericAmmoUserExtension.instant_reload = function (self, bonus_ammo, reload_anim_event)
	if not bonus_ammo then
		local reload_amount = self.ammo_per_clip - self.current_ammo
		reload_amount = math.min(reload_amount, self.available_ammo)
		self.current_ammo = self.current_ammo + reload_amount
		self.available_ammo = self.available_ammo - reload_amount
		self.shots_fired = 0
	else
		self.current_ammo = self.ammo_per_clip
		self.shots_fired = 0
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
end

return
