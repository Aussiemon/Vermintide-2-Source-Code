-- chunkname: @scripts/flow/flow_callbacks_vs.lua

local flow_return_table = Boot.flow_return_table
local unit_alive = Unit.alive

function flow_query_ghost_mode_active(params)
	local unit = params.unit

	if not unit_alive(unit) then
		flow_return_table.active = false
		flow_return_table.not_active = false

		return
	end

	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	flow_return_table.active = is_in_ghost_mode
	flow_return_table.not_active = not is_in_ghost_mode

	return flow_return_table
end
