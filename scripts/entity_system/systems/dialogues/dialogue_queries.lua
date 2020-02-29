DialogueQueries = {
	get_sound_event_duration = function (dialogue, index)
		if dialogue.sound_events_duration then
			return dialogue.sound_events_duration[index] or DialogueSettings.sound_event_default_length
		else
			return DialogueSettings.sound_event_default_length
		end
	end,
	get_dialogue_event = function (dialogue, index)
		return dialogue.sound_events[index], dialogue.localization_strings[index], dialogue.face_animations[index], dialogue.dialogue_animations[index]
	end,
	build_randomized_indexes = function (dialogue)
		if dialogue.sound_events_weights then
			local temp_weight_table = {}
			local temp_indexes = {}

			for i = 1, dialogue.sound_events_n, 1 do
				temp_weight_table[i] = dialogue.sound_events_weights[i]
				temp_indexes[i] = i
			end

			local temp_weight_table_n = dialogue.sound_events_n
			local max_random = 1

			for i = 1, dialogue.sound_events_n, 1 do
				local rand = math.random() * max_random
				local selected_index = 1

				for temp_index = 1, temp_weight_table_n, 1 do
					if rand <= temp_weight_table[temp_index] then
						selected_index = temp_index

						break
					end
				end

				if temp_weight_table_n > 1 then
					local length_selected = temp_weight_table[selected_index] - ((selected_index == 1 and 0) or temp_weight_table[selected_index - 1])

					for accum_index = selected_index + 1, temp_weight_table_n, 1 do
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

			for i = 1, dialogue.sound_events_n, 1 do
				temp_rand_table[i] = i
			end

			dialogue.randomize_indexes = {}

			for i = 1, dialogue.sound_events_n, 1 do
				local rand = math.random(1, (dialogue.sound_events_n + 1) - i)
				local val = table.remove(temp_rand_table, rand)
				dialogue.randomize_indexes[i] = val
			end

			dialogue.randomize_indexes_n = dialogue.sound_events_n
		end
	end,
	get_dialogue_event_index = function (dialogue)
		if dialogue.sound_events_n == 1 then
			return 1
		end

		if dialogue.randomize_indexes_n == 0 then
			DialogueQueries.build_randomized_indexes(dialogue)
		end

		local current_index = dialogue.randomize_indexes_n
		dialogue.randomize_indexes_n = dialogue.randomize_indexes_n - 1

		return dialogue.randomize_indexes[current_index]
	end
}

function get_local_sound_character()
	if not Managers then
		return nil
	end

	if not Managers.player then
		return nil
	end

	if not SPProfiles then
		return nil
	end

	local local_player = Managers.player:local_player()

	if not local_player then
		return nil
	end

	local career_index = local_player:career_index()
	local profile_index = local_player:profile_index()
	local current_profile = SPProfiles[profile_index]
	local current_career = current_profile.careers[career_index]
	local voice = current_career.profile_name

	return voice
end

return
