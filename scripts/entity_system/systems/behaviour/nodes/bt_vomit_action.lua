require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTVomitAction = class(BTVomitAction, BTNode)
BTVomitAction.init = function (self, ...)
	BTVomitAction.super.init(self, ...)

	return 
end
BTVomitAction.name = "BTVomitAction"

local function debug_print(...)
	if script_data.debug_chaos_troll then
		print(...)
	end

	return 
end

BTVomitAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local world = blackboard.world
	blackboard.action = action
	blackboard.active_node = BTVomitAction
	blackboard.physics_world = blackboard.physics_world or World.get_data(world, "physics_world")
	blackboard.rotation_time = t + action.rotation_time

	if self.init_attack(self, unit, blackboard, action, t) then
		blackboard.anim_locked = t + action.attack_time
		blackboard.move_state = "attacking"
		blackboard.attack_finished = false
		blackboard.attack_aborted = false
		blackboard.keep_target = true

		Managers.state.conflict:freeze_intensity_decay(15)
	else
		blackboard.attack_aborted = true
	end

	return 
end
BTVomitAction._position_on_navmesh = function (self, position, blackboard)
	local nav_world = blackboard.nav_world
	local success, z = GwNavQueries.triangle_from_position(nav_world, position, 1, 1)

	if success then
		position = Vector3.copy(position)
		position.z = z
	else
		position = GwNavQueries.inside_position_from_outside_position(nav_world, position, 3, 3, 1, 1)
	end

	return position
end
BTVomitAction._get_vomit_position = function (self, unit, blackboard)
	local troll_head_node = Unit.node(unit, "j_head")
	local troll_head_pos = Unit.world_position(unit, troll_head_node)
	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local to_target = target_pos - troll_head_pos
	local target_direction = Vector3.normalize(to_target)
	local target_distance = Vector3.length(to_target)
	local physics_world = blackboard.physics_world
	local pos_to_test, puke_distance_sq, puke_direction = nil
	local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, troll_head_pos, target_direction, target_distance, "closest", "collision_filter", "filter_enemy_ray_projectile")

	if result then
		pos_to_test = hit_position
	else
		pos_to_test = target_pos
	end

	local puke_pos = self._position_on_navmesh(self, pos_to_test, blackboard)

	if puke_pos then
		local to_puke_pos = puke_pos - troll_head_pos
		puke_distance_sq = Vector3.length_squared(to_puke_pos)
		puke_direction = Vector3.normalize(to_puke_pos)
	end

	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "BTVomitAction"
	})

	drawer.reset(drawer)

	if script_data.debug_chaos_troll then
		drawer.sphere(drawer, troll_head_pos, 0.25, Color(0, 255, 0))
		drawer.vector(drawer, troll_head_pos, to_target, Color(0, 255, 0))

		local debug_color = (puke_pos and Color(255, 255, 0)) or Color(255, 0, 0)

		drawer.sphere(drawer, pos_to_test, 0.25, debug_color)

		if puke_pos then
			drawer.sphere(drawer, puke_pos, 0.35, Color(0, 255, 0))
		end
	end

	return puke_pos, puke_distance_sq, puke_direction
end
BTVomitAction.init_attack = function (self, unit, blackboard, action, t)
	local puke_position, puke_distance_sq, puke_direction = self._get_vomit_position(self, unit, blackboard)

	if not puke_position then
		return false
	end

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.pounced_down_broadcast_range, "attack_tag", "before_puke")

	local vomit_animation = nil
	local attack_anims = action.attack_anims

	blackboard.navigation_extension:stop()

	local down_dot = Vector3.dot(puke_direction, Vector3.down())
	local use_near_vomit = 0.35 <= down_dot and puke_distance_sq < action.near_vomit_distance

	if use_near_vomit then
		vomit_animation = attack_anims.near_vomit
		blackboard.near_vomit = true
	else
		vomit_animation = attack_anims.ranged_vomit
	end

	debug_print("PUKE_DISTANCE SQ", puke_distance_sq, "ANIMATION:", vomit_animation, "DIR:", puke_direction, "USE NEAR VOMIT:", use_near_vomit, "DOWN DOT:", down_dot)
	Managers.state.network:anim_event(unit, vomit_animation)

	blackboard.attack_started_at_t = t
	blackboard.puke_position = Vector3Box(puke_position)
	blackboard.puke_direction = Vector3Box(puke_direction)
	local bot_threats = action.bot_threats and (action.bot_threats[vomit_animation] or (action.bot_threats[1] and action.bot_threats))

	if bot_threats then
		local current_threat_index = 1
		local bot_threat = bot_threats[current_threat_index]
		local bot_threat_start_time = bot_threat.start_time
		blackboard.create_bot_threat_at_t = t + bot_threat_start_time
		blackboard.current_bot_threat_index = current_threat_index
		blackboard.bot_threats_data = bot_threats
	end

	local to_vomit_rotation = LocomotionUtils.look_at_position_flat(unit, puke_position)
	blackboard.attack_rotation = QuaternionBox(to_vomit_rotation)
	local locomotion = blackboard.locomotion_extension

	locomotion.set_wanted_rotation(locomotion, to_vomit_rotation)

	return true
end
BTVomitAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.attack_rotation = nil
	blackboard.attack_started_at_t = nil
	blackboard.keep_target = nil
	blackboard.puke_position = nil
	blackboard.puke_direction = nil
	blackboard.is_puking = nil
	blackboard.create_bot_threat_at_t = nil
	blackboard.current_bot_threat_index = nil
	blackboard.bot_threats_data = nil
	blackboard.attack_finished = nil
	blackboard.near_vomit = nil

	return 
