require("scripts/utils/benchmark/benchmark_settings")

BenchmarkHandler = class(BenchmarkHandler)

BenchmarkHandler.init = function (self, ingame_ui, world)
	self._cycle_time = BenchmarkSettings.initial_cycle_time
	self._cycle_views = BenchmarkSettings.cycle_views
	self._cycle_view_time = BenchmarkSettings.cycle_view_time
	self._ingame_ui = ingame_ui
	self._bot_selection_timer = 0
	self._portal_index = 1
	self._current_path = 1
	self._current_node_index = 1
	self._time_since_last_teleport = 0
	self._next_teleport_time = BenchmarkSettings.main_path_teleport_time
	self._world = world
	self._performance_data = {}

	Managers.input:create_input_service("benchmark", "BenchmarkControllerSettings")
	Managers.input:map_device_to_service("benchmark", "keyboard")
	Managers.input:map_device_to_service("benchmark", "mouse")
	Managers.input:map_device_to_service("benchmark", "gamepad")
	Managers.input:block_device_except_service("benchmark", "keyboard", 1)
	Managers.input:block_device_except_service("benchmark", "mouse", 1)
	Managers.input:block_device_except_service("benchmark", "gamepad", 1)

	script_data.benchmark = self
	script_data.game_seed = BenchmarkSettings.game_seed

	if BenchmarkSettings.bot_power_level_override then
		BackendUtils.get_total_power_level = function (backend_id, player_unit)
			return MAX_POWER_LEVEL
		end
	end

	if BenchmarkSettings.bot_damage_multiplier then
		local old_add_damage_func = GenericHealthExtension.add_damage
		local dmg_mult = BenchmarkSettings.bot_damage_multiplier

		GenericHealthExtension.add_damage = function (self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type)
			damage_amount = damage_amount * dmg_mult

			old_add_damage_func(self, attacker_unit, damage_amount, hit_zone_name, damage_type, damage_direction, damage_source_name, hit_ragdoll_actor, damaging_unit, hit_react_type)
		end
	end

	PlayerBotUnitFirstPerson.animation_event = function (s, event)
		Unit.animation_event(s.first_person_unit, event)
	end

	script_data.recycler_in_cutscene = true
	script_data.recycler_in_freeflight = true
	script_data.ai_bots_disabled = false

	if BenchmarkSettings.is_story_based then
		script_data.ai_boss_spawning_disabled = true
		script_data.ai_specials_spawning_disabled = true
	end

	Development.set_parameter("disable_loading_icon", true)

	if PLATFORM == "win32" then
		local package_name = "resource_packages/breeds/chaos_troll"
		local async = true
		local prioritize = false

		Managers.package:load(package_name, "global", nil, async, prioritize)
	end
end

BenchmarkHandler.story_spawn_and_animate_troll = function (self, element, t)
	local level_analysis = Managers.state.conflict.level_analysis
	local node_units = level_analysis.generic_ai_node_units[element.ai_node_id]
	local position = Unit.local_position(node_units[1], 0)
	local rotation = Unit.local_rotation(node_units[1], 0)
	local unit_name = "units/beings/enemies/chaos_troll/chr_chaos_troll"
	local troll_unit = World.spawn_unit(self._world, unit_name, position, rotation)
	local wpn_unit_name = "units/weapons/enemy/wpn_chaos_troll/wpn_chaos_troll_01"
	local wpn_unit = World.spawn_unit(self._world, wpn_unit_name, position, rotation)
	local troll_node_index = Unit.node(troll_unit, "j_leftweaponattach")
	local wpn_node_index = 0

	World.link_unit(self._world, wpn_unit, wpn_node_index, troll_unit, troll_node_index)
	Unit.animation_event(troll_unit, "benchmark_attack")
end

BenchmarkHandler.story_destroy_close_units = function (self, element, t)
	local radius_squared = element.radius_squared or 900

	Managers.state.conflict:destroy_close_units(nil, radius_squared)
end

