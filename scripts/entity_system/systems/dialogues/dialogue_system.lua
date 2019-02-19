require("scripts/utils/function_command_queue")
require("scripts/entity_system/systems/dialogues/tag_query")
require("scripts/entity_system/systems/dialogues/tag_query_database")
require("scripts/entity_system/systems/dialogues/tag_query_loader")
require("scripts/entity_system/systems/dialogues/dialogue_state_handler")
require("scripts/settings/dialogue_settings")

script_data.dialogue_debug_all_contexts = script_data.dialogue_debug_all_contexts or Development.parameter("dialogue_debug_all_contexts")
script_data.dialogue_debug_last_query = script_data.dialogue_debug_last_query or Development.parameter("dialogue_debug_last_query")
script_data.dialogue_debug_last_played_query = script_data.dialogue_debug_last_played_query or Development.parameter("dialogue_debug_last_played_query")
script_data.dialogue_debug_queries = script_data.dialogue_debug_queries or Development.parameter("dialogue_debug_queries")
script_data.dialogue_debug_rules = script_data.dialogue_debug_rules or Development.parameter("dialogue_debug_rules")
script_data.dialogue_debug_missing_vo_trigger_error_sound = script_data.dialogue_debug_missing_vo_trigger_error_sound or Development.parameter("dialogue_debug_missing_vo_trigger_error_sound")
local extensions = {
	"DialogueActorExtension"
}
local dialogue_category_config = DialogueSettings.dialogue_category_config
local enabled = true
local debug_vo_by_file = nil
DialogueSystem = class(DialogueSystem, ExtensionSystemBase)

DialogueSystem.init = function (self, entity_system_creation_context, system_name)
	local entity_manager = entity_system_creation_context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.frozen_unit_extension_data = {}
	self.unit_extension_data = {}
	self.playing_dialogues = {}
	self.playing_units = {}
	self.is_server = entity_system_creation_context.is_server
	self.debug_state = nil
	self.tagquery_database = TagQueryDatabase:new()
	self.dialogues = {}
	self.markers = {}
	self.tagquery_loader = TagQueryLoader:new(self.tagquery_database, self.dialogues)
	local max_num_args = 2
	self.function_command_queue = FunctionCommandQueue:new(max_num_args)
	local level_name = entity_system_creation_context.startup_data.level_key
	local dialogue_filename = "dialogues/generated/" .. level_name
	local auto_load_files = DialogueSettings.auto_load_files
	local blocked_auto_load = DialogueSettings.blocked_auto_load_files[level_name]
	self._dialogue_level_start_delay = DialogueSettings.dialogue_level_start_delay
	self._story_start_delay = DialogueSettings.story_start_delay
	self._story_tick_time = DialogueSettings.story_tick_time
	local dialogue_override = LevelSettings[level_name].override_dialogue_start_delay

	if dialogue_override then
		self._dialogue_level_start_delay = dialogue_override.dialogue_level_start_delay
		self._story_start_delay = dialogue_override.story_start_delay
		self._story_tick_time = dialogue_override.story_tick_time
	end

	if Application.can_get("lua", dialogue_filename) then
		self.tagquery_loader:load_file(dialogue_filename)
	end

	self._markers = {}

	if not blocked_auto_load then
		for _, file_name in ipairs(auto_load_files) do
			if Application.can_get("lua", file_name) then
				self.tagquery_loader:load_file(file_name)
			end

			if Application.can_get("lua", file_name .. "_markers") then
				local markers = dofile(file_name .. "_markers")

				for name, marker in pairs(markers) do
					fassert(not self._markers[name], "[DialogueSystem] There is already a marker called %s registered", name)

					self._markers[name] = marker
				end
			end
		end
	end

	local level_specific_load_files = DialogueSettings.level_specific_load_files[level_name]

	if level_specific_load_files then
		for _, file_name in ipairs(level_specific_load_files) do
			if Application.can_get("lua", file_name) then
				self.tagquery_loader:load_file(file_name)
			end

			if Application.can_get("lua", file_name .. "_markers") then
				local markers = dofile(file_name .. "_markers")

				for name, marker in pairs(markers) do
					fassert(not self._markers[name], "[DialogueSystem] There is already a marker called %s registered", name)

					self._markers[name] = marker
				end
			end
		end
	end

	self.tagquery_database:finalize_rules()

	local world = entity_system_creation_context.world
	self.world = world
	self.wwise_world = Managers.world:wwise_world(world)
	self.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	self.dialogue_state_handler = DialogueStateHandler:new(self.world, self.wwise_world)
	self.input_event_queue = {}
	self.input_event_queue_n = 0
	self.faction_memories = {
		player = {},
		enemy = {}
	}
	local wwise_voice_switch_value_indices = {}

	for breed_name, breed in pairs(Breeds) do
		if breed.wwise_voice_switch_group then
			wwise_voice_switch_value_indices[breed_name] = 1
		end
	end

	self.wwise_voice_switch_value_indices = wwise_voice_switch_value_indices
	local current_level = entity_system_creation_context.startup_data.level_key
	self.statistics_db = entity_system_creation_context.statistics_db
	self.global_context = {
		current_level = current_level
	}

	self.tagquery_database:set_global_context(self.global_context)

	self.global_context.level_time = 0
	self.next_story_line_update_t = self._story_start_delay
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_trigger_dialogue_event", "rpc_play_dialogue_event", "rpc_interrupt_dialogue_event")
end

DialogueSystem.is_dialogue_playing = function (self)
	return table.size(self.playing_dialogues) > 0
end

DialogueSystem.destroy = function (self)
	self.tagquery_loader:unload_files()
	self.tagquery_database:destroy()
	World.destroy_gui(self.world, self.gui)
	self.network_event_delegate:unregister(self)
	table.clear(self)
end

DialogueSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {
		user_memory = {},
		context = {
			health = 1
		},
		local_player = extension_init_data.local_player
	}
	local dialogue_system = self
	local input = MakeTableStrict({
		trigger_dialogue_event = function (self, event_name, event_data, identifier)
			if not dialogue_system.is_server then
				return
			end

			local input_event_queue = dialogue_system.input_event_queue
			local input_event_queue_n = dialogue_system.input_event_queue_n
			input_event_queue[input_event_queue_n + 1] = unit
			input_event_queue[input_event_queue_n + 2] = event_name
			input_event_queue[input_event_queue_n + 3] = event_data
			input_event_queue[input_event_queue_n + 4] = identifier or ""
			dialogue_system.input_event_queue_n = input_event_queue_n + 4
		end,
		trigger_networked_dialogue_event = function (self, event_name, event_data, identifier)
			if LEVEL_EDITOR_TEST then
				return
			end

			if dialogue_system.is_server then
				local input_event_queue = dialogue_system.input_event_queue
				local input_event_queue_n = dialogue_system.input_event_queue_n
				input_event_queue[input_event_queue_n + 1] = unit
				input_event_queue[input_event_queue_n + 2] = event_name
				input_event_queue[input_event_queue_n + 3] = event_data
				input_event_queue[input_event_queue_n + 4] = identifier or ""
				dialogue_system.input_event_queue_n = input_event_queue_n + 4

				return
			end

			local event_data_array_temp_types = FrameTable.alloc_table()
			local event_data_array_temp = FrameTable.alloc_table()
			local event_data_array_temp_n = table.table_to_array(event_data, event_data_array_temp)

			for i = 1, event_data_array_temp_n, 1 do
				local value = event_data_array_temp[i]

				if type(value) == "number" then
					fassert(value % 1 == 0, "Tried to pass non-integer value to dialogue event")
					fassert(value >= 0, "Tried to send a dialogue data number smaller than zero")

					event_data_array_temp[i] = value + 1
					event_data_array_temp_types[i] = true
				else
					local value_id = NetworkLookup.dialogue_event_data_names[value]
					event_data_array_temp[i] = value_id
					event_data_array_temp_types[i] = false
				end
			end

			local go_id = NetworkUnit.game_object_id(unit)
			local event_id = NetworkLookup.dialogue_events[event_name]

			fassert(go_id, "No game object id for unit %s.", unit)

			local network_manager = Managers.state.network

			network_manager.network_transmit:send_rpc_server("rpc_trigger_dialogue_event", go_id, event_id, event_data_array_temp, event_data_array_temp_types)
		end,
		play_voice = function (self, sound_event, use_occlusion)
			local wwise_source_id = WwiseUtils.make_unit_auto_source(dialogue_system.world, extension.play_unit, extension.voice_node)

			if wwise_source_id ~= extension.wwise_source_id then
				extension.wwise_source_id = wwise_source_id
				local switch_name = extension.wwise_voice_switch_group
				local switch_value = extension.wwise_voice_switch_value

				if switch_name and switch_value then
					WwiseWorld.set_switch(dialogue_system.wwise_world, switch_name, switch_value, wwise_source_id)
					WwiseWorld.set_source_parameter(dialogue_system.wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
				end

				if extension.faction == "player" then
					WwiseWorld.set_switch(dialogue_system.wwise_world, "husk", NetworkUnit.is_husk_unit(unit), wwise_source_id)
				end
			end

			return WwiseWorld.trigger_event(dialogue_system.wwise_world, sound_event, use_occlusion, wwise_source_id)
		end,
		play_voice_debug = function (self, sound_event)
			local wwise_source_id = WwiseUtils.make_unit_auto_source(dialogue_system.world, extension.play_unit, extension.voice_node)
			local switch_name = extension.wwise_voice_switch_group
			local switch_value = extension.wwise_voice_switch_value

			if switch_name and switch_value then
				WwiseWorld.set_source_parameter(dialogue_system.wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
			end

			if extension.faction == "player" then
			end

			return WwiseWorld.trigger_event(dialogue_system.wwise_world, sound_event, wwise_source_id)
		end,
		trigger_query = function (self, event_data)
			local concept, source, test_query, test_user_context_list, test_global_context = unpack(event_data)

			dialogue_system.tagquery_database:debug_test_query(concept, source, test_query, test_user_context_list, test_global_context)
		end
	})
	extension.input = input

	self.tagquery_database:add_object_context(unit, "user_memory", extension.user_memory)
	self.tagquery_database:add_object_context(unit, "user_context", extension.context)

	if extension_init_data.faction then
		extension.faction = extension_init_data.faction

		fassert(self.faction_memories[extension_init_data.faction], "No such faction %q", tostring(extension_init_data.faction))
		self.tagquery_database:add_object_context(unit, "faction_memory", self.faction_memories[extension_init_data.faction])

		extension.faction_memory = self.faction_memories[extension_init_data.faction]
	end

	ScriptUnit.set_extension(unit, "dialogue_system", extension)

	self.unit_extension_data[unit] = extension
	local breed_name = extension_init_data.breed_name

	if breed_name then
		local breed = Breeds[breed_name]

		if breed.wwise_voice_switch_group then
			local wwise_voices = breed.wwise_voices
			local number_voices = #wwise_voices
			local current_index = self.wwise_voice_switch_value_indices[breed_name]
			local wwise_voice_switch_value = wwise_voices[current_index]
			extension.wwise_voice_switch_value = wwise_voice_switch_value
			local wwise_voice_switch_group = breed.wwise_voice_switch_group
			extension.wwise_voice_switch_group = wwise_voice_switch_group
			self.wwise_voice_switch_value_indices[breed_name] = current_index % number_voices + 1

			if script_data.sound_debug then
				printf("[DialogueSystem] Spawned breed %s - using switch group '%s' with '%s'", breed_name, wwise_voice_switch_group, wwise_voice_switch_value)
			end
		end

		if DialogueSettings.breed_types_trigger_on_spawn[breed_name] and self.is_server then
			self.entity_manager:system("surrounding_aware_system"):add_system_event(unit, "enemy_spawn", math.huge, "breed_type", breed_name)
		end
	elseif extension_init_data.wwise_voice_switch_group ~= nil then
		extension.wwise_voice_switch_group = extension_init_data.wwise_voice_switch_group
		extension.wwise_voice_switch_value = extension_init_data.wwise_voice_switch_value
	end

	return extension
end

DialogueSystem.extensions_ready = function (self, world, unit)
	local extension = self.unit_extension_data[unit]
	local context = self.unit_extension_data[unit].context
	local player_profile = context.player_profile

	if ScriptUnit.has_extension(unit, "status_system") then
		extension.status_extension = ScriptUnit.extension(unit, "status_system")
		self.global_context[player_profile] = true
		local career_ext = ScriptUnit.extension(unit, "career_system")
		local career_name = career_ext:career_name()
		self.global_context[career_name] = true
		context.player_career = career_name
	elseif player_profile == nil then
		context.player_profile = Unit.get_data(unit, "dialogue_profile")
	end

	local play_unit = unit
	local vo_center_percent = 0
	local voice_node = 0

	if extension.local_player then
		play_unit = ScriptUnit.extension(unit, "first_person_system"):get_first_person_unit()
		vo_center_percent = 100
		voice_node = Unit.node(play_unit, "camera_node")
		extension.local_player_start_pos = Vector3Aux.box(nil, POSITION_LOOKUP[unit])
		extension.local_player_has_moved = false
	elseif Unit.has_node(play_unit, "a_voice") then
		voice_node = Unit.node(play_unit, "a_voice")
	elseif Unit.has_node(play_unit, "j_head") then
		voice_node = Unit.node(play_unit, "j_head")
	end

	extension.play_unit = play_unit
	extension.voice_node = voice_node
	extension.vo_center_percent = vo_center_percent
end

DialogueSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

DialogueSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit was already frozen.")

	self.frozen_unit_extension_data[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

DialogueSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self.unit_extension_data[unit] = nil
	frozen_extensions[unit] = extension
end

DialogueSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension

	self.tagquery_database:add_object_context(unit, "user_memory", extension.user_memory)
	self.tagquery_database:add_object_context(unit, "user_context", extension.context)
	self.tagquery_database:add_object_context(unit, "faction_memory", self.faction_memories[extension.faction])
end

DialogueSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return
	end

	local context = extension.context
	local player_profile = context.player_profile

	if player_profile then
		local global_context = self.global_context
		global_context[player_profile] = false
		local career_name = context.player_career

		if career_name then
			global_context[career_name] = false
		end
	end

	table.clear(extension.user_memory)
	table.clear(context)

	context.health = 1
	extension.dialogue_timer = nil
	local currently_playing_dialogue = extension.currently_playing_dialogue

	if self.playing_dialogues[currently_playing_dialogue] then
		if currently_playing_dialogue.currently_playing_id and WwiseWorld.is_playing(self.wwise_world, currently_playing_dialogue.currently_playing_id) then
			WwiseWorld.stop_event(self.wwise_world, currently_playing_dialogue.currently_playing_id)
		end

		self.playing_dialogues[currently_playing_dialogue] = nil
		currently_playing_dialogue.currently_playing_id = nil
		currently_playing_dialogue.currently_playing_unit = nil
		currently_playing_dialogue.used_query = nil
	end

	extension.currently_playing_dialogue = nil
	self.playing_units[unit] = nil
	self.unit_extension_data[unit] = nil

	self.tagquery_database:remove_object(unit)
	self.function_command_queue:cleanup_destroyed_unit(unit)
end

local LOCAL_GAMETIME = 0
DialogueSystem.function_by_op = DialogueSystem.function_by_op or {
	[TagQuery.OP.ADD] = function (lhs, rhs)
		return (lhs or 0) + rhs
	end,
	[TagQuery.OP.SUB] = function (lhs, rhs)
		return (lhs or 0) - rhs
	end,
	[TagQuery.OP.NUMSET] = function (lhs, rhs)
		return rhs or 0
	end,
	[TagQuery.OP.TIMESET] = function ()
		return Managers.time:time("game") + 900
	end
}

DialogueSystem._update_currently_playing_dialogues = function (self, dt)
	local function_command_queue = self.function_command_queue
	local player_manager = Managers.player
	local wwise_world = self.wwise_world
	local unit_extension_data = self.unit_extension_data
	local playing_units = self.playing_units
	local unit_alive = Unit.alive

	for unit, extension in pairs(playing_units) do
		repeat
			if not unit_alive(unit) then
				playing_units[unit] = nil
			else
				local currently_playing_dialogue = extension.currently_playing_dialogue

				fassert(currently_playing_dialogue, "Dialogue for playing unit was nil!")

				local dialogue_timer = extension.dialogue_timer
				local is_currently_playing = nil

				if dialogue_timer then
					is_currently_playing = dialogue_timer - dt > 0
				else
					fassert(currently_playing_dialogue.currently_playing_id, "Missing event id for currently playing dialogue.")

					is_currently_playing = WwiseWorld.is_playing(wwise_world, currently_playing_dialogue.currently_playing_id)
				end

				if not is_currently_playing then
					if player_manager:owner(unit) ~= nil or Unit.has_data(unit, "dialogue_face_anim") then
						function_command_queue:queue_function_command(Unit.animation_event, unit, "face_neutral")
						function_command_queue:queue_function_command(Unit.animation_event, unit, "dialogue_end")
					elseif Unit.has_data(unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(unit) then
						function_command_queue:queue_function_command(Unit.animation_event, unit, "talk_end")
					end

					if Unit.has_data(unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(unit) then
						function_command_queue:queue_function_command(Unit.animation_event, unit, "talk_body_end")
					end

					local sound_distance = currently_playing_dialogue.sound_distance
					local used_query = currently_playing_dialogue.used_query
					extension.currently_playing_dialogue = nil
					currently_playing_dialogue.currently_playing_id = nil
					currently_playing_dialogue.currently_playing_unit = nil
					currently_playing_dialogue.used_query = nil
					self.playing_dialogues[currently_playing_dialogue] = nil
					playing_units[unit] = nil

					if not self.is_server then
						break
					end

					extension.dialogue_timer = nil
					local result = used_query.result

					if result then
						local source = used_query.query_context.source
						local success_rule = used_query.validated_rule
						local on_done = success_rule.on_done

						if on_done then
							for i = 1, #on_done, 1 do
								local on_done_command = on_done[i]
								local table_name = on_done_command[1]
								local argument_name = on_done_command[2]
								local op = on_done_command[3]
								local argument = on_done_command[4]

								if table_name ~= "user_memory" and table_name ~= "faction_memory" then
									table_name = "user_memory"
									argument_name = on_done_command[1]
									op = on_done_command[2]
									argument = on_done_command[3]
								end

								local user_contexts = unit_extension_data[source]

								if type(op) == "table" then
									fassert(DialogueSystem.function_by_op[op], "Unknown operator: %q", tostring(op))

									user_contexts[table_name][argument_name] = DialogueSystem.function_by_op[op](user_contexts[table_name][argument_name], argument)
								else
									fassert(op, "No such operator in on_done-command for rule %q", success_rule.name)

									user_contexts[table_name][argument_name] = op
								end
							end
						end

						local speaker_name = "UNKNOWN"
						local breed_data = Unit.get_data(source, "breed")

						if breed_data then
							speaker_name = breed_data.name
						elseif ScriptUnit.has_extension(source, "dialogue_system") then
							speaker_name = ScriptUnit.extension(source, "dialogue_system").context.player_profile
						end

						self.entity_manager:system("surrounding_aware_system"):add_system_event(source, "heard_speak", sound_distance, "speaker", source, "speaker_name", speaker_name, "sound_event", extension.last_query_sound_event or "unknown", "dialogue_name", result, "dialogue_name_nopre", string.sub(result, 5))

						extension.last_query_sound_event = nil
					end
				elseif dialogue_timer then
					extension.dialogue_timer = dialogue_timer - dt
				end
			end
		until true
	end
end

DialogueSystem.update = function (self, context, t)
	return
end

local function get_dialogue_event(dialogue, index)
	return dialogue.sound_events[index], dialogue.localization_strings[index], dialogue.face_animations[index], dialogue.dialogue_animations[index]
end

local temp_rand_table = {}

local function get_dialogue_event_index(dialogue)
	local randomize_indexes = dialogue.randomize_indexes

	if randomize_indexes then
		local sound_events_n = dialogue.sound_events_n
		local randomize_indexes_n = dialogue.randomize_indexes_n

		if randomize_indexes_n == 0 then
			for i = 1, sound_events_n, 1 do
				temp_rand_table[i] = i
			end

			for i = 1, sound_events_n, 1 do
				local rand = math.random(1, (sound_events_n + 1) - i)
				local val = table.remove(temp_rand_table, rand)
				randomize_indexes[i] = val
			end

			dialogue.randomize_indexes_n = sound_events_n - 1
			local index = randomize_indexes[sound_events_n]

			return index
		else
			dialogue.randomize_indexes_n = randomize_indexes_n - 1
			local index = randomize_indexes[randomize_indexes_n]

			return index
		end
	else
		return 1
	end
end

DialogueSystem._handle_wwise_markers = function (self, dt, t)
	local marker_events = WwiseWorld.pull_marker_events(self.wwise_world)

	if marker_events then
		for i = 1, #marker_events, 1 do
			local marker_event = marker_events[i]
			local marker_data = self._markers[marker_event.label]

			if marker_data then
				self:_trigger_marker(marker_data)
			end
		end
	end
end

DialogueSystem._trigger_marker = function (self, marker_data)
	local sound_event = marker_data.sound_event
	local source_name = marker_data.source_name
	local source_player = nil
	local players = Managers.player:players()

	for _, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) and ScriptUnit.has_extension(unit, "dialogue_system") then
			local extension = ScriptUnit.extension(unit, "dialogue_system")
			local player_profile = extension.context and extension.context.player_profile

			if player_profile == source_name then
				source_player = player.player_unit

				break
			end
		end
	end

	if not source_player then
		Application.error("[DialogueSystem] No source_name called %s could be found", source_name)
	elseif self.playing_units[source_player] then
		Application.error("[DialogueSystem] Marker couldn't play since %s was already talking", source_name)
	else
		local wwise_world = self.wwise_world
		local extension = self.unit_extension_data[source_player]

		if not extension then
			Application.error("[DialogueSystem] Could not find any extension_data for profile %s", source_name)
		else
			local wwise_source_id = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

			if wwise_source_id ~= extension.wwise_source_id and extension.wwise_voice_switch_group then
				extension.wwise_source_id = wwise_source_id

				WwiseWorld.set_switch(wwise_world, extension.wwise_voice_switch_group, extension.wwise_voice_switch_value, wwise_source_id)
				WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
			end

			local source_id = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

			if source_id ~= 0 then
				local marker_id = NetworkLookup.markers[sound_event]
				local network_manager = Managers.state.network
				local go_id, _ = network_manager:game_object_or_level_id(source_player)

				network_manager.network_transmit:send_rpc_clients("rpc_play_marker_event", go_id, marker_id)

				if script_data.dialogue_debug_all_contexts or self.debug_state == 2 then
					printf("[DialogueSystem] Playing marker %s", sound_event)
				end
			end
		end
	end
end

DialogueSystem.physics_async_update = function (self, context, t)
	local dt = context.dt

	self:_update_currently_playing_dialogues(dt)
	self:_update_cutscene_subtitles(t)
	self:_update_sound_event_subtitles()

	if not self.is_server then
		return
	end

	self.dialogue_state_handler:update(t)
	self:_handle_wwise_markers(dt, t)

	self.global_context.level_time = t
	LOCAL_GAMETIME = t + 900

	self:_update_incapacitation(t)

	local tagquery_database = self.tagquery_database
	local query = tagquery_database:iterate_queries(LOCAL_GAMETIME)

	if enabled and (self._dialogue_level_start_delay < self.global_context.level_time or DialogueSystem:has_local_player_moved_from_start_position()) then
		if query then
			local dialogue_actor_unit = query.query_context.source
			local unit_extension_data = self.unit_extension_data
			local extension = unit_extension_data[dialogue_actor_unit]
			extension.last_query = query
			local result = query.result

			if result then
				local dialogue = self.dialogues[result]
				local dialogue_category = dialogue.category
				local category_setting = dialogue_category_config[dialogue_category]
				local playable_during_category = category_setting.playable_during_category

				fassert(category_setting, "No category setting for category %q used in dialogue %q", dialogue_category, result)

				local playing_dialogues = self.playing_dialogues
				local will_play = true
				local interrupt_dialogue_list = FrameTable.alloc_table()

				for playing_dialogue, playing_dialogue_category_data in pairs(playing_dialogues) do
					local mutually_exclusive = playing_dialogue_category_data.mutually_exclusive
					local interrupted_by = playing_dialogue_category_data.interrupted_by

					if mutually_exclusive and dialogue_category == playing_dialogue.category then
						will_play = false

						break
					elseif interrupted_by[dialogue_category] then
						interrupt_dialogue_list[playing_dialogue] = true
						playing_dialogues[playing_dialogue] = nil
					elseif playing_dialogue.currently_playing_unit == dialogue_actor_unit then
						will_play = false

						break
					elseif playable_during_category[playing_dialogue.category] then
					else
						will_play = false

						break
					end
				end

				if dialogue.currently_playing_id then
					will_play = false
				end

				if will_play then
					local player_manager = Managers.player
					local network_manager = Managers.state.network
					local wwise_world = self.wwise_world
					local function_command_queue = self.function_command_queue
					local playing_units = self.playing_units

					for interrupt_dialogue, _ in pairs(interrupt_dialogue_list) do
						interrupt_dialogue_list[interrupt_dialogue] = nil
						local playing_unit = interrupt_dialogue.currently_playing_unit
						local playing_unit_extension = unit_extension_data[playing_unit]
						local currently_playing_id = interrupt_dialogue.currently_playing_id

						if currently_playing_id then
							WwiseWorld.stop_event(wwise_world, currently_playing_id)

							interrupt_dialogue.currently_playing_id = nil
						end

						if playing_unit_extension then
							playing_unit_extension.dialogue_timer = nil
							playing_unit_extension.currently_playing_dialogue = nil
							playing_units[playing_unit] = nil
						end

						if player_manager:owner(dialogue_actor_unit) ~= nil or Unit.has_data(dialogue_actor_unit, "dialogue_face_anim") then
							function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, "face_neutral")
							function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, "dialogue_end")
						elseif Unit.has_data(dialogue_actor_unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
							function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, "talk_end")
						end

						if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
							function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, "talk_body_end")
						end

						local go_id, is_level_unit = network_manager:game_object_or_level_id(playing_unit)

						network_manager.network_transmit:send_rpc_clients("rpc_interrupt_dialogue_event", go_id, is_level_unit)
					end

					local wwise_source_id = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

					if wwise_source_id ~= extension.wwise_source_id and extension.wwise_voice_switch_group then
						extension.wwise_source_id = wwise_source_id

						WwiseWorld.set_switch(wwise_world, extension.wwise_voice_switch_group, extension.wwise_voice_switch_value, wwise_source_id)
						WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
					end

					local go_id, is_level_unit = network_manager:game_object_or_level_id(dialogue_actor_unit)
					local dialogue_index = get_dialogue_event_index(dialogue)
					local sound_event, subtitles_event, anim_face_event, anim_dialogue_event = get_dialogue_event(dialogue, dialogue_index)
					local source_id = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

					if source_id ~= 0 then
						dialogue.currently_playing_id = source_id
						local query_context = query.query_context

						if query_context.identifier and query_context.identifier ~= "" then
							self.dialogue_state_handler:add_playing_dialogue(query_context.identifier, source_id, t)
						end

						local dialogue_id = NetworkLookup.dialogues[result]

						network_manager.network_transmit:send_rpc_clients("rpc_play_dialogue_event", go_id, is_level_unit, dialogue_id, dialogue_index)
					else
						Application.warning("Unknown wwise event for dialogues: %q. Defined in rule %q.  Trying to fall back on first sound...", sound_event, result)

						dialogue.randomize_indexes = nil
						dialogue_index = get_dialogue_event_index(dialogue)
						sound_event, subtitles_event, anim_face_event, anim_dialogue_event = get_dialogue_event(dialogue, dialogue_index)
						source_id = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

						if source_id ~= 0 then
							dialogue.currently_playing_id = source_id
							local query_context = query.query_context

							if query_context.identifier and query_context.identifier ~= "" then
								self.dialogue_state_handler:add_playing_dialogue(query_context.identifier, source_id, t)
							end

							local dialogue_id = NetworkLookup.dialogues[result]

							network_manager.network_transmit:send_rpc_clients("rpc_play_dialogue_event", go_id, is_level_unit, dialogue_id, dialogue_index)
						else
							dialogue.currently_playing_id = nil

							Application.warning("Couldn't play fallback dialogue")

							extension.dialogue_timer = 3
						end
					end

					dialogue.currently_playing_unit = dialogue_actor_unit
					dialogue.used_query = query
					local speaker_name = nil
					local breed_data = Unit.get_data(dialogue_actor_unit, "breed")

					if breed_data then
						speaker_name = breed_data.name
					else
						speaker_name = extension.context.player_profile
					end

					extension.last_query_sound_event = sound_event
					dialogue.speaker_name = speaker_name
					dialogue.currently_playing_subtitle = subtitles_event
					extension.currently_playing_dialogue = dialogue
					playing_dialogues[dialogue] = category_setting
					playing_units[dialogue_actor_unit] = extension

					if source_id ~= 0 then
						Managers.telemetry.events:vo_event_played(sound_event, result, speaker_name)
					end

					if player_manager:owner(dialogue_actor_unit) ~= nil or Unit.has_data(dialogue_actor_unit, "dialogue_face_anim") then
						function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, anim_face_event)
						function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, anim_dialogue_event)
					end

					if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
						function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, "talk_loop")
					end

					if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
						function_command_queue:queue_function_command(Unit.flow_event, dialogue_actor_unit, "action_talk_body")
					end
				end
			end
		end

		self:_update_story_lines(t)
		self:_update_player_jumping(t)
	end

	self:_update_new_events(t)
