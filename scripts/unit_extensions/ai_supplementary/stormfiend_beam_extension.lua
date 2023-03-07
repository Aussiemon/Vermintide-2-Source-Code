StormfiendBeamExtension = class(StormfiendBeamExtension)
local position_lookup = POSITION_LOOKUP
local arm_to_nodename = {
	attack_right = "fx_right_muzzle",
	attack_left = "fx_left_muzzle"
}
arm_to_nodename = table.mirror_array_inplace(arm_to_nodename)

StormfiendBeamExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.state = "no_state"
	local particle_name = "fx/chr_warp_fire_flamethrower_01"
	self.particle_name = particle_name
	self.beam_forward_offset = 8
	self.beam_up_offset = 8
	self.muzzle_nodes = {}
	self.particle_ids = {}
end

StormfiendBeamExtension.destroy = function (self)
	for _, node_name in pairs(arm_to_nodename) do
		self:_remove_beam(node_name)
	end
end

StormfiendBeamExtension._remove_beam = function (self, node_name)
	local world = self.world

	if self.particle_ids[node_name] then
		World.stop_spawning_particles(world, self.particle_ids[node_name])

		self.particle_ids[node_name] = nil
		self.muzzle_nodes[node_name] = nil
	end
end

StormfiendBeamExtension.set_beam = function (self, arm, active)
	local node_name = arm_to_nodename[arm]

	if not active and self.particle_ids[node_name] then
		self:_remove_beam(node_name)
	elseif active and not self.particle_ids[node_name] then
		self:_create_beam(node_name)
	end
end

StormfiendBeamExtension._create_beam = function (self, node_name)
	local unit = self.unit

	if ALIVE[unit] then
		local muzzle_node = Unit.node(unit, node_name)
		self.muzzle_nodes[node_name] = muzzle_node
		local world = self.world
		local particle_id = World.create_particles(world, self.particle_name, Vector3.zero(), Quaternion.identity())
		local muzzle_rotation = Unit.local_rotation(unit, muzzle_node)
		local offset_rotation = Quaternion.look(Vector3.right() + Vector3.up() * 0.2 * (node_name == "fx_left_muzzle" and 1 or 0))
		local pose = Matrix4x4.from_quaternion(Quaternion.multiply(muzzle_rotation, offset_rotation))

		World.link_particles(world, particle_id, unit, muzzle_node, pose, "stop")

		self.particle_life_time = Vector3Box(1, 0, 0)
		self.particle_ids[node_name] = particle_id
	end
end

StormfiendBeamExtension.get_target_position = function (self, unit, muzzle_node)
	local game = Managers.state.network:game()
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage:go_id(unit)
	local target_position = GameSession.game_object_field(game, go_id, "aim_target")

	if target_position then
		local unit_position = Unit.world_position(unit, muzzle_node)
		target_position[3] = unit_position[3]
		local forward_offset = Vector3.normalize(target_position - unit_position)
		target_position = target_position + forward_offset * self.beam_forward_offset

		return target_position + Vector3.up() * self.beam_up_offset
	end

	return false
end

StormfiendBeamExtension.update = function (self, unit, input, dt, context, t)
	local world = self.world

	if not ALIVE[unit] then
		return
	end

	for node_name, muzzle_node in pairs(self.muzzle_nodes) do
		local target_unit_pos = self:get_target_position(unit, muzzle_node)

		if target_unit_pos then
			local muzzle_pos = Unit.world_position(unit, muzzle_node)
			local muzzle_to_target = target_unit_pos - muzzle_pos
			local length = Vector3.length(muzzle_to_target)
			local firepoint_1_pos = Vector3(muzzle_pos.x, muzzle_pos.y, muzzle_pos.z + 0.1)
			local dir_norm = Vector3.normalize(muzzle_to_target)
			local particle_id = self.particle_ids[node_name]

			if particle_id then
				local effect_variable_id = World.find_particles_variable(world, self.particle_name, "firepoint_1")

				World.set_particles_variable(world, particle_id, effect_variable_id, firepoint_1_pos + dir_norm * 0.1)

				effect_variable_id = World.find_particles_variable(world, self.particle_name, "firepoint_2")

				World.set_particles_variable(world, particle_id, effect_variable_id, target_unit_pos)

				effect_variable_id = World.find_particles_variable(world, self.particle_name, "firelife_1")
				local lifetime = length / 4
				local particle_life_time_vector = self.particle_life_time:unbox()
				particle_life_time_vector.x = lifetime

				World.set_particles_variable(world, particle_id, effect_variable_id, particle_life_time_vector)
			end
		end
	end
end
