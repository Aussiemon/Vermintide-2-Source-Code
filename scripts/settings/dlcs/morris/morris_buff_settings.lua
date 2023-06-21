require("scripts/settings/dlcs/morris/deus_power_up_settings")
require("scripts/settings/dlcs/morris/greed_pinata_settings")
require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local buff_area_helper = require("scripts/utils/buff_area_helper")
local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local dlc_settings = DLCSettings.morris

local function is_local(unit)
	local player = Managers.player:owner(unit)

	return player and not player.remote
end

local function is_bot(unit)
	local player = Managers.player:owner(unit)

	return player and player.bot_player
end

local function is_server()
	return Managers.state.network.is_server
end

local function is_husk(unit)
	local player = Managers.player:owner(unit)

	return player and (player.remote or player.bot_player) or false
end

local function heal_target(unit, heal_type, heal_amount)
	if ALIVE[unit] then
		if is_server() then
			DamageUtils.heal_network(unit, unit, heal_amount, heal_type)
		else
			local network_manager = Managers.state.network
			local owner_unit_id = network_manager:unit_game_object_id(unit)
			local heal_type_id = NetworkLookup.heal_types[heal_type]

			network_manager.network_transmit:send_rpc_server("rpc_request_heal", owner_unit_id, heal_amount, heal_type_id)
		end
	end
end

local function find_pickup_buff_settings(buff, pickup_settings)
	local template = buff.template
	local buff_settings = template.pickup_names and template.pickup_names[pickup_settings.pickup_name] or template.pickup_slot_names and template.pickup_slot_names[pickup_settings.slot_name] or template.pickup_types and template.pickup_types[pickup_settings.type]

	return buff_settings
end

local function greed_pinata_drop_pickup(drop_table, position, last_attacker_id)
	local spawn_value = math.random()
	local spawn_weighting_total = 0
	local offset_position = position + Vector3(math.random(-0.5, 0.5), math.random(-0.5, 0.5), 2)

	for pickup_name, drop in pairs(drop_table) do
		spawn_weighting_total = spawn_weighting_total + drop.drop_weight

		if spawn_value <= spawn_weighting_total then
			local pickup = drop.spawn_function(pickup_name, offset_position, drop.pickup_data, last_attacker_id)

			if pickup then
				break
			end
		end
	end
end

local function trigger_deus_potion_end_sound_event(unit, buff, params, world)
	if is_local(unit) and not is_bot(unit) then
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, "Play_potion_morris_effect_end")
	end
end

local function spawn_barrel(item_name, position, rotation, velocity, explode_time, fuse_time, random_explosion_delay)
	local network_position = AiAnimUtils.position_network_scale(position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(velocity, true)
	local t = Managers.time:time("game")
	local random_delay = Math.random_range(-random_explosion_delay, random_explosion_delay)
	local explosion_data = {
		explode_time = t + explode_time + random_delay,
		fuse_time = fuse_time
	}
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_velocity
		},
		death_system = {
			in_hand = false,
			death_data = explosion_data,
			item_name = item_name
		},
		health_system = {
			damage = 1,
			health_data = explosion_data,
			item_name = item_name
		},
		pickup_system = {
			has_physics = true,
			spawn_type = "loot",
			pickup_name = item_name
		}
	}
	local pickup_settings = AllPickups[item_name]
	local unit_name = pickup_settings.unit_name
	local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"

	Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
end

