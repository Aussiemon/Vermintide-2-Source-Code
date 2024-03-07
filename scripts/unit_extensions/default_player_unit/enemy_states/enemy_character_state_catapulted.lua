-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_catapulted.lua

require("scripts/settings/player_movement_settings")

EnemyCharacterStateCatapulted = class(EnemyCharacterStateCatapulted, EnemyCharacterState)

local position_lookup = POSITION_LOOKUP
local DIRECTIONS = PlayerUnitMovementSettings.catapulted.directions

EnemyCharacterStateCatapulted.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "catapulted")
end

EnemyCharacterStateCatapulted.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.stop_weapon_actions(self._inventory_extension, "stunned")
	CharacterStateHelper.stop_career_abilities(self._career_extension, "stunned")

	local direction = params.direction
	local status_extension = self._status_extension
	local velocity = status_extension.catapulted_velocity:unbox()
	local locomotion_extension = self._locomotion_extension

	locomotion_extension:set_maximum_upwards_velocity(velocity.z)
	locomotion_extension:set_forced_velocity(velocity)
	locomotion_extension:set_wanted_velocity(velocity)

	self._direction = direction

	local anim = "idle"
	local anim_1p = "idle"

	CharacterStateHelper.play_animation_event(unit, anim)
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, anim_1p or anim)

	local first_person_extension = self._first_person_extension

	first_person_extension:hide_weapons("catapulted")

	local include_local_player = false

	CharacterStateHelper.show_inventory_3p(unit, false, include_local_player, self._is_server, self._inventory_extension)

	local sound_event = params.sound_event

	if sound_event then
		first_person_extension:play_hud_sound_event(sound_event)
	end

	self.start_catapulted_height = position_lookup[unit].z
end

EnemyCharacterStateCatapulted.on_exit = function (self, unit, input, dt, context, t, next_state)
	local direction = self._direction

	self._direction = nil

	self._status_extension:set_catapulted(false)
	self._first_person_extension:unhide_weapons("catapulted")
	self._locomotion_extension:reset_maximum_upwards_velocity()

	if Managers.state.network:game() then
		local include_local_player = false

		CharacterStateHelper.show_inventory_3p(unit, true, include_local_player, self._is_server, self._inventory_extension)
		CharacterStateHelper.play_animation_event(unit, "idle")
	end

	self._status_extension:set_falling_height(nil, self.start_catapulted_height)
end

EnemyCharacterStateCatapulted.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local unit = self._unit
	local world = self._world
	local input_extension = self._input_extension
	local status_extension = self._status_extension

	if position_lookup[unit].z < -240 then
		print("Player has fallen outside the world -- kill meeeee ", position_lookup[unit].z)

		local go_id = self._unit_storage:go_id(unit)

		self._network_transmit:send_rpc_server("rpc_suicide", go_id)
	end

	if CharacterStateHelper.is_dead(status_extension) then
		csm:change_state("dead")

		return
	end

	if CharacterStateHelper.is_in_vortex(status_extension) then
		csm:change_state("in_vortex")

		return
	end

	if CharacterStateHelper.is_colliding_down(unit) and self._locomotion_extension:current_velocity().z < 0 then
		local anim = "idle"

		CharacterStateHelper.play_animation_event(unit, anim)

		if CharacterStateHelper.has_move_input(input_extension) then
			csm:change_state("walking")
		else
			csm:change_state("standing")
		end

		return
	end

	if CharacterStateHelper.is_colliding_down(unit) and self._locomotion_extension:is_on_ground() and self._locomotion_extension:current_velocity().z >= 0 then
		local anim = "idle"

		CharacterStateHelper.play_animation_event(unit, anim)

		if CharacterStateHelper.has_move_input(input_extension) then
			csm:change_state("walking")
		else
			csm:change_state("standing")
		end

		self._locomotion_extension:add_external_velocity(self._locomotion_extension:current_velocity() * 0.2)

		return
	end

	if CharacterStateHelper.is_colliding_sides(unit) then
		local anim = "idle"

		CharacterStateHelper.play_animation_event(unit, anim)
		csm:change_state("standing")

		return
	end

	local first_person_extension = self._first_person_extension

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
end
