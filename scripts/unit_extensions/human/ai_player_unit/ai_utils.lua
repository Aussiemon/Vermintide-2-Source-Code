﻿-- chunkname: @scripts/unit_extensions/human/ai_player_unit/ai_utils.lua

local stagger_types = require("scripts/utils/stagger_types")

require("scripts/entity_system/systems/behaviour/utility/utility")

local unit_get_data = Unit.get_data
local script_data = script_data
local unit_alive = Unit.alive
local unit_local_rotation = Unit.local_rotation
local unit_animation_event = Unit.animation_event
local BLACKBOARDS = BLACKBOARDS

function aiprint(...)
	if script_data.debug_ai_movement then
		print(...)
	end
end

AiUtils = AiUtils or {}
BreedCategory = {
	Armored = 16,
	Berserker = 4,
	Boss = 8,
	Infantry = 1,
	Shielded = 2,
	Special = 64,
	SuperArmor = 32,
}

AiUtils.has_breed_categories = function (owned_flags, effective_against)
	return bit.band(owned_flags, effective_against) == owned_flags
end

AiUtils.special_dead_cleanup = function (unit, blackboard)
	if not blackboard.target_unit then
		return
	end

	local special_targets = blackboard.group_blackboard.special_targets

	special_targets[blackboard.target_unit] = nil

	local disabled_by_special = blackboard.group_blackboard.disabled_by_special

	disabled_by_special[blackboard.target_unit] = nil
end

AiUtils.aggro_unit_of_enemy = function (unit, enemy_unit)
	enemy_unit = AiUtils.get_actual_attacker_unit(enemy_unit)

	if not ALIVE[enemy_unit] then
		return
	end

	local ai_simple_extension = ScriptUnit.has_extension(unit, "ai_system")

	if ai_simple_extension then
		ai_simple_extension:enemy_aggro(unit, enemy_unit)
	end
end

AiUtils.activate_unit = function (blackboard)
	if blackboard.activation_lock then
		return
	end

	local breed = blackboard.breed

	if not blackboard.confirmed_player_sighting and not breed.ignore_activate_unit then
		local unit = blackboard.unit

		if not HEALTH_ALIVE[unit] then
			return
		end

		Managers.state.event:trigger("ai_unit_activated", unit, breed.name, blackboard.master_event_id)

		blackboard.confirmed_player_sighting = true
		blackboard.activated = true
	end
end

AiUtils.deactivate_unit = function (blackboard)
	if blackboard.confirmed_player_sighting then
		local breed = blackboard.breed
		local unit = blackboard.unit

		Managers.state.event:trigger("ai_unit_deactivated", unit, breed.name, blackboard.master_event_id)

		blackboard.confirmed_player_sighting = false
		blackboard.activated = false
	end
end

AiUtils.stormvermin_champion_hack_check_ward = function (unit, blackboard)
	if blackboard.ward_active and not blackboard.defensive_mode_duration then
		blackboard.ward_active = false

		AiUtils.stormvermin_champion_set_ward_state(unit, false, true)
	end
end

AiUtils.stormvermin_champion_set_ward_state = function (unit, state, is_server)
	local actor = Unit.actor(unit, "c_trophy_rack_ward")

	if actor then
		Actor.set_scene_query_enabled(actor, state)
	end

	if state then
		Unit.flow_event(unit, "skulls_glow_on")
	else
		Unit.flow_event(unit, "skulls_glow_off")
	end

	if is_server then
		local network_manager = Managers.state.network
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_set_ward_state", unit_id, state)
	end
end

AiUtils.chaos_exalted_champion_set_shield_state = function (unit, state, is_server)
	if state then
		Unit.flow_event(unit, "chaos_shields_on")
	else
		Unit.flow_event(unit, "chaos_shields_off")
	end
end

AiUtils.alert_unit_of_enemy = function (unit_to_alert, attacker_unit)
	attacker_unit = AiUtils.get_actual_attacker_unit(attacker_unit)

	if not HEALTH_ALIVE[attacker_unit] then
		return
	end

	local ai_simple_extension = ScriptUnit.has_extension(unit_to_alert, "ai_system")

	if ai_simple_extension then
		ai_simple_extension:enemy_alert(unit_to_alert, attacker_unit)
	end
end

AiUtils.alert_unit = function (attacker_unit, unit_to_alert)
	local network_manager = Managers.state.network

	if network_manager.is_server then
		AiUtils.alert_unit_of_enemy(unit_to_alert, attacker_unit)
	else
		local attacker_unit_id = network_manager:unit_game_object_id(attacker_unit)
		local alert_unit_id = network_manager:unit_game_object_id(unit_to_alert)

		network_manager.network_transmit:send_rpc_server("rpc_alert_enemy", alert_unit_id, attacker_unit_id)
	end
end

local broadphase_query_result = {}

AiUtils.alert_nearby_friends_of_enemy = function (unit, broadphase, enemy_unit, range)
	range = range or 5
	enemy_unit = AiUtils.get_actual_attacker_unit(enemy_unit)

	if not ALIVE[enemy_unit] then
		return
	end

	local num_results = Broadphase.query(broadphase, Unit.local_position(unit, 0), range, broadphase_query_result)

	for i = 1, num_results do
		local other_unit = broadphase_query_result[i]

		if other_unit ~= unit then
			local ai_simple_extension = ScriptUnit.has_extension(other_unit, "ai_system")

			if ai_simple_extension then
				ai_simple_extension:enemy_alert(unit, enemy_unit)
			end
		end

		broadphase_query_result[i] = nil
	end
end

AiUtils.print = function (debug_parameter, ...)
	if Development.parameter(debug_parameter) then
		print(...)
	end
end

AiUtils.printf = function (debug_parameter, ...)
	if Development.parameter(debug_parameter) then
		printf(...)
	end
end

AiUtils.breed_name = function (unit)
	return Unit.get_data(unit, "breed").name
end

AiUtils.stagger_target = function (unit, hit_unit, distance, impact, direction, t, duration_table, attack_template, hit_zone_name, blocked)
	local stagger_type, stagger_duration = DamageUtils.calculate_stagger(impact, duration_table, hit_unit, unit, attack_template, hit_zone_name, blocked)

	if stagger_type > 0 then
		local hit_unit_blackboard = BLACKBOARDS[hit_unit]

		AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, direction, distance, stagger_type, stagger_duration, nil, t)
	end
end

AiUtils.calculate_ai_stagger_strength = function (attacker_blackboard, target_blackboard, t, apply_toughness_break, reset_stagger_level, reset_multiplier)
	local target_break_t = target_blackboard.ai_toughness_break_t or 0
	local toughness_break_decay = t - target_break_t
	local toughness_break = math.max((target_blackboard.ai_toughness_break or 0) - toughness_break_decay, 0)
	local target_toughness = (target_blackboard.breed.ai_toughness or 0) - toughness_break
	local attacker_strength = attacker_blackboard.breed.ai_strength or 0
	local stagger_strength = math.round(math.clamp(attacker_strength - target_toughness, stagger_types.none, stagger_types.heavy))

	if apply_toughness_break then
		target_blackboard.ai_toughness_break = toughness_break + attacker_strength
		target_blackboard.ai_toughness_break_t = t

		if reset_stagger_level and reset_stagger_level <= stagger_strength then
			target_blackboard.ai_toughness_break = target_blackboard.ai_toughness_break * reset_multiplier
		end
	end

	return stagger_strength
end

AiUtils.calculate_ai_stagger_impact = function (stagger_strength)
	local distance = (0.15 + 0.1 * math.random()) * stagger_strength
	local impact = {
		stagger_strength,
	}

	return impact, distance
