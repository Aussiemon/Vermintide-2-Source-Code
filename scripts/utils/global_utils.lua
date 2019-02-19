local release_build = BUILD == "release"
local script_data = script_data
script_data.disable_debug_position_lookup = (release_build and true) or nil
local unit_alive = Unit.alive
PACKAGED_BUILD = (script_data.packaged_build and true) or false
DEDICATED_SERVER = Application.is_dedicated_server()
RESOLUTION_LOOKUP = RESOLUTION_LOOKUP or {}
POSITION_LOOKUP = POSITION_LOOKUP or Script.new_map(256)
BLACKBOARDS = BLACKBOARDS or Script.new_map(256)
ALIVE = POSITION_LOOKUP
FROZEN = FROZEN or {}
local position_lookup = POSITION_LOOKUP
local resolution_lookup = RESOLUTION_LOOKUP
BREED_DIE_LOOKUP = BREED_DIE_LOOKUP or {}

function CLEAR_POSITION_LOOKUP()
	table.clear(position_lookup)
end

local world_position = Unit.world_position

function UPDATE_POSITION_LOOKUP()
	EngineOptimized.update_position_lookup(position_lookup)
end

function UPDATE_RESOLUTION_LOOKUP(force_update, optional_scale_multiplier)
	local w, h = Application.resolution()
	local resolution_modified = w ~= resolution_lookup.res_w or h ~= resolution_lookup.res_h
	local width_scale = w / UIResolutionWidthFragments()
	local height_scale = h / UIResolutionHeightFragments()
	local scale = math.min(width_scale, height_scale)
	local scale_modified = false

	if optional_scale_multiplier then
		scale = scale * optional_scale_multiplier
	end

	if resolution_lookup.scale ~= scale then
		scale_modified = true
	end

	if resolution_modified or scale_modified or force_update then
		resolution_lookup.res_w = w
		resolution_lookup.res_h = h

		AccomodateViewport()

		resolution_lookup.scale = scale
		resolution_lookup.inv_scale = 1 / scale
	end

	resolution_lookup.modified = resolution_modified or force_update
end

PLAYER_UNITS = PLAYER_UNITS or {}
PLAYER_POSITIONS = PLAYER_POSITIONS or {}
PLAYER_AND_BOT_UNITS = PLAYER_AND_BOT_UNITS or {}
PLAYER_AND_BOT_POSITIONS = PLAYER_AND_BOT_POSITIONS or {}
VALID_PLAYERS_AND_BOTS = VALID_PLAYERS_AND_BOTS or {}
VALID_TARGETS_PLAYERS_AND_BOTS = VALID_TARGETS_PLAYERS_AND_BOTS or {}
AI_TARGET_UNITS = AI_TARGET_UNITS or {}

local function is_valid(unit)
	return unit_alive(unit) and not ScriptUnit.extension(unit, "status_system").ready_for_assisted_respawn
end

local function is_valid_target(unit)
	local status_ext = ScriptUnit.extension(unit, "status_system")

	return not status_ext:is_in_end_zone() and not status_ext:is_invisible() and not status_ext.spawn_grace and ScriptUnit.extension(unit, "health_system"):is_alive()
end

local function is_valid_aggro_target(unit)
	if not unit_alive(unit) then
		return false
	end

	local status_ext = ScriptUnit.has_extension(unit, "status_system")

	if status_ext then
		return not status_ext.ready_for_assisted_respawn and not status_ext:is_in_end_zone() and not status_ext:is_invisible() and not status_ext.spawn_grace and ScriptUnit.extension(unit, "health_system"):is_alive()
	end

	return true
end

