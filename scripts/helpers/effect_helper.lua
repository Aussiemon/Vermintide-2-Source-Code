require("scripts/settings/material_effect_mappings")
require("scripts/helpers/network_utils")

script_data.debug_material_effects = script_data.debug_material_effects or Development.parameter("debug_material_effects")
EffectHelper = EffectHelper or {}
EffectHelper.temporary_material_drawer_mapping = {}

EffectHelper.play_surface_material_effects = function (effect_name, world, hit_unit, position, rotation, normal, sound_character, husk, unit, hit_actor)
	local effect_settings = MaterialEffectMappings[effect_name]
	local material_ids = EffectHelper.query_material_surface(hit_unit, position, normal)
	local material = nil
	local has_material = true

	if material_ids then
		if material_ids[1] == 0 or material_ids[1] == nil then
			has_material = false
		end
	else
		has_material = false
	end

	if not has_material then
		local level_settings = LevelHelper:current_level_settings()
		material = level_settings.default_surface_material or DefaultSurfaceMaterial
	else
		material = MaterialIDToName.surface_material[material_ids[1]]

		if not material and script_data.debug_material_effects then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})
			local fwd = Quaternion.forward(rotation) * MaterialEffectSettings.material_query_depth
			local draw_pos = position - fwd * 0.5

			drawer:vector(draw_pos, fwd, Color(255, 255, 0, 0))
		elseif script_data.debug_material_effects then
			table.dump(material_ids)
		end
	end

	if script_data.debug_material_effects and material then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
		})
		local fwd = Quaternion.forward(rotation) * MaterialEffectSettings.material_query_depth
		local draw_pos = position - fwd * 0.5

		drawer:vector(draw_pos, fwd, Color(255, 0, 255, 0))
		Managers.state.debug_text:output_world_text(material, 0.1, draw_pos, 30, "material_text", Vector3(0, 255, 0))
	end

	local breed = Unit.get_data(hit_unit, "breed")

	fassert(not breed or breed.is_player, "Trying to apply surface material effect to unit %q an ai unit.", hit_unit)
	fassert(not ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system"), "Trying to apply surface material effect to unit %q with ai_inventory_item extension.", hit_unit)

	local decal_settings = effect_settings.decal and effect_settings.decal.settings

	if decal_settings then
		local decal_system = Managers.state.decal

		if decal_system ~= nil then
			local extents = Vector3(decal_settings.height, decal_settings.width, decal_settings.depth)
			local material_surface_decals = EffectHelper.create_surface_material_drawer_mapping(effect_name)
			local decal_unit_name = material_surface_decals[material]

			if not decal_unit_name or (decal_unit_name and not Application.can_get("unit", decal_unit_name)) then
				decal_unit_name = "units/projection_decals/projection_test_01"

				Application.warning("[EffectHelper] There is no decal_unit_name specified for effect: %q with material: %q--> Using Default: %q", effect_name, material, decal_unit_name)
			end

			if decal_settings.random_rotation then
				local random_angle = math.degrees_to_radians(Math.random(360000) * 0.001)
				rotation = Quaternion.axis_angle(normal, random_angle)
			elseif decal_settings.rotation then
				local angle = math.degrees_to_radians(decal_settings.rotation)
				rotation = Quaternion.axis_angle(normal, angle)
			end

			if decal_settings.random_size_multiplier then
				local random_size_multiplier = decal_settings.random_size_multiplier
				local random_value = Math.random(1000) * 0.001
				local random_size_modifier = math.lerp(random_value, math.max(1 - random_size_multiplier, 0.01), 1 + random_size_multiplier)
				extents[1] = extents[1] * random_size_modifier
				extents[2] = extents[2] * random_size_modifier
			end

			decal_system:add_projection_decal(decal_unit_name, hit_unit, hit_actor, position, rotation, extents, normal)
		end

		if script_data.debug_material_effects then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})
			local drawer_space = Matrix4x4.from_quaternion_position(rotation, position + (Quaternion.forward(rotation) * decal_settings.depth) / 2)
			local drawer_extents = Vector3(decal_settings.width / 2, decal_settings.depth / 2, decal_settings.height / 2)

			drawer:box(drawer_space, drawer_extents, Color(150, 0, 255, 0))
		end
	end

	local sound = effect_settings.sound and effect_settings.sound[material]
	local switches = effect_settings.additional_sound_parameters and effect_settings.additional_sound_parameters.switch_params
	local rtpcs = effect_settings.additional_sound_parameters and effect_settings.additional_sound_parameters.rtpc_params

	if sound then
		local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(world, position)

		if script_data.debug_material_effects then
			printf("[EffectHelper:play_surface_material_effects()] playing sound %s", sound.event)
		end

		if sound.parameters then
			for parameter_name, parameter_value in pairs(sound.parameters) do
				if script_data.debug_material_effects then
					printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
				end

				WwiseWorld.set_switch(wwise_world, parameter_name, parameter_value, wwise_source_id)
			end
		end

		if sound_character then
			WwiseWorld.set_switch(wwise_world, "character_foley", sound_character, wwise_source_id)
		end

		if rtpcs then
			for parameter_name, parameter_value in pairs(rtpcs) do
				if script_data.debug_material_effects then
					printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
				end

				WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, parameter_name, parameter_value)
			end
		end

		if switches then
			for parameter_name, parameter_value in pairs(switches) do
				if script_data.debug_material_effects then
					printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
				end

				WwiseWorld.set_switch(wwise_world, parameter_name, parameter_value, wwise_source_id)
			end
		end

		WwiseWorld.set_switch(wwise_world, "husk", (husk and "true") or "false", wwise_source_id)
		WwiseWorld.trigger_event(wwise_world, sound.event, true, wwise_source_id)
	end

	local particles = effect_settings.particles and effect_settings.particles[material]

	if particles then
		local normal_rotation = Quaternion.look(normal, Vector3.up())

		World.create_particles(world, particles, position, normal_rotation)

		if script_data.debug_material_effects then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})

			drawer:quaternion(position, normal_rotation)
			printf("EffectHelper, creating partiles %s, %s", particles, effect_name)
		end
	end

	if Unit.alive(unit) then
		local world_interaction = effect_settings.world_interaction and effect_settings.world_interaction[material]

		if world_interaction then
			Managers.state.world_interaction:add_world_interaction(material, unit)
		else
			Managers.state.world_interaction:remove_world_interaction(unit)
		end
	else
		local world_interaction = effect_settings.world_interaction and effect_settings.world_interaction[material]

		if world_interaction then
			Managers.state.world_interaction:add_simple_effect(material, hit_unit, position)
		end
	end
