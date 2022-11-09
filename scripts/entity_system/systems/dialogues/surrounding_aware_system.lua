local RPCS = {}
local extensions = {
	"LookatTargetExtension",
	"SurroundingObserverExtension",
	"SurroundingObserverHuskExtension"
}
SurroundingAwareSystem = class(SurroundingAwareSystem, ExtensionSystemBase)

SurroundingAwareSystem.init = function (self, entity_system_creation_context, system_name)
	local entity_manager = entity_system_creation_context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.world = entity_system_creation_context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.unit_storage = entity_system_creation_context.unit_storage
	self.game = Managers.state.network:game()
	self.is_server = entity_system_creation_context.is_server
	self.unit_input_data = {}
	self.unit_extension_data = {}
	self.observers = {}
	self.broadphase = Broadphase(math.max(DialogueSettings.max_view_distance, DialogueSettings.max_hear_distance, DialogueSettings.discover_enemy_attack_distance), 256)
	self.event_array = pdArray.new()
	self.seen_recently = {}
	self.seen_observers = {}
	self.current_observer_unit = nil
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
	GarbageLeakDetector.register_object(self, "surrounding_aware_system")
end

SurroundingAwareSystem.destroy = function (self)
	for unit, ext in pairs(self.unit_extension_data) do
		Broadphase.remove(self.broadphase, ext.broadphase_id)
	end

	self.network_event_delegate:unregister(self)
	table.clear(self)
end

SurroundingAwareSystem.add_event = function (unit, event_name, distance, ...)
	distance = distance or DialogueSettings.default_hear_distance
	local input = ScriptUnit.extension_input(unit, "surrounding_aware_system")
	local event_array = input.event_array
	local num_args = select("#", ...)
	local array_data, event_array_size = pdArray.data(event_array)

	fassert(type(event_name) == "string", "First argument to add_event must be an event-name.")
	fassert(type(distance) == "number", "Second argument to add_event must be distance.")
	fassert(num_args % 2 == 0, "Arguments must be set by key, value-pairs. Thus num args must be an even number.")
	pack_index[num_args + 4](array_data, event_array_size + 1, num_args, unit, event_name, distance, ...)

	local new_size = event_array_size + num_args + 4

	pdArray.set_size(event_array, new_size)
end

SurroundingAwareSystem.add_system_event = function (self, unit, event_name, distance, ...)
	distance = distance or DialogueSettings.default_hear_distance
	local event_array = self.event_array
	local num_args = select("#", ...)
	local array_data, event_array_size = pdArray.data(event_array)

	fassert(type(event_name) == "string", "First argument to add_event must be an event-name.")
	fassert(type(distance) == "number", "Second argument to add_event must be distance.")
	fassert(num_args % 2 == 0, "Arguments must be set by key, value-pairs. Thus num args must be an even number.")
	pack_index[num_args + 4](array_data, event_array_size + 1, num_args, unit, event_name, distance, ...)

	local new_size = event_array_size + num_args + 4

	pdArray.set_size(event_array, new_size)
end

local dummy_input = {}

SurroundingAwareSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {
		input = MakeTableStrict({
			event_array = self.event_array
		})
	}

	ScriptUnit.set_extension(unit, "surrounding_aware_system", extension, dummy_input)

	self.unit_input_data[unit] = extension.input
	self.unit_extension_data[unit] = extension
	extension.broadphase_id = Broadphase.add(self.broadphase, unit, Unit.world_position(unit, 0), 0.5)

	if extension_name == "SurroundingObserverExtension" or extension_name == "SurroundingObserverHuskExtension" then
		extension.view_angle = 11.25
		extension.view_angle_rad = math.degrees_to_radians(extension.view_angle)
		extension.last_lookat_trigger = 0
		extension.view_distance = DialogueSettings.observer_view_distance
		extension.view_distance_sq = extension.view_distance^2
		self.observers[unit] = extension
	else
		extension.has_been_seen = false
		extension.is_lookat_object = true
		extension.view_distance = Unit.get_data(unit, "view_distance") or DialogueSettings.default_view_distance
		extension.view_distance_sq = extension.view_distance^2
	end

	return extension
end

SurroundingAwareSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name ~= "SurroundingObserverExtension" then
		if extension_name == "SurroundingObserverHuskExtension" then
		elseif ScriptUnit.has_extension(unit, "pickup_system") then
			local extension = ScriptUnit.extension(unit, "surrounding_aware_system")
			extension.collision_filter = "filter_lookat_pickup_object_ray"
		end
	end
end

