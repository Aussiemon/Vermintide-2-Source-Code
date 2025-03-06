-- chunkname: @scripts/entity_system/systems/tutorial/tutorial_templates.lua

local function apply_outline(unit)
	return
end

local function has_melee_weapon_equipped(unit)
	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	local slot_name = inventory_extension:get_wielded_slot_name()
	local slot_data = inventory_extension:get_slot_data(slot_name)

	if slot_data == nil then
		return false
	end

	local right_unit_1p = slot_data.right_unit_1p

	if ScriptUnit.has_extension(right_unit_1p, "ammo_system") then
		return false
	end

	return true
end

local POSITION_LOOKUP = POSITION_LOOKUP

TutorialTemplates = {}
TutorialTemplates.core_needs_help = {
	action = "interact",
	display_type = "tooltip",
	icon = "hud_tutorial_icon_attention",
	is_mission_tutorial = true,
	needed_points = 0,
	priority = 50,
	text = "player_in_need_of_help",
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit)
		local players = Managers.player:human_and_bot_players()
		local unit_position = POSITION_LOOKUP[unit]
		local best_distance_sq = math.huge
		local best_unit_position, has_raycast_unit, raycast_unit_pos, raycast_unit_dist

		for k, player in pairs(players) do
			local player_unit = player.player_unit

			if Unit.alive(player_unit) and unit ~= player_unit then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if not status_extension:is_dead() and (status_extension:is_pounced_down() or status_extension:get_is_ledge_hanging() or status_extension:is_grabbed_by_pack_master()) then
					local player_position = POSITION_LOOKUP[player_unit]
					local distance_sq = Vector3.distance_squared(unit_position, player_position)

					if player_unit == raycast_unit then
						has_raycast_unit = true
						raycast_unit_pos = player_position
						raycast_unit_dist = distance_sq
					end

					if distance_sq < best_distance_sq then
						best_distance_sq = distance_sq
						best_unit_position = player_position
					end
				end
			end
		end

		if has_raycast_unit and raycast_unit_dist < 400 then
			return true, raycast_unit_pos
		elseif best_unit_position then
			return true, best_unit_position
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTemplates.core_revive = {
	action = "interact",
	display_type = "tooltip",
	do_not_verify = true,
	icon = "hud_tutorial_icon_attention",
	is_mission_tutorial = true,
	needed_points = 0,
	priority = 45,
	text = "tutorial_tooltip_core_revive",
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local players = Managers.player:human_and_bot_players()
		local unit_position = POSITION_LOOKUP[unit]
		local best_distance_sq = math.huge
		local best_unit_position, has_raycast_unit, raycast_unit_pos, raycast_unit_dist

		for k, player in pairs(players) do
			local player_unit = player.player_unit

			if Unit.alive(player_unit) and unit ~= player_unit then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if status_extension:is_knocked_down() and not status_extension:is_dead() then
					local player_position = POSITION_LOOKUP[player_unit]
					local distance_sq = Vector3.distance_squared(unit_position, player_position)

					if player_unit == raycast_unit then
						has_raycast_unit = true
						raycast_unit_pos = player_position
						raycast_unit_dist = distance_sq
					end

					if distance_sq < best_distance_sq then
						best_distance_sq = distance_sq
						best_unit_position = player_position
					end
				end
			end
		end

		local max_distance_sq = 14400

		if has_raycast_unit and raycast_unit_dist < 400 then
			return true, raycast_unit_pos
		elseif best_unit_position and best_distance_sq < max_distance_sq then
			return true, best_unit_position
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}

local function find_best(unit, unit_position, units, best_position, best_distance_sq)
	for projectile_unit, projectile_extension in pairs(units) do
		local show_warning_icon = projectile_extension.projectile_info.show_warning_icon

		if show_warning_icon then
			local owner_unit = projectile_extension.owner_unit

			if owner_unit ~= unit then
				local projectile_position = POSITION_LOOKUP[projectile_unit]
				local distance_sq = Vector3.distance_squared(unit_position, projectile_position)

				if distance_sq < best_distance_sq then
					best_distance_sq = distance_sq
					best_position = projectile_position
				end
			end
		end
	end

	return best_position, best_distance_sq
end

