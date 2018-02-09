WwiseUtils = WwiseUtils or {}
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

	Managers.state.entity:system("sound_environment_system"):set_source_environment(source, position)

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

	Managers.state.entity:system("sound_environment_system"):set_source_environment(source, position)

	return source, wwise_world
end

return 
