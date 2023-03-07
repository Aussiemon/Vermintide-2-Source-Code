DeusBelakorCrystalExtension = class(DeusBelakorCrystalExtension)
local CHECK_VALID_POSITION_EVERY_SECONDS = 5
local RESPAWN_LOCUS_MIN_DISTANCE = 1
local RESPAWN_LOCUS_MAX_DISTANCE = 2
local RESPAWN_LOCUS_ABOVE_MAX_DISTANCE = 1
local RESPAWN_LOCUS_BELOW_MAX_DISTANCE = 1

DeusBelakorCrystalExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.player.is_server

	if not self._is_server then
		return
	end

	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._astar = GwNavAStar.create()
end

DeusBelakorCrystalExtension.game_object_initialized = function (self, unit, go_id)
	self._go_id = go_id
end

DeusBelakorCrystalExtension.extensions_ready = function (self, world, unit)
	if not self._is_server then
		return
	end

	local kill_volume_handler_extension = ScriptUnit.extension(unit, "kill_volume_handler_system")

	kill_volume_handler_extension:add_handler(function ()
		if not self._nearest_locus then
			self._nearest_locus = self:_find_nearest_locus()

			if not self._nearest_locus then
				return false
			end
		end

		self._next_check = 0

		return true
	end)
end

DeusBelakorCrystalExtension.destroy = function (self)
	if not self._is_server then
		return
	end

	if self._running_astar then
		GwNavAStar.cancel(self._astar)
	end

	GwNavAStar.destroy(self._astar)

	self._astar = nil
	self._running_astar = nil
end

DeusBelakorCrystalExtension.update = function (self, unit, input, dt, context, t)
	if not self._is_server then
		return
	end

	if not self._next_check then
		self._next_check = t
	end

	if t < self._next_check then
		return
	end

	local crystal_position = POSITION_LOOKUP[unit]

	if not self._nearest_locus then
		self._nearest_locus = self:_find_nearest_locus()
	end

	if not self._nearest_locus or not ALIVE[self._nearest_locus] then
		self._next_check = t + CHECK_VALID_POSITION_EVERY_SECONDS

		return
	end

	local locus_position = POSITION_LOOKUP[self._nearest_locus]

	if self._running_astar then
		if GwNavAStar.processing_finished(self._astar) then
			self._running_astar = false

			if not GwNavAStar.path_found(self._astar) then
				local output_position_list = {}

				ConflictUtils.find_positions_around_position(locus_position, output_position_list, self._nav_world, RESPAWN_LOCUS_MIN_DISTANCE, RESPAWN_LOCUS_MAX_DISTANCE, 1, nil, nil, nil, nil, nil, RESPAWN_LOCUS_BELOW_MAX_DISTANCE, RESPAWN_LOCUS_ABOVE_MAX_DISTANCE)

				local new_position = output_position_list[1]

				if new_position then
					local actor = Unit.actor(unit, "throw")

					Actor.set_velocity(actor, Vector3(0, 0, 0))
					Actor.teleport_position(Unit.actor(unit, "throw"), new_position + Vector3(0, 0, 1))
				end
			end

			self._next_check = t + CHECK_VALID_POSITION_EVERY_SECONDS
		end
	else
		local bot_traverse_logic = Managers.state.bot_nav_transition:traverse_logic()

		GwNavAStar.start_with_propagation_box(self._astar, self._nav_world, crystal_position, locus_position, 30, bot_traverse_logic)

		self._running_astar = true

		return
	end
end

DeusBelakorCrystalExtension._find_nearest_locus = function (self)
	local crystal_position = POSITION_LOOKUP[self._unit]
	local entities = Managers.state.entity:get_entities("DeusBelakorLocusExtension")
	local nearest_locus, nearest_locus_distance = nil

	for locus_unit, _ in pairs(entities) do
		local distance = Vector3.length(crystal_position - POSITION_LOOKUP[locus_unit])

		if not nearest_locus_distance or distance < nearest_locus_distance then
			nearest_locus = locus_unit
			nearest_locus_distance = distance
		end
	end

	return nearest_locus
end
