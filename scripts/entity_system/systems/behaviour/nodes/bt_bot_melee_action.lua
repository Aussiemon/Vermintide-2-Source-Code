require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTBotMeleeAction = class(BTBotMeleeAction, BTNode)
BTBotMeleeAction.init = function (self, ...)
	BTBotMeleeAction.super.init(self, ...)

	return 
end
BTBotMeleeAction.name = "BTBotMeleeAction"
local PATROL_PASSIVE_RANGE = 50
local DEFAULT_MAXIMAL_MELEE_RANGE = 5
local DEFAULT_ENEMY_HITBOX_RADIUS_APPROXIMATION = 0.5

local function check_angle(nav_world, target_position, start_direction, angle, distance)
	local direction = Quaternion.rotate(Quaternion(Vector3.up(), angle), start_direction)
	local check_pos = target_position - direction*distance
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, check_pos, 0.5, 0.5)

	if success then
		check_pos.z = altitude

		return true, check_pos
	else
		return false
	end

	return 
end

local function get_engage_pos(nav_world, target_unit_pos, engage_from, melee_distance)
	local start_direction = Vector3.normalize(Vector3.flat(engage_from))
	local success, pos = check_angle(nav_world, target_unit_pos, start_direction, 0, melee_distance)

	if success then
		return pos
	end

	local subdivisions_per_side = 3
	local angle_inc = math.pi/(subdivisions_per_side + 1)

	for i = 1, subdivisions_per_side, 1 do
		local angle = angle_inc*i
		success, pos = check_angle(nav_world, target_unit_pos, start_direction, angle, melee_distance)

		if success then
			return pos
		end

		success, pos = check_angle(nav_world, target_unit_pos, start_direction, -angle, melee_distance)

		if success then
			return pos
		end
	end

	success, pos = check_angle(nav_world, target_unit_pos, start_direction, math.pi, melee_distance)

	if success then
		return pos
	end

	return nil
end

BTBotMeleeAction.enter = function (self, unit, blackboard, t)
	blackboard.node_timer = t
	blackboard.melee = {
		engage_update_time = 0,
		engage_position_set = false,
		engage_change_time = 0,
		engaging = false,
		engage_position = Vector3Box(0, 0, 0)
	}
	local inventory_ext = blackboard.inventory_extension
	local wielded_slot_name = inventory_ext.get_wielded_slot_name(inventory_ext)
	local slot_data = inventory_ext.get_slot_data(inventory_ext, wielded_slot_name)
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	blackboard.wielded_item_template = item_template
	local input_ext = blackboard.input_extension
	local soft_aiming = true

	input_ext.set_aiming(input_ext, true, soft_aiming)

	return 
end
BTBotMeleeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.wielded_item_template = nil
	local input_ext = blackboard.input_extension

	input_ext.set_aiming(input_ext, false)

	if blackboard.melee.engaging then
		self._disengage(self, unit, t, blackboard)
	end

	return 
end
BTBotMeleeAction.run = function (self, unit, blackboard, t, dt)
	local done, evaluate = self._update_melee(self, unit, blackboard, dt, t)

	if done then
		return "done", "evaluate"
	else
		return "running", (evaluate and "evaluate") or nil
	end

	return 
