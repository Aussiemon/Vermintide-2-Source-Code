-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
script_data.dialogue_debug_proximity_system = script_data.dialogue_debug_proximity_system or Development.parameter("dialogue_debug_proximity_system")
local PROXIMITY_DISTANCE_ENEMIES = math.max(DialogueSettings.enemies_close_distance, DialogueSettings.enemies_distant_distance)
local PROXIMITY_DISTANCE_FRIENDS = math.max(DialogueSettings.friends_close_distance, DialogueSettings.friends_distant_distance)
local RAYCAST_ENEMY_CHECK_INTERVAL = DialogueSettings.raycast_enemy_check_interval
local HEAR_ENEMY_CHECK_INTERVAL = DialogueSettings.hear_enemy_check_interval
local SPECIAL_PROXIMITY_DISTANCE = DialogueSettings.special_proximity_distance
local SPECIAL_PROXIMITY_DISTANCE_HEARD = DialogueSettings.special_proximity_distance_heard
local SPECIAL_PROXIMITY_DISTANCE_HEARD_SQ = SPECIAL_PROXIMITY_DISTANCE_HEARD * SPECIAL_PROXIMITY_DISTANCE_HEARD
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
ProximitySystem = class(ProximitySystem, ExtensionSystemBase)
local extensions = {
	"PlayerProximityExtension",
	"AIProximityExtension"
}
ProximitySystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.world = context.world
	self.physics_world = World.get_data(context.world, "physics_world")
	self.unit_input_data = {}
	self.unit_extension_data = {}
	self.player_unit_extensions_map = {}
	self.ai_unit_extensions_map = {}
	self.special_unit_extension_map = {}
	self.unit_forwards = {}
	self.enemy_broadphase = Broadphase(PROXIMITY_DISTANCE_ENEMIES, 128)
	self.special_units_broadphase = Broadphase(SPECIAL_PROXIMITY_DISTANCE, 8)
	self.player_units_broadphase = Broadphase(PROXIMITY_DISTANCE_FRIENDS, 4)
	self.enemy_check_raycasts = {}
	self.raycast_read_index = 1
	self.raycast_write_index = 1
	self.raycast_max_index = 16
	self._old_nearby = {}
	self._new_nearby = {}
	self._broadphase_result = {}
	self._pseudo_sorted_list = {}
	self._old_enabled_fx = {}
	self._new_enabled_fx = {}

	return 
end
ProximitySystem.destroy = function (self)
	for unit, ext in pairs(self.unit_extension_data) do
		Broadphase.remove(self.broadphase, ext.broadphase_id)
	end

	self.broadphase = nil
	self.unit_input_data = nil
	self.unit_extension_data = nil

	return 
end
ProximitySystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {
		last_num_enemies_nearby = 0,
		last_num_friends_nearby = 0
	}
	local input = {}

	ScriptUnit.set_extension(unit, "proximity_system", extension, input)

	self.unit_input_data[unit] = input
	self.unit_extension_data[unit] = extension

	if extension_name == "PlayerProximityExtension" then
		self.player_unit_extensions_map[unit] = extension
		extension.proximity_types = {
			friends_close = {
				num = 0,
				distance = DialogueSettings.friends_close_distance,
				check = self.player_unit_extensions_map,
				broadphase = self.player_units_broadphase
			},
			friends_distant = {
				num = 0,
				distance = DialogueSettings.friends_distant_distance,
				check = self.player_unit_extensions_map,
				broadphase = self.player_units_broadphase
			},
			enemies_close = {
				num = 0,
				distance = DialogueSettings.enemies_close_distance,
				check = self.ai_unit_extensions_map,
				broadphase = self.enemy_broadphase
			},
			enemies_distant = {
				num = 0,
				distance = DialogueSettings.enemies_distant_distance,
				check = self.ai_unit_extensions_map,
				broadphase = self.enemy_broadphase
			}
		}
		extension.raycast_timer = 0
		extension.hear_timer = 0
		extension.player_broadphase_id = Broadphase.add(self.player_units_broadphase, unit, Unit.world_position(unit, 0), 0.5)
	elseif extension_name == "AIProximityExtension" then
		extension.enemy_broadphase_id = Broadphase.add(self.enemy_broadphase, unit, Unit.world_position(unit, 0), 0.5)
		extension.bot_reaction_times = {}
		extension.has_been_seen = false
		self.ai_unit_extensions_map[unit] = extension
		local breed = Unit.get_data(unit, "breed")

		if breed.proximity_system_check then
			extension.special_broadphase_id = Broadphase.add(self.special_units_broadphase, unit, Unit.world_position(unit, 0), 0.5)
			self.special_unit_extension_map[unit] = extension
		end
	end

	return extension
