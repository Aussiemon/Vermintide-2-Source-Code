-- chunkname: @scripts/unit_extensions/deus/deus_belakor_locus_extension.lua

local TRAVEL_DISTANCE_TO_SPAWN_CULTISTS = 60
local DISTANCE_TO_TRIGGER_DIALOGUE = 20
local UNLOCK_MESSAGE_DURATION = 10
local STATE = {
	ACTIVATED = 3,
	DONE = 4,
	INITIAL = 0,
	WAITING_FOR_ACTIVATION = 2,
	WAITING_TO_SPAWN_CULTISTS = 1,
}
local NUM_LOCUS_TYPES = 3
local AGGRO_ON_INTERACTION_RANGE = 5
local INTERACTABLE_TYPE_PRE_CRYSTAL = "deus_belakor_locus_pre_crystal"
local INTERACTABLE_TYPE_WITH_CRYSTAL = "deus_belakor_locus_with_crystal"
local STATUE_BEAM_FX = "fx/trail_locus"
local BEAM_STATUE_Z_OFFSET = 8
local BEAM_LOCUS_Z_OFFSET = 2
local SHOW_RUNE_FLOW_EVENTS = {
	"SHOW_RUNE_01",
	"SHOW_RUNE_02",
	"SHOW_RUNE_03",
}
local LIEUTENANT_TERROR_EVENTS = {
	"belakor_altar_shadow_lieutenant_spawn_01",
	"belakor_altar_shadow_lieutenant_spawn_02",
	"belakor_altar_shadow_lieutenant_spawn_03",
}
local DECAL_PER_LOCUS_TYPE = {
	"units/decals/decal_belakor_arena_01",
	"units/decals/decal_belakor_arena_02",
	"units/decals/decal_belakor_arena_03",
}

local function check_if_should_spawn_cultists(conflict_director, altar_main_path_distance)
	local main_path_info = conflict_director.main_path_info
	local main_path_player_info = conflict_director.main_path_player_info
	local ahead_player_travel_dist
	local ahead_player_info = main_path_player_info[main_path_info.ahead_unit]

	if not ahead_player_info then
		return false
	end

	ahead_player_travel_dist = ahead_player_info.travel_dist

	return ahead_player_travel_dist > altar_main_path_distance - TRAVEL_DISTANCE_TO_SPAWN_CULTISTS
end

local function check_if_should_play_vo(world, locus_unit, locus_position, players_and_bots)
	local closest_position, closest_player
	local closest_distance = math.huge

	for i = 1, #players_and_bots do
		local new_player = players_and_bots[i]
		local new_player_position = POSITION_LOOKUP[new_player]
		local new_distance = Vector3.distance(locus_position, new_player_position)

		if not closest_position or new_distance < closest_distance then
			closest_distance = new_distance
			closest_position = new_player_position
			closest_player = new_player
		end
	end

	if not closest_position then
		return false
	end

	if closest_distance > DISTANCE_TO_TRIGGER_DIALOGUE then
		return false
	end

	local raised_locus_position = locus_position + Vector3(0, 0, 1.5)
	local raised_player_position = closest_position + Vector3(0, 0, 1.5)
	local should_play = not World.umbra_available(world) or World.umbra_has_line_of_sight(world, raised_locus_position, raised_player_position)

	if not should_play then
		return should_play
	else
		return should_play, closest_player
	end
end

DeusBelakorLocusExtension = class(DeusBelakorLocusExtension)

DeusBelakorLocusExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.player.is_server
	self._world = extension_init_context.world

	local side = Managers.state.side:get_side_from_name("heroes")

	self._hero_side = side

	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local current_node = deus_run_controller:get_current_node()

	self._arena_mode = current_node.base_level == "arena_belakor"

	if not self._is_server then
		return
	end

	self._prev_state = STATE.INITIAL
end

DeusBelakorLocusExtension.game_object_initialized = function (self, unit, go_id)
	self:_set_state(STATE.WAITING_TO_SPAWN_CULTISTS)
end

DeusBelakorLocusExtension.extensions_ready = function (self, world, unit)
	self._interactable_extension = ScriptUnit.extension(unit, "interactable_system")
