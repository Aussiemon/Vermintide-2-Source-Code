local DECAL_TARGET_POSITION_COUNT = 7
local BaseStates = {
	tower = {
		mission_name = "arena_belakor_overload_statue",
		setup = function (state_template, data)
			if data.is_server then
				data.active_locus = {}
				local locus_entities = Managers.state.entity:get_entities("DeusBelakorLocusExtension")

				for locus_unit, extension in pairs(locus_entities) do
					data.active_locus[#data.active_locus + 1] = {
						locus_unit,
						extension
					}
				end
			end
		end,
		on_server_enter = function (state_template, data)
			return
		end,
		on_server_exit = function (state_template, data)
			return
		end,
		on_client_enter = function (state_template, data)
			local mission_system = Managers.state.entity:system("mission_system")

			mission_system:start_mission(state_template.base_state.mission_name)

			local locus_entities = Managers.state.entity:get_entities("DeusBelakorLocusExtension")

			for locus_unit, extension in pairs(locus_entities) do
				local locus_position = Unit.local_position(locus_unit, 0)
				local min_distance = math.huge
				local index = nil
				local closest_decal_pose = Unit.local_position(data.big_statue, 0)

				for i = 1, #data.decal_poses, 1 do
					local decal_pose = data.decal_poses[i]:unbox()
					local decal_position = Matrix4x4.translation(decal_pose)
					local distance = Vector3.distance_squared(locus_position, decal_position)

					if distance < min_distance then
						closest_decal_pose = decal_pose
						min_distance = distance
						index = i
					end
				end

				extension:connect_to_statue(data.big_statue, closest_decal_pose)

				if index then
					table.swap_delete(data.decal_poses, index)
				end
			end
		end,
		on_client_exit = function (state_template, data)
			local mission_system = Managers.state.entity:system("mission_system")

			mission_system:end_mission(state_template.base_state.mission_name)
		end,
		server_update = function (current_state, data, dt, t)
			local done_locus = 0

			for _, unit_and_extension in ipairs(data.active_locus) do
				local extension = unit_and_extension[2]
				done_locus = done_locus + ((extension:is_complete() and 1) or 0)
			end

			if data.shared_state:get_server(data.shared_state:get_key("socketed_count")) ~= done_locus then
				data.shared_state:set_server(data.shared_state:get_key("socketed_count"), done_locus)
			end
		end,
		client_update = function (current_state, data, dt, t)
			local current_value = Level.flow_variable(data.level, "socketed_count")
			local new_value = data.shared_state:get_server(data.shared_state:get_key("socketed_count"))

			if current_value ~= new_value then
				Level.set_flow_variable(data.level, "socketed_count", new_value)
				Level.trigger_event(data.level, "update_socketed_count")
			end
		end
	}
}
local ArenaStates = nil
ArenaStates = {
	none = {
		id = 0
	},
	approaching_the_tower = {
		mission_name = "arena_belakor_go_tower",
		exit_volume_id = "trigger_approach_tower_done",
		id = 1,
		on_server_enter = function (state_template, data)
			local volume_system = Managers.state.entity:system("volume_system")
			local exit_volume_id = state_template.exit_volume_id

			volume_system:register_volume(exit_volume_id, "trigger_volume", {
				sub_type = "players_inside",
				on_triggered = function ()
					data.shared_state:set_server(data.shared_state:get_key("state"), ArenaStates.tower_phase_1.id)
				end
			})
		end,
		on_server_exit = function (state_template, data)
			local volume_system = Managers.state.entity:system("volume_system")
			local exit_volume_id = state_template.exit_volume_id

			volume_system:unregister_volume(exit_volume_id)
		end,
		on_client_enter = function (state_template, data)
			local mission_system = Managers.state.entity:system("mission_system")

			mission_system:start_mission(state_template.mission_name)
		end,
		on_client_exit = function (state_template, data)
			local mission_system = Managers.state.entity:system("mission_system")

			mission_system:end_mission(state_template.mission_name)
		end
	},
	tower_phase_1 = {
		id = 2,
		base_state = BaseStates.tower,
		server_update = function (current_state, data, dt, t)
			local done_locus = 0

			for _, unit_and_extension in ipairs(data.active_locus) do
				local extension = unit_and_extension[2]
				done_locus = done_locus + ((extension:is_complete() and 1) or 0)
			end

			if done_locus > 0 and done_locus / #data.active_locus >= 0.5 then
				data.shared_state:set_server(data.shared_state:get_key("state"), ArenaStates.tower_phase_2.id)
			end
		end
	},
	tower_phase_2 = {
		id = 3,
		base_state = BaseStates.tower,
		server_update = function (current_state, data, dt, t)
			local done_locus = 0

			for _, unit_and_extension in ipairs(data.active_locus) do
				local extension = unit_and_extension[2]
				done_locus = done_locus + ((extension:is_complete() and 1) or 0)
			end

			if done_locus > 0 and done_locus / #data.active_locus >= 1 then
				data.shared_state:set_server(data.shared_state:get_key("state"), ArenaStates.escape.id)
			end
		end
	},
	escape = {
		mission_name = "arena_belakor_escape",
		exit_volume_id = "trigger_escape_done",
		id = 4,
		setup = function (state_template, data)
			return
		end,
		on_server_enter = function (state_template, data)
			return
		end,
		on_client_enter = function (state_template, data)
			return
		end
	}
}
local id_to_state = {}
local id_to_state_name = {}