SurroundingAwareSystem.on_remove_extension = function (self, unit, extension_name)
	Broadphase.remove(self.broadphase, self.unit_extension_data[unit].broadphase_id)

	self.unit_input_data[unit] = nil
	self.unit_extension_data[unit] = nil

	if extension_name == "SurroundingObserverExtension" or extension_name == "SurroundingObserverHuskExtension" then
		self.observers[unit] = nil
		local seen_observers = self.seen_observers
		local previous_seen_observer = seen_observers[unit]
		local previous_bot_extension = previous_seen_observer and ScriptUnit.has_extension(previous_seen_observer, "ai_system")

		if previous_bot_extension then
			previous_bot_extension:set_seen_by_player(false, unit)
		end

		seen_observers[unit] = nil

		for player_unit, observer_unit in pairs(seen_observers) do
			if observer_unit == unit then
				seen_observers[player_unit] = nil
			end
		end
	end

	ScriptUnit.remove_extension(unit, "surrounding_aware_system")
end

SurroundingAwareSystem.update = function (self, context, t)
	self:update_seen_recently(context, t)
	self:update_lookat(context, t)
	self:update_events(context, t)
end

local function check_raycast_center(physics_world, unit, target, ray_position, ray_direction, ray_length, collision_filter)
	if Vector3.length(ray_direction) == 0 then
		return true
	end

	local hits = PhysicsWorld.immediate_raycast(physics_world, ray_position, ray_direction, ray_length, "all", "types", "both", "collision_filter", collision_filter or "filter_lookat_object_ray")

	if hits then
		local num_hits = #hits

		for i = 1, num_hits, 1 do
			local hit_data = hits[i]
			local hit_unit = Actor.unit(hit_data[4])

			if hit_unit ~= unit and hit_unit ~= target then
				return false
			end
		end
	end

	return true
end

local function is_in_range(observer_position, target_position, observer_forward, view_distance_sq, view_angle_rad)
	local observer_to_target_vector = target_position - observer_position
	local observer_target_direction = Vector3.normalize(observer_to_target_vector)
	local distance_squared = math.max(0.1, Vector3.length_squared(observer_to_target_vector))

	if view_distance_sq < distance_squared then
		return false, observer_to_target_vector, observer_target_direction, nil, nil
	end

	local distance_det = view_distance_sq / (2 * distance_squared)
	local forward_dot = Vector3.dot(observer_forward, observer_target_direction)
	local angle = math.acos(forward_dot)
	local max_angle = view_angle_rad * distance_det

	if angle >= max_angle then
		return false, observer_to_target_vector, observer_target_direction, angle, max_angle
	end

	return true, observer_to_target_vector, observer_target_direction, angle, max_angle
end

local BASE_ANGLE_MULTIPLIER = 10
local STICKINESS_MODIFIER = -1
local VIEW_ANGLE_STICKINESS = 1.5
local found_units = {}

