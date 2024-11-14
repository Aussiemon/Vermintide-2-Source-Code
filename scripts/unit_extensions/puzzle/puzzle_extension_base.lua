-- chunkname: @scripts/unit_extensions/puzzle/puzzle_extension_base.lua

PuzzleExtensionBase = class(PuzzleExtensionBase)

PuzzleExtensionBase.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._puzzle_group = Unit.get_data(unit, "puzzle_group")
	self._optional_order_id = tonumber(Unit.get_data(unit, "puzzle_order_id"))

	fassert(self._puzzle_group, "Unit '%s' is missing puzzle group", unit)
	fassert(self:puzzle_value(), "Unit '%s' does not expose 'puzzle_value' as an External Output or script_data", unit)
end

PuzzleExtensionBase.puzzle_group_id = function (self)
	return self._puzzle_group
end

PuzzleExtensionBase.puzzle_value = function (self)
	return tostring(Unit.get_data(self._unit, "puzzle_value"))
end

PuzzleExtensionBase.order_id = function (self)
	return self._optional_order_id
end

PuzzleExtensionBase.on_puzzle_completed = function (self, puzzle_id)
	Unit.set_flow_variable(self._unit, "completed_puzzle_name", puzzle_id)
	Unit.flow_event(self._unit, "on_puzzle_completed")
end

PuzzleExtensionBase.destroy = function (self)
	return
end
