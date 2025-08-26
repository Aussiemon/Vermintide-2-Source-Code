-- chunkname: @scripts/settings/mutators/mutator_curse_empathy.lua

local DAMAGE_TYPE_BLACKLIST = {
	death_zone = true,
	forced = true,
	heal = true,
	inside_forbidden_tag_volume = true,
	knockdown_bleed = true,
	sync_health = true,
	temporary_health_degen = true,
	volume_insta_kill = true,
}
local damage_sound_global_parameter
local start_damage_sound_event = "Play_curse_empathy_loop"
local stop_damage_sound_event = "Stop_curse_empathy_loop"
local player_effect_name = "fx/leash_beam_player_01"
local beam_effect_name = "fx/leash_beam_01"
local beam_material_name = "cloud_1"
local beam_max_intensity = 5
local beam_max_softness = 1
local radius = 8
local intensity_drop_off_radius = 7.5
local beam_blink_time = 2.5
local damage_ratio = 0.5
local max_damage = 50
local beam_max_blink_sound = 0
local beam_blink_transition_speed = 3
local CURSE_DAMAGE_TYPE = "curse_empathy"

DAMAGE_TYPE_BLACKLIST[CURSE_DAMAGE_TYPE] = true

local function add_damage(data, unit, damage, damaging_unit)
	local damage_data = data.damage_buffer[unit] or {
		damage = 0,
		damaging_unit = damaging_unit,
	}

	damage_data.damage = damage_data.damage + damage
	data.damage_buffer[unit] = damage_data
end

local temp = {}

local function get_alive_units(units)
	table.clear(temp)

	for _, player_unit in ipairs(units) do
		if HEALTH_ALIVE[player_unit] then
			table.insert(temp, player_unit)
		end
	end

	return temp
end

local function get_not_knocked_down_units(units)
	table.clear(temp)

	for _, player_unit in ipairs(units) do
		if HEALTH_ALIVE[player_unit] then
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local is_knocked_down = status_extension:is_knocked_down()

			if not is_knocked_down then
				table.insert(temp, player_unit)
			end
		end
	end

	return temp
end

local function get_effect_position(local_player_unit, player_unit)
	local effect_position = Vector3.zero()

	if local_player_unit == player_unit then
		local first_person_extension = ScriptUnit.has_extension(player_unit, "first_person_system")

		if first_person_extension then
			local first_person_unit = first_person_extension.first_person_unit

			effect_position = Unit.local_position(first_person_unit, 0) - 0.5 * Vector3.up()
		end
	else
		local effect_node = Unit.node(player_unit, "j_spine")

		effect_position = Unit.world_position(player_unit, effect_node)
	end

	return effect_position
end

local function get_beam_intensity(start_position, end_position, max_radius, intensity_drop_off_radius, max_intensity)
	local drop_off_radius_squared = math.pow(intensity_drop_off_radius, 2)
	local radius_squared = math.pow(max_radius, 2)
	local distance_squared = Vector3.distance_squared(start_position, end_position)
	local intensity = math.auto_lerp(drop_off_radius_squared, radius_squared, max_intensity, 0, distance_squared)

	intensity = math.clamp(intensity, 0, max_intensity)

	return intensity
end

local function destroy_effects(context, data, player_unit)
	local beam_effects = data.beam_effects
	local player_beam_effects = beam_effects[player_unit]

	if player_beam_effects then
		local world = context.world
		local wwise_world = data.wwise_world
		local effect_ids = player_beam_effects.ids

		for _, effect_id in pairs(effect_ids) do
			World.destroy_particles(world, effect_id)
		end

		local damage_sound_id = player_beam_effects.damage_sound_id

		if damage_sound_id then
			WwiseWorld.trigger_event(wwise_world, stop_damage_sound_event)

			damage_sound_id = nil
		end

		beam_effects[player_unit] = nil
	end
end

local function update_sound(data)
	local audio_system = Managers.state.entity:system("audio_system")
	local highest_beam_softness = 0
	local beam_effects = data.beam_effects

	for _, beam_effect in pairs(beam_effects) do
		highest_beam_softness = math.max(beam_effect.beam_softness, highest_beam_softness)
	end

	local sound_value = math.auto_lerp(0, beam_max_softness, 0, beam_max_blink_sound, highest_beam_softness)

	sound_value = math.clamp(sound_value, 0, beam_max_blink_sound)

	if damage_sound_global_parameter then
		audio_system:set_global_parameter(damage_sound_global_parameter, sound_value)
	end
end

local function move_player_effect(context, data, player_unit)
	local beam_effects = data.beam_effects[player_unit]
	local player_effect_id = beam_effects and beam_effects.ids.player_effect_id

	if not player_effect_id then
		return
	end

	local world = context.world
	local local_player_unit = data.local_player.player_unit
	local effect_position = get_effect_position(local_player_unit, player_unit)

	World.move_particles(world, player_effect_id, effect_position)
