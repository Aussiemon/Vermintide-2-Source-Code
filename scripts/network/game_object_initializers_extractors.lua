local go_type_table = nil
local temp_table = {}

local function enemy_unit_common_extractor(unit, game_session, game_object_id)
	local breed_name_id = GameSession.game_object_field(game_session, game_object_id, "breed_name")
	local breed_name = NetworkLookup.breeds[breed_name_id]
	local breed = Breeds[breed_name]

	Unit.set_data(unit, "breed", breed)

	local level_settings = LevelSettings[Managers.state.game_mode:level_key()]
	local climate_type = level_settings.climate_type or "default"

	Unit.set_flow_variable(unit, "climate_type", climate_type)
	Unit.flow_event(unit, "climate_type_set")

	return breed, breed_name
end

go_type_table = {
	initializers = {
		player_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local player = ScriptUnit.extension(unit, "input_system").player
			local mover = Unit.mover(unit)
			local profile_id = player:profile_index()

			assert(profile_id)

			local profile = SPProfiles[profile_id]

			assert(profile, "No such profile with index %s", tostring(profile_id))

			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local career_index = career_extension:career_index()
			local cosmetic_extension = ScriptUnit.extension(unit, "cosmetic_system")
			local skin = cosmetic_extension:get_equipped_skin()
			local skin_name = skin.name
			local frame_name = cosmetic_extension:get_equipped_frame_name()
			local husk_unit = Cosmetics[skin_name].third_person_husk
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local aim_position = first_person_extension:current_position()
			local rotation = Unit.local_rotation(unit, 0)
			local experience = ExperienceSettings.get_experience(profile.display_name)
			local level = ExperienceSettings.get_level(experience)
			local max_wounds = ScriptUnit.extension(unit, "status_system"):max_wounds_network_safe()
			local data_table = {
				ammo_percentage = 1,
				has_moved_from_start_position = false,
				ability_percentage = 0,
				moving_platform = 0,
				go_type = NetworkLookup.go_types.player_unit,
				husk_unit = NetworkLookup.husks[husk_unit],
				skin_name = NetworkLookup.cosmetics[skin_name],
				frame_name = NetworkLookup.cosmetics[frame_name],
				wounds = max_wounds,
				level = level,
				prestige_level = ProgressionUnlocks.get_prestige_level(profile.display_name),
				position = Mover.position(mover),
				pitch = Quaternion.pitch(rotation),
				yaw = Quaternion.yaw(rotation),
				owner_peer_id = player:network_id(),
				local_player_id = player:local_player_id(),
				aim_direction = Vector3(1, 0, 0),
				aim_position = aim_position,
				velocity = Vector3(0, 0, 0),
				average_velocity = Vector3(0, 0, 0),
				profile_id = profile_id,
				career_id = career_index
			}

			return data_table
		end,
		player_bot_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local player = Managers.player:owner(unit)
			local mover = Unit.mover(unit)
			local profile_id = player:profile_index()

			assert(profile_id)

			local profile = SPProfiles[profile_id]

			assert(profile, "No such profile with index %s", tostring(profile_id))

			local cosmetic_extension = ScriptUnit.extension(unit, "cosmetic_system")
			local skin = cosmetic_extension:get_equipped_skin()
			local skin_name = skin.name
			local frame_name = cosmetic_extension:get_equipped_frame_name()
			local husk_unit = Cosmetics[skin_name].third_person_husk
			local max_wounds = ScriptUnit.extension(unit, "status_system"):max_wounds_network_safe()
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local career_index = career_extension:career_index()
			local rotation = Unit.local_rotation(unit, 0)
			local data_table = {
				ammo_percentage = 1,
				ability_percentage = 0,
				prestige_level = 0,
				level = 0,
				moving_platform = 0,
				go_type = NetworkLookup.go_types.player_bot_unit,
				husk_unit = NetworkLookup.husks[husk_unit],
				skin_name = NetworkLookup.cosmetics[skin_name],
				frame_name = NetworkLookup.cosmetics[frame_name],
				wounds = max_wounds,
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				pitch = Quaternion.pitch(rotation),
				yaw = Quaternion.yaw(rotation),
				velocity = Vector3(0, 0, 0),
				average_velocity = Vector3(0, 0, 0),
				owner_peer_id = player:network_id(),
				local_player_id = player:local_player_id(),
				aim_direction = Vector3(1, 0, 0),
				profile_id = profile_id,
				career_id = career_index
			}

			return data_table
		end,
		ai_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_grey_seer = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local data_table = {
				show_health_bar = false,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_tentacle = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local tentacle_spline_extension = ScriptUnit.extension(unit, "ai_supplementary_system")
			local portal_unit = tentacle_spline_extension.portal_unit
			local data_table = {
				reach_distance = 0,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_tentacle,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				bt_action_name = NetworkLookup.bt_action_names["n/a"],
				portal_unit_id = Managers.state.network:unit_game_object_id(portal_unit),
				tentacle_template_id = NetworkLookup.tentacle_templates[tentacle_spline_extension.tentacle_template_name]
			}

			return data_table
		end,
		ai_unit_vortex = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local vortex_extension = ScriptUnit.extension(unit, "ai_supplementary_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inner_decal_unit = vortex_extension._inner_decal_unit
			local inner_decal_unit_id = NetworkConstants.invalid_game_object_id

			if Unit.alive(inner_decal_unit) then
				inner_decal_unit_id = Managers.state.network:unit_game_object_id(inner_decal_unit)
			end

			local outer_decal_unit = vortex_extension._outer_decal_unit
			local outer_decal_unit_id = NetworkConstants.invalid_game_object_id

			if Unit.alive(outer_decal_unit) then
				outer_decal_unit_id = Managers.state.network:unit_game_object_id(outer_decal_unit)
			end

			local data_table = {
				has_teleported = 1,
				height_percentage = 0,
				fx_radius_percentage = 0,
				inner_radius_percentage = 0,
				go_type = NetworkLookup.go_types.ai_unit_vortex,
				husk_unit = NetworkLookup.husks[unit_name],
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				bt_action_name = NetworkLookup.bt_action_names["n/a"],
				vortex_template_id = NetworkLookup.vortex_templates[vortex_extension.vortex_template_name],
				inner_decal_unit_id = inner_decal_unit_id,
				outer_decal_unit_id = outer_decal_unit_id
			}

			return data_table
		end,
		ai_unit_plague_wave_spawner = function (unit, unit_name, unit_template, gameobject_functor_context)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local data_table = {
				go_type = NetworkLookup.go_types.ai_unit_plague_wave_spawner,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				breed_name = NetworkLookup.breeds[breed.name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_tentacle_portal = function (unit, unit_name, unit_template, gameobject_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.ai_unit_tentacle_portal,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				health = ScriptUnit.extension(unit, "health_system"):get_max_health()
			}

			return data_table
		end,
		ai_unit_with_inventory = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_with_inventory,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_with_inventory_and_shield = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local is_blocking = ai_shield_extension.is_blocking
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_with_inventory_and_shield,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"],
				is_blocking = is_blocking
			}

			return data_table
		end,
		ai_unit_with_inventory_and_shield_and_target = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local is_blocking = ai_shield_extension.is_blocking
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_with_inventory_and_shield_and_target,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"],
				is_blocking = is_blocking
			}

			return data_table
		end,
		ai_unit_storm_vermin_warlord = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local is_blocking = ai_shield_extension.is_blocking
			local is_dodging = ai_shield_extension.is_dodging
			local data_table = {
				show_health_bar = false,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_storm_vermin_warlord,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"],
				is_blocking = is_blocking,
				is_dodging = is_dodging
			}

			return data_table
		end,
		ai_unit_with_inventory_and_target = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_with_inventory_and_target,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_lord_with_inventory_and_target = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				show_health_bar = false,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_lord_with_inventory_and_target,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_pack_master = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_pack_master,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_ratling_gunner = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_ratling_gunner,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				aim_target = Vector3.zero(),
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_warpfire_thrower = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_warpfire_thrower,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3(0, 0, 0),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				aim_target = Vector3.zero(),
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_stormfiend = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				attack_arm = 1,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_stormfiend,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3.zero(),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				aim_target = Vector3.zero(),
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		ai_unit_stormfiend_boss = function (unit, unit_name, unit_template, gameobject_functor_context)
			local mover = Unit.mover(unit)
			local breed = Unit.get_data(unit, "breed")
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local size_variation, size_variation_normalized = ai_extension:size_variation()
			local inventory_configuration_name = ScriptUnit.extension(unit, "ai_inventory_system").inventory_configuration_name
			local data_table = {
				show_health_bar = false,
				attack_arm = 1,
				has_teleported = 1,
				go_type = NetworkLookup.go_types.ai_unit_stormfiend,
				husk_unit = NetworkLookup.husks[unit_name],
				health = ScriptUnit.extension(unit, "health_system"):get_max_health(),
				position = (mover and Mover.position(mover)) or Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				velocity = Vector3.zero(),
				breed_name = NetworkLookup.breeds[breed.name],
				uniform_scale = size_variation,
				inventory_configuration = NetworkLookup.ai_inventory[inventory_configuration_name],
				aim_target = Vector3.zero(),
				bt_action_name = NetworkLookup.bt_action_names["n/a"]
			}

			return data_table
		end,
		flame_wave_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local item_name = projectile_extension.item_name
			local item_template_name = projectile_extension.action_lookup_data.item_template_name
			local action_name = projectile_extension.action_lookup_data.action_name
			local sub_action_name = projectile_extension.action_lookup_data.sub_action_name
			local scale = projectile_extension.scale * 100
			local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
			local owner_unit = impact_extension.owner_unit
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local position, flat_angle, lateral_speed, initial_forward_speed, distance_travelled = locomotion_extension:get_game_object_data()
			local data_table = {
				go_type = NetworkLookup.go_types.flame_wave_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				owner_unit = (Unit.alive(owner_unit) and Managers.state.network:unit_game_object_id(owner_unit)) or 0,
				item_name = NetworkLookup.item_names[item_name],
				item_template_name = NetworkLookup.item_template_names[item_template_name],
				action_name = NetworkLookup.actions[action_name],
				sub_action_name = NetworkLookup.sub_actions[sub_action_name],
				scale = scale,
				position = position,
				flat_angle = flat_angle % (math.pi * 2),
				lateral_speed = lateral_speed,
				distance_travelled = distance_travelled,
				initial_forward_speed = initial_forward_speed
			}

			return data_table
		end,
		player_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local angle = locomotion_extension.angle
			local target_vector = locomotion_extension.target_vector
			local initial_position = locomotion_extension.initial_position_boxed:unbox()
			local speed = locomotion_extension.speed
			local gravity_settings = locomotion_extension.gravity_settings
			local trajectory_template_name = locomotion_extension.trajectory_template_name
			local rotate_around = locomotion_extension.rotate_around
			local fast_forward_time = -(locomotion_extension.t - Managers.time:time("game"))
			local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
			local owner_unit = impact_extension.owner_unit
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local item_name = projectile_extension.item_name
			local item_template_name = projectile_extension.action_lookup_data.item_template_name
			local action_name = projectile_extension.action_lookup_data.action_name
			local sub_action_name = projectile_extension.action_lookup_data.sub_action_name
			local scale = projectile_extension.scale * 100
			local power_level = projectile_extension.power_level
			local data_table = {
				go_type = NetworkLookup.go_types.player_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				angle = angle,
				initial_position = initial_position,
				target_vector = target_vector,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
				owner_unit = (Unit.alive(owner_unit) and Managers.state.network:unit_game_object_id(owner_unit)) or 0,
				item_name = NetworkLookup.item_names[item_name],
				item_template_name = NetworkLookup.item_template_names[item_template_name],
				action_name = NetworkLookup.actions[action_name],
				sub_action_name = NetworkLookup.sub_actions[sub_action_name],
				scale = scale,
				fast_forward_time = fast_forward_time,
				rotate_around = rotate_around,
				power_level = power_level
			}

			return data_table
		end,
		player_projectile_physic_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local owner_unit = locomotion_extension.owner_unit
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
			local collision_filter = impact_extension.collision_filter
			local owner_unit = impact_extension.owner_unit
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local item_name = projectile_extension.item_name
			local item_template_name = projectile_extension.action_lookup_data.item_template_name
			local action_name = projectile_extension.action_lookup_data.action_name
			local sub_action_name = projectile_extension.action_lookup_data.sub_action_name
			local time_initialized = projectile_extension.time_initialized
			local scale = projectile_extension.scale * 100
			local data_table = {
				go_type = NetworkLookup.go_types.player_projectile_physic_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				collision_filter = NetworkLookup.collision_filters[collision_filter],
				owner_unit = Managers.state.network:unit_game_object_id(owner_unit),
				item_name = NetworkLookup.item_names[item_name],
				item_template_name = NetworkLookup.item_template_names[item_template_name],
				action_name = NetworkLookup.actions[action_name],
				sub_action_name = NetworkLookup.sub_actions[sub_action_name],
				scale = scale
			}

			return data_table
		end,
		pickup_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local data_table = {
				go_type = NetworkLookup.go_types.pickup_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}

			return data_table
		end,
		pickup_training_dummy_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local data_table = {
				damage = 0,
				go_type = NetworkLookup.go_types.pickup_training_dummy_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}

			return data_table
		end,
		pickup_torch_unit_init = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local data_table = {
				go_type = NetworkLookup.go_types.pickup_torch_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}

			return data_table
		end,
		pickup_torch_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local data_table = {
				go_type = NetworkLookup.go_types.pickup_torch_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}

			return data_table
		end,
		pickup_projectile_unit_limited = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local limited_item_extension = ScriptUnit.extension(unit, "limited_item_track_system")
			local spawner_unit = limited_item_extension.spawner_unit
			local id = limited_item_extension.id
			local world = gameobject_functor_context.world
			local level = LevelHelper:current_level(world)
			local spawner_unit_index = Level.unit_index(level, spawner_unit)
			local data_table = {
				go_type = NetworkLookup.go_types.pickup_projectile_unit_limited,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				spawner_unit = spawner_unit_index,
				limited_item_id = id,
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
			}

			return data_table
		end,
		explosive_pickup_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local damage = health_extension.damage
			local death_extension = ScriptUnit.extension(unit, "death_system")
			local explode_time = 0
			local fuse_time = 0

			if health_extension.ignited then
				local data = health_extension:health_data()
				explode_time = data.explode_time
				fuse_time = data.fuse_time
			end

			item_name = death_extension.item_name or AllPickups[pickup_name].item_name
			local data_table = {
				go_type = NetworkLookup.go_types.explosive_pickup_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
				damage = damage,
				explode_time = explode_time,
				fuse_time = fuse_time,
				item_name = NetworkLookup.item_names[item_name]
			}

			return data_table
		end,
		explosive_pickup_projectile_unit_limited = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local network_position = locomotion_extension.network_position
			local network_rotation = locomotion_extension.network_rotation
			local network_velocity = locomotion_extension.network_velocity
			local network_angular_velocity = locomotion_extension.network_angular_velocity
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local limited_item_extension = ScriptUnit.extension(unit, "limited_item_track_system")
			local spawner_unit = limited_item_extension.spawner_unit
			local id = limited_item_extension.id
			local health_extension = ScriptUnit.extension(unit, "health_system")
			local damage = health_extension.damage
			local death_extension = ScriptUnit.extension(unit, "death_system")
			local explode_time = 0
			local fuse_time = 0

			if health_extension.ignited then
				local data = health_extension:health_data()
				explode_time = data.explode_time
				fuse_time = data.fuse_time
			end

			item_name = death_extension.item_name or AllPickups[pickup_name].item_name
			local world = gameobject_functor_context.world
			local level = LevelHelper:current_level(world)
			local spawner_unit_index = Level.unit_index(level, spawner_unit)
			local data_table = {
				go_type = NetworkLookup.go_types.explosive_pickup_projectile_unit_limited,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity,
				debug_pos = Unit.local_position(unit, 0),
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
				spawner_unit = spawner_unit_index,
				limited_item_id = id,
				damage = damage,
				explode_time = explode_time,
				fuse_time = fuse_time,
				item_name = NetworkLookup.item_names[item_name]
			}

			return data_table
		end,
		true_flight_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local true_flight_template_name = locomotion_extension.true_flight_template_name
			local angle = locomotion_extension.angle
			local target_vector = locomotion_extension.target_vector
			local speed = locomotion_extension.speed
			local gravity_settings = locomotion_extension.gravity_settings
			local initial_position = locomotion_extension.initial_position_boxed:unbox()
			local trajectory_template_name = locomotion_extension.trajectory_template_name
			local target_unit_id = NetworkConstants.game_object_id_max

			if locomotion_extension.target_unit then
				target_unit_id = Managers.state.network:unit_game_object_id(locomotion_extension.target_unit)
			end

			local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
			local server_side_raycast = impact_extension.server_side_raycast
			local collision_filter = impact_extension.collision_filter
			local owner_unit = impact_extension.owner_unit
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local item_name = projectile_extension.item_name
			local item_template_name = projectile_extension.action_lookup_data.item_template_name
			local action_name = projectile_extension.action_lookup_data.action_name
			local sub_action_name = projectile_extension.action_lookup_data.sub_action_name
			local time_initialized = projectile_extension.time_initialized
			local scale = projectile_extension.scale * 100
			local power_level = projectile_extension.power_level
			local data_table = {
				go_type = NetworkLookup.go_types.true_flight_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				true_flight_template_id = TrueFlightTemplates[true_flight_template_name].lookup_id,
				target_unit_id = target_unit_id,
				angle = angle,
				initial_position = initial_position,
				target_vector = target_vector,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				trajectory_template_id = NetworkLookup.projectile_templates[trajectory_template_name],
				collision_filter = NetworkLookup.collision_filters[collision_filter],
				server_side_raycast = server_side_raycast,
				owner_unit = Managers.state.network:unit_game_object_id(owner_unit),
				item_name = NetworkLookup.item_names[item_name],
				item_template_name = NetworkLookup.item_template_names[item_template_name],
				action_name = NetworkLookup.actions[action_name],
				sub_action_name = NetworkLookup.sub_actions[sub_action_name],
				scale = scale,
				power_level = power_level
			}

			return data_table
		end,
		ai_true_flight_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local true_flight_template_name = locomotion_extension.true_flight_template_name
			local angle = locomotion_extension.angle
			local target_vector = locomotion_extension.target_vector
			local speed = locomotion_extension.speed
			local gravity_settings = locomotion_extension.gravity_settings
			local initial_position = locomotion_extension.initial_position_boxed:unbox()
			local trajectory_template_name = locomotion_extension.trajectory_template_name
			local owner_unit = locomotion_extension.owner_unit
			local target_unit_id = NetworkConstants.game_object_id_max

			if locomotion_extension.target_unit then
				target_unit_id = Managers.state.network:unit_game_object_id(locomotion_extension.target_unit)
			end

			local impact_extension = ScriptUnit.has_extension(unit, "projectile_impact_system")
			local server_side_raycast = impact_extension.server_side_raycast
			local collision_filter = impact_extension.collision_filter
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local impact_template_name = projectile_extension.impact_template_name
			local damage_source = projectile_extension.damage_source
			local data_table = {
				go_type = NetworkLookup.go_types.ai_true_flight_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				true_flight_template_id = TrueFlightTemplates[true_flight_template_name].lookup_id,
				target_unit_id = target_unit_id,
				angle = angle,
				initial_position = initial_position,
				target_vector = target_vector,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				trajectory_template_id = NetworkLookup.projectile_templates[trajectory_template_name],
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				collision_filter = NetworkLookup.collision_filters[collision_filter],
				server_side_raycast = server_side_raycast,
				owner_unit = Managers.state.network:unit_game_object_id(owner_unit)
			}

			return data_table
		end,
		ai_true_flight_projectile_unit_without_raycast = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local true_flight_template_name = locomotion_extension.true_flight_template_name
			local angle = locomotion_extension.angle
			local target_vector = locomotion_extension.target_vector
			local speed = locomotion_extension.speed
			local gravity_settings = locomotion_extension.gravity_settings
			local initial_position = locomotion_extension.initial_position_boxed:unbox()
			local trajectory_template_name = locomotion_extension.trajectory_template_name
			local owner_unit = locomotion_extension.owner_unit
			local target_unit_id = NetworkConstants.game_object_id_max

			if locomotion_extension.target_unit then
				target_unit_id = Managers.state.network:unit_game_object_id(locomotion_extension.target_unit)
			end

			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local impact_template_name = projectile_extension.impact_template_name
			local damage_source = projectile_extension.damage_source
			local data_table = {
				go_type = NetworkLookup.go_types.ai_true_flight_projectile_unit_without_raycast,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				true_flight_template_id = TrueFlightTemplates[true_flight_template_name].lookup_id,
				target_unit_id = target_unit_id,
				angle = angle,
				initial_position = initial_position,
				target_vector = target_vector,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				trajectory_template_id = NetworkLookup.projectile_templates[trajectory_template_name],
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				owner_unit = Managers.state.network:unit_game_object_id(owner_unit)
			}

			return data_table
		end,
		aoe_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")
			local angle = locomotion_extension.angle
			local speed = locomotion_extension.speed
			local gravity_settings = locomotion_extension.gravity_settings
			local target_vector = locomotion_extension.target_vector
			local initial_position = locomotion_extension.initial_position_boxed:unbox()
			local trajectory_template_name = locomotion_extension.trajectory_template_name
			local impact_extension = ScriptUnit.extension(unit, "projectile_impact_system")
			local collision_filter = impact_extension.collision_filter
			local server_side_raycast = impact_extension.server_side_raycast
			local owner_unit = impact_extension.owner_unit
			local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
			local impact_template_name = projectile_extension.impact_template_name
			local damage_source = projectile_extension.damage_source
			local area_damage_system = ScriptUnit.extension(unit, "area_damage_system")
			local aoe_dot_damage = area_damage_system.aoe_dot_damage
			local aoe_init_damage = area_damage_system.aoe_init_damage
			local aoe_dot_damage_interval = area_damage_system.aoe_dot_damage_interval
			local radius = area_damage_system.radius
			local life_time = area_damage_system.life_time
			local damage_players = area_damage_system.damage_players
			local player_screen_effect_name = area_damage_system.player_screen_effect_name
			local dot_effect_name = area_damage_system.dot_effect_name
			local area_damage_template = area_damage_system.area_damage_template
			local network_manager = Managers.state.network
			local data_table = {
				go_type = NetworkLookup.go_types.aoe_projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				angle = angle,
				speed = speed,
				gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
				initial_position = initial_position,
				target_vector = target_vector,
				trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
				owner_unit = network_manager:unit_game_object_id(owner_unit),
				collision_filter = NetworkLookup.collision_filters[collision_filter],
				server_side_raycast = server_side_raycast,
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				aoe_dot_damage = aoe_dot_damage,
				aoe_init_damage = aoe_init_damage,
				aoe_dot_damage_interval = aoe_dot_damage_interval,
				radius = radius,
				life_time = life_time,
				damage_players = damage_players,
				player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name],
				dot_effect_name = NetworkLookup.effects[dot_effect_name],
				area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
				damage_source_id = NetworkLookup.damage_sources[damage_source]
			}

			return data_table
		end,
		projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local projectile_system = ScriptUnit.extension(unit, "projectile_system")
			local angle = projectile_system.angle
			local speed = projectile_system.speed
			local target_vector = projectile_system.target_vector
			local initial_position = projectile_system.initial_position
			local trajectory_template_name = projectile_system.trajectory_template_name
			local impact_template_name = projectile_system.impact_template_name
			local owner_unit = projectile_system.owner_unit
			local network_manager = Managers.state.network
			local data_table = {
				go_type = NetworkLookup.go_types.projectile_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				angle = angle,
				speed = speed,
				initial_position = initial_position,
				target_vector = target_vector,
				trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
				impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
				owner_unit = network_manager:unit_game_object_id(owner_unit)
			}

			return data_table
		end,
		damage_wave_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local damage_wave_extension = ScriptUnit.extension(unit, "area_damage_system")
			local damage_wave_template_name = damage_wave_extension.damage_wave_template_name
			local source_unit = damage_wave_extension.source_unit
			local network_manager = Managers.state.network
			local data_table = {
				height_percentage = 0,
				go_type = NetworkLookup.go_types.damage_wave_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				damage_wave_template_name = NetworkLookup.damage_wave_templates[damage_wave_template_name],
				source_unit = network_manager:unit_game_object_id(source_unit)
			}

			return data_table
		end,
		damage_blob_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local damage_blob_extension = ScriptUnit.extension(unit, "area_damage_system")
			local damage_blob_template_name = damage_blob_extension.damage_blob_template_name
			local source_unit = damage_blob_extension._source_unit
			local network_manager = Managers.state.network
			local data_table = {
				go_type = NetworkLookup.go_types.damage_blob_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				damage_blob_template_name = NetworkLookup.damage_blob_templates[damage_blob_template_name],
				source_unit = network_manager:unit_game_object_id(source_unit)
			}

			return data_table
		end,
		liquid_aoe_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local liquid_area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")
			local liquid_area_damage_template = liquid_area_damage_extension._liquid_area_damage_template
			local source_unit = liquid_area_damage_extension._source_unit
			local network_manager = Managers.state.network
			local data_table = {
				go_type = NetworkLookup.go_types.liquid_aoe_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				liquid_area_damage_template = NetworkLookup.liquid_area_damage_templates[liquid_area_damage_template],
				source_unit = network_manager:unit_game_object_id(source_unit),
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		lure_unit = function (unit, unit_name, unit_template, game_object_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.lure_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		aoe_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local area_damage_extension = ScriptUnit.extension(unit, "area_damage_system")
			local aoe_dot_damage = area_damage_extension.aoe_dot_damage
			local aoe_init_damage = area_damage_extension.aoe_init_damage
			local aoe_dot_damage_interval = area_damage_extension.aoe_dot_damage_interval
			local radius = area_damage_extension.radius
			local life_time = area_damage_extension.life_time
			local player_screen_effect_name = area_damage_extension.player_screen_effect_name
			local dot_effect_name = area_damage_extension.dot_effect_name
			local area_damage_template = area_damage_extension.area_damage_template
			local invisible_unit = area_damage_extension.invisible_unit
			local extra_dot_effect_name = area_damage_extension.extra_dot_effect_name
			local explosion_template_name = area_damage_extension.explosion_template_name
			local owner_player = area_damage_extension.owner_player

			if dot_effect_name == nil then
				dot_effect_name = "n/a"
			end

			if extra_dot_effect_name == nil then
				extra_dot_effect_name = "n/a"
			end

			if explosion_template_name == nil then
				explosion_template_name = "n/a"
			end

			if player_screen_effect_name == nil then
				player_screen_effect_name = "n/a"
			end

			local owner_player_id = NetworkConstants.invalid_game_object_id

			if owner_player then
				owner_player_id = owner_player.game_object_id
			end

			local data_table = {
				go_type = NetworkLookup.go_types.aoe_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				aoe_dot_damage = aoe_dot_damage,
				aoe_init_damage = aoe_init_damage,
				aoe_dot_damage_interval = aoe_dot_damage_interval,
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0),
				radius = radius,
				life_time = life_time,
				player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name],
				dot_effect_name = NetworkLookup.effects[dot_effect_name],
				extra_dot_effect_name = NetworkLookup.effects[extra_dot_effect_name],
				invisible_unit = invisible_unit,
				area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
				explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name],
				owner_player_id = owner_player_id
			}

			return data_table
		end,
		pickup_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local pickup_extension = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_extension.pickup_name
			local has_physics = pickup_extension.has_physics
			local spawn_type = pickup_extension.spawn_type
			local data_table = {
				go_type = NetworkLookup.go_types.pickup_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		objective_pickup_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local pickup_system = ScriptUnit.extension(unit, "pickup_system")
			local pickup_name = pickup_system.pickup_name
			local has_physics = pickup_system.has_physics
			local spawn_type = pickup_system.spawn_type
			local data_table = {
				go_type = NetworkLookup.go_types.objective_pickup_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				pickup_name = NetworkLookup.pickup_names[pickup_name],
				has_physics = has_physics,
				spawn_type = NetworkLookup.pickup_spawn_types[spawn_type],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		prop_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.prop_unit,
				husk_unit = NetworkLookup.husks[unit_name]
			}

			return data_table
		end,
		overpowering_blob_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local health_extension = ScriptUnit.has_extension(unit, "health_system")
			local data_table = {
				go_type = NetworkLookup.go_types.overpowering_blob_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				health = health_extension:get_max_health()
			}

			return data_table
		end,
		network_synched_dummy_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local scale = Unit.local_scale(unit, 0)
			local data_table = {
				go_type = NetworkLookup.go_types.network_synched_dummy_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				yaw_rot = Quaternion.yaw(Unit.local_rotation(unit, 0)),
				uniform_scale = scale.x
			}

			return data_table
		end,
		thrown_weapon_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.thrown_weapon_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		interest_point_level_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.interest_point_level_unit
			}

			return data_table
		end,
		interest_point_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local data_table = {
				go_type = NetworkLookup.go_types.interest_point_unit,
				husk_unit = NetworkLookup.husks[unit_name],
				position = Unit.local_position(unit, 0),
				rotation = Unit.local_rotation(unit, 0)
			}

			return data_table
		end,
		sync_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
			local game_object_extension = ScriptUnit.extension(unit, "game_object_system")
			local data_table = {
				go_type = NetworkLookup.go_types.sync_unit,
				sync_name = NetworkLookup.sync_names[game_object_extension.sync_name]
			}

			return data_table
		end
	},
	extractors = {
		player_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local player_wounds = GameSession.game_object_field(game_session, go_id, "wounds")
			local profile_id = GameSession.game_object_field(game_session, go_id, "profile_id")
			local career_id = GameSession.game_object_field(game_session, go_id, "career_id")
			local skin_id = GameSession.game_object_field(game_session, go_id, "skin_name")
			local frame_id = GameSession.game_object_field(game_session, go_id, "frame_name")
			local initial_ability_percentage = GameSession.game_object_field(game_session, go_id, "ability_percentage")
			local has_moved_from_start_position = GameSession.game_object_field(game_session, go_id, "has_moved_from_start_position")
			local profile = SPProfiles[profile_id]

			assert(profile, "No such profile with index %s", tostring(profile_id))

			local career = profile.careers[career_id]
			local sound_character = career.sound_character

			Unit.set_data(unit, "sound_character", sound_character)

			local career_voice_parameter = profile.career_voice_parameter

			if career_voice_parameter then
				local career_voice_parameter_value = profile.career_voice_parameter_values[career_id]

				if career_voice_parameter_value and GameSettingsDevelopment.use_career_voice_pitch then
					local world = gameobject_functor_context.world
					local wwise_world = Wwise.wwise_world(world)

					WwiseWorld.set_global_parameter(wwise_world, career_voice_parameter, career_voice_parameter_value)
				end
			end

			local player_id = GameSession.game_object_field(game_session, go_id, "local_player_id")
			local peer_id = GameSession.game_object_field(game_session, go_id, "owner_peer_id")
			local player = Managers.player:player(peer_id, player_id)
			local skin_name = NetworkLookup.cosmetics[skin_id]
			local frame_name = NetworkLookup.cosmetics[frame_id]
			local extension_init_data = {
				locomotion_system = {
					id = go_id,
					game = game_session,
					player = player,
					has_moved_from_start_position = has_moved_from_start_position
				},
				health_system = {
					player = player,
					game_object_id = go_id,
					profile_index = profile_id,
					career_index = career_id
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = "player"
				},
				death_system = {
					death_reaction_template = "player",
					is_husk = true
				},
				aim_system = {
					template = "player",
					is_husk = true,
					go_id = go_id
				},
				status_system = {
					wounds = player_wounds,
					profile_id = profile_id,
					player = player
				},
				inventory_system = {},
				attachment_system = {
					profile = profile
				},
				cosmetic_system = {
					profile = profile,
					skin_name = skin_name,
					frame_name = frame_name
				},
				dialogue_context_system = {
					profile = profile
				},
				dialogue_system = {
					faction = "player",
					wwise_voice_switch_group = "character",
					profile = profile,
					wwise_voice_switch_value = profile.character_vo
				},
				buff_system = {
					is_husk = true
				},
				statistics_system = {
					template = "player",
					statistics_id = player:stats_id()
				},
				ai_slot_system = {
					profile_index = profile_id
				},
				talent_system = {
					player = player,
					profile_index = profile_id
				},
				career_system = {
					player = player,
					profile_index = profile_id,
					career_index = career_id,
					initial_ability_percentage = initial_ability_percentage
				}
			}

			Unit.set_animation_merge_options(unit)
			Unit.flow_event(unit, "lua_spawn_attachments")

			local level_settings = LevelHelper:current_level_settings()
			local climate_type = level_settings.climate_type or "default"

			Unit.set_flow_variable(unit, "climate_type", climate_type)
			Unit.flow_event(unit, "climate_type_set")

			local unit_template_name = profile.unit_template_name or "player_unit_3rd"

			return unit_template_name, extension_init_data
		end,
		player_bot_unit = function (game_session, go_id, owner, unit, gameobject_functor_context)
			local player_wounds = GameSession.game_object_field(game_session, go_id, "wounds")
			local profile_id = GameSession.game_object_field(game_session, go_id, "profile_id")
			local career_id = GameSession.game_object_field(game_session, go_id, "career_id")
			local skin_id = GameSession.game_object_field(game_session, go_id, "skin_name")
			local frame_id = GameSession.game_object_field(game_session, go_id, "frame_name")
			local initial_ability_percentage = GameSession.game_object_field(game_session, go_id, "ability_percentage")
			local has_moved_from_start_position = GameSession.game_object_field(game_session, go_id, "has_moved_from_start_position")
			local profile = SPProfiles[profile_id]

			assert(profile, "No such profile with index %s", tostring(profile_id))

			local career = profile.careers[career_id]

			Unit.set_data(unit, "sound_character", career.sound_character)

			local career_voice_parameter = profile.career_voice_parameter

			if career_voice_parameter then
				local career_voice_parameter_value = profile.career_voice_parameter_values[career_id]

				if career_voice_parameter_value and GameSettingsDevelopment.use_career_voice_pitch then
					local world = gameobject_functor_context.world
					local wwise_world = Wwise.wwise_world(world)

					WwiseWorld.set_global_parameter(wwise_world, career_voice_parameter, career_voice_parameter_value)
				end
			end

			local player_id = GameSession.game_object_field(game_session, go_id, "local_player_id")
			local peer_id = GameSession.game_object_field(game_session, go_id, "owner_peer_id")
			local player = Managers.player:player(peer_id, player_id)
			local skin_name = NetworkLookup.cosmetics[skin_id]
			local frame_name = NetworkLookup.cosmetics[frame_id]
			local extension_init_data = {
				locomotion_system = {
					id = go_id,
					game = game_session,
					player = player,
					has_moved_from_start_position = has_moved_from_start_position
				},
				health_system = {
					player = player,
					game_object_id = go_id,
					profile_index = profile_id,
					career_index = career_id
				},
				death_system = {
					death_reaction_template = "player",
					is_husk = true
				},
				inventory_system = {},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = "player"
				},
				dialogue_context_system = {
					profile = profile
				},
				aim_system = {
					template = "player",
					is_husk = true,
					go_id = go_id
				},
				status_system = {
					wounds = player_wounds,
					profile_id = profile_id,
					player = player
				},
				dialogue_system = {
					faction = "player",
					wwise_voice_switch_group = "character",
					profile = profile,
					wwise_voice_switch_value = profile.character_vo
				},
				attachment_system = {
					profile = profile
				},
				cosmetic_system = {
					profile = profile,
					skin_name = skin_name,
					frame_name = frame_name
				},
				buff_system = {
					is_husk = true
				},
				statistics_system = {
					template = "player",
					statistics_id = player:stats_id()
				},
				ai_slot_system = {
					profile_index = profile_id
				},
				talent_system = {
					player = player,
					profile_index = profile_id
				},
				career_system = {
					player = player,
					profile_index = profile_id,
					career_index = career_id,
					initial_ability_percentage = initial_ability_percentage
				}
			}

			Unit.flow_event(unit, "lua_spawn_attachments")

			local level_settings = LevelHelper:current_level_settings()

			if level_settings.climate_type then
				Unit.set_flow_variable(unit, "climate_type", level_settings.climate_type)
				Unit.flow_event(unit, "climate_type_set")
			end

			local unit_template_name = "player_bot_unit"

			return unit_template_name, extension_init_data
		end,
		ai_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_grey_seer = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_tentacle = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local portal_unit_id = GameSession.game_object_field(game_session, game_object_id, "portal_unit_id")
			local portal_unit = Managers.state.unit_storage:unit(portal_unit_id)
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local tentacle_template_name = GameSession.game_object_field(game_session, game_object_id, "tentacle_template_id")
			local extension_init_data = {
				ai_supplementary_system = {
					portal_unit = portal_unit,
					tentacle_template_name = tentacle_template_name
				},
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				health_system = {
					health = health
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_vortex = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local vortex_template_id = GameSession.game_object_field(game_session, game_object_id, "vortex_template_id")
			local vortex_template_name = NetworkLookup.vortex_templates[vortex_template_id]
			local inner_decal_unit_id = GameSession.game_object_field(game_session, game_object_id, "inner_decal_unit_id")
			local inner_decal_unit = Managers.state.unit_storage:unit(inner_decal_unit_id)
			local outer_decal_unit_id = GameSession.game_object_field(game_session, game_object_id, "outer_decal_unit_id")
			local outer_decal_unit = Managers.state.unit_storage:unit(outer_decal_unit_id)
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				ai_supplementary_system = {
					vortex_template_name = vortex_template_name,
					inner_decal_unit = inner_decal_unit,
					outer_decal_unit = outer_decal_unit
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_plague_wave_spawner = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_tentacle_portal = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "ai_unit_tentacle_portal"
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				health_system = {
					health = health
				},
				death_system = {
					death_reaction_template = "chaos_tentacle_portal",
					is_husk = true
				}
			}

			return unit_template_name, extension_init_data
		end,
		ai_unit_with_inventory = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_with_inventory_and_shield = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local is_blocking = GameSession.game_object_field(game_session, game_object_id, "is_blocking")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				ai_shield_system = {
					is_blocking = is_blocking
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_with_inventory_and_shield_and_target = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local is_blocking = GameSession.game_object_field(game_session, game_object_id, "is_blocking")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				ai_shield_system = {
					is_blocking = is_blocking
				},
				aim_system = {
					is_husk = true,
					template = breed.aim_template
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_storm_vermin_warlord = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local is_blocking = GameSession.game_object_field(game_session, game_object_id, "is_blocking")
			local is_dodging = GameSession.game_object_field(game_session, game_object_id, "is_dodging")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				ai_shield_system = {
					is_blocking = is_blocking
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_with_inventory_and_target = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					is_husk = true,
					template = breed.aim_template
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_lord_with_inventory_and_target = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local breed_name_id = GameSession.game_object_field(game_session, go_id, "breed_name")
			local breed_name = NetworkLookup.breeds[breed_name_id]
			local breed = Breeds[breed_name]

			Unit.set_data(unit, "breed", breed)

			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, go_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, go_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = go_id,
					game = game_session
				},
				locomotion_system = {
					go_id = go_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					is_husk = true,
					template = breed.aim_template
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_pack_master = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_ratling_gunner = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					template = "ratling_gunner",
					is_husk = true
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_warpfire_thrower = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					template = "ratling_gunner",
					is_husk = true
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_stormfiend = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					is_husk = true,
					template = breed.aim_template
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		ai_unit_stormfiend_boss = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local breed, breed_name = enemy_unit_common_extractor(unit, game_session, game_object_id)
			local inventory_configuration_name = NetworkLookup.ai_inventory[GameSession.game_object_field(game_session, game_object_id, "inventory_configuration")]
			local health = GameSession.game_object_field(game_session, game_object_id, "health")
			local extension_init_data = {
				ai_system = {
					go_id = game_object_id,
					game = game_session
				},
				locomotion_system = {
					go_id = game_object_id,
					breed = breed,
					game = game_session
				},
				health_system = {
					health = health
				},
				death_system = {
					is_husk = true,
					death_reaction_template = breed.death_reaction,
					disable_second_hit_ragdoll = breed.disable_second_hit_ragdoll
				},
				hit_reaction_system = {
					is_husk = true,
					hit_reaction_template = breed.hit_reaction,
					hit_effect_template = breed.hit_effect_template
				},
				ai_inventory_system = {
					inventory_configuration_name = inventory_configuration_name
				},
				dialogue_system = {
					faction = "enemy",
					breed_name = breed_name
				},
				aim_system = {
					is_husk = true,
					template = breed.aim_template
				}
			}
			local unit_template_name = breed.unit_template

			return unit_template_name, extension_init_data
		end,
		flame_wave_projectile_unit = function (game_session, game_object_id, owner_id, unit, gameobject_functor_context)
			local owner_unit_id = GameSession.game_object_field(game_session, game_object_id, "owner_unit")
			local owner_unit = (owner_unit_id ~= 0 and Managers.state.unit_storage:unit(owner_unit_id)) or nil
			local item_name_id = GameSession.game_object_field(game_session, game_object_id, "item_name")
			local item_template_name_id = GameSession.game_object_field(game_session, game_object_id, "item_template_name")
			local action_name_id = GameSession.game_object_field(game_session, game_object_id, "action_name")
			local sub_action_name_id = GameSession.game_object_field(game_session, game_object_id, "sub_action_name")
			local item_name = NetworkLookup.item_names[item_name_id]
			local item_template_name = NetworkLookup.item_template_names[item_template_name_id]
			local action_name = NetworkLookup.actions[action_name_id]
			local sub_action_name = NetworkLookup.sub_actions[sub_action_name_id]
			local scale = GameSession.game_object_field(game_session, game_object_id, "scale") / 100
			local position = GameSession.game_object_field(game_session, game_object_id, "position")
			local flat_angle = GameSession.game_object_field(game_session, game_object_id, "flat_angle")
			local lateral_speed = GameSession.game_object_field(game_session, game_object_id, "lateral_speed")
			local initial_forward_speed = GameSession.game_object_field(game_session, game_object_id, "initial_forward_speed")
			local distance_travelled = GameSession.game_object_field(game_session, game_object_id, "distance_travelled")
			local time_initialized = Managers.time:time("game")
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					owner_unit = owner_unit,
					scale = scale,
					item_name = item_name,
					item_template_name = item_template_name,
					action_name = action_name,
					sub_action_name = sub_action_name,
					position = position,
					flat_angle = flat_angle,
					lateral_speed = lateral_speed,
					initial_forward_speed = initial_forward_speed,
					distance_travelled = distance_travelled
				},
				projectile_impact_system = {
					item_name = item_name,
					item_template_name = item_template_name,
					action_name = action_name,
					sub_action_name = sub_action_name,
					owner_unit = owner_unit
				},
				projectile_system = {
					item_name = item_name,
					item_template_name = item_template_name,
					action_name = action_name,
					sub_action_name = sub_action_name,
					owner_unit = owner_unit,
					time_initialized = time_initialized,
					scale = scale
				}
			}
			local action = Weapons[item_template_name].actions[action_name][sub_action_name]
			local projectile_info = action.projectile_info
			local unit_template_name = projectile_info.projectile_unit_template_name or "player_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		player_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
			local trajectory_template_name = GameSession.game_object_field(game_session, go_id, "trajectory_template_name")
			local owner_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local item_name_id = GameSession.game_object_field(game_session, go_id, "item_name")
			local item_template_name_id = GameSession.game_object_field(game_session, go_id, "item_template_name")
			local action_name_id = GameSession.game_object_field(game_session, go_id, "action_name")
			local sub_action_name_id = GameSession.game_object_field(game_session, go_id, "sub_action_name")
			local time_initialized = Managers.time:time("game")
			local fast_forward_time = GameSession.game_object_field(game_session, go_id, "fast_forward_time")
			local rotate_around = GameSession.game_object_field(game_session, go_id, "rotate_around")
			local scale = GameSession.game_object_field(game_session, go_id, "scale") / 100
			local item_name = NetworkLookup.item_names[item_name_id]
			local item_template_name = NetworkLookup.item_template_names[item_template_name_id]
			local action_name = NetworkLookup.actions[action_name_id]
			local sub_action_name = NetworkLookup.sub_actions[sub_action_name_id]
			local power_level = GameSession.game_object_field(game_session, go_id, "power_level")
			local owner_unit = (owner_unit_id ~= 0 and Managers.state.unit_storage:unit(owner_unit_id)) or nil
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = initial_position,
					gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
					fast_forward_time = fast_forward_time,
					rotate_around = rotate_around
				},
				projectile_impact_system = {
					item_name = item_name,
					owner_unit = owner_unit
				},
				projectile_system = {
					item_name = item_name,
					item_template_name = item_template_name,
					action_name = action_name,
					sub_action_name = sub_action_name,
					owner_unit = owner_unit,
					time_initialized = time_initialized,
					scale = scale,
					power_level = power_level
				}
			}
			local action = Weapons[item_template_name].actions[action_name][sub_action_name]
			local projectile_info = action.projectile_info
			local unit_template_name = projectile_info.projectile_unit_template_name or "player_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				}
			}
			local unit_template_name = "pickup_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_training_dummy_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				},
				health_system = {
					damage = 0,
					health = 100
				},
				death_system = {},
				hit_reaction_system = {}
			}
			local unit_template_name = "pickup_training_dummy_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_torch_unit_init = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				}
			}
			local unit_template_name = "pickup_torch_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_torch_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				}
			}
			local unit_template_name = "pickup_torch_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_projectile_unit_limited = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local spawner_unit_index = GameSession.game_object_field(game_session, go_id, "spawner_unit")
			local limited_item_id = GameSession.game_object_field(game_session, go_id, "limited_item_id")
			local world = gameobject_functor_context.world
			local level = LevelHelper:current_level(world)
			local spawner_unit = Level.unit_by_index(level, spawner_unit_index)
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				},
				limited_item_track_system = {
					spawner_unit = spawner_unit,
					id = limited_item_id
				}
			}
			local unit_template_name = "pickup_projectile_unit_limited"

			return unit_template_name, extension_init_data
		end,
		explosive_pickup_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local damage = GameSession.game_object_field(game_session, go_id, "damage")
			local explode_time = GameSession.game_object_field(game_session, go_id, "explode_time")
			local fuse_time = GameSession.game_object_field(game_session, go_id, "fuse_time")
			local item_name_id = GameSession.game_object_field(game_session, go_id, "item_name")
			local explosion_data = nil

			if explode_time ~= 0 then
				explosion_data = {
					explode_time = explode_time,
					fuse_time = fuse_time
				}
			end

			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				},
				health_system = {
					in_hand = false,
					item_name = NetworkLookup.item_names[item_name_id],
					damage = damage,
					health_data = explosion_data
				},
				death_system = {
					in_hand = false,
					item_name = NetworkLookup.item_names[item_name_id]
				}
			}
			local unit_template_name = "explosive_pickup_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		explosive_pickup_projectile_unit_limited = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local network_position = GameSession.game_object_field(game_session, go_id, "network_position")
			local network_rotation = GameSession.game_object_field(game_session, go_id, "network_rotation")
			local network_velocity = GameSession.game_object_field(game_session, go_id, "network_velocity")
			local network_angular_velocity = GameSession.game_object_field(game_session, go_id, "network_angular_velocity")
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local spawner_unit_index = GameSession.game_object_field(game_session, go_id, "spawner_unit")
			local limited_item_id = GameSession.game_object_field(game_session, go_id, "limited_item_id")
			local damage = GameSession.game_object_field(game_session, go_id, "damage")
			local explode_time = GameSession.game_object_field(game_session, go_id, "explode_time")
			local fuse_time = GameSession.game_object_field(game_session, go_id, "fuse_time")
			local item_name_id = GameSession.game_object_field(game_session, go_id, "item_name")
			local explosion_data = nil

			if explode_time ~= 0 then
				explosion_data = {
					explode_time = explode_time,
					fuse_time = fuse_time
				}
			end

			local world = gameobject_functor_context.world
			local level = LevelHelper:current_level(world)
			local spawner_unit = Level.unit_by_index(level, spawner_unit_index)
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				},
				health_system = {
					in_hand = false,
					item_name = NetworkLookup.item_names[item_name_id],
					health_data = explosion_data,
					damage = damage
				},
				death_system = {
					in_hand = false,
					item_name = NetworkLookup.item_names[item_name_id]
				},
				limited_item_track_system = {
					spawner_unit = spawner_unit,
					id = limited_item_id
				}
			}
			local unit_template_name = "explosive_pickup_projectile_unit_limited"

			return unit_template_name, extension_init_data
		end,
		true_flight_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
			local trajectory_template_id = GameSession.game_object_field(game_session, go_id, "trajectory_template_id")
			local true_flight_template_id = GameSession.game_object_field(game_session, go_id, "true_flight_template_id")
			local target_unit_id = GameSession.game_object_field(game_session, go_id, "target_unit_id")
			local collision_filter_id = GameSession.game_object_field(game_session, go_id, "collision_filter")
			local server_side_raycast = GameSession.game_object_field(game_session, go_id, "server_side_raycast")
			local owner_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local item_template_name_id = GameSession.game_object_field(game_session, go_id, "item_template_name")
			local item_name_id = GameSession.game_object_field(game_session, go_id, "item_name")
			local action_name_id = GameSession.game_object_field(game_session, go_id, "action_name")
			local sub_action_name_id = GameSession.game_object_field(game_session, go_id, "sub_action_name")
			local time_initialized = Managers.time:time("game")
			local scale = GameSession.game_object_field(game_session, go_id, "scale")
			scale = scale / 100
			local item_template_name = NetworkLookup.item_template_names[item_template_name_id]
			local item_name = NetworkLookup.item_names[item_name_id]
			local action_name = NetworkLookup.actions[action_name_id]
			local sub_action_name = NetworkLookup.sub_actions[sub_action_name_id]
			local power_level = GameSession.game_object_field(game_session, go_id, "power_level")
			local target_unit = nil

			if target_unit_id ~= NetworkConstants.game_object_id_max then
				target_unit = Managers.state.unit_storage:unit(target_unit_id)
			end

			local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					true_flight_template_name = TrueFlightTemplatesLookup[true_flight_template_id],
					target_unit = target_unit,
					owner_unit = owner_unit,
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = initial_position,
					gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_id]
				},
				projectile_impact_system = {
					item_name = item_name,
					collision_filter = NetworkLookup.collision_filters[collision_filter_id],
					server_side_raycast = server_side_raycast,
					owner_unit = owner_unit
				},
				projectile_system = {
					item_name = item_name,
					item_template_name = item_template_name,
					action_name = action_name,
					sub_action_name = sub_action_name,
					owner_unit = owner_unit,
					time_initialized = time_initialized,
					scale = scale,
					power_level = power_level
				}
			}
			local unit_template_name = "true_flight_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		ai_true_flight_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local owner_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
			local trajectory_template_id = GameSession.game_object_field(game_session, go_id, "trajectory_template_id")
			local true_flight_template_id = GameSession.game_object_field(game_session, go_id, "true_flight_template_id")
			local target_unit_id = GameSession.game_object_field(game_session, go_id, "target_unit_id")
			local collision_filter_id = GameSession.game_object_field(game_session, go_id, "collision_filter")
			local server_side_raycast = GameSession.game_object_field(game_session, go_id, "server_side_raycast")
			local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
			local target_unit = nil

			if target_unit_id ~= NetworkConstants.game_object_id_max then
				target_unit = Managers.state.unit_storage:unit(target_unit_id)
			end

			local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)
			local true_flight_template_name = TrueFlightTemplatesLookup[true_flight_template_id]
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					true_flight_template_name = true_flight_template_name,
					target_unit = target_unit,
					owner_unit = owner_unit,
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = initial_position,
					gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_id]
				},
				projectile_impact_system = {
					collision_filter = NetworkLookup.collision_filters[collision_filter_id],
					server_side_raycast = server_side_raycast,
					owner_unit = owner_unit
				},
				projectile_system = {
					impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
					owner_unit = owner_unit
				}
			}
			local unit_template_name = "ai_true_flight_projectile_unit"

			return unit_template_name, extension_init_data, true_flight_template_name
		end,
		ai_true_flight_projectile_unit_without_raycast = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local owner_unit_id = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
			local trajectory_template_id = GameSession.game_object_field(game_session, go_id, "trajectory_template_id")
			local true_flight_template_id = GameSession.game_object_field(game_session, go_id, "true_flight_template_id")
			local target_unit_id = GameSession.game_object_field(game_session, go_id, "target_unit_id")
			local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
			local target_unit = nil

			if target_unit_id ~= NetworkConstants.game_object_id_max then
				target_unit = Managers.state.unit_storage:unit(target_unit_id)
			end

			local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					true_flight_template_name = TrueFlightTemplatesLookup[true_flight_template_id],
					target_unit = target_unit,
					owner_unit = owner_unit,
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = initial_position,
					gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_id]
				},
				projectile_system = {
					impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
					owner_unit = owner_unit
				}
			}
			local unit_template_name = "ai_true_flight_projectile_unit_without_raycast"

			return unit_template_name, extension_init_data
		end,
		aoe_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local gravity_settings = GameSession.game_object_field(game_session, go_id, "gravity_settings")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local trajectory_template_name = GameSession.game_object_field(game_session, go_id, "trajectory_template_name")
			local owner_unit = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local server_side_raycast = GameSession.game_object_field(game_session, go_id, "server_side_raycast")
			local collision_filter_id = GameSession.game_object_field(game_session, go_id, "collision_filter")
			local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
			local aoe_init_damage = GameSession.game_object_field(game_session, go_id, "aoe_init_damage")
			local aoe_dot_damage = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage")
			local aoe_dot_damage_interval = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage_interval")
			local radius = GameSession.game_object_field(game_session, go_id, "radius")
			local life_time = GameSession.game_object_field(game_session, go_id, "life_time")
			local damage_players = GameSession.game_object_field(game_session, go_id, "damage_players")
			local player_screen_effect_name = GameSession.game_object_field(game_session, go_id, "player_screen_effect_name")
			local dot_effect_name = GameSession.game_object_field(game_session, go_id, "dot_effect_name")
			local area_damage_template = GameSession.game_object_field(game_session, go_id, "area_damage_template")
			local damage_source_id = GameSession.game_object_field(game_session, go_id, "damage_source_id")
			local owner_unit = Managers.state.unit_storage:unit(owner_unit)
			local extension_init_data = {
				projectile_locomotion_system = {
					is_husk = true,
					angle = angle,
					speed = speed,
					gravity_settings = NetworkLookup.projectile_gravity_settings[gravity_settings],
					target_vector = target_vector,
					initial_position = initial_position,
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name]
				},
				projectile_impact_system = {
					collision_filter = NetworkLookup.collision_filters[collision_filter_id],
					server_side_raycast = server_side_raycast,
					owner_unit = owner_unit
				},
				projectile_system = {
					impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
					owner_unit = owner_unit,
					damage_source = NetworkLookup.damage_sources[damage_source_id]
				},
				area_damage_system = {
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					life_time = life_time,
					damage_players = damage_players,
					player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name],
					dot_effect_name = NetworkLookup.effects[dot_effect_name],
					area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
					damage_source = NetworkLookup.damage_sources[damage_source_id]
				}
			}
			local unit_template_name = "aoe_projectile_unit"

			return unit_template_name, extension_init_data
		end,
		projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local angle = GameSession.game_object_field(game_session, go_id, "angle")
			local speed = GameSession.game_object_field(game_session, go_id, "speed")
			local target_vector = GameSession.game_object_field(game_session, go_id, "target_vector")
			local initial_position = GameSession.game_object_field(game_session, go_id, "initial_position")
			local trajectory_template_name = GameSession.game_object_field(game_session, go_id, "trajectory_template_name")
			local impact_template_name = GameSession.game_object_field(game_session, go_id, "impact_template_name")
			local owner_unit = GameSession.game_object_field(game_session, go_id, "owner_unit")
			local extension_init_data = {
				projectile_system = {
					is_husk = true,
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = initial_position,
					trajectory_template_name = NetworkLookup.projectile_templates[trajectory_template_name],
					impact_template_name = NetworkLookup.projectile_templates[impact_template_name],
					owner_unit = Managers.state.unit_storage:unit(owner_unit)
				}
			}
			local unit_template_name = "projectile_unit"

			return unit_template_name, extension_init_data
		end,
		damage_wave_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local damage_wave_template_id = GameSession.game_object_field(game_session, go_id, "damage_wave_template_name")
			local source_unit = GameSession.game_object_field(game_session, go_id, "source_unit")
			local extension_init_data = {
				area_damage_system = {
					damage_wave_template_name = NetworkLookup.damage_wave_templates[damage_wave_template_id],
					source_unit = Managers.state.unit_storage:unit(source_unit)
				}
			}
			local unit_template_name = "damage_wave_unit"

			return unit_template_name, extension_init_data
		end,
		damage_blob_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local damage_blob_template_id = GameSession.game_object_field(game_session, go_id, "damage_blob_template_name")
			local source_unit = GameSession.game_object_field(game_session, go_id, "source_unit")
			local extension_init_data = {
				area_damage_system = {
					damage_blob_template_name = NetworkLookup.damage_blob_templates[damage_blob_template_id],
					source_unit = Managers.state.unit_storage:unit(source_unit)
				}
			}
			local unit_template_name = "damage_blob_unit"

			return unit_template_name, extension_init_data
		end,
		liquid_aoe_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local liquid_area_damage_template = GameSession.game_object_field(game_session, go_id, "liquid_area_damage_template")
			local source_unit = GameSession.game_object_field(game_session, go_id, "source_unit")
			local extension_init_data = {
				area_damage_system = {
					liquid_template = NetworkLookup.liquid_area_damage_templates[liquid_area_damage_template],
					source_unit = Managers.state.unit_storage:unit(source_unit)
				}
			}
			local unit_template_name = "liquid_aoe_unit"

			return unit_template_name, extension_init_data
		end,
		lure_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "lure_unit"
			local extension_init_data = {
				health_system = {
					duration = 5
				},
				death_system = {
					death_reaction_template = "lure_unit"
				}
			}

			return unit_template_name, extension_init_data
		end,
		aoe_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local aoe_dot_damage = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage")
			local aoe_init_damage = GameSession.game_object_field(game_session, go_id, "aoe_init_damage")
			local aoe_dot_damage_interval = GameSession.game_object_field(game_session, go_id, "aoe_dot_damage_interval")
			local radius = GameSession.game_object_field(game_session, go_id, "radius")
			local life_time = GameSession.game_object_field(game_session, go_id, "life_time")
			local player_screen_effect_name = GameSession.game_object_field(game_session, go_id, "player_screen_effect_name")
			local dot_effect_name = GameSession.game_object_field(game_session, go_id, "dot_effect_name")
			local area_damage_template = GameSession.game_object_field(game_session, go_id, "area_damage_template")
			local invisible_unit = GameSession.game_object_field(game_session, go_id, "invisible_unit")
			local extra_dot_effect_name = GameSession.game_object_field(game_session, go_id, "extra_dot_effect_name")
			local explosion_template_name = GameSession.game_object_field(game_session, go_id, "explosion_template_name")
			local owner_player_id = GameSession.game_object_field(game_session, go_id, "owner_player_id")
			extra_dot_effect_name = NetworkLookup.effects[extra_dot_effect_name]

			if extra_dot_effect_name == "n/a" then
				extra_dot_effect_name = nil
			end

			explosion_template_name = NetworkLookup.explosion_templates[explosion_template_name]

			if explosion_template_name == "n/a" then
				explosion_template_name = nil
			end

			local player_screen_effect_name = NetworkLookup.effects[player_screen_effect_name]

			if player_screen_effect_name == "n/a" then
				player_screen_effect_name = nil
			end

			local dot_effect_name = NetworkLookup.effects[dot_effect_name]

			if dot_effect_name == "n/a" then
				dot_effect_name = nil
			end

			local nav_mesh_effect = nil

			if explosion_template_name then
				local template = ExplosionTemplates[explosion_template_name]

				if template then
					local aoe_data = template.aoe
					nav_mesh_effect = aoe_data.nav_mesh_effect
				end
			end

			local owner_player = nil

			if owner_player_id ~= NetworkConstants.invalid_game_object_id then
				owner_player = Managers.player:player_from_game_object_id(owner_player_id)
			end

			local extension_init_data = {
				area_damage_system = {
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					life_time = life_time,
					invisible_unit = invisible_unit,
					player_screen_effect_name = player_screen_effect_name,
					dot_effect_name = dot_effect_name,
					nav_mesh_effect = nav_mesh_effect,
					extra_dot_effect_name = extra_dot_effect_name,
					area_damage_template = NetworkLookup.area_damage_templates[area_damage_template],
					explosion_template_name = explosion_template_name,
					owner_player = owner_player
				}
			}
			local unit_template_name = "aoe_unit"

			return unit_template_name, extension_init_data
		end,
		pickup_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				}
			}
			local unit_template_name = "pickup_unit"

			return unit_template_name, extension_init_data
		end,
		objective_pickup_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local pickup_name = GameSession.game_object_field(game_session, go_id, "pickup_name")
			local has_physics = GameSession.game_object_field(game_session, go_id, "has_physics")
			local spawn_type = GameSession.game_object_field(game_session, go_id, "spawn_type")
			local extension_init_data = {
				pickup_system = {
					pickup_name = NetworkLookup.pickup_names[pickup_name],
					has_physics = has_physics,
					spawn_type = NetworkLookup.pickup_spawn_types[spawn_type]
				}
			}
			local unit_template_name = "objective_pickup_unit"

			return unit_template_name, extension_init_data
		end,
		prop_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "prop_unit"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		overpowering_blob_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local health = GameSession.game_object_field(game_session, go_id, "health")
			local unit_template_name = "overpowering_blob_unit"
			local extension_init_data = {
				health_system = {
					health = health
				},
				death_system = {
					death_reaction_template = "lure_unit",
					is_husk = true
				}
			}

			return unit_template_name, extension_init_data
		end,
		network_synched_dummy_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "network_synched_dummy_unit"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		ai_unit_dummy_sorcerer = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "ai_unit_dummy_sorcerer"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		thrown_weapon_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "thrown_weapon_unit"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		interest_point_level_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "interest_point_level"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		interest_point_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			local unit_template_name = "interest_point"
			local extension_init_data = nil

			return unit_template_name, extension_init_data
		end,
		sync_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
			assert(false)
		end
	},
	unit_from_gameobject_creator_func = function (unit_spawner, game_session, go_id, go_template)
		local unit = nil
		local is_level_unit = go_template.is_level_unit

		if is_level_unit then
			local unit_index = GameSession.game_object_field(game_session, go_id, "level_id")

			assert(false, "NetworkLookup.levels doesn�t exist. Talk to Anders E")

			local level_name = NetworkLookup.levels[GameSession.game_object_field(game_session, go_id, "level_name_id")]
			local level = GLOBAL.current_levels[level_name]
			unit = Level.unit_by_index(level, unit_index)
		else
			local husk_unit = NetworkLookup.husks[GameSession.game_object_field(game_session, go_id, "husk_unit")]
			local position, rotation = nil

			if go_template.syncs_position then
				position = GameSession.game_object_field(game_session, go_id, "position")
			end

			if go_template.syncs_rotation then
				rotation = GameSession.game_object_field(game_session, go_id, "rotation")
			elseif go_template.syncs_yaw then
				local new_yaw = GameSession.game_object_field(game_session, go_id, "yaw_rot")
				local yaw_rotation = Quaternion(Vector3.up(), new_yaw)
				rotation = yaw_rotation
			elseif go_template.syncs_pitch_yaw then
				local new_yaw = GameSession.game_object_field(game_session, go_id, "yaw")
				local new_pitch = GameSession.game_object_field(game_session, go_id, "pitch")
				local yaw_rotation = Quaternion(Vector3.up(), new_yaw)
				local pitch_rotation = Quaternion(Vector3.right(), new_pitch)
				rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
			end

			if go_template.has_uniform_scaling then
				local uniform_scale = GameSession.game_object_field(game_session, go_id, "uniform_scale")
				local scale = Vector3(uniform_scale, uniform_scale, uniform_scale)
				local spawn_pose = Matrix4x4.from_quaternion_position(rotation, position)

				Matrix4x4.set_scale(spawn_pose, scale)

				unit = unit_spawner:spawn_local_unit(husk_unit, spawn_pose)

				return unit
			end

			unit = unit_spawner:spawn_local_unit(husk_unit, position, rotation)
		end

		return unit
	end
}
local initializers = go_type_table.initializers

initializers.ai_true_flight_killable_projectile_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
	local data_table = initializers.ai_true_flight_projectile_unit(unit, unit_name, unit_template, gameobject_functor_context)
	local health_extension = ScriptUnit.has_extension(unit, "health_system")
	data_table.health = health_extension:get_max_health()
	data_table.go_type = NetworkLookup.go_types.ai_true_flight_killable_projectile_unit

	return data_table
end

local extractors = go_type_table.extractors

extractors.ai_true_flight_killable_projectile_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
	local _, extension_init_data, true_flight_template_name = extractors.ai_true_flight_projectile_unit(game_session, go_id, owner_id, unit, gameobject_functor_context)
	local template = TrueFlightTemplates[true_flight_template_name]
	local health = GameSession.game_object_field(game_session, go_id, "health")
	extension_init_data.health_system = {
		health = health
	}
	extension_init_data.death_system = {
		is_husk = true,
		death_reaction_template = template.death_reaction_template
	}
	local unit_template_name = "ai_true_flight_killable_projectile_unit"

	return unit_template_name, extension_init_data
end

return go_type_table
