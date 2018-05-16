for name, setting in pairs(BossSettings) do
	local boss_events = setting.boss_events

	if name ~= "disabled" then
		for i = 1, #boss_events, 1 do
			local event_name = boss_events[i]
			local exists = TerrorEventBlueprints[event_name] or event_name == "nothing"

			fassert(exists, "BossSettings '%s'.boss_events in conflict_settings.lua, points to a non-existing terror_event '%s'. There is no such event defined in terror_event_blueprints.lua", name, event_name)
		end
	end

	local rare_events = setting.rare_events

	if name ~= "disabled" then
		for i = 1, #rare_events, 1 do
			local event_name = rare_events[i]
			local exists = TerrorEventBlueprints[event_name] or event_name == "nothing"

			fassert(exists, "BossSettings '%s'.rare_events in conflict_settings.lua, points to a non-existing terror_event '%s'. There is no such event defined in terror_event_blueprints.lua", name, event_name)
		end
	end
end

for i = 1, #BreedPacks, 1 do
	local pack_data = BreedPacks[i]

	fassert(pack_data.pack_type, "BreedPack %d has a missing 'pack_type' field", i)
	fassert(type(pack_data.spawn_weight) == "number", "BreedPack %d has a missing/faulty spawn_weight. ('%s') ", i, tostring(pack_data.spawn_weight))

	local okay = pack_data.members and type(pack_data.members) == "table"

	fassert(okay, "BreedPack %d is missing table filed 'member'.", i)
end

return
