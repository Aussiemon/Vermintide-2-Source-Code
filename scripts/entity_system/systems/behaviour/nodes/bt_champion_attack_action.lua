require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChampionAttackAction = class(BTChampionAttackAction, BTNode)
BTChampionAttackAction.init = function (self, ...)
	BTChampionAttackAction.super.init(self, ...)

	return 
end
BTChampionAttackAction.name = "BTChampionAttackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end

	return 
end

BTChampionAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTChampionAttackAction
	blackboard.attack_range = action.range
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.hit_players = blackboard.hit_players or {}
	blackboard.target_dodged = false
	local target_unit = blackboard.target_unit
	blackboard.target_unit_status_extension = (ScriptUnit.has_extension(target_unit, "status_system") and ScriptUnit.extension(target_unit, "status_system")) or nil
	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")
	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.special_attacking_target = blackboard.target_unit

	self._init_attack(self, unit, blackboard, action, t)

	blackboard.spawn_to_running = nil

	AiUtils.stormvermin_champion_hack_check_ward(unit, blackboard)

	return 
end

local function NEVER()
	return false
end

local PARTICLES_TEMP = {}
local POSITIONS_TEMP = {}
local SOUNDS_TEMP = {}
BTChampionAttackAction._init_attack = function (self, unit, blackboard, action, t)
	blackboard.move_state = "attacking"
	local world = blackboard.world
	local anim, scale = nil
	local seq = action.attack_sequence

	if seq then
		anim, scale = self._next_in_sequence(self, blackboard, t, seq, 1)
	else
		blackboard.attack_next_sequence_ready = NEVER
		anim = action.attack_anim
		scale = action.animation_drive_scale
	end

	if action.animation_driven and scale then
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(scale, scale, scale))
	end

	Managers.state.network:anim_event(unit, randomize(anim))

	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
	blackboard.attack_rotation = QuaternionBox(rotation)
	blackboard.attack_rotation_update_timer = t + action.rotation_time

	if action.mode == "continuous_overlap" then
		blackboard.last_attack_overlap_position = Vector3Box(POSITION_LOOKUP[unit])
		blackboard.last_attack_overlap_position_time = t
		blackboard.overlap_start_time = t + action.overlap_start_time
		blackboard.overlap_end_time = t + action.overlap_end_time
		blackboard.overlap_walls_check_time = t + (action.overlap_check_walls_time or math.huge)
	elseif action.mode == "radial_cylinder" then
		blackboard.overlap_start_time = t + action.overlap_start_time
		blackboard.overlap_end_time = t + action.overlap_end_time
		blackboard.overlap_angle_speed = (action.overlap_end_angle_offset - action.overlap_start_angle_offset)/(action.overlap_end_time - action.overlap_start_time)
		local forward = Quaternion.forward(blackboard.attack_rotation:unbox())
		local forward_angle = math.atan2(forward.y, forward.x)
		blackboard.overlap_start_angle = forward_angle + action.overlap_start_angle_offset
		blackboard.overlap_end_angle = forward_angle + action.overlap_end_angle_offset
		blackboard.overlap_last_angle = blackboard.overlap_start_angle
	elseif action.mode == "nav_mesh_wave" then
		local num_points = 1
		local fwd = Quaternion.forward(rotation)
		local pos = POSITION_LOOKUP[unit]
		local wanted_start_pos = pos + fwd*action.offset_forward
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()
		local above = 2
		local below = 2
		local ray_z_offset = 0.4
		local success, z = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

		table.clear(PARTICLES_TEMP)
		table.clear(POSITIONS_TEMP)
		table.clear(SOUNDS_TEMP)

		if success then
			local debug = Development.parameter("debug_ai_attack")
			local pw = World.get_data(world, "physics_world")
			local distance = action.wave_point_distance
			local last_pos = Vector3(wanted_start_pos.x, wanted_start_pos.y, z)
			local points = {
				Vector3Box(last_pos)
			}
			POSITIONS_TEMP[num_points] = last_pos

			while success and num_points < action.num_wave_points do
				local new_wanted_pos = last_pos + fwd*distance
				success, z = GwNavQueries.triangle_from_position(nav_world, new_wanted_pos, above, below)

				if success then
					new_wanted_pos.z = z
					success = GwNavQueries.raycango(nav_world, last_pos, new_wanted_pos)

					if not success then
						local from = last_pos + Vector3(0, 0, ray_z_offset)
						local offset = new_wanted_pos - last_pos
						local dist = Vector3.length(offset)
						local dir = offset/dist
						local hit = PhysicsWorld.raycast(pw, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")
						success = not hit
					end

					if success then
						num_points = num_points + 1
						points[num_points] = Vector3Box(new_wanted_pos)
						POSITIONS_TEMP[num_points] = new_wanted_pos
						last_pos = new_wanted_pos

						if debug then
							QuickDrawerStay:sphere(new_wanted_pos, 0.25, Color(255, 0, 0))
						end
					end
				end
			end

			blackboard.overlap_wave_points = points
		else
			blackboard.overlap_wave_points = {
				Vector3Box(wanted_start_pos)
			}
			POSITIONS_TEMP[num_points] = wanted_start_pos
		end

		local fx_name = action.anticipation_fx
		local fx_name_id = NetworkLookup.effects[fx_name]

		for i = 1, num_points, 1 do
			local pos = POSITIONS_TEMP[i]
			PARTICLES_TEMP[i] = fx_name_id

			World.create_particles(world, fx_name, pos)
		end

		Managers.state.network.network_transmit:send_rpc_clients("rpc_play_fx", PARTICLES_TEMP, SOUNDS_TEMP, POSITIONS_TEMP)

		local speed = action.wave_speed
		blackboard.overlap_start_time = t + action.overlap_start_time
		blackboard.overlap_end_time = blackboard.overlap_start_time + num_points*speed
		blackboard.last_overlap_index = 0
	end

	if action.animation_driven then
		LocomotionUtils.set_animation_driven_movement(unit, true, true, true)
	end

	local bot_threat_duration = action.bot_threat_duration

	if bot_threat_duration then
		if action.collision_type == "cylinder" then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
			local pos = self._calculate_cylinder_collision(self, action, POSITION_LOOKUP[unit], rot)
			local size = Vector3(action.radius, action.radius, action.height*0.5)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "cylinder", size, nil, bot_threat_duration)
		elseif action.collision_type == "oobb" or not action.collision_type then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
			local pos, rot, size = self._calculate_oobb_collision(self, action, POSITION_LOOKUP[unit], rot)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(pos, "oobb", size, rot, bot_threat_duration)
		end
	end

	return 
