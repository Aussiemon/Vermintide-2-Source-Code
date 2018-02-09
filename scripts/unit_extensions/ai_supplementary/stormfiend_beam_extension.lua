StormfiendBeamExtension = class(StormfiendBeamExtension)
local position_lookup = POSITION_LOOKUP
StormfiendBeamExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.state = "no_state"
	local particle_name = "fx/chr_warp_fire_flamethrower_01"
	self.particle_name = particle_name
	self.vfx_list = {}
	self.beam_forward_offset = 8
	self.beam_up_offset = 8

	return 
end
StormfiendBeamExtension.destroy = function (self)
	self.remove_vfx_and_sfx(self)

	return 
end
StormfiendBeamExtension.remove_vfx_and_sfx = function (self)
	local world = self.world
	local vfx_list = self.vfx_list

	for i = 1, #vfx_list, 1 do
		local particle_id = vfx_list[i]

		World.stop_spawning_particles(world, particle_id)

		vfx_list[i] = nil
	end

	if self.warpfire_particle_id then
		self.warpfire_particle_id = nil
	end

	self.muzzle_node = nil

	return 
end
StormfiendBeamExtension.anim_cb_start_stormfiend_beam = function (self, arm)
	if arm == "right" then
		self.create_beam(self, "fx_right_muzzle")
	elseif arm == "left" then
		self.create_beam(self, "fx_left_muzzle")
	end

	return 
end
StormfiendBeamExtension.anim_cb_stop_stormfiend_beam = function (self)
	self.remove_vfx_and_sfx(self)

	return 
end
StormfiendBeamExtension.create_beam = function (self, node_name)
	local unit = self.unit

	if Unit.alive(unit) then
		local muzzle_node = Unit.node(unit, node_name)
		self.muzzle_node = muzzle_node
		local world = self.world
		local particle_id = World.create_particles(world, self.particle_name, Vector3.zero(), Quaternion.identity())
		local muzzle_rotation = Unit.local_rotation(unit, muzzle_node)
		local offset_rotation = nil

		if node_name == "fx_right_muzzle" then
			offset_rotation = Quaternion.look(Vector3.right())
		else
			offset_rotation = Quaternion.look(Vector3.right() + Vector3.up()*0.2)
		end

		local pose = Matrix4x4.from_quaternion(Quaternion.multiply(muzzle_rotation, offset_rotation))

		World.link_particles(world, particle_id, unit, muzzle_node, pose, "stop")

		self.warpfire_particle_id = particle_id
		self.particle_life_time = Vector3Box(1, 0, 0)
		self.vfx_list[#self.vfx_list + 1] = particle_id
	end

	return 
end
StormfiendBeamExtension.get_target_position = function (self, unit)
	local game = Managers.state.network:game()
	local unit_storage = Managers.state.unit_storage
	local go_id = unit_storage.go_id(unit_storage, unit)
	local target_position = GameSession.game_object_field(game, go_id, "aim_target")

	if target_position then
		local unit_position = Unit.world_position(unit, self.muzzle_node)
		target_position[3] = unit_position[3]
		local forward_offset = Vector3.normalize(target_position - unit_position)
		target_position = target_position + forward_offset*self.beam_forward_offset

		return target_position + Vector3.up()*self.beam_up_offset
	end

	return false
end
StormfiendBeamExtension.update = function (self, unit, input, dt, context, t)
	local world = self.world

	if Unit.alive(unit) and self.muzzle_node then
		local target_unit_pos = self.get_target_position(self, unit)

		if target_unit_pos then
			local muzzle_node = self.muzzle_node
			local muzzle_pos = Unit.world_position(unit, muzzle_node)
			local muzzle_to_target = target_unit_pos - muzzle_pos
			local length = Vector3.length(muzzle_to_target)
			local firepoint_1_pos = Vector3(muzzle_pos.x, muzzle_pos.y, muzzle_pos.z + 0.1)
			local dir_norm = Vector3.normalize(muzzle_to_target)
			local effect_variable_id = World.find_particles_variable(world, self.particle_name, "firepoint_1")

			World.set_particles_variable(world, self.warpfire_particle_id, effect_variable_id, firepoint_1_pos + dir_norm*0.1)

			effect_variable_id = World.find_particles_variable(world, self.particle_name, "firepoint_2")

			World.set_particles_variable(world, self.warpfire_particle_id, effect_variable_id, target_unit_pos)

			effect_variable_id = World.find_particles_variable(world, self.particle_name, "firelife_1")
			local lifetime = length/4
			local particle_life_time_vector = self.particle_life_time:unbox()
			particle_life_time_vector.x = lifetime

			World.set_particles_variable(world, self.warpfire_particle_id, effect_variable_id, particle_life_time_vector)
		end
	end

	return 
end

return 
