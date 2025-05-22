-- chunkname: @scripts/managers/mod/mod_shim.lua

ModShim = class(ModShim)
ModShim.patches = {
	{
		name = "_G.UIResolution",
		mods = {
			"HideBuffs",
		},
		func = function ()
			return RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
		end,
	},
	{
		name = "_G.UIResolutionScale_pow2",
		mods = {
			"item_filter",
			"VMF",
		},
		func = function ()
			local x = RESOLUTION_LOOKUP.res_w / 1920
			local math = math
			local m, e = math.frexp(x)

			if m == 0.5 then
				return x
			end

			return math.ldexp(1, e)
		end,
	},
	{
		name = "_G.UIResolutionWidthFragments",
		mods = {
			"loadout_manager_vt2",
		},
		func = function ()
			return 1920
		end,
	},
	{
		name = "_G.UIResolutionHeightFragments",
		mods = {
			"loadout_manager_vt2",
		},
		func = function ()
			return 1080
		end,
	},
	{
		name = "_G.AccomodateViewport",
		mods = {
			"HiDefUIScaling",
		},
		func = NOP,
	},
	{
		name = "IngameUI:unavailable_hero_popup_active",
		mods = {
			"VMF",
		},
		func = function (self)
			return self:get_active_popup("profile_picker")
		end,
	},
	{
		name = "HeroViewStateAchievements:_is_button_hover_enter",
		mods = {
			"ui_improvements",
		},
		func = function (self, widget, hotspot_name)
			return UIUtils.is_button_hover_enter(widget, hotspot_name)
		end,
	},
}
ModShim.error_handling = {
	error_state = {},
	state_bound_log = function (vmf_mod, identifier, message, ...)
		local state = ModShim.error_handling.error_state[identifier] or {
			printed = {},
		}

		ModShim.error_handling.error_state[identifier] = state

		local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

		if not game_mode or state.printed[game_mode] then
			return
		end

		state.printed[game_mode] = true

		ModShim.error_handling.log(vmf_mod, message, ...)
	end,
	log = function (vmf_mod, message, ...)
		vmf_mod:error(message, ...)
	end,
}
ModShim.wedges = {
	{
		date = "5/27/2024 10:15:00 PM",
		mods = {
			"loadout_manager_vt2",
		},
		override_hooks = {
			{
				name = "BackendUtils.get_loadout_item",
				func = function (vmf_mod, mod_func, mod_name, hooked_function, ...)
					local hook_result = mod_func(hooked_function, ...)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name ~= "adventure" and not global_is_inside_inn then
						local original_result = hooked_function(...)

						if hook_result ~= original_result then
							local display_name = MechanismSettings[mechanism_name] and MechanismSettings[mechanism_name].display_name

							if mechanism_name == "versus" then
								ModShim.error_handling.state_bound_log(vmf_mod, "loadout_item", "Unauthorized override of inventory items. Not allowed in %s.", display_name and Localize(display_name) or mechanism_name)
							else
								ModShim.error_handling.state_bound_log(vmf_mod, "loadout_item", "Unauthorized override of bot's inventory items. Not allowed in %s. Please refer to the official loadout system for bot overrides.", display_name and Localize(display_name) or mechanism_name)
							end
						end

						return original_result
					end

					return hook_result
				end,
			},
			{
				name = "BackendInterfaceTalentsPlayfab:get_talents",
				func = function (vmf_mod, mod_func, mod_name, hooked_function, ...)
					local hook_result = mod_func(hooked_function, ...)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name ~= "adventure" and not global_is_inside_inn then
						local original_result = hooked_function(...)

						if hook_result ~= original_result then
							local display_name = MechanismSettings[mechanism_name] and MechanismSettings[mechanism_name].display_name

							if mechanism_name == "versus" then
								ModShim.error_handling.state_bound_log(vmf_mod, "loadout_talent", "Unauthorized override of talents. Not allowed in %s.", display_name and Localize(display_name) or mechanism_name)
							else
								ModShim.error_handling.state_bound_log(vmf_mod, "loadout_talent", "Unauthorized override of bot's talents. Not allowed in %s. Please refer to the official loadout system for bot overrides.", display_name and Localize(display_name) or mechanism_name)
							end
						end

						return original_result
					end

					return hook_result
				end,
			},
		},
		initializer = function (vmf_mod)
			local restore_loadout = vmf_mod.restore_loadout

			if restore_loadout then
				vmf_mod.restore_loadout = function (...)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name == "versus" and not global_is_inside_inn then
						return
					end

					if mechanism_name ~= "adventure" and (not global_is_inside_inn or mechanism_name == "versus") then
						local display_name = MechanismSettings[mechanism_name] and MechanismSettings[mechanism_name].display_name

						ModShim.error_handling.state_bound_log(vmf_mod, "loadout_restore", "Unauthorized override of loadout. Not allowed in %s.", display_name and Localize(display_name) or mechanism_name)

						return
					end

					restore_loadout(...)
				end
			end
		end,
	},
	{
		date = "5/30/2024 12:15:00 PM",
		mods = {
			"HideBuffs",
		},
		override_hooks = {
			{
				name = "UnitFrameUI.draw",
				func = function (vmf_mod, mod_func, mod_name, hooked_function, self, ...)
					local player = Managers.player:local_player()
					local party = player and player:get_party()

					if party and party.name == "dark_pact" then
						return hooked_function(self, ...)
					else
						return mod_func(hooked_function, self, ...)
					end
				end,
			},
			{
				name = "OverchargeBarUI._update_overcharge",
				func = function (vmf_mod, mod_func, mod_name, hooked_function, self, ...)
					local player = Managers.player:local_player()
					local party = player and player:get_party()

					if party and party.name == "dark_pact" then
						return hooked_function(self, ...)
					else
						return mod_func(hooked_function, self, ...)
					end
				end,
			},
		},
	},
	{
		date = "12/5/2024 12:15:00 PM",
		mods = {
			"NeuterUltEffects",
		},
		new_hooks = {
			{
				name = "MoodHandler.set_mood",
				func = function (vmf_mod, mod_name, hooked_function, self, mood_name, ...)
					if not vmf_mod.SETTING_NAMES then
						return hooked_function(self, mood_name, ...)
					end

					local mood_to_name = {
						skill_ranger = "RANGER",
						skill_shade = "SHADE",
						skill_slayer = "SLAYER",
						skill_zealot = "ZEALOT",
					}

					if mood_to_name[mood_name] and vmf_mod:get(vmf_mod.SETTING_NAMES[mood_to_name[mood_name] .. "_VISUAL"]) then
						return
					end

					if (mood_name == "skill_huntsman_surge" or mood_name == "skill_huntsman_stealth") and vmf_mod:get(vmf_mod.SETTING_NAMES.HUNTSMAN_VISUAL) or (mood_name == "wounded" or mood_name == "bleeding_out") and vmf_mod:get(vmf_mod.SETTING_NAMES.WOUNDED) or mood_name == "knocked_down" and vmf_mod:get(vmf_mod.SETTING_NAMES.KNOCKED_DOWN) or mood_name == "heal_medkit" and vmf_mod:get(vmf_mod.SETTING_NAMES.HEALING) then
						return
					end

					return hooked_function(self, mood_name, ...)
				end,
			},
		},
	},
}
ModShim.warnings = ModShim.warnings or {}

