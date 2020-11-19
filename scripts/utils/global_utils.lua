local release_build = BUILD == "release"
local script_data = script_data
script_data.disable_debug_position_lookup = (release_build and true) or nil
local unit_alive = Unit.alive
PACKAGED_BUILD = (script_data.packaged_build and true) or false
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

	if Application.user_setting("hud_clamp_ui_scaling") then
		scale = math.min(scale, 1) or scale
	end

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

function CLEAR_ALL_PLAYER_LISTS()
	print("Clearing all global lookup lists")
	table.clear(BLACKBOARDS)
	assert(next(BLACKBOARDS) == nil)
	table.clear(ALIVE)
	assert(next(ALIVE) == nil)
	CLEAR_POSITION_LOOKUP()
	table.clear(FROZEN)
	table.clear(BREED_DIE_LOOKUP)
end

return