end
ProximitySystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)
	ScriptUnit.remove_extension(unit, "proximity_system")

	return 
end
ProximitySystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return 
	end

	if extension.enemy_broadphase_id then
		Broadphase.remove(self.enemy_broadphase, extension.enemy_broadphase_id)
	end

	if extension.player_broadphase_id then
		Broadphase.remove(self.player_units_broadphase, extension.player_broadphase_id)
	end

	if extension.special_broadphase_id then
		Broadphase.remove(self.special_units_broadphase, extension.special_broadphase_id)
	end

	self.unit_input_data[unit] = nil
	self.unit_extension_data[unit] = nil
	self.player_unit_extensions_map[unit] = nil
	self.ai_unit_extensions_map[unit] = nil
	self.special_unit_extension_map[unit] = nil

	return 
end

local function unit_world_forward(unit)
	local unit_world_pose = Unit.world_pose(unit, 0)
	local forward_vec = Matrix4x4.forward(unit_world_pose)

	return forward_vec
end

local function check_raycast_center(physics_world, unit, target)
	local ray_position = Unit.world_position(unit, Unit.node(unit, "camera_attach"))
	local unit_center_matrix, _ = Unit.box(target)
	local ray_target = Matrix4x4.translation(unit_center_matrix)
	local ray_direction = Vector3.normalize(ray_target - ray_position)
	local ray_length = Vector3.length(ray_target - ray_position)
	local hits = PhysicsWorld.immediate_raycast(physics_world, ray_position, ray_direction, ray_length, "all", "types", "both", "collision_filter", "filter_lookat_object_ray")

	if hits then
		for i, hit_data in ipairs(hits) do
			local hit_unit = Actor.unit(hit_data[INDEX_ACTOR])

			if hit_unit ~= unit then
				if hit_unit == target then
					if script_data.debug_has_been_seen then
						QuickDrawerStay:line(ray_position, hit_data[INDEX_POSITION], Color(0, 255, 0))
						QuickDrawerStay:line(hit_data[INDEX_POSITION], ray_position + ray_direction * ray_length, Color(255, 0, 0))
					end

					return true
				elseif not Unit.get_data(hit_unit, "breed") then
					return false
				end
			end
		end
	end

	return 
end

local near_lookup = {
	witch_hunter = "witch_hunter_is_near",
	empire_soldier = "empire_soldier_is_near",
	dwarf_ranger = "dwarf_ranger_is_near",
	empire_soldier_tutorial = "empire_soldier_is_near",
	wood_elf = "wood_elf_is_near",
	bright_wizard = "bright_wizard_is_near"
}
local nearby_units = {}
ProximitySystem.update = function (self, context, t)
	local player_unit_extensions_map = self.player_unit_extensions_map
	local player_units_broadphase = self.player_units_broadphase
	local unit_forwards = self.unit_forwards
	local Unit_world_forward = unit_world_forward
	local network_manager = Managers.state.network
	local game = network_manager.game(network_manager)

	if game and not LEVEL_EDITOR_TEST then
		for unit, extension in pairs(player_unit_extensions_map) do
			local game_object_id = network_manager.unit_game_object_id(network_manager, unit)
			local my_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")
			unit_forwards[unit] = my_direction
		end
	else
		for unit, extension in pairs(player_unit_extensions_map) do
			local my_direction = Unit_world_forward(unit, 0)
			unit_forwards[unit] = my_direction
		end
	end

	if script_data.debug_has_been_seen then
		for unit, extension in pairs(self.unit_extension_data) do
			local color = (extension.has_been_seen and Color(0, 255, 0)) or Color(255, 0, 0)

			QuickDrawer:sphere(POSITION_LOOKUP[unit] + Vector3.up(), 2, color)
		end
	end

	return 
