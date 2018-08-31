require("foundation/scripts/util/table")
require("scripts/settings/unit_variation_settings")
require("scripts/settings/unit_gib_settings")

local function enemy_variation_tint_meshes(unit, meshes, material, variable, value)
	for i = 1, #meshes, 1 do
		if Unit.has_mesh(unit, meshes[i]) then
			local current_mesh = Unit.mesh(unit, meshes[i])
			local current_material = Mesh.material(current_mesh, material)

			Material.set_scalar(current_material, variable, value)
		end
	end
end

local function enemy_variation_tint_part(unit, variation, material_result)
	local variable_value = math.random(variation.min, variation.max)

	if variation.scale ~= nil then
		variable_value = variable_value * variation.scale
	end

	local meshes = variation.meshes

	if not meshes then
		for j = 1, #variation.variables, 1 do
			Unit.set_scalar_for_material_table(unit, variation.materials, variation.variables[j], variable_value)
		end
	else
		for i = 1, #variation.materials, 1 do
			for j = 1, #variation.variables, 1 do
				enemy_variation_tint_meshes(unit, meshes, variation.materials[i], variation.variables[j], variable_value)
			end
		end
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

local function enemy_variation_tint_materials(unit, variationsettings, material_sections, material_result)
	for i = 1, #material_sections, 1 do
		enemy_variation_tint_part(unit, variationsettings.material_variations[material_sections[i]], material_result)
	end
end

local function enemy_variation_enable_parts(unit, variationsettings, body_parts, group_result, material_result)
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
					enemy_variation_tint_part(unit, tint_variation, material_result)
				end
			end
		end

		if variation.enables then
			enemy_variation_enable_parts(unit, variationsettings, variation.enables, group_result, material_result)
		end
	end
end

