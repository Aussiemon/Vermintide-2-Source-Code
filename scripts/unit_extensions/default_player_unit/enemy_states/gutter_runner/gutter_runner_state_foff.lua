-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_foff.lua

GutterRunnerStateFoff = class(GutterRunnerStateFoff, EnemyCharacterStateWalking)

GutterRunnerStateFoff.init = function (self, character_state_init_context, name)
	GutterRunnerStateFoff.super.init(self, character_state_init_context, "gutter_runner_foff")

	self._network_manager = Managers.state.network
	self.explosion_template = self._breed.foff_explosion_template
end

GutterRunnerStateFoff.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	self:set_breed_action("ninja_vanish")
	self._locomotion_extension:set_forced_velocity(Vector3:zero())
	self._locomotion_extension:set_wanted_velocity(Vector3.zero())

	self._enter_anim_time = t + self._breed.foff_enter_anim_time
	self.falling = false
	self.foffed = false

	self:on_enter_animation()
end

GutterRunnerStateFoff.on_exit = function (self, unit, input, dt, context, t, next_state)
	self:set_breed_action("n/a")
	self:on_exit_animation()

	if not Managers.state.network:game() or not next_state then
		return
	end

	if self.falling and next_state ~= "falling" then
		ScriptUnit.extension(unit, "whereabouts_system"):set_no_landing()
	end
end

GutterRunnerStateFoff.on_enter_animation = function (self)
	CharacterStateHelper.play_animation_event(self._unit, "foff_self")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "foff_self")
end

GutterRunnerStateFoff.on_exit_animation = function (self)
	CharacterStateHelper.play_animation_event(self._unit, "idle")
	CharacterStateHelper.play_animation_event_first_person(self._first_person_extension, "idle")
end

GutterRunnerStateFoff.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	if t > self._enter_anim_time and not self.foffed then
		self:foff()

		self.foffed = true
	end
end

GutterRunnerStateFoff.foff = function (self)
	local unit = self._unit
	local position = POSITION_LOOKUP[unit] + Vector3(0, 1.5, 0)
	local rotation = Unit.local_rotation(unit, 0)
	local explosion_template = self.explosion_template
	local scale = 1
	local csm = self._csm
	local player = Managers.player:owner(unit)
	local local_player = player.local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local is_server = Managers.player.is_server

	if is_server then
		Managers.state.entity:system("area_damage_system"):create_explosion(unit, position, rotation, explosion_template, scale, "overcharge", nil, false)
	end

	local buff_extension = self._buff_extension
	local buff_to_add = "vs_gutter_runner_smoke_bomb_invisible"
	local buff_template_name_id = NetworkLookup.buff_templates[buff_to_add]
	local unit_object_id = network_manager:unit_game_object_id(unit)

	if is_server then
		buff_extension:add_buff(buff_to_add, {
			attacker_unit = unit,
		})
		network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
	else
		network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
	end

	self._status_extension:set_invisible(true, nil, "gutter_runner_f")

	if local_player then
		local first_person_extension = self._first_person_extension
		local career_extension = ScriptUnit.extension(unit, "career_system")

		first_person_extension:play_unit_sound_event("Play_versus_gutterrunner_vanish_fps", unit, 0)
		career_extension:set_state("vs_gutter_runner_smoke_bomb_invisible")

		MOOD_BLACKBOARD.gutter_runner_f = true
	end

	csm:change_state("standing")
end
