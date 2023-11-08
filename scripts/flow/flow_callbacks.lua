require("scripts/flow/flow_callbacks_ai")
require("scripts/flow/flow_callbacks_enemy")
require("scripts/flow/flow_callbacks_progression")
require("core/wwise/lua/wwise_flow_callbacks")
require("core/volumetrics/lua/volumetrics_flow_callbacks")
require("scripts/helpers/nav_tag_volume_utils")
require("scripts/settings/difficulty_settings")
require("scripts/settings/attachment_node_linking")
DLCUtils.dofile("flow_callbacks")

local flow_return_table = Boot.flow_return_table
local unit_alive = Unit.alive

function flow_callback_show_gdc_intro(params)
	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit

	if player_unit and unit_alive(player_unit) then
		local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

		hud_extension:gdc_intro_active(true)
	end
end

function flow_callback_animation_callback(params)
	Managers.state.event:trigger("animation_callback", params.unit, params.callback, params.param1)
end

function flow_callback_disable_animation_state_machine(params)
	Unit.disable_animation_state_machine(params.unit)
end

function flow_callback_enable_actor_draw(params)
	local debug_manager = Managers.state.debug

	if debug_manager then
		debug_manager:enable_actor_draw(params.actor, params.color)
	end
end

function flow_callback_disable_actor_draw(params)
	local debug_manager = Managers.state.debug

	if debug_manager then
		debug_manager.debug:disable_actor_draw(params.actor)
	end
end

function flow_callback_set_start_area(params)
	local entity_manager = Managers.state.entity

	if entity_manager then
		entity_manager:system("round_started_system"):set_start_area(params.volume_name)
	end
end

function flow_callback_add_coop_spawn_point(params)
	local game_mode = Managers.state.game_mode

	if game_mode then
		game_mode:flow_callback_add_spawn_point(params.unit)
	end
end

function flow_callback_add_game_mode_spawn_point(params)
	local game_mode = Managers.state.game_mode

	if game_mode then
		game_mode:flow_callback_add_game_mode_specific_spawn_point(params.unit)
	end
end

function flow_callback_set_checkpoint(params)
	local spawn = Managers.state.spawn

	if spawn then
		spawn:flow_callback_set_checkpoint(params.no_spawn_volume, params.safe_zone_volume, params.unit1, params.unit2, params.unit3, params.unit4)
	end
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
	flow_return_table.value = min + rnd * (max - min)

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

function flow_callback_switchcase_unit(params)
	local ret_unit = nil

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" and params.case == tonumber(string.sub(k, -1)) then
				ret_unit = params[k]
			end
		end
	end

	flow_return_table.out_unit = ret_unit

	return flow_return_table
end

function flow_callback_relay_trigger(params)
	return {
		out = true
	}
end

function flow_callback_randomize_sequential_numbers(params)
	local max = params.max
	local numbers = {}

	for j = 1, max do
		numbers[j] = j
	end

	for i = 1, 10 do
		local random1 = server_seeded_random(1, max, params.debug_name)
		local random2 = server_seeded_random(1, max, params.debug_name)
		numbers[random2] = numbers[random1]
		numbers[random1] = numbers[random2]
	end

	local ret = {}

	for k = 1, max do
		ret[tostring(k)] = numbers[k]
	end

	return ret
end