end
BTBotMeleeAction._update_engage_position = function (self, unit, target_unit, blackboard, t, melee_range)
	local nav_world = blackboard.nav_world
	local self_position = POSITION_LOOKUP[unit]
	local target_unit_position = self._target_unit_position(self, self_position, target_unit, nav_world)
	local engage_position, engage_from, should_stop = nil
	local targeting_me, breed = self._is_targeting_me(self, unit, target_unit)
	local enemy_offset = target_unit_position - self_position
	local melee_distance = melee_range - 0.5
	local melee_distance_sq = melee_distance^2
	local target_locomotion_extension = ScriptUnit.has_extension(target_unit, "locomotion_system")

	if target_locomotion_extension then
		local target_velocity = target_locomotion_extension.current_velocity(target_locomotion_extension)
		local target_speed_sq = Vector3.length_squared(target_velocity)

		if 4 < target_speed_sq then
			melee_distance = 0
			melee_distance_sq = 0
		end
	end

	if breed and (not targeting_me or breed.bots_flank_while_targeted) and breed.bots_should_flank then
		local enemy_rot = Unit.local_rotation(target_unit, 0)
		local enemy_dir = Quaternion.forward(enemy_rot)

		if -0.25 < Vector3.dot(enemy_dir, enemy_offset) then
			engage_from = enemy_offset
		else
			local normalized_enemy_dir = Vector3.normalize(Vector3.flat(enemy_dir))
			local normalized_enemy_offset = Vector3.normalize(Vector3.flat(enemy_offset))
			local offset_angle = Vector3.flat_angle(-normalized_enemy_offset, normalized_enemy_dir)
			local new_angle = nil

			if 0 < offset_angle then
				new_angle = offset_angle + math.pi/8
			else
				new_angle = offset_angle - math.pi/8
			end

			local new_rot = Quaternion.multiply(Quaternion(Vector3.up(), -new_angle), enemy_rot)
			engage_from = -Quaternion.forward(new_rot)
		end

		engage_position = get_engage_pos(nav_world, target_unit_position, engage_from, melee_distance)
	elseif Vector3.distance_squared(self_position, target_unit_position) <= melee_distance_sq then
		engage_position = self_position
		should_stop = true
	else
		engage_position = get_engage_pos(nav_world, target_unit_position, enemy_offset, melee_distance)
	end

	if engage_position then
		local melee_bb = blackboard.melee
		local override_box = blackboard.navigation_destination_override
		local override_destination = override_box.unbox(override_box)
		local engage_pos_set = melee_bb.engage_position_set

		fassert(not engage_pos_set or Vector3.is_valid(override_destination))

		if not engage_pos_set or 0.01 < Vector3.distance_squared(engage_position, override_destination) then
			override_box.store(override_box, engage_position)

			melee_bb.engage_position_set = true
			melee_bb.stop_at_current_position = should_stop
		end

		local distance = Vector3.distance(self_position, engage_position)
		local min_dist = 3
		local max_dist = 7
		local interval = math.auto_lerp(min_dist, max_dist, 0.2, 2, math.clamp(distance, min_dist, max_dist))
		melee_bb.engage_update_time = t + interval
	end

	return 
end
local DEFAULT_ATTACK_META_DATA = {
	tap_attack = {
		arc = 0,
		penetrating = false,
		max_range = DEFAULT_MAXIMAL_MELEE_RANGE
	},
	hold_attack = {
		arc = 2,
		penetrating = true,
		max_range = DEFAULT_MAXIMAL_MELEE_RANGE
	}
}
BTBotMeleeAction._choose_attack = function (self, blackboard, target_unit)
	local num_enemies = #blackboard.proximite_enemies
	local outnumbered = 1 < num_enemies
	local massively_outnumbered = 3 < num_enemies
	local target_breed = Unit.get_data(target_unit, "breed")
	local target_armor = (target_breed and target_breed.armor_category) or 1
	local item_template = blackboard.wielded_item_template
	local weapon_meta_data = item_template.attack_meta_data or DEFAULT_ATTACK_META_DATA
	local best_utility = -1
	local best_attack_input, best_attack_meta_data = nil

	for attack_input, attack_meta_data in pairs(weapon_meta_data) do
		local utility = 0

		if outnumbered and attack_meta_data.arc == 1 then
			utility = utility + 1
		elseif attack_meta_data.no_damage and massively_outnumbered and 1 < attack_meta_data.arc then
			utility = utility + 2
		elseif not attack_meta_data.no_damage and ((outnumbered and 1 < attack_meta_data.arc) or (not outnumbered and attack_meta_data.arc == 0)) then
			utility = utility + 4
		end

		if target_armor ~= 2 or attack_meta_data.penetrating then
			utility = utility + 8
		end

		if best_utility < utility then
			best_utility = utility
			best_attack_input = attack_input
			best_attack_meta_data = attack_meta_data
		end
	end

	return best_attack_input, best_attack_meta_data
end
BTBotMeleeAction._is_in_melee_range = function (self, current_position, aim_position, melee_range)
	local melee_range_sq = melee_range^2

	return Vector3.distance_squared(aim_position, current_position) < melee_range_sq
end
BTBotMeleeAction._is_in_engage_range = function (self, self_unit, target_unit, nav_world, action_data, follow_pos)
	local engage_range_sq = nil
	local self_position = POSITION_LOOKUP[self_unit]

	if Vector3.distance_squared(follow_pos, self_position) < 25 then
		engage_range_sq = action_data.engage_range_near_follow_pos^2
	else
		engage_range_sq = action_data.engage_range^2
	end

	local target_unit_position = self._target_unit_position(self, self_position, target_unit, nav_world)

	return Vector3.distance_squared(self_position, target_unit_position) < engage_range_sq
