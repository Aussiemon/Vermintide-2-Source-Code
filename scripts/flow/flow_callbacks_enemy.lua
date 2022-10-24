require("foundation/scripts/util/table")
require("scripts/settings/unit_variation_settings")
require("scripts/settings/unit_gib_settings")

local enemy_dissovle_time = 3
local enemy_darken_time = 2
local enemy_darken_to_value = 0.15

function flow_callback_enemy_dissolve_data(params)
	return {
		dissovle_time = enemy_dissovle_time,
		darken_time = enemy_darken_time,
		darken_to = enemy_darken_to_value
	}
end

function flow_callback_enemy_dissolve_darken_vector(params)
	return {
		darken_vector = Vector3(1, enemy_darken_to_value, enemy_darken_time)
	}
end

local function enemy_variation_tint_meshes(unit, meshes, material, variable, value)
	for i = 1, #meshes, 1 do
		if Unit.has_mesh(unit, meshes[i]) then
			local current_mesh = Unit.mesh(unit, meshes[i])
			local current_material = Mesh.material(current_mesh, material)

			Material.set_scalar(current_material, variable, value)
		end
	end
end

local function enemy_variation_tint_part(unit, outfit_units, variation, material_result)
	local variable_value = math.random(variation.min, variation.max)

	if variation.scale ~= nil then
		variable_value = variable_value * variation.scale
	end

	local meshes = variation.meshes

	if not meshes then
		Profiler.start("enemy_variation_tint_part_no_meshlist")

		for j = 1, #variation.variables, 1 do
			Unit.set_scalar_for_material_table(unit, variation.materials, variation.variables[j], variable_value)

			if outfit_units ~= nil then
				for k = 1, #outfit_units, 1 do
					local outfit_unit = outfit_units[k]

					Unit.set_scalar_for_material_table(outfit_unit, variation.materials, variation.variables[j], variable_value)
				end
			end
		end

		Profiler.stop("enemy_variation_tint_part_no_meshlist")
	else
		Profiler.start("enemy_variation_tint_part_meshlist")

		for i = 1, #variation.materials, 1 do
			for j = 1, #variation.variables, 1 do
				enemy_variation_tint_meshes(unit, meshes, variation.materials[i], variation.variables[j], variable_value)

				if outfit_units ~= nil then
					for k = 1, #outfit_units, 1 do
						local outfit_unit = outfit_units[k]

						enemy_variation_tint_meshes(outfit_unit, meshes, variation.materials[i], variation.variables[j], variable_value)
					end
				end
			end
		end

		Profiler.stop("enemy_variation_tint_part_meshlist")
	end

	for i = 1, #variation.materials, 1 do
		for j = 1, #variation.variables, 1 do
			table.insert(material_result, {
				material = variation.materials[i],
				variable = variation.variables[j],
				value = variable_value,
				meshes = variation.meshes
			})
		end
	end

	return {}
end

local function enemy_variation_tint_materials(unit, outfit_units, variationsettings, material_sections, material_result)
	for i = 1, #material_sections, 1 do
		enemy_variation_tint_part(unit, outfit_units, variationsettings.material_variations[material_sections[i]], material_result)
	end
end

