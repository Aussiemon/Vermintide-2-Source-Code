MoverHelper = MoverHelper or {}
Unit._set_mover = Unit._set_mover or Unit.set_mover

Unit.set_mover = function ()
	assert(false, "Use your locomotion-extension's mover functions instead of setting mover directly through Unit.set_mover")
end

MoverHelper.create_collision_state = function (unit, actor_name)
	local actor = Unit.actor(unit, actor_name)

	return {
		disable_reasons = {},
		actor = actor
	}
end

MoverHelper.create_mover_state = function ()
	return {
		disable_reasons = {}
	}
end

MoverHelper.set_active_mover = function (unit, mover_state, new_active_mover)
	if Unit.mover(unit) then
		Unit._set_mover(unit, new_active_mover)
	end

	mover_state.active_mover = new_active_mover
end

MoverHelper.set_disable_reason = function (unit, mover_state, reason, new_state)
	if new_state == false then
		new_state = nil
	end

	local disable_reasons = mover_state.disable_reasons
	disable_reasons[reason] = new_state

	if next(disable_reasons) == nil then
		Unit._set_mover(unit, mover_state.active_mover)
	else
		Unit._set_mover(unit, nil)
	end
end

MoverHelper.set_collision_disable_reason = function (unit, state_data, reason, new_state)
	local disable_reasons = state_data.disable_reasons
	disable_reasons[reason] = new_state
	local actor = state_data.actor

	for r, state in pairs(disable_reasons) do
		if state then
			Actor.set_scene_query_enabled(actor, false)

			return
		end
	end

	Actor.set_scene_query_enabled(actor, true)
end

return
