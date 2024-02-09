-- chunkname: @scripts/settings/spawn_unit_templates_vs.lua

local spawn_unit_templates_vs = {
	troll_puke = {
		spawn_func = function (source_unit, position, rotation, state_int)
			local nav_world = Managers.state.entity:system("ai_system"):nav_world()
			local above, below = 1, 2.5

			if ChaosTrollStateVomiting.position_on_navmesh(position, nav_world, above, below) then
				local dir = Quaternion.forward(rotation)
				local extension_init_data = {
					area_damage_system = {
						flow_dir = dir,
						liquid_template = state_int == 1 and "bile_troll_vomit_near" or "bile_troll_vomit",
						source_unit = source_unit,
					},
				}
				local aoe_unit_name = "units/hub_elements/empty"
				local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position)
				local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

				liquid_area_damage_extension:ready()
			end
		end,
	},
	vortex = {
		spawn_func = function (source_unit, position, rotation, state_int)
			local blackboard = BLACKBOARDS[source_unit]

			if not blackboard then
				blackboard = {}
				BLACKBOARDS[source_unit] = blackboard
			end

			blackboard.world = blackboard.world or Managers.state.conflict._world

			local t = Managers.time:time("game")
			local dt = 0
			local action = BreedActions.chaos_vortex_sorcerer.spawn_vortex

			blackboard.action = action

			if not blackboard.vortex_data then
				local vortex_template_name = "carousel"

				BTChaosSorcererSkulkApproachAction.initialize_vortex_data(nil, blackboard, vortex_template_name)
			end

			local vortex_data = blackboard.vortex_data

			vortex_data.vortex_spawn_pos:store(position)

			vortex_data.vortex_spawn_radius = 10
			vortex_data.spawn_timer = t + 25

			local vortex_template = vortex_data.vortex_template
			local summon_position = vortex_data.vortex_spawn_pos:unbox()
			local spawn_radius = vortex_data.vortex_spawn_radius
			local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)
			local owner_is_client = state_int == 0

			if owner_is_client then
				local inner_decal_unit_name = action.inner_decal_unit_name

				if inner_decal_unit_name then
					local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), summon_position)
					local inner_radius = math.max(vortex_template.min_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

					Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

					vortex_data.inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
				end

				local outer_decal_unit_name = action.outer_decal_unit_name

				if outer_decal_unit_name then
					local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), summon_position)
					local outer_radius = math.max(vortex_template.min_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

					Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

					vortex_data.outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
				end
			end

			BTChaosSorcererSummoningAction._spawn_vortex(nil, source_unit, blackboard, t, dt, position, blackboard.vortex_data)
		end,
	},
	vortex_dummy_missile = {
		spawn_func = function (source_unit, hand_position, summon_rotation, state_int)
			local blackboard = BLACKBOARDS[source_unit]

			if not blackboard then
				blackboard = {}
				BLACKBOARDS[source_unit] = blackboard
			end

			blackboard.world = blackboard.world or Managers.state.conflict._world
			blackboard.vortex_data = blackboard.vortex_data or {}

			local vortex_data = blackboard.vortex_data

			vortex_data.extra_time = 2
			vortex_data.max_height = 10
			vortex_data.num_dummy_missiles = 0

			local action = BreedActions.chaos_vortex_sorcerer.spawn_vortex
			local summon_position = vortex_data.summon_position and vortex_data.summon_position:unbox() or POSITION_LOOKUP[source_unit]
			local summon_direction = Quaternion.forward(summon_rotation)

			BTChaosSorcererSummoningAction._launch_vortex_dummy_missile(nil, source_unit, action, vortex_data, hand_position, summon_position, summon_direction)
		end,
	},
}

table.merge_recursive(SpawnUnitTemplates, spawn_unit_templates_vs)
