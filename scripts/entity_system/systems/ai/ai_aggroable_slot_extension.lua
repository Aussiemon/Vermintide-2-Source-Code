AIAggroableSlotExtension = class(AIAggroableSlotExtension, AIPlayerSlotExtension)

AIAggroableSlotExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local _, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

	if is_level_unit then
		POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	end

	AIAggroableSlotExtension.super.init(self, extension_init_context, unit, extension_init_data)
end
