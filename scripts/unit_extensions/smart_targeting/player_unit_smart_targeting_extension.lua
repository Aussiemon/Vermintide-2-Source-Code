local POSITION_LOOKUP = POSITION_LOOKUP
local TARGETING_DEBUG = false
local USE_PREDICTION = false
local DISABLED = false
local CLICK_TIME = 0.1
local REACTION_FRAMES = 8
local OPTIMIZED_AIM_ASSIST = true
PlayerUnitSmartTargetingExtension = class(PlayerUnitSmartTargetingExtension)

PlayerUnitSmartTargetingExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.world = extension_init_context.world
	self.conflict_manager = Managers.state.conflict
	self.player = extension_init_data.player
	self.targeting_data = {}
	self.move_time = 0
	self.clicking = false
	self.target_unit = nil
	self._gui = World.create_screen_gui(self.world, "immediate")
	self.use_score_modifiers_1 = true
	self.score_modifiers_1 = {}
	self.score_modifiers_2 = {}
end

PlayerUnitSmartTargetingExtension.extensions_ready = function (self)
	local unit = self.unit
	self.first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	self.status_extension = ScriptUnit.extension(unit, "status_system")
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.input_extension = ScriptUnit.extension(unit, "input_system")
end

local nearby_ai_units = {}
local nearby_ai_positions = {}
local nearby_ai_distances = {}

PlayerUnitSmartTargetingExtension.update_opt2 = function (self, unit, input, dt, context, t)
	if DISABLED then
		return
	end

	table.clear(self.targeting_data)

	local get_data_func = Unit.get_data
	local extension_func = ScriptUnit.extension
	local math_min = math.min
	local res_w = RESOLUTION_LOOKUP.res_w
	local res_h = RESOLUTION_LOOKUP.res_h
	local aim_screen_pos_x = res_w / 2
	local aim_screen_pos_y = res_h / 2
	local min_size = 8 * res_w / 1280
	local input_extension = self.input_extension
	local first_person_extension = self.first_person_extension
	local inventory_extension = self.inventory_extension
	local camera = self:_get_player_camera()
	local own_position = first_person_extension:current_position()
	local look_rot = first_person_extension:current_rotation()
	local look_dir = Quaternion.forward(look_rot)
	local look_right = Quaternion.right(look_rot)
	local action_settings = nil
	local equipment = inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

	if Unit.alive(weapon_unit) then
		local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

		if weapon_extension:has_current_action() then
			action_settings = weapon_extension:get_current_action_settings()
		end
	end

	local weapon_template = inventory_extension:get_wielded_slot_item_template()
	local aim_assist_settings = nil
	aim_assist_settings = action_settings and action_settings.aim_assist_settings and action_settings.aim_assist_settings or weapon_template and weapon_template.aim_assist_settings
	local loaded_projectile_settings = inventory_extension:get_loaded_projectile_settings()
	local projectile_speed = loaded_projectile_settings and loaded_projectile_settings.speed or 0
	local drop_multiplier = loaded_projectile_settings and loaded_projectile_settings.drop_multiplier or 0
	local debug_gui = TARGETING_DEBUG and self._gui or nil
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local auto_aim_disabled = not Application.user_setting("gamepad_auto_aim_enabled")

	if not aim_assist_settings or gamepad_active and auto_aim_disabled then
		return
	end

	local max_range = aim_assist_settings.max_range
	local effective_max_range = aim_assist_settings.effective_max_range
	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase

	table.clear(nearby_ai_units)
	table.clear(nearby_ai_positions)
	table.clear(nearby_ai_distances)

	local num_nearby_ai_units = EngineOptimized.smart_targeting_query(ai_broadphase, own_position, look_dir, 1.5, max_range, 0.1, 0.2, 0.8, 5, nearby_ai_units, nearby_ai_positions, nearby_ai_distances)
	local highest_score = 0
	local target_unit = nil
	local aim_score = 0
	local score_modifiers, previous_score_modifiers = nil

	if self.use_score_modifiers_1 then
		score_modifiers = self.score_modifiers_1
		previous_score_modifiers = self.score_modifiers_2
	else
		score_modifiers = self.score_modifiers_2
		previous_score_modifiers = self.score_modifiers_1
	end

	local targets_within_range = false
	local range_scalar_at_effective_max_range = 0.8

	for i = 1, num_nearby_ai_units do
		repeat
			local unit = nearby_ai_units[i]

			if not AiUtils.unit_alive(unit) then
				break
			end

			local breed = get_data_func(unit, "breed")
			local smart_targeting_width = breed.smart_targeting_width

			if breed.no_autoaim or not smart_targeting_width then
				break
			end

			targets_within_range = true
			local breed_weapon_scalar = aim_assist_settings.breed_scalars[breed.name] or 1

			if breed_weapon_scalar == 0 then
				break
			end

			local target_pos = nearby_ai_positions[i]
			local distance = nearby_ai_distances[i]
			local smart_targeting_outer_width = breed.smart_targeting_outer_width or smart_targeting_width * 2
			local smart_targeting_height_multiplier = breed.smart_targeting_height_multiplier or 1
			local locomotion = extension_func(unit, "locomotion_system")
			local locomotion_velocity = locomotion:current_velocity()
			local aim_scalar = EngineOptimized.smart_targeting_optimized(camera, target_pos, look_right, distance, effective_max_range, range_scalar_at_effective_max_range, max_range, min_size, aim_screen_pos_x, aim_screen_pos_y, smart_targeting_width, smart_targeting_outer_width, smart_targeting_height_multiplier, (projectile_speed or 0) * 0.01, drop_multiplier, locomotion_velocity, debug_gui)
			local score_modifier = previous_score_modifiers[unit] or 0.1
			local score = breed_weapon_scalar * aim_scalar * score_modifier

			if highest_score < score then
				highest_score = score
				target_unit = unit
				aim_score = aim_scalar
			end

			if score > 0 then
				score_modifiers[unit] = math_min(score_modifier + dt * 2, 1)
			end
		until true
	end

	table.clear(previous_score_modifiers)

	self.use_score_modifiers_1 = not self.use_score_modifiers_1
	local target_position = nil

	if target_unit then
		local visible_target, aim_position = self:get_target_visibility_and_aim_position(target_unit, own_position, aim_assist_settings)
		target_position = aim_position

		if not visible_target then
			target_unit, aim_score = nil
			target_position = nil
		end
	end

	local targeting_data = self.targeting_data
	targeting_data.unit = target_unit
	targeting_data.aim_score = aim_score

	if target_position then
		targeting_data.target_position = target_position
	end

	targeting_data.targets_within_range = targets_within_range
