script_data.dialogue_debug_lookat = script_data.dialogue_debug_lookat or Development.parameter("dialogue_debug_lookat")
local extensions = {
	"LookatTargetExtension",
	"SurroundingObserverExtension",
	"SurroundingObserverHuskExtension"
}
local RPCS = {}
SurroundingAwareSystem = class(SurroundingAwareSystem, ExtensionSystemBase)
SurroundingAwareSystem.init = function (self, entity_system_creation_context, system_name)
	local entity_manager = entity_system_creation_context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.entity_manager = entity_manager
	self.world = entity_system_creation_context.world
	self.physics_world = World.get_data(self.world, "physics_world")
	self.unit_storage = entity_system_creation_context.unit_storage
	self.unit_input_data = {}
	self.unit_extension_data = {}
	self.observers = {}
	self.broadphase = Broadphase(math.max(DialogueSettings.max_view_distance, DialogueSettings.max_hear_distance, DialogueSettings.discover_enemy_attack_distance), 256)
	self.event_array = pdArray.new()
	self.seen_recently = {}
	self.current_observer_unit = nil
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))
	GarbageLeakDetector.register_object(self, "surrounding_aware_system")

	return 
end
SurroundingAwareSystem.destroy = function (self)
	for unit, ext in pairs(self.unit_extension_data) do
		Broadphase.remove(self.broadphase, ext.broadphase_id)
	end

	self.network_event_delegate:unregister(self)
	table.clear(self)

	return 
end
SurroundingAwareSystem.add_event = function (unit, event_name, distance, ...)
	distance = distance or DialogueSettings.default_hear_distance
	local input = ScriptUnit.extension_input(unit, "surrounding_aware_system")
	local event_array = input.event_array
	local num_args = select("#", ...)
	local array_data, event_array_size = pdArray.data(event_array)

	assert(type(event_name) == "string", "First argument to add_event must be an event-name.")
	assert(type(distance) == "number", "Second argument to add_event must be distance.")
	assert(num_args%2 == 0, "Arguments must be set by key, value-pairs. Thus num args must be an even number.")
	pack_index[num_args + 4](array_data, event_array_size + 1, num_args, unit, event_name, distance, ...)

	local new_size = event_array_size + num_args + 4

	pdArray.set_size(event_array, new_size)

	return 
end
SurroundingAwareSystem.add_system_event = function (self, unit, event_name, distance, ...)
	distance = distance or DialogueSettings.default_hear_distance
	local event_array = self.event_array
	local num_args = select("#", ...)
	local array_data, event_array_size = pdArray.data(event_array)

	assert(type(event_name) == "string", "First argument to add_event must be an event-name.")
	assert(type(distance) == "number", "Second argument to add_event must be distance.")
	assert(num_args%2 == 0, "Arguments must be set by key, value-pairs. Thus num args must be an even number.")
	pack_index[num_args + 4](array_data, event_array_size + 1, num_args, unit, event_name, distance, ...)

	local new_size = event_array_size + num_args + 4

	pdArray.set_size(event_array, new_size)

	return 
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
		extension.last_lookat_trigger = 0
		self.observers[unit] = extension
	else
		extension.has_been_seen = false
		extension.is_lookat_object = true
		extension.view_distance = Unit.get_data(unit, "view_distance") or DialogueSettings.default_view_distance
		extension.view_distance_sq = extension.view_distance*extension.view_distance
	end

	return extension
end
SurroundingAwareSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "SurroundingObserverExtension" or extension_name == "SurroundingObserverHuskExtension" then
		local extension = ScriptUnit.extension(unit, "surrounding_aware_system")
		local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
		extension.locomotion_extension = locomotion_extension
	elseif ScriptUnit.has_extension(unit, "pickup_system") then
		local extension = ScriptUnit.extension(unit, "surrounding_aware_system")
		extension.collision_filter = "filter_lookat_pickup_object_ray"
	end

	return 
