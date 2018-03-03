require("scripts/flow/flow_callbacks_ai")
require("scripts/flow/flow_callbacks_enemy")
require("scripts/flow/flow_callbacks_progression")
require("core/wwise/lua/wwise_flow_callbacks")
require("core/volumetrics/lua/volumetrics_flow_callbacks")
require("scripts/helpers/nav_tag_volume_utils")
require("scripts/settings/difficulty_settings")

local flow_return_table = Boot.flow_return_table

function flow_callback_define_spawn(params)
	return 
end

function flow_callback_show_gdc_intro(params)
	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit and Unit.alive(player_unit) then
		local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

		hud_extension.gdc_intro_active(hud_extension, true)
	end

	return 
end

function flow_callback_animation_callback(params)
	Managers.state.event:trigger("animation_callback", params.unit, params.callback, params.param1)

	return 
end

function flow_callback_disable_animation_state_machine(params)
	Unit.disable_animation_state_machine(params.unit)

	return 
end

function flow_callback_enable_actor_draw(params)
	Managers.state.debug:enable_actor_draw(params.actor, params.color)

	return 
end

function flow_callback_disable_actor_draw(params)
	Managers.state.debug:disable_actor_draw(params.actor)

	return 
end

function flow_callback_set_start_area(params)
	Managers.state.entity:system("round_started_system"):set_start_area(params.volume_name)

	return 
end

function flow_callback_add_coop_spawn_point(params)
	Managers.state.spawn:flow_callback_add_spawn_point(params.unit)

	return 
end

function flow_callback_set_checkpoint(params)
	Managers.state.spawn:flow_callback_set_checkpoint(params.no_spawn_volume, params.safe_zone_volume, params.unit1, params.unit2, params.unit3, params.unit4)

	return 
end

function flow_callback_activate_spawning(params)
	return 
end

function flow_callback_grimoire_destroyed(params)
	return 
end

function flow_callback_tome_destroyed(params)
	return 
end

function debug_print_random_values()
	local world = Application.main_world()
	local debug_table = World.get_data(world, "debug_level_seed")

	for _, debug in ipairs(debug_table) do
		print(debug)
	end

	return 
end

local function server_seeded_random(min, max, debug_name)
	local world = Application.flow_callback_context_world()
	local seed = World.get_data(world, "level_seed")

	fassert(seed, "Trying to use server seeded random without level seed being set. Is this attempted after level_loaded flow has been finished?")

	local new_seed, rnd = Math.next_random(seed, min, max)

	World.set_data(world, "level_seed", new_seed)

	if script_data.debug_server_seeded_random then
		local debug_table = World.get_data(world, "debug_level_seed")
		local index = #debug_table + 1
		debug_table[index] = string.format("%4.d:%s rnd: %f old seed: %d new seed: %d", index, tostring(debug_name), rnd, seed, new_seed)
	end

	return rnd
end

function flow_callback_query_server_seeded_random_int(params)
	local rnd = server_seeded_random(params.min or 0, params.max or 1, params.debug_name)
	flow_return_table.value = rnd

	return flow_return_table
end

function flow_callback_query_server_seeded_random_float(params)
	local min = params.min or 0
	local max = params.max or 1
	local rnd = server_seeded_random(nil, nil, params.debug_name)
	flow_return_table.value = min + rnd*(max - min)

	return flow_return_table
end

function flow_callback_server_seeded_randomize(params)
	local max = params.max or 8
	local rnd = server_seeded_random(1, max, params.debug_name)
	local ret = {
		[tostring(rnd)] = true
	}

	return ret
end

function flow_callback_switchcase(params)
	local ret = {}
	local outStr = "out"

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" and params.case == v then
				ret[outStr .. string.sub(k, -1)] = true
			end
		end
	end

	return ret
end

function flow_callback_switchcase_special(params)
	local ret = {}
	local outStr = "out"
	local i = nil

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" then
				i = string.sub(k, -1)

				if params.case == tonumber(i) then
					ret[outStr .. i] = true
					ret.out_number = tonumber(i)
				end
			end
		end
	end

	return ret
end

function flow_callback_switchcase_range(params)
	local ret = {}
	local outStr = "out"

	if params.case ~= "" then
		print(params.case)

		for k, v in pairs(params) do
			if k ~= "case" then
				local number = {}

				for n in string.gmatch(v, "(%d+)") do
					table.insert(number, tonumber(n))
				end

				if number[1] ~= nil and number[2] ~= nil and number[1] <= params.case and params.case <= number[2] then
					ret[outStr .. string.sub(k, -1)] = true
				end
			end
		end
	end

	return ret
end

function flow_callback_relay_trigger(params)
	return {
		out = true
	}
end

function flow_callback_randomize_sequential_numbers(params)
	local max = params.max
	local numbers = {}

	for j = 1, max, 1 do
		numbers[j] = j
	end

	for i = 1, 10, 1 do
		local random1 = server_seeded_random(1, max, params.debug_name)
		local random2 = server_seeded_random(1, max, params.debug_name)
		numbers[random2] = numbers[random1]
		numbers[random1] = numbers[random2]
	end

	local ret = {}

	for k = 1, max, 1 do
		ret[tostring(k)] = numbers[k]
	end

	return ret
end

function flow_callback_select_output_by_number(params)
	local num = params.num
	local output = params[tostring(num)]
	local ret = {
		["out_" .. tostring(output)] = true
	}

	return ret
end

local player_units = PLAYER_UNITS

function flow_query_number_of_active_players(params)
	local output_value = 0
	local num_player_units = #player_units

	for i = 1, num_player_units, 1 do
		local unit = player_units[i]
		local status_extension = ScriptUnit.extension(unit, "status_system")

		if not status_extension.is_disabled(status_extension) then
			output_value = output_value + 1
		end
	end

	print("flow_query_number_of_active_players:", output_value)

	flow_return_table.value = output_value

	return flow_return_table
end

function flow_callback_play_music(params)
	Managers.music:trigger_event(params.event)

	return 
end

function flow_callback_idle_camera_dummy_spawned(params)
	local entity_manager = Managers.state.entity
	local camera_system = entity_manager.system(entity_manager, "camera_system")

	camera_system.idle_camera_dummy_spawned(camera_system, params.unit)

	return 
end

function flow_callback_pickup_gizmo_spawned(params)
	local entity_manager = Managers.state.entity
	local pickup_system = entity_manager.system(entity_manager, "pickup_system")

	if pickup_system then
		pickup_system.pickup_gizmo_spawned(pickup_system, params.unit)
	end

	return 
end

function flow_callback_boss_gizmo_spawned(params)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		conflict_director.level_analysis:boss_gizmo_spawned(params.unit)
	end

	return 
end

function flow_callback_generic_ai_node_spawned(params)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		conflict_director.level_analysis:generic_ai_node_spawned(params.unit)
	end

	return 
end

function flow_callback_respawn_unit_spawned(params)
	Managers.state.spawn.respawn_handler:respawn_unit_spawned(params.unit)

	return 
end

function flow_callback_activate_triggered_pickup_spawners(params)
	local entity_manager = Managers.state.entity
	local pickup_system = entity_manager.system(entity_manager, "pickup_system")
	local spawned_unit = nil

	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		spawned_unit = pickup_system.activate_triggered_pickup_spawners(pickup_system, params.triggered_spawn_id)
	end

	flow_return_table.spawned_pickup_unit = spawned_unit

	return flow_return_table
end