SurroundingAwareSystem.update_lookat = function (self, context, t)
	local observers = self.observers

	if observers[self.current_observer_unit] == nil then
		self.current_observer_unit = nil
	end

	self.current_observer_unit = next(observers, self.current_observer_unit)
	local game = self.game
	local unit = self.current_observer_unit

	if game == nil or unit == nil then
		return
	end

	local POSITION_LOOKUP = POSITION_LOOKUP
	local Broadphase = Broadphase
	local broadphase = self.broadphase
	local extension = observers[unit]
	local observer_world_pos = POSITION_LOOKUP[unit]

	if not observer_world_pos then
		return
	end

	Broadphase.move(broadphase, extension.broadphase_id, observer_world_pos)

	local time_since_last = t - extension.last_lookat_trigger

	if time_since_last <= DialogueSettings.view_event_trigger_interval then
		return
	end

	local Unit = Unit
	local Vector3 = Vector3
	local math = math
	local Matrix4x4 = Matrix4x4
	local seen_recently = self.seen_recently
	local physics_world = self.physics_world
	local darkness_system = Managers.state.entity:system("darkness_system")
	local is_server = self.is_server
	local seen_observers = self.seen_observers
	local unit_storage = self.unit_storage
	local unit_id = unit_storage:go_id(unit)
	local observer_fpp = GameSession.game_object_field(game, unit_id, "aim_position")
	local observer_forward = GameSession.game_object_field(game, unit_id, "aim_direction")
	local dialogue_extension = ScriptUnit.extension_input(unit, "dialogue_system")
	local broadphase_size = DialogueSettings.max_view_distance * 0.5
	local broadphase_position = observer_fpp + observer_forward * broadphase_size
	local num_nearby = Broadphase.query(broadphase, broadphase_position, broadphase_size, found_units)
	local previous_seen_observer = seen_observers[unit]
	local closest_observer_utility = math.huge
	local closest_observer_unit = nil

	for i = 1, num_nearby, 1 do
		local target = found_units[i]
		found_units[i] = nil
		local saw_unit_recently = seen_recently[target]

		if target ~= unit and not saw_unit_recently then
			local lookat_target_ext = ScriptUnit.extension(target, "surrounding_aware_system")
			local is_lookat_object = lookat_target_ext.is_lookat_object

			if is_lookat_object or (is_server and observers[target]) then
				local target_center = nil

				if Unit.has_node(target, "j_spine") then
					local spine_node = Unit.node(target, "j_spine")
					target_center = Unit.world_position(target, spine_node)
				else
					local target_center_matrix = Unit.box(target)
					target_center = Matrix4x4.translation(target_center_matrix)
				end

				local view_distance_sq = lookat_target_ext.view_distance_sq
				local view_angle_rad = extension.view_angle_rad * ((target == previous_seen_observer and VIEW_ANGLE_STICKINESS) or 1)
				local in_range, observer_to_target_vector, observer_target_direction, angle, max_angle = is_in_range(observer_fpp, target_center, observer_forward, view_distance_sq, view_angle_rad)

				if in_range and not darkness_system:is_in_darkness(target_center) then
					local observer_to_target_length = Vector3.length(observer_to_target_vector)
					local collision_filter = lookat_target_ext.collision_filter
					local is_in_view = check_raycast_center(physics_world, unit, target, observer_fpp, observer_target_direction, observer_to_target_length, collision_filter)

					if is_lookat_object and is_in_view then
						lookat_target_ext.has_been_seen = true
						extension.last_lookat_trigger = t
						local event_data = FrameTable.alloc_table()
						event_data.item_tag = Unit.get_data(target, "lookat_tag") or Unit.debug_name(target)
						event_data.distance = observer_to_target_length

						dialogue_extension:trigger_dialogue_event("seen_item", event_data)

						seen_recently[target] = t
					elseif is_in_view then
						local angle_multiplier = BASE_ANGLE_MULTIPLIER + ((target == previous_seen_observer and STICKINESS_MODIFIER) or 0)
						local utility = angle * angle_multiplier + observer_to_target_length

						if closest_observer_utility > utility then
							closest_observer_unit = target
							closest_observer_utility = utility
						end
					end
				end
			end
		end
	end

	if is_server and closest_observer_unit ~= previous_seen_observer then
		local player_manager = Managers.player
		local player = player_manager:unit_owner(unit)
		local is_human = not player.bot_player

		if previous_seen_observer then
			local previous_bot_extension = ScriptUnit.has_extension(previous_seen_observer, "ai_system")

			if is_human and previous_bot_extension then
				previous_bot_extension:set_seen_by_player(false, unit)
			end
		end

		if closest_observer_unit then
			local current_bot_extension = ScriptUnit.has_extension(closest_observer_unit, "ai_system")

			if is_human and current_bot_extension then
				current_bot_extension:set_seen_by_player(true, unit, t)
			end
		end

		seen_observers[unit] = closest_observer_unit
	end
end