end
BTChampionAttackAction._attack_threat_over = function (self, unit, blackboard, action)
	local target_unit = blackboard.special_attacking_target
	local target_alive = Unit.alive(target_unit)
	local target_hit = blackboard.hit_players[target_unit]

	if target_alive and not target_hit and ((action.throw_dialogue_system_event_on_dodged_attack and blackboard.target_dodged) or action.throw_dialogue_system_event_on_missed_attack) then
		local target_name = ScriptUnit.extension(target_unit, "dialogue_system").context.player_profile

		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.enemy_attack_distance, "attack_tag", action.name, "target_name", target_name, "attack_hit", false)
	end

	blackboard.special_attacking_target = nil

	return 
end
BTChampionAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local action = blackboard.action
	local catapulted_players = blackboard.catapulted_players

	if catapulted_players then
		blackboard.catapulted_players = nil

		if not destroy and catapulted_players[1] then
			self._catapult_players(self, unit, blackboard, action, catapulted_players)
		end
	end

	if not destroy and action.animation_driven then
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))
	end

	if blackboard.special_attacking_target and not destroy then
		self._attack_threat_over(self, unit, blackboard, action)
	end

	local target_unit = blackboard.special_attacking_target
	local target_alive = Unit.alive(target_unit)
	local target_hit = blackboard.hit_players[target_unit]
	local inc_stat_on_dodged = action.increment_stat_on_attack_dodged

	if inc_stat_on_dodged and not destroy and target_alive and not target_hit and blackboard.target_dodged then
		local owner = Managers.player:owner(target_unit)

		if owner and owner.local_player then
			local stats_id = owner.stats_id(owner)
			local statistics_db = Managers.player:statistics_db()

			statistics_db.increment_stat(statistics_db, stats_id, inc_stat_on_dodged)
		elseif owner and owner.is_player_controlled(owner) then
			RPC.rpc_increment_stat(owner.network_id(owner), NetworkLookup.statistics[inc_stat_on_dodged])
		end
	end

	blackboard.navigation_extension:set_enabled(true)
	table.clear(blackboard.hit_players)

	blackboard.move_state = nil
	blackboard.target_unit_status_extension = nil
	blackboard.update_timer = 0
	blackboard.active_node = nil
	blackboard.attack_aborted = nil
	blackboard.attack_rotation = nil
	blackboard.attack_rotation_update_timer = nil
	blackboard.special_attacking_target = nil
	blackboard.action = nil
	blackboard.target_dodged = nil
	blackboard.attack_next_sequence_step_at = nil
	blackboard.attack_next_sequence_index = nil

	if action.mode == "continuous_overlap" then
		blackboard.last_attack_overlap_position = nil
		blackboard.overlap_start_time = nil
		blackboard.overlap_end_time = nil
		blackboard.overlap_wall_collision_time = nil
		blackboard.overlap_walls_check_time = nil
	elseif action.mode == "radial_cylinder" then
	end

	local flow_event = action.exit_flow_event

	if flow_event then
		Unit.flow_event(unit, flow_event)
	end

	return 
