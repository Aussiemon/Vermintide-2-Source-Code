-- chunkname: @scripts/entity_system/systems/dialogues/dialogue_system.lua

require("scripts/utils/function_command_queue")
require("scripts/entity_system/systems/dialogues/tag_query")
require("scripts/entity_system/systems/dialogues/tag_query_database")
require("scripts/entity_system/systems/dialogues/tag_query_loader")
require("scripts/entity_system/systems/dialogues/dialogue_state_handler")
require("scripts/entity_system/systems/dialogues/dialogue_queries")
require("scripts/entity_system/systems/dialogues/dialogue_flow_events")
require("scripts/settings/dialogue_settings")

local LIVE_EVENT_PACKAGES = require("scripts/settings/live_events_packages")
local GLOBAL_SOUND_EVENT_FILTERS = require("scripts/entity_system/systems/dialogues/global_sound_event_filters")

script_data.dialogue_debug_all_contexts = script_data.dialogue_debug_all_contexts or Development.parameter("dialogue_debug_all_contexts")
script_data.dialogue_debug_last_query = script_data.dialogue_debug_last_query or Development.parameter("dialogue_debug_last_query")
script_data.dialogue_debug_last_played_query = script_data.dialogue_debug_last_played_query or Development.parameter("dialogue_debug_last_played_query")
script_data.dialogue_debug_queries = script_data.dialogue_debug_queries or Development.parameter("dialogue_debug_queries")
script_data.dialogue_debug_rules = script_data.dialogue_debug_rules or Development.parameter("dialogue_debug_rules")
script_data.dialogue_debug_missing_vo_trigger_error_sound = script_data.dialogue_debug_missing_vo_trigger_error_sound or Development.parameter("dialogue_debug_missing_vo_trigger_error_sound")

local extensions = {
	"DialogueActorExtension",
}
local dialogue_category_config = DialogueSettings.dialogue_category_config
local enabled = true
local debug_vo_by_file

DialogueSystem = class(DialogueSystem, ExtensionSystemBase)

local function update_switch_group(wwise_world, wwise_source_id, extension)
	if wwise_source_id ~= extension.wwise_source_id then
		extension.wwise_source_id = wwise_source_id

		if extension.wwise_voice_switch_group and extension.wwise_voice_switch_value then
			WwiseWorld.set_switch(wwise_world, extension.wwise_voice_switch_group, extension.wwise_voice_switch_value, wwise_source_id)
		end

		if extension.wwise_career_switch_group and extension.wwise_career_switch_value then
			WwiseWorld.set_switch(wwise_world, extension.wwise_career_switch_group, extension.wwise_career_switch_value, wwise_source_id)
		end

		if extension.faction == "player" then
			WwiseWorld.set_switch(wwise_world, "husk", tostring(not extension.local_player), wwise_source_id)
		end

		if extension.vo_center_percent then
			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "vo_center_percent", extension.vo_center_percent)
		end
	end
end

DialogueSystem._load_special_event_dialogues = function (self, package_name, mechanism_name)
	local event_packages = LIVE_EVENT_PACKAGES[package_name]
	local event_dialogues = event_packages and event_packages.dialogues
	local additional_dialogues = event_dialogues and event_dialogues[mechanism_name]

	if additional_dialogues then
		for dialogue_idx = 1, #additional_dialogues do
			local file_name = additional_dialogues[dialogue_idx]

			if not self._loaded_event_dialogues[file_name] then
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

				self._loaded_event_dialogues[file_name] = true
			end
		end
	end
