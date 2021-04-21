local font_size = 26
local font = "arial"
local font_mtrl = "materials/fonts/" .. font
Debug = Debug or {}

Debug.setup = function (world, world_name)
	Debug.active = BUILD ~= "release"
	Debug.world = world
	Debug.world_name = world_name
	Debug.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	Debug.debug_texts = {}
	Debug.sticky_texts = {}
	Debug.line_objects = {}

	Debug.create_line_object("default")

	Debug.world_texts = {}
	Debug.world_sticky_texts = {}
	Debug.world_sticky_index = 0
	Debug.num_world_sticky_texts = 0
end

Debug.font = font
Debug.font_mtrl = font_mtrl
Debug.font_size = 26

Debug.create_line_object = function (name)
	local disable_depth_test = false
	Debug.line_objects[name] = World.create_line_object(Debug.world, disable_depth_test)

	return Debug.line_objects[name]
end

Debug.test_popup = function ()
	local header = Localize("popup_debug_header")
	local message = Localize("popup_debug_message") .. "\nhost_name"
	Debug.popup_id = Managers.popup:queue_popup(message, header, "cancel", Localize("popup_choice_cancel"))

	Managers.popup:activate_timer(Debug.popup_id, 120, "cancel")
end

Debug.update = function (t, dt)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	if Debug.popup_id then
		local result = Managers.popup:query_result(Debug.popup_id)

		if result == "cancel" then
			Managers.popup:cancel_popup(Debug.popup_id)

			Debug.popup_id = nil
		end
	end

	local show_debug_text_background = not script_data.hide_debug_text_background
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h
	local gui = Debug.gui
	local pos = res_y - 100
	local text_color = Color(120, 220, 0)
	local num_debug_texts = #Debug.debug_texts
	local max = 100

	if num_debug_texts > max then
	end

	for i = 1, num_debug_texts, 1 do
		local data = Debug.debug_texts[i]
		local text = data.text
		local instance_text_color = data.color
		local text_pos = Vector3(130, pos, 700)

		Gui.text(gui, text, font_mtrl, font_size, font, text_pos, (instance_text_color and instance_text_color:unbox()) or text_color)

		if show_debug_text_background then
			local text_min, text_max = Gui.text_extents(gui, text, font_mtrl, font_size)

			Gui.rect(gui, text_pos + Vector3(-5, -6, -100), Vector3(text_max.x - text_min.x + 20, font_size + 2, 0), Color(75, 0, 0, 0))
		end

		pos = pos - (font_size + 2)
		Debug.debug_texts[i] = nil
	end

	local sticky_texts = Debug.sticky_texts
	local num_sticky = #sticky_texts

	if num_sticky > 0 then
		local i = 1

		while num_sticky >= i do
			local text, display_time = unpack(sticky_texts[i])

			Gui.text(gui, text, font_mtrl, font_size, font, Vector3(10, pos, 700), text_color)

			pos = pos - (font_size + 2)

			if display_time < t then
				table.remove(sticky_texts, i)

				num_sticky = num_sticky - 1
			else
				i = i + 1
			end
		end
	end

	Debug.update_world_texts()
	Debug.update_world_sticky_texts()

	local w = Debug.world

	for lo_name, lo in pairs(Debug.line_objects) do
		LineObject.dispatch(w, lo)
	end

	if script_data.debug_cycle_select_inventory_item then
		local matchmaking_manager = Managers.matchmaking
		local ingame_ui = matchmaking_manager and matchmaking_manager._ingame_ui
		local inventory_view = ingame_ui and ingame_ui.current_view == "inventory_view"

		if inventory_view then
			local next_select_at = Debug.next_select_at or 0

			if t > next_select_at then
				local selected_item = Debug.previous_selected_item or 1
				local next_select_item = selected_item + 1

				if next_select_item > 7 then
					next_select_item = 1
				end

				Debug.previous_selected_item = next_select_item
				Debug.select_item = next_select_item
				Debug.next_select_at = t + 1
			end
		end
	end
end

Debug.cond_text = function (c, ...)
	if c then
		Debug.text(...)
	end
end

Debug.text = function (...)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	local text_table = FrameTable.alloc_table()
	text_table.text = string.format(...)

	table.insert(Debug.debug_texts, text_table)
end

Debug.colored_text = function (color, ...)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	local text_table = FrameTable.alloc_table()
	text_table.text = string.format(...)
	text_table.color = ColorBox(color)

	table.insert(Debug.debug_texts, text_table)
end

local max_world_sticky = 512
local debug_colors = {
	red = {
		255,
		0,
		0
	},
	green = {
		0,
		200,
		0
	},
	blue = {
		0,
		0,
		200
	},
	white = {
		255,
		255,
		255
	},
	yellow = {
		200,
		200,
		0
	},
	teal = {
		0,
		200,
		200
	},
	purple = {
		200,
		0,
		160
	}
}