end

EffectHelper.play_skinned_surface_material_effects = function (effect_name, world, hit_unit, position, rotation, normal, husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked)
	local effect_settings = MaterialEffectMappings[effect_name]
	local material = nil
	local skip_particles = false

	if hit_zone_name == "ward" then
		material = "ward"
	elseif no_damage then
		material = "armored"
	else
		skip_particles = not BloodSettings.enemy_blood.enabled
		material = "flesh"
	end

	if shield_blocked then
		if enemy_type == "skaven_storm_vermin_with_shield" or enemy_type == "chaos_marauder_with_shield" then
			material = "shield_metal"
		elseif enemy_type == "skaven_clan_rat_with_shield" then
			material = "shield"
		end
	end

	local sound = effect_settings.sound and effect_settings.sound[material]

	if sound then
		local wwise_world = Managers.world:wwise_world(world)
		local source_id = WwiseWorld.make_auto_source(wwise_world, position)

		if sound.parameters then
			for parameter_name, parameter_value in pairs(sound.parameters) do
				WwiseWorld.set_switch(wwise_world, source_id, parameter_name, parameter_value)
			end
		end

		if enemy_type then
			WwiseWorld.set_switch(wwise_world, "enemy_type", enemy_type, source_id)
		end

		if damage_sound then
			WwiseWorld.set_switch(wwise_world, "damage_sound", damage_sound, source_id)
		end

		if hit_zone_name then
			WwiseWorld.set_switch(wwise_world, "hit_zone", hit_zone_name, source_id)
		end

		local husk_value = (husk and "true") or "false"

		WwiseWorld.set_switch(wwise_world, "husk", husk_value, source_id)

		local event = (no_damage and sound.event.no_damage_event) or sound.event

		if script_data.debug_material_effects then
			print("playing event ", event)
			print("\tenemy_type ", enemy_type)
			print("\tdamage_sound ", damage_sound)
			print("\thit_zone ", hit_zone_name)
			print("\thusk ", husk_value)

			if sound.parameters then
				for param_name, param_value in pairs(sound.parameters) do
					print("\t" .. param_name .. " ", param_value)
				end
			end
		end

		WwiseWorld.trigger_event(wwise_world, sound.event, source_id)
	end

	if not skip_particles then
		local particles = effect_settings.particles and effect_settings.particles[material]

		if particles then
			local normal_rotation = Quaternion.look(normal, Vector3.up())

			World.create_particles(world, particles, position, normal_rotation)
		end
	end

	local flow_event = effect_settings.flow_event and effect_settings.flow_event[material]

	if flow_event and hit_unit then
		Unit.flow_event(hit_unit, flow_event)
	end
