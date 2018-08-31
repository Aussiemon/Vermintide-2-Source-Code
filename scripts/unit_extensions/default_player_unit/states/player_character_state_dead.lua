PlayerCharacterStateDead = class(PlayerCharacterStateDead, PlayerCharacterState)

PlayerCharacterStateDead.init = function (self, character_state_init_context)
	PlayerCharacterState.init(self, character_state_init_context, "dead")
end

PlayerCharacterStateDead.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self.despawn_time_start = t
	self.despawned = false
	self.switched_to_observer_camera = false
	local animation = (params and params.animation) or "death"

	CharacterStateHelper.play_animation_event(self.unit, animation)
	self.locomotion_extension:set_wanted_velocity(Vector3.zero())

	local first_person_extension = self.first_person_extension

	first_person_extension:set_wanted_player_height("knocked_down", t)
	first_person_extension:set_first_person_mode(false)

	local include_local_player = true

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self.is_server, self.inventory_extension)
	CharacterStateHelper.change_camera_state(self.player, "follow_third_person")

	local fast_respawns = Development.parameter("fast_respawns")
	self.dead_player_destroy_time = (fast_respawns and 1) or PlayerUnitDamageSettings.dead_player_destroy_time
	local drop_items_delay = (not fast_respawns and params and params.drop_items_delay) or 0

	fassert(drop_items_delay < self.dead_player_destroy_time, "Drop items delay too large - this will cause a drop attempt when the player is already despawned!")

	self.drop_items_time = t + drop_items_delay
	local override_item_drop_position = (params and params.override_item_drop_position) or nil
	local override_item_drop_direction = (params and params.override_item_drop_direction) or nil
	self.override_item_drop_position = (override_item_drop_position and Vector3Box(override_item_drop_position)) or nil
	self.override_item_drop_direction = (override_item_drop_direction and Vector3Box(override_item_drop_direction)) or nil
end

PlayerCharacterStateDead.on_exit = function (self, unit, input, dt, context, t, next_state)
	self.override_item_drop_position = nil
	self.override_item_drop_direction = nil
end

PlayerCharacterStateDead.update = function (self, unit, input, dt, context, t)
	local time_since_death = t - self.despawn_time_start

	if not self.switched_to_observer_camera and self.dead_player_destroy_time < time_since_death + 1 then
		self.switched_to_observer_camera = true

		CharacterStateHelper.change_camera_state(self.player, "observer")
	end

	if not self.items_dropped and self.drop_items_time < t then
		local override_item_drop_position = self.override_item_drop_position and self.override_item_drop_position:unbox()
		local override_item_drop_direction = self.override_item_drop_direction and self.override_item_drop_direction:unbox()
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

		inventory_extension:check_and_drop_pickups("death", override_item_drop_position, override_item_drop_direction)

		self.items_dropped = true
	end

	if not self.despawned and self.dead_player_destroy_time < time_since_death then
		local player = Managers.player:unit_owner(unit)

		Managers.state.spawn:delayed_despawn(player)

		self.despawned = true

		if player.local_player then
			MOOD_BLACKBOARD.knocked_down = false
			MOOD_BLACKBOARD.wounded = false
			MOOD_BLACKBOARD.bleeding_out = false
		end
	end
end

return