for state_name, state in pairs(ArenaStates) do
	id_to_state[state.id] = state
	id_to_state_name[state.id] = state_name
end

local shared_state_spec = {
	server = {
		state = {
			type = "number",
			default_value = ArenaStates.none.id,
			composite_keys = {}
		},
		socketed_count = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		}
	},
	peer = {}
}

SharedState.validate_spec(shared_state_spec)

return {
	hide_from_player_ui = true,
	client_start_function = function (context, data)
		local is_server = context.is_server
		local network_server, server_peer_id = nil
		local own_peer_id = Network.peer_id()

		if is_server then
			network_server = Managers.mechanism:network_handler()
			server_peer_id = own_peer_id
		else
			local network_client = Managers.mechanism:network_handler()
			server_peer_id = network_client.server_peer_id
		end

		data.is_server = is_server
		data.world = context.world
		data.level = LevelHelper:current_level(data.world)
		data.shared_state = SharedState:new("mutator_arena_belakor_script", shared_state_spec, is_server, network_server, server_peer_id, own_peer_id)
		data.current_state = ArenaStates.none

		if is_server then
			data.shared_state:set_server(data.shared_state:get_key("state"), ArenaStates.approaching_the_tower.id)
		end

		local big_statues = Managers.state.entity:get_entities("DeusArenaBelakorBigStatueExtension")
		local big_statue = nil

		for unit, _ in pairs(big_statues) do
			fassert(data.big_statue == nil, "There can only be one unit with DeusArenaBelakorBigStatueExtension", #big_statues)

			big_statue = unit
		end

		fassert(big_statue, "There has to be one unit with DeusArenaBelakorBigStatueExtension")

		data.big_statue = big_statue
		local decal_poses = {}

		for i = 1, DECAL_TARGET_POSITION_COUNT, 1 do
			local node_name = "ap_decal_0" .. i

			fassert(Unit.has_node(big_statue, node_name), "There has to be a node called %s in the statue", node_name)

			local node = Unit.node(big_statue, node_name)
			local decal_pose = Unit.world_pose(data.big_statue, node)
			decal_poses[#decal_poses + 1] = Matrix4x4Box(decal_pose)
		end

		data.decal_poses = decal_poses
	end,
	register_rpcs = function (context, data, network_event_delegate)
		data.shared_state:register_rpcs(network_event_delegate)
		data.shared_state:full_sync()
	end,
	unregister_rpcs = function (context, data)
		data.shared_state:unregister_rpcs()
	end,
	client_update_function = function (context, data, dt, t)
		local party_manager = Managers.party
		local party = party_manager:get_party_from_player_id(Network.peer_id(), 1)

		if party.name == "undecided" then
			return
		end

		if not data.setup_done then
			for _, state_template in pairs(BaseStates) do
				local setup = state_template.setup

				if setup then
					setup(state_template, data)
				end
			end

			for _, state_template in pairs(ArenaStates) do
				local setup = state_template.setup

				if setup then
					setup(state_template, data)
				end
			end

			data.setup_done = true
		end

		local is_server = context.is_server
		local current_state = data.current_state

		if current_state then
			if is_server then
				if current_state.base_state and current_state.base_state.server_update then
					current_state.base_state.server_update(current_state, data, dt, t)
				end

				if current_state.server_update then
					current_state:server_update(data, dt, t)
				end
			end

			if current_state.base_state and current_state.base_state.client_update then
				current_state.base_state.client_update(current_state, data, dt, t)
			end

			if current_state.client_update then
				current_state:client_update(data, dt, t)
			end
		end

		local new_state_id = data.shared_state:get_server(data.shared_state:get_key("state"))
		local new_state = id_to_state[new_state_id]

		if current_state ~= new_state then
			local current_base_state_left = current_state.base_state and current_state.base_state ~= new_state.base_state
			local new_base_state_entered = new_state.base_state and current_state.base_state ~= new_state.base_state

			if is_server then
				if current_state.on_server_exit then
					current_state:on_server_exit(data)
				end

				if current_base_state_left and current_state.base_state.on_server_exit then
					current_state.base_state.on_server_exit(current_state, data)
				end
			end

			if current_state.on_client_exit then
				current_state:on_client_exit(data)
			end

			if current_base_state_left and current_state.base_state.on_client_exit then
				current_state.base_state.on_client_exit(current_state, data)
			end

			Level.trigger_event(data.level, "on_exit_" .. id_to_state_name[current_state.id])

			current_state = new_state
			data.current_state = current_state

			Level.trigger_event(data.level, "on_enter_" .. id_to_state_name[current_state.id])

			if is_server then
				if new_base_state_entered and new_state.base_state.on_server_enter then
					new_state.base_state.on_server_enter(current_state, data)
				end

				if new_state.on_server_enter then
					new_state:on_server_enter(data)
				end
			end

			if new_base_state_entered and new_state.base_state.on_client_enter then
				new_state.base_state.on_client_enter(new_state, data)
			end

			if new_state.on_client_enter then
				new_state:on_client_enter(data)
			end
		end
	end
}
