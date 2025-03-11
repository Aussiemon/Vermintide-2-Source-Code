-- chunkname: @scripts/settings/mutators/mutator_leash.lua

return {
	beam_effect_name = "fx/leash_beam_01",
	beam_material_max_intensity = 5,
	beam_material_min_intensity = 0.5,
	beam_material_name = "cloud_1",
	center_effect_name = "fx/leash_beam_center_01",
	center_sound_event = "Play_mutator_leash_center",
	damage_percentage_per_interval = 0.02,
	damage_sound_global_parameter = "leash_distance",
	damage_type = "damage_over_time",
	description = "description_mutator_leash",
	display_name = "display_name_mutator_leash",
	icon = "mutator_icon_leash",
	max_damage_distance = 12,
	max_damage_interval = 0.15,
	min_damage_distance = 4,
	min_damage_interval = 1,
	player_effect_name = "fx/leash_beam_player_01",
	start_damage_sound_event = "Play_mutator_leash_loop",
	stop_damage_sound_event = "Stop_mutator_leash_loop",
	calculate_center_position = function (data)
		local num_alive_players = 0
		local center_position = Vector3.zero()
		local hero_side = data.hero_side
		local PLAYER_UNITS = hero_side.PLAYER_UNITS

		for i = 1, #PLAYER_UNITS do
			local player_unit = PLAYER_UNITS[i]
			local status_extension = ScriptUnit.extension(player_unit, "status_system")

			if HEALTH_ALIVE[player_unit] and not status_extension:is_knocked_down() then
				local player_position = POSITION_LOOKUP[player_unit]

				center_position = center_position + player_position
				num_alive_players = num_alive_players + 1
			end
		end

		if num_alive_players > 0 then
			center_position = center_position / num_alive_players
		end

		return center_position, num_alive_players
	end,
	server_start_function = function (context, data)
		data.player_damage_data = {}
		data.hero_side = Managers.state.side:get_side_from_name("heroes")
	end,
	server_update_function = function (context, data)
		local t = Managers.time:time("game")
		local template = data.template
		local center_position = template.calculate_center_position(data)
		local player_damage_data = data.player_damage_data
		local hero_side = data.hero_side
		local PLAYER_UNITS = hero_side.PLAYER_UNITS

		for i = 1, #PLAYER_UNITS do
			local player_unit = PLAYER_UNITS[i]

			if HEALTH_ALIVE[player_unit] then
				if player_damage_data[player_unit] == nil then
					player_damage_data[player_unit] = {}
				end

				local player_position = POSITION_LOOKUP[player_unit]
				local distance = Vector3.distance(center_position, player_position)
				local current_player_damage_data = player_damage_data[player_unit]

				current_player_damage_data.distance_to_center = distance

				if distance >= template.min_damage_distance then
					if not current_player_damage_data.do_damage then
						current_player_damage_data.do_damage = true
						current_player_damage_data.last_t = t
					end
				elseif current_player_damage_data.do_damage then
					current_player_damage_data.do_damage = false
				end
			end
		end

		local damage_percentage = template.damage_percentage_per_interval
		local damage_type = template.damage_type
		local min_damage_interval, max_damage_interval = template.min_damage_interval, template.max_damage_interval
		local min_damage_distance, max_damage_distance = template.min_damage_distance, template.max_damage_distance

		for player_unit, damage_data in pairs(player_damage_data) do
			if not HEALTH_ALIVE[player_unit] then
				player_damage_data[player_unit] = nil
			elseif damage_data.do_damage then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")
				local distance = damage_data.distance_to_center
				local distance_normalized = (distance - min_damage_distance) / (max_damage_distance - min_damage_distance)
				local interval_lerp_value = math.lerp(min_damage_interval, max_damage_interval, distance_normalized)
				local interval = math.max(max_damage_interval, interval_lerp_value)
				local last_t = damage_data.last_t

				if t > last_t + interval and not status_extension:is_knocked_down() then
					local player_health_extension = ScriptUnit.extension(player_unit, "health_system")
					local max_health = player_health_extension:get_max_health()
					local damage = max_health * damage_percentage
					local player_position = POSITION_LOOKUP[player_unit]
					local damage_direction = Vector3.normalize(player_position - center_position)

					DamageUtils.add_damage_network(player_unit, player_unit, damage, "torso", damage_type, nil, damage_direction)

					damage_data.last_t = t
				end
			end
		end
	end,
	client_start_function = function (context, data)
		local template = data.template
		local beam_effect_name = template.beam_effect_name
		local world = context.world
		local player_manager = Managers.player
		local wwise_world = Managers.world:wwise_world(world)
		local hero_side = Managers.state.side:get_side_from_name("heroes")

		data.wwise_world = wwise_world
		data.local_player = player_manager:local_player()
		data.beam_start_variable_id = World.find_particles_variable(world, beam_effect_name, "start")
		data.beam_end_variable_id = World.find_particles_variable(world, beam_effect_name, "end")
		data.center_effect_id = nil
		data.center_sound = nil
		data.beam_effects = {}
		data.playing_sounds = {}
		data.hero_side = hero_side
	end,
	client_update_function = function (context, data)
		local world = context.world
		local wwise_world = data.wwise_world
		local template = data.template
		local start_damage_sound_event, stop_damage_sound_event = template.start_damage_sound_event, template.stop_damage_sound_event
		local center_position, num_alive_players = data.template.calculate_center_position(data)
		local beam_effects = data.beam_effects
		local playing_sounds = data.playing_sounds

		if num_alive_players > 1 then
			local local_player = data.local_player
			local player_manager = Managers.player
			local center_effect_name, center_sound_event = template.center_effect_name, template.center_sound_event
			local player_effect_name = template.player_effect_name
			local beam_effect_name, beam_material_name = template.beam_effect_name, template.beam_material_name
			local beam_min_intensity, beam_max_intensity = template.beam_material_min_intensity, template.beam_material_max_intensity
			local beam_min_beam_distance, beam_max_beam_distance = 0.5, template.max_damage_distance
			local beam_start_variable_id, beam_end_variable_id = data.beam_start_variable_id, data.beam_end_variable_id
			local min_damage_distance, max_damage_distance = template.min_damage_distance, template.max_damage_distance

			if data.center_effect_id == nil then
				data.center_effect_id = World.create_particles(world, center_effect_name, Vector3.zero(), Quaternion.identity())
			end

			local center_effect_id = data.center_effect_id

			World.move_particles(world, center_effect_id, center_position)

			if data.center_sound == nil then
				local event_id, source_id, _ = WwiseUtils.trigger_position_event(world, center_sound_event, center_position)

				data.center_sound = {
					source_id = source_id,
					event_id = event_id,
				}
			end

			WwiseWorld.set_source_position(wwise_world, data.center_sound.source_id, center_position)

			local hero_side = data.hero_side
			local PLAYER_UNITS = hero_side.PLAYER_UNITS

			for i = 1, #PLAYER_UNITS do
				local player_unit = PLAYER_UNITS[i]

				if HEALTH_ALIVE[player_unit] then
					if not beam_effects[player_unit] then
						local beam_effect_id = World.create_particles(world, beam_effect_name, Vector3.zero(), Quaternion.identity())
						local player_effect_id = World.create_particles(world, player_effect_name, Vector3.zero(), Quaternion.identity())

						beam_effects[player_unit] = {
							beam_effect_id = beam_effect_id,
							player_effect_id = player_effect_id,
						}
					end

					local player_effect_position
					local player = player_manager:unit_owner(player_unit)

					if player == local_player then
						local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
						local first_person_unit = first_person_extension.first_person_unit

						player_effect_position = Unit.world_position(first_person_unit, Unit.node(first_person_unit, "root_point")) - 0.5 * Vector3.up()
					else
						local effect_node = Unit.node(player_unit, "j_spine")

						player_effect_position = Unit.world_position(player_unit, effect_node)
					end

					local player_effect_id = beam_effects[player_unit].player_effect_id

					World.move_particles(world, player_effect_id, player_effect_position)

					local beam_effect_id = beam_effects[player_unit].beam_effect_id

					World.set_particles_variable(world, beam_effect_id, beam_start_variable_id, center_position + Vector3.up() * 0.5)
					World.set_particles_variable(world, beam_effect_id, beam_end_variable_id, player_effect_position)

					local player_position = POSITION_LOOKUP[player_unit]
					local distance = Vector3.distance(center_position, player_position)
					local intensity_value = math.auto_lerp(beam_min_beam_distance, beam_max_beam_distance, beam_min_intensity, beam_max_intensity, distance)

					intensity_value = math.clamp(intensity_value, beam_min_intensity, beam_max_intensity)

					World.set_particles_material_scalar(world, beam_effect_id, beam_material_name, "intensity", intensity_value)

					local softness_value = (distance / min_damage_distance)^2

					softness_value = math.min(softness_value, 1)

					World.set_particles_material_scalar(world, beam_effect_id, beam_material_name, "softness", softness_value)

					if player == local_player then
						if playing_sounds[player_unit] == nil then
							local sound_id = WwiseWorld.trigger_event(wwise_world, start_damage_sound_event)

							playing_sounds[player_unit] = sound_id
						end

						local sound_value

						if min_damage_distance <= distance then
							sound_value = math.min(math.auto_lerp(min_damage_distance, max_damage_distance, 1, 2, distance), 2)
						else
							sound_value = math.auto_lerp(0, min_damage_distance, 0, 1, distance)
						end

						if template.damage_sound_global_parameter then
							local audio_system = Managers.state.entity:system("audio_system")

							audio_system:set_global_parameter(template.damage_sound_global_parameter, sound_value)
						end
					end
				end
			end
		else
			if data.center_effect_id then
				World.destroy_particles(world, data.center_effect_id)

				data.center_effect_id = nil
			end

			if data.center_sound then
				local event_id = data.center_sound.event_id

				WwiseWorld.stop_event(wwise_world, event_id)

				data.center_sound = nil
			end
		end

		for player_unit, effects in pairs(beam_effects) do
			if not HEALTH_ALIVE[player_unit] or num_alive_players == 1 then
				for _, effect_id in pairs(effects) do
					World.destroy_particles(world, effect_id)
				end

				beam_effects[player_unit] = nil

				if playing_sounds[player_unit] then
					WwiseWorld.trigger_event(wwise_world, stop_damage_sound_event)

					playing_sounds[player_unit] = nil
				end
			end
		end
	end,
	client_stop_function = function (context, data)
		local world = context.world
		local wwise_world = data.wwise_world
		local template = data.template

		if data.center_effect_id then
			World.destroy_particles(world, data.center_effect_id)

			data.center_effect_id = nil
		end

		if data.center_sound then
			local event_id = data.center_sound.event_id

			WwiseWorld.stop_event(wwise_world, event_id)

			data.center_sound = nil
		end

		local beam_effects = data.beam_effects
		local playing_sounds = data.playing_sounds

		for player_unit, effects in pairs(beam_effects) do
			for _, effect_id in pairs(effects) do
				World.destroy_particles(world, effect_id)
			end

			beam_effects[player_unit] = nil

			if playing_sounds[player_unit] then
				WwiseWorld.trigger_event(wwise_world, template.stop_damage_sound_event)

				playing_sounds[player_unit] = nil
			end
		end
	end,
}
