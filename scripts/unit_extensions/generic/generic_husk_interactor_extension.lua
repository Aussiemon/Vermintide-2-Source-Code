-- chunkname: @scripts/unit_extensions/generic/generic_husk_interactor_extension.lua

GenericHuskInteractorExtension = class(GenericHuskInteractorExtension)

GenericHuskInteractorExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.state = "waiting_to_interact"
	self.interaction_context = {
		data = {
			is_husk = true,
			dice_keeper = extension_init_context.dice_keeper,
			statistics_db = extension_init_context.statistics_db,
		},
	}
	self.is_server = Managers.player.is_server

	self.interactable_unit_destroy_callback = function (destroyed_interactable_unit)
		local t = Managers.time:time("game")

		self:_stop_interaction(destroyed_interactable_unit, t)
	end
end

GenericHuskInteractorExtension.game_object_unit_destroyed = function (self)
	if Managers.state.network:game() and self.is_server then
		local interaction_context = self.interaction_context
		local interactable_unit = interaction_context.interactable_unit

		if Unit.alive(interactable_unit) and self.state == "doing_interaction" then
			InteractionHelper.printf("[GenericHuskInteractorExtension] stopping due to game_object_unit_destroyed")

			local t = Managers.time:time("game")

			InteractionHelper:complete_interaction(self.unit, interactable_unit, InteractionResult.FAILURE)
			self:stop_interaction(t)
		end
	end
end

GenericHuskInteractorExtension.destroy = function (self)
	local interaction_context = self.interaction_context
	local interactable_unit = interaction_context.interactable_unit

	if Unit.alive(interactable_unit) then
		Managers.state.unit_spawner:remove_destroy_listener(interactable_unit, "interactable_unit_for_husk")
	end
end

GenericHuskInteractorExtension.update = function (self, unit, input, dt, context, t)
	local world = self.world
	local interaction_context = self.interaction_context
	local interactable_unit = interaction_context.interactable_unit
	local interaction_data = interaction_context.data

	interaction_data.is_server = self.is_server

	local interaction_type = interaction_context.interaction_type
	local interaction_template = InteractionDefinitions[interaction_type]
	local interaction_config = interaction_template and interaction_template.config or nil

	if self.state == "starting_interaction" then
		interaction_template.client.start(world, unit, interactable_unit, interaction_data, interaction_config, t)

		if self.is_server then
			interaction_template.server.start(world, unit, interactable_unit, interaction_data, interaction_config, t)
		end

		interaction_context.previous_state = self.state
		self.state = "doing_interaction"
	end

	if self.state == "doing_interaction" then
		interaction_template.client.update(world, unit, interactable_unit, interaction_data, interaction_config, dt, t)

		if self.is_server then
			local interaction_result = interaction_template.server.update(world, unit, interactable_unit, interaction_data, interaction_config, dt, t)

			interaction_context.result = interaction_result

			if interaction_result ~= InteractionResult.ONGOING then
				InteractionHelper:complete_interaction(unit, interactable_unit, interaction_result)
				self:stop_interaction(t)
			end
		end
	end
end

GenericHuskInteractorExtension._stop_interaction = function (self, interactable_unit, t)
	local world = self.world
	local unit = self.unit
	local interaction_context = self.interaction_context
	local interaction_data = interaction_context.data

	interaction_data.is_server = self.is_server

	local interaction_type = interaction_context.interaction_type
	local interaction_template = InteractionDefinitions[interaction_type]
	local interaction_config = interaction_template and interaction_template.config or nil
	local go_id, is_level_unit = Managers.state.network:game_object_or_level_id(interactable_unit)

	if not is_level_unit and go_id == nil then
		InteractionHelper.printf("[GenericUnitInteractorExtension] game object doesnt exist, changing result from %s to %s", InteractionResult[interaction_context.result], InteractionResult[InteractionResult.FAILURE])

		interaction_context.result = InteractionResult.FAILURE
	end

	local interaction_result = interaction_context.result

	if interaction_result == InteractionResult.ONGOING or interaction_result == nil then
		interaction_result = InteractionResult.FAILURE
		interaction_context.result = interaction_result
	end

	InteractionHelper.printf("[GenericHuskInteractorExtension] Stopping interaction %s with result %s", interaction_type, InteractionResult[interaction_result])
	interaction_template.client.stop(world, unit, interactable_unit, interaction_data, interaction_config, t, interaction_result)

	if self.is_server then
		interaction_template.server.stop(world, unit, interactable_unit, interaction_data, interaction_config, t, interaction_result)
	end

	interaction_context.previous_state = self.state
	self.state = "waiting_to_interact"