function UPDATE_PLAYER_LISTS()
	local human_units = PLAYER_UNITS
	local human_unit_positions = PLAYER_POSITIONS
	local human_and_bot_units = PLAYER_AND_BOT_UNITS
	local human_and_bot_unit_positions = PLAYER_AND_BOT_POSITIONS
	local valid_humans_and_bots = VALID_PLAYERS_AND_BOTS
	local valid_target_humans_and_bots = VALID_TARGETS_PLAYERS_AND_BOTS

	table.clear(valid_humans_and_bots)
	table.clear(valid_target_humans_and_bots)

	local players = Managers.player:human_and_bot_players()
	local num_human_units = 0
	local num_human_and_bot_units = 0

	for _, player in pairs(players) do
		local unit = player.player_unit

		if is_valid(unit) then
			local pos = position_lookup[unit]
			num_human_and_bot_units = num_human_and_bot_units + 1
			human_and_bot_units[num_human_and_bot_units] = unit
			human_and_bot_unit_positions[num_human_and_bot_units] = pos
			valid_humans_and_bots[unit] = true

			if player:is_player_controlled() then
				num_human_units = num_human_units + 1
				human_units[num_human_units] = unit
				human_unit_positions[num_human_units] = pos
			end

			if is_valid_target(unit) then
				valid_target_humans_and_bots[unit] = true
			end
		end
	end

	local i = num_human_units + 1

	while human_units[i] do
		human_units[i] = nil
		human_unit_positions[i] = nil
		i = i + 1
	end

	local k = num_human_and_bot_units + 1

	while human_and_bot_units[k] do
		human_and_bot_units[k] = nil
		human_and_bot_unit_positions[k] = nil
		k = k + 1
	end

	local ai_target_units = AI_TARGET_UNITS
	local aggro_system = Managers.state.entity:system("aggro_system")
	local aggroable_units = aggro_system.aggroable_units
	local j = 1

	for unit, _ in pairs(aggroable_units) do
		if is_valid_aggro_target(unit) then
			ai_target_units[j] = unit
			j = j + 1
		end
	end

	while ai_target_units[j] do
		ai_target_units[j] = nil
		j = j + 1
	end
end

function REMOVE_PLAYER_UNIT_FROM_LISTS(player_unit)
	POSITION_LOOKUP[player_unit] = nil
	local player_units = PLAYER_UNITS
	local player_positions = PLAYER_POSITIONS
	local size = #player_units

	for i = 1, size, 1 do
		if player_unit == player_units[i] then
			player_units[i] = player_units[size]
			player_units[size] = nil
			player_positions[i] = player_positions[size]
			player_positions[size] = nil

			break
		end
	end

	VALID_PLAYERS_AND_BOTS[player_unit] = nil
	VALID_TARGETS_PLAYERS_AND_BOTS[player_unit] = nil
	local player_and_bot_units = PLAYER_AND_BOT_UNITS
	local player_and_bot_positions = PLAYER_AND_BOT_POSITIONS
	size = #player_and_bot_units

	for i = 1, size, 1 do
		if player_unit == player_and_bot_units[i] then
			player_and_bot_units[i] = player_and_bot_units[size]
			player_and_bot_units[size] = nil
			player_and_bot_positions[i] = player_and_bot_positions[size]
			player_and_bot_positions[size] = nil

			break
		end
	end

	REMOVE_AGGRO_UNITS(player_unit)
end

function REMOVE_AGGRO_UNITS(aggro_unit)
	local ai_target_units = AI_TARGET_UNITS
	local size = #ai_target_units

	for i = 1, size, 1 do
		if aggro_unit == ai_target_units[i] then
			ai_target_units[i] = ai_target_units[size]
			ai_target_units[size] = nil

			break
		end
	end
end

function CLEAR_ALL_PLAYER_LISTS()
	print("Clearing all global lookup lists")
	table.clear(PLAYER_UNITS)
	assert(next(PLAYER_UNITS) == nil)
	table.clear(PLAYER_POSITIONS)
	assert(next(PLAYER_POSITIONS) == nil)
	table.clear(PLAYER_AND_BOT_UNITS)
	assert(next(PLAYER_AND_BOT_UNITS) == nil)
	table.clear(PLAYER_AND_BOT_POSITIONS)
	assert(next(PLAYER_AND_BOT_POSITIONS) == nil)
	table.clear(VALID_PLAYERS_AND_BOTS)
	assert(next(VALID_PLAYERS_AND_BOTS) == nil)
	table.clear(VALID_TARGETS_PLAYERS_AND_BOTS)
	assert(next(VALID_TARGETS_PLAYERS_AND_BOTS) == nil)
	table.clear(AI_TARGET_UNITS)
	assert(next(AI_TARGET_UNITS) == nil)
	table.clear(BLACKBOARDS)
	assert(next(BLACKBOARDS) == nil)
	table.clear(ALIVE)
	assert(next(ALIVE) == nil)
	CLEAR_POSITION_LOOKUP()
	table.clear(FROZEN)
	table.clear(BREED_DIE_LOOKUP)
end

return
