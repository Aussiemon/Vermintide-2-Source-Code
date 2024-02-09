-- chunkname: @scripts/entity_system/systems/animation/animation_callback_templates_vs.lua

local BLACKBOARDS = BLACKBOARDS

AnimationCallbackTemplates.server.anim_cb_direct_damage_vs = function (unit, param)
	print("anim_cb_direct_damage_vs finished")
end

AnimationCallbackTemplates.server.anim_cb_jump_start_finished_vs = function (unit, param)
	print("anim_cb_jump_start_finished_vs finished")
end

AnimationCallbackTemplates.server.anim_cb_spawn_projectile_vs = function (unit, param)
	print("anim_cb_spawn_projectile finished")
end

AnimationCallbackTemplates.server.anim_cb_throw_vs = function (unit, param)
	print("anim_cb_throw finished")
end

AnimationCallbackTemplates.server.anim_cb_damage_vs = function (unit, param)
	print("anim_cb_damage_vs finished")
end

AnimationCallbackTemplates.server.anim_cb_attack_finished_vs = function (unit, param)
	print("anim_cb_attack_finished_vs finished")
end

AnimationCallbackTemplates.server.anim_cb_move_vs = function (unit, param)
	print("anim_cb_move_vs finished")
end

AnimationCallbackTemplates.server.anim_cb_transition_camera = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_camera_transition = true
	end
end

AnimationCallbackTemplates.server.anim_cb_jump_give_control = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_give_control = true
	end
end

AnimationCallbackTemplates.server.anim_cb_tunneling_begin = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.tunneling_started = true
	end
end

AnimationCallbackTemplates.server.anim_cb_tunneling_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.tunneling_finished = true
	end
end

AnimationCallbackTemplates.client.anim_cb_jump_start_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_start_finished = true
	end
end

AnimationCallbackTemplates.client.anim_cb_jump_climb_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_climb_finished = true
	end
end

AnimationCallbackTemplates.client.anim_cb_transition_camera = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_camera_transition = true
	end
end

AnimationCallbackTemplates.client.anim_cb_jump_give_control = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.jump_give_control = true
	end
end

AnimationCallbackTemplates.client.anim_cb_tunneling_begin = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.tunneling_begin = true
	end
end

AnimationCallbackTemplates.client.anim_cb_tunneling_finished = function (unit, param)
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.tunneling_finished = true
	end
end
