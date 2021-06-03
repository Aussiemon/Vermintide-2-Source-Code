local UNIT_NAMES = {
	default = "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01",
	bleed = "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01_bleed",
	poison = "units/beings/player/way_watcher_thornsister/abilities/ww_thornsister_thorn_wall_01_poison"
}
local WALL_TYPES = table.enum("default", "bleed", "poison")
SpawnUnitTemplates.thornsister_thorn_wall_unit = {
	spawn_func = function (source_unit, position, rotation, state_int, group_spawn_index)
		local UNIT_NAME = UNIT_NAMES[WALL_TYPES.default]
		local UNIT_TEMPLATE_NAME = "thornsister_thorn_wall_unit"
		local wall_index = state_int
		local despawn_sound_event = "career_ability_kerillian_sister_wall_disappear"
		local life_time = 6
		local area_damage_params = {
			radius = 0.3,
			area_damage_template = "we_thornsister_thorn_wall",
			invisible_unit = false,
			nav_tag_volume_layer = "temporary_wall",
			create_nav_tag_volume = true,
			aoe_dot_damage = 0,
			aoe_init_damage = 0,
			damage_source = "career_ability",
			aoe_dot_damage_interval = 0,
			damage_players = false,
			source_unit = source_unit,
			life_time = life_time
		}
		local props_params = {
			life_time = life_time,
			owner_unit = source_unit,
			despawn_sound_event = despawn_sound_event
		}
		local health_params = {
			health = 20
		}
		local buffs_to_add = nil
		local source_talent_extension = ScriptUnit.has_extension(source_unit, "talent_system")

		if source_talent_extension then
			if source_talent_extension:has_talent("kerillian_thorn_sister_tanky_wall") then
				local life_time_mult = 1
				local life_time_bonus = 4.2
				area_damage_params.life_time = area_damage_params.life_time * life_time_mult + life_time_bonus
				props_params.life_time = props_params.life_time * life_time_mult + life_time_bonus
			elseif source_talent_extension:has_talent("kerillian_thorn_sister_explosive_wall") then
				local life_time_mult = 0.17
				local life_time_bonus = 0
				area_damage_params.create_nav_tag_volume = false
				area_damage_params.life_time = area_damage_params.life_time * life_time_mult + life_time_bonus
				props_params.life_time = props_params.life_time * life_time_mult + life_time_bonus
				UNIT_NAME = UNIT_NAMES[WALL_TYPES.bleed]
			elseif source_talent_extension:has_talent("kerillian_thorn_sister_debuff_wall") then
				UNIT_NAME = UNIT_NAMES[WALL_TYPES.poison]
			end
		end

		local extension_init_data = {
			area_damage_system = area_damage_params,
			props_system = props_params,
			health_system = health_params,
			death_system = {
				death_reaction_template = "thorn_wall",
				is_husk = false
			},
			hit_reaction_system = {
				is_husk = false,
				hit_reaction_template = "level_object"
			}
		}
		local wall_unit = Managers.state.unit_spawner:spawn_network_unit(UNIT_NAME, UNIT_TEMPLATE_NAME, extension_init_data, position, rotation)
		local random_rotation = Quaternion(Vector3.up(), math.random() * 2 * math.pi - math.pi)

		Unit.set_local_rotation(wall_unit, 0, random_rotation)

		local buff_extension = ScriptUnit.has_extension(wall_unit, "buff_system")

		if buff_extension and buffs_to_add then
			for i = 1, #buffs_to_add, 1 do
				buff_extension:add_buff(buffs_to_add[i])
			end
		end

		local thorn_wall_extension = ScriptUnit.has_extension(wall_unit, "props_system")

		if thorn_wall_extension then
			thorn_wall_extension.wall_index = wall_index
			thorn_wall_extension.group_spawn_index = group_spawn_index
		end
	end
}
SpawnUnitTemplates.vortex_unit = {
	spawn_func = function (source_unit, position, rotation, state_int)
		local UNIT_NAME = "units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex"
		local vortex_template_name = "spirit_storm"
		local vortex_template = VortexTemplates[vortex_template_name]
		local inner_decal_unit_name, outer_decal_unit_name = nil
		local spawn_radius = 2
		local inner_radius_p = math.min(spawn_radius / vortex_template.full_inner_radius, 1)
		local inner_decal_unit = nil

		if inner_decal_unit_name then
			local inner_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), position)
			local inner_radius = math.max(vortex_template.full_inner_radius, inner_radius_p * vortex_template.full_inner_radius)

			Matrix4x4.set_scale(inner_spawn_pose, Vector3(inner_radius, inner_radius, inner_radius))

			inner_decal_unit = Managers.state.unit_spawner:spawn_network_unit(inner_decal_unit_name, "network_synched_dummy_unit", nil, inner_spawn_pose)
		end

		local outer_decal_unit = nil

		if outer_decal_unit_name then
			local outer_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), position)
			local outer_radius = math.max(vortex_template.full_outer_radius, inner_radius_p * vortex_template.full_outer_radius)

			Matrix4x4.set_scale(outer_spawn_pose, Vector3(outer_radius, outer_radius, outer_radius))

			outer_decal_unit = Managers.state.unit_spawner:spawn_network_unit(outer_decal_unit_name, "network_synched_dummy_unit", nil, outer_spawn_pose)
		end

		local UNIT_TEMPLATE_NAME = "vortex_unit"
		local extension_init_data = {
			area_damage_system = {
				vortex_template_name = vortex_template_name,
				inner_decal_unit = inner_decal_unit,
				outer_decal_unit = outer_decal_unit,
				owner_unit = source_unit
			}
		}

		Managers.state.unit_spawner:spawn_network_unit(UNIT_NAME, UNIT_TEMPLATE_NAME, extension_init_data, position, rotation)
	end
}

return