local has_printed_warning = ModShim.warnings

local function print_deprecated_function_warning(name)
	if has_printed_warning[name] then
		return
	end

	has_printed_warning[name] = true

	if Managers.mod:developer_mode_enabled() then
		local warning = string.format("Function %q is deprecated!", name)

		Managers.mod:print("warning", "%s", warning)
		print("[ModShim] %s\n%s", warning, Script.callstack())
	end
end

ModShim.init = function (self)
	self._enable_wedges = not script_data["eac-untrusted"]

	if self._enable_wedges then
		self._wedged_mod_by_id = {}
		self._ugc_data_by_id = {}
	end

	if script_data.debug_mod_shim then
		printf("[ModShim] Initializing ModShim. Wedges enabled: %s.", self._enable_wedges)
	end

	local data_list = ModShim.patches

	for i = 1, #data_list do
		local data = data_list[i]
		local name = data.name
		local object_name, method_name = string.match(name, "^([^:.]+)[:.]([^:.]+)$")

		fassert(object_name and method_name, "Malformed name for shim (expected `object:method` but got %q)", name)

		local object = rawget(_G, object_name)

		fassert(object, "Object %q not in the global scope", object_name)

		local method = rawget(object, method_name)

		fassert(method == nil, "Method %q already defined in object %q", method_name, object_name)

		local func = data.func

		rawset(object, method_name, function (...)
			print_deprecated_function_warning(name)

			return func(...)
		end)
	end
