-- chunkname: @scripts/utils/debug_screen.lua

local font = "arial"
local font_mtrl = "materials/fonts/" .. font
local fade_speed = 10
local base_layer = UILayer.debug_screen

local function ease_out_quad(t, b, c, d)
	t = t / d

	return -c * t * (t - 2) + b
end

local indicator_offset = 0

local function update_option(cs, option_index, dont_save, ignore_propagation)
	if cs.propagate_to_server and not DebugScreen._is_server and not ignore_propagation then
		DebugScreen._propagate_option(cs.setting_id, option_index, not not dont_save)
	end

	local option = cs.options[option_index]

	cs.selected_id = option_index

	if option == "[clear value]" then
		option = nil
		cs.selected_id = nil
	end

	if cs.copy then
		cs.copy.selected_id = cs.selected_id
	end

	if cs.commands then
		local command_list = cs.commands[cs.hot_id]

		if command_list then
			for i = 1, #command_list do
				local command_table = command_list[i]

				Application.console_command(unpack(command_table))
			end
		end
	end

	Development.set_setting(cs.title, option)

	script_data[cs.title] = option

	Development.clear_param_cache(cs.title)

	if cs.callback then
		cs.callback(option)
	end

	if not dont_save and not cs.never_save then
		printf("DebugScreen: script_data.%-35s = %s", cs.title, tostring(cs.options[option_index]))
		Application.save_user_settings()
	end

	Profiler.event("%s = %s", cs.title, tostring(cs.options[option_index]))
end

local function exec_func(cs)
	if cs.propagate_to_server and not DebugScreen._is_server then
		DebugScreen._propagate_option(cs.setting_id, 0, true)
	end

	cs.func(cs.options, cs.hot_id)

	if cs.clear_setting then
		cs.selected_id = nil

		Development.set_setting(cs.title, nil)

		script_data[cs.title] = nil

		Development.clear_param_cache(cs.title)
	end
end

local function activate_preset(cs)
	for preset_key, preset_value in pairs(cs.preset) do
		for cs2_i = 1, #DebugScreen.console_settings do
			local cs2 = DebugScreen.console_settings[cs2_i]

			if cs2.title == preset_key and cs2.is_boolean then
				update_option(cs2, preset_value and 1 or 2)
			end
		end
	end

	cs.selected_id = nil

	Development.set_setting(cs.title, nil)

	script_data[cs.title] = nil

	Development.clear_param_cache(cs.title)
end

DebugScreen = DebugScreen or {}

local DebugScreen = DebugScreen

DebugScreen.console_width = DebugScreen.console_width or 800 * (RESOLUTION_LOOKUP.scale or 1)
DebugScreen.font_size = DebugScreen.font_size or 20 * (RESOLUTION_LOOKUP.scale or 1)
DebugScreen.numpad_presses = {}
DebugScreen.shortcut_any = "_any_"
DebugScreen.shortcut_version = 1

local function migrate_shortcuts(saved_data, version)
	if version == 0 then
		for i = 1, #saved_data / 2 do
			table.insert(saved_data, i * 3, DebugScreen.shortcut_any)
		end
	end

	return saved_data
end

