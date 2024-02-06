-- chunkname: @scripts/settings/mutators/mutator_life.lua

return {
	description = "weaves_life_mutator_desc",
	display_name = "weaves_life_mutator_name",
	icon = "mutator_icon_life_thorns",
	add_to_spawn_queue = function (data, pos, rot)
		local positionBox = Vector3Box()
		local rotationBox = QuaternionBox()

		Vector3Box.store(positionBox, pos)
		QuaternionBox.store(rotationBox, rot)

		data.spawn_queue[#data.spawn_queue + 1] = {
			position = positionBox,
			rotation = rotationBox,
		}
	end,
	spawn_bush = function (context, data, position, rotation)
		local unit_name = "units/weave/life/life_thorn_bushes_mutator"
		local game_session = Network.game_session()
		local is_position_on_navmesh = GwNavQueries.triangle_from_position(data.nav_world, position)

		if not is_position_on_navmesh then
			position = GwNavQueries.inside_position_from_outside_position(data.nav_world, position, 6, 6, 8, 0.5)
		end

		if game_session and position then
			local unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "thorn_bush_unit", data.extension_init_data, position, rotation)

			data.audio_system:play_audio_unit_event("Play_winds_life_gameplay_thorn_grow", unit)
		end
	end,
	server_ai_hit_by_player_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local breed = Unit.get_data(hit_unit, "breed")

		if breed.boss then
			local network_manager = data.network_manager
			local boss_id = network_manager:unit_game_object_id(hit_unit)

			if not data.boss_drop_timers[boss_id] then
				data.boss_drop_timers[boss_id] = {
					timer = data.boss_drop_cooldown,
				}
			end

			if data.boss_drop_timers[boss_id].timer >= data.boss_drop_cooldown then
				local position = Unit.local_position(hit_unit, 0)
				local rotation = Unit.local_rotation(hit_unit, 0)

				data.template.add_to_spawn_queue(data, position, rotation)

				data.boss_drop_timers[boss_id].timer = 0
			end
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
		local position = Unit.local_position(killed_unit, 0)
		local rotation = Unit.local_rotation(killed_unit, 0)

		data.template.add_to_spawn_queue(data, position, rotation)
	end,
	server_start_function = function (context, data)
		local wind_settings = WindSettings.life
		local difficulty = Managers.state.difficulty:get_difficulty()
		local weave_manager = Managers.weave
		local wind_strength = weave_manager:get_wind_strength()

		data.nav_world = Managers.state.entity:system("ai_system"):nav_world()
		data.player_units = {}
		data.boss_drop_timers = {}
		data.boss_drop_cooldown = 2
		data.audio_system = Managers.state.entity:system("audio_system")
		data.network_manager = Managers.state.network
		data.spawn_queue = {}
		data.extension_init_data = {
			area_damage_system = {
				aoe_dot_damage_interval = 0.25,
				area_damage_template = "mutator_life_poison",
				create_nav_tag_volume = true,
				damage_players = true,
				damage_source = "dot_debuff",
				invisible_unit = false,
				nav_tag_volume_layer = "fire_grenade",
				player_screen_effect_name = "fx/screenspace_poison_globe_impact",
				radius = 1,
				aoe_dot_damage = wind_settings.thorns_damage[difficulty][wind_strength],
				aoe_init_damage = wind_settings.thorns_damage[difficulty][wind_strength],
				life_time = wind_settings.thorns_life_time[difficulty][wind_strength],
			},
			props_system = {
				despawn_animation_time = 2,
				spawn_animation_time = 4,
			},
		}
	end,
	server_update_function = function (context, data, dt, t)
		for _, boss in pairs(data.boss_drop_timers) do
			boss.timer = boss.timer + dt
		end

		local num_spawns_queued = #data.spawn_queue

		if num_spawns_queued > 0 then
			local spawn_info = data.spawn_queue[num_spawns_queued]
			local posBox = spawn_info.position
			local position = Vector3Box.unbox(posBox)
			local rotation = QuaternionBox.unbox(spawn_info.rotation)

			data.template.spawn_bush(context, data, position, rotation)

			data.spawn_queue[num_spawns_queued] = nil
		end
	end,
}
