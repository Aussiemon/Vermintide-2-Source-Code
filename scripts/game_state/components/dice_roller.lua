-- chunkname: @scripts/game_state/components/dice_roller.lua

local directions = {
	{
		rot = 0,
		up = {
			0,
			1,
			0,
		},
	},
	{
		up = {
			1,
			0,
			0,
		},
		rot = math.pi / 2,
	},
	{
		up = {
			0,
			1,
			0,
		},
		rot = math.pi / 2,
	},
	{
		up = {
			0,
			1,
			0,
		},
		rot = -math.pi / 2,
	},
	{
		up = {
			1,
			0,
			0,
		},
		rot = -math.pi / 2,
	},
	{
		up = {
			0,
			1,
			0,
		},
		rot = math.pi,
	},
	{
		up = {
			0,
			0,
			1,
		},
		rot = math.pi / 2,
	},
	{
		up = {
			0,
			0,
			1,
		},
		rot = -math.pi / 2,
	},
	{
		up = {
			0,
			0,
			1,
		},
		rot = math.pi,
	},
}
local rotation_mappings = {
	{
		1,
		2,
		3,
		4,
		5,
		6,
	},
	{
		5,
		1,
		8,
		7,
		9,
		2,
	},
	{
		4,
		7,
		1,
		9,
		8,
		3,
	},
	{
		3,
		8,
		9,
		1,
		7,
		4,
	},
	{
		2,
		9,
		7,
		8,
		1,
		5,
	},
	{
		6,
		5,
		4,
		3,
		2,
		1,
	},
}
local dice_types_mapping = {
	"wood",
	"metal",
	"gold",
	"warpstone",
}
local dice_type_success_amounts = {
	gold = 3,
	metal = 4,
	warpstone = 1,
	wood = 5,
}
local unit_names = {
	gold = "units/props/dice_bowl/dice_tier_04",
	metal = "units/props/dice_bowl/dice_tier_02",
	warpstone = "units/props/dice_bowl/dice_tier_05",
	wood = "units/props/dice_bowl/dice_tier_01",
}
local broken_heights = {
	gold = 1.36,
	metal = 1.34,
	warpstone = 1.18,
	wood = 1.18,
}
local SCALAR = 0.03

DiceRoller = class(DiceRoller)