end

DialogueSystem.post_update = function (self, entity_system_update_context, t)
	self.function_command_queue:run_commands()
end

DialogueSystem._update_incapacitation = function (self, t)
	for _, extension in pairs(self.unit_extension_data) do
		local status_extension = extension.status_extension

		if status_extension then
			local is_incapacitated = status_extension:is_disabled()

			if not extension.is_incapacitated and is_incapacitated then
				extension.incapacitate_time = t
			end

			extension.is_incapacitated = is_incapacitated
		end
	end
end

DialogueSystem._update_new_events = function (self, t)
	local unit_extension_data = self.unit_extension_data
	local tagquery_database = self.tagquery_database
	local unit_alive = Unit.alive
	local input_event_queue = self.input_event_queue
	local input_event_queue_n = self.input_event_queue_n

	for i = 1, input_event_queue_n, 4 do
		repeat
			local unit = input_event_queue[i]

			if not unit_alive(unit) then
				break
			end

			local dialogue_category = nil

			if self.dialogues[input_event_queue[i + 2].dialogue_name] then
				dialogue_category = self.dialogues[input_event_queue[i + 2].dialogue_name].category
			end

			local extension = unit_extension_data[unit]

			if extension then
				if extension.is_incapacitated and t > extension.incapacitate_time + 0.1 and dialogue_category ~= "knocked_down_override" and input_event_queue[i + 2].is_ping ~= true then
					break
				end

				local event_name = input_event_queue[i + 1]
				local event_data = input_event_queue[i + 2]
				local identifier = input_event_queue[i + 3]
				local query = tagquery_database:create_query()
				local temp_table = FrameTable.alloc_table()
				local n_temp_table = 0

				for key, value in pairs(event_data) do
					temp_table[n_temp_table + 1] = key
					temp_table[n_temp_table + 2] = value
					n_temp_table = n_temp_table + 2
				end

				local breed_data = Unit.get_data(unit, "breed")
				local source_name = nil

				if breed_data then
					source_name = breed_data.dialogue_source_name or breed_data.name
				else
					local extension_data = self.unit_extension_data[unit]
					source_name = extension_data.context.player_profile
				end

				query:add("concept", event_name, "source", unit, "source_name", source_name, "identifier", identifier, unpack(temp_table))
				query:finalize()

				input_event_queue[i] = nil
				input_event_queue[i + 1] = nil
				input_event_queue[i + 2] = nil
			end
		until true
	end

	self.input_event_queue_n = 0

	self:_update_debug(t)
