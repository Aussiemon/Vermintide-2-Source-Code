local settings = DLCSettings.mutators_batch_01
settings.buff_templates = {
	mutator_ticking_bomb = {
		buffs = {
			{
				duration = 8,
				name = "mutator_ticking_bomb",
				remove_buff_func = "remove_ticking_bomb",
				icon = "buff_icon_mutator_ticking_bomb",
				max_stacks = 1,
				update_func = "update_ticking_bomb",
				apply_buff_func = "apply_ticking_bomb"
			}
		}
	},
	ticking_bomb_decrease_movement = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				multiplier = 0.5,
				update_func = "update_action_lerp_movement_buff",
				name = "decrease_speed",
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 2,
				max_stacks = 1,
				duration = 3,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	}
}
settings.buff_function_templates = {
	apply_ticking_bomb = function (unit, buff, params, world)
		WwiseUtils.trigger_unit_event(world, "Play_mutator_ticking_bomb_tick", unit, 0)

		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit

		if unit == local_player_unit then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.first_person_unit
			local fx = World.create_particles(world, "fx/ticking_bomb_1p_01", POSITION_LOOKUP[first_person_unit])

			World.link_particles(world, fx, first_person_unit, Unit.node(first_person_unit, "root_point"), Matrix4x4.identity(), "stop")

			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, "Play_mutator_ticking_bomb_start")
		else
			local fx = World.create_particles(world, "fx/ticking_bomb_01", POSITION_LOOKUP[unit])

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end
	end,
	update_ticking_bomb = function (unit, buff, params, world)
		return
	end,
	remove_ticking_bomb = function (unit, buff, params, world)
		if Managers.state.network.is_server then
			local explosion_position = POSITION_LOOKUP[unit]
			local damage_source = "grenade_frag_01"
			local explosion_template = ExplosionTemplates.ticking_bomb_explosion

			if explosion_position then
				DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, false)

				local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
				local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
				local damage_source_id = NetworkLookup.damage_sources[damage_source]

				Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false)

				local catapult_force = 12
				local catapult_force_z = 6
				local rand_deg = math.random(0, 360)
				local radians = (rand_deg * math.pi) / 180
				local catapult_direction = Vector3(math.sin(radians), math.cos(radians), 0)
				local velocity = Vector3.normalize(catapult_direction) * catapult_force

				Vector3.set_z(velocity, catapult_force_z)
				StatusUtils.set_catapulted_network(unit, true, velocity)
			end
		end

		WwiseUtils.trigger_unit_event(world, "Stop_mutator_ticking_bomb_tick", unit, 0)
	end
}

return