end

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
	self._story_trigger_freezes = 0
	self.tagquery_loader = TagQueryLoader:new(self.tagquery_database, self.dialogues)

	local max_num_args = 2

	self.function_command_queue = FunctionCommandQueue:new(max_num_args)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, "rpc_trigger_dialogue_event", "rpc_play_dialogue_event", "rpc_interrupt_dialogue_event", "rpc_update_current_wind")

	local level_name = entity_system_creation_context.startup_data.level_key
	local dialogue_filename = "dialogues/generated/" .. level_name
	local auto_load_files = DialogueSettings.auto_load_files
	local blocked_auto_load = DialogueSettings.blocked_auto_load_files[level_name]

	self._original_dialogue_settings = {}

	local level_settings = LevelSettings[level_name]
	local dialogue_settings_override = level_settings.override_dialogue_settings

	if dialogue_settings_override then
		for setting_name, value in pairs(dialogue_settings_override) do
			self._original_dialogue_settings[setting_name] = DialogueSettings[setting_name]
			DialogueSettings[setting_name] = value
		end
	end

	self._use_story_lines = Managers.state.game_mode:setting("use_story_lines")

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

	local level_key = Managers.level_transition_handler:get_current_level_key()
	local level_settings = LevelSettings[level_key]

	if not level_settings.tutorial_level then
		local live_event_interface = Managers.backend:get_interface("live_events")
		local special_events = live_event_interface and live_event_interface:get_special_events()

		if special_events then
			local mechanism_name = Managers.mechanism:current_mechanism_name()

			self._loaded_event_dialogues = {}

			for event_idx = 1, #special_events do
				local event_data = special_events[event_idx]
				local event_name = event_data.name

				self:_load_special_event_dialogues(event_name, mechanism_name)

				local mutators = event_data.mutators

				if mutators then
					for i = 1, #mutators do
						local mutator = mutators[i]

						self:_load_special_event_dialogues(mutator, mechanism_name)
					end
				end
			end
		end
	end

	self.tagquery_database:finalize_rules()

	local world = entity_system_creation_context.world

	self.world = world

	if not DEDICATED_SERVER then
		self.wwise_world = Managers.world:wwise_world(world)
		DialogueSystem._flow_calls_implementation = DialogueSystemFlow:new(self.wwise_world, Managers.state.entity:system("hud_system"))
	end

	self.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")

	if self.is_server then
		self.dialogue_state_handler = DialogueStateHandler:new(self.world)
	end

	self.input_event_queue = {}
	self.input_event_queue_n = 0
	self.faction_memories = {
		player = {},
		enemy = {},
	}

	local wwise_voice_switch_value_indices = {}

	for breed_name, breed in pairs(Breeds) do
		if breed.wwise_voice_switch_group then
			wwise_voice_switch_value_indices[breed_name] = 1
		end
	end

	self.wwise_voice_switch_value_indices = wwise_voice_switch_value_indices

	local current_level = entity_system_creation_context.startup_data.level_key
	local environment_variation_name = entity_system_creation_context.startup_data.environment_variation_name

	self.statistics_db = entity_system_creation_context.statistics_db
	self.global_context = {
		current_level = current_level,
		weather = environment_variation_name,
	}

	for _, profile in ipairs(SPProfiles) do
		self.global_context[profile.display_name] = false

		for _, career in ipairs(profile.careers) do
			self.global_context[career.display_name] = false
		end
	end

	local weave_manager = Managers.weave
	local weave_template = weave_manager:get_active_weave_template()

	if weave_template and self.is_server then
		local current_wind = weave_template.wind

		self.global_context.current_wind = current_wind
	end

	local dlc_level_dialogue_context = Managers.mechanism:get_level_dialogue_context()

	table.merge(self.global_context, dlc_level_dialogue_context)
	self.tagquery_database:set_global_context(self.global_context)

	self.global_context.level_time = 0
	self.next_story_line_update_t = DialogueSettings.story_start_delay
end

DialogueSystem.is_dialogue_playing = function (self)
	return table.size(self.playing_dialogues) > 0
end

DialogueSystem.destroy = function (self)
	self.tagquery_loader:unload_files()
	self.tagquery_database:destroy()
	World.destroy_gui(self.world, self.gui)
	self.network_event_delegate:unregister(self)

	if next(self._original_dialogue_settings) then
		for setting_name, value in pairs(self._original_dialogue_settings) do
			DialogueSettings[setting_name] = value
		end
	end

	table.clear(self)
