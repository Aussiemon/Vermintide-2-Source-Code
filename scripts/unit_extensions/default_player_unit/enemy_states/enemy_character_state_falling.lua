-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/enemy_character_state_falling.lua

local fix = {
	"Double",
	"Triple",
	"Quad",
	"Penta",
	"Hexa",
	"Hepta",
	"Octa",
	"Nona",
	"Deca",
	"Hendeca",
	"Dodeca",
	"Trideca",
	"Tetradeca",
	"Pentadeca",
	"Hexadeca",
	"Heptadeca",
	"Octadeca",
	"Enneadeca",
	"Icosa",
}

script_data.ledge_hanging_turned_off = script_data.ledge_hanging_turned_off or Development.parameter("ledge_hanging_turned_off")
TimesJumpedInAir = 0
EnemyCharacterStateFalling = class(EnemyCharacterStateFalling, EnemyCharacterState)

local position_lookup = POSITION_LOOKUP

EnemyCharacterStateFalling.init = function (self, character_state_init_context)
	EnemyCharacterState.init(self, character_state_init_context, "falling")

	self.last_valid_nav_position = Vector3Box()
	self.ladder_shaking = false
end

EnemyCharacterStateFalling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self.falling_reason = previous_state

	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension

	self._breed = Unit.get_data(unit, "breed")

	status_extension:set_falling_height()
	locomotion_extension:set_maximum_upwards_velocity(math.huge)
	CharacterStateHelper.play_animation_event_first_person(first_person_extension, "idle")

	if previous_state ~= "jumping" then
		if CharacterStateHelper.is_moving(locomotion_extension) then
			local move_anim = "jump_idle"

			CharacterStateHelper.play_animation_event(unit, move_anim)
		else
			local move_anim = "jump_idle"

			CharacterStateHelper.play_animation_event(unit, move_anim)
		end
	end

	self.jumped = params.jumped

	local inventory_extension = self._inventory_extension

	CharacterStateHelper.look(input_extension, self._player.viewport_name, first_person_extension, status_extension, self._inventory_extension)
	CharacterStateHelper.update_weapon_actions(t, unit, input_extension, inventory_extension, self._health_extension)

	self.is_active = true
	self.times_jumped_in_air = 0
	self.ladder_shaking = params.ladder_shaking or false

	if previous_state ~= "jumping" and previous_state ~= "leaping" and previous_state ~= "lunging" and previous_state ~= "pouncing" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_fell()
	end
end

local fall_distance_sound_threshold = 7
local low_fall_distance_sound_threshold = 1

EnemyCharacterStateFalling.on_exit = function (self, unit, input, dt, context, t, next_state)
	if not Managers.state.network:game() or not next_state then
		return
	end

	local locomotion_extension = self._locomotion_extension

	locomotion_extension:reset_maximum_upwards_velocity()

	local status_extension = self._status_extension
	local fall_distance = status_extension:fall_distance()

	if fall_distance > fall_distance_sound_threshold then
		local sound_event = "Play_versus_pactsworn_jump_land"
		local first_person_extension = self._first_person_extension

		first_person_extension:play_unit_sound_event(sound_event, unit, 0)
	elseif fall_distance > low_fall_distance_sound_threshold then
		Unit.flow_event(unit, "pactsworn_land_after_jump")
	elseif self.falling_reason == "tunneling" then
		Unit.flow_event(unit, "pactsworn_land_after_jump")
	elseif self.falling_reason == "jumping" then
		Unit.flow_event(unit, "pactsworn_land_after_jump")
	end

	self.is_active = false
	self.jumped = nil

	local anim_event = "idle"

	if next_state == "walking" or next_state == "standing" then
		if self.falling_reason == "tunneling" then
			anim_event = "jump_down_land"
		end

		ScriptUnit.extension(unit, "whereabouts_system"):set_landed()
	else
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end

	CharacterStateHelper.play_animation_event(unit, anim_event)
end

EnemyCharacterStateFalling.common_movement = function (self, in_ghost_mode, dt, unit)
	local locomotion_extension = self._locomotion_extension
	local first_person_extension = self._first_person_extension
	local breed = self._breed
	local velocity = locomotion_extension:current_velocity()

	if velocity.z > 0 then
		self.start_fall_height = position_lookup[unit].z
	end

	CharacterStateHelper.update_dodge_lock(unit, self._input_extension, self._status_extension)

	if position_lookup[unit].z < -240 then
		local go_id = self._unit_storage:go_id(unit)

		self._network_transmit:send_rpc_server("rpc_suicide", go_id)
	end

	local csm = self._csm
	local input_extension = self._input_extension
	local status_extension = self._status_extension

	if CharacterStateHelper.do_common_state_transitions(status_extension, csm) then
		return
	end

	local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)

	if CharacterStateHelper.is_pushed(status_extension) then
		status_extension:set_pushed(false)

		local params = movement_settings_table.stun_settings.pushed
		local hit_react_type = status_extension:hit_react_type()

		params.hit_react_type = hit_react_type .. "_push"

		csm:change_state("stunned", params)

		return
	end

	if not csm.state_next and locomotion_extension:is_on_ground() then
		if CharacterStateHelper.is_moving(locomotion_extension) then
			csm:change_state("walking")
			first_person_extension:change_state("walking")
		else
			csm:change_state("standing")
			first_person_extension:change_state("standing")
		end

		return
	end

	if script_data.use_super_jumps and (input_extension:get("jump") or input_extension:get("jump_only")) then
		self.times_jumped_in_air = math.min(#fix, self.times_jumped_in_air + 1)

		local text = string.format("%sjump!", fix[self.times_jumped_in_air])

		Debug.sticky_text(text)

		local jump_speed = movement_settings_table.jump.initial_vertical_speed
		local velocity_current = self._locomotion_extension:current_velocity()
		local velocity_jump = Vector3(velocity_current.x, velocity_current.y, velocity_current.z < -3 and jump_speed * 0.5 or jump_speed * 1.5)

		self._locomotion_extension:set_forced_velocity(velocity_jump)
		self._locomotion_extension:set_wanted_velocity(velocity_jump)
	end

	local breed_multiplier = breed.movement_speed_multiplier
	local current_max_move_speed = movement_settings_table.move_speed

	if in_ghost_mode then
		current_max_move_speed = movement_settings_table.ghost_move_speed
	end

	current_max_move_speed = current_max_move_speed * breed_multiplier

	local buffed_move_speed = self._buff_extension:apply_buffs_to_value(current_max_move_speed, "movement_speed")
	local final_move_speed = buffed_move_speed * movement_settings_table.player_speed_scale

	CharacterStateHelper.move_in_air_pactsworn(self._first_person_extension, input_extension, self._locomotion_extension, final_move_speed, unit)
	CharacterStateHelper.look(input_extension, self._player.viewport_name, self._first_person_extension, status_extension, self._inventory_extension)
end

EnemyCharacterStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end