end

DialogueSystem.hot_join_sync = function (self, sender)
	return
end

DialogueSystem.has_local_player_moved_from_start_position = function (self)
	if DEDICATED_SERVER then
		return false
	end

	local local_player_unit = Managers.player:local_player().player_unit

	if Unit.alive(local_player_unit) then
		local extension = ScriptUnit.extension(local_player_unit, "dialogue_system")

		if extension.local_player_has_moved and not debug_vo_by_file then
			return true
		end

		local player_pos = POSITION_LOOKUP[local_player_unit]

		if player_pos ~= nil and Vector3.distance(player_pos, Vector3Aux.unbox(extension.local_player_start_pos)) > 2 then
			extension.local_player_has_moved = true
		end
	end
end

DialogueSystem.player_shield_check = function (self, unit, slot)
	local has_shield = 0

	if Unit.alive(unit) and Managers.player:owner(unit) ~= nil then
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local weapon_slot = inventory_extension:get_wielded_slot_name()
		local weapon_data = inventory_extension:get_slot_data(weapon_slot)

		if slot then
			weapon_data = inventory_extension:get_slot_data(slot)
		end

		if weapon_data then
			local item_data = weapon_data.item_data
			local item_type = item_data and item_data.item_type

			if item_type and string.find(item_type, "shield") then
				has_shield = 1
			end
		end
	end

	return has_shield
end

DialogueSystem.trigger_general_unit_event = function (self, unit, event)
	local audio_system_extension = Managers.state.entity:system("audio_system")

	audio_system_extension:_play_event(event, unit, 0)

	local general_event_id = NetworkLookup.sound_events[event]
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_storage:go_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_server_audio_unit_event", general_event_id, unit_id, 0)
end

DialogueSystem.trigger_targeted_by_ratling = function (self, player_unit)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if player_unit and owner ~= nil then
		local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event("ratling_target", event_data)
	end
end