function flow_query_wielded_weapon(params)
	local player_unit = params.player_unit
	local equipment = nil

	if ScriptUnit.has_extension(player_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		equipment = inventory_extension.equipment(inventory_extension)
	else
		equipment = Unit.get_data(player_unit, "equipment")
	end

	local right_hand_wielded_unit_3p = equipment.right_hand_wielded_unit_3p
	local right_hand_ammo_unit_3p = equipment.right_hand_ammo_unit_3p
	local right_hand_wielded_unit = equipment.right_hand_wielded_unit
	local right_hand_ammo_unit_1p = equipment.right_hand_ammo_unit_1p
	local left_hand_wielded_unit_3p = equipment.left_hand_wielded_unit_3p
	local left_hand_ammo_unit_3p = equipment.left_hand_ammo_unit_3p
	local left_hand_wielded_unit = equipment.left_hand_wielded_unit
	local left_hand_ammo_unit_1p = equipment.left_hand_ammo_unit_1p
	flow_return_table.righthandweapon3p = right_hand_wielded_unit_3p
	flow_return_table.righthandammo3p = right_hand_ammo_unit_3p
	flow_return_table.righthandweapon = right_hand_wielded_unit
	flow_return_table.righthandammo1p = right_hand_ammo_unit_1p
	flow_return_table.lefthandweapon3p = left_hand_wielded_unit_3p
	flow_return_table.lefthandammo3p = left_hand_ammo_unit_3p
	flow_return_table.lefthandweapon = left_hand_wielded_unit
	flow_return_table.lefthandammo1p = left_hand_ammo_unit_1p

	return flow_return_table
end

function flow_camera_shake(params)
	DamageUtils.camera_shake_by_distance(params.shake_name, Managers.time:time("game"), params.player_unit, params.shake_unit, params.near_distance, params.far_distance, params.near_shake_scale, params.far_shake_scale)

	return 
end

function flow_register_unit_extensions(params)
	local unit = params.unit
	local unit_template = Unit.get_data(unit, "unit_template")

	assert(unit_template)

	local world = Application.main_world()
	local extension_init_data = {
		navgraph_system = {
			nav_world = GLOBAL_AI_NAVWORLD
		}
	}

	Managers.state.unit_spawner:create_unit_extensions(world, unit, unit_template, extension_init_data)

	return 
end

function flow_callback_debug_print_unit_actor(params)
	print("FLOW DEBUG: Unit: ", tostring(params.unit), "Actor: ", tostring(params.actor))

	return 
end

function flow_callback_trigger_event(params)
	Unit.flow_event(params.unit, params.event)

	return 
end

function flow_callback_play_network_synched_particle_effect(params)
	local effect_name = params.effect
	local unit = params.unit
	local object_name = params.object
	local offset = params.offset or Vector3(0, 0, 0)
	local rotation_offset = params.rotation_offset or Quaternion.identity()
	local linked = params.linked or false
	local network_manager = Managers.state.network
	local game = network_manager.game(network_manager)
	local game_object_id = unit and linked and network_manager.unit_game_object_id(network_manager, unit)

	assert(game, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect with no network game running.")
	assert(not unit or not linked or game_object_id, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect linked to unit not network_synched.")
	assert(unit or not object_name, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect at object in unit without defining unit.")

	local object = (unit and object_name and Unit.node(unit, object_name)) or 0

	Managers.state.event:trigger("event_play_particle_effect", effect_name, unit, object, offset, rotation_offset, linked)

	if unit and not game_object_id then
		local global_transform = Unit.world_pose(unit, object)
		local local_transform = Matrix4x4.from_quaternion_position(rotation_offset, offset)
		local transform = Matrix4x4.multiply(local_transform, global_transform)
		offset = Matrix4x4.translation(transform)
		rotation_offset = Matrix4x4.rotation(transform)
	end

	if Managers.player.is_server then
		network_manager.network_transmit:send_rpc_clients("rpc_play_particle_effect", NetworkLookup.effects[effect_name], game_object_id or 0, object, offset, rotation_offset, linked)
	else
		network_manager.network_transmit:send_rpc_server("rpc_play_particle_effect", NetworkLookup.effects[effect_name], game_object_id or 0, object, offset, rotation_offset, linked)
	end

	return 
end

function flow_callback_output_debug_screen_text(params)
	local text_size = params.text_size
	local time = params.time
	local color = params.color or Vector3(255, 255, 255)

	if not params.text_id then
		print("Missing text id at:", Script.callstack())

		return 
	end

	Managers.state.debug_text:output_screen_text(Localize(params.text_id), text_size, time, color)

	return 
end

function flow_callback_debug_crash_game(params)
	if Application.crash then
		local crash_type = params.type or "access_violation"

		Application.crash(crash_type)
	end

	return 
end

function flow_callback_reload_level(params)
	if Managers.player.is_server then
		Managers.state.game_mode:retry_level()
	end

	return 
end

function flow_callback_complete_level(params)
	if Managers.player.is_server then
		Managers.state.game_mode:complete_level()
	end

	return 
end

function flow_callback_fail_level(params)
	if Managers.player.is_server then
		Managers.state.game_mode:fail_level()
	end

	return 
end

function flow_callback_menu_camera_dummy_spawned(params)
	Managers.state.event:trigger("menu_camera_dummy_spawned", params.camera_name, params.unit)

	return 
end

function flow_callback_menu_alignment_dummy_spawned(params)
	Managers.state.event:trigger("menu_alignment_dummy_spawned", params.alignment_name, params.unit)

	return 
end

function flow_callback_block_profile_menu_accept_button(params)
	local unit = params.unit
	local player = Managers.player:players()[Network.peer_id()]
	local player_unit = player.player_unit

	if Unit.alive(player_unit) and player_unit == unit then
		global_profile_view:block_accept_button(true)
	end

	return 
end

function flow_callback_unblock_profile_menu_accept_button(params)
	local unit = params.unit
	local player = Managers.player:players()[Network.peer_id()]
	local player_unit = player.player_unit

	if Unit.alive(player_unit) and player_unit == unit then
		global_profile_view:block_accept_button(false)
	end

	return 
end

function flow_callback_event_enable_level_select(params)
	Managers.state.event:trigger("event_enable_level_select")

	return 
end

function flow_callback_set_actor_enabled(params)
	local unit = params.unit

	assert(unit, "Set Actor Enabled flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Enabled flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_collision_enabled(actor, params.enabled)
	Actor.set_scene_query_enabled(actor, params.enabled)

	return 
end

function flow_callback_set_actor_kinematic(params)
	local unit = params.unit

	assert(unit, "Set Actor Kinematic flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Kinematic flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_kinematic(actor, params.enabled)

	return 
end

function flow_callback_spawn_actor(params)
	local unit = params.unit

	assert(unit, "Spawn Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.create_actor(unit, actor)

	return 
end

function flow_callback_destroy_actor(params)
	local unit = params.unit

	assert(unit, "Destroy Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.destroy_actor(unit, actor)

	return 
end

function flow_callback_set_actor_initial_velocity(params)
	local unit = params.unit

	assert(unit, "Set actor initial velocity has no unit")
	Unit.apply_initial_actor_velocities(unit, true)

	return 
end

function flow_callback_set_unit_material_variation(params)
	local unit = params.unit
	local material_variation = params.material_variation

	Unit.set_material_variation(unit, material_variation)

	return 
end

function flow_callback_setup_profiling_level_step_1()
	local mouse_fun = Mouse.pressed
	Mouse.pressed = function (button_index)
		if button_index == 0 then
			Mouse.pressed = mouse_fun

			return true
		else
			return false
		end

		return 
	end

	return 
end

function flow_callback_setup_profiling_level_step_2()
	local keyboard_fun = Keyboard.pressed
	Keyboard.pressed = function (button_index)
		if button_index == 120 then
			Keyboard.pressed = keyboard_fun

			return true
		else
			return false
		end

		return 
	end

	return 
end

function flow_callback_setup_profiling_level_step_3()
	local cameras = Managers.state.entity:system("cutscene_system")._cameras
	local profiling_camera = nil

	for camera_name, camera in pairs(cameras) do
		if camera_name == "profiling_camera" then
			profiling_camera = camera
		end
	end

	local unit = profiling_camera._unit
	local unit_pose = Unit.world_pose(unit, 0)
	local world = Application.main_world()
	local world_name = ScriptWorld.name(world)
	local viewport = ScriptWorld.global_free_flight_viewport(world, world_name)
	local free_flight_camera = ScriptViewport.camera(viewport)

	ScriptCamera.set_local_pose(free_flight_camera, unit_pose)
	Managers.state.event:trigger("force_close_ingame_menu")

	return 
end

function flow_callback_play_footstep_surface_material_effects(params)
	EffectHelper.flow_cb_play_footstep_surface_material_effects(params.effect_name, params.unit, params.object, params.foot_direction)

	return 
end

function flow_callback_play_surface_material_effect(params)
	local hit_unit = params.hit_unit
	local world = Unit.world(hit_unit)
	local sound_character, player_unit = nil
	local normal = params.normal
	local rotation = Quaternion.look(params.normal, Vector3.up())

	EffectHelper.play_surface_material_effects(params.effect_name, world, hit_unit, params.position, rotation, normal, sound_character, player_unit, params.husk)

	return 
end

function flow_callback_play_voice(params)
	local playing_unit = params.playing_unit
	local event_name = params.event_name
	local use_occlusion = params.use_occlusion or false
	local lol = math.random()
	local dialogue_input = ScriptUnit.has_extension_input(playing_unit, "dialogue_system")

	if dialogue_input then
		dialogue_input.play_voice(dialogue_input, event_name, use_occlusion)
	end

	return 
end

function flow_callback_foot_step(params)
	local unit = params.unit

	return 
end

function flow_callback_is_local_player(params)
	local unit = params.unit
	local player = Managers.player:players()[1]
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		if unit == player_unit then
			flow_return_table.is_player = true
			flow_return_table.is_not_player = false
		else
			flow_return_table.is_player = false
			flow_return_table.is_not_player = true
		end
	else
		flow_return_table.is_player = false
		flow_return_table.is_not_player = true
	end

	return flow_return_table
end

function flow_callback_get_unit_type(params)
	local unit = params.unit
	local breed = Unit.get_data(unit, "breed")
	local bot = Unit.get_data(unit, "bot")

	if breed or bot then
		flow_return_table.is_local_player = false
		flow_return_table.is_remote_player = false
		flow_return_table.is_ai = true
		flow_return_table.is_environment = false
	else
		local player_unit = Managers.player:owner(unit)

		if player_unit ~= nil then
			if player_unit.remote then
				flow_return_table.is_local_player = true
				flow_return_table.is_remote_player = false
				flow_return_table.is_ai = false
				flow_return_table.is_environment = false
			else
				flow_return_table.is_local_player = false
				flow_return_table.is_remote_player = true
				flow_return_table.is_ai = false
				flow_return_table.is_environment = false
			end
		else
			flow_return_table.is_local_player = false
			flow_return_table.is_remote_player = false
			flow_return_table.is_ai = false
			flow_return_table.is_environment = true
		end
	end

	return flow_return_table
end

function flow_callback_trigger_sound(params)
	local wwise_world = nil

	if params.world_name then
		local world = Managers.world:world(params.world_name)
		wwise_world = Managers.world:wwise_world(world)
	else
		local world = Application.main_world()
		wwise_world = Managers.world:wwise_world(world)
	end

	if params.unit then
		if params.actor then
			WwiseWorld.trigger_event(wwise_world, params.event, param.use_occlusion, params.unit, Unit.actor(params.unit, params.actor))
		else
			WwiseWorld.trigger_event(wwise_world, params.event, param.use_occlusion, params.unit)
		end
	elseif params.position then
		WwiseWorld.trigger_event(wwise_world, params.event, param.use_occlusion, params.position)
	else
		WwiseWorld.trigger_event(wwise_world, params.event)
	end

	return 
end

function flow_callback_print_variable(params)
	print(params.string, params.variable)

	return 
end

function flow_callback_set_environment(params)
	local environment_name = params.environment_name
	local time = params.time

	Managers.state.event:trigger("set_environment", environment_name, time)

	return 
end

function flow_callback_start_bus_transition(params)
	Managers.music:start_bus_transition(params.bus_name, params.target_value, params.duration, params.transition_type, params.from_value)

	return 
end

function flow_callback_game_mode_event(params)
	local announcement = params.announcement
	local side = params.side
	local param_1 = params.param_1 or ""
	local param_2 = params.param_2 or ""

	Managers.state.game_mode:trigger_event("flow", announcement, side, param_1, param_2)

	return 
end

function flow_callback_thrown_projectile_bounce(params)
	local unit = params.unit

	if Unit.alive(unit) and ScriptUnit.has_extension(unit, "projectile_system") then
		local ext = ScriptUnit.extension(unit, "projectile_system")

		ext.flow_cb_bounce(ext, params.hit_unit, params.hit_actor, params.position, params.normal)
	end

	return 
end

function flow_callback_mark_sack_for_linking(params)
	local unit = params.unit

	Unit.set_data(unit, "link_to_unit", true)

	return 
end

function flow_callback_remove_link_mark_for_sack(params)
	local unit = params.unit

	Unit.set_data(unit, "link_to_unit", nil)

	return 
end

function flow_callback_start_network_timer(params)
	if Managers.player.is_server then
		local time = params.time

		Managers.state.event:trigger("event_start_network_timer", time)
	end

	return 
end

function flow_callback_set_flow_object_set_enabled(params)
	assert(params.set, "[Flow Callback : Set Flow Object Set Enabled] No set set.")
	assert(params.enabled ~= nil, "[Flow Callback : Set Flow Object Set Enabled] No enabled set.")
	Managers.state.game_mode:flow_cb_set_flow_object_set_enabled(params.set, params.enabled)

	return 
end

flow_cb_set_flow_object_set_enabled = flow_callback_set_flow_object_set_enabled

function flow_callback_create_networked_flow_state(params)
	local created, out_value = Managers.state.networked_flow_state:flow_cb_create_state(params.unit, params.state_name, params.in_value, params.client_state_changed_event, params.client_hot_join_event)

	if created then
		flow_return_table.created = created
		flow_return_table.out_value = out_value

		return flow_return_table
	end

	return 
end

function flow_callback_change_networked_flow_state(params)
	local changed, out_value = Managers.state.networked_flow_state:flow_cb_change_state(params.unit, params.state_name, params.in_value)

	if changed then
		flow_return_table.changed = changed
		flow_return_table.out_value = out_value

		return flow_return_table
	end

	return 
end

function flow_callback_get_networked_flow_state(params)
	local out_value = Managers.state.networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
	flow_return_table.out_value = out_value

	return flow_return_table
end

function flow_callback_client_networked_flow_state_changed(params)
	local out_value = Managers.state.networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
	flow_return_table.changed = true
	flow_return_table.out_value = out_value

	return flow_return_table
end

function flow_callback_client_networked_flow_state_set(params)
	local out_value = Managers.state.networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
	flow_return_table.set = true
	flow_return_table.out_value = out_value

	return flow_return_table
end

function flow_callback_create_networked_story(params)
	return Managers.state.networked_flow_state:flow_cb_create_story(params)
end

function flow_callback_networked_story_client_call(params)
	return Managers.state.networked_flow_state:flow_cb_networked_story_client_call(params)
end

function flow_callback_has_stopped_networked_story(params)
	return Managers.state.networked_flow_state:flow_cb_has_stopped_networked_story(params)
end

function flow_callback_has_played_networked_story(params)
	return Managers.state.networked_flow_state:flow_cb_has_played_networked_story(params)
end

function flow_callback_play_networked_story(params)
	return Managers.state.networked_flow_state:flow_cb_play_networked_story(params)
end

function flow_callback_stop_networked_story(params)
	return Managers.state.networked_flow_state:flow_cb_stop_networked_story(params)
end

function flow_callback_invert_bool(params)
	flow_return_table.out = true
	flow_return_table.out_value = not params.in_value

	return flow_return_table
end

function flow_callback_projectile_bounce(params)
	local unit = params.unit
	local touching_unit = params.touching_unit
	local position = params.position
	local normal = params.normal
	local separation_distance = params.separation_distance
	local impulse_force = params.impulse_force
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.bounce(locomotion_extension, touching_unit, position, normal, separation_distance, impulse_force)

	return 
end

local temp = {}

function flow_callback_get_random_player(params)
	local players = Managers.player:human_and_bot_players()

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for index, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) and ScriptUnit.extension(unit, "health_system"):is_alive() then
			unit_list_n = unit_list_n + 1
			unit_list[unit_list_n] = unit
		end
	end

	if 0 < unit_list_n then
		local unit = unit_list[math.random(1, unit_list_n)]
		flow_return_table.playerunit = unit

		return flow_return_table
	end

	return nil
end

function flow_callback_trigger_dialogue_event(params)
	local unit = params.source

	assert(unit, "Calling flow_callback_trigger_dialogue_event without passing unit")

	if ScriptUnit.has_extension(unit, "dialogue_system") then
		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_table = FrameTable.alloc_table()

		if params.argument1_name then
			event_table[params.argument1_name] = tonumber(params.argument1) or params.argument1
		end

		if params.argument2_name then
			event_table[params.argument2_name] = tonumber(params.argument2) or params.argument2
		end

		if params.argument3_name then
			event_table[params.argument3_name] = tonumber(params.argument3) or params.argument3
		end

		dialogue_input.trigger_dialogue_event(dialogue_input, params.concept, event_table)
	else
		print(string.format("[flow_callback_trigger_dialogue_event] No extension found belonging to system \"dialogue_system\" for unit %s", tostring(unit)))
	end

	return 
end

function flow_callback_change_outline_params(params)
	local unit = params.unit

	assert(ScriptUnit.has_extension(unit, "outline_system"), "Trying to change outline params through flow without an outline extension on the unit")

	local outline_extension = ScriptUnit.extension(unit, "outline_system")
	local method = params.method
	local color = params.color

	if method then
		outline_extension.set_method(method)
	end

	if color then
		outline_extension.set_outline_color(color)
	end

	return 
end

function flow_callback_register_transport_navmesh_units(params)
	local unit = params.unit
	local start_unit = params.start_unit
	local end_unit = params.end_unit
	local transportation_extension = ScriptUnit.extension(unit, "transportation_system")

	transportation_extension.register_navmesh_units(transportation_extension, start_unit, end_unit)

	return 
end

function flow_callback_set_door_state_and_duration(params)
	local unit = params.unit
	local new_door_state = params.new_door_state
	local frames = params.frames
	local speed = params.speed
	local door_extension = ScriptUnit.extension(unit, "door_system")

	door_extension.set_door_state_and_duration(door_extension, new_door_state, frames, speed)

	return 
end

function flow_callback_door_animation_played(params)
	local unit = params.unit
	local frames = params.frames
	local speed = params.speed
	local door_extension = ScriptUnit.extension(unit, "door_system")

	door_extension.animation_played(door_extension, frames, speed)

	return 
end

function flow_callback_set_valid_ai_target(params)
	local unit = params.unit
	local valid_target = params.valid_target
	local ai_slot_extension = ScriptUnit.extension(unit, "ai_slot_system")
	ai_slot_extension.valid_target = valid_target

	return 
end

function flow_callback_set_ai_aggro_modifier(params)
	local unit = params.unit
	local aggro_modifier = params.aggro_modifier
	local aggro_extension = ScriptUnit.extension(unit, "aggro_system")
	aggro_extension.aggro_modifier = aggro_modifier*-1

	return 
end

function flow_callback_objective_entered_socket_zone(params)
	print("[flow_callback_objective_entered_socket_zone]", params.socket_unit, params.objective_unit)

	if Managers.player.is_server then
		local socket_unit = params.socket_unit
		local objective_unit = params.objective_unit
		local objective_socket_extension = ScriptUnit.extension(socket_unit, "objective_socket_system")

		objective_socket_extension.objective_entered_zone_server(objective_socket_extension, objective_unit)
	end

	return 
end

function flow_callback_occupied_sockets_query(params)
	local socket_unit = params.socket_unit
	local objective_socket_extension = ScriptUnit.extension(socket_unit, "objective_socket_system")
	local num_closed_sockets = objective_socket_extension.num_closed_sockets
	flow_return_table.sockets = num_closed_sockets

	return flow_return_table
end

function flow_callback_register_environment_volume(params)
	local particle_light_intensity = params.particle_light_intensity or 1

	if params.shading_environment then
		Managers.state.event:trigger("register_environment_volume", params.volume_name, params.shading_environment, params.priority, params.blend_time, params.override_sun_snap, particle_light_intensity)
	end

	return 
end

function flow_callback_enable_environment_volume(params)
	fassert(params.volume_name, "[flow_callbacks] No volume name provided [required]")
	Managers.state.event:trigger("enable_environment_volume", params.volume_name, params.enable)

	return 
end

function flow_callback_volume_system_register_damage_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system.register_volume(volume_system, params.volume_name, "damage_volume", params)

	return 
end

function flow_callback_volume_system_register_movement_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system.register_volume(volume_system, params.volume_name, "movement_volume", params)

	return 
end

function flow_callback_volume_system_register_location_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")
	local location_id = NetworkLookup.locations[params.location]

	volume_system.register_volume(volume_system, params.volume_name, "location_volume", params)

	return 
end

function flow_callback_volume_system_register_trigger_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system.register_volume(volume_system, params.volume_name, "trigger_volume", params)

	return 
end

function flow_callback_volume_system_register_despawn_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system.register_volume(volume_system, params.volume_name, "despawn_volume", params)

	return 
end

function flow_callback_volume_system_unregister_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system.unregister_volume(volume_system, params.volume_name)

	return 
end

function flow_callback_intro_cutscene_show_location(params)
	assert(params.location, "No location set")

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	assert(Unit.alive(player_unit), "Tried showing location with no player unit spawned")

	local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

	hud_extension.set_current_location(hud_extension, params.location)

	return 
end

function flow_callback_local_player_profile_switch(params)
	local player = Managers.player:local_player()
	local profile_index = player.profile_index(player)
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	local returns = {
		witch_hunter = profile_name == "witch_hunter",
		bright_wizard = profile_name == "bright_wizard",
		dwarf_ranger = profile_name == "dwarf_ranger",
		wood_elf = profile_name == "wood_elf",
		empire_soldier = profile_name == "empire_soldier"
	}

	return returns
end

function flow_callback_set_allowed_nav_tag_volume_layer(params)
	local layer_name = params.layer
	local allowed = params.allowed
	local ai_system = Managers.state.entity:system("ai_system")

	ai_system.set_allowed_layer(ai_system, layer_name, allowed)

	return 
end

function flow_callback_register_spline_properties(params)
	local spline_name = params.spline_name
	local despawn_patrol_at_end_of_spline = params.despawn_patrol_at_end_of_spline
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	ai_group_system.register_spline_properties(ai_group_system, spline_name, {
		despawn_patrol_at_end_of_spline = despawn_patrol_at_end_of_spline
	})

	return 
end

function flow_callback_register_sound_environment(params)
	local volume_name = params.volume_name
	local prio = params.prio
	local ambient_sound_event = params.ambient_sound_event
	local fade_time = params.fade_time
	local aux_bus_name = params.aux_bus_name
	local environment_state = params.environment_state
	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system.register_sound_environment(sound_environment_system, volume_name, prio, ambient_sound_event, fade_time, aux_bus_name, environment_state)

	return 
end

function flow_callback_wwise_trigger_event_with_environment(params)
	local position = params.position
	local unit = params.unit
	local node_name = params.unit_node
	local event = params.name
	local existing_source_id = params.existing_source_id
	local use_occlusion = params.use_occlusion or false
	local sound_environment_system = Managers.state.entity:system("sound_environment_system")
	local wwise_world = sound_environment_system.wwise_world
	local source = nil

	if unit and node_name and node_name ~= "" then
		local node = Unit.node(unit, node_name)

		fassert(node, "Node %s doesn't exist in unit %s", unit, node_name)

		source = existing_source_id or WwiseWorld.make_auto_source(wwise_world, unit, node)
		position = Unit.world_position(unit, node)
	elseif unit then
		source = existing_source_id or WwiseWorld.make_auto_source(wwise_world, unit)
		position = Unit.world_position(unit, 0)
	elseif position then
		source = existing_source_id or WwiseWorld.make_auto_source(wwise_world, position)
	else
		fassert(false, "Missing unit or position in wwise trigger even with environment flow node in unit %s", unit)
	end

	sound_environment_system.set_source_environment(sound_environment_system, source, position)

	local id = WwiseWorld.trigger_event(wwise_world, event, use_occlusion, source)
	flow_return_table.playing_id = id
	flow_return_table.source_id = source

	return flow_return_table
end

function flow_callback_wwise_create_environment_sampled_source(params)
	local sound_environment_system = Managers.state.entity:system("sound_environment_system")
	local wwise_world = sound_environment_system.wwise_world
	local pos = params.position
	local unit = params.unit
	local node_name = params.unit_node
	local source = nil

	if unit and node_name and node_name ~= "" then
		node = Unit.node(unit, node_name)

		fassert(node, "Node %s doesn't exist in unit %s", unit, node_name)

		source = WwiseWorld.make_manual_source(wwise_world, unit, node)
		pos = Unit.world_position(unit, node)
	elseif unit then
		source = WwiseWorld.make_manual_source(wwise_world, unit)
		pos = Unit.world_position(unit, 0)
	elseif pos then
		source = WwiseWorld.make_manual_source(wwise_world, pos)
	else
		fassert(false, "Missing unit or position in wwise environment sampled source creation flow node in unit %s", unit)
	end

	sound_environment_system.set_source_environment(sound_environment_system, source, pos)

	flow_return_table.source_id = source

	return flow_return_table
end

function flow_callback_wwise_register_source_environment_update(params)
	assert(params.source_id, "Missing SourceId in \"Register source for environment sample update\"")
	assert(params.unit, "Missing Unit in \"Register source for environment sample update\"")

	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system.register_source_environment_update(sound_environment_system, params.source_id, params.unit)

	return 
end

function flow_callback_wwise_unregister_source_environment_update(params)
	assert(params.source_id, "Missing SourceId in \"Unregister source for environment sample update\"")

	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system.unregister_source_environment_update(sound_environment_system, params.source_id)

	return 
end

function flow_callback_clear_linked_projectiles(params)
	local unit = params.unit
	local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

	projectile_linker_system.clear_linked_projectiles(projectile_linker_system, unit)

	return 
end

function flow_callback_activate_cutscene_camera(params)
	local transition = params.transition
	local transition_length = params.transition_length

	fassert(transition == "NONE" or transition_length ~= nil, "Transition Length must be set in flow node for cutscene camera with transition %q ", transition)

	local camera_unit = params.camera
	local transition_data = {
		transition = transition,
		transition_start_time = params.transition_start_time,
		transition_length = transition_length,
		allow_controls = params.allow_controls,
		max_yaw_angle = params.max_yaw_angle,
		max_pitch_angle = params.max_pitch_angle
	}
	local ingame_hud_enabled = not not params.ingame_hud_enabled
	local letterbox_enabled = not params.letterbox_disabled
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_activate_cutscene_camera(cutscene_system, camera_unit, transition_data, ingame_hud_enabled, letterbox_enabled)

	return 
end

function flow_callback_deactivate_cutscene_cameras(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_deactivate_cutscene_cameras(cutscene_system)

	return 
end

function flow_callback_activate_cutscene_logic(params)
	local player_input_enabled = not not params.player_input_enabled
	local event_on_activate = params.event_on_activate
	local event_on_skip = params.event_on_skip
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_activate_cutscene_logic(cutscene_system, player_input_enabled, event_on_activate, event_on_skip)

	return 
end

function flow_callback_deactivate_cutscene_logic(params)
	local event_on_deactivate = params.event_on_deactivate
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_deactivate_cutscene_logic(cutscene_system, event_on_deactivate)

	return 
end

function flow_callback_cutscene_fx_fade(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_cutscene_effect(cutscene_system, "fx_fade", params)

	return 
end

function flow_callback_cutscene_fx_text_popup(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system.flow_cb_cutscene_effect(cutscene_system, "fx_text_popup", params)

	return 
end

function flow_callback_start_tutorial_intro_text(params)
	Managers.state.event:trigger("event_start_tutorial_intro_text")

	return 
end

function flow_callback_start_mission(params)
	local mission_name = params.mission_name

	fassert(mission_name, "[flow_callback_start_mission] No mission name passed")
	fassert(Missions[mission_name], "[flow_callback_start_mission] There is no mission by the name %q", mission_name)

	local mission_template = Missions[mission_name]

	if mission_template.is_tutorial_input then
		Managers.state.event:trigger("event_add_tutorial_input", mission_name, params.unit)
	else
		local mission_system = Managers.state.entity:system("mission_system")

		mission_system.flow_callback_start_mission(mission_system, mission_name, params.unit)
	end

	return 
end

function flow_callback_update_mission(params)
	local mission_name = params.mission_name

	fassert(mission_name, "[flow_callback_update_mission] No mission name passed")
	fassert(Missions[mission_name], "[flow_callback_start_mission] There is no mission by the name %q", mission_name)

	local mission_template = Missions[mission_name]

	if mission_template.is_tutorial_input then
		Managers.state.event:trigger("event_update_tutorial_input", mission_name)
	else
		local mission_system = Managers.state.entity:system("mission_system")

		mission_system.flow_callback_update_mission(mission_system, mission_name)
	end

	return 
end

function flow_callback_end_mission(params)
	local mission_name = params.mission_name

	fassert(mission_name, "[flow_callback_end_mission] No mission name passed")
	fassert(Missions[mission_name], "[flow_callback_start_mission] There is no mission by the name %q", mission_name)

	local mission_template = Missions[mission_name]

	if mission_template.is_tutorial_input then
		Managers.state.event:trigger("event_remove_tutorial_input", mission_name)
	else
		local mission_system = Managers.state.entity:system("mission_system")

		mission_system.flow_callback_end_mission(mission_system, mission_name)
	end

	return 
end

function flow_callback_show_health_bar(params)
	fassert(params.unit, "[flow_callback_show_health_bar] No unit passed")

	local tutorial_system = Managers.state.entity:system("tutorial_system")

	tutorial_system.flow_callback_show_health_bar(tutorial_system, params.unit, params.show)

	return 
end

function flow_callback_spawn_tutorial_bot(params)
	local profile_index = params.profile_index

	Managers.state.entity:system("play_go_tutorial_system"):spawn_bot(profile_index)

	return 
end

function flow_callback_set_bot_ready_for_assisted_respawn(params)
	local unit = params.unit
	local respawn_unit = params.respawn_unit

	Managers.state.entity:system("play_go_tutorial_system"):set_bot_ready_for_assisted_respawn(unit, respawn_unit)

	return 
end

function flow_callback_enable_tutorial_player_ammo_refill(params)
	Managers.state.entity:system("play_go_tutorial_system"):enable_player_ammo_refill()

	return 
end

function flow_callback_remove_player_ammo(params)
	Managers.state.entity:system("play_go_tutorial_system"):remove_player_ammo()

	return 
end

function flow_callback_check_player_ammo(params)
	flow_return_table.has_ammo = Managers.state.entity:system("play_go_tutorial_system"):check_player_ammo()

	return flow_return_table
end

function flow_callback_give_player_potion_from_bot(params)
	local player_unit = params.player_unit
	local bot_unit = params.bot_unit

	Managers.state.entity:system("play_go_tutorial_system"):give_player_potion_from_bot(player_unit, bot_unit)

	return 
end

function flow_callback_get_players_and_bots(params)
	local players = Managers.player:human_and_bot_players()

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for index, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) and ScriptUnit.extension(unit, "health_system"):is_alive() then
			unit_list_n = unit_list_n + 1
			local profile_index = player.profile_index(player)
			unit_list[profile_index] = unit
		end
	end

	if 0 < unit_list_n then
		flow_return_table.profile1 = unit_list[1]
		flow_return_table.profile2 = unit_list[2]
		flow_return_table.profile3 = unit_list[3]
		flow_return_table.profile4 = unit_list[4]
		flow_return_table.profile5 = unit_list[5]

		return flow_return_table
	end

	return nil
end

function flow_is_carrying_explosive_barrel(params)
	local player_unit = params.player_unit
	local equipment = nil

	if ScriptUnit.has_extension(player_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		equipment = inventory_extension.equipment(inventory_extension)
	else
		equipment = Unit.get_data(player_unit, "equipment")
	end

	local weapon_unit = equipment.left_hand_wielded_unit or equipment.right_hand_wielded_unit

	if weapon_unit then
		local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

		if weapon_extension.item_name == "explosive_barrel_objective" or weapon_extension.item_name == "explosive_barrel" then
			flow_return_table.has_barrel = true
		end
	end

	return flow_return_table
end

function flow_callback_teleport_unit(params)
	local unit = params.unit
	local position = params.position
	local rotation = params.rotation

	if not Unit.alive(unit) then
		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if locomotion_extension.teleport_to then
		locomotion_extension.teleport_to(locomotion_extension, position, rotation)
	end

	local bot = Unit.get_data(unit, "bot")

	if bot then
		local navigation_extension = ScriptUnit.extension(unit, "ai_navigation_system")

		navigation_extension.teleport(navigation_extension, position)
	end

	return 
end

function flow_callback_unspawn_all_ais(params)
	Managers.state.conflict:destroy_all_units()

	return 
end

function flow_query_slots_status(params)
	local player_unit = params.player_unit
	local equipment = nil

	if ScriptUnit.has_extension(player_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
		equipment = inventory_extension.equipment(inventory_extension)
	end

	local slot_healthkit = equipment.slots.slot_healthkit
	local slot_grenade = equipment.slots.slot_grenade
	local slot_potion = equipment.slots.slot_potion
	flow_return_table.healthkit = slot_healthkit ~= nil
	flow_return_table.grenade = slot_grenade ~= nil
	flow_return_table.potion = slot_potion ~= nil

	return flow_return_table
end

function flow_callback_damage_player_bot_ai(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local damage = params.damage

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to kill unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local damage_type = "forced"
		local damage_direction = Vector3.up()
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.add_damage(health_extension, unit, damage, hit_zone_name, damage_type, damage_direction)
	end

	return 
end

function flow_callback_get_health_player_bot_ai(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local current_health = nil

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to get unit %s health from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local status_extension = ScriptUnit.extension(unit, "status_system")

		if status_extension.is_knocked_down(status_extension) or status_extension.is_ready_for_assisted_respawn(status_extension) then
			current_health = 0
		else
			current_health = health_extension.current_health(health_extension)
		end
	end

	flow_return_table.currenthealth = current_health

	return flow_return_table
end

function flow_callback_clear_slot(params)
	local player_unit = params.player_unit
	local slot_name = params.slot_name

	if ScriptUnit.has_extension(player_unit, "inventory_system") then
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		inventory_extension.destroy_slot(inventory_extension, slot_name)
	end

	return 
end

function flow_callback_set_wwise_elevation_alignment(params)
	local elevation_offset = params.position.z
	local elevation_scale = params.scale
	local elevation_min = params.min
	local elevation_max = params.max

	Managers.state.camera:set_elevation_offset(elevation_offset, elevation_scale, elevation_min, elevation_max)

	return 
end

function flow_callback_kill_player_bot_ai(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to kill unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.die(health_extension)
	end

	return 
end

function flow_callback_overcharge_heal_unit(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local health_added = params.health

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to heal overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.add_heal(health_extension, unit, health_added, nil, "n/a")

		local unit_health = health_extension.current_health(health_extension)
		local unit_damage = health_extension.get_damage_taken(health_extension)
		flow_return_table.current_health = unit_health
		flow_return_table.current_damage = unit_damage

		return flow_return_table
	end

	return 
end

function flow_callback_overcharge_init_unit(params)
	local unit = params.unit
	local init_damage = params.init_damage

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local hit_zone_name = "full"
		local attack_direction = Vector3.up()

		health_extension.add_damage(health_extension, unit, init_damage, hit_zone_name, "destructible_level_object_hit", attack_direction, "wounded_degen")
	end

	return 
end

function flow_callback_overcharge_sync_damage(params)
	local unit = params.unit
	local damage = params.damage
	local hit_zone_name = "full"
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local attack_direction = Vector3.up()

	health_extension.add_damage(health_extension, unit, damage, hit_zone_name, "destructible_level_object_hit", attack_direction, "wounded_degen")

	return 
end

function flow_callback_overcharge_damage_unit(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local damage = params.damage

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage overcharge unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local attack_direction = Vector3.up()
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.add_damage(health_extension, unit, damage, hit_zone_name, "destructible_level_object_hit", attack_direction, "wounded_degen")
	end

	return 
end

function flow_callback_overcharge_reset_unit(params)
	local unit = params.unit
	local max_health = params.maxhealth

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to reset health and damage on overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.set_max_health(health_extension, max_health)
		health_extension.set_current_damage(health_extension, 0)
	end

	return 
end

function flow_callback_trigger_explosion(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local explosion_template_name = params.explosion_template_name

	assert(explosion_template_name, "Trigger Explosion unit flow node is missing explosion_template_name")

	local explosion_template = ExplosionTemplates[explosion_template_name]

	assert(explosion_template.explosion.level_unit_damage, "The explosion_template must have level_unit_damage set to true when using this flow node")

	local position = Unit.world_position(unit, 0)
	local rotation = Unit.world_rotation(unit, 0)
	local scale = 1
	local item_name = "grenade_frag_01"

	Managers.state.entity:system("area_damage_system"):create_explosion(unit, position, rotation, explosion_template_name, scale, item_name)

	return 
end

function flow_callback_enable_climb_unit(params)
	local unit = params.unit

	if Unit.alive(unit) then
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")

		nav_graph_system.init_nav_graph_from_flow(nav_graph_system, unit)
	end

	return 
end

function flow_callback_limited_item_spawner_group_register(params)
	if not Managers.player.is_server then
		return 
	end

	local group_name = params.name
	local pool_size = params.pool_size
	local start_active = params.start_active

	Managers.state.entity:system("limited_item_track_system"):register_group(group_name, pool_size)

	return 
end

function flow_callback_limited_item_spawner_group_decrease_pool_size(params)
	if not Managers.player.is_server then
		return 
	end

	local group_name = params.name
	local pool_size = params.pool_size

	Managers.state.entity:system("limited_item_track_system"):decrease_group_pool_size(group_name, pool_size)

	return 
end

function flow_callback_limited_item_spawner_group_activate(params)
	if not Managers.player.is_server then
		return 
	end

	local group_name = params.name
	local pool_size = params.pool_size

	Managers.state.entity:system("limited_item_track_system"):activate_group(group_name, pool_size)

	return 
end

function flow_callback_limited_item_spawner_group_deactivate(params)
	if not Managers.player.is_server then
		return 
	end

	local group_name = params.name

	Managers.state.entity:system("limited_item_track_system"):deactivate_group(group_name)

	return 
end

function flow_callback_blood_collision(params)
	local touched_unit = params.unit
	local actor = params.actor
	local my_unit = Actor.unit(actor)
	local position = params.position
	local normal = params.normal
	local velocity = Actor.velocity(actor)
	local MAX_VELOCITY = 1000

	if MAX_VELOCITY < velocity.x or velocity.x < -MAX_VELOCITY or MAX_VELOCITY < velocity.y or velocity.y < -MAX_VELOCITY or MAX_VELOCITY < velocity.z or velocity.z < -MAX_VELOCITY then
		velocity = Vector3(0, 0, -1)
	end

	Managers.state.blood:add_blood_decal(touched_unit, actor, my_unit, position, normal, velocity)

	return 
end

function flow_callback_enable_poison_wind(params)
	local unit = params.unit
	local enable = params.enable
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system.enable_area_damage(area_damage_system, unit, enable)

	return 
end

function flow_callback_objective_unit_set_active(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local extension = ScriptUnit.extension(unit, "tutorial_system")

	extension.set_active(extension, params.active)

	return 
end

function flow_callback_umbra_set_gate_closed(params)
	local unit = params.unit
	local world = Unit.world(unit)
	local umbra_available = World.umbra_available(world)

	if umbra_available then
		local closed = params.closed

		World.umbra_set_gate_closed(world, unit, closed)
	end

	return 
end

local UNIT_EVENT_RESULT_TABLE = {}

function flow_callback_external_broadphase_unit_event(params)
	local source_unit = params.source_unit
	local radius = params.radius
	local target_breed = params.target_breed
	local event_name = params.event_name
	local value = params.value
	local num_hits = AiUtils.broadphase_query(Unit.world_position(source_unit, 0), radius or 5, UNIT_EVENT_RESULT_TABLE)
	local BLACKBOARDS = BLACKBOARDS

	for i = 1, num_hits, 1 do
		local hit_unit = UNIT_EVENT_RESULT_TABLE[i]
		local blackboard = BLACKBOARDS[hit_unit]

		if blackboard and blackboard.breed.name == target_breed then
			blackboard.external_event_name = event_name
			blackboard.external_event_value = value
		end
	end

	table.clear(UNIT_EVENT_RESULT_TABLE)

	return 
end

function flow_callback_force_unit_animation(params)
	local source_unit = params.source_unit
	local radius = params.radius
	local target_breed = params.target_breed
	local anim_event_name = params.animation_event_name
	local num_hits = AiUtils.broadphase_query(Unit.world_position(source_unit, 0), radius or 5, UNIT_EVENT_RESULT_TABLE)
	local BLACKBOARDS = BLACKBOARDS

	for i = 1, num_hits, 1 do
		local hit_unit = UNIT_EVENT_RESULT_TABLE[i]
		local blackboard = BLACKBOARDS[hit_unit]

		if blackboard and blackboard.breed.name == target_breed then
			Managers.state.network:anim_event(hit_unit, anim_event_name)
		end
	end

	table.clear(UNIT_EVENT_RESULT_TABLE)

	return 
end

function flow_callback_trigger_dialogue_story(params)
	local unit = params.unit

	DialogueSystem:TriggerStoryDialogue(unit)

	return 
end

function flow_callback_trigger_cutscene_subtitles(params)
	local event_name = params.subtitle_event
	local speaker = params.speaker
	local hangtime = params.end_delay

	DialogueSystem:TriggerCutsceneSubtitles(event_name, speaker, hangtime)

	return 
end

function flow_callback_override_start_dialogue_system()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
	dialogue_extension.local_player_has_moved = true

	return 
end

function flow_callback_override_stop_dialogue_system()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
	dialogue_extension.local_player_has_moved = false

	return 
end

function flow_callback_override_start_delay()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
	DialogueSettings.dialogue_level_start_delay = 10

	return 
end

function flow_callback_damage_unit(params)
	if not Managers.player.is_server then
		return 
	end

	local unit = params.unit
	local damage = params.damage

	if Unit.alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local attack_direction = Vector3.up()
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension.add_damage(health_extension, unit, damage, hit_zone_name, "destructible_level_object_hit", attack_direction, "wounded_degen")
	end

	return 
end

function flow_callback_start_fade(params)
	assert(params.unit, "[flow_callback_start_fade] You need to specify the Unit")
	assert(params.duration, "[flow_callback_start_fade] You need to specify duration")
	assert(params.fade_switch, "[flow_callback_start_fade] You need to specify whether to fade in or out (0 or 1)")

	local start_time = World.time(Application.main_world())
	local end_time = start_time + params.duration
	local fade_switch = math.floor(params.fade_switch + 0.5)
	local fade_switch_name = params.fade_switch_name or "fade_switch"
	local start_end_time_name = params.start_end_time_name or "start_end_time"
	local unit = params.unit
	local mesh = nil
	local mesh_name = params.mesh_name

	if mesh_name then
		assert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_start_fade] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material = nil
	local material_name = params.material

	if mesh and material_name then
		assert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_start_fade] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material)
	end

	if mesh and material then
		Material.set_scalar(material, fade_switch_name, fade_switch)
		Material.set_vector2(material, start_end_time_name, Vector2(start_time, end_time))
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1, 1 do
			local material = Mesh.material(mesh, i)

			Material.set_scalar(material, fade_switch_name, fade_switch)
			Material.set_vector2(material, start_end_time_name, Vector2(start_time, end_time))
		end
	elseif material then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1, 1 do
			local mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_scalar(material, fade_switch_name, fade_switch)
				Material.set_vector2(material, start_end_time_name, Vector2(start_time, end_time))
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1, 1 do
			local mesh = Unit.mesh(unit, i)
			local num_materials = Mesh.num_materials(mesh)

			for j = 0, num_materials - 1, 1 do
				local material = Mesh.material(mesh, j)

				Material.set_scalar(material, fade_switch_name, fade_switch)
				Material.set_vector2(material, start_end_time_name, Vector2(start_time, end_time))
			end
		end
	end

	return 
end

function flow_callback_force_death_end(params)
	if Managers.state.network.is_server and ScriptUnit.has_extension(params.unit, "death_system") then
		ScriptUnit.extension(params.unit, "death_system"):force_end()
	end

	return 
end

function flow_callback_unit_spawner_mark_for_deletion(params)
	fassert(Managers.state.network.is_server or not NetworkUnit.is_network_unit(params.unit), "'flow_callback_unit_spawner_mark_for_deletion' can only delete units spawned locally on client")

	local unit_spawner = Managers.state.unit_spawner

	unit_spawner.mark_for_deletion(unit_spawner, params.unit)

	return 
end

function flow_callback_breakable_object_destroyed(params)
	local unit = params.unit

	if Unit.alive(unit) then
		local is_destroyed = Unit.get_data(unit, "destroyed_dynamic")

		if is_destroyed then
			return 
		end

		local statistics_db = Managers.player:statistics_db()
		local player = Managers.player:local_player()

		if not player then
			return 
		end

		local stats_id = player.stats_id(player)

		statistics_db.increment_stat(statistics_db, stats_id, "dynamic_objects_destroyed")
		Unit.set_data(unit, "destroyed_dynamic", true)
	end

	return 
end

function flow_callback_add_subtitle(params)
	local speaker = params.speaker
	local subtitle = params.subtitle
	local hud_system = Managers.state.entity:system("hud_system")

	hud_system.add_subtitle(hud_system, speaker, subtitle)

	return 
end

function flow_callback_remove_subtitle(params)
	local speaker = params.speaker
	local hud_system = Managers.state.entity:system("hud_system")

	hud_system.remove_subtitle(hud_system, speaker)

	return 
end

function flow_callback_fade_in_game_logo(params)
	local fade_time = params.time
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	if cutscene_system then
		cutscene_system.fade_game_logo(cutscene_system, true, fade_time)
	end

	return 
end

function flow_callback_fade_out_game_logo(params)
	local fade_time = params.time
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	if cutscene_system then
		cutscene_system.fade_game_logo(cutscene_system, false, fade_time)
	end

	return 
end

function flow_callback_register_main_path_obstacle(params)
	local unit = params.unit
	local node = params.unit_node
	local position = Unit.world_position(unit, Unit.node(unit, node))
	local _, box_extents = Unit.box(unit)
	local radius_sq = Vector3.distance_squared(Vector3(0, 0, 0), box_extents)

	Managers.state.conflict:register_main_path_obstacle(Vector3Box(position), radius_sq)

	return 
end

function flow_callback_enter_post_game(params)
	local network_manager = Managers.state.network
	local network_server = network_manager.network_server

	if network_server then
		network_server.enter_post_game(network_server)
		print("flow_callback_enter_post_game")
	end

	return 
end

function flow_query_settings_data(params)
	local setting = params.setting

	if not GameSettingsDevelopment then
		print("No GameSettingsDevelopment, running in editor")

		return 
	end

	local output_value = GameSettingsDevelopment[setting]
	flow_return_table.value = output_value

	return flow_return_table
end

function flow_callback_survival_handler(params)
	assert(params.name, "[flow_callback_survival_handler] You need to specify the name of the waves preset found in survival settings")
	assert(SurvivalSettings[params.name], "Could not find the waves preset you specified, you sure it's the same as in survival settings?")

	local DEBUG = false
	local current_wave = SurvivalSettings.wave + 1
	local memory_table = SurvivalSettings.memory
	local templates = SurvivalSettings.templates
	local wave = SurvivalSettings[params.name].waves[current_wave]
	local event_chunk = nil
	local event_found = true
	local is_last_wave = false

	if wave ~= nil then
		for _, name in ipairs(wave) do
			local n = math.random(1, #templates[name])

			if memory_table[templates[name][n]] ~= true then
				memory_table[templates[name][n]] = true
				event_chunk = templates[name][n]
			else
				event_found = false

				for i = 1, #templates[name], 1 do
					if i ~= n then
						event_found = true
						memory_table[templates[name][i]] = true
						event_chunk = templates[name][i]

						break
					end
				end
			end
		end

		if wave.reset ~= nil then
			for _, name in ipairs(wave.reset) do
				if DEBUG then
					print("Reset: " .. name)
				end

				for i = 1, #templates[name], 1 do
					memory_table[templates[name][i]] = nil
				end
			end
		end

		if DEBUG then
			print("Current Wave: " .. current_wave)
			print("Running: " .. event_chunk)

			if event_found == false then
				print_warning("Could not find any available event, you don't have a high enough amount of events, or you don't reset the memory enough")
			end

			print("Current Memory start:")
			print(table.dump(memory_table))
			print("End")
		end

		if event_found and (Managers.player.is_server or LEVEL_EDITOR_TEST) then
			TerrorEventMixer.start_random_event(event_chunk)
		end
	end

	local return_wave = current_wave
	local total_waves = #SurvivalSettings[params.name].waves

	if #SurvivalSettings[params.name].waves <= current_wave then
		SurvivalSettings.memory = {}
		current_wave = SurvivalSettings.re_loop_wave
	end

	SurvivalSettings.wave = current_wave
	local returns = {
		current_wave = return_wave,
		total_num_waves = total_waves,
		last_wave = is_last_wave
	}

	return returns
end

function flow_callback_survival_handler_reset(params)
	local memory = {}
	local difficulty = params.difficulty
	local wave = SurvivalStartWaveByDifficulty[difficulty]
	SurvivalSettings.initial_wave = wave
	SurvivalSettings.wave = wave
	SurvivalSettings.memory = memory
	local returns = {
		initial_wave = wave + 1
	}

	return returns
end

function flow_callback_set_difficulty(params)
	Managers.state.difficulty:set_difficulty(params.difficulty)

	return 
end

function flow_callback_show_difficulty(params)
	assert(params.difficulty, "No difficulty set")

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	if Unit.alive(player_unit) then
		local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

		hud_extension.set_current_location(hud_extension, Localize("dlc1_2_survival_difficulty_increase") .. " " .. Localize("difficulty_" .. params.difficulty))
	end

	return 
end

function flow_callback_get_difficulty(params)
	local difficulty_easy, difficulty_normal, difficulty_hard, difficulty_survival_hard, difficulty_harder, difficulty_hardest, difficulty_survival_harder, difficulty_survival_hardest = nil
	local getdifficulty = Managers.state.difficulty:get_difficulty()

	if getdifficulty == "easy" then
		difficulty_easy = true
	end

	if getdifficulty == "normal" then
		difficulty_normal = true
	end

	if getdifficulty == "hard" then
		difficulty_hard = true
	end

	if getdifficulty == "survival_hard" then
		difficulty_hard = true
	end

	if getdifficulty == "harder" then
		difficulty_harder = true
	end

	if getdifficulty == "survival_harder" then
		difficulty_survival_harder = true
	end

	if getdifficulty == "hardest" then
		difficulty_hardest = true
	end

	if getdifficulty == "survival_hardest" then
		difficulty_survival_hardest = true
	end

	flow_return_table.easy = difficulty_easy
	flow_return_table.normal = difficulty_normal
	flow_return_table.hard = difficulty_hard
	flow_return_table.survival_hard = difficulty_survival_hard
	flow_return_table.harder = difficulty_harder
	flow_return_table.survival_harder = difficulty_survival_harder
	flow_return_table.hardest = difficulty_hardest
	flow_return_table.survival_hardest = difficulty_survival_hardest
	flow_return_table.difficulty = getdifficulty

	return flow_return_table
end

function flow_callback_enable_end_level_area(params)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager.is_server then
		local unit = params.unit
		local object = params.object
		local from = -params.left_back_down_extents
		local to = params.right_forward_up_extents

		game_mode_manager.activate_end_level_area(game_mode_manager, unit, object, from, to)
	end

	return 
end

function flow_callback_debug_end_level_area(params)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager.is_server then
		local unit = params.unit
		local object = params.object
		local from = -params.left_back_down_extents
		local to = params.right_forward_up_extents

		game_mode_manager.debug_end_level_area(game_mode_manager, unit, object, from, to)
	end

	return 
end

function flow_callback_disable_end_level_area(params)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager.is_server then
		game_mode_manager.disable_end_level_area(game_mode_manager, params.unit)
	end

	return 
end

function flow_callback_disable_lose_condition()
	Managers.state.game_mode:disable_lose_condition()

	return 
end

local RESULT_TABLE = {}

function flow_callback_broadphase_deal_damage(params)
	assert(Managers.state.network.is_server, "Only deal damage on server.")

	local hit_zone_name = "torso"
	local hit_ragdoll_actor = nil
	local pos = params.position
	local radius = params.radius
	local attacker_unit = params.attacker_unit
	local hazard_type = params.hazard_type
	local attack_direction = nil

	if Unit.alive(attacker_unit) then
		local rot = Unit.world_rotation(attacker_unit, 0)
		local params_dir = params.direction
		attack_direction = Quaternion.right(rot)*params_dir.x + Quaternion.forward(rot)*params_dir.y + Quaternion.up(rot)*params_dir.z
	else
		attack_direction = params.direction
	end

	local hazard_settings = EnvironmentalHazards[hazard_type]

	if params.hits_enemies then
		local t = Managers.time:time("game")
		local damage_source = hazard_type
		local power_level = hazard_settings.enemy.power_level or DefaultPowerLevel
		local damage_profile_name = hazard_settings.enemy.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = nil
		local boost_curve_multiplier = 1
		local is_critical_strike = false
		local can_damage = false
		local can_stagger = false
		local blocking = false
		local shield_breaking_hit = false
		local num_hits = AiUtils.broadphase_query(pos, radius, RESULT_TABLE)

		for i = 1, num_hits, 1 do
			local hit_unit = RESULT_TABLE[i]

			DamageUtils.server_apply_hit(t, attacker_unit, hit_unit, hit_zone_name, Vector3.normalize(attack_direction), hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit)
		end
	end

	local hits_human_players = params.hits_human_players
	local hits_bot_players = params.hits_bot_players

	if hits_human_players or (hits_bot_players and hazard_settings.player) then
		local settings = hazard_settings.player
		local action_data = settings.action_data
		local damage = settings.difficulty_damage[Managers.state.difficulty:get_difficulty()]

		for _, player in pairs(Managers.player:players()) do
			local player_controlled = player.is_player_controlled(player)
			local unit = player.player_unit

			if (hits_bot_players and not player_controlled) or (hits_human_players and player_controlled and Unit.alive(unit) and Vector3.distance(pos, POSITION_LOOKUP[unit]) < radius) then
				local unit_position = POSITION_LOOKUP[unit]

				AiUtils.damage_target(unit, attacker_unit, action_data, damage, hazard_type)
			end
		end
	end

	return 
end

function flow_callback_broadphase_deal_damage_debug(params)
	local color = nil
	local hits_enemies = params.hits_enemies
	local hits_humans = params.hits_human_players
	local hits_bots = params.hits_bot_players

	if hits_enemies then
		QuickDrawerStay:sphere(params.position, params.radius, Color(255, 0, 0))
	end

	if hits_humans then
		QuickDrawerStay:sphere(params.position, params.radius + 0.01, Color(0, 255, 0))
	end

	if hits_bots then
		QuickDrawerStay:sphere(params.position, params.radius + 0.02, Color(0, 0, 255))
	end

	return 
end

function flow_callback_set_particles_light_intensity_exponent(params)
	local exp = params.exponent
	local id = pararms.id
	local world = Application.flow_callback_context_world()

	World.set_particles_light_intensity_exponent(world, id, exp)

	return 
end

function flow_callback_set_camera_far_range(params)
	if DEDICATED_SERVER then
		return 
	end

	local world_name = params.world_name
	local viewport_name = params.viewport_name
	local far_range = params.far_range
	local world = Managers.world:world(world_name)

	fassert(world, "[flow_callback_set_camera_far_range] There is currently no world called %s", world_name)

	local viewport = World.get_data(world, "viewports")[viewport_name]

	fassert(world, "[flow_callback_set_camera_far_range] There is currently no viewport called %s in world %s", viewport_name, world_name)
	fassert(far_range, "[flow_callback_set_camera_far_range] No far range provided", far_range)

	local camera = ScriptViewport.camera(viewport)

	Camera.set_data(camera, "far_range", far_range)

	return 
end

function flow_callback_barrel_explode(params)
	local unit = params.unit
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension.set_max_health(health_extension, 1)
	health_extension.add_damage(health_extension, unit, 1, "full", "grenade", Vector3(1, 0, 0))

	return 
end

function flow_callback_set_game_mode_variable(params)
	local variable = params.variable
	local value = params.value
	local game_mode = Managers.state.game_mode:game_mode()
	game_mode[variable] = value

	return 
end

function flow_callback_print_callstack(params)
	return 
end

function flow_callback_activate_payload(params)
	local unit = params.payload_unit
	local extension = ScriptUnit.extension(unit, "payload_system")

	extension.activate(extension)

	return 
end

function flow_callback_deactivate_payload(params)
	local unit = params.payload_unit
	local extension = ScriptUnit.extension(unit, "payload_system")
	local stop = params.force_stop

	extension.deactivate(extension, stop)

	return 
end

function flow_callback_activate_end_zone(params)
	local unit = params.unit
	local activate = params.activate
	local props_ext = ScriptUnit.extension(unit, "props_system")
	local always_activated = Unit.get_data(unit, "always_activated")

	props_ext.activate(props_ext, activate, always_activated)

	return 
end

function flow_callback_tutorial_restrict_camera_rotation(params)
	local angle = params.angle
	local restrict = params.restrict
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)

	fassert(local_player, "[flow_callback_restrict_camera_rotation] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(Unit.alive(local_player_unit), "[flow_callback_restrict_camera_rotation] The local player unit hasn't spawned yet or has been removed")

	local first_person_ext = ScriptUnit.extension(local_player_unit, "first_person_system")

	if restrict then
		fassert(angle, "[flow_callback_restrict_camera_rotation] You need to specify an angle when turning on rotation restriction")
	end

	first_person_ext.tutorial_restrict_camera_rotation(first_person_ext, restrict, angle)

	return 
end

function flow_callback_prioritize_objective_tooltips(params)
	local objective_tooltip_name = params.objective_tooltip_name
	local reset = params.reset

	fassert(objective_tooltip_name or reset, "[flow_callback_prioritize_objective_tooltips] You need to provide objective_tooltip_name and/or reset")
	Managers.state.entity:system("tutorial_system"):prioritize_objective_tooltip(objective_tooltip_name, reset)

	return 
end

local function split_string(text, sep)
	sep = sep or "\n"
	local lines = {}
	local pos = 1

	while true do
		local b, e = text.find(text, sep, pos)

		if not b then
			table.insert(lines, text.sub(text, pos))

			break
		end

		table.insert(lines, text.sub(text, pos, b - 1))

		pos = e + 1
	end

	return lines
end

function flow_callback_link_objects_in_units_and_store(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local parentnodes = split_string(params.parent_nodes, ";")
	local childnodes = split_string(params.child_nodes, ";")
	local world = Unit.world(parentunit)
	local index_offset = Script.index_offset()

	for i = 1, #parentnodes - 1, 1 do
		local parentnodeindex = Unit.node(parentunit, parentnodes[i])
		local childnode = childnodes[i]
		local childnodeindex = nil

		if string.find(childnode, "Index(.)") then
			childnodeindex = tonumber(string.match(childnode, "%d+") + index_offset)
		else
			childnodeindex = Unit.node(childunit, childnode)
		end

		World.link_unit(world, childunit, childnodeindex, parentunit, parentnodeindex)

		if params.parent_lod_object and params.child_lod_object then
			local parent_lod_object = Unit.lod_object(parentunit, params.parent_lod_object)
			local child_lod_object = Unit.lod_object(childunit, params.child_lod_object)

			LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
			LODObject.set_orientation_node(child_lod_object, parentunit, LODObject.node(parent_lod_object))
		end
	end

	local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}

	table.insert(unit_attachments, childunit)
	Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)

	return {
		linked = true
	}
end

function flow_callback_unlink_objects_in_units_and_remove(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local world = Unit.world(parentunit)

	World.unlink_unit(world, childunit)

	local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}
	local key = table.find(unit_attachments, childunit)

	if key then
		table.remove(unit_attachments, key)
	end

	Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)

	return {
		unlinked = true
	}
end

function flow_callback_is_leader(params)
	local leader_peer_id = Managers.party:leader()
	local peer_id = Network.peer_id()
	local is_leader = peer_id == leader_peer_id

	return {
		yes = is_leader,
		no = not is_leader
	}
end

function flow_callback_enforce_player_positions(params)
	if not Managers.player.is_server then
		print("flow_callback_enforce_player_positions() run on client, doing nothing")

		return 
	end

	local volume_name = params.volume_name
	local force = params.force
	local inside = nil

	if force == "inside" then
		inside = true
	elseif force == "outside" then
		inside = false
	else
		fassert(false, "Trying to enforce players position with unknown state %s", tostring(force))
	end

	local world = Application.flow_callback_context_world()
	local level = LevelHelper:current_level(world)
	local player_manager = Managers.player
	local health_system = Managers.state.entity:system("health_system")
	local valid_position = nil

	for i, unit in pairs(PLAYER_UNITS) do
		local pos = PLAYER_POSITIONS[i]
		local pos_ok = Level.is_point_inside_volume(level, volume_name, pos) == inside

		if pos_ok then
			valid_position = pos
		else
			local status_ext = ScriptUnit.extension(unit, "status_system")

			if status_ext.is_disabled(status_ext) and not status_ext.is_ready_for_assisted_respawn(status_ext) and not status_ext.is_dead(status_ext) then
				health_system.suicide(health_system, unit)
			end
		end
	end

	for i, unit in pairs(PLAYER_AND_BOT_UNITS) do
		local owner = player_manager.owner(player_manager, unit)

		if owner and not owner.is_player_controlled(owner) then
			local pos = PLAYER_AND_BOT_POSITIONS[i]
			local pos_ok = Level.is_point_inside_volume(level, volume_name, pos) == inside

			if not pos_ok then
				local status_ext = ScriptUnit.extension(unit, "status_system")
				local disabled = status_ext.is_disabled(status_ext)
				local in_respawn = status_ext.is_ready_for_assisted_respawn(status_ext)
				local dead = status_ext.is_dead(status_ext)

				if disabled and not in_respawn and not dead then
					health_system.suicide(health_system, unit)
				elseif not in_respawn and not dead and valid_position then
					local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
					local current_rotation = locomotion_extension.current_rotation(locomotion_extension)

					locomotion_extension.teleport_to(locomotion_extension, valid_position, current_rotation)
				end
			end
		end
	end

	if valid_position then
		Managers.state.spawn:teleport_despawned_players(valid_position)
	end

	return 
end

function flow_callback_tutorial_enable_equipment(params)
	local enable = params.enable
	local wield_anim = params.wield_anim
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)

	fassert(local_player, "[flow_callback_tutorial_enable_equipment] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(Unit.alive(local_player_unit), "[flow_callback_tutorial_enable_equipment ]gloThe local player unit hasn't spawned yet or has been removed")

	local first_person_ext = ScriptUnit.extension(local_player_unit, "first_person_system")

	first_person_ext.tutorial_show_first_person_units(first_person_ext, enable)

	local actions_to_allow = {
		action_two_release = true,
		action_inspect = true,
		action_three = true,
		action_one_hold = true,
		action_inspect_hold = true,
		action_one_release = true,
		action_three_hold = true,
		character_inspecting = true,
		action_three_release = true,
		action_two = true,
		action_one = true,
		action_two_hold = true
	}
	local player_input = ScriptUnit.extension(local_player_unit, "input_system")

	if enable then
		if wield_anim then
			local first_person_ext = ScriptUnit.extension(local_player_unit, "first_person_system")
			local first_person_unit = first_person_ext.get_first_person_unit(first_person_ext)

			Unit.animation_event(first_person_unit, wield_anim)
		end

		local disallowed_input = player_input.disallowed_input_table(player_input)

		for action, _ in pairs(actions_to_allow) do
			disallowed_input[action] = nil
		end

		local game_mode = Managers.state.game_mode:game_mode()

		game_mode.disable_hud(game_mode, false)
	else
		local disallowed_input = player_input.disallowed_input_table(player_input)

		table.merge(disallowed_input, actions_to_allow)
		player_input.set_disallowed_inputs(player_input, disallowed_input)

		local game_mode = Managers.state.game_mode:game_mode()

		game_mode.disable_hud(game_mode, true)
	end

	return 
end

function flow_callbacks_add_tutorial_animation_hook(params)
	local animation_hook_name = params.animation_hook
	local animation_hook_free_text_name = params.animation_hook_free_text

	if animation_hook_free_text_name ~= "" and not animation_hook_free_text_name then
	end

	fassert(animation_hook_name and PauseEvents.animation_hook_templates[animation_hook_name], "[flow_callbacks] There is no animation hook called: %s", tostring(animation_hook_name))

	local animation_hook = table.clone(PauseEvents.animation_hook_templates[animation_hook_name])

	Managers.state.entity:system("play_go_tutorial_system"):add_animation_hook(animation_hook)

	return 
end

function flow_callbacks_trigger_pause_event(params)
	local pause_event_name = params.pause_event_name
	local look_position = params.look_position

	fassert(pause_event_name and PauseEvents.pause_events[pause_event_name], "[flow_callbacks] There is not pause events called: %s", tostring(pause_event_name))

	local pause_event = table.clone(PauseEvents.pause_events[pause_event_name])

	Managers.state.entity:system("play_go_tutorial_system"):trigger_pause_event(pause_event, look_position)

	return 
end

function flow_callbacks_add_tutorial_equipment(params)
	local slot_name = params.slot_name
	local item_name = params.item_name
	local starting_ammo = (params.starting_ammo and math.floor(params.starting_ammo)) or 0

	fassert(item_name and ItemMasterList[item_name], "[flow_callbacks_add_tutorial_equipment] There is no item called %s in ItemMasterList", tostring(item_name))

	local item_data = ItemMasterList[item_name]
	local player = Managers.player:local_player()
	local player_unit = player.player_unit
	local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")

	inventory_ext.add_equipment(inventory_ext, slot_name, item_data, nil, nil, starting_ammo)

	if slot_name == "slot_melee" then
		inventory_ext.wield(inventory_ext, "slot_melee")
	else
		inventory_ext.wield(inventory_ext, "slot_ranged")
	end

	return 
end

local function enabled_inputs(player_input, inputs_table, enabled)
	if enabled then
		local disallowed_input = player_input.disallowed_input_table(player_input)

		for action, _ in pairs(inputs_table) do
			disallowed_input[action] = nil
		end

		player_input.set_disallowed_inputs(player_input, disallowed_input)
		player_input.set_allowed_inputs(player_input, inputs_table)
	else
		local disallowed_input = player_input.disallowed_input_table(player_input)

		table.merge(disallowed_input, inputs_table)
		player_input.set_disallowed_inputs(player_input, disallowed_input)
	end

	return 
end

function flow_callbacks_tutorial_inputs_enabled(params)
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)

	fassert(local_player, "[flow_callbacks_tutorial_inputs_enabled] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(Unit.alive(local_player_unit), "[flow_callbacks_tutorial_inputs_enabled] The local player unit hasn't spawned yet or has been removed")

	local move_enabled = params.move
	local jump_dodge_enabled = params.jump_dodge
	local attack_enabled = params.attack
	local block_enabled = params.block
	local ability_enabled = params.career_ability
	local switch_enabled = params.weapon_switch
	local move_actions = {
		move_back_pressed = true,
		move_forward_pressed = true,
		move_right = true,
		move_controller = true,
		move_right_pressed = true,
		move_left = true,
		move_forward = true,
		move_back = true,
		move_left_pressed = true
	}
	local jump_dodge_actions = {
		jump_only = true,
		dodge = true,
		jump_1 = true,
		dodge_hold = true,
		jump_2 = true
	}
	local attack_actions = {
		action_one_softbutton_gamepad = true,
		action_one_mouse = true,
		action_one_hold = true,
		action_one_release = true,
		action_one = true
	}
	local block_actions = {
		action_two_hold = true,
		action_two = true
	}
	local ability_actions = {
		action_career_release = true,
		action_career = true,
		action_career_hold = true
	}
	local switch_actions = {
		wield_switch = true,
		wield_2 = true,
		wield_next = true,
		wield_5 = true,
		wield_prev = true,
		wield_0 = true,
		wield_8 = true,
		wield_3 = true,
		wield_switch_2 = true,
		wield_6 = true,
		wield_switch_1 = true,
		wield_1 = true,
		wield_9 = true,
		wield_4 = true,
		wield_scroll = true,
		wield_7 = true
	}
	local player_input = ScriptUnit.extension(local_player_unit, "input_system")

	enabled_inputs(player_input, move_actions, move_enabled)
	enabled_inputs(player_input, jump_dodge_actions, jump_dodge_enabled)
	enabled_inputs(player_input, attack_actions, attack_enabled)
	enabled_inputs(player_input, block_actions, block_enabled)
	enabled_inputs(player_input, ability_actions, ability_enabled)
	enabled_inputs(player_input, switch_actions, switch_enabled)

	return 
end

function flow_callbacks_tutorial_enable_weapon_switching(params)
	local enable = params.enable
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)

	fassert(local_player, "[flow_callbacks_tutorial_enable_weapon_switching] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(Unit.alive(local_player_unit), "[flow_callbacks_tutorial_enable_weapon_switching] The local player unit hasn't spawned yet or has been removed")

	local switch_actions = {
		wield_switch = true,
		wield_2 = true,
		wield_next = true,
		wield_5 = true,
		wield_prev = true,
		wield_0 = true,
		wield_8 = true,
		wield_3 = true,
		wield_switch_2 = true,
		wield_6 = true,
		wield_switch_1 = true,
		wield_1 = true,
		wield_9 = true,
		wield_4 = true,
		wield_scroll = true,
		wield_7 = true
	}
	local player_input = ScriptUnit.extension(local_player_unit, "input_system")

	if enable then
		local disallowed_input = player_input.disallowed_input_table(player_input)

		for action, _ in pairs(switch_actions) do
			disallowed_input[action] = nil
		end
	else
		local disallowed_input = player_input.disallowed_input_table(player_input)

		table.merge(disallowed_input, switch_actions)
		player_input.set_disallowed_inputs(player_input, disallowed_input)
	end

	return 
end

function flow_callbacks_tutorial_enable_career_skill(params)
	local enable = params.enable
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	local unit = local_player.player_unit
	local career_extension = ScriptUnit.extension(unit, "career_system")

	if not enable then
		career_extension.start_activated_ability_cooldown(career_extension, 0)
		career_extension.set_activated_ability_cooldown_paused(career_extension)
	else
		career_extension.start_activated_ability_cooldown(career_extension, 1)
	end

	return 
end

function flow_callback_enable_bot_loot(params)
	local enable = params.enable
	local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

	if play_go_tutorial_system then
		play_go_tutorial_system.enable_bot_loot(play_go_tutorial_system, enable)
	end

	return 
end

function flow_callback_enable_bot_portrait(params)
	local bot_display_name = params.bot_display_name
	local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

	play_go_tutorial_system.set_bot_portrait_enabled(play_go_tutorial_system, bot_display_name)

	return 
end

function flow_callback_set_player_invincibility(params)
	if not Managers.player.is_server then
		return 
	end

	local player_unit = params.player_unit
	local is_invincible = params.invincible

	if Unit.alive(player_unit) then
		local health_extension = ScriptUnit.has_extension(player_unit, "health_system")

		fassert(health_extension, "Tried to set invincibility on unit %s from flow but the unit has no health extension", player_unit)

		health_extension.is_invincible = is_invincible
	end

	return 
end

function flow_callback_set_player_in_hanging_cage(params)
	local idle_animation = params.idle_animation
	local falling_animation = params.falling_animation
	local landing_animation = params.landing_animation
	local player_unit = params.player_unit
	local cage_unit = params.cage_unit
	local state = params.state

	if Unit.alive(player_unit) then
		local status_extension = ScriptUnit.has_extension(player_unit, "status_system")

		fassert(status_extension, "Tried to set in_hanging_cage status on unit %s from flow but the unit has no status extension", player_unit)
		fassert(state, "Need to set in_hanging_cage state!")

		if not status_extension.in_hanging_cage_animations then
			local animations = {
				idle = idle_animation,
				falling = falling_animation,
				landing = landing_animation
			}
		end

		status_extension.set_in_hanging_cage(status_extension, true, cage_unit, state, animations)
	end

	return 
end

function flow_callback_set_player_fall_height(params)
	local unit = params.unit
	local status_ext = ScriptUnit.has_extension(unit, "status_system")

	if status_ext then
		local is_husk = status_ext.is_husk

		if is_husk then
			if BUILD == "release" then
				ScriptApplication.send_to_crashify("flow_callbacks", "Trying to set falling height on unit not owned")
			else
				assert(false, "Trying to set falling height on unit not owned")
			end
		else
			status_ext.set_falling_height(status_ext, true)
		end
	end

	return 
end

function flow_callback_store_parent(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit

	Unit.set_data(childunit, "parent_ref", parentunit)

	return 
end

function flow_callback_stored_parent(params)
	local childunit = params.child_unit
	local parent = Unit.get_data(childunit, "parent_ref")
	local returns = {
		parent_unit = parent
	}

	return returns
end

function flow_callback_set_unit_enabled(params)
	if params.enabled then
		Unit.set_unit_visibility(params.unit, true)
		Unit.enable_physics(params.unit)
	else
		Unit.set_unit_visibility(params.unit, false)
		Unit.disable_physics(params.unit)
	end

	return 
end

function flow_callback_set_unit_physics(params)
	if params.physics then
		Unit.enable_physics(params.unit)
	else
		Unit.disable_physics(params.unit)
	end

	return 
end

return 