end
BTChampionAttackAction.run = function (self, unit, blackboard, t, dt)
	self._update_rotation(self, unit, t, dt, blackboard)

	local action = blackboard.action
	local catapulted_players = blackboard.catapulted_players

	if catapulted_players and catapulted_players[1] then
		self._catapult_players(self, unit, blackboard, action, catapulted_players)
	end

	local collision_time = blackboard.overlap_wall_collision_time

	if collision_time then
		if collision_time < t then
			return "done"
		else
			return "running"
		end
	end

	if blackboard.attack_next_sequence_ready(unit, blackboard, t) then
		local anim, scale = self._next_in_sequence(self, blackboard, t, action.attack_sequence, blackboard.attack_next_sequence_index)

		Managers.state.network:anim_event(unit, randomize(anim))

		if action.animation_driven then
			LocomotionUtils.set_animation_translation_scale(unit, Vector3(scale, scale, scale))
		end
	end

	if action.mode == "continuous_overlap" then
		self._update_overlap(self, unit, blackboard, action, dt, t)
	elseif action.mode == "radial_cylinder" then
		self._update_radial_cylinder(self, unit, blackboard, action, dt, t)
	elseif action.mode == "nav_mesh_wave" then
		self._update_nav_mesh_wave(self, unit, blackboard, action, dt, t)
	end

	if blackboard.attack_finished then
		return "done"
	end

	return "running"
end
BTChampionAttackAction._next_in_sequence = function (self, blackboard, t, sequence_data, sequence_index)
	local current = sequence_data[sequence_index]
	local anim = current.attack_anim
	local scale = current.animation_drive_scale
	local next_index = sequence_index + 1
	local next_sequence_step = sequence_data[next_index]
	local start_time = t
	blackboard.attack_sequence_start_time = start_time

	if next_sequence_step then
		local at = next_sequence_step.at
		blackboard.attack_next_sequence_ready = (at and function (unit, blackboard, t)
			return at <= t - start_time
		end) or next_sequence_step.ready_function
		blackboard.attack_next_sequence_index = next_index
	else
		blackboard.attack_next_sequence_ready = NEVER
		blackboard.attack_next_sequence_index = nil
	end

	return anim, scale or 1
end
BTChampionAttackAction._update_rotation = function (self, unit, t, dt, blackboard)
	local target_status_ext = blackboard.target_unit_status_extension
	local has_dodged = blackboard.target_dodged or (target_status_ext and (target_status_ext.get_is_dodging(target_status_ext) or target_status_ext.is_invisible(target_status_ext)))
	blackboard.target_dodged = has_dodged
	local rotation = nil
	local self_pos = POSITION_LOOKUP[unit]
	local target_unit = blackboard.special_attacking_target
	local target_pos = POSITION_LOOKUP[target_unit]
	local target_is_alive = Unit.alive(target_unit)
	local should_update_rotation = target_is_alive and t < blackboard.attack_rotation_update_timer and not has_dodged and 0.09 < Vector3.distance_squared(self_pos, target_pos) and not blackboard.hit_players[target_unit]

	if should_update_rotation then
		rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.special_attacking_target)
		local offset = target_pos - self_pos
		offset.z = 0
		local rotation = Quaternion.look(Vector3.normalize(offset))

		blackboard.attack_rotation:store(rotation)
	else
		rotation = blackboard.attack_rotation:unbox()
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_wanted_rotation(locomotion_extension, rotation)

	return 