Debug.update_world_texts = function ()
	if not Managers.state.debug_text then
		return
	end

	local world_gui = Managers.state.debug_text._world_gui
	local wt = Debug.world_texts
	local num_texts = #wt
	local tm = Matrix4x4.identity()

	for i = 1, num_texts, 1 do
		local item = wt[i]
		local text = item[1]
		local min, max, caret = Gui.text_extents(world_gui, text, font_mtrl, 2)
		local textpos = Vector3(item[2], item[3], item[4])
		textpos.x = textpos.x - (max.x - min.x) / 2

		Gui.text_3d(world_gui, text, font_mtrl, 1.5, font, tm, textpos, 1, Color(item[5], item[6], item[7]))

		wt[i] = nil
	end
end

Debug.update_world_sticky_texts = function ()
	if not Managers.state.debug_text then
		return
	end

	local world_gui = Managers.state.debug_text._world_gui
	local wt = Debug.world_sticky_texts
	local num_texts = Debug.num_world_sticky_texts
	local tm = Matrix4x4.identity()

	for i = 1, num_texts, 1 do
		local item = wt[i]
		local text = item[1]

		Gui.text_3d(world_gui, text, font_mtrl, 0.3, font, tm, Vector3(item[2], item[3], item[4]), 1, Color(item[5], item[6], item[7]))
	end
end

Debug.world_text = function (pos, text, color_name)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	local wt = Debug.world_texts
	local color = debug_colors[color_name] or debug_colors.white
	local index = #wt + 1

	if wt[index] then
		wt[index][1] = text
		wt[index][2] = pos[1]
		wt[index][3] = pos[3]
		wt[index][4] = pos[2]
		wt[index][5] = color[1]
		wt[index][6] = color[2]
		wt[index][7] = color[3]
	else
		wt[index] = {
			text,
			pos[1],
			pos[3],
			pos[2],
			color[1],
			color[2],
			color[3]
		}
	end
end

Debug.world_sticky_text = function (pos, text, color_name)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	local wt = Debug.world_sticky_texts
	local index = Debug.world_sticky_index
	index = index + 1

	if max_world_sticky < index then
		index = 1
	end

	Debug.num_world_sticky_texts = math.clamp(Debug.num_world_sticky_texts + 1, 0, max_world_sticky)
	local color = debug_colors[color_name] or debug_colors.white

	if wt[index] then
		wt[index][1] = text
		wt[index][2] = pos[1]
		wt[index][3] = pos[3]
		wt[index][4] = pos[2]
		wt[index][5] = color[1]
		wt[index][6] = color[2]
		wt[index][7] = color[3]
	else
		wt[index] = {
			text,
			pos[1],
			pos[3],
			pos[2],
			color[1],
			color[2],
			color[3]
		}
	end

	Debug.world_sticky_index = index
end

Debug.reset_sticky_world_texts = function ()
	Debug.num_world_sticky_texts = 0
	Debug.world_sticky_index = 0
end