end
ProximitySystem.physics_async_update = function (self, context, t)
	local nearby_units = nearby_units
	local dt = context.dt
	local Broadphase_move = Broadphase.move
	local POSITION_LOOKUP = POSITION_LOOKUP
	local enemy_broadphase = self.enemy_broadphase

	for unit, extension in pairs(self.ai_unit_extensions_map) do
		local position = POSITION_LOOKUP[unit]

		Broadphase_move(enemy_broadphase, extension.enemy_broadphase_id, position)
	end

	local player_unit_extensions_map = self.player_unit_extensions_map
	local player_units_broadphase = self.player_units_broadphase

	for unit, extension in pairs(player_unit_extensions_map) do
		local position = POSITION_LOOKUP[unit]

		Broadphase_move(player_units_broadphase, extension.player_broadphase_id, position)
	end

	local special_units_broadphase = self.special_units_broadphase

	for unit, extension in pairs(self.special_unit_extension_map) do
		local position = POSITION_LOOKUP[unit]

		Broadphase_move(special_units_broadphase, extension.special_broadphase_id, position)
	end

	local enemy_check_raycasts = self.enemy_check_raycasts
	local unit_forwards = self.unit_forwards
	local ray_read_index = self.raycast_read_index
	local ray_write_index = self.raycast_write_index
	local ray_max = self.raycast_max_index

	for unit, extension in pairs(player_unit_extensions_map) do
		local position = POSITION_LOOKUP[unit]

		for proximity_type, proximity_data in pairs(extension.proximity_types) do
			local broadphase = proximity_data.broadphase
			local radius = proximity_data.distance
			local num_nearby_units = Broadphase.query(broadphase, position, radius, nearby_units)
			local check = proximity_data.check
			local num_matching_units = 0

			for i = 1, num_nearby_units, 1 do
				local nearby_unit = nearby_units[i]

				if nearby_unit ~= unit and check[nearby_unit] then
					num_matching_units = num_matching_units + 1
				end
			end

			local last_num_matching_units = proximity_data.num

			if num_matching_units < last_num_matching_units * 0.5 or last_num_matching_units * 1.5 < num_matching_units then
				proximity_data.num = num_matching_units
				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.num_units = num_matching_units

				if proximity_type == "friends_close" then
					for i = 1, num_nearby_units, 1 do
						local nearby_unit = nearby_units[i]

						if nearby_unit ~= unit and check[nearby_unit] then
							local profile_name = ScriptUnit.extension(nearby_unit, "dialogue_system").context.player_profile
							local near_title = near_lookup[profile_name]
							event_data[near_title] = true
						end
					end
				end

				dialogue_input.trigger_dialogue_event(dialogue_input, proximity_type, event_data)
			end

			table.clear(nearby_units)
		end

		local raycast_timer = extension.raycast_timer + dt
		local hear_timer = extension.hear_timer + dt
		local cast_ray, heard = nil

		if RAYCAST_ENEMY_CHECK_INTERVAL < raycast_timer then
			local my_direction = unit_forwards[unit]
			local my_pos_flat = Vector3.flat(position)
			local height_position = my_direction.z
			my_direction.z = 0
			local radius = SPECIAL_PROXIMITY_DISTANCE
			local num_nearby_units = Broadphase.query(special_units_broadphase, position, radius, nearby_units)

			for i = 1, num_nearby_units, 1 do
				local nearby_unit = nearby_units[i]
				nearby_units[i] = nil
				local is_alive = ScriptUnit.extension(nearby_unit, "health_system"):is_alive()

				if nearby_unit ~= unit and is_alive then
					local nearby_unit_pos = POSITION_LOOKUP[nearby_unit]
					local nearby_unit_pos_flat = Vector3.flat(nearby_unit_pos)
					local direction_unit_nearby_unit = nearby_unit_pos_flat - my_pos_flat
					direction_unit_nearby_unit = Vector3.normalize(direction_unit_nearby_unit)

					if HEAR_ENEMY_CHECK_INTERVAL < hear_timer then
						local distance_sq = Vector3.distance_squared(nearby_unit_pos, position)

						if distance_sq < SPECIAL_PROXIMITY_DISTANCE_HEARD_SQ then
							local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
							local event_data = FrameTable.alloc_table()
							event_data.enemy_tag = Unit.get_data(nearby_unit, "breed").name

							assert(event_data.enemy_tag)

							event_data.enemy_unit = nearby_unit
							event_data.distance = Vector3.distance(nearby_unit_pos_flat, my_pos_flat)
							event_data.height_distance = position.z - nearby_unit_pos.z

							dialogue_input.trigger_dialogue_event(dialogue_input, "heard_enemy", event_data)

							heard = true
						end
					end

					local result = Vector3.dot(direction_unit_nearby_unit, my_direction)

					if 0.7 < result then
						cast_ray = true
						enemy_check_raycasts[ray_write_index] = unit
						enemy_check_raycasts[ray_write_index + 1] = nearby_unit
						ray_write_index = (ray_write_index + 1) % ray_max + 1

						if ray_read_index == ray_write_index then
							ray_read_index = (ray_read_index + 1) % ray_max + 1
						end
					end
				end
			end
		end

		if cast_ray then
			raycast_timer = 0
		end

		if heard then
			hear_timer = 0
		end

		self.raycast_read_index = ray_read_index
		self.raycast_write_index = ray_write_index
		extension.hear_timer = hear_timer
		extension.raycast_timer = raycast_timer
		unit_forwards[unit] = nil
	end

	self._update_nearby_boss(self)
	self._update_nearby_enemies(self)

	return 