end

AiUtils.damage_target = function (target_unit, attacker_unit, action, damage, damage_source)
	damage = DamageUtils.calculate_damage(damage, target_unit, attacker_unit)

	local attacker_pos = POSITION_LOOKUP[attacker_unit] or Unit.world_position(attacker_unit, 0)
	local target_pos = POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0)
	local damage_direction = Vector3.normalize(target_pos - attacker_pos)
	local _, is_level_unit = Managers.state.network:game_object_or_level_id(target_unit)

	damage_source = damage_source or AiUtils.breed_name(attacker_unit)

	local inflicted_damage, source_attacker_unit
	local attacker_blackboard = BLACKBOARDS[attacker_unit]

	source_attacker_unit = attacker_blackboard and attacker_blackboard.commander_unit

	if is_level_unit then
		inflicted_damage = DamageUtils.add_damage_network(target_unit, attacker_unit, damage, "torso", action.damage_type, nil, damage_direction, damage_source, nil, source_attacker_unit, nil, action.hit_react_type)
	else
		local difficulty_manager = Managers.state.difficulty
		local difficulty_settings = difficulty_manager:get_difficulty_settings()
		local diminishing_damage_data = action.diminishing_damage
		local target_slot_extension = ScriptUnit.has_extension(target_unit, "ai_slot_system")

		if diminishing_damage_data and target_slot_extension and target_slot_extension.has_slots_attached then
			local slots_n = target_slot_extension.delayed_num_occupied_slots

			if slots_n > 0 then
				local diminishing_damage = diminishing_damage_data[math.min(slots_n, 9)].damage
				local max_diminishing_damage = diminishing_damage_data[1].damage
				local weave_manager = Managers.weave

				if weave_manager:get_active_weave() then
					local scaling_value = weave_manager:get_scaling_value("diminishing_damage")

					diminishing_damage = math.lerp(diminishing_damage, max_diminishing_damage, scaling_value)
				end

				local damage_modifier = diminishing_damage

				damage = damage * damage_modifier
			end
		end

		local is_player_unit = DamageUtils.is_player_unit(target_unit)

		if is_player_unit then
			local difficulty_rank = difficulty_manager:get_difficulty_rank()

			if difficulty_rank and difficulty_rank < 3 then
				local player_status_extension = ScriptUnit.has_extension(target_unit, "status_system")

				if player_status_extension and player_status_extension:is_knocked_down() then
					local knocked_down_damage_multiplier = difficulty_settings.knocked_down_damage_multiplier or 1

					damage = damage * knocked_down_damage_multiplier
				end

				local target_unit_health_extension = ScriptUnit.has_extension(target_unit, "health_system")

				if target_unit_health_extension then
					local damage_percent_cap = difficulty_settings.damage_percent_cap
					local max_health = target_unit_health_extension:get_max_health()
					local damage_cap = max_health * damage_percent_cap

					damage = math.clamp(damage, 0, damage_cap)
				end

				local damage_multiplier = difficulty_settings.damage_multiplier or 1

				damage = damage * damage_multiplier
			end
		else
			local target_blackboard = BLACKBOARDS[target_unit]
			local attacker_blackboard = BLACKBOARDS[attacker_unit]

			if target_blackboard and attacker_blackboard then
				local t = Managers.time:time("game")
				local attacker_breed = attacker_blackboard.breed
				local target_breed = target_blackboard.breed
				local stagger_strength

				if action.unblockable and action.attack_intensity_type == "push" then
					stagger_strength = stagger_types[action.hit_react_type]
				end

				stagger_strength = stagger_strength or AiUtils.calculate_ai_stagger_strength(attacker_blackboard, target_blackboard, t, true, stagger_types.medium, 0.25)

				if stagger_strength <= 0 then
					if target_breed.strong_hit_reacts and target_blackboard.past_damage_in_attack ~= false and (not target_blackboard.stagger or target_blackboard.stagger_anim_done) then
						local hit_unit_dir = Quaternion.forward(unit_local_rotation(target_unit, 0))
						local angle_difference = Vector3.flat_angle(damage_direction, hit_unit_dir)
						local hit_anim_list

						if angle_difference < -math.pi * 0.75 or angle_difference > math.pi * 0.75 then
							hit_anim_list = target_breed.strong_hit_reacts.bwd
						elseif angle_difference < -math.pi * 0.25 then
							hit_anim_list = target_breed.strong_hit_reacts.left
						elseif angle_difference < math.pi * 0.25 then
							hit_anim_list = target_breed.strong_hit_reacts.fwd
						else
							hit_anim_list = target_breed.strong_hit_reacts.right
						end

						if hit_anim_list then
							local hit_anim = hit_anim_list[math.random(1, #hit_anim_list)]

							unit_animation_event(target_unit, hit_anim)
						end
					elseif not target_breed.disable_local_hit_reactions then
						local hit_unit_dir = Quaternion.forward(unit_local_rotation(target_unit, 0))
						local angle_difference = Vector3.flat_angle(hit_unit_dir, damage_direction)
						local hit_anim

						hit_anim = not (not (angle_difference < -math.pi * 0.75) and not (angle_difference > math.pi * 0.75)) and "hit_reaction_backward" or angle_difference < -math.pi * 0.25 and "hit_reaction_left" or angle_difference < math.pi * 0.25 and "hit_reaction_forward" or "hit_reaction_right"

						if hit_anim then
							unit_animation_event(target_unit, hit_anim)
						end
					end
				else
					local impact, distance = AiUtils.calculate_ai_stagger_impact(stagger_strength)

					AiUtils.stagger_target(attacker_unit, target_unit, distance, impact, damage_direction, t)
				end

				local damage_multiplier_vs_ai = attacker_breed.damage_multiplier_vs_ai or 0.25

				damage = damage * damage_multiplier_vs_ai

				local hit_effect
				local hitzone_armor_categories = target_breed.hitzone_armor_categories
				local target_unit_armor = hitzone_armor_categories and hitzone_armor_categories.torso or target_breed.armor_category

				if damage < 0.25 and target_unit_armor == 2 then
					hit_effect = "fx/hit_armored"
				elseif not target_breed.no_blood_splatter_on_damage then
					hit_effect = BloodSettings:get_hit_effect_for_race(target_breed.race) or target_breed.hit_effect
				end

				if hit_effect then
					local world = target_blackboard.world
					local hit_node_id = target_breed.hit_zones_lookup.torso or 0
					local hit_position = Unit.world_position(target_unit, hit_node_id) + Vector3(0, 0, math.random() * target_breed.aoe_height * 0.1)

					EffectHelper.player_melee_hit_particles(world, hit_effect, hit_position, damage_direction, action.damage_type, target_unit, damage)
				end
			end
		end

		inflicted_damage = DamageUtils.add_damage_network(target_unit, attacker_unit, damage, "torso", action.damage_type, nil, damage_direction, damage_source, nil, source_attacker_unit, nil, action.hit_react_type)

		local push_speed = action.player_push_speed

		if is_player_unit and push_speed then
			local target_status_extension = ScriptUnit.extension(target_unit, "status_system")

			if not target_status_extension:is_disabled() then
				local player_locomotion = ScriptUnit.extension(target_unit, "locomotion_system")

				player_locomotion:add_external_velocity(push_speed * damage_direction, action.max_player_push_speed)
			end
		end
	end

	local blackboard = BLACKBOARDS[attacker_unit]

	if blackboard then
		blackboard.hit_through_block = false
	end

	return inflicted_damage
end

AiUtils.add_attack_intensity = function (target_unit, action, blackboard)
	local target_unit_attack_intensity_extension = ScriptUnit.has_extension(target_unit, "attack_intensity_system")

	if not target_unit_attack_intensity_extension then
		return
	end

	local attack_intensity_type = action.attack_intensity_type

	if not attack_intensity_type then
		return
	end

	local difficulty = Managers.state.difficulty:get_difficulty()
	local difficulty_attack_intensity_settings = action.difficulty_attack_intensity and action.difficulty_attack_intensity[attack_intensity_type][difficulty]

	if not difficulty_attack_intensity_settings then
		return
	end

	local add_random_intensity = action.add_random_intensity

	for intensity_type, intensity in pairs(difficulty_attack_intensity_settings) do
		local random_intensity = add_random_intensity and 0.75 + 0.5 * math.random() or 1
		local final_attack_intensity = intensity * random_intensity

		target_unit_attack_intensity_extension:add_attack_intensity(intensity_type, final_attack_intensity)
	end
end

AiUtils.poison_explode_unit = function (unit, action, blackboard)
	local position = Unit.local_position(unit, 0)
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local aoe_dot_damage_table = action.aoe_dot_damage[difficulty_rank] or action.aoe_dot_damage[2]
	local aoe_dot_damage = DamageUtils.calculate_damage(aoe_dot_damage_table)
	local aoe_init_damage_table = action.aoe_init_damage[difficulty_rank] or action.aoe_init_damage[2]
	local aoe_init_damage = DamageUtils.calculate_damage(aoe_init_damage_table)
	local aoe_dot_damage_interval = action.aoe_dot_damage_interval
	local radius = action.radius
	local initial_radius = action.initial_radius
	local duration = action.duration
	local create_nav_tag_volume = action.create_nav_tag_volume
	local nav_tag_volume_layer = action.nav_tag_volume_layer
	local extension_init_data = {
		area_damage_system = {
			area_ai_random_death_template = "area_poison_ai_random_death",
			area_damage_template = "globadier_area_dot_damage",
			damage_players = true,
			dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
			extra_dot_effect_name = "fx/chr_gutter_death",
			invisible_unit = true,
			player_screen_effect_name = "fx/screenspace_poison_globe_impact",
			aoe_dot_damage = aoe_dot_damage,
			aoe_init_damage = aoe_init_damage,
			aoe_dot_damage_interval = aoe_dot_damage_interval,
			radius = radius,
			initial_radius = initial_radius,
			life_time = duration,
			damage_source = blackboard.breed.name,
			create_nav_tag_volume = create_nav_tag_volume,
			nav_tag_volume_layer = nav_tag_volume_layer,
			source_attacker_unit = unit,
		},
	}
	local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "aoe_unit", extension_init_data, position)
	local unit_id = Managers.state.unit_storage:go_id(aoe_unit)

	Unit.set_unit_visibility(aoe_unit, false)

	local world = blackboard.world

	assert(world)
	Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, position)
	Managers.state.unit_spawner:mark_for_deletion(unit)