end

DialogueSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {
		is_silenced = false,
		user_memory = {},
		context = {
			health = 1,
		},
		local_player = extension_init_data.local_player,
		dialogue_profile = extension_init_data.dialogue_profile,
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

			for i = 1, event_data_array_temp_n do
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
			if DEDICATED_SERVER then
				return
			end

			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(dialogue_system.world, extension.play_unit, extension.voice_node)

			update_switch_group(wwise_world, wwise_source_id, extension)

			local playing_id, _ = dialogue_system:_check_play_debug_sound(sound_event, extension.currently_playing_dialogue and extension.currently_playing_dialogue.currently_playing_subtitle or "")

			if not playing_id then
				return WwiseWorld.trigger_event(wwise_world, sound_event, use_occlusion, wwise_source_id)
			else
				return
			end
		end,
		play_voice_debug = function (self, sound_event)
			if DEDICATED_SERVER then
				return
			end

			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(dialogue_system.world, extension.play_unit, extension.voice_node)

			update_switch_group(wwise_world, wwise_source_id, extension)

			local playing_id, _ = dialogue_system:_check_play_debug_sound(sound_event, extension.currently_playing_dialogue and extension.currently_playing_dialogue.currently_playing_subtitle or "")

			if not playing_id then
				return WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)
			else
				return
			end
		end,
		trigger_query = function (self, event_data)
			local concept, source, test_query, test_user_context_list, test_global_context = unpack(event_data)

			dialogue_system.tagquery_database:debug_test_query(concept, source, test_query, test_user_context_list, test_global_context)
		end,
		set_silenced = function (self, new_is_silenced_value)
			local safe_is_silenced = new_is_silenced_value or false

			if extension.is_silenced ~= safe_is_silenced then
				extension.is_silenced = safe_is_silenced
			end
		end,
		is_silenced = function (self)
			return extension.is_silenced
		end,
	})

	extension.input = input

	self.tagquery_database:add_object_context(unit, "user_memory", extension.user_memory)
	self.tagquery_database:add_object_context(unit, "user_context", extension.context)

	local faction = extension_init_data.faction or Unit.get_data(unit, "faction")

	if faction then
		extension.faction = faction

		fassert(self.faction_memories[faction], "No such faction %q", tostring(faction))
		self.tagquery_database:add_object_context(unit, "faction_memory", self.faction_memories[faction])

		extension.faction_memory = self.faction_memories[faction]
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
		extension.wwise_career_switch_group = extension_init_data.wwise_career_switch_group
		extension.wwise_career_switch_value = extension_init_data.wwise_career_switch_value
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
		context.player_profile = extension.dialogue_profile or Unit.get_data(unit, "dialogue_profile")
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
	end,
}

