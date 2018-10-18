CareerAbilityBWAdept = class(CareerAbilityBWAdept)
local DEBUG = false

local function dprint(...)
	if DEBUG then
		printf(...)
	end
end

CareerAbilityBWAdept._ballistic_raycast = function (self, physics_world, max_steps, max_time, position, velocity, gravity, collision_filter)
	local time_step = max_time / max_steps
	local radius = 0.85
	local max_hits = 10

	for i = 1, max_steps, 1 do
		local new_position = position + velocity * time_step
		local result = PhysicsWorld.linear_sphere_sweep(physics_world, position, new_position, radius, max_hits, "collision_filter", collision_filter, "report_initial_overlap")

		if result then
			local num_hits = #result

			for j = 1, num_hits, 1 do
				local hit = result[j]
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

CareerAbilityBWAdept.init = function (self, extension_init_context, unit, extension_init_data)
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
end

CareerAbilityBWAdept.extensions_ready = function (self, world, unit)
	self.first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.career_extension = ScriptUnit.extension(unit, "career_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end
end

CareerAbilityBWAdept.destroy = function (self)
	return
end

CareerAbilityBWAdept.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if not self.is_priming then
		if input_extension:get("action_career") then
			self:_start_priming()
		end
	elseif self.is_priming then
		local end_position = self:_update_priming(dt, t)

		if input_extension:get("action_two") or input_extension:get("jump") or input_extension:get("jump_only") then
			self:_stop_priming()

			return
		end

		if input_extension:get("weapon_reload") then
			self:_stop_priming()

			return
		end

		if not input_extension:get("action_career_hold") then
			self:_run_ability(end_position)
		end
	end
end

CareerAbilityBWAdept.stop = function (self, reason)
	if reason ~= "pushed" and reason ~= "stunned" and self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityBWAdept._ability_available = function (self)
	local career_extension = self.career_extension
	local status_extension = self.status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityBWAdept._start_priming = function (self)
	if self.local_player then
		local world = self.world
		local effect_name = self.effect_name
		self.effect_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._last_valid_position = nil
	self.is_priming = true
end

CareerAbilityBWAdept._landing_postion_valid = function (self, start_pos, end_pos, data, t)
	Profiler.start("CareerAbilityBWAdept:_landing_postion_valid")

	local valid_pos = false
	local astar = data.astar

	if astar then
		local done = GwNavAStar.processing_finished(astar)

		if done then
			dprint("done")

			local path_found = GwNavAStar.path_found(astar)

			if path_found then
				dprint("found path")

				valid_pos = true
			else
				dprint("no path found")
			end

			GwNavAStar.destroy(astar)

			data.astar = nil
			data.astar_timer = t + 0.01
		else
			dprint("processing")
		end
	elseif data.astar_timer < t then
		dprint("create astar")

		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local new_astar = GwNavAStar.create(nav_world)
		local box_half_width = data.box_half_width
		local traverse_logic = Managers.state.bot_nav_transition:traverse_logic()

		GwNavAStar.start_with_propagation_box(new_astar, nav_world, start_pos, end_pos, box_half_width, traverse_logic)

		data.astar = new_astar
		data.astar_timer = t + 0.01
	end

	Profiler.stop("CareerAbilityBWAdept:_landing_postion_valid")

	return valid_pos
end

CareerAbilityBWAdept._update_priming = function (self, dt, t)
	Profiler.start("CareerAbilityBWAdept:_update_priming")

	local effect_id = self.effect_id
	local owner_unit = self.owner_unit
	local world = self.world
	local game = Managers.state.network:game()
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local unit_id = network_manager:unit_game_object_id(owner_unit)
	local player_position = GameSession.game_object_field(game, unit_id, "aim_position")
	local up = Vector3(0, 0, 1)
	local player_rotation = Quaternion.look(GameSession.game_object_field(game, unit_id, "aim_direction"), up)
	local max_steps = 10
	local max_time = 0.9
	local speed = 12
	local angle = 0
	local velocity = Quaternion.forward(Quaternion.multiply(player_rotation, Quaternion(Vector3.right(), angle))) * speed
	local gravity = Vector3(0, 0, -2)
	local collision_filter = "filter_adept_teleport"
	local result, hit_position, _, normal = self:_ballistic_raycast(physics_world, max_steps, max_time, player_position, velocity, gravity, collision_filter, false)

	if result and Vector3.dot(normal, Vector3.up()) < 0.75 then
		local step_back = Vector3.normalize(hit_position - player_position) * 1.5
		local step_back_position = hit_position - step_back
		local new_result, new_hit_position, _, _ = PhysicsWorld.immediate_raycast(physics_world, step_back_position, Vector3.down(), 100, "closest", "collision_filter", collision_filter)

		if new_result then
			hit_position = new_hit_position
		end
	end

	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local new_hit_position = get_target_pos_on_navmesh(hit_position, nav_world)
	hit_position = new_hit_position or hit_position
	local data = self._astar_data

	if not data then
		dprint("created data")

		data = {
			astar_timer = 0,
			box_half_width = 20
		}
		self._astar_data = data
	end

	local valid_pos = self:_landing_postion_valid(player_position, hit_position, data, t)

	if valid_pos then
		if effect_id then
			World.move_particles(world, effect_id, hit_position)
		end

		dprint(hit_position)

		if self._last_valid_position then
			self._last_valid_position:store(hit_position)
		else
			self._last_valid_position = Vector3Box(hit_position)
		end
	end

	Profiler.stop("CareerAbilityBWAdept:_update_priming")
end

CareerAbilityBWAdept._stop_priming = function (self)
	if self.effect_id then
		World.destroy_particles(self.world, self.effect_id)

		self.effect_id = nil
	end

	if self._astar_data then
		dprint("deleted data")

		local astar = self._astar_data.astar

		if astar then
			dprint("has astar")

			if not GwNavAStar.processing_finished(astar) then
				dprint("still processing, canceling")
				GwNavAStar.cancel(astar)
				GwNavAStar.destroy(astar)
			else
				dprint("processing finished")
			end
		end

		self._astar_data = nil
	end

	self.is_priming = false
end

CareerAbilityBWAdept._run_ability = function (self)
	dprint("_run_ability")
	self:_stop_priming()

	local end_position = self._last_valid_position and self._last_valid_position:unbox()

	if not end_position then
		dprint("no end_position")

		return
	end

	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local bot_player = self.bot_player
	local network_manager = self.network_manager
	local career_extension = self.career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	if local_player or (is_server and bot_player) then
		local start_pos = POSITION_LOOKUP[owner_unit]
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, start_pos, 2, 30)

		if projected_start_pos then
			local damage_wave_template_name = "sienna_adept_ability_trail"

			if talent_extension:has_talent("sienna_adept_ability_trail_increased_duration", "bright_wizard", true) then
				damage_wave_template_name = "sienna_adept_ability_trail_increased_duration"
			end

			local damage_wave_template_id = NetworkLookup.damage_wave_templates[damage_wave_template_name]
			local invalid_game_object_id = NetworkConstants.invalid_game_object_id

			network_manager.network_transmit:send_rpc_server("rpc_create_damage_wave", invalid_game_object_id, projected_start_pos, end_position, damage_wave_template_id)
		end
	end

	if local_player then
		local first_person_extension = self.first_person_extension

		first_person_extension:animation_event("battle_wizard_active_ability_blink")

		MOOD_BLACKBOARD.skill_adept = true

		career_extension:set_state("sienna_activate_adept")
	end

	local locomotion_extension = self.locomotion_extension

	locomotion_extension:teleport_to(end_position)

	local position = end_position
	local rotation = Unit.local_rotation(owner_unit, 0)
	local explosion_template = "sienna_adept_activated_ability_end_stagger"
	local scale = 1
	local career_power_level = career_extension:get_career_power_level()
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, "career_ability", career_power_level, false)

	if talent_extension:has_talent("sienna_adept_activated_ability_dump_overcharge", "bright_wizard", true) and (local_player or (is_server and bot_player)) then
		local overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")

		overcharge_extension:reset()
	end

	career_extension:start_activated_ability_cooldown()
	self:_play_vo()
end

CareerAbilityBWAdept._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

return