BenchmarkHandler.story_teleport_party = function (self, element, t)
	local portals = ConflictUtils.get_teleporter_portals()
	local portal_id = element.portal_id
	local pos = portals[portal_id][1]:unbox()
	local rot = portals[portal_id][2]:unbox()
	local local_player = Managers.player:local_player()

	if local_player then
		local player_unit = local_player.player_unit

		if Unit.alive(player_unit) then
			local locomotion = ScriptUnit.extension(player_unit, "locomotion_system")
			local world = Managers.world:world("level_world")

			LevelHelper:flow_event(world, "teleport_" .. portal_id)
			locomotion:teleport_to(pos, rot)
		end
	end

	local function f(unit, blackboard)
		blackboard.locomotion_extension:teleport_to(pos)
	end

	self:run_func_on_bots(f)
end

BenchmarkHandler.recycler_spawn_at = function (self, element, t)
	local p = element.position
	local position = Vector3Box(p[1], p[2], p[3])
	local ends_at = t + element.duration

	Managers.state.conflict:set_recycler_extra_pos(position, ends_at)
end

BenchmarkHandler.story_troll_sound = function (self, element, t)
	WwiseUtils.trigger_position_event(self._world, "Play_military_benchmark_troll", Vector3(0, 0, 0))
end

BenchmarkHandler.story_end_benchmark = function (self, element, t)
	self._ingame_ui.leave_game = true
	self._disabled = true

	if BenchmarkSettings.attract_benchmark then
		self:write_data()

		Boot.quit_game = true
	end
end

BenchmarkHandler._setup_initial_values = function (self, t)
	self._paths = Managers.state.conflict.level_analysis:get_main_paths()

	Managers.input:block_device_except_service("benchmark", "keyboard", 1)
	Managers.input:block_device_except_service("benchmark", "mouse", 1)
	Managers.input:block_device_except_service("benchmark", "gamepad", 1)

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	self._local_player_unit = player_unit
	local status_extension = ScriptUnit.extension(player_unit, "status_system")

	status_extension:set_invisible(true)

	self._overview_timer = t + BenchmarkSettings.initial_overview_time
	self._overview = false

	if BenchmarkSettings.is_story_based then
		self:_disable_third_person()
	end

	self._initialized = true
end

BenchmarkHandler.run_func_on_bots = function (self, f, ...)
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS
	local player_manager = Managers.player

	for _, bot_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		local player = player_manager:owner(bot_unit)

		if not player:is_player_controlled() then
			local blackboard = BLACKBOARDS[bot_unit]
			local result = f(bot_unit, blackboard, ...)

			if result then
				return result
			end
		end
	end
end

BenchmarkHandler.gather_performance_data = function (self, dt, t)
	self._performance_data[#self._performance_data + 1] = {
		dt,
		t
	}
end

BenchmarkHandler.write_data = function (self)
	local d = os.date("*t")
	local date_string = string.format("%d%d%d_%d%d%d", d.year, d.month, d.day, d.hour, d.min, d.sec)
	local file_name = string.format("benchmark_data_%s.txt", date_string)
	local file = io.open(file_name, "w")

	file:write(string.format("Perfomance Data, recorded: %s\n", os.date()))
	file:write(Application.sysinfo())
	file:write("\n---\n")
	file:write(string.format("Build type: %s\n", BUILD))
	file:write(string.format("Build identifier: %s\n", Application.build_identifier()))
	file:write("---\n")
	file:write("[t, dt]\n")

	for i, data in ipairs(self._performance_data) do
		local dt = data[1]
		local t = data[2]

		file:write(string.format("%f, %f\n", t, dt))
	end

	file:close()

	self._performance_data = {}
end

BenchmarkHandler.update = function (self, dt, t)
	if BenchmarkSettings.attract_benchmark then
		self:gather_performance_data(dt, t)
	end

	if self:_handle_early_out(t) or self._disabled then
		return
	end

	if BenchmarkSettings.is_story_based then
		return
	end

	local sum = 0
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS

	for _, bot_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		local blackboard = BLACKBOARDS[bot_unit]

		if blackboard then
			sum = sum + #blackboard.proximite_enemies
		end
	end

	if self._overview then
		self:_update_overview(dt, t)
	else
		self:_update_selected_bot(dt, t)
		self:_update_bot_view(dt, t)
	end

	self:_update_main_path(dt, t, sum)
end

function get_local_player_unit()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	return player_unit
end

