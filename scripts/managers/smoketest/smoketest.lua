local hooked_functions = {}
Mods = {
	hook = {
		set = function (mod_name, object, function_name, hook_function)
			local hooked_function = object[function_name]
			local hooks = hooked_functions[hooked_function]

			if hooks then
				hooks[mod_name] = hook_function
			else
				local hook_functions = {
					[mod_name] = hook_function
				}

				local function func(...)
					for mod_name, hook in pairs(hook_functions) do
						hook(hooked_function, ...)
					end
				end

				object[function_name] = func
				hooked_functions[func] = hook_functions
			end
		end
	}
}
local mod_name = "SmoketestBots"

BTConditions.has_to_teleport_to_next_segment_on_mainpath = function (blackboard)
	local bb_follow = blackboard.follow
	bb_follow.needs_target_position_refresh = false
	local self_unit = blackboard.unit
	local main_path_data = Managers.state.conflict:get_main_path_player_data(self_unit)

	if main_path_data then
		local current_point = main_path_data.travel_dist
		local current_segment = main_path_data.path_index
		local _, next_point_segment = EngineOptimized.point_on_mainpath(current_point + 5)

		if next_point_segment and current_segment < next_point_segment then
			return true
		end
	end

	return false
end

BTBotSmoketestMainpathNavigationAction = class(BTBotSmoketestMainpathNavigationAction, BTNode)

BTBotSmoketestMainpathNavigationAction.init = function (self, ...)
	BTBotSmoketestMainpathNavigationAction.super.init(self, ...)
end

BTBotSmoketestMainpathNavigationAction.name = "BTBotSmoketestMainpathNavigationAction"

BTBotSmoketestMainpathNavigationAction.enter = function (self, unit, blackboard, t)
	blackboard.has_teleported = false
	blackboard.follow.needs_target_position_refresh = false
end

BTBotSmoketestMainpathNavigationAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.follow.goal_selection_func = nil
end

BTBotSmoketestMainpathNavigationAction.run = function (self, unit, blackboard, t, dt)
	local main_path_data = Managers.state.conflict:get_main_path_player_data(unit)

	if main_path_data then
		local current_point = main_path_data.travel_dist
		local target_pos, _ = EngineOptimized.point_on_mainpath(current_point + 1)

		if target_pos then
			blackboard.follow.target_position = Vector3Box(target_pos)

			blackboard.navigation_extension:move_to(target_pos, blackboard.navigation_extension._queued_path_callback)
		end
	end

	return "running", "evaluate"
end

BTBotSmoketestTeleportToNextMainpathSegmentAction = class(BTBotSmoketestTeleportToNextMainpathSegmentAction, BTNode)
BTBotSmoketestTeleportToNextMainpathSegmentAction.name = "BTBotSmoketestTeleportToNextMainpathSegmentAction"
local MAX_ALLOWED_TELEPORT_DISTANCE = 10

BTBotSmoketestTeleportToNextMainpathSegmentAction.init = function (self, ...)
	BTBotSmoketestTeleportToNextMainpathSegmentAction.super.init(self, ...)
end

BTBotSmoketestTeleportToNextMainpathSegmentAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local a_star = blackboard.teleport.a_star
	blackboard.teleport = nil

	if not GwNavAStar.processing_finished(a_star) then
		GwNavAStar.cancel(a_star)
	end

	GwNavAStar.destroy(a_star)
end

BTBotSmoketestTeleportToNextMainpathSegmentAction.enter = function (self, unit, blackboard, t)
	blackboard.teleport = {
		state = "init",
		position = Vector3Box(Vector3.invalid_vector()),
		a_star = GwNavAStar.create()
	}
end

