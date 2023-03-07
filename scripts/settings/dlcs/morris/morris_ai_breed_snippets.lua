AiBreedSnippets.on_greed_pinata_spawned = function (unit, blackboard)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	buff_extension:add_buff("curse_greed_pinata_drops")
end