end

AiUtils.warpfire_explode_unit = function (unit, blackboard)
	local world = blackboard.world
	local explosion_template = ExplosionTemplates.warpfire_explosion
	local node = Unit.node(unit, "j_backpack")
	local explosion_position = Unit.world_position(unit, node)
	local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
	local explosion_template_id = NetworkLookup.explosion_templates.warpfire_explosion
	local damage_source = blackboard.breed.name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	Unit.flow_event(unit, "lua_hide_backpack")

	local actor = Unit.actor(unit, "c_backpack")

	Actor.set_collision_filter(actor, "filter_trigger")
	Actor.set_scene_query_enabled(actor, false)
	DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, 0, false)
	Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)

	local position = POSITION_LOOKUP[unit]
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local position_on_navmesh = LocomotionUtils.get_close_pos_below_on_mesh(nav_world, position, 4)

	if position_on_navmesh then
		local rotation = Unit.local_rotation(unit, 0)
		local direction = Quaternion.forward(rotation)

		direction = Vector3.flat(direction)

		local extension_init_data = {
			area_damage_system = {
				liquid_template = "warpfire_death_fire",
				flow_dir = direction,
				source_unit = unit,
			},
		}
		local aoe_unit_name = "units/hub_elements/empty"
		local liquid_aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "liquid_aoe_unit", extension_init_data, position_on_navmesh)
		local liquid_area_damage_extension = ScriptUnit.extension(liquid_aoe_unit, "area_damage_system")

		liquid_area_damage_extension:ready()
	end
end

AiUtils.chaos_zombie_explosion = function (unit, action, blackboard, delete_unit)
	local position = Unit.local_position(unit, 0)
	local damage_source = blackboard.breed.name
	local world = blackboard.world
	local explosion_position = position + Vector3.up()
	local explosion_template = ExplosionTemplates.chaos_zombie_explosion

	DamageUtils.create_explosion(world, unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, 0, false)

	local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
	local explosion_template_id = NetworkLookup.explosion_templates.chaos_zombie_explosion
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)

	if delete_unit then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	local blood_dir = Quaternion.up(Unit.local_rotation(unit, 0))

	Managers.state.blood:add_blood_ball(position, blood_dir, "default", unit)
end

AiUtils.generic_mutator_explosion = function (unit, blackboard, explosion_template_name, do_damage)
	local position = Unit.local_position(unit, 0)
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local damage_source = blackboard.breed.name
	local world = blackboard.world
	local explosion_position = position + Vector3.up()
	local explosion_template = ExplosionTemplates[explosion_template_name]

	DamageUtils.create_explosion(world, do_damage and unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, unit, 0, false)

	local attacker_unit_id = Managers.state.unit_storage:go_id(unit)
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)

	local blood_dir = Quaternion.up(Unit.local_rotation(unit, 0))

	Managers.state.blood:add_blood_ball(position, blood_dir, "default", unit)
end

AiUtils.ai_explosion = function (exploding_unit, owner_unit, blackboard, damage_source, explosion_template)
	local explosion_position = Unit.local_position(exploding_unit, 0)
	local damage_source = blackboard.breed.name
	local world = blackboard.world

	DamageUtils.create_explosion(world, exploding_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, owner_unit, false)

	local attacker_unit_id = Managers.state.unit_storage:go_id(owner_unit)
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)
	Managers.state.unit_spawner:mark_for_deletion(exploding_unit)
end

AiUtils.loot_rat_explosion = function (exploding_unit, owner_unit, blackboard, damage_source, explosion_template)
	local explosion_position = Unit.local_position(exploding_unit, 0)
	local damage_source = blackboard.breed.name
	local world = blackboard.world

	DamageUtils.create_explosion(world, exploding_unit, explosion_position, Quaternion.identity(), explosion_template, 1, damage_source, true, false, owner_unit, false)

	local attacker_unit_id = Managers.state.unit_storage:go_id(owner_unit)
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template.name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, explosion_position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)

	blackboard.delete_at_t = Managers.time:time("game") + 0.1
end