BTBotSmoketestTeleportToNextMainpathSegmentAction.run = function (self, unit, blackboard, t, dt)
	local target_ally_unit = blackboard.target_ally_unit
	local tp_bb = blackboard.teleport
	local a_star = tp_bb.a_star
	local state = tp_bb.state

	if Unit.alive(unit) and state == "init" then
		local main_path_data = Managers.state.conflict:get_main_path_player_data(unit)
		local current_point = main_path_data.travel_dist
		local target_pos, _ = EngineOptimized.point_on_mainpath(current_point + 6)
		local pos = LocomotionUtils.new_random_goal_uniformly_distributed(blackboard.nav_world, nil, target_pos, 2, 5, 5)

		if pos then
			tp_bb.position:store(pos)

			tp_bb.state = "a_star_search"

			GwNavAStar.start(a_star, blackboard.nav_world, target_pos, pos, Managers.state.bot_nav_transition:traverse_logic())
		end
	elseif state == "a_star_search" and GwNavAStar.processing_finished(a_star) then
		if GwNavAStar.path_found(a_star) and GwNavAStar.path_distance(a_star) < MAX_ALLOWED_TELEPORT_DISTANCE and GwNavAStar.node_count(a_star) > 0 then
			local node_count = GwNavAStar.node_count(a_star)
			local destination = GwNavAStar.node_at_index(a_star, node_count)
			local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

			locomotion_extension:teleport_to(destination)

			tp_bb.state = "done"
			blackboard.has_teleported = true

			blackboard.navigation_extension:teleport(destination)
			blackboard.ai_extension:clear_failed_paths()

			blackboard.follow.needs_target_position_refresh = true

			return "done"
		else
			tp_bb.state = "init"
		end
	end

	return "running"
end

local function find_and_replace(node_table, node_name, new_action_name, new_node_name, new_condition, new_condition_args, new_action_data)
	for i = 1, #node_table, 1 do
		local current_node = node_table[i]

		if i == 1 and node_table.name == node_name then
			node_table[1] = new_action_name or node_table[1]
			node_table.name = new_node_name or node_table.name
			node_table.condition = new_condition or node_table.condition
			node_table.condition_args = new_condition_args or node_table.condition_args
			node_table.action_data = new_action_data or node_table.action_data
		elseif i > 1 and type(current_node) == "table" then
			find_and_replace(current_node, node_name, new_action_name, new_node_name, new_condition, new_condition_args, new_action_data)
		end
	end
end