local function enemy_variation_enable_parts(unit, outfit_units, variationsettings, body_parts, group_result, material_result)
	for i = 1, #body_parts, 1 do
		local body_part = body_parts[i]
		local part_settings = variationsettings.body_parts[body_part]
		local variation = part_settings[math.random(#part_settings)]

		if variation.group then
			Unit.set_visibility(unit, variation.group, true)
			table.insert(group_result, variation.group)

			if variationsettings.material_variations ~= nil then
				local tint_variation = variationsettings.material_variations[variation.group]

				if tint_variation then
					enemy_variation_tint_part(unit, outfit_units, tint_variation, material_result)
				end
			end
		end

		if variation.enables then
			enemy_variation_enable_parts(unit, outfit_units, variationsettings, variation.enables, group_result, material_result)
		end
	end
end

local function enemy_variation_scale_nodes(unit, outfit_units, variationsettings, scaling_result)
	local node_id = nil

	for _, scale_nodes in pairs(variationsettings.scale_variation) do
		for j = 1, #scale_nodes, 1 do
			if scale_nodes[j] ~= nil then
				if Unit.has_node(unit, scale_nodes[j]) then
					node_id = Unit.node(unit, scale_nodes[j])

					Unit.set_local_scale(unit, node_id, Vector3(0, 0, 0))
				end

				if outfit_units ~= nil then
					for k = 1, #outfit_units, 1 do
						if Unit.has_node(outfit_units[k], scale_nodes[j]) then
							node_id = Unit.node(outfit_units[k], scale_nodes[j])

							Unit.set_local_scale(outfit_units[k], node_id, Vector3(0, 0, 0))
						end
					end
				end

				scaling_result[scale_nodes[j]] = 0
			end
		end

		local node_to_scale_up = scale_nodes[math.random(#scale_nodes)]

		if node_to_scale_up ~= nil then
			if Unit.has_node(unit, node_to_scale_up) then
				node_id = Unit.node(unit, node_to_scale_up)

				Unit.set_local_scale(unit, node_id, Vector3(1, 1, 1))
			end

			if outfit_units ~= nil then
				for k = 1, #outfit_units, 1 do
					if Unit.has_node(outfit_units[k], node_to_scale_up) then
						node_id = Unit.node(outfit_units[k], node_to_scale_up)

						Unit.set_local_scale(outfit_units[k], node_id, Vector3(1, 1, 1))
					end
				end
			end

			scaling_result[node_to_scale_up] = 1
		end
	end
end

function flow_callback_enemy_variation(params)
	local unit = params.unit
	local breed_type = params.breed_type
	local breed = Unit.get_data(unit, "breed")

	if breed ~= nil then
		breed_type = breed.name
	end

	if breed_type == nil then
		return {}
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitVariationSettings[breed_type] == nil then
		return {}
	end

	Profiler.start("enemy_variation")

	local variationsettings = UnitVariationSettings[breed_type]
	local variation_result = {}
	local material_result = {}
	local group_result = {}
	local scaling_result = {}
	local outfit_units = {}
	local helmet_units = {}

	if ScriptUnit ~= nil then
		local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

		if unit_inventory_extension ~= nil then
			outfit_units = unit_inventory_extension.inventory_item_outfit_units
			helmet_units = unit_inventory_extension.inventory_item_helmet_units
		end
	else
		outfit_units = Unit.get_data(unit, "outfit_items") or {}
		helmet_units = Unit.get_data(unit, "helmet_items") or {}
	end

	if outfit_units ~= nil then
		for k = 1, #outfit_units, 1 do
			local outfit_variation = Unit.get_data(outfit_units[k], "gib_variation")

			if outfit_variation ~= nil then
				table.insert(group_result, outfit_variation)
			end
		end
	end

	if helmet_units ~= nil then
		outfit_units = table.shallow_copy(outfit_units)

		for i = 1, #helmet_units, 1 do
			table.insert(outfit_units, helmet_units[i])
		end
	end

	if variationsettings.materials_enabled_from_start ~= nil then
		Profiler.start("enemy_variation_materials")
		enemy_variation_tint_materials(unit, outfit_units, variationsettings, variationsettings.materials_enabled_from_start, material_result)
		Profiler.stop("enemy_variation_materials")
	end

	if variationsettings.enabled_from_start ~= nil then
		Profiler.start("enemy_variation_parts")

		if Unit.has_visibility_group(unit, "all") then
			Unit.set_visibility(unit, "all", false)
		end

		enemy_variation_enable_parts(unit, outfit_units, variationsettings, variationsettings.enabled_from_start, group_result, material_result)
		Profiler.stop("enemy_variation_parts")
	end

	if variationsettings.scale_variation ~= nil then
		Profiler.start("enemy_variation_scale")
		enemy_variation_scale_nodes(unit, outfit_units, variationsettings, scaling_result)
		Profiler.stop("enemy_variation_scale")
	end

	variation_result.groups = group_result
	variation_result.materials = material_result
	variation_result.scaling = scaling_result

	Profiler.stop("enemy_variation")
	Unit.set_data(unit, "variation_data", variation_result)
	Unit.set_data(unit, "dismember_filter", {})

	return {}
end

local function enemy_dismember_can_spawn_gib(unit, bodypart)
	local dismember_filter = Unit.get_data(unit, "dismember_filter") or {}

	if table.contains(dismember_filter, bodypart) then
		return false
	end

	return true
end

local function enemy_dismember_set_dismember_filter(unit, bodypart, gibsettings)
	local dismember_filter = Unit.get_data(unit, "dismember_filter") or {}

	if not table.contains(dismember_filter, bodypart) then
		table.insert(dismember_filter, bodypart)
	end

	if gibsettings.disable_gibs ~= nil then
		for i = 1, #gibsettings.disable_gibs, 1 do
			if not table.contains(dismember_filter, gibsettings.disable_gibs[i]) then
				table.insert(dismember_filter, gibsettings.disable_gibs[i])
			end
		end
	end

	Unit.set_data(unit, "dismember_filter", dismember_filter)
end

local function enemy_dismember_get_helmet_units(unit, unit_inventory_extension)
	local helmet_units = {}
	helmet_units = (unit_inventory_extension == nil or unit_inventory_extension.inventory_item_helmet_units) and (Unit.get_data(unit, "helmet_items") or {})

	return helmet_units
end

local function enemy_dismember_disable_helmets(unit, unit_inventory_extension, gibsettings)
	if gibsettings.gib_helmet_link_node ~= nil then
		local helmet_units = enemy_dismember_get_helmet_units(unit, unit_inventory_extension)

		for i = 1, #helmet_units, 1 do
			if Unit.has_animation_state_machine(helmet_units[i]) then
				Unit.disable_animation_state_machine(helmet_units[i])
			end
		end
	end
end

local function enemy_dismember_spawn_gib(unit_spawner, unit, world, gibsettings, force_multiplier, unit_inventory_extension, unit_ai_system_extension)
	local node_id = Unit.node(unit, gibsettings.gib_parent_align_node)
	local spawn_pose = Matrix4x4.from_quaternion_position(Unit.world_rotation(unit, node_id), Unit.world_position(unit, node_id))

	if gibsettings.gib_disable_auto_scale ~= true then
		local unit_scale = Unit.local_scale(unit, 1)

		if unit_ai_system_extension ~= nil then
			local scale = unit_ai_system_extension._size_variation or 1
			unit_scale = Vector3(scale, scale, scale)
		end

		Matrix4x4.set_scale(spawn_pose, unit_scale)
	end

	local gib_unit = nil

	if unit_spawner ~= nil then
		if gibsettings.gib_unit_template ~= nil then
			gib_unit = unit_spawner:spawn_local_unit_with_extensions(gibsettings.gib_unit, gibsettings.gib_unit_template, nil, spawn_pose)
		else
			gib_unit = unit_spawner:spawn_local_unit(gibsettings.gib_unit, spawn_pose)
		end
	else
		gib_unit = World.spawn_unit(world, gibsettings.gib_unit, spawn_pose)
	end

	if gibsettings.gib_helmet_link_node ~= nil then
		local helmet_units = enemy_dismember_get_helmet_units(unit, unit_inventory_extension)

		for i = 1, #helmet_units, 1 do
			World.unlink_unit(world, helmet_units[i])
			World.link_unit(Unit.world(gib_unit), helmet_units[i], gib_unit, Unit.node(gib_unit, gibsettings.gib_helmet_link_node))
			Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(helmet_units[i], "outline_unit", false)
		end
	end

	local actor = Unit.actor(gib_unit, gibsettings.gib_push_actor)

	if not actor then
	else
		if Unit.has_node(gib_unit, "a_push") then
			node_id = Unit.node(gib_unit, "a_push")
		else
			node_id = Script.index_offset()
		end

		if force_multiplier ~= 1 then
			Actor.add_velocity(actor, Quaternion.rotate(Unit.world_rotation(gib_unit, node_id), Vector3(2 + math.random(-0.5, 0.5), math.random(-1, 1), math.random(-1, 1))) * gibsettings.gib_push_force * 0.75 * force_multiplier)
			Actor.add_angular_velocity(actor, Vector3(math.random(0, 2), math.random(0, 2), math.random(0, 2)) * force_multiplier)
		else
			Actor.add_velocity(actor, Quaternion.rotate(Unit.world_rotation(gib_unit, node_id), Vector3(2 + 0.5 * math.random(), math.random() - 0.5, math.random() - 0.5)) * gibsettings.gib_push_force)
		end
	end

	return gib_unit
end

local function enemy_dismember_spawn_stump(unit_spawner, unit, world, gibsettings, pulp)
	local node_id = Unit.node(unit, gibsettings.stump_parent_align_node)
	local stump_unit_name = nil

	if pulp and gibsettings.pulp_stump_unit then
		if type(gibsettings.pulp_stump_unit) == "table" then
			stump_unit_name = gibsettings.pulp_stump_unit[Math.random(1, #gibsettings.pulp_stump_unit)]
		else
			stump_unit_name = gibsettings.pulp_stump_unit
		end
	else
		stump_unit_name = gibsettings.stump_unit
	end

	local stump_unit = nil

	if unit_spawner ~= nil then
		stump_unit = unit_spawner:spawn_local_unit(stump_unit_name, Unit.world_position(unit, node_id), Unit.world_rotation(unit, node_id))
	else
		stump_unit = World.spawn_unit(world, stump_unit_name, Unit.world_position(unit, node_id), Unit.world_rotation(unit, node_id))
	end

	Profiler.start("link_nodes")

	local stump_link_nodes = gibsettings.stump_link_nodes
	local parent_link_nodes = gibsettings.parent_link_nodes

	World.link_unit(world, stump_unit, Script.index_offset(), unit, Unit.node(unit, parent_link_nodes[1]))

	for i = 1, #parent_link_nodes, 1 do
		local parent_node_id = Unit.node(unit, parent_link_nodes[i])
		local stump_node_id = Unit.node(stump_unit, stump_link_nodes[i])

		World.link_unit(world, stump_unit, stump_node_id, unit, parent_node_id)
	end

	if Unit.has_lod_object(unit, "lod") and Unit.has_lod_object(stump_unit, "lod") then
		local unit_lod_object = Unit.lod_object(unit, "lod")
		local stump_unit_lod_object = Unit.lod_object(stump_unit, "lod")

		LODObject.set_bounding_volume(stump_unit_lod_object, LODObject.bounding_volume(unit_lod_object))
		World.link_unit(world, stump_unit, LODObject.node(stump_unit_lod_object), unit, LODObject.node(unit_lod_object))
	end

	Profiler.stop("link_nodes")

	return stump_unit
end

local function enemy_dismember_set_variations_on_unit(new_unit, variation_data)
	for _, material_data in pairs(variation_data.materials) do
		local meshes = material_data.meshes

		if not meshes then
			Unit.set_scalar_for_material(new_unit, material_data.material, material_data.variable, material_data.value)
		else
			enemy_variation_tint_meshes(new_unit, meshes, material_data.material, material_data.variable, material_data.value)
		end
	end

	if Unit.has_visibility_group(new_unit, "all") then
		Unit.set_visibility(new_unit, "all", false)

		for i = 1, #variation_data.groups, 1 do
			if Unit.has_visibility_group(new_unit, variation_data.groups[i]) then
				Unit.set_visibility(new_unit, variation_data.groups[i], true)
			end
		end
	end

	for node_name, scale_value in pairs(variation_data.scaling) do
		if Unit.has_node(new_unit, node_name) then
			local node_id = Unit.node(new_unit, node_name)

			Unit.set_local_scale(new_unit, node_id, Vector3(scale_value, scale_value, scale_value))
		end
	end
end

local function enemy_dismember_set_baked_variations_on_unit(new_unit, baked_variation)
	if Unit.has_visibility_group(new_unit, "all") then
		Unit.set_visibility(new_unit, "all", false)

		if Unit.has_visibility_group(new_unit, "var" .. baked_variation) then
			Unit.set_visibility(new_unit, "var" .. baked_variation, true)
		end
	end
end

local function enemy_dismember_set_variations(unit, gib_unit, stump_unit)
	local variation_data = Unit.get_data(unit, "variation_data")
	local baked_variation = Unit.get_data(unit, "gib_variation")

	if variation_data == nil and baked_variation == nil then
		return
	end

	if variation_data ~= nil then
		if gib_unit ~= nil then
			enemy_dismember_set_variations_on_unit(gib_unit, variation_data)
		end

		if stump_unit ~= nil then
			enemy_dismember_set_variations_on_unit(stump_unit, variation_data)
		end
	end

	if baked_variation ~= nil then
		if gib_unit ~= nil then
			enemy_dismember_set_baked_variations_on_unit(gib_unit, baked_variation)
		end

		if stump_unit ~= nil then
			enemy_dismember_set_baked_variations_on_unit(stump_unit, baked_variation)
		end
	end
end

local function enemy_dismember_kill_actors(unit, actors, unit_inventory_extension)
	if unit_inventory_extension ~= nil then
		local disabled_actors = unit_inventory_extension.disabled_actors

		for i = 1, #actors, 1 do
			local unit_actor = Unit.actor(unit, actors[i])

			if unit_actor then
				Actor.set_scene_query_enabled(unit_actor, false)
				Actor.set_collision_filter(unit_actor, "filter_ragdoll_secondary")

				if disabled_actors ~= nil then
					table.insert(disabled_actors, actors[i])
				end
			end
		end

		unit_inventory_extension.disabled_actors = disabled_actors
	else
		for i = 1, #actors, 1 do
			local current_actor = Unit.actor(unit, actors[i])

			if current_actor ~= nil then
				Unit.destroy_actor(unit, actors[i])
			end
		end
	end
end

local function enemy_dismember(params, spawn_gib)
	local unit = params.unit
	local breed_type = params.breed_type
	local breed = Unit.get_data(unit, "breed")

	if breed ~= nil then
		breed_type = breed.name
	end

	if breed_type == nil then
		return
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitGibSettings[breed_type] == nil then
		return
	end

	local bodypart = params.bodypart

	if UnitGibSettings[breed_type].parts[bodypart] == nil then
		return
	end

	local gibsettings = UnitGibSettings[breed_type].parts[bodypart]

	Profiler.start("enemy_gib_can_gib")

	local can_spawn_gib = enemy_dismember_can_spawn_gib(unit, bodypart)

	Profiler.stop("enemy_gib_can_gib")

	if not can_spawn_gib then
		return
	end

	Profiler.start("enemy_gib_" .. bodypart)

	local world = Unit.world(unit)
	local node_id, unit_inventory_extension, unit_ai_system_extension, unit_spawner = nil

	if ScriptUnit ~= nil then
		unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")
		unit_ai_system_extension = ScriptUnit.has_extension(unit, "ai_system")
		unit_spawner = Managers.state.unit_spawner

		if ScriptUnit.has_extension(unit, "projectile_linker_system") then
			local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

			projectile_linker_system:clear_linked_projectiles(unit)
		end
	end

	local gib_unit = nil

	if spawn_gib then
		Profiler.start("spawn_gib")

		gib_unit = enemy_dismember_spawn_gib(unit_spawner, unit, world, gibsettings, 1, unit_inventory_extension, unit_ai_system_extension)

		Profiler.stop("spawn_gib")
	else
		enemy_dismember_disable_helmets(unit, unit_inventory_extension, gibsettings)
	end

	Profiler.start("remove_physics")
	enemy_dismember_kill_actors(unit, gibsettings.parent_destroy_actors, unit_inventory_extension)
	enemy_dismember_kill_actors(unit, gibsettings.ragdoll_destroy_actors, nil)
	Profiler.stop("remove_physics")
	Profiler.start("spawn_stump")

	local stump_unit = enemy_dismember_spawn_stump(unit_spawner, unit, world, gibsettings, not spawn_gib)

	Profiler.stop("spawn_stump")
	Profiler.start("set_variations")
	enemy_dismember_set_variations(unit, gib_unit, stump_unit)

	if Unit.get_data(unit, "was_burned") then
		Unit.flow_event(stump_unit, "lua_already_burned")

		if gib_unit ~= nil then
			Unit.flow_event(gib_unit, "lua_already_burned")
		end
	end

	Profiler.stop("set_variations")

	local gibbed_nodes = nil

	if unit_inventory_extension ~= nil then
		gibbed_nodes = unit_inventory_extension.gibbed_nodes or {}
	end

	for i = 1, #gibsettings.parent_scale_nodes, 1 do
		node_id = Unit.node(unit, gibsettings.parent_scale_nodes[i])

		Unit.set_local_scale(unit, node_id, Vector3(gibsettings.parent_scale, gibsettings.parent_scale, gibsettings.parent_scale))

		if gibbed_nodes ~= nil then
			gibbed_nodes[#gibbed_nodes + 1] = node_id
		end
	end

	if unit_inventory_extension ~= nil then
		unit_inventory_extension.gibbed_nodes = gibbed_nodes
	end

	if gibsettings.parent_hide_group ~= nil and Unit.has_visibility_group(unit, gibsettings.parent_hide_group) then
		Unit.set_visibility(unit, gibsettings.parent_hide_group, false)
	end

	if gibsettings.send_outfit_event ~= nil then
		if unit_inventory_extension ~= nil then
			for i = 1, #unit_inventory_extension.inventory_item_outfit_units, 1 do
				Unit.flow_event(unit_inventory_extension.inventory_item_outfit_units[i], gibsettings.send_outfit_event)
			end
		else
			local outfit_items = Unit.get_data(unit, "outfit_items") or {}

			for i = 1, #outfit_items, 1 do
				Unit.flow_event(outfit_items[i], gibsettings.send_outfit_event)
			end
		end
	end

	Profiler.start("vfx")

	if BloodSettings == nil or BloodSettings.enemy_blood.enabled then
		node_id = Unit.node(stump_unit, "a_vfx")

		if gibsettings.vfx ~= nil then
			local vfx_id = World.create_particles(world, gibsettings.vfx, Unit.world_position(stump_unit, node_id), Unit.world_rotation(stump_unit, node_id))

			World.link_particles(world, vfx_id, stump_unit, node_id, Matrix4x4.identity(), "destroy")
		end

		if gib_unit == nil and gibsettings.pulp_vfx ~= nil then
			local vfx_id = World.create_particles(world, gibsettings.pulp_vfx, Unit.world_position(stump_unit, node_id), Unit.world_rotation(stump_unit, node_id))

			World.link_particles(world, vfx_id, stump_unit, node_id, Matrix4x4.identity(), "destroy")
		end
	end

	Profiler.stop("vfx")
	Profiler.start("sfx")

	if not spawn_gib and bodypart == "head" then
		local wwise_world = Wwise.wwise_world(world)
		node_id = Unit.node(stump_unit, "a_vfx")

		WwiseWorld.trigger_event(wwise_world, "Play_combat_enemy_head_crush", stump_unit, node_id)
	end

	if ScriptUnit ~= nil and gibsettings.stop_death_sound then
		local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")

		if hit_reaction_extension then
			local wwise_world = Wwise.wwise_world(world)
			local playing_id = hit_reaction_extension:death_sound_event_id()

			if playing_id then
				WwiseWorld.stop_event(wwise_world, playing_id)
			end
		end
	end

	Profiler.stop("sfx")

	if unit_inventory_extension ~= nil then
		if gib_unit ~= nil then
			local gib_items = unit_inventory_extension.gib_items

			table.insert(gib_items, gib_unit)

			unit_inventory_extension.gib_items = gib_items
		end

		local stump_items = unit_inventory_extension.stump_items

		table.insert(stump_items, stump_unit)

		unit_inventory_extension.stump_items = stump_items
	else
		if gib_unit ~= nil then
			local gib_items = Unit.get_data(unit, "gib_items") or {}

			table.insert(gib_items, gib_unit)
			Unit.set_data(unit, "gib_items", gib_items)
		end

		local stump_items = Unit.get_data(unit, "stump_items") or {}

		table.insert(stump_items, stump_unit)
		Unit.set_data(unit, "stump_items", stump_items)
	end

	enemy_dismember_set_dismember_filter(unit, bodypart, gibsettings)
	Profiler.stop("enemy_gib_" .. bodypart)
end

function enemy_explode(params)
	local unit = params.unit
	local breed_type = params.breed_type
	local breed = Unit.get_data(unit, "breed")

	if breed ~= nil then
		breed_type = breed.name
	end

	if breed_type == nil then
		return
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitGibSettings[breed_type] == nil then
		return
	end

	if UnitGibSettings[breed_type].explode == nil then
		return
	end

	local explodesettings = UnitGibSettings[breed_type].explode

	if explodesettings.part_combos == nil then
		return
	end

	local world = Unit.world(unit)
	local unit_inventory_extension, unit_spawner = nil

	if ScriptUnit ~= nil then
		unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")
		unit_spawner = Managers.state.unit_spawner
	end

	if unit_inventory_extension ~= nil then
		if #unit_inventory_extension.stump_items ~= 0 then
			return
		end
	elseif Unit.get_data(unit, "stump_items") ~= nil then
		return
	end

	if Unit.get_data(unit, "exploded") then
		return
	end

	Profiler.start("enemy_explode_" .. breed_type)

	local already_burned = nil

	if Unit.get_data(unit, "was_burned") then
		already_burned = true
	end

	local part_combo = explodesettings.part_combos[math.random(#explodesettings.part_combos)]
	local relinked_helmet = false
	local push_force_multiplier = 1

	if type(explodesettings.push_force_multiplier) == "number" then
		push_force_multiplier = explodesettings.push_force_multiplier
	end

	for i = 1, #part_combo, 1 do
		if UnitGibSettings[breed_type].parts[part_combo[i]] == nil then
		else
			local gibsettings = UnitGibSettings[breed_type].parts[part_combo[i]]
			local gib_unit = enemy_dismember_spawn_gib(unit_spawner, unit, world, gibsettings, push_force_multiplier, unit_inventory_extension)

			enemy_dismember_set_variations(unit, gib_unit, nil)

			if already_burned then
				Unit.flow_event(gib_unit, "lua_already_burned")
			end

			Unit.flow_event(gib_unit, "lua_start_despawn_timer")

			if gibsettings.gib_helmet_link_node ~= nil then
				relinked_helmet = true
			end
		end
	end

	if (BloodSettings == nil or BloodSettings.enemy_blood.enabled) and explodesettings.vfx_align_node ~= nil then
		local node_id = Unit.node(unit, explodesettings.vfx_align_node)

		if explodesettings.vfx ~= nil then
			local vfx_id = World.create_particles(world, explodesettings.vfx, Unit.world_position(unit, node_id), Unit.world_rotation(unit, node_id))

			World.link_particles(world, vfx_id, unit, node_id, Matrix4x4.identity(), "destroy")
		end
	end

	local outfit_items = {}

	if unit_inventory_extension ~= nil then
		outfit_items = unit_inventory_extension.inventory_item_outfit_units or {}
	else
		outfit_items = Unit.get_data(unit, "outfit_items") or {}
	end

	for i = 1, #outfit_items, 1 do
		Unit.set_unit_visibility(outfit_items[i], false)
	end

	if gibsettings.send_outfit_event ~= nil then
		for i = 1, #outfit_items, 1 do
			Unit.flow_event(outfit_items[i], gibsettings.send_outfit_event)
		end
	end

	local helmet_units = enemy_dismember_get_helmet_units(unit, unit_inventory_extension)

	for i = 1, #helmet_units, 1 do
		if relinked_helmet == false then
			Unit.set_unit_visibility(helmet_units[i], false)
		else
			if unit_inventory_extension == nil then
				Unit.set_data(unit, "helmet_items", {})
			end

			Unit.flow_event(helmet_units[i], "lua_start_despawn_timer")
		end
	end

	Unit.set_unit_visibility(unit, false)
	Unit.disable_physics(unit)
	Unit.set_data(unit, "exploded", true)
	Profiler.stop("enemy_explode_" .. breed_type)
end

function flow_callback_enemy_gib(params)
	if BloodSettings == nil or BloodSettings.dismemberment.enabled then
		enemy_dismember(params, true)
	end

	return {}
end

function flow_callback_enemy_pulp(params)
	if BloodSettings == nil or BloodSettings.dismemberment.enabled then
		enemy_dismember(params, false)
	end

	return {}
end

function flow_callback_enemy_explode(params)
	if BloodSettings == nil or BloodSettings.dismemberment.enabled then
		enemy_explode(params)
	end

	return {}
end

return