end
SurroundingAwareSystem.on_remove_extension = function (self, unit, extension_name)
	Broadphase.remove(self.broadphase, self.unit_extension_data[unit].broadphase_id)

	self.unit_input_data[unit] = nil
	self.unit_extension_data[unit] = nil

	if extension_name == "SurroundingObserverExtension" or extension_name == "SurroundingObserverHuskExtension" then
		self.observers[unit] = nil
	end

	ScriptUnit.remove_extension(unit, "surrounding_aware_system")

	return 
end
SurroundingAwareSystem.update = function (self, context, t)
	Profiler.start("SeenRecently")
	self.update_seen_recently(self, context, t)
	Profiler.stop("SeenRecently")
	Profiler.start("Lookat")
	self.update_lookat(self, context, t)
	Profiler.stop("Lookat")
	Profiler.start("Events")
	self.update_events(self, context, t)
	Profiler.stop("Events")
	Profiler.start("Debug")
	self.update_debug(self, context, t)
	Profiler.stop("Debug")

	return 
end

local function check_raycast_center(physics_world, unit, target, collision_filter)
	local ray_position = Unit.world_position(unit, Unit.node(unit, "camera_attach"))
	local unit_center_matrix, _ = Unit.box(target)
	local ray_target = Matrix4x4.translation(unit_center_matrix)
	local ray_direction = Vector3.normalize(ray_target - ray_position)
	local ray_length = Vector3.length(ray_target - ray_position)
	local hits = PhysicsWorld.immediate_raycast(physics_world, ray_position, ray_direction, ray_length, "all", "types", "both", "collision_filter", collision_filter or "filter_lookat_object_ray")

	if hits then
		for i, hit_data in ipairs(hits) do
			local hit_unit = Actor.unit(hit_data[4])

			if hit_unit ~= unit and hit_unit ~= target then
				return false
			end
		end
	end

	return true
end

local found_units = {}
SurroundingAwareSystem.update_lookat = function (self, context, t)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local Broadphase = Broadphase
	local Unit = Unit
	local Vector3 = Vector3
	local math = math
	local seen_recently = self.seen_recently
	local broadphase = self.broadphase
	local physics_world = self.physics_world
	local darkness_system = Managers.state.entity:system("darkness_system")

	if self.observers[self.current_observer_unit] == nil then
		self.current_observer_unit = nil
	end

	self.current_observer_unit = next(self.observers, self.current_observer_unit)
	local unit = self.current_observer_unit

	if unit then
		local extension = self.observers[unit]
		local observer_wp = POSITION_LOOKUP[unit]

		Broadphase.move(broadphase, extension.broadphase_id, observer_wp)

		local time_since_last = t - extension.last_lookat_trigger

		if DialogueSettings.view_event_trigger_interval < time_since_last then
			local observer_forward = Quaternion.forward(extension.locomotion_extension:current_rotation())
			local observe_position = observer_wp + observer_forward*DialogueSettings.max_view_distance*0.5
			local num_nearby = Broadphase.query(broadphase, observer_wp, DialogueSettings.max_view_distance*0.5, found_units)

			for i = 1, num_nearby, 1 do
				local target = found_units[i]
				found_units[i] = nil
				local saw_unit_recently = seen_recently[target]

				if target ~= unit and not saw_unit_recently then
					local lookat_target_ext = ScriptUnit.extension(target, "surrounding_aware_system")

					if lookat_target_ext.is_lookat_object then
						local target_wp = Unit.world_position(target, 0)
						local observer_to_target_vector = target_wp - observer_wp
						local observer_target_direction = Vector3.normalize(observer_to_target_vector)
						local distance_squared = math.max(0.1, Vector3.length_squared(observer_to_target_vector))
						local view_distance = lookat_target_ext.view_distance
						local distance_det = (view_distance*view_distance)/2/distance_squared
						local rotation_diff = math.radians_to_degrees(Vector3.dot(observer_forward, observer_target_direction) - 1)

						if distance_squared <= lookat_target_ext.view_distance_sq and rotation_diff < extension.view_angle*distance_det then
							local is_in_view = not darkness_system.is_in_darkness(darkness_system, POSITION_LOOKUP[target] or Unit.world_position(target, 0)) and check_raycast_center(physics_world, unit, target, lookat_target_ext.collision_filter)

							if is_in_view then
								lookat_target_ext.has_been_seen = true
								extension.last_lookat_trigger = t
								local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
								local event_data = FrameTable.alloc_table()
								event_data.item_tag = Unit.get_data(target, "lookat_tag") or Unit.debug_name(target)
								event_data.distance = math.sqrt(distance_squared)

								dialogue_input.trigger_dialogue_event(dialogue_input, "seen_item", event_data)

								seen_recently[target] = t
							end
						end
					end
				end
			end
		end
	end

	return 