DiceRoller.init = function (self, world, dice_keeper, rewards, hero_name)
	self.world = world
	self.simulation_world = Managers.world:create_world("dice_simulation", nil, nil, nil, Application.DISABLE_APEX_CLOTH, Application.DISABLE_RENDERING, Application.DISABLE_SOUND)

	local object_sets, position, rotation, shading_callback, mood_setting
	local time_sliced_spawn = false
	local simulation_level = ScriptWorld.spawn_level(self.simulation_world, "levels/dicegame/world", object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	World.set_flow_callback_object(self.simulation_world, self)
	Level.spawn_background(simulation_level)

	self.dice_units = {}
	self.old_dice_units = {}
	self.dice_keeper = dice_keeper
	self.dice_types = {}
	self.dice_results = {}
	self.rewards = rewards

	local dice = dice_keeper:get_dice()

	self.dice_data = table.clone(dice)

	local units = World.units(world)
	local num_units = #units
	local bowl_position

	for i = 1, num_units do
		local unit = units[i]
		local is_bowl = Unit.get_data(unit, "bowl_type")

		if is_bowl then
			bowl_position = Unit.local_position(unit, 0)

			break
		end
	end

	self.dice_offset = Vector3Box(bowl_position)

	Managers.state.event:register(self, "flow_callback_die_collision", "flow_callback_die_collision")

	self.wwise_world = Managers.world:wwise_world(world)
	self.index = 1
	self.timer = 0

	self:_request_from_backend(hero_name)

	self._glow_dice = {}
end

DiceRoller.destroy = function (self)
	if not self.post_cleanup_done then
		self:cleanup_post_roll()
	end
end

DiceRoller._request_from_backend = function (self, hero_name)
	local difficulty = Managers.state.difficulty:get_difficulty()
	local dice = self.dice_keeper:get_dice()
	local level_start = self.rewards:get_level_start()
	local level_end = self.rewards:get_level_end(true)
	local level_settings = LevelHelper:current_level_settings()
	local dlc_name = level_settings.dlc_name
	local backend_items = Managers.backend:get_interface("items")

	backend_items:generate_item_server_loot(dice, difficulty, level_start, level_end, hero_name, dlc_name)
end

DiceRoller._check_for_achievement = function (self, reward_backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local hero_trinkets = backend_items:get_filtered_items("trinket_as_hero and equipped_by == current_hero")

	fassert(#hero_trinkets < 2, "There are more than two items")

	local trinket = hero_trinkets[1]

	if trinket then
		local item = backend_items:get_item_from_id(reward_backend_id)
		local item_data = ItemMasterList[item.key]
		local can_wield = item_data.can_wield

		if #can_wield > 1 then
			return
		end

		local trinket_traits = trinket.traits
		local trinket_as_hero

		for _, trait_name in pairs(trinket_traits) do
			local trait = BuffTemplates[trait_name]
			local trinket_hero = trait.roll_dice_as_hero

			if trinket_hero then
				trinket_as_hero = trinket_hero

				break
			end
		end

		if table.find(can_wield, trinket_as_hero) then
			local player_manager = Managers.player
			local player = player_manager:local_player()
			local stats_id = player:stats_id()
			local statistics_db = player_manager:statistics_db()

			statistics_db:set_stat(stats_id, "win_item_as_" .. trinket_as_hero, 1)
		end
	end
end

DiceRoller.poll_for_backend_result = function (self)
	if self._got_backend_result then
		return true
	end

	local backend_items = Managers.backend:get_interface("items")
	local successes, win_list, reward_backend_id, level_rewards = backend_items:check_for_loot()

	if successes then
		self:_check_for_achievement(reward_backend_id)

		self._successes = successes
		self._reward_backend_id = reward_backend_id
		self._win_list = win_list
		self._got_backend_result = true
		self._level_rewards = level_rewards

		return true
	end

	return false
end

DiceRoller.dice = function (self)
	return self.dice_keeper:get_dice()
end

DiceRoller.successes = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	return self._successes
end

DiceRoller.reward_backend_id = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	return self._reward_backend_id
end

DiceRoller.num_successes = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	local num_successes = 1

	for _, successes in pairs(self._successes) do
		num_successes = num_successes + successes
	end

	return num_successes
end

DiceRoller.level_up_rewards = function (self)
	fassert(self._got_backend_result, "Trying get level up rewards before response from backend")

	return self._level_rewards
end

DiceRoller.win_list = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	return self._win_list
end

DiceRoller.reward_item_key = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	local num_successes = self:num_successes()

	return self._win_list[num_successes]
end

DiceRoller.flow_callback_die_collision = function (self, params)
	local touched_unit = params.touched_unit
	local touching_unit = params.touching_unit
	local impulse_force = params.impulse_force

	if Vector3.length(impulse_force) > 0.1 then
		if self._dice_simulation_units[touching_unit] then
			self._sound_events[#self._sound_events] = "hud_dice_game_dice_collision"
		else
			self._sound_events[#self._sound_events] = "hud_dice_game_dice_collision_bucket"
		end
	end
end

DiceRoller.is_rolling = function (self)
	return self.rolling
end

DiceRoller.is_completed = function (self)
	return self.rolling_finished
end

DiceRoller.has_rerolls = function (self)
	return self.needs_rerolls
end

local dice_visibility_groups = {
	normal = "lvl1",
}

local function set_emissive(unit, emissive)
	local num_meshes = Unit.num_meshes(unit)

	for ii = 0, num_meshes - 1 do
		local mesh = Unit.mesh(unit, ii)
		local num_materials = Mesh.num_materials(mesh)
		local material = Mesh.material(mesh, "m_dice")

		Material.set_vector3(material, "emissive", emissive)
	end
end

DiceRoller._add_to_glow_list = function (self, unit)
	self._glow_dice[#self._glow_dice + 1] = {
		time = 0,
		unit = unit,
	}

	WwiseWorld.trigger_event(self.wwise_world, "hud_dice_game_glow")
end

DiceRoller._update_glow = function (self, dt)
	local target_emissive = Vector3(0.615, 0.208, 0.055)
	local duration = 0.2

	for _, data in pairs(self._glow_dice) do
		data.time = data.time + dt

		local dist = math.min(1, data.time * duration)
		local scale = math.sirp(0, 1, dist)
		local emissive = target_emissive / scale

		set_emissive(data.unit, emissive)
	end
end

DiceRoller._create_success_table = function (self, success_list)
	local success_table = {}

	self.remaining_dice = self.remaining_dice or table.clone(self.dice_data)

	for _, dice_type in ipairs(dice_types_mapping) do
		local dice_amount = self.remaining_dice[dice_type]
		local success_amount = success_list[dice_type]
		local success_count = 0

		for i = 1, dice_amount do
			local success = success_count < success_amount
			local data = {
				dice_type = dice_type,
				success = success,
			}

			success_table[#success_table + 1] = data
			success_count = success and success_count + 1 or success_count
		end
	end

	table.shuffle(success_table)

	self._success_table = success_table
end

DiceRoller.roll_dices = function (self)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	local world = self.world
	local dice_simulation_settings = self._dice_simulation_settings
	local dice_units = {}
	local num_dice = #dice_simulation_settings
	local scale = Vector3(SCALAR, SCALAR, SCALAR)

	for i = 1, num_dice do
		local data = dice_simulation_settings[i]
		local dice_type = data.dice_type
		local unit_name = unit_names[dice_type] .. "_no_physics"
		local initial_position = data.initial_position:unbox() * SCALAR
		local initial_rotation = data.initial_rotation:unbox()
		local dice_unit = World.spawn_unit(world, unit_name, initial_position, initial_rotation)

		Unit.set_local_scale(dice_unit, 0, scale)

		dice_units[dice_unit] = data
	end

	local sound_position = WwiseWorld.trigger_event(self.wwise_world, "hud_dice_game_roll_many")

	self.rolling = true
	self.roll_time = 0
	self.dice_units = dice_units

	table.clear(self.dice_results)

	return #dice_simulation_settings
end

DiceRoller.simulate_dice_rolls = function (self, success_list)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	if not self._success_table then
		self:_create_success_table(success_list)
	end

	local dice_simulation_settings = table.clone(self._success_table)
	local world = self.simulation_world
	local num_dice = #dice_simulation_settings

	self._sound_events = {}
	self._dice_simulation_units = {}

	local initial_positions = {}

	for i = 1, num_dice do
		local valid_pos = false
		local initial_position = Vector3(16, 0, 0) + Vector3(math.random() / 20, math.random() / 20, 0.07) * 100

		for j = 1, #initial_positions do
			repeat
				if Vector3.length(initial_position - initial_positions[j]) < 2 then
					valid_pos = false
					initial_position = initial_position + Vector3(math.random(-1, 1) / 20, math.random(-1, 1) / 20, 0) * 50
				else
					valid_pos = true
				end
			until valid_pos
		end

		initial_positions[i] = initial_position
	end

	for i = 1, num_dice do
		local simulation_settings = dice_simulation_settings[i]
		local dice_type = simulation_settings.dice_type
		local success = simulation_settings.success
		local randomized_direction = directions[math.random(1, 6)]
		local up_vector = Vector3(unpack(randomized_direction.up))
		local rotation = randomized_direction.rot
		local initial_rotation = Quaternion.axis_angle(up_vector, rotation)
		local unit_name = unit_names[dice_type]
		local dice_unit = World.spawn_unit(world, unit_name, initial_positions[i], initial_rotation)

		self._dice_simulation_units[dice_unit] = true

		local actor = Unit.actor(dice_unit, 0)

		Unit.set_unit_visibility(dice_unit, false)
		Actor.wake_up(actor)
		Actor.set_velocity(actor, Vector3(-0.25, -0.5, -0.07) * 65)

		local wanted_dice_result = success and math.random(dice_type_success_amounts[dice_type], 6) or math.random(1, dice_type_success_amounts[dice_type] - 1)

		dice_simulation_settings[i] = {
			dice_result = 0,
			unit = dice_unit,
			dice_type = dice_type,
			initial_position = Vector3Box(initial_positions[i]),
			initial_rotation = QuaternionBox(initial_rotation),
			wanted_dice_result = wanted_dice_result,
			success = success,
			positions = {},
			rotations = {},
		}
	end

	local simulation_successful = self:run_simulation(dice_simulation_settings)

	if simulation_successful then
		self:calculate_results(dice_simulation_settings)
		self:alter_rotations(dice_simulation_settings)

		self._dice_simulation_settings = dice_simulation_settings
	end

	local dice_amount = #dice_simulation_settings

	for i = 1, dice_amount do
		local data = dice_simulation_settings[i]

		World.destroy_unit(world, data.unit)

		data.unit = nil
	end

	return simulation_successful
end

DiceRoller.run_simulation = function (self, dice_simulation_settings)
	fassert(self._got_backend_result, "Trying to roll dice before response from backend")

	local world = self.simulation_world
	local finished = false
	local successful = false
	local frame_count = 0
	local dice_amount = #dice_simulation_settings

	while not finished do
		local a, b, c = Script.temp_count()

		World.update_scene(world, 0.03333333333333333)

		local finished_dice = 0
		local has_rerolls = false

		self._sound_events[#self._sound_events + 1] = false

		for i = 1, dice_amount do
			local data = dice_simulation_settings[i]
			local unit = data.unit
			local actor = Unit.actor(unit, 0)
			local actor_velocity = Actor.velocity(actor)
			local index = #data.positions + 1

			data.positions[index] = Vector3Box(Unit.local_position(unit, 0))
			data.rotations[index] = QuaternionBox(Unit.local_rotation(unit, 0))

			if Vector3.length(actor_velocity) < 0.001 then
				finished_dice = finished_dice + 1

				local result = self:get_dice_result(unit, data.dice_type)

				if result == 0 then
					has_rerolls = true
				end

				if not data.completed_index then
					data.completed_index = index
				end
			end
		end

		if finished_dice == dice_amount then
			finished = true
			successful = true
		end

		frame_count = frame_count + 1

		if frame_count == 200 or finished and has_rerolls then
			print("dice game broke, rerunning")

			finished = true
			successful = false
		end

		Script.set_temp_count(a, b, c)
	end

	return successful
end

DiceRoller.calculate_results = function (self, dice_simulation_settings)
	local amount = #dice_simulation_settings

	for i = 1, amount do
		local data = dice_simulation_settings[i]
		local unit = data.unit
		local dice_result = self:get_dice_result(unit, data.dice_type)

		data.dice_result = dice_result
	end
end

DiceRoller.get_dice_result = function (self, unit, dice_type)
	local world_pose = Unit.world_pose(unit, 0)
	local up_vec = Matrix4x4.up(world_pose)
	local forward_vec = Matrix4x4.forward(world_pose)
	local right_vec = Matrix4x4.right(world_pose)
	local left_vec = -right_vec
	local down_vec = -up_vec
	local back_vec = -forward_vec
	local largest_z = math.max(up_vec.z, forward_vec.z, right_vec.z, down_vec.z, left_vec.z, back_vec.z)
	local dice_result

	if up_vec.z == largest_z then
		dice_result = 1
	elseif forward_vec.z == largest_z then
		dice_result = 2
	elseif right_vec.z == largest_z then
		dice_result = 4
	elseif down_vec.z == largest_z then
		dice_result = 6
	elseif left_vec.z == largest_z then
		dice_result = 3
	elseif back_vec.z == largest_z then
		dice_result = 5
	end

	if Unit.world_position(unit, 0).z >= broken_heights[dice_type] then
		dice_result = 0
	end

	return dice_result
end

DiceRoller.alter_rotations = function (self, dice_simulation_settings)
	local amount = #dice_simulation_settings

	for i = 1, amount do
		repeat
			local data = dice_simulation_settings[i]
			local wanted_result = data.wanted_dice_result
			local result = data.dice_result
			local initial_rotation = data.initial_rotation:unbox()

			if result == 0 then
				break
			end

			local direction_id = rotation_mappings[result][wanted_result]
			local direction = directions[direction_id]
			local up_vector = Vector3(unpack(direction.up))
			local rotation = direction.rot
			local rotation_to_apply = Quaternion.axis_angle(up_vector, rotation)

			data.initial_rotation:store(Quaternion.multiply(initial_rotation, rotation_to_apply))

			local rotations = data.rotations
			local num_rotations = #rotations

			for i = 1, num_rotations do
				local current_rotation = rotations[i]:unbox()
				local new_rotation = Quaternion.multiply(current_rotation, rotation_to_apply)

				rotations[i] = QuaternionBox(new_rotation)
			end
		until true
	end
end

DiceRoller.get_dice_results = function (self)
	return self.num_successes
end

DiceRoller.update = function (self, dt)
	if not self.rolling then
		return
	end

	local roll_time = self.roll_time + dt
	local dice_units = self.dice_units
	local finished_dice = 0
	local offset = self.dice_offset:unbox()

	for dice_unit, data in pairs(dice_units) do
		local positions = data.positions
		local rotations = data.rotations
		local total_positions_rotations = #positions
		local total_time = total_positions_rotations * 0.016666666666666666
		local percentage_through_simulation = roll_time / total_time
		local progress = math.min(percentage_through_simulation * total_positions_rotations, total_positions_rotations)
		local lower_index = math.max(math.floor(progress), 1)
		local upper_index = math.min(math.max(math.ceil(progress), 1), total_positions_rotations)
		local lerp_value = progress - lower_index
		local lower_position = (positions[lower_index]:unbox() - offset) * SCALAR + offset
		local upper_position = (positions[upper_index]:unbox() - offset) * SCALAR + offset
		local new_position = Vector3.lerp(lower_position, upper_position, lerp_value)
		local lower_rotation = rotations[lower_index]:unbox()
		local upper_rotation = rotations[upper_index]:unbox()
		local new_rotation = Quaternion.lerp(lower_rotation, upper_rotation, lerp_value)

		Unit.set_local_position(dice_unit, 0, new_position)
		Unit.set_local_rotation(dice_unit, 0, new_rotation)

		if lower_index >= data.completed_index and data.success and not data.highlighted then
			self:_add_to_glow_list(dice_unit)

			data.highlighted = true
		end

		local sound_event = self._sound_events[lower_index]

		if sound_event then
			WwiseWorld.trigger_event(self.wwise_world, sound_event)

			self._sound_events[lower_index] = false
		end

		if progress == total_positions_rotations then
			finished_dice = finished_dice + 1
		end
	end

	self:_update_glow(dt)

	if finished_dice == table.size(dice_units) then
		if not self.grace_time then
			self.grace_time = 0
		elseif self.grace_time >= 1.5 then
			self.rolling = false
			self.rolling_finished = self:cleanup_post_roll()
			self.grace_time = nil
		else
			self.grace_time = self.grace_time + dt
		end
	end

	self.roll_time = roll_time
end

DiceRoller.cleanup_post_roll = function (self)
	local dice_units = self.dice_units
	local dice_units_to_remove = {}
	local finished_dice = 0

	self.needs_rerolls = false

	for dice_unit, data in pairs(dice_units) do
		dice_units_to_remove[#dice_units_to_remove + 1] = dice_unit

		if data.dice_result ~= 0 then
			self.remaining_dice[data.dice_type] = self.remaining_dice[data.dice_type] - 1
			finished_dice = finished_dice + 1
		else
			local num_successes_per_type = self.remaining_dice[data.dice_type].successes or 0

			self.remaining_dice[data.dice_type].successes = data.success and num_successes_per_type + 1 or num_successes_per_type
			self.needs_rerolls = true
		end
	end

	local num_dice_units_to_remove = #dice_units_to_remove

	if self.needs_rerolls then
		for i = 1, num_dice_units_to_remove do
			local unit = dice_units_to_remove[i]

			self.dice_units[unit] = nil

			World.destroy_unit(self.world, unit)
		end
	end

	Managers.world:destroy_world(self.simulation_world)

	self.post_cleanup_done = true

	return finished_dice == num_dice_units_to_remove
end

if Development.parameter("dice_chance_simulation") then
	local dice_configurations = {
		{
			7,
			0,
			0,
			0,
		},
		{
			6,
			0,
			1,
			0,
		},
		{
			6,
			1,
			0,
			0,
		},
		{
			6,
			0,
			0,
			1,
		},
		{
			5,
			0,
			2,
			0,
		},
		{
			5,
			2,
			0,
			0,
		},
		{
			5,
			0,
			0,
			2,
		},
		{
			5,
			1,
			1,
			0,
		},
		{
			5,
			0,
			1,
			1,
		},
		{
			5,
			1,
			0,
			1,
		},
		{
			4,
			0,
			3,
			0,
		},
		{
			4,
			1,
			2,
			0,
		},
		{
			4,
			0,
			2,
			1,
		},
		{
			4,
			2,
			1,
			0,
		},
		{
			4,
			0,
			1,
			2,
		},
		{
			4,
			1,
			1,
			1,
		},
		{
			4,
			1,
			0,
			2,
		},
		{
			4,
			2,
			0,
			1,
		},
		{
			3,
			1,
			3,
			0,
		},
		{
			3,
			0,
			3,
			1,
		},
		{
			3,
			2,
			2,
			0,
		},
		{
			3,
			0,
			2,
			2,
		},
		{
			3,
			1,
			2,
			1,
		},
		{
			3,
			2,
			1,
			1,
		},
		{
			3,
			1,
			1,
			2,
		},
		{
			3,
			2,
			0,
			2,
		},
		{
			2,
			2,
			3,
			0,
		},
		{
			2,
			0,
			3,
			2,
		},
		{
			2,
			1,
			3,
			1,
		},
		{
			2,
			2,
			2,
			1,
		},
		{
			2,
			1,
			2,
			2,
		},
		{
			2,
			2,
			1,
			2,
		},
		{
			1,
			2,
			3,
			1,
		},
		{
			1,
			1,
			3,
			2,
		},
		{
			1,
			2,
			2,
			2,
		},
		{
			0,
			2,
			3,
			2,
		},
	}
	local probabilities = {
		0.3333333333333333,
		0.5,
		0.6666666666666666,
		1,
	}
	local results = {}
	local num_simulations = 20

	for i = 1, #dice_configurations do
		local config = dice_configurations[i]
		local successes = {}

		for j = 1, num_simulations do
			local num_successes = 0

			for k = 1, 4 do
				local die_amount = config[k]
				local probability = probabilities[k]

				for l = 1, die_amount do
					if probability > math.random() then
						num_successes = num_successes + 1
					end
				end
			end

			if not successes[num_successes] then
				successes[num_successes] = 0
			end

			successes[num_successes] = successes[num_successes] + 1
		end

		for i = 0, 7 do
			if successes[i] then
				successes[i] = math.round_with_precision(successes[i] / num_simulations * 100, 3) .. "%"
			end
		end

		print("-----")
		table.dump(successes)
	end
end
