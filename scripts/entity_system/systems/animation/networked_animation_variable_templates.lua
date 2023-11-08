NetworkedAnimationVariableTemplates = {
	moving_attack_fwd_speed = {
		anims = {
			"attack_run",
			"attack_run_2",
			"attack_run_3",
			"attack_move",
			"attack_move_2",
			"attack_move_3",
			"attack_move_4",
			"attack_cleave_moving_01"
		},
		init = function (unit, scratchpad)
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(unit)
			local target_unit_id = GameSession.game_object_field(network_manager:game(), unit_id, "target_unit_id")
			scratchpad.target_unit = network_manager:game_object_or_level_unit(target_unit_id)
			scratchpad.previous_move_animation_value = 0
			scratchpad.move_animation_variable = Unit.animation_find_variable(unit, scratchpad.variable_name)
		end,
		update = function (unit, scratchpad, dt, t)
			local target_unit = scratchpad.target_unit

			if not target_unit then
				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)
				local target_unit_id = GameSession.game_object_field(network_manager:game(), unit_id, "target_unit_id")
				target_unit = network_manager:game_object_or_level_unit(target_unit_id, false)
				scratchpad.target_unit = target_unit
			end

			if not ALIVE[target_unit] then
				return
			end

			local data = scratchpad.variable_data
			local animation_move_speed_config = data.animation_move_speed_config

			if animation_move_speed_config then
				local wanted_value = AiUtils.calculate_animation_movespeed(animation_move_speed_config, unit, target_unit)
				local lerp_speed = data.move_speed_variable_lerp_speed
				local lerp_t = math.min(dt * lerp_speed, 1)
				local final_value = math.lerp_clamped(scratchpad.previous_move_animation_value, wanted_value, lerp_t)
				scratchpad.previous_move_animation_value = final_value
				local animation_variable = scratchpad.move_animation_variable

				if animation_variable then
					Unit.animation_set_variable(unit, animation_variable, final_value)
				end
			end
		end
	}
}
NetworkedAnimationVariableTemplatesLookup = {}
local lookup = NetworkedAnimationVariableTemplatesLookup

for variable_name, template in pairs(NetworkedAnimationVariableTemplates) do
	for _, anim_name in ipairs(template.anims) do
		local variables = lookup[anim_name] or {}
		variables[#variables + 1] = variable_name
		lookup[anim_name] = variables
	end
end
