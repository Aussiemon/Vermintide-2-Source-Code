ImguiSpawning = class(ImguiSpawning)

ImguiSpawning.init = function (self)
	self._breed_names = table.keys(Breeds)
	self._breed_index = 0
	self._pickup_names = table.keys(AllPickups)
	self._pickup_index = 0
end

ImguiSpawning.update = function (self)
	return
end

local debug_breed = "skaven_clan_rat"

local function monkey_patched_get_debug_breed()
	return Breeds[debug_breed]
end

ImguiSpawning.draw = function (self)
	Imgui.Begin("Spawning")

	local pickup_name = self._pickup_names[self._pickup_index]

	if Imgui.Button("Spawn Pickup", 100, 20) and pickup_name then
		local world = Application.main_world()
		local position = Managers.state.conflict:player_aim_raycast(world, false, "filter_ray_horde_spawn")

		if position then
			local pickup_system = Managers.state.entity:system("pickup_system")

			pickup_system:_debug_spawn_pickup(pickup_name, position)
		end
	end

	Imgui.same_line()

	self._pickup_index = Imgui.Combo("Pickup", self._pickup_index - 1, self._pickup_names)

	Imgui.separator()

	local breed_name = self._breed_names[self._breed_index]

	if Imgui.Button("Spawn Breed", 100, 20) and breed_name then
		local conflict_director = Managers.state.conflict
		debug_breed = breed_name
		conflict_director.get_debug_breed = monkey_patched_get_debug_breed

		conflict_director:debug_spawn_breed(0)

		conflict_director.get_debug_breed = nil
	end

	Imgui.same_line()

	self._breed_index = Imgui.Combo("Breed", self._breed_index - 1, self._breed_names)
	script_data.disable_ai_perception = Imgui.checkbox("Disable AI perception", script_data.disable_ai_perception or false)

	Imgui.End()
end

ImguiSpawning.is_persistent = function (self)
	return false
end

return