DialogueSystem.trigger_attack = function (self, player_unit, enemy_unit, should_backstab, blackboard)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if Unit.alive(player_unit) and owner and ALIVE[enemy_unit] then
		local dialogue_extension = ScriptUnit.extension(enemy_unit, "dialogue_system")
		local switch_group = dialogue_extension.wwise_voice_switch_group
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, enemy_unit, dialogue_extension.voice_node)

		if switch_group then
			local switch_value = dialogue_extension.wwise_voice_switch_value

			WwiseWorld.set_switch(wwise_world, switch_group, switch_value, wwise_source)
		end

		if not owner.bot_player then
			local breed = blackboard.breed
			local network_manager = Managers.state.network
			local sound_event = nil

			if should_backstab then
				sound_event = breed.backstab_player_sound_event
			else
				sound_event = breed.attack_player_sound_event
			end

			local player_data = Managers.player:owner(player_unit)
			local unit_id = NetworkUnit.game_object_id(enemy_unit)
			local general_event = breed.attack_general_sound_event

			if player_data.local_player and sound_event then
				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
			else
				if sound_event then
					local sound_event_id = NetworkLookup.sound_events[sound_event]

					RPC.rpc_server_audio_unit_event(owner.peer_id, sound_event_id, unit_id, 0)
				end

				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event(general_event, enemy_unit, 0)
			end

			local general_event_id = NetworkLookup.sound_events[general_event]

			network_manager.network_transmit:send_rpc_clients_except("rpc_server_audio_unit_dialogue_event", owner.peer_id, general_event_id, unit_id, 0)
		end
	end
end

DialogueSystem.trigger_backstab = function (self, player_unit, enemy_unit, blackboard)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if Unit.alive(player_unit) and owner and ALIVE[enemy_unit] then
		local dialogue_extension = ScriptUnit.extension(enemy_unit, "dialogue_system")
		local switch_group = dialogue_extension.wwise_voice_switch_group
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, enemy_unit, dialogue_extension.voice_node)

		if switch_group then
			local switch_value = dialogue_extension.wwise_voice_switch_value

			WwiseWorld.set_switch(wwise_world, switch_group, switch_value, wwise_source)
		end

		if not owner.bot_player then
			local breed = blackboard.breed
			local sound_event = breed.backstab_player_sound_event
			local player_data = Managers.player:owner(player_unit)
			local unit_id = NetworkUnit.game_object_id(enemy_unit)

			if player_data.local_player and sound_event then
				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
			elseif sound_event then
				local sound_event_id = NetworkLookup.sound_events[sound_event]

				RPC.rpc_server_audio_unit_event(owner.peer_id, sound_event_id, unit_id, 0)
			end
		end
	end
end

DialogueSystem.trigger_flanking = function (self, player_unit, enemy_unit)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if Unit.alive(player_unit) and owner and ALIVE[enemy_unit] then
		local ai_base_extension = ScriptUnit.extension(enemy_unit, "ai_system")
		local breed = ai_base_extension:breed()

		if breed.flanking_sound_event then
			local flanking_event = breed.flanking_sound_event
			local unit_id = NetworkUnit.game_object_id(enemy_unit)

			if Managers.player:local_player().player_unit == player_unit then
				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event(flanking_event, enemy_unit, 0)
			else
				local flanking_event_id = NetworkLookup.sound_events[flanking_event]

				RPC.rpc_server_audio_unit_event(owner.peer_id, flanking_event_id, unit_id, 0)

				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event(flanking_event, enemy_unit, 0)
			end
		end
	end
end

DialogueSystem.trigger_backstab_hit = function (self, player_unit, enemy_unit)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)
	local game = Managers.state.network:game()

	if Unit.alive(player_unit) and owner and ALIVE[enemy_unit] and game and not owner.bot_player then
		local to_target_vec = Vector3.normalize(POSITION_LOOKUP[enemy_unit] - POSITION_LOOKUP[player_unit])
		local unit_id = Managers.state.network.unit_storage:go_id(player_unit)
		local player_rot = GameSession.game_object_field(game, unit_id, "aim_direction")
		local unit_fwd_dir = Quaternion.forward(Quaternion.look(player_rot))

		if Vector3.dot(to_target_vec, unit_fwd_dir) < 0.4 then
			local backstabhit_event = "Play_hud_enemy_attack_back_hit"
			local player_data = Managers.player:owner(player_unit)

			if player_data.local_player then
				local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

				first_person_extension:play_hud_sound_event(backstabhit_event, nil, false)
			else
				local go_id = NetworkUnit.game_object_id(player_unit)
				local event_id = NetworkLookup.sound_events[backstabhit_event]

				RPC.rpc_play_first_person_sound(player_data.peer_id, go_id, event_id, POSITION_LOOKUP[player_unit])
			end
		end
	end
end

DialogueSystem.get_random_player = function (self)
	local players = Managers.player:human_and_bot_players()
	local unit_list = {}
	local unit_list_n = 0

	for _, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) and ScriptUnit.extension(unit, "health_system"):is_alive() then
			unit_list_n = unit_list_n + 1
			unit_list[unit_list_n] = unit
		end
	end

	if unit_list_n > 0 then
		local unit = unit_list[math.random(1, unit_list_n)]

		return unit
	end

	return nil
end

