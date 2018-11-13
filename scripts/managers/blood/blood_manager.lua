require("scripts/managers/blood/blood_settings")

local blood_manager_reload = true
local blood_manager_max_decals = 100
BloodManager = class(BloodManager)
local BLOOD_BALL_RING_BUFFER_SIZE = 64
local NUM_BLOOD_BALLS_TO_SPAWN_PER_FRAME = 15

BloodManager.init = function (self, world)
	self._world = world
	self._weapon_blood = {}
	self._blood_effect_data = {}
	self._blood_active = true

	self:_create_blood_ball_buffer()

	blood_manager_reload = false
	local max_bloodballs_per_frame = 5
	self._blood_system = EngineOptimizedExtensions.blood_init_system(self._blood_system, self._world, "blood_ball", max_bloodballs_per_frame)
end

BloodManager.destroy = function (self)
	self:clear_weapon_blood()
	EngineOptimizedExtensions.blood_destroy_system(self._blood_system)
end

local debug_decals = false

BloodManager.update = function (self, dt, t)
	local blood_enabled = Application.user_setting("blood_enabled")
	BloodSettings.blood_decals.num_decals = Application.user_setting("num_blood_decals") or BloodSettings.blood_decals.num_decals

	if blood_enabled or blood_enabled == nil then
		if not self._blood_active then
			self:_enable_blood(true)
		end

		local t = World.time(self._world)

		self:_update_weapon_blood(dt, t)
		self:_update_blood_ball_buffer()
	elseif self._blood_active then
		self:clear_weapon_blood()
		self:clear_blood_decals()
		self:_enable_blood(false)
	end

	self:_update_blood_effects()
	EngineOptimizedExtensions.blood_update(self._blood_system)
end

BloodManager._enable_blood = function (self, enable)
	self._blood_active = enable
	BloodSettings.enemy_blood.enabled = enable
	BloodSettings.blood_decals.enabled = enable
	BloodSettings.weapon_blood.enabled = enable
	BloodSettings.screen_space.enabled = enable
end

BloodManager._update_weapon_blood = function (self, dt, t)
	for attacker_unit, blood_data in pairs(self._weapon_blood) do
		for weapon, amount in pairs(blood_data) do
			blood_data[weapon] = math.clamp(amount - BloodSettings.weapon_blood.dissolve_rate * dt, 0, BloodSettings.weapon_blood.max_value)

			self:_set_weapon_blood_intensity(attacker_unit, weapon, blood_data[weapon])
		end
	end
end

BloodManager.clear_blood_decals = function (self)
	Managers.state.decal:clear_all_of_type("blood_decals")
end

BloodManager.clear_unit_decals = function (self, unit)
	Unit.set_vector4_for_materials(unit, "hit_position", Color(0, 0, 0, 0))
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
end

BloodManager._set_weapon_blood_intensity = function (self, attacker_unit, weapon, amount)
	if Unit.alive(weapon) then
		Unit.set_scalar_for_materials(weapon, "blood_intensity", amount)
	else
		self._weapon_blood[attacker_unit][weapon] = nil
	end
end

BloodManager.clear_weapon_blood = function (self, attacker, weapon)
	if attacker and self._weapon_blood[attacker] then
		local blood_data = self._weapon_blood[attacker]

		if weapon and blood_data[weapon] then
			self:_set_weapon_blood_intensity(attacker, weapon, 0)

			self._weapon_blood[attacker][weapon] = nil
		elseif not weapon then
			for weapon, amount in pairs(blood_data) do
				self:_set_weapon_blood_intensity(attacker, weapon, 0)
			end

			self._weapon_blood[attacker] = nil
		end
	else
		for attacker, blood_data in pairs(self._weapon_blood) do
			for weapon, amount in pairs(blood_data) do
				self._weapon_blood[attacker][weapon] = nil

				self:_set_weapon_blood_intensity(attacker, weapon, 0)
			end
		end

		self._weapon_blood = {}
	end
end

BloodManager._update_blood_ball_buffer = function (self)
	local blood_ball_ring_buffer = self._blood_ball_ring_buffer
	local size = blood_ball_ring_buffer.size

	if size == 0 then
		return
	end

	local buffer = blood_ball_ring_buffer.buffer
	local read_index = blood_ball_ring_buffer.read_index
	local max_size = blood_ball_ring_buffer.max_size
	local num_updates = math.min(NUM_BLOOD_BALLS_TO_SPAWN_PER_FRAME, size)

	for i = 1, num_updates, 1 do
		local blood_ball_data = buffer[read_index]

		self:_spawn_blood_ball(blood_ball_data)

		read_index = read_index % max_size + 1
		size = size - 1
	end

	blood_ball_ring_buffer.size = size
	blood_ball_ring_buffer.read_index = read_index
end

