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

			drawer.vector(drawer, draw_pos, fwd, Color(255, 255, 0, 0))
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

		drawer.vector(drawer, draw_pos, fwd, Color(255, 0, 255, 0))
		Managers.state.debug_text:output_world_text(material, 0.1, draw_pos, 30, "material_text", Vector3(0, 255, 0))
	end

	fassert(not Unit.get_data(hit_unit, "breed"), "Trying to apply surface material effect to unit %q with breed.", hit_unit)
	fassert(not ScriptUnit.has_extension(hit_unit, "ai_inventory_item_system"), "Trying to apply surface material effect to unit %q with ai_inventory_item extension.", hit_unit)

	local decal_settings = effect_settings.decal and effect_settings.decal.settings

	if decal_settings then
		local projector_rotation = rotation
		local projection_position = position
		local projector_space = Matrix4x4.from_quaternion_position(projector_rotation, projection_position)
		local projector_extents = Vector3(decal_settings.height, decal_settings.width, decal_settings.depth)

		Managers.state.decal:add_projection_decal(effect_name, material, hit_unit, hit_actor, projection_position, projector_rotation, projector_extents, normal, rotation)

		if script_data.debug_material_effects then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})
			local drawer_space = Matrix4x4.from_quaternion_position(projector_rotation, projection_position + (Quaternion.forward(projector_rotation) * decal_settings.depth) / 2)
			local drawer_extents = Vector3(decal_settings.width / 2, decal_settings.depth / 2, decal_settings.height / 2)

			drawer.box(drawer, drawer_space, drawer_extents, Color(150, 0, 255, 0))
		end
	end

	sound = effect_settings.sound and effect_settings.sound[material]

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
			if script_data.debug_material_effects then
				printf("   sound param: \"sound_character\", sound_value %q", sound_character)
			end

			WwiseWorld.set_switch(wwise_world, "character", sound_character, wwise_source_id)
		end

		if script_data.debug_material_effects then
			printf("   sound param: \"husk\", sound_value %q", (husk and "true") or "false")
		end

		WwiseWorld.set_switch(wwise_world, "husk", (husk and "true") or "false", wwise_source_id)
		WwiseWorld.trigger_event(wwise_world, sound.event, wwise_source_id)
	end

	particles = effect_settings.particles and effect_settings.particles[material]

	if particles then
		local forward = Quaternion.forward(rotation)
		local normal_rotation = Quaternion.look(normal, Vector3.up())

		World.create_particles(world, particles, position, normal_rotation)

		if script_data.debug_material_effects then
			local drawer = Managers.state.debug:drawer({
				mode = "retained",
				name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
			})

			drawer.quaternion(drawer, position, normal_rotation)
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
		world_interaction = effect_settings.world_interaction and effect_settings.world_interaction[material]

		if world_interaction then
			Managers.state.world_interaction:add_simple_effect(material, hit_unit, position)
		end
	end

	return 
end
EffectHelper.play_skinned_surface_material_effects = function (effect_name, world, hit_unit, position, rotation, normal, husk, enemy_type, damage_sound, no_damage, hit_zone_name, shield_blocked)
	local effect_settings = MaterialEffectMappings[effect_name]
	local material = nil

	if hit_zone_name == "ward" then
		material = "ward"
	elseif no_damage then
		material = "armored"
	else
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

	particles = effect_settings.particles and effect_settings.particles[material]

	if particles then
		local normal_rotation = Quaternion.look(normal, Vector3.up())

		World.create_particles(world, particles, position, normal_rotation)
	end

	flow_event = effect_settings.flow_event and effect_settings.flow_event[material]

	if flow_event and hit_unit then
		Unit.flow_event(hit_unit, flow_event)
	end

	return 
end
EffectHelper.player_critical_hit = function (world, is_critical_hit, attacker_unit, target_unit, hit_position)
	if not AiUtils.unit_alive(target_unit) then
		return 
	end

	if not is_critical_hit then
		return 
	end

	local critical_hit_hud_sound_event = "Play_player_combat_crit_hit_2D"
	local first_person_extension = ScriptUnit.extension(attacker_unit, "first_person_system")

	first_person_extension.play_hud_sound_event(first_person_extension, critical_hit_hud_sound_event, nil, false)

	local critical_hit_sound_event = "Play_player_combat_crit_hit_3D"

	WwiseUtils.trigger_position_event(world, critical_hit_sound_event, hit_position)

	return 
