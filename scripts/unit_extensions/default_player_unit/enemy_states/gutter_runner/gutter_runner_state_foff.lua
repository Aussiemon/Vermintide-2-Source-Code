-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_foff.lua

GutterRunnerStateFoff = class(GutterRunnerStateFoff, EnemyCharacterStateWalking)

GutterRunnerStateFoff.init = function (self, character_state_init_context, name)
	GutterRunnerStateFoff.super.init(self, character_state_init_context, "gutter_runner_foff")

	self._network_manager = Managers.state.network
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
	local csm = self._csm
	local player = Managers.player:owner(unit)
	local local_player = player.local_player
	local go_id = Managers.state.network:unit_game_object_id(unit) or NetworkConstants.invalid_game_object_id
	local effect_name = "fx/chr_gutter_foff"

	Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect", NetworkLookup.effects[effect_name], go_id, 0, Vector3.zero(), Quaternion.identity(), false)
	self._buff_extension:add_buff("vs_gutter_runner_smoke_bomb_invisible", {
		attacker_unit = unit,
	})

	if local_player then
		local first_person_extension = self._first_person_extension
		local career_extension = ScriptUnit.extension(unit, "career_system")

		first_person_extension:play_unit_sound_event("Play_versus_gutterrunner_vanish_fps", unit, 0)
		career_extension:set_state("vs_gutter_runner_smoke_bomb_invisible")
	end

	csm:change_state("standing")
end