BloodManager._create_blood_ball_buffer = function (self)
	local buffer_size = BLOOD_BALL_RING_BUFFER_SIZE
	self._blood_ball_ring_buffer = {
		write_index = 1,
		read_index = 1,
		size = 0,
		buffer = Script.new_array(buffer_size),
		max_size = buffer_size
	}

	for index = 1, buffer_size, 1 do
		self._blood_ball_ring_buffer.buffer[index] = {
			velocity = 0,
			position = Vector3Box(),
			direction = Vector3Box()
		}
	end
end

BloodManager._spawn_blood_ball = function (self, blood_ball_data)
	local position = blood_ball_data.position:unbox()
	local direction = blood_ball_data.direction:unbox()
	local rotation = Quaternion.look(direction, Vector3.up())
	local velocity = blood_ball_data.velocity

	EngineOptimizedExtensions.blood_spawn_blood_ball(self._blood_system, "units/decals/blood_ball", position, rotation, direction, velocity)
end

BloodManager.despawn_blood_ball = function (self, unit)
	EngineOptimizedExtensions.blood_despawn_blood_ball(self._blood_system, unit)
end

BloodManager._add_blood_ball_data_to_buffer = function (self, position, direction, damage_type)
	local blood_ball_ring_buffer = self._blood_ball_ring_buffer
	local buffer = blood_ball_ring_buffer.buffer
	local read_index = blood_ball_ring_buffer.read_index
	local write_index = blood_ball_ring_buffer.write_index
	local size = blood_ball_ring_buffer.size
	local max_size = blood_ball_ring_buffer.max_size

	if max_size < size + 1 then
		local blood_ball_data = buffer[read_index]

		self:_spawn_blood_ball(blood_ball_data)

		blood_ball_ring_buffer.size = size - 1
		blood_ball_ring_buffer.read_index = read_index % max_size + 1
	end

	local velocity = BloodSettings.blood_ball.damage_type_velocities[damage_type]
	local default_velocity = BloodSettings.blood_ball.damage_type_velocities.default
	local blood_ball_data = buffer[write_index]

	blood_ball_data.position:store(position)
	blood_ball_data.direction:store(direction)

	blood_ball_data.velocity = velocity or default_velocity
	blood_ball_ring_buffer.size = size + 1
	blood_ball_ring_buffer.write_index = write_index % max_size + 1
end

BloodManager.add_blood_ball = function (self, position, direction, damage_type, hit_unit)
	if BloodSettings.blood_decals.enabled then
		if BloodSettings.blood_decals.num_decals > 0 and Vector3.is_valid(position) then
			self:_add_blood_ball_data_to_buffer(position, direction, damage_type)
		end

		local health_ext = ScriptUnit.extension(hit_unit, "health_system")
		local breed = Unit.get_data(hit_unit, "breed")

		if breed.blood_effect_name then
			self:_spawn_effects(hit_unit, breed, health_ext)
		end

		if breed.blood_intensity then
			self:_update_blood_intensity(hit_unit, breed, health_ext)
		end
	end
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
	local blood_effect_data = self:_get_blood_effect_data(hit_unit, blood_nodes)

	if blood_effect_data.done then
		return
	end

	local inverse_health_percentage = 1 - health_ext:current_health_percent()
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
end

BloodManager._update_blood_intensity = function (self, hit_unit, breed, health_ext)
	local blood_intensity_data = breed.blood_intensity
	local num_meshes = Unit.num_meshes(hit_unit)
	local inverse_health_percentage = 1 - health_ext:current_health_percent()

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(hit_unit, i)

		for material_name, intensity_variable in pairs(blood_intensity_data) do
			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_scalar(material, intensity_variable, inverse_health_percentage)
			end
		end
	end
end

BloodManager.add_weapon_blood = function (self, attacker, damage_type)
	if BloodSettings.weapon_blood.enabled then
		local player = self:_is_player(attacker)

		if player and self:_is_melee_weapon(attacker) then
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
end

BloodManager.add_enemy_blood = function (self, position, normal, actor)
	if BloodSettings.enemy_blood.enabled then
		local unit = Actor.unit(actor)
		local damage_ext = ScriptUnit.has_extension(unit, "health_system") and ScriptUnit.extension(unit, "health_system")

		if damage_ext and damage_ext:is_alive() then
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

			Unit.set_vector4_for_materials(unit, "hit_position", t_position)
			Unit.set_vector4_for_materials(unit, "hit_normal", t_normal)
			Unit.set_vector4_for_materials(unit, "hit_tangent", t_tangent)
		end
	end
end

BloodManager.play_screen_space_blood = function (self, particle_name, position, optional_offset, option_rotation_offset, optional_scale)
	if BloodSettings.screen_space.enabled then
		World.create_particles(self._world, particle_name, position, optional_offset, option_rotation_offset, optional_scale)
	end
end

BloodManager._is_melee_weapon = function (self, attacker, weapon)
	local inventory_extension = ScriptUnit.has_extension(attacker, "inventory_system")

	if not inventory_extension then
		return false
	end

	local equipment = inventory_extension:equipment()
	local slot_type = equipment.wielded.slot_type

	return slot_type == "melee"
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

return
