require("scripts/managers/blood/blood_settings")

BloodManager = class(BloodManager)
BloodManager.init = function (self, world)
	self._world = world
	self._weapon_blood = {}
	self._blood_units = {}
	self._blood_fades = {}
	self._blood_effect_data = {}
	self._blood_active = true

	return 
end
local debug_decals = false
BloodManager.update = function (self, dt, t)
	Profiler.start("Blood Manager Update")

	local blood_enabled = Application.user_setting("blood_enabled")
	BloodSettings.blood_decals.num_decals = Application.user_setting("num_blood_decals") or BloodSettings.blood_decals.num_decals

	if blood_enabled or blood_enabled == nil then
		if not self._blood_active then
			self._enable_blood(self, true)
		end

		local t = World.time(self._world)

		self._update_weapon_blood(self, dt, t)
		self._update_blood_decals(self, dt, t)
		self._handle_delayed_fade_units(self, dt, t)
		self._update_distance_fade(self, dt, t)

		if debug_decals then
			self._update_debug(self, dt, t)
		end
	elseif self._blood_active then
		self.clear_weapon_blood(self)
		self.clear_blood_decals(self)
		self._enable_blood(self, false)
	end

	self._update_blood_effects(self)
	Profiler.stop("Blood Manager Update")

	return 
end
BloodManager._enable_blood = function (self, enable)
	self._blood_active = enable
	BloodSettings.enemy_blood.enabled = enable
	BloodSettings.blood_decals.enabled = enable
	BloodSettings.weapon_blood.enabled = enable

	return 
end
BloodManager._update_weapon_blood = function (self, dt, t)
	Profiler.start("_update_weapon_blood")

	for attacker_unit, blood_data in pairs(self._weapon_blood) do
		for weapon, amount in pairs(blood_data) do
			blood_data[weapon] = math.clamp(amount - BloodSettings.weapon_blood.dissolve_rate * dt, 0, BloodSettings.weapon_blood.max_value)

			self._set_weapon_blood_intensity(self, attacker_unit, weapon, blood_data[weapon])
		end
	end

	Profiler.stop("_update_weapon_blood")

	return 