TutorialTemplates.advanced_grenade = {
	allowed_in_tutorial = true,
	display_type = "tooltip",
	icon = "grenade_icon",
	is_mission_tutorial = true,
	needed_points = 3,
	priority = 60,
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local unit_position = POSITION_LOOKUP[unit]
		local entity_manager = Managers.state.entity
		local best_position, best_distance_sq = nil, 400

		best_position, best_distance_sq = find_best(unit, unit_position, entity_manager:get_entities("PlayerProjectileUnitExtension"), best_position, best_distance_sq)
		best_position = find_best(unit, unit_position, entity_manager:get_entities("PlayerProjectileHuskExtension"), best_position, best_distance_sq)

		if best_position == nil then
			return false
		end

		return true, best_position
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTemplates.play_go_tutorial_tooltip = {
	allowed_in_tutorial = true,
	display_type = "tooltip",
	do_not_verify = true,
	icon = "hud_tutorial_icon_info",
	needed_points = 3,
	text = "none",
	alt_action_icons = {
		action_instant_drink_potion = "d_right",
		action_instant_grenade_throw = "right_shoulder",
		action_instant_heal_other_hold = "d_up",
		move_back = "left_stick",
		move_forward = "left_stick",
		move_left = "left_stick",
		move_right = "left_stick",
	},
	get_text = function (data, template)
		return data.text
	end,
	get_inputs = function (data)
		return data.inputs
	end,
	get_gamepad_inputs = function (data)
		return data.gamepad_inputs
	end,
	get_force_update = function (data)
		return data.force_update
	end,
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		if data.force_update then
			data.force_update = false
		end
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local mission_system = Managers.state.entity:system("mission_system")
		local active_missions, completed_missions = mission_system:get_missions()

		for mission_name, mission_data in pairs(active_missions) do
			if active_missions[mission_name].mission_data.tooltip_text ~= nil then
				if data.text ~= nil and active_missions[mission_name].mission_data.tooltip_text ~= data.text then
					data.text = active_missions[mission_name].mission_data.tooltip_text

					local mission_data = active_missions[mission_name].mission_data

					data.inputs = mission_data.tooltip_inputs
					data.gamepad_inputs = mission_data.tooltip_gamepad_inputs
					data.force_update = true
				end

				data.text = active_missions[mission_name].mission_data.tooltip_text

				local mission_data = active_missions[mission_name].mission_data

				data.inputs = mission_data.tooltip_inputs
				data.gamepad_inputs = mission_data.tooltip_gamepad_inputs

				return true
			end
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTemplates.elite_cage_respawn = {
	display_type = "tooltip",
	icon = "hud_tutorial_icon_rescue",
	is_mission_tutorial = true,
	needed_points = 3,
	priority = 30,
	text = "tutorial_tooltip_elite_cage_respawn",
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local players = Managers.player:human_and_bot_players()
		local unit_position = POSITION_LOOKUP[unit]
		local best_distance_sq = math.huge
		local best_unit_position

		for k, player in pairs(players) do
			local player_unit = player.player_unit

			if Unit.alive(player_unit) and unit ~= player_unit then
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if status_extension:is_ready_for_assisted_respawn() then
					local player_position = POSITION_LOOKUP[player_unit]
					local distance_sq = Vector3.distance_squared(unit_position, player_position)

					if distance_sq < best_distance_sq then
						best_distance_sq = distance_sq
						best_unit_position = player_position
					end
				end
			end
		end

		if best_unit_position then
			return true, best_unit_position + Vector3.up()
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}

local enemy_texts = {
	skaven_loot_rat = "tutorial_infoslate_elite_enemy_loot_rat",
	skaven_storm_vermin = "tutorial_infoslate_elite_enemy_storm_vermin",
	skaven_ratling_gunner = {
		"tutorial_infoslate_elite_enemy_ratling_gunner",
		"tutorial_infoslate_elite_enemy_ratling_gunner_02",
	},
	skaven_storm_vermin_commander = {
		"tutorial_infoslate_elite_enemy_storm_vermin_commander",
		"tutorial_infoslate_elite_enemy_storm_vermin_commander_02",
	},
	skaven_poison_wind_globadier = {
		"tutorial_infoslate_elite_enemy_poison_wind_globadier",
		"tutorial_infoslate_elite_enemy_poison_wind_globadier_02",
	},
	skaven_gutter_runner = {
		"tutorial_infoslate_elite_enemy_gutter_runner",
		"tutorial_infoslate_elite_enemy_gutter_runner_smoke_bomb",
	},
	skaven_rat_ogre = {
		"tutorial_infoslate_elite_enemy_rat_ogre",
		"tutorial_infoslate_elite_enemy_rat_ogre_02",
	},
	skaven_pack_master = {
		"tutorial_infoslate_elite_enemy_pack_master",
		"tutorial_infoslate_elite_enemy_pack_master_02",
	},
}
local objective_units = {}

TutorialTemplates.objective_pickup = {
	action = "interact",
	display_type = "objective_tooltip",
	icon = "hud_tutorial_icon_mission",
	is_mission_tutorial = true,
	needed_points = 4,
	priority = 4,
	game_mode_icons = {
		weave = "hud_weaves_icon_mission",
	},
	get_text = function (data)
		return data.objective_text
	end,
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local slot_name = inventory_extension:get_wielded_slot_name()
		local slot_data = inventory_extension:get_slot_data(slot_name)
		local obj_units = Managers.state.entity:get_entities("ObjectivePickupTutorialExtension")

		if slot_name == "slot_level_event" and slot_data ~= nil then
			for objective_unit, _ in pairs(obj_units) do
				local obj_pickup_name = Unit.get_data(objective_unit, "interaction_data", "item_name")
				local obj_wpn_data = ItemMasterList[obj_pickup_name]
				local obj_left_hand_unit = obj_wpn_data.left_hand_unit
				local obj_right_hand_unit = obj_wpn_data.right_hand_unit
				local carrying_objective_item = obj_left_hand_unit and obj_left_hand_unit == slot_data.left_hand_unit_name

				carrying_objective_item = carrying_objective_item and obj_right_hand_unit == slot_data.right_hand_unit_name

				if carrying_objective_item then
					return false
				end
			end
		end

		local unit_position = POSITION_LOOKUP[unit]
		local best_distance_sq = 10000
		local objective_units_n = 0

		for pickup_unit, pickup_extension in pairs(obj_units) do
			if unit ~= pickup_unit then
				local disregard = pickup_extension.disregard

				if not disregard and ScriptUnit.has_extension(pickup_unit, "death_system") then
					local death_extension = ScriptUnit.extension(pickup_unit, "death_system")

					if death_extension:has_death_started() then
						disregard = true
					end
				end

				local pickup_unit_position = POSITION_LOOKUP[pickup_unit]
				local distance_sq = Vector3.distance_squared(unit_position, pickup_unit_position)

				if not disregard and distance_sq < best_distance_sq then
					local required_mission_type = Unit.get_data(pickup_unit, "required_mission_type")

					if required_mission_type and required_mission_type ~= "" then
						local add_unit = false
						local missions = Managers.state.entity:system("mission_system"):get_missions()

						for _, mission in pairs(missions) do
							if mission.mission_type == required_mission_type then
								add_unit = true

								break
							end
						end

						if add_unit then
							objective_units_n = objective_units_n + 1
							objective_units[objective_units_n] = pickup_unit
						end
					else
						objective_units_n = objective_units_n + 1
						objective_units[objective_units_n] = pickup_unit
					end
				end
			end
		end

		if objective_units_n > 0 then
			local unit = objective_units[1]

			data.objective_text = Unit.get_data(unit, "tutorial_text_id") or "tutorial_no_text"

			return true, objective_units, objective_units_n
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTemplates.objective_socket = {
	action = "interact",
	display_type = "objective_tooltip",
	icon = "hud_tutorial_icon_mission",
	is_mission_tutorial = true,
	needed_points = 0,
	priority = 5,
	game_mode_icons = {
		weave = "hud_weaves_icon_mission",
	},
	get_text = function (data)
		return data.objective_text
	end,
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local unit_position = POSITION_LOOKUP[unit]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local slot_name = inventory_extension:get_wielded_slot_name()
		local slot_data = inventory_extension:get_slot_data(slot_name)

		if slot_name == "slot_level_event" and slot_data ~= nil then
			local units = Managers.state.entity:get_entities("ObjectiveSocketUnitExtension")
			local unit_get_data = Unit.get_data
			local objective_units_n = 0

			for socket_unit, socket_extension in pairs(units) do
				local sockets_enabled = unit_get_data(socket_unit, "sockets_enabled") ~= false
				local tutorial_text_enabled = unit_get_data(socket_unit, "tutorial_text_enabled")

				if sockets_enabled and tutorial_text_enabled then
					local distance_sq = Vector3.distance_squared(unit_position, POSITION_LOOKUP[socket_unit])

					if socket_extension.num_closed_sockets < socket_extension.num_sockets and distance_sq < socket_extension.distance then
						objective_units_n = objective_units_n + 1
						objective_units[objective_units_n] = socket_unit
					end
				end
			end

			if objective_units_n == 0 then
				return false
			end

			local weapon_unit_1p = slot_data.right_unit_1p or slot_data.left_unit_1p

			if ScriptUnit.has_extension(weapon_unit_1p, "limited_item_track_system") then
				local first_socket_unit = objective_units[1]

				data.objective_text = Unit.get_data(first_socket_unit, "tutorial_text_id") or "tutorial_no_text"

				return true, objective_units, objective_units_n
			end
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTemplates.objective_unit = {
	action = "interact",
	display_type = "objective_tooltip",
	icon = "hud_tutorial_icon_mission",
	is_mission_tutorial = true,
	needed_points = 0,
	priority = 1,
	game_mode_icons = {
		weave = "hud_weaves_icon_mission",
	},
	get_text = function (data)
		return data.objective_text
	end,
	get_icon = function (data)
		return data.objective_icon
	end,
	get_alert = function (data)
		return data.alerts_horde
	end,
	get_wave = function (data)
		return data.objective_wave
	end,
	init_data = function (data)
		return
	end,
	clear_data = function (data)
		return
	end,
	update_data = function (t, unit, data)
		return
	end,
	can_show = function (t, unit, data, raycast_unit, world)
		local unit_position = POSITION_LOOKUP[unit]
		local units = Managers.state.entity:get_entities("ObjectiveUnitExtension")
		local vector3_distance_squared = Vector3.distance_squared
		local best_unit
		local best_distance_sq = math.huge
		local objective_units_n = 0

		for objective_unit, extension in pairs(units) do
			if extension.active then
				local distance_sq = vector3_distance_squared(unit_position, POSITION_LOOKUP[objective_unit])

				if distance_sq < best_distance_sq then
					best_unit = objective_unit
					best_distance_sq = distance_sq
				end

				if extension.always_show then
					objective_units_n = objective_units_n + 1
					objective_units[objective_units_n] = objective_unit
				end
			end
		end

		if best_unit and not units[best_unit].always_show then
			objective_units_n = objective_units_n + 1
			objective_units[objective_units_n] = best_unit
		end

		if objective_units_n > 0 then
			local unit_get_data = Unit.get_data

			data.objective_text = unit_get_data(best_unit, "tutorial_text_id") or "tutorial_no_text"
			data.alerts_horde = unit_get_data(best_unit, "alerts_horde") or false
			data.objective_icon = unit_get_data(best_unit, "icon") or "hud_tutorial_icon_mission"
			data.objective_wave = unit_get_data(best_unit, "tutorial_wave") or false

			return true, objective_units, objective_units_n
		end

		return false
	end,
	is_completed = function (t, start_t, unit, data)
		return false
	end,
}
TutorialTooltipTemplates = {}
TutorialTooltipTemplates_n = 0
TutorialInfoSlateTemplates = {}
TutorialInfoSlateTemplates_n = 0
TutorialObjectiveTooltipTemplates = {}
TutorialObjectiveTooltipTemplates_n = 0

for name, template in pairs(TutorialTemplates) do
	template.name = name

	if template.display_type == "tooltip" then
		template.priority = template.priority or 0
		TutorialTooltipTemplates_n = TutorialTooltipTemplates_n + 1
		TutorialTooltipTemplates[TutorialTooltipTemplates_n] = template
	elseif template.display_type == "info_slate" then
		TutorialInfoSlateTemplates_n = TutorialInfoSlateTemplates_n + 1
		TutorialInfoSlateTemplates[TutorialInfoSlateTemplates_n] = template
	elseif template.display_type == "objective_tooltip" then
		TutorialObjectiveTooltipTemplates_n = TutorialObjectiveTooltipTemplates_n + 1
		TutorialObjectiveTooltipTemplates[TutorialObjectiveTooltipTemplates_n] = template
	end
end

local function tooltip_sort_function(t1, t2)
	return t1.priority > t2.priority
end

table.sort(TutorialTooltipTemplates, tooltip_sort_function)
table.sort(TutorialObjectiveTooltipTemplates, tooltip_sort_function)