DialogueSystem._update_currently_playing_dialogues = function (self, dt)
	local function_command_queue = self.function_command_queue
	local player_manager = Managers.player
	local unit_extension_data = self.unit_extension_data
	local playing_units = self.playing_units
	local unit_alive = Unit.alive

	for unit, extension in pairs(playing_units) do
		repeat
			if not unit_alive(unit) then
				playing_units[unit] = nil

				break
			end

			local currently_playing_dialogue = extension.currently_playing_dialogue

			fassert(currently_playing_dialogue, "Dialogue for playing unit was nil!")

			if currently_playing_dialogue.dialogue_timer == nil then
				playing_units[unit] = nil

				break
			end

			local is_currently_playing = currently_playing_dialogue.dialogue_timer - dt > 0

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

				do
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

					local result = used_query.result

					if result then
						local source = used_query.query_context.source
						local success_rule = used_query.validated_rule
						local on_done = success_rule.on_done

						if on_done then
							for i = 1, #on_done do
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

						if breed_data and not breed_data.is_player then
							speaker_name = breed_data.name
						elseif ScriptUnit.has_extension(source, "dialogue_system") then
							speaker_name = ScriptUnit.extension(source, "dialogue_system").context.player_profile
						end

						if currently_playing_dialogue.override_awareness then
							local event_data = FrameTable.alloc_table()

							event_data.dialogue_name_nopre = string.sub(result, 5)
							event_data.dialogue_name = result
							event_data.speaker = source
							event_data.distance = 1
							event_data.speakar_name = speaker_name
							event_data.sound_event = extension.last_query_sound_event

							for unit, extension in pairs(self.unit_extension_data) do
								extension.input:trigger_dialogue_event(currently_playing_dialogue.override_awareness, event_data)
							end
						else
							self.entity_manager:system("surrounding_aware_system"):add_system_event(source, "heard_speak", sound_distance, "speaker", source, "speaker_name", speaker_name, "sound_event", extension.last_query_sound_event or "unknown", "dialogue_name", result, "dialogue_name_nopre", string.sub(result, 5))
						end

						extension.last_query_sound_event = nil
					end
				end

				break
			end

			if currently_playing_dialogue.dialogue_timer then
				if extension.input:is_silenced() then
					if self.is_server then
						local go_id, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

						Managers.state.network.network_transmit:send_rpc_all("rpc_interrupt_dialogue_event", go_id, is_level_unit)
					end

					break
				end

				currently_playing_dialogue.dialogue_timer = currently_playing_dialogue.dialogue_timer - dt
			end
		until true
	end
end

DialogueSystem.update = function (self, context, t)
	return
end

DialogueSystem._handle_wwise_markers = function (self, dt, t)
	local marker_events = WwiseWorld.pull_marker_events(self.wwise_world)

	if marker_events then
		for i = 1, #marker_events do
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
	local source_player
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
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

			update_switch_group(wwise_world, wwise_source_id, extension)

			local source_id, _ = self:_check_play_debug_sound(sound_event, extension.currently_playing_dialogue and extension.currently_playing_dialogue.currently_playing_subtitle or "")

			source_id = source_id or WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

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