end
BTBotMeleeAction._aim_position = function (self, target_unit, blackboard)
	local node = 0
	local target_breed = Unit.get_data(target_unit, "breed")
	local aim_node = (target_breed and (target_breed.bot_melee_aim_node or "j_spine")) or "rp_center"

	if Unit.has_node(target_unit, aim_node) then
		node = Unit.node(target_unit, aim_node)
	end

	return Unit.world_position(target_unit, node)
end
BTBotMeleeAction._target_unit_position = function (self, self_position, target_unit, nav_world)
	local target_unit_position = nil

	if self._tree_node.action_data.destroy_object then
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")
		local smart_object_id = nav_graph_system.get_smart_object_id(nav_graph_system, target_unit)

		if smart_object_id then
			local smart_objects = nav_graph_system.get_smart_objects(nav_graph_system, smart_object_id)
			local smart_object_data = smart_objects[1]
			local entrance_position = Vector3Aux.unbox(smart_object_data.pos1)
			local exit_position = Vector3Aux.unbox(smart_object_data.pos2)
			target_unit_position = math.closest_position(self_position, entrance_position, exit_position)
		else
			local node_name = "rp_center"
			local node = (Unit.has_node(target_unit, node_name) and Unit.node(target_unit, node_name)) or 0
			local node_position = Unit.world_position(target_unit, node)
			target_unit_position = LocomotionUtils.pos_on_mesh(nav_world, node_position, 0.5, 2) or node_position
		end
	else
		target_unit_position = POSITION_LOOKUP[target_unit]
	end

	return target_unit_position
end
BTBotMeleeAction._is_attacking_me = function (self, self_unit, enemy_unit)
	local ai_extension = ScriptUnit.has_extension(enemy_unit, "ai_system")

	if not ai_extension then
		return false
	end

	local bb = ai_extension.blackboard(ai_extension)
	local action = bb.action
	local unblockable = action and action.unblockable

	return not unblockable and ((bb.attacking_target == self_unit and not bb.attack_success and "attack") or (bb.special_attacking_target == self_unit and not bb.attack_success and "special_attack")), bb.breed
end
BTBotMeleeAction._is_targeting_me = function (self, self_unit, enemy_unit)
	local ai_extension = ScriptUnit.has_extension(enemy_unit, "ai_system")

	if not ai_extension then
		return false
	end

	local bb = ai_extension.blackboard(ai_extension)

	return bb.target_unit == self_unit, bb.breed