end

PlayerUnitSmartTargetingExtension.update = function (self, unit, input, dt, context, t)
	if OPTIMIZED_AIM_ASSIST then
		self:update_opt2(unit, input, dt, context, t)

		return
	end

	if DISABLED then
		return
	end

	table.clear(self.targeting_data)

	local node_func = Unit.node
	local world_pos_func = Unit.world_position
	local world_to_screen_func = Camera.world_to_screen
	local get_data_func = Unit.get_data
	local right_func = Quaternion.right
	local forward_func = Quaternion.forward
	local length_func = Vector3.length
	local extension_func = ScriptUnit.extension
	local flat_func = Vector3.flat
	local dot_func = Vector3.dot
	local normalize_func = Vector3.normalize
	local res_w = RESOLUTION_LOOKUP.res_w
	local res_h = RESOLUTION_LOOKUP.res_h
	local aim_screen_pos_x = res_w / 2
	local aim_screen_pos_y = res_h / 2
	local input_extension = self.input_extension
	local first_person_extension = self.first_person_extension
	local inventory_extension = self.inventory_extension
	local camera = self:_get_player_camera()
	local own_position = first_person_extension:current_position()
	local look_rot = first_person_extension:current_rotation()
	local look_dir = forward_func(look_rot)
	local action_settings = nil
	local equipment = inventory_extension:equipment()
	local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

	if Unit.alive(weapon_unit) then
		local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

		if weapon_extension:has_current_action() then
			action_settings = weapon_extension:get_current_action_settings()
		end
	end

	local aim_assist_settings = nil
	aim_assist_settings = action_settings and action_settings.aim_assist_settings and action_settings.aim_assist_settings or weapon_template and weapon_template.aim_assist_settings
	local weapon_template = inventory_extension:get_wielded_slot_item_template()
	local loaded_projectile_settings = inventory_extension:get_loaded_projectile_settings()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local auto_aim_disabled = not Application.user_setting("gamepad_auto_aim_enabled")

	if not aim_assist_settings or gamepad_active and auto_aim_disabled then
		return
	end

	local max_range = aim_assist_settings.max_range
	local effective_max_range = aim_assist_settings.effective_max_range
	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase

	table.clear(nearby_ai_units)

	local num_nearby_ai_units = Broadphase.query(ai_broadphase, own_position, max_range, nearby_ai_units)
	local highest_score = 0
	local target_unit = nil
	local aim_score = 0
	local score_modifiers, previous_score_modifiers = nil

	if self.use_score_modifiers_1 then
		score_modifiers = self.score_modifiers_1
		previous_score_modifiers = self.score_modifiers_2
	else
		score_modifiers = self.score_modifiers_2
		previous_score_modifiers = self.score_modifiers_1
	end

	local targets_within_range = false

	for i = 1, num_nearby_ai_units do
		repeat
			local unit = nearby_ai_units[i]

			if not AiUtils.unit_alive(unit) then
				break
			end

			local breed = get_data_func(unit, "breed")
			local smart_targeting_width = breed.smart_targeting_width

			if breed.no_autoaim or not smart_targeting_width then
				break
			end

			targets_within_range = true
			local breed_weapon_scalar = aim_assist_settings.breed_scalars[breed.name] or 1

			if breed_weapon_scalar == 0 then
				break
			end

			local node = node_func(unit, "j_hips")
			local target_pos = world_pos_func(unit, node)
			local diff = target_pos - own_position
			local dot = dot_func(look_dir, normalize_func(diff))

			if dot < 0.5 then
				break
			end

			local range_scalar = 1
			local range_scalar_at_effective_max_range = 0.8
			local distance = length_func(diff)

			if distance < 1.5 then
				break
			elseif distance <= effective_max_range then
				range_scalar = (1 - distance / effective_max_range) * (1 - range_scalar_at_effective_max_range) + range_scalar_at_effective_max_range
			else
				range_scalar = (1 - (distance - effective_max_range) / (max_range - effective_max_range)) * range_scalar_at_effective_max_range
			end

			local smart_targeting_outer_width = breed.smart_targeting_outer_width or smart_targeting_width * 2
			local smart_targeting_height_multiplier = breed.smart_targeting_height_multiplier or 1
			local locomotion = extension_func(unit, "locomotion_system")
			local projectile_speed = loaded_projectile_settings and loaded_projectile_settings.speed
			local offset = Vector3.zero()

			if projectile_speed then
				offset = flat_func(locomotion:current_velocity()) * distance / (projectile_speed * 0.01)
				offset.z = offset.z + distance * (loaded_projectile_settings.drop_multiplier or 0)
			end

			local right_pos = target_pos + right_func(look_rot) * smart_targeting_width + offset
			local right_pos_outer = target_pos + right_func(look_rot) * smart_targeting_outer_width + offset
			local hips_screen_pos = world_to_screen_func(camera, target_pos + offset)
			local right_screen_pos = world_to_screen_func(camera, right_pos)
			local right_screen_outer_pos = world_to_screen_func(camera, right_pos_outer)
			local min_size = 8 * res_w / 1280
			local half_width = math.max(length_func(right_screen_pos - hips_screen_pos), min_size)
			local half_width_outer = math.max(length_func(right_screen_outer_pos - hips_screen_pos), min_size * smart_targeting_outer_width / smart_targeting_width)
			local half_height = half_width * smart_targeting_height_multiplier
			local outer_boundary_increase = math.abs(half_width_outer - half_width)
			local left_x = hips_screen_pos.x - half_width
			local right_x = hips_screen_pos.x + half_width
			local bottom_y = hips_screen_pos.y - half_height
			local top_y = hips_screen_pos.y + half_height
			local outer_left_x = left_x - outer_boundary_increase
			local outer_right_x = right_x + outer_boundary_increase
			local outer_bottom_y = bottom_y - outer_boundary_increase
			local outer_top_y = top_y + outer_boundary_increase

			if TARGETING_DEBUG then
				Gui.rect(self._gui, Vector3(left_x, bottom_y, 800), Vector2(half_width * 2, half_height * 2), Color(90, 0, 200, 200))
				Gui.rect(self._gui, Vector3(outer_left_x, outer_bottom_y, 800), Vector2(outer_right_x - outer_left_x, outer_top_y - outer_bottom_y), Color(90, 200, 200, 0))
			end

			local x_scalar = 0
			local y_scalar = 0

			if outer_left_x < aim_screen_pos_x and aim_screen_pos_x < outer_right_x and outer_bottom_y < aim_screen_pos_y and aim_screen_pos_y < outer_top_y then
				if aim_screen_pos_x <= hips_screen_pos.x then
					x_scalar = math.min((aim_screen_pos_x - outer_left_x) / outer_boundary_increase, 1)
				else
					x_scalar = math.min((outer_right_x - aim_screen_pos_x) / outer_boundary_increase, 1)
				end

				if aim_screen_pos_y <= hips_screen_pos.y then
					y_scalar = math.min((aim_screen_pos_y - outer_bottom_y) / outer_boundary_increase, 1)
				else
					y_scalar = math.min((outer_top_y - aim_screen_pos_y) / outer_boundary_increase, 1)
				end
			end

			local score_modifier = previous_score_modifiers[unit] or 0.1
			local aim_scalar = x_scalar * y_scalar
			local score = breed_weapon_scalar * aim_scalar * range_scalar * score_modifier

			if highest_score < score then
				highest_score = score
				target_unit = unit
				aim_score = aim_scalar
			end

			if score > 0 then
				score_modifiers[unit] = math.min(score_modifier + dt * 2, 1)
			end
		until true
	end

	table.clear(previous_score_modifiers)

	self.use_score_modifiers_1 = not self.use_score_modifiers_1
	local target_position = nil

	if target_unit then
		local visible_target, aim_position = self:get_target_visibility_and_aim_position(target_unit, own_position, aim_assist_settings)
		target_position = aim_position

		if not visible_target then
			target_unit, aim_score = nil
			target_position = nil
		end
	end

	local targeting_data = self.targeting_data
	targeting_data.unit = target_unit
	targeting_data.aim_score = aim_score
	targeting_data.target_position = target_position
	targeting_data.targets_within_range = targets_within_range
