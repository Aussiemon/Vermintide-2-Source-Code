ModShim = ModShim or {}
ModShim.patches = {
	{
		name = "_G.UIResolution",
		mods = {
			"HideBuffs"
		},
		func = function ()
			return RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
		end
	},
	{
		name = "_G.UIResolutionScale_pow2",
		mods = {
			"item_filter",
			"VMF"
		},
		func = function ()
			local x = RESOLUTION_LOOKUP.res_w / 1920
			local math = math
			local m, e = math.frexp(x)

			if m == 0.5 then
				return x
			end

			return math.ldexp(1, e)
		end
	},
	{
		name = "_G.UIResolutionWidthFragments",
		mods = {
			"loadout_manager_vt2"
		},
		func = function ()
			return 1920
		end
	},
	{
		name = "_G.UIResolutionHeightFragments",
		mods = {
			"loadout_manager_vt2"
		},
		func = function ()
			return 1080
		end
	},
	{
		name = "_G.AccomodateViewport",
		mods = {
			"HiDefUIScaling"
		},
		func = NOP
	},
	{
		name = "IngameUI:unavailable_hero_popup_active",
		mods = {
			"VMF"
		},
		func = function (self)
			return self:get_active_popup("profile_picker")
		end
	},
	{
		name = "HeroViewStateAchievements:_is_button_hover_enter",
		mods = {
			"ui_improvements"
		},
		func = function (self, widget, hotspot_name)
			return UIUtils.is_button_hover_enter(widget, hotspot_name)
		end
	}
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

ModShim.start = function ()
	local data_list = ModShim.patches

	for i = 1, #data_list, 1 do
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

return