end

ModShim._parse_timestamp = function (self, timestamp)
	local pattern = "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+) (%a+)"
	local month, day, year, hour, minute, second, period = timestamp:match(pattern)

	hour = tonumber(hour)

	if period == "PM" and hour ~= 12 then
		hour = hour + 12
	elseif period == "AM" and hour ~= 12 then
		hour = 0
	end

	return os.time({
		month = tonumber(month),
		day = tonumber(day),
		year = tonumber(year),
		hour = hour,
		minute = tonumber(minute),
		second = tonumber(second),
	})
end

ModShim._wedge_hook = function (self, vmf_mod, mod_name, hook_func_name, mod_wedge_lookup, object, method, object_name, method_name, wedge_func)
	local hook_func = vmf_mod[hook_func_name]

	if not hook_func then
		printf("[ModShim] Trying to wedge non existing hook func '%s'. Ignoring.", hook_func_name)

		return
	end

	mod_wedge_lookup[object] = mod_wedge_lookup[object] or {}
	mod_wedge_lookup[object][method] = wedge_func
	mod_wedge_lookup[object][method_name] = wedge_func
	mod_wedge_lookup[object_name] = mod_wedge_lookup[object_name] or {}
	mod_wedge_lookup[object_name][method] = wedge_func
	mod_wedge_lookup[object_name][method_name] = wedge_func

	if script_data.debug_mod_shim then
		printf("[ModShim] <%s:%s> wedged %s:%s (%s:%s)", mod_name, hook_func_name, object_name, method_name, object, method)
	end

	local function hook_override(_self, hook_obj, hook_method, mod_func, ...)
		local func = mod_func
		local wedge_func = mod_wedge_lookup[hook_obj] and mod_wedge_lookup[hook_obj][hook_method]

		if wedge_func then
			printf("[ModShim] <%s> hooking into %s.%s with wedged function", mod_name, hook_obj, hook_method)

			function func(hooked_function_or_any, ...)
				if not vmf_mod:is_enabled() then
					if type(hooked_function_or_any) == "function" then
						return hooked_function_or_any(...)
					end

					return
				end

				local wedge_func_ok, wedge_func_result = pcall(wedge_func, vmf_mod, mod_func, mod_name, hooked_function_or_any, ...)

				if not wedge_func_ok then
					printf("[ModShim] <%s> Wedge error in '%s:%s': %s. args: %s", vmf_mod:get_internal_data("name"), object_name, method_name, wedge_func_result, table.tostring({
						...,
					}))
					print(Script.callstack())

					return mod_func(hooked_function_or_any, ...)
				end

				return wedge_func_result
			end
		elseif script_data.debug_mod_shim then
			printf("[ModShim] <%s> hooking into %s:%s without wedged function", mod_name, hook_obj, hook_method)
		end

		return hook_func(_self, hook_obj, hook_method, func, ...)
	end

	vmf_mod[hook_func_name] = hook_override
end