end
local debug_drawer_info = {
	mode = "retained",
	name = "BTChampionAttackAction"
}
BTChampionAttackAction._update_overlap = function (self, unit, blackboard, action, dt, t)
	local start_t = blackboard.overlap_start_time
	local end_t = blackboard.overlap_end_time
	local last_t = blackboard.last_attack_overlap_position_time
	local new_pos = POSITION_LOOKUP[unit]

	if start_t < t and last_t < end_t then
		local old_pos = blackboard.last_attack_overlap_position:unbox()
		local from, to = nil

		if last_t < start_t then
			local lerp_t = (start_t - last_t)/(t - last_t)
			from = Vector3.lerp(old_pos, new_pos, lerp_t)
		else
			from = old_pos
		end

		if end_t < t then
			local lerp_t = (end_t - last_t)/(t - last_t)
			to = Vector3.lerp(old_pos, new_pos, lerp_t)
		else
			to = new_pos
		end

		local movement_controlled_rotation = action.movement_controlled_rotation
		local delta = to - from
		local length = Vector3.length(delta)
		local direction = Vector3.normalize(delta)
		local rot, forward = nil

		if movement_controlled_rotation then
			rot = Quaternion.look(direction, Vector3.up())
			forward = direction
		else
			rot = Unit.local_rotation(unit, 0)
			forward = Quaternion.forward(rot)
		end

		local up = Quaternion.up(rot)
		local base_range = nil
		local action_range = action.range

		if type(action_range) == "function" then
			base_range = action_range((t - start_t)/(end_t - start_t))
		else
			base_range = action_range
		end

		local range = base_range + ((movement_controlled_rotation and length) or Vector3.dot(delta, forward))
		local height = action.height
		local width = action.width
		local half_range = range*0.5
		local half_height = height*0.5
		local oobb_pos = from + forward*(action.offset_forward + half_range) + up*(action.offset_up + half_height)
		local size = Vector3(width*0.5, half_range, half_height)
		local pw = World.get_data(blackboard.world, "physics_world")
		local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", oobb_pos, "rotation", rot, "size", size, "shape", "oobb", "types", "dynamics", "collision_filter", "filter_player_hit_box_check", "use_global_table")

		if Development.parameter("debug_ai_attack") then
			local pose = Matrix4x4.from_quaternion_position(rot, oobb_pos)

			QuickDrawer:box(pose, size)
		end

		self._deal_damage(self, unit, blackboard, action, from, hit_actors, actor_count, true)

		if blackboard.overlap_walls_check_time < t then
			local above = 0.3
			local below = 0.3
			local nav_world = blackboard.nav_world
			local success, z = GwNavQueries.triangle_from_position(nav_world, from, above, below)
			local collision = false

			if success then
				local length = action.overlap_check_walls_range + dt*Vector3.length(blackboard.locomotion_extension:current_velocity())
				local to = from + forward*length
				local success2, z2 = GwNavQueries.triangle_from_position(nav_world, to, math.max(above, length), math.max(below, length))

				if not success2 or not GwNavQueries.raycango(nav_world, Vector3(from.x, from.y, z), Vector3(to.x, to.y, z2)) then
					collision = true
				end
			else
				collision = true
			end

			if collision then
				blackboard.overlap_wall_collision_time = t + action.wall_collision_stun_time

				Managers.state.network:anim_event(unit, randomize(action.wall_collision_anim))
			end
		end
	elseif blackboard.special_attacking_target and end_t < last_t then
		self._attack_threat_over(self, unit, blackboard, action)
	end

	blackboard.last_attack_overlap_position:store(new_pos)

	blackboard.last_attack_overlap_position_time = t

	return 