find_and_replace(BotBehaviors.default, "teleport_no_path", "BTBotSmoketestTeleportToNextMainpathSegmentAction", nil, "has_to_teleport_to_next_segment_on_mainpath")
find_and_replace(BotBehaviors.default, "successful_follow", "BTBotSmoketestMainpathNavigationAction", "successful_navigation")
Mods.hook.set(mod_name, SmoketestManager, "update", function (func, self, dt)
	if not self.timer then
		self.timer = 0
		self.bot_positions = {
			{
				Vector3Box(Vector3(-999, -999, -999)),
				os.time
			},
			{
				Vector3Box(Vector3(-999, -999, -999)),
				os.time
			},
			{
				Vector3Box(Vector3(-999, -999, -999)),
				os.time
			}
		}
	end

	local game_mode_manager = Managers.state.game_mode

	if not game_mode_manager then
		func(self, dt)

		return
	end

	if #Managers.player:bots() == 0 then
		func(self, dt)

		return
	end

	local level_transition_handler = game_mode_manager.level_transition_handler
	local packages_loaded = level_transition_handler:all_packages_loaded()

	if not packages_loaded then
		func(self, dt)

		return
	end

	local peer_id = Network:peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		func(self, dt)

		return
	end

	self.timer = self.timer + dt

	if self.timer > 1 then
		self.timer = 0
		local local_player = Managers.player.local_player(Managers.player)
		local player_unit = local_player.player_unit
		local current_state = ScriptUnit.extension(player_unit, "character_state_machine_system").state_machine.state_current.name
		local mainpath_length = EngineOptimized.main_path_total_length()
		local has_not_destroyed_units = true

		if current_state == "knocked_down" or current_state == "pounced_down" or current_state == "grabbed_by_pack_master" or (current_state == "grabbed_by_tentacle" and has_not_destroyed_units) then
			Managers.state.conflict:destroy_all_units()

			has_not_destroyed_units = false
		end

		local player_mover = Unit.mover(player_unit)
		local player_pos = Mover.position(player_mover)
		local player_main_path_data = Managers.state.conflict:get_main_path_player_data(player_unit)

		if player_main_path_data then
			local player_point = player_main_path_data.travel_dist
			local best_point = player_point
			local bot_table = Managers.player:bots()
			local bot_points = {}
			local BOT_TELEPORT_RANGE = 15

			for i = 1, #bot_table, 1 do
				local current_state = ScriptUnit.extension(bot_table[i].player_unit, "character_state_machine_system").state_machine.state_current.name

				if current_state == "knocked_down" or current_state == "pounced_down" or current_state == "grabbed_by_pack_master" or (current_state == "grabbed_by_tentacle" and has_not_destroyed_units) then
					Managers.state.conflict:destroy_all_units()

					has_not_destroyed_units = false
				end

				local bot_main_path_data = Managers.state.conflict:get_main_path_player_data(bot_table[i].player_unit)

				if bot_main_path_data then
					local bot_point = bot_main_path_data.travel_dist
					bot_points[#bot_points + 1] = bot_point

					if best_point < bot_point then
						best_point = bot_point
					end

					local bot_stuck_data = self.bot_positions[i]
					local bot_pos = Mover.position(Unit.mover(bot_table[i].player_unit))

					if Vector3.distance_squared(bot_stuck_data[1]:unbox(), bot_pos) < 2 then
						if os.time() - bot_stuck_data[2] > 10 then
							local tp_pos = EngineOptimized.point_on_mainpath(bot_point + 16)

							if tp_pos then
								tp_pos.z = tp_pos.z + 1

								Mover.set_position(Unit.mover(bot_table[i].player_unit), tp_pos)
							end

							if best_point < bot_point + 16 then
								best_point = bot_point + 16
							end
						end
					else
						bot_stuck_data[1]:store(bot_pos)

						bot_stuck_data[2] = os.time()
					end
				end
			end

			local target_position = nil

			if best_point ~= player_point then
				target_position = EngineOptimized.point_on_mainpath(best_point)
			end

			if target_position then
				target_position.z = target_position.z + 1

				Mover.set_position(player_mover, target_position)
			elseif player_point >= mainpath_length - 10 then
				target_position = EngineOptimized.point_on_mainpath(EngineOptimized.main_path_total_length() - 1)

				Mover.set_position(player_mover, target_position)
			end

			local camera_unit = Managers.player:local_player().camera_follow_unit
			local current_camera_state = ScriptUnit.extension(camera_unit, "camera_state_machine_system").state_machine.state_current.name

			if current_camera_state ~= "observer" then
				CharacterStateHelper.change_camera_state(Managers.player:local_player(), "observer")
			end

			if target_position then
				target_position.z = target_position.z - 1
				local direction = target_position - player_pos
				local rotation = stingray.Quaternion.look(direction)

				Unit.set_local_rotation(camera_unit, 0, rotation)
			end
		end
	end

	func(self, dt)
end)

function smoketest_change_items()
	Crashify.print_property("autotest", true)

	if not Managers.backend:is_local() then
		local function contains(tab, career)
			for _, v in pairs(tab) do
				if v == career then
					return true
				end
			end

			return false
		end

		local function remove_one_career(tab, career)
			for k, v in ipairs(tab) do
				if v == career then
					table.remove(tab, k)

					return
				end
			end
		end

		local careers = {
			"bw_scholar",
			"bw_adept",
			"bw_unchained",
			"we_shade",
			"we_maidenguard",
			"we_waywatcher",
			"wh_captain",
			"wh_bountyhunter",
			"wh_zealot",
			"es_mercenary",
			"es_knight",
			"es_huntsman",
			"dr_ranger",
			"dr_slayer",
			"dr_ironbreaker"
		}

		if Managers.player == nil then
			print("Managers.player is nil! Aborting change items!")

			return
		end

		if Managers.player:local_player() == nil then
			print("Managers.player:local_player() is nil! Aborting change items!")

			return
		end

		if Managers.player:local_player().player_unit == nil then
			print("Managers.player:local_player().player_unit is nil! Aborting change items!")

			return
		end

		local player_career = ScriptUnit.extension(Managers.player:local_player().player_unit, "career_system")._career_name

		if player_career == nil then
			print("Player career is nil! Aborting change items!")

			return
		end

		remove_one_career(careers, player_career)

		for _, career in pairs(careers) do
			local career_melee_weapon_slots = {}
			local career_ranged_weapon_slots = {}
			local backend_items_interface = Managers.backend:get_interface("items")
			local backend_items = backend_items_interface:get_all_backend_items()

			print("NumBackendItems ", #backend_items)

			for _, item in pairs(backend_items) do
				local item_key = item.key
				local item_info = ItemMasterList[item_key]

				if contains(item_info.can_wield, career) then
					if item_info.slot_type == "melee" then
						career_melee_weapon_slots[#career_melee_weapon_slots + 1] = item
					elseif item_info.slot_type == "ranged" then
						career_ranged_weapon_slots[#career_ranged_weapon_slots + 1] = item
					end
				end
			end

			local m = math.random(#career_melee_weapon_slots)
			local r = math.random(#career_ranged_weapon_slots)

			print(#career_melee_weapon_slots, #career_ranged_weapon_slots)
			print(m, r)

			local career_melee_weapon = nil

			if #career_melee_weapon_slots > 0 then
				career_melee_weapon = career_melee_weapon_slots[m]
			end

			local career_ranged_weapon = nil

			if #career_ranged_weapon_slots > 0 then
				career_ranged_weapon = career_ranged_weapon_slots[r]
			end

			if #career_ranged_weapon_slots > 0 and #career_melee_weapon_slots > 0 then
				print(career_melee_weapon, career_ranged_weapon)
				print(career_melee_weapon.key, career_ranged_weapon.key)
			end

			if #career_melee_weapon_slots > 0 then
				backend_items_interface:set_loadout_item(career_melee_weapon.backend_id, career, "slot_melee")
			else
				print("!! Skipped broken melee slot!")
			end

			if #career_ranged_weapon_slots > 0 then
				backend_items_interface:set_loadout_item(career_ranged_weapon.backend_id, career, "slot_ranged")
			else
				print("!! Skipped broken ranged slot!")
			end

			print(career)
			print("-------------")
		end
	else
		print("AUTO TEST : USING LOCAL BACKEND, NO CHANGES TO CAREER WEAPONS MADE")
	end
end

function smoketest_get_items(chosen_slot)
	local function contains(tab, career)
		for _, v in pairs(tab) do
			if v == career then
				return true
			end
		end

		return false
	end

	local items_hack_string = ""
	local player_career = ScriptUnit.extension(Managers.player:local_player().player_unit, "career_system")._career_name
	local backend_items_interface = Managers.backend:get_interface("items")
	local backend_items = backend_items_interface:get_all_backend_items()

	for id, item in pairs(backend_items) do
		local item_key = item.key
		local item_info = ItemMasterList[item_key]

		if contains(item_info.can_wield, player_career) and item_info.slot_type == chosen_slot then
			items_hack_string = items_hack_string .. " ||| " .. item_key .. " <> " .. id
		end
	end

	return items_hack_string
end

function smoketest_give_hero_all_weapons()
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local item_master_list = ItemMasterList
	local item_interface = Managers.backend:get_interface("items")
	local player_manager = Managers.player
	local player = player_manager:local_player(1)
	local profile_index = player:profile_index()
	local profile_settings = SPProfiles[profile_index]
	local profile_name = profile_settings.display_name
	local career_index = hero_attributes:get(profile_name, "career")
	local specializations = profile_settings.specializations
	local career_settings = specializations[career_index]
	local name = career_settings.name

	for key, item in pairs(item_master_list) do
		if (item.slot_type == "melee" or item.slot_type == "ranged") and table.contains(item.can_wield, name) and not item_interface:has_item(key) then
			item_interface:award_item(key)
		end
	end
end

return