DialogueSystem._update_story_lines = function (self, t)
	local next_story_line_update_t = self.next_story_line_update_t

	if next_story_line_update_t < t then
		self.next_story_line_update_t = t + self._story_tick_time
		local random_player = DialogueSystem:get_random_player()

		if random_player ~= nil then
			local dialogue_input = ScriptUnit.extension_input(random_player, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("story_trigger", event_data)
		end
	end
end

local current_cutscene_subs = {}
local cutscene_speaker = nil
local end_time = 0
local end_delay = 5

DialogueSystem.trigger_cutscene_subtitles = function (self, event_name, speaker, end_hangtime)
	enabled = false
	cutscene_speaker = speaker
	end_delay = end_hangtime

	for k, value in pairs(SpecialSubtitleEvents[event_name]) do
		current_cutscene_subs[k] = value + Managers.time:time("game")
	end
end

DialogueSystem._update_cutscene_subtitles = function (self, t)
	local hud_system = Managers.state.entity:system("hud_system")

	for k, value in pairs(current_cutscene_subs) do
		if value < t then
			hud_system:add_subtitle(cutscene_speaker, k)

			current_cutscene_subs[k] = nil
		end

		end_time = t + end_delay
	end

	if end_time < t and cutscene_speaker ~= nil then
		hud_system:remove_subtitle(cutscene_speaker)

		enabled = true
	end
end

local current_sound_event_subtitles = {}

DialogueSystem.trigger_sound_event_with_subtitles = function (self, sound_event, subtitle_event, speaker_name)
	local playing_event_with_subtitle = {
		subtitle_event = subtitle_event,
		speaker_name = speaker_name,
		sound_event = sound_event
	}
	current_sound_event_subtitles[#current_sound_event_subtitles + 1] = playing_event_with_subtitle
end

DialogueSystem._update_sound_event_subtitles = function (self)
	if #current_sound_event_subtitles > 0 then
		local event = current_sound_event_subtitles[1]
		local current_speaker = event.speaker_name
		local subtitle_event = event.subtitle_event
		local sound_event = event.sound_event
		local hud_system = Managers.state.entity:system("hud_system")

		if not event.has_started_playing then
			hud_system:add_subtitle(current_speaker, subtitle_event)

			local id = WwiseWorld.trigger_event(self.wwise_world, sound_event)
			event.id = id
			event.has_started_playing = true
		elseif event.id and not WwiseWorld.is_playing(self.wwise_world, event.id) then
			hud_system:remove_subtitle(current_speaker)
			table.remove(current_sound_event_subtitles, 1)
		end
	end
end

DialogueSystem.disable = function (self)
	enabled = false
end

DialogueSystem.enable = function (self)
	enabled = true
end

DialogueSystem.reset_memory_time = function (self, memory, name, unit)
	local newtime = LOCAL_GAMETIME - 2000

	if Unit.alive(unit) then
		ScriptUnit.extension(unit, "dialogue_system")[memory][name] = newtime
	end

	if name == "time_since_conversation" then
		self.next_story_line_update_t = 0
	end
end

DialogueSystem.trigger_story_dialogue = function (self, unit)
	if Unit.alive(unit) then
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.is_forced = true

		dialogue_input:trigger_dialogue_event("story_trigger", event_data)
	end
end

local num_of_jumps = 0
local jump_tick_time = 0

DialogueSystem._update_player_jumping = function (self, t)
	if DEDICATED_SERVER then
		return
	end

	local player_input = Managers.input.input_services.Player
	local local_player_unit = Managers.player:local_player().player_unit

	if Unit.alive(local_player_unit) then
		local locomotion_extension = ScriptUnit.extension(local_player_unit, "locomotion_system")

		if (player_input:get("jump") or player_input:get("jump_only")) and locomotion_extension:jump_allowed() then
			num_of_jumps = num_of_jumps + 1

			if num_of_jumps == 1 then
				jump_tick_time = t
			end
		end

		if t > jump_tick_time + DialogueSettings.bunny_jumping.tick_time then
			jump_tick_time = t

			if DialogueSettings.bunny_jumping.jump_threshold < num_of_jumps then
				SurroundingAwareSystem.add_event(local_player_unit, "bunny_trigger", DialogueSettings.friends_close_distance)
			end

			num_of_jumps = 0
		end
	end
end

DialogueSystem.rpc_trigger_dialogue_event = function (self, sender, go_id, event_id, event_data_array, event_data_array_types, identifier)
	local unit = Managers.state.unit_storage:unit(go_id)

	if not unit then
		return
	end

	if FROZEN[unit] then
		return
	end

	local event_data_array_n = #event_data_array

	for i = 1, event_data_array_n, 1 do
		local value_id = event_data_array[i]
		local is_bool = event_data_array_types[i]

		if is_bool then
			event_data_array[i] = value_id - 1
		else
			local value = NetworkLookup.dialogue_event_data_names[value_id]
			event_data_array[i] = value
		end
	end

	local event_data = FrameTable.alloc_table()

	table.array_to_table(event_data_array, event_data_array_n, event_data)

	local event_name = NetworkLookup.dialogue_events[event_id]
	local input_event_queue = self.input_event_queue
	local input_event_queue_n = self.input_event_queue_n
	input_event_queue[input_event_queue_n + 1] = unit
	input_event_queue[input_event_queue_n + 2] = event_name
	input_event_queue[input_event_queue_n + 3] = event_data
	input_event_queue[input_event_queue_n + 4] = identifier or ""
	self.input_event_queue_n = input_event_queue_n + 4
end

DialogueSystem.rpc_play_marker_event = function (self, sender, go_id, marker_id)
	local marker_unit = Managers.state.network:game_object_or_level_unit(go_id, false)

	if not marker_unit then
		return
	end

	if FROZEN[marker_unit] then
		return
	end

	if self.playing_units[marker_unit] then
		Application.error("[DialogueSystem] Marker couldn't play since %q was already talking", marker_unit)
	end

	local marker_sound_event = NetworkLookup.markers[marker_id]
	local extension = self.unit_extension_data[marker_unit]
	local wwise_world = self.wwise_world
	local wwise_source_id = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

	if wwise_source_id ~= extension.wwise_source_id and extension.wwise_voice_switch_group then
		extension.wwise_source_id = wwise_source_id

		WwiseWorld.set_switch(wwise_world, extension.wwise_voice_switch_group, extension.wwise_voice_switch_value, wwise_source_id)
		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
	end

	WwiseWorld.trigger_event(wwise_world, marker_sound_event, wwise_source_id)
end

DialogueSystem.rpc_play_dialogue_event = function (self, sender, go_id, is_level_unit, dialogue_id, dialogue_index)
	local dialogue_actor_unit = Managers.state.network:game_object_or_level_unit(go_id, is_level_unit)

	if not dialogue_actor_unit then
		return
	end

	if FROZEN[dialogue_actor_unit] then
		return
	end

	local dialogue_name = NetworkLookup.dialogues[dialogue_id]
	local dialogue = self.dialogues[dialogue_name]

	if dialogue.currently_playing_id then
		return
	end

	local extension = self.unit_extension_data[dialogue_actor_unit]
	local wwise_world = self.wwise_world
	local wwise_source_id = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

	if wwise_source_id ~= extension.wwise_source_id and extension.wwise_voice_switch_group then
		extension.wwise_source_id = wwise_source_id

		WwiseWorld.set_switch(wwise_world, extension.wwise_voice_switch_group, extension.wwise_voice_switch_value, wwise_source_id)
		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
	end

	local sound_event, subtitles_event, anim_face_event, anim_dialogue_event = get_dialogue_event(dialogue, dialogue_index)
	local playing_id, _ = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

	fassert(playing_id, "Couldn't play sound event %s", sound_event)

	dialogue.currently_playing_id = playing_id
	self.playing_units[dialogue_actor_unit] = extension
	dialogue.currently_playing_unit = dialogue_actor_unit
	local speaker_name = nil
	local breed_data = Unit.get_data(dialogue_actor_unit, "breed")

	if breed_data then
		speaker_name = breed_data.name
	else
		speaker_name = extension.context.player_profile
	end

	extension.last_query_sound_event = sound_event
	dialogue.speaker_name = speaker_name
	dialogue.currently_playing_subtitle = subtitles_event
	extension.currently_playing_dialogue = dialogue
	local dialogue_category = dialogue.category
	local category_setting = dialogue_category_config[dialogue_category]
	self.playing_dialogues[dialogue] = category_setting
	local function_command_queue = self.function_command_queue
	local player_manager = Managers.player

	if player_manager:owner(dialogue_actor_unit) ~= nil or Unit.has_data(dialogue_actor_unit, "dialogue_face_anim") then
		function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, anim_face_event)
		function_command_queue:queue_function_command(Unit.animation_event, dialogue_actor_unit, anim_dialogue_event)
	end

	if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
		Unit.animation_event(dialogue_actor_unit, "talk_loop")
	end

	if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
		Unit.flow_event(dialogue_actor_unit, "action_talk_body")
	end
end

DialogueSystem.rpc_interrupt_dialogue_event = function (self, sender, go_id, is_level_unit)
	local dialogue_actor_unit = Managers.state.network:game_object_or_level_unit(go_id, is_level_unit)

	if not dialogue_actor_unit then
		return
	end

	if self.frozen_unit_extension_data[dialogue_actor_unit] then
		return
	end

	local extension = self.unit_extension_data[dialogue_actor_unit]
	local dialogue = extension.currently_playing_dialogue

	if dialogue then
		local wwise_world = self.wwise_world
		local is_currently_playing = WwiseWorld.is_playing(wwise_world, dialogue.currently_playing_id)

		if is_currently_playing then
			WwiseWorld.stop_event(wwise_world, dialogue.currently_playing_id)
		end

		dialogue.currently_playing_id = nil
		extension.currently_playing_dialogue = nil
		self.playing_units[dialogue_actor_unit] = nil
		local player_manager = Managers.player

		if player_manager:owner(dialogue_actor_unit) ~= nil or Unit.has_data(dialogue_actor_unit, "dialogue_face_anim") then
			Unit.animation_event(dialogue_actor_unit, "face_neutral")
			Unit.animation_event(dialogue_actor_unit, "dialogue_end")
		elseif Unit.has_data(dialogue_actor_unit, "enemy_dialogue_face_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
			Unit.animation_event(dialogue_actor_unit, "talk_end")
		end

		if Unit.has_data(dialogue_actor_unit, "enemy_dialogue_body_anim") and Unit.has_animation_state_machine(dialogue_actor_unit) then
			Unit.animation_event(dialogue_actor_unit, "talk_body_end")
		end
	end
end

local debug_font_size = 16
local debug_font = "gw_arial_16"
local debug_font_mtrl = "materials/fonts/" .. debug_font
local debug_vo_by_file_gui = nil
local debug_tick_time = 0
local debug_text = {}
local DebugVo = {}

DialogueSystem._debug_draw_context = function (self, gui, start_x, start_y, max_context_width, context_name, context_data, context_name_color, data_color)
	Gui.text(gui, context_name, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), context_name_color)

	local min, max = Gui.text_extents(gui, tostring(context_name), debug_font_mtrl, debug_font_size)
	local width = max.x - min.x
	max_context_width = math.max(width, max_context_width)
	local context_start_y = start_y
	start_y = start_y + debug_font_size
	local kv_order = {}
	local max_key_width = 0
	local key_start_y = start_y

	for key, _ in pairs(context_data) do
		min, max = Gui.text_extents(gui, tostring(key), debug_font_mtrl, debug_font_size)
		width = max.x - min.x
		max_key_width = math.max(width, max_key_width)
		start_y = start_y + debug_font_size
		kv_order[#kv_order + 1] = key
	end

	table.sort(kv_order)

	max_key_width = max_key_width + 10
	start_y = key_start_y
	local max_value_width = 0

	for i = 1, #kv_order, 1 do
		local key = kv_order[i]

		Gui.text(gui, tostring(key), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), data_color)

		local value = context_data[key]
		local value_string = nil

		if type(value) == "number" then
			value_string = string.format("%.2f", value)
		else
			value_string = tostring(value)
		end

		Gui.text(gui, value_string, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + max_key_width, start_y, 250), data_color)

		start_y = start_y + debug_font_size
		min, max = Gui.text_extents(gui, value_string, debug_font_mtrl, debug_font_size)
		width = max.x - min.x
		max_value_width = math.max(width, max_value_width)
	end

	max_context_width = math.max(max_context_width, max_key_width + max_value_width)

	Gui.rect(gui, Vector3(start_x - 2, context_start_y - 2, 249), Vector2(max_context_width, start_y - context_start_y), Color(200, 20, 20, 20))

	start_y = start_y + debug_font_size * 0.5

	return start_y, max_context_width
