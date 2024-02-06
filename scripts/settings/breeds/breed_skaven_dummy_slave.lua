-- chunkname: @scripts/settings/breeds/breed_skaven_dummy_slave.lua

local breed_data = {
	behavior = "dummy_clan_rat",
	debug_spawn_category = "Misc",
	horde_behavior = "SET_TO_NIL",
	horde_target_selection = "SET_TO_NIL",
	no_autoaim = true,
	not_bot_target = true,
	passive_in_patrol = false,
	perception = "perception_no_seeing",
	race = "skaven",
	target_selection = "pick_no_targets",
}

for key, value in pairs(Breeds.skaven_slave) do
	local keep_value = breed_data[key]

	if keep_value == "SET_TO_NIL" then
		breed_data[key] = nil
	elseif keep_value ~= nil then
		breed_data[key] = keep_value
	else
		breed_data[key] = value
	end
end

Breeds.skaven_dummy_slave = table.create_copy(Breeds.skaven_dummy_slave, breed_data)
Breeds.skaven_dummy_slave.is_always_spawnable = nil

local action_data = {}

for key, value in pairs(BreedActions.skaven_dummy_clan_rat) do
	local keep_value = action_data[key]

	if keep_value == "SET_TO_NIL" then
		action_data[key] = nil
	elseif keep_value ~= nil then
		action_data[key] = keep_value
	else
		action_data[key] = value
	end
end

BreedActions.skaven_dummy_slave = table.create_copy(BreedActions.skaven_dummy_slave, action_data)
