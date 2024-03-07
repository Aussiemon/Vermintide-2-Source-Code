-- chunkname: @scripts/unit_extensions/weapons/single_weapon_unit_templates_vs.lua

local update_shoot

local function owner_is_local_player(owner_unit)
	if DEDICATED_SERVER then
		return false
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local owner_player = player_manager:unit_owner(owner_unit)

	if owner_player == local_player then
		return true
	end

	return false
end

SingleWeaponUnitTemplates.templates = {
	ratlinggun = {
		shoot_start = function (world, unit, owner_unit, data)
			local shoot_time = 8

			data.shoot_time = shoot_time
			data.shoot_timer = shoot_time

			local use_occlusion = true
			local node_id = 0
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)
			else
				WwiseWorld.trigger_event(wwise_world, "Play_ratling_gunner_shooting_loop", use_occlusion, wwise_source_id)
			end

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", 0)

			data.shoot_sound_source_id = wwise_source_id
		end,
		destroy = function (world, unit, owner_unit, data)
			if data.shoot_sound_source_id then
				local wwise_world = Managers.world:wwise_world(world)

				if owner_is_local_player(owner_unit) then
					WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_shooting_loop", unit)
				else
					WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)
				end

				data.shoot_sound_source_id = nil
				data.shoot_timer = nil
				data.shoot_time = nil
			end
		end,
		shoot = function (world, unit, owner_unit, data)
			return
		end,
		shoot_end = function (world, unit, owner_unit, data)
			if data.shoot_sound_source_id then
				local wwise_world = Managers.world:wwise_world(world)

				if owner_is_local_player(owner_unit) then
					WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_shooting_loop", unit)
				else
					WwiseWorld.trigger_event(wwise_world, "Stop_ratling_gunner_shooting_loop", unit)
				end

				Unit.flow_event(unit, "wind_up_start")

				data.shoot_sound_source_id = nil
				data.shoot_timer = nil
				data.shoot_time = nil
			end
		end,
		windup_start = function (world, unit, owner_unit, data)
			local wwise_world = Managers.world:wwise_world(world)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "Play_player_ratling_gunner_weapon_ready", unit)
			end

			local windup_time = 1

			data.windup_time = windup_time
			data.windup_timer = windup_time
		end,
		windup_end = function (world, unit, owner_unit, data)
			local wwise_world = Managers.world:wwise_world(world)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "Stop_player_ratling_gunner_weapon_ready", unit)
			end

			data.windup_timer = nil
			data.windup_time = nil
		end,
		update = function (world, unit, owner_unit, data, t, dt)
			if data.shoot_timer then
				data.shoot_timer = data.shoot_timer - dt

				update_shoot(world, unit, owner_unit, data)
			end
		end,
	},
	warpfire_gun = {
		windup_start = function (world, unit, owner_unit, data)
			local use_occlusion = true
			local node_id = 0
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "player_enemy_vce_warpfire_shoot_start_sequence", use_occlusion, wwise_source_id)
			else
				WwiseWorld.trigger_event(wwise_world, "husk_vce_warpfire_shoot_start_sequence", use_occlusion, wwise_source_id)
			end
		end,
		windup_end = function (world, unit, owner_unit, data)
			return
		end,
		shoot_start = function (world, unit, owner_unit, data, shoot_time)
			data.shoot_time = shoot_time
			data.shoot_timer = shoot_time

			local use_occlusion = true
			local node_id = 0
			local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(world, unit, node_id)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "player_enemy_warpfire_thrower_shoot_start", use_occlusion, wwise_source_id)
			else
				WwiseWorld.trigger_event(wwise_world, "Play_enemy_warpfire_thrower_shoot", use_occlusion, wwise_source_id)
			end

			WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", 0)

			data.shoot_sound_source_id = wwise_source_id
		end,
		destroy = function (world, unit, owner_unit, data)
			if data.shoot_sound_source_id then
				local wwise_world = Managers.world:wwise_world(world)

				if owner_is_local_player(owner_unit) then
					WwiseWorld.trigger_event(wwise_world, "player_enemy_warpfire_thrower_shoot_end", unit)
				else
					WwiseWorld.trigger_event(wwise_world, "Stop_enemy_warpfire_thrower_shoot", unit)
				end

				data.shoot_sound_source_id = nil
				data.shoot_timer = nil
				data.shoot_time = nil
			end
		end,
		shoot_end = function (world, unit, owner_unit, data)
			local wwise_world = Managers.world:wwise_world(world)

			if owner_is_local_player(owner_unit) then
				WwiseWorld.trigger_event(wwise_world, "player_enemy_warpfire_thrower_shoot_end", unit)
			else
				WwiseWorld.trigger_event(wwise_world, "Stop_enemy_warpfire_thrower_shoot", unit)
			end

			Unit.flow_event(unit, "wind_up_start")

			data.shoot_sound_source_id = nil
			data.shoot_timer = nil
			data.shoot_time = nil
		end,
		update = function (world, unit, owner_unit, data, t, dt)
			if data.shoot_timer then
				data.shoot_timer = data.shoot_timer - dt

				update_shoot(world, unit, owner_unit, data)
			end
		end,
	},
}

function update_shoot(world, unit, owner_unit, data)
	local wwise_source_id = data.shoot_sound_source_id

	if wwise_source_id then
		local time_shooting = data.shoot_time - data.shoot_timer
		local time_shooting_percent = time_shooting / data.shoot_timer
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.set_source_parameter(wwise_world, wwise_source_id, "ratling_gun_shooting_loop_parameter", time_shooting_percent)
	end
end
