-- chunkname: @scripts/managers/performance/performance_manager.lua

PerformanceManager = class(PerformanceManager)

PerformanceManager.init = function (self, gui, is_server, level_key)
	self._gui = gui
	self._is_server = is_server
	self._tracked_ai_breeds = {
		beastmen_bestigor = true,
		beastmen_gor = true,
		beastmen_ungor = true,
		beastmen_ungor_archer = true,
		chaos_berzerker = true,
		chaos_bulwark = true,
		chaos_fanatic = true,
		chaos_marauder = true,
		chaos_marauder_with_shield = true,
		chaos_raider = true,
		chaos_warrior = true,
		skaven_clan_rat = true,
		skaven_clan_rat_with_shield = true,
		skaven_plague_monk = true,
		skaven_slave = true,
		skaven_storm_vermin = true,
		skaven_storm_vermin_commander = true,
		skaven_storm_vermin_with_shield = true,
	}
	self._num_ai_spawned = 0
	self._num_ai_active = 0
	self._num_event_ai_spawned = 0
	self._num_event_ai_active = 0
	self._num_ai_string = "SPAWNED: %3i   ACTIVE: %3i   EVENT SPAWNED: %3i   EVENT SPAWNED ACTIVE: %3i"
	self._settings = {
		critical = {
			distance_from_top = 60,
			font = "materials/fonts/arial",
			material = "arial",
			size = 36,
			color = ColorBox(255, 255, 0, 0),
			color_to = ColorBox(255, 255, 255, 0),
			position = Vector3Box(),
		},
		normal = {
			distance_from_top = 30,
			font = "materials/fonts/arial",
			material = "arial",
			size = 26,
			color = ColorBox(255, 0, 255, 0),
			position = Vector3Box(),
		},
	}

	if not DEDICATED_SERVER then
		local w, h = Gui.resolution()

		for _, setting in pairs(self._settings) do
			local min, max = Gui.text_extents(gui, self._num_ai_string, setting.font, setting.size, setting.material)
			local x = math.floor((w + min.x - max.x) * 0.5)
			local y = h - setting.distance_from_top
			local z = 999

			setting.position:store(x, y, z)
		end
	end

	self._events = {
		ai_unit_activated = "event_ai_unit_activated",
		ai_unit_deactivated = "event_ai_unit_deactivated",
		ai_unit_despawned = "event_ai_unit_despawned",
		ai_unit_spawned = "event_ai_unit_spawned",
	}

	local event_manager = Managers.state.event

	for event_name, cb_name in pairs(self._events) do
		event_manager:register(self, event_name, cb_name)
	end

	local level_settings = LevelSettings[level_key]
	local perf = level_settings and level_settings.performance

	self._allowed_active = perf and perf.allowed_active or 40
	self._allowed_spawned = perf and perf.allowed_spawned or 75
	self._activated_per_breed = {}

	for breed_name, breed in pairs(Breeds) do
		self._activated_per_breed[breed_name] = 0
	end
end

PerformanceManager.update = function (self, dt, t)
	return
end

PerformanceManager.event_ai_unit_spawned = function (self, unit, breed_name, side_id, event_spawned)
	if not self._tracked_ai_breeds[breed_name] then
		return
	end

	if side_id ~= Managers.state.conflict.default_enemy_side_id then
		return
	end

	self._num_ai_spawned = self._num_ai_spawned + 1

	if event_spawned then
		self._num_event_ai_spawned = self._num_event_ai_spawned + 1
	end
end

PerformanceManager.event_ai_unit_activated = function (self, unit, breed_name, event_spawned)
	self._activated_per_breed[breed_name] = self._activated_per_breed[breed_name] + 1

	if not self._tracked_ai_breeds[breed_name] then
		return
	end

	self._num_ai_active = self._num_ai_active + 1

	if event_spawned then
		self._num_event_ai_active = self._num_event_ai_active + 1
	end
end

PerformanceManager.event_ai_unit_deactivated = function (self, unit, breed_name, event_spawned)
	self._activated_per_breed[breed_name] = self._activated_per_breed[breed_name] - 1

	if not self._tracked_ai_breeds[breed_name] then
		return
	end

	self._num_ai_active = self._num_ai_active - 1

	if event_spawned then
		self._num_event_ai_active = self._num_event_ai_active - 1
	end
end

PerformanceManager.event_ai_unit_despawned = function (self, unit, breed_name, side_id, event_spawned)
	if not self._tracked_ai_breeds[breed_name] then
		return
	end

	if side_id ~= Managers.state.conflict.default_enemy_side_id then
		return
	end

	self._num_ai_spawned = self._num_ai_spawned - 1

	if event_spawned then
		self._num_event_ai_spawned = self._num_event_ai_spawned - 1
	end
end

PerformanceManager.num_active_enemies = function (self)
	return self._num_ai_active
end

PerformanceManager.num_active_enemies_of_breed = function (self, breed_name)
	return self._activated_per_breed[breed_name]
end

PerformanceManager.activated_per_breed = function (self)
	return self._activated_per_breed
end

PerformanceManager.destroy = function (self)
	local event_manager = Managers.state.event

	for event_name, cb_name in pairs(self._events) do
		event_manager:unregister(event_name, self)
	end
end