end

DeusBelakorLocusExtension.destroy = function (self)
	if self._statue_beam then
		World.destroy_particles(self._world, self._statue_beam)

		self._statue_beam = nil
	end
end

DeusBelakorLocusExtension.connect_to_statue = function (self, statue_unit, decal_pose)
	local current_state = self:_get_state()

	if current_state ~= STATE.DONE then
		self._statue_unit = statue_unit

		local world = self._world
		local beam_start_position = Unit.local_position(self._unit, 0) + Vector3(0, 0, BEAM_LOCUS_Z_OFFSET)
		local beam_end_position = Matrix4x4.translation(decal_pose)
		local beam_start_control_position = beam_start_position + Vector3(0, 0, 2)
		local direction = beam_end_position - beam_start_position

		direction.z = 0
		direction = Vector3.normalize(direction)

		local beam_end_control_position = beam_end_position + direction * 2
		local statue_beam = World.create_particles(world, STATUE_BEAM_FX, Vector3.zero(), Quaternion.identity())

		self._statue_beam = statue_beam

		local beam_variable_id = World.find_particles_variable(world, STATUE_BEAM_FX, 1)

		World.set_particles_variable(world, statue_beam, beam_variable_id, beam_start_position)

		local beam_variable_id = World.find_particles_variable(world, STATUE_BEAM_FX, 2)

		World.set_particles_variable(world, statue_beam, beam_variable_id, beam_start_control_position)

		local beam_variable_id = World.find_particles_variable(world, STATUE_BEAM_FX, 3)

		World.set_particles_variable(world, statue_beam, beam_variable_id, beam_end_control_position)

		local beam_variable_id = World.find_particles_variable(world, STATUE_BEAM_FX, 4)

		World.set_particles_variable(world, statue_beam, beam_variable_id, beam_end_position)

		local decal_pos = beam_end_position
		local decal_rotation = Matrix4x4.rotation(decal_pose)

		self._statue_decal = Managers.state.unit_spawner:spawn_local_unit(DECAL_PER_LOCUS_TYPE[self._locus_type], decal_pos, decal_rotation, "units/materials/d/decal/decal_belakor_arena_01")
	end
end