end
BloodManager._update_blood_decals = function (self, dt, t)
	Profiler.start("_update_blood_decals")

	local to_remove = nil

	for unit, time in pairs(self._blood_fades) do
		if time <= t then
			self._remove_blood_decal(self, unit)

			to_remove = to_remove or {}
			to_remove[#to_remove + 1] = unit
		end
	end

	if to_remove then
		for _, unit in pairs(to_remove) do
			self._blood_fades[unit] = nil

			if Unit.alive(unit) then
				World.destroy_unit(self._world, unit)
			end
		end
	end

	Profiler.stop("_update_blood_decals")

	return 
end
BloodManager._remove_blood_decal = function (self, unit)
	for idx, blood_unit in pairs(self._blood_units) do
		if blood_unit == unit then
			table.remove(self._blood_units, idx)

			return 
		end
	end

	return 
end
BloodManager._handle_delayed_fade_units = function (self, dt, t)
	Profiler.start("_handle_delayed_fade_units")

	if self._delayed_fade_units then
		for _, unit in pairs(self._delayed_fade_units) do
			if Unit.alive(unit) then
				self._add_to_fade_list(self, unit, t)
			end
		end
	end

	self._delayed_fade_units = nil

	Profiler.stop("_handle_delayed_fade_units")

	return 
end
BloodManager._update_distance_fade = function (self, dt, t)
	Profiler.start("_handle_delayed_fade_units")

	local local_player = Managers.player:local_player()

	if local_player then
		local viewport_name = local_player.viewport_name
		local viewport = ScriptWorld.viewport(self._world, viewport_name)
		local camera = ScriptViewport.camera(viewport)
		local camera_pos = Camera.world_position(camera)

		for unit, time in pairs(self._blood_fades) do
			if Unit.alive(unit) then
				local pos = Unit.local_position(unit, 0)
				local distance_sq = Vector3.distance_squared(pos, camera_pos)

				if t + 2 < time and BloodSettings.blood_decals.distance_despawn * BloodSettings.blood_decals.distance_despawn <= distance_sq then
					self._set_fade_values(self, unit, t, 2)

					self._blood_fades[unit] = t + 2
				end
			else
				self._blood_fades[unit] = t
			end
		end
	end

	Profiler.stop("_handle_delayed_fade_units")

	return 
end
BloodManager._update_blood_effects = function (self)
	for unit, data in pairs(self._blood_effect_data) do
		if not AiUtils.unit_alive(unit) and not data.done then
			for idx, effect_data in ipairs(data) do
				if effect_data.effect_id then
					World.destroy_particles(self._world, effect_data.effect_id)
				end
			end

			self._blood_effect_data[unit].done = true
		end
	end

	return 
end
BloodManager._update_debug = function (self, dt, t)
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "blood"
	})

	for _, unit in pairs(self._blood_units) do
		local position = Unit.local_position(unit, 0)
		local vector = Quaternion.up(Unit.local_rotation(unit, 0))

		drawer.vector(drawer, position, vector, Color(0, 255, 0))
	end

	local active_controller = Managers.account:active_controller()

	if Keyboard.pressed(Keyboard.button_index("b")) or active_controller.pressed(active_controller.button_index("left_thumb")) then
		self._world = self._world or Application.main_world()
		local player = Managers.player:local_player()
		local player_pos = Unit.local_position(player.player_unit, 0)
		local blood_unit = "units/decals/projection_blood_" .. string.format("%02d", tostring(Math.random(1, 17)))
		self._blood_units = self._blood_units or {}

		if BloodSettings.blood_decals.num_decals < #self._blood_units then
			if Unit.alive(self._blood_units[1]) then
				World.destroy_unit(self._world, self._blood_units[1])
			end

			table.remove(self._blood_units, 1)
		end

		self._blood_units[#self._blood_units + 1] = World.spawn_unit(self._world, blood_unit, player_pos, Quaternion.identity())

		Unit.set_local_scale(self._blood_units[#self._blood_units], 0, Vector3(BloodSettings.blood_decals.scale, BloodSettings.blood_decals.scale, 1))
		self._add_to_fade_list(self, self._blood_units[#self._blood_units], t)
	end

	return 
end
BloodManager._add_to_fade_list = function (self, unit, t)
	self._set_fade_values(self, unit, t, BloodSettings.blood_decals.life_time)

	self._blood_fades[unit] = t + BloodSettings.blood_decals.life_time

	return 
end
BloodManager._set_fade_values = function (self, unit, start_time, life_time)
	local num_meshes = Unit.num_meshes(unit)

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(unit, i)
		local num_materials = Mesh.num_materials(mesh)

		for j = 0, num_materials - 1, 1 do
			local material = Mesh.material(mesh, j)

			Material.set_scalar(material, "start_time", start_time)
			Material.set_scalar(material, "life_time", life_time)
		end
	end

	return 
end
BloodManager._set_weapon_blood_intensity = function (self, attacker_unit, weapon, amount)
	if Unit.alive(weapon) then
		local num_meshes = Unit.num_meshes(weapon)

		for i = 0, num_meshes - 1, 1 do
			local mesh = Unit.mesh(weapon, i)
			local num_materials = Mesh.num_materials(mesh)

			for j = 0, num_materials - 1, 1 do
				local material = Mesh.material(mesh, j)

				Material.set_scalar(material, "blood_intensity", amount)
			end
		end
	else
		self._weapon_blood[attacker_unit][weapon] = nil
	end

	return 
end
BloodManager.clear_weapon_blood = function (self, attacker, weapon)
	if attacker and self._weapon_blood[attacker] then
		local blood_data = self._weapon_blood[attacker]

		if weapon and blood_data[weapon] then
			self._set_weapon_blood_intensity(self, attacker, weapon, 0)

			self._weapon_blood[attacker][weapon] = nil
		elseif not weapon then
			for weapon, amount in pairs(blood_data) do
				self._set_weapon_blood_intensity(self, attacker, weapon, 0)
			end

			self._weapon_blood[attacker] = nil
		end
	else
		for attacker, blood_data in pairs(self._weapon_blood) do
			for weapon, amount in pairs(blood_data) do
				self._weapon_blood[attacker][weapon] = nil

				self._set_weapon_blood_intensity(self, attacker, weapon, 0)
			end
		end

		self._weapon_blood = {}
	end

	return 
end
BloodManager.clear_blood_decals = function (self)
	for _, unit in pairs(self._blood_units) do
		if Unit.alive(unit) then
			World.destroy_unit(self._world, unit)
		end
	end

	self._blood_units = {}

	return 
end
BloodManager.spawn_blood_ball = function (self, position, direction, damage_type, hit_unit)
	if BloodSettings.blood_decals.enabled then
		if 0 < BloodSettings.blood_decals.num_decals then
			local rotation = Quaternion.look(direction, Vector3.up())
			local unit = World.spawn_unit(self._world, "units/decals/blood_ball", position, rotation)
			local actor = Unit.actor(unit, "blood_ball")
			local default_velocity = BloodSettings.blood_ball.damage_type_velocities.default
			local velocity = BloodSettings.blood_ball.damage_type_velocities[damage_type]
			local real_velocity = velocity or default_velocity

			Actor.add_velocity(actor, Vector3.normalize(direction) * real_velocity)
		end

		local health_ext = ScriptUnit.extension(hit_unit, "health_system")
		local breed = Unit.get_data(hit_unit, "breed")

		if breed.blood_effect_name then
			self._spawn_effects(self, hit_unit, breed, health_ext)
		end

		if breed.blood_intensity then
			self._update_blood_intensity(self, hit_unit, breed, health_ext)
		end
	end

	return 
end
BloodManager._get_blood_effect_data = function (self, unit, effect_nodes)
	if not self._blood_effect_data[unit] then
		self._blood_effect_data[unit] = table.clone(effect_nodes)
	end

	return self._blood_effect_data[unit]
end
BloodManager._spawn_effects = function (self, hit_unit, breed, health_ext)
	local effect_name = breed.blood_effect_name
	local blood_nodes = breed.blood_effect_nodes
	local blood_effect_data = self._get_blood_effect_data(self, hit_unit, blood_nodes)

	if blood_effect_data.done then
		return 
	end

	local inverse_health_percentage = 1 - health_ext.current_health_percent(health_ext)
	local step = 1 / (#blood_effect_data + 1)
	local current_threshold = step

	for idx, data in ipairs(blood_effect_data) do
		if current_threshold < inverse_health_percentage then
			if not data.triggered then
				local effect_id = World.create_particles(self._world, effect_name, Vector3(0, 0, 0))
				blood_effect_data[idx].effect_id = effect_id
				local node_index = Unit.node(hit_unit, data.node)
				local pose = Matrix4x4.from_quaternion(Unit.local_rotation(hit_unit, node_index))

				World.link_particles(self._world, effect_id, hit_unit, node_index, pose, "destroy")

				blood_effect_data[idx].triggered = true
			end
		else
			break
		end

		current_threshold = current_threshold + step
	end

	return 
end
BloodManager._update_blood_intensity = function (self, hit_unit, breed, health_ext)
	local blood_intensity_data = breed.blood_intensity
	local num_meshes = Unit.num_meshes(hit_unit)
	local inverse_health_percentage = 1 - health_ext.current_health_percent(health_ext)

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(hit_unit, i)

		for material_name, intensity_variable in pairs(blood_intensity_data) do
			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_scalar(material, intensity_variable, inverse_health_percentage)
			end
		end
	end

	return 
end
BloodManager.add_blood_decal = function (self, touched_unit, actor, my_unit, position, normal, velocity)
	local dot_value = Vector3.dot(normal, Vector3.normalize(velocity))
	local tangent = Vector3.normalize(Vector3.normalize(velocity) - dot_value * normal)
	local tangent_rotation = Quaternion.look(tangent, normal)
	local blood_unit_name = "units/decals/projection_blood_" .. string.format("%02d", tostring(Math.random(1, 17)))
	self._blood_units = self._blood_units or {}

	if BloodSettings.blood_decals.num_decals <= #self._blood_units then
		if Unit.alive(self._blood_units[1]) then
			World.destroy_unit(self._world, self._blood_units[1])
		end

		table.remove(self._blood_units, 1)
	end

	self._blood_units[#self._blood_units + 1] = World.spawn_unit(self._world, blood_unit_name, position, tangent_rotation)

	Unit.set_local_scale(self._blood_units[#self._blood_units], 0, Vector3(BloodSettings.blood_decals.scale, BloodSettings.blood_decals.scale, 1))

	self._delayed_fade_units = self._delayed_fade_units or {}
	self._delayed_fade_units[#self._delayed_fade_units + 1] = self._blood_units[#self._blood_units]

	if Unit.alive(my_unit) then
		World.destroy_unit(self._world, my_unit)
	end

	return 
end
BloodManager.add_weapon_blood = function (self, attacker, damage_type)
	if BloodSettings.weapon_blood.enabled then
		local player = self._is_player(self, attacker)

		if player and self._is_melee_weapon(self, attacker) then
			local equipment = ScriptUnit.extension(attacker, "inventory_system"):equipment()
			local weapon_right = equipment.right_hand_wielded_unit
			local weapon_right_3p = equipment.right_hand_wielded_unit_3p
			local weapon_left = equipment.left_hand_wielded_unit
			local weapon_left_3p = equipment.left_hand_wielded_unit_3p
			local amount = BloodSettings.weapon_blood[damage_type] or BloodSettings.weapon_blood.default
			self._weapon_blood[attacker] = self._weapon_blood[attacker] or {}

			if weapon_right then
				self._weapon_blood[attacker][weapon_right] = math.max((self._weapon_blood[attacker][weapon_right] or 0) + amount, BloodSettings.weapon_blood.starting_value)
			end

			if weapon_right_3p then
				self._weapon_blood[attacker][weapon_right_3p] = math.max((self._weapon_blood[attacker][weapon_right_3p] or 0) + amount, BloodSettings.weapon_blood.starting_value)
			end

			if weapon_left then
				self._weapon_blood[attacker][weapon_left] = math.max((self._weapon_blood[attacker][weapon_left] or 0) + amount, BloodSettings.weapon_blood.starting_value)
			end

			if weapon_left_3p then
				self._weapon_blood[attacker][weapon_left_3p] = math.max((self._weapon_blood[attacker][weapon_right_3p] or 0) + amount, BloodSettings.weapon_blood.starting_value)
			end
		end
	end

	return 
end
BloodManager.add_enemy_blood = function (self, position, normal, actor)
	if BloodSettings.enemy_blood.enabled then
		local unit = Actor.unit(actor)
		local damage_ext = ScriptUnit.has_extension(unit, "health_system") and ScriptUnit.extension(unit, "health_system")

		if damage_ext and damage_ext.is_alive(damage_ext) then
			local enemy_base_pos = Unit.local_position(unit, 0)
			local _, extents = Unit.box(unit)
			local height = extents[3] * 0.5
			local distance = math.max(extents[1], extents[2]) * 0.5
			local enemy_pos = enemy_base_pos + Vector3(0, 0, height)
			local real_position = enemy_pos + Vector3.normalize(position - enemy_pos) * distance
			local pose = Unit.local_pose(unit, 0)
			local inv_world = Matrix4x4.inverse(pose)
			local normal = Vector3.normalize(position - enemy_pos)
			local tangent = Vector3.cross(normal, Vector3.up())
			local t_position = Matrix4x4.transform(inv_world, real_position)
			local t_normal = Vector3.normalize(Matrix4x4.transform_without_translation(inv_world, normal))
			local t_tangent = Vector3.normalize(Matrix4x4.transform_without_translation(inv_world, tangent))
			t_position = Color(t_position[1], t_position[2], t_position[3], 1)
			t_normal = Color(t_normal[1], t_normal[2], t_normal[3], 0)
			t_tangent = Color(t_tangent[1], t_tangent[2], t_tangent[3], 0)
			local num_meshes = Unit.num_meshes(unit)

			for i = 0, num_meshes - 1, 1 do
				local mesh = Unit.mesh(unit, i)
				local num_materials = Mesh.num_materials(mesh)

				for j = 0, num_materials - 1, 1 do
					local material = Mesh.material(mesh, j)

					Material.set_vector4(material, "hit_position", t_position)
					Material.set_vector4(material, "hit_normal", t_normal)
					Material.set_vector4(material, "hit_tangent", t_tangent)
				end
			end
		end
	end

	return 
end
BloodManager.test_enemy_blood = function (self, position)
	return 

	local unit = World.units(Application.main_world())[716]

	if Unit.alive(unit) then
		local time = Application.time_since_launch() * 0.25

		Unit.set_local_rotation(unit, 0, Quaternion.look(Vector3(0, 1, 0), Vector3.up()))

		local normal = Vector3.normalize(Vector3(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
		local pos = position or Vector3(math.sin(time) * 100, -math.cos(time) * 100, 75)
		local enemy_dir = Quaternion.forward(Unit.local_rotation(unit, 0))
		local actor = Unit.actor(unit, 0)

		if not actor then
			return 
		end

		self.add_enemy_blood(self, pos, normal, actor)
	end

	return 
end
BloodManager._is_melee_weapon = function (self, attacker, weapon)
	local wielded_slot = ScriptUnit.extension(attacker, "inventory_system"):equipment().wielded_slot

	if wielded_slot == "slot_melee" then
		return true
	end

	return 
end
BloodManager._is_player = function (self, attacker)
	local players = Managers.player:players()

	for _, player in pairs(players) do
		if player.player_unit == attacker then
			return player
		end
	end

	return false
end
BloodManager.destroy = function (self)
	self.clear_weapon_blood(self)

	return 
end

return 