end

local function update_beam_effect(context, data, player_unit)
	local world = context.world
	local beam_start_variable_id = data.beam_start_variable_id
	local beam_end_variable_id = data.beam_end_variable_id
	local local_player_unit = data.local_player.player_unit
	local beam_start_position = get_effect_position(local_player_unit, player_unit)
	local beam_end_position = get_effect_position(local_player_unit, local_player_unit)
	local player_beam_effects = data.beam_effects[player_unit]
	local beam_effect_id = player_beam_effects.ids.beam_effect_id

	World.set_particles_variable(world, beam_effect_id, beam_start_variable_id, beam_start_position)
	World.set_particles_variable(world, beam_effect_id, beam_end_variable_id, beam_end_position)

	local beam_intensity = get_beam_intensity(beam_start_position, beam_end_position, radius, intensity_drop_off_radius, beam_max_intensity)

	World.set_particles_material_scalar(world, beam_effect_id, beam_material_name, "intensity", beam_intensity)

	local beam_softness = player_beam_effects.beam_softness or 0

	World.set_particles_material_scalar(world, beam_effect_id, beam_material_name, "softness", beam_softness)
end

local function set_blinking_enabled(data, enabled, t, player_unit)
	local player_beam_effects = data.beam_effects[player_unit]

	if not player_beam_effects then
		return
	end

	local wwise_world = data.wwise_world
	local damage_sound_id = player_beam_effects.damage_sound_id

	player_beam_effects.blinking_enabled = enabled

	if enabled then
		player_beam_effects.blink_timer = beam_blink_time + t

		if not damage_sound_id then
			local sound_id = WwiseWorld.trigger_event(wwise_world, start_damage_sound_event)

			player_beam_effects.damage_sound_id = sound_id
		end
	else
		player_beam_effects.blink_timer = nil

		if damage_sound_id then
			WwiseWorld.trigger_event(wwise_world, stop_damage_sound_event)

			player_beam_effects.damage_sound_id = nil
		end
	end
end

local function process_blinking(data, dt, t)
	for player_unit, beam_effect in pairs(data.beam_effects) do
		local timer = beam_effect.blink_timer

		if timer and timer <= t then
			local enabled = false

			set_blinking_enabled(data, enabled, t, player_unit)
		end

		local timer_enabled = beam_effect.blinking_enabled
		local multiplier = timer_enabled and 1 or -1
		local new_beam_softness = beam_effect.beam_softness + beam_blink_transition_speed * multiplier * dt

		new_beam_softness = math.clamp(new_beam_softness, 0, beam_max_softness)
		beam_effect.beam_softness = new_beam_softness
	end
end

local function remove_unused_effect(context, data, beam_effects, num_valid_units)
	for player_unit, _ in pairs(beam_effects) do
		local is_alive = HEALTH_ALIVE[player_unit]
		local status_extension = is_alive and ScriptUnit.extension(player_unit, "status_system")
		local is_knocked_down = status_extension and status_extension:is_knocked_down()

		if not is_alive or is_knocked_down or num_valid_units == 1 then
			destroy_effects(context, data, player_unit)
		end
	end
end

local function create_missing_beam_effects(world, beam_effects, player_unit)
	if not beam_effects[player_unit] then
		local beam_effect_id = World.create_particles(world, beam_effect_name, Vector3.zero(), Quaternion.identity())
		local player_effect_id = World.create_particles(world, player_effect_name, Vector3.zero(), Quaternion.identity())

		beam_effects[player_unit] = {
			beam_softness = 0,
			blinking_enabled = false,
			ids = {
				beam_effect_id = beam_effect_id,
				player_effect_id = player_effect_id,
			},
		}
	end
end

local function can_share_damage(player_manager, damaged_unit, damage, damage_type)
	local attacked_player = player_manager:owner(damaged_unit)
	local is_player = not attacked_player.bot_player
	local is_damage_type_allowed = not DAMAGE_TYPE_BLACKLIST[damage_type]
	local is_damage_valid = damage > 0
	local status_extension = ScriptUnit.extension(damaged_unit, "status_system")
	local is_knocked_down = status_extension:is_knocked_down()

	return is_player and is_damage_type_allowed and is_damage_valid and not is_knocked_down
end