dlc_settings.buff_function_templates = {
	update_stockpile_buff = function (unit, buff, params, world)
		if buff.buffs_applied then
			return
		end

		local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

		if inventory_extension then
			inventory_extension:refresh_buffs_on_ammo()

			buff.buffs_applied = true
		end
	end,
	remove_stockpile_buff = function (unit, buff, params, world)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:add_buff("stockpile_refresh_ammo_buffs")
	end,
	start_armor_breaker = function (unit, buff, params, world)
		buff.next_tick_t = params.t + 0.5
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)
		local power_level = 0
		local fx = nil

		if unit == local_player_unit then
			local career_extension = ScriptUnit.extension(local_player_unit, "career_system")

			local function get_armor_breaker_power_level(career_name, slot_name)
				local item = BackendUtils.get_loadout_item(career_name, slot_name)
				local traits = item.traits

				if traits then
					for _, trait_name in ipairs(traits) do
						if trait_name == "armor_breaker" then
							return item.power_level
						end
					end
				end

				return buff.template.default_power_level
			end

			local career_name = career_extension:career_name()
			local armor_breaker_power_level = math.max(get_armor_breaker_power_level(career_name, "slot_melee"), get_armor_breaker_power_level(career_name, "slot_ranged"))
			power_level = armor_breaker_power_level
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.first_person_unit
			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01_1p", POSITION_LOOKUP[first_person_unit])

			World.link_particles(world, fx, first_person_unit, Unit.node(first_person_unit, "root_point"), Matrix4x4.identity(), "stop")
			WwiseWorld.trigger_event(wwise_world, "Play_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Play_wind_metal_gameplay_mutator_wind_loop", unit, 0)

			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01", POSITION_LOOKUP[unit])

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end

		buff.power_level = power_level
		buff.linked_effect = fx
	end,
	update_armor_breaker = function (unit, buff, params)
		if buff.next_tick_t <= params.t then
			buff.next_tick_t = params.t + 0.5
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
			local rotation = Unit.local_rotation(unit, 0)

			area_damage_system:create_explosion(unit, position, rotation, "armor_breaker", 1, "undefined", buff.power_level, false)
		end
	end,
	remove_armor_breaker = function (unit, buff, params, world)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)

		if unit == local_player_unit then
			WwiseWorld.trigger_event(wwise_world, "Stop_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Stop_wind_metal_gameplay_mutator_wind_loop", unit, 0)
		end

		local vfx = buff.linked_effect

		if vfx then
			World.destroy_particles(world, vfx)

			buff.linked_effect = nil
		end
	end,
	apply_mark_of_nurgle = function (unit, buff, params, world)
		local template = buff.template
		local mark_particle = template.mark_particle
		local vfx = World.create_particles(world, mark_particle, POSITION_LOOKUP[unit])

		World.link_particles(world, vfx, unit, Unit.node(unit, "j_spine"), Matrix4x4.identity(), "stop")

		local start_sound_event_name = template.start_sound_event_name
		local sound_id, _, wwise_world = WwiseUtils.trigger_unit_event(world, start_sound_event_name, unit, 0)
		buff.sound_id = sound_id
		buff.wwise_world = wwise_world
		buff.linked_effect = vfx
	end,
	remove_mark_of_nurgle = function (unit, buff, params, world)
		local vfx = buff.linked_effect

		if vfx then
			World.destroy_particles(world, vfx)

			buff.linked_effect = nil
		end

		local sound_id = buff.sound_id

		if sound_id then
			WwiseWorld.stop_event(buff.wwise_world, sound_id)

			buff.sound_id = nil
		end
	end,
	apply_generic_aoe = function (unit, buff, params, world)
		buff_area_helper.setup_range_check(unit, buff, params, world)
	end,
	update_generic_aoe = function (unit, buff, params, world)
		buff_area_helper.update_range_check(unit, buff, params, world)
	end,
	unit_entered_range_generic_buff = function (unit, buffer_unit, buff, params, world)
		local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

		if buff_extension then
			if not is_husk(unit) then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "Play_blessing_rally_flag_loop")
			end

			local buff_name = buff.template.in_range_units_buff_name
			local buff_id = buff_extension:add_buff(buff_name)

			return buff_id
		end
	end,
	unit_left_range_generic_buff = function (unit, user_data, buffer_unit, buff, params, world)
		if ALIVE[unit] then
			if not is_husk(unit) then
				local wwise_world = Managers.world:wwise_world(world)

				WwiseWorld.trigger_event(wwise_world, "Stop_blessing_rally_flag_loop")
			end

			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:remove_buff(user_data)
		end
	end,
	remove_generic_aoe = function (unit, buff, params, world)
		buff_area_helper.destroy_range_check(unit, buff, params, world)
	end,
	apply_generic_decal = function (unit, buff, params, world)
		local z_offset = buff.template.decal_z_offset or 0
		local position = Vector3.copy(POSITION_LOOKUP[unit])
		position.z = position.z + z_offset
		local decal_unit_name = buff.template.decal
		local decal_unit = Managers.state.unit_spawner:spawn_local_unit(decal_unit_name, position)
		local scale = buff.template.decal_scale or 1

		Unit.set_local_scale(decal_unit, 0, Vector3(scale, scale, scale))

		buff.linked_decal = decal_unit
	end,
	remove_generic_decal = function (unit, buff, params, world)
		local linked_decal = buff.linked_decal

		if linked_decal then
			Managers.state.unit_spawner:mark_for_deletion(linked_decal)
		end
	end,
	apply_curse_khorne_champions_aoe = function (unit, buff, params, world)
		local fx = World.create_particles(world, buff.template.particle_fx, POSITION_LOOKUP[unit])
		buff.fx_id = fx

		World.link_particles(world, fx, unit, Unit.node(unit, "j_spine"), Matrix4x4.identity(), "stop")
		buff_area_helper.setup_range_check(unit, buff, params, world)
	end,
	update_curse_khorne_champions_aoe = function (unit, buff, params, world)
		buff_area_helper.update_range_check(unit, buff, params, world)
	end,
	unit_entered_range_champions_aoe = function (unit, buffer_unit, buff, params, world)
		if not DamageUtils.is_enemy(unit, buffer_unit) then
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			if buff_extension then
				local buff_name = buff.template.in_range_units_buff_name
				local buff_id = buff_extension:add_buff(buff_name)

				return buff_id
			end
		end
	end,
	unit_left_range_champions_aoe = function (unit, user_data, buffer_unit, buff, params, world)
		if user_data and ALIVE[unit] then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:remove_buff(user_data)
		end
	end,
	remove_curse_khorne_champions_aoe = function (unit, buff, params, world)
		World.stop_spawning_particles(world, buff.fx_id)
		buff_area_helper.destroy_range_check(unit, buff, params, world)
	end,
	curse_khorne_champions_unit_link_unit = function (unit, buff, params, world)
		local template = buff.template
		local unit_name = template.unit_name
		local spawned_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, POSITION_LOOKUP[unit])

		Managers.state.unit_spawner:create_unit_extensions(Unit.world(spawned_unit), spawned_unit, "prop_unit")
		World.link_unit(Unit.world(unit), spawned_unit, 0, unit, Unit.node(unit, "root_point"))

		buff.linked_unit = spawned_unit
		local z_offset_config = template.z_offset
		local breed = Unit.get_data(unit, "breed")
		local breed_name = breed.name
		local z_offset = z_offset_config[breed_name] or z_offset_config.default

		Unit.set_local_position(spawned_unit, 0, Vector3(0, 0, z_offset))
	end,
	remove_linked_unit = function (unit, buff, params, world)
		if buff.linked_unit then
			World.unlink_unit(Unit.world(buff.linked_unit), buff.linked_unit)
			Managers.state.unit_spawner:mark_for_deletion(buff.linked_unit)

			buff.linked_unit = nil
		end
	end,
	apply_curse_greed_pinata_drops = function (unit, buff, params, world)
		local health_extension = ScriptUnit.extension(unit, "health_system")

		if health_extension then
			buff.health_extension = health_extension
			local drop_step = health_extension:get_max_health() / buff.template.total_drops
			local current_damage = buff.health_extension:get_damage_taken()
			buff.drop_step = drop_step
			buff.drops_done = math.floor(current_damage / drop_step)
		end
	end,
	update_curse_greed_pinata_drops = function (unit, buff, params, world)
		local health_extension = buff.health_extension

		if health_extension then
			local current_damage = health_extension:get_damage_taken()

			if buff.prev_damage ~= current_damage then
				local drop_count = math.floor(current_damage / buff.drop_step)

				while buff.drops_done < drop_count do
					local last_attacker_id = health_extension.last_damage_data.attacker_unit_id

					greed_pinata_drop_pickup(buff.template.drop_table, POSITION_LOOKUP[unit], last_attacker_id)

					buff.drops_done = buff.drops_done + 1
				end

				buff.prev_damage = current_damage
			end
		end
	end,
	apply_attach_particle = function (unit, buff, params, world)
		if not buff.fx_id then
			local fx = World.create_particles(world, buff.template.particle_fx, POSITION_LOOKUP[unit])
			buff.fx_id = fx
			local template = buff.template
			local node = Unit.node(unit, "j_spine")
			local node_rotation = Unit.local_rotation(unit, node)
			local offset_rotation = Quaternion.from_euler_angles_xyz(template.offset_rotation_x or 0, template.offset_rotation_y or 0, template.offset_rotation_z or 0)
			local pose = Matrix4x4.from_quaternion(Quaternion.multiply(node_rotation, offset_rotation))

			World.link_particles(world, fx, unit, Unit.node(unit, "j_spine"), pose, "stop")
		end
	end,
	remove_attach_particle = function (unit, buff, params, world)
		if buff.fx_id then
			World.stop_spawning_particles(world, buff.fx_id)
		end
	end,
	apply_screenspace_fx = function (unit, buff, params, world)
		local is_local_unit = is_local(unit)

		if not is_local_unit then
			return
		end

		if not buff.fx_id then
			local fx = World.create_particles(world, buff.template.screenspace_fx, Vector3(0, 0, 0))
			buff.fx_id = fx
		end
	end,
	remove_screenspace_fx = function (unit, buff, params, world)
		if buff.fx_id then
			World.stop_spawning_particles(world, buff.fx_id)
		end
	end,
	start_bloodthirst = function (unit, buff, params, world)
		buff.reset_timer = function ()
			buff.reset_at = params.t + buff.template.reset_after_time
		end

		buff.reset_timer()

		buff.stacked_buffs = {}
	end,
	update_bloodthirst = function (unit, buff, params, world)
		if buff.reset_at <= params.t then
			buff.kill_count = 0

			buff.reset_timer()
			BuffUtils.remove_stacked_buffs(unit, buff.stacked_buffs)
		end
	end,
	remove_bloodthirst = function (unit, buff, params, world)
		BuffUtils.remove_stacked_buffs(unit, buff.stacked_buffs)
	end,
	start_headhunter = function (unit, buff, params, world)
		buff.stacked_buffs = {}
	end,
	remove_headhunter = function (unit, buff, params, world)
		BuffUtils.remove_stacked_buffs(unit, buff.stacked_buffs)
	end,
	knockdown = function (unit, buff, params)
		if is_server() then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				health_extension:knock_down(unit)
			end
		end
	end,
	reset_health = function (unit, buff, params)
		if is_server() then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				health_extension:reset()
			end
		end
	end,
	apply_curse_rotten_miasma = function (unit, buff, params, world)
		buff.next_update_time = 0
		buff.stacked_buff_ids = {}
		buff.is_outside_safe_area = {}
		local difficulty_index = Managers.state.difficulty:get_difficulty_index()
		buff.radius = table.get_value_or_last(buff.template.safe_area_radius, difficulty_index)

		Unit.set_data(unit, "radius", buff.radius)
		Unit.flow_event(unit, "update_radius")
	end,
	update_curse_rotten_miasma = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		local safe_area_pos = Unit.local_position(unit, 0)

		if params.t < buff.next_update_time then
			return
		end

		local template = buff.template
		buff.next_update_time = params.t + template.buff_exposure_tick_rate
		local buff_system = Managers.state.entity:system("buff_system")
		local side = Managers.state.side:get_side_from_name("heroes")
		local player_units = side.PLAYER_UNITS

		for _, player_unit in ipairs(player_units) do
			local radius_squared = math.pow(buff.radius, 2)
			local player_position = POSITION_LOOKUP[player_unit]
			local distance_squared = Vector3.distance_squared(safe_area_pos, player_position)
			local is_outside_safe_area = radius_squared < distance_squared
			local is_inside_safe_area = not is_outside_safe_area
			local previous_is_outside_safe_area = buff.is_outside_safe_area[player_unit]
			local exit_safe_area = is_outside_safe_area and not previous_is_outside_safe_area
			local entered_safe_area = is_inside_safe_area and previous_is_outside_safe_area

			if exit_safe_area then
				buff.is_outside_safe_area[player_unit] = true
			elseif entered_safe_area then
				buff.is_outside_safe_area[player_unit] = false
			end

			buff.stacked_buff_ids[player_unit] = buff.stacked_buff_ids[player_unit] or {}
			local stacked_buff_ids = buff.stacked_buff_ids[player_unit]

			if is_outside_safe_area and #stacked_buff_ids < template.miasma_stack_limit then
				local is_server_sided_buff = true
				local buff_id = buff_system:add_buff(player_unit, "curse_rotten_miasma_debuff", player_unit, is_server_sided_buff)
				stacked_buff_ids[#stacked_buff_ids + 1] = buff_id
			elseif is_inside_safe_area and #stacked_buff_ids > 0 then
				local last_buff_id = stacked_buff_ids[#stacked_buff_ids]

				buff_system:remove_server_controlled_buff(player_unit, last_buff_id)

				stacked_buff_ids[#stacked_buff_ids] = nil

				if #stacked_buff_ids == 0 then
					local dialogue_input = ScriptUnit.extension_input(player_unit, "dialogue_system")
					local event_data = FrameTable.alloc_table()

					dialogue_input:trigger_networked_dialogue_event("curse_positive_effect_happened", event_data)
				end
			end
		end
	end,
	remove_curse_rotten_miasma = function (unit, buff, params, world)
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		if not player_unit then
			return
		end

		local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

		if buff.stacked_buff_ids then
			for _, buff_id in ipairs(buff.stacked_buff_ids) do
				buff_extension:remove_buff(buff_id)
			end

			table.clear(buff.stacked_buff_ids)
		end

		if buff.effect_buff_id then
			buff_extension:remove_buff(buff.effect_buff_id)

			buff.effect_buff_id = nil
		end
	end,
	apply_curse_rotten_miasma_debuff = function (unit, buff, params, world)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player.player_unit

		if local_player_unit == unit then
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, "Play_curse_rotten_miasma_loop")

			buff.buff_triggered_sound = true
		end
	end,
	remove_curse_rotten_miasma_debuff = function (unit, buff, params, world)
		if buff.buff_triggered_sound then
			local wwise_world = Managers.world:wwise_world(world)

			WwiseWorld.trigger_event(wwise_world, "Stop_curse_rotten_miasma_loop")
		end
	end,
	apply_objective_unit = function (unit, buff, params, world)
		local unit_name = "units/hub_elements/objective_unit"
		local objective_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, POSITION_LOOKUP[unit])

		Unit.set_data(objective_unit, "objective_server_only", true)
		Managers.state.unit_spawner:create_unit_extensions(Unit.world(objective_unit), objective_unit, "objective_unit")

		local objective_unit_extension = ScriptUnit.extension(objective_unit, "tutorial_system")

		objective_unit_extension:set_active(true)
		World.link_unit(Unit.world(unit), objective_unit, 0, unit, 0)

		buff.objective_unit = objective_unit
	end,
	remove_objective_unit = function (unit, buff, params, world)
		if buff.objective_unit then
			World.unlink_unit(Unit.world(buff.objective_unit), buff.objective_unit)
			Managers.state.unit_spawner:mark_for_deletion(buff.objective_unit)

			buff.objective_unit = nil
		end
	end,
	curse_abundance_of_life_custom_dot_tick = function (unit, buff, params, world)
		local player_health_extension = ScriptUnit.extension(unit, "health_system")
		local current_health = player_health_extension:current_health()
		local damage = current_health * buff.template.damage_percentage

		if current_health > 30 then
			local damage_direction = -Vector3.up()

			DamageUtils.add_damage_network(unit, unit, damage, "torso", "wounded_dot", nil, damage_direction)
		end
	end,
	apply_killer_in_the_shadows_buff = function (unit, buff, params)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(true, nil, "killer_in_the_shadows")
			status_extension:set_noclip(true, "killer_in_the_shadows")

			if not is_bot(unit) then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter_small")

				MOOD_BLACKBOARD.killer_in_the_shadows = true
			end
		end
	end,
	remove_killer_in_the_shadows_buff = function (unit, buff, params, world)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local removing_stealth = status_extension:set_invisible(false, nil, "killer_in_the_shadows")

			status_extension:set_noclip(false, "killer_in_the_shadows")

			if not is_bot(unit) then
				if removing_stealth then
					local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

					first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit")
				end

				MOOD_BLACKBOARD.killer_in_the_shadows = false

				trigger_deus_potion_end_sound_event(unit, buff, params, world)
			end
		end
	end,
	apply_pockets_full_of_bombs_buff = function (unit, buff, params)
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local wielded_slot_name = inventory_extension:get_wielded_slot_name()
		local slot_data = inventory_extension:get_slot_data(wielded_slot_name)

		if wielded_slot_name == "slot_level_event" and slot_data then
			inventory_extension:drop_level_event_item(slot_data)
		end

		local pickup_settings = AllPickups.frag_grenade_t1
		local slot_name = pickup_settings.slot_name

		if wielded_slot_name ~= slot_name then
			local career_extension = ScriptUnit.extension(unit, "career_system")

			CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
			CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
			inventory_extension:wield(slot_name)
		end
	end,
	update_pockets_full_of_bombs_buff = function (unit, buff, params)
		if is_local(unit) then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local career_extension = ScriptUnit.extension(unit, "career_system")
			local pickup_settings = AllPickups.frag_grenade_t1
			local slot_name = pickup_settings.slot_name
			local item_name = pickup_settings.item_name
			local slot_data = inventory_extension:get_slot_data(slot_name)

			if not slot_data then
				local extra_extension_init_data = {}
				local item_data = ItemMasterList[item_name]

				inventory_extension:add_equipment(slot_name, item_data, nil, extra_extension_init_data)

				local go_id = Managers.state.unit_storage:go_id(unit)
				local slot_id = NetworkLookup.equipment_slots[slot_name]
				local item_id = NetworkLookup.item_names[item_name]
				local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

				if go_id then
					if is_server() then
						network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
					else
						network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
					end
				end

				local wielded_slot_name = inventory_extension:get_wielded_slot_name()

				if wielded_slot_name ~= slot_name then
					CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
					CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
					inventory_extension:wield(slot_name)
				end
			end
		end
	end,
	trigger_sound_event = function (unit, buff, params, world)
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, buff.template.sound_event_name)
	end,
	trigger_skulls_of_fury_sound_event = function (unit, buff, params, world)
		WwiseUtils.trigger_unit_event(world, buff.template.sound_event_name, unit, 0)
	end,
	apply_health_bar = function (unit, buff, params, world)
		local event_manager = Managers.state.event

		event_manager:trigger("tutorial_event_show_health_bar", unit, true)

		buff.unit = unit
	end,
	remove_health_bar = function (unit, buff, params, world)
		local event_manager = Managers.state.event

		event_manager:trigger("tutorial_event_remove_health_bar", unit)
	end,
	remove_deus_rally_flag = function (unit, buff, params, world)
		if is_server() then
			Managers.state.unit_spawner:mark_for_deletion(unit)
		end
	end,
	apply_make_pingable = function (unit, buff, params, world)
		if not ScriptUnit.has_extension(unit, "ping_system") then
			local extension = Managers.state.entity:system("ping_system"):on_add_extension(world, unit, "PingTargetExtension", {})

			extension:extensions_ready(world, unit)

			buff.ping_target_extension = extension
		end
	end,
	remove_make_pingable = function (unit, buff, params, world)
		if buff.ping_target_extension then
			local ping_system = Managers.state.entity:system("ping_system")

			ping_system:remove_ping_from_unit(unit)
			ScriptUnit.destroy_extension(unit, "ping_system")
			ping_system:on_remove_extension(unit, "PingTargetExtension")

			buff.ping_target_extension = nil
		end
	end,
	remove_deus_potion_buff = function (unit, buff, params, world)
		trigger_deus_potion_end_sound_event(unit, buff, params, world)
	end,
	update_attack_speed_per_cooldown = function (unit, buff, params)
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		if not player_unit then
			return
		end

		local template = buff.template
		local stat_buff = template.stat_buff
		local previous_multiplier = buff.previous_multiplier or 0
		local career_ext = ScriptUnit.extension(unit, "career_system")
		local current_cooldown = career_ext:current_ability_cooldown_percentage()
		local multiplier = current_cooldown * template.value
		buff.previous_multiplier = buff.multiplier or 0
		buff.multiplier = multiplier
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local difference = multiplier - previous_multiplier

		if difference ~= 0 then
			buff_extension:update_stat_buff(stat_buff, difference, buff.stat_buff_index)
		end
	end,
	force_use_active_ability = function (unit, buff, params)
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		if not player_unit then
			return
		end

		local career_extension = ScriptUnit.extension(unit, "career_system")
		local can_use = career_extension:can_use_activated_ability()

		if can_use then
			career_extension:force_trigger_active_ability()
		end
	end,
	apply_active_ability_for_coins = function (unit, buff, params)
		local career_extension = ScriptUnit.extension(unit, "career_system")

		if career_extension then
			career_extension:set_abilities_always_usable(true, "active_ability_for_coins")
		end
	end,
	remove_active_ability_for_coins = function (unit, buff, params)
		local career_extension = ScriptUnit.extension(unit, "career_system")

		if career_extension then
			career_extension:set_abilities_always_usable(false, "active_ability_for_coins")
		end
	end,
	apply_max_health_buff_for_ai = function (unit, buff, params)
		if is_server() then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				local base_health = health_extension.unmodified_max_health
				local health_increase = base_health * buff.multiplier
				buff.added_health = health_increase
				local max_health = health_extension:get_max_health()

				health_extension:set_max_health(max_health + health_increase)
			end
		end
	end,
	remove_max_health_buff_for_ai = function (unit, buff, params)
		if is_server() then
			local health_extension = ScriptUnit.has_extension(unit, "health_system")

			if health_extension then
				local max_health = health_extension:get_max_health()

				if buff.added_health < max_health then
					health_extension:set_max_health(max_health - buff.added_health)
				end
			end
		end
	end,
	deus_knockdown_damage_immunity_aura_func = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local template = buff.template
		local range = buff.range
		local range_squared = range * range
		local owner_position = POSITION_LOOKUP[owner_unit]
		local side = Managers.state.side.side_by_unit[owner_unit]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_units = #player_and_bot_units
		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")

		for i = 1, num_units do
			local unit = player_and_bot_units[i]

			if Unit.alive(unit) and unit ~= owner_unit then
				local status_extension = ScriptUnit.extension(unit, "status_system")
				local unit_position = POSITION_LOOKUP[unit]
				local distance_squared = Vector3.distance_squared(owner_position, unit_position)
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local knocked_down = status_extension:is_knocked_down()

				if range_squared < distance_squared or not knocked_down then
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						local buff_id = buff.server_id

						if buff_id then
							buff_system:remove_server_controlled_buff(unit, buff_id)
						end
					end
				end

				if distance_squared < range_squared and knocked_down and not buff_extension:has_buff_type(buff_to_add) then
					local server_buff_id = buff_system:add_buff(unit, buff_to_add, owner_unit, true)
					local buff = buff_extension:get_non_stacking_buff(buff_to_add)

					if buff then
						buff.server_id = server_buff_id
					end
				end
			end
		end
	end,
	on_extra_shot_buff_apply = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "hud_gameplay_stance_linesman_buff", unit, 0)
		end
	end,
	on_extra_shot_buff_remove = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_potion_morris_effect_end", unit, 0)
		end
	end,
	apply_second_wind = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_magic_shield_activate", unit, 0)
		end
	end,
	remove_second_wind = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_potion_morris_effect_end", unit, 0)
		end
	end,
	apply_active_ability_movement_buff = function (unit, buff, params, world)
		BuffFunctionTemplates.functions.apply_movement_buff(unit, buff, params, world)

		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "hud_gameplay_stance_ninjafencer_buff", unit, 0)
		end
	end,
	remove_active_ability_movement_buff = function (unit, buff, params, world)
		BuffFunctionTemplates.functions.remove_movement_buff(unit, buff, params, world)

		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_potion_morris_effect_end", unit, 0)
		end
	end,
	apply_ammo_reload_speed_buff = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "hud_gameplay_stance_linesman_buff", unit, 0)
		end
	end,
	remove_ammo_reload_speed_buff = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_potion_morris_effect_end", unit, 0)
		end
	end,
	apply_damage_reduction_on_incapacitated = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_magic_shield_activate", unit, 0)
		end
	end,
	remove_damage_reduction_on_incapacitated = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "Play_potion_morris_effect_end", unit, 0)
		end
	end,
	apply_parry_damage_immune = function (unit, buff, params, world)
		local local_unit = is_local(unit)

		if local_unit then
			WwiseUtils.trigger_unit_event(world, "magic_shield_activate_fast", unit, 0)
		end
	end,
	apply_always_blocking = function (unit, buff, params)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local send_to_server = not is_server()

		status_extension:set_override_blocking(true, send_to_server)
	end,
	remove_always_blocking = function (unit, buff, params)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local send_to_server = not is_server()

		status_extension:set_override_blocking(nil, send_to_server)
	end,
	deus_standing_still_damage_reduction_update = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local locomotion_extension = ScriptUnit.has_extension(owner_unit, "locomotion_system")

			if not locomotion_extension then
				return
			end

			local buff_system = Managers.state.entity:system("buff_system")
			local template = buff.template
			local buff_to_add = template.buff_to_add
			local current_velocity = locomotion_extension:current_velocity()
			local speed = Vector3.length(current_velocity)

			if speed < 0.5 and not buff.added_buff then
				buff.added_buff = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
			elseif speed > 0.5 and buff.added_buff then
				buff_system:remove_server_controlled_buff(owner_unit, buff.added_buff)

				buff.added_buff = nil
			end
		end
	end,
	melee_killing_spree_speed_counter_update = function (unit, buff, params)
		if buff.kills and buff.kills[1] and buff.kills[1] < params.t then
			table.remove(buff.kills, 1)
		end
	end,
	deus_cooldown_reg_not_hit_init = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		buff.buffs = {}
		local t = Managers.time:time("game")
		buff.next_buff_t = t + buff.template.interval
	end,
	deus_cooldown_reg_not_hit_update = function (unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local t = Managers.time:time("game")
		local template = buff.template

		if buff.reset then
			buff.next_buff_t = t + template.interval
			local buff_system = Managers.state.entity:system("buff_system")

			for i = 1, #buff.buffs do
				local id = buff.buffs[i]

				buff_system:remove_server_controlled_buff(unit, id)
			end

			buff.reset = false

			table.clear(buff.buffs)
		end

		if buff.next_buff_t < t and #buff.buffs < 5 then
			buff.next_buff_t = t + template.interval
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = template.buff_to_add
			local id = buff_system:add_buff(unit, buff_to_add, unit, true)
			buff.buffs[#buff.buffs + 1] = id
		end
	end,
	update_ledge_rescue = function (unit, buff, params)
		local time = Managers.time:time("main")

		if buff.rescue_timer and buff.rescue_timer < time then
			buff.rescue_timer = nil
			local template = buff.template
			local pull_up_duration = template.pull_up_duration
			buff.finish_pull_up_timer = time + pull_up_duration
			local revive_time_variable = Unit.animation_find_variable(unit, "revive_time")

			Unit.animation_set_variable(unit, revive_time_variable, pull_up_duration)
			Unit.animation_event(unit, "revive_start")

			if ScriptUnit.has_extension(unit, "first_person_system") then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:set_wanted_player_height("stand", time, pull_up_duration)
			end
		end

		if buff.finish_pull_up_timer and buff.finish_pull_up_timer < time then
			buff.finish_pull_up_timer = nil

			StatusUtils.set_pulled_up_network(unit, true, unit)
			Unit.animation_event(unit, "revive_complete")
		end
	end,
	update_disable_rescue = function (unit, buff, params)
		local time = Managers.time:time("main")

		if buff.rescue_timer and buff.rescue_timer < time then
			buff.rescue_timer = nil

			if not is_server() then
				return
			end

			if not ALIVE[unit] then
				return
			end

			local template = buff.template
			local world = Application.main_world()
			local hit_position = POSITION_LOOKUP[unit]
			local rotation = Quaternion.identity()
			local explosion_template = ExplosionTemplates[template.explosion_template]
			local career_extension = ScriptUnit.has_extension(unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			DamageUtils.create_explosion(world, unit, hit_position, rotation, explosion_template, 1, "buff", true, is_husk(unit), unit, career_power_level, false)
		end
	end,
	always_blocking_init = function (unit, buff, params)
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local equipment = inventory_extension:equipment()
		local melee = equipment.wielded and equipment.wielded.slot_type == "melee"
		local buff_name = buff.template.buff_to_add
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if melee then
			buff.buff_id = buff_extension:add_buff(buff_name)
		end
	end,
	always_blocking_update = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local locked_out = buff_extension and buff_extension:has_buff_type("deus_always_blocking_lock_out")

		if buff.locked_out and not locked_out then
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local equipment = inventory_extension:equipment()
			local melee = equipment.wielded and equipment.wielded.slot_type == "melee"
			local buff_name = buff.template.buff_to_add

			if melee then
				buff.buff_id = buff_extension:add_buff(buff_name)
			end

			buff.locked_out = nil
		elseif not buff.locked_out and locked_out then
			local buff_name = buff.template.buff_to_add
			local has_buff = buff_extension and buff_extension:has_buff_type(buff_name)

			if has_buff then
				buff_extension:remove_buff(buff.buff_id)
			end

			buff.locked_out = true
		end

		if not buff.locked_out and buff.swapped_weapons then
			local equipment = buff.equipment
			local melee = equipment.wielded and equipment.wielded.slot_type == "melee"
			local buff_name = buff.template.buff_to_add
			local has_buff = buff_extension and buff_extension:has_buff_type(buff_name)

			if melee then
				if not has_buff then
					buff.buff_id = buff_extension:add_buff(buff_name)
				end
			elseif has_buff then
				buff_extension:remove_buff(buff.buff_id)
			end

			buff.swapped_weapons = nil
		end
	end,
	apply_cursed_chest_init = function (unit, buff, params)
		local breed = Unit.get_data(unit, "breed")
		local effect_name = breed.boss and "fx/cursed_chest_spawn_02" or "fx/cursed_chest_spawn_01"
		local world = Application.main_world()
		local position = POSITION_LOOKUP[unit]

		World.create_particles(world, effect_name, position)
	end,
	money_magnet_start = function (unit, buff, params)
		if not is_local(unit) then
			return
		end

		buff.pickup_system = Managers.state.entity:system("pickup_system")
		buff.query_results = {}
		buff.interactor_extension = ScriptUnit.extension(unit, "interactor_system")
		buff.last_t = 0
	end,
	money_magnet_update = function (unit, buff, params)
		if not is_local(unit) then
			return
		end

		local t = Managers.time:time("game")
		local last_t = buff.last_t
		local update_every = buff.template.update_every
		local interactor_extension = buff.interactor_extension

		if interactor_extension:is_interacting() then
			return
		end

		if update_every < t - last_t then
			buff.last_t = t
			local pickup_system = buff.pickup_system
			local player_position = POSITION_LOOKUP[unit]
			local magnet_distance = buff.template.magnet_distance
			local query_results = buff.query_results

			table.clear(query_results)

			local num_pickups = pickup_system:get_pickups(player_position, magnet_distance, query_results)

			for i = 1, num_pickups do
				local pickup_unit = query_results[i]
				local pickup_extension = ScriptUnit.has_extension(pickup_unit, "pickup_system")

				if pickup_extension and pickup_extension.pickup_name == "deus_soft_currency" then
					local forced = true

					interactor_extension:start_interaction(false, pickup_unit, "pickup_object", forced)

					return
				end
			end
		end
	end,
	detect_weakness_unit_entered_range = function (unit, buffer_unit, buff, params, world)
		if not is_local(buffer_unit) then
			return
		end

		if buff.marked_enemy then
			local alive = AiUtils.unit_alive(buff.marked_enemy)

			if alive then
				return
			end
		end

		if buff.marked_enemy then
			buff.marked_enemy = nil
		end

		local breed = Unit.get_data(unit, "breed")
		local breed_name = breed.name
		local markable_enemies = buff.template.markable_enemies
		local time = Managers.time:time("main")
		local is_cooldown_over = time >= (buff.next_enemy_markable_at or 0)

		if markable_enemies[breed_name] and is_cooldown_over then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local mark_buff = buff.template.mark_buff
			buff.marked_enemy_buff_id = buff_extension:add_buff(mark_buff)
			buff.marked_enemy = unit
			buff.next_enemy_markable_at = time + buff.template.mark_cooldown
		end
	end,
	detect_weakness_unit_left_range = function (unit, user_data, buffer_unit, buff, params, world)
		if not is_local(buffer_unit) then
			return
		end

		local marked_enemy = buff.marked_enemy

		if marked_enemy == unit and AiUtils.unit_alive(marked_enemy) then
			local buff_extension = ScriptUnit.extension(unit, "buff_system")
			local marked_enemy_buff_id = buff.marked_enemy_buff_id

			buff_extension:remove_buff(marked_enemy_buff_id)
		end
	end,
	pyrotechnical_echo_update = function (unit, buff, params)
		local queued_explosions = buff.queued_explosions

		if queued_explosions then
			local time = Managers.time:time("main")

			for i = 1, #queued_explosions do
				local explosion_data = queued_explosions[i]
				local explosion_time = explosion_data.new_explosion_time

				if explosion_time < time then
					local world = Managers.world:world("level_world")
					local impact_data = explosion_data.impact_data
					local position = explosion_data.hit_position:unbox()
					local is_critical_strike = explosion_data.is_critical_strike
					local item_name = explosion_data.item_name
					local rotation = explosion_data.rotation:unbox()
					local scale = explosion_data.scale
					local power_level = explosion_data.power_level
					local owner_unit = unit
					local aoe_data = impact_data.aoe

					DamageUtils.create_explosion(world, owner_unit, position, rotation, aoe_data, scale, item_name, is_server(), is_husk(owner_unit), owner_unit, power_level, is_critical_strike, owner_unit)
					table.swap_delete(queued_explosions, i)

					return
				end
			end
		end
	end,
	blazing_revenge_clear_aoe = function (unit, buff, params)
		if not is_server() then
			return
		end

		local template = buff.template
		local sound_event = template.sound_end_event
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_event, unit)

		local aoe_unit = buff.parent_buff_shared_table.aoe_unit

		if aoe_unit and Unit.alive(aoe_unit) then
			Managers.state.unit_spawner:mark_for_deletion(aoe_unit)
		end
	end,
	wolfpack_apply = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		local buff_name = buff.template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local is_server_controlled = true

		buff_system:add_buff(unit, buff_name, unit, is_server_controlled)

		local units_in_range = {}
		buff.units_in_range = units_in_range

		buff_area_helper.setup_range_check(unit, buff, params, world)
	end,
	wolfpack_update = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		if buff_area_helper.update_range_check(unit, buff, params, world) then
			local units_in_range = buff.units_in_range
			local buff_name = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")

			for unit_in_range, buff_id in pairs(units_in_range) do
				local buff_extension = ScriptUnit.has_extension(unit_in_range, "buff_system")
				local has_buff = buff_extension and buff_extension:has_buff_type(buff_name)

				if buff_id == -1 then
					if has_buff then
						local is_server_controlled = true
						units_in_range[unit_in_range] = buff_system:add_buff(unit, buff_name, unit, is_server_controlled)
					end
				elseif not has_buff then
					buff_system:remove_server_controlled_buff(unit, buff_id)

					units_in_range[unit_in_range] = -1
				end
			end
		end
	end,
	wolfpack_remove = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		buff_area_helper.destroy_range_check(unit, buff, params, world)

		local units_in_range = buff.units_in_range
		local buff_system = Managers.state.entity:system("buff_system")

		for unit_in_range, buff_id in pairs(units_in_range) do
			if buff_id ~= -1 then
				buff_system:remove_server_controlled_buff(unit, buff_id)

				units_in_range[unit_in_range] = -1
			end
		end
	end,
	wolfpack_entered_range = function (unit, buffer_unit, buff, params, world)
		if not is_server() then
			return
		end

		if unit == buffer_unit then
			return
		end

		local units_in_range = buff.units_in_range

		if not units_in_range[unit] then
			units_in_range[unit] = -1
		end
	end,
	wolfpack_left_range = function (unit, user_data, buffer_unit, buff, params, world)
		if not is_server() then
			return
		end

		if unit == buffer_unit then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local buff_id = buff.units_in_range[unit]

		if buff_id and buff_id ~= -1 then
			buff_system:remove_server_controlled_buff(buffer_unit, buff_id)
		end

		buff.units_in_range[unit] = nil
	end,
	comradery_apply = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		local buff_name = buff.template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local is_server_controlled = true

		buff_system:add_buff(unit, buff_name, unit, is_server_controlled)

		local units_in_range = {}
		buff.units_in_range = units_in_range

		buff_area_helper.setup_range_check(unit, buff, params, world)
	end,
	comradery_update = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		buff_area_helper.update_range_check(unit, buff, params, world)
	end,
	comradery_remove = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		buff_area_helper.destroy_range_check(unit, buff, params, world)

		local units_in_range = buff.units_in_range
		local buff_system = Managers.state.entity:system("buff_system")

		for unit_in_range, buff_id in pairs(units_in_range) do
			buff_system:remove_server_controlled_buff(unit, buff_id)
		end
	end,
	comradery_entered_range = function (unit, buffer_unit, buff, params, world)
		if not is_server() then
			return
		end

		if unit == buffer_unit then
			return
		end

		local units_in_range = buff.units_in_range

		if not units_in_range[unit] then
			local buff_name = buff.template.buff_to_add
			local buff_system = Managers.state.entity:system("buff_system")
			local is_server_controlled = true
			units_in_range[unit] = buff_system:add_buff(buffer_unit, buff_name, buffer_unit, is_server_controlled)
		end
	end,
	comradery_left_range = function (unit, user_data, buffer_unit, buff, params, world)
		if not is_server() then
			return
		end

		if unit == buffer_unit then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")
		local units_in_range = buff.units_in_range
		local buff_id = units_in_range[unit]

		if buff_id then
			buff_system:remove_server_controlled_buff(buffer_unit, buff_id)
		end

		units_in_range[unit] = nil
	end,
	tenacious_update = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		if not buff.health_extension then
			buff.health_extension = ScriptUnit.has_extension(unit, "health_system")
		end

		local health_extension = buff.health_extension
		local template = buff.template
		local health_threshold = template.health_threshold
		local current_health_percentage = health_extension:current_health_percent()

		if health_threshold <= current_health_percentage then
			buff.next_update = nil

			return
		end

		local time = Managers.time:time("main")

		if not buff.next_update or buff.next_update < time then
			local health_per_tick = template.health_per_tick

			DamageUtils.heal_network(unit, unit, health_per_tick, "health_regen")

			buff.next_update = time + template.tick
		end
	end,
	hidden_escape_apply = function (unit, buff, params, world)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")

			status_extension:set_invisible(true, nil, "hidden_escape")
			status_extension:set_noclip(true, "hidden_escape")

			if not is_bot(unit) then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_enter_small")

				MOOD_BLACKBOARD.hidden_escape = true
			end
		end
	end,
	hidden_escape_remove = function (unit, buff, params, world)
		if is_local(unit) then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local removing_stealth = status_extension:set_invisible(false, nil, "hidden_escape")

			status_extension:set_noclip(false, "hidden_escape")

			local cooldown_buff = buff.template.cooldown_buff
			local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

			buff_extension:add_buff(cooldown_buff, {
				attacker_unit = unit
			})

			if not is_bot(unit) then
				if removing_stealth then
					local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

					first_person_extension:play_hud_sound_event("Play_career_ability_kerillian_shade_exit")
				end

				MOOD_BLACKBOARD.hidden_escape = false
			end
		end
	end,
	update_bad_breath = function (unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[unit] then
			return
		end

		local time = Managers.time:time("main")

		if buff.rescue_timer and buff.rescue_timer < time then
			buff.rescue_timer = nil
			local hit_position = nil
			local disabler = buff.disabler

			if disabler and ALIVE[disabler] then
				hit_position = Unit.local_position(disabler, 0)
			else
				hit_position = POSITION_LOOKUP[unit]
			end

			buff.disabler = nil
			local template = buff.template
			local rotation = Quaternion.identity()
			local explosion_template = template.explosion_template
			local career_extension = ScriptUnit.has_extension(unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()
			local area_damage_system = Managers.state.entity:system("area_damage_system")

			area_damage_system:create_explosion(unit, hit_position, rotation, explosion_template, 1, "buff", career_power_level, false)

			local buff_system = Managers.state.entity:system("buff_system")
			local cooldown_buff = template.cooldown_buff

			buff_system:add_buff(unit, cooldown_buff, unit)
		end
	end,
	update_boulder_bro = function (unit, buff, params)
		local template = buff.template
		local time = Managers.time:time("main")

		if buff.rescue_timer and buff.rescue_timer < time then
			buff.rescue_timer = nil
			local pull_up_duration = template.pull_up_duration
			buff.finish_pull_up_timer = time + pull_up_duration
			local revive_time_variable = Unit.animation_find_variable(unit, "revive_time")

			Unit.animation_set_variable(unit, revive_time_variable, pull_up_duration)
			Unit.animation_event(unit, "revive_start")

			if ScriptUnit.has_extension(unit, "first_person_system") then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")

				first_person_extension:set_wanted_player_height("stand", time, pull_up_duration)
			end
		end

		if buff.finish_pull_up_timer and buff.finish_pull_up_timer < time then
			buff.finish_pull_up_timer = nil

			StatusUtils.set_pulled_up_network(unit, true, unit)
			Unit.animation_event(unit, "revive_complete")

			local buff_extension = ScriptUnit.extension(unit, "buff_system")

			buff_extension:queue_remove_buff(buff.id)
		end
	end,
	boulder_bro_add_buff = function (unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[unit] then
			return
		end

		local template = buff.template
		local buff_to_add = template.buff_to_add
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:add_buff(buff_to_add)
	end,
	resolve_apply = function (unit, buff, params)
		local status_extension = ScriptUnit.extension(unit, "status_system")
		local template = buff.template
		local bonus = template.bonus
		status_extension.wounds = status_extension.wounds + bonus
	end,
	detect_weakness_link_unit = function (unit, buff, params, world)
		local template = buff.template
		local unit_name = template.unit_name
		local spawned_unit = Managers.state.unit_spawner:spawn_local_unit(unit_name, POSITION_LOOKUP[unit])

		Managers.state.unit_spawner:create_unit_extensions(Unit.world(spawned_unit), spawned_unit, "prop_unit")
		World.link_unit(Unit.world(unit), spawned_unit, 0, unit, Unit.node(unit, "root_point"))

		buff.linked_unit = spawned_unit
		local z_offset_config = template.z_offset
		local breed = Unit.get_data(unit, "breed")
		local breed_name = breed.name
		local z_offset = z_offset_config[breed_name] or z_offset_config.default

		Unit.set_local_position(spawned_unit, 0, Vector3(0, 0, z_offset))
	end,
	health_orb_apply_func = function (unit, buff, params, world)
		if not is_server() then
			return
		end

		local template = buff.template
		local granted_health = template.granted_health

		DamageUtils.heal_network(unit, unit, granted_health, "buff")
	end,
	start_static_charge = function (unit, buff, params, world)
		buff.next_tick_t = params.t + buff.template.tick_every_t
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)
		local power_level = 0
		local fx = nil

		if unit == local_player_unit then
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension.first_person_unit
			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01_1p", POSITION_LOOKUP[first_person_unit])

			World.link_particles(world, fx, first_person_unit, Unit.node(first_person_unit, "root_point"), Matrix4x4.identity(), "stop")
			WwiseWorld.trigger_event(wwise_world, "Play_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Play_wind_metal_gameplay_mutator_wind_loop", unit, 0)

			fx = World.create_particles(world, "fx/magic_wind_metal_blade_dance_01", POSITION_LOOKUP[unit])

			World.link_particles(world, fx, unit, Unit.node(unit, "root_point"), Matrix4x4.identity(), "stop")
		end

		buff.power_level = power_level
		buff.linked_effect = fx
	end,
	update_static_charge = function (unit, buff, params)
		if buff.next_tick_t <= params.t then
			buff.next_tick_t = params.t + buff.template.tick_every_t
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
			local rotation = Unit.local_rotation(unit, 0)
			local career_extension = ScriptUnit.has_extension(unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			area_damage_system:create_explosion(unit, position, rotation, buff.template.explosion_template, 1, "undefined", career_power_level, false)
		end
	end,
	remove_static_charge = function (unit, buff, params, world)
		local local_player = Managers.player:local_player()
		local local_player_unit = local_player and local_player.player_unit
		local wwise_world = Managers.world:wwise_world(world)

		if unit == local_player_unit then
			WwiseWorld.trigger_event(wwise_world, "Stop_wind_metal_gameplay_mutator_wind_loop")
		else
			WwiseUtils.trigger_unit_event(world, "Stop_wind_metal_gameplay_mutator_wind_loop", unit, 0)
		end

		local vfx = buff.linked_effect

		if vfx then
			World.destroy_particles(world, vfx)

			buff.linked_effect = nil
		end
	end,
	reduce_activated_ability_cooldown = function (unit, buff, params, world)
		if Unit.alive(unit) then
			local career_extension = ScriptUnit.has_extension(unit, "career_system")

			if career_extension then
				career_extension:reduce_activated_ability_cooldown(buff.template.bonus)
			end
		end
	end,
	always_blocking_remove = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if buff.buff_id then
			buff_extension:remove_buff(buff.buff_id)
		end
	end,
	resolve_update = function (unit, buff, params)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local full_heal_buff = template.full_heal_buff
		local after_revive_t = buff.after_revive_t
		local t = Managers.time:time("game")

		if after_revive_t and after_revive_t < t then
			if buff.full_heal_perk_buff_id then
				buff_extension:remove_buff(buff.full_heal_perk_buff_id)

				buff.full_heal_perk_buff_id = nil
			end

			buff.after_revive_t = nil
		end

		if not buff_extension:get_buff_type(cooldown_buff) and not buff_extension:get_buff_type(full_heal_buff) then
			buff.full_heal_perk_buff_id = buff_extension:add_buff(full_heal_buff)
		end
	end
}
dlc_settings.proc_functions = {
	stockpile_refresh_ammo_buffs = function (owner_unit, buff, params)
		local inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")

		if inventory_extension then
			local slot_data = inventory_extension:get_wielded_slot_data()
			local left_hand_unit = slot_data.left_unit_1p
			local right_hand_unit = slot_data.right_unit_1p
			local left_hand_ammo_extension = ScriptUnit.has_extension(left_hand_unit, "ammo_system")

			if left_hand_ammo_extension then
				left_hand_ammo_extension:refresh_buffs()
			end

			local right_hand_ammo_extension = ScriptUnit.has_extension(right_hand_unit, "ammo_system")

			if right_hand_ammo_extension then
				right_hand_ammo_extension:refresh_buffs()
			end
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:remove_buff(buff.id)
	end,
	stagger_aoe_on_hit = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local unit_hit = params[1]
		local template = buff.template
		local explosion_template = ExplosionTemplates[template.explosion_template]
		local world = Application.main_world()
		local hit_position = POSITION_LOOKUP[unit_hit]
		local rotation = Quaternion.identity()
		local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
		local career_power_level = career_extension:get_career_power_level()

		DamageUtils.create_explosion(world, owner_unit, hit_position, rotation, explosion_template, 1, "buff", is_server(), is_husk(owner_unit), owner_unit, career_power_level, false)
	end,
	remove_this_player_buff = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension then
				buff_extension:remove_buff(buff.id)
			end
		end
	end,
	armor_breaker_on_armored_kill = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local template = buff.template
		local killed_unit_name = params[2].name
		local was_killed_unit_armored = template.trigger_on_breed[killed_unit_name]

		if was_killed_unit_armored then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

			if buff_extension then
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, "armor_breaker", owner_unit)
			end
		end
	end,
	remove_mark_of_nurgle = function (owner_unit, buff, params)
		local world = Application.main_world()
		local vfx = buff.linked_effect

		if vfx then
			World.destroy_particles(world, vfx)

			buff.linked_effect = nil
		end

		local sound_id = buff.sound_id

		if sound_id then
			WwiseWorld.stop_event(buff.wwise_world, sound_id)

			buff.sound_id = nil
		end
	end,
	apply_mark_of_nurgle_dot = function (owner_unit, buff, params, world, param_order)
		local hit_unit = params[param_order.attacked_unit]
		local attacker_unit = params[param_order.attacker_unit]
		local damage_source = params[param_order.damage_source]

		if ALIVE[hit_unit] and damage_source ~= "dot_debuff" then
			local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")
			local params = {
				attacker_unit = attacker_unit
			}

			buff_extension:add_buff("curse_mark_of_nurgle_dot", params)
		end
	end,
	mark_of_nurgle_explosion = function (owner_unit, buff, params)
		local entity_system = Managers.state.entity
		local projectile_system = entity_system:system("projectile_system")

		if projectile_system then
			local template = buff.template
			local killed_unit = params[1]
			local position = POSITION_LOOKUP[killed_unit]
			local difficulty = Managers.state.difficulty:get_difficulty()
			local difficulty_index = table.index_of(DefaultDifficulties, difficulty)
			local aoe_init_damage_table = table.get_value_or_last(template.aoe_init_difficulty_damage, difficulty_index)
			local aoe_dot_damage_table = table.get_value_or_last(template.aoe_dot_difficulty_damage, difficulty_index)
			local extension_init_data = {
				area_damage_system = {
					area_damage_template = "globadier_area_dot_damage",
					invisible_unit = true,
					nav_tag_volume_layer = "bot_poison_wind",
					create_nav_tag_volume = true,
					damage_source = "poison_dot",
					player_screen_effect_name = "fx/screenspace_poison_globe_impact",
					area_ai_random_death_template = "area_poison_ai_random_death",
					dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
					explosion_template_name = "corrupted_flesh_explosion",
					extra_dot_effect_name = "fx/chr_gutter_death",
					damage_players = true,
					aoe_dot_damage = DamageUtils.calculate_damage(aoe_dot_damage_table),
					aoe_init_damage = DamageUtils.calculate_damage(aoe_init_damage_table),
					aoe_dot_damage_interval = template.aoe_dot_damage_interval,
					radius = template.radius,
					initial_radius = template.initial_radius,
					life_time = template.cloud_life_time,
					source_attacker_unit = killed_unit
				}
			}
			local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
			local aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "aoe_unit", extension_init_data, position)
			local unit_id = Managers.state.unit_storage:go_id(aoe_unit)

			Unit.set_unit_visibility(aoe_unit, false)

			if is_server() then
				Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, position)
			end
		end
	end,
	bloodthirst_on_kill = function (owner_unit, buff, params)
		buff.reset_timer()

		if ALIVE[owner_unit] then
			local template = buff.template
			local new_kill_count = buff.kill_count or 0
			new_kill_count = new_kill_count + 1

			if template.kills_needed <= new_kill_count then
				new_kill_count = 0
				local buff_name_to_add = template.buff_name_to_add
				local max_stacks = BuffUtils.get_max_stacks(buff_name_to_add)
				local can_stack = max_stacks > #buff.stacked_buffs
				local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

				if buff_extension and can_stack then
					local buff_id = buff_extension:add_buff(buff_name_to_add)

					table.insert(buff.stacked_buffs, buff_id)
				end
			end

			buff.kill_count = new_kill_count
		end
	end,
	headhunter_on_damage_dealt = function (owner_unit, buff, params, world, param_order)
		if not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
		local hit_zone_name = params[param_order.hit_zone_name]
		local template = buff.template
		local valid_hit_zone = template.valid_hit_zones[hit_zone_name]
		local ignored_hit_zone = template.ignore_hit_zones[hit_zone_name]

		if valid_hit_zone then
			local buff_name_to_add = template.buff_name_to_add
			local max_stacks = BuffUtils.get_max_stacks(buff_name_to_add)
			local can_stack = max_stacks > #buff.stacked_buffs

			if buff_extension and can_stack then
				local buff_id = buff_extension:add_buff(buff_name_to_add)

				table.insert(buff.stacked_buffs, buff_id)
			end
		elseif not ignored_hit_zone and buff_extension then
			for i = 1, template.remove_amount do
				local last_buff_id = buff.stacked_buffs[#buff.stacked_buffs]

				buff_extension:remove_buff(last_buff_id)

				buff.stacked_buffs[#buff.stacked_buffs] = nil
			end
		end
	end,
	vampiric_heal = function (owner_unit, buff, params, world, param_order)
		if ALIVE[owner_unit] and is_server() then
			local buff_template = buff.template
			local difficulty_multiplier = buff_template.difficulty_multiplier
			local difficulty_name = Managers.state.difficulty:get_difficulty()
			local multiplier = difficulty_multiplier[difficulty_name] or table.values(difficulty_multiplier)[1]
			local damage = params[param_order.damage_amount]
			local heal_amount = damage * multiplier

			DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "health_regen")
		end
	end,
	friendly_murder = function (owner_unit, buff, params, world, param_order)
		if ALIVE[owner_unit] and is_server() then
			local healer_position = POSITION_LOOKUP[owner_unit]
			local range = buff.range
			local range_squared = range * range
			local side = Managers.state.side.side_by_unit[owner_unit]
			local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
			local buff_template = buff.template
			local difficulty_multiplier = buff_template.difficulty_multiplier
			local difficulty_name = Managers.state.difficulty:get_difficulty()
			local multiplier = difficulty_multiplier[difficulty_name] or table.values(difficulty_multiplier)[1]
			local damage = params[param_order.damage_amount]
			local heal_amount = damage * multiplier

			for i = 1, #player_and_bot_units do
				local healed_unit = player_and_bot_units[i]

				if healed_unit ~= owner_unit and Unit.alive(healed_unit) then
					local unit_position = POSITION_LOOKUP[healed_unit]
					local distance_squared = Vector3.distance_squared(healer_position, unit_position)

					if distance_squared < range_squared then
						DamageUtils.heal_network(healed_unit, owner_unit, heal_amount, "health_regen")
					end
				end
			end
		end
	end,
	curse_khorne_champions_leader_death = function (owner_unit, buff, params)
		return true
	end,
	spawn_greed_pinata = function (owner_unit, buff, params)
		if not is_server() then
			return true
		end

		local spawner_unit = params[1]
		local spawn_pos = POSITION_LOOKUP[spawner_unit]
		local optional_data = nil

		Managers.state.conflict:spawn_queued_unit(Breeds.chaos_greed_pinata, Vector3Box(spawn_pos), QuaternionBox(Quaternion.identity()), "mutator", "spawn_idle", "terror_event", optional_data)

		return true
	end,
	curse_greed_pinata_death = function (owner_unit, buff, params)
		local health_extension = buff.health_extension

		if health_extension then
			while buff.drops_done < buff.template.total_drops do
				local last_attacker_id = health_extension.last_damage_data.attacker_unit_id

				greed_pinata_drop_pickup(buff.template.drop_table, POSITION_LOOKUP[params[1]], last_attacker_id)

				buff.drops_done = buff.drops_done + 1
			end
		end

		return true
	end,
	remove_objective_unit = function (owner_unit, buff, params)
		if buff.objective_unit then
			World.unlink_unit(Unit.world(buff.objective_unit), buff.objective_unit)
			Managers.state.unit_spawner:mark_for_deletion(buff.objective_unit)

			buff.objective_unit = nil
		end
	end,
	all_potions_heal_func = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local heal_amount = buff.bonus
			local heal_type = "healing_draught"

			if is_server() then
				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, heal_type)
			else
				local network_manager = Managers.state.network
				local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
				local heal_type_id = NetworkLookup.heal_types[heal_type]

				network_manager.network_transmit:send_rpc_server("rpc_request_heal", owner_unit_id, heal_amount, heal_type_id)
			end
		end
	end,
	remove_health_bar = function (owner_unit, buff, params)
		local event_manager = Managers.state.event

		event_manager:trigger("tutorial_event_remove_health_bar", buff.unit)
	end,
	trigger_dialogue_event = function (owner_unit, buff, params)
		local event = buff.template.dialogue_event
		local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_dialogue_event(event, event_data)
	end,
	add_buff_on_pickup = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local pickup_settings = params[2]
			local pickup_specific_settings = find_pickup_buff_settings(buff, pickup_settings)

			if pickup_specific_settings then
				if buff.template.local_only then
					local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

					for i = 1, #pickup_specific_settings do
						buff_extension:add_buff(pickup_specific_settings[i])
					end
				else
					local buff_system = Managers.state.entity:system("buff_system")

					for i = 1, #pickup_specific_settings do
						buff_system:add_buff(owner_unit, pickup_specific_settings[i], owner_unit, false)
					end
				end
			end
		end
	end,
	heal_on_pickup = function (owner_unit, buff, params, world)
		if ALIVE[owner_unit] then
			local pickup_settings = params[2]
			local pickup_specific_settings = find_pickup_buff_settings(buff, pickup_settings)
			local unit_template_name = pickup_settings.unit_template_name
			local limited_owned_pickup_unit = unit_template_name and unit_template_name == "limited_owned_pickup_unit"

			if pickup_specific_settings and not limited_owned_pickup_unit then
				heal_target(owner_unit, pickup_specific_settings.type, pickup_specific_settings.amount)

				local sound_event = buff.template.sound_event
				local local_unit = is_local(owner_unit)

				if not local_unit then
					local sound_event_id = NetworkLookup.sound_events[sound_event]
					local owning_player = Managers.player:owner(owner_unit)
					local peer_id = owning_player:network_id()

					Managers.state.network.network_transmit:send_rpc("rpc_play_2d_audio_event", peer_id, sound_event_id)
				else
					local wwise_world = Managers.world:wwise_world(world)

					WwiseWorld.trigger_event(wwise_world, sound_event)
				end
			end
		end
	end,
	ally_gain_ammo_on_pickup = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local pickup_settings = params[2]
			local pickup_specific_settings = find_pickup_buff_settings(buff, pickup_settings)

			if pickup_specific_settings then
				local ammo_bonus_fraction = pickup_specific_settings.ammo_bonus_fraction
				local range = pickup_specific_settings.max_range
				local range_sq = range * range
				local player_pos = POSITION_LOOKUP[owner_unit]
				local side = Managers.state.side.side_by_unit[owner_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local ammo_system = Managers.state.entity:system("ammo_system")

				for i = 1, #player_and_bot_units do
					local ally_unit = player_and_bot_units[i]

					if ALIVE[ally_unit] and ally_unit ~= owner_unit and Vector3.distance_squared(player_pos, POSITION_LOOKUP[ally_unit]) <= range_sq then
						ammo_system:give_ammo_fraction_to_owner(ally_unit, ammo_bonus_fraction, true)
					end
				end
			end
		end
	end,
	add_buff_on_ally_revived = function (owner_unit, buff, params)
		local revived_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[revived_unit] and is_server() then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = buff.template.buff_to_add

			if buff_to_add then
				for i = 1, #buff_to_add do
					local current_buff = buff_to_add[i]

					buff_system:add_buff(owner_unit, current_buff, owner_unit, false)
				end
			end

			local buff_to_add_revived = buff.template.buff_to_add_revived

			if buff_to_add_revived then
				for i = 1, #buff_to_add_revived do
					local current_buff = buff_to_add_revived[i]

					buff_system:add_buff(revived_unit, current_buff, owner_unit, false)
				end
			end
		end
	end,
	chain_lightning = function (owner_unit, buff, params, world, param_order)
		local hit_unit = params[param_order.attacked_unit]
		local first_hit = params[param_order.first_hit]
		local is_critical_strike = params[param_order.is_critical_strike]

		if ALIVE[owner_unit] and ALIVE[hit_unit] and first_hit and is_critical_strike then
			local hit_pos = POSITION_LOOKUP[hit_unit]
			local template = buff.template
			local damage_source = template.damage_source
			local audio_system = Managers.state.entity:system("audio_system")
			local sound_event = template.sound_event
			local damage_type = "damage_over_time"
			local damage_dealt = params[2]
			local damage = damage_dealt

			DamageUtils.add_damage_network(hit_unit, owner_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)

			local beam_effect = NetworkLookup.effects["fx/cw_chain_lightning"]
			local start_point = POSITION_LOOKUP[owner_unit] + 0.5 * Vector3.up()
			local end_point = nil
			local spine_node = Unit.has_node(hit_unit, "j_spine") and Unit.node(hit_unit, "j_spine")

			if spine_node then
				end_point = Unit.world_position(hit_unit, spine_node)
			else
				end_point = POSITION_LOOKUP[hit_unit] + 0.5 * Vector3.up()
			end

			local distance_flat = Vector3.distance(end_point, start_point)
			local distance = Vector3(1, distance_flat, 0)
			local rotation = Quaternion.look(end_point - start_point)

			Managers.state.network:rpc_play_particle_effect_with_variable(nil, beam_effect, start_point, rotation, "distance", distance)

			local radius = template.max_chain_range
			local num_chain = template.max_targets - 1
			local nearby_enemy_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.enemy_broadphase
			local hit_units = {}

			for i = 1, num_chain do
				local num_enemies = Broadphase.query(broadphase, hit_pos, radius, nearby_enemy_units)

				table.sort(nearby_enemy_units, function (a, b)
					return Vector3.distance_squared(POSITION_LOOKUP[a], hit_pos) < Vector3.distance_squared(POSITION_LOOKUP[b], hit_pos)
				end)

				for target_id = 1, num_enemies do
					local target_unit = nearby_enemy_units[target_id]

					if ALIVE[target_unit] and not hit_units[target_unit] and AiUtils.unit_alive(target_unit) and target_unit ~= hit_unit then
						hit_units[target_unit] = true

						DamageUtils.add_damage_network(target_unit, owner_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)
						audio_system:play_audio_unit_event(sound_event, target_unit)

						start_point = end_point
						spine_node = Unit.has_node(target_unit, "j_spine") and Unit.node(target_unit, "j_spine")

						if spine_node then
							end_point = Unit.world_position(target_unit, spine_node)
						else
							end_point = POSITION_LOOKUP[target_unit] + 0.5 * Vector3.up()
						end

						distance_flat = Vector3.distance(end_point, start_point)
						local next_distance = Vector3(1, distance_flat, 0)
						local next_rotation = Quaternion.look(end_point - start_point)

						Managers.state.network:rpc_play_particle_effect_with_variable(nil, beam_effect, start_point, next_rotation, "distance", next_distance)

						hit_pos = POSITION_LOOKUP[target_unit]

						break
					end
				end
			end
		end
	end,
	cooldown_on_friendly_ability = function (owner_unit, buff, params)
		local triggering_unit = params[1]

		if owner_unit == triggering_unit then
			return
		end

		local local_unit_pos = POSITION_LOOKUP[owner_unit]
		local triggering_unit_pos = POSITION_LOOKUP[triggering_unit]

		if local_unit_pos and triggering_unit_pos then
			local range = buff.template.range
			local distance_limit_sq = range * range

			if Vector3.distance_squared(local_unit_pos, triggering_unit_pos) <= distance_limit_sq then
				local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

				if career_extension then
					local multiplier = buff.template.value

					career_extension:reduce_activated_ability_cooldown_percent(multiplier)
				end
			end
		end
	end,
	skill_on_special_kill = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

			if career_extension then
				local multiplier = buff.template.percent_restored

				career_extension:reduce_activated_ability_cooldown_percent(multiplier)
			end
		end
	end,
	add_buff_on_proc = function (owner_unit, buff, params)
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_to_add = buff.template.buff_to_add

		buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
	end,
	add_buff_on_melee_kills_proc = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local buff_to_add = buff.template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local server_buff_id = buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff = buff_extension:get_non_stacking_buff(buff_to_add)

		if buff then
			buff.server_id = server_buff_id
		end
	end,
	add_buff_on_non_friendly_damage_taken = function (owner_unit, buff, params)
		local attacker_unit = params[1]
		local owner_side = Managers.state.side.side_by_unit[owner_unit]
		local attacker_side = Managers.state.side.side_by_unit[attacker_unit]
		local can_trigger = owner_unit == attacker_unit or owner_side and attacker_side and owner_side ~= attacker_side or not attacker_side

		if can_trigger then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = buff.template.buff_to_add

			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
		end
	end,
	deus_damage_reduction_on_incapacitated = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")
			local is_disabled = status_extension:is_disabled()

			if is_disabled then
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = buff.template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	drop_item_on_ability_use = function (owner_unit, buff, params)
		local inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")
		local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

		if not buff_extension or buff_extension:has_buff_type("drop_item_on_ability_use_cooldown") then
			return
		end

		if inventory_extension then
			local items = {}
			local item_slots = {
				"slot_healthkit",
				"slot_potion",
				"slot_grenade"
			}

			for _, slot_name in pairs(item_slots) do
				local item_data = inventory_extension:get_item_data(slot_name)

				if item_data then
					local item_template = BackendUtils.get_item_template(item_data)
					local pickup_data = item_template.pickup_data
					items[#items + 1] = pickup_data
					local additional_items = inventory_extension:get_additional_items(slot_name)

					if additional_items then
						for _, additional_item_data in pairs(additional_items) do
							local additional_item_template = BackendUtils.get_item_template(additional_item_data)
							local additional_pickup_data = additional_item_template.pickup_data
							local additional_item = additional_pickup_data
							items[#items + 1] = additional_item
						end
					end
				end
			end

			if #items > 0 then
				local rand = math.random(1, #items)
				local pickup_data = items[rand]
				local drop_position = POSITION_LOOKUP[owner_unit]
				local random_vector = Vector3(math.random(-1, 1), math.random(-1, 1), 2)
				local random_direction = Vector3.normalize(random_vector)
				local position = drop_position + random_vector * 0.2

				if NetworkUtils.network_safe_position(position) then
					local random_angle = math.random(-math.half_pi, math.half_pi) / 2
					local rotation = Quaternion.axis_angle(random_direction, random_angle)
					local pickup_name = pickup_data.pickup_name
					local settings = AllPickups[pickup_name]
					local slot_name = settings.slot_name
					local audio_system = Managers.state.entity:system("audio_system")
					local sound_event = nil

					if slot_name == "slot_healtkit" then
						sound_event = "morris_power_ups_clone_medkit"
					elseif slot_name == "slot_grenade" then
						sound_event = "morris_power_ups_clone_grenade"
					elseif slot_name == "slot_potion" then
						sound_event = "morris_power_ups_clone_potion"
					end

					audio_system:play_audio_position_event(sound_event, position)

					local pickup_spawn_type = "dropped"
					local network_manager = Managers.state.network

					if is_server() then
						local pickup_system = Managers.state.entity:system("pickup_system")

						pickup_system:spawn_pickup(pickup_name, position, rotation, true, pickup_spawn_type)
					else
						local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
						local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]

						network_manager.network_transmit:send_rpc_server("rpc_spawn_pickup_with_physics", pickup_name_id, position, rotation, pickup_spawn_type_id)
					end

					local buff_system = Managers.state.entity:system("buff_system")
					local buff_to_add = buff.template.cooldown_buff
					local cooldown_durations = buff.template.cooldown_durations

					buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)

					local buff = buff_extension:get_non_stacking_buff("drop_item_on_ability_use_cooldown")
					buff.duration = cooldown_durations[pickup_name] or 60
				end
			end
		end
	end,
	apply_held_potion_effect = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")

		if not inventory_extension then
			return
		end

		local slot_name = "slot_potion"
		local item_data = inventory_extension:get_item_data(slot_name)

		if not item_data then
			return
		end

		local item_template = BackendUtils.get_item_template(item_data)
		local potion_buffs = {
			item_template.actions.action_one.default.buff_template
		}
		local additional_items = inventory_extension:get_additional_items(slot_name)

		if additional_items then
			for _, additional_item_data in pairs(additional_items) do
				local additional_item_template = BackendUtils.get_item_template(additional_item_data)
				local additional_potion_buff = additional_item_template.actions.action_one.default.buff_template
				potion_buffs[#potion_buffs + 1] = additional_potion_buff
			end
		end

		if #potion_buffs > 0 then
			local random_buff = potion_buffs[math.random(#potion_buffs)]
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, random_buff, owner_unit, false)
		end
	end,
	block_procs_parry = function (owner_unit, buff, params)
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local attacking_unit = params[1]
		local fatigue_type = params[2]
		local blocking_weapon_unit = params[3]

		buff_extension:trigger_procs("on_timed_block", attacking_unit, fatigue_type, blocking_weapon_unit)
	end,
	active_ability_for_coins = function (owner_unit, buff, params)
		local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")

		if career_extension then
			local bar_val = career_extension:current_ability_cooldown_percentage()
			local cost = math.floor(bar_val * 100)

			print("Remove Coins:", cost)
		end
	end,
	on_push_explosion = function (owner_unit, buff, params)
		local buff_template = buff.template
		local hit_unit = params[1]

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = Vector3.lerp(POSITION_LOOKUP[owner_unit], POSITION_LOOKUP[hit_unit], 0.5)
			local damage_source = "buff"
			local explosion_template = buff_template.explosion_template
			local rotation = Quaternion.identity()
			local career_power_level = career_extension:get_career_power_level() * buff_template.power_scale
			local scale = 1
			local is_critical_strike = false

			area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, damage_source, career_power_level, is_critical_strike)
		end
	end,
	elites_on_kill_explosion = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local buff_template = buff.template
		local hit_unit = params[3]
		local health_extension = ScriptUnit.has_extension(hit_unit, "health_system")

		if health_extension then
			local damage_source = health_extension:recent_damage_source()
			local damage_type = health_extension:recently_damaged()

			if damage_source == "buff" and damage_type == "grenade" then
				return
			end
		end

		if ALIVE[owner_unit] and ALIVE[hit_unit] then
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[hit_unit]
			local damage_source = "buff"
			local explosion_template = buff_template.explosion_template
			local rotation = Quaternion.identity()
			local career_power_level = career_extension:get_career_power_level() * buff_template.power_scale
			local scale = 1
			local is_critical_strike = false

			area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, damage_source, career_power_level, is_critical_strike)

			local audio_system = Managers.state.entity:system("audio_system")
			local sound_event = buff_template.sound_event

			audio_system:play_audio_unit_event(sound_event, hit_unit)
		end

		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:remove_server_controlled_buff(owner_unit, buff.server_id)
	end,
	heal_on_dot_damage_dealt = function (owner_unit, buff, params)
		local heal_type = "health_regen"
		local heal_amount = buff.template.value

		DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, heal_type)
	end,
	deus_collateral_damage_on_melee_killing_blow_func = function (owner_unit, buff, params, world)
		local template = buff.template
		local killed_unit = params[3]
		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		if ALIVE[owner_unit] and ALIVE[killed_unit] then
			local hit_pos = POSITION_LOOKUP[killed_unit]
			local damage_source = killing_blow_data[DamageDataIndex.DAMAGE_SOURCE_NAME]

			if not damage_source then
				return
			end

			local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

			if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
				return
			end

			local damage_type = killing_blow_data[DamageDataIndex.DAMAGE_TYPE]
			local damage = killing_blow_data[DamageDataIndex.DAMAGE_AMOUNT]
			local radius = template.max_range
			local nearby_enemy_units = FrameTable.alloc_table()
			local proximity_extension = Managers.state.entity:system("proximity_system")
			local broadphase = proximity_extension.enemy_broadphase
			local hit_units = {}

			for i = 1, 1 do
				local num_enemies = Broadphase.query(broadphase, hit_pos, radius, nearby_enemy_units)

				table.sort(nearby_enemy_units, function (a, b)
					return Vector3.distance_squared(POSITION_LOOKUP[a], hit_pos) < Vector3.distance_squared(POSITION_LOOKUP[b], hit_pos)
				end)

				for target_id = 1, num_enemies do
					local target_unit = nearby_enemy_units[target_id]

					if ALIVE[target_unit] and not hit_units[target_unit] and AiUtils.unit_alive(target_unit) then
						hit_units[target_unit] = true

						DamageUtils.add_damage_network(target_unit, owner_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)

						local audio_system = Managers.state.entity:system("audio_system")
						local sound_event = template.sound_event

						audio_system:play_audio_unit_event(sound_event, target_unit)

						hit_pos = POSITION_LOOKUP[target_unit]

						break
					end
				end
			end
		end
	end,
	deus_special_farm_max_health_on_special = function (owner_unit, buff, params, world)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local killed_specials = buff.killed_specials
			killed_specials = killed_specials or 0
			killed_specials = killed_specials + 1
			local template = buff.template
			local specials_to_kill = template.specials_per_pop

			if specials_to_kill <= killed_specials then
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, true)

				killed_specials = 0
			end

			buff.killed_specials = killed_specials
		end
	end,
	deus_transmute_into_coins = function (owner_unit, buff, params, world)
		if is_server() then
			local attack_type = params[2]
			local hit_zone = params[3]

			if attack_type == "heavy_attack" and hit_zone == "head" then
				local rand = math.random(1, 10)

				if rand == 1 then
					local hit_unit = params[1]
					local drop_position = POSITION_LOOKUP[hit_unit]
					local random_vector = Vector3(math.random(-1, 1), math.random(-1, 1), 2)
					local random_direction = Vector3.normalize(random_vector)
					local position = drop_position + random_vector * 0.2

					if NetworkUtils.network_safe_position(position) then
						local random_angle = math.random(-math.half_pi, math.half_pi) / 2
						local rotation = Quaternion.axis_angle(random_direction, random_angle)
						local pickup_name = "deus_soft_currency"
						local pickup_spawn_type = "dropped"
						local pickup_system = Managers.state.entity:system("pickup_system")

						pickup_system:spawn_pickup(pickup_name, position, rotation, true, pickup_spawn_type)

						local attacker = owner_unit
						local damage_source = "buff"
						local explosion_template_name = "generic_mutator_explosion"
						local explosion_template = ExplosionTemplates[explosion_template_name]

						DamageUtils.create_explosion(world, attacker, position, Quaternion.identity(), explosion_template, 1, damage_source, is_server(), false, hit_unit, 0, false)

						local audio_system = Managers.state.entity:system("audio_system")
						local sound_event = buff.template.sound_event

						audio_system:play_audio_unit_event(sound_event, hit_unit)

						local attacker_unit_id = Managers.state.unit_storage:go_id(attacker)
						local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
						local damage_source_id = NetworkLookup.damage_sources[damage_source]

						Managers.state.network.network_transmit:send_rpc_clients("rpc_create_explosion", attacker_unit_id, false, position, Quaternion.identity(), explosion_template_id, 1, damage_source_id, 0, false, attacker_unit_id)

						local blackboard = BLACKBOARDS[hit_unit]

						Managers.state.conflict:destroy_unit(hit_unit, blackboard, "buff")
					end
				end
			end
		end
	end,
	always_blocking_weapon_swap = function (owner_unit, buff, params, world)
		buff.equipment = params[1]
		buff.swapped_weapons = true
	end,
	always_blocking_temporarily_remove = function (owner_unit, buff, params, world)
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_name = "deus_always_blocking_lock_out"

		buff_extension:add_buff(buff_name)
	end,
	deus_reckless_swings_buff_on_hit = function (owner_unit, buff, params, world)
		if is_server() then
			local target_num = params[4]
			local attack_type = params[2] == "light_attack" or params[2] == "heavy_attack"

			if target_num <= 1 and attack_type then
				local template = buff.template
				local damage_to_deal = template.damage_to_deal

				if template.is_non_lethal then
					local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")

					if health_extension then
						local current_health = health_extension:current_health()
						damage_to_deal = math.clamp(damage_to_deal, 0, math.max(current_health - 0.25, 0))
						damage_to_deal = DamageUtils.networkify_damage(damage_to_deal)
					else
						damage_to_deal = 0
					end
				end

				if damage_to_deal > 0 then
					DamageUtils.add_damage_network(owner_unit, owner_unit, damage_to_deal, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, owner_unit)
				end
			end
		end
	end,
	deus_big_swing_stagger_on_hit = function (owner_unit, buff, params, world)
		if ALIVE[owner_unit] then
			local target_num = params[4]
			local template = buff.template
			local targets_to_hit = template.targets_to_hit
			local attack_type = params[2] == "light_attack" or params[2] == "heavy_attack"

			if targets_to_hit <= target_num and attack_type then
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local buff_to_add = template.buff_to_add

				buff_extension:add_buff(buff_to_add)
			end
		end
	end,
	deus_push_charge = function (owner_unit, buff, params, world)
		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			if status_extension.do_lunge then
				return
			end

			local template = buff.template
			local lunge_settings = template.lunge_settings
			local sound_event = template.sound_event

			WwiseUtils.trigger_unit_event(world, sound_event, owner_unit, 0)

			status_extension.do_lunge = {
				animation_end_event = "dodge_bwd",
				allow_rotation = false,
				first_person_animation_end_event = "dodge_bwd",
				first_person_hit_animation_event = "charge_react",
				dodge = true,
				first_person_animation_event = "dodge_bwd",
				first_person_animation_end_event_hit = "dodge_bwd",
				noclip = true,
				animation_event = "dodge_bwd",
				initial_speed = lunge_settings.initial_speed,
				falloff_to_speed = lunge_settings.falloff_to_speed,
				duration = lunge_settings.duration
			}
		end
	end,
	deus_target_full_health_damage_mult = function (owner_unit, buff, params, world, param_order)
		local attacked_unit = params[param_order.attacked_unit]

		if ALIVE[owner_unit] and ALIVE[attacked_unit] then
			local buff_template = buff.template
			local attack_type = params[param_order.buff_attack_type]
			local valid_attack_types = buff_template.valid_attack_types

			if valid_attack_types and valid_attack_types[attack_type] then
				local proc_mod_table = params[param_order.PROC_MODIFIABLE]
				local target_health_extension = ScriptUnit.has_extension(attacked_unit, "health_system")

				if target_health_extension and target_health_extension:current_health_percent() >= 1 then
					proc_mod_table.damage_amount = proc_mod_table.damage_amount * buff_template.damage_mult
				end
			end
		end
	end,
	deus_damage_source_damage_mult = function (owner_unit, buff, params, world, param_order)
		local attacked_unit = params[param_order.attacked_unit]

		if ALIVE[owner_unit] and ALIVE[attacked_unit] then
			local buff_tempalte = buff.template
			local damage_source = params[param_order.damage_source]
			local valid_damage_sources = buff_tempalte.valid_damage_sources

			if valid_damage_sources and valid_damage_sources[damage_source] then
				local proc_mod_table = params[param_order.PROC_MODIFIABLE]
				proc_mod_table.damage_amount = proc_mod_table.damage_amount * buff_tempalte.damage_mult
			end
		end
	end,
	triple_melee_headshot_power_counter = function (owner_unit, buff, params, world)
		local hit_zone = params[3]
		local attack_type = params[2]

		if attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		if hit_zone == "head" then
			buff.stacks = buff.stacks and buff.stacks + 1 or 1

			if buff.template.hits <= buff.stacks then
				local buff_system = Managers.state.entity:system("buff_system")
				local buff_to_add = buff.template.buff_to_add

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)

				buff.stacks = 0
			end
		else
			buff.stacks = 0
		end
	end,
	melee_killing_spree_speed_counter = function (owner_unit, buff, params, world)
		local is_local_unit = is_local(owner_unit)

		if not is_local_unit then
			return
		end

		local killing_blow_data = params[1]

		if not killing_blow_data then
			return
		end

		local attack_type = killing_blow_data[DamageDataIndex.ATTACK_TYPE]

		if not attack_type or attack_type ~= "light_attack" and attack_type ~= "heavy_attack" then
			return
		end

		local t = Managers.time:time("game")
		buff.kills = buff.kills or {}
		buff.kills[#buff.kills + 1] = t + buff.template.time

		if buff.template.kills <= #buff.kills then
			local buff_system = Managers.state.entity:system("buff_system")
			local buff_to_add = buff.template.buff_to_add

			buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)

			local sound_event = "hud_gameplay_stance_smiter_buff"
			local sound_event_two = "Play_potion_morris_effect_end"

			WwiseUtils.trigger_unit_event(world, sound_event, owner_unit, 0)
			WwiseUtils.trigger_unit_event(world, sound_event_two, owner_unit, 0)

			buff.kills = {}
		end
	end,
	transfer_temp_health_at_full = function (owner_unit, buff, params, world)
		local heal_type = params[3]
		local healer_unit = params[1]
		local self_heal = healer_unit == owner_unit
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		if self_heal and not status_extension:is_permanent_heal(heal_type) then
			local health_extension = ScriptUnit.extension(owner_unit, "health_system")
			local current_health = health_extension:current_health_percent()

			if current_health == 1 then
				local heal_amount = params[2]
				local hero_side = Managers.state.side:get_side_from_name("heroes")
				local player_units = hero_side.PLAYER_UNITS
				local chosen_target_unit = nil
				local chosen_target_unit_range = math.huge
				local local_player_position = POSITION_LOOKUP[owner_unit]
				local range = buff.template.range

				for i = 1, #player_units do
					local unit = player_units[i]

					if unit ~= owner_unit then
						local unit_health_extension = ScriptUnit.has_extension(unit, "health_system")
						local unit_current_health = unit_health_extension and unit_health_extension:current_health_percent()

						if unit_current_health and unit_current_health < 1 then
							local unit_position = POSITION_LOOKUP[unit]
							local distance_sq = Vector3.distance_squared(local_player_position, unit_position)

							if distance_sq < range * range and distance_sq < chosen_target_unit_range then
								chosen_target_unit = unit
								chosen_target_unit_range = range
							end
						end
					end
				end

				if chosen_target_unit then
					DamageUtils.heal_network(chosen_target_unit, owner_unit, heal_amount, "heal_from_proc")
				end
			end
		end
	end,
	last_player_standing_knocked_down_check = function (owner_unit, buff, params)
		local local_health_extension = ScriptUnit.has_extension(owner_unit, "health_system")
		local local_status_extension = ScriptUnit.extension(owner_unit, "status_system")
		local player_eligible = ALIVE[owner_unit] and local_health_extension:is_alive() and not local_status_extension:is_knocked_down()

		if player_eligible then
			local all_down_but_me = true
			local hero_side = Managers.state.side:get_side_from_name("heroes")
			local player_units = hero_side.PLAYER_AND_BOT_UNITS

			for _, player_unit in ipairs(player_units) do
				if player_unit ~= owner_unit then
					local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
					local status_extension = ScriptUnit.extension(player_unit, "status_system")
					local is_knocked_down = status_extension:is_knocked_down()

					if ALIVE[player_unit] and health_extension:is_alive() and not is_knocked_down then
						all_down_but_me = false
					end
				end
			end

			if all_down_but_me then
				local buff_to_add = buff.template.buff_to_add
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
			end
		end
	end,
	friendly_cooldown_on_ability = function (owner_unit, buff, params)
		local triggering_unit = params[1]

		if owner_unit ~= triggering_unit then
			return
		end

		local template = buff.template
		local amount = template.value
		local range = template.range
		local ability_id = params[2]
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local player_units = hero_side.PLAYER_UNITS
		local local_player_pos = POSITION_LOOKUP[owner_unit]

		for _, unit in pairs(player_units) do
			if owner_unit ~= unit then
				local unit_pos = POSITION_LOOKUP[unit]
				local distance_sq = Vector3.distance_squared(local_player_pos, unit_pos)

				if distance_sq < range * range then
					local go_id = Managers.state.unit_storage:go_id(unit)

					if go_id then
						Managers.state.network.network_transmit:send_rpc_server("rpc_server_reduce_activated_ability_cooldown_percent", go_id, amount, ability_id, true)
					end
				end
			end
		end
	end,
	deus_second_wind_on_hit = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[owner_unit] then
			local template = buff.template
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
			local already_invulnerable = buff_extension:has_buff_perk("invulnerable")

			if already_invulnerable then
				return
			end

			local health_extension = ScriptUnit.has_extension(owner_unit, "health_system")
			local health_threshold = template.health_threshold
			local current_health = health_extension:current_health()
			local max_health = health_extension:get_max_health()
			local amount = params[2]
			local percent_health_after_damage = (current_health - amount) / max_health

			if percent_health_after_damage <= 0 and buff_extension:has_buff_perk("ignore_death") then
				return
			end

			local damage_source = params[3]
			local has_cooldown = buff_extension:get_non_stacking_buff("deus_second_wind_cooldown")

			if percent_health_after_damage < health_threshold and not has_cooldown and damage_source ~= "life_tap" then
				local damage_to_deal = percent_health_after_damage > 0 and amount or current_health - 1

				DamageUtils.add_damage_network(owner_unit, owner_unit, damage_to_deal, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, owner_unit)

				local buffs_to_add = template.buffs_to_add
				local buff_system = Managers.state.entity:system("buff_system")

				for i = 1, #buffs_to_add do
					local buff_to_add = buffs_to_add[i]

					buff_system:add_buff(owner_unit, buff_to_add, owner_unit, false)
				end
			end
		end
	end,
	deus_guard_buff_on_damage = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[owner_unit] then
			local guardian_unit = buff.attacker_unit
			local attacker_unit = params[1]
			local damage_dealt = params[2]
			local damage_type = params[3]

			if owner_unit ~= guardian_unit and damage_type ~= "life_tap" then
				local buff_extension = ScriptUnit.extension(guardian_unit, "buff_system")
				local dr_amount = buff_extension:apply_buffs_to_value(1, "damage_taken")

				if buff_extension:has_buff_type("deus_guard_buff") then
					dr_amount = dr_amount / -buff.template.multiplier
				end

				damage_dealt = damage_dealt * dr_amount

				if damage_dealt > 0 then
					DamageUtils.add_damage_network(guardian_unit, attacker_unit, damage_dealt, "torso", "life_tap", nil, Vector3(0, 0, 0), "life_tap", nil, owner_unit)
				end
			end
		end
	end,
	deus_cooldown_reg_not_hit_damage_taken = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local attacker = params[3]

		if attacker == owner_unit then
			return
		end

		buff.reset = true
	end,
	start_ledge_rescue_timer = function (owner_unit, buff, params)
		local template = buff.template
		local time = Managers.time:time("main")
		buff.rescue_timer = time + template.rescue_delay
	end,
	start_disable_rescue_timer = function (owner_unit, buff, params)
		local template = buff.template
		local rescuable_disable_types = template.rescuable_disable_types
		local disable_type = params[1]

		if rescuable_disable_types[disable_type] then
			local time = Managers.time:time("main")
			buff.rescue_timer = time + template.rescue_delay
		end
	end,
	play_particle_effect = function (owner_unit, buff, params)
		local effects = buff.template.particle_fx
		local world = Application.main_world()

		World.create_particles(world, effects, POSITION_LOOKUP[owner_unit])
	end,
	remove_linked_unit = function (owner_unit, buff, params)
		if buff.linked_unit then
			World.unlink_unit(Unit.world(buff.linked_unit), buff.linked_unit)
			Managers.state.unit_spawner:mark_for_deletion(buff.linked_unit)

			buff.linked_unit = nil
		end
	end,
	melee_wave_effect = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if not ALIVE[owner_unit] then
			return
		end

		local hit_data = params[5]

		if hit_data ~= "MELEE_1H" and hit_data ~= "MELEE_2H" then
			return
		end

		local enemy_hit_number = params[4]

		if enemy_hit_number ~= 1 then
			return
		end

		local server_buff_ids = buff.parent_buff_shared_table.server_buff_ids

		if not server_buff_ids then
			return
		end

		local buff_id_to_remove = server_buff_ids[#server_buff_ids]

		if buff_id_to_remove then
			local unit_hit = params[1]
			local template = buff.template
			local explosion_template = ExplosionTemplates[template.explosion_template]
			local world = Managers.world:world("level_world")
			local hit_position = POSITION_LOOKUP[unit_hit]
			local rotation = Quaternion.identity()
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			DamageUtils.create_explosion(world, owner_unit, hit_position, rotation, explosion_template, 1, "buff", is_server(), is_husk(owner_unit), owner_unit, career_power_level, false)

			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:remove_server_controlled_buff(owner_unit, buff_id_to_remove)

			server_buff_ids[#server_buff_ids] = nil
		end

		return true
	end,
	add_melee_wave_stacks = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local triggering_unit = params[1]

		if owner_unit ~= triggering_unit then
			return
		end

		if ALIVE[owner_unit] then
			local stacks = buff.template.stacks_to_add or 1
			local template = buff.template
			local buff_name = template.buff_to_add
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local buff_system = Managers.state.entity:system("buff_system")

			for i = 1, stacks do
				local current_stacks = buff_extension:num_buff_type(buff_name)
				local max_stacks = BuffTemplates[buff_name].buffs[1].max_stacks

				if current_stacks < max_stacks then
					local server_buff_id = buff_system:add_buff(owner_unit, buff_name, owner_unit, true)
					local parent_buff_shared_table = buff.parent_buff_shared_table
					local server_buff_ids = parent_buff_shared_table.server_buff_ids

					if not server_buff_ids then
						parent_buff_shared_table.server_buff_ids = {
							server_buff_id
						}
					else
						server_buff_ids[#server_buff_ids + 1] = server_buff_id
					end
				end
			end
		end
	end,
	reduce_activated_ability_cooldown_on_block = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local career_extension = ScriptUnit.extension(owner_unit, "career_system")

			career_extension:reduce_activated_ability_cooldown(buff.bonus)
		end
	end,
	shield_splinters_explosion = function (owner_unit, buff, params)
		local area_damage_system = Managers.state.entity:system("area_damage_system")
		local target_unit = params[1]
		local position = Unit.local_position(target_unit, 0) + Vector3(0, 0, 1)
		local rotation = Unit.local_rotation(owner_unit, 0)
		local template = buff.template
		local explosion_template = template.explosion_template
		local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
		local career_power_level = career_extension:get_career_power_level()

		area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, 1, "undefined", career_power_level, false)
	end,
	home_run_sound = function (owner_unit, buff, params)
		local template = buff.template
		local cooldown_over_at = buff.cooldown_over_at or 0
		local time = Managers.time:time("main")

		if ALIVE[owner_unit] and cooldown_over_at <= time then
			buff.cooldown_over_at = time + template.cooldown
			local world = Managers.world:world("level_world")
			local sound_event = template.sound_event

			WwiseUtils.trigger_unit_event(world, sound_event, owner_unit, 0)
		end
	end,
	detect_weakness_on_kill = function (owner_unit, buff, params)
		local killed_unit = params[3]
		local buff_extension = ScriptUnit.extension(killed_unit, "buff_system")

		if buff_extension then
			local mark_buff = buff.template.mark_buff

			if buff_extension:has_buff_type(mark_buff) then
				local buff_system = Managers.state.entity:system("buff_system")
				local kill_buff = buff.template.kill_buff

				buff_system:add_buff(owner_unit, kill_buff, owner_unit)
			end
		end
	end,
	remove_attach_particle = function (owner_unit, buff, params)
		if buff.fx_id then
			local world = Application.main_world()

			World.stop_spawning_particles(world, buff.fx_id)
		end
	end,
	pyrotechnical_echo_on_grenade_exploded = function (owner_unit, buff, params)
		buff.queued_explosions = buff.queued_explosions or {}
		local template = buff.template
		local explosion_delay = template.explosion_delay
		local time = Managers.time:time("main")
		local impact_data = params[1]
		local hit_position = Vector3Box(params[2])
		local is_critical_strike = params[3]
		local item_name = params[4]
		local rotation = QuaternionBox(params[5])
		local scale = params[6]
		local power_level = params[7]
		local new_explosion_time = time + explosion_delay
		buff.queued_explosions[#buff.queued_explosions + 1] = {
			impact_data = impact_data,
			hit_position = hit_position,
			is_critical_strike = is_critical_strike,
			item_name = item_name,
			rotation = rotation,
			scale = scale,
			power_level = power_level,
			new_explosion_time = new_explosion_time
		}

		return true
	end,
	blazing_revenge_on_knocked_down = function (owner_unit, buff, params, world)
		if not is_server() then
			return
		end

		local template = buff.template
		local sound_event = template.sound_start_event
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_event, owner_unit)

		local position = POSITION_LOOKUP[owner_unit]
		local explosion_template_name = template.explosion_template
		local explosion_template = ExplosionTemplates[explosion_template_name]
		local radius = explosion_template.aoe.radius
		local damage_source = "buff"
		buff.parent_buff_shared_table.aoe_unit = DamageUtils.create_aoe(world, owner_unit, position, damage_source, explosion_template, radius)
	end,
	blazing_revenge_clear_aoe = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local template = buff.template
		local sound_event = template.sound_end_event
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event(sound_event, owner_unit)

		local aoe_unit = buff.parent_buff_shared_table.aoe_unit

		if aoe_unit and Unit.alive(aoe_unit) then
			Managers.state.unit_spawner:mark_for_deletion(aoe_unit)
		end
	end,
	cluster_barrel_on_barrel_exploded = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		local template = buff.template
		local position = params[1] + Vector3.up() * 0.1
		local explode_time = template.explode_time
		local random_explosion_delay = template.random_explosion_delay
		local item_name = template.item_name
		local fuse_time = template.fuse_time
		local barrel_count = template.barrel_count
		local max_horizontal_velocity = template.max_horizontal_velocity
		local vertical_velocity = template.vertical_velocity

		for i = 1, barrel_count do
			local randomized_direction = Vector3(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1)
			local rotation = Quaternion.look(randomized_direction)
			local velocity = Vector3(math.random() * max_horizontal_velocity * 2 - max_horizontal_velocity, math.random() * max_horizontal_velocity * 2 - max_horizontal_velocity, vertical_velocity)

			spawn_barrel(item_name, position, rotation, velocity, explode_time, fuse_time, random_explosion_delay)
		end
	end,
	add_buffs_on_melee_headshot = function (owner_unit, buff, params)
		if Unit.alive(owner_unit) then
			local hit_zone = params[3]
			local hit_data = params[5]

			if hit_zone and (hit_zone == "head" or hit_zone == "neck") and hit_data and (hit_data == "MELEE_1H" or hit_data == "MELEE_2H") then
				local buff_template = buff.template
				local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
				local blocker_buff = buff_template.blocker_buff

				if blocker_buff and buff_extension:has_buff_type(blocker_buff) then
					return
				end

				local buffs_to_add = buff_template.buffs_to_add

				for i = 1, #buffs_to_add do
					local buff_name = buffs_to_add[i]
					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:add_buff(owner_unit, buff_name, owner_unit)
				end
			end
		end
	end,
	invigorating_strike_on_damage_dealt = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local damage_amount = params[3]
		local damage_source = params[9]
		local item_data = rawget(ItemMasterList, damage_source)

		if item_data and (item_data.slot_type == "melee" or item_data.slot_type == "ranged") then
			local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")
			local buff_template = buff.template
			local cooldown_buff = buff_template.cooldown_buff
			local is_on_cooldown = buff_extension and buff_extension:get_non_stacking_buff(cooldown_buff)

			if not is_on_cooldown then
				local damage_to_heal_conversion_multiplier = buff_template.damage_to_heal_conversion_multiplier
				local heal_amount = damage_amount * damage_to_heal_conversion_multiplier

				DamageUtils.heal_network(owner_unit, owner_unit, heal_amount, "heal_from_proc")

				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, cooldown_buff, owner_unit)
			end
		end
	end,
	staggering_force_on_stagger = function (owner_unit, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		if ALIVE[owner_unit] then
			local template = buff.template
			local enemy_count = template.enemy_count
			local target_index = params[8]

			if target_index and enemy_count <= target_index then
				local buff_to_add = template.buff_to_add
				local buff_system = Managers.state.entity:system("buff_system")

				buff_system:add_buff(owner_unit, buff_to_add, owner_unit)
			end
		end
	end,
	refilling_shot_on_critical_hit = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local parent_buff_shared_table = buff.parent_buff_shared_table
		local ammo_used_extension = parent_buff_shared_table.ammo_used_extension

		if ammo_used_extension and ammo_used_extension then
			local ammo_used = parent_buff_shared_table.ammo_used

			ammo_used_extension:add_ammo_to_clip(ammo_used)
		end
	end,
	refilling_shot_on_start_action = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local parent_buff_shared_table = buff.parent_buff_shared_table
		parent_buff_shared_table.ammo_used_extension = nil
		parent_buff_shared_table.ammo_used = nil
	end,
	refilling_shot_on_ammo_used = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local parent_buff_shared_table = buff.parent_buff_shared_table
		parent_buff_shared_table.ammo_used_extension = params[1]
		parent_buff_shared_table.ammo_used = params[2]
	end,
	thorn_skin_effect = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local template = buff.template
			local explosion_template = ExplosionTemplates[template.explosion_template]
			local world = Application.main_world()
			local hit_position = POSITION_LOOKUP[owner_unit]
			local rotation = Quaternion.identity()
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local career_power_level = career_extension:get_career_power_level()

			DamageUtils.create_explosion(world, owner_unit, hit_position, rotation, explosion_template, 1, "buff", is_server(), is_husk(owner_unit), owner_unit, career_power_level, false)
		end

		return true
	end,
	crescendo_strike_on_crit = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local buff_template = buff.template
			local buff_name = buff_template.buff_to_add
			local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit
			})
		end
	end,
	lucky_on_crit = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local parent_buff_shared_table = buff.parent_buff_shared_table
		local buff_ids = parent_buff_shared_table.buff_ids

		if buff_ids then
			for i = 1, #buff_ids do
				local buff_id = buff_ids[i]

				buff_extension:remove_buff(buff_id)
			end

			table.clear(parent_buff_shared_table.buff_ids)
		end
	end,
	lucky_on_non_crit = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local id = buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})
		local parent_buff_shared_table = buff.parent_buff_shared_table
		local buff_ids = parent_buff_shared_table.buff_ids or {}
		buff_ids[#buff_ids + 1] = id
		parent_buff_shared_table.buff_ids = buff_ids
	end,
	hidden_escape_on_damage_taken = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local invalid_damage_sources = buff_template.invalid_damage_sources
		local damage_source = params[3]

		if invalid_damage_sources[damage_source] then
			return
		end

		local cooldown_buff = buff_template.cooldown_buff
		local is_on_cooldown = buff_extension:get_buff_type(cooldown_buff)

		if not is_on_cooldown then
			local buff_name = buff_template.buff_to_add
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			if status_extension:is_invisible() then
				return
			end

			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit
			})
		end
	end,
	hidden_escape_on_hit = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		buff_extension:remove_buff(buff.id)
	end,
	curative_empowerment_on_healed_ally = function (owner_unit, buff, params)
		local healed_unit = params[1]

		if not is_server() then
			return
		end

		local heal_type = params[3]
		local template = buff.template

		if heal_type ~= template.heal_type then
			return
		end

		local buff_to_add = template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")

		if ALIVE[owner_unit] then
			buff_system:add_buff(owner_unit, buff_to_add, owner_unit)
		end

		if ALIVE[healed_unit] then
			buff_system:add_buff(healed_unit, buff_to_add, owner_unit)
		end
	end,
	pent_up_anger_on_block = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add
		local crit_buff_name = buff_template.crit_buff
		local crit_buff = buff_extension:get_non_stacking_buff(crit_buff_name)

		if crit_buff then
			return false
		end

		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})

		return true
	end,
	surprise_strike_add_buff = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local buff_template = buff.template
		local buff_name = buff_template.buff_to_add

		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})

		return true
	end,
	start_bad_breath_timer = function (owner_unit, buff, params)
		if not is_server() then
			return false
		end

		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if buff_extension:get_buff_type(cooldown_buff) then
			return false
		end

		local rescuable_disable_types = template.rescuable_disable_types
		local disable_type = params[1]

		if rescuable_disable_types[disable_type] then
			local disabler = params[2]
			local time = Managers.time:time("main")
			buff.rescue_timer = time + template.rescue_delay
			buff.disabler = disabler

			return true
		end
	end,
	start_boulder_bro_timer = function (owner_unit, buff, params)
		local template = buff.template
		local time = Managers.time:time("main")
		buff.rescue_timer = time + template.rescue_delay

		return false
	end,
	static_blade_on_timed_block = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if buff_extension:get_buff_type(cooldown_buff) then
			return false
		end

		local attacking_unit = params[1]
		local hit_zone_name = template.hit_zone or buff.hit_zone_name or "full"
		local damage_source = template.damage_source or "buff"
		local power_level = buff.power_level or DefaultPowerLevel
		local damage_profile_name = template.damage_profile_name or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = nil
		local is_critical_strike = false
		local backstab_multiplier, boost_damage_multiplier = nil
		local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target
		local damage_type = target_settings.damage_type
		local boost_curve = BoostCurves[target_settings.boost_curve_type]
		local damage = DamageUtils.calculate_damage(DamageOutput, attacking_unit, owner_unit, hit_zone_name, power_level, boost_curve, boost_damage_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)

		DamageUtils.add_damage_network(attacking_unit, owner_unit, damage, "torso", damage_type, nil, Vector3(1, 0, 0), damage_source)

		local area_damage_system = Managers.state.entity:system("area_damage_system")
		local position = POSITION_LOOKUP[attacking_unit]
		local rotation = Quaternion.identity()
		local explosion_template = template.explosion_template
		local scale = 1

		area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, damage_source, power_level, is_critical_strike)

		local beam_effect = NetworkLookup.effects["fx/cw_chain_lightning"]
		local start_point = POSITION_LOOKUP[owner_unit] + 0.5 * Vector3.up()
		local end_point = nil
		local spine_node = Unit.has_node(attacking_unit, "j_spine") and Unit.node(attacking_unit, "j_spine")

		if spine_node then
			end_point = Unit.world_position(attacking_unit, spine_node)
		else
			end_point = POSITION_LOOKUP[attacking_unit] + 0.5 * Vector3.up()
		end

		local distance_flat = Vector3.distance(end_point, start_point)
		local distance = Vector3(1, distance_flat, 0)
		local rotation = Quaternion.look(end_point - start_point)

		if is_server() then
			Managers.state.network:rpc_play_particle_effect_with_variable(nil, beam_effect, start_point, rotation, "distance", distance)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect_with_variable", beam_effect, start_point, rotation, "distance", distance)
		end

		local audio_system = Managers.state.entity:system("audio_system")
		local sound_event = template.sound_event

		audio_system:play_audio_unit_event(sound_event, attacking_unit)
		buff_extension:add_buff(cooldown_buff, {
			attacker_unit = owner_unit
		})

		return true
	end,
	spawn_orb = function (owner_unit, buff, params)
		if is_server() then
			if not ALIVE[owner_unit] then
				return
			end

			local killed_unit = params[3]
			local orb_starting_position = POSITION_LOOKUP[killed_unit] + Vector3(0, 0, 1)
			local player_position = POSITION_LOOKUP[owner_unit]
			local cake_slice_dir = Vector3.normalize(orb_starting_position - player_position)
			local cake_slice_angle_radians = math.pi
			local orb_settings = buff.template.orb_settings
			local orb_name = orb_settings.orb_name
			local player = Managers.player:owner(owner_unit)
			local owner_peer_id = player.peer_id
			local orb_system = Managers.state.entity:system("orb_system")

			orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
		end
	end,
	on_damage_taken_health_orbs = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[owner_unit] then
			local template = buff.template
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			if status_extension:is_disabled() then
				return
			end

			local amount = params[2]
			local acummulated_amount = amount + (buff.leftover_health or 0)
			local orb_count_float = acummulated_amount / template.health_per_orb
			local orb_count = math.floor(orb_count_float)
			buff.leftover_health = math.fmod(acummulated_amount, template.health_per_orb)
			local orb_settings = buff.template.orb_settings
			local orb_name = orb_settings.orb_name
			local player = Managers.player:owner(owner_unit)
			local owner_peer_id = player.peer_id
			local orb_starting_position = POSITION_LOOKUP[owner_unit] + Vector3(0, 0, 1)
			local cake_slice_dir = Vector3(0, 0, 1)
			local cake_slice_angle_radians = 2 * math.pi
			local orb_system = Managers.state.entity:system("orb_system")

			for i = 1, orb_count do
				orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			end
		end
	end,
	on_kill_static_charge = function (owner_unit, buff, params)
		if not is_server() then
			return
		end

		if ALIVE[owner_unit] then
			local template = buff.template
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			if status_extension:is_disabled() then
				return
			end

			buff.kill_count = (buff.kill_count or 0) + 1

			if template.kills_per_orb <= buff.kill_count then
				buff.kill_count = 0
				local orb_starting_position = POSITION_LOOKUP[owner_unit] + Vector3(0, 0, 1)
				local orb_settings = buff.template.orb_settings
				local orb_name = orb_settings.orb_name
				local player = Managers.player:owner(owner_unit)
				local owner_peer_id = player.peer_id
				local cake_slice_dir = Vector3(0, 0, 1)
				local cake_slice_angle_radians = 2 * math.pi
				local orb_system = Managers.state.entity:system("orb_system")

				orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			end
		end
	end,
	on_potion_consumed_sharing_is_caring = function (owner_unit, buff, params)
		if ALIVE[owner_unit] then
			local item_name = params[1]
			local template = ItemMasterList[item_name].temporary_template
			local orb_name = template .. "_orb"

			if AllPickups[orb_name] then
				local orb_starting_position = POSITION_LOOKUP[owner_unit] + Vector3(0, 0, 1)
				local player = Managers.player:owner(owner_unit)
				local owner_peer_id = player.peer_id
				local cake_slice_dir = Vector3(0, 0, 1)
				local cake_slice_angle_radians = 2 * math.pi

				if is_server() then
					local orb_system = Managers.state.entity:system("orb_system")

					orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
				else
					local network_manager = Managers.state.network
					local orb_name_lookup = NetworkLookup.pickup_names[orb_name]

					network_manager.network_transmit:send_rpc_server("rpc_spawn_orb", orb_name_lookup, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
				end
			end
		end
	end,
	on_timed_block_protection_orbs = function (owner_unit, buff, params)
		local time = Managers.time:time("main")

		if buff.cooldown_end_t and time < buff.cooldown_end_t then
			return
		end

		if ALIVE[owner_unit] then
			local status_extension = ScriptUnit.extension(owner_unit, "status_system")

			if status_extension:is_disabled() then
				return
			end

			local orb_starting_position = POSITION_LOOKUP[owner_unit] + Vector3(0, 0, 1)
			local orb_settings = buff.template.orb_settings
			local orb_name = orb_settings.orb_name
			local player = Managers.player:owner(owner_unit)
			local owner_peer_id = player.peer_id
			local cake_slice_dir = Vector3(0, 0, 1)
			local cake_slice_angle_radians = 2 * math.pi

			if is_server() then
				local orb_system = Managers.state.entity:system("orb_system")

				orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			else
				local network_manager = Managers.state.network
				local orb_name_lookup = NetworkLookup.pickup_names[orb_name]

				network_manager.network_transmit:send_rpc_server("rpc_spawn_orb", orb_name_lookup, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			end

			buff.cooldown_end_t = time + buff.template.cooldown
		end
	end,
	focused_accuracy_on_hit = function (owner_unit, buff, params)
		if not ALIVE[owner_unit] then
			return
		end

		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if buff_extension:get_buff_type(cooldown_buff) then
			return
		end

		local hit_zone = params[3]

		if hit_zone and (hit_zone == "head" or hit_zone == "neck") then
			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, cooldown_buff, owner_unit)

			local orb_settings = buff.template.orb_settings
			local orb_name = orb_settings.orb_name
			local target_unit = params[1]
			local orb_starting_position = POSITION_LOOKUP[target_unit] + Vector3(0, 0, 1)
			local player = Managers.player:owner(owner_unit)
			local owner_peer_id = player.peer_id
			local cake_slice_dir = Vector3(0, 0, 1)
			local cake_slice_angle_radians = 2 * math.pi

			if is_server() then
				local orb_system = Managers.state.entity:system("orb_system")

				orb_system:spawn_orb(orb_name, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			else
				local network_manager = Managers.state.network
				local orb_name_lookup = NetworkLookup.pickup_names[orb_name]

				network_manager.network_transmit:send_rpc_server("rpc_spawn_orb", orb_name_lookup, owner_peer_id, orb_starting_position, cake_slice_dir, cake_slice_angle_radians)
			end
		end
	end,
	deus_ranged_crit_explosion_on_damage_dealt = function (owner_unit, buff, params, world)
		local buff_template = buff.template
		local attack_type = params[2]
		local valid_attack_types = buff_template.valid_attack_types

		if valid_attack_types and not valid_attack_types[attack_type] then
			return
		end

		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if buff_extension:get_buff_type(cooldown_buff) then
			return
		end

		local hit_unit = params[1]
		local is_critical_strike = params[6]
		local target_number = params[4]

		if ALIVE[owner_unit] and ALIVE[hit_unit] and target_number == 1 and is_critical_strike then
			local career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
			local area_damage_system = Managers.state.entity:system("area_damage_system")
			local position = POSITION_LOOKUP[hit_unit]
			local damage_source = "buff"
			local explosion_template = buff_template.explosion_template
			local rotation = Quaternion.identity()
			local career_power_level = career_extension:get_career_power_level() * buff_template.power_scale
			local scale = 1
			local is_critical_strike = false

			area_damage_system:create_explosion(owner_unit, position, rotation, explosion_template, scale, damage_source, career_power_level, is_critical_strike)

			local audio_system = Managers.state.entity:system("audio_system")
			local sound_event = buff_template.sound_event

			audio_system:play_audio_unit_event(sound_event, hit_unit)

			local buff_system = Managers.state.entity:system("buff_system")

			buff_system:add_buff(owner_unit, cooldown_buff, owner_unit)
		end
	end,
	resolve_on_revived = function (owner_unit, buff, params)
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
		local template = buff.template
		local cooldown_buff = template.cooldown_buff
		local full_heal_buff = template.full_heal_buff

		if buff_extension:get_buff_type(full_heal_buff) then
			buff_extension:add_buff(cooldown_buff)

			local t = Managers.time:time("game")
			buff.after_revive_t = t + 3
		end
	end,
	squats_add_buff = function (owner_unit, buff, params)
		if not is_local(owner_unit) or not ALIVE[owner_unit] then
			return
		end

		local buff_template = buff.template
		local build_up_buff = buff_template.build_up_buff
		local actual_buff = buff_template.actual_buff
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if buff_extension:get_buff_type(actual_buff) then
			return
		end

		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff(owner_unit, build_up_buff, owner_unit)

		local num_stacks = buff_extension:num_buff_stacks(build_up_buff)

		if buff_template.stack_count_to_trigger_actual_buff <= num_stacks then
			while true do
				local existing_buff = buff_extension:get_buff_type(build_up_buff)

				if not existing_buff then
					break
				end

				buff_extension:remove_buff(existing_buff.id)
			end

			buff_system:add_buff(owner_unit, actual_buff, owner_unit)
		end
	end
}
dlc_settings.explosion_templates = {
	stagger_aoe_on_crit = {
		name = "stagger_aoe_on_crit",
		explosion = {
			no_prop_damage = true,
			radius = 5,
			use_attacker_power_level = true,
			max_damage_radius = 2,
			always_hurt_players = false,
			alert_enemies = true,
			alert_enemies_radius = 15,
			attack_template = "drakegun",
			damage_type = "grenade",
			damage_profile = "ability_push",
			no_friendly_fire = true
		}
	},
	armor_breaker = {
		name = "armor_breaker",
		explosion = {
			use_attacker_power_level = true,
			radius = 4,
			hit_sound_event = "Play_wind_metal_gameplay_mutator_wind_hit",
			damage_type = "cutting",
			damage_profile = "armor_breaker",
			no_friendly_fire = true
		}
	},
	bolt_of_change = {
		time_to_explode = 3,
		follow_time = 6,
		explosion = {
			trigger_on_server_only = true,
			radius = 4,
			alert_enemies_radius = 20,
			attack_template = "grenade",
			alert_enemies = true,
			always_hurt_players = true,
			different_power_levels_for_players = true,
			buildup_effect_time = 1.5,
			sound_event_name = "Play_mutator_enemy_split_large",
			damage_profile = "bolt_of_change",
			power_level = 250,
			buildup_effect_name = "fx/deus_lightning_strike_02",
			effect_name = "fx/deus_lightning_strike_01",
			camera_effect = {
				near_distance = 5,
				near_scale = 1,
				shake_name = "lightning_strike",
				far_scale = 0.15,
				far_distance = 20
			}
		}
	},
	magma = {
		aoe = {
			dot_template_name = "burning_magma_dot",
			nav_tag_volume_layer = "fire_grenade",
			create_nav_tag_volume = true,
			attack_template = "wizard_staff_geiser",
			sound_event_name = "player_combat_weapon_fire_bw_deus_01_impact",
			damage_interval = 0.5,
			duration = 10,
			area_damage_template = "explosion_template_aoe",
			nav_mesh_effect = {
				particle_radius = 2,
				particle_name = "fx/wpnfx_bw_deus_geyser_01",
				particle_spacing = 0.9
			}
		}
	},
	bots_avoid_curse = {
		aoe = {
			duration = 5,
			radius = 5,
			create_nav_tag_volume = true,
			nav_tag_volume_layer = "bot_poison_wind"
		}
	},
	corrupted_flesh_explosion = {
		aoe = {
			start_aoe_sound_event_name = "Play_curse_corrupted_flesh_explosion",
			stop_aoe_sound_event_name = "Stop_curse_corrupted_flesh_explosion"
		}
	},
	blessing_of_isha_stagger = {
		name = "blessing_of_isha_stagger",
		explosion = {
			use_attacker_power_level = true,
			damage_type = "grenade",
			no_friendly_fire = true,
			max_damage_radius = 0,
			damage_profile = "markus_knight_charge",
			no_prop_damage = true,
			always_hurt_players = false,
			attack_template = "markus_knight_charge"
		}
	},
	holy_hand_grenade = {
		is_grenade = true,
		explosion = {
			dont_rotate_fx = true,
			radius = 10,
			max_damage_radius = 6,
			alert_enemies_radius = 20,
			sound_event_name = "Play_blessing_morris_grenade_explosion",
			attack_template = "grenade",
			damage_profile_glance = "holy_hand_grenade",
			alert_enemies = true,
			damage_profile = "holy_hand_grenade",
			effect_name = "fx/wpnfx_holy_handgrenade_explosion_01",
			difficulty_power_level = {
				easy = {
					power_level_glance = 4000,
					power_level = 8000
				},
				normal = {
					power_level_glance = 8000,
					power_level = 16000
				},
				hard = {
					power_level_glance = 12000,
					power_level = 24000
				},
				harder = {
					power_level_glance = 16000,
					power_level = 32000
				},
				hardest = {
					power_level_glance = 20000,
					power_level = 40000
				},
				cataclysm = {
					power_level_glance = 12000,
					power_level = 24000
				},
				cataclysm_2 = {
					power_level_glance = 16000,
					power_level = 32000
				},
				cataclysm_3 = {
					power_level_glance = 20000,
					power_level = 40000
				}
			},
			camera_effect = {
				near_distance = 10,
				near_scale = 1,
				shake_name = "holy_hand_grenade_explosion",
				far_scale = 0.5,
				far_distance = 40
			}
		}
	},
	curse_skulls_of_fury_explosion = {
		time_to_explode = 3,
		explosion = {
			trigger_on_server_only = true,
			radius = 4,
			alert_enemies = true,
			buildup_effect_name = "fx/deus_curse_skulls_of_fury_timer_01",
			buildup_effect_time = 3,
			deletion_timer = 0,
			alert_enemies_radius = 20,
			attack_template = "skulls_of_fury",
			different_power_levels_for_players = true,
			sound_event_name = "Play_curse_skulls_of_fury_explosion",
			effect_name = "fx/magic_wind_fire_explosion_01",
			always_hurt_players = true,
			max_damage_radius = 4,
			unit_scale = 1,
			damage_profile_glance = "curse_skulls_of_fury_explosion_glance",
			damage_profile = "curse_skulls_of_fury_explosion",
			buildup_effect_offset = {
				0,
				0,
				-2
			},
			difficulty_power_level = {
				easy = {
					power_level_glance = 50,
					power_level = 100
				},
				normal = {
					power_level_glance = 100,
					power_level = 200
				},
				hard = {
					power_level_glance = 150,
					power_level = 300
				},
				harder = {
					power_level_glance = 200,
					power_level = 400
				},
				hardest = {
					power_level_glance = 250,
					power_level = 500
				},
				cataclysm = {
					power_level_glance = 300,
					power_level = 600
				},
				cataclysm_2 = {
					power_level_glance = 350,
					power_level = 700
				},
				cataclysm_3 = {
					power_level_glance = 400,
					power_level = 800
				}
			},
			camera_effect = {
				near_distance = 5,
				near_scale = 1,
				shake_name = "lightning_strike",
				far_scale = 0.15,
				far_distance = 20
			}
		}
	},
	we_deus_01_small = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 0.5,
			radius_max = 1,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.1,
			damage_profile_glance = "we_deus_01_small_explosion_glance",
			max_damage_radius_max = 0.75,
			sound_event_name = "we_deus_01_big_hit",
			damage_profile = "we_deus_01_small_explosion",
			effect_name = "fx/wpnfx_we_deus_01_impact"
		}
	},
	we_deus_01_large = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 1.25,
			sound_event_name = "we_deus_01_big_hit",
			radius_max = 3,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.5,
			alert_enemies_radius = 10,
			damage_profile_glance = "we_deus_01_large_explosion_glance",
			max_damage_radius_max = 2,
			alert_enemies = true,
			damage_profile = "we_deus_01_large_explosion",
			effect_name = "fx/wpnfx_we_deus_01_explosion"
		}
	},
	deus_relic_small = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 0.5,
			no_friendly_fire = true,
			radius_max = 1,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.1,
			damage_profile_glance = "deus_relic_small_explosion_glance",
			max_damage_radius_max = 0.75,
			sound_event_name = "we_deus_01_big_hit",
			damage_profile = "deus_relic_small_explosion",
			effect_name = "fx/wpnfx_we_deus_01_impact"
		}
	},
	deus_relic_large = {
		explosion = {
			use_attacker_power_level = true,
			radius_min = 1.25,
			sound_event_name = "we_deus_01_big_hit",
			radius_max = 3,
			no_friendly_fire = true,
			attacker_power_level_offset = 0.25,
			max_damage_radius_min = 0.5,
			alert_enemies_radius = 10,
			damage_profile_glance = "deus_relic_large_explosion_glance",
			max_damage_radius_max = 2,
			alert_enemies = true,
			damage_profile = "deus_relic_large_explosion",
			effect_name = "fx/wpnfx_we_deus_01_explosion"
		}
	},
	dr_deus_01 = {
		explosion = {
			use_attacker_power_level = true,
			dont_rotate_fx = true,
			radius = 4,
			max_damage_radius = 1,
			alert_enemies_radius = 20,
			attacker_power_level_offset = 2,
			attack_type = "grenade",
			attack_template = "grenade",
			sound_event_name = "player_combat_weapon_dr_deus_01_explosion",
			damage_profile_glance = "dr_deus_01_glance",
			alert_enemies = true,
			damage_profile = "dr_deus_01_explosion",
			effect_name = "fx/wpnfx_frag_grenade_impact",
			camera_effect = {
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
				far_scale = 0.15,
				far_distance = 20
			}
		}
	},
	buff_explosion = {
		explosion = {
			use_attacker_power_level = true,
			radius = 3,
			max_damage_radius = 1.5,
			alert_enemies_radius = 10,
			attacker_power_level_offset = 0.5,
			effect_name = "fx/cw_enemy_explosion",
			attack_template = "grenade",
			sound_event_name = "fireball_big_hit",
			damage_profile_glance = "frag_grenade_glance",
			alert_enemies = true,
			damage_profile = "frag_grenade",
			no_friendly_fire = true,
			camera_effect = {
				near_distance = 5,
				near_scale = 1,
				shake_name = "frag_grenade_explosion",
				far_scale = 0.15,
				far_distance = 20
			}
		}
	},
	deus_ranged_crit_explosion = {
		explosion = {
			radius = 3,
			alert_enemies = true,
			max_damage_radius = 2.5,
			no_friendly_fire = true,
			alert_enemies_radius = 15,
			sound_event_name = "Play_enemy_combat_warpfire_backpack_explode",
			damage_profile = "frag_grenade",
			effect_name = "fx/cw_enemy_explosion",
			difficulty_power_level = {
				easy = {
					power_level_glance = 100,
					power_level = 200
				},
				normal = {
					power_level_glance = 100,
					power_level = 100
				},
				hard = {
					power_level_glance = 200,
					power_level = 200
				},
				harder = {
					power_level_glance = 300,
					power_level = 300
				},
				hardest = {
					power_level_glance = 400,
					power_level = 400
				},
				cataclysm = {
					power_level_glance = 300,
					power_level = 600
				},
				cataclysm_2 = {
					power_level_glance = 400,
					power_level = 800
				},
				cataclysm_3 = {
					power_level_glance = 500,
					power_level = 1000
				}
			}
		}
	},
	player_disabled_stagger = {
		name = "stagger_aoe_on_crit",
		explosion = {
			use_attacker_power_level = true,
			radius = 5,
			effect_name = "fx/cw_enemy_explosion",
			max_damage_radius = 2,
			no_prop_damage = true,
			always_hurt_players = false,
			alert_enemies = true,
			attack_template = "drakegun",
			alert_enemies_radius = 15,
			damage_type = "grenade",
			damage_profile = "ability_push",
			no_friendly_fire = true
		}
	},
	melee_wave = {
		name = "melee_wave",
		explosion = {
			use_attacker_power_level = true,
			radius = 5,
			hit_sound_event = "Play_wind_metal_gameplay_mutator_wind_hit",
			max_damage_radius = 2,
			no_friendly_fire = true,
			no_prop_damage = true,
			always_hurt_players = false,
			attack_template = "drakegun",
			alert_enemies = true,
			alert_enemies_radius = 15,
			sound_event_name = "boon_melee_wave",
			damage_type = "grenade",
			damage_profile = "ability_push",
			effect_name = "fx/chr_kruber_shockwave"
		}
	},
	shield_splinters = {
		name = "shield_splinters",
		explosion = {
			use_attacker_power_level = true,
			radius = 4,
			no_friendly_fire = true,
			damage_type = "cutting",
			damage_profile = "armor_breaker",
			hit_sound_event = "Play_wind_metal_gameplay_mutator_wind_hit",
			sound_event_name = "boon_shield_of_splinters",
			effect_name = "fx/wpnfx_flaming_flail_hit_01"
		}
	},
	blazing_revenge = {
		name = "blazing_revenge",
		aoe = {
			dot_template_name = "burning_dot_fire_grenade",
			radius = 4,
			nav_tag_volume_layer = "fire_grenade",
			create_nav_tag_volume = true,
			attack_template = "fire_grenade_dot",
			friendly_fire = false,
			damage_interval = 1,
			area_damage_template = "explosion_template_aoe",
			duration = math.huge,
			nav_mesh_effect = {
				particle_radius = 2,
				particle_name = "fx/wpnfx_fire_grenade_impact_remains",
				particle_spacing = 0.9
			}
		}
	},
	thorn_skin = {
		name = "thorn_skin",
		explosion = {
			use_attacker_power_level = true,
			radius = 2,
			hit_sound_event = "Play_wind_metal_gameplay_mutator_wind_hit",
			damage_type = "cutting",
			damage_profile = "thorn_skin",
			no_friendly_fire = true
		}
	},
	static_charge = {
		name = "static_charge",
		explosion = {
			no_prop_damage = true,
			radius = 3,
			use_attacker_power_level = true,
			max_damage_radius = 2,
			always_hurt_players = false,
			sound_event_name = "boon_orb_static_charge",
			attack_template = "drakegun",
			damage_type = "grenade",
			damage_profile = "static_charge",
			no_friendly_fire = true
		}
	},
	bad_breath = {
		name = "stagger_aoe_on_crit",
		explosion = {
			use_attacker_power_level = true,
			radius = 5,
			effect_name = "fx/belakor/blk_smite_01_fx",
			max_damage_radius = 2,
			no_prop_damage = true,
			always_hurt_players = false,
			alert_enemies = true,
			attack_template = "drakegun",
			alert_enemies_radius = 15,
			sound_event_name = "boon_bad_breath",
			damage_type = "grenade",
			damage_profile = "ability_push",
			no_friendly_fire = true
		}
	},
	static_blade = {
		name = "static_blade",
		explosion = {
			use_attacker_power_level = true,
			radius = 1,
			damage_type = "grenade",
			max_damage_radius = 0,
			damage_profile = "markus_knight_charge",
			no_friendly_fire = true,
			no_prop_damage = true,
			attack_template = "markus_knight_charge"
		}
	}
}
dlc_settings.buff_templates = {
	liquid_bravado_potion = {
		buffs = {
			{
				name = "liquid_bravado_potion",
				stat_buff = "power_level",
				max_stacks = 1,
				icon = "potion_liquid_bravado",
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				multiplier = MorrisBuffTweakData.liquid_bravado_potion.multiplier,
				duration = MorrisBuffTweakData.liquid_bravado_potion.duration
			}
		}
	},
	liquid_bravado_potion_increased = {
		buffs = {
			{
				name = "liquid_bravado_potion_increased",
				stat_buff = "power_level",
				max_stacks = 1,
				icon = "potion_liquid_bravado",
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				multiplier = MorrisBuffTweakData.liquid_bravado_potion_increased.multiplier,
				duration = MorrisBuffTweakData.liquid_bravado_potion_increased.duration
			}
		}
	},
	vampiric_draught_potion = {
		buffs = {
			{
				name = "vampiric_draught_potion_heal",
				remove_buff_func = "remove_deus_potion_buff",
				buff_func = "vampiric_heal",
				event = "on_damage_dealt",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_vampiric_draught",
				duration = MorrisBuffTweakData.vampiric_draught_potion.duration,
				difficulty_multiplier = MorrisBuffTweakData.vampiric_draught_potion.difficulty_multiplier
			}
		}
	},
	vampiric_draught_potion_increased = {
		buffs = {
			{
				name = "vampiric_draught_potion_heal_increased",
				remove_buff_func = "remove_deus_potion_buff",
				buff_func = "vampiric_heal",
				event = "on_damage_dealt",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_vampiric_draught",
				duration = MorrisBuffTweakData.vampiric_draught_potion_increased.duration,
				difficulty_multiplier = MorrisBuffTweakData.vampiric_draught_potion_increased.difficulty_multiplier
			}
		}
	},
	moot_milk_potion = {
		activation_effect = MorrisBuffTweakData.moot_milk_potion.activation_effect,
		buffs = {
			{
				buff_to_add = "moot_milk_strength",
				name = "moot_milk_potion",
				remove_buff_func = "add_buff",
				refresh_durations = true,
				max_stacks = 1,
				duration = MorrisBuffTweakData.moot_milk_potion.effect_duration
			}
		}
	},
	moot_milk_strength = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				name = "moot_milk_increase_dodge_distance",
				icon = "potion_moot_milk",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				multiplier = MorrisBuffTweakData.moot_milk_potion.dodge_distance_multiplier,
				duration = MorrisBuffTweakData.moot_milk_potion.duration,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			},
			{
				name = "moot_milk_increase_dodge_speed",
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				multiplier = MorrisBuffTweakData.moot_milk_potion.dodge_speed_multiplier,
				duration = MorrisBuffTweakData.moot_milk_potion.duration,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				remove_buff_func = "remove_deus_potion_buff",
				name = "moot_milk_sound",
				refresh_durations = true,
				duration = MorrisBuffTweakData.moot_milk_potion.duration
			}
		}
	},
	moot_milk_potion_increased = {
		activation_effect = MorrisBuffTweakData.moot_milk_potion_increased.activation_effect,
		buffs = {
			{
				buff_to_add = "moot_milk_strength_increased",
				name = "moot_milk_strength_increased",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "add_buff",
				duration = MorrisBuffTweakData.moot_milk_potion_increased.effect_duration
			}
		}
	},
	moot_milk_strength_increased = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				name = "moot_milk_increase_dodge_distance_increased",
				icon = "potion_moot_milk",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				multiplier = MorrisBuffTweakData.moot_milk_potion_increased.dodge_distance_multiplier,
				duration = MorrisBuffTweakData.moot_milk_potion_increased.duration,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			},
			{
				name = "moot_milk_increase_dodge_speed_increased",
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				multiplier = MorrisBuffTweakData.moot_milk_potion_increased.dodge_speed_multiplier,
				duration = MorrisBuffTweakData.moot_milk_potion_increased.duration,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			},
			{
				remove_buff_func = "remove_deus_potion_buff",
				name = "moot_milk_sound_increased",
				refresh_durations = true,
				duration = MorrisBuffTweakData.moot_milk_potion_increased.duration
			}
		}
	},
	friendly_murderer_potion = {
		buffs = {
			{
				name = "friendly_murderer_potion",
				buff_func = "friendly_murder",
				event = "on_damage_dealt",
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_friendly_murderer",
				duration = MorrisBuffTweakData.friendly_murderer_potion.duration,
				difficulty_multiplier = MorrisBuffTweakData.friendly_murderer_potion.difficulty_multiplier,
				range = MorrisBuffTweakData.friendly_murderer_potion.range
			}
		}
	},
	friendly_murderer_potion_increased = {
		buffs = {
			{
				name = "friendly_murderer_potion_increased",
				buff_func = "friendly_murder",
				event = "on_damage_dealt",
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				max_stacks = 1,
				icon = "potion_friendly_murderer",
				duration = MorrisBuffTweakData.friendly_murderer_potion_increased.duration,
				difficulty_multiplier = MorrisBuffTweakData.friendly_murderer_potion_increased.difficulty_multiplier,
				range = MorrisBuffTweakData.friendly_murderer_potion_increased.range
			}
		}
	},
	killer_in_the_shadows_potion = {
		buffs = {
			{
				remove_buff_func = "remove_killer_in_the_shadows_buff",
				name = "killer_in_the_shadows_potion",
				icon = "potion_killer_in_the_shadows",
				refresh_durations = true,
				max_stacks = 1,
				apply_buff_func = "apply_killer_in_the_shadows_buff",
				duration = MorrisBuffTweakData.killer_in_the_shadows_potion.duration
			}
		}
	},
	killer_in_the_shadows_potion_increased = {
		buffs = {
			{
				remove_buff_func = "remove_killer_in_the_shadows_buff",
				name = "killer_in_the_shadows_potion_increased",
				icon = "potion_killer_in_the_shadows",
				refresh_durations = true,
				max_stacks = 1,
				apply_buff_func = "apply_killer_in_the_shadows_buff",
				duration = MorrisBuffTweakData.killer_in_the_shadows_potion_increased.duration
			}
		}
	},
	pockets_full_of_bombs_potion = {
		buffs = {
			{
				update_func = "update_pockets_full_of_bombs_buff",
				name = "pockets_full_of_bombs_potion",
				icon = "potion_pockets_full_of_bombs",
				remove_buff_func = "remove_deus_potion_buff",
				apply_buff_func = "apply_pockets_full_of_bombs_buff",
				duration = MorrisBuffTweakData.pockets_full_of_bombs_potion.duration,
				perk = buff_perks.disable_interactions
			},
			{
				remove_buff_func = "remove_movement_buff",
				name = "pockets_full_of_bombs_potion_movement_speed",
				apply_buff_func = "apply_movement_buff",
				duration = MorrisBuffTweakData.pockets_full_of_bombs_potion.movespeed_duration,
				multiplier = MorrisBuffTweakData.pockets_full_of_bombs_potion.movespeed_multiplier,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	pockets_full_of_bombs_potion_increased = {
		buffs = {
			{
				update_func = "update_pockets_full_of_bombs_buff",
				name = "pockets_full_of_bombs_potion_increased",
				icon = "potion_pockets_full_of_bombs",
				remove_buff_func = "remove_deus_potion_buff",
				apply_buff_func = "apply_pockets_full_of_bombs_buff",
				duration = MorrisBuffTweakData.pockets_full_of_bombs_potion_increased.duration,
				perk = buff_perks.disable_interactions
			},
			{
				name = "pockets_full_of_bombs_potion_movement_speed_increased",
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				multiplier = MorrisBuffTweakData.pockets_full_of_bombs_potion_increased.movespeed_multiplier,
				duration = MorrisBuffTweakData.pockets_full_of_bombs_potion_increased.movespeed_duration,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	hold_my_beer_potion = {
		buffs = {
			{
				activation_effect = "fx/screenspace_drink_01",
				name = "hold_my_beer_potion",
				icon = "potion_hold_my_beer",
				continuous_effect = "fx/screenspace_drink_looping",
				max_stacks = 1,
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.hold_my_beer_potion.fx_duration
			},
			{
				remove_buff_func = "remove_movement_buff",
				name = "hold_my_beer_potion_movement_speed",
				max_stacks = 1,
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.hold_my_beer_potion.movespeed_duration,
				multiplier = MorrisBuffTweakData.hold_my_beer_potion.movespeed_multiplier,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				name = "hold_my_beer_potion_damage_increase",
				stat_buff = "increased_weapon_damage",
				refresh_durations = true,
				max_stacks = 1,
				duration = MorrisBuffTweakData.hold_my_beer_potion.duration,
				multiplier = MorrisBuffTweakData.hold_my_beer_potion.multiplier
			}
		}
	},
	hold_my_beer_potion_increased = {
		buffs = {
			{
				activation_effect = "fx/screenspace_drink_01",
				name = "hold_my_beer_potion_increased",
				icon = "potion_hold_my_beer",
				continuous_effect = "fx/screenspace_drink_looping",
				max_stacks = 1,
				remove_buff_func = "remove_deus_potion_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.hold_my_beer_potion_increased.fx_duration
			},
			{
				remove_buff_func = "remove_movement_buff",
				name = "hold_my_beer_potion_movement_speed_increased",
				max_stacks = 1,
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.hold_my_beer_potion_increased.movespeed_duration,
				multiplier = MorrisBuffTweakData.hold_my_beer_potion_increased.movespeed_multiplier,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			},
			{
				name = "hold_my_beer_potion_damage_increase_increased",
				stat_buff = "increased_weapon_damage",
				refresh_durations = true,
				max_stacks = 1,
				duration = MorrisBuffTweakData.hold_my_beer_potion_increased.duration,
				multiplier = MorrisBuffTweakData.hold_my_beer_potion_increased.multiplier
			}
		}
	},
	poison_proof_potion = {
		buffs = {
			{
				name = "poison_proof_potion",
				remove_buff_func = "remove_deus_potion_buff",
				max_stacks = 1,
				icon = "potion_poison_proof",
				refresh_durations = true,
				perk = buff_perks.poison_proof,
				duration = MorrisBuffTweakData.poison_proof_potion.duration
			}
		}
	},
	poison_proof_potion_increased = {
		buffs = {
			{
				name = "poison_proof_potion_increased ",
				remove_buff_func = "remove_deus_potion_buff",
				max_stacks = 1,
				icon = "potion_poison_proof",
				refresh_durations = true,
				perk = buff_perks.poison_proof,
				duration = MorrisBuffTweakData.poison_proof_potion_increased.duration
			}
		}
	},
	mark_of_nurgle = {
		buffs = {
			{
				start_sound_event_name = "Play_curse_corrupted_flesh_loop",
				name = "mark_of_nurgle",
				mark_particle = "fx/deus_corrupted_flesh_01",
				buff_func = "remove_mark_of_nurgle",
				event = "on_death",
				remove_buff_func = "remove_mark_of_nurgle",
				apply_buff_func = "apply_mark_of_nurgle",
				stop_sound_event_name = "Stop_curse_corrupted_flesh_loop"
			},
			{
				event = "on_damage_dealt",
				name = "mark_of_nurgle_dot_attack",
				buff_func = "apply_mark_of_nurgle_dot"
			},
			{
				name = "mark_of_nurgle_death_explosion",
				radius = 5,
				cloud_life_time = 4,
				buff_func = "mark_of_nurgle_explosion",
				event = "on_death",
				initial_radius = 1,
				aoe_dot_damage_interval = 1,
				aoe_init_difficulty_damage = {
					5,
					5,
					5,
					5,
					5
				},
				aoe_dot_difficulty_damage = {
					10,
					10,
					10,
					10,
					10
				}
			},
			{
				remove_on_proc = true,
				name = "mark_of_nurgle_pingable",
				buff_func = "curse_khorne_champions_leader_death",
				event = "on_death",
				remove_buff_func = "remove_make_pingable",
				apply_buff_func = "apply_make_pingable"
			}
		}
	},
	curse_mark_of_nurgle_dot = {
		buffs = {
			{
				refresh_durations = true,
				name = "curse_mark_of_nurgle_dot",
				update_func = "apply_dot_damage",
				damage_profile = "curse_mark_of_nurgle_dot",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 1,
				time_between_dot_damages = 1,
				max_stacks = 1,
				duration = 3
			}
		}
	},
	curse_khorne_champions_aoe = {
		buffs = {
			{
				particle_fx = "fx/deus_curse_khorne_champions_leader",
				name = "curse_khorne_champions_leader",
				buff_func = "curse_khorne_champions_leader_death",
				event = "on_death",
				remove_buff_func = "remove_curse_khorne_champions_aoe",
				apply_buff_func = "apply_curse_khorne_champions_aoe",
				remove_on_proc = true,
				update_func = "update_curse_khorne_champions_aoe",
				in_range_units_buff_name = "curse_khorne_champions_buff",
				range_check = {
					unit_left_range_func = "unit_left_range_champions_aoe",
					radius = 8,
					update_rate = 1,
					unit_entered_range_func = "unit_entered_range_champions_aoe"
				}
			},
			{
				remove_on_proc = true,
				name = "curse_khorne_champions_aoe_pingable",
				buff_func = "curse_khorne_champions_leader_death",
				event = "on_death",
				remove_buff_func = "remove_make_pingable",
				apply_buff_func = "apply_make_pingable"
			},
			{
				unit_name = "units/props/deus_bloodgod_curse/deus_bloodgod_curse_01",
				name = "curse_khorne_champions_unit",
				buff_func = "remove_linked_unit",
				event = "on_death",
				remove_buff_func = "remove_linked_unit",
				apply_buff_func = "curse_khorne_champions_unit_link_unit",
				z_offset = {
					default = 2,
					chaos_raider = 2,
					beastmen_bestigor = 1.9,
					chaos_warrior = 2.4,
					skaven_storm_vermin_commander = 1.9,
					skaven_storm_vermin = 1.9,
					skaven_storm_vermin_with_shield = 1.9,
					skaven_storm_vermin_champion = 1.9
				}
			}
		}
	},
	curse_khorne_champions_buff = {
		buffs = {
			{
				remove_buff_func = "remove_max_health_buff_for_ai",
				name = "curse_khorne_champions_max_health",
				apply_buff_func = "apply_max_health_buff_for_ai",
				multiplier = 1
			},
			{
				remove_buff_func = "remove_attach_particle",
				name = "curse_khorne_champions_particle",
				apply_buff_func = "apply_attach_particle",
				particle_fx = "fx/deus_curse_khorne_champions_buff"
			}
		}
	},
	curse_skulls_of_fury = {
		buffs = {
			{
				name = "curse_skulls_of_fury",
				apply_buff_func = "trigger_skulls_of_fury_sound_event",
				sound_event_name = "Play_curse_skulls_of_fury_activated"
			},
			{
				decal = "units/decals/deus_decal_bloodstorm_outer",
				name = "curse_skulls_of_fury_decal",
				decal_z_offset = -2,
				decal_scale = 5,
				remove_buff_func = "remove_generic_decal",
				apply_buff_func = "apply_generic_decal"
			}
		}
	},
	curse_blood_storm_dot = {
		buffs = {
			{
				duration = 1,
				name = "curse_blood_storm_dot",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.5,
				time_between_dot_damages = 0.5,
				damage_profile = "blood_storm",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	curse_blood_storm_dot_bots = {
		buffs = {
			{
				duration = 1,
				name = "curse_blood_storm_dot",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.5,
				time_between_dot_damages = 0.5,
				damage_profile = "blood_storm_bots",
				update_func = "apply_dot_damage",
				reapply_buff_func = "reapply_dot_damage",
				perk = buff_perks.bleeding
			}
		}
	},
	curse_abundance_of_life = {
		buffs = {
			{
				update_func = "apply_dot_damage",
				name = "curse_abundance_of_life_dot",
				damage_percentage = 0.01,
				custom_dot_tick_func = "curse_abundance_of_life_custom_dot_tick",
				time_between_dot_damages = 2,
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 2
			},
			{
				event = "on_potion_consumed",
				name = "curse_abundance_of_life_heal_on_potions",
				bonus = 100,
				buff_func = "all_potions_heal_func"
			},
			{
				event = "on_potion_consumed",
				name = "curse_abundance_of_life_vo",
				dialogue_event = "curse_positive_effect_happened",
				buff_func = "trigger_dialogue_event"
			}
		}
	},
	blessing_of_grimnir_boss_buff = {
		buffs = {
			{
				multiplier = 0.5,
				name = "blessing_of_grimnir_boss_health_buff",
				stat_buff = "max_health",
				remove_buff_func = "remove_max_health_buff_for_ai",
				apply_buff_func = "apply_max_health_buff_for_ai"
			},
			{
				multiplier = 0.5,
				name = "blessing_of_grimnir_boss_damage_buff",
				stat_buff = "damage_dealt"
			}
		}
	},
	blessing_of_grimnir_player_buff = {
		buffs = {
			{
				name = "blessing_of_grimnir_player_buff",
				multiplier = 0.2,
				stat_buff = "max_health",
				is_persistent = true,
				icon = "bardin_ironbreaker_regen_stamina_on_block_broken"
			}
		}
	},
	curse_rotten_miasma = {
		buffs = {
			{
				update_func = "update_curse_rotten_miasma",
				name = "curse_rotten_miasma",
				buff_exposure_tick_rate = 1.3,
				remove_buff_func = "remove_curse_rotten_miasma",
				apply_buff_func = "apply_curse_rotten_miasma",
				miasma_stack_limit = 35,
				safe_area_radius = {
					8,
					8,
					8,
					8,
					8
				}
			}
		}
	},
	curse_rotten_miasma_debuff = {
		buffs = {
			{
				icon = "buff_icon_mutator_icon_slayer_curse",
				name = "curse_rotten_miasma_debuff",
				debuff = true,
				perk = buff_perks.slayer_curse
			},
			{
				activation_effect = "fx/screenspace_deus_miasma",
				name = "curse_rotten_miasma_effect",
				continuous_effect = "fx/screenspace_deus_miasma",
				max_stacks = 1,
				remove_buff_func = "remove_curse_rotten_miasma_debuff",
				apply_buff_func = "apply_curse_rotten_miasma_debuff"
			}
		}
	},
	curse_greed_pinata_drops = {
		buffs = {
			{
				name = "curse_greed_pinata_drops",
				buff_func = "curse_greed_pinata_death",
				event = "on_death",
				update_func = "update_curse_greed_pinata_drops",
				apply_buff_func = "apply_curse_greed_pinata_drops",
				total_drops = GreedPinataSettings.total_drops,
				drop_table = GreedPinataSettings.possible_drops
			}
		}
	},
	curse_greed_pinata_spawner = {
		buffs = {
			{
				particle_fx = "fx/deus_curse_khorne_champions_leader",
				name = "curse_greed_pinata_spawner",
				buff_func = "spawn_greed_pinata",
				event = "on_death",
				remove_buff_func = "remove_attach_particle",
				apply_buff_func = "apply_attach_particle"
			}
		}
	},
	blessing_of_shallya_buff = {
		buffs = {
			{
				name = "blessing_of_shallya_buff",
				perk = buff_perks.temp_to_permanent_health
			}
		}
	},
	stockpile_refresh_ammo_buffs = {
		buffs = {
			{
				event = "on_inventory_post_apply_buffs",
				name = "stockpile_refresh_ammo_buffs",
				buff_func = "stockpile_refresh_ammo_buffs"
			}
		}
	},
	deus_rally_flag_aoe_buff = {
		buffs = {
			{
				remove_buff_func = "remove_deus_rally_flag",
				name = "deus_rally_flag_lifetime",
				duration = 120
			},
			{
				name = "deus_rally_flag_aoe_buff",
				update_func = "update_generic_aoe",
				remove_buff_func = "remove_generic_aoe",
				apply_buff_func = "apply_generic_aoe",
				in_range_units_buff_name = "deus_rally_flag_buff",
				range_check = {
					radius = 5,
					update_rate = 0.01,
					only_players = true,
					unit_left_range_func = "unit_left_range_generic_buff",
					unit_entered_range_func = "unit_entered_range_generic_buff"
				}
			},
			{
				decal = "units/decals/decal_deus_rally_flag_01",
				name = "deus_rally_flag_aoe_decal",
				decal_scale = 5,
				remove_buff_func = "remove_generic_decal",
				apply_buff_func = "apply_generic_decal"
			}
		}
	},
	deus_rally_flag_buff = {
		buffs = {
			{
				icon = "markus_questing_knight_buff_health_regen",
				name = "deus_rally_flag_health_buff",
				stat_buff = "max_health",
				multiplier = 0.2
			},
			{
				heal = 5,
				name = "deus_rally_flag_health_regen_buff",
				heal_type = "health_regen",
				time_between_heal = 1,
				update_func = "health_regen_update",
				apply_buff_func = "health_regen_start"
			}
		}
	},
	blessing_of_isha_invincibility = {
		buffs = {
			{
				name = "blessing_of_isha_invincibility",
				perk = buff_perks.ignore_death
			}
		}
	},
	blessing_of_ranald_damage_taken = {
		buffs = {
			{
				multiplier = 0.2,
				name = "blessing_of_ranald_damage_taken",
				stat_buff = "damage_taken"
			}
		}
	},
	blessing_of_ranald_coins_greed = {
		buffs = {
			{
				multiplier = 0.5,
				name = "blessing_of_ranald_coins_greed",
				stat_buff = "deus_coins_greed"
			}
		}
	},
	objective_unit = {
		buffs = {
			{
				name = "objective_unit",
				buff_func = "remove_objective_unit",
				event = "on_death",
				remove_buff_func = "remove_objective_unit",
				apply_buff_func = "apply_objective_unit"
			}
		}
	},
	cursed_chest_objective_unit = {
		buffs = {
			{
				apply_buff_func = "apply_cursed_chest_init",
				name = "cursed_chest_init"
			},
			{
				name = "cursed_chest_objective_unit",
				buff_func = "remove_objective_unit",
				event = "on_death",
				remove_buff_func = "remove_objective_unit",
				apply_buff_func = "apply_objective_unit"
			}
		}
	},
	curse_empathy_shared_health_pool = {
		buffs = {
			{
				name = "shared_health_pool",
				perk = buff_perks.shared_health_pool_damage_only
			}
		}
	},
	we_deus_01_kerillian_critical_bleed_dot_disable = {
		buffs = {
			{
				name = "we_deus_01_kerillian_critical_bleed_dot_disable",
				perk = buff_perks.kerillian_critical_bleed_dot_disable
			}
		}
	},
	wh_deus_01_victor_witchhunter_bleed_on_critical_hit_disable = {
		buffs = {
			{
				name = "wh_deus_01_victor_witchhunter_bleed_on_critical_hit_disable",
				perk = buff_perks.victor_witchhunter_bleed_on_critical_hit_disable
			}
		}
	},
	we_deus_01_dot = {
		buffs = {
			{
				duration = 2,
				name = "we_deus_01_dot",
				end_flow_event = "smoke",
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "we_deus_01_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	we_deus_01_dot_fast = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "we_deus_01_dot_fast",
				ticks = 2,
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "we_deus_01_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	we_deus_01_dot_special_charged = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "we_deus_01_dot_special_charged",
				ticks = 4,
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "we_deus_01_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	we_deus_01_dot_charged = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "we_deus_01_dot_charged",
				ticks = 6,
				start_flow_event = "burn",
				death_flow_event = "burn_death",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				damage_type = "burninating",
				damage_profile = "we_deus_01_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	health_bar = {
		buffs = {
			{
				name = "health_bar",
				buff_func = "remove_health_bar",
				event = "on_death",
				remove_buff_func = "remove_health_bar",
				apply_buff_func = "apply_health_bar"
			}
		}
	},
	burning_magma_dot = {
		buffs = {
			{
				reapply_start_flow_event = true,
				name = "burning_magma_dot",
				remove_buff_func = "remove_dot_damage",
				end_flow_event = "smoke",
				duration = 3,
				death_flow_event = "burn_death",
				start_flow_event = "burn",
				update_start_delay = 0.75,
				max_stacks = 6,
				damage_type = "burninating",
				reapply_buff_func = "reapply_dot_damage",
				refresh_durations = true,
				apply_buff_func = "start_dot_damage",
				time_between_dot_damages = 0.75,
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	burning_magma_dot_infinite = {
		buffs = {
			{
				end_flow_event = "smoke",
				name = "infinite_burning_dot",
				start_flow_event = "burn_infinity",
				death_flow_event = "burn_death",
				on_max_stacks_overflow_func = "reapply_infinite_burn",
				remove_buff_func = "remove_dot_damage",
				apply_buff_func = "start_dot_damage",
				update_start_delay = 0.75,
				time_between_dot_damages = 0.75,
				max_stacks = 1,
				damage_type = "burninating",
				damage_profile = "burning_dot",
				update_func = "apply_dot_damage",
				perk = buff_perks.burning
			}
		}
	},
	deus_difficulty_tweak_boss_buff = {
		buffs = {
			{
				name = "deus_difficulty_tweak_boss_buff",
				apply_buff_func = "apply_max_health_buff_for_ai",
				remove_buff_func = "remove_max_health_buff_for_ai",
				variable_multiplier = {
					-0.25,
					0.25
				}
			}
		}
	},
	ledge_rescue = {
		buffs = {
			{
				rescue_delay = 0.5,
				name = "ledge_rescue",
				buff_func = "start_ledge_rescue_timer",
				event = "on_ledge_hang_start",
				update_func = "update_ledge_rescue",
				pull_up_duration = 1,
				perk = buff_perks.ledge_self_rescue
			}
		}
	},
	disable_rescue = {
		buffs = {
			{
				name = "disable_rescue",
				rescue_delay = 0.5,
				buff_func = "start_disable_rescue_timer",
				event = "on_player_disabled",
				update_func = "update_disable_rescue",
				explosion_template = "player_disabled_stagger",
				rescuable_disable_types = {
					pack_master_grab = true,
					assassin_pounced = true,
					corruptor_grab = true
				}
			}
		}
	},
	melee_wave_buff = {
		buffs = {
			{
				max_stacks = 3,
				name = "melee_wave_buff",
				icon = "deus_icon_melee_wave"
			}
		}
	},
	speed_over_stamina_buff = {
		buffs = {
			{
				name = "speed_over_stamina",
				stat_buff = "attack_speed",
				refresh_durations = true,
				max_stacks = 1,
				icon = "deus_icon_speed_over_stamina",
				duration = MorrisBuffTweakData.speed_over_stamina_buff.duration,
				multiplier = MorrisBuffTweakData.speed_over_stamina_buff.multiplier
			}
		}
	},
	missing_health_power_up_buff = {
		buffs = {
			{
				name = "missing_health_power_up_buff",
				stat_buff = "damage_taken",
				icon = "deus_icon_missing_health_power_up",
				multiplier = MorrisBuffTweakData.missing_health_power_up_buff.multiplier,
				max_stacks = MorrisBuffTweakData.missing_health_power_up_buff.max_stacks
			}
		}
	},
	detect_weakness_marked_enemy = {
		buffs = {
			{
				unit_name = "units/props/blk/blk_kill_the_marked",
				name = "detect_weakness_marked_enemy",
				buff_func = "remove_linked_unit",
				event = "on_death",
				remove_buff_func = "remove_linked_unit",
				apply_buff_func = "detect_weakness_link_unit",
				z_offset = {
					default = 2.2,
					chaos_raider = 2.2,
					skaven_storm_vermin_with_shield = 2.1,
					beastmen_bestigor = 2.2,
					chaos_berzerker = 2.2,
					skaven_clan_rat_with_shield = 2,
					chaos_marauder = 2.2,
					skaven_plague_monk = 2.1,
					chaos_marauder_with_shield = 2.2,
					chaos_fanatic = 2.2,
					skaven_slave = 1.9,
					skaven_clan_rat = 2,
					beastmen_ungor = 2.2,
					chaos_warrior = 2.6,
					skaven_storm_vermin_commander = 2.1,
					skaven_storm_vermin = 2.1,
					beastmen_gor = 2.2,
					skaven_storm_vermin_champion = 2.1
				}
			}
		}
	},
	detect_weakness_buff = {
		buffs = {
			{
				name = "detect_weakness_buff",
				stat_buff = "power_level",
				refresh_durations = true,
				max_stacks = 1,
				priority_buff = true,
				icon = "deus_icon_kill_the_marked",
				multiplier = MorrisBuffTweakData.detect_weakness_buff.multiplier,
				duration = MorrisBuffTweakData.detect_weakness_buff.duration
			}
		}
	},
	squats_build_up_buff = {
		buffs = {
			{
				name = "squats_build_up_buff",
				refresh_durations = true,
				duration = MorrisBuffTweakData.squats_build_up_buff.duration,
				max_stacks = MorrisBuffTweakData.squats_build_up_buff.max_stacks
			}
		}
	},
	squats_buff = {
		buffs = {
			{
				name = "squats_buff",
				stat_buff = "power_level",
				icon = "deus_icon_squats",
				max_stacks = 1,
				priority_buff = true,
				multiplier = MorrisBuffTweakData.squats_buff.multiplier,
				duration = MorrisBuffTweakData.squats_buff.duration
			}
		}
	},
	guaranteed_crit_buff = {
		buffs = {
			{
				name = "guaranteed_crit_buff",
				max_stacks = 1,
				buff_func = "dummy_function",
				event = "on_critical_action",
				icon = "bardin_ranger_linesman_unbalance",
				remove_on_proc = true,
				perk = buff_perks.guaranteed_crit
			}
		}
	},
	follow_up_guaranteed_crit_buff = {
		buffs = {
			{
				name = "follow_up_guaranteed_crit_buff",
				max_stacks = 1,
				buff_func = "dummy_function",
				event = "on_critical_action",
				icon = "deus_icon_buff_follow_up",
				priority_buff = true,
				remove_on_proc = true,
				perk = buff_perks.guaranteed_crit
			}
		}
	},
	wolfpack_buff = {
		buffs = {
			{
				name = "wolfpack_buff",
				stat_buff = "power_level",
				max_stacks = 4,
				icon = "deus_icon_wolfpack",
				multiplier = MorrisBuffTweakData.wolfpack_buff.multiplier
			}
		}
	},
	comradery_buff = {
		buffs = {
			{
				name = "comradery_buff",
				stat_buff = "power_level_melee",
				max_stacks = 4,
				icon = "deus_icon_comradery",
				multiplier = MorrisBuffTweakData.comradery_buff.multiplier
			}
		}
	},
	invigorating_strike_cooldown = {
		buffs = {
			{
				icon = "deus_icon_invigorating_strike",
				name = "invigorating_strike_cooldown",
				max_stacks = 1,
				is_cooldown = true,
				duration = MorrisBuffTweakData.invigorating_strike_cooldown.duration
			}
		}
	},
	staggering_force_buff = {
		buffs = {
			{
				name = "staggering_force_buff",
				stat_buff = "power_level",
				refresh_durations = true,
				max_stacks = 1,
				icon = "deus_icon_staggering_force",
				duration = MorrisBuffTweakData.staggering_force_buff.duration,
				multiplier = MorrisBuffTweakData.staggering_force_buff.multiplier
			}
		}
	},
	crescendo_strike_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "crescendo_strike_buff",
				stat_buff = "critical_strike_chance",
				icon = "deus_icon_buff_crescendo_strike",
				duration = MorrisBuffTweakData.crescendo_strike_buff.duration,
				max_stacks = MorrisBuffTweakData.crescendo_strike_buff.max_stacks,
				bonus = MorrisBuffTweakData.crescendo_strike_buff.bonus
			}
		}
	},
	lucky_buff = {
		buffs = {
			{
				name = "lucky_buff",
				stat_buff = "critical_strike_chance",
				max_stacks = 20,
				icon = "deus_icon_lucky",
				bonus = MorrisBuffTweakData.lucky_buff.bonus
			}
		}
	},
	hidden_escape_buff = {
		buffs = {
			{
				apply_buff_func = "hidden_escape_apply",
				name = "hidden_escape_buff",
				icon = "deus_icon_hidden_escape",
				remove_buff_func = "hidden_escape_remove",
				cooldown_buff = "hidden_escape_cooldown_buff",
				duration = MorrisBuffTweakData.hidden_escape_buff.duration
			},
			{
				event = "on_hit",
				name = "hidden_escape_on_hit",
				buff_func = "hidden_escape_on_hit"
			}
		}
	},
	hidden_escape_cooldown_buff = {
		buffs = {
			{
				is_cooldown = true,
				name = "hidden_escape_cooldown_buff",
				icon = "deus_icon_hidden_escape",
				duration = MorrisBuffTweakData.hidden_escape_cooldown_buff.duration
			}
		}
	},
	curative_empowerment_buff = {
		buffs = {
			{
				name = "curative_empowerment_buff",
				stat_buff = "power_level",
				refresh_durations = true,
				max_stacks = 5,
				icon = "deus_icon_curative_empowerment",
				multiplier = MorrisBuffTweakData.curative_empowerment_buff.multiplier,
				duration = MorrisBuffTweakData.curative_empowerment_buff.duration
			}
		}
	},
	pent_up_anger_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				name = "pent_up_anger_buff",
				on_max_stacks_overflow_func = "add_remove_buffs",
				on_max_stacks_func = "add_remove_buffs",
				icon = "deus_icon_pent_up_anger",
				max_stacks = MorrisBuffTweakData.pent_up_anger_buff.max_stacks,
				max_stack_data = {
					buffs_to_add = {
						"pent_up_anger_guaranteed_crit_buff"
					}
				}
			}
		}
	},
	pent_up_anger_guaranteed_crit_buff = {
		buffs = {
			{
				name = "pent_up_anger_guaranteed_crit_buff",
				max_stacks = 1,
				buff_func = "dummy_function",
				event = "on_critical_action",
				icon = "deus_icon_pent_up_anger",
				priority_buff = true,
				remove_on_proc = true,
				perk = buff_perks.guaranteed_crit
			}
		}
	},
	surprise_strike_guaranteed_crit_buff = {
		buffs = {
			{
				icon = "deus_icon_surprise_strike",
				name = "surprise_strike_guaranteed_crit_buff",
				perk = buff_perks.guaranteed_crit,
				duration = MorrisBuffTweakData.surprise_strike_guaranteed_crit_buff.duration
			}
		}
	},
	bad_breath_cooldown_buff = {
		buffs = {
			{
				is_cooldown = true,
				name = "bad_breath_cooldown_buff",
				icon = "deus_icon_bad_breath",
				duration = MorrisBuffTweakData.bad_breath_cooldown_buff.duration
			}
		}
	},
	boulder_bro_buff = {
		buffs = {
			{
				buff_to_add = "boulder_bro_cooldown_buff",
				rescue_delay = 0.5,
				name = "boulder_bro_perk",
				buff_func = "start_boulder_bro_timer",
				event = "on_ledge_hang_start",
				remove_buff_func = "boulder_bro_add_buff",
				update_func = "update_boulder_bro",
				pull_up_duration = 1,
				perk = buff_perks.ledge_self_rescue
			}
		}
	},
	boulder_bro_cooldown_buff = {
		buffs = {
			{
				buff_to_add = "boulder_bro_buff",
				name = "boulder_bro_cooldown_buff",
				icon = "deus_icon_boulder_bro",
				is_cooldown = true,
				remove_buff_func = "boulder_bro_add_buff",
				duration = MorrisBuffTweakData.boulder_bro_cooldown_buff.duration
			}
		}
	},
	static_blade_cooldown_buff = {
		buffs = {
			{
				is_cooldown = true,
				name = "static_blade_cooldown_buff",
				icon = "deus_icon_static_blade",
				duration = MorrisBuffTweakData.static_blade_cooldown_buff.duration
			}
		}
	},
	home_run = {
		buffs = {
			{
				multiplier = 10,
				name = "home_run",
				stat_buff = "hit_force"
			},
			{
				multiplier = 0.5,
				name = "home_run_hit_mass_reduction",
				stat_buff = "applied_stagger_distance"
			},
			{
				multiplier = 0.4,
				name = "home_run_impact",
				stat_buff = "power_level_impact"
			},
			{
				sound_event = "boon_homerun",
				name = "home_run_sound",
				cooldown = 0.25,
				buff_func = "home_run_sound",
				event = "on_body_pushed"
			}
		}
	},
	shield_splinters = {
		buffs = {
			{
				event = "on_broke_shield",
				name = "shield_splinters",
				explosion_template = "shield_splinters",
				buff_func = "shield_splinters_explosion"
			}
		}
	},
	refilling_shot = {
		create_parent_buff_shared_table = true,
		buffs = {
			{
				event = "on_start_action",
				name = "refilling_shot",
				buff_func = "refilling_shot_on_start_action"
			},
			{
				event = "on_ammo_used",
				name = "refilling_shot_on_ammo_used",
				buff_func = "refilling_shot_on_ammo_used"
			},
			{
				event = "on_critical_hit",
				name = "refilling_shot_critical_hit_ammo_reload",
				buff_func = "refilling_shot_on_critical_hit"
			}
		}
	},
	piercing_projectiles = {
		buffs = {
			{
				name = "piercing_projectiles",
				stat_buff = "ranged_additional_penetrations",
				bonus = MorrisBuffTweakData.piercing_projectiles.bonus
			}
		}
	},
	serrated_blade = {
		buffs = {
			{
				name = "serrated_blade",
				perk = buff_perks.generic_melee_bleed
			}
		}
	},
	crescendo_strike = {
		buffs = {
			{
				event = "on_critical_hit",
				name = "crescendo_strike",
				buff_to_add = "crescendo_strike_buff",
				buff_func = "crescendo_strike_on_crit"
			}
		}
	},
	follow_up = {
		buffs = {
			{
				name = "follow_up",
				blocker_buff = "follow_up_cooldown",
				buff_func = "add_buffs_on_melee_headshot",
				event = "on_hit",
				buffs_to_add = {
					"follow_up_guaranteed_crit_buff",
					"follow_up_cooldown"
				}
			}
		}
	},
	follow_up_cooldown = {
		buffs = {
			{
				name = "follow_up_cooldown",
				duration = MorrisBuffTweakData.follow_up_cooldown.duration
			}
		}
	},
	deus_extra_shot = {
		buffs = {
			{
				name = "deus_extra_shot",
				stat_buff = "extra_shot",
				bonus = MorrisBuffTweakData.deus_extra_shot.bonus
			}
		}
	},
	always_blocking = {
		buffs = {
			{
				buff_to_add = "deus_always_blocking_buff",
				name = "always_blocking",
				update_func = "always_blocking_update",
				remove_buff_func = "always_blocking_remove",
				apply_buff_func = "always_blocking_init"
			},
			{
				event = "on_block_broken",
				name = "block_broken_remove_buff",
				buff_func = "always_blocking_temporarily_remove"
			}
		}
	},
	deus_big_swing_stagger = {
		buffs = {
			{
				buff_to_add = "deus_big_swing_stagger_buff",
				name = "deus_big_swing_stagger",
				buff_func = "deus_big_swing_stagger_on_hit",
				event = "on_hit",
				targets_to_hit = MorrisBuffTweakData.deus_big_swing_stagger_buff.targets_to_hit
			}
		}
	},
	deus_always_blocking_buff = {
		buffs = {
			{
				remove_buff_func = "remove_always_blocking",
				name = "deus_always_blocking_buff",
				apply_buff_func = "apply_always_blocking"
			}
		}
	},
	deus_always_blocking_lock_out = {
		buffs = {
			{
				refresh_durations = true,
				name = "deus_always_blocking_lock_out",
				icon = "deus_icon_always_blocking_01",
				debuff = true,
				max_stacks = 1,
				duration = 10
			}
		}
	},
	deus_big_swing_stagger_buff = {
		buffs = {
			{
				refresh_durations = true,
				name = "deus_big_swing_stagger_buff",
				stat_buff = "power_level_impact",
				icon = "deus_icon_big_swing_stagger",
				max_stacks = 1,
				duration = MorrisBuffTweakData.deus_big_swing_stagger_buff.duration,
				multiplier = MorrisBuffTweakData.deus_big_swing_stagger_buff.multiplier
			}
		}
	},
	deus_ammo_pickup_reload_speed_buff = {
		buffs = {
			{
				name = "deus_ammo_pickup_reload_speed_buff",
				stat_buff = "reload_speed",
				refresh_durations = true,
				remove_buff_func = "remove_ammo_reload_speed_buff",
				apply_buff_func = "apply_ammo_reload_speed_buff",
				max_stacks = 1,
				icon = "deus_icon_ammo_pickup_reload_speed",
				multiplier = MorrisBuffTweakData.deus_ammo_pickup_reload_speed_buff.multiplier,
				duration = MorrisBuffTweakData.deus_ammo_pickup_reload_speed_buff.duration
			}
		}
	},
	deus_ammo_pickup_reload_speed = {
		buffs = {
			{
				name = "deus_ammo_pickup_reload_speed",
				authority = "client",
				buff_func = "add_buff_on_pickup",
				event = "on_consumable_picked_up",
				pickup_types = {
					ammo = {
						"deus_ammo_pickup_reload_speed_buff"
					}
				}
			}
		}
	},
	deus_crit_chain_lightning = {
		buffs = {
			{
				sound_event = "morris_power_ups_lightning_strike",
				name = "deus_crit_chain_lightning",
				authority = "server",
				buff_func = "chain_lightning",
				event = "on_player_damage_dealt",
				damage_profile = "beam_shot",
				particle_name = "",
				damage_source = "buff",
				max_targets = MorrisBuffTweakData.deus_crit_chain_lightning.max_targets,
				max_chain_range = MorrisBuffTweakData.deus_crit_chain_lightning.max_chain_range
			}
		}
	},
	deus_ranged_crit_explosion = {
		buffs = {
			{
				sound_event = "morris_power_ups_ammo_explosion",
				name = "deus_ranged_crit_explosion",
				authority = "server",
				buff_func = "deus_ranged_crit_explosion_on_damage_dealt",
				event = "on_hit",
				cooldown_buff = "deus_ranged_crit_explosion_cooldown",
				explosion_template = "deus_ranged_crit_explosion",
				valid_attack_types = {
					instant_projectile = true,
					projectile = true
				},
				power_scale = MorrisBuffTweakData.deus_ranged_crit_explosion.multiplier
			}
		}
	},
	deus_ranged_crit_explosion_cooldown = {
		buffs = {
			{
				name = "deus_ranged_crit_explosion_cooldown",
				icon = "deus_ranged_crit_explosion",
				duration = MorrisBuffTweakData.deus_ranged_crit_explosion.cooldown_duration
			}
		}
	},
	deus_collateral_damage_on_melee_killing_blow = {
		buffs = {
			{
				name = "deus_collateral_damage_on_melee_killing_blow",
				authority = "server",
				buff_func = "deus_collateral_damage_on_melee_killing_blow_func",
				event = "on_kill",
				sound_event = "morris_power_ups_extra_damage",
				max_range = MorrisBuffTweakData.deus_collateral_damage_on_melee_killing_blow.max_range,
				proc_chance = MorrisBuffTweakData.deus_collateral_damage_on_melee_killing_blow.proc_chance
			}
		}
	},
	health_orb = {
		buffs = {
			{
				name = "health_orb",
				apply_buff_func = "health_orb_apply_func",
				duration = 0,
				granted_health = MorrisBuffTweakData.health_orbs.orb_health
			}
		}
	},
	static_charge = {
		buffs = {
			{
				activation_effect = "fx/screenspace_potion_01",
				name = "static_charge",
				update_func = "update_static_charge",
				refresh_durations = true,
				remove_buff_func = "remove_static_charge",
				apply_buff_func = "start_static_charge",
				explosion_template = "static_charge",
				icon = "twitch_icon_heavens_lightning",
				tick_every_t = 1,
				duration = MorrisBuffTweakData.static_charge.orb_duration
			}
		}
	},
	protection_orb = {
		buffs = {
			{
				name = "protection_orb",
				stat_buff = "damage_taken",
				icon = "deus_icon_protection",
				max_stacks = 1,
				multiplier = MorrisBuffTweakData.protection_orb.multiplier,
				duration = MorrisBuffTweakData.protection_orb.duration
			}
		}
	},
	focused_accuracy_cooldown = {
		buffs = {
			{
				name = "focused_accuracy_cooldown",
				debuff = true,
				is_cooldown = true,
				icon = "deus_icon_focussed_accuracy",
				duration = MorrisBuffTweakData.focused_accuracy.cooldown_duration
			}
		}
	},
	ability_cooldown_reduction_orb = {
		buffs = {
			{
				name = "ability_cooldown_reduction_orb",
				stat_buff = "cooldown_regen",
				refresh_durations = true,
				max_stacks = 1,
				icon = "deus_icon_focussed_accuracy",
				multiplier = MorrisBuffTweakData.ability_cooldown_reduction_orb.multiplier,
				duration = MorrisBuffTweakData.ability_cooldown_reduction_orb.duration
			}
		}
	},
	resolve_cooldown_buff = {
		buffs = {
			{
				is_cooldown = true,
				name = "resolve_cooldown_buff",
				icon = "deus_icon_resolve",
				duration = MorrisBuffTweakData.resolve.cooldown
			}
		}
	},
	resolve_buff = {
		buffs = {
			{
				name = "resolve_buff",
				perk = buff_perks.full_health_revive
			}
		}
	}
}

table.merge_recursive(dlc_settings.buff_templates, DeusPowerUpBuffTemplates)
