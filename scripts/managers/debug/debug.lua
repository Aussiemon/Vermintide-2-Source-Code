local font_size = 26
local font = "gw_arial_32"
local font_mtrl = "materials/fonts/" .. font
local remove_list = {}
Debug = Debug or {}
Debug.setup = function (world, world_name)
	Debug.active = true
	Debug.world = world
	Debug.world_name = world_name
	Debug.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	Debug.debug_texts = {}
	Debug.sticky_texts = {}
	Debug.line_objects = {}

	Debug.create_line_object("default")

	Debug.world_sticky_texts = {}
	Debug.world_sticky_index = 0
	Debug.num_world_sticky_texts = 0

	return 
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

	return 
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

	if max < num_debug_texts then
	end

	for i = 1, num_debug_texts, 1 do
		local data = Debug.debug_texts[i]
		local text = data.text
		local instance_text_color = data.color
		local text_pos = Vector3(130, pos, 700)

		Gui.text(gui, text, font_mtrl, font_size, font, text_pos, (instance_text_color and instance_text_color.unbox(instance_text_color)) or text_color)

		if show_debug_text_background then
			local text_min, text_max = Gui.text_extents(gui, text, font_mtrl, font_size)

			Gui.rect(gui, text_pos + Vector3(-5, -6, -100), Vector3(text_max.x - text_min.x + 20, font_size + 2, 0), Color(75, 0, 0, 0))
		end

		pos = pos - (font_size + 2)
		Debug.debug_texts[i] = nil
	end

	local sticky_texts = Debug.sticky_texts
	local num_sticky = #sticky_texts

	if 0 < num_sticky then
		local i = 1

		while i <= num_sticky do
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

	Debug.update_world_sticky_texts()

	local w = Debug.world

	for lo_name, lo in pairs(Debug.line_objects) do
		LineObject.dispatch(w, lo)
	end

	if script_data.debug_cycle_select_inventory_item then
		local matchmaking_manager = Managers.matchmaking
		local ingame_ui = matchmaking_manager and matchmaking_manager.ingame_ui
		local inventory_view = ingame_ui and ingame_ui.current_view == "inventory_view"

		if inventory_view then
			local next_select_at = Debug.next_select_at or 0

			if next_select_at < t then
				local selected_item = Debug.previous_selected_item or 1
				local next_select_item = selected_item + 1

				if 7 < next_select_item then
					next_select_item = 1
				end

				Debug.previous_selected_item = next_select_item
				Debug.select_item = next_select_item
				Debug.next_select_at = t + 1
			end
		end
	end

	return 
end
Debug.cond_text = function (c, ...)
	if c then
		Debug.text(...)
	end

	return 
end
Debug.text = function (...)
	if not Debug.active then
		return 
	end

	table.insert(Debug.debug_texts, {
		text = string.format(...)
	})

	return 
end
Debug.colored_text = function (color, ...)
	if not Debug.active then
		return 
	end

	table.insert(Debug.debug_texts, {
		text = string.format(...),
		color = ColorBox(color)
	})

	return 
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

	return 
end
Debug.world_sticky_text = function (pos, text, color_name)
	if not Debug.active then
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

	return 
end
Debug.reset_sticky_world_texts = function ()
	Debug.num_world_sticky_texts = 0
	Debug.world_sticky_index = 0

	return 
end
Debug.sticky_text = function (...)
	if not Debug.active then
		return 
	end

	local t = {
		...
	}
	local delay = 3

	if t[#t - 1] == "delay" and not t[#t] then
	end

	table.insert(Debug.sticky_texts, {
		string.format(...),
		Managers.time:time("game") + delay
	})

	return 
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

	return 
end
debug.animation_log_specific_profile = function (profile, enable)
	local player_manager = Managers.player
	local players = player_manager.players(player_manager)

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

	return 
end
debug.spawn_hero = function (hero_name)
	local spawn_manager = Managers.state.spawn
	local hero_spawner_handler = spawn_manager.hero_spawner_handler
	local peer_id = Network:peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)

	hero_spawner_handler.spawn_hero_request(hero_spawner_handler, player, hero_name)

	return 
end
debug.load_level = function (level_name)
	local game_mode_manager = Managers.state.game_mode
	local level_transition_handler = game_mode_manager.level_transition_handler

	level_transition_handler.set_next_level(level_transition_handler, level_name)
	level_transition_handler.level_completed(level_transition_handler)

	return 
end
debug.level_loaded = function (level_name)
	local game_mode_manager = Managers.state.game_mode

	if not game_mode_manager then
		return false
	end

	local level_transition_handler = game_mode_manager.level_transition_handler
	local level_key = level_transition_handler.level_key

	if level_key ~= level_name then
		return false
	end

	local packages_loaded = level_transition_handler.all_packages_loaded(level_transition_handler)

	if not packages_loaded then
		return false
	end

	local peer_id = Network:peer_id()
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
		QuickDrawer:sphere(position, i*10, Colors.get("medium_aqua_marine"))
	end

	return 
end

return 