ModShim._add_hook = function (self, vmf_mod, mod_name, hook_func_name, mod_new_hook_lookup, object, method, object_name, method_name, wedge_func)
	local hook_func = vmf_mod[hook_func_name]

	if not hook_func then
		printf("[ModShim] Trying to wedge non existing hook func '%s'. Ignoring.", hook_func_name)

		return
	end

	local mod_override_upvalue = {}

	hook_func(vmf_mod, object or object_name, method_name or method, function (func, ...)
		if mod_override_upvalue.func then
			return mod_override_upvalue.func(func, ...)
		end

		return wedge_func(vmf_mod, mod_name, func, ...)
	end)

	mod_new_hook_lookup[object] = mod_new_hook_lookup[object] or {}
	mod_new_hook_lookup[object][method] = wedge_func
	mod_new_hook_lookup[object][method_name] = wedge_func
	mod_new_hook_lookup[object_name] = mod_new_hook_lookup[object_name] or {}
	mod_new_hook_lookup[object_name][method] = wedge_func
	mod_new_hook_lookup[object_name][method_name] = wedge_func

	if script_data.debug_mod_shim then
		printf("[ModShim] <%s:%s> wedged %s:%s (%s:%s)", mod_name, hook_func_name, object_name, method_name, object, method)
	end

	local function hook_override(_self, hook_obj, hook_method, mod_func, ...)
		local func = mod_func
		local wedge_func = mod_new_hook_lookup[hook_obj] and mod_new_hook_lookup[hook_obj][hook_method]

		if wedge_func then
			printf("[ModShim] <%s> overriding wedged function %s.%s with mods own hook", mod_name, hook_obj, hook_method)

			mod_override_upvalue.func = mod_func
		end

		return hook_func(_self, hook_obj, hook_method, func, ...)
	end

	vmf_mod[hook_func_name] = hook_override
end

ModShim._mod_wedges = function (self, mod_name, timestamp)
	if not timestamp then
		printf("[ModShim] <%s> Wedges ignored due to not being able to deduce timestamp", mod_name)
	end

	local mod_wedges = table.select_array(ModShim.wedges, function (_, wedge)
		if wedge.mods and not table.contains(wedge.mods, mod_name) then
			return
		end

		local wedge_date = self:_parse_timestamp(wedge.date)

		if wedge_date < timestamp then
			printf("[ModShim] <%s> Wedge ignored due to being outdated. Wedge created '%s' (%s), mod updated '%s'", mod_name, wedge.date, wedge_date, timestamp)

			return
		end

		return wedge
	end)

	return mod_wedges
end

ModShim._mod_created = function (self, vmf_mod, mod_name)
	if not self._enable_wedges then
		return
	end

	if script_data.debug_mod_shim then
		printf("[ModShim] Mod created <%s>", mod_name)
	end

	local mod_data = Managers.mod:currently_loading_mod()

	self:_handle_wedges(vmf_mod, mod_name, mod_data)
end

