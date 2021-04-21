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

for i = 1, #components, 1 do
	require(components[i].filename)
end

return {
	components = components,
	visibility_groups = visibility_groups
}
