AIMeleeLineOfSightSystem = class(AIMeleeLineOfSightSystem)
local extensions = {
	"AIMeleeLineOfSightExtension"
}
AIMeleeLineOfSightExtension = class(AIMeleeLineOfSightExtension)

AIMeleeLineOfSightExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
end

AIMeleeLineOfSightExtension.destroy = function (self)
	return
end

AIMeleeLineOfSightSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self._is_server = context.is_server
	self._world = context.world
	self._physics_world = World.physics_world(self._world)
	self._extensions = {}
	self._frozen_extensions = {}
	self._update_queue = {}
	self._update_queue_index = 0
	self._update_queue_length = 0
end

AIMeleeLineOfSightSystem.destroy = function (self)
	return
end

AIMeleeLineOfSightSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local index = self._update_queue_length + 1

	ScriptUnit.add_extension(nil, unit, extension_name, self.NAME)

	local extension = ScriptUnit.extension(unit, self.NAME)
	extension.index = index
	self._update_queue[index] = extension
	self._extensions[unit] = extension
	self._update_queue_length = index

	return extension
end

AIMeleeLineOfSightSystem.on_remove_extension = function (self, unit, extension_name)
	self._frozen_extensions[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

AIMeleeLineOfSightSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self._extensions[unit]

	fassert(extension, "Unit was already frozen.")

	if extension == nil then
		return
	end

	self._frozen_extensions[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

AIMeleeLineOfSightSystem._cleanup_extension = function (self, unit, extension_name)
	local extensions = self._extensions

	if extensions[unit] == nil then
		return
	end

	local queue = self._update_queue
	local last_index = self._update_queue_length
	local last_item = queue[last_index]
	local remove_index = extensions[unit].index
	queue[remove_index] = last_item
	queue[last_index] = nil
	last_item.index = remove_index
	extensions[unit] = nil
	self._update_queue_length = self._update_queue_length - 1
end

AIMeleeLineOfSightSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self._frozen_extensions

	if self._frozen_extensions[unit] then
		return
	end

	local extension = self._extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self._extensions[unit] = nil
	frozen_extensions[unit] = extension
end

AIMeleeLineOfSightSystem.unfreeze = function (self, unit)
	local extension = self._frozen_extensions[unit]
	self._frozen_extensions[unit] = nil
	local index = self._update_queue_length + 1
	extension.index = index
	self._update_queue[index] = extension
	self._extensions[unit] = extension
	self._update_queue_length = index
end

AIMeleeLineOfSightSystem.hot_join_sync = function (self, sender, player)
	return
end

AIMeleeLineOfSightSystem.extensions_ready = function (self, world, unit, extension_name)
	local bb = BLACKBOARDS[unit]
	self._extensions[unit].blackboard = bb
	bb.has_line_of_sight = true
end

AIMeleeLineOfSightSystem.target_changed = function (self, unit)
	self._extensions[unit].blackboard.has_line_of_sight = true
end

local OFFSETS = {}

AIMeleeLineOfSightSystem.update = function (self, context, t)
	local max_index = self._update_queue_length

	if not self._is_server or max_index == 0 then
		return
	end

	local is_win32 = PLATFORM == Application.WIN32
	local MAX_RAYCASTS = (is_win32 and 10) or 2
	local MAX_DIST_SQUARED = 36
	local BENEATH_ABOVE_EPSILON = 0.1
	local RAY_DISTANCE_EPSILON = 0.1
	local raycasts = 0
	local index = self._update_queue_index % max_index + 1
	local queue = self._update_queue
	local offsets = OFFSETS
	local num_offsets = 3
	offsets[1] = Vector3(0, 0, 1.5)
	offsets[2] = Vector3(0.5, 0, 1.5)
	offsets[3] = Vector3(-0.5, 0, 1.5)
	local ray_from_offset = Vector3(0, 0, 1.5)
	local physics_world = self._physics_world
	local up = Vector3.up()
	local unit_alive = Unit.alive
	local is_character = DamageUtils.is_character
	local debug = script_data.debug_ai_melee_line_of_sight

	while index <= max_index and raycasts < MAX_RAYCASTS do
		local ext = queue[index]
		local bb = ext.blackboard
		local target = bb.attacking_target or bb.target_unit

		if unit_alive(target) and is_character(target) then
			local unit = ext.unit
			local self_pos = POSITION_LOOKUP[unit]
			local target_pos = POSITION_LOOKUP[target]
			local success = true

			if target_pos then
				local dist_sq = Vector3.distance_squared(self_pos, target_pos)

				if dist_sq < MAX_DIST_SQUARED then
					local target_offset = target_pos - self_pos
					success = false

					if debug then
						QuickDrawer:vector(self_pos, target_offset, Color(0, 255, 0))
					end

					if math.abs(target_offset.x) < BENEATH_ABOVE_EPSILON and math.abs(target_offset.y) < BENEATH_ABOVE_EPSILON then
						raycasts = raycasts + 1
						local z_offset_target = offsets[1].z
						local from = self_pos + ray_from_offset
						local to_offset = target_offset + Vector3(0, 0, z_offset_target - ray_from_offset.z)
						local dist = math.max(Vector3.length(to_offset), 0.0001)
						local dir = to_offset / dist

						if RAY_DISTANCE_EPSILON < dist then
							local hit, hit_pos, hit_dist, hit_normal, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

							if debug then
								QuickDrawer:line(from, from + dist * dir, Color(0, 255, 255))
							end

							if not hit or Actor.unit(hit_actor) == target then
								success = true
							end
						else
							if debug then
								QuickDrawer:line(from, from + 0.1 * dir, Color(255, 255, 255))
							end

							success = true
						end
					else
						local right_vector = Vector3.normalize(Vector3.cross(target_offset, up))

						if debug then
							QuickDrawer:vector(self_pos, right_vector, Color(255, 0, 0))
						end

						for i = 1, num_offsets, 1 do
							raycasts = raycasts + 1
							local offset = offsets[i]
							local from = self_pos + ray_from_offset
							local to_offset = target_offset + Vector3(right_vector.x * offset.x, right_vector.y * offset.x, offset.z - ray_from_offset.z)
							local dist = Vector3.length(to_offset)
							local dir = to_offset / dist
							local hit, hit_pos, hit_dist, hit_normal, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

							if not hit or Actor.unit(hit_actor) == target then
								success = true

								if debug then
									QuickDrawer:line(from, from + dist * dir, Color(0, 255, 0))
								end

								break
							end

							if debug then
								QuickDrawer:line(from, from + dist * dir, Color(255, 0, 255))
							end
						end
					end
				end
			end

			bb.has_line_of_sight = success
		else
			bb.has_line_of_sight = true
		end

		index = index + 1
	end

	self._update_queue_index = index
end

return
