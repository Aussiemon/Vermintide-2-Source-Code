AiWeaponUnitTemplates = {}
local update_shoot, update_windup = nil
AiWeaponUnitTemplates.templates = {
	ratling_gun = {
		shoot_start = function (world, unit, data, shoot_time)
			data.shoot_time = shoot_time
			data.shoot_timer = shoot_time
			local use_occlusion = true
			local node_id = Unit.node(unit, "rp_ratlinggun")
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)
			local playing_id = WwiseWorld.trigger_event(wwise_world, "Play_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", 0)

			data.shoot_sound_source_id = wwise_source_id

			return 
		end,
		destroy = function (world, unit, data)
			if data.shoot_sound_source_id then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)

				data.shoot_sound_source_id = nil
				data.shoot_timer = nil
				data.shoot_time = nil
			end

			return 
		end,
		shoot = function (world, unit, data)
			return 
		end,
		shoot_end = function (world, unit, data)
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)

			data.shoot_sound_source_id = nil
			data.shoot_timer = nil
			data.shoot_time = nil

			return 
		end,
		windup_start = function (world, unit, data, windup_time)
			data.windup_time = windup_time
			data.windup_timer = windup_time

			return 
		end,
		windup_end = function (world, unit, data)
			data.windup_timer = nil
			data.windup_time = nil

			return 
		end,
		update = function (world, unit, data, t, dt)
			if data.shoot_timer then
				data.shoot_timer = data.shoot_timer - dt

				update_shoot(world, unit, data)
			end

			return 
		end
	},
	warpfire_gun = {
		shoot_start = function (world, unit, data, shoot_time)
			data.shoot_time = shoot_time
			data.shoot_timer = shoot_time
			local use_occlusion = true
			local node_id = Unit.node(unit, "rp_warpfiregun")
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)
			local playing_id = WwiseWorld.trigger_event(wwise_world, "Play_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", 0)

			data.shoot_sound_source_id = wwise_source_id

			return 
		end,
		destroy = function (world, unit, data)
			if data.shoot_sound_source_id then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)

				data.shoot_sound_source_id = nil
				data.shoot_timer = nil
				data.shoot_time = nil
			end

			return 
		end,
		shoot = function (world, unit, data)
			return 
		end,
		shoot_end = function (world, unit, data)
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)

			data.shoot_sound_source_id = nil
			data.shoot_timer = nil
			data.shoot_time = nil

			return 
		end,
		windup_start = function (world, unit, data, windup_time)
			data.windup_time = windup_time
			data.windup_timer = windup_time

			return 
		end,
		windup_end = function (world, unit, data)
			data.windup_timer = nil
			data.windup_time = nil

			return 
		end,
		update = function (world, unit, data, t, dt)
			if data.shoot_timer then
				data.shoot_timer = data.shoot_timer - dt

				update_shoot(world, unit, data)
			end

			return 
		end
	}
}

function update_shoot(world, unit, data)
	local wwise_source_id = data.shoot_sound_source_id

	if wwise_source_id then
		local time_shooting = data.shoot_time - data.shoot_timer
		local time_shooting_percent = time_shooting/data.shoot_timer
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", time_shooting_percent)
	end

	return 
end

AiWeaponUnitTemplates.get_template = function (projectile_template, is_husk)
	local templates = AiWeaponUnitTemplates.templates
	local husk_key = (is_husk == true and "husk") or (is_husk == false and "unit") or nil
	local template = (husk_key and templates[projectile_template][husk_key]) or templates[projectile_template]

	return template
end

return 