end
local MAX_ALLOWED_FX = 5
local Unit_flow_event = Unit.flow_event
local Unit_alive = Unit.alive

local function swap_erase(l, i, j)
	local v = l[j]
	l[i] = v
	l[j] = nil

	return v
end

local function swap(l, i, j)
	local v = l[j]
	l[j] = l[i]
	l[i] = v

	return v
end

local function remove_element(list, index, list_len)
	local next_unit = swap_erase(list, index, list_len)

	return next_unit, list_len - 1
end

local function fx_list_add(old_list, new_list, unit)
	if old_list[unit] then
		old_list[unit] = nil
	else
		Unit_flow_event(unit, "enable_proximity_fx")
	end

	new_list[unit] = true

	return 
end

local function fx_list_remove(old_list, new_list, unit)
	if old_list[unit] then
		Unit_flow_event(unit, "disable_proximity_fx")

		old_list[unit] = nil
	end

	return 
end

ProximitySystem._update_nearby_boss = function (self)
	if DEDICATED_SERVER then
		return 
	end

	local local_player = Managers.player:local_player()

	if not local_player then
		return 
	end

	local player_unit = local_player.player_unit

	if not player_unit then
		return 
	end

	local broadphase_result = self._broadphase_result
	local player_position = POSITION_LOOKUP[player_unit]
	local num_units = Broadphase.query(self.enemy_broadphase, player_position, 3, broadphase_result)
	local closest_distance = math.huge

	for i = 1, num_units, 1 do
		local unit = broadphase_result[i]
		local breed = Unit.get_data(unit, "breed")

		if breed and breed.boss and not breed.server_controlled_health_bar then
			local distance = Vector3.distance_squared(POSITION_LOOKUP[unit], player_position)

			if distance < closest_distance then
				closest_distance = distance
				self.closest_boss_unit = unit
			end
		end
	end

	return 
end
ProximitySystem._update_nearby_enemies = function (self)
	if DEDICATED_SERVER then
		return 
	end

	local old_nearby = self._old_nearby
	local new_nearby = self._new_nearby
	local broadphase_result = self._broadphase_result

	table.clear(new_nearby)

	local list = self._pseudo_sorted_list
	local old_enabled_fx = self._old_enabled_fx
	local new_enabled_fx = self._new_enabled_fx
	local local_players = Managers.player:players_at_peer(Network.peer_id())
	local player_pos = Vector3(0, 0, 0)
	local num_players = 0
	local camera_manager = Managers.state.camera

	for _, player in pairs(local_players) do
		if not player.bot_player then
			player_pos = camera_manager.camera_position(camera_manager, player.viewport_name)
			num_players = num_players + 1
		end
	end

	if 0 < num_players then
		player_pos = player_pos / num_players
		local list_len = #list
		local num_units = Broadphase.query(self.enemy_broadphase, player_pos, 30, broadphase_result)

		for i = 1, num_units, 1 do
			local unit = broadphase_result[i]
			new_nearby[unit] = Vector3.distance_squared(POSITION_LOOKUP[unit], player_pos)

			if not old_nearby[unit] then
				list_len = list_len + 1
				list[list_len] = unit

				if script_data.debug_proximity_fx then
					Unit.set_data(unit, "debug_random", Math.random(111111, 999999))
				end
			end
		end

		local max_allowed = script_data.max_allowed_proximity_fx or MAX_ALLOWED_FX
		local higher_unit = list[1]

		if higher_unit then
			local higher_unit_dist = new_nearby[higher_unit]

			while not higher_unit_dist and 0 < list_len do
				higher_unit, list_len = remove_element(list, 1, list_len)
				higher_unit_dist = new_nearby[higher_unit]
			end

			local lower_index = nil
			local higher_index = 1

			while higher_index <= list_len do

				-- Decompilation error in this vicinity:
				lower_index = higher_index
				higher_index = higher_index + 1
				local lower_unit = higher_unit
				local lower_unit_dist = higher_unit_dist
				higher_unit = list[higher_index]
				higher_unit_dist = new_nearby[higher_unit]

				while not higher_unit_dist and higher_index <= list_len do
					higher_unit, list_len = remove_element(list, higher_index, list_len)
					higher_unit_dist = new_nearby[higher_unit]
				end

				if higher_unit_dist and higher_unit_dist < lower_unit_dist then
					swap(list, lower_index, higher_index)

					higher_unit = lower_unit
					higher_unit_dist = lower_unit_dist
				end

				if not Unit_alive(list[lower_index]) then
					table.dump(old_enabled_fx, "old_enabled_fx", 2)
					table.dump(new_enabled_fx, "new_enabled_fx", 2)
					table.dump(old_nearby, "old_nearby", 2)
					table.dump(new_nearby, "new_nearby", 2)
					table.dump(list, "list", 2)
					assert(false, "Detected deleted unit in proximity fx list.")
				end

				local unit = list[lower_index]
			end

			if higher_unit_dist then
				if higher_index <= max_allowed then
					fx_list_add(old_enabled_fx, new_enabled_fx, higher_unit)
				else
					fx_list_remove(old_enabled_fx, new_enabled_fx, higher_unit)
				end
			end

			self._clear_old_enabled_fx(self, old_enabled_fx)
			self._nearby_enemies_debug(self, list, new_nearby, new_enabled_fx)

			self._old_enabled_fx = new_enabled_fx
			self._new_enabled_fx = old_enabled_fx
		end
	end

	self._old_nearby = new_nearby
	self._new_nearby = old_nearby

	return 
