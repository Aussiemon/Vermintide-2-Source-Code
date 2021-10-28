local TARGET_RESPAWN_CHECK_DELAY = 5
local TARGET_SPAWN_OFFSET_Z = 1

local function update_positions(rotten_miasma_safe_area, target_to_follow)
	local game_session = Managers.state.network:game()

	if not Unit.alive(rotten_miasma_safe_area) or not Unit.alive(target_to_follow) or not game_session then
		return
	end

	local target_pos = Unit.local_position(target_to_follow, 0)

	Unit.set_local_position(rotten_miasma_safe_area, 0, target_pos)
end

local function get_new_target_to_follow()
	local pickup_system = Managers.state.entity:system("pickup_system")
	local pickup_units_by_type = pickup_system:get_pickups_by_type("deus_relic_01")
	local deus_relic_pickup = pickup_units_by_type[1]

	if deus_relic_pickup then
		return deus_relic_pickup
	end

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_UNITS = hero_side.PLAYER_UNITS

	for _, player_unit in ipairs(PLAYER_UNITS) do
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		if inventory_extension:has_inventory_item("slot_level_event", "wpn_deus_relic_01") then
			return player_unit
		end
	end

	return nil
end

local function create_default_target(position, rotation)
	local extension_init_data = {
		pickup_system = {
			has_physics = true,
			pickup_name = "deus_relic_01",
			spawn_type = "dropped"
		},
		projectile_locomotion_system = {
			network_position = AiAnimUtils.position_network_scale(position, true),
			network_rotation = AiAnimUtils.rotation_network_scale(rotation, true),
			network_velocity = AiAnimUtils.velocity_network_scale(Vector3.zero(), true),
			network_angular_velocity = AiAnimUtils.velocity_network_scale(Vector3.zero(), true)
		}
	}

	return Managers.state.unit_spawner:spawn_network_unit("units/weapons/player/pup_deus_relic_01/pup_deus_relic_01", "deus_relic", extension_init_data, position, rotation)
end

local function get_path_position()
	local conflict_director = Managers.state.conflict
	local main_paths = conflict_director.level_analysis:get_main_paths()

	if not main_paths then
		return nil
	end

	local main_path_info = conflict_director.main_path_info
	local main_path_player_info = conflict_director.main_path_player_info
	local path_position = MainPathUtils.get_main_path_point_between_players(main_paths, main_path_info, main_path_player_info):unbox()
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local position = LocomotionUtils.pos_on_mesh(nav_world, path_position)

	if not position then
		return nil
	end

	position.z = position.z + TARGET_SPAWN_OFFSET_Z

	return position
end

local function setup_rotten_miasma(buff_name)
	local position = get_path_position()

	if not position then
		return nil, nil
	end

	local rotation = Quaternion.identity()
	local target_to_follow = get_new_target_to_follow()
	target_to_follow = target_to_follow or create_default_target(position, rotation)
	local extension_init_data = {
		buff_system = {
			breed = "n/a",
			initial_buff_names = {
				buff_name
			}
		}
	}
	local rotten_miasma_safe_area = Managers.state.unit_spawner:spawn_network_unit("units/gameplay/rotten_miasma_safe_area/rotten_miasma_safe_area_01", "buff_objective_unit", extension_init_data, position, rotation)

	return rotten_miasma_safe_area, target_to_follow
end

local ROTTEN_MIASMA_DEBUFF = "curse_rotten_miasma"

return {
	description = "curse_rotten_miasma_desc",
	package_name = "resource_packages/mutators/mutator_curse_rotten_miasma",
	display_name = "curse_rotten_miasma_name",
	icon = "deus_curse_nurgle_01",
	server_update_function = function (context, data, dt, t)
		if not data.rotten_miasma_safe_area then
			local rotten_miasma_safe_area, target_to_follow = setup_rotten_miasma(ROTTEN_MIASMA_DEBUFF)
			data.rotten_miasma_safe_area = rotten_miasma_safe_area
			data.target_to_follow = target_to_follow
		end

		local new_target_to_follow = get_new_target_to_follow()

		if new_target_to_follow then
			data.target_to_follow = new_target_to_follow
			data.target_respawn_at = nil
		else
			data.target_respawn_at = data.target_respawn_at or TARGET_RESPAWN_CHECK_DELAY + t
			local position = get_path_position()

			if data.target_respawn_at <= t and position then
				local rotation = Quaternion.identity()
				data.target_to_follow = create_default_target(position, rotation)
			end
		end

		update_positions(data.rotten_miasma_safe_area, data.target_to_follow)
	end,
	server_stop_function = function (context, data, is_destroy)
		local rotten_miasma_safe_area = data.rotten_miasma_safe_area

		if ALIVE[rotten_miasma_safe_area] then
			Managers.state.unit_spawner:mark_for_deletion(rotten_miasma_safe_area)
		end
	end
}