end

DialogueSystem._update_dialogue_debug_all_contexts = function (self, gui, res_x, res_y, unit_name_color, context_name_color, data_color)
	if script_data.dialogue_debug_all_contexts then
		local contexts_by_object = self.tagquery_database.contexts_by_object
		local start_x = 230
		local start_y = 20 + debug_font_size
		local context_spacing = 10
		local global_context = self.global_context
		local _, max_context_width = self:_debug_draw_context(gui, start_x, start_y, 0, "global_context", global_context, context_name_color, data_color)
		start_x = start_x + max_context_width + context_spacing

		for unit, contexts in pairs(contexts_by_object) do
			repeat
				local player_data = Managers.player:owner(unit)
				local unit_name = nil

				if player_data then
					unit_name = player_data.viewport_name or player_data.peer_id

					if false then
						break
					end

					start_y = 20 + debug_font_size

					Gui.text(gui, unit_name, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), unit_name_color)

					start_y = start_y + debug_font_size
					max_context_width = 0

					for context_name, context_data in pairs(contexts) do
						start_y, max_context_width = self:_debug_draw_context(gui, start_x, start_y, max_context_width, context_name, context_data, context_name_color, data_color)
					end

					start_x = start_x + max_context_width + context_spacing
				end
			until true
		end
	end
end

DialogueSystem._debug_draw_query = function (self, gui, start_x, start_y, data_color, query, header_color)
	Gui.text(gui, string.format("Query result %s", query.result or "FAILURE"), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), header_color)

	local kv_order = {}
	local max_key_width = 0
	local max_value_width = 0

	for key, value in pairs(query.query_context) do
		local text_key_min, text_key_max = Gui.text_extents(gui, tostring(key), debug_font_mtrl, debug_font_size)
		local key_width = text_key_max.x - text_key_min.x
		max_key_width = math.max(key_width, max_key_width)
		local text_value_min, text_value_max = Gui.text_extents(gui, tostring(value), debug_font_mtrl, debug_font_size)
		local value_width = text_value_max.x - text_value_min.x
		max_value_width = math.max(value_width, max_value_width)
		kv_order[#kv_order + 1] = key
	end

	max_key_width = max_key_width + 10
	max_value_width = max_value_width + 10

	table.sort(kv_order)

	for i, key in ipairs(kv_order) do
		start_y = start_y - debug_font_size

		Gui.text(gui, tostring(key), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), data_color)
		Gui.text(gui, tostring(query.query_context[key]), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + max_key_width, start_y, 250), data_color)
	end

	start_y = start_y - debug_font_size

	return start_x, start_y, max_key_width + max_value_width
end

DialogueSystem._update_dialogue_debug_last_query = function (self, gui, res_x, res_y, data_color, t)
	if script_data.dialogue_debug_last_query then
		local start_x = 150
		local start_y = res_y - 20
		local next_story_update_t = self.next_story_line_update_t
		local text = string.format("Time: %.2f (%.2f) - Next story line update at: %.2f", t, LOCAL_GAMETIME, next_story_update_t)

		Gui.text(gui, text, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), Colors.get("white"))

		start_y = start_y - debug_font_size
		local unused_query_offset = nil
		local used_color = Color(250, 100, 255, 100)
		local unused_color = Colors.get("gray")
		local unit_extension_data = self.unit_extension_data

		for _, extension in pairs(unit_extension_data) do
			repeat
				local last_query = extension.last_query

				if not last_query then
					break
				end

				local currently_playing_dialogue = extension.currently_playing_dialogue

				if currently_playing_dialogue then
					local used_query = currently_playing_dialogue.used_query
					local original_start_y = start_y
					start_x, start_y, unused_query_offset = self:_debug_draw_query(gui, start_x, start_y, data_color, used_query, used_color)

					if last_query ~= used_query then
						local _, unused_query_start_y = self:_debug_draw_query(gui, start_x + unused_query_offset, original_start_y, data_color, last_query, unused_color)
						start_y = math.min(start_y, unused_query_start_y)
					end
				else
					start_x, start_y = self:_debug_draw_query(gui, start_x, start_y, data_color, last_query, unused_color)
				end
			until true
		end
	end
end

DialogueSystem._update_dialogue_debug_rules = function (self, gui, res_x, res_y, context_name_color, data_color)
	if script_data.dialogue_debug_rules then
		local rules_debug_data = self.tagquery_database.debug_rules_table
		local start_x = res_x - 500
		local start_y = res_y - 50
		local string_lookups = self.tagquery_database.string_lookups

		for i, rule_data in ipairs(rules_debug_data) do
			local rule = rule_data.rule
			local text = string.format("Rule %q [%s]", rule.name, rule_data.rule_result)

			Gui.text(gui, text, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), context_name_color)

			start_y = start_y - debug_font_size

			if rule_data.criteria_results then
				local comparator_values = rule_data.comparator_values
				local criteria_values = rule_data.criteria_values

				for j, criteria_result in ipairs(rule_data.criteria_results) do
					local criteria_string = table.concat(rule.real_criterias[j], ",")
					local value_1, value_2 = nil

					if self.tagquery_database.criteria_type_is_string[rule.real_criterias[j][2]] then
						value_1 = tostring(criteria_values and table.find(string_lookups, criteria_values[j]))
						value_2 = tostring(comparator_values and table.find(string_lookups, comparator_values[j]))
					else
						if criteria_values then
							value_1 = string.format("%.2d", criteria_values[j] or 0)
						end

						if comparator_values then
							value_2 = string.format("%.2d", comparator_values[j] or 0)
						end
					end

					text = string.format("%q [%i] %s [%s %s]", criteria_string, j, criteria_result, value_1, value_2)

					Gui.text(gui, text, debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), data_color)

					start_y = start_y - debug_font_size
				end
			end
		end
	end
end

DialogueSystem._update_debug_vo_by_file_gui = function (self, gui, res_x, res_y, data_color)
	if debug_vo_by_file_gui then
		local start_x = res_x - 800
		local start_y = 120
		local start_x2 = 100
		local start_y2 = res_y - 100
		local context_height = 0

		Gui.text(gui, tostring("Line: " .. debug_text.cl .. "/" .. debug_text.total), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y, 250), data_color)
		Gui.text(gui, tostring("Sound Event: " .. debug_text.curret_event), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y + 20, 250), data_color)

		if debug_text.speaker then
			Gui.text(gui, tostring("Speaker: " .. debug_text.speaker), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y + 40, 250), data_color)
		end

		Gui.text(gui, tostring("Face Animation: " .. debug_text.current_face), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x, start_y + 60, 250), data_color)

		if Managers.localizer:exists(debug_text.subtitle) then
			local dialogue_text = Localize(debug_text.subtitle)

			Gui.text(gui, tostring("Subtitle: " .. dialogue_text), debug_font_mtrl, tonumber(debug_font_size - 1), debug_font, Vector3(start_x, start_y + 80, 250), Color(250, 255, 250, 0))
		end

		for i, _ in ipairs(debug_text.missing_vo) do
			context_height = i
		end

		if context_height ~= 0 then
			Gui.rect(gui, Vector2(start_x2 - 15, start_y2 + 15), Vector2(300, -30 - 10 * context_height), Color(200, 20, 20, 20))
		end

		for i, _ in ipairs(debug_text.missing_vo) do
			Gui.text(gui, tostring("Missing Sound for: " .. debug_text.missing_vo[i]), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x2, start_y2 - 10 * i, 250), data_color)
		end

		local player_input = Managers.input.input_services.Player

		if player_input:get("interact") then
			if debug_vo_by_file then
				DebugVo_pause()

				debug_text.pause_state = true
			else
				DebugVo_play()

				debug_text.pause_state = false
			end
		end

		if debug_text.pause_state then
			Gui.text(gui, tostring("Press 'E' to unpause"), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + 300, start_y + 60, 250), Color(255, 100, 100, 0))
			Gui.text(gui, tostring("PAUSED"), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + 420, start_y + 60, 250), Color(255, 255, 255, 0))
		else
			Gui.text(gui, tostring("Press 'E' to pause"), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + 300, start_y + 60, 250), Color(255, 120, 120, 0))
		end

		if debug_text.fast_play then
			Gui.text(gui, tostring("Fast play active"), debug_font_mtrl, debug_font_size, debug_font, Vector3(start_x + 300, start_y + 40, 250), Color(120, 120, 255, 0))
		end

		Gui.rect(gui, Vector3(start_x - 15, start_y - 15, 249), Vector2(500, start_y), Color(200, 20, 20, 20))
	end
end