end

GenericHuskInteractorExtension.stop_interaction = function (self, t)
	local interaction_context = self.interaction_context
	local interactable_unit = interaction_context.interactable_unit

	self:_stop_interaction(interactable_unit, t)
	Managers.state.unit_spawner:remove_destroy_listener(interactable_unit, "interactable_unit_for_husk")
end

GenericHuskInteractorExtension.is_interacting = function (self)
	local interaction_context = self.interaction_context
	local interaction_type = interaction_context.interaction_type

	return self.state ~= "waiting_to_interact", interaction_type
end

GenericHuskInteractorExtension.is_stopping = function (self)
	return self.state == "stopping_interaction"
end

GenericHuskInteractorExtension.interactable_unit = function (self)
	assert(self:is_interacting(), "Attempted to get interactable unit when interactor unit wasn't interacting.")

	return self.interaction_context.interactable_unit
end

GenericHuskInteractorExtension.hot_join_sync = function (self, peer_id)
	if not self:is_interacting() then
		return
	end

	local network_manager = Managers.state.network
	local context = self.interaction_context
	local state_id = NetworkLookup.interaction_states[self.state]
	local interaction_type_id = NetworkLookup.interactions[context.interaction_type]
	local interactable_unit_id, is_level_unit = network_manager:game_object_or_level_id(context.interactable_unit)
	local data = context.data
	local start_time = data.start_time
	local duration = data.duration or 0
	local unit_id = network_manager:unit_game_object_id(self.unit)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	RPC.rpc_sync_interaction_state(channel_id, unit_id, state_id, interaction_type_id, interactable_unit_id, start_time, duration, is_level_unit)
end

GenericHuskInteractorExtension.set_interaction_context = function (self, state, interaction_type, interactable_unit, start_time, duration)
	InteractionHelper.printf("[GenericHuskInteractorExtension] set_interaction_context %s %s %s", state, interaction_type, tostring(interactable_unit))

	self.interaction_context.previous_state = self.state
	self.state = state
	self.interaction_context.data.start_time = start_time
	self.interaction_context.data.duration = duration
	self.interaction_context.interactable_unit = interactable_unit
	self.interaction_context.interaction_type = interaction_type
	self.interaction_context.result = InteractionResult.ONGOING

	local interactable_extension = ScriptUnit.extension(interactable_unit, "interactable_system")

	interactable_extension:set_is_being_interacted_with(self.unit)
end

GenericHuskInteractorExtension.interaction_approved = function (self, interaction_type, interactable_unit)
	if not Unit.alive(interactable_unit) then
		InteractionHelper.printf("[GenericHuskInteractorExtension] interaction_approved interactable_unit no longer alive interaction_type:%s", interaction_type)

		return
	end

	InteractionHelper.printf("[GenericHuskInteractorExtension] interaction_approved %s %s", interaction_type, tostring(interactable_unit))

	self.interaction_context.previous_state = self.state
	self.state = "starting_interaction"

	local interaction_context = self.interaction_context

	interaction_context.interaction_type = interaction_type
	interaction_context.interactable_unit = interactable_unit
	interaction_context.result = InteractionResult.ONGOING

	local interaction_data = interaction_context.data
	local interaction_template = InteractionDefinitions[interaction_type]
	local interaction_config = interaction_template.config

	interaction_data.duration = interaction_config.duration
	interaction_data.start_time = Managers.time:time("game")

	Managers.state.unit_spawner:add_destroy_listener(interactable_unit, "interactable_unit_for_husk", self.interactable_unit_destroy_callback)
end

GenericHuskInteractorExtension.interaction_completed = function (self, interaction_result)
	local state = self.state

	InteractionHelper.printf("[GenericHuskInteractorExtension] interaction_completed during state %s with result %s", state, InteractionResult[interaction_result])
	assert(state ~= "waiting_to_interact", "Was in wrong state when getting interaction completed.")

	self.interaction_context.result = interaction_result

	local t = Managers.time:time("game")

	self:stop_interaction(t)
end