local EMPTY_TABLE = {}

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

	if enabled and (self.global_context.level_time > DialogueSettings.dialogue_level_start_delay or DialogueSystem:has_local_player_moved_from_start_position()) then
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
						-- Nothing
					else
						will_play = false

						break
					end
				end

				if dialogue.currently_playing_id then
					will_play = false
				end

				if extension.input:is_silenced() then
					will_play = false
				end

				if will_play then
					local network_manager = Managers.state.network

					for interrupt_dialogue, _ in pairs(interrupt_dialogue_list) do
						interrupt_dialogue_list[interrupt_dialogue] = nil

						local playing_unit = interrupt_dialogue.currently_playing_unit
						local go_id, is_level_unit = network_manager:game_object_or_level_id(playing_unit)

						network_manager.network_transmit:send_rpc_all("rpc_interrupt_dialogue_event", go_id, is_level_unit)
					end

					local go_id, is_level_unit = network_manager:game_object_or_level_id(dialogue_actor_unit)
					local filter_context = FrameTable.alloc_table()

					filter_context.query_context = query.query_context
					filter_context.global_context = self.global_context

					local user_context_list = self.tagquery_database:get_object_context(dialogue_actor_unit) or EMPTY_TABLE

					filter_context.user_context = user_context_list.user_context or EMPTY_TABLE
					filter_context.user_memory = user_context_list.user_memory or EMPTY_TABLE
					filter_context.faction_memory = user_context_list.faction_memory or EMPTY_TABLE

					local dialogue_index = DialogueQueries.get_filtered_dialogue_event_index(dialogue, filter_context, GLOBAL_SOUND_EVENT_FILTERS)

					dialogue.dialogue_timer = DialogueQueries.get_sound_event_duration(dialogue, dialogue_index)
					dialogue.used_query = query

					local additional_trigger = dialogue.additional_trigger or dialogue.additional_trigger_heard

					if additional_trigger then
						local event_data = FrameTable.alloc_table()
						local source = dialogue_actor_unit
						local speaker_name = "UNKNOWN"
						local breed_data = Unit.get_data(source, "breed")

						if breed_data and not breed_data.is_player then
							speaker_name = breed_data.name
						elseif source and ScriptUnit.has_extension(source, "dialogue_system") then
							speaker_name = ScriptUnit.extension(source, "dialogue_system").context.player_profile
						end

						event_data.dialogue_name_nopre = string.sub(result, 5)
						event_data.dialogue_name = result
						event_data.speaker = source
						event_data.speaker_name = speaker_name
						event_data.sound_event = extension.last_query_sound_event

						if not dialogue.additional_trigger_heard then
							event_data.distance = 1

							for unit, target_extension in pairs(self.unit_extension_data) do
								target_extension.input:trigger_dialogue_event(additional_trigger, event_data)
							end
						else
							local source_wp = POSITION_LOOKUP[source] or Unit.local_position(source, 0)
							local sound_distance = DialogueSettings.default_hear_distance

							for unit, target_extension in pairs(self.unit_extension_data) do
								local target_world_pos = POSITION_LOOKUP[unit] or Unit.local_position(unit, 0)
								local distance = Vector3.distance(source_wp, target_world_pos)

								event_data.distance = distance

								if distance <= sound_distance then
									target_extension.input:trigger_dialogue_event(additional_trigger, event_data)
								end
							end
						end
					end

					local query_context = query.query_context

					if query_context.identifier and query_context.identifier ~= "" then
						self.dialogue_state_handler:add_playing_dialogue(query_context.identifier, dialogue.sound_events[dialogue_index], t, dialogue.dialogue_timer)
					end

					local dialogue_id = NetworkLookup.dialogues[result]

					network_manager.network_transmit:send_rpc_all("rpc_play_dialogue_event", go_id, is_level_unit, dialogue_id, dialogue_index)
				end
			end
		end

		if self._use_story_lines then
			self:_update_story_lines(t)
		end

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

			local dialogue_category

			if self.dialogues[input_event_queue[i + 2].dialogue_name] then
				dialogue_category = self.dialogues[input_event_queue[i + 2].dialogue_name].category
			end

			local extension = unit_extension_data[unit]

			if not extension or extension.is_incapacitated and t > extension.incapacitate_time + 0.1 and dialogue_category ~= "knocked_down_override" and input_event_queue[i + 2].is_ping ~= true then
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
			local source_name

			if breed_data and not breed_data.is_player then
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
		until true
	end

	self.input_event_queue_n = 0
end

DialogueSystem.hot_join_sync = function (self, peer_id)
	if self.global_context.current_wind then
		local current_wind = self.global_context.current_wind
		local weave_name_id = NetworkLookup.weave_winds[current_wind]
		local network_transmit = Managers.state.network.network_transmit

		network_transmit:send_rpc("rpc_update_current_wind", peer_id, weave_name_id)
	end
end

DialogueSystem.has_local_player_moved_from_start_position = function (self)
	if DEDICATED_SERVER then
		return false
	end

	local local_player_unit = Managers.player:local_player().player_unit

	if Unit.alive(local_player_unit) and ScriptUnit.has_extension(local_player_unit, "dialogue_system") then
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
	local unit_id, is_level_unit = network_manager:game_object_or_level_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_server_audio_unit_event", general_event_id, unit_id, is_level_unit, 0)
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