end
ProximitySystem._nearby_enemies_debug = function (self, list, new_nearby, new_enabled_fx)
	if script_data.debug_proximity_fx then
		for i, unit in ipairs(list) do
			local dist_sq = new_nearby[unit]

			if dist_sq then
				local dist = math.sqrt(dist_sq)
				local brightness = 255 - math.min(dist * 8, 255)
				local enabled = new_enabled_fx[unit]
				local color = nil

				if enabled then
					color = Color(brightness, brightness, 255)
				else
					color = Color(brightness, 255, brightness)
				end

				Debug.colored_text(color, tostring(Unit.get_data(unit, "debug_random")) .. ((enabled and " enabled ") or " disabled ") .. string.format("%.2f", dist))
			else
				print("ERROR", i)
			end
		end

		for unit, _ in pairs(new_enabled_fx) do
			QuickDrawer:sphere(POSITION_LOOKUP[unit], 1.2, Color(0, 255, 0))
		end
	end

	return 
end
ProximitySystem._clear_old_enabled_fx = function (self, old_enabled_fx)
	for unit, _ in pairs(old_enabled_fx) do
		if Unit_alive(unit) then
			Unit_flow_event(unit, "disable_proximity_fx")
		end
	end

	table.clear(old_enabled_fx)

	return 
end
ProximitySystem.post_update = function (self, context, t)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local enemy_check_raycasts = self.enemy_check_raycasts
	local unit_forwards = self.unit_forwards
	local physics_world = self.physics_world
	local darkness_system = Managers.state.entity:system("darkness_system")
	local read_index = self.raycast_read_index

	if read_index ~= self.raycast_write_index then
		self.raycast_read_index = (read_index + 1) % self.raycast_max_index + 1
		local unit = enemy_check_raycasts[read_index]
		local nearby_unit = enemy_check_raycasts[read_index + 1]

		if Unit_alive(unit) and Unit_alive(nearby_unit) then
			local nearby_unit_pos = POSITION_LOOKUP[nearby_unit] or Unit.world_position(nearby_unit, 0)
			local did_hit = not darkness_system.is_in_darkness(darkness_system, nearby_unit_pos) and check_raycast_center(physics_world, unit, nearby_unit)

			if did_hit then
				local nearby_unit_pos_flat = Vector3.flat(nearby_unit_pos)
				local position = POSITION_LOOKUP[unit]
				local my_pos_flat = Vector3.flat(position)
				local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.enemy_tag = Unit.get_data(nearby_unit, "breed").name

				assert(event_data.enemy_tag)

				event_data.enemy_unit = nearby_unit
				event_data.distance = Vector3.distance(nearby_unit_pos_flat, my_pos_flat)
				event_data.height_distance = position.z - nearby_unit_pos.z
				local proximity_ext = ScriptUnit.extension(nearby_unit, "proximity_system")
				proximity_ext.has_been_seen = true

				dialogue_input.trigger_dialogue_event(dialogue_input, "seen_enemy", event_data)
			end
		end
	end

	return 
end
ProximitySystem.hot_join_sync = function (self, sender)
	return 
end

return 