BenchmarkHandler._handle_early_out = function (self, t)
	if self._initialized then
		return
	end

	if not Managers.state.entity then
		return true
	end

	local cutscene_system = Managers.state.entity:system("cutscene_system")
	local setup = nil

	if BenchmarkSettings.is_story_based then
		if get_local_player_unit() then
			setup = true
		end
	elseif cutscene_system:has_intro_cutscene_finished_playing() then
		setup = true
	end

	if setup then
		self:_setup_initial_values(t)
	else
		return true
	end
end

BenchmarkHandler._disable_third_person = function (self, override)
	if self._third_person_disabled and not override then
		return
	end

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local first_person_ext = ScriptUnit.extension(player_unit, "first_person_system")

	first_person_ext:show_third_person_units(false)

	self._third_person_disabled = true
end

BenchmarkHandler._camera_follow_bot = function (self)
	local entity_manager = Managers.state.entity
	local camera_system = entity_manager:system("camera_system")
	local player = Managers.player:local_player()
	local follow_unit = self._current_bot
	local follow_node_name = "j_spine"

	camera_system:set_follow_unit(player, follow_unit, follow_node_name)
end

BenchmarkHandler._set_overview_camera = function (self, t)
	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	ai_bot_group_system:first_person_debug(nil)

	script_data.attract_mode_spectate = true

	CharacterStateHelper.change_camera_state(Managers.player:local_player(), "attract")

	local first_person_ext = ScriptUnit.extension(self._local_player_unit, "first_person_system")

	first_person_ext:set_first_person_mode(false, true)
	self:_disable_third_person(true)

	self._bot_name = nil
	self._last_bot_view = nil
	self._overview_timer = t + BenchmarkSettings.overview_duration
	self._overview = true
end

BenchmarkHandler._disable_overview_camera = function (self)
	CharacterStateHelper.change_camera_state(Managers.player:local_player(), "idle")
	self:_disable_third_person(true)

	script_data.attract_mode_spectate = false
end

BenchmarkHandler._update_overview = function (self, dt, t)
	if self._overview_timer < t then
		self:_disable_overview_camera()

		self._overview = false
		self._overview_timer = t + BenchmarkSettings.overview_downtime
		self._bot_selection_timer = 0

		self:_update_selected_bot(dt, t)

		return
	end
end

BenchmarkHandler._update_selected_bot = function (self, dt, t)
	self._bot_selection_timer = self._bot_selection_timer - dt

	if self._bot_selection_timer > 0 then
		return
	end

	if self._overview_timer < t then
		self:_set_overview_camera(t)

		return
	end

	self._bot_selection_timer = BenchmarkSettings.bot_selection_timer
	local potential_bot_index = nil
	local current_view = self._current_bot_view
	local bots = Managers.player:bots()

	for bot_index, bot in pairs(bots) do
		local bot_unit = bot.player_unit

		if Unit.alive(bot_unit) then
			local blackboard = BLACKBOARDS[bot_unit]

			if blackboard and #blackboard.proximite_enemies > 0 then
				if bot_index == self._current_bot_view then
					return
				else
					potential_bot_index = bot_index
				end
			end
		end
	end

	self._current_bot_view = potential_bot_index or self._current_bot_view or 3
end

BenchmarkHandler._update_bot_view = function (self, dt, t)
	if self._overview then
		return
	end

	local current_bot_in_view = self._current_bot_view

	if current_bot_in_view ~= self._last_bot_view then
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
		local fade_system = Managers.state.entity:system("fade_system")
		local locomotion_system = Managers.state.entity:system("locomotion_system")
		local bot_player = Managers.player:local_player(current_bot_in_view + 1)

		if self._current_bot then
			local input_ext = ScriptUnit.has_extension(self._current_bot, "input_system")

			input_ext:set_bot_in_attract_mode_focus(false)

			local first_person_ext = ScriptUnit.extension(self._current_bot, "first_person_system")

			first_person_ext:set_first_person_mode(false)
		end

		self._current_bot = bot_player.player_unit
		local input_ext = ScriptUnit.has_extension(self._current_bot, "input_system")

		input_ext:set_bot_in_attract_mode_focus(true)
		ai_bot_group_system:first_person_debug(current_bot_in_view)
		fade_system:local_player_created(bot_player)
		locomotion_system:set_override_player(bot_player)

		local first_person_ext = ScriptUnit.extension(self._current_bot, "first_person_system")

		first_person_ext:set_first_person_mode(true)

		self._last_bot_view = current_bot_in_view
	end