Debug.sticky_text = function (...)
	if not Debug.active or (script_data and script_data.disable_debug_draw) then
		return
	end

	local t = {
		...
	}
	local delay = 3

	if t[#t - 1] == "delay" then
		delay = t[#t] or delay
	end

	table.insert(Debug.sticky_texts, {
		string.format(...),
		Managers.time:time("game") + delay
	})
end

Debug.drawer = function (name, disabled)
	name = name or "default"
	local lo = Debug.line_objects[name]
	lo = lo or Debug.create_line_object(name)

	return DebugDrawer:new(lo, to_boolean(not disabled))
end

Debug.teardown = function ()
	Debug.active = false
	local w = Debug.world

	for lo_name, lo in pairs(Debug.line_objects) do
		World.destroy_line_object(w, lo)
	end

	table.clear(Debug.line_objects)
end

debug.animation_log_specific_profile = function (profile, enable)
	local player_manager = Managers.player
	local players = player_manager:players()

	for _, player in pairs(players) do
		local units = player.owned_units

		for _, unit in pairs(units) do
			local has_status_extension = ScriptUnit.has_extension(unit, "status_system")

			if has_status_extension then
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local profile_id = status_extension.profile_id
				local profile_data = SPProfiles[profile_id]
				local profile_display_name = profile_data.display_name

				if profile_display_name == profile then
					print("animation logging enabled for:" .. profile)
					Unit.set_animation_logging(unit, enable)
				end
			end
		end
	end
end

debug.spawn_hero = function (hero_name)
	local spawn_manager = Managers.state.spawn
	local hero_spawner_handler = spawn_manager.hero_spawner_handler
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)

	hero_spawner_handler:spawn_hero_request(player, hero_name)
end

debug.load_level = function (level_name, environment_variation_id, debug_environment_level_flow_event)
	Managers.mechanism:debug_load_level(level_name, environment_variation_id)

	if debug_environment_level_flow_event ~= nil then
		StateIngame._level_flow_events = {
			debug_environment_level_flow_event
		}
	else
		StateIngame._level_flow_events = nil
	end
end

debug.level_loaded = function (level_name)
	local state_managers = Managers.state

	if not state_managers then
		return false
	end

	local game_mode_manager = state_managers.game_mode

	if not game_mode_manager then
		return false
	end

	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_key()

	if level_key ~= level_name then
		return false
	end

	local packages_loaded = level_transition_handler:all_packages_loaded()

	if not packages_loaded then
		return false
	end

	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local player_unit = player and player.player_unit

	if not Unit.alive(player_unit) then
		return false
	end

	return true
end

Debug.visualize_level_unit = function (level_unit_id)
	local level = Managers.state.networked_flow_state._level

	if not level then
		return
	end

	local unit = Level.unit_by_index(level, level_unit_id)

	if not unit then
		return
	end

	local position = Unit.world_position(unit, 0)

	QuickDrawer:sphere(position, 1, Colors.get("medium_aqua_marine"))

	for i = 1, 20, 1 do
		QuickDrawer:sphere(position, i * 10, Colors.get("medium_aqua_marine"))
	end
end

Debug.aim_position = function ()
	local player_manager = Managers.player
	local player = player_manager:local_player(1)
	local player_unit = player.player_unit
	local camera_position = Managers.state.camera:camera_position(player.viewport_name)
	local camera_rotation = Managers.state.camera:camera_rotation(player.viewport_name)
	local camera_direction = Quaternion.forward(camera_rotation)
	local filter = "filter_ray_projectile"
	local world = Managers.state.spawn.world
	local physics_world = World.get_data(world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, camera_position, camera_direction, 100, "all", "collision_filter", filter)

	if result then
		local num_hits = #result

		for i = 1, num_hits, 1 do
			local hit = result[i]
			local hit_actor = hit[4]
			local hit_unit = Actor.unit(hit_actor)
			local attack_hit_self = hit_unit == player_unit

			if not attack_hit_self then
				return hit[1], hit[2], hit[3], hit[4]
			end
		end
	end
end

Debug.test_spawn_unit = function (profile_name, career_index)
	profile_name = profile_name or "wood_elf"
	career_index = career_index or 1
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local item_data = skin_item and skin_item.data
	local skin_name = (item_data and item_data.name) or career.base_skin
	local package_names = {}
	local skin_data = Cosmetics[skin_name]
	local unit_name = skin_data.third_person
	local material_changes = skin_data.material_changes
	package_names[#package_names + 1] = unit_name

	if material_changes then
		local material_package = material_changes.package_name
		package_names[#package_names + 1] = material_package
	end

	for index, package_name in ipairs(package_names) do
		Managers.package:load(package_name, "debug", nil, false)
	end

	local world = Managers.state.spawn.world
	local position = Debug.aim_position()
	local unit_name = skin_data.third_person
	local tint_data = skin_data.color_tint
	local character_unit = World.spawn_unit(world, unit_name, position)
	local material_changes = skin_data.material_changes

	if material_changes then
		local third_person_changes = material_changes.third_person

		for slot_name, material_name in pairs(third_person_changes) do
			Unit.set_material(character_unit, slot_name, material_name)
			Unit.set_material(character_unit, slot_name, material_name)
		end
	end

	Debug.test_unit = character_unit
end

Debug.test_despawn_unit = function (profile_name, career_index)
	local world = Managers.state.spawn.world
	local character_unit = Debug.test_unit

	if not character_unit then
		return
	end

	World.destroy_unit(world, character_unit)

	profile_name = profile_name or "wood_elf"
	career_index = career_index or 1
	local profile_index = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.name
	local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
	local item_data = skin_item and skin_item.data
	local skin_name = (item_data and item_data.name) or career.base_skin
	local package_names = {}
	local skin_data = Cosmetics[skin_name]
	local unit_name = skin_data.third_person
	local material_changes = skin_data.material_changes
	package_names[#package_names + 1] = unit_name

	if material_changes then
		local material_package = material_changes.package_name
		package_names[#package_names + 1] = material_package
	end

	for index, package_name in ipairs(package_names) do
		Managers.package:unload(package_name, "debug", nil, false)
	end
end

Debug.create_jira_issue = function ()
	local valid, err = pcall(require, "core/plugins/reporter")

	if valid then
		Reporter.create_jira_issue("honduras")
	end
end

Debug._hook_data = Debug._hook_data or {}

Debug.hook = function (obj, method, handler)
	local data_for_obj = Debug._hook_data[obj]

	if not data_for_obj then
		data_for_obj = {}
		Debug._hook_data[obj] = data_for_obj
	end

	local orig = data_for_obj[method]

	if not orig then
		orig = rawget(obj, method)
		data_for_obj[method] = orig

		assert(orig)
	end

	rawset(obj, method, function (...)
		return handler(orig, ...)
	end)
end

Debug.unhook = function (obj, method, silent)
	local data_for_obj = Debug._hook_data[obj]

	if not data_for_obj then
		return assert(silent)
	end

	local orig = data_for_obj[method]

	if not orig then
		return assert(silent)
	end

	rawset(obj, method, orig)

	return true
end

return