end
local HITS_TEMP = {}
BTChampionAttackAction._update_nav_mesh_wave = function (self, unit, blackboard, action, dt, t)
	local world = blackboard.world
	local start_t = blackboard.overlap_start_time
	local end_t = blackboard.overlap_end_time

	if end_t < t and blackboard.special_attacking_target then
		self._attack_threat_over(self, unit, blackboard, action)

		return 
	elseif t < start_t or end_t < t then
		return 
	end

	local speed = action.wave_speed
	local wave_points = blackboard.overlap_wave_points
	local relative_t = t - start_t
	local new_index = math.min(math.floor(relative_t*speed + 1), #wave_points)
	local last_index = blackboard.last_overlap_index
	local start_index = math.min(last_index + 1, new_index)
	local pw = World.get_data(world, "physics_world")

	table.clear(HITS_TEMP)

	local num_hits = 0
	local from = nil
	local debug = Development.parameter("debug_ai_attack")

	table.clear(PARTICLES_TEMP)
	table.clear(POSITIONS_TEMP)
	table.clear(SOUNDS_TEMP)

	local num_fx = 0
	local sfx = action.wave_sfx
	local vfx = action.wave_fx
	local vfx_id = NetworkLookup.effects[vfx]
	local sfx_id = NetworkLookup.sound_events[sfx]

	for i = start_index, new_index, 1 do
		local pos = wave_points[i]:unbox()

		if i ~= last_index then
			WwiseUtils.trigger_position_event(world, sfx, pos)
			World.create_particles(world, vfx, pos)

			num_fx = num_fx + 1
			PARTICLES_TEMP[num_fx] = vfx_id
			SOUNDS_TEMP[num_fx] = sfx_id
			POSITIONS_TEMP[num_fx] = pos
		end

		local to = wave_points[i + 1]
		to = (to and to.unbox(to)) or pos
		from = wave_points[i - 1]
		from = (from and from.unbox(from)) or POSITION_LOOKUP[unit]
		local rot = Quaternion.look(to - from, Vector3.up())
		local y = math.max(Vector3.length(to - pos), Vector3.length(from - pos))
		local half_height = action.height*0.5
		local size = Vector3(action.width*0.5, y, half_height)
		local up = Quaternion.up(rot)
		local oobb_pos = (to + from)*0.5 + up*half_height
		local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", oobb_pos, "rotation", rot, "size", size, "shape", "oobb", "types", "dynamics", "collision_filter", "filter_player_hit_box_check", "use_global_table")

		table.append(HITS_TEMP, hit_actors)

		num_hits = num_hits + actor_count

		if debug then
			local pose = Matrix4x4.from_quaternion_position(rot, oobb_pos)

			QuickDrawer:box(pose, size)
		end
	end

	if 0 < num_fx then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_play_fx", PARTICLES_TEMP, SOUNDS_TEMP, POSITIONS_TEMP)
	end

	self._deal_damage(self, unit, blackboard, action, from, HITS_TEMP, num_hits, true)

	blackboard.last_overlap_index = new_index

	return 
end
BTChampionAttackAction.anim_cb_damage = function (self, unit, blackboard)
	local action = blackboard.action
	local mode = action.mode

	if mode then
		printf("BTChampionAttackAction anim_cb_damage in mode %q", mode)

		return 
	end

	local self_pos = Unit.local_position(unit, 0)
	local self_rot = Unit.local_rotation(unit, 0)
	local pw = World.get_data(blackboard.world, "physics_world")

	if action.collision_type == "oobb" or not action.collision_type then
		local oobb_pos, self_rot, size = self._calculate_oobb_collision(self, action, self_pos, self_rot)
		local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", oobb_pos, "rotation", self_rot, "size", size, "shape", "oobb", "types", "dynamics", "collision_filter", "filter_player_hit_box_check", "use_global_table")

		if Development.parameter("debug_ai_attack") then
			local drawer = Managers.state.debug:drawer(debug_drawer_info)

			drawer.reset(drawer)

			local pose = Matrix4x4.from_quaternion_position(self_rot, oobb_pos)

			drawer.box(drawer, pose, size)
		end

		self._deal_damage(self, unit, blackboard, action, self_pos, hit_actors, actor_count, true)
	elseif action.collision_type == "cylinder" then
		local cylinder_center, size, rotation = self._calculate_cylinder_collision(self, action, self_pos, self_rot)
		local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", cylinder_center, "rotation", rotation, "size", size, "shape", "capsule", "types", "dynamics", "collision_filter", "filter_player_hit_box_check", "use_global_table")

		if Development.parameter("debug_ai_attack") then
			local drawer = Managers.state.debug:drawer(debug_drawer_info)

			drawer.reset(drawer)

			local fwd = Quaternion.forward(rotation)

			drawer.cylinder(drawer, cylinder_center - fwd*size.y, cylinder_center + fwd*size.y, math.max(size.x, size.z), nil, 4)
		end

		self._deal_damage(self, unit, blackboard, action, self_pos, hit_actors, actor_count, true)
	end

	self._attack_threat_over(self, unit, blackboard, action)

	return 
end
BTChampionAttackAction._update_radial_cylinder = function (self, unit, blackboard, action, dt, t)
	if blackboard.overlap_end_time < t and blackboard.special_attacking_target then
		self._attack_threat_over(self, unit, blackboard, action)

		return 
	elseif t < blackboard.overlap_start_time or blackboard.overlap_end_time < t then
		return 
	end

	local attack_t = t - blackboard.overlap_start_time
	local self_pos = Unit.local_position(unit, 0)
	local self_rot = Unit.local_rotation(unit, 0)
	local pw = World.get_data(blackboard.world, "physics_world")
	local cylinder_center, size, rotation = self._calculate_cylinder_collision(self, action, self_pos, self_rot)
	local hit_actors, actor_count = PhysicsWorld.immediate_overlap(pw, "position", cylinder_center, "rotation", rotation, "size", size, "shape", "capsule", "types", "dynamics", "collision_filter", action.collision_filter, "use_global_table")

	if Development.parameter("debug_ai_attack") then
		local drawer = Managers.state.debug:drawer(debug_drawer_info)

		drawer.reset(drawer)

		local fwd = Quaternion.forward(rotation)

		drawer.cylinder(drawer, cylinder_center - fwd*size.y, cylinder_center + fwd*size.y, math.max(size.x, size.z), nil, 4)
	end

	local start_angle = blackboard.overlap_start_angle
	local old_angle = blackboard.overlap_last_angle
	local new_angle = start_angle + attack_t*blackboard.overlap_angle_speed
	local relative_angle = new_angle - old_angle
	local check_radius = 0.5
	local two_pi = math.pi*2
	local hit_list = {}
	local num_hit = 0

	for i = 1, actor_count, 1 do
		local actor = hit_actors[i]
		local hit_unit = Actor.unit(actor)

		if hit_unit ~= unit and not blackboard.hit_players[hit_unit] then
			local actor_pos = Actor.center_of_mass(actor)
			local offset = actor_pos - self_pos
			local y = offset.y
			local x = nil
			local direction = action.direction

			if direction == "clockwise" then
				x = -offset.x
			elseif direction == "counter_clockwise" then
				x = offset.x
			else
				fassert(false, "Radial cylinder overlap with invalid direction %s", tostring(direction))
			end

			local dist = math.sqrt(x*x + y*y)
			local angle = math.atan2(y, x)
			local radial_width = math.tan(check_radius, dist)*2
			local min_angle = (angle - radial_width - old_angle)%two_pi
			local max_angle = ((angle + radial_width) - old_angle)%two_pi

			if max_angle < min_angle then
				min_angle = min_angle - two_pi
			end

			local hit = (min_angle < 0 and relative_angle < max_angle) or (0 < min_angle and min_angle < relative_angle) or (0 < max_angle and max_angle < relative_angle)

			if hit then
				hit_list[#hit_list + 1] = actor
				num_hit = num_hit + 1
			end
		end
	end

	self._deal_damage(self, unit, blackboard, action, self_pos, hit_list, num_hit, false)

	blackboard.overlap_last_angle = new_angle

	return 
end
BTChampionAttackAction._calculate_cylinder_collision = function (self, action, self_pos, self_rot)
	local radius = action.radius
	local height = action.height
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local offset_right = action.offset_right
	local half_height = height*0.5
	local size = Vector3(radius, half_height, radius)
	local forward = Quaternion.forward(self_rot)
	local up = Quaternion.up(self_rot)
	local right = Quaternion.right(self_rot)
	local cylinder_center = self_pos + forward*(radius + offset_forward) + up*(half_height + offset_up) + right*offset_right
	local rotation = Quaternion.look(up, Vector3.up())

	return cylinder_center, size, rotation
end
BTChampionAttackAction._calculate_oobb_collision = function (self, action, self_pos, self_rot)
	local range = action.range
	local height = action.height
	local width = action.width
	local offset_up = action.offset_up
	local offset_forward = action.offset_forward
	local half_range = range*0.5
	local half_height = height*0.5
	local size = Vector3(width*0.5, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward())*(offset_forward + half_range)
	local up = Vector3.up()*(half_height + offset_up)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end
BTChampionAttackAction._deal_damage = function (self, unit, blackboard, action, self_pos, hit_actors, actor_count, is_animation_callback)
	local hit_players = blackboard.hit_players
	local Unit_alive = Unit.alive
	local Actor_unit = Actor.unit
	local AiUtils_damage_target = AiUtils.damage_target
	local catapult = action.catapult
	local shove_speed = action.shove_speed
	local shove_z_speed = action.shove_z_speed
	local impact_shove = action.impact_shove_multiplier

	if impact_shove then
		local speed = Vector3.length(blackboard.locomotion_extension:current_velocity())
		shove_speed = speed*impact_shove
	end

	assert(not shove_speed == not shove_z_speed, "Shove speed and shove_z_speed both or neither need to be set")

	for i = 1, actor_count, 1 do
		local actor = hit_actors[i]
		local target_unit = Actor_unit(actor)

		if Unit_alive(target_unit) and not hit_players[target_unit] then
			hit_players[target_unit] = true
			local attack_direction = action.attack_directions and action.attack_directions[blackboard.attack_anim]
			local blocked = DamageUtils.check_block(unit, target_unit, action.fatigue_type, attack_direction)
			local target_pos = POSITION_LOOKUP[target_unit]

			if shove_speed then
				local direction = Vector3.normalize(target_pos - self_pos)

				if is_animation_callback then
					local catapulted = blackboard.catapulted_players

					if not catapulted then
						catapulted = {}
						blackboard.catapulted_players = catapulted
					end

					catapulted[#catapulted + 1] = {
						target_unit = target_unit,
						blocked = blocked,
						direction = Vector3Box(direction)
					}
				else
					self._catapult_enemy(self, unit, blackboard, shove_speed, shove_z_speed, target_unit, blocked, direction)
				end
			end

			if blocked then
				local push_speed = action.player_push_speed_blocked

				if push_speed then
					local blocked_velocity = push_speed*Vector3.normalize(target_pos - self_pos)
					local locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")

					locomotion_extension.add_external_velocity(locomotion_extension, blocked_velocity)
				end

				local blocked_damage = action.blocked_damage

				if blocked_damage then
					AiUtils_damage_target(target_unit, unit, action, blocked_damage)
				end

				return 
			else
				AiUtils_damage_target(target_unit, unit, action, action.damage)
			end
		end
	end

	return 
end
BTChampionAttackAction._catapult_players = function (self, unit, blackboard, action, catapulted_players)
	local shove_speed = action.shove_speed
	local shove_z_speed = action.shove_z_speed
	local impact_shove = action.impact_shove_multiplier

	if impact_shove then
		local speed = Vector3.length(blackboard.locomotion_extension:current_velocity())
		shove_speed = speed*impact_shove
	end

	for _, data in ipairs(catapulted_players) do
		self._catapult_player(self, unit, shove_speed, shove_z_speed, data.target_unit, data.blocked, data.direction:unbox())
	end

	table.clear(catapulted_players)

	return 
end
BTChampionAttackAction._catapult_player = function (self, unit, shove_speed, shove_z_speed, target_unit, blocked, direction)
	local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

	if not target_status_extension.is_knocked_down(target_status_extension) and not target_status_extension.is_dead(target_status_extension) then
		local push_velocity = direction*shove_speed

		Vector3.set_z(push_velocity, shove_z_speed)
		StatusUtils.set_catapulted_network(target_unit, true, push_velocity)
	end

	return 
end

return 