AiUtils.spawn_overpowering_blob = function (network_manager, target_unit, blob_health, life_time)
	local position = POSITION_LOOKUP[target_unit]
	local blob_unit_name = "units/weapons/enemy/wpn_overpowering_blob/wpn_overpowering_blob"
	local extension_init_data = {
		health_system = {
			health = blob_health,
			target_unit = target_unit,
			life_time = life_time,
		},
		death_system = {
			death_reaction_template = "lure_unit",
		},
	}
	local size = Vector3(1, 1, 1)
	local pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), position)

	Matrix4x4.set_scale(pose, Vector3(size[1], size[2], size[3]))

	local overpowering_blob_unit = Managers.state.unit_spawner:spawn_network_unit(blob_unit_name, "overpowering_blob_unit", extension_init_data, pose)
	local parent_node = Unit.node(target_unit, "c_spine")
	local child_unit = overpowering_blob_unit
	local child_node = 0
	local world = Application.main_world()

	World.link_unit(world, child_unit, target_unit, parent_node)

	local child_unit_id = network_manager:unit_game_object_id(child_unit)
	local parent_unit_id = network_manager:unit_game_object_id(target_unit)

	network_manager.network_transmit:send_rpc_clients("rpc_link_unit", child_unit_id, child_node, parent_unit_id, parent_node)

	return overpowering_blob_unit
end

AiUtils.broadphase_query = function (position, radius, result_table, broadphase_categories)
	fassert(result_table, "No result_table given to AiUtils,broadphase_query")

	local ai_system = Managers.state.entity:system("ai_system")
	local broadphase = ai_system.group_blackboard.broadphase
	local num_hits = Broadphase.query(broadphase, position, radius, result_table, broadphase_categories)

	return num_hits
end

AiUtils.get_angle_between_vectors = function (vector_1, vector_2)
	vector_1 = Vector3.normalize(Vector3.flat(vector_1))
	vector_2 = Vector3.normalize(Vector3.flat(vector_2))

	local radians = math.atan2(vector_1.y, vector_1.x) - math.atan2(vector_2.y, vector_2.x)
	local degrees = math.radians_to_degrees(radians)
	local angle = math.abs(degrees)

	return angle, degrees, radians
end

AiUtils.rotate_vector = function (vector, radians)
	local length = Vector3.length(vector)
	local l_radians = math.atan2(vector.y, vector.x)

	l_radians = l_radians + radians

	local x = math.cos(l_radians)
	local y = math.sin(l_radians)
	local return_vector = Vector3(x, y, 0)

	return_vector = return_vector * length

	return return_vector
end

AiUtils.constrain_radians = function (radians)
	if radians > math.pi then
		radians = -math.pi + (radians - math.pi)
	elseif radians < -math.pi then
		radians = math.pi + (radians + math.pi)
	end

	return radians
end

AiUtils.calculate_oobb = function (range, self_pos, self_rot, height, width)
	local height = height or 2
	local width = width or 2
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local size = Vector3(half_width, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward()) * half_range
	local up = Vector3.up() * half_height
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end

local previous_random_value = 0

AiUtils.calculate_bot_threat_time = function (bot_threat)
	local duration = bot_threat.duration
	local max_start_delay = bot_threat.max_start_delay or 0
	local current_random_value = math.random()
	local sum_random = previous_random_value + current_random_value

	if sum_random > 1 then
		sum_random = current_random_value
	end

	local start_delay = sum_random * max_start_delay
	local start_time = bot_threat.start_time + start_delay

	previous_random_value = sum_random

	return start_time, duration - start_delay
end

AiUtils.get_actual_attacker_unit = function (attacker_unit)
	local projectile_extension = ScriptUnit.has_extension(attacker_unit, "projectile_system")

	if projectile_extension and not ScriptUnit.has_extension(attacker_unit, "limited_item_track_system") then
		attacker_unit = projectile_extension.owner_unit

		return attacker_unit
	end

	local area_damage_system = ScriptUnit.has_extension(attacker_unit, "area_damage_system")

	if area_damage_system then
		local owner_player = area_damage_system.owner_player

		if owner_player then
			attacker_unit = owner_player.player_unit

			return attacker_unit
		end
	end

	return attacker_unit
end

AiUtils.unit_breed = function (unit)
	if not ALIVE[unit] then
		return
	end

	return unit_get_data(unit, "breed")
end

AiUtils.client_predicted_unit_alive = function (unit)
	if not unit_alive(unit) then
		return false
	end

	local health_extension = ScriptUnit.has_extension(unit, "health_system")
	local is_predicted_alive = health_extension and health_extension:client_predicted_is_alive()

	return is_predicted_alive
end

AiUtils.unit_invincible = function (unit)
	if not ALIVE[unit] then
		return false
	end

	local health_extension = ScriptUnit.has_extension(unit, "health_system")
	local is_invincible = health_extension and health_extension:get_is_invincible()

	return is_invincible
end

AiUtils.unit_knocked_down = function (unit)
	if not ALIVE[unit] then
		return false
	end

	local status_extension = ScriptUnit.has_extension(unit, "status_system")

	if not status_extension then
		return false
	end

	local is_knocked_down = status_extension:is_knocked_down()

	return is_knocked_down
end

AiUtils.unit_disabled = function (unit)
	if not ALIVE[unit] then
		return false
	end

	local status_extension = ScriptUnit.has_extension(unit, "status_system")

	if not status_extension then
		return false
	end

	local is_disabled = status_extension:is_disabled()

	return is_disabled
end

AiUtils.is_unwanted_target = function (side, enemy_unit)
	if side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[enemy_unit] then
		local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
		local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()

		if is_grabbed_by_chaos_spawn then
			return true
		end
	end

	return false
end

AiUtils.is_of_interest_to_gutter_runner = function (gutter_runner_unit, enemy_unit, blackboard, ignore_knocked_down)
	local side = Managers.state.side.side_by_unit[gutter_runner_unit]
	local valid_targets_player_and_bots = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	if not valid_targets_player_and_bots[enemy_unit] then
		return
	end

	local disabled_by_unit = blackboard.group_blackboard.disabled_by_special[enemy_unit]

	if disabled_by_unit and disabled_by_unit ~= gutter_runner_unit then
		return
	end

	local status_extension = ScriptUnit.extension(enemy_unit, "status_system")

	if status_extension:is_knocked_down() and not ignore_knocked_down then
		return
	end

	if status_extension:is_grabbed_by_pack_master() then
		return
	end

	if status_extension:is_grabbed_by_corruptor() then
		return
	end

	if status_extension:is_grabbed_by_chaos_spawn() then
		return
	end

	if status_extension:get_is_ledge_hanging() then
		return
	end

	if status_extension:is_pounced_down() and status_extension:get_pouncer_unit() ~= gutter_runner_unit then
		return
	end

	if status_extension.using_transport then
		return
	end

	return true
end

AiUtils.is_of_interest_to_packmaster = function (packmaster_unit, enemy_unit)
	local side = Managers.state.side.side_by_unit[packmaster_unit]
	local valid_targets_player_and_bots = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	if valid_targets_player_and_bots[enemy_unit] then
		local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
		local is_knocked_down = status_extension:is_knocked_down()
		local is_pounced_down = status_extension:is_pounced_down()
		local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
		local grabbed = status_extension:is_grabbed_by_pack_master()
		local is_grabbed_by_other_pack_master = grabbed and status_extension:get_pack_master_grabber() ~= packmaster_unit
		local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
		local is_using_transport = status_extension.using_transport
		local ledge_hanging = status_extension.is_ledge_hanging
		local is_grabbed_by_corruptor = status_extension:is_grabbed_by_corruptor()

		if not is_knocked_down and not is_pounced_down and not is_grabbed_by_other_pack_master and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not is_grabbed_by_corruptor then
			return true
		end
	end

	return false
end