end
BTBotMeleeAction._allow_engage = function (self, self_unit, target_unit, blackboard, action_data, already_engaged, aim_position, follow_pos)
	local num_enemies = Managers.state.entity:system("ai_system").number_ordinary_aggroed_enemies
	local override_range_default = action_data.override_engage_range_to_follow_pos
	local horde_override_range = action_data.override_engage_range_to_follow_pos_horde
	local START_HORDE = 10
	local MAX_HORDE = 30
	local lerp_t = (num_enemies - START_HORDE)/(MAX_HORDE - START_HORDE)
	local override_range = nil

	if lerp_t <= 0 then
		override_range = override_range_default
	elseif 1 <= lerp_t then
		override_range = horde_override_range
	else
		override_range = math.lerp(override_range_default, horde_override_range, lerp_t*lerp_t)
	end

	local distance_to_follow_pos = Vector3.distance(aim_position, follow_pos)
	local fuzziness = (already_engaged and 3) or 0

	if override_range < distance_to_follow_pos - fuzziness then
		return false
	end

	local conflict_director = Managers.state.conflict
	local target_ally_unit = blackboard.target_ally_unit
	local follow_unit = (blackboard.target_ally_need_type and target_ally_unit) or blackboard.ai_bot_group_extension.data.follow_unit

	if follow_unit then
		local self_segment = conflict_director.get_player_unit_segment(conflict_director, self_unit)
		local target_segment = conflict_director.get_player_unit_segment(conflict_director, follow_unit)

		if self_segment and target_segment and self_segment < target_segment then
			return false
		end
	end

	local ai_extension = blackboard.ai_extension

	if blackboard.target_ally_needs_aid then
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
		local is_prioritized_ally = ai_bot_group_system.is_prioritized_ally(ai_bot_group_system, self_unit, target_ally_unit)

		if is_prioritized_ally then
			local target_ai_extension = ScriptUnit.has_extension(target_unit, "ai_system")

			if not target_ai_extension then
				return false
			end

			if not ai_extension.within_aid_range(ai_extension, blackboard) then
				return false
			end

			local force_aid = blackboard.force_aid
			local health = ScriptUnit.extension(target_ally_unit, "health_system"):current_health_percent()
			local target_blackboard = target_ai_extension.blackboard(target_ai_extension)
			local target_breed = target_blackboard.breed
			local threat_to_aid = 0.3 < health and target_blackboard.target_unit == self_unit and (not force_aid or target_breed.is_bot_aid_threat)

			if not threat_to_aid then
				return false
			end

			local target_in_proximity = false
			local proximite_enemies = blackboard.proximite_enemies
			local num_proximite_enemies = #proximite_enemies

			for i = 1, num_proximite_enemies, 1 do
				local enemy_unit = proximite_enemies[i]

				if enemy_unit == target_unit then
					target_in_proximity = true

					break
				end
			end

			if not target_in_proximity then
				return false
			end
		end
	end

	local priority_target = blackboard.priority_target_enemy

	if target_unit ~= priority_target then
		if priority_target then
			return false
		end

		local ai_groups = Managers.state.entity:system("ai_group_system").groups
		local self_travel_dist = conflict_director.get_player_unit_travel_distance(conflict_director, self_unit) or -math.huge

		for _, group in pairs(ai_groups) do
			if group.template == "storm_vermin_formation_patrol" and group.state ~= "in_combat" then
				local patrol_travel_dist = group.main_path_travel_dist

				if not patrol_travel_dist or self_travel_dist < patrol_travel_dist + PATROL_PASSIVE_RANGE then
					return false
				end
			end
		end
	end

	local stay_near_player, max_allowed_distance = ai_extension.should_stay_near_player(ai_extension)

	if stay_near_player and max_allowed_distance < distance_to_follow_pos then
		return false
	end

	local in_total_darkness = Managers.state.entity:system("darkness_system"):is_in_darkness(POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0), DarknessSystem.TOTAL_DARKNESS_THRESHOLD)

	if in_total_darkness and target_unit ~= blackboard.breakable_object and target_unit ~= priority_target and target_unit ~= blackboard.urgent_target_enemy and target_unit ~= blackboard.opportunity_target_enemy and not blackboard.aggressive_mode and not blackboard.target_ally_needs_aid then
		return false
	end

	return true
end
BTBotMeleeAction._calculate_melee_range = function (self, target_unit, attack_meta_data)
	local attack_range = attack_meta_data.max_range
	local breed = Unit.get_data(target_unit, "breed")
	local target_hitbox_radius_approximation = (breed and (breed.bot_hitbox_radius_approximation or DEFAULT_ENEMY_HITBOX_RADIUS_APPROXIMATION)) or 0
	local melee_range = attack_range + target_hitbox_radius_approximation

	return melee_range
end
BTBotMeleeAction._update_melee = function (self, unit, blackboard, dt, t)
	local action_data = self._tree_node.action_data
	local target_unit = (action_data.destroy_object and blackboard.breakable_object) or blackboard.target_unit

	if not AiUtils.unit_alive(target_unit) then
		return true
	end

	local aim_position = self._aim_position(self, target_unit, blackboard)
	local input_ext = blackboard.input_extension

	input_ext.set_aim_position(input_ext, aim_position)

	local wants_engage, eval_timer = nil
	local current_position = blackboard.first_person_extension:current_position()
	local follow_pos = (blackboard.follow and blackboard.follow.target_position:unbox()) or current_position
	local attack_input, attack_meta_data = self._choose_attack(self, blackboard, target_unit)
	local melee_range = self._calculate_melee_range(self, target_unit, attack_meta_data)
	local attack_performed = false
	local melee_bb = blackboard.melee
	local already_engaged = melee_bb.engaging

	if self._is_in_melee_range(self, current_position, aim_position, melee_range, blackboard) then
		if not self._defend(self, unit, blackboard, target_unit, input_ext, t, true) then
			self._attack(self, input_ext, attack_input)

			attack_performed = true
		end

		wants_engage = blackboard.aggressive_mode or (melee_bb.engaging and t - melee_bb.engage_change_time < 5)
		eval_timer = 2
	elseif self._is_in_engage_range(self, unit, target_unit, blackboard.nav_world, action_data, follow_pos) then
		self._defend(self, unit, blackboard, target_unit, input_ext, t, false)

		wants_engage = true
		eval_timer = 1
	else
		self._defend(self, unit, blackboard, target_unit, input_ext, t, false)

		wants_engage = melee_bb.engaging and t - melee_bb.engage_change_time <= 0
		eval_timer = 3
	end

	local engage = wants_engage and self._allow_engage(self, unit, target_unit, blackboard, action_data, already_engaged, aim_position, follow_pos)

	if engage and not already_engaged then
		self._engage(self, t, blackboard)

		already_engaged = true
	elseif not engage and already_engaged then
		self._disengage(self, unit, t, blackboard)

		already_engaged = false
	end

	if already_engaged and (not melee_bb.engage_update_time or melee_bb.engage_update_time < t) and not action_data.do_not_update_engage_position then
		self._update_engage_position(self, unit, target_unit, blackboard, t, melee_range)
	end

	if script_data.ai_bots_weapon_debug then
		self._debug_draw_melee_range(self, unit, target_unit, blackboard, current_position, aim_position, attack_input, attack_meta_data, attack_performed)
	end

	return false, self._evaluation_timer(self, blackboard, t, eval_timer)
