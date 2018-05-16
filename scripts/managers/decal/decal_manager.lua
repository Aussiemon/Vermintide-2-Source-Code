require("scripts/settings/decal_settings")

DecalManager = class(DecalManager)

DecalManager.init = function (self, world)
	self._world = world

	self:_setup_decal_data()
end

DecalManager._setup_decal_data = function (self)
	self._decal_pools = {}
	local decal_pools = self._decal_pools

	for material, _ in pairs(DecalSettings) do
		decal_pools[material] = GrowQueue:new()
	end

	decal_pools.default = GrowQueue:new()
end

DecalManager.add_projection_decal = function (self, effect_name, material, hit_unit, hit_actor, position, rotation, extents, normal, unit_rotation)
	local world = self._world
	local material_surface_decals = EffectHelper.create_surface_material_drawer_mapping(effect_name)
	local decal_unit_name = material_surface_decals[material]

	if not Application.can_get("unit", decal_unit_name) then
		Application.warning("[DecalManager] There is no decal_unit_name specified for effect: %q with material: %q--> Using Default: %q", effect_name, material, DefaultDecalSettings.unit)

		decal_unit_name = DefaultDecalSettings.unit
	end

	local decal_settings = DecalSettings[material]

	if not decal_settings then
		Application.warning("[DecalManager] There is no decal settings for material: %q --> Using Default", material)

		decal_settings = DefaultDecalSettings
	end

	local normal_rotation = Quaternion.look(-Vector3(-normal[2], normal[1], 0), normal)
	local impact_direction = Quaternion.forward(rotation)
	local impact_dir_proj_x = Vector3.dot(impact_direction, Quaternion.right(normal_rotation))
	local impact_dir_proj_y = Vector3.dot(impact_direction, Quaternion.forward(normal_rotation))
	local impact_dir_proj = Quaternion.right(normal_rotation) * impact_dir_proj_x + Quaternion.forward(normal_rotation) * impact_dir_proj_y
	local aligned_rotation = Quaternion.look(impact_dir_proj, normal)
	local unit = World.spawn_unit(world, decal_unit_name, position, aligned_rotation)

	if hit_actor and Actor.is_dynamic(hit_actor) then
		local node_index = Actor.node(hit_actor)

		World.link_unit(world, unit, 0, hit_unit, node_index)

		local hit_node_rot = Unit.world_rotation(hit_unit, node_index)
		local hit_node_pos = Unit.world_position(hit_unit, node_index)
		local rel_pos = position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(Quaternion.forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local aligned_rotation = Quaternion.multiply(Quaternion.inverse(hit_node_rot), aligned_rotation)

		Unit.set_local_position(unit, 0, offset_position)
		Unit.set_local_rotation(unit, 0, aligned_rotation)
		Unit.set_local_scale(unit, 0, extents)
		World.update_unit(self._world, unit)
	else
		Unit.set_local_scale(unit, 0, extents)
		World.update_unit(self._world, unit)
	end

	local current_time = Managers.time:time("game")
	local life_time = current_time + decal_settings.sustain + decal_settings.release

	Unit.set_data(unit, "life_time", life_time)

	local num_meshes = Unit.num_meshes(unit)

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(unit, i)
		local num_materials = Mesh.num_materials(mesh)

		for j = 0, num_materials - 1, 1 do
			local material = Mesh.material(mesh, j)

			Material.set_scalar(material, "start_time", current_time)
			Material.set_scalar(material, "life_time", decal_settings.sustain + decal_settings.release)
		end
	end

	if script_data.debug_material_effects then
		print(string.format("[DecalManager] Adding decal -> Effect Name: %q Unit: %q, Life Time: %q Current Time: %q", effect_name, decal_unit_name, life_time, current_time))
	end

	local decal_pool = self._decal_pools[material]

	if not decal_pool then
		Application.warning("[DecalManager] There is no decal pool for material: %q --> Using Default", material)

		decal_pool = self._decal_pools.default
	end

	while decal_settings.pool_size <= decal_pool:size() do
		local unit = decal_pool:pop_first()

		World.destroy_unit(world, unit)
	end

	decal_pool:push_back(unit)
end

DecalManager.update = function (self, dt, t)
	local world = self._world
	local unit_alive = Unit.alive
	local unit_get_data = Unit.get_data
	local decal_pools = self._decal_pools

	for material, unit_queue in pairs(decal_pools) do
		local first_unit = unit_queue:get_first()
		local life_time = (unit_alive(first_unit) and unit_get_data(first_unit, "life_time")) or math.huge

		if life_time < t then
			local unit = unit_queue:pop_first()

			if script_data.debug_material_effects then
				print(string.format("[DecalManager] Removing decal -> Effect Name: %q Unit: %q, Life Time: %q Current Time: %q", material, unit, unit_get_data(unit, "life_time"), t))
			end

			World.destroy_unit(world, unit)
		end
	end
end

DecalManager.destroy = function (self)
	return
end

return