DebugScreen.setup = function (world, settings, callbacks, is_server)
	local DebugScreen = DebugScreen

	DebugScreen.world = world
	DebugScreen.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "material", "materials/menu/debug_screen", "immediate")
	DebugScreen.active = false
	DebugScreen._is_server = is_server

	local script_data = script_data

	DebugScreen.console_settings = {}

	for i = 1, #settings do
		local cs = {
			hot_id = 1,
			options = {},
		}
		local setting = settings[i]

		if setting.item_source then
			local item_source = setting.item_source

			if setting.custom_item_source_order then
				setting.custom_item_source_order(item_source, cs.options)
			else
				for k, v in pairs(item_source) do
					local option = k

					cs.options[#cs.options + 1] = option
				end
			end

			if setting.func then
				cs.func = setting.func
				cs.clear_setting = false
			end

			cs.load_items_source_func = setting.load_items_source_func
		elseif setting.is_boolean then
			cs.is_boolean = true
			cs.options[#cs.options + 1] = true
			cs.options[#cs.options + 1] = false

			if setting.func then
				cs.func = setting.func
			end
		elseif setting.command_list then
			cs.commands = {}

			for j = 1, #setting.command_list do
				local command = setting.command_list[j]

				cs.options[#cs.options + 1] = command.description
				cs.commands[#cs.commands + 1] = command.commands
			end
		elseif setting.func then
			cs.options[1] = "Activate function"
			cs.func = setting.func
		elseif setting.preset then
			cs.options[1] = "Activate preset"
			cs.preset = setting.preset
		end

		cs.propagate_to_server = setting.propagate_to_server
		cs.never_save = setting.never_save
		cs.item_display_func = setting.item_display_func

		if setting.bitmap then
			cs.bitmap = setting.bitmap
			cs.bitmap_size = setting.bitmap_size
		end

		if setting.callback then
			cs.callback = callbacks[setting.callback]
		end

		cs.title = setting.setting_name
		cs.description = setting.description
		cs.category = setting.category
		cs.close_when_selected = setting.close_when_selected
		cs.clear_when_selected = setting.clear_when_selected
		cs.setting_id = i

		for j = 1, #cs.options do
			local option = cs.options[j]

			if Development.parameter(cs.title) == option then
				cs.selected_id = j
				cs.hot_id = j

				update_option(cs, j, true, true)
			end
		end

		if #cs.options > 0 and not setting.no_nil and not setting.func and not setting.preset then
			cs.options[#cs.options + 1] = "[clear value]"
		end

		DebugScreen.console_settings[#DebugScreen.console_settings + 1] = cs
	end

	DebugScreen.settings_hash = HashUtils.fnv32_hash(table.concat(table.select_array(settings, function (idx, setting)
		return setting.setting_name or idx
	end), ","))

	for i = 1, #DebugScreen.console_settings do
		local cs = DebugScreen.console_settings[i]

		if cs.preset and Development.parameter(cs.title) then
			activate_preset(cs)
		end
	end

	DebugScreen.shortcut_list = {}
	DebugScreen.shortcuts = Development.setting("debug_shortcuts") or {
		"numpad 0",
		"debug_weapons",
	}

	local saved_version = tonumber(DebugScreen.shortcuts[1]) or 0

	migrate_shortcuts(DebugScreen.shortcuts, saved_version)

	for i = 1, #DebugScreen.shortcuts, 3 do
		local shortcut_input, shortcut_setting, shortcut_option = DebugScreen.shortcuts[i], DebugScreen.shortcuts[i + 1], DebugScreen.shortcuts[i + 2]

		for j = 1, #DebugScreen.console_settings do
			local cs = DebugScreen.console_settings[j]

			if cs.title == shortcut_setting then
				DebugScreen.shortcut_list[shortcut_input] = {
					cs = cs,
					option = shortcut_option,
				}

				break
			end
		end
	end

	DebugScreen.favorites = Development.setting("debug_favorites") or {}

	for i = 1, #DebugScreen.favorites do
		local favorite = DebugScreen.favorites[i]

		for j = 1, #DebugScreen.console_settings do
			local cs = DebugScreen.console_settings[j]

			if cs.title == favorite then
				local cs_copy = table.clone(cs)

				cs_copy.category = "Favorites"
				cs.copy = cs_copy
				cs_copy.copy = cs

				table.insert(DebugScreen.console_settings, 1, cs_copy)

				break
			end
		end
	end

	if not script_data.debug_enabled then
		script_data.disable_debug_draw = true
	end

	DebugScreen.active_id = nil
	DebugScreen.hot_id = 1
	DebugScreen.fade_timer = 0
	DebugScreen.closing = false
	DebugScreen.target_y_offset = 0
	DebugScreen.text_effects = {}
	DebugScreen.hold_to_move_timer = 0
	DebugScreen.is_holding = false
	DebugScreen.active_shortcut_data = {
		time = 0,
	}
	DebugScreen.unblocked_services = {}
	DebugScreen.unblocked_services_n = 0
	DebugScreen.search_active = false
	DebugScreen.search_string = ""
	DebugScreen.filtered_console_settings = DebugScreen.console_settings
	DebugScreen.allow_to_open = true
end

DebugScreen.destroy = function ()
	World.destroy_gui(DebugScreen.world, DebugScreen.gui)

	DebugScreen.world = nil
	DebugScreen.gui = nil
end

DebugScreen.set_blocked = function (is_blocked)
	DebugScreen.is_blocked = is_blocked
end

DebugScreen.reset_setting_size = function (cs, pos_y, root_y)
	cs.setting_height = 0
	cs.setting_pos = math.abs(pos_y - root_y)
	cs.option_pos = nil
end

DebugScreen.push_setting_size = function (cs, pos_y, size)
	pos_y = pos_y - size
	cs.setting_height = cs.setting_height + size

	return pos_y
end

DebugScreen.accelerate_factor = DebugScreen.accelerate_factor or 1

DebugScreen.update = function (dt, t, input_service, input_manager)
	local DebugScreen = DebugScreen

	if DebugScreen.is_blocked or not script_data.debug_enabled or not input_service or IS_LINUX then
		return
	end

	local gui = DebugScreen.gui

	dt = dt / GLOBAL_TIME_SCALE

	local opened_this_frame = false
	local font_size = DebugScreen.font_size
	local console_width = DebugScreen.console_width
	local mod_key_down = input_service:get("console_mod_key")

	if input_service:get("console_open_key") or DebugScreen.active and input_service:is_blocked() then
		DebugScreen.active = not DebugScreen.active

		if DebugScreen.active then
			input_manager:device_block_service("keyboard", 1, "Debug")
		else
			input_manager:device_unblock_service("keyboard", 1, "Debug")
		end
	end

	if input_service:get("right_key") and not DebugScreen.active then
		DebugScreen.active = not DebugScreen.active

		input_manager:device_block_service("keyboard", 1, "Debug", "debug_screen")

		opened_this_frame = true
	end

	if not DebugScreen.active and DebugScreen.fade_timer == 0 then
		for shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
			if Keyboard.pressed(Keyboard.button_index(shortcut_input)) then
				local cs = cs_data.cs
				local option = cs_data.option

				if option == DebugScreen.shortcut_any then
					if cs.hot_id == #cs.options then
						cs.hot_id = 1
					else
						cs.hot_id = cs.hot_id + 1
					end
				else
					local option_id = table.find(cs.options, option)

					option_id = math.clamp(option_id or -1, 1, #cs.options)
					cs.hot_id = option_id
				end

				if cs.func then
					exec_func(cs)
				else
					update_option(cs, cs.hot_id)
				end

				DebugScreen.active_shortcut_data.time = t + 1
				DebugScreen.active_shortcut_data.cs = cs
			end
		end

		if t < DebugScreen.active_shortcut_data.time then
			local cs = DebugScreen.active_shortcut_data.cs

			Debug.text("Debug Screen: %s = %s", cs.title, tostring(cs.options[cs.hot_id]))
		end

		return
	end

	DebugScreen.update_search(input_manager, input_service, gui, t, dt, opened_this_frame)

	if DebugScreen.active then
		DebugScreen.fade_timer = math.min(1, DebugScreen.fade_timer + dt * fade_speed)
	else
		DebugScreen.fade_timer = math.max(0, DebugScreen.fade_timer - dt * fade_speed)
	end

	local filtered_console_settings = DebugScreen.console_settings
	local current_hot_cs = DebugScreen.filtered_console_settings[DebugScreen.hot_id]
	local setting_search_string, option_search_string = DebugScreen.search_string:match("([^.]*).?(.*)")

	if DebugScreen.search_active then
		if setting_search_string == "*" then
			filtered_console_settings = {}

			for i = 1, #DebugScreen.console_settings do
				local cs = DebugScreen.console_settings[i]

				if cs.selected_id ~= nil then
					filtered_console_settings[#filtered_console_settings + 1] = cs
				end
			end
		elseif setting_search_string ~= "" then
			filtered_console_settings = {}

			local search_string = string.gsub(setting_search_string, "[_ ]", "")

			for i = 1, #DebugScreen.console_settings do
				local cs = DebugScreen.console_settings[i]
				local current_item = cs.title:lower()

				current_item = string.gsub(current_item, "[_ ]", "")

				if current_item:find(search_string, 1, true) ~= nil then
					filtered_console_settings[#filtered_console_settings + 1] = cs
				end
			end
		end
	end

	if current_hot_cs ~= filtered_console_settings[DebugScreen.hot_id] then
		DebugScreen.hot_id = DebugScreen.hot_id or 1
		DebugScreen.active_id = nil

		for i = 0, #filtered_console_settings * 0.5 do
			if filtered_console_settings[DebugScreen.hot_id + i] then
				DebugScreen.hot_id = DebugScreen.hot_id + i

				break
			elseif filtered_console_settings[DebugScreen.hot_id - i] then
				DebugScreen.hot_id = DebugScreen.hot_id - i

				break
			end
		end
	end

	DebugScreen.filtered_console_settings = filtered_console_settings

	local filtered_option_ids = {}

	if DebugScreen.active_id ~= nil then
		if DebugScreen.search_active and option_search_string ~= "" then
			local hot_id = DebugScreen.hot_id
			local cs_current = filtered_console_settings[hot_id]
			local search_string = string.gsub(option_search_string, "[_ ]", "")

			for j = 1, #cs_current.options do
				local option = cs_current.options[j]
				local option_name = tostring(option)
				local current_item = option_name:lower()

				current_item = string.gsub(current_item, "[_ ]", "")

				if current_item:find(search_string, 1, true) ~= nil then
					filtered_option_ids[#filtered_option_ids + 1] = j
				end
			end

			if not table.contains(filtered_option_ids, cs_current.hot_id) and #filtered_option_ids > 0 then
				cs_current.hot_id = filtered_option_ids[1]
			end
		else
			local hot_id = DebugScreen.hot_id
			local cs_current = filtered_console_settings[hot_id]

			for i = 1, #cs_current.options do
				filtered_option_ids[i] = i
			end
		end
	end

	if input_service:get("up_key") and t > DebugScreen.hold_to_move_timer then
		if DebugScreen.is_holding then
			local accelerate_factor = DebugScreen.accelerate_factor

			DebugScreen.hold_to_move_timer = t + 0.1 * GLOBAL_TIME_SCALE * accelerate_factor
			DebugScreen.accelerate_factor = accelerate_factor * 0.95
		else
			DebugScreen.hold_to_move_timer = t + 0.1 * GLOBAL_TIME_SCALE
			DebugScreen.is_holding = true
			DebugScreen.accelerate_factor = 1
		end

		if DebugScreen.active_id == nil then
			if DebugScreen.hot_id == 1 then
				DebugScreen.hot_id = #filtered_console_settings
			elseif mod_key_down then
				local hot_id = DebugScreen.hot_id
				local cs_current = filtered_console_settings[hot_id]
				local ignore_changed_cs = not cs_current.is_boolean and cs_current.selected_id ~= nil or cs_current.options[cs_current.selected_id]

				while hot_id > 1 do
					hot_id = hot_id - 1

					local cs = filtered_console_settings[hot_id]
					local cs_value_changed = not cs.is_boolean and cs.selected_id ~= nil or cs.options[cs.selected_id]

					if cs_value_changed and not ignore_changed_cs then
						break
					elseif not cs_value_changed then
						ignore_changed_cs = false
					end

					if cs.category ~= filtered_console_settings[math.max(1, hot_id - 1)].category then
						break
					end
				end

				DebugScreen.hot_id = hot_id
			else
				DebugScreen.hot_id = DebugScreen.hot_id - 1
			end
		else
			local cs = filtered_console_settings[DebugScreen.active_id]
			local num_filtered_options = #filtered_option_ids
			local current_filtered_id = table.find(filtered_option_ids, cs.hot_id)

			if current_filtered_id then
				local next_filtered_id = (current_filtered_id + num_filtered_options - 2) % num_filtered_options + 1

				cs.hot_id = filtered_option_ids[next_filtered_id]
			end
		end
	end

	if input_service:get("down_key") and t > DebugScreen.hold_to_move_timer then
		if DebugScreen.is_holding then
			local accelerate_factor = DebugScreen.accelerate_factor

			DebugScreen.hold_to_move_timer = t + 0.1 * GLOBAL_TIME_SCALE * accelerate_factor
			DebugScreen.accelerate_factor = accelerate_factor * 0.95
		else
			DebugScreen.hold_to_move_timer = t + 0.1 * GLOBAL_TIME_SCALE
			DebugScreen.is_holding = true
			DebugScreen.accelerate_factor = 1
		end

		if DebugScreen.active_id == nil then
			if DebugScreen.hot_id == #filtered_console_settings then
				DebugScreen.hot_id = 1
			elseif mod_key_down then
				local hot_id = DebugScreen.hot_id
				local cs_current = filtered_console_settings[hot_id]
				local ignore_changed_cs = not cs_current.is_boolean and cs_current.selected_id ~= nil or cs_current.options[cs_current.selected_id]

				while hot_id < #filtered_console_settings do
					hot_id = hot_id + 1

					local cs = filtered_console_settings[hot_id]
					local cs_value_changed = not cs.is_boolean and cs.selected_id ~= nil or cs.options[cs.selected_id]

					if cs_value_changed and not ignore_changed_cs then
						break
					elseif not cs_value_changed then
						ignore_changed_cs = false
					end

					if cs.category ~= filtered_console_settings[math.max(1, hot_id - 1)].category then
						break
					end
				end

				DebugScreen.hot_id = hot_id
			else
				DebugScreen.hot_id = DebugScreen.hot_id + 1
			end
		else
			local cs = filtered_console_settings[DebugScreen.active_id]
			local num_filtered_options = #filtered_option_ids
			local current_filtered_id = table.find(filtered_option_ids, cs.hot_id)

			if current_filtered_id then
				local next_filtered_id = current_filtered_id % num_filtered_options + 1

				cs.hot_id = filtered_option_ids[next_filtered_id]
			end
		end
	end

	if input_service:get("page up") then
		if DebugScreen.active_id then
			local cs = filtered_console_settings[DebugScreen.active_id]

			cs.hot_id = 1
		else
			DebugScreen.hot_id = 1
		end
	elseif input_service:get("page down") then
		if DebugScreen.active_id then
			local cs = filtered_console_settings[DebugScreen.active_id]

			cs.hot_id = #filtered_option_ids
		else
			DebugScreen.hot_id = #filtered_console_settings
		end
	end

	if not input_service:get("down_key") and not input_service:get("up_key") then
		DebugScreen.is_holding = false
	end

	DebugScreen.hot_id = math.clamp(DebugScreen.hot_id, math.min(1, #filtered_console_settings), #filtered_console_settings)

	local offset_lerp = ease_out_quad(DebugScreen.fade_timer, 0, 1, 1)
	local offset_x = offset_lerp * console_width
	local _, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local pos_y = res_y - 100

	if DebugScreen.active_id ~= nil then
		local cs = filtered_console_settings[DebugScreen.active_id]

		if not cs then
			DebugScreen.active_id = nil
		end
	end

	local bottom_padding = 200
	local total_height = 0
	local progress = 0

	if not table.is_empty(filtered_console_settings) then
		local last_setting = filtered_console_settings[#filtered_console_settings]

		total_height = (last_setting.setting_pos or 0) + (last_setting.setting_height or 0)

		local size_until_scroll = res_y * 0.25
		local size_to_stop_scroll = total_height - res_y * 0.25
		local current_setting = filtered_console_settings[DebugScreen.hot_id]

		if current_setting then
			local current_pos = current_setting.option_pos or current_setting.setting_pos or 0

			if size_until_scroll ~= size_to_stop_scroll then
				progress = math.remap_clamped(size_until_scroll, size_to_stop_scroll, 0, 1, current_pos)
			end
		end
	end

	total_height = total_height + bottom_padding

	local wanted_y_offset = math.max(0, total_height - res_y) * progress

	DebugScreen.target_y_offset = math.lerp(DebugScreen.target_y_offset, wanted_y_offset, 0.1)
	pos_y = pos_y + DebugScreen.target_y_offset

	local root_y = pos_y

	indicator_offset = indicator_offset + dt * 10

	if indicator_offset > 10 then
		indicator_offset = 0
	end

	local indicator_offset_anim = indicator_offset

	if indicator_offset_anim > 5 then
		indicator_offset_anim = 10 - indicator_offset_anim
	end

	local scrollbar_size = (total_height == bottom_padding or total_height < res_y) and 0 or res_y * res_y / (total_height - bottom_padding)
	local scrollbar_pos = res_y * math.remap(0, 1, 0, 1 - scrollbar_size / res_y, progress)
	local scrollbar_layer = base_layer + 1

	Gui.rect(gui, Vector3(0, 0, base_layer), Vector2(offset_x, res_y), Color(offset_lerp * 220, 25, 50, 25))
	Gui.rect(gui, Vector3(0, res_y - scrollbar_pos - scrollbar_size, scrollbar_layer), Vector2(3, scrollbar_size), Color(offset_lerp * 150, 200, 200, 25))

	local hot_anim_t = (math.sin(t / GLOBAL_TIME_SCALE * 10) + 1) * 0.5
	local white = Color(offset_lerp * 250, 255, 255, 255)
	local text_color = Color(offset_lerp * 250, 120, 120, 0)
	local text_color_overridden = Color(offset_lerp * 255, 200, 200, 0)
	local text_color_hot = Color(offset_lerp * 255, 230 + 25 * hot_anim_t, 230 + 25 * hot_anim_t, 200 * hot_anim_t)
	local text_color_active = Color(offset_lerp * 255, 100, 255, 100)
	local text_color_option_default_value = Color(offset_lerp * 255, 50, 150, 50)
	local text_color_option_overridden = Color(offset_lerp * 255, 100, 255, 100)
	local text_color_option_hot = Color(offset_lerp * 255, 200, 255, 200)
	local text_color_description = Color(offset_lerp * 255, 150, 150, 150)
	local row_highlight_color = Color(offset_lerp * 150, 100, 100, 50)
	local setting_x = 30
	local option_x = 50
	local category_current
	local category_text_layer = base_layer + 2
	local base_text_layer = base_layer + 2
	local row_highlight_layer = base_layer + 1
	local bitmap_layer = base_layer + 1

	for setting_i = 1, #filtered_console_settings do
		local is_active = setting_i == DebugScreen.active_id
		local is_hot = setting_i == DebugScreen.hot_id
		local cs = filtered_console_settings[setting_i]

		DebugScreen.reset_setting_size(cs, pos_y, root_y)

		local text = cs.title

		if cs.category ~= category_current then
			pos_y = pos_y - font_size * 0.4
			category_current = cs.category

			Gui.text(gui, cs.category, font_mtrl, font_size, font, Vector3(10, pos_y, category_text_layer), white)

			pos_y = pos_y - font_size
		end

		local current_selected_option_position = Vector3(offset_x - 400, pos_y, base_text_layer)
		local option_text

		if cs.selected_id ~= nil then
			local options, idx = cs.options, cs.selected_id
			local val = options[idx]

			if cs.item_display_func then
				option_text = string.format("< %s >", cs.item_display_func(val, idx, options))
			else
				option_text = string.format("< %s >", tostring(val))
			end

			if is_hot then
				Gui.text(gui, option_text, font_mtrl, font_size, font, current_selected_option_position, text_color_option_hot)
			elseif not cs.is_boolean or cs.options[cs.selected_id] then
				Gui.text(gui, option_text, font_mtrl, font_size, font, current_selected_option_position, text_color_option_overridden)
			else
				Gui.text(gui, option_text, font_mtrl, font_size, font, current_selected_option_position, text_color_option_default_value)
			end
		end

		if is_active then
			Gui.text(gui, ">", font_mtrl, font_size, font, Vector3(10, pos_y, base_text_layer), text_color_active)
			Gui.text(gui, text, font_mtrl, font_size, font, Vector3(setting_x, pos_y, base_text_layer), text_color_active)

			local shortcuts

			for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
				local temp_cs = cs_data.cs

				if cs == temp_cs or cs == temp_cs.copy then
					shortcuts = (shortcuts and shortcuts .. ", " or "") .. temp_shortcut_input
				end
			end

			if shortcuts then
				Gui.text(gui, "[" .. shortcuts .. "]", font_mtrl, font_size, font, Vector3(offset_x - 100, pos_y, base_text_layer), white)
			end

			pos_y = DebugScreen.push_setting_size(cs, pos_y, font_size + 2)

			local reuse_global_table = true
			local description_word_wrapped = Gui.word_wrap(gui, cs.description, font_mtrl, font_size, 500, " ", "", "\n", reuse_global_table)

			for j = 1, #description_word_wrapped do
				local description = description_word_wrapped[j]

				Gui.text(gui, description, font_mtrl, font_size, font, Vector3(setting_x, pos_y, base_text_layer), text_color_description)

				pos_y = DebugScreen.push_setting_size(cs, pos_y, font_size + 2)
			end

			for j = 1, #filtered_option_ids do
				local current_option_index = filtered_option_ids[j]
				local option = cs.options[current_option_index]
				local is_hot_sub = current_option_index == cs.hot_id
				local is_selected_sub = current_option_index == cs.selected_id

				for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
					local temp_cs, temp_option = cs_data.cs, cs_data.option

					if (cs == temp_cs or cs == temp_cs.copy) and option == temp_option then
						Gui.text(gui, "[" .. temp_shortcut_input .. "]", font_mtrl, font_size, font, Vector3(offset_x - 100, pos_y, base_text_layer), white)
					end
				end

				local text_sub

				if cs.item_display_func then
					text_sub = tostring(cs.item_display_func(option, current_option_index, cs.options))
				else
					text_sub = tostring(option)
				end

				if is_selected_sub then
					if is_hot_sub then
						cs.option_pos = math.abs(pos_y - root_y)

						Gui.rect(gui, Vector3(0, pos_y - 5, row_highlight_layer), Vector2(offset_x, 25), row_highlight_color)
						Gui.text(gui, ">", font_mtrl, font_size, font, Vector3(setting_x + indicator_offset_anim, pos_y, base_text_layer), text_color_hot)
					end

					Gui.text(gui, text_sub, font_mtrl, font_size, font, Vector3(option_x, pos_y, base_text_layer), text_color_active)
				elseif is_hot_sub then
					cs.option_pos = math.abs(pos_y - root_y)

					if (input_service:get("right_key") or input_service:has("exclusive_right_key") and input_service:get("exclusive_right_key")) and not opened_this_frame then
						update_option(cs, current_option_index)

						if current_selected_option_position then
							DebugScreen.text_effects[#DebugScreen.text_effects + 1] = {
								time = 0,
								start_position = {
									option_x,
									pos_y,
									base_text_layer,
								},
								end_position = {
									current_selected_option_position.x,
									current_selected_option_position.y,
									current_selected_option_position.z,
								},
								text = tostring(option),
							}

							if cs.close_when_selected then
								DebugScreen.active = false
								opened_this_frame = true

								input_manager:device_unblock_service("keyboard", 1, "Debug")
							end

							if cs.clear_when_selected then
								cs.selected_id = nil
							end
						end
					end

					Gui.rect(gui, Vector3(0, pos_y - 5, row_highlight_layer), Vector2(offset_x, 25), row_highlight_color)
					Gui.text(gui, ">", font_mtrl, font_size, font, Vector3(setting_x + indicator_offset_anim, pos_y, base_text_layer), text_color_hot)
					Gui.text(gui, text_sub, font_mtrl, font_size, font, Vector3(option_x, pos_y, base_text_layer), text_color_hot)
				else
					Gui.text(gui, text_sub, font_mtrl, font_size, font, Vector3(option_x, pos_y, base_text_layer), text_color)
				end

				pos_y = DebugScreen.push_setting_size(cs, pos_y, font_size + 2)
			end

			if cs.func and (input_service:get("right_key") or input_service:has("exclusive_right_key") and input_service:get("exclusive_right_key")) and not opened_this_frame then
				exec_func(cs)

				if cs.close_when_selected then
					DebugScreen.active = false
					opened_this_frame = true

					input_manager:device_unblock_service("keyboard", 1, "Debug")
				end

				Application.save_user_settings()
			end

			if cs.preset and (input_service:get("right_key") or input_service:has("exclusive_right_key") and input_service:get("exclusive_right_key")) and not opened_this_frame then
				activate_preset(cs)
				Application.save_user_settings()
			end

			if input_service:get("left_key") then
				DebugScreen.active_id = nil
			end

			if cs.bitmap then
				local bitmap_size = Vector2(1, 1) * cs.bitmap_size

				Gui.bitmap(gui, cs.bitmap, Vector3(offset_x / 2 - cs.bitmap_size / 2, pos_y - cs.bitmap_size, bitmap_layer), bitmap_size, Color(offset_lerp * 250, 255, 255, 255))

				pos_y = DebugScreen.push_setting_size(cs, pos_y, cs.bitmap_size)
			end
		elseif is_hot then
			local shortcuts

			for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
				local temp_cs = cs_data.cs

				if cs == temp_cs or cs == temp_cs.copy then
					shortcuts = (shortcuts and shortcuts .. ", " or "") .. temp_shortcut_input
				end
			end

			if shortcuts then
				Gui.text(gui, "[" .. shortcuts .. "]", font_mtrl, font_size, font, Vector3(offset_x - 100, pos_y, base_text_layer), white)
			end

			Gui.rect(gui, Vector3(0, pos_y - 5, row_highlight_layer), Vector2(offset_x, 25), row_highlight_color)
			Gui.text(gui, ">", font_mtrl, font_size, font, Vector3(10 + indicator_offset_anim, pos_y, base_text_layer), text_color_hot)
			Gui.text(gui, text, font_mtrl, font_size, font, Vector3(setting_x, pos_y, base_text_layer), text_color_hot)

			if input_service:get("left_key") and DebugScreen.active_id == nil then
				if mod_key_down and #cs.options > 0 then
					if cs.is_boolean then
						cs.hot_id = 3
					elseif cs.hot_id == 1 then
						cs.hot_id = #cs.options
					else
						cs.hot_id = cs.hot_id - 1
					end

					update_option(cs, cs.hot_id)
				else
					DebugScreen.active = false

					input_manager:device_unblock_service("keyboard", 1, "Debug")
				end
			end

			if (input_service:get("right_key") or input_service:has("exclusive_right_key") and input_service:get("exclusive_right_key")) and not opened_this_frame then
				if cs.load_items_source_func then
					cs.load_items_source_func(cs.options)
				end

				if mod_key_down and #cs.options > 0 then
					if cs.is_boolean then
						cs.hot_id = cs.selected_id == 1 and 2 or 1
					elseif cs.hot_id == #cs.options then
						cs.hot_id = 1
					else
						cs.hot_id = cs.hot_id + 1
					end

					update_option(cs, cs.hot_id)
				else
					DebugScreen.active_id = setting_i
				end
			end

			if not DebugScreen.search_active and input_service:get("console_favorite_key") then
				if cs.category == "Favorites" then
					cs.copy.copy = nil

					local unfiltered_index = table.find(DebugScreen.console_settings, cs)

					table.remove(DebugScreen.console_settings, unfiltered_index)

					local favorite_index = table.find(DebugScreen.favorites, cs.title)

					if favorite_index then
						table.remove(DebugScreen.favorites, favorite_index)
						Development.set_setting("debug_favorites", DebugScreen.favorites)
						Application.save_user_settings()
					end

					break
				elseif not cs.copy then
					local cs_copy = table.clone(cs)

					cs_copy.category = "Favorites"
					cs.copy = cs_copy
					cs_copy.copy = cs

					table.insert(DebugScreen.console_settings, 1, cs_copy)

					DebugScreen.hot_id = DebugScreen.hot_id + 1
					DebugScreen.target_y_offset = DebugScreen.target_y_offset + font_size
					DebugScreen.favorites[#DebugScreen.favorites + 1] = cs.title

					Development.set_setting("debug_favorites", DebugScreen.favorites)
					Application.save_user_settings()

					break
				end
			end
		else
			if not cs.is_boolean and cs.selected_id ~= nil or cs.options[cs.selected_id] then
				Gui.text(gui, text, font_mtrl, font_size, font, Vector3(setting_x, pos_y, base_text_layer), text_color_overridden)
			else
				Gui.text(gui, text, font_mtrl, font_size, font, Vector3(setting_x, pos_y, base_text_layer), text_color)
			end

			local shortcuts

			for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
				local temp_cs = cs_data.cs

				if cs == temp_cs or cs == temp_cs.copy then
					shortcuts = (shortcuts and shortcuts .. ", " or "") .. temp_shortcut_input
				end
			end

			if shortcuts then
				Gui.text(gui, "[" .. shortcuts .. "]", font_mtrl, font_size, font, Vector3(offset_x - 100, pos_y, base_text_layer), white)
			end
		end

		if is_active or is_hot then
			for numpad_i = 0, 9 do
				local shortcut_input = "numpad " .. numpad_i
				local pressed = Keyboard.pressed(Keyboard.button_index(shortcut_input)) or DebugScreen.numpad_presses[numpad_i]

				if pressed then
					local remove = false

					for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
						local temp_cs = cs_data.cs
						local option = cs_data.option
						local selected_option = is_active and cs.options[cs.hot_id] or DebugScreen.shortcut_any

						if (cs == temp_cs or cs == temp_cs.copy) and option == selected_option then
							DebugScreen.shortcut_list[temp_shortcut_input] = nil

							if temp_shortcut_input == shortcut_input then
								remove = true
							end
						end
					end

					if remove then
						break
					end

					local shortcut_cs = cs.category == "Favorites" and cs.copy or cs
					local option = DebugScreen.shortcut_any

					option = is_active and shortcut_cs.options[shortcut_cs.hot_id] or option
					DebugScreen.shortcut_list[shortcut_input] = {
						cs = shortcut_cs,
						option = option,
					}

					local shortcuts = {}

					for temp_shortcut_input, cs_data in pairs(DebugScreen.shortcut_list) do
						shortcuts[#shortcuts + 1] = temp_shortcut_input
						shortcuts[#shortcuts + 1] = cs_data.cs.title
						shortcuts[#shortcuts + 1] = cs_data.option
					end

					Development.set_setting("debug_shortcuts", shortcuts)
					Application.save_user_settings()
				end
			end
		end

		pos_y = DebugScreen.push_setting_size(cs, pos_y, font_size + 2)
	end

	if DebugScreen.hot_id == 0 and input_service:get("left_key") then
		DebugScreen.active = false

		input_manager:device_unblock_service("keyboard", 1, "Debug")
	end

	local i = 1
	local text_effects = DebugScreen.text_effects
	local num_effects = #text_effects

	while i <= num_effects do
		local effect = text_effects[i]

		effect.time = effect.time + dt

		if effect.time > 0.5 then
			text_effects[i] = text_effects[num_effects]
			text_effects[num_effects] = nil
			num_effects = num_effects - 1
		else
			local start_position = Vector3(effect.start_position[1], effect.start_position[2], effect.start_position[3])
			local end_position = Vector3(effect.end_position[1], effect.end_position[2], effect.end_position[3])
			local lerp_t = ease_out_quad(effect.time, 0, 1, 0.5)
			local positon = math.lerp(start_position, end_position, lerp_t)

			Gui.text(gui, effect.text, font_mtrl, font_size, font, positon, text_color_option_hot)

			i = i + 1
		end
	end
end

DebugScreen.reset_settings = function ()
	local all_false = true

	for i = 1, #DebugScreen.console_settings do
		local cs = DebugScreen.console_settings[i]

		if cs.is_boolean and cs.selected_id == 1 then
			all_false = false

			update_option(cs, 2, true, true)
		end
	end

	if all_false then
		for i = 1, #DebugScreen.console_settings do
			local cs = DebugScreen.console_settings[i]

			if cs.is_boolean and cs.selected_id == 2 then
				update_option(cs, 3, true, true)
			end
		end
	end

	Application.save_user_settings()
end

DebugScreen.set_texture_quality = function (value)
	Application.set_user_setting("texture_settings", "texture_categories/character_df", value)
	Application.set_user_setting("texture_settings", "texture_categories/character_gsm", value)
	Application.set_user_setting("texture_settings", "texture_categories/character_ma", value)
	Application.set_user_setting("texture_settings", "texture_categories/character_nm", value)
	Application.set_user_setting("texture_settings", "texture_categories/coat_of_arms", value)
	Application.set_user_setting("texture_settings", "texture_categories/color_grading", value)
	Application.set_user_setting("texture_settings", "texture_categories/decals", value)
	Application.set_user_setting("texture_settings", "texture_categories/detail_textures", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_df", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_dfa", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_gsm", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_hm", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_ma", value)
	Application.set_user_setting("texture_settings", "texture_categories/environment_nm", value)
	Application.set_user_setting("texture_settings", "texture_categories/fx", value)
	Application.set_user_setting("texture_settings", "texture_categories/gui", value)
	Application.set_user_setting("texture_settings", "texture_categories/skydome", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_ao", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_df", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_dfo", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_gsm", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_nm", value)
	Application.set_user_setting("texture_settings", "texture_categories/weapon_scr", value)
	Application.save_user_settings()
end

DebugScreen.update_search = function (input_manager, input_service, gui, t, dt, opened_this_frame)
	local enter_when_opening = opened_this_frame and DebugScreen.search_string ~= ""
	local toggle_using_backspace = input_service:get("console_search_key") and (DebugScreen.search_string == "" or not DebugScreen.search_active)
	local exit_due_to_exiting_debugscreen = not DebugScreen.active and DebugScreen.search_active
	local exit_with_no_search_hits_hack = DebugScreen.search_active and DebugScreen.hot_id == 0 and input_service:get("left_key")

	if enter_when_opening or toggle_using_backspace or exit_due_to_exiting_debugscreen or exit_with_no_search_hits_hack then
		if not DebugScreen.search_active then
			DebugScreen.unblocked_services_n = input_manager:get_unblocked_services(nil, nil, DebugScreen.unblocked_services)

			input_manager:device_block_services("keyboard", 1, DebugScreen.unblocked_services, DebugScreen.unblocked_services_n, "debug_screen")
			input_manager:device_unblock_service("keyboard", 1, "DebugMenu")

			DebugScreen.search_active = true
		else
			input_manager:device_block_service("keyboard", 1, "DebugMenu")
			input_manager:device_unblock_services("keyboard", 1, DebugScreen.unblocked_services, DebugScreen.unblocked_services_n)

			DebugScreen.search_active = false
		end
	end

	local search_text_box_layer = base_layer + 3
	local search_text_layer = base_layer + 4
	local hot_anim_t = (math.sin(t / GLOBAL_TIME_SCALE * 10) + 1) * 0.5
	local _, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local search_title_box_pos = Vector3(50, res_y - 60, search_text_box_layer)
	local search_text_box_pos = Vector3(250, res_y - 60, search_text_box_layer)
	local search_title_pos = Vector3(60, res_y - 50, search_text_layer)
	local search_text_pos = Vector3(260, res_y - 50, search_text_layer)
	local font_size = DebugScreen.font_size

	DebugScreen.search_text_box_width = DebugScreen.search_text_box_width or 0

	if not DebugScreen.search_active then
		DebugScreen.search_text_box_width = math.max(0, DebugScreen.search_text_box_width - 2000 * dt)

		if DebugScreen.hot_id <= 5 then
			Gui.rect(gui, search_text_box_pos, Vector2(DebugScreen.search_text_box_width, 35), Colors.get_color_with_alpha("dark_olive_green", 100 + math.cos(hot_anim_t) * 25))
			Gui.rect(gui, search_title_box_pos, Vector2(200, 35), Colors.get_color_with_alpha("orange", 15 + math.cos(hot_anim_t) * 5))
			Gui.text(gui, "Search (backspace) ", font_mtrl, font_size, font, search_title_pos, Colors.get_color_with_alpha("white", 100 + math.cos(hot_anim_t) * 100))

			local info_box_width = 300
			local select_first_pos = Vector3(DebugScreen.console_width - info_box_width, res_y - font_size, search_text_layer)

			Gui.text(gui, "Select First (Page up)", font_mtrl, font_size * 0.5, font, select_first_pos, Colors.get_color_with_alpha("white", 100 + math.cos(hot_anim_t) * 100))

			local select_last_pos = Vector3(DebugScreen.console_width - info_box_width, res_y - font_size * 2, search_text_layer)

			Gui.text(gui, "Select Last (Page down)", font_mtrl, font_size * 0.5, font, select_last_pos, Colors.get_color_with_alpha("white", 100 + math.cos(hot_anim_t) * 100))

			local info_submenu_search_pos = Vector3(DebugScreen.console_width - info_box_width, res_y - font_size * 3, search_text_layer)

			Gui.text(gui, "Use dot symbol [.] in search box to search submenus.", font_mtrl, font_size * 0.5, font, info_submenu_search_pos, Colors.get_color_with_alpha("white", 100 + math.cos(hot_anim_t) * 100))

			local info_modified_search_pos = Vector3(DebugScreen.console_width - info_box_width, res_y - font_size * 4, search_text_layer)

			Gui.text(gui, "Use star symbol [*] in search box to filter modified.", font_mtrl, font_size * 0.5, font, info_modified_search_pos, Colors.get_color_with_alpha("white", 100 + math.cos(hot_anim_t) * 100))
		end

		return
	end

	DebugScreen.search_text_box_width = math.min(400, DebugScreen.search_text_box_width + 2000 * dt)

	local numpad_was_or_is_pressed = false

	for numpad_i = 0, 9 do
		local shortcut_input = "numpad " .. tostring(numpad_i)

		numpad_was_or_is_pressed = numpad_was_or_is_pressed or DebugScreen.numpad_presses[numpad_i]
		DebugScreen.numpad_presses[numpad_i] = Keyboard.pressed(Keyboard.button_index(shortcut_input)) or nil
		numpad_was_or_is_pressed = numpad_was_or_is_pressed or DebugScreen.numpad_presses[numpad_i]
	end

	if not numpad_was_or_is_pressed then
		local keystrokes = Keyboard.keystrokes()

		for i = 1, #keystrokes do
			local stroke = keystrokes[i]

			if stroke == "\x7F" then
				DebugScreen.search_string = ""
				DebugScreen.active_id = nil
			elseif type(stroke) == "string" then
				if stroke:find(".", 1, true) == nil and DebugScreen.search_string:find(".", 1, true) == nil then
					DebugScreen.active_id = nil
				end

				DebugScreen.search_string = DebugScreen.search_string .. string.lower(stroke)
			elseif stroke == Keyboard.BACKSPACE and #DebugScreen.search_string > 0 then
				local string_length = string.len(DebugScreen.search_string)
				local character_index = Utf8.location(DebugScreen.search_string, string_length)

				DebugScreen.search_string = DebugScreen.search_string:sub(1, character_index - 1)

				if DebugScreen.search_string:find(".", 1, true) == nil then
					DebugScreen.active_id = nil
				end
			end
		end
	end

	Gui.rect(gui, search_text_box_pos, Vector2(DebugScreen.search_text_box_width, 35), Colors.get_color_with_alpha("dark_olive_green", 225 + math.cos(hot_anim_t) * 25))
	Gui.rect(gui, search_title_box_pos, Vector2(200, 35), Colors.get_color_with_alpha("olive", 225))
	Gui.text(gui, "Search: ", font_mtrl, font_size, font, search_title_pos, Colors.get("white"))
	Gui.text(gui, DebugScreen.search_string, font_mtrl, font_size, font, search_text_pos, Colors.get("yellow"))

	local min, max = Gui.text_extents(gui, DebugScreen.search_string, font_mtrl, font_size)
	local width = max.x - min.x

	Gui.rect(gui, search_text_pos + Vector3(width + 1, -2, 0), Vector2(10, 20), Colors.get_color_with_alpha("white", -50 + math.cos(hot_anim_t) * 250))
end

DebugScreen.hash_options = function ()
	return DebugScreen.settings_hash or 0
end

DebugScreen._propagate_option = function (setting_id, option_index, dont_save)
	Managers.state.network.network_transmit:send_rpc_server("rpc_propagate_debug_option", DebugScreen.hash_options(), setting_id, option_index, dont_save)
end

DebugScreen.handle_propagated_option = function (option_hash, setting_id, option_index, dont_save)
	local own_hash = DebugScreen.hash_options()

	if own_hash ~= option_hash then
		return string.format("Debug option mismatch (%s ~= %s)", own_hash, option_hash)
	end

	local _, cs = table.find_func(DebugScreen.console_settings, function (_, cs)
		return cs.setting_id == setting_id
	end)

	if not cs then
		return "Missing debug option at index " .. tostring(setting_id)
	end

	Debug.sticky_text("[DebugManager] Received propagated debug option '%s' from client", option_index == 0 and cs.title or string.format("%s = %s", cs.title, cs.options[option_index]), "delay", 5)

	if cs.func then
		exec_func(cs)
	else
		update_option(cs, option_index, dont_save)
	end
end