ModShim._handle_wedges = function (self, vmf_mod, mod_name, mod_data)
	local mod_wedges = self:_mod_wedges(mod_name, mod_data.timestamp)

	if table.is_empty(mod_wedges) then
		return
	end

	if script_data.debug_mod_shim then
		printf("[ModShim] \tHas wedges: %s%s", #mod_wedges > 0, #mod_wedges > 0 and "\n\t" .. table.tostring(mod_wedges) or "")
	end

	local mod_id = vmf_mod:get_internal_data("workshop_id")

	self._wedged_mod_by_id[mod_id] = vmf_mod

	local mod_override_lookup = {}
	local mod_new_hook_lookup = {}

	for wedge_i = 1, #mod_wedges do
		local wedge = mod_wedges[wedge_i]
		local override_hooks = wedge.override_hooks

		if override_hooks then
			self:_handle_hook_overrides(vmf_mod, mod_name, mod_data, override_hooks, mod_override_lookup)
		end

		local new_hooks = wedge.new_hooks

		if new_hooks then
			self:_handle_new_hooks(vmf_mod, mod_name, mod_data, new_hooks, mod_new_hook_lookup)
		end
	end
end

ModShim._handle_hook_overrides = function (self, vmf_mod, mod_name, mod_data, override_hooks, mod_override_lookup)
	for hook_i = 1, #override_hooks do
		repeat
			local hook = override_hooks[hook_i]
			local name = hook.name
			local object_name, method_name = string.match(name, "^([^:.]+)[:.]([^:.]+)$")
			local object = rawget(_G, object_name)

			if not object then
				Application.error("[ModShim] Attempting to wedge method '%s' in '%s' for mod '%s' but the object does not exist in the global scope.", method_name, object_name, mod_name)

				break
			end

			local method = rawget(object, method_name)

			if not method then
				Application.error("[ModShim] Attempting to wedge method '%s' in '%s' for mod '%s' but it doesn't exist.", method_name, object_name, mod_name)

				break
			end

			if hook.func then
				self:_wedge_hook(vmf_mod, mod_name, "hook", mod_override_lookup, object, method, object_name, method_name, hook.func)
			end

			if hook.func_safe then
				self:_wedge_hook(vmf_mod, mod_name, "hook_safe", mod_override_lookup, object, method, object_name, method_name, hook.func_safe)
			end

			if hook.func_origin then
				self:_wedge_hook(vmf_mod, mod_name, "hook_origin", mod_override_lookup, object, method, object_name, method_name, hook.func_origin)
			end
		until true
	end
end

ModShim._handle_new_hooks = function (self, vmf_mod, mod_name, mod_data, new_hooks, mod_new_hook_lookup)
	for hook_i = 1, #new_hooks do
		local hook = new_hooks[hook_i]
		local name = hook.name
		local object_name, method_name = string.match(name, "^([^:.]+)[:.]([^:.]+)$")
		local object = rawget(_G, object_name)

		if not object then
			Application.error("[ModShim] Attempting to wedge method '%s' in '%s' for mod '%s' but the object does not exist in the global scope.", method_name, object_name, mod_name)

			break
		end

		local method = rawget(object, method_name)

		if not method then
			Application.error("[ModShim] Attempting to wedge method '%s' in '%s' for mod '%s' but it doesn't exist.", method_name, object_name, mod_name)

			break
		end

		if hook.func then
			self:_add_hook(vmf_mod, mod_name, "hook", mod_new_hook_lookup, object, method, object_name, method_name, hook.func)
		end

		if hook.func_safe then
			self:_add_hook(vmf_mod, mod_name, "hook_safe", mod_new_hook_lookup, object, method, object_name, method_name, hook.func_safe)
		end

		if hook.func_origin then
			self:_add_hook(vmf_mod, mod_name, "hook_origin", mod_new_hook_lookup, object, method, object_name, method_name, hook.func_origin)
		end
	end
end

ModShim.mod_post_create = function (self, mod_data)
	if not self._enable_wedges then
		return
	end

	if script_data.debug_mod_shim then
		printf("[ModShim][mod_post_create] %s %s", mod_data.name, table.tostring(mod_data, 1))
	end

	local mod_id = mod_data.id
	local workshop_name = mod_data.name

	if workshop_name == "Vermintide Mod Framework" then
		local mod = get_mod("VMF")
		local mod_list = mod.mods

		if getmetatable(mod_list) then
			Application.error("[ModShim] VMF's modlist's metatable is about to be overridden. Disabling ModPatches.")

			return
		end

		if script_data.debug_mod_shim then
			print("[ModShim] VFM initialized. Listening to mod creations.")
		end

		local mod_create_hook = {
			__newindex = function (mods, mod_name, vmf_mod, ...)
				rawset(mods, mod_name, vmf_mod, ...)

				if script_data.debug_mod_shim then
					print("[ModShim] mod_create_hook", mods, mod_name, vmf_mod, ...)
				end

				local ok, error = pcall(self._mod_created, self, vmf_mod, mod_name, mod_id)

				if not ok then
					printf("[ModShim] Error during mod_wedge: %s", error)
					print(Script.callstack())
				end
			end,
		}

		setmetatable(mod_list, mod_create_hook)
	else
		local vmf_mod = self._wedged_mod_by_id[mod_id]

		if vmf_mod then
			local name = vmf_mod:get_internal_data("name")
			local wedges = self:_mod_wedges(name, mod_data.timestamp)

			for i = 1, #wedges do
				repeat
					local initializer = wedges[i].initializer

					if initializer then
						printf("[ModShim] <%s> Running initializer for wedge number %s", name, i)

						local initializer_ok, error_msg = pcall(initializer, vmf_mod)

						if not initializer_ok then
							printf("[ModShim] <%s> Initializer error in wedge number %s. Ignoring: %s", name, i, error_msg)
							print(Script.callstack())
						end

						break
					end
				until true
			end
		end
	end
end
