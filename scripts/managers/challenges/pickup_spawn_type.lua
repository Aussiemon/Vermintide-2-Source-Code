-- chunkname: @scripts/managers/challenges/pickup_spawn_type.lua

require("scripts/utils/strict_table")

PickupSpawnType = PickupSpawnType or CreateStrictEnumTable("DropIfFull", "AlwaysDrop", "NeverDrop", "Replace")