end

EffectHelper.player_critical_hit = function (world, is_critical_hit, attacker_unit, target_unit, hit_position)
	if not AiUtils.unit_alive(target_unit) then
		return
	end

	if not is_critical_hit then
		return
	end

	local player = Managers.player:owner(attacker_unit)

	if not player then
		return
	end

	local local_real_player = player.local_player and not player.bot_player

	if not local_real_player then
		return
	end

	local critical_hit_hud_sound_event = "Play_player_combat_crit_hit_2D"
	local first_person_extension = ScriptUnit.extension(attacker_unit, "first_person_system")

	first_person_extension:play_hud_sound_event(critical_hit_hud_sound_event, nil, false)

	local critical_hit_sound_event = "Play_player_combat_crit_hit_3D"

	WwiseUtils.trigger_position_event(world, critical_hit_sound_event, hit_position)
end

EffectHelper.player_melee_hit_particles = function (world, particles_name, hit_position, hit_direction, damage_type, hit_unit)
	local hit_rotation = Quaternion.look(hit_direction)

	World.create_particles(world, particles_name, hit_position, hit_rotation)

	if damage_type and damage_type ~= "no_damage" then
		Managers.state.blood:add_blood_ball(hit_position, hit_direction, damage_type, hit_unit)
	end
end

EffectHelper.play_melee_hit_effects = function (sound_event, world, hit_position, sound_type, husk, hit_unit)
	local source_id, wwise_world = WwiseUtils.make_position_auto_source(world, hit_position)
	local player = Managers.player:owner(hit_unit)

	if player then
		local target_is_local_player = player.local_player

		WwiseWorld.set_switch(wwise_world, "target_is_local_player", tostring(target_is_local_player or false), source_id)
	else
		local breed = Unit.get_data(hit_unit, "breed")

		if breed then
			local enemy_type = breed.name

			WwiseWorld.set_switch(wwise_world, "enemy_type", enemy_type, source_id)
		end
	end

	WwiseWorld.set_switch(wwise_world, "damage_sound", sound_type, source_id)
	WwiseWorld.set_switch(wwise_world, "husk", tostring(husk or false), source_id)
	WwiseWorld.trigger_event(wwise_world, sound_event, source_id)
end

EffectHelper.play_melee_hit_effects_enemy = function (sound_event, enemy_hit_sound, world, victim_unit, damage_type, is_husk)
	local source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, victim_unit)

	WwiseWorld.set_switch(wwise_world, "husk", tostring(is_husk or false), source_id)
	WwiseWorld.set_switch(wwise_world, "enemy_hit_sound", enemy_hit_sound, source_id)
	WwiseWorld.trigger_event(wwise_world, sound_event, source_id)
end