DialogueSystem.trigger_attack = function (self, blackboard, player_unit, enemy_unit, should_backstab, long_attack)
	local player_manager = Managers.player
	local owner = player_manager:unit_owner(player_unit)

	if Unit.alive(player_unit) and owner and ALIVE[enemy_unit] then
		local dialogue_extension = ScriptUnit.extension(enemy_unit, "dialogue_system")
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, enemy_unit, dialogue_extension.voice_node)

		update_switch_group(wwise_world, wwise_source, dialogue_extension)

		if not owner.bot_player then
			local breed = blackboard.breed
			local network_manager = Managers.state.network
			local sound_event

			if should_backstab then
				sound_event = breed.backstab_player_sound_event
			elseif long_attack and breed.attack_player_sound_event_long then
				sound_event = breed.attack_player_sound_event_long
			else
				sound_event = breed.attack_player_sound_event
			end

			local sound_event_id = NetworkLookup.sound_events[sound_event]
			local player_data = Managers.player:owner(player_unit)
			local unit_id = NetworkUnit.game_object_id(enemy_unit)
			local general_event

			if long_attack and breed.attack_general_sound_event_long then
				general_event = breed.attack_general_sound_event_long
			else
				general_event = breed.attack_general_sound_event
			end

			if player_data.local_player and sound_event then
				local audio_system_extension = Managers.state.entity:system("audio_system")

				audio_system_extension:_play_event_with_source(wwise_world, sound_event, wwise_source)
			else
				if sound_event then
					local channel_id = PEER_ID_TO_CHANNEL[owner.peer_id]

					RPC.rpc_server_audio_unit_event(channel_id, sound_event_id, unit_id, false, 0)
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
		local wwise_source, wwise_world = WwiseUtils.make_unit_auto_source(blackboard.world, enemy_unit, dialogue_extension.voice_node)

		update_switch_group(wwise_world, wwise_source, dialogue_extension)

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
				local channel_id = PEER_ID_TO_CHANNEL[owner.peer_id]

				RPC.rpc_server_audio_unit_event(channel_id, sound_event_id, unit_id, false, 0)
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
				local channel_id = PEER_ID_TO_CHANNEL[owner.peer_id]

				RPC.rpc_server_audio_unit_event(channel_id, flanking_event_id, unit_id, false, 0)

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
				local channel_id = PEER_ID_TO_CHANNEL[player_data.peer_id]

				RPC.rpc_play_first_person_sound(channel_id, go_id, event_id, POSITION_LOOKUP[player_unit])
			end
		end
	end
end

DialogueSystem.get_random_player = function (self)
	return PlayerUtils.get_random_alive_hero()
end