AiUtils.is_of_interest_to_corruptor = function (corruptor_unit, enemy_unit)
	local side = Managers.state.side.side_by_unit[corruptor_unit]
	local valid_targets_player_and_bots = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

	if valid_targets_player_and_bots[enemy_unit] then
		local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
		local is_knocked_down = status_extension:is_knocked_down()
		local is_pounced_down = status_extension:is_pounced_down()
		local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
		local grabbed = status_extension:is_grabbed_by_corruptor()
		local is_grabbed_by_other_corruptor = grabbed and status_extension.corruptor_unit ~= corruptor_unit
		local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
		local is_using_transport = status_extension.using_transport
		local ledge_hanging = status_extension.is_ledge_hanging
		local is_grabbed_by_pack_master = status_extension:is_grabbed_by_pack_master()

		if not is_knocked_down and not is_pounced_down and not is_grabbed_by_other_corruptor and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not is_grabbed_by_pack_master then
			return true
		end
	end

	return false
end

AiUtils.is_of_interest_to_tentacle = function (enemy_unit, tentacle_unit)
	local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
	local is_knocked_down = status_extension:is_knocked_down()
	local is_pounced_down = status_extension:is_pounced_down()
	local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
	local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
	local is_using_transport = status_extension.using_transport
	local ledge_hanging = status_extension.is_ledge_hanging
	local in_end_zone = status_extension.in_end_zone
	local is_grabbed_by_corruptor = status_extension:is_grabbed_by_corruptor()

	if not is_knocked_down and not is_pounced_down and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not in_end_zone and not is_grabbed_by_corruptor then
		return true
	end

	return false
end

AiUtils.is_of_interest_to_vortex = function (enemy_unit)
	local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
	local is_knocked_down = status_extension:is_knocked_down()
	local is_pounced_down = status_extension:is_pounced_down()
	local grabbed = status_extension:is_grabbed_by_pack_master()
	local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
	local is_using_transport = status_extension.using_transport
	local ledge_hanging = status_extension.is_ledge_hanging
	local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
	local is_in_vortex = status_extension:is_in_vortex()
	local in_end_zone = status_extension.in_end_zone
	local is_grabbed_by_corruptor = status_extension:is_grabbed_by_corruptor()

	if not is_knocked_down and not is_pounced_down and not grabbed and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not is_in_vortex and not in_end_zone and not is_grabbed_by_corruptor then
		return true
	end

	return false
end

AiUtils.is_of_interest_plague_wave_sorcerer = function (enemy_unit)
	local status_extension = ScriptUnit.has_extension(enemy_unit, "status_system")

	if not status_extension then
		return false
	end

	local is_knocked_down = status_extension:is_knocked_down()
	local is_pounced_down = status_extension:is_pounced_down()
	local grabbed = status_extension:is_grabbed_by_pack_master()
	local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
	local is_using_transport = status_extension.using_transport
	local ledge_hanging = status_extension.is_ledge_hanging
	local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
	local overpowered = status_extension.overpowered
	local in_end_zone = status_extension.in_end_zone

	if not is_knocked_down and not is_pounced_down and not grabbed and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not overpowered and not in_end_zone then
		return true
	end

	return false
end

AiUtils.is_of_interest_boss_sorcerer = function (enemy_unit)
	local status_extension = ScriptUnit.extension(enemy_unit, "status_system")
	local is_knocked_down = status_extension:is_knocked_down()
	local is_pounced_down = status_extension:is_pounced_down()
	local grabbed = status_extension:is_grabbed_by_pack_master()
	local is_hanging = status_extension.pack_master_status == "pack_master_hanging"
	local is_using_transport = status_extension.using_transport
	local ledge_hanging = status_extension.is_ledge_hanging
	local is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
	local is_in_vortex = status_extension:is_in_vortex()
	local overpowered = status_extension.overpowered

	if not is_knocked_down and not is_pounced_down and not grabbed and not is_hanging and not is_using_transport and not ledge_hanging and not is_grabbed_by_chaos_spawn and not is_in_vortex and not overpowered then
		return true
	end

	return false
end

AiUtils.is_of_interest_stormfiend_demo = function (enemy_unit)
	local player_manager = Managers.player
	local player = player_manager:unit_owner(enemy_unit)

	return not player.bot_player
end

AiUtils.show_polearm = function (packmaster_unit, show)
	local item_inventory_index = 1
	local go_id = Managers.state.unit_storage:go_id(packmaster_unit)
	local network_manager = Managers.state.network

	if network_manager:game() then
		network_manager.network_transmit:send_rpc_all("rpc_ai_show_single_item", go_id, item_inventory_index, show)
	end
end

AiUtils.stagger = function (unit, blackboard, attacker_unit, stagger_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, stagger_value, always_stagger, is_push, should_play_push_sound)
	fassert(stagger_type > 0, "Tried to use invalid stagger type %q", stagger_type)

	local is_staggered = blackboard.stagger
	local current_stagger_is_explosion = is_staggered and blackboard.stagger_type == stagger_types.explosion
	local new_stagger_is_explosion = stagger_type == stagger_types.explosion

	if not always_stagger and not is_push and current_stagger_is_explosion and not new_stagger_is_explosion then
		return
	end

	local breed = blackboard.breed

	if breed.boss_staggers and stagger_type < stagger_types.explosion then
		return
	end

	local difficulty_modifier = Managers.state.difficulty:get_difficulty_settings().stagger_modifier

	blackboard.pushing_unit = attacker_unit
	blackboard.stagger_direction = Vector3Box(stagger_direction)
	blackboard.stagger_length = stagger_length
	blackboard.stagger_time = stagger_duration * difficulty_modifier + t

	local stagger_value_to_add = stagger_value or 1

	blackboard.stagger = blackboard.stagger and blackboard.stagger + stagger_value_to_add or stagger_value_to_add
	blackboard.stagger_type = stagger_type
	blackboard.stagger_animation_scale = stagger_animation_scale
	blackboard.always_stagger_suffered = always_stagger
	blackboard.stagger_was_push = is_push

	local shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

	if shield_extension and not shield_extension.is_blocking and blackboard.attack_token and blackboard.stagger and blackboard.stagger < 3 then
		blackboard.stagger = 3
	end

	if unit ~= attacker_unit and ScriptUnit.has_extension(unit, "ai_system") then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		if breed.using_combo and always_stagger then
			Unit.set_data(attacker_unit, "last_combo_t", t)
		end

		if breed.before_stagger_enter_function then
			breed.before_stagger_enter_function(unit, blackboard, attacker_unit, is_push)
		end

		if ai_extension.attacked then
			ai_extension:attacked(attacker_unit, t)
		end
	end

	if should_play_push_sound then
		local push_sound_event = blackboard.breed.push_sound_event or "Play_generic_pushed_impact_small"

		Managers.state.entity:system("audio_system"):play_audio_unit_event(push_sound_event, unit)
	end
end

AiUtils.override_stagger = function (unit, blackboard, attacker_unit, stagger_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, is_push)
	local active_node = blackboard.active_node

	if not active_node or not active_node.stagger_override then
		return false
	end

	if active_node:stagger_override(unit, blackboard, attacker_unit, stagger_direction, stagger_length, stagger_type, stagger_duration, stagger_animation_scale, t, is_push) then
		assert(stagger_type > stagger_types.none, "Tried to use invalid stagger type %q", stagger_type)

		if unit ~= attacker_unit and ScriptUnit.has_extension(unit, "ai_system") then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")

			if ai_extension.attacked then
				ai_extension:attacked(attacker_unit, t)
			end
		end

		return true
	end

	return false
end

AiUtils.random = function (value1, value2)
	return value1 + Math.random() * (value2 - value1)
end

local MAX_TRIES = 10
local MIN_ANGLE_STEP = 4
local MAX_ANGLE_STEP = 8
local MIN_ANGLE = 0

