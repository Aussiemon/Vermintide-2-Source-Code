local components = {
	{
		use_hud_scale = true,
		class_name = "DeusSoftCurrencyIndicatorUI",
		filename = "scripts/ui/hud_ui/deus_soft_currency_indicator_ui",
		visibility_groups = {
			"dead",
			"alive"
		}
	}
}

if BUILD ~= "release" or script_data.debug_enabled then
	table.insert(components, {
		use_hud_scale = true,
		class_name = "DeusDebugUI",
		filename = "scripts/ui/hud_ui/deus_debug_ui",
		visibility_groups = {
			"dead",
			"alive"
		}
	})
	table.insert(components, {
		use_hud_scale = true,
		class_name = "DeusDebugMapUI",
		filename = "scripts/ui/hud_ui/deus_debug_map_ui",
		visibility_groups = {
			"dead",
			"alive"
		}
	})
end

local visibility_groups = {}
visibility_groups[1] = {
	name = "deus_run_stats",
	order = 7,
	validation_function = function (ingame_hud)
		local component = ingame_hud:component("DeusRunStatsView")
		local is_active = component and component:is_ui_active()

		return is_active
	end
}

for i = 1, #components do
	require(components[i].filename)
end

return {
	components = components,
	visibility_groups = visibility_groups
}