DialogueSystem._update_story_lines = function (self, t)
	local next_story_line_update_t = self.next_story_line_update_t

	if not self:_is_story_trigger_frozen() and next_story_line_update_t < t then
		self.next_story_line_update_t = t + DialogueSettings.story_tick_time

		local random_player = DialogueSystem:get_random_player()

		if random_player ~= nil then
			local dialogue_input = ScriptUnit.extension_input(random_player, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event("story_trigger", event_data)
		end
	end
end

DialogueSystem.freeze_story_trigger = function (self)
	self._story_trigger_freezes = self._story_trigger_freezes + 1
end

DialogueSystem.unfreeze_story_trigger = function (self)
	self._story_trigger_freezes = math.max(0, self._story_trigger_freezes - 1)
end

DialogueSystem._is_story_trigger_frozen = function (self)
	return self._story_trigger_freezes and self._story_trigger_freezes > 0
end

local current_cutscene_subs = {}
local cutscene_speaker
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

	if t > end_time and cutscene_speaker ~= nil then
		hud_system:remove_subtitle(cutscene_speaker)

		enabled = true
	end
end

DialogueSystem.trigger_sound_event_with_subtitles = function (self, sound_event, subtitle_event, speaker_name, source_unit, unit_node)
	if DEDICATED_SERVER then
		return
	end

	DialogueSystem._flow_calls_implementation:trigger_sound_event_with_subtitles(sound_event, subtitle_event, speaker_name, source_unit, unit_node)
end

DialogueSystem._update_sound_event_subtitles = function (self)
	if DEDICATED_SERVER then
		return
	end

	DialogueSystem._flow_calls_implementation:update_sound_event_subtitles()
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
	if Unit.alive(unit) and not self:_is_story_trigger_frozen() then
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

			if num_of_jumps > DialogueSettings.bunny_jumping.jump_threshold then
				SurroundingAwareSystem.add_event(local_player_unit, "bunny_trigger", DialogueSettings.friends_close_distance)
			end

			num_of_jumps = 0
		end
	end
end

DialogueSystem.rpc_trigger_dialogue_event = function (self, channel_id, go_id, event_id, event_data_array, event_data_array_types, identifier)
	local unit = Managers.state.unit_storage:unit(go_id)

	if not unit then
		return
	end

	if FROZEN[unit] then
		return
	end

	local event_data_array_n = #event_data_array

	for i = 1, event_data_array_n do
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

DialogueSystem.rpc_play_marker_event = function (self, channel_id, go_id, marker_id)
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
	local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

	update_switch_group(wwise_world, wwise_source_id, extension)

	local playing_id, _ = self:_check_play_debug_sound(marker_sound_event, extension.currently_playing_dialogue and extension.currently_playing_dialogue.currently_playing_subtitle or "")

	if not playing_id then
		WwiseWorld.trigger_event(wwise_world, marker_sound_event, wwise_source_id)
	end
end

DialogueSystem._check_play_debug_sound = function (self, sound_event, subtitles_event)
	return
end

DialogueSystem.rpc_play_dialogue_event = function (self, channel_id, go_id, is_level_unit, dialogue_id, dialogue_index)
	local dialogue_actor_unit = Managers.state.network:game_object_or_level_unit(go_id, is_level_unit)

	if not dialogue_actor_unit then
		return
	end

	if FROZEN[dialogue_actor_unit] then
		return
	end

	local dialogue_name = NetworkLookup.dialogues[dialogue_id]
	local dialogue = self.dialogues[dialogue_name]
	local extension = self.unit_extension_data[dialogue_actor_unit]
	local sound_event, subtitles_event, anim_face_event, anim_dialogue_event = DialogueQueries.get_dialogue_event(dialogue, dialogue_index)
	local modified_event
	local career_name = extension.context.player_career
	local career_settings = CareerSettings[career_name]
	local unique_subtitles = career_settings and career_settings.unique_subtitles

	if unique_subtitles then
		local prefix = unique_subtitles[1]
		local insert_index = unique_subtitles[2]

		modified_event = string.insert(subtitles_event, prefix, insert_index)
	end

	if modified_event and Managers.localizer:exists(modified_event) then
		dialogue.currently_playing_subtitle = modified_event
	else
		dialogue.currently_playing_subtitle = subtitles_event
	end

	if dialogue.intended_player_profile ~= nil and dialogue.intended_player_profile ~= get_local_sound_character() then
		dialogue.currently_playing_subtitle = ""
	elseif not DEDICATED_SERVER then
		local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, extension.play_unit, extension.voice_node)

		update_switch_group(wwise_world, wwise_source_id, extension)

		local playing_id, _ = self:_check_play_debug_sound(sound_event, subtitles_event)

		if not playing_id then
			playing_id, _ = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)
			dialogue.currently_playing_id = playing_id
		end
	end

	dialogue.currently_playing_unit = dialogue_actor_unit

	local speaker_name
	local breed_data = Unit.get_data(dialogue_actor_unit, "breed")

	if breed_data and not breed_data.is_player then
		speaker_name = breed_data.name
	else
		speaker_name = extension.context.player_profile
	end

	extension.last_query_sound_event = sound_event
	dialogue.speaker_name = speaker_name
	dialogue.dialogue_timer = DialogueQueries.get_sound_event_duration(dialogue, dialogue_index) or DialogueSettings.sound_event_default_length
	extension.currently_playing_dialogue = dialogue
	self.playing_units[dialogue_actor_unit] = extension

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

	if career_name then
		Managers.telemetry_events:vo_event_played(dialogue_category, dialogue_name, sound_event, career_name)
	end
end

DialogueSystem.rpc_interrupt_dialogue_event = function (self, channel_id, go_id, is_level_unit)
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
		dialogue.dialogue_timer = nil
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

DialogueSystem.rpc_update_current_wind = function (self, channel_id, weave_name_id)
	local current_wind = NetworkLookup.weave_winds[weave_name_id]

	self.global_context.current_wind = current_wind
end
