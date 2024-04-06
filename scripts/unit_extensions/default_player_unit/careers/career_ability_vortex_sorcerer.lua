-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_vortex_sorcerer.lua

CareerAbilityVortexSorcerer = class(CareerAbilityVortexSorcerer)

local AISlotUtils = require("scripts/entity_system/systems/ai/ai_slot_utils")

CareerAbilityVortexSorcerer._ballistic_raycast = function (self, physics_world, max_steps, max_time, position, velocity, gravity, collision_filter)
	local time_step = max_time / max_steps
	local radius = 0.85
	local max_hits = 10

	for i = 1, max_steps do
		local new_position = position + velocity * time_step
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, position, new_position, radius, max_hits, "collision_filter", collision_filter, "report_initial_overlap")

		if result then
			local num_hits = #result

			for i = 1, num_hits do
				local hit = result[i]
				local hit_actor = hit.actor
				local hit_position = hit.position
				local hit_normal = hit.normal
				local hit_distance = hit.distance
				local hit_unit = Actor.unit(hit_actor)

				if hit_unit ~= self.owner_unit then
					return true, hit_position, hit_distance, hit_normal, hit_actor
				end
			end
		end

		velocity = velocity + gravity * time_step
		position = new_position
	end

	return false, position
end

local function travel_time(starting_position, target_position, speed)
	local distance = Vector3.distance(target_position, starting_position)
	local time = distance / speed

	return time
end

CareerAbilityVortexSorcerer.init = function (self, extension_init_context, unit, extension_init_data)
	self.owner_unit = unit
	self.world = extension_init_context.world
	self.wwise_world = Managers.world:wwise_world(self.world)

	local player = extension_init_data.player

	self.player = player
	self.is_server = player.is_server
	self.local_player = player.local_player
	self.bot_player = player.bot_player
	self.network_manager = Managers.state.network
	self.input_manager = Managers.input
	self.effect_id = nil
	self.effect_name = "fx/wpnfx_staff_geiser_charge"
	self.effect_id_teleport_exit = nil
end

CareerAbilityVortexSorcerer.extensions_ready = function (self, world, unit)
	self.first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self.ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	local career_extension = self.career_extension
	local career_ability_data = career_extension:get_activated_ability_data(1)

	self._ability_input = career_ability_data.input_action

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end
end

CareerAbilityVortexSorcerer.destroy = function (self)
	return
end

CareerAbilityVortexSorcerer.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if not self.is_priming then
		if input_extension:get(self._ability_input) then
			self:_start_priming()
		end
	elseif self.is_priming then
		self:_update_priming(dt, t)

		if input_extension:get("reload") or input_extension:get("action_two") then
			self:_stop_priming()
		end

		if not input_extension:get("action_one_hold") then
			local status_extension = self.status_extension

			status_extension._last_valid_position = self._last_valid_position
			status_extension.do_sorcerer_vortex = true

			if self.effect_id then
				World.destroy_particles(self.world, self.effect_id)

				self.effect_id = nil
			end

			self.career_extension:start_activated_ability_cooldown()

			self.is_priming = false

			return
		end
	end
end

CareerAbilityVortexSorcerer.stop = function (self, reason)
	if self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityVortexSorcerer._ability_available = function (self)
	local career_extension = self.career_extension
	local status_extension = self.status_extension
	local locomotion_extension = self.locomotion_extension
	local ghost_mode_extension = self.ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled() and locomotion_extension:is_on_ground() and not in_ghost_mode
end

CareerAbilityVortexSorcerer._start_priming = function (self)
	if self.local_player then
		local world = self.world
		local effect_name = self.effect_name

		self.effect_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._last_valid_position = nil
	self.is_priming = true
end

CareerAbilityVortexSorcerer._landing_postion_valid = function (self, start_pos, end_pos, data, t)
	local valid_pos = false
	local astar = data.astar

	if astar then
		local done = GwNavAStar.processing_finished(astar)

		if done then
			local path_found = GwNavAStar.path_found(astar)

			valid_pos = path_found and true or valid_pos

			GwNavAStar.destroy(astar)

			data.astar = nil
			data.astar_timer = t + 0.01
		end
	elseif t > data.astar_timer then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local astar = GwNavAStar.create(nav_world)
		local box_half_width = data.box_half_width
		local traverse_logic = Managers.state.bot_nav_transition:traverse_logic()

		GwNavAStar.start_with_propagation_box(astar, nav_world, start_pos, end_pos, box_half_width, traverse_logic)

		data.astar = astar
		data.astar_timer = t + 0.01
	end

	return valid_pos
end

CareerAbilityVortexSorcerer._update_priming = function (self, dt, t)
	local effect_id = self.effect_id
	local owner_unit = self.owner_unit
	local world = self.world
	local game = Managers.state.network:game()
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local unit_id = network_manager:unit_game_object_id(owner_unit)
	local up = Vector3(0, 0, 1)
	local first_person_extension = self.first_person_extension
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local max_steps = 10
	local max_time = 0.9
	local speed = 25
	local angle = 0
	local velocity = Quaternion.forward(Quaternion.multiply(player_rotation, Quaternion(Vector3.right(), angle))) * speed
	local gravity = Vector3(0, 0, -2)
	local collision_filter = "filter_adept_teleport"
	local result, hit_position, hit_distance, normal = self:_ballistic_raycast(physics_world, max_steps, max_time, player_position, velocity, gravity, collision_filter, false)

	if result and Vector3.dot(normal, Vector3.up()) < 0.75 then
		local step_back = Vector3.normalize(hit_position - player_position) * 1.5
		local step_back_position = hit_position - step_back
		local new_result, new_hit_position, new_hit_distance, new_normal = PhysicsWorld.immediate_raycast(physics_world, step_back_position, Vector3.down(), 10, "closest", "collision_filter", collision_filter)

		if new_result then
			hit_position = new_hit_position
		end
	end

	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local new_hit_position = AISlotUtils.get_target_pos_on_navmesh(hit_position, nav_world)

	hit_position = new_hit_position or hit_position

	local data = self._astar_data

	if not data then
		data = {
			astar_timer = 0,
			box_half_width = 20,
		}
		self._astar_data = data
	end

	local valid_pos = self:_landing_postion_valid(player_position, hit_position, data, t)

	if valid_pos then
		if effect_id then
			World.move_particles(world, effect_id, hit_position)
		end

		if self._last_valid_position then
			self._last_valid_position:store(hit_position)
		else
			self._last_valid_position = Vector3Box(hit_position)
		end
	end
end

CareerAbilityVortexSorcerer._stop_priming = function (self)
	if self.effect_id then
		World.destroy_particles(self.world, self.effect_id)

		self.effect_id = nil
	end

	if self._astar_data then
		local astar = self._astar_data.astar

		if astar and not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
			GwNavAStar.destroy(astar)
		end

		self._astar_data = nil
	end

	self.is_priming = false
end