end

PlayerUnitSmartTargetingExtension._get_player_camera = function (self)
	local player = self.player
	local viewport_name = player.viewport_name
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)

	return camera
end

PlayerUnitSmartTargetingExtension.get_target_visibility_and_aim_position = function (self, target_unit, own_position, aim_assist_settings)
	local target_node_name = aim_assist_settings.target_node or "j_spine1"
	local target_node = Unit.node(target_unit, target_node_name)
	local target_node_pos = Unit.world_position(target_unit, target_node)
	local hips_node = Unit.node(target_unit, "j_hips")
	local hips_pos = Unit.world_position(target_unit, hips_node)
	local spine_direction = Vector3.normalize(target_node_pos - own_position)
	local spine_distance = Vector3.length(target_node_pos - own_position)
	local hips_direction = Vector3.normalize(hips_pos - own_position)
	local hips_distance = Vector3.length(hips_pos - own_position)
	local physics_world = World.physics_world(self.world)
	local hit = PhysicsWorld.immediate_raycast(physics_world, own_position, spine_direction, spine_distance, "closest", "collision_filter", "filter_ray_aim_assist")
	local visible_target = not hit
	local target_position = target_node_pos

	if not visible_target then
		local hit = PhysicsWorld.immediate_raycast(physics_world, own_position, hips_direction, hips_distance, "closest", "collision_filter", "filter_ray_aim_assist")
		visible_target = not hit
		target_position = hips_pos
	end

	return visible_target, target_position
end

PlayerUnitSmartTargetingExtension.get_targeting_data = function (self)
	return self.targeting_data
end
