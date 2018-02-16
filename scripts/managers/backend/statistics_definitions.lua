require("scripts/settings/breeds")

StatisticsDefinitions = {
	session = {},
	player = {},
	unit_test = {}
}
local session = StatisticsDefinitions.session
local player = StatisticsDefinitions.player
local unit_test = StatisticsDefinitions.unit_test
local platform = PLATFORM
player.kills_melee = {
	value = 0,
	sync_on_hot_join = true
}
player.kills_ranged = {
	value = 0,
	sync_on_hot_join = true
}
player.headshots = {
	value = 0,
	sync_on_hot_join = true
}
player.revives = {
	value = 0,
	sync_on_hot_join = true
}
player.aidings = {
	value = 0,
	sync_on_hot_join = true
}
player.saves = {
	value = 0,
	sync_on_hot_join = true
}
player.times_revived = {
	value = 0,
	sync_on_hot_join = true
}
player.damage_dealt = {
	value = 0,
	sync_on_hot_join = true
}
player.times_friend_healed = {
	value = 0,
	database_name = "times_friend_healed"
}
player.dynamic_objects_destroyed = {
	value = 0,
	database_name = "dynamic_objects_destroyed"
}
player.complete_level_bright_wizard = {
	value = 0,
	database_name = "complete_level_bright_wizard"
}
player.complete_level_wood_elf = {
	value = 0,
	database_name = "complete_level_wood_elf"
}
player.complete_level_empire_soldier = {
	value = 0,
	database_name = "complete_level_empire_soldier"
}
player.complete_level_witch_hunter = {
	value = 0,
	database_name = "complete_level_witch_hunter"
}
player.complete_level_dwarf_ranger = {
	value = 0,
	database_name = "complete_level_dwarf_ranger"
}
player.collected_grimoires = {}
player.collected_tomes = {}
player.kills_total = {
	value = 0,
	sync_on_hot_join = true
}
player.kills_per_breed = {}
player.damage_taken = {
	value = 0,
	sync_on_hot_join = true
}
player.damage_dealt_per_breed = {}
player.completed_levels = {}
player.completed_levels_difficulty = {}
player.crafted_items = {
	value = 0,
	database_name = "crafted_items"
}
player.lorebook_unlocks = {
	database_name = "lorebook_unlocks",
	database_type = "hexarray",
	value = {}
}
unit_test.kills_total = {
	value = 0,
	database_name = "kills_total"
}
unit_test.lorebook_unlocks = {
	database_name = "lorebook_unlocks",
	database_type = "hexarray",
	value = {}
}
unit_test.profiles = {
	witch_hunter = {
		kills_total = {
			value = 0
		}
	}
}

for breed_name, breed in pairs(Breeds) do
	player.kills_per_breed[breed_name] = {
		value = 0,
		sync_on_hot_join = true,
		name = breed_name
	}
	player.damage_dealt_per_breed[breed_name] = {
		value = 0,
		name = breed_name
	}
end

LevelDifficultyDBNames = {}

for level_key, level in pairs(LevelSettings) do
	if table.contains(UnlockableLevels, level_key) then
		player.completed_levels[level_key] = {
			value = 0,
			sync_on_hot_join = true,
			sync_to_server = true,
			database_name = level_key
		}
		local level_difficulty_name = level_key .. "_difficulty_completed"
		LevelDifficultyDBNames[level_key] = level_difficulty_name
		player.completed_levels_difficulty[level_difficulty_name] = {
			value = 0,
			sync_on_hot_join = true,
			database_name = level_difficulty_name
		}
		local grimoire_name = "collected_grimoire_" .. level_key
		player.collected_grimoires[level_key] = {
			value = 0,
			database_name = grimoire_name
		}
		local tome_name = "collected_tome_" .. level_key
		player.collected_tomes[level_key] = {
			value = 0,
			database_name = tome_name
		}
	end
end

for i = 1, 508, 1 do
	player.lorebook_unlocks.value[i] = false
	unit_test.lorebook_unlocks.value[i] = false
end

local function add_names(stats)
	for stat_name, stat_definition in pairs(stats) do
		if not stat_definition.value then
			add_names(stat_definition)
		else
			stat_definition.name = stat_name
		end
	end

	return 
end

add_names(player)
add_names(unit_test)

return 