end
SurroundingAwareSystem.update_debug = function (self, context, t)
	if not script_data.dialogue_debug_lookat then
		return 
	end

	local broadphase = self.broadphase
	local physics_world = self.physics_world
	local debug_draw_units = {}
	local player = Managers.player:player_from_peer_id(Network.peer_id())

	if not player or not player.player_unit then
		return 
	end

	local unit = player.player_unit
	local extension = self.unit_extension_data[unit]
	local observer_wp = Unit.world_position(unit, 0)
	local observer_forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local num_nearby = Broadphase.query(broadphase, observer_wp, DialogueSettings.max_view_distance, found_units)
	local outside_color = Color(255, 255, 0, 0)
	local blue_color = Color(255, 0, 0, 255)
	local inside_color = Color(255, 0, 255, 0)
	local obscured_color = Color(255, 0, 255, 255)

	if 0 < num_nearby then
		for i = 1, num_nearby, 1 do
			local target = found_units[i]
			found_units[i] = nil

			if target ~= unit then
				local color = Color(255, 0, 0, 255)
				local target_wp = Unit.world_position(target, 0)
				local observer_target_direction = Vector3.normalize(target_wp - observer_wp)
				local distance = math.max(0.1, Vector3.distance_squared(target_wp, observer_wp))

				Debug.text("SAS: %q:%f", Unit.debug_name(target), distance)

				local distance_det = (DialogueSettings.max_view_distance*DialogueSettings.max_view_distance)/2/distance
				local rotation_diff = math.radians_to_degrees(Vector3.dot(observer_forward, observer_target_direction) - 1)
				local lookat_target_ext = ScriptUnit.extension(target, "surrounding_aware_system")

				if lookat_target_ext.is_lookat_object and lookat_target_ext and distance <= lookat_target_ext.view_distance_sq and rotation_diff < extension.view_angle*distance_det then
					local is_in_view = check_raycast_center(physics_world, unit, target)

					if is_in_view then
						color = inside_color
					else
						color = obscured_color
					end
				else
					color = outside_color
				end

				debug_draw_units[target] = color
			end
		end
	end

	local drawer = Debug.drawer("surrounding_aware")

	drawer.reset(drawer)

	for unit, extension in pairs(self.unit_extension_data) do
		if unit ~= player.player_unit then
			local color = debug_draw_units[unit]
			color = color or outside_color

			drawer.unit(drawer, unit, color)
		end
	end

	return 
end
SurroundingAwareSystem.update_events = function (self, context, t)
	local unit_input_data = self.unit_input_data
	local broadphase = self.broadphase
	local event_array = self.event_array
	local array_data, num_event_data = pdArray.data(event_array)
	local i = 1

	while i <= num_event_data do
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
					local height_distance = 0

					if unit then
						local target_world_pos = POSITION_LOOKUP[target] or Unit.local_position(target, 0)
						slot25 = Vector3.distance(source_wp, target_world_pos)
					end

					event_data.distance = distance
					event_data.height_distance = height_distance

					for k = 1, num_args/2, 1 do
						local array_data_index = i + 3 + (k - 1)*2 + 1
						event_data[array_data[array_data_index]] = array_data[array_data_index + 1]
					end

					dialogue_input.trigger_dialogue_event(dialogue_input, event_name, event_data)
				end
			end
		end

		i = i + 4 + num_args
	end

	pdArray.set_empty(event_array)

	return 
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

	return 
end
SurroundingAwareSystem.hot_join_sync = function (self, sender)
	return 
end

return 