return {
	description = "curse_empathy_desc",
	display_name = "curse_empathy_name",
	icon = "deus_curse_slaanesh_01",
	server_start_function = function (context, data)
		data.damage_buffer = {}
		data.player_units_in_range = {}
	end,
	modify_player_base_damage = function (context, data, damaged_unit, attacker_unit, damage, damage_type)
		local units_in_range = data.player_units_in_range[damaged_unit]

		if not units_in_range or not can_share_damage(Managers.player, damaged_unit, damage, damage_type) then
			return damage
		end

		local player_damage = damage * damage_ratio
		local other_players_damage = damage - player_damage

		other_players_damage = other_players_damage / table.size(units_in_range)
		other_players_damage = math.min(other_players_damage, max_damage)

		for player_unit, _ in pairs(data.player_units_in_range[damaged_unit]) do
			if ALIVE[player_unit] and player_unit ~= damaged_unit then
				add_damage(data, player_unit, other_players_damage, attacker_unit)
			end
		end

		return player_damage
	end,
	server_update_function = function (context, data, dt, t)
		data.template.update_players_in_range(data)
		data.template.process_damage_buffer(data)
	end,
	update_players_in_range = function (data)
		local alive_units = get_alive_units(data.hero_side.PLAYER_UNITS)

		for _, player_unit in ipairs(alive_units) do
			for _, other_player_unit in ipairs(alive_units) do
				if player_unit ~= other_player_unit then
					data.player_units_in_range[player_unit] = data.player_units_in_range[player_unit] or {}

					local player_position = POSITION_LOOKUP[player_unit]
					local other_player_position = POSITION_LOOKUP[other_player_unit]
					local distance_squared = Vector3.distance_squared(other_player_position, player_position)
					local radius_squared = math.pow(radius, 2)
					local player_status_extension = ScriptUnit.extension(player_unit, "status_system")
					local player_knocked_down = player_status_extension:is_knocked_down()
					local other_player_status_extension = ScriptUnit.extension(other_player_unit, "status_system")
					local other_player_knocked_down = other_player_status_extension:is_knocked_down()
					local player_is_knocked_down = player_knocked_down or other_player_knocked_down

					if distance_squared < radius_squared and not player_is_knocked_down then
						data.player_units_in_range[player_unit][other_player_unit] = true
					else
						data.player_units_in_range[player_unit][other_player_unit] = nil
					end
				end
			end
		end

		for player_unit, units_in_range in pairs(data.player_units_in_range) do
			if not ALIVE[player_unit] then
				table.clear(data.player_units_in_range[player_unit])
			else
				for other_player_unit, _ in pairs(units_in_range) do
					if not ALIVE[other_player_unit] then
						units_in_range[other_player_unit] = nil
					end
				end
			end
		end
	end,
	process_damage_buffer = function (data)
		for unit, damage_data in pairs(data.damage_buffer) do
			if ALIVE[unit] then
				local damaging_unit = damage_data.damaging_unit

				if Unit.alive(damaging_unit) then
					local hit_zone_name = "full"
					local hit_position = Vector3.up()
					local damage_dir = Vector3.up()

					DamageUtils.add_damage_network(unit, damaging_unit, damage_data.damage, hit_zone_name, CURSE_DAMAGE_TYPE, hit_position, damage_dir, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)
				end
			end

			data.damage_buffer[unit] = nil
		end
	end,
	client_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local damage_type = hit_data[2]

		if damage_type == CURSE_DAMAGE_TYPE then
			local time = Managers.time:time("game")
			local enabled = true

			set_blinking_enabled(data, enabled, time, attacker_unit)

			local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("curse_damage_taken", event_data)
		end
	end,
	client_start_function = function (context, data)
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
		data.hero_side = hero_side
	end,
	client_update_function = function (context, data, dt, t)
		local local_player_unit = data.local_player.player_unit

		if not ALIVE[local_player_unit] then
			return
		end

		local beam_effects = data.beam_effects
		local valid_units = get_not_knocked_down_units(data.hero_side.PLAYER_UNITS)

		if #valid_units > 1 then
			local world = context.world

			update_sound(data)
			process_blinking(data, dt, t)

			for _, player_unit in ipairs(valid_units) do
				create_missing_beam_effects(world, beam_effects, player_unit)
				move_player_effect(context, data, player_unit)

				local status_extension = ScriptUnit.extension(player_unit, "status_system")
				local player_knocked_down = status_extension:is_knocked_down()
				local local_status_extension = ScriptUnit.extension(local_player_unit, "status_system")
				local local_player_knocked_down = local_status_extension:is_knocked_down()

				if local_player_unit ~= player_unit and not player_knocked_down and not local_player_knocked_down then
					local player_position = POSITION_LOOKUP[player_unit]
					local local_player_position = POSITION_LOOKUP[local_player_unit]
					local distance_squared = Vector3.distance_squared(local_player_position, player_position)
					local radius_squared = math.pow(radius, 2)

					if distance_squared < radius_squared then
						update_beam_effect(context, data, player_unit)
					else
						destroy_effects(context, data, player_unit)
					end
				end
			end
		end

		remove_unused_effect(context, data, beam_effects, #valid_units)
	end,
	client_stop_function = function (context, data)
		local beam_effects = data.beam_effects

		for player_unit, _ in pairs(beam_effects) do
			destroy_effects(context, data, player_unit)
		end
	end,
}