SurroundingAwareSystem.update_debug = function (self, context, t)
	if not script_data.dialogue_debug_lookat then
		return
	end

	local game = self.game
	local player = Managers.player:local_player()

	if not player or not player.player_unit or not game then
		return
	end

	local outside_color = Color(255, 255, 0, 0)
	local inside_color = Color(255, 0, 255, 0)
	local obscured_color = Color(255, 0, 255, 255)
	local debug_draw_units = FrameTable.alloc_table()
	local drawer = Managers.state.debug:drawer(debug_drawer_info)
	local broadphase = self.broadphase
	local physics_world = self.physics_world
	local darkness_system = Managers.state.entity:system("darkness_system")
	local player_unit = player.player_unit
	local extension = self.unit_extension_data[player_unit]
	local observers = self.observers
	local is_server = self.is_server
	local seen_observers = self.seen_observers
	local previous_seen_observer = seen_observers[player_unit]
	local unit_storage = self.unit_storage
	local unit_id = unit_storage:go_id(player_unit)
	local observer_fpp = GameSession.game_object_field(game, unit_id, "aim_position")
	local observer_forward = GameSession.game_object_field(game, unit_id, "aim_direction")
	local broadphase_size = DialogueSettings.max_view_distance * 0.5
	local observe_position = observer_fpp + observer_forward * broadphase_size
	local num_nearby = Broadphase.query(broadphase, observe_position, broadphase_size, found_units)

	drawer:sphere(observe_position, broadphase_size, Colors.get("light_blue"))
	drawer:vector(observer_fpp, observer_forward)

	for i = 1, num_nearby, 1 do
		local target = found_units[i]
		found_units[i] = nil

		if target ~= player_unit then
			local color = Color(255, 0, 0, 255)
			local debug_text = string.format("SAS: %q | ", Unit.debug_name(target))
			local lookat_target_ext = ScriptUnit.extension(target, "surrounding_aware_system")
			local is_lookat_object = lookat_target_ext.is_lookat_object

			if lookat_target_ext.is_lookat_object or (is_server and observers[target]) then
				local target_center = nil

				if Unit.has_node(target, "j_spine") then
					local spine_node = Unit.node(target, "j_spine")
					target_center = Unit.world_position(target, spine_node)
				else
					local target_center_matrix = Unit.box(target)
					target_center = Matrix4x4.translation(target_center_matrix)
				end

				local view_distance_sq = lookat_target_ext.view_distance_sq
				local view_angle_rad = extension.view_angle_rad * ((target == previous_seen_observer and VIEW_ANGLE_STICKINESS) or 1)
				local in_range, observer_to_target_vector, observer_target_direction, angle, max_angle = is_in_range(observer_fpp, target_center, observer_forward, view_distance_sq, view_angle_rad)
				local observer_to_target_length = Vector3.length(observer_to_target_vector)
				debug_text = string.format(debug_text .. "DISTANCE: %.2f/%.2f", observer_to_target_length, lookat_target_ext.view_distance)

				if angle then
					debug_text = string.format(debug_text .. "| ANGLE: %.2f/%.2f", math.radians_to_degrees(angle), math.radians_to_degrees(max_angle))
				end

				if in_range and not darkness_system:is_in_darkness(target_center) then
					local observer_to_target_length = Vector3.length(observer_to_target_vector)
					local collision_filter = lookat_target_ext.collision_filter
					local is_in_view = check_raycast_center(physics_world, player_unit, target, observer_fpp, observer_target_direction, observer_to_target_length, collision_filter)

					if is_in_view then
						color = inside_color
					else
						color = obscured_color
					end
				else
					color = outside_color
				end

				debug_draw_units[target] = color

				drawer:vector(observer_fpp, observer_target_direction, color)
			end

			Debug.text(debug_text)
		end
	end

	for unit, extension in pairs(self.unit_extension_data) do
		if unit ~= player_unit then
			local color = debug_draw_units[unit]
			color = color or outside_color

			drawer:unit(unit, color)
		end
	end

	if is_server then
		local observer_unit = seen_observers[player_unit]

		if observer_unit then
			local spine_node = Unit.node(observer_unit, "j_spine")
			local target_center = Unit.world_position(observer_unit, spine_node)
			local observer_is_bot = ScriptUnit.has_extension(observer_unit, "ai_system")

			drawer:sphere(target_center, 0.25, (observer_is_bot and Colors.get("blue")) or Colors.get("light_blue"))
		end
	end
end

SurroundingAwareSystem.update_events = function (self, context, t)
	local unit_input_data = self.unit_input_data
	local broadphase = self.broadphase
	local event_array = self.event_array
	local array_data, num_event_data = pdArray.data(event_array)
	local i = 1

	while num_event_data >= i do
		local num_args = array_data[i]
		local unit = array_data[i + 1]
		local event_name = array_data[i + 2]
		local range = array_data[i + 3]

		if Unit.alive(unit) then
			local source_wp = POSITION_LOOKUP[unit] or Unit.local_position(unit, 0)
			local n_targets = 0

			if range == math.huge then
				local i = 0

				for unit, _ in pairs(self.observers) do
					i = i + 1
					found_units[i] = unit
				end

				n_targets = i
			else
				n_targets = Broadphase.query(broadphase, source_wp, range, found_units)
			end

			for j = 1, n_targets, 1 do
				local target = found_units[j]
				found_units[j] = nil

				if target ~= unit and ScriptUnit.has_extension(target, "dialogue_system") then
					local dialogue_input = ScriptUnit.extension_input(target, "dialogue_system")
					local event_data = FrameTable.alloc_table()
					local distance = 0

					if unit then
						local target_world_pos = POSITION_LOOKUP[target] or Unit.local_position(target, 0)
						distance = Vector3.distance(source_wp, target_world_pos)
					end

					event_data.distance = distance

					for k = 1, num_args / 2, 1 do
						local array_data_index = i + 3 + (k - 1) * 2 + 1
						event_data[array_data[array_data_index]] = array_data[array_data_index + 1]
					end

					dialogue_input:trigger_dialogue_event(event_name, event_data)
				end
			end
		end

		i = i + 4 + num_args
	end

	pdArray.set_empty(event_array)
end

SurroundingAwareSystem.update_seen_recently = function (self, context, t)
	local seen_recently = self.seen_recently
	local threshold = DialogueSettings.seen_recently_threshold
	local threshold_time = t - threshold

	for unit, seen_time in pairs(seen_recently) do
		if seen_time < threshold_time then
			seen_recently[unit] = nil
		end
	end
end

SurroundingAwareSystem.hot_join_sync = function (self, sender)
	return
end

return