AiUtils.advance_towards_target = function (unit, blackboard, min_distance, max_distance, min_angle_step, max_angle_step, min_angle, max_tries, direction, above, below)
	local target_unit = blackboard.target_unit

	if not HEALTH_ALIVE[target_unit] then
		return
	end

	local max_tries = MAX_TRIES
	local min_angle_step = min_angle_step or MIN_ANGLE_STEP
	local max_angle_step = max_angle_step or MAX_ANGLE_STEP
	local min_angle = min_angle or MIN_ANGLE

	direction = direction or 1 - math.random(0, 1) * 2

	local from_position = POSITION_LOOKUP[unit]
	local target_position = POSITION_LOOKUP[target_unit]

	for j = 1, 2 do
		for i = 1, max_tries do
			local angle = min_angle + math.random(min_angle_step * i, max_angle_step * i) * direction
			local position, wanted_distance = LocomotionUtils.outside_goal(blackboard.nav_world, from_position, target_position, min_distance, max_distance, angle, 3, above, below)

			if position then
				return position, wanted_distance, direction
			end
		end

		direction = -direction
	end

	return false
end

AiUtils.temp_anim_event = function (unit, anim, time)
	local category_name = "temp_anim_event"
	local head_node = Unit.node(unit, "c_head")
	local viewport_name = "player_1"
	local color_vector = Vector3(255, 0, 0)
	local offset_vector = Vector3(0, 0, 1)
	local text_size = 0.5
	local text = anim

	if time then
		text = anim .. ": " .. math.round_with_precision(time, 1)
	end

	Managers.state.debug_text:clear_unit_text(unit, category_name)
	Managers.state.debug_text:output_unit_text(text, text_size, unit, head_node, offset_vector, nil, category_name, color_vector, viewport_name)
end

AiUtils.clear_temp_anim_event = function (unit)
	local category_name = "temp_anim_event"

	Managers.state.debug_text:clear_unit_text(unit, category_name)
end

AiUtils.anim_event = function (unit, data, anim_event)
	if data.anim_event and data.anim_event == anim_event then
		return
	end

	Managers.state.network:anim_event(unit, anim_event)

	data.anim_event = anim_event
end

AiUtils.get_default_breed_move_speed = function (unit, blackboard)
	local move_speed
	local breed = blackboard.breed

	if blackboard.is_passive then
		move_speed = breed.passive_walk_speed or breed.walk_speed
	else
		move_speed = breed.run_speed
	end

	return move_speed
end

AiUtils.clear_anim_event = function (data)
	data.anim_event = nil
end

AiUtils.set_default_anim_constraint = function (unit, constraint_target)
	local position = POSITION_LOOKUP[unit]
	local rotation = Unit.world_rotation(unit, 0)
	local rotation_forward = Quaternion.forward(rotation)
	local aim_target = position + rotation_forward * 5 + Vector3.up() * 1.25

	Unit.animation_set_constraint_target(unit, constraint_target, aim_target)
end

AiUtils.ninja_vanish_when_taking_damage = function (unit, blackboard)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local _, nr_damages = health_extension:recent_damages()

	if nr_damages > 0 then
		blackboard.ninja_vanish = true
	end
end

AiUtils.initialize_cost_table = function (navtag_layer_cost_table, allowed_layers)
	for layer_id, layer_name in ipairs(LAYER_ID_MAPPING) do
		local layer_cost = allowed_layers[layer_name]

		if layer_cost == 0 or layer_cost == nil then
			GwNavTagLayerCostTable.forbid_layer(navtag_layer_cost_table, layer_id)
		else
			GwNavTagLayerCostTable.allow_layer(navtag_layer_cost_table, layer_id)
			GwNavTagLayerCostTable.set_layer_cost_multiplier(navtag_layer_cost_table, layer_id, layer_cost)
		end
	end
end

AiUtils.initialize_nav_cost_map_cost_table = function (cost_table, allowed_layers, default_cost)
	for layer_id, layer_name in ipairs(NAV_COST_MAP_LAYER_ID_MAPPING) do
		local layer_cost = allowed_layers and allowed_layers[layer_name] or default_cost or 0

		GwNavCostMap.cost_table_set_cost(cost_table, layer_id, layer_cost)
	end
end

AiUtils.kill_unit = function (victim_unit, attacker_unit, hit_zone_name, damage_type, damage_direction, damage_source)
	local damage_amount = NetworkConstants.damage.max

	attacker_unit = attacker_unit or victim_unit

	if HEALTH_ALIVE[victim_unit] then
		hit_zone_name = hit_zone_name or "full"
		damage_type = damage_type or "kinetic"
		damage_source = damage_source or "suicide"
		damage_direction = damage_direction or Vector3(0, 0, 1)

		local health = ScriptUnit.extension(victim_unit, "health_system"):current_health()
		local skip_buffs = true

		for i = 1, math.ceil(health / damage_amount) do
			DamageUtils.add_damage_network(victim_unit, attacker_unit, damage_amount, hit_zone_name, damage_type, nil, damage_direction, damage_source, nil, nil, nil, nil, false, false, nil, nil, nil, skip_buffs)
		end
	end
end

local DEFAULT_AGGRO_MULTIPLIERS = {
	grenade = 1,
	melee = 1,
	ranged = 1,
}

AiUtils.update_aggro = function (unit, blackboard, breed, t, dt)
	local aggro_list = blackboard.aggro_list
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local strided_array, array_length = health_extension:recent_damages()
	local aggro_decay = dt * breed.perception_weights.aggro_decay_per_sec

	for enemy_unit, aggro in pairs(aggro_list) do
		aggro_list[enemy_unit] = math.clamp(aggro - aggro_decay, 0, 100)
	end

	local aggro_multipliers = breed.perception_weights.aggro_multipliers or DEFAULT_AGGRO_MULTIPLIERS

	if array_length > 0 then
		local stride = DamageDataIndex.STRIDE
		local index = 0

		for i = 1, array_length / stride do
			local attacker_unit = strided_array[index + DamageDataIndex.ATTACKER]
			local damage_amount = strided_array[index + DamageDataIndex.DAMAGE_AMOUNT]
			local damage_source = strided_array[index + DamageDataIndex.DAMAGE_SOURCE_NAME]
			local master_list_item = rawget(ItemMasterList, damage_source)

			if master_list_item then
				local slot_type = master_list_item.slot_type
				local multiplier = aggro_multipliers[slot_type] or 1

				damage_amount = damage_amount * multiplier
			end

			local aggro = aggro_list[attacker_unit]

			if aggro then
				aggro = aggro + damage_amount
				aggro_list[attacker_unit] = aggro
			else
				aggro_list[attacker_unit] = damage_amount
			end

			index = index + stride
		end
	end
end

