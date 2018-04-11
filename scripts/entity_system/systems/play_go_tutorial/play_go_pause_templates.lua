DefaultAnimationFunctions = {
	on_enter = function (this, unit, position)
		this.activated = true
		this.unit = unit
		local player = Managers.player:local_player()
		local player_unit = player.player_unit
		local player_input = ScriptUnit.extension(player_unit, "input_system")
		this.player_input_enabled = player_input.enabled
		this.allowed_input = player_input.allowed_input_table(player_input)
		this.disallowed_input = player_input.disallowed_input_table(player_input)
		local allowed_input = {}

		for _, input in pairs(this.allowed_input) do
			allowed_input[input] = true
		end

		player_input.set_enabled(player_input, false)
		player_input.set_allowed_inputs(player_input, allowed_input)
		player_input.set_disallowed_inputs(player_input)
		Managers.state.event:trigger("close_ingame_menu")
		Managers.input:device_block_service("gamepad", 1, "ingame_menu")
		Managers.input:device_block_service("keyboard", 1, "ingame_menu")
		Managers.input:device_block_service("mouse", 1, "ingame_menu")

		local first_person_ext = ScriptUnit.extension(player_unit, "first_person_system")
		local player_head_pos = Unit.world_position(player_unit, Unit.node(player_unit, "j_neck"))
		local enemy_head_pos = position or Unit.world_position(unit, Unit.node(unit, "j_neck"))
		local dir = enemy_head_pos - player_head_pos
		local rotation = Quaternion.look(dir, Vector3.up())

		first_person_ext.force_look_rotation(first_person_ext, rotation, 10)

		local level = LevelHelper:current_level(this.world)

		Level.trigger_event(level, "lua_" .. this.name .. "_activated")

		if this.mission_name then
			local mission_name = this.mission_name
			local mission_template = Missions[mission_name]

			if mission_template.is_tutorial_input then
				Managers.state.event:trigger("event_add_tutorial_input", mission_name)
			else
				local mission_system = Managers.state.entity:system("mission_system")

				mission_system.flow_callback_start_mission(mission_system, mission_name)
			end
		end

		return 
	end,
	update_input = function (this, t)
		if not this.activated then
			return false
		end

		if this.timer then
			if this.timer < t then
				this.stop_timer = this.timer
				this.timer = nil

				Managers.time:set_global_time_scale(0.01)

				local play_sound_event = this.play_sound_event or "Play_tutorial_indicator"

				Managers.music:trigger_event(play_sound_event)

				local level = LevelHelper:current_level(this.world)

				Level.trigger_event(level, "lua_" .. this.name .. "_triggered")
			end
		else
			stop_delay = this.stop_delay or 0.15

			if this.stop_timer and this.stop_timer + stop_delay < t then
				Managers.time:set_global_time_scale(0)

				this.stop_timer = nil
			end

			local gamepad_active = Managers.input:is_device_active("gamepad")
			local input_service = Managers.input:get_service("Player")
			local alternate_input_service = Managers.input:get_service("Tutorial")
			local in_sequence = this.input_requirement == "sequence"

			if in_sequence then
				local inputs = this.input_mappings[1]
				local success = true

				for _, input in ipairs(inputs) do
					local result = nil
					local keymap_data = not gamepad_active and input_service.get_keymapping(input_service, input)

					if not keymap_data or keymap_data[2] == UNASSIGNED_KEY then
						result = alternate_input_service.get(alternate_input_service, input)
					else
						result = input_service.get(input_service, input)
					end

					if type(result) == "number" and result == 0 then
						success = false

						break
					elseif type(result) == "boolean" and not result then
						success = false

						break
					end
				end

				if success then
					table.remove(this.input_mappings, 1)

					if table.is_empty(this.input_mappings) then
						return true
					end
				end
			else
				for idx, inputs in ipairs(this.input_mappings) do
					local success = true

					for _, input in ipairs(inputs) do
						local result = nil
						local keymap_data = not gamepad_active and input_service.get_keymapping(input_service, input)

						if not keymap_data or keymap_data[2] == UNASSIGNED_KEY then
							result = alternate_input_service.get(alternate_input_service, input)
						else
							result = input_service.get(input_service, input)
						end

						if type(result) == "number" and result == 0 then
							success = false

							break
						elseif type(result) == "boolean" and not result then
							success = false

							break
						elseif result == nil then
							success = false

							break
						end
					end

					if success then
						return true
					end
				end
			end
		end

		return false
	end,
	update_variable = function (this, t)
		if not this.activated then
			return false
		end

		if this.timer then
			if this.timer < t then
				this.stop_timer = this.timer
				this.timer = nil

				Managers.time:set_global_time_scale(0.01)
			end
		else
			local stop_delay = this.stop_delay or 0.15

			if this.stop_timer and this.stop_timer + stop_delay < t then
				Managers.time:set_global_time_scale(0)

				this.stop_timer = nil
			end

			if this[this.variable] then
				return true
			end
		end

		return false
	end,
	on_exit = function (this)
		Managers.time:set_global_time_scale(1)

		local stop_sound_event = this.stop_sound_event or "Stop_tutorial_indicator"

		Managers.music:trigger_event(stop_sound_event)

		local player = Managers.player:local_player()
		local player_unit = player.player_unit
		local player_input = ScriptUnit.extension(player_unit, "input_system")

		player_input.set_enabled(player_input, this.player_input_enabled)
		player_input.set_allowed_inputs(player_input, this.allowed_input)
		player_input.set_disallowed_inputs(player_input, this.disallowed_input)
		Managers.input:device_unblock_service("gamepad", 1, "ingame_menu")
		Managers.input:device_unblock_service("keyboard", 1, "ingame_menu")
		Managers.input:device_unblock_service("mouse", 1, "ingame_menu")

		local first_person_ext = ScriptUnit.extension(player_unit, "first_person_system")
		local rotation = Unit.local_rotation(player_unit, 0)
		first_person_ext.forced_look_rotation = nil

		if this.mission_name then
			local mission_name = this.mission_name
			local mission_template = Missions[mission_name]

			if mission_template.is_tutorial_input then
				Managers.state.event:trigger("event_remove_tutorial_input", mission_name)
			else
				local mission_system = Managers.state.entity:system("mission_system")

				mission_system.end_mission(mission_system, mission_name)
			end
		end

		local level = LevelHelper:current_level(this.world)

		Level.trigger_event(level, "lua_" .. this.name .. "_done")

		return 
	end,
	default_prerequisites = function (this)
		local player = Managers.player:local_player()
		local player_unit = player.player_unit
		local status_ext = ScriptUnit.extension(player_unit, "status_system")

		if status_ext.dodge_locked(status_ext) or status_ext.get_is_dodging(status_ext) then
			return false
		end

		local character_state_machine_ext = ScriptUnit.extension(player_unit, "character_state_machine_system")

		if character_state_machine_ext.current_state(character_state_machine_ext) ~= "standing" and character_state_machine_ext.current_state(character_state_machine_ext) ~= "walking" then
			return false
		end

		if status_ext.is_blocking(status_ext) then
			return false
		end

		return true
	end
}
PauseEvents = {
	pause_events = {
		{
			animation_delay = 0.75,
			stop_delay = 0.1,
			input_requirement = "sequence",
			mission_name = "prologue_use_special_ability",
			name = "special_ability",
			input_mappings = {
				{
					"action_career"
				},
				{
					"action_career_release"
				}
			},
			allowed_input = {
				"action_career",
				"action_career_release"
			},
			on_enter = DefaultAnimationFunctions.on_enter,
			update = DefaultAnimationFunctions.update_input,
			on_exit = DefaultAnimationFunctions.on_exit,
			check_prerequisites = function ()
				return true
			end
		}
	},
	animation_hook_templates = {
		{
			stop_delay = 0.1,
			mission_name = "prologue_pushing",
			animation_delay = 0.75,
			breed = "skaven_storm_vermin",
			name = "push_storm_vermin",
			animations = {
				"attack_pounce",
				"attack_special"
			},
			input_mappings = {
				{
					"action_two_hold",
					"action_one"
				}
			},
			allowed_input = {
				"action_two_hold",
				"action_one"
			},
			on_enter = DefaultAnimationFunctions.on_enter,
			update = DefaultAnimationFunctions.update_input,
			on_exit = DefaultAnimationFunctions.on_exit,
			check_prerequisites = function ()
				return true
			end
		},
		{
			stop_delay = 0.07,
			mission_name = "prologue_dodge",
			animation_delay = 0.4,
			breed = "chaos_raider_tutorial",
			name = "dodge_chaos_raider",
			animations = {
				"attack_cleave_02"
			},
			input_mappings = {
				{
					"move_left",
					"dodge_hold"
				},
				{
					"move_right",
					"dodge_hold"
				},
				{
					"move_controller_left",
					"dodge_hold"
				},
				{
					"move_controller_right",
					"dodge_hold"
				}
			},
			allowed_input = {
				"move_left",
				"move_right",
				"move_controller",
				"dodge",
				"dodge_hold"
			},
			on_enter = DefaultAnimationFunctions.on_enter,
			update = DefaultAnimationFunctions.update_input,
			on_exit = DefaultAnimationFunctions.on_exit,
			check_prerequisites = function ()
				return true
			end
		},
		{
			stop_delay = 0.05,
			mission_name = "prologue_blocking",
			animation_delay = 0.4,
			breed = "chaos_marauder_tutorial",
			name = "block_chaos_marauder",
			animations = {
				"attack_pounce"
			},
			input_mappings = {
				{
					"action_two",
					"action_two_hold"
				}
			},
			allowed_input = {
				"action_two_hold",
				"action_two"
			},
			on_enter = DefaultAnimationFunctions.on_enter,
			update = DefaultAnimationFunctions.update_input,
			on_exit = DefaultAnimationFunctions.on_exit,
			check_prerequisites = function ()
				return true
			end
		}
	}
}

for idx, animation_hook in ipairs(PauseEvents.animation_hook_templates) do
	fassert(not PauseEvents.animation_hook_templates[animation_hook.name], "[PauseEvents] There is already an animation hook called %s", animation_hook.name)

	PauseEvents.animation_hook_templates[animation_hook.name] = animation_hook
end

for idx, pause_event in ipairs(PauseEvents.pause_events) do
	fassert(not PauseEvents.animation_hook_templates[pause_event.name], "[PauseEvents] There is already a pause event called %s", pause_event.name)

	PauseEvents.pause_events[pause_event.name] = pause_event
end

return 
