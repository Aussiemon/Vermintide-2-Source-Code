ImguiSpawning = class(ImguiSpawning)

ImguiSpawning.init = function (self)
	self._breed_index = 0
	self._breed_names = table.keys(Breeds)

	table.sort(self._breed_names)

	self._pickup_index = 0
	self._pickup_names = table.keys(AllPickups)

	table.sort(self._pickup_names)

	self._mark_outline_extension = nil
	self._mark_outline_id = nil
	self._damage = 100
end

ImguiSpawning.update = function (self)
	if self._mark_outline_extension then
		self._mark_outline_extension:remove_outline(self._mark_outline_id)

		self._mark_outline_extension = nil
	end
end

local debug_breed = "skaven_clan_rat"

local function monkey_patched_get_debug_breed()
	return Breeds[debug_breed]
end

ImguiSpawning.draw = function (self)
	local do_close = Imgui.begin_window("Spawning")
	local pickup_name = self._pickup_names[self._pickup_index]

	if Imgui.button("Spawn Pickup", 100, 20) and pickup_name then
		local world = Application.main_world()
		local position = Managers.state.conflict:player_aim_raycast(world, false, "filter_ray_horde_spawn")

		if position then
			Managers.state.network.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", NetworkLookup.pickup_names[pickup_name], position, Quaternion.identity(), NetworkLookup.pickup_spawn_types.dropped)
		end
	end

	Imgui.same_line()

	self._pickup_index = Imgui.combo("Pickup", self._pickup_index, self._pickup_names)

	Imgui.separator()

	local breed_name = self._breed_names[self._breed_index]

	if Imgui.button("Spawn Breed", 100, 20) and breed_name then
		local conflict_director = Managers.state.conflict
		debug_breed = breed_name
		conflict_director.get_debug_breed = monkey_patched_get_debug_breed

		conflict_director:debug_spawn_breed(0)

		conflict_director.get_debug_breed = nil
	end

	Imgui.same_line()

	self._breed_index = Imgui.combo("Breed", self._breed_index, self._breed_names)
	script_data.disable_ai_perception = Imgui.checkbox("Disable AI perception", script_data.disable_ai_perception or false)

	Imgui.separator()

	if Managers.state and Managers.state.conflict then
		self._damage = Imgui.slider_int("Damage", self._damage, 1, 1000)
		local world = Application.main_world()
		local breed, pos, distance, normal, actor = Managers.state.conflict:player_aim_raycast(world, true, "filter_player_ray_projectile")

		Imgui.text("Looking at: " .. (breed and breed.name or "n/a"))

		if breed then
			local unit = Actor.unit(actor)
			local outline_extension = ALIVE[unit] and ScriptUnit.has_extension(unit, "outline_system")

			if outline_extension then
				self._mark_outline_extension = outline_extension
				self._mark_outline_id = outline_extension:add_outline(OutlineSettings.templates.target_ally)
			end
		end

		if (Imgui.button("Inflict damage (or mouse middle)", 100, 20) or Mouse.pressed(Mouse.button_id("middle"))) and breed then
			local unit = Actor.unit(actor)

			DamageUtils.debug_deal_damage(unit, self._damage)
		end
	end

	Imgui.end_window()

	return do_close
end

ImguiSpawning._clear_outline = function (self)
	return
end

ImguiSpawning.is_persistent = function (self)
	return true
end