AiUtils.debug_bot_transitions = function (gui, t, x1, y1)
	local tiny_font_size = 16
	local tiny_font = "arial"
	local tiny_font_mtrl = "materials/fonts/" .. tiny_font
	local resx, resy = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local borderx, bordery = 20, 20
	local debug_win_width = 330
	local layer = 20

	x1 = x1 + borderx + 20
	y1 = y1 + bordery + 20

	local y2 = y1
	local running_color = Colors.get_color_with_alpha("lavender", 255)
	local unrun_color = Colors.get_color_with_alpha("sky_blue", 255)
	local header_color = Colors.get_color_with_alpha("orange", 255)

	ScriptGUI.ictext(gui, resx, resy, "BOT TRANSITIONS: ", tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, header_color)

	y2 = y2 + 20

	local players = Managers.player:human_and_bot_players()

	for _, player in pairs(players) do
		if player.bot_player then
			local unit = player.player_unit

			if ALIVE[unit] then
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local unit_name = profile and profile.unit_name
				local navigation_extension = ScriptUnit.extension(unit, "ai_navigation_system")
				local transitions = navigation_extension._active_nav_transitions
				local bot_text = "[" .. unit_name .. "]"

				ScriptGUI.ictext(gui, resx, resy, bot_text, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, running_color)

				y2 = y2 + 20
				k = 1

				for t_unit, _ in pairs(transitions) do
					local s = string.format("    %d) %s", k, tostring(Unit.debug_name(t_unit)))

					ScriptGUI.ictext(gui, resx, resy, s, tiny_font_mtrl, tiny_font_size, tiny_font, x1 - 10, y2, layer, unrun_color)

					y2 = y2 + 20
					k = k + 1
				end
			end
		end
	end

	y2 = y2 + 20

	ScriptGUI.icrect(gui, resx, resy, borderx, bordery, x1 + debug_win_width, y2, layer - 1, Color(200, 20, 20, 20))
end

AiUtils.push_intersecting_players = function (unit, source_unit, displaced_units, data, t, dt, hit_func, ...)
	local self_forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local self_pos = POSITION_LOOKUP[unit]
	local push_pos = self_pos + self_forward * data.push_forward_offset
	local radius = data.push_width * 1.5
	local dodge_radius = data.dodged_width and data.dodged_width * 1.5
	local forward_pos = self_pos + self_forward * 3
	local side_unit = HEALTH_ALIVE[source_unit] and source_unit or HEALTH_ALIVE[unit] and unit
	local side = Managers.state.side.side_by_unit[side_unit]
	local enemy_player_and_bot_units = side and side.ENEMY_PLAYER_AND_BOT_UNITS

	if enemy_player_and_bot_units then
		for i = 1, #enemy_player_and_bot_units do
			local push_radius = radius
			local hit_unit = enemy_player_and_bot_units[i]

			if displaced_units[hit_unit] then
				if t > displaced_units[hit_unit] then
					displaced_units[hit_unit] = nil
				end
			else
				local other_pos = POSITION_LOOKUP[hit_unit]
				local to_target = other_pos - push_pos

				if dodge_radius then
					local status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

					if status_extension and status_extension:get_is_dodging() then
						push_radius = dodge_radius
					end
				end

				if push_radius > Vector3.length(to_target) then
					local push_width_sqr = data.push_width * data.push_width
					local pos_projected_on_forward_move_dir = Geometry.closest_point_on_line(other_pos, self_pos, forward_pos)
					local side_vector = other_pos - pos_projected_on_forward_move_dir

					if push_width_sqr > Vector3.length_squared(side_vector) then
						local ahead_dist = Vector3.distance(self_pos, pos_projected_on_forward_move_dir)

						if ahead_dist < data.ahead_dist then
							local target_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

							if not target_status_extension.knocked_down then
								if not displaced_units[hit_unit] then
									local pushed_velocity = data.player_pushed_speed * Vector3.normalize(other_pos - self_pos)
									local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")
									local push_scaler = 1 - ahead_dist / data.ahead_dist

									push_scaler = push_scaler * push_scaler

									locomotion_extension:add_external_velocity(pushed_velocity * push_scaler)

									if hit_func then
										hit_func(hit_unit, unit, ...)
									end
								end

								displaced_units[hit_unit] = t + 0.1
							end
						end
					end
				end
			end
		end
	end
end

AiUtils.set_material_property = function (unit, variable_name, material_name, value, all_meshes, mesh_name)
	if all_meshes then
		local mesh

		for i = 0, Unit.num_meshes(unit) - 1 do
			mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_scalar(material, variable_name, value)
			end
		end
	else
		local mesh = Unit.mesh(unit, mesh_name)
		local material = Mesh.material(mesh, material_name)

		Material.set_scalar(material, variable_name, value)
	end
end

AiUtils.allow_smart_object_layers = function (navigation_extension, status)
	navigation_extension:allow_layer("ledges", status)
	navigation_extension:allow_layer("ledges_with_fence", status)
	navigation_extension:allow_layer("doors", status)
	navigation_extension:allow_layer("planks", status)
	navigation_extension:allow_layer("jumps", status)
	navigation_extension:allow_layer("teleporters", status)
end

AiUtils.shield_user = function (unit)
	if not ScriptUnit.has_extension(unit, "ai_shield_system") then
		return false
	end

	local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
	local broken_shield = ai_shield_extension.broken_shield
	local using_shield = not broken_shield

	return using_shield
end

AiUtils.attack_is_shield_blocked = function (hit_unit, attacker_unit, trueflight_blocking, hit_direction)
	assert(attacker_unit)

	if not ScriptUnit.has_extension(hit_unit, "ai_shield_system") then
		return false
	end

	local ai_shield_extension = ScriptUnit.extension(hit_unit, "ai_shield_system")
	local shield_blocked = ai_shield_extension:can_block_attack(attacker_unit, trueflight_blocking, hit_direction)

	return shield_blocked
end

AiUtils.attack_is_dodged = function (hit_unit)
	local game_object_id = Managers.state.unit_storage:go_id(hit_unit)
	local game = Managers.state.network:game()
	local dodged = GameSession.game_object_field(game, game_object_id, "is_dodging")

	return dodged
end

AiUtils.unit_is_flanking_player = function (enemy_unit, player_unit, optional_rotation)
	local network_manager = Managers.state.network
	local player_unit_id = network_manager:unit_game_object_id(player_unit)
	local game = network_manager:game()

	if game and player_unit_id then
		local to_target_vec = Vector3.normalize(POSITION_LOOKUP[enemy_unit] - POSITION_LOOKUP[player_unit])
		local player_rot = optional_rotation or GameSession.game_object_field(game, player_unit_id, "aim_direction")
		local unit_fwd_dir = Quaternion.forward(Quaternion.look(player_rot))
		local is_behind = Vector3.dot(to_target_vec, unit_fwd_dir) < 0.4

		return is_behind
	end

	return false
end

local MIN_DIST_SQR = 0.0001