function flow_callback_randomize_strings(params)
	local strings = {}
	local num_strings = #params

	for _, string in pairs(params) do
		strings[#strings + 1] = string
	end

	local random_string = strings[math.random(1, #strings)]
	flow_return_table.out_string = random_string

	return flow_return_table
end

function flow_callback_select_output_by_number(params)
	local num = params.num
	local output = params[tostring(num)]
	local ret = {
		["out_" .. tostring(output)] = true
	}

	return ret
end

function flow_query_number_of_active_players(params)
	local output_value = 0
	local side_manager = Managers.state.side

	if side_manager then
		local side = side_manager:get_side_from_name("heroes")
		local player_units = side.PLAYER_UNITS
		local num_player_units = #player_units

		for i = 1, num_player_units do
			local unit = player_units[i]
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if not status_extension:is_disabled() then
				output_value = output_value + 1
			end
		end
	end

	flow_return_table.value = output_value

	return flow_return_table
end

function flow_query_number_of_human_players(params)
	local player_manager = Managers.player
	flow_return_table.value = player_manager:num_human_players()

	return flow_return_table
end

function flow_callback_play_music(params)
	Managers.music:trigger_event(params.event)
end

function flow_callback_idle_camera_dummy_spawned(params)
	local entity_manager = Managers.state.entity

	if entity_manager then
		local camera_system = entity_manager:system("camera_system")

		camera_system:idle_camera_dummy_spawned(params.unit)
	end
end

function flow_callback_pickup_gizmo_spawned(params)
	local entity_manager = Managers.state.entity

	if entity_manager then
		local pickup_system = entity_manager:system("pickup_system")

		if pickup_system then
			pickup_system:pickup_gizmo_spawned(params.unit)
		end
	end
end

function flow_callback_weave_item_gizmo_spawned(params)
	local entity_manager = Managers.state.entity

	if entity_manager then
		local weave_item_spawner_system = entity_manager:system("weave_item_spawner_system")

		if weave_item_spawner_system then
			weave_item_spawner_system:item_gizmo_spawned(params.unit)
		end
	end
end

function flow_callback_versus_item_gizmo_spawned(params)
	if Managers.mechanism:current_mechanism_name() == "versus" then
		local entity_manager = Managers.state.entity

		if entity_manager then
			local versus_item_spawner_system = entity_manager:system("versus_item_spawner_system")

			if versus_item_spawner_system then
				versus_item_spawner_system:item_gizmo_spawned(params.unit)
			end
		end
	end
end

function flow_callback_get_current_level_key(params)
	flow_return_table.level_key = Managers.mechanism:get_current_level_keys()

	return flow_return_table
end

function flow_callback_get_deus_post_match(params)
	local mechanism = Managers.mechanism:game_mechanism()
	flow_return_table.post_match = mechanism:post_match() == true

	return flow_return_table
end

function flow_callback_get_current_current_deus_theme_index(params)
	flow_return_table.theme_index = 1
	local level_key = Managers.mechanism:get_current_level_keys()
	local level_settings = LevelSettings[level_key]
	local level_theme = level_settings.theme

	for i = 1, #DEUS_THEME_INDEX do
		local theme = DEUS_THEME_INDEX[i]

		if theme == level_theme then
			flow_return_table.theme_index = i
		end
	end

	return flow_return_table
end

function flow_callback_boss_gizmo_spawned(params)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		conflict_director.level_analysis:boss_gizmo_spawned(params.unit)
	end
end

function flow_callback_generic_ai_node_spawned(params)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		conflict_director.level_analysis:generic_ai_node_spawned(params.unit)
	end
end

function flow_callback_respawn_unit_spawned(params)
	local game_mode = Managers.state.game_mode

	if game_mode then
		game_mode:respawn_unit_spawned(params.unit)
	end
end

function flow_callback_force_move_dead_players(params)
	local state = Managers.state
	local game_mode_manager = state and state.game_mode
	local game_mode = game_mode_manager and game_mode_manager:game_mode()
	local respawn_handler = game_mode and game_mode:get_respawn_handler()

	if respawn_handler then
		respawn_handler:queue_force_move_dead_players()
	end
end

function flow_callback_respawn_gate_unit_spawned(params)
	local game_mode = Managers.state.game_mode

	if game_mode then
		game_mode:respawn_gate_unit_spawned(params.unit)
	end
end

function flow_callback_respawn_enabled(params)
	if not Managers.player.is_server then
		return
	end

	local game_mode = Managers.state.game_mode

	if game_mode then
		local enabled = params.enabled

		game_mode:set_respawning_enabled(enabled)
	end
end

function flow_callback_force_respawn_dead_players(params)
	if not Managers.player.is_server then
		return
	end

	local game_mode = Managers.state.game_mode

	if game_mode then
		game_mode:force_respawn_dead_players()
	end
end

function flow_callback_increase_weave_score(params)
	if not Managers.player.is_server then
		return
	end

	local weave_manager = Managers.weave

	weave_manager:increase_bar_score(params.amount)
end

function flow_callback_activate_triggered_pickup_spawners(params)
	local entity_manager = Managers.state.entity
	local pickup_system = entity_manager:system("pickup_system")
	local spawned_unit = nil

	if Managers.player.is_server or LEVEL_EDITOR_TEST then
		spawned_unit = pickup_system:activate_triggered_pickup_spawners(params.triggered_spawn_id)
	end

	flow_return_table.spawned_pickup_unit = spawned_unit

	return flow_return_table
end

function flow_callback_disable_torch(params)
	if Managers.state.game_mode:has_activated_mutator("darkness") then
		return
	end

	local player_unit = params.touching_unit

	if Managers.player.is_server then
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:disable_teleporting_pickups()
	end

	if not unit_alive(player_unit) then
		return
	end

	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if not inventory_extension then
		return
	end

	local weapon_slot = inventory_extension:get_wielded_slot_name()
	local weapon_data = inventory_extension:get_slot_data(weapon_slot)

	if weapon_data then
		local item_data = weapon_data.item_data
		local item_name = item_data and item_data.name

		if item_name == "torch" then
			CharacterStateHelper.stop_weapon_actions(inventory_extension, "wield")
			inventory_extension:destroy_slot("slot_level_event", true)
			inventory_extension:wield("slot_melee")
		end
	end
end

function flow_wield_slot(params)
	local unit = params.unit
	local slot_name = params.slot_name
	local inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")

	if inventory_extension then
		inventory_extension:wield(slot_name)
	end
end

function flow_query_wielded_weapon(params)
	local player_unit = params.player_unit
	local equipment = nil

	if not unit_alive(player_unit) then
		flow_return_table.righthandweapon3p = nil
		flow_return_table.righthandammo3p = nil
		flow_return_table.righthandweapon = nil
		flow_return_table.righthandammo1p = nil
		flow_return_table.lefthandweapon3p = nil
		flow_return_table.lefthandammo3p = nil
		flow_return_table.lefthandweapon = nil
		flow_return_table.lefthandammo1p = nil
		flow_return_table.aliverighthandammo1p = nil
		flow_return_table.alivelefthandammo1p = nil

		return flow_return_table
	end

	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if inventory_extension then
		equipment = inventory_extension:equipment()
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

	if right_hand_ammo_unit_1p and Unit.alive(right_hand_ammo_unit_1p) then
		flow_return_table.aliverighthandammo1p = true
	else
		flow_return_table.aliverighthandammo1p = false
	end

	if left_hand_ammo_unit_1p and Unit.alive(left_hand_ammo_unit_1p) then
		flow_return_table.alivelefthandammo1p = true
	else
		flow_return_table.alivelefthandammo1p = false
	end

	return flow_return_table
end

function flow_query_wielded_weapon_rarity(params)
	local player = Managers.player:local_player()

	if not player then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local player_unit = player.player_unit

	if not unit_alive(player_unit) then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if not inventory_extension then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local slot_data = inventory_extension:get_wielded_slot_data()

	if not slot_data then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local item_data = slot_data.item_data
	local backend_id = item_data.backend_id

	if not backend_id then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local backend_items = Managers.backend:get_interface("items")
	local item = backend_items:get_item_from_id(backend_id)

	if not item then
		flow_return_table.rarity = nil

		return flow_return_table
	end

	local rarity = item.rarity
	flow_return_table.rarity = rarity

	return flow_return_table
end

function flow_show_1p_ammo(params)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local player_unit = player.player_unit

	if not unit_alive(player_unit) then
		return
	end

	local first_person_extension = ScriptUnit.has_extension(player_unit, "first_person_system")

	if not first_person_extension then
		return
	end

	local show = params.show

	first_person_extension:show_first_person_ammo(show)
end

function flow_force_use_pickup_for_all_players(params)
	if not Managers.player.is_server then
		return
	end

	local pickup_name = params.pickup_name
	local pickup_name_id = NetworkLookup.pickup_names[pickup_name]
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit

	network_transmit:send_rpc_server("rpc_force_use_pickup", pickup_name_id)
end

function flow_camera_shake(params)
	DamageUtils.camera_shake_by_distance(params.shake_name, Managers.time:time("game"), params.player_unit, params.shake_unit, params.near_distance, params.far_distance, params.near_shake_scale, params.far_shake_scale)
end

function flow_register_unit_extensions(params)
	local unit = params.unit
	local unit_template = Unit.get_data(unit, "unit_template")

	fassert(unit_template, "Missing unit_template!")

	local world = Application.main_world()
	local extension_init_data = {
		navgraph_system = {
			nav_world = GLOBAL_AI_NAVWORLD
		}
	}

	Managers.state.unit_spawner:create_unit_extensions(world, unit, unit_template, extension_init_data)
end

function flow_add_unit_extension(params)
	local unit = params.unit
	local extension = params.extension

	fassert(extension, "Missing extension")

	local i = 0

	while Unit.has_data(unit, "extensions", i) do
		i = i + 1
	end

	Unit.set_data(unit, "extensions", i, extension)
end

function flow_callback_debug_print_unit_actor(params)
	print("FLOW DEBUG: Unit: ", tostring(params.unit), "Actor: ", tostring(params.actor))
end

function flow_callback_trigger_event(params)
	Unit.flow_event(params.unit, params.event)
end

function flow_callback_play_screen_space_blood(params)
	local effect_name = params.effect

	Managers.state.blood:play_screen_space_blood(effect_name, Vector3.zero())
end

function flow_callback_play_network_synched_particle_effect(params)
	local effect_name = params.effect
	local unit = params.unit
	local object_name = params.object
	local offset = params.offset or Vector3(0, 0, 0)
	local rotation_offset = params.rotation_offset or Quaternion.identity()
	local linked = params.linked or false
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local game_object_id = unit and linked and network_manager:unit_game_object_id(unit)

	fassert(game, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect with no network game running.")
	fassert(not unit or not linked or game_object_id, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect linked to unit not network_synched.")
	fassert(unit or not object_name, "[flow_callback_play_network_synched_particle_effect] Trying to spawn effect at object in unit without defining unit.")

	local object = unit and object_name and Unit.node(unit, object_name) or 0

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
end

function flow_callback_output_debug_screen_text(params)
	return
end

function flow_callback_debug_crash_game(params)
	if Application.crash then
		local crash_type = params.type or "access_violation"

		Application.crash(crash_type)
	end
end

function flow_callback_debug_draw_line(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local from = params.from
	local to = params.to
	local color = params.color

	drawer:line(from, to, color)
end

function flow_callback_debug_draw_vector(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local vector = params.vector
	local color = params.color

	drawer:vector(vector, color)
end

function flow_callback_debug_draw_sphere(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local center = params.center
	local radius = params.radius
	local color = params.color
	local segments = params.segments
	local parts = params.parts

	drawer:sphere(center, radius, color, segments, parts)
end

function flow_callback_debug_draw_capsule(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local from = params.from
	local to = params.to
	local radius = params.radius
	local color = params.color

	drawer:capsule(from, to, radius, color)
end

function flow_callback_debug_draw_box(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local position = params.position
	local rotation = params.rotation
	local extents = params.extents
	local color = params.color
	local pose = Matrix4x4.from_quaternion_position(rotation, position)

	drawer:box(pose, extents, color)
end

function flow_callback_debug_draw_circle(params)
	local drawer = params.stay and QuickDrawerStay or QuickDrawer
	local center = params.center
	local radius = params.radius
	local normal = params.normal
	local color = params.color
	local segments = params.segments

	drawer:circle(center, radius, normal, color, segments)
end

function flow_callback_reload_level(params)
	if Managers.player.is_server then
		Managers.state.game_mode:retry_level()
	end
end

function flow_callback_complete_level(params)
	if Managers.player.is_server then
		print("Level flags level completed.")
		Managers.state.game_mode:complete_level()
	end
end

function flow_callback_fail_level(params)
	if Managers.player.is_server then
		Managers.state.game_mode:fail_level()
	end
end

function flow_callback_menu_camera_dummy_spawned(params)
	Managers.state.event:trigger("menu_camera_dummy_spawned", params.camera_name, params.unit)
end

function flow_callback_menu_alignment_dummy_spawned(params)
	Managers.state.event:trigger("menu_alignment_dummy_spawned", params.alignment_name, params.unit)
end

function flow_callback_block_profile_menu_accept_button(params)
	local unit = params.unit
	local player = Managers.player:players()[Network.peer_id()]
	local player_unit = player.player_unit

	if unit_alive(player_unit) and player_unit == unit then
		global_profile_view:block_accept_button(true)
	end
end

function flow_callback_unblock_profile_menu_accept_button(params)
	local unit = params.unit
	local player = Managers.player:players()[Network.peer_id()]
	local player_unit = player.player_unit

	if unit_alive(player_unit) and player_unit == unit then
		global_profile_view:block_accept_button(false)
	end
end

function flow_callback_event_enable_level_select(params)
	Managers.state.event:trigger("event_enable_level_select")
end

function flow_callback_set_actor_enabled(params)
	local unit = params.unit

	fassert(unit, "Set Actor Enabled flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Enabled flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_collision_enabled(actor, params.enabled)
	Actor.set_scene_query_enabled(actor, params.enabled)
end

function flow_callback_set_actor_kinematic(params)
	local unit = params.unit

	fassert(unit, "Set Actor Kinematic flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Kinematic flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_kinematic(actor, params.enabled)
end

function flow_callback_spawn_actor(params)
	local unit = params.unit

	fassert(unit, "Spawn Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.create_actor(unit, actor)
end

function flow_callback_destroy_actor(params)
	local unit = params.unit

	fassert(unit, "Destroy Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.destroy_actor(unit, actor)
end

function flow_callback_set_actor_initial_velocity(params)
	local unit = params.unit

	fassert(unit, "Set actor initial velocity has no unit")
	Unit.apply_initial_actor_velocities(unit, true)
end

function flow_callback_set_unit_material_variation(params)
	local unit = params.unit
	local material_variation = params.material_variation

	Unit.set_material_variation(unit, material_variation)
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
	end
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
	end
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
end

function flow_callback_play_footstep_surface_material_effects(params)
	EffectHelper.flow_cb_play_footstep_surface_material_effects(params.effect_name, params.unit, params.object, params.foot_direction, params.use_occlusion or false)
end

function flow_callback_play_surface_material_effect(params)
	local hit_unit = params.hit_unit
	local sound_character = nil
	local range = params.range
	local offset = params.offset
	local normal = params.normal
	local rotation = Quaternion.look(params.normal, Vector3.up())

	EffectHelper.flow_cb_play_surface_material_effect(params.effect_name, hit_unit, params.position, rotation, normal, sound_character, params.husk, offset, range)
end

function flow_callback_play_voice(params)
	local playing_unit = params.playing_unit
	local event_name = params.event_name
	local use_occlusion = params.use_occlusion or false
	local dialogue_input = ScriptUnit.has_extension_input(playing_unit, "dialogue_system")

	if dialogue_input then
		dialogue_input:play_voice(event_name, use_occlusion)
	end
end

function flow_callback_foot_step(params)
	local unit = params.unit
end

function flow_callback_is_local_player(params)
	local unit = params.unit
	local player = Managers.player:players()[1]
	local player_unit = player.player_unit

	if unit_alive(player_unit) then
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
			WwiseWorld.trigger_event(wwise_world, params.event, params.use_occlusion, params.unit, Unit.actor(params.unit, params.actor))
		else
			WwiseWorld.trigger_event(wwise_world, params.event, params.use_occlusion, params.unit)
		end
	elseif params.position then
		WwiseWorld.trigger_event(wwise_world, params.event, params.use_occlusion, params.position)
	else
		WwiseWorld.trigger_event(wwise_world, params.event)
	end
end

function flow_callback_print_variable(params)
	print(params.string, params.variable)
end

function flow_callback_set_environment(params)
	local environment_name = params.environment_name
	local time = params.time

	Managers.state.event:trigger("set_environment", environment_name, time)
end

function flow_callback_start_bus_transition(params)
	Managers.music:start_bus_transition(params.bus_name, params.target_value, params.duration, params.transition_type, params.from_value)
end

function flow_callback_game_mode_event(params)
	local announcement = params.announcement
	local side = params.side
	local param_1 = params.param_1 or ""
	local param_2 = params.param_2 or ""

	Managers.state.game_mode:trigger_event("flow", announcement, side, param_1, param_2)
end

function flow_callback_thrown_projectile_bounce(params)
	local unit = params.unit

	if unit_alive(unit) and ScriptUnit.has_extension(unit, "projectile_system") then
		local ext = ScriptUnit.extension(unit, "projectile_system")

		ext:flow_cb_bounce(params.hit_unit, params.hit_actor, params.position, params.normal)
	end
end

function flow_callback_projectile_impacts_stopped(params)
	local unit = params.unit
	local impacts_stopped = true
	local projectile_extension = ALIVE[unit] and ScriptUnit.has_extension(unit, "projectile_system")

	if projectile_extension and projectile_extension.are_impacts_stopped then
		impacts_stopped = projectile_extension:are_impacts_stopped()
	end

	flow_return_table.impacts_stopped = impacts_stopped

	return flow_return_table
end

function flow_callback_mark_sack_for_linking(params)
	local unit = params.unit

	Unit.set_data(unit, "link_to_unit", true)
end

function flow_callback_remove_link_mark_for_sack(params)
	local unit = params.unit

	Unit.set_data(unit, "link_to_unit", nil)
end

function flow_callback_start_network_timer(params)
	if Managers.player.is_server then
		local time = params.time

		Managers.state.event:trigger("event_start_network_timer", time)
	end
end

function flow_callback_set_flow_object_set_enabled(params)
	fassert(params.set, "[Flow Callback : Set Flow Object Set Enabled] No set set.")
	fassert(params.enabled ~= nil, "[Flow Callback : Set Flow Object Set Enabled] No enabled set.")
	Managers.state.game_mode:flow_cb_set_flow_object_set_enabled(params.set, params.enabled)
end

function flow_callback_set_flow_object_set_particles_enabled(params)
	fassert(params.set, "[Flow Callback : Set Flow Object Set Particles Enabled] No set set.")
	fassert(params.enabled ~= nil, "[Flow Callback : Set Flow Object Set Particles Enabled] No enabled set.")

	local world = Application.flow_callback_context_world()
	local level = LevelHelper:current_level(world)

	if params.enabled then
		Level.start_particle_effects_in_object_set(level, "flow_" .. params.set)
	else
		Level.stop_particle_effects_in_object_set(level, "flow_" .. params.set)
	end
end

flow_cb_set_flow_object_set_enabled = flow_callback_set_flow_object_set_enabled

function flow_callback_create_networked_flow_state(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		local created, out_value = networked_flow_state:flow_cb_create_state(params.unit, params.state_name, params.in_value, params.client_state_changed_event, params.client_hot_join_event, params.is_game_object)

		if created then
			flow_return_table.created = created
			flow_return_table.out_value = out_value

			return flow_return_table
		end
	end
end

function flow_callback_change_networked_flow_state(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		local changed, out_value = networked_flow_state:flow_cb_change_state(params.unit, params.state_name, params.in_value)

		if changed then
			flow_return_table.changed = changed
			flow_return_table.out_value = out_value

			return flow_return_table
		end
	end
end

function flow_callback_get_networked_flow_state(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		local out_value = networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
		flow_return_table.out_value = out_value

		return flow_return_table
	end
end

function flow_callback_client_networked_flow_state_changed(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		local out_value = networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
		flow_return_table.changed = true
		flow_return_table.out_value = out_value

		return flow_return_table
	end
end

function flow_callback_client_networked_flow_state_set(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		local out_value = networked_flow_state:flow_cb_get_state(params.unit, params.state_name)
		flow_return_table.set = true
		flow_return_table.out_value = out_value

		return flow_return_table
	end
end

function flow_callback_create_networked_story(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_create_story(params)
	end
end

function flow_callback_networked_story_client_call(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_networked_story_client_call(params)
	end
end

function flow_callback_has_stopped_networked_story(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_has_stopped_networked_story(params)
	end
end

function flow_callback_has_played_networked_story(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_has_played_networked_story(params)
	end
end

function flow_callback_play_networked_story(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_play_networked_story(params)
	end
end

function flow_callback_stop_networked_story(params)
	local networked_flow_state = Managers.state.networked_flow_state

	if networked_flow_state then
		return networked_flow_state:flow_cb_stop_networked_story(params)
	end
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

	locomotion_extension:bounce(touching_unit, position, normal, separation_distance, impulse_force)
end

local temp = {}

function flow_callback_get_random_player(params)
	local players = Managers.player:human_and_bot_players()

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for _, player in pairs(players) do
		local unit = player.player_unit

		if HEALTH_ALIVE[unit] then
			unit_list_n = unit_list_n + 1
			unit_list[unit_list_n] = unit
		end
	end

	if unit_list_n > 0 then
		local unit = unit_list[math.random(1, unit_list_n)]
		flow_return_table.playerunit = unit

		return flow_return_table
	end

	return nil
end

function flow_callback_get_random_player_or_global_observer(params)
	local players = Managers.player:human_and_bot_players()
	local surrounding_aware_system = Managers.state.entity:system("surrounding_aware_system")
	local global_observers = surrounding_aware_system.global_observers

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for _, player in pairs(players) do
		local unit = player.player_unit

		if HEALTH_ALIVE[unit] then
			unit_list_n = unit_list_n + 1
			unit_list[unit_list_n] = unit
		end
	end

	for unit in pairs(global_observers) do
		unit_list_n = unit_list_n + 1
		unit_list[unit_list_n] = unit
	end

	if unit_list_n > 0 then
		local unit = unit_list[math.random(1, unit_list_n)]
		flow_return_table.unit = unit

		return flow_return_table
	end

	return nil
end

function flow_callback_get_random_global_observer(params)
	local surrounding_aware_system = Managers.state.entity:system("surrounding_aware_system")
	local global_observers = surrounding_aware_system.global_observers

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for unit in pairs(global_observers) do
		unit_list_n = unit_list_n + 1
		unit_list[unit_list_n] = unit
	end

	if unit_list_n > 0 then
		local unit = unit_list[math.random(1, unit_list_n)]
		flow_return_table.unit = unit

		return flow_return_table
	end

	return nil
end

function flow_callback_trigger_dialogue_event(params)
	local unit = params.source

	fassert(unit, "Calling flow_callback_trigger_dialogue_event without passing unit")

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

		dialogue_input:trigger_dialogue_event(params.concept, event_table, params.identifier)
	else
		print(string.format("[flow_callback_trigger_dialogue_event] No extension found belonging to system \"dialogue_system\" for unit %s", tostring(unit)))
	end
end

function flow_callback_change_outline_params(params)
	if DEDICATED_SERVER then
		return
	end

	local unit = params.unit
	local outline_ext = ScriptUnit.has_extension(unit, "outline_system")

	fassert(outline_ext, "Trying to change outline params through flow without an outline extension on the unit")

	local method = params.method

	if method then
		outline_ext:update_outline({
			method = method
		}, 0)
	end

	local color = OutlineSettings.colors[params.color]

	if color then
		outline_ext:update_outline({
			outline_color = color
		}, 0)
	end
end

function flow_callback_register_transport_navmesh_units(params)
	local unit = params.unit
	local start_unit = params.start_unit
	local end_unit = params.end_unit
	local transportation_extension = ScriptUnit.extension(unit, "transportation_system")

	transportation_extension:register_navmesh_units(start_unit, end_unit)
end

function flow_callback_set_door_state_and_duration(params)
	local unit = params.unit
	local new_door_state = params.new_door_state
	local frames = params.frames
	local speed = params.speed
	local door_extension = ScriptUnit.extension(unit, "door_system")

	door_extension:set_door_state_and_duration(new_door_state, frames, speed)
end

function flow_callback_set_door_state(params)
	local unit = params.unit
	local new_door_state = params.new_door_state
	local door_extension = ScriptUnit.extension(unit, "door_system")

	door_extension:set_door_state(new_door_state)

	door_extension.frames_since_obstacle_update = 0
end

function flow_callback_door_animation_played(params)
	local unit = params.unit
	local frames = params.frames
	local speed = params.speed
	local door_extension = ScriptUnit.extension(unit, "door_system")

	door_extension:animation_played(frames, speed)
end

function flow_callback_set_valid_ai_target(params)
	local unit = params.unit
	local valid_target = params.valid_target
	local ai_slot_extension = ScriptUnit.extension(unit, "ai_slot_system")
	ai_slot_extension.valid_target = valid_target
end

function flow_callback_set_ai_aggro_modifier(params)
	local unit = params.unit
	local aggro_modifier = params.aggro_modifier
	local aggro_extension = ScriptUnit.extension(unit, "aggro_system")
	aggro_extension.aggro_modifier = aggro_modifier * -1
end

function flow_callback_objective_entered_socket_zone(params)
	print("[flow_callback_objective_entered_socket_zone]", params.socket_unit, params.objective_unit)

	if Managers.player.is_server then
		local socket_unit = params.socket_unit
		local objective_unit = params.objective_unit
		local socket_data = Unit.get_data(socket_unit, "socket_type") or "none"
		local objective_data = Unit.get_data(objective_unit, "socket_type") or "none"

		if socket_data == objective_data then
			local objective_socket_extension = ScriptUnit.extension(socket_unit, "objective_socket_system")

			objective_socket_extension:objective_entered_zone_server(objective_unit)
		else
			print("[flow_callback_objective_entered_socket_zone] Socket type doesn't match", params.socket_unit, params.objective_unit)
		end
	end
end

function flow_callback_ussingen_barrel_challenge(params)
	print("[flow_callback_ussingen_barrel_challenge]", params.barrel_unit)

	if Managers.player.is_server then
		local barrel_unit = params.barrel_unit
		local num_valid_barrels = params.num_valid_barrels
		local is_event_spawned = ScriptUnit.has_extension(barrel_unit, "limited_item_track_system")

		if not is_event_spawned then
			flow_return_table.is_valid_barrel = 1

			return flow_return_table
		end
	end

	flow_return_table.is_valid_barrel = 0

	return flow_return_table
end

function flow_callback_ussingen_barrel_challenge_completed(params)
	print("[flow_callback_ussingen_barrel_challenge_completed]")

	if Managers.player.is_server then
		local stat_names = {
			"ussingen_used_no_barrels",
			"ussingen_used_no_barrels_cata"
		}

		for i = 1, #stat_names do
			local current_difficulty = Managers.state.difficulty:get_difficulty()
			local allowed_difficulties = QuestSettings.allowed_difficulties[stat_names[i]]
			local allowed_difficulty = allowed_difficulties[current_difficulty]

			if allowed_difficulty then
				local num_valid_barrels = params.num_valid_barrels

				if num_valid_barrels >= 3 then
					local statistics_db = Managers.player:statistics_db()

					statistics_db:increment_stat_and_sync_to_clients(stat_names[i])
				end
			end
		end
	end
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
end

function flow_callback_enable_environment_volume(params)
	fassert(params.volume_name, "[flow_callbacks] No volume name provided [required]")
	Managers.state.event:trigger("enable_environment_volume", params.volume_name, params.enable)
end

function flow_callback_volume_system_register_damage_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system:register_volume(params.volume_name, "damage_volume", params)
end

function flow_callback_volume_system_register_movement_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system:register_volume(params.volume_name, "movement_volume", params)
end

function flow_callback_volume_system_register_location_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	fassert(NetworkLookup.locations[params.location], "Volume location named [\"%s\"] needs to be added to NetworkLookup.locations", params.location)
	volume_system:register_volume(params.volume_name, "location_volume", params)
end

function flow_callback_volume_system_register_trigger_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system:register_volume(params.volume_name, "trigger_volume", params)
end

function flow_callback_volume_system_register_despawn_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system:register_volume(params.volume_name, "despawn_volume", params)
end

function flow_callback_volume_system_unregister_volume(params)
	local volume_system = Managers.state.entity:system("volume_system")

	volume_system:unregister_volume(params.volume_name)
end

function flow_callback_intro_cutscene_show_location(params)
	fassert(params.location, "No location set")

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	fassert(unit_alive(player_unit), "Tried showing location with no player unit spawned")

	local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

	hud_extension:set_current_location(params.location)
end

function flow_callback_local_player_profile_switch(params)
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
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

function flow_callback_local_player_profile_check(params)
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	local returns = {
		player_profile = profile_name
	}

	return returns
end

function flow_callback_local_player_profile_available(params)
	local player = Managers.player:local_player_safe()

	if not player then
		return {
			is_available = false
		}
	end

	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local profile_name = profile and profile.display_name

	return {
		is_available = profile_name ~= nil
	}
end

function flow_callback_compare_string(params)
	local a = params.a
	local b = params.b
	local returns = {
		equals = a == b,
		not_equals = a ~= b
	}

	return returns
end

function flow_callback_set_allowed_nav_tag_volume_layer(params)
	local layer_name = params.layer
	local allowed = params.allowed
	local ai_system = Managers.state.entity:system("ai_system")

	ai_system:set_allowed_layer(layer_name, allowed)
end

function flow_callback_register_spline_properties(params)
	local spline_name = params.spline_name
	local despawn_patrol_at_end_of_spline = params.despawn_patrol_at_end_of_spline
	local ai_group_system = Managers.state.entity:system("ai_group_system")

	ai_group_system:register_spline_properties(spline_name, {
		despawn_patrol_at_end_of_spline = despawn_patrol_at_end_of_spline
	})
end

function flow_callback_register_sound_environment(params)
	if DEDICATED_SERVER then
		return
	end

	local volume_name = params.volume_name
	local prio = params.prio
	local ambient_sound_event = params.ambient_sound_event
	local fade_time = params.fade_time
	local aux_bus_name = params.aux_bus_name
	local environment_state = params.environment_state
	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system:register_sound_environment(volume_name, prio, ambient_sound_event, fade_time, aux_bus_name, environment_state)
end

function flow_callback_wwise_trigger_event_with_environment(params)
	if DEDICATED_SERVER or not Managers.state.entity then
		flow_return_table.playing_id = 1
		flow_return_table.source_id = 1

		return flow_return_table
	end

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
		ferror("Missing unit or position in wwise trigger even with environment flow node in unit %s", unit)
	end

	if Vector3.is_valid(position) then
		sound_environment_system:set_source_environment(source, position)
	end

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
		ferror("Missing unit or position in wwise environment sampled source creation flow node in unit %s", unit)
	end

	sound_environment_system:set_source_environment(source, pos)

	flow_return_table.source_id = source

	return flow_return_table
end

function flow_callback_wwise_register_source_environment_update(params)
	fassert(params.source_id, "Missing SourceId in \"Register source for environment sample update\"")
	fassert(params.unit, "Missing Unit in \"Register source for environment sample update\"")

	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system:register_source_environment_update(params.source_id, params.unit)
end

function flow_callback_wwise_unregister_source_environment_update(params)
	fassert(params.source_id, "Missing SourceId in \"Unregister source for environment sample update\"")

	local sound_environment_system = Managers.state.entity:system("sound_environment_system")

	sound_environment_system:unregister_source_environment_update(params.source_id)
end

function flow_callback_clear_linked_projectiles(params)
	local unit = params.unit
	local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

	projectile_linker_system:clear_linked_projectiles(unit)
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

	cutscene_system:flow_cb_activate_cutscene_camera(camera_unit, transition_data, ingame_hud_enabled, letterbox_enabled)
end

function flow_callback_deactivate_cutscene_cameras(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system:flow_cb_deactivate_cutscene_cameras()
end

function flow_callback_activate_cutscene_logic(params)
	local player_input_enabled = not not params.player_input_enabled
	local event_on_activate = params.event_on_activate
	local event_on_skip = params.event_on_skip
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system:flow_cb_activate_cutscene_logic(player_input_enabled, event_on_activate, event_on_skip)
end

function flow_callback_deactivate_cutscene_logic(params)
	local event_on_deactivate = params.event_on_deactivate
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system:flow_cb_deactivate_cutscene_logic(event_on_deactivate)
end

function flow_callback_cutscene_fx_fade(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system:flow_cb_cutscene_effect("fx_fade", params)
end

function flow_callback_cutscene_fx_text_popup(params)
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	cutscene_system:flow_cb_cutscene_effect("fx_text_popup", params)
end

function flow_callback_start_tutorial_intro_text(params)
	local tutorial_template_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_tutorial")

	Managers.state.event:trigger("event_start_cutscene_overlay", tutorial_template_settings)
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

		mission_system:flow_callback_start_mission(mission_name, params.unit)
	end
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

		mission_system:flow_callback_update_mission(mission_name)
	end
end

function flow_callback_reset_mission(params)
	local mission_name = params.mission_name

	fassert(mission_name, "[flow_callback_reset_mission] No mission name passed")
	fassert(Missions[mission_name], "[flow_callback_start_mission] There is no mission by the name %q", mission_name)

	local mission_template = Missions[mission_name]

	if mission_template.is_tutorial_input then
		Managers.state.event:trigger("event_update_tutorial_input", mission_name)
	else
		local mission_system = Managers.state.entity:system("mission_system")

		mission_system:flow_callback_reset_mission(mission_name)
	end
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

		mission_system:flow_callback_end_mission(mission_name)
	end
end

function flow_callback_show_health_bar(params)
	fassert(params.unit, "[flow_callback_show_health_bar] No unit passed")

	local tutorial_system = Managers.state.entity:system("tutorial_system")

	tutorial_system:flow_callback_show_health_bar(params.unit, params.show)
end

function flow_callback_spawn_tutorial_bot(params)
	local profile_index = params.profile_index
	local career_index = 1

	Managers.state.game_mode:game_mode():add_bot(profile_index, career_index)
end

function flow_callback_set_bot_ready_for_assisted_respawn(params)
	local unit = params.unit
	local respawn_unit = params.respawn_unit

	Managers.state.entity:system("play_go_tutorial_system"):set_bot_ready_for_assisted_respawn(unit, respawn_unit)
end

function flow_callback_enable_tutorial_player_ammo_refill(params)
	Managers.state.entity:system("play_go_tutorial_system"):enable_player_ammo_refill()
end

function flow_callback_remove_player_ammo(params)
	Managers.state.entity:system("play_go_tutorial_system"):remove_player_ammo()
end

function flow_callback_check_player_ammo(params)
	flow_return_table.has_ammo = Managers.state.entity:system("play_go_tutorial_system"):check_player_ammo()

	return flow_return_table
end

function flow_callback_give_player_potion_from_bot(params)
	local player_unit = params.player_unit
	local bot_unit = params.bot_unit

	Managers.state.entity:system("play_go_tutorial_system"):give_player_potion_from_bot(player_unit, bot_unit)
end

function flow_callback_get_players_and_bots(params)
	local players = Managers.player:human_and_bot_players()

	table.clear(temp)

	local unit_list = temp
	local unit_list_n = 0

	for _, player in pairs(players) do
		local unit = player.player_unit

		if HEALTH_ALIVE[unit] then
			unit_list_n = unit_list_n + 1
			local profile_index = player:profile_index()
			unit_list[profile_index] = unit
		end
	end

	if unit_list_n > 0 then
		flow_return_table.profile1 = unit_list[1]
		flow_return_table.profile2 = unit_list[2]
		flow_return_table.profile3 = unit_list[3]
		flow_return_table.profile4 = unit_list[4]
		flow_return_table.profile5 = unit_list[5]

		return flow_return_table
	end

	return nil
end

function flow_callback_add_group_buff(params)
	if not Managers.player.is_server then
		return
	end

	local group_buff_template = params.group_buff_template
	local group_buff_name_id = NetworkLookup.group_buff_templates[group_buff_template]
	local buff_system = Managers.state.entity:system("buff_system")

	buff_system:rpc_add_group_buff(nil, group_buff_name_id, 1)

	return nil
end

function flow_callback_set_career_voice_parameter_value(params)
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local career_voice_parameter = profile.career_voice_parameter
	local spawn_manager = Managers.state.spawn
	local world = spawn_manager.world
	local wwise_world = Wwise.wwise_world(world)
	local career_voice_parameter_value = params.career_voice_parameter_value

	WwiseWorld.set_global_parameter(wwise_world, career_voice_parameter, career_voice_parameter_value)
end

function flow_is_carrying_explosive_barrel(params)
	local player_unit = params.player_unit

	if not unit_alive(player_unit) then
		flow_return_table.has_barrel = nil

		return flow_return_table
	end

	local equipment = nil
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if inventory_extension then
		equipment = inventory_extension:equipment()
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

function flow_is_carrying_torch(params)
	local player_unit = params.player_unit

	if not unit_alive(player_unit) then
		flow_return_table.has_torch = nil

		return flow_return_table
	end

	local equipment = nil
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if inventory_extension then
		equipment = inventory_extension:equipment()
	else
		equipment = Unit.get_data(player_unit, "equipment")
	end

	local weapon_unit = equipment.left_hand_wielded_unit or equipment.right_hand_wielded_unit

	if weapon_unit then
		local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
		local item_name = weapon_extension.item_name

		if item_name == "torch" or item_name == "shadow_torch" then
			flow_return_table.has_torch = true
		end
	end

	return flow_return_table
end

function flow_callback_teleport_unit(params)
	local unit = params.unit
	local position = params.position
	local rotation = params.rotation

	if not unit_alive(unit) then
		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	if locomotion_extension.teleport_to then
		locomotion_extension:teleport_to(position, rotation)
	end

	local bot = Unit.get_data(unit, "bot")

	if bot then
		local navigation_extension = ScriptUnit.extension(unit, "ai_navigation_system")

		navigation_extension:teleport(position)
	end
end

function flow_callback_unspawn_all_ais(params)
	Managers.state.conflict:destroy_all_units()
end

function flow_query_slots_status(params)
	local player_unit = params.player_unit

	if not unit_alive(player_unit) then
		flow_return_table.healthkit = nil
		flow_return_table.grenade = nil
		flow_return_table.potion = nil

		return flow_return_table
	end

	local equipment = nil
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if inventory_extension then
		equipment = inventory_extension:equipment()
	else
		equipment = Unit.get_data(player_unit, "equipment")
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

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to kill unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local damage_type = "forced"
		local hit_position = Unit.world_position(unit, 0)
		local damage_direction = Vector3.up()
		local max_damage = NetworkConstants.damage.max
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local clamped_damage = math.min(damage, health_extension:current_health())
		local damage_chunks = math.ceil(clamped_damage / max_damage)

		for i = 0, damage_chunks - 1 do
			local damage_to_apply = math.min(clamped_damage - damage_chunks * i, damage_chunks)

			DamageUtils.add_damage_network(unit, unit, damage_to_apply, hit_zone_name, damage_type, hit_position, damage_direction)
		end
	end
end

function flow_callback_get_health_player_bot_ai(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local current_health = nil

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to get unit %s health from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local status_extension = ScriptUnit.has_extension(unit, "status_system")
		current_health = status_extension and (status_extension:is_knocked_down() or status_extension:is_ready_for_assisted_respawn()) and 0 or health_extension:current_health()
	end

	flow_return_table.currenthealth = current_health

	return flow_return_table
end

function flow_callback_clear_slot(params)
	local player_unit = params.player_unit
	local slot_name = params.slot_name

	if not unit_alive(player_unit) then
		return
	end

	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if not inventory_extension then
		return
	end

	inventory_extension:destroy_slot(slot_name)
end

function flow_callback_set_wwise_elevation_alignment(params)
	local elevation_offset = params.position.z
	local elevation_scale = params.scale
	local elevation_min = params.min
	local elevation_max = params.max
	local camera_manager = Managers.state.camera

	if camera_manager then
		camera_manager:set_elevation_offset(elevation_offset, elevation_scale, elevation_min, elevation_max)
	end
end

function flow_callback_kill_player_bot_ai(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to kill unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:die()
	end
end

function flow_callback_overcharge_heal_unit(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local health_added = params.health

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to heal overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:add_heal(unit, health_added, nil, "n/a")

		local unit_health = health_extension:current_health()
		local unit_damage = health_extension:get_damage_taken()
		flow_return_table.current_health = unit_health
		flow_return_table.current_damage = unit_damage

		return flow_return_table
	end
end

function flow_callback_overcharge_init_unit(params)
	local unit = params.unit
	local init_damage = params.init_damage

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local hit_zone_name = "full"
		local hit_position = Unit.world_position(unit, 0)
		local attack_direction = Vector3.up()

		health_extension:add_damage(unit, init_damage, hit_zone_name, "destructible_level_object_hit", hit_position, attack_direction, "wounded_degen")
	end
end

function flow_callback_overcharge_sync_damage(params)
	local unit = params.unit
	local damage = params.damage
	local hit_zone_name = "full"
	local hit_position = Unit.world_position(unit, 0)
	local health_extension = ScriptUnit.extension(unit, "health_system")
	local attack_direction = Vector3.up()

	health_extension:add_damage(unit, damage, hit_zone_name, "destructible_level_object_hit", hit_position, attack_direction, "wounded_degen")
end

function flow_callback_overcharge_damage_unit(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local damage = params.damage

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage overcharge unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local hit_position = Unit.world_position(unit, 0)
		local attack_direction = Vector3.up()
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:add_damage(unit, damage, hit_zone_name, "destructible_level_object_hit", hit_position, attack_direction, "wounded_degen")
	end
end

function flow_callback_overcharge_reset_unit(params)
	local unit = params.unit
	local max_health = params.maxhealth

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to reset health and damage on overcharge unit %s from flow but the unit has no health extension", unit)

		local health_extension = ScriptUnit.extension(unit, "health_system")
		local damage = 0

		health_extension:set_current_damage(damage)
		health_extension:set_max_health(max_health)

		local network_manager = Managers.state.network

		if network_manager.is_server then
			damage = NetworkUtils.get_network_safe_damage_hotjoin_sync(damage)
			local health_state = health_extension.state
			local state_id = NetworkLookup.health_statuses[health_state]
			local network_transmit = Managers.state.network.network_transmit
			local go_id, is_level_unit = network_manager:game_object_or_level_id(unit)

			network_transmit:send_rpc_clients("rpc_sync_damage_taken", go_id, is_level_unit, false, damage, state_id)
		end
	end
end

local PI = math.pi
local TWO_PI = PI * 2

function flow_callback_fire_light_weight_projectile(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local shots_to_fire = params.shots_to_fire or 1
	local light_weight_projectile_template_name = params.light_weight_projectile_template_name
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local item_name = "skaven_ratling_gunner"
	local position = Unit.world_position(unit, 0)

	for i = 1, shots_to_fire do
		local spread_angle = Math.random() * light_weight_projectile_template.spread
		local direction = Quaternion.forward(Unit.world_rotation(unit, 0))
		local pitch = Quaternion(Vector3.right(), spread_angle)
		local roll = Quaternion(Vector3.forward(), Math.random() * TWO_PI)
		local dir_rot = Quaternion.look(direction, Vector3.up())
		local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
		local spread_direction = Quaternion.forward(spread_rot)
		local collision_filter = "filter_enemy_player_afro_ray_projectile"
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank]
		local action_data = {
			power_level = power_level,
			damage_profile = light_weight_projectile_template.damage_profile,
			hit_effect = light_weight_projectile_template.hit_effect,
			player_push_velocity = Vector3Box(direction * light_weight_projectile_template.impact_push_speed),
			projectile_linker = light_weight_projectile_template.projectile_linker,
			first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events
		}
		local projectile_system = Managers.state.entity:system("projectile_system")
		local owner_peer_id = Network.peer_id()

		projectile_system:create_light_weight_projectile(item_name, unit, position, spread_direction, light_weight_projectile_template.projectile_speed, nil, nil, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, owner_peer_id)
	end
end

function flow_callback_trigger_explosion(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local explosion_template_name = params.explosion_template_name

	fassert(explosion_template_name, "Trigger Explosion unit flow node is missing explosion_template_name")

	local explosion_template = ExplosionTemplates[explosion_template_name]

	fassert(explosion_template.explosion.level_unit_damage, "The explosion_template must have level_unit_damage set to true when using this flow node")

	local position = Unit.world_position(unit, 0)
	local rotation = Unit.world_rotation(unit, 0)
	local scale = 1
	local item_name = "grenade_frag_01"

	Managers.state.entity:system("area_damage_system"):create_explosion(unit, position, rotation, explosion_template_name, scale, item_name, nil, false)
end

function flow_callback_enable_climb_unit(params)
	local unit = params.unit

	if unit_alive(unit) then
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")

		nav_graph_system:init_nav_graph_from_flow(unit)
	end
end

function flow_callback_add_nav_graph_on_climb_unit(params)
	local unit = params.unit

	if unit_alive(unit) then
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")

		nav_graph_system:queue_add_nav_graph_from_flow(unit)
	end
end

function flow_callback_remove_nav_graph_on_climb_unit(params)
	local unit = params.unit

	if unit_alive(unit) then
		local nav_graph_system = Managers.state.entity:system("nav_graph_system")

		nav_graph_system:queue_remove_nav_graph_from_flow(unit)
	end
end

function flow_callback_create_permanent_box_obstacle_from_unit(params)
	local unit = params.unit

	if not unit_alive(unit) then
		return
	end

	local nav_world = GLOBAL_AI_NAVWORLD
	local obstacle, transform = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, unit)

	GwNavBoxObstacle.add_to_world(obstacle)
	GwNavBoxObstacle.set_transform(obstacle, transform)
	GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle, true)
end

function flow_callback_limited_item_spawner_group_register(params)
	if not Managers.player.is_server then
		return
	end

	local group_name = params.name
	local pool_size = params.pool_size

	Managers.state.entity:system("limited_item_track_system"):register_group(group_name, pool_size)
end

function flow_callback_limited_item_spawner_group_decrease_pool_size(params)
	if not Managers.player.is_server then
		return
	end

	local group_name = params.name
	local pool_size = params.pool_size

	Managers.state.entity:system("limited_item_track_system"):decrease_group_pool_size(group_name, pool_size)
end

function flow_callback_limited_item_spawner_group_activate(params)
	if not Managers.player.is_server then
		return
	end

	local group_name = params.name
	local pool_size = params.pool_size

	Managers.state.entity:system("limited_item_track_system"):activate_group(group_name, pool_size)
end

function flow_callback_limited_item_spawner_group_deactivate(params)
	if not Managers.player.is_server then
		return
	end

	local group_name = params.name

	Managers.state.entity:system("limited_item_track_system"):deactivate_group(group_name)
end

function flow_callback_blood_collision(params)
	if Managers.state.decal ~= nil then
		local actor = params.actor
		local my_unit = Actor.unit(actor)
		local position = params.position
		local normal = params.normal
		local velocity = Actor.velocity(actor)
		local MAX_VELOCITY = 1000

		if MAX_VELOCITY < velocity.x or velocity.x < -MAX_VELOCITY or MAX_VELOCITY < velocity.y or velocity.y < -MAX_VELOCITY or MAX_VELOCITY < velocity.z or velocity.z < -MAX_VELOCITY then
			velocity = Vector3(0, 0, -1)
		end

		local dot_value = Vector3.dot(normal, Vector3.normalize(velocity))
		local tangent = Vector3.normalize(Vector3.normalize(velocity) - dot_value * normal)
		local tangent_rotation = Quaternion.look(tangent, normal)
		local blood_unit_name = "units/decals/projection_blood_" .. string.format("%02d", tostring(Math.random(1, 17)))
		local extents = Vector3(BloodSettings.blood_decals.scale, BloodSettings.blood_decals.scale, 1)

		Managers.state.decal:add_projection_decal(blood_unit_name, nil, nil, position, tangent_rotation, extents, normal)
		Managers.state.blood:despawn_blood_ball(my_unit)
	end
end

function flow_callback_blood_ball_despawn(params)
	if Managers.state.decal ~= nil then
		local my_unit = params.unit

		Managers.state.blood:despawn_blood_ball(my_unit)
	end
end

function flow_callback_blood_enabled()
	if Managers.state.blood then
		flow_return_table.enabled = Managers.state.blood:get_blood_enabled()
	else
		flow_return_table.enabled = false
	end

	return flow_return_table
end

function flow_callback_enable_poison_wind(params)
	local unit = params.unit
	local enable = params.enable
	local area_damage_system = Managers.state.entity:system("area_damage_system")

	area_damage_system:enable_area_damage(unit, enable)
end

function flow_callback_objective_unit_set_active(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local extension = ScriptUnit.extension(unit, "tutorial_system")

	extension:set_active(params.active)
end

function flow_callback_objective_unit_set_active_generic(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local system_name = params.system_name
	local extension = ScriptUnit.extension(unit, system_name)

	extension:set_active(params.active, params.unit)
end

local function get_objective_system()
	if Managers.weave:get_active_weave() then
		return Managers.state.entity:system("weave_objective_system")
	elseif Managers.mechanism:current_mechanism_name() == "versus" then
		return Managers.state.entity:system("versus_objective_system")
	end
end

function flow_callback_objective_get_num_current_main_objectives(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = #objective_system:current_main_objectives()

	return flow_return_table
end

function flow_callback_objective_get_total_main_objectives(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = objective_system:num_main_objectives()

	return flow_return_table
end

function flow_callback_objective_get_total_num_completed_objectives(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = objective_system:num_total_completed_objectives()

	return flow_return_table
end

function flow_callback_objective_get_num_completed_main_objectives(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = objective_system:num_completed_main_objectives()

	return flow_return_table
end

function flow_callback_objective_get_current_completed_sub_objectives(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = objective_system:num_current_completed_sub_objectives()

	return flow_return_table
end

function flow_callback_objective_get_num_current_sub_objectives()
	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	flow_return_table.out_value = objective_system:num_current_sub_objectives()

	return flow_return_table
end

function flow_callback_objective_complete_current_objectives(params)
	if not Managers.player.is_server then
		return
	end

	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	local current_main_objectives = objective_system:current_main_objectives()
	local current_sub_objectives = objective_system:current_sub_objectives()

	for _, data in pairs(current_sub_objectives) do
		for _, extension in ipairs(data.extensions) do
			extension._is_done = true
		end
	end

	for _, extension in pairs(current_main_objectives) do
		extension._completed = true
	end
end

function flow_callback_objective_complete_sub_objective(params)
	if not Managers.player.is_server then
		return
	end

	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	local current_sub_objectives = objective_system:current_sub_objectives()

	for _, data in pairs(current_sub_objectives) do
		for _, extension in ipairs(data.extensions) do
			extension._completed = true
		end
	end
end

function flow_callback_objective_complete_current_objective_by_name(params)
	if not Managers.player.is_server then
		return
	end

	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	objective_system:complete_objective(params.name)
end

function flow_callback_objective_is_objective_completed(params)
	local objective_system = get_objective_system()

	if not objective_system then
		return false
	end

	local objective = objective_system._objectives_by_name[params.name]

	if not objective then
		return false
	end

	if not objective:is_active() then
		return false
	end

	return {
		out_value = objective:is_done()
	}
end

function flow_callback_objective_last_objective_by_name_completed(params)
	if not Managers.player.is_server then
		return false
	end

	local objective_system = get_objective_system()

	if not objective_system then
		return false
	end

	local objective = objective_system._last_main_objective_completed

	if not objective then
		return false
	end

	return {
		out_value = objective:objective_name() == params.name
	}
end

function flow_callback_objective_last_completed_objective_name(params)
	if not Managers.player.is_server then
		return
	end

	local objective_system = get_objective_system()

	if not objective_system then
		return
	end

	local objective = objective_system._last_main_objective_completed

	if not objective then
		return
	end

	return {
		out_value = objective:objective_name()
	}
end

function flow_callback_umbra_set_gate_closed(params)
	local unit = params.unit
	local world = Unit.world(unit)
	local umbra_available = World.umbra_available(world)

	if umbra_available then
		local closed = params.closed

		World.umbra_set_gate_closed(world, unit, closed)
	end
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

	for i = 1, num_hits do
		local hit_unit = UNIT_EVENT_RESULT_TABLE[i]
		local blackboard = BLACKBOARDS[hit_unit]

		if blackboard and blackboard.breed.name == target_breed then
			blackboard.external_event_name = event_name
			blackboard.external_event_value = value
		end
	end

	table.clear(UNIT_EVENT_RESULT_TABLE)
end

function flow_callback_force_unit_animation(params)
	local source_unit = params.source_unit
	local radius = params.radius
	local target_breed = params.target_breed
	local anim_event_name = params.animation_event_name
	local num_hits = AiUtils.broadphase_query(Unit.world_position(source_unit, 0), radius or 5, UNIT_EVENT_RESULT_TABLE)
	local BLACKBOARDS = BLACKBOARDS

	for i = 1, num_hits do
		local hit_unit = UNIT_EVENT_RESULT_TABLE[i]
		local blackboard = BLACKBOARDS[hit_unit]

		if blackboard and blackboard.breed.name == target_breed then
			Managers.state.network:anim_event(hit_unit, anim_event_name)
		end
	end

	table.clear(UNIT_EVENT_RESULT_TABLE)
end

function flow_callback_synced_animation(params)
	local game = Managers.state.network:game()

	if game then
		local unit = params.unit
		local animation_event = params.animation_event
		local unit_storage = Managers.state.unit_storage
		local go_id = unit_storage:go_id(unit)
		local animation_synced_unit_id = GameSession.game_object_field(game, go_id, "animation_synced_unit_id")
		local target_unit = unit_storage:unit(animation_synced_unit_id)

		if target_unit and animation_event and Unit.has_animation_event(target_unit, animation_event) then
			Unit.animation_event(target_unit, animation_event)
		end
	end
end

function flow_callback_player_animation(params)
	local character_type = params.character_type
	local animation_event = params.animation_event
	local players = Managers.player:human_and_bot_players()

	for _, player in pairs(players) do
		local profile_settings = SPProfiles[player:profile_index()]
		local display_name = profile_settings.display_name
		local unit = player.player_unit

		if unit and display_name == character_type and Unit.has_animation_event(unit, animation_event) then
			Unit.animation_event(unit, animation_event)
		end
	end
end

function flow_callback_trigger_dialogue_story(params)
	local unit = params.unit

	DialogueSystem:trigger_story_dialogue(unit)
end

function flow_callback_trigger_cutscene_subtitles(params)
	local event_name = params.subtitle_event
	local speaker = params.speaker
	local hangtime = params.end_delay

	DialogueSystem:trigger_cutscene_subtitles(event_name, speaker, hangtime)
end

function flow_callback_trigger_event_with_subtitles(params)
	local sound_event = params.sound_event
	local subtitle_event = params.subtitle_event
	local speaker = params.speaker

	DialogueSystem:trigger_sound_event_with_subtitles(sound_event, subtitle_event, speaker)
end

function flow_callback_trigger_event_with_unit_and_subtitles(params)
	local sound_event = params.sound_event
	local subtitle_event = params.subtitle_event
	local speaker = params.speaker
	local source_unit = params.source_unit
	local unit_node = params.unit_node

	DialogueSystem:trigger_sound_event_with_subtitles(sound_event, subtitle_event, speaker, source_unit, unit_node)
end

function flow_callback_trigger_random_event_with_unit_and_subtitles(params)
	local sound_events = {
		params.sound_event01,
		params.sound_event02,
		params.sound_event03,
		params.sound_event04,
		params.sound_event05,
		params.sound_event06,
		params.sound_event07,
		params.sound_event08,
		params.sound_event09,
		params.sound_event10,
		params.sound_event11,
		params.sound_event12,
		params.sound_event13,
		params.sound_event14,
		params.sound_event15,
		params.sound_event16,
		params.sound_event17,
		params.sound_event18,
		params.sound_event19,
		params.sound_event20
	}
	local sound_event = sound_events[math.random(#sound_events)]
	local subtitle_event = sound_event
	local speaker = params.speaker
	local source_unit = params.source_unit
	local unit_node = params.unit_node

	DialogueSystem:trigger_sound_event_with_subtitles(sound_event, subtitle_event, speaker, source_unit, unit_node)
end

function flow_callback_override_start_dialogue_system()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
	dialogue_extension.local_player_has_moved = true
end

function flow_callback_override_stop_dialogue_system()
	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit
	local dialogue_extension = ScriptUnit.extension(player_unit, "dialogue_system")
	dialogue_extension.local_player_has_moved = false
end

function flow_callback_override_start_delay()
	DialogueSettings.dialogue_level_start_delay = 0
end

function flow_callback_damage_unit(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local damage = params.damage

	if unit_alive(unit) then
		fassert(ScriptUnit.has_extension(unit, "health_system"), "Tried to damage unit %s from flow but the unit has no health extension", unit)

		local hit_zone_name = "full"
		local hit_position = Unit.world_position(unit, 0)
		local attack_direction = Vector3.up()
		local health_extension = ScriptUnit.extension(unit, "health_system")

		health_extension:add_damage(unit, damage, hit_zone_name, "destructible_level_object_hit", hit_position, attack_direction, "wounded_degen")
	end
end

function flow_callback_set_material_property_scalar_all(params)
	local unit = params.unit
	local variable = params.variable
	local value = params.value
	local index_offset = Script.index_offset()
	local end_offset = 1 - index_offset
	local num_meshes = Unit.num_meshes(unit)

	for i = index_offset, num_meshes - end_offset do
		local mesh = Unit.mesh(unit, i)
		local num_materials = Mesh.num_materials(mesh)

		for j = index_offset, num_materials - end_offset do
			local material = Mesh.material(mesh, j)

			Material.set_scalar(material, variable, value)
		end
	end
end

function flow_callback_material_scalar_set_chr_inventory(params)
	fassert(params.unit, "[flow_callback_material_scalar_set_chr_inventory] You need to specify the Unit")
	fassert(params.variable, "[flow_callback_material_scalar_set_chr_inventory] You need to specify variable value")
	fassert(params.value, "[flow_callback_material_scalar_set_chr_inventory] You need to specify variable name")

	local unit = params.unit
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		for i = 1, #unit_inventory_extension.inventory_item_units do
			params.unit = unit_inventory_extension.inventory_item_units[i]

			flow_callback_set_material_property_scalar_all(params)
		end
	end
end

function do_material_dissolve(material, timer_var, timer_data, start_state_var, start_state)
	Material.set_scalar(material, start_state_var, start_state)
	Material.set_vector2(material, timer_var, timer_data)
end

function flow_callback_material_dissolve(params)
	fassert(params.unit, "[flow_callback_material_dissolve] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_dissolve] You need to specify duration")

	local timer_var = params.timer_var_name or "dissolve_timer"
	local start_time = World.time(Application.main_world())
	local timer_data = Vector2(start_time, start_time + params.duration)
	local start_state_var = params.dissolve_start_state_var_name or "dissolve_start_value"
	local start_state = math.floor(0.5 + params.dissolve_start_state or 1)
	local unit = params.unit
	local mesh = nil
	local mesh_name = params.mesh_name

	if mesh_name then
		fassert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_material_dissolve] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material = nil
	local material_name = params.material_name

	if mesh and material_name then
		fassert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_material_dissolve] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		do_material_dissolve(material, timer_var, timer_data, start_state_var, start_state)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			do_material_dissolve(Mesh.material(mesh, i), timer_var, timer_data, start_state_var, start_state)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)

			if Mesh.has_material(unit_mesh, material_name) then
				do_material_dissolve(Mesh.material(unit_mesh, material_name), timer_var, timer_data, start_state_var, start_state)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)
			local num_materials = Mesh.num_materials(unit_mesh)

			for j = 0, num_materials - 1 do
				do_material_dissolve(Mesh.material(unit_mesh, j), timer_var, timer_data, start_state_var, start_state)
			end
		end
	end
end

function flow_callback_material_dissolve_chr(params)
	fassert(params.unit, "[flow_callback_material_dissolve_chr] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_dissolve_chr] You need to specify duration")
	flow_callback_material_dissolve(params)

	local unit = params.unit
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		for i = 1, #unit_inventory_extension.stump_items do
			params.unit = unit_inventory_extension.stump_items[i]

			flow_callback_material_dissolve(params)
		end

		for i = 1, #unit_inventory_extension.inventory_item_outfit_units do
			params.unit = unit_inventory_extension.inventory_item_outfit_units[i]

			flow_callback_material_dissolve(params)
		end

		for i = 1, #unit_inventory_extension.inventory_item_helmet_units do
			params.unit = unit_inventory_extension.inventory_item_helmet_units[i]

			flow_callback_material_dissolve(params)
		end
	end
end

function flow_callback_material_dissolve_chr_inventory(params)
	fassert(params.unit, "[flow_callback_material_dissolve_chr_inventory] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_dissolve_chr_inventory] You need to specify duration")
	fassert(params.inventory_type, "[flow_callback_material_dissolve_chr_inventory] You need to specify inventory type")

	local unit = params.unit
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		if params.inventory_type == "outfit" then
			for i = 1, #unit_inventory_extension.inventory_item_outfit_units do
				params.unit = unit_inventory_extension.inventory_item_outfit_units[i]

				flow_callback_material_dissolve(params)
			end
		elseif params.inventory_type == "stump" then
			for i = 1, #unit_inventory_extension.stump_items do
				params.unit = unit_inventory_extension.stump_items[i]

				flow_callback_material_dissolve(params)
			end
		elseif params.inventory_type == "helmet" then
			for i = 1, #unit_inventory_extension.inventory_item_helmet_units do
				params.unit = unit_inventory_extension.inventory_item_helmet_units[i]

				flow_callback_material_dissolve(params)
			end
		elseif params.inventory_type == "weapon" then
			for i = 1, #unit_inventory_extension.inventory_item_weapon_units do
				params.unit = unit_inventory_extension.inventory_item_weapon_units[i]

				flow_callback_material_dissolve(params)
			end
		end
	end
end

function do_material_fade(material, timer_var, timer_data, fade_range_var, fade_interval)
	Material.set_vector2(material, fade_range_var, fade_interval)
	Material.set_vector2(material, timer_var, timer_data)
end

function flow_callback_material_fade(params)
	fassert(params.unit, "[flow_callback_material_fade] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_fade] You need to specify duration")

	local timer_var = params.timer_var_name or "fade_timer"
	local start_time = World.time(Application.main_world())
	local timer_data = Vector2(start_time, start_time + params.duration)
	local fade_range_var = params.fade_range_var_name or "fade_interval"
	local fade_interval = Vector2(params.fade_range_from or 1, params.fade_range_to or 0)
	local unit = params.unit
	local mesh = nil
	local mesh_name = params.mesh_name

	if mesh_name then
		fassert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_material_fade] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material = nil
	local material_name = params.material_name

	if mesh and material_name then
		fassert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_material_fade] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		do_material_fade(material, timer_var, timer_data, fade_range_var, fade_interval)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			do_material_fade(Mesh.material(mesh, i), timer_var, timer_data, fade_range_var, fade_interval)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)

			if Mesh.has_material(unit_mesh, material_name) then
				do_material_fade(Mesh.material(unit_mesh, material_name), timer_var, timer_data, fade_range_var, fade_interval)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)
			local num_materials = Mesh.num_materials(unit_mesh)

			for j = 0, num_materials - 1 do
				do_material_fade(Mesh.material(unit_mesh, j), timer_var, timer_data, fade_range_var, fade_interval)
			end
		end
	end
end

function flow_callback_material_fade_chr(params)
	fassert(params.unit, "[flow_callback_material_fade_chr] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_fade_chr] You need to specify duration")
	flow_callback_material_fade(params)

	local unit = params.unit
	params.mesh_name = nil
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		for i = 1, #unit_inventory_extension.stump_items do
			params.unit = unit_inventory_extension.stump_items[i]

			flow_callback_material_fade(params)
		end

		for i = 1, #unit_inventory_extension.inventory_item_outfit_units do
			params.unit = unit_inventory_extension.inventory_item_outfit_units[i]

			flow_callback_material_fade(params)
		end

		for i = 1, #unit_inventory_extension.inventory_item_helmet_units do
			params.unit = unit_inventory_extension.inventory_item_helmet_units[i]

			flow_callback_material_fade(params)
		end
	end
end

function flow_callback_material_fade_chr_inventory(params)
	fassert(params.unit, "[flow_callback_material_fade_chr_inventory] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_material_fade_chr_inventory] You need to specify duration")
	fassert(params.inventory_type, "[flow_callback_material_fade_chr_inventory] You need to specify inventory type")

	local unit = params.unit
	params.mesh_name = nil
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		if params.inventory_type == "outfit" then
			for i = 1, #unit_inventory_extension.inventory_item_outfit_units do
				params.unit = unit_inventory_extension.inventory_item_outfit_units[i]

				flow_callback_material_fade(params)
			end
		elseif params.inventory_type == "weapon" then
			for i = 1, #unit_inventory_extension.inventory_item_weapon_units do
				params.unit = unit_inventory_extension.inventory_item_weapon_units[i]

				flow_callback_material_fade(params)
			end
		elseif params.inventory_type == "stump" then
			for i = 1, #unit_inventory_extension.stump_items do
				params.unit = unit_inventory_extension.stump_items[i]

				flow_callback_material_fade(params)
			end
		elseif params.inventory_type == "helmet" then
			for i = 1, #unit_inventory_extension.inventory_item_helmet_units do
				params.unit = unit_inventory_extension.inventory_item_helmet_units[i]

				flow_callback_material_fade(params)
			end
		end
	end
end

function flow_callback_visibility_chr_inventory(params)
	fassert(params.unit, "[flow_callback_visibility_chr_inventory] You need to specify the Unit")

	local unit = params.unit
	local visibility = params.visibility
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		for i = 1, #unit_inventory_extension.inventory_item_outfit_units do
			unit = unit_inventory_extension.inventory_item_outfit_units[i]

			Unit.set_unit_visibility(unit, visibility)
			print("Hide " .. Unit.debug_name(unit))
		end

		for i = 1, #unit_inventory_extension.inventory_item_weapon_units do
			unit = unit_inventory_extension.inventory_item_weapon_units[i]

			Unit.set_unit_visibility(unit, visibility)
			print("Hide " .. Unit.debug_name(unit))
		end

		for i = 1, #unit_inventory_extension.stump_items do
			unit = unit_inventory_extension.stump_items[i]

			Unit.set_unit_visibility(unit, visibility)
			print("Hide " .. Unit.debug_name(unit))
		end

		for i = 1, #unit_inventory_extension.inventory_item_helmet_units do
			unit = unit_inventory_extension.inventory_item_helmet_units[i]

			Unit.set_unit_visibility(unit, visibility)
			print("Hide " .. Unit.debug_name(unit))
		end
	end
end

function start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, start_end_time, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
	if start_fade_name and start_fade_value then
		Material.set_scalar(material, start_fade_name, start_fade_value)
	end

	if end_fade_name and end_fade_value then
		Material.set_scalar(material, end_fade_name, end_fade_value)
	end

	Material.set_scalar(material, fade_switch_name, fade_switch)
	Material.set_vector2(material, start_end_time_name, start_end_time)
end

function flow_callback_start_fade(params)
	fassert(params.unit, "[flow_callback_start_fade] You need to specify the Unit")
	fassert(params.duration, "[flow_callback_start_fade] You need to specify duration")
	fassert(params.fade_switch, "[flow_callback_start_fade] You need to specify whether to fade in or out (0 or 1)")

	local start_time = World.time(Application.main_world())
	local fade_duration = Vector2(start_time, start_time + params.duration)
	local fade_switch = math.floor(params.fade_switch + 0.5)
	local fade_switch_name = params.fade_switch_name or "fade_switch"
	local start_end_time_name = params.start_end_time_name or "start_end_time"
	local unit = params.unit
	local mesh = nil
	local mesh_name = params.mesh_name
	local start_fade_name = params.start_fade_value_name or nil
	local start_fade_value = params.start_fade_value or nil
	local end_fade_name = params.end_fade_value_name or nil
	local end_fade_value = params.end_fade_value or nil

	if mesh_name then
		fassert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_start_fade] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material = nil
	local material_name = params.material_name

	if mesh and material_name then
		fassert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_start_fade] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			local mesh_material = Mesh.material(mesh, i)

			start_material_fade(mesh_material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)

			if Mesh.has_material(unit_mesh, material_name) then
				local mesh_material = Mesh.material(unit_mesh, material_name)

				start_material_fade(mesh_material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i)
			local num_materials = Mesh.num_materials(unit_mesh)

			for j = 0, num_materials - 1 do
				local mesh_material = Mesh.material(unit_mesh, j)

				start_material_fade(mesh_material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
			end
		end
	end
end

function flow_callback_force_death_end(params)
	if Managers.state.network.is_server and ScriptUnit.has_extension(params.unit, "death_system") then
		ScriptUnit.extension(params.unit, "death_system"):force_end()
	end
end

function flow_callback_chr_editor_inventory_spawn(params)
	return {
		spawn = true
	}
end

function flow_callback_chr_editor_inventory_unspawn(params)
	return {
		unspawn = true
	}
end

function flow_callback_chr_editor_inventory_drop(params)
	return {
		dropped = true
	}
end

function flow_callback_chr_enemy_inventory_send_event(params)
	fassert(params.unit, "[flow_callback_chr_enemy_inventory_send_event] You need to specify the Unit")
	fassert(params.event, "[flow_callback_chr_enemy_inventory_send_event] You need to specify an event name")

	local unit = params.unit
	local event = params.event
	local unit_inventory_extension = ScriptUnit.has_extension(unit, "ai_inventory_system")

	if unit_inventory_extension ~= nil then
		for i = 1, #unit_inventory_extension.stump_items do
			Unit.flow_event(unit_inventory_extension.stump_items[i], event)
		end

		for i = 1, #unit_inventory_extension.inventory_item_units do
			Unit.flow_event(unit_inventory_extension.inventory_item_units[i], event)
		end
	end
end

function flow_callback_unit_spawner_mark_for_deletion(params)
	if not unit_alive(params.unit) then
		return
	end

	fassert(Managers.state.network.is_server or not NetworkUnit.is_network_unit(params.unit), "'flow_callback_unit_spawner_mark_for_deletion' can only delete units spawned locally on client")

	local unit_spawner = Managers.state.unit_spawner

	unit_spawner:mark_for_deletion(params.unit)
end

function flow_callback_breakable_object_destroyed(params)
	local unit = params.unit

	if unit_alive(unit) then
		local is_destroyed = Unit.get_data(unit, "destroyed_dynamic")

		if is_destroyed then
			return
		end

		local statistics_db = Managers.player:statistics_db()
		local player = Managers.player:local_player()

		if not player then
			return
		end

		local stats_id = player:stats_id()

		statistics_db:increment_stat(stats_id, "dynamic_objects_destroyed")
		Unit.set_data(unit, "destroyed_dynamic", true)
	end
end

function flow_callback_send_local_system_message(params)
	local message = params.message
	local pop_chat = true

	Managers.chat:add_local_system_message(1, message, pop_chat)
end

function flow_callback_localize_string(params)
	flow_return_table.value = Localize(params.string)

	return flow_return_table
end

function flow_callback_increment_player_stat(params)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local statistics_db = Managers.player:statistics_db()
	local stats_id = player:stats_id()
	local stat_name = params.stat_name

	statistics_db:increment_stat(stats_id, stat_name)
end

function flow_callback_increment_all_players_stats(params)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local statistics_db = Managers.player:statistics_db()
	local stats_id = player:stats_id()
	local stat_name = params.stat_name
	local stat_name_index = NetworkLookup.statistics[stat_name]

	statistics_db:increment_stat(stats_id, stat_name)
	Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", stat_name_index)
end

function flow_callback_set_player_stat(params)
	local player = Managers.player:local_player()

	if not player then
		return
	end

	local statistics_db = Managers.player:statistics_db()
	local stats_id = player:stats_id()
	local stat_name = params.stat_name
	local value = params.stat_value

	statistics_db:set_stat(stats_id, stat_name, value)
end

function flow_callback_add_subtitle(params)
	local speaker = params.speaker
	local subtitle = params.subtitle
	local hud_system = Managers.state.entity:system("hud_system")

	hud_system:add_subtitle(speaker, subtitle)
end

function flow_callback_remove_subtitle(params)
	local speaker = params.speaker
	local hud_system = Managers.state.entity:system("hud_system")

	hud_system:remove_subtitle(speaker)
end

function flow_callback_fade_in_game_logo(params)
	local fade_time = params.time
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	if cutscene_system then
		cutscene_system:fade_game_logo(true, fade_time)
	end
end

function flow_callback_fade_out_game_logo(params)
	local fade_time = params.time
	local cutscene_system = Managers.state.entity:system("cutscene_system")

	if cutscene_system then
		cutscene_system:fade_game_logo(false, fade_time)
	end
end

function flow_callback_register_main_path_obstacle(params)
	local conflict = Managers.state.conflict

	if conflict then
		local unit = params.unit
		local node = params.unit_node
		local position = Unit.world_position(unit, Unit.node(unit, node))
		local _, box_extents = Unit.box(unit)
		local radius_sq = Vector3.distance_squared(Vector3(0, 0, 0), box_extents)

		conflict:register_main_path_obstacle(Vector3Box(position), radius_sq)
	end
end

function flow_callback_enter_post_game(params)
	local network_manager = Managers.state.network
	local network_server = network_manager.network_server

	if network_server then
		network_server:enter_post_game()
		print("flow_callback_enter_post_game")
	end
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
	fassert(params.name, "[flow_callback_survival_handler] You need to specify the name of the waves preset found in survival settings")
	fassert(SurvivalSettings[params.name], "Could not find the waves preset you specified, you sure it's the same as in survival settings?")

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

				for i = 1, #templates[name] do
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
				for i = 1, #templates[name] do
					memory_table[templates[name][i]] = nil
				end
			end
		end

		if event_found and (Managers.player.is_server or LEVEL_EDITOR_TEST) then
			TerrorEventMixer.start_random_event(event_chunk)
		end
	end

	local return_wave = current_wave
	local total_waves = #SurvivalSettings[params.name].waves

	if current_wave >= #SurvivalSettings[params.name].waves then
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
	Managers.state.difficulty:set_difficulty(params.difficulty, 0)
end

function flow_callback_show_difficulty(params)
	fassert(params.difficulty, "No difficulty set")

	local local_player = Managers.player:local_player()
	local player_unit = local_player.player_unit

	if unit_alive(player_unit) then
		local hud_extension = ScriptUnit.extension(player_unit, "hud_system")

		hud_extension:set_current_location(Localize("dlc1_2_survival_difficulty_increase") .. " " .. Localize("difficulty_" .. params.difficulty))
	end
end

function flow_callback_get_difficulty(params)
	local difficulty_easy, difficulty_normal, difficulty_hard, difficulty_cataclysm, difficulty_harder, difficulty_hardest, difficulty_cataclysm_2, difficulty_cataclysm_3 = nil
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

	if getdifficulty == "cataclysm" then
		difficulty_cataclysm = true
	end

	if getdifficulty == "harder" then
		difficulty_harder = true
	end

	if getdifficulty == "cataclysm_2" then
		difficulty_cataclysm_2 = true
	end

	if getdifficulty == "hardest" then
		difficulty_hardest = true
	end

	if getdifficulty == "cataclysm_3" then
		difficulty_cataclysm_3 = true
	end

	flow_return_table.easy = difficulty_easy
	flow_return_table.normal = difficulty_normal
	flow_return_table.hard = difficulty_hard
	flow_return_table.cataclysm = difficulty_cataclysm
	flow_return_table.harder = difficulty_harder
	flow_return_table.cataclysm_2 = difficulty_cataclysm_2
	flow_return_table.hardest = difficulty_hardest
	flow_return_table.cataclysm_3 = difficulty_cataclysm_3
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

		game_mode_manager:activate_end_level_area(unit, object, from, to)
	end
end

function flow_callback_debug_end_level_area(params)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager.is_server then
		local unit = params.unit
		local object = params.object
		local from = -params.left_back_down_extents
		local to = params.right_forward_up_extents

		game_mode_manager:debug_end_level_area(unit, object, from, to)
	end
end

function flow_callback_disable_end_level_area(params)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager.is_server then
		game_mode_manager:disable_end_level_area(params.unit)
	end
end

function flow_callback_disable_lose_condition()
	Managers.state.game_mode:disable_lose_condition()
end

local RESULT_TABLE = {}

function flow_callback_broadphase_deal_damage(params)
	fassert(Managers.state.network.is_server, "Only deal damage on server.")

	local hit_zone_name = "torso"
	local hit_ragdoll_actor = nil
	local pos = params.position
	local radius = params.radius
	local attacker_unit = params.attacker_unit
	local hazard_type = params.hazard_type
	local attack_direction = nil

	if unit_alive(attacker_unit) then
		local rot = Unit.world_rotation(attacker_unit, 0)
		local params_dir = params.direction
		attack_direction = Quaternion.right(rot) * params_dir.x + Quaternion.forward(rot) * params_dir.y + Quaternion.up(rot) * params_dir.z
	else
		attack_direction = params.direction
	end

	local hazard_settings = EnvironmentalHazards[hazard_type]

	if params.hits_enemies then
		local t = Managers.time:time("game")
		local damage_source = hazard_type
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local power_level = hazard_settings.enemy.difficulty_power_level[difficulty_rank] or DefaultPowerLevel
		local damage_profile_name = hazard_settings.enemy.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = nil
		local boost_curve_multiplier = 0
		local is_critical_strike = false
		local can_damage = hazard_settings.enemy.can_damage
		local can_stagger = hazard_settings.enemy.can_stagger
		local blocking = false
		local shield_breaking_hit = false
		local num_hits = AiUtils.broadphase_query(pos, radius, RESULT_TABLE)

		for i = 1, num_hits do
			local hit_unit = RESULT_TABLE[i]

			DamageUtils.server_apply_hit(t, attacker_unit, hit_unit, hit_zone_name, nil, Vector3.normalize(attack_direction), hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit)
		end
	end

	local hits_human_players = params.hits_human_players
	local hits_bot_players = params.hits_bot_players

	if hits_human_players or hits_bot_players and hazard_settings.player then
		local settings = hazard_settings.player
		local action_data = settings.action_data
		local difficulty_manager = Managers.state.difficulty
		local difficulty = difficulty_manager:get_difficulty()
		local damage = settings.difficulty_damage[difficulty]

		for _, player in pairs(Managers.player:players()) do
			local player_controlled = player:is_player_controlled()
			local unit = player.player_unit

			if hits_bot_players and not player_controlled or hits_human_players and player_controlled and unit_alive(unit) and Vector3.distance(pos, POSITION_LOOKUP[unit]) < radius then
				AiUtils.damage_target(unit, attacker_unit, action_data, damage, hazard_type)
			end
		end
	end
end

function flow_callback_broadphase_deal_damage_debug(params)
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
end

function flow_callback_set_particles_light_intensity_exponent(params)
	local exp = params.exponent
	local id = params.id
	local world = Application.flow_callback_context_world()

	World.set_particles_light_intensity_exponent(world, id, exp)
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
end

function flow_callback_barrel_explode(params)
	local unit = params.unit
	local health_extension = ScriptUnit.extension(unit, "health_system")

	health_extension:set_max_health(1)
	health_extension:add_damage(unit, 1, "full", "grenade", Unit.world_position(unit, 0), Vector3(1, 0, 0))
end

function flow_callback_set_mutator_active(params)
	local mutator_name = params.mutator
	local active = params.active
	local mutator_handler = Managers.state.game_mode._mutator_handler

	if active then
		mutator_handler:initialize_mutators({
			mutator_name
		})
		mutator_handler:activate_mutator(mutator_name, nil, "activated_by_flow")
	else
		mutator_handler:deactivate_mutator(mutator_name)
	end
end

function flow_callback_set_deus_curse_active(params)
	if not Managers.player.is_server then
		return
	end

	local mechanism = Managers.mechanism:game_mechanism()
	local mutator_name = mechanism.get_current_node_curse and mechanism:get_current_node_curse()

	if not mutator_name then
		return
	end

	local active = params.active
	local mutator_handler = Managers.state.game_mode._mutator_handler
	local is_active = mutator_handler:has_activated_mutator(mutator_name)

	if active == is_active then
		return
	end

	if active then
		mutator_handler:initialize_mutators({
			mutator_name
		})
		mutator_handler:activate_mutator(mutator_name, nil, "activated_by_flow")
	else
		mutator_handler:deactivate_mutator(mutator_name)
	end
end

function flow_callback_set_game_mode_variable(params)
	local variable = params.variable
	local value = params.value
	local game_mode = Managers.state.game_mode:game_mode()
	game_mode[variable] = value
end

function flow_callback_print_callstack(params)
	return
end

function flow_callback_activate_payload(params)
	local unit = params.payload_unit
	local extension = ScriptUnit.extension(unit, "payload_system")

	extension:activate()
end

function flow_callback_deactivate_payload(params)
	local unit = params.payload_unit
	local extension = ScriptUnit.extension(unit, "payload_system")
	local stop = params.force_stop

	extension:deactivate(stop)
end

function flow_callback_activate_end_zone(params)
	local unit = params.unit
	local activate = params.activate
	local props_ext = ScriptUnit.extension(unit, "end_zone_system")

	props_ext:activation_allowed(activate)
end

function flow_callback_tutorial_restrict_camera_rotation(params)
	local angle = params.angle
	local restrict = params.restrict
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	fassert(local_player, "[flow_callback_restrict_camera_rotation] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(unit_alive(local_player_unit), "[flow_callback_restrict_camera_rotation] The local player unit hasn't spawned yet or has been removed")

	local first_person_ext = ScriptUnit.extension(local_player_unit, "first_person_system")

	if restrict then
		fassert(angle, "[flow_callback_restrict_camera_rotation] You need to specify an angle when turning on rotation restriction")
	end

	first_person_ext:tutorial_restrict_camera_rotation(restrict, angle)
end

function flow_callback_prioritize_objective_tooltips(params)
	local objective_tooltip_name = params.objective_tooltip_name
	local reset = params.reset

	fassert(objective_tooltip_name or reset, "[flow_callback_prioritize_objective_tooltips] You need to provide objective_tooltip_name and/or reset")
	Managers.state.entity:system("tutorial_system"):prioritize_objective_tooltip(objective_tooltip_name, reset)
end

local function split_string(text, sep)
	sep = sep or "\n"
	local lines = {}
	local pos = 1

	while true do
		local b, e = text:find(sep, pos)

		if not b then
			table.insert(lines, text:sub(pos))

			break
		end

		table.insert(lines, text:sub(pos, b - 1))

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

	for i = 1, #parentnodes - 1 do
		local parentnodeindex = Unit.node(parentunit, parentnodes[i])
		local childnode = childnodes[i]
		local childnodeindex = nil

		if string.find(childnode, "Index(.)") then
			childnodeindex = tonumber(string.match(childnode, "%d+") + index_offset)
		else
			childnodeindex = Unit.node(childunit, childnode)
		end

		World.link_unit(world, childunit, childnodeindex, parentunit, parentnodeindex)

		if params.parent_lod_object and params.child_lod_object and Unit.has_lod_object(parentunit, params.parent_lod_object) and Unit.has_lod_object(childunit, params.child_lod_object) then
			local parent_lod_object = Unit.lod_object(parentunit, params.parent_lod_object)
			local child_lod_object = Unit.lod_object(childunit, params.child_lod_object)

			LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
			World.link_unit(world, childunit, LODObject.node(child_lod_object), parentunit, LODObject.node(parent_lod_object))
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

function flow_callback_attach_unit(params)
	local node_link_table = AttachmentNodeLinking
	local node_linking_template = split_string(params.node_link_template, "/")

	if not node_linking_template then
		print("No attachment node linking defined in flow!")

		return
	end

	for _, key in ipairs(node_linking_template) do
		node_link_table = node_link_table[key]
	end

	if type(node_link_table) ~= "table" then
		print("No attachment node linking with name %s", tostring(params.node_link_template))

		return
	end

	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local index_offset = Script.index_offset()
	local world = Unit.world(parentunit)

	for _, link_data in ipairs(node_link_table) do
		local parent_node = link_data.source
		local child_node = link_data.target
		local parent_node_index = type(parent_node) == "string" and Unit.node(parentunit, parent_node) or parent_node + index_offset
		local child_node_index = type(child_node) == "string" and Unit.node(childunit, child_node) or child_node + index_offset

		World.link_unit(world, childunit, child_node_index, parentunit, parent_node_index)
	end

	if params.link_lod_groups and Unit.num_lod_objects(parentunit) ~= 0 and Unit.num_lod_objects(childunit) ~= 0 then
		local parent_lod_object = Unit.lod_object(parentunit, index_offset)
		local child_lod_object = Unit.lod_object(childunit, index_offset)

		LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
		World.link_unit(world, childunit, LODObject.node(child_lod_object), parentunit, LODObject.node(parent_lod_object))
	end

	if params.store_in_parent then
		local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}

		table.insert(unit_attachments, childunit)
		Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)
	end

	return {
		linked = true
	}
end

function flow_callback_unattach_unit(params)
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

function flow_callback_attach_player_item(params)
	return
end

function flow_callback_remove_player_items(params)
	return
end

function flow_callback_trigger_event_on_attachments(params)
	local unit_attachments = Unit.get_data(params.unit, "flow_unit_attachments") or {}

	for i = 1, #unit_attachments do
		Unit.flow_event(unit_attachments[i], params.event)
	end

	return {
		triggered = true
	}
end

function flow_callback_is_character_alive(params)
	local unit = params.unit

	if HEALTH_ALIVE[unit] then
		flow_return_table.out_value = true

		return flow_return_table
	end

	flow_return_table.out_value = false

	return flow_return_table
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
		ferror("Trying to enforce players position with unknown state %s", tostring(force))
	end

	local world = Application.flow_callback_context_world()
	local level = LevelHelper:current_level(world)
	local player_manager = Managers.player
	local health_system = Managers.state.entity:system("health_system")
	local valid_position = nil
	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local player_units = hero_side.PLAYER_UNITS
	local player_positions = hero_side.PLAYER_POSITIONS

	for i, unit in pairs(player_units) do
		local pos = player_positions[i]
		local pos_ok = Level.is_point_inside_volume(level, volume_name, pos) == inside

		if pos_ok then
			valid_position = pos
		else
			local status_ext = ScriptUnit.extension(unit, "status_system")

			if status_ext:is_disabled() and not status_ext:is_ready_for_assisted_respawn() and not status_ext:is_dead() then
				health_system:suicide(unit)
			end
		end
	end

	local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS
	local PLAYER_AND_BOT_POSITIONS = hero_side.PLAYER_AND_BOT_POSITIONS

	for i, unit in pairs(PLAYER_AND_BOT_UNITS) do
		local owner = player_manager:owner(unit)

		if owner and not owner:is_player_controlled() then
			local pos = PLAYER_AND_BOT_POSITIONS[i]
			local pos_ok = Level.is_point_inside_volume(level, volume_name, pos) == inside

			if not pos_ok then
				local status_ext = ScriptUnit.extension(unit, "status_system")
				local disabled = status_ext:is_disabled()
				local in_respawn = status_ext:is_ready_for_assisted_respawn()
				local dead = status_ext:is_dead()

				if disabled and not in_respawn and not dead then
					health_system:suicide(unit)
				elseif not in_respawn and not dead and valid_position then
					local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
					local current_rotation = locomotion_extension:current_rotation()

					locomotion_extension:teleport_to(valid_position, current_rotation)
				end
			end
		end
	end

	if valid_position then
		Managers.state.game_mode:teleport_despawned_players(valid_position)
	end
end

function flow_callback_tutorial_enable_equipment(params)
	local enable = params.enable
	local wield_anim = params.wield_anim
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	fassert(local_player, "[flow_callback_tutorial_enable_equipment] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(unit_alive(local_player_unit), "[flow_callback_tutorial_enable_equipment ]gloThe local player unit hasn't spawned yet or has been removed")

	local first_person_ext = ScriptUnit.extension(local_player_unit, "first_person_system")

	first_person_ext:tutorial_show_first_person_units(enable)

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
			local first_person_unit = first_person_ext:get_first_person_unit()

			Unit.animation_event(first_person_unit, wield_anim)
		end

		local disallowed_input = player_input:disallowed_input_table()

		for action, _ in pairs(actions_to_allow) do
			disallowed_input[action] = nil
		end

		local game_mode = Managers.state.game_mode:game_mode()

		game_mode:disable_hud(false)
	else
		local disallowed_input = player_input:disallowed_input_table()

		table.merge(disallowed_input, actions_to_allow)
		player_input:set_disallowed_inputs(disallowed_input)

		local game_mode = Managers.state.game_mode:game_mode()

		game_mode:disable_hud(true)
	end
end

function flow_callbacks_add_tutorial_animation_hook(params)
	local animation_hook_name = params.animation_hook
	local animation_hook_free_text_name = params.animation_hook_free_text

	if animation_hook_free_text_name ~= "" then
		animation_hook_name = animation_hook_free_text_name or animation_hook_name
	end

	fassert(animation_hook_name and PauseEvents.animation_hook_templates[animation_hook_name], "[flow_callbacks] There is no animation hook called: %s", tostring(animation_hook_name))

	local animation_hook = table.clone(PauseEvents.animation_hook_templates[animation_hook_name])

	Managers.state.entity:system("play_go_tutorial_system"):add_animation_hook(animation_hook)
end

function flow_callbacks_trigger_pause_event(params)
	local pause_event_name = params.pause_event_name
	local look_position = params.look_position

	fassert(pause_event_name and PauseEvents.pause_events[pause_event_name], "[flow_callbacks] There is not pause events called: %s", tostring(pause_event_name))

	local pause_event = table.clone(PauseEvents.pause_events[pause_event_name])

	Managers.state.entity:system("play_go_tutorial_system"):trigger_pause_event(pause_event, look_position)
end

function flow_callbacks_add_tutorial_equipment(params)
	local slot_name = params.slot_name
	local item_name = params.item_name
	local starting_ammo = params.starting_ammo and math.floor(params.starting_ammo) or 0

	fassert(item_name and ItemMasterList[item_name], "[flow_callbacks_add_tutorial_equipment] There is no item called %s in ItemMasterList", tostring(item_name))

	local item_data = ItemMasterList[item_name]
	local player = Managers.player:local_player()
	local player_unit = player.player_unit
	local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")

	inventory_ext:add_equipment(slot_name, item_data, nil, nil, starting_ammo)

	if slot_name == "slot_melee" then
		inventory_ext:wield("slot_melee")
	else
		inventory_ext:wield("slot_ranged")
	end
end

local function enabled_inputs(player_input, inputs_table, enabled)
	if enabled then
		local disallowed_input = player_input:disallowed_input_table()

		for action, _ in pairs(inputs_table) do
			disallowed_input[action] = nil
		end

		player_input:set_disallowed_inputs(disallowed_input)
		player_input:set_allowed_inputs(inputs_table)
	else
		local disallowed_input = player_input:disallowed_input_table()

		table.merge(disallowed_input, inputs_table)
		player_input:set_disallowed_inputs(disallowed_input)
	end
end

function flow_callbacks_tutorial_inputs_enabled(params)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	fassert(local_player, "[flow_callbacks_tutorial_inputs_enabled] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(unit_alive(local_player_unit), "[flow_callbacks_tutorial_inputs_enabled] The local player unit hasn't spawned yet or has been removed")

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
end

function flow_callbacks_tutorial_enable_weapon_switching(params)
	local enable = params.enable
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	fassert(local_player, "[flow_callbacks_tutorial_enable_weapon_switching] The local player is not available")

	local local_player_unit = local_player.player_unit

	fassert(unit_alive(local_player_unit), "[flow_callbacks_tutorial_enable_weapon_switching] The local player unit hasn't spawned yet or has been removed")

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
		local disallowed_input = player_input:disallowed_input_table()

		for action, _ in pairs(switch_actions) do
			disallowed_input[action] = nil
		end
	else
		local disallowed_input = player_input:disallowed_input_table()

		table.merge(disallowed_input, switch_actions)
		player_input:set_disallowed_inputs(disallowed_input)
	end
end

function flow_callbacks_tutorial_enable_career_skill(params)
	local enable = params.enable
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local unit = local_player.player_unit
	local career_extension = ScriptUnit.extension(unit, "career_system")

	if not enable then
		career_extension:start_activated_ability_cooldown(1, 0)
		career_extension:set_activated_ability_cooldown_paused(1)
	else
		career_extension:set_activated_ability_cooldown_unpaused(1)
		career_extension:reduce_activated_ability_cooldown_percent(1, 1)
	end
end

function flow_callback_enable_bot_loot(params)
	local enable = params.enable
	local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

	if play_go_tutorial_system then
		play_go_tutorial_system:enable_bot_loot(enable)
	end
end

function flow_callback_enable_bot_portrait(params)
	local bot_display_name = params.bot_display_name
	local play_go_tutorial_system = Managers.state.entity:system("play_go_tutorial_system")

	play_go_tutorial_system:set_bot_portrait_enabled(bot_display_name)
end

function flow_callback_set_player_invincibility(params)
	if not Managers.player.is_server then
		return
	end

	local player_unit = params.player_unit
	local is_invincible = params.invincible

	if unit_alive(player_unit) then
		local health_extension = ScriptUnit.has_extension(player_unit, "health_system")

		fassert(health_extension, "Tried to set invincibility on unit %s from flow but the unit has no health extension", player_unit)

		health_extension.is_invincible = is_invincible
	end
end

function flow_callback_set_player_in_hanging_cage(params)
	local idle_animation = params.idle_animation
	local falling_animation = params.falling_animation
	local landing_animation = params.landing_animation
	local player_unit = params.player_unit
	local cage_unit = params.cage_unit
	local state = params.state

	if unit_alive(player_unit) then
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

		status_extension:set_in_hanging_cage(true, cage_unit, state, animations)
	end
end

function flow_callback_set_player_fall_height(params)
	local unit = params.unit
	local status_ext = ScriptUnit.has_extension(unit, "status_system")

	if status_ext then
		local is_husk = status_ext.is_husk

		if is_husk then
			if BUILD == "release" then
				Crashify.print_exception("flow_callbacks", "Trying to set falling height on unit not owned")
			else
				ferror("Trying to set falling height on unit not owned")
			end
		else
			status_ext:set_falling_height(true)
		end
	end
end

function flow_callback_set_local_player_gravity_scale(params)
	local gravity_scale = params.gravity_scale or 1
	local player_manager = Managers.player
	local players = player_manager:human_and_bot_players()

	for _, player in pairs(players) do
		if player.local_player or player.bot_player and player.is_server then
			local unit = player.player_unit
			local locomotion_extension = ScriptUnit.has_extension(unit, "locomotion_system")

			if locomotion_extension and locomotion_extension.set_script_driven_gravity_scale then
				locomotion_extension:set_script_driven_gravity_scale(gravity_scale)
			end
		end
	end
end

function flow_callback_enable_generic_unit_aim_extension(params)
	local unit = params.unit
	local enable = params.enable
	local aim_extension = ScriptUnit.has_extension(unit, "aim_system")

	if aim_extension then
		aim_extension:set_enabled(enable)
	end
end

function flow_callbacks_players_not_in_end_zone()
	flow_return_table.witch_hunter = false
	flow_return_table.bright_wizard = false
	flow_return_table.dwarf_ranger = false
	flow_return_table.wood_elf = false
	flow_return_table.empire_soldier = false
	flow_return_table.empire_soldier_tutorial = false
	local num_players_outside = 0
	local player_manager = Managers.player
	local players = player_manager:human_and_bot_players()

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local is_in_end_zone = status_extension:is_in_end_zone()
			local display_name = player:profile_display_name()

			if not is_in_end_zone and display_name then
				num_players_outside = num_players_outside + 1
				flow_return_table[display_name] = true
			end
		end
	end

	flow_return_table.outside_count = num_players_outside

	return flow_return_table
end

function flow_callback_store_parent(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit

	Unit.set_data(childunit, "parent_ref", parentunit)
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
	local unit = params.unit

	if not unit_alive(unit) then
		Crashify.print_exception("Deleted Unit", "referenced in flow")

		return
	end

	if params.enabled then
		Unit.set_unit_visibility(unit, true)
		Unit.enable_physics(unit)
		Unit.enable_animation_state_machine(unit)
	else
		Unit.set_unit_visibility(unit, false)

		local projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

		if projectile_linker_system ~= nil then
			projectile_linker_system:clear_linked_projectiles(unit)
		end

		Unit.disable_physics(unit)

		if Unit.has_animation_state_machine(unit) then
			Unit.disable_animation_state_machine(unit)
		end
	end
end

function flow_callback_register_looping_event_timer(params)
	Managers.state.game_mode:register_looping_event_timer(params.unique_id, params.time, params.level_event_name)
end

function flow_callback_unregister_looping_event_timer(params)
	Managers.state.game_mode:unregister_looping_event_timer(params.unique_id)
end

function flow_callback_rpc_clients_level_event(params)
	local game_mode = Managers.state.game_mode

	if game_mode then
		local network_manager = Managers.state.network

		network_manager.network_transmit:send_rpc_clients("rpc_trigger_level_event", params.level_event_name)
	end
end

function flow_callback_set_unit_physics(params)
	if params.physics then
		Unit.enable_physics(params.unit)
	else
		Unit.disable_physics(params.unit)
	end
end

function flow_callback_specific_pickup_gizmo_spawned(params)
	local entity_manager = Managers.state.entity
	local pickup_system = entity_manager:system("pickup_system")

	if pickup_system then
		pickup_system:specific_pickup_gizmo_spawned(params.unit)
	end
end

function flow_callback_set_unit_faded_status(params)
	local unit = params.unit
	local faded = params.faded
	local status_extension = ScriptUnit.extension(unit, "status_system")

	if status_extension then
		status_extension:set_invisible(faded, nil, "flow_faded")
	end
end

function flow_callback_get_level_seed(params)
	return {
		seed = Managers.mechanism:get_level_seed()
	}
end

function flow_callback_predict_hitscan(params)
	local player_unit = params.player_unit
	local range = params.range or 10
	local spread = params.spread or 0
	local returns = {
		success = false
	}
	local world = Managers.world and Managers.world:has_world(LevelHelper.INGAME_WORLD_NAME) and Managers.world:world(LevelHelper.INGAME_WORLD_NAME)

	if not world then
		return returns
	end

	local physics_world = World.get_data(world, "physics_world")

	if not physics_world then
		return returns
	end

	local network_manager = Managers.state.network
	local game = network_manager:game()
	local unit_id = network_manager:unit_game_object_id(player_unit)

	if game and unit_id then
		local aim_direction = GameSession.game_object_field(game, unit_id, "aim_direction")
		local aim_position = GameSession.game_object_field(game, unit_id, "aim_position")
		local random_yaw = math.random() * math.rad(spread)
		local random_pitch = math.random() * math.rad(spread)
		aim_direction = Quaternion.rotate(Quaternion(Vector3.up(), random_yaw), aim_direction)
		aim_direction = Quaternion.rotate(Quaternion(Vector3.right(), random_pitch), aim_direction)
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, aim_position, aim_direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
		local INDEX_POSITION = 1
		local INDEX_DISTANCE = 2
		local end_position = result and result[1][INDEX_POSITION] or aim_position + aim_direction * range
		returns.end_position = end_position
		returns.success = true
		returns.distance = result and result[1][INDEX_DISTANCE] or range
	end

	return returns
end

function flow_callback_spawn_defenders_ward(params)
	Managers.state.event:trigger("spawn_defenders", params.num_defenders)
end

function flow_callback_cog_collision(params)
	local trigger_actor = params.touching_actor
	local actor_velocity = Actor.velocity(trigger_actor)

	if not trigger_actor then
		return
	end

	if Vector3.length(actor_velocity) <= 0.1 then
		return
	end

	local touching_unit = params.touching_unit
	local cog_unit = params.unit
	local pickup_unit_ext = ScriptUnit.extension(cog_unit, "pickup_system")
	local owner_peer_id = pickup_unit_ext.owner_peer_id
	local network_peer_id = Network.peer_id()

	if owner_peer_id == Network.peer_id() then
		Managers.state.achievement:trigger_event("on_trail_cog_strike", touching_unit)
	end

	if Managers.state.network.is_server then
		local hit_unit = touching_unit
		local cog_position = POSITION_LOOKUP[cog_unit]
		local cog_flat_position = Vector3.flat(cog_position)
		local hit_unit_position = POSITION_LOOKUP[hit_unit]
		local hit_unit_position_flat = Vector3.flat(hit_unit_position)
		local hit_zone_name = "torso"
		local hazard_type = "trail_cog"
		local hazard_settings = EnvironmentalHazards[hazard_type]
		local damage_source = hazard_type
		local hit_ragdoll_actor = nil
		local push_direction = Vector3.normalize(hit_unit_position_flat - cog_flat_position)
		local damage_profile_name = hazard_settings.enemy.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = nil
		local boost_curve_multiplier = 0
		local is_critical_strike = false
		local can_damage = true
		local can_stagger = true
		local blocking = false
		local shield_breaking_hit = false
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local power_level = hazard_settings.enemy.difficulty_power_level[difficulty_rank] or DefaultPowerLevel
		local t = Managers.time:time("game")

		DamageUtils.server_apply_hit(t, cog_unit, hit_unit, hit_zone_name, nil, push_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit)
	end
end

function flow_callback_reset_cog_collision_stat()
	local is_server = Managers.state.network.is_server

	Managers.state.achievement:trigger_event("on_trail_cog_reset_stat")
end

function flow_callback_environment_hazard_damage_collision(params)
	if Managers.state.network.is_server then
		local hit_unit = params.touching_unit
		local hazard_unit = params.unit
		local hazard_type = params.hazard_type
		local hazard_position = POSITION_LOOKUP[hazard_unit] or Unit.world_position(hazard_unit, 0)
		local hazard_flat_position = Vector3.flat(hazard_position)
		local hit_unit_position = POSITION_LOOKUP[hit_unit]
		local hit_unit_position_flat = Vector3.flat(hit_unit_position)
		local hit_zone_name = "full"
		local hazard_settings = EnvironmentalHazards[hazard_type]
		local damage_source = hazard_type
		local hit_ragdoll_actor = true
		local push_direction = Vector3.normalize(hit_unit_position_flat - hazard_flat_position)
		local damage_profile_name = hazard_settings.enemy.damage_profile or "default"
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = nil
		local boost_curve_multiplier = 0
		local is_critical_strike = false
		local can_damage = true
		local can_stagger = true
		local blocking = false
		local shield_breaking_hit = params.shield_breaking_hit or true
		local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
		local power_level = hazard_settings.enemy.difficulty_power_level[difficulty_rank] or DefaultPowerLevel
		local t = Managers.time:time("game")
		local health_extension = ScriptUnit.extension(hit_unit, "health_system")
		local damage = hazard_settings.enemy.difficulty_damage[difficulty_rank]

		health_extension:add_damage(hit_unit, damage, hit_zone_name, "cutting", hit_unit_position, push_direction, "wounded_degen")

		if health_extension:is_dead() then
			local gibbs = {
				"dismember_torso",
				"dismember_head",
				"explode_body"
			}
			local gibb = gibbs[math.random(1, 3)]

			Unit.flow_event(hit_unit, gibb)
		else
			DamageUtils.stagger_ai(t, damage_profile, target_index, power_level, hit_unit, hazard_unit, hit_zone_name, push_direction, boost_curve_multiplier, is_critical_strike, blocking, damage_source)
		end
	end
end

function flow_callback_hazard_push_damage_player_and_husks(params)
	if Managers.player.is_server and DamageUtils.is_player_unit(params.touching_unit) then
		local hazard_unit = params.unit
		local hit_unit = params.touching_unit
		local push_multiplier = params.push_multiplier
		local damage = params.damage
		local hazard_position = POSITION_LOOKUP[hazard_unit] or Unit.world_position(hazard_unit, 0)
		local hazard_flat_position = Vector3.flat(hazard_position)
		local hit_unit_position = POSITION_LOOKUP[hit_unit]
		local hit_unit_flat_position = Vector3.flat(hit_unit_position)

		if unit_alive(hit_unit) and damage then
			local hit_zone_name = "full"
			local damage_type = "forced"
			local damage_direction = Vector3.up()
			local health_extension = ScriptUnit.extension(hit_unit, "health_system")

			health_extension:add_damage(hit_unit, damage, hit_zone_name, damage_type, hit_unit_position, damage_direction)
		end

		local pushed_velocity = Vector3.normalize(hit_unit_flat_position - hazard_flat_position) * push_multiplier
		local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

		locomotion_extension:add_external_velocity(pushed_velocity)
	end
end

function flow_callback_start_disrupt_ritual(params)
	fassert(params.unit, "[flow_callbacks] DISRUPT RITUAL: No level unit name provided [required]")
	fassert(params.volume_name, "[flow_callbacks] DISRUPT RITUAL: No volume name provided [required]")
	fassert(params.num_progression_events > 1, "[flow_callbacks] DISRUPT RITUAL: num_progession_events have to be atleast 2: one for start and one for end [required]")
	fassert(params.num_progression_events, "[flow_callbacks] DISRUPT RITUAL: No num progression events provided [required]")
	fassert(params.tick_length, "[flow_callbacks] DISRUPT RITUAL: No tick length provided [required]")
	fassert(params.damage_per_tick, "[flow_callbacks] DISRUPT RITUAL: No damage per tick provided [required]")
	fassert(params.heal_per_tick, "[flow_callbacks] DISRUPT RITUAL: No heal per tick provided [required]")
	Managers.state.event:trigger("start_disrupt_ritual", params.unit, params.volume_name, params.volume_type, params.num_progression_events, params.tick_length, params.damage_per_tick, params.heal_per_tick)
end

function flow_callback_spawn_sofia_defenders(params)
	if not Managers.player.is_server then
		return
	end

	local unit = params.unit
	local spawn_positions = {
		params.spawn_position1,
		params.spawn_position2,
		params.spawn_position3
	}
	local extension = ScriptUnit.extension(unit, "ward_system")

	extension:spawn_sofia_defenders(spawn_positions)
end

function flow_callback_spawn_skulls_tower_end(params)
	if not Managers.player.is_server then
		return
	end

	local num_skulls = params.num_skulls
	local optional_data = {}
	local sofia_pos = Unit.world_position(params.sofia_unit, 0)
	optional_data.sofia_unit_pos = Vector3Box(sofia_pos)

	optional_data.spawned_func = function (unit, breed, optional_data)
		local blackboard = BLACKBOARDS[unit]

		if blackboard then
			blackboard.sofia_unit_pos = optional_data.sofia_unit_pos
		end
	end

	optional_data.prepare_func = function (breed, extension_init_data)
		local is_husk = false

		breed:modify_extension_init_data(is_husk, extension_init_data)
	end

	local up = Vector3.up()
	local right = Vector3.right()
	local spawn_rot = Quaternion.identity()
	local height = Vector3(0, 0, 3)
	local dist_from_origin = 0.1
	local step = math.pi * 2 / num_skulls

	for i = 1, num_skulls do
		local relative_pos = Quaternion.rotate(Quaternion(up, step * i), right) * dist_from_origin + height
		local spawn_pos = sofia_pos + height
		local teleport_effect = "fx/ethereal_skulls_teleport_01"

		if teleport_effect then
			local effect_name_id = NetworkLookup.effects[teleport_effect]
			local node_id = 0
			local rotation_offset = Quaternion.identity()
			local network_manager = Managers.state.network

			network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, spawn_pos, rotation_offset, false)
		end

		Managers.state.conflict:spawn_queued_unit(Breeds.tower_homing_skull, Vector3Box(spawn_pos), QuaternionBox(spawn_rot), nil, "spawn_idle", nil, optional_data)
	end
end

function flow_callback_trigger_sofia_explosion(params)
	local damage_data = {
		enemy_damage = params.enemy_damage
	}

	Managers.state.event:trigger("on_failed_guardians_event", damage_data)
end

function flow_callback_spawn_magic_missile_two_targets(params)
	local unit = params.unit
	local first_character = params.first_character
	local second_character = params.second_character

	assert(first_character, "[flow_callback_spawn_two_targets_vfx_projectile_tower] assign a first_character")

	local target = nil

	if Unit.get_data(first_character, "visible") then
		target = first_character
	else
		assert(second_character, "[flow_callback_spawn_two_targets_vfx_projectile_tower] first_character is not visible and second_character is not assigned")

		target = second_character
	end

	local spawn_node_name = params.spawn_node_name
	local target_node_name = params.target_node_name
	local second_target = params.optional_second_target
	local second_target_node_name = params.optional_second_target_node_name
	local speed = params.speed
	local trajectory_template_name = params.trajectory_template_name
	local impact_with_last_target = params.impact_with_last_target
	local character_name = params.character_name

	assert(trajectory_template_name, "[flow_callback_spawn_two_targets_vfx_projectile_tower] needs a trajectory_template_name choosen")
	assert(target, "[flow_callback_spawn_two_targets_vfx_projectile_tower] assign a target")
	assert(character_name, "[flow_callback_spawn_two_targets_vfx_projectile_tower] assign character name")

	local projectile_settings = Projectiles.vfx_scripted_projectile_unit
	local projectile_name = projectile_settings.name
	local gravity_settings = projectile_settings.gravity_settings
	local angle = projectile_settings.angle
	local impact_template_name = projectile_settings.impact_template_name
	local impact_collision_filter = projectile_settings.impact_collision_filter
	local sphere_radius = projectile_settings.radius
	local only_one_impact = projectile_settings.only_one_impact
	local projectile_unit = nil

	if character_name == "sofia" then
		projectile_unit = ProjectileUnits.sofia_vfx_scripted_projectile_unit
	else
		projectile_unit = ProjectileUnits.olesya_vfx_scripted_projectile_unit
	end

	local unit_name = projectile_unit.projectile_unit_name
	local spawn_node = Unit.node(unit, spawn_node_name) or 0
	local spawn_position = Unit.world_position(unit, spawn_node)
	local spawn_rotation = Unit.local_rotation(unit, 0)
	local target_node = Unit.node(target, target_node_name) or 0
	local target_position = Unit.world_position(target, target_node)
	local target_direction = Vector3.normalize(target_position - spawn_position)
	spawn_position = spawn_position + target_direction * 0.25
	local target_positions = {
		Vector3Box(target_position)
	}
	local target_units = {
		target
	}

	if Unit.alive(second_target) then
		local second_target_node = Unit.node(second_target, second_target_node_name) or 0
		local second_target_position = Unit.world_position(second_target, second_target_node)
		target_positions[2] = Vector3Box(second_target_position)
		target_units[2] = second_target
	end

	local extension_init_data = {
		projectile_locomotion_system = {
			angle = angle,
			speed = speed,
			target_vector = target_direction,
			target_positions = target_positions,
			target_units = target_units,
			initial_position = spawn_position,
			trajectory_template_name = trajectory_template_name,
			gravity_settings = gravity_settings,
			impact_with_last_target = impact_with_last_target
		},
		projectile_impact_system = {
			sphere_radius = sphere_radius,
			only_one_impact = only_one_impact,
			collision_filter = impact_collision_filter
		},
		projectile_system = {
			impact_template_name = impact_template_name
		}
	}

	Managers.state.unit_spawner:spawn_local_unit_with_extensions(unit_name, projectile_name, extension_init_data, spawn_position, spawn_rotation)
end

function flow_callback_set_rotating_hazard_state(params)
	if not Managers.state.network.is_server then
		return
	end

	local unit = params.unit
	local rotating_hazard_extension = ScriptUnit.has_extension(unit, "props_system")

	if rotating_hazard_extension then
		local state = params.state

		if state == "start" then
			rotating_hazard_extension:start(false)
		elseif state == "restart" then
			rotating_hazard_extension:start(true)
		elseif state == "pause" then
			rotating_hazard_extension:pause()
		elseif state == "stop" then
			rotating_hazard_extension:stop()
		end
	end
end

function flow_callback_trigger_event_on_all_sub_levels(params)
	local event_name = params.event_name

	if not event_name then
		return
	end

	local level = Application.flow_callback_context_level()

	if not level then
		return
	end

	local sub_levels = Level.get_data(level, "sub_levels")

	if sub_levels then
		for sublevel_name, sub_level in pairs(sub_levels) do
			Level.trigger_event(sub_level, event_name)
		end
	end
end

function flow_callback_trigger_event_on_sub_level(params)
	local event_name = params.event_name

	if not event_name then
		return
	end

	local level = Application.flow_callback_context_level()

	if not level then
		return
	end

	local sub_levels = Level.get_data(level, "sub_levels")

	if sub_levels then
		local sub_level = sub_levels[params.sub_level_name]

		if sub_level then
			Level.trigger_event(sub_level, event_name)
		end
	end
end

function flow_callback_trigger_event_of_parent_level(params)
	local event_name = params.event_name

	if not event_name then
		return
	end

	local level = Application.flow_callback_context_level()

	if not level then
		return
	end

	local parent_level = Level.get_data(level, "parent_level")

	if not parent_level then
		return
	end

	Level.trigger_event(parent_level, event_name)
end

function flow_callback_trigger_event_on_context_level(params)
	local event_name = params.event_name

	if not event_name then
		return
	end

	local level = Application.flow_callback_context_level()

	if not level then
		return
	end

	Level.trigger_event(level, event_name)
end

function flow_callback_get_intro_wwise_id(params)
	local level = Application.flow_callback_context_level()

	if not level then
		return
	end

	flow_return_table.wwise_id = Level.get_data(level, "intro_wwise_id") or 0

	return flow_return_table
end

function flow_callback_on_tower_skull_found(params)
	Managers.state.achievement:trigger_event("on_tower_skull_found")
end

function flow_callback_tower_wall_illusion_found(params)
	Managers.state.achievement:trigger_event("tower_wall_illusion_found", params.index)
end

function flow_callback_update_tower_invisible_bridge_challenge(params)
	Managers.state.achievement:trigger_event("update_tower_invisible_bridge_challenge", params.succeeded)
end

function flow_callback_note_puzzle_solved(params)
	Managers.state.achievement:trigger_event("tower_note_puzzle")
end

function flow_callback_tower_potion_created(params)
	Managers.state.achievement:trigger_event("tower_potion_created", params.type)
end

function flow_callback_tower_time_challenge_done(params)
	return
end

function tower_guardian_of_lustria_challenge_done(params)
	Managers.state.achievement:trigger_event("tower_enable_guardian_of_lustria")
end

function flow_callback_tower_skulls_set_target(params)
	Managers.state.event:trigger("set_tower_skulls_target", params.unit, true)
end

function flow_callback_tower_barrel_achievement(params)
	local event_name = params.event_name

	Managers.state.achievement:trigger_event("tower_barrels", event_name, params.unit)
end

function flow_callback_tower_barrel_challenge_done(params)
	Managers.state.achievement:trigger_event("tower_barrels", "done")
end

function flow_callback_once_in_play_session(params)
	local key = params.key
	script_data.once_in_play_session = script_data.once_in_play_session or {}
	flow_return_table.out = not script_data.once_in_play_session[key]
	script_data.once_in_play_session[key] = true

	return flow_return_table
end

function flow_callback_trigger_gameplay_start(params)
	Managers.state.achievement:trigger_event("gameplay_start")
end

function flow_callback_dwarf_emote_achievement(params)
	Managers.state.achievement:trigger_event("dwarf_valaya_emote", params.is_inside)
end

function flow_callback_complete_dwarf_barrel_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_barrel_carry", true)
end

function flow_callback_complete_dwarf_rune_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_rune")
end

function flow_callback_complete_dwarf_bell_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_bells")
end

function flow_callback_update_dwarf_pressure_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_pressure", params.start_timer)
end

function flow_callback_progress_dwarf_towers_challenge(params)
	Managers.state.achievement:trigger_event("progress_dwarf_towers_challenge")
end

function flow_callback_progress_dwarf_chain_speed_challenge(params)
	Managers.state.achievement:trigger_event("progress_dwarf_chain_speed_challenge")
end

function flow_callback_complete_dwarf_jump_puzzle_challenge(params)
	Managers.state.achievement:trigger_event("complete_dwarf_jump_puzzle_challenge")
end

function flow_callback_update_dwarf_pressure_pad_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_pressure_pad", params.unit, params.is_on_pad, params.complete_challenge)
end

function flow_callback_complete_dwarf_crows_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_crows")
end

function flow_callback_update_big_jump_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_big_jump", params.is_landing)
end

function flow_callback_complete_dwarf_speedrun_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_speedrun_end")
end

function flow_callback_start_dwarf_speedrun_challenge(params)
	Managers.state.achievement:trigger_event("dwarf_speedrun_start")
end
