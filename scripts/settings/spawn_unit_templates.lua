SpawnUnitTemplates = {}

for _, dlc in pairs(DLCSettings) do
	if dlc.spawn_unit_templates then
		require(dlc.spawn_unit_templates)
	end
end

return