EffectHelper.remote_play_surface_material_effects = function (effect_name, world, unit, position, rotation, normal, is_server, hit_actor)
	local network_manager = Managers.state.network
	local level = LevelHelper:current_level(world)
	local unit_level_index = Level.unit_index(level, unit)
	local unit_game_object_id = network_manager:unit_game_object_id(unit)
	local effect_name_id = NetworkLookup.surface_material_effects[effect_name]
	local network_safe_position = NetworkUtils.network_safe_position(position)

	if not network_safe_position then
		return
	end

	local actor_index = -1

	if Actor.is_dynamic(hit_actor) then
		actor_index = Actor.node(hit_actor)
	end

	if unit_game_object_id then
		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_surface_mtr_fx", effect_name_id, unit_game_object_id, position, rotation, Vector3.normalize(normal), actor_index)
		else
			network_manager.network_transmit:send_rpc_server("rpc_surface_mtr_fx", effect_name_id, unit_game_object_id, position, rotation, Vector3.normalize(normal), actor_index)
		end
	elseif unit_level_index then
		if is_server then
			network_manager.network_transmit:send_rpc_clients("rpc_surface_mtr_fx_lvl_unit", effect_name_id, unit_level_index, position, rotation, Vector3.normalize(normal), actor_index)
		else
			network_manager.network_transmit:send_rpc_server("rpc_surface_mtr_fx_lvl_unit", effect_name_id, unit_level_index, position, rotation, Vector3.normalize(normal), actor_index)
		end
	end
end

EffectHelper.remote_play_skinned_surface_material_effects = function (effect_name, world, position, rotation, normal, enemy_type, damage_sound, no_damage, hit_zone_name, is_server)
	local network_manager = Managers.state.network
	local effect_name_id = NetworkLookup.surface_material_effects[effect_name]
	local network_safe_position = NetworkUtils.network_safe_position(position)

	if not network_safe_position then
		return
	end

	if is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_skinned_surface_mtr_fx", effect_name_id, position, rotation, Vector3.normalize(normal))
	else
		network_manager.network_transmit:send_rpc_server("rpc_skinned_surface_mtr_fx", effect_name_id, position, rotation, Vector3.normalize(normal))
	end
end

EffectHelper.create_surface_material_drawer_mapping = function (effect_name)
	local material_drawer_mapping = MaterialEffectMappings[effect_name].decal.material_drawer_mapping

	for _, material in ipairs(MaterialEffectSettings.material_contexts.surface_material) do
		local drawer = nil

		if type(material_drawer_mapping[material]) == "string" then
			drawer = material_drawer_mapping[material]
		elseif type(material_drawer_mapping[material]) == "table" then
			local num_drawers = #material_drawer_mapping[material]
			local drawer_num = math.random(1, num_drawers)
			drawer = material_drawer_mapping[material][drawer_num]
		else
			drawer = nil
		end

		EffectHelper.temporary_material_drawer_mapping[material] = drawer
	end

	return EffectHelper.temporary_material_drawer_mapping
end

EffectHelper.flow_cb_play_surface_material_effect = function (effect_name, unit, position, rotation, normal, sound_character, husk, offset, range)
	local raycast_offset = offset or 0.6
	local raycast_direction = -normal
	local raycast_position = position + normal * raycast_offset
	local raycast_range = range or 3
	local debug = script_data.debug_material_effects
	local world = Managers.world:world("level_world")
	local physics_world = World.get_data(world, "physics_world")
	local hit, hit_position, _, hit_normal, actor = PhysicsWorld.immediate_raycast(physics_world, raycast_position, raycast_direction, raycast_range, "closest", "types", "both", "collision_filter", "filter_ground_material_check")

	if hit then
		local hit_unit = Actor.unit(actor)
		local hit_rotation = Unit.world_rotation(unit, 0)
		local up = Quaternion.up(hit_rotation)
		local forward = Quaternion.forward(hit_rotation)
		hit_rotation = Quaternion.look(forward, up)

		EffectHelper.play_surface_material_effects(effect_name, world, hit_unit, hit_position, hit_rotation, hit_normal, sound_character, husk, unit)
	end
end

