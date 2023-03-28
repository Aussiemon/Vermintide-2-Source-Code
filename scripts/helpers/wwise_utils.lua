WwiseUtils = WwiseUtils or {}
WwiseUtils.EVENT_ID_NONE = 0

WwiseUtils.trigger_position_event = function (world, event, position)
	local source, wwise_world = WwiseUtils.make_position_auto_source(world, position)
	local id = WwiseWorld.trigger_event(wwise_world, event, source)

	return id, source, wwise_world
end

WwiseUtils.trigger_unit_event = function (world, event, unit, node_id)
	local source, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)
	local id = WwiseWorld.trigger_event(wwise_world, event, source)

	return id, source, wwise_world
end

WwiseUtils.make_position_auto_source = function (world, position)
	local wwise_world = Managers.world:wwise_world(world)
	local source = WwiseWorld.make_auto_source(wwise_world, position)
	local system = Managers.state.entity:system("sound_environment_system")

	if system ~= nil then
		system:set_source_environment(source, position)
	end

	return source, wwise_world
end

WwiseUtils.make_unit_auto_source = function (world, unit, node_id)
	local wwise_world = Managers.world:wwise_world(world)
	local source, position = nil

	if node_id then
		source = WwiseWorld.make_auto_source(wwise_world, unit, node_id)
		position = Unit.world_position(unit, node_id)
	else
		source = WwiseWorld.make_auto_source(wwise_world, unit)
		position = Unit.world_position(unit, 0)
	end

	local system = Managers.state.entity:system("sound_environment_system")

	if system ~= nil then
		system:set_source_environment(source, position)
	end

	return source, wwise_world
end

WwiseUtils.make_unit_manual_source = function (wwise_world, unit, node_id)
	local source = nil

	if node_id then
		source = WwiseWorld.make_manual_source(wwise_world, unit, node_id)
	else
		source = WwiseWorld.make_manual_source(wwise_world, unit)
	end

	local system = Managers.state.entity:system("sound_environment_system")

	if system ~= nil then
		local position = Unit.world_position(unit, node_id or 0)

		system:set_source_environment(source, position)
	end

	return source
end