end
local DEFAULT_DEFENSE_META_DATA = {
	push = "medium"
}
BTBotMeleeAction._defend = function (self, unit, blackboard, target_unit, input_ext, t, in_melee_range)
	if self._is_attacking_me(self, unit, target_unit) then
		local defense_meta_data = blackboard.wielded_item_template.defense_meta_data or DEFAULT_DEFENSE_META_DATA
		local num_enemies = #blackboard.proximite_enemies
		local current_fatigue, max_fatigue = ScriptUnit.extension(unit, "status_system"):current_fatigue_points()
		local stamina_left = max_fatigue - current_fatigue
		local push_type = defense_meta_data.push
		local low_stamina = (push_type == "light" and stamina_left <= 2) or stamina_left <= 3
		local breed = Unit.get_data(target_unit, "breed")

		if not in_melee_range or not breed or breed.boss or (breed.armor_category == 2 and push_type ~= "heavy") or (push_type == "light" and 2 < num_enemies) or low_stamina then
			input_ext.defend(input_ext)
		else
			input_ext.melee_push(input_ext)
		end

		return true
	else
		return false
	end

	return 
end
BTBotMeleeAction._attack = function (self, input_ext, attack_input)
	input_ext[attack_input](input_ext)

	return 
end
BTBotMeleeAction._evaluation_timer = function (self, blackboard, t, timer_value)
	local evaluate = timer_value < t - blackboard.node_timer

	if evaluate then
		blackboard.node_timer = t

		return true
	else
		return false
	end

	return 
end
BTBotMeleeAction._disengage = function (self, unit, t, blackboard, position)
	local bb = blackboard.melee
	bb.engaging = false
	bb.engage_change_time = t

	if blackboard.follow then
		bb.engage_position_set = false
	end

	return 
end
BTBotMeleeAction._engage = function (self, t, blackboard)
	local bb = blackboard.melee
	bb.engaging = true
	bb.engage_change_time = t

	return 
end
BTBotMeleeAction._debug_draw_melee_range = function (self, unit, target_unit, blackboard, current_position, aim_position, attack_input, attack_meta_data, attack_performed)
	local attack_max_range = attack_meta_data.max_range
	local melee_range = self._calculate_melee_range(self, target_unit, attack_meta_data)
	local in_range = self._is_in_melee_range(self, current_position, aim_position, melee_range, blackboard)
	local debug_color = (in_range and Colors.get("green")) or Colors.get("red")

	QuickDrawer:sphere(current_position, attack_max_range, debug_color)

	local offset = Vector3(0, 0, 2.5)
	local viewport_name = "player_1"
	local head_node = 0
	local color_table = (attack_performed and Colors.get_table("green")) or Colors.get_table("red")
	local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
	local text_size = 0.25
	local text = string.format("%s %sm", attack_input, attack_max_range)
	local category = "bot_weapon_debug"
	local debug_text_manager = Managers.state.debug_text

	debug_text_manager.clear_unit_text(debug_text_manager, unit, category)
	debug_text_manager.output_unit_text(debug_text_manager, text, text_size, unit, head_node, offset, 0.5, category, color_vector, viewport_name)

	offset = offset + Vector3.up()*text_size
	text = blackboard.wielded_item_template.name
	offset = offset + Vector3.up()*text_size
	text = blackboard.wielded_item_template.name

	debug_text_manager.output_unit_text(debug_text_manager, text, text_size, unit, head_node, offset, 0.5, category, color_vector, viewport_name)

	return 
end

return 