end

local PLAYER_DISTANCE_SQR = {}

BenchmarkHandler._update_main_path = function (self, dt, t, total_proximate_enemies)
	self._time_since_last_teleport = self._time_since_last_teleport + dt

	if BenchmarkSettings.destroy_close_enemies_timer < self._time_since_last_teleport then
		Managers.state.conflict:destroy_close_units(nil, BenchmarkSettings.destroy_close_enemies_radius)

		self._time_since_last_teleport = 0

		print("Teleportation took too long -> despawning enemies")
	end

	local player_unit = self._local_player_unit
	local min_dist_sqr = math.huge
	local closest_ally = nil
	local player_pos = POSITION_LOOKUP[player_unit]
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS

	for _, bot_unit in ipairs(PLAYER_AND_BOT_UNITS) do
		if bot_unit ~= player_unit then
			local bot_pos = POSITION_LOOKUP[bot_unit]
			local dist_to_player = Vector3.distance_squared(bot_pos, player_pos)
			PLAYER_DISTANCE_SQR[bot_unit] = dist_to_player

			if dist_to_player < min_dist_sqr then
				min_dist_sqr = dist_to_player
				closest_ally = bot_unit
			end
		end
	end

	local teleport_now = false

	if min_dist_sqr < 8 then
		if total_proximate_enemies <= 0 then
			teleport_now = true
		else
			local blackboard = BLACKBOARDS[closest_ally]

			if blackboard.proximite_enemies == 0 then
				local max = 0
				local ally_in_need = nil

				for _, bot_unit in ipairs(PLAYER_AND_BOT_UNITS) do
					local blackboard = BLACKBOARDS[bot_unit]

					if blackboard then
						local num = #blackboard.proximite_enemies

						if max < num then
							ally_in_need = bot_unit
							max = num
						end
					end

					local pos = POSITION_LOOKUP[ally_in_need]
					local locomotion = ScriptUnit.has_extension(player_unit, "locomotion_system")

					locomotion:teleport_to(pos)
					print("One bot is close to player, with no enemis around, but other bot is off fighting, teleport and help him")

					return
				end
			else
				local function f(unit, blackboard)
					if Unit.alive(blackboard.target_unit) then
						return unit
					end
				end

				local bot_in_need_unit = self:run_func_on_bots(f)

				if bot_in_need_unit and PLAYER_DISTANCE_SQR[bot_in_need_unit] > 2 then
					local pos = POSITION_LOOKUP[bot_in_need_unit]
					local locomotion = ScriptUnit.has_extension(player_unit, "locomotion_system")

					locomotion:teleport_to(pos)
					print("Bot in need of help, teleporting to him")
				end
			end
		end
	end

	local conflict_director = Managers.state.conflict
	local player_path_info = conflict_director.main_path_player_info[player_unit]
	local bot_path_info = conflict_director.main_path_player_info[closest_ally]

	if bot_path_info.path_index ~= player_path_info.path_index then
		local function f(unit, blackboard)
			blackboard.locomotion_extension:teleport_to(player_pos)
		end

		self:run_func_on_bots(f)
	end

	self._next_teleport_time = self._next_teleport_time - dt

	if teleport_now then
		local current_path_nodes = self._paths[self._current_path].nodes
		local pos = current_path_nodes[self._current_node_index]:unbox()

		if not Unit.alive(player_unit) then
			return
		end

		local locomotion = ScriptUnit.has_extension(player_unit, "locomotion_system")

		if not locomotion then
			return
		end

		locomotion:teleport_to(pos)

		self._next_teleport_time = BenchmarkSettings.main_path_teleport_time
		self._time_since_last_teleport = 0

		self:_disable_third_person()
		print("Teleporting to", pos, self._current_path, self._current_node_index)

		self._current_node_index = self._current_node_index + 1

		if self._current_node_index > #current_path_nodes then
			self._current_node_index = 1
			self._current_path = self._current_path + 1

			if self._current_path > #self._paths then
				self._ingame_ui.leave_game = true
				self._disabled = true

				if BenchmarkSettings.attract_benchmark then
					self:write_data()

					Boot.quit_game = true
				end
			end
		end
	end
end