AiUtils.remove_bad_boxed_spline_points = function (source_points, spline_name)
	local points = {}
	local pA = source_points[1]:unbox()
	local pB

	points[1] = pA

	for i = 2, #source_points do
		pB = source_points[i]:unbox()

		local dist = Vector3.distance_squared(pA, pB)

		if dist > MIN_DIST_SQR then
			points[#points + 1] = pB
			pA = pB
		else
			print("SPLINE HAS FAULTY POINTS (create_formation_data):", spline_name, i)
		end
	end

	return points
end

AiUtils.remove_bad_spline_points = function (source_points, spline_name)
	local points = {}
	local pA, pB = source_points[1]

	points[1] = pA

	for i = 2, #source_points do
		pB = source_points[i]

		local dist = Vector3.distance_squared(pA, pB)

		if dist > MIN_DIST_SQR then
			points[#points + 1] = pB
			pA = pB
		else
			print("SPLINE HAS FAULTY POINTS (create_formation_data):", spline_name, i)
		end
	end

	return points
end

AiUtils.get_combat_conditions = function (blackboard)
	local target_unit = blackboard.target_unit

	if target_unit then
		local num_enemies = #blackboard.proximite_enemies
		local target_breed = Unit.get_data(target_unit, "breed")

		return {
			enemy_arc = num_enemies > 3 and 2 or num_enemies > 1 and 1 or 0,
			target_armor = target_breed and target_breed.armor_category or 1,
		}
	end

	return nil
end

local DEFAULT_MAXIMAL_MELEE_RANGE = 5
local DEFAULT_ATTACK_META_DATA = {
	tap_attack = {
		arc = 0,
		penetrating = false,
		speed_mod = 1.2,
		max_range = DEFAULT_MAXIMAL_MELEE_RANGE,
		armor_modifiers = {
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
		},
	},
	hold_attack = {
		arc = 2,
		penetrating = true,
		speed_mod = 0.8,
		max_range = DEFAULT_MAXIMAL_MELEE_RANGE,
		armor_modifiers = {
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
		},
	},
}
local MAX_ARC = 2
local ARC_IMPORTANCE = {
	0,
	0.2,
	0.4,
}
local ARMOR_MOD_IMPORTANCE = {
	0.5,
	2,
	1.5,
	1,
	1.3,
	2,
}
local ARMOR_ARC_MOD = {
	1,
	0,
	0,
	0,
	0,
	0,
}
local math_abs = math.abs

AiUtils.get_melee_weapon_score = function (conditions, weapon_item_template)
	local weapon_meta_data = weapon_item_template and weapon_item_template.attack_meta_data or DEFAULT_ATTACK_META_DATA
	local best_utility = -1
	local best_attack_input = "tap_attack"
	local best_attack_meta_data = weapon_meta_data[best_attack_input]

	if conditions then
		for attack_input, attack_meta_data in pairs(weapon_meta_data) do
			local utility = 0
			local target_armor = conditions.target_armor
			local mod_arc = math.clamp(conditions.enemy_arc + ARMOR_ARC_MOD[target_armor], 0, 2)
			local arc_diff = 1 - math_abs(mod_arc - attack_meta_data.arc) / MAX_ARC
			local arc_importnace = ARC_IMPORTANCE[mod_arc + 1]

			utility = utility + arc_importnace * arc_diff

			local armor_modifiers = attack_meta_data.armor_modifiers

			if armor_modifiers then
				local armor_mod = armor_modifiers[target_armor] or 0
				local armor_relevence = ARMOR_MOD_IMPORTANCE[target_armor] or 1

				utility = utility + armor_mod * armor_relevence * (attack_meta_data.speed_mod or 1)
			end

			if best_utility < utility then
				best_utility = utility
				best_attack_input = attack_input
				best_attack_meta_data = attack_meta_data
			end
		end
	end

	return best_attack_input, best_attack_meta_data, best_utility
end

local START_THREAT_VALUE = 0
local MAX_THREAT_VALUE = 30
local MAX_THREAT_RANGE = MAX_THREAT_VALUE - START_THREAT_VALUE

AiUtils.get_party_danger = function ()
	local conflict_director = Managers.state.conflict

	if conflict_director then
		local threat_value = conflict_director:get_threat_value()

		return math.clamp((threat_value - START_THREAT_VALUE) / MAX_THREAT_RANGE, 0, 1)
	end

	return 0
end

AiUtils.get_bot_weapon_extension = function (blackboard)
	if blackboard then
		local inventory_extension = blackboard.inventory_extension
		local item_data, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
		local _, current_action_extension, _ = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)

		if current_action_extension then
			return current_action_extension
		end

		local item_template = item_data and BackendUtils.get_item_template(item_data)

		if item_template and item_template.dominant_left then
			return left_hand_weapon_extension or right_hand_weapon_extension
		else
			return right_hand_weapon_extension or left_hand_weapon_extension
		end
	end

	return nil
end

AiUtils.taunt_unit = function (ai_unit, taunt_unit, duration, taunt_bosses)
	local blackboard = BLACKBOARDS[ai_unit]

	if blackboard then
		local breed = blackboard.breed
		local taunt_target = breed and not breed.ignore_taunts and (not breed.boss or taunt_bosses)

		if taunt_target then
			local t = Managers.time:time("game")
			local taunt_end_time = t + duration

			if blackboard.taunt_unit == taunt_unit then
				blackboard.taunt_end_time = taunt_end_time
			else
				if blackboard.target_unit == taunt_unit then
					blackboard.no_taunt_hesitate = true
				end

				blackboard.taunt_unit = taunt_unit
				blackboard.taunt_end_time = taunt_end_time
				blackboard.target_unit = taunt_unit
				blackboard.target_unit_found_time = t
			end
		end
	end
end

AiUtils.taunt_nearby_units = function (unit, radius, duration, t, optional_effect_name, optional_sound_event)
	local side = Managers.state.side.side_by_unit[unit]
	local position = POSITION_LOOKUP[unit]
	local nearby_ai = FrameTable.alloc_table()
	local broadphase_categories = side.enemy_broadphase_categories
	local n_hits = AiUtils.broadphase_query(position, radius, nearby_ai, broadphase_categories)

	for i = 1, n_hits do
		local ai_unit = nearby_ai[i]
		local enemy_blackboard = BLACKBOARDS[ai_unit]
		local override_targets = enemy_blackboard.override_targets

		table.clear(override_targets)

		enemy_blackboard.target_unit = nil
		override_targets[unit] = t + duration
	end

	if optional_effect_name then
		local effect_id = NetworkLookup.effects[optional_effect_name]
		local node_id = 0
		local linked = false

		Managers.state.network:rpc_play_particle_effect_no_rotation(nil, effect_id, NetworkConstants.invalid_game_object_id, node_id, position, linked)
	end

	if optional_sound_event then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(optional_sound_event, unit)
	end

	return nearby_ai
end

AiUtils.calculate_animation_movespeed = function (animation_move_speed_config, unit, target_unit)
	local max_value = animation_move_speed_config[1].value
	local distance_to_target = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit])
	local wanted_value, num_configs = max_value, #animation_move_speed_config

	for i = 1, num_configs do
		local config = animation_move_speed_config[i]
		local distance, value = config.distance, config.value

		if i < num_configs then
			local next_config = animation_move_speed_config[i + 1]
			local next_distance, next_value = next_config.distance, next_config.value

			if next_distance < distance_to_target then
				local progress = math.inv_lerp(distance, next_distance, distance_to_target)

				wanted_value = math.lerp_clamped(value, next_value, progress)

				break
			end
		else
			wanted_value = value
		end
	end

	return wanted_value
end

local stagger_types = require("scripts/utils/stagger_types")

AiUtils.magic_entrance_optional_spawned_func = function (unit, breed, optional_data)
	if not breed.special and not breed.boss and not breed.cannot_be_aggroed then
		local player_unit = PlayerUtils.get_random_alive_hero()

		AiUtils.aggro_unit_of_enemy(unit, player_unit)
	end

	local teleport_effect = "fx/grudge_marks_shadow_step"
	local effect_name_id = NetworkLookup.effects[teleport_effect]
	local node_id = 0
	local network_manager = Managers.state.network

	network_manager:rpc_play_particle_effect_no_rotation(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, POSITION_LOOKUP[unit], false)

	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_normal_spawn_stinger", unit)

		local direction = Quaternion.forward(Quaternion.axis_angle(Vector3.up(), math.pi * 2 * math.random()))
		local distance = 0.5
		local stagger_type = stagger_types.medium
		local stun_duration = 0.5
		local t = Managers.time:time("game")

		AiUtils.stagger(unit, blackboard, unit, direction, distance, stagger_type, stun_duration, nil, t)
	end
end

AiUtils.is_part_of_patrol = function (unit)
	local blackboard = BLACKBOARDS[unit]

	return blackboard and blackboard.patrolling
end

AiUtils.is_aggroed = function (unit)
	local blackboard = BLACKBOARDS[unit]

	return blackboard and blackboard.target_unit
end