DeusBelakorLocusExtension.update = function (self, unit, input, dt, context, t)
	if not self._go_id then
		self._go_id = Managers.state.unit_storage:go_id(self._unit)

		if self._go_id then
			local seed = HashUtils.fnv32_hash(self._go_id)
			local random_generator = DeusGenUtils.create_random_generator(seed)

			self._locus_type = random_generator(1, NUM_LOCUS_TYPES)
			self._random_generator = random_generator

			local flow_event = SHOW_RUNE_FLOW_EVENTS[self._locus_type]

			if flow_event then
				Unit.flow_event(self._unit, flow_event)
			end
		end
	end

	if self._paused then
		return
	end

	if self._is_server then
		local altar_position = Unit.local_position(unit, 0)

		if not self._already_played_vo and self._random_generator then
			local players = self._hero_side.PLAYER_AND_BOT_UNITS
			local world = self._world
			local should_play, closest_player = check_if_should_play_vo(world, unit, altar_position, players)

			if should_play then
				local intro_vo_unit = LevelHelper:find_dialogue_unit(world, "ferry_lady")
				local ferry_lady_dialogue_extension = intro_vo_unit and ScriptUnit.has_extension(intro_vo_unit, "dialogue_system")
				local ferry_lady_dialogue_input = ferry_lady_dialogue_extension and ScriptUnit.extension_input(intro_vo_unit, "dialogue_system")
				local closest_player_dialogue_extension = ScriptUnit.has_extension(closest_player, "dialogue_system")
				local closest_player_dialogue_input = closest_player_dialogue_extension and ScriptUnit.extension_input(closest_player, "dialogue_system")
				local possible_sources = {}

				if ferry_lady_dialogue_input then
					possible_sources[#possible_sources + 1] = ferry_lady_dialogue_input
				end

				possible_sources[#possible_sources + 1] = closest_player_dialogue_input

				local random_index = self._random_generator(1, #possible_sources)
				local dialogue_input = possible_sources[random_index]
				local event_data = FrameTable.alloc_table()

				dialogue_input:trigger_dialogue_event("shadow_curse_worship_site_nearby", event_data)

				self._already_played_vo = true
			end
		end

		local current_state = self:_get_state()

		if current_state == STATE.WAITING_TO_SPAWN_CULTISTS then
			local conflict_director = Managers.state.conflict

			if not self._altar_main_path_distance then
				local level_analysis = conflict_director.level_analysis
				local main_paths = level_analysis:get_main_paths()
				local _, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, altar_position)

				self._altar_main_path_distance = travel_dist
			end

			if check_if_should_spawn_cultists(conflict_director, self._altar_main_path_distance) then
				local seed = Managers.mechanism:get_level_seed()

				self._cultist_terror_event_id = Managers.state.conflict:start_terror_event("belakor_altar_cultists_spawn", seed, unit)

				self:_set_state(STATE.WAITING_FOR_ACTIVATION)
			end
		end
	end

	local current_state = self:_get_state()
	local prev_state = self._prev_state

	if current_state == prev_state or current_state == STATE.WAITING_TO_SPAWN_CULTISTS then
		-- Nothing
	elseif current_state == STATE.WAITING_FOR_ACTIVATION then
		self._interactable_extension:set_interactable_type(INTERACTABLE_TYPE_PRE_CRYSTAL)
	elseif current_state == STATE.ACTIVATED then
		Unit.flow_event(unit, "lieutenant_spawned")
		Managers.state.achievement:trigger_event("register_lieutenant_spawned")
		self._interactable_extension:set_interactable_type(INTERACTABLE_TYPE_WITH_CRYSTAL)

		if self._statue_beam then
			World.destroy_particles(self._world, self._statue_beam)

			self._statue_beam = nil
		end

		if self._statue_decal then
			Managers.state.unit_spawner:mark_for_deletion(self._statue_decal)

			self._statue_decal = nil
		end

		if self._is_server then
			local seed = Managers.mechanism:get_level_seed()
			local terror_event = LIEUTENANT_TERROR_EVENTS[self._locus_type] or "belakor_shadow_lieutenant_spawn"

			Managers.state.conflict:start_terror_event(terror_event, seed, unit)
		end
	elseif current_state == STATE.DONE then
		Unit.flow_event(unit, "deactivated")

		if self._arena_mode then
			Managers.state.achievement:trigger_event("register_locus_destroyed")
		end

		if not self._arena_mode then
			local deus_curse_ui = Managers.ui:get_hud_component("DeusCurseUI")

			deus_curse_ui:show_special_message("belakor", "deus_belakor_locus_arena_unlock_title", "deus_belakor_locus_arena_unlock_description", UNLOCK_MESSAGE_DURATION)

			local wwise_world = Managers.world:wwise_world(self._world)

			WwiseWorld.trigger_event(wwise_world, "belakor_shadow_locus_arena_unlocked")

			if self._is_server then
				local mechanism = Managers.mechanism:game_mechanism()
				local deus_run_controller = mechanism.get_deus_run_controller and mechanism:get_deus_run_controller()

				if deus_run_controller then
					deus_run_controller:unlock_arena_belakor()
				end
			end
		end
	end

	self._prev_state = current_state
end

DeusBelakorLocusExtension.activate = function (self)
	self._paused = false
end

DeusBelakorLocusExtension.deactivate = function (self)
	self._paused = true
end

DeusBelakorLocusExtension.is_complete = function (self)
	local state = self:_get_state()

	return state == STATE.DONE
end

DeusBelakorLocusExtension._get_state = function (self)
	local game_session = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	if not game_session or not go_id then
		return STATE.INITIAL
	end

	return GameSession.game_object_field(game_session, go_id, "deus_belakor_locus_state")
end

DeusBelakorLocusExtension._set_state = function (self, state)
	local game = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self._unit)

	fassert(game and go_id, "setting state without network setup done")
	GameSession.set_game_object_field(game, go_id, "deus_belakor_locus_state", state)
end

DeusBelakorLocusExtension.can_interact_validate = function (self, player_unit)
	local inventory_extension = ScriptUnit.has_extension(player_unit, "inventory_system")

	if inventory_extension and inventory_extension:has_inventory_item("slot_level_event", "belakor_crystal") then
		return true
	end

	return false
end

DeusBelakorLocusExtension.can_interact = function (self)
	local state = self:_get_state()

	if state == STATE.WAITING_FOR_ACTIVATION then
		return true
	end

	if state == STATE.ACTIVATED then
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local player_unit = local_player.player_unit
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		if inventory_extension:has_inventory_item("slot_level_event", "belakor_crystal") then
			return true
		end

		local crystal_entities = Managers.state.entity:get_entities("DeusBelakorCrystalExtension")

		if not table.is_empty(crystal_entities) then
			return false, "deus_belakor_locus_throw_crystal_impeded_hud_desc"
		end

		local human_players = player_manager:human_players()

		for _, player in pairs(human_players) do
			player_unit = player.player_unit
			inventory_extension = player_unit and ScriptUnit.extension(player_unit, "inventory_system")

			if inventory_extension and inventory_extension:has_inventory_item("slot_level_event", "belakor_crystal") then
				return false, "deus_belakor_locus_throw_crystal_impeded_hud_desc"
			end
		end

		return false
	end

	return false
end

DeusBelakorLocusExtension.get_interaction_length = function (self)
	local state = self:_get_state()

	if state == STATE.WAITING_FOR_ACTIVATION or state == STATE.ACTIVATED then
		local unit = self._unit
		local duration = Unit.get_data(unit, "interaction_data", "interaction_length")

		fassert(duration, "Interacting with %q that has no interaction length", unit)

		return duration
	else
		return 0
	end
end

DeusBelakorLocusExtension.get_interaction_action = function (self)
	local state = self:_get_state()

	if state == STATE.ACTIVATED then
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local player_unit = local_player.player_unit
		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		if inventory_extension:has_inventory_item("slot_level_event", "belakor_crystal") then
			return "deus_belakor_locus_throw_crystal_hud_desc"
		end

		local crystal_entities = Managers.state.entity:get_entities("DeusBelakorCrystalExtension")

		if not table.is_empty(crystal_entities) then
			return "deus_belakor_locus_throw_crystal_impeded_hud_desc"
		end

		local human_players = player_manager:human_players()

		for _, player in pairs(human_players) do
			player_unit = player.player_unit
			inventory_extension = player_unit and ScriptUnit.extension(player_unit, "inventory_system")

			if inventory_extension and inventory_extension:has_inventory_item("slot_level_event", "belakor_crystal") then
				return "deus_belakor_locus_throw_crystal_impeded_hud_desc"
			end
		end
	end

	return "deus_belakor_locus_deactivate_hud_desc"
end

DeusBelakorLocusExtension.on_server_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	local state = self:_get_state()

	if state == STATE.WAITING_FOR_ACTIVATION then
		self:_set_state(STATE.ACTIVATED)
	end

	if state == STATE.ACTIVATED then
		self:_set_state(STATE.DONE)
	end
end

DeusBelakorLocusExtension.on_client_interact = function (self, world, interactor_unit, interactable_unit, data, config, t, result)
	local state = self:_get_state()

	if state == STATE.ACTIVATED then
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		inventory_extension:destroy_slot("slot_level_event")
		inventory_extension:wield_previous_weapon()
	end
end

DeusBelakorLocusExtension.on_server_start_interact = function (self, world, interactor_unit, interactable_unit, data, config, t)
	local position = POSITION_LOOKUP[interactable_unit]
	local radius = AGGRO_ON_INTERACTION_RANGE
	local ai_units = FrameTable.alloc_table()
	local num_ai_units = AiUtils.broadphase_query(position, radius, ai_units)

	for i = 1, num_ai_units do
		local ai_unit = ai_units[i]

		if ALIVE[ai_unit] then
			local group_extension = ScriptUnit.has_extension(ai_unit, "ai_group_system")

			if group_extension and group_extension.template == "deus_belakor_locus_cultists" then
				AIGroupTemplates[group_extension.template].wake_up_group(group_extension.group, interactor_unit)
			end
		end
	end
end