BenchmarkHandler.destroy = function (self)
	Managers.input:device_unblock_all_services("keyboard")
	Managers.input:device_unblock_all_services("mouse")
	Managers.input:device_unblock_all_services("gamepad")
	Development.set_parameter("disable_loading_icon", false)
end

BenchmarkHandler._get_teleporter_portals = function (self)
	local level_key = Managers.state.game_mode:level_key()
	local level_name = LevelSettings[level_key].level_name
	local portals = {}
	local unit_ind = LevelResource.unit_indices(level_name, "units/hub_elements/portal")

	for _, id in ipairs(unit_ind) do
		local pos = LevelResource.unit_position(level_name, id)
		local unit_data = LevelResource.unit_data(level_name, id)
		local portal_id = DynamicData.get(unit_data, "id")
		local boxed_rot = QuaternionBox(Quaternion(Vector3.up(), math.degrees_to_radians(Math.random(1, 360))))
		local boxed_pos = Vector3Box(pos)
		portals[portal_id] = boxed_pos
	end

	return portals
end

BenchmarkHandler._update_info = function (self)
	Debug.text("Press 'TAB' to cycle through views")

	if self._bot_name then
		Debug.text("Current View: %s [BOT] ", self._bot_name)
	else
		Debug.text("Current View: Spectate")
	end
end

BenchmarkHandler._handle_views = function (self, dt, t)
	if not self._cycle_views then
		return
	end

	self._cycle_view_time = self._cycle_view_time - dt

	if self._cycle_view_time <= 0 then
		self._trigger_cycle_view = true
		self._cycle_view_time = BenchmarkSettings.cycle_view_time
	end
end

BenchmarkHandler._update_input = function (self, dt, t)
	self:_update_info()
	Managers.input:block_device_except_service("benchmark", "keyboard", 1)
	Managers.input:block_device_except_service("benchmark", "mouse", 1)
	Managers.input:block_device_except_service("benchmark", "gamepad", 1)

	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local input_service = Managers.input:get_service("benchmark")

	if input_service:get("cycle_through_views") or self._trigger_cycle_view then
		self._trigger_cycle_view = false
		local bots = Managers.player:bots()
		local num_bots = #bots
		self._current_bot_view = 1 + (self._current_bot_view or 0) % num_bots

		if self._current_bot_view > 0 then
			ai_bot_group_system:first_person_debug(self._current_bot_view)
			CharacterStateHelper.change_camera_state(Managers.player:local_player(), "idle")
			Development.set_parameter("attract_mode_spectate", false)

			for _, bot in ipairs(bots) do
				local first_person_ext = ScriptUnit.extension(bot.player_unit, "first_person_system")

				if first_person_ext.first_person_debug then
					self._bot_name = bot.character_name

					break
				end
			end
		else
			ai_bot_group_system:first_person_debug(nil)
			Development.set_parameter("attract_mode_spectate", true)
			CharacterStateHelper.change_camera_state(Managers.player:local_player(), "attract")

			local first_person_ext = ScriptUnit.extension(self._local_player_unit, "first_person_system")

			first_person_ext:set_first_person_mode(false, true)

			self._bot_name = nil
		end
	end
end

BenchmarkHandler._handle_teleport = function (self, dt, t)
	if self._teleporting then
		return
	end

	self._cycle_time = self._cycle_time - dt

	if self._cycle_time <= 0 then
		local portal_data = self._portals[self._portal_index]

		if portal_data then
			local conflict_director = Managers.state.conflict

			conflict_director:destroy_all_units(true)
			Managers.transition:fade_in(2, callback(self, "cb_fade_in_done", portal_data))

			self._teleporting = true
		end

		self._cycle_time = BenchmarkSettings.cycle_time
		self._portal_index = 1 + self._portal_index % #self._portals
	end
end

BenchmarkHandler.cb_fade_in_done = function (self, portal_data)
	local pos = portal_data.boxed_pos:unbox()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local locomotion = ScriptUnit.extension(player_unit, "locomotion_system")
	local world = Managers.world:world("level_world")

	LevelHelper:flow_event(world, "teleport_" .. portal_data.key)
	locomotion:teleport_to(pos)
	Managers.transition:fade_out(0.5, callback(self, "cb_fade_out_done"))
end

BenchmarkHandler.cb_fade_out_done = function (self)
	self._teleporting = nil
end

return