EffectHelper.flow_cb_play_footstep_surface_material_effects = function (effect_name, unit, object, foot_direction, use_occlusion)
	local ghost_mode_extension = ScriptUnit.has_extension(unit, "ghost_mode_system")

	if ghost_mode_extension and ghost_mode_extension:is_husk() and ghost_mode_extension:is_in_ghost_mode() then
		return
	end

	local foot_node_index = Unit.node(unit, object)
	local raycast_offset = MaterialEffectSettings.footstep_raycast_offset
	local raycast_position = Unit.world_position(unit, foot_node_index) + Vector3(0, 0, raycast_offset)
	local raycast_direction = Vector3(0, 0, -1)
	local raycast_range = MaterialEffectSettings.footstep_raycast_max_range
	local sound_character = Unit.get_data(unit, "sound_character")
	local world = Managers.world:world("level_world")
	local physics_world = World.get_data(world, "physics_world")
	local debug = script_data.debug_material_effects
	local hit, position, _, normal, actor = PhysicsWorld.immediate_raycast(physics_world, raycast_position, raycast_direction, raycast_range, "closest", "types", "both", "collision_filter", "filter_ground_material_check")
	local player = Managers.player:owner(unit)
	local husk = not player or player.remote or player.bot_player

	if hit then
		local hit_unit = Actor.unit(actor)
		local rotation = Unit.world_rotation(unit, 0)
		local up = Quaternion.up(rotation)
		local forward = Quaternion.forward(rotation)
		rotation = Quaternion.look(forward, up)

		EffectHelper.play_surface_material_effects(effect_name, world, hit_unit, position, rotation, normal, sound_character, husk, unit)
	else
		if debug then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})

			drawer:vector(raycast_position, raycast_direction * raycast_range, Color(255, 255, 0, 0))
			Managers.state.debug_text:output_world_text("MISS", 0.1, raycast_position, 30, "material_text", Vector3(0, 255, 0))
		end

		local effect_settings = MaterialEffectMappings[effect_name]
		local level_settings = LevelHelper:current_level_settings()
		local material = level_settings.default_surface_material or DefaultSurfaceMaterial
		local switches = effect_settings.additional_sound_parameters and effect_settings.additional_sound_parameters.switch_params
		local rtpcs = effect_settings.additional_sound_parameters and effect_settings.additional_sound_parameters.rtpc_params
		local sound = effect_settings.sound and effect_settings.sound[material]

		if sound then
			local wwise_source_id, wwise_world = WwiseUtils.make_position_auto_source(world, raycast_position + raycast_direction * raycast_range)

			if debug then
				printf("[EffectHelper:play_surface_material_effects()] playing sound %s", sound.event)
				printf("   sound param: \"husk\", sound_value %q", (husk and "true") or "false")
			end

			WwiseWorld.set_switch(wwise_world, "husk", (husk and "true") or "false", wwise_source_id)

			if sound.parameters then
				for parameter_name, parameter_value in pairs(sound.parameters) do
					if debug then
						printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
					end

					WwiseWorld.set_switch(wwise_world, parameter_name, parameter_value, wwise_source_id)
				end
			end

			if sound_character then
				if debug then
					printf("   sound param: \"sound_character\", sound_value %q", sound_character)
				end

				WwiseWorld.set_switch(wwise_world, "character_foley", sound_character, wwise_source_id)
			end

			if rtpcs then
				for parameter_name, parameter_value in pairs(rtpcs) do
					if debug then
						printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
					end

					WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, parameter_name, parameter_value)
				end
			end

			if switches then
				for parameter_name, parameter_value in pairs(switches) do
					if debug then
						printf("   sound param: %q, sound_value %q", parameter_name, parameter_value)
					end

					WwiseWorld.set_switch(wwise_world, parameter_name, parameter_value, wwise_source_id)
				end
			end

			WwiseWorld.trigger_event(wwise_world, sound.event, use_occlusion, wwise_source_id)
		end
	end
end

local material = {
	"surface_material"
}

EffectHelper.query_material_surface = function (hit_unit, position, normal)
	local query_forward = normal
	local query_vector = query_forward * MaterialEffectSettings.material_query_depth
	local query_start_position = position + query_vector / 2
	local query_end_position = position - query_vector / 2

	return Unit.query_material(hit_unit, query_start_position, query_end_position, material)
end

return