local function enemy_variation_scale_nodes(unit, variationsettings, scaling_result)
	local node_id = nil

	for key, scale_nodes in pairs(variationsettings.scale_variation) do
		for j = 1, #scale_nodes, 1 do
			if scale_nodes[j] ~= nil then
				node_id = Unit.node(unit, scale_nodes[j])

				Unit.set_local_scale(unit, node_id, Vector3(0, 0, 0))

				scaling_result[scale_nodes[j]] = 0
			end
		end

		local node_to_scale_up = scale_nodes[math.random(#scale_nodes)]

		if node_to_scale_up ~= nil then
			node_id = Unit.node(unit, node_to_scale_up)

			Unit.set_local_scale(unit, node_id, Vector3(1, 1, 1))

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
		print("[flow_callback_enemy_variation] Skipped variation due to missing breed data")

		return {}
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitVariationSettings[breed_type] == nil then
		print("[flow_callback_enemy_variation] Skipped variation due to missing breed in settings file -> " .. breed_type)

		return {}
	end

	local variationsettings = UnitVariationSettings[breed_type]
	local variation_result = {}
	local material_result = {}
	local group_result = {}
	local scaling_result = {}

	if variationsettings.materials_enabled_from_start ~= nil then
		enemy_variation_tint_materials(unit, variationsettings, variationsettings.materials_enabled_from_start, material_result)
	end

	if variationsettings.enabled_from_start ~= nil then
		if Unit.has_visibility_group(unit, "all") then
			Unit.set_visibility(unit, "all", false)
		end

		enemy_variation_enable_parts(unit, variationsettings, variationsettings.enabled_from_start, group_result, material_result)
	end

	if variationsettings.scale_variation ~= nil then
		enemy_variation_scale_nodes(unit, variationsettings, scaling_result)
	end

	variation_result.groups = group_result
	variation_result.materials = material_result
	variation_result.scaling = scaling_result

	Unit.set_data(unit, "variation_data", variation_result)

	return {}
end

local function enemy_dismember_can_spawn_gib(unit, gibsettings)
	if gibsettings.parent_destroy_actors then
		for _, actor_name in ipairs(gibsettings.parent_destroy_actors) do
			if not Unit.actor(unit, actor_name) then
				return false
			end
		end
	end

	return true
end

local function enemy_dismember_spawn_gib(unit, world, gibsettings, unit_inventory_extension, unit_ai_system_extension)
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

	local gib_unit = World.spawn_unit(world, gibsettings.gib_unit, spawn_pose)

	if unit_inventory_extension ~= nil and gibsettings.gib_helmet_link_node ~= nil then
		local helmet_unit = unit_inventory_extension.inventory_item_helmet_unit

		if helmet_unit ~= nil then
			World.unlink_unit(world, helmet_unit)
			World.link_unit(Unit.world(gib_unit), helmet_unit, gib_unit, Unit.node(gib_unit, gibsettings.gib_helmet_link_node))
			Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(helmet_unit, "outline_unit", false)
		end
	end

	local actor = Unit.actor(gib_unit, gibsettings.gib_push_actor)

	if not actor then
		print("[enemy_dismember_spawn_gib] Skipped gib unit push. Could not find actor " .. gibsettings.gib_push_actor .. " in unit")
	else
		if Unit.has_node(gib_unit, "a_push") then
			node_id = Unit.node(gib_unit, "a_push")
		else
			node_id = Script.index_offset()
		end

		Actor.add_velocity(actor, Quaternion.rotate(Unit.world_rotation(gib_unit, node_id), Vector3(2 + 0.5 * math.random(), math.random() - 0.5, math.random() - 0.5)) * gibsettings.gib_push_force)
	end

	return gib_unit
end

local function enemy_dismember_spawn_stump(unit, world, gibsettings, pulp)
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

	local stump_unit = World.spawn_unit(world, stump_unit_name, Unit.world_position(unit, node_id), Unit.world_rotation(unit, node_id))
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
		LODObject.set_orientation_node(stump_unit_lod_object, unit, LODObject.node(unit_lod_object))
	end

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

local function enemy_dismember_kill_actors(unit, actors)
	for i = 1, #actors, 1 do
		local current_actor = Unit.actor(unit, actors[i])

		if current_actor ~= nil then
			Unit.destroy_actor(unit, actors[i])
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
		print("[enemy_dismember] Skipped gib due to missing breed data")

		return
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitGibSettings[breed_type] == nil then
		print("[enemy_dismember] Skipped gib due to missing breed in settings file -> " .. breed_type)

		return
	end

	local bodypart = params.bodypart

	if UnitGibSettings[breed_type].parts[bodypart] == nil then
		print("[enemy_dismember] Skipped gib due to missing body part for breed in settings file -> " .. breed_type .. " -> " .. bodypart)

		return
	end

	local gibsettings = UnitGibSettings[breed_type].parts[bodypart]
	local world = Unit.world(unit)
	local node_id, unit_inventory_extension, unit_ai_system_extension = nil

	if ScriptUnit ~= nil then
		unit_inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")
		unit_ai_system_extension = ScriptUnit.extension(unit, "ai_system")
	end

	local can_spawn_gib = enemy_dismember_can_spawn_gib(unit, gibsettings)

	if not can_spawn_gib then
		return
	end

	local gib_unit = nil

	if spawn_gib then
		gib_unit = enemy_dismember_spawn_gib(unit, world, gibsettings, unit_inventory_extension, unit_ai_system_extension)
	end

	enemy_dismember_kill_actors(unit, gibsettings.parent_destroy_actors)
	enemy_dismember_kill_actors(unit, gibsettings.ragdoll_destroy_actors)

	local stump_unit = enemy_dismember_spawn_stump(unit, world, gibsettings, not spawn_gib)

	enemy_dismember_set_variations(unit, gib_unit, stump_unit)

	local gibbed_nodes = unit_inventory_extension.gibbed_nodes

	for i = 1, #gibsettings.parent_scale_nodes, 1 do
		node_id = Unit.node(unit, gibsettings.parent_scale_nodes[i])
		gibbed_nodes[#gibbed_nodes + 1] = node_id

		Unit.set_local_scale(unit, node_id, Vector3(gibsettings.parent_scale, gibsettings.parent_scale, gibsettings.parent_scale))
	end

	if gibsettings.parent_hide_group ~= nil and Unit.has_visibility_group(unit, gibsettings.parent_hide_group) then
		Unit.set_visibility(unit, gibsettings.parent_hide_group, false)
	end

	node_id = Unit.node(stump_unit, "a_vfx")

	if gibsettings.vfx ~= nil then
		local vfx_id = World.create_particles(world, gibsettings.vfx, Unit.world_position(stump_unit, node_id), Unit.world_rotation(stump_unit, node_id))

		World.link_particles(world, vfx_id, stump_unit, node_id, Matrix4x4.identity(), "destroy")
	end

	if gib_unit == nil and gibsettings.pulp_vfx ~= nil then
		local vfx_id = World.create_particles(world, gibsettings.pulp_vfx, Unit.world_position(stump_unit, node_id), Unit.world_rotation(stump_unit, node_id))

		World.link_particles(world, vfx_id, stump_unit, node_id, Matrix4x4.identity(), "destroy")
	end

	if not spawn_gib and bodypart == "head" then
		local wwise_world = Wwise.wwise_world(world)

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

	if unit_inventory_extension ~= nil then
		if gib_unit ~= nil then
			local gib_items = unit_inventory_extension.gib_items

			table.insert(gib_items, gib_unit)

			unit_inventory_extension.gib_items = gib_items
		end

		local stump_items = unit_inventory_extension.stump_items

		table.insert(stump_items, stump_unit)

		unit_inventory_extension.stump_items = stump_items
	end
end

function enemy_explode(params)
	local unit = params.unit
	local breed_type = params.breed_type
	local breed = Unit.get_data(unit, "breed")

	if breed ~= nil then
		breed_type = breed.name
	end

	if breed_type == nil then
		print("[enemy_dismember] Skipped explode due to missing breed data")

		return
	end

	if params.baked then
		breed_type = breed_type .. "_baked"
	end

	if UnitGibSettings[breed_type] == nil then
		print("[enemy_dismember] Skipped explode due to missing breed in settings file -> " .. breed_type)

		return
	end

	if UnitGibSettings[breed_type].explode == nil then
		print("[enemy_dismember] Skipped explode due to missing explode info for breed in settings file -> " .. breed_type)

		return
	end

	local explodesettings = UnitGibSettings[breed_type].explode

	if explodesettings.part_combos == nil then
		print("[enemy_dismember] Skipped explode due to missing part combo info for breed in settings file -> " .. breed_type)

		return
	end

	local world = Unit.world(unit)
	local unit_inventory_extension = nil

	if ScriptUnit ~= nil then
		unit_inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")
	end

	local part_combo = explodesettings.part_combos[math.random(#explodesettings.part_combos)]

	for i = 1, #part_combo, 1 do
		if UnitGibSettings[breed_type].parts[part_combo[i]] == nil then
			print("[enemy_dismember] Skipped spawning gib part due to missing body part for breed in settings file -> " .. breed_type .. " -> " .. part_combo[i])
		else
			local gibsettings = UnitGibSettings[breed_type].parts[part_combo[i]]
			local gib_unit = enemy_dismember_spawn_gib(unit, world, gibsettings, unit_inventory_extension)

			enemy_dismember_set_variations(unit, gib_unit, nil)
			Unit.flow_event(gib_unit, "lua_start_despawn_timer")
		end
	end

	if explodesettings.vfx_align_node ~= nil then
		node_id = Unit.node(unit, explodesettings.vfx_align_node)

		if explodesettings.vfx ~= nil then
			local vfx_id = World.create_particles(world, explodesettings.vfx, Unit.world_position(unit, node_id), Unit.world_rotation(unit, node_id))

			World.link_particles(world, vfx_id, unit, node_id, Matrix4x4.identity(), "destroy")
		end
	end

	Unit.set_unit_visibility(unit, false)
	Unit.disable_physics(unit)
end

function flow_callback_enemy_gib(params)
	enemy_dismember(params, true)

	return {}
end

function flow_callback_enemy_pulp(params)
	enemy_dismember(params, false)

	return {}
end

function flow_callback_enemy_explode(params)
	enemy_explode(params)

	return {}
end

return