DialogueSystem._update_debug = function (self, t)
	local gui = self.gui
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h
	local unit_name_color = Color(250, 255, 120, 0)
	local context_name_color = Color(250, 255, 255, 100)
	local data_color = Color(250, 255, 120, 0)

	self:_update_dialogue_debug_all_contexts(gui, res_x, res_y, unit_name_color, context_name_color, data_color)
	self:_update_dialogue_debug_last_query(gui, res_x, res_y, data_color, t)
	self:_update_dialogue_debug_rules(gui, res_x, res_y, context_name_color, data_color)

	if debug_vo_by_file then
		local tick_add = 0.1

		if debug_text.fast_play then
			tick_add = 1
		end

		if t > debug_tick_time + tick_add then
			debug_tick_time = t
			debug_text.cl, debug_text.total, debug_text.current_face, debug_text.curret_event, debug_text.speaker, debug_text.missing_vo, debug_text.fast_play, debug_text.subtitle = DebugVo.play()
		end
	end

	self:_update_debug_vo_by_file_gui(gui, res_x, res_y, data_color)
end

DialogueSystem.debug_play_voice = function (self, profile_name, event_name, is_npc)
	local player_manager = Managers.player
	local human_and_bot_players = player_manager:human_and_bot_players()

	for _, player in pairs(human_and_bot_players) do
		local profile_index = player:profile_index()
		local profile = SPProfiles[profile_index]

		if profile.display_name == profile_name and Unit.alive(player.player_unit) then
			local dialogue_input = ScriptUnit.extension_input(player.player_unit, "dialogue_system")
			local source_id = dialogue_input:play_voice_debug(event_name)

			return source_id
		end
	end

	if is_npc then
		local dummy_unit = DialogueSystem:get_random_player()
		local dialogue_input = ScriptUnit.extension_input(dummy_unit, "dialogue_system")
		local source_id = dialogue_input:play_voice_debug(event_name)

		return source_id
	end
end

DialogueSystem.debug_print_played_query = function (self, query, extension)
	print("--------------- PLAYED QUERY ---------------")
	print(query.result)
	print(extension.last_query_sound_event)
	print("Query context:")

	for key, value in pairs(query.query_context) do
		print(string.format("\t%-15s: %-15s", key, tostring(value)))
	end

	print("--------------- END OF PLAYED QUERY ---------------")
end

DialogueSystem.debug_play_dialogue = function (self)
	local local_player_unit = Managers.player:local_player().player_unit

	DialogueSystem:reset_memory_time("faction_memory", "time_since_conversation", local_player_unit)

	local dialogue_input = ScriptUnit.extension_input(local_player_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_dialogue_event("story_trigger", event_data)
end

function DebugVo_pause()
	DebugVo.pause()
end

function DebugVo_play()
	DebugVo.play()
end

function DebugVo_jump_to(line_number)
	DebugVo.jump_to(line_number)
end

function DebugVoByFile(file_name, quick)
	local fast_play = quick
	local currently_playing_id, is_currently_playing, actor_unit, wwise_world = nil
	local missing_vo = {}
	local current_file = {
		event_names = {},
		profile_names = {},
		sound_events = {},
		face_animations = {},
		dialogue_animations = {},
		localization_strings = {}
	}
	local cl = 1
	local level_key = Managers.state.game_mode:level_key()
	local _dialogue_level_start_delay = DialogueSettings.dialogue_level_start_delay
	local _story_tick_time = DialogueSettings.story_tick_time
	local dialogue_override = LevelSettings[level_key].override_dialogue_start_delay

	if dialogue_override then
		_dialogue_level_start_delay = dialogue_override.dialogue_level_start_delay
		_story_tick_time = dialogue_override.story_tick_time
	end

	DebugVo.play = function ()
		if cl < #current_file.sound_events then
			local is_npc = true
			local player_manager = Managers.player
			local human_and_bot_players = player_manager:human_and_bot_players()
			local human_and_bot_players_n = 0

			for index, player in pairs(human_and_bot_players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]

				if profile == nil then
					print("That player profile does not exist")

					return
				end

				if profile.display_name == current_file.profile_names[cl] and Unit.alive(player.player_unit) then
					actor_unit = player.player_unit
					local world = Managers.world:world("level_world")
					wwise_world = Managers.world:wwise_world(world)
					is_npc = false
				end
			end

			if is_npc then
				local dummy_unit = DialogueSystem:get_random_player()
				actor_unit = dummy_unit
				local world = Managers.world:world("level_world")
				wwise_world = Managers.world:wwise_world(world)
			end

			if currently_playing_id then
				is_currently_playing = WwiseWorld.is_playing(wwise_world, currently_playing_id)
			else
				local source_id = DialogueSystem:debug_play_voice(current_file.profile_names[cl], current_file.sound_events[cl], is_npc)

				if source_id ~= nil then
					currently_playing_id = source_id
					is_currently_playing = WwiseWorld.is_playing(wwise_world, source_id)
				end

				if source_id == 0 then
					missing_vo[#missing_vo + 1] = current_file.sound_events[cl]
				end
			end

			if not is_currently_playing or fast_play then
				currently_playing_id = nil
				cl = cl + 1

				if player_manager:owner(actor_unit) ~= nil then
					Unit.animation_event(actor_unit, "face_neutral")
					Unit.animation_event(actor_unit, "dialogue_end")
				end
			elseif current_file.face_animations[cl] ~= nil and current_file.dialogue_animations[cl] ~= nil and player_manager:owner(actor_unit) ~= nil then
				Unit.animation_event(actor_unit, current_file.face_animations[cl])
				Unit.animation_event(actor_unit, current_file.dialogue_animations[cl])
			end

			debug_vo_by_file = true
			debug_vo_by_file_gui = true
			_dialogue_level_start_delay = _dialogue_level_start_delay + 999
			_story_tick_time = _story_tick_time + 999
		else
			debug_vo_by_file = false
			debug_vo_by_file_gui = false
			fast_play = false

			printf("Missing Sounds START")

			for i, missing in ipairs(missing_vo) do
				printf(tostring(missing_vo[i]))
			end

			printf("Missing Sounds END")
		end

		return cl, #current_file.sound_events, current_file.face_animations[cl], current_file.sound_events[cl], current_file.profile_names[cl], missing_vo, fast_play, current_file.localization_strings[cl]
	end

	DebugVo.pause = function ()
		debug_vo_by_file = false
		_dialogue_level_start_delay = _dialogue_level_start_delay
		_story_tick_time = _story_tick_time
	end

	DebugVo.jump_to = function (line_number)
		if type(line_number) == "number" then
			cl = line_number
		else
			for i = 1, #current_file.sound_events, 1 do
				if current_file.sound_events[i] == line_number then
					cl = i
				end
			end
		end
	end

	local function fetch(self)
		local file_environment = {
			OP = "EQ",
			define_rule = function (rule_definition)
				return
			end,
			add_dialogues = function (dialogues)
				for name, dialogue in pairs(dialogues) do
					local sound_events_n = dialogue.sound_events_n
					local char_short = string.sub(name, 0, 3)
					local profile_name = nil

					if char_short == "pes" then
						profile_name = "empire_soldier"
					elseif char_short == "pwh" then
						profile_name = "witch_hunter"
					elseif char_short == "pbw" then
						profile_name = "bright_wizard"
					elseif char_short == "pdr" then
						profile_name = "dwarf_ranger"
					elseif char_short == "pwe" then
						profile_name = "wood_elf"
					elseif char_short == "nfl" then
						profile_name = "ferry_lady"
					elseif char_short == "ntw" then
						profile_name = "grey_wizard"
					elseif char_short == "nik" then
						profile_name = "inn_keeper"
					elseif char_short == "nde" then
						profile_name = "dwarf_engineer"
					elseif char_short == "egs" then
						profile_name = "grey_seer"
					elseif char_short == "ect" then
						profile_name = "skaven_storm_vermin_champion"
					end

					for i = 1, sound_events_n, 1 do
						current_file.event_names[#current_file.event_names + 1] = name
						current_file.profile_names[#current_file.profile_names + 1] = profile_name
						current_file.sound_events[#current_file.sound_events + 1] = dialogue.sound_events[i]
						current_file.face_animations[#current_file.face_animations + 1] = dialogue.face_animations[i]
						current_file.dialogue_animations[#current_file.dialogue_animations + 1] = dialogue.dialogue_animations[i]
						current_file.localization_strings[#current_file.localization_strings + 1] = dialogue.localization_strings[i]

						printf(tostring(#current_file.event_names .. " -- " .. dialogue.sound_events[i]))
					end
				end
			end
		}
		local comp_file_name = "dialogues/generated/" .. file_name
		local file_function = require(comp_file_name)

		setfenv(file_function, file_environment)
		file_function()
	end

	fetch()
	DebugVo.play()
end

return