end
EffectHelper.player_melee_hit_particles = function (world, particles_name, hit_position, hit_direction, damage_type, hit_unit)
	local hit_rotation = Quaternion.look(hit_direction)

	World.create_particles(world, particles_name, hit_position, hit_rotation)

	if damage_type and damage_type ~= "no_damage" then
		Managers.state.blood:spawn_blood_ball(hit_position, hit_direction, damage_type, hit_unit)
	end

	return 
end
EffectHelper.play_melee_hit_effects = function (sound_event, world, hit_position, sound_type, husk, hit_unit)
	local source_id, wwise_world = WwiseUtils.make_position_auto_source(world, hit_position)
	local player = Managers.player:owner(hit_unit)

	if player then
		local target_is_local_player = player.local_player

		WwiseWorld.set_switch(wwise_world, "target_is_local_player", tostring(target_is_local_player or false), source_id)
	else
		local breed = Unit.get_data(hit_unit, "breed")
		local enemy_type = breed.name

		WwiseWorld.set_switch(wwise_world, "enemy_type", enemy_type, source_id)
	end

	WwiseWorld.set_switch(wwise_world, "damage_sound", sound_type, source_id)
	WwiseWorld.set_switch(wwise_world, "husk", tostring(husk or false), source_id)
	WwiseWorld.trigger_event(wwise_world, sound_event, source_id)

	return 
end
EffectHelper.play_melee_hit_effects_enemy = function (sound_event, enemy_hit_sound, world, victim_unit, damage_type, is_husk)
	local source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, victim_unit)

	WwiseWorld.set_switch(wwise_world, "husk", tostring(is_husk or false), source_id)
	WwiseWorld.set_switch(wwise_world, "enemy_hit_sound", enemy_hit_sound, source_id)
	WwiseWorld.trigger_event(wwise_world, sound_event, source_id)

	return 
end
EffectHelper.remote_play_surface_material_effects = function (effect_name, world, unit, position, rotation, normal, is_server, hit_actor)
	local network_manager = Managers.state.network
	local level = LevelHelper:current_level(world)
	local unit_level_index = Level.unit_index(level, unit)
	local unit_game_object_id = network_manager.unit_game_object_id(network_manager, unit)
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

	return 
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

	return 
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
EffectHelper.flow_cb_play_footstep_surface_material_effects = function (effect_name, unit, object, foot_direction)
	local foot_node_index = Unit.node(unit, object)
	local raycast_offset = MaterialEffectSettings.footstep_raycast_offset
	local raycast_position = Unit.world_position(unit, foot_node_index) + Vector3(0, 0, raycast_offset)
	local raycast_direction = Vector3(0, 0, -1)
	local raycast_range = MaterialEffectSettings.footstep_raycast_max_range
	local sound_character = Unit.get_data(unit, "sound_character")
	local world = Managers.world:world("level_world")
	local physics_world = World.get_data(world, "physics_world")
	local debug = script_data.debug_material_effects
	local hit, position, distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, raycast_position, raycast_direction, raycast_range, "closest", "types", "both", "collision_filter", "filter_ground_material_check")
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

			drawer.vector(drawer, raycast_position, raycast_direction * raycast_range, Color(255, 255, 0, 0))
			Managers.state.debug_text:output_world_text("MISS", 0.1, raycast_position, 30, "material_text", Vector3(0, 255, 0))
		end

		local effect_settings = MaterialEffectMappings[effect_name]
		local level_settings = LevelHelper:current_level_settings()
		local material = level_settings.default_surface_material or DefaultSurfaceMaterial
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

				WwiseWorld.set_switch(wwise_world, "character", sound_character, wwise_source_id)
			end

			WwiseWorld.trigger_event(wwise_world, sound.event, wwise_source_id)
		end
	end

	return 
end
local material = {
	"surface_material"
}
EffectHelper.query_material_surface = function (hit_unit, position, normal)
	local query_forward = normal
	local query_vector = query_forward * MaterialEffectSettings.material_query_depth
	local query_start_position = position - query_vector / 2
	local query_end_position = position + query_vector / 2

	return Unit.query_material(hit_unit, query_start_position, query_end_position, material)
end

return 