end
BTVomitAction._calculate_oobb_collision = function (self, bot_threat, self_pos, self_rot)
	local width = bot_threat.width
	local range = bot_threat.range
	local height = bot_threat.height
	local offset_forward = bot_threat.offset_forward
	local offset_up = bot_threat.offset_up
	local half_width = width*0.5
	local half_range = range*0.5
	local half_height = height*0.5
	local size = Vector3(half_width, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward())*(offset_forward + half_range)
	local up = Vector3.up()*(offset_up + half_height)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end
BTVomitAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted then
		return "failed"
	end

	local target_unit = blackboard.target_unit
	local target_unit_status_extension = (ScriptUnit.has_extension(target_unit, "status_system") and ScriptUnit.extension(target_unit, "status_system")) or nil

	if t < blackboard.anim_locked then
		if blackboard.is_puking then
			self.player_vomit_hit_check(self, unit, blackboard)
		elseif t < blackboard.rotation_time and not target_unit_status_extension.get_is_dodging(target_unit_status_extension) and not target_unit_status_extension.is_invisible(target_unit_status_extension) then
			local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)
			local locomotion = blackboard.locomotion_extension

			locomotion.set_wanted_rotation(locomotion, rotation)

			local puke_position, puke_distance_sq, puke_direction = self._get_vomit_position(self, unit, blackboard)

			if puke_position and puke_direction then
				blackboard.puke_position:store(puke_position)
				blackboard.puke_direction:store(puke_direction)
			end
		else
			local puke_direction_box = blackboard.puke_direction
			local puke_direction_flat = Vector3(puke_direction_box.x, puke_direction_box.y, 0)
			local rotation = Quaternion.look(puke_direction_flat)
			local locomotion = blackboard.locomotion_extension

			locomotion.set_wanted_rotation(locomotion, rotation)
		end

		local create_bot_threat_at_t = blackboard.create_bot_threat_at_t

		if create_bot_threat_at_t and create_bot_threat_at_t < t then
			local action = blackboard.action
			local bot_threats = blackboard.bot_threats_data
			local current_bot_threat_index = blackboard.current_bot_threat_index
			local current_bot_threat = bot_threats[current_bot_threat_index]
			local bot_threat_duration = current_bot_threat.duration
			local unit_position = POSITION_LOOKUP[unit]
			local attack_rotation = blackboard.attack_rotation:unbox()
			local obstacle_position, obstacle_rotation, obstacle_size = self._calculate_oobb_collision(self, current_bot_threat, unit_position, attack_rotation)

			Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, bot_threat_duration)

			local next_bot_threat_index = current_bot_threat_index + 1
			local next_bot_threat = bot_threats[next_bot_threat_index]

			if next_bot_threat then
				local attack_started_at_t = blackboard.attack_started_at_t
				blackboard.create_bot_threat_at_t = attack_started_at_t + next_bot_threat.start_time
				blackboard.current_bot_threat_index = next_bot_threat_index
			else
				blackboard.create_bot_threat_at_t = nil
				blackboard.current_bot_threat_index = nil
			end
		end

		return "running"
	end

	return "done"
end
BTVomitAction.player_vomit_hit_check = function (self, unit, blackboard)
	local troll_head_node = Unit.node(unit, "j_head")
	local troll_head_pos = Unit.world_position(unit, troll_head_node)
	local puke_pos = blackboard.puke_position:unbox()
	local offset_dir = Vector3.normalize(puke_pos - POSITION_LOOKUP[unit])*2
	local to_puke = (puke_pos + offset_dir) - troll_head_pos
	local puke_direction = Vector3.normalize(to_puke)
	local puke_distance = Vector3.length(to_puke)
	local physics_world = blackboard.physics_world
	local result = PhysicsWorld.linear_sphere_sweep(physics_world, troll_head_pos, puke_pos, 0.4, 10, "collision_filter", "filter_enemy_ray_projectile", "report_initial_overlap")

	if result then
		local num_hits = #result
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local actor = hit.actor
			local hit_unit = Actor.unit(actor)
			local unit_hit_is_player = DamageUtils.is_player_unit(hit_unit)

			if unit_hit_is_player then
				local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

				if not buff_extension.has_buff_type(buff_extension, "troll_bile_face") then
					buff_system.add_buff(buff_system, hit_unit, "bile_troll_vomit_face_base", unit)
				end
			end
		end
	end

	if script_data.debug_chaos_troll then
		QuickDrawer:line(troll_head_pos, troll_head_pos + to_puke, Color(255, 255, 0))
	end

	return 
end
BTVomitAction.create_aoe = function (self, unit, blackboard, action)
	local puke_pos = blackboard.puke_position:unbox()
	local dir = blackboard.puke_direction:unbox()
	local extension_init_data = {
		area_damage_system = {
			flow_dir = dir,
			liquid_template = (blackboard.near_vomit and "bile_troll_vomit_near") or "bile_troll_vomit",
			source_unit = unit
		}
	}
	local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, puke_pos)
	local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

	liquid_area_damage_extension.ready(liquid_area_damage_extension)

	return 
end
BTVomitAction.anim_cb_vomit = function (self, unit, blackboard)
	if Managers.state.network:game() then
		blackboard.is_puking = true

		BTVomitAction:create_aoe(unit, blackboard, blackboard.action)
	end

	return 
end

return 
