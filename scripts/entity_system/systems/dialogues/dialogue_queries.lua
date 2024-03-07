-- chunkname: @scripts/entity_system/systems/dialogues/dialogue_queries.lua

local DialogueQueries = {}
local DUMMY_TABLE = {}

DialogueQueries.get_sound_event_duration = function (dialogue, index)
	local sound_events_duration = dialogue.sound_events_duration or DUMMY_TABLE
	local duration = sound_events_duration[index]

	if duration then
		return duration
	end

	return DialogueSettings.sound_event_default_length
end

DialogueQueries.get_dialogue_event = function (dialogue, index)
	return dialogue.sound_events[index], dialogue.localization_strings[index], dialogue.face_animations[index], dialogue.dialogue_animations[index]
end

DialogueQueries.build_randomized_indexes = function (dialogue)
	if dialogue.sound_events_weights then
		local temp_weight_table = {}
		local temp_indexes = {}

		for i = 1, dialogue.sound_events_n do
			temp_weight_table[i] = dialogue.sound_events_weights[i]
			temp_indexes[i] = i
		end

		local temp_weight_table_n = dialogue.sound_events_n
		local max_random = 1

		for i = 1, dialogue.sound_events_n do
			local rand = math.random() * max_random
			local selected_index = 1

			for temp_index = 1, temp_weight_table_n do
				if rand <= temp_weight_table[temp_index] then
					selected_index = temp_index

					break
				end
			end

			if temp_weight_table_n > 1 then
				local length_selected = temp_weight_table[selected_index] - (selected_index == 1 and 0 or temp_weight_table[selected_index - 1])

				for accum_index = selected_index + 1, temp_weight_table_n do
					temp_weight_table[accum_index] = temp_weight_table[accum_index] - length_selected
				end

				table.remove(temp_weight_table, selected_index)

				temp_weight_table_n = temp_weight_table_n - 1
				max_random = max_random - length_selected
			end

			dialogue.randomize_indexes[i] = temp_indexes[selected_index]

			table.remove(temp_indexes, selected_index)
		end

		dialogue.randomize_indexes_n = dialogue.sound_events_n
	else
		local temp_rand_table = {}

		for i = 1, dialogue.sound_events_n do
			temp_rand_table[i] = i
		end

		dialogue.randomize_indexes = {}

		for i = 1, dialogue.sound_events_n do
			local rand = math.random(1, dialogue.sound_events_n + 1 - i)
			local val = table.remove(temp_rand_table, rand)

			dialogue.randomize_indexes[i] = val
		end

		dialogue.randomize_indexes_n = dialogue.sound_events_n
	end
end

DialogueQueries.get_dialogue_event_index = function (dialogue, wrap_around)
	local num_events = dialogue.sound_events_n

	if num_events == 1 then
		return 1
	end

	local wrapped = false

	if dialogue.randomize_indexes_n == 0 then
		if wrap_around then
			wrapped = true
			dialogue.randomize_indexes_n = num_events
		else
			DialogueQueries.build_randomized_indexes(dialogue)
		end
	end

	local current_index = dialogue.randomize_indexes_n

	dialogue.randomize_indexes_n = dialogue.randomize_indexes_n - 1

	return dialogue.randomize_indexes[current_index], wrapped
end

DialogueQueries.get_filtered_dialogue_event_index = function (dialogue, context, global_filters)
	local dialogue_index, wrapped = DialogueQueries.get_dialogue_event_index(dialogue)
	local valid_event = false

	for i = 1, dialogue.sound_events_n do
		valid_event = DialogueQueries.filter_sound_event(dialogue, dialogue_index, context, global_filters)

		if valid_event then
			break
		end

		local did_wrap

		dialogue_index, did_wrap = DialogueQueries.get_dialogue_event_index(dialogue, true)
		wrapped = wrapped or did_wrap
	end

	if wrapped then
		DialogueQueries.build_randomized_indexes(dialogue)
	end

	return dialogue_index
end

DialogueQueries.filter_sound_event = function (dialogue, event_index, context, global_filters)
	local sound_event = dialogue.sound_events[event_index]

	do
		local event_filters = global_filters[sound_event]

		if event_filters then
			for i = 1, #event_filters do
				local filter = event_filters[i]
				local sub_context = filter[1]
				local context_key = filter[2]
				local condition = filter[3]
				local filter_value = filter[4]
				local real_value = context[sub_context][context_key] or false
				local op = TagQuery.FilterOP[condition]

				if op(real_value, filter_value) then
					return false
				end
			end
		end
	end

	do
		local all_filters = dialogue.sound_event_filters
		local event_filters = all_filters and all_filters[sound_event]

		if event_filters then
			for i = 1, #event_filters do
				local filter = event_filters[i]
				local sub_context = filter[1]
				local context_key = filter[2]
				local condition = filter[3]
				local filter_value = filter[4]
				local real_value = context[sub_context][context_key] or false
				local op = TagQuery.FilterOP[condition]

				if op(real_value, filter_value) then
					return false
				end
			end
		end
	end

	return true
end

return DialogueQueries
