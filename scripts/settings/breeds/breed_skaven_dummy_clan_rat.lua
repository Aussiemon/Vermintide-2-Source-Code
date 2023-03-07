local breed_data = {
	not_bot_target = true,
	horde_behavior = "SET_TO_NIL",
	target_selection = "pick_no_targets",
	behavior = "dummy_clan_rat",
	horde_target_selection = "SET_TO_NIL",
	passive_in_patrol = false,
	race = "skaven",
	no_autoaim = true,
	perception = "perception_no_seeing",
	debug_spawn_category = "Misc"
}

for key, value in pairs(Breeds.skaven_clan_rat) do
	local keep_value = breed_data[key]

	if keep_value == "SET_TO_NIL" then
		breed_data[key] = nil
	elseif keep_value ~= nil then
		breed_data[key] = keep_value
	else
		breed_data[key] = value
	end
end

Breeds.skaven_dummy_clan_rat = table.create_copy(Breeds.skaven_dummy_clan_rat, breed_data)
Breeds.skaven_dummy_clan_rat.is_always_spawnable = nil
local action_data = {}

for key, value in pairs(BreedActions.skaven_clan_rat) do
	local keep_value = action_data[key]

	if keep_value == "SET_TO_NIL" then
		action_data[key] = nil
	elseif keep_value ~= nil then
		action_data[key] = keep_value
	else
		action_data[key] = value
	end
end

BreedActions.skaven_dummy_clan_rat = table.create_copy(BreedActions.skaven_dummy_clan_rat, action_data)
