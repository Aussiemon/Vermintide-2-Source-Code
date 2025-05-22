-- chunkname: @scripts/entity_system/systems/ai/ai_bot_group_system.lua

require("scripts/settings/player_bots_settings")

AIBotGroupSystem = class(AIBotGroupSystem, ExtensionSystemBase)

local extensions = {
	"AIBotGroupExtension",
	"BotBreakableExtension",
}
local bot_threat_queue_position = 1
local bot_threat_queue_shape = 2
local bot_threat_queue_size = 3
local bot_threat_queue_rotation = 4
local bot_threat_queue_threat_duration = 5

AIBotGroupExtension = class(AIBotGroupExtension)

AIBotGroupExtension.init = function (self)
	return
end

AIBotGroupExtension.destroy = function (self)
	return
end

local HOLD_POSITION_EPSILON = 0.05

AIBotGroupExtension.set_hold_position = function (self, hold_position, max_allowed_distance)
	local data = self.data

	if hold_position then
		local max_allowed_distance_sq = math.max(max_allowed_distance, HOLD_POSITION_EPSILON)^2

		data.hold_position = Vector3Box(hold_position)
		data.hold_position_max_distance_sq = max_allowed_distance_sq
	else
		data.hold_position = nil
		data.hold_position_max_distance_sq = nil
	end
end

AIBotGroupExtension.get_hold_position = function (self)
	local data = self.data

	if data.hold_position then
		local hold_position, distance_sq = data.hold_position:unbox(), data.hold_position_max_distance_sq

		return hold_position, distance_sq
	else
		return nil, nil
	end
end

local STICKYNESS_DISTANCE_MODIFIER = -0.2
local BLACKBOARDS = BLACKBOARDS

AIBotGroupSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	local world = context.world

	self._is_server = context.is_server
	self._world = world
	self._physics_world = World.physics_world(world)
	self._unit_storage = context.unit_storage
	self._network_transmit = context.network_transmit
	self._total_num_bots = 0
	self._bot_breakables_broadphase = Broadphase(2, 60)

	if self._is_server then
		local side_manager = Managers.state.side
		local sides = side_manager:sides()
		local num_sides = #sides

		self._last_move_target_unit = Script.new_array(num_sides)
		self._last_move_target_rotations = {}
		self._bot_threat_queue = {}

		local mule_pickups = {}

		for _, pickup_settings in pairs(AllPickups) do
			if pickup_settings.bots_mule_pickup then
				local slot = pickup_settings.slot_name

				mule_pickups[slot] = mule_pickups[slot] or {}
			end
		end

		self._bot_ai_data = Script.new_array(num_sides)
		self._bot_ai_data_lookup = {}
		self._old_priority_targets = Script.new_array(num_sides)
		self._available_mule_pickups = Script.new_array(num_sides)
		self._available_health_pickups = Script.new_array(num_sides)
		self._num_bots = Script.new_array(num_sides)

		for i = 1, num_sides do
			self._bot_ai_data[i] = {}
			self._old_priority_targets[i] = {}
			self._available_mule_pickups[i] = table.clone(mule_pickups)
			self._available_health_pickups[i] = {}
			self._num_bots[i] = 0
		end

		self._urgent_targets = {}
		self._ally_needs_aid_priority = {}
		self._timestamped_positions = {}
		self._disallowed_tag_layers = {
			barrel_explosion = true,
			bot_poison_wind = true,
		}
		self._t = 0
		self._in_carry_event = Script.new_array(num_sides)

		local up = Vector3.up()

		self._left_vectors_outside_volume = {
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 1 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 2 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 3 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 4 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 5 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 6 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 7 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 0 / 8))),
		}
		self._right_vectors_outside_volume = {
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 1 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 2 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 3 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 4 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 5 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 6 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 7 / 8))),
		}
		self._left_vectors = {
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 0.5))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 5 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 3 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 6 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 2 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 7 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 1 / 8))),
		}
		self._right_vectors = {
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 0.5))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 5 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 3 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 6 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 2 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 7 / 8))),
			Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 1 / 8))),
		}
		self._last_key_in_available_pickups = nil
		self._update_pickups_at = -math.huge
		self._used_covers = {}
		self._pathing_points = {}

		local rpcs = {
			"rpc_bot_create_threat_oobb",
		}

		for _, order_data in pairs(AIBotGroupSystem.bot_orders) do
			rpcs[#rpcs + 1] = order_data.rpc_type
		end

		local network_event_delegate = context.network_event_delegate

		self.network_event_delegate = network_event_delegate

		network_event_delegate:register(self, unpack(rpcs))
	end
end

AIBotGroupSystem.destroy = function (self)
	if self._is_server then
		self.network_event_delegate:unregister(self)
	end
end

AIBotGroupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	if extension_name == "BotBreakableExtension" then
		local node_name = "rp_center"
		local node = Unit.has_node(unit, node_name) and Unit.node(unit, node_name) or 0
		local node_position = Unit.world_position(unit, node)

		Broadphase.add(self._bot_breakables_broadphase, unit, node_position, 1)
		ScriptUnit.add_extension(nil, unit, "AIBotGroupExtension", self.NAME)

		return {}
	else
		local initial_inventory = extension_init_data.initial_inventory
		local side = extension_init_data.side
		local data = {
			priority_target_distance = math.huge,
			priority_targets = {},
			nav_point_utility = {},
			blackboard = BLACKBOARDS[unit],
			aoe_threat = {
				expires = -math.huge,
				escape_to = Vector3Box(),
			},
			previous_bot_breakables = {},
			current_bot_breakables = {},
			pickup_orders = {},
			side = side,
		}
		local slot_name = "slot_potion"
		local item_name = initial_inventory[slot_name]
		local item_data = rawget(ItemMasterList, item_name)

		if item_data then
			local template_name = item_data.template or item_data.temporary_template
			local weapon_template = WeaponUtils.get_weapon_template(template_name)

			if weapon_template.is_grimoire then
				local pickup_name = "grimoire"

				data.pickup_orders[slot_name] = {
					pickup_name = pickup_name,
				}
			end
		end

		local side_id = side.side_id

		self._bot_ai_data_lookup[unit] = data
		self._bot_ai_data[side_id][unit] = data

		local ext = ScriptUnit.add_extension(nil, unit, "AIBotGroupExtension", self.NAME)

		ext.data = data
		self._num_bots[side_id] = self._num_bots[side_id] + 1
		self._total_num_bots = self._total_num_bots + 1

		return ext
	end
end

AIBotGroupSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name ~= "BotBreakableExtension" then
		local data = self._bot_ai_data_lookup[unit]

		data.status_extension = ScriptUnit.extension(unit, "status_system")
	end
end

AIBotGroupSystem.on_remove_extension = function (self, unit, extension_name)
	if extension_name == "AIBotGroupExtension" then
		local bot_ai_data = self._bot_ai_data_lookup[unit]
		local side = bot_ai_data.side
		local side_id = side.side_id

		self._bot_ai_data_lookup[unit] = nil
		self._bot_ai_data[side_id][unit] = nil
		self._num_bots[side_id] = self._num_bots[side_id] - 1
		self._total_num_bots = self._total_num_bots - 1
	end

	ScriptUnit.remove_extension(unit, self.NAME)
end

AIBotGroupSystem.hot_join_sync = function (self, peer_id, player)
	return
end

AIBotGroupSystem.set_in_carry_event = function (self, enable, side)
	local side_id = side.side_id

	self._in_carry_event[side_id] = enable
end

AIBotGroupSystem.update = function (self, context, t)
	if not self._is_server or self._total_num_bots == 0 then
		return
	end

	self._t = t

	local dt = context.dt
	local bot_threat_queue = self._bot_threat_queue

	for i = 1, #bot_threat_queue do
		local threat = bot_threat_queue[i]
		local threat_position = threat[bot_threat_queue_position]:unbox()
		local shape = threat[bot_threat_queue_shape]
		local threat_size = threat[bot_threat_queue_size]:unbox()
		local threat_rotation = threat[bot_threat_queue_rotation]:unbox()
		local threat_duration = threat[bot_threat_queue_threat_duration]

		self:aoe_threat_created(threat_position, shape, threat_size, threat_rotation, threat_duration)

		bot_threat_queue[i] = nil
	end

	self:_update_proximity_bot_breakables(t)
	self:_update_urgent_targets(dt, t)
	self:_update_opportunity_targets(dt, t)
	self:_update_existence_checks(dt, t)
	self:_update_move_targets(dt, t)
	self:_update_priority_targets(dt, t)
	self:_update_pickups(dt, t)
	self:_update_ally_needs_aid_priority()
end

AIBotGroupSystem.bot_orders = {
	pickup = {
		function_name = "_order_pickup",
		rpc_type = "rpc_bot_unit_order",
	},
	drop = {
		function_name = "_order_drop",
		lookup = "pickup_names",
		rpc_type = "rpc_bot_lookup_order",
	},
}

AIBotGroupSystem.order = function (self, order_type, bot_unit, order_target, ordering_player)
	local order_data = AIBotGroupSystem.bot_orders[order_type]

	if self._is_server then
		local func = self[order_data.function_name]

		func(self, bot_unit, order_target, ordering_player)
	else
		local rpc_type = order_data.rpc_type
		local target_id

		if rpc_type == "rpc_bot_unit_order" then
			target_id = self._unit_storage:go_id(order_target)
		elseif rpc_type == "rpc_bot_lookup_order" then
			target_id = NetworkLookup[order_data.lookup][order_target]
		else
			ferror("Incorrect rpc_type %q.", rpc_type)
		end

		if Managers.state.network:game() then
			local order_type_id = NetworkLookup.bot_orders[order_type]
			local bot_unit_id = self._unit_storage:go_id(bot_unit)

			self._network_transmit:send_rpc_server(rpc_type, order_type_id, bot_unit_id, target_id, ordering_player:network_id(), ordering_player:local_player_id())
		end
	end
end

AIBotGroupSystem.get_pickup_order = function (self, bot_unit, slot_name)
	local bot_data = self._bot_ai_data_lookup[bot_unit]
	local order = bot_data.pickup_orders[slot_name]

	return order
end

AIBotGroupSystem.get_ammo_pickup_order_unit = function (self, bot_unit)
	local bot_data = self._bot_ai_data_lookup[bot_unit]
	local pickup_unit = bot_data.ammo_pickup_order_unit

	return pickup_unit
end

AIBotGroupSystem.has_pending_pickup_order = function (self, bot_unit)
	local bot_data = self._bot_ai_data_lookup[bot_unit]
	local pickup_orders = bot_data.pickup_orders

	for _, order in pairs(pickup_orders) do
		if order.unit then
			return true
		end
	end

	return false
end

AIBotGroupSystem.rpc_bot_unit_order = function (self, channel_id, order_type_id, bot_unit_id, order_target_id, ordering_player_peer, ordering_local_player_id)
	local order_type = NetworkLookup.bot_orders[order_type_id]
	local bot_unit = self._unit_storage:unit(bot_unit_id)
	local target_unit = self._unit_storage:unit(order_target_id)
	local ordering_player = Managers.player:player(ordering_player_peer, ordering_local_player_id)

	if Unit.alive(bot_unit) and Unit.alive(target_unit) and ordering_player then
		self:order(order_type, bot_unit, target_unit, ordering_player)
	end
end

AIBotGroupSystem.rpc_bot_lookup_order = function (self, channel_id, order_type_id, bot_unit_id, order_target_id, ordering_player_peer, ordering_local_player_id)
	local order_type = NetworkLookup.bot_orders[order_type_id]
	local bot_unit = self._unit_storage:unit(bot_unit_id)
	local target = NetworkLookup[AIBotGroupSystem.bot_orders[order_type].lookup][order_target_id]
	local ordering_player = Managers.player:player(ordering_player_peer, ordering_local_player_id)

	if Unit.alive(bot_unit) and ordering_player then
		self:order(order_type, bot_unit, target, ordering_player)
	end
end

AIBotGroupSystem.queue_aoe_threat = function (self, position, shape, size, rotation, duration)
	if position and shape and size and rotation and duration then
		local bot_threat_queue = self._bot_threat_queue
		local new_threat = {
			Vector3Box(position),
			shape,
			Vector3Box(size),
			QuaternionBox(rotation),
			duration,
		}

		bot_threat_queue[#bot_threat_queue + 1] = new_threat
	end
end

AIBotGroupSystem.rpc_bot_create_threat_oobb = function (self, channel_id, threat_position, threat_rotation, threat_size, threat_duration)
	self:queue_aoe_threat(threat_position, "oobb", threat_size, threat_rotation, threat_duration)
end

AIBotGroupSystem._order_ammo_pickup = function (self, bot_unit, pickup_unit, ordering_player)
	local bot_data = self._bot_ai_data_lookup[bot_unit]

	if bot_data then
		local blackboard = bot_data.blackboard
		local inventory_extension = blackboard.inventory_extension
		local has_full_ammo = inventory_extension:has_full_ammo()

		if has_full_ammo then
			self:_chat_message(bot_unit, ordering_player, "has_full_ammo")
		else
			local time_manager = Managers.time
			local t = time_manager:time("game")

			blackboard.ammo_pickup = pickup_unit
			blackboard.ammo_dist = Vector3.distance(POSITION_LOOKUP[bot_unit], POSITION_LOOKUP[pickup_unit])
			blackboard.ammo_pickup_valid_until = t + 5
			blackboard.needs_target_position_refresh = true
			bot_data.ammo_pickup_order_unit = pickup_unit

			self:_chat_message(bot_unit, ordering_player, "acknowledge_ammo")
		end
	else
		local party_manager = Managers.party
		local party = party_manager:get_party_from_player_id(ordering_player:network_id(), ordering_player:local_player_id())
		local side_manager = Managers.state.side
		local side = side_manager.side_by_party[party]
		local side_id = side.side_id
		local side_bot_data = self._bot_ai_data[side_id]

		for unit, data in pairs(side_bot_data) do
			local order_unit = data.ammo_pickup_order_unit

			if order_unit == pickup_unit then
				local blackboard = data.blackboard

				self:_chat_message(unit, ordering_player, "abort_pickup_assigned_to_other")

				data.ammo_pickup_order_unit = nil
				blackboard.ammo_pickup = nil
				blackboard.needs_target_position_refresh = true
			end
		end
	end
end

AIBotGroupSystem._order_pickup = function (self, bot_unit, pickup_unit, ordering_player)
	if self._is_server then
		local pickup_ext = ScriptUnit.extension(pickup_unit, "pickup_system")
		local settings = pickup_ext:get_pickup_settings()
		local slot_name = settings.slot_name

		if settings.type == "ammo" then
			self:_order_ammo_pickup(bot_unit, pickup_unit, ordering_player)
		elseif slot_name then
			local bot_data = self._bot_ai_data_lookup[bot_unit]

			if bot_data then
				local inventory_extension = ScriptUnit.extension(bot_unit, "inventory_system")
				local slot_data = inventory_extension:get_slot_data(slot_name)
				local can_hold_more = inventory_extension:can_store_additional_item(slot_name)

				if slot_data and not can_hold_more then
					local current_item_template = inventory_extension:get_item_template(slot_data)
					local has_similar_item_already

					if pickup_ext.pickup_name == "grimoire" then
						has_similar_item_already = current_item_template.is_grimoire
					else
						has_similar_item_already = current_item_template.pickup_data and current_item_template.pickup_data.pickup_name == pickup_ext.pickup_name
					end

					if has_similar_item_already then
						self:_chat_message(bot_unit, ordering_player, "already_have_item", Unit.get_data(pickup_unit, "interaction_data", "hud_description"))

						return
					end
				end

				local side = bot_data.side
				local side_id = side.side_id
				local side_bot_data = self._bot_ai_data[side_id]

				for unit, data in pairs(side_bot_data) do
					local order = data.pickup_orders[slot_name]

					if order and order.unit == pickup_unit then
						if unit == bot_unit then
							self:_chat_message(bot_unit, ordering_player, "already_picking_up")

							return
						end

						self:_chat_message(unit, ordering_player, "abort_pickup_assigned_to_other")

						data.pickup_orders[slot_name] = nil
						data.blackboard.needs_target_position_refresh = true
					end
				end

				self:_chat_message(bot_unit, ordering_player, "acknowledge_pickup", Unit.get_data(pickup_unit, "interaction_data", "hud_description"))

				bot_data.pickup_orders[slot_name] = {
					unit = pickup_unit,
					pickup_name = pickup_ext.pickup_name,
				}
				bot_data.blackboard.needs_target_position_refresh = true
			else
				local party_manager = Managers.party
				local party = party_manager:get_party_from_player_id(ordering_player:network_id(), ordering_player:local_player_id())
				local side_manager = Managers.state.side
				local side = side_manager.side_by_party[party]
				local side_id = side.side_id
				local side_bot_data = self._bot_ai_data[side_id]

				for unit, data in pairs(side_bot_data) do
					local order = data.pickup_orders[slot_name]

					if order and order.unit == pickup_unit then
						self:_chat_message(unit, ordering_player, "abort_pickup_assigned_to_other")

						data.pickup_orders[slot_name] = nil
						data.blackboard.needs_target_position_refresh = true
					end
				end
			end
		end
	end
end

AIBotGroupSystem._order_drop = function (self, bot_unit, pickup_name, ordering_player)
	if self._is_server then
		local bot_data = self._bot_ai_data_lookup[bot_unit]

		if bot_data then
			local pickup_settings = AllPickups[pickup_name]
			local slot_name = pickup_settings.slot_name
			local order = bot_data.pickup_orders[slot_name]

			if order and order.pickup_name == pickup_name then
				bot_data.pickup_orders[slot_name] = nil

				self:_chat_message(bot_unit, ordering_player, "acknowledge_drop")
			end
		end
	end
end

local PRIORITY_TARGETS_TEMP = {}
local NEW_TARGETS = {}
local TEMP_PLAYER_UNITS = {}
local TEMP_DISABLED_PLAYER_UNITS = {}
local TEMP_PLAYER_POSITIONS = {}
local TEMP_MAN_MAN_POINTS = {}
local VORTEX_STAY_NEAR_PLAYER_MAX_DISTANCE = 3

AIBotGroupSystem._update_existence_checks = function (self, dt, t)
	local conflict_director = Managers.state.conflict
	local num_vortex_sorcerer = conflict_director:count_units_by_breed("chaos_vortex_sorcerer")
	local vortex_sorcerer_exist = num_vortex_sorcerer > 0
	local num_vortex = conflict_director:count_units_by_breed("chaos_vortex")
	local vortex_exist = num_vortex > 0
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for _, data in pairs(side_bot_data) do
			local blackboard = data.blackboard
			local ai_extension = blackboard.ai_extension

			ai_extension:set_stay_near_player(vortex_sorcerer_exist, VORTEX_STAY_NEAR_PLAYER_MAX_DISTANCE)

			blackboard.vortex_exist = vortex_exist
		end
	end
end

local POSITION_TIMESTAMP_UPDATE_RADIUS = 1
local AFK_TIME_LIMIT = 20

AIBotGroupSystem._update_player_timestamped_positions = function (self, t, player_units)
	for i = 1, #player_units do
		local player_unit = player_units[i]
		local timestamp_data = self._timestamped_positions[player_unit]
		local unit_pos = POSITION_LOOKUP[player_unit]

		if timestamp_data and unit_pos then
			if Vector3.distance_squared(timestamp_data.position:unbox(), unit_pos) > POSITION_TIMESTAMP_UPDATE_RADIUS^2 then
				timestamp_data.position = Vector3Box(unit_pos)
				timestamp_data.timestamp = t
				timestamp_data.afk = false
			elseif t > timestamp_data.timestamp + AFK_TIME_LIMIT then
				timestamp_data.afk = true
			end

			self._timestamped_positions[player_unit] = timestamp_data
		elseif unit_pos then
			self._timestamped_positions[player_unit] = {
				afk = false,
				position = Vector3Box(unit_pos),
				timestamp = t,
			}
		end
	end
end

AIBotGroupSystem._update_move_targets = function (self, dt, t)
	local side_manager = Managers.state.side
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local bot_follow_disabled = Managers.state.game_mode:game_mode().bot_follow_disabled
	local bot_ai_data = self._bot_ai_data
	local num_bots = self._num_bots
	local in_carry_event = self._in_carry_event
	local last_move_target_unit = self._last_move_target_unit

	for side_id = 1, #bot_ai_data do
		repeat
			local side = side_manager:get_side(side_id)
			local side_bot_data = bot_ai_data[side_id]
			local player_units = side.PLAYER_UNITS

			for i = 1, #player_units do
				local player_unit = player_units[i]
				local status_extension = ScriptUnit.extension(player_unit, "status_system")

				if not status_extension.near_vortex then
					local not_disabled = not status_extension:is_disabled()

					if not_disabled then
						TEMP_PLAYER_UNITS[#TEMP_PLAYER_UNITS + 1] = player_unit
					else
						TEMP_DISABLED_PLAYER_UNITS[#TEMP_DISABLED_PLAYER_UNITS + 1] = player_unit
					end
				end
			end

			local num_units = #TEMP_PLAYER_UNITS
			local num_disabled_units = #TEMP_DISABLED_PLAYER_UNITS

			if num_units == 0 and num_disabled_units > 0 then
				local tmp = TEMP_PLAYER_UNITS

				TEMP_PLAYER_UNITS = TEMP_DISABLED_PLAYER_UNITS
				TEMP_DISABLED_PLAYER_UNITS = tmp
				num_units = num_disabled_units
			end

			self:_update_player_timestamped_positions(t, TEMP_PLAYER_UNITS)

			local selected_unit
			local side_num_bots = num_bots[side_id]
			local side_in_carry_event = in_carry_event[side_id]
			local side_last_move_target_unit = last_move_target_unit[side_id]

			if num_units == 0 or side_num_bots == 0 then
				selected_unit = nil
			elseif num_units >= 3 then
				if side_in_carry_event then
					local bot_unit, _ = next(side_bot_data)

					selected_unit = self:_find_most_lonely_move_target(TEMP_PLAYER_UNITS, bot_unit)
				else
					selected_unit = self:_find_least_lonely_move_target(TEMP_PLAYER_UNITS, side_last_move_target_unit)
				end
			elseif num_units == 2 and side_num_bots == 2 and side_in_carry_event then
				local points = TEMP_MAN_MAN_POINTS

				for j = 1, num_units do
					local unit = TEMP_PLAYER_UNITS[j]
					local unit_pos = POSITION_LOOKUP[unit]
					local disallowed_at_pos, current_mapping = self:_selected_unit_is_in_disallowed_nav_tag_volume(nav_world, unit_pos)
					local destination_points

					if disallowed_at_pos then
						local origin_point = self:_find_origin(nav_world, unit)

						destination_points = self:_find_destination_points_outside_volume(nav_world, unit_pos, current_mapping, origin_point, 1)
					else
						local cluster_position, rotation = self:_find_cluster_position(nav_world, unit)

						destination_points = self:_find_destination_points(nav_world, cluster_position, rotation, 1)
					end

					table.append(points, destination_points)
				end

				self:_assign_destination_points(side_bot_data, points, nil, TEMP_PLAYER_UNITS)
				table.clear(TEMP_PLAYER_UNITS)
				table.clear(points)

				break
			else
				local average_bot_pos = Vector3(0, 0, 0)

				for unit, _ in pairs(side_bot_data) do
					average_bot_pos = average_bot_pos + POSITION_LOOKUP[unit]
				end

				average_bot_pos = average_bot_pos / side_num_bots
				selected_unit = self:_find_closest_move_target(TEMP_PLAYER_UNITS, side_last_move_target_unit, average_bot_pos)
			end

			if selected_unit and not script_data.bots_dont_follow and not bot_follow_disabled then
				self._last_move_target_unit[side_id] = selected_unit

				local unit_pos = POSITION_LOOKUP[selected_unit]
				local disallowed_at_pos, current_mapping = self:_selected_unit_is_in_disallowed_nav_tag_volume(nav_world, unit_pos)
				local destination_points

				if disallowed_at_pos then
					local origin_point = self:_find_origin(nav_world, selected_unit)

					destination_points = self:_find_destination_points_outside_volume(nav_world, unit_pos, current_mapping, origin_point, side_num_bots)
				else
					local cluster_position, rotation = self:_find_cluster_position(nav_world, selected_unit)

					destination_points = self:_find_destination_points(nav_world, cluster_position, rotation, side_num_bots)
				end

				self:_assign_destination_points(side_bot_data, destination_points, selected_unit)
			else
				for _, data in pairs(side_bot_data) do
					data.follow_position = nil
					data.follow_unit = nil
				end
			end

			table.clear(TEMP_PLAYER_UNITS)
			table.clear(TEMP_DISABLED_PLAYER_UNITS)
		until true
	end
end

AIBotGroupSystem._selected_unit_is_in_disallowed_nav_tag_volume = function (self, nav_world, selected_unit_pos)
	local tag_volumes_query = GwNavQueries.tag_volumes_from_position(nav_world, selected_unit_pos, 2, 2)

	if tag_volumes_query then
		local GwNavTagVolume_navtag = GwNavTagVolume.navtag
		local GwNavQueries_nav_tag_volume = GwNavQueries.nav_tag_volume
		local volume_system = Managers.state.entity:system("volume_system")
		local disallowed_tag_layers = self._disallowed_tag_layers
		local volume_count = GwNavQueries.nav_tag_volume_count(tag_volumes_query)

		for i = 1, volume_count do
			local nav_tag_volume = GwNavQueries_nav_tag_volume(tag_volumes_query, i)
			local _, _, layer_id, _, user_data_id = GwNavTagVolume_navtag(nav_tag_volume)
			local layer_name = LAYER_ID_MAPPING[layer_id]
			local current_mapping = volume_system:get_volume_mapping_from_lookup_id(user_data_id)

			if current_mapping and disallowed_tag_layers[layer_name] then
				return true, current_mapping
			end
		end

		GwNavQueries.destroy_query_dynamic_output(tag_volumes_query)

		return false
	else
		return false
	end
end

local CLOSEST_TARGET_PREVIOUS_TARGET_STICKINESS = 9

AIBotGroupSystem._find_closest_move_target = function (self, targets, last_target, position)
	local closest_index
	local closest_value = math.huge
	local active_targets = {}

	for i = 1, #targets do
		local unit = targets[i]

		if self._timestamped_positions[unit] and not self._timestamped_positions[unit].afk then
			active_targets[#active_targets + 1] = unit
		end
	end

	if #active_targets == 0 then
		active_targets = targets
	end

	for i = 1, #active_targets do
		local unit = active_targets[i]
		local dist_sq = Vector3.distance_squared(position, POSITION_LOOKUP[unit])

		if unit == last_target then
			dist_sq = dist_sq - CLOSEST_TARGET_PREVIOUS_TARGET_STICKINESS
		end

		if dist_sq < closest_value then
			closest_value = dist_sq
			closest_index = i
		end
	end

	return active_targets[closest_index]
end

local LONELINESS_PREVIOUS_TARGET_STICKINESS = 25

AIBotGroupSystem._find_least_lonely_move_target = function (self, targets, last_target)
	local num_targets = #targets

	for i = 1, num_targets do
		local unit = targets[i]

		TEMP_PLAYER_POSITIONS[i] = POSITION_LOOKUP[unit]
	end

	local least_lonely_index
	local least_lonely_value = math.huge
	local num_positions = #TEMP_PLAYER_POSITIONS

	for i = 1, num_positions do
		local position1 = TEMP_PLAYER_POSITIONS[i]
		local loneliness

		if targets[i] == last_target then
			loneliness = -LONELINESS_PREVIOUS_TARGET_STICKINESS
		else
			loneliness = 0
		end

		for j = 1, num_positions do
			local position2 = TEMP_PLAYER_POSITIONS[j]

			loneliness = loneliness + Vector3.distance_squared(position1, position2)
		end

		if loneliness < least_lonely_value then
			least_lonely_index = i
			least_lonely_value = loneliness
		end
	end

	table.clear(TEMP_PLAYER_POSITIONS)

	return targets[least_lonely_index]
end

local LONELINESS_FAR_AWAY_MODIFIER = 3
local LONELINESS_FAR_AWAY_DISTANCE_SQ = 900

AIBotGroupSystem._find_most_lonely_move_target = function (self, targets, origin_unit)
	local num_targets = #targets

	for i = 1, num_targets do
		local unit = targets[i]

		TEMP_PLAYER_POSITIONS[i] = POSITION_LOOKUP[unit]
	end

	local most_lonely_index
	local most_lonely_value = -math.huge
	local origin = POSITION_LOOKUP[origin_unit]
	local num_positions = #TEMP_PLAYER_POSITIONS

	for i = 1, num_positions do
		local position1 = TEMP_PLAYER_POSITIONS[i]
		local loneliness
		local sq_dist = Vector3.distance_squared(position1, origin)

		if sq_dist > LONELINESS_FAR_AWAY_DISTANCE_SQ then
			loneliness = -sq_dist * LONELINESS_FAR_AWAY_MODIFIER
		else
			loneliness = 0
		end

		for j = 1, num_positions do
			local position2 = TEMP_PLAYER_POSITIONS[j]

			loneliness = loneliness + Vector3.distance_squared(position1, position2)
		end

		if most_lonely_value < loneliness then
			most_lonely_index = i
			most_lonely_value = loneliness
		end
	end

	table.clear(TEMP_PLAYER_POSITIONS)

	return targets[most_lonely_index]
end

AIBotGroupSystem._find_origin = function (self, nav_world, selected_unit)
	local unit_pos = POSITION_LOOKUP[selected_unit]
	local unit_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, unit_pos, 5, 5)
	local origin_pos

	if unit_is_on_navmesh then
		origin_pos = Vector3(unit_pos.x, unit_pos.y, z)
	else
		origin_pos = GwNavQueries.inside_position_from_outside_position(nav_world, unit_pos, 5, 5, 5, 0.5)
	end

	if origin_pos == nil then
		origin_pos = unit_pos
	end

	return origin_pos
end

AIBotGroupSystem._find_cluster_position = function (self, nav_world, selected_unit)
	local locomotion_extension = ScriptUnit.extension(selected_unit, "locomotion_system")
	local current_velocity = locomotion_extension:current_velocity()
	local velocity

	if Vector3.length_squared(current_velocity) < 0.01 then
		velocity = Vector3(0, 0, 0)
	else
		velocity = locomotion_extension:average_velocity()
	end

	local unit_pos = POSITION_LOOKUP[selected_unit]
	local last_nav_mesh_pos = ScriptUnit.extension(selected_unit, "whereabouts_system"):last_position_onground_on_navmesh()
	local ray_start_pos

	if last_nav_mesh_pos and Vector3.distance_squared(unit_pos, last_nav_mesh_pos) < 4 then
		ray_start_pos = last_nav_mesh_pos
	else
		local unit_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, unit_pos, 5, 5)

		if unit_is_on_navmesh then
			ray_start_pos = Vector3(unit_pos.x, unit_pos.y, z)
		else
			ray_start_pos = GwNavQueries.inside_position_from_outside_position(nav_world, unit_pos, 5, 5, 5, 0.5)
		end
	end

	local cluster_position

	if ray_start_pos then
		local _, ray_pos = self:_raycast(nav_world, ray_start_pos, velocity, 5)

		cluster_position = Vector3.lerp(ray_start_pos, ray_pos, 0.6)

		local success, z = GwNavQueries.triangle_from_position(nav_world, cluster_position, 5, 5)

		if success then
			cluster_position.z = z
		else
			cluster_position = ray_pos
		end
	else
		cluster_position = unit_pos
	end

	local rotation

	if Vector3.length_squared(velocity) > 0.010000000000000002 then
		rotation = Quaternion.look(velocity, Vector3.up())
		self._last_move_target_rotations[selected_unit] = nil
	elseif self._last_move_target_rotations[selected_unit] then
		rotation = self._last_move_target_rotations[selected_unit]:unbox()
	else
		local game = Managers.state.network:game()

		if game and not LEVEL_EDITOR_TEST then
			local game_object_id = self._unit_storage:go_id(selected_unit)
			local aim_direction = GameSession.game_object_field(game, game_object_id, "aim_direction")

			rotation = Quaternion.look(Vector3.flat(aim_direction), Vector3.up())
		else
			rotation = Unit.local_rotation(selected_unit, 0)
		end

		self._last_move_target_rotations[selected_unit] = QuaternionBox(rotation)
	end

	return cluster_position, rotation
end

local TEMP_UNITS = {}
local TEMP_TESTED_POINTS = {}
local TEMP_CURRENT_SOLUTION = {}
local TEMP_BEST_SOLUTION = {}

local function find_permutation(current_index, units, tested_points, current_solution, utility, data, best_utility, best_solution)
	local num_units = #units

	if num_units < current_index then
		if best_utility < utility then
			for i = 1, num_units do
				best_solution[i] = current_solution[i]
			end

			return utility
		else
			return best_utility
		end
	else
		local unit = units[current_index]

		for i = 1, num_units do
			if not tested_points[i] then
				current_solution[current_index] = i
				tested_points[i] = true

				local point_utility = data[unit].nav_point_utility[i]
				local new_utility = utility + point_utility

				best_utility = find_permutation(current_index + 1, units, tested_points, current_solution, new_utility, data, best_utility, best_solution)
				tested_points[i] = false
			end
		end

		return best_utility
	end
end

AIBotGroupSystem._assign_destination_points = function (self, bot_ai_data, points, follow_unit, follow_unit_table)
	local units = TEMP_UNITS

	for unit, data in pairs(bot_ai_data) do
		local utility = data.nav_point_utility

		table.clear(utility)

		local pos = POSITION_LOOKUP[unit]

		for i, point in ipairs(points) do
			utility[i] = 1 / math.sqrt(math.max(0.001, Vector3.distance(pos, point)))
		end

		units[#units + 1] = unit
	end

	local solution = TEMP_BEST_SOLUTION
	local best_utility = find_permutation(1, units, TEMP_TESTED_POINTS, TEMP_CURRENT_SOLUTION, 0, bot_ai_data, -math.huge, solution)

	for i = 1, #units do
		local unit = units[i]
		local data = bot_ai_data[unit]

		if data.hold_position then
			data.follow_position = data.hold_position:unbox()
			data.follow_unit = nil
		else
			local point_index = solution[i]

			data.follow_position = points[point_index]

			if follow_unit_table then
				data.follow_unit = follow_unit_table[point_index]
			elseif follow_unit then
				data.follow_unit = follow_unit
			else
				data.follow_unit = nil
			end
		end
	end

	table.clear(TEMP_UNITS)
	table.clear(TEMP_TESTED_POINTS)
	table.clear(TEMP_CURRENT_SOLUTION)
	table.clear(TEMP_BEST_SOLUTION)
end

AIBotGroupSystem._calculate_center_of_volume = function (self, volume_mapping)
	local center_pos = Vector3(0, 0, 0)

	for _, point in pairs(volume_mapping.bottom_points) do
		center_pos = center_pos + Vector3(point[1], point[2], point[3])
	end

	center_pos = center_pos / #volume_mapping.bottom_points

	local longest_distance_sq = 0

	for _, point in pairs(volume_mapping.bottom_points) do
		longest_distance_sq = math.max(Vector3.distance_squared(center_pos, Vector3(point[1], point[2], point[3])), longest_distance_sq)
	end

	return center_pos, longest_distance_sq
end

AIBotGroupSystem._find_destination_points_outside_volume = function (self, nav_world, selected_unit_pos, volume_mapping, origin_point, needed_points)
	local center_point, area_radius_sq = self:_calculate_center_of_volume(volume_mapping)
	local range = math.sqrt(area_radius_sq) + 1
	local dir = Vector3.flat(Vector3.normalize(selected_unit_pos - center_point))
	local rotation = Quaternion.look(dir, Vector3.up())
	local space_per_player = range - 1
	local points = self:_find_points(nav_world, Vector3(center_point[1], center_point[2], selected_unit_pos[3]), rotation, self._left_vectors_outside_volume, self._right_vectors_outside_volume, space_per_player, range, needed_points)
	local num_points = #points
	local current_index = 1
	local last_point = points[current_index]

	if num_points < needed_points then
		for i = num_points + 1, needed_points do
			points[i] = points[current_index] or last_point or origin_point
			last_point = points[current_index] or last_point
			current_index = current_index + 1
		end
	end

	return points
end

AIBotGroupSystem._find_destination_points = function (self, nav_world, origin_point, rotation, needed_points)
	local range = 3
	local space_per_player = 1
	local points = self:_find_points(nav_world, origin_point, rotation, self._left_vectors, self._right_vectors, space_per_player, range, needed_points)

	if needed_points > #points then
		for i = #points + 1, needed_points do
			points[i] = origin_point
		end
	end

	return points
end

local function add_points(points, from_pos, to_pos, amount)
	if amount == 0 then
		return
	end

	for i = 1, amount do
		local pos = Vector3.lerp(from_pos, to_pos, i / amount)

		points[#points + 1] = pos
	end
end

AIBotGroupSystem._find_points = function (self, nav_world, origin_point, rotation, left_vectors, right_vectors, space_per_player, range, needed_points)
	local found_points_left = 0
	local found_points_right = 0
	local left_index = 0
	local right_index = 0
	local points = self._pathing_points

	self._pathing_points = points

	table.clear(points)

	while (left_index < #left_vectors or right_index < #right_vectors) and needed_points > found_points_left + found_points_right do
		if left_index + 1 > #left_vectors then
			right_index = right_index + 1

			local distance, hit_pos = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, right_vectors[right_index]:unbox()), range)
			local num_points = math.floor(distance / space_per_player)

			add_points(points, origin_point, hit_pos, num_points)

			found_points_right = found_points_right + num_points
		elseif right_index + 1 > #right_vectors then
			left_index = left_index + 1

			local distance, hit_pos = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, left_vectors[left_index]:unbox()), range)
			local num_points = math.floor(distance / space_per_player)

			add_points(points, origin_point, hit_pos, num_points)

			found_points_left = found_points_left + num_points
		elseif found_points_right == found_points_left then
			left_index = left_index + 1
			right_index = right_index + 1

			local distance_left, hit_pos_left = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, left_vectors[left_index]:unbox()), range)
			local distance_right, hit_pos_right = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, right_vectors[right_index]:unbox()), range)
			local points_left = math.floor(distance_left / space_per_player)
			local points_right = math.floor(distance_right / space_per_player)
			local points_total = points_left + points_right

			if needed_points < points_total then
				local assign_left = points_left / points_total * needed_points
				local assign_right = points_right / points_total * needed_points
				local floored_assign_left = math.floor(assign_left)
				local fraction = assign_left - floored_assign_left

				if fraction >= 0.5 then
					assign_left = math.ceil(assign_left)
					assign_right = math.floor(assign_right)
				else
					assign_left = floored_assign_left
					assign_right = math.ceil(assign_right)
				end

				add_points(points, origin_point, hit_pos_left, assign_left)
				add_points(points, origin_point, hit_pos_right, assign_right)

				found_points_left = found_points_left + assign_left
				found_points_right = found_points_right + assign_right
			else
				add_points(points, origin_point, hit_pos_left, points_left)
				add_points(points, origin_point, hit_pos_right, points_right)

				found_points_left = found_points_left + points_left
				found_points_right = found_points_right + points_right
			end
		elseif found_points_left < found_points_right then
			left_index = left_index + 1

			local distance, hit_pos = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, left_vectors[left_index]:unbox()), range)
			local num_points = math.floor(distance / space_per_player)

			add_points(points, origin_point, hit_pos, num_points)

			found_points_left = found_points_left + num_points
		elseif found_points_right < found_points_left then
			right_index = right_index + 1

			local distance, hit_pos = self:_raycast(nav_world, origin_point, Quaternion.rotate(rotation, right_vectors[right_index]:unbox()), range)
			local num_points = math.floor(distance / space_per_player)

			add_points(points, origin_point, hit_pos, num_points)

			found_points_right = found_points_right + num_points
		end
	end

	return points
end

local SPACE_NEEDED = 0.25

AIBotGroupSystem._raycast = function (self, nav_world, point, vector, range)
	local ray_range = range + SPACE_NEEDED
	local to = point + vector * ray_range
	local success, pos = GwNavQueries.raycast(nav_world, point, to)

	if success then
		return range, pos - vector * SPACE_NEEDED, true
	else
		local distance = Vector3.length(Vector3.flat(pos - point))

		if distance < SPACE_NEEDED then
			return 0, point, false
		else
			return distance - SPACE_NEEDED, pos - vector * SPACE_NEEDED, success
		end
	end
end

AIBotGroupSystem._update_priority_targets = function (self, dt, t)
	local side_manager = Managers.state.side
	local bot_ai_data = self._bot_ai_data
	local old_priority_targets = self._old_priority_targets

	for side_id = 1, #bot_ai_data do
		local side = side_manager:get_side(side_id)
		local side_old_priority_targets = old_priority_targets[side_id]
		local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
		local num_players = #player_and_bot_units

		for i = 1, num_players do
			local player_unit = player_and_bot_units[i]
			local status_ext = ScriptUnit.extension(player_unit, "status_system")

			if not status_ext.near_vortex then
				local target

				if status_ext:is_pounced_down() then
					target = status_ext:get_pouncer_unit()
				elseif status_ext:is_grabbed_by_pack_master() then
					target = status_ext:get_pack_master_grabber()
				elseif status_ext:is_overpowered() and status_ext:is_overpowered_by_attacker() then
					target = status_ext.overpowered_attacking_unit
				end

				if HEALTH_ALIVE[target] then
					PRIORITY_TARGETS_TEMP[player_unit] = target
					NEW_TARGETS[target] = (side_old_priority_targets[target] or 0) + dt
				end
			end
		end

		local side_bot_data = bot_ai_data[side_id]

		for unit, data in pairs(side_bot_data) do
			if not ALIVE[data.current_priority_target] then
				data.current_priority_target = nil
			end

			local status_ext = data.status_extension

			table.clear(data.priority_targets)

			if PRIORITY_TARGETS_TEMP[unit] or status_ext:is_disabled() then
				data.current_priority_target_disabled_ally = nil
				data.current_priority_target = nil
				data.priority_target_distance = math.huge
			else
				local self_pos = POSITION_LOOKUP[unit]
				local best_target, best_ally
				local best_utility = -math.huge
				local best_distance = math.huge

				for ally, target in pairs(PRIORITY_TARGETS_TEMP) do
					local utility, distance = self:_calculate_priority_target_utility(self_pos, target, NEW_TARGETS[target], data.current_priority_target)

					data.priority_targets[target] = utility

					if best_utility < utility then
						best_utility = utility
						best_target = target
						best_distance = distance
						best_ally = ally
					end
				end

				data.current_priority_target_disabled_ally = best_ally
				data.current_priority_target = best_target
				data.priority_target_distance = best_distance
			end

			local bb = data.blackboard

			if bb.priority_target_disabled_ally or data.current_priority_target_disabled_ally then
				bb.priority_target_disabled_ally = data.current_priority_target_disabled_ally
			end

			if bb.priority_target_enemy or data.current_priority_target then
				bb.priority_target_enemy = data.current_priority_target
			end

			bb.priority_target_distance = data.priority_target_distance
		end

		table.clear(PRIORITY_TARGETS_TEMP)
		table.create_copy(side_old_priority_targets, NEW_TARGETS)
		table.clear(NEW_TARGETS)
	end
end

local BOSS_ENGAGE_DISTANCE = 15
local BOSS_ENGAGE_DISTANCE_SQ = BOSS_ENGAGE_DISTANCE^2

AIBotGroupSystem._update_urgent_targets = function (self, dt, t)
	local conflict_director = Managers.state.conflict
	local alive_bosses = conflict_director:alive_bosses()
	local num_alive_bosses = #alive_bosses
	local bot_ai_data = self._bot_ai_data
	local urgent_targets = self._urgent_targets

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			local best_utility = -math.huge
			local best_target
			local best_distance = math.huge
			local blackboard = data.blackboard
			local self_pos = POSITION_LOOKUP[bot_unit]
			local old_target = blackboard.urgent_target_enemy

			for target_unit, is_target_until in pairs(urgent_targets) do
				local time_left = is_target_until - t

				if time_left > 0 then
					if HEALTH_ALIVE[target_unit] then
						local utility, distance = self:_calculate_opportunity_utility(bot_unit, blackboard, self_pos, old_target, target_unit, t, false, false)

						if best_utility < utility then
							best_utility = utility
							best_target = target_unit
							best_distance = distance
						end
					else
						urgent_targets[target_unit] = nil
					end
				else
					urgent_targets[target_unit] = nil
				end
			end

			if not best_target then
				for j = 1, num_alive_bosses do
					local target_unit = alive_bosses[j]
					local pos = POSITION_LOOKUP[target_unit]

					if HEALTH_ALIVE[target_unit] and not AiUtils.unit_invincible(target_unit) and Vector3.distance_squared(pos, self_pos) < BOSS_ENGAGE_DISTANCE_SQ and not BLACKBOARDS[target_unit].defensive_mode_duration then
						local utility, distance = self:_calculate_opportunity_utility(bot_unit, blackboard, self_pos, old_target, target_unit, t, false, false)

						if best_utility < utility then
							best_utility = utility
							best_target = target_unit
							best_distance = distance
						end
					end
				end
			end

			blackboard.revive_with_urgent_target = best_target and self:_can_revive_with_urgent_target(bot_unit, self_pos, blackboard, best_target, t)
			blackboard.urgent_target_enemy = best_target
			blackboard.urgent_target_distance = best_distance

			local hit_by_projectile = blackboard.hit_by_projectile

			for attacking_unit, _ in pairs(hit_by_projectile) do
				if not HEALTH_ALIVE[attacking_unit] then
					hit_by_projectile[attacking_unit] = nil
				end
			end
		end
	end
end

local URGENT_TARGET_REVIVE_MIN_DISTANCE_SQ = {
	chaos_corruptor_sorcerer = 100,
	skaven_pack_master = 49,
	skaven_poison_wind_globadier = 25,
	skaven_ratling_gunner = 25,
	skaven_warpfire_thrower = 100,
}

AIBotGroupSystem._can_revive_with_urgent_target = function (self, bot_unit, self_position, blackboard, urgent_target, t)
	local urgent_target_blackboard = BLACKBOARDS[urgent_target]
	local breed = urgent_target_blackboard.breed
	local breed_name = breed.name
	local target_position = POSITION_LOOKUP[urgent_target]
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_position = POSITION_LOOKUP[target_ally_unit]
	local distance_squared = target_ally_position and Vector3.distance_squared(target_ally_position, target_position) or Vector3.distance_squared(self_position, target_position)
	local revive_min_distance_sq = URGENT_TARGET_REVIVE_MIN_DISTANCE_SQ[breed_name] or 25

	if breed.boss then
		return true
	elseif breed_name == "skaven_ratling_gunner" then
		local hit_by_projectile = blackboard.hit_by_projectile[urgent_target]

		return (not hit_by_projectile or t > hit_by_projectile + 1) and revive_min_distance_sq < distance_squared
	else
		local is_bot_target = urgent_target_blackboard.target_unit == bot_unit

		revive_min_distance_sq = revive_min_distance_sq * (is_bot_target and 4 or 1)

		return revive_min_distance_sq < distance_squared
	end
end

local FALLBACK_OPPORTUNITY_DISTANCE = 40
local FALLBACK_OPPORTUNITY_DISTANCE_SQ = FALLBACK_OPPORTUNITY_DISTANCE^2
local alive_specials_table = {}

AIBotGroupSystem._update_opportunity_targets = function (self, dt, t)
	local conflict_director = Managers.state.conflict

	table.clear(alive_specials_table)

	local alive_specials = conflict_director:alive_specials(alive_specials_table)
	local num_alive_specials = #alive_specials
	local Vector3_distance_squared = Vector3.distance_squared
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			local best_utility = -math.huge
			local best_target
			local best_distance = math.huge
			local blackboard = data.blackboard
			local self_pos = POSITION_LOOKUP[bot_unit]
			local old_target = blackboard.opportunity_target_enemy
			local side = blackboard.side

			for i = 1, num_alive_specials do
				local target_unit = alive_specials[i]
				local opportunity_target_blackboard = BLACKBOARDS[target_unit]
				local ignore_bot_opportunity = opportunity_target_blackboard.breed.ignore_bot_opportunity
				local target_pos = POSITION_LOOKUP[target_unit]

				if not ignore_bot_opportunity and HEALTH_ALIVE[target_unit] and Vector3_distance_squared(target_pos, self_pos) < FALLBACK_OPPORTUNITY_DISTANCE_SQ then
					local utility, distance = self:_calculate_opportunity_utility(bot_unit, blackboard, self_pos, old_target, target_unit, t, false, true)

					if best_utility < utility then
						best_utility = utility
						best_target = target_unit
						best_distance = distance
					end
				end
			end

			local VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS

			for target_unit, is_valid in pairs(VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS) do
				if is_valid then
					local ghost_mode_ext = ScriptUnit.has_extension(target_unit, "ghost_mode_system")

					if not ghost_mode_ext or not ghost_mode_ext:is_in_ghost_mode() then
						local target_pos = POSITION_LOOKUP[target_unit]

						if HEALTH_ALIVE[target_unit] and Vector3_distance_squared(target_pos, self_pos) < FALLBACK_OPPORTUNITY_DISTANCE_SQ then
							local utility, distance = self:_calculate_opportunity_utility(bot_unit, blackboard, self_pos, old_target, target_unit, t, false, true)

							if best_utility < utility then
								best_utility = utility
								best_target = target_unit
								best_distance = distance
							end
						end
					end
				end
			end

			blackboard.opportunity_target_enemy = best_target
			blackboard.opportunity_target_distance = best_distance
		end
	end
end

local OPPORTUNITY_TARGET_MIN_REACTION_TIME = 0.2
local OPPORTUNITY_TARGET_MAX_REACTION_TIME = 0.65
local OPPORTUNITY_TARGET_DIFFICULTY_REACTION_TIMES = BotConstants.default.OPPORTUNITY_TARGET_REACTION_TIMES

AIBotGroupSystem._calculate_opportunity_utility = function (self, bot_unit, bot_blackboard, self_position, current_target, potential_target, t, force_seen, use_difficulty_reaction_times)
	local side = bot_blackboard.side

	if not side.enemy_units_lookup[potential_target] then
		return -math.huge, math.huge
	end

	local prox_ext = ScriptUnit.has_extension(potential_target, "proximity_system")
	local distance = math.max(Vector3.distance(self_position, POSITION_LOOKUP[potential_target]), 1)

	if prox_ext and not prox_ext.has_been_seen and not force_seen then
		return -math.huge, math.huge
	elseif prox_ext then
		local react_at = prox_ext.bot_reaction_times[bot_unit]

		if not react_at then
			local min_reaction_time, max_reaction_time

			if use_difficulty_reaction_times then
				local current_difficulty = Managers.state.difficulty:get_difficulty()
				local reaction_times = OPPORTUNITY_TARGET_DIFFICULTY_REACTION_TIMES[current_difficulty]

				min_reaction_time = reaction_times.min
				max_reaction_time = reaction_times.max
			else
				min_reaction_time = OPPORTUNITY_TARGET_MIN_REACTION_TIME
				max_reaction_time = OPPORTUNITY_TARGET_MAX_REACTION_TIME
			end

			prox_ext.bot_reaction_times[bot_unit] = t + Math.random(min_reaction_time, max_reaction_time)

			return -math.huge, math.huge
		elseif t < react_at then
			return -math.huge, math.huge
		end
	end

	local stickyness_modifier = potential_target == current_target and STICKYNESS_DISTANCE_MODIFIER or 0
	local proximity = 1 / (distance + stickyness_modifier)

	return proximity, distance
end

AIBotGroupSystem._update_pickups = function (self, dt, t)
	local players = Managers.player:players()

	if t > self._update_pickups_at then
		self._update_pickups_at = t + 0.15 + Math.random() * 0.1

		local last_key = self._last_key_in_available_pickups

		if last_key ~= nil and not players[last_key] then
			last_key = nil
		end

		local key, player = next(players, last_key)

		if not key then
			key, player = next(players)
		end

		self._last_key_in_available_pickups = key

		local player_unit = player.player_unit

		if HEALTH_ALIVE[player_unit] and not ScriptUnit.extension(player_unit, "status_system"):is_ready_for_assisted_respawn() then
			self:_update_pickups_near_player(player_unit, t)
		end
	end

	self:_update_orders(dt, t)
	self:_update_health_pickups(dt, t)
	self:_update_mule_pickups(dt, t)
end

local PICKUP_CHECK_RANGE = 15
local PICKUP_FETCH_RESULTS = {}

AIBotGroupSystem._update_orders = function (self, dt, t)
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for unit, data in pairs(side_bot_data) do
			local orders = data.pickup_orders
			local inventory_ext = ScriptUnit.extension(unit, "inventory_system")

			for slot_name, order in pairs(orders) do
				local slot_data = inventory_ext:get_slot_data(slot_name)
				local can_hold_more = inventory_ext:can_store_additional_item(slot_name)

				if slot_data and not can_hold_more then
					local current_item_template = inventory_ext:get_item_template(slot_data)
					local has_picked_up_item

					if order.pickup_name == "grimoire" then
						has_picked_up_item = current_item_template.is_grimoire
					else
						has_picked_up_item = current_item_template.pickup_data and current_item_template.pickup_data.pickup_name == order.pickup_name
					end

					if has_picked_up_item then
						order.unit = nil
					elseif data.status_extension:is_disabled() then
						orders[slot_name] = nil
					elseif order.unit == nil then
						orders[slot_name] = nil
					end
				elseif order.unit == nil then
					orders[slot_name] = nil
				end

				if order.unit and not Unit.alive(order.unit) then
					orders[slot_name] = nil
				end
			end
		end
	end
end

AIBotGroupSystem._update_pickups_near_player = function (self, player_unit, t)
	local side = Managers.state.side.side_by_unit[player_unit]
	local side_id = side.side_id
	local side_bot_data = self._bot_ai_data[side_id]
	local self_pos = POSITION_LOOKUP[player_unit]
	local hp_pickups = self._available_health_pickups[side_id]
	local mule_pickups = self._available_mule_pickups[side_id]

	for unit, data in pairs(side_bot_data) do
		local blackboard = data.blackboard
		local ammo_pickup = blackboard.ammo_pickup

		if Unit.alive(ammo_pickup) then
			local ammo_distance = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[ammo_pickup])

			blackboard.ammo_dist = ammo_distance
			data.ammo_dist = ammo_distance
		elseif blackboard.ammo_pickup then
			blackboard.ammo_pickup = nil
			blackboard.ammo_dist = nil
			data.ammo_dist = nil

			if data.ammo_pickup_order_unit then
				data.ammo_pickup_order_unit = nil
			end
		end
	end

	local check_player_ammo = true
	local all_players_have_ammo = true
	local valid_until = t + 5
	local ammo_stickiness = 2.5
	local allowed_distance_to_self = 5
	local allowed_distance_to_follow_pos = 15
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local pickup_system = Managers.state.entity:system("pickup_system")
	local num_pickups = pickup_system:get_pickups(self_pos, PICKUP_CHECK_RANGE, PICKUP_FETCH_RESULTS)

	for i = 1, num_pickups do
		local pickup_unit = PICKUP_FETCH_RESULTS[i]
		local pickup_extension = ScriptUnit.has_extension(pickup_unit, "pickup_system")
		local aware_extension = ScriptUnit.has_extension(pickup_unit, "surrounding_aware_system")

		if pickup_extension and (not aware_extension or aware_extension.has_been_seen or ScriptUnit.extension(pickup_unit, "ping_system"):pinged()) then
			local pickup_name = pickup_extension.pickup_name
			local pickup_data = AllPickups[pickup_name]

			if pickup_name == "healing_draught" or pickup_name == "first_aid_kit" or pickup_name == "tome" then
				local template = BackendUtils.get_item_template(ItemMasterList[pickup_data.item_name])

				if not hp_pickups[pickup_unit] then
					hp_pickups[pickup_unit] = {
						template = template,
						valid_until = valid_until,
					}
				else
					hp_pickups[pickup_unit].valid_until = valid_until
					hp_pickups[pickup_unit].template = template
				end
			elseif pickup_data.bots_mule_pickup then
				local slot_name = pickup_data.slot_name

				mule_pickups[slot_name][pickup_unit] = valid_until
			elseif pickup_data.type == "ammo" then
				if check_player_ammo then
					local PLAYER_UNITS = side.PLAYER_UNITS
					local num_human_players = #PLAYER_UNITS

					for i = 1, num_human_players do
						local player_unit = PLAYER_UNITS[i]

						if HEALTH_ALIVE[player_unit] then
							local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")
							local ammo_percentage = inventory_ext:ammo_percentage()

							if ammo_percentage < 1 then
								all_players_have_ammo = false

								break
							end
						end
					end

					check_player_ammo = false
				end

				for unit, data in pairs(side_bot_data) do
					local bb = data.blackboard
					local ammo_pickup_order_unit = data.ammo_pickup_order_unit

					if not ammo_pickup_order_unit or t >= bb.ammo_pickup_valid_until then
						local current_pickup = bb.ammo_pickup
						local pickup_pos = POSITION_LOOKUP[pickup_unit]
						local dist = Vector3.distance(POSITION_LOOKUP[unit], pickup_pos)
						local follow_pos = data.follow_position
						local inventory_extension = bb.inventory_extension
						local equipped_ammo_kind = inventory_extension:current_ammo_kind("slot_ranged")
						local pickup_ammo_kind = pickup_data.ammo_kind or "default"
						local same_kind = equipped_ammo_kind == pickup_ammo_kind
						local allowed_to_take_ammo

						if game_mode_key == "survival" then
							if pickup_data.only_once then
								local current_ammo, _ = inventory_extension:current_ammo_status("slot_ranged")

								allowed_to_take_ammo = current_ammo and current_ammo == 0
							else
								allowed_to_take_ammo = true
							end
						else
							allowed_to_take_ammo = pickup_ammo_kind == "thrown" and true or bb.has_ammo_missing and (not pickup_data.only_once or bb.needs_ammo and all_players_have_ammo)
						end

						local ammo_condition = (dist < allowed_distance_to_self or follow_pos and allowed_distance_to_follow_pos > Vector3.distance(follow_pos, pickup_pos)) and (not current_pickup or dist - (current_pickup == pickup_unit and ammo_stickiness or 0) < data.ammo_dist)

						if same_kind and allowed_to_take_ammo and ammo_condition then
							bb.ammo_pickup = pickup_unit
							bb.ammo_pickup_valid_until = valid_until
							bb.ammo_dist = dist
							data.ammo_dist = dist

							if ammo_pickup_order_unit then
								data.ammo_pickup_order_unit = nil
							end
						end
					end
				end
			end
		end
	end

	table.clear(PICKUP_FETCH_RESULTS)
end

local RESERVED_HEALTH_ITEMS_TEMP = {}
local HEALTH_ITEMS_TEMP = {}
local HEALTH_ITEMS_TEMP_TEMP = {}
local AUXILIARY_HEALTH_SLOT_ITEMS_TEMP = {}
local BOT_BBS = {}
local BOT_POSES = {}
local BOT_UNITS = {}
local BOT_HEALTH = {}
local SOLUTION_TEMP = {}
local BEST_SOLUTION_TEMP = {}
local BOT_INDICES = {}
local MAX_PICKUP_RANGE = 15
local STICKINESS = 225
local HP_DISTANCE_MODIFIER = 225

local function find_permutation(current_bot_index, current_utility, solution, best_utility, best_solution, empties_left, health_item_lookup, health_item_list, num_valid_bots)
	if num_valid_bots < current_bot_index then
		if current_utility < best_utility then
			for i = 1, num_valid_bots do
				best_solution[i] = solution[i]
			end

			return current_utility
		else
			return best_utility
		end
	else
		local bb = BOT_BBS[current_bot_index]
		local bot_pos = BOT_POSES[current_bot_index]
		local current_pickup = bb.health_pickup
		local bot_hp = BOT_HEALTH[current_bot_index] or 0

		for unit, pos in pairs(health_item_list) do
			if health_item_lookup[unit] then
				local stickiness_modifier = current_pickup == unit and STICKINESS or 0
				local utility = current_utility + Vector3.distance_squared(bot_pos, pos) - stickiness_modifier - bot_hp * HP_DISTANCE_MODIFIER

				health_item_lookup[unit] = nil
				solution[current_bot_index] = unit
				best_utility = find_permutation(current_bot_index + 1, utility, solution, best_utility, best_solution, empties_left, health_item_lookup, health_item_list, num_valid_bots)
				solution[current_bot_index] = nil
				health_item_lookup[unit] = pos
			end
		end

		if empties_left > 0 then
			best_utility = find_permutation(current_bot_index + 1, current_utility, solution, best_utility, best_solution, empties_left - 1, health_item_lookup, health_item_list, num_valid_bots)
		end

		return best_utility
	end
end

local ASSIGNED_MULE_PICKUPS_TEMP = {}

AIBotGroupSystem._update_mule_pickups = function (self, dt, t)
	local Unit_alive = Unit.alive
	local Vector3_distance_squared = Vector3.distance_squared
	local max_pickup_dist_sq = 400
	local side_manager = Managers.state.side
	local bot_ai_data = self._bot_ai_data
	local available_mule_pickups = self._available_mule_pickups

	for side_id = 1, #bot_ai_data do
		table.clear(ASSIGNED_MULE_PICKUPS_TEMP)

		local side_bot_data = bot_ai_data[side_id]
		local side_available_mule_pickups = available_mule_pickups[side_id]

		for unit, data in pairs(side_bot_data) do
			local best_dist = math.huge
			local best_order
			local pickup_orders = data.pickup_orders

			for slot_name, available_pickups in pairs(side_available_mule_pickups) do
				local order = pickup_orders[slot_name]
				local ordered_unit = order and order.unit

				if ordered_unit then
					available_pickups[ordered_unit] = nil
					ASSIGNED_MULE_PICKUPS_TEMP[ordered_unit] = true

					local dist = Vector3_distance_squared(POSITION_LOOKUP[ordered_unit], POSITION_LOOKUP[unit])

					if dist < best_dist then
						best_order = ordered_unit
						best_dist = dist
					end
				end
			end

			if best_order then
				local blackboard = data.blackboard

				blackboard.mule_pickup = best_order
				blackboard.mule_pickup_dist_squared = best_dist
			end
		end

		for unit, data in pairs(side_bot_data) do
			local blackboard = data.blackboard
			local current_pickup = blackboard.mule_pickup

			if current_pickup then
				if ASSIGNED_MULE_PICKUPS_TEMP[current_pickup] then
					local pickup_extension = ScriptUnit.extension(current_pickup, "pickup_system")
					local slot_name = pickup_extension:get_pickup_settings().slot_name
					local order = data.pickup_orders[slot_name]

					if not order or order.unit ~= current_pickup then
						blackboard.mule_pickup = nil
					end
				elseif not Unit_alive(current_pickup) or max_pickup_dist_sq < Vector3_distance_squared(POSITION_LOOKUP[current_pickup], data.follow_position or POSITION_LOOKUP[current_pickup]) then
					blackboard.mule_pickup = nil
				else
					local pickup_ext = ScriptUnit.extension(current_pickup, "pickup_system")
					local pickup_name = pickup_ext.pickup_name
					local slot_name = AllPickups[pickup_name].slot_name
					local inventory_extension = blackboard.inventory_extension
					local has_item = inventory_extension:get_slot_data(slot_name)
					local can_hold_more = inventory_extension:can_store_additional_item(slot_name)

					if has_item and not can_hold_more then
						blackboard.mule_pickup = nil
					else
						ASSIGNED_MULE_PICKUPS_TEMP[current_pickup] = true
						blackboard.mule_pickup_dist_squared = Vector3_distance_squared(POSITION_LOOKUP[unit], POSITION_LOOKUP[current_pickup])
					end
				end
			end
		end

		local side = side_manager:get_side(side_id)
		local PLAYER_UNITS = side.PLAYER_UNITS
		local num_human_players = #PLAYER_UNITS

		for slot_name, available_pickups in pairs(side_available_mule_pickups) do
			local num_items = 0

			for unit, valid_until in pairs(available_pickups) do
				if Unit_alive(unit) and t <= valid_until then
					num_items = num_items + 1
				else
					available_pickups[unit] = nil
				end
			end

			local num_players = 0

			for i = 1, num_human_players do
				if slot_name == "infinite_slot" then
					break
				end

				local player_unit = PLAYER_UNITS[i]

				if HEALTH_ALIVE[player_unit] then
					local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")
					local item = inventory_ext:get_slot_data(slot_name)

					if not item then
						local player_pos = POSITION_LOOKUP[player_unit]

						for pickup_unit, _ in pairs(available_pickups) do
							local pos = POSITION_LOOKUP[pickup_unit]

							if max_pickup_dist_sq > Vector3_distance_squared(pos, player_pos) then
								num_players = num_players + 1

								break
							end
						end
					end
				end
			end

			if num_players == 0 then
				for unit, data in pairs(side_bot_data) do
					local blackboard = data.blackboard
					local order = data.pickup_orders[slot_name]
					local inventory_extension = blackboard.inventory_extension
					local has_item = inventory_extension:get_slot_data(slot_name)
					local can_hold_more = inventory_extension:can_store_additional_item(slot_name)

					if not blackboard.mule_pickup and (not has_item or can_hold_more) and not order then
						local best_pickup_dist_sq = math.huge
						local best_pickup

						for pickup_unit, _ in pairs(available_pickups) do
							if not ASSIGNED_MULE_PICKUPS_TEMP[pickup_unit] then
								local pickup_pos = POSITION_LOOKUP[pickup_unit]
								local bot_pos = POSITION_LOOKUP[unit]
								local bot_dist_sq = Vector3_distance_squared(bot_pos, pickup_pos)
								local follow_dist_sq = Vector3_distance_squared(data.follow_position or bot_pos, pickup_pos)

								if follow_dist_sq < max_pickup_dist_sq and bot_dist_sq < best_pickup_dist_sq then
									best_pickup = pickup_unit
									best_pickup_dist_sq = bot_dist_sq
								end
							end
						end

						if best_pickup then
							blackboard.mule_pickup = best_pickup
							blackboard.mule_pickup_dist_squared = best_pickup_dist_sq
							ASSIGNED_MULE_PICKUPS_TEMP[best_pickup] = true
						end
					end
				end
			end
		end
	end
end

AIBotGroupSystem._update_health_pickups = function (self, dt, t)
	local Unit_alive = Unit.alive
	local Vector3_distance = Vector3.distance
	local Vector3_distance_squared = Vector3.distance_squared
	local side_manager = Managers.state.side
	local bot_ai_data = self._bot_ai_data
	local available_health_pickups = self._available_health_pickups

	for side_id = 1, #bot_ai_data do
		local available_pickups = available_health_pickups[side_id]
		local num_health_items = 0
		local num_aux_items = 0

		for unit, info in pairs(available_pickups) do
			if not Unit_alive(unit) or t > info.valid_until then
				available_pickups[unit] = nil
			elseif info.template.can_heal_self then
				num_health_items = num_health_items + 1
				HEALTH_ITEMS_TEMP[unit] = POSITION_LOOKUP[unit]
			else
				num_aux_items = num_aux_items + 1
				AUXILIARY_HEALTH_SLOT_ITEMS_TEMP[unit] = POSITION_LOOKUP[unit]
			end
		end

		table.clear(RESERVED_HEALTH_ITEMS_TEMP)

		local side_bot_data = bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			local reservation = data.pickup_orders.slot_healthkit

			if reservation then
				local pickup_unit = reservation.unit

				if not pickup_unit then
					-- Nothing
				elseif HEALTH_ITEMS_TEMP[pickup_unit] then
					num_health_items = num_health_items - 1
					HEALTH_ITEMS_TEMP[pickup_unit] = nil
				elseif AUXILIARY_HEALTH_SLOT_ITEMS_TEMP[pickup_unit] then
					num_aux_items = num_aux_items - 1
					AUXILIARY_HEALTH_SLOT_ITEMS_TEMP[pickup_unit] = nil
				end

				RESERVED_HEALTH_ITEMS_TEMP[bot_unit] = reservation
			end
		end

		local lowest_human_hp_percent = math.huge
		local side = side_manager:get_side(side_id)
		local PLAYER_UNITS = side.PLAYER_UNITS
		local num_human_players = #PLAYER_UNITS

		for i = 1, num_human_players do
			local player_unit = PLAYER_UNITS[i]

			if HEALTH_ALIVE[player_unit] then
				local inventory_ext = ScriptUnit.extension(player_unit, "inventory_system")
				local med_item = inventory_ext:get_slot_data("slot_healthkit")

				if not med_item and not RESERVED_HEALTH_ITEMS_TEMP[player_unit] then
					local closest_dist = math.huge
					local closest_item
					local pos = POSITION_LOOKUP[player_unit]

					if num_health_items > 0 then
						for unit, item_pos in pairs(HEALTH_ITEMS_TEMP) do
							local dist = Vector3_distance_squared(pos, item_pos)

							if dist < closest_dist then
								closest_dist = dist
								closest_item = unit
							end
						end

						num_health_items = num_health_items - 1
						HEALTH_ITEMS_TEMP[closest_item] = nil
					elseif num_aux_items > 0 then
						for unit, item_pos in pairs(AUXILIARY_HEALTH_SLOT_ITEMS_TEMP) do
							local dist = Vector3_distance_squared(pos, item_pos)

							if dist < closest_dist then
								closest_dist = dist
								closest_item = unit
							end
						end

						num_aux_items = num_aux_items - 1
						AUXILIARY_HEALTH_SLOT_ITEMS_TEMP[closest_item] = nil
					end
				end

				local status_ext = ScriptUnit.extension(player_unit, "status_system")

				if status_ext:is_knocked_down() or status_ext:is_wounded() then
					lowest_human_hp_percent = math.min(0, lowest_human_hp_percent)
				else
					local health_extension = ScriptUnit.extension(player_unit, "health_system")
					local health_percent = health_extension:current_health_percent()

					lowest_human_hp_percent = math.min(health_percent, lowest_human_hp_percent)
				end
			end
		end

		local num_valid_bots = 0
		local lowest_bot_health_procent = math.huge
		local lowest_hp_bot_has_item = false
		local lowest_hp_bot_blackboard

		for unit, data in pairs(side_bot_data) do
			local blackboard = BLACKBOARDS[unit]

			blackboard.allowed_to_take_health_pickup = false
			blackboard.force_use_health_pickup = false

			local inventory_ext = ScriptUnit.extension(unit, "inventory_system")
			local status_ext = data.status_extension
			local health_slot_data = inventory_ext:get_slot_data("slot_healthkit")
			local has_heal_item = health_slot_data and inventory_ext:get_item_template(health_slot_data).can_heal_self

			if RESERVED_HEALTH_ITEMS_TEMP[unit] and not has_heal_item then
				-- Nothing
			elseif not has_heal_item and HEALTH_ALIVE[unit] and not status_ext:is_ready_for_assisted_respawn() then
				num_valid_bots = num_valid_bots + 1
				BOT_UNITS[num_valid_bots] = unit
				BOT_BBS[num_valid_bots] = blackboard
				BOT_POSES[num_valid_bots] = POSITION_LOOKUP[unit]

				local health_extension = ScriptUnit.extension(unit, "health_system")
				local hp_percent = health_extension:current_health_percent()

				if status_ext:is_wounded() then
					hp_percent = hp_percent / 3
				end

				BOT_HEALTH[num_valid_bots] = hp_percent

				if hp_percent < lowest_bot_health_procent then
					lowest_bot_health_procent = hp_percent
					lowest_hp_bot_has_item = false
					lowest_hp_bot_blackboard = nil
				end

				BOT_INDICES[unit] = num_valid_bots
			elseif has_heal_item and HEALTH_ALIVE[unit] and not status_ext:is_ready_for_assisted_respawn() then
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local hp_percent = health_extension:current_health_percent()
				local buff_extension = ScriptUnit.extension(unit, "buff_system")
				local has_no_permanent_health_from_item_buff = buff_extension:has_buff_type("trait_necklace_no_healing_health_regen")
				local is_wounded = status_ext:is_wounded()

				if hp_percent < lowest_bot_health_procent and (not has_no_permanent_health_from_item_buff or is_wounded) then
					lowest_bot_health_procent = hp_percent
					lowest_hp_bot_has_item = true
					lowest_hp_bot_blackboard = blackboard
				end
			end
		end

		table.merge(HEALTH_ITEMS_TEMP_TEMP, HEALTH_ITEMS_TEMP)

		local more_items_than_players = num_valid_bots < num_health_items
		local allowed_empties = math.max(0, num_valid_bots - num_health_items)

		find_permutation(1, 0, SOLUTION_TEMP, math.huge, BEST_SOLUTION_TEMP, allowed_empties, HEALTH_ITEMS_TEMP_TEMP, HEALTH_ITEMS_TEMP, num_valid_bots)
		table.clear(BOT_HEALTH)

		for unit, data in pairs(side_bot_data) do
			local index = BOT_INDICES[unit]

			if index then
				local bb = BOT_BBS[index]
				local pickup = BEST_SOLUTION_TEMP[index]

				if pickup then
					bb.health_pickup = pickup

					local pickup_pos = POSITION_LOOKUP[pickup]
					local health_dist = Vector3_distance(BOT_POSES[index], pickup_pos)

					bb.health_dist = health_dist
					bb.health_pickup_valid_until = math.huge

					local follow_pos = data.follow_position
					local in_range = not follow_pos and health_dist < MAX_PICKUP_RANGE or follow_pos and Vector3_distance(follow_pos, pickup_pos) < MAX_PICKUP_RANGE

					if in_range then
						bb.allowed_to_take_health_pickup = true
					else
						bb.allowed_to_take_health_pickup = false
					end
				else
					bb.allowed_to_take_health_pickup = false
					bb.health_dist = nil
					bb.health_pickup_valid_until = nil
				end
			elseif RESERVED_HEALTH_ITEMS_TEMP[unit] and RESERVED_HEALTH_ITEMS_TEMP[unit].unit then
				local bb = BLACKBOARDS[unit]
				local pickup_unit = RESERVED_HEALTH_ITEMS_TEMP[unit].unit

				bb.health_pickup = pickup_unit
				bb.health_dist = Vector3_distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[pickup_unit])
				bb.health_pickup_valid_until = math.huge
				bb.allowed_to_take_health_pickup = true
			else
				local bb = BLACKBOARDS[unit]

				if bb.health_pickup then
					bb.health_pickup = nil
					bb.health_dist = nil
					bb.health_pickup_valid_until = nil
				end

				bb.allowed_to_take_health_pickup = false
			end
		end

		local current_index = 1

		for i = 1, num_valid_bots do
			local unit_i = BOT_UNITS[i]
			local inventory_ext = ScriptUnit.extension(unit_i, "inventory_system")
			local has_aux_item = inventory_ext:get_slot_data("slot_healthkit")
			local in_solution = BEST_SOLUTION_TEMP[i]

			if not in_solution and not has_aux_item then
				local unit = BOT_UNITS[i]

				BOT_UNITS[current_index] = unit
				BOT_BBS[current_index] = BOT_BBS[i]
				BOT_POSES[current_index] = BOT_POSES[i]
				BOT_INDICES[unit] = current_index
				current_index = current_index + 1
			else
				local unit = BOT_UNITS[i]

				BOT_INDICES[unit] = nil
			end
		end

		for i = current_index, num_valid_bots do
			BOT_UNITS[i] = nil
			BOT_BBS[i] = nil
			BOT_POSES[i] = nil
		end

		table.clear(HEALTH_ITEMS_TEMP_TEMP)
		table.clear(SOLUTION_TEMP)
		table.clear(BEST_SOLUTION_TEMP)

		num_valid_bots = current_index - 1

		if num_valid_bots > 0 then
			table.merge(HEALTH_ITEMS_TEMP_TEMP, AUXILIARY_HEALTH_SLOT_ITEMS_TEMP)

			local allowed_empties = math.max(0, num_valid_bots - num_aux_items)

			find_permutation(1, 0, SOLUTION_TEMP, math.huge, BEST_SOLUTION_TEMP, allowed_empties, HEALTH_ITEMS_TEMP_TEMP, AUXILIARY_HEALTH_SLOT_ITEMS_TEMP, num_valid_bots)

			for unit, data in pairs(side_bot_data) do
				local index = BOT_INDICES[unit]

				if index then
					local bb = BOT_BBS[index]
					local pickup = BEST_SOLUTION_TEMP[index]

					if pickup then
						bb.health_pickup = pickup

						local pickup_pos = POSITION_LOOKUP[pickup]
						local health_dist = Vector3_distance(BOT_POSES[index], pickup_pos)

						bb.health_dist = health_dist
						bb.health_pickup_valid_until = math.huge

						local follow_pos = data.follow_position
						local in_range = not follow_pos and health_dist < MAX_PICKUP_RANGE or follow_pos and Vector3_distance(follow_pos, pickup_pos) < MAX_PICKUP_RANGE

						if in_range then
							bb.allowed_to_take_health_pickup = true
						else
							bb.allowed_to_take_health_pickup = false
						end
					else
						bb.allowed_to_take_health_pickup = false
						bb.health_dist = nil
						bb.health_pickup_valid_until = nil
					end
				end
			end

			table.clear(HEALTH_ITEMS_TEMP_TEMP)
			table.clear(SOLUTION_TEMP)
			table.clear(BEST_SOLUTION_TEMP)
		end

		table.clear(BOT_BBS)
		table.clear(BOT_UNITS)
		table.clear(BOT_POSES)
		table.clear(BOT_INDICES)
		table.clear(HEALTH_ITEMS_TEMP)
		table.clear(AUXILIARY_HEALTH_SLOT_ITEMS_TEMP)

		local in_carry_event = self._in_carry_event[side_id]

		if not in_carry_event and more_items_than_players and lowest_hp_bot_has_item and lowest_bot_health_procent > 0 and lowest_human_hp_percent > math.min(lowest_bot_health_procent * 1.2, 1) then
			lowest_hp_bot_blackboard.force_use_health_pickup = true
		end
	end
end

AIBotGroupSystem._calculate_priority_target_utility = function (self, self_position, target, time, current_target)
	local stickyness_modifier = target == current_target and STICKYNESS_DISTANCE_MODIFIER or 0
	local distance = math.max(Vector3.distance(self_position, POSITION_LOOKUP[target]), 1)
	local proximity = 1 / (distance + stickyness_modifier)
	local duration = time

	return proximity + duration, distance
end

AIBotGroupSystem._update_first_person_debug = function (self)
	if not script_data.ai_bots_debug then
		return
	end

	if IS_WINDOWS then
		if Keyboard.pressed(Keyboard.button_index("numpad 1")) then
			self:first_person_debug(1)
		elseif Keyboard.pressed(Keyboard.button_index("numpad 2")) then
			self:first_person_debug(2)
		elseif Keyboard.pressed(Keyboard.button_index("numpad 3")) then
			self:first_person_debug(3)
		elseif Keyboard.pressed(Keyboard.button_index("numpad enter")) then
			self:first_person_debug(nil)
		end
	end
end

AIBotGroupSystem._update_weapon_debug = function (self)
	if not script_data.ai_bots_weapon_debug then
		return
	end

	local player_manager = Managers.player

	Debug.text("BOT RANGED WEAPON")

	for side_id = 1, #self._bot_ai_data do
		local side_bot_data = self._bot_ai_data[side_id]

		for unit, data in pairs(side_bot_data) do
			local blackboard = data.blackboard
			local inventory_extension = blackboard.inventory_extension
			local slot_data = inventory_extension:get_slot_data("slot_ranged")

			if slot_data then
				local player_bot = player_manager:owner(unit)
				local bot_name = player_bot:profile_display_name()
				local overcharge_extension = blackboard.overcharge_extension
				local current_ammo, max_ammo = inventory_extension:current_ammo_status("slot_ranged")
				local current_oc, threshold_oc, max_oc = overcharge_extension:current_overcharge_status()
				local item_template = inventory_extension:get_item_template(slot_data)
				local weapon_name = item_template.name
				local ammo_substring = current_ammo and string.format(" %d|%d", current_ammo, max_ammo) or ""
				local oc_substring = current_oc and string.format(" %02d|%d|%d", current_oc, threshold_oc, max_oc) or ""

				Debug.text("%-16s:%s%s [%s]", bot_name, ammo_substring, oc_substring, weapon_name)
			end
		end
	end
end

AIBotGroupSystem._update_order_debug = function (self)
	if not script_data.ai_bots_order_debug then
		return
	end

	local debug_colors = {
		slot_healthkit = Color(255, 0, 0),
		slot_potion = Color(0, 255, 0),
		slot_level_event = Color(0, 0, 255),
		slot_grenade = Color(0, 255, 255),
	}

	for side_id = 1, #self._bot_ai_data do
		local side_bot_data = self._bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			local orders = data.pickup_orders

			for slot_name, order_data in pairs(orders) do
				local unit = order_data.unit

				if unit then
					local pos = POSITION_LOOKUP[unit]
					local color = debug_colors[slot_name] or Color(Math.random() * 255, Math.random() * 255, Math.random() * 255)

					QuickDrawer:line(POSITION_LOOKUP[bot_unit], pos, color)
					QuickDrawer:sphere(pos, 0.25, color)
				end
			end
		end
	end

	if Keyboard.pressed(Keyboard.button_index("t")) then
		local ph_world = self._physics_world
		local local_player = Managers.player:local_player()
		local vp_name = local_player.viewport_name
		local vp = ScriptWorld.viewport(self._world, vp_name, true)
		local camera = ScriptViewport.camera(vp)
		local pos = ScriptCamera.position(camera)
		local rot = ScriptCamera.rotation(camera)
		local hit, _, _, _, actor = PhysicsWorld.immediate_raycast(ph_world, pos, Quaternion.forward(rot), 100, "closest", "collision_filter", "filter_pickups")

		if hit then
			local unit = Actor.unit(actor)
			local selected_bot

			for side_id = 1, #self._bot_ai_data do
				local side_bot_data = self._bot_ai_data[side_id]

				for bot_unit, _ in pairs(side_bot_data) do
					if HEALTH_ALIVE[bot_unit] then
						selected_bot = bot_unit

						if Math.random() < 0.3 then
							break
						end
					end
				end
			end

			if selected_bot then
				self:order("pickup", selected_bot, unit, local_player)
			end
		end
	end
end

AIBotGroupSystem._update_proximity_bot_breakables_debug = function (self)
	if not script_data.ai_bots_proximity_breakables_debug then
		return
	end

	for side_id = 1, #self._bot_ai_data do
		local side_bot_data = self._bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			if bot_unit == script_data.debug_unit then
				local previous_bot_breakables = data.previous_bot_breakables

				for unit, _ in pairs(previous_bot_breakables) do
					local node_name = "rp_center"
					local node = Unit.has_node(unit, node_name) and Unit.node(unit, node_name) or 0
					local node_position = Unit.world_position(unit, node)

					QuickDrawer:sphere(node_position, 0.25, Colors.get("yellow"))
				end
			end
		end
	end
end

AIBotGroupSystem._update_ally_needs_aid_priority = function (self)
	local unit_alive = Unit.alive
	local bot_ai_data_lookup = self._bot_ai_data_lookup

	for target_unit, bot_unit in pairs(self._ally_needs_aid_priority) do
		local reset_priority_aid = true

		if unit_alive(bot_unit) then
			local blackboard = bot_ai_data_lookup[bot_unit].blackboard

			reset_priority_aid = blackboard.target_ally_unit ~= target_unit or not blackboard.target_ally_needs_aid or not HEALTH_ALIVE[bot_unit]
		end

		if reset_priority_aid then
			self._ally_needs_aid_priority[target_unit] = nil
		end
	end
end

AIBotGroupSystem.first_person_debug = function (self, bot_number)
	if bot_number == self._debugging_bot then
		return
	end

	local local_player
	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		if not player.remote then
			local_player = player

			break
		end
	end

	local new_player

	if bot_number then
		new_player = Managers.player:local_player(bot_number + 1)
	else
		new_player = local_player
	end

	if not new_player then
		return
	end

	local new_unit = new_player.player_unit

	if not Unit.alive(new_unit) then
		return
	end

	local old_player

	if self._debugging_bot then
		old_player = Managers.player:local_player(self._debugging_bot + 1)
	else
		old_player = local_player
	end

	local old_unit = old_player.player_unit

	if not Unit.alive(old_unit) then
		return
	end

	local world = self._world

	if not Managers.state.camera:has_viewport(new_player.viewport_name) then
		Managers.state.entity:system("camera_system"):local_player_created(new_player)
	else
		for player, camera_unit in pairs(Managers.state.entity:system("camera_system").camera_units) do
			if player.viewport_name == new_player.viewport_name then
				if player ~= new_player then
					local camera_extension = ScriptUnit.extension(camera_unit, "camera_system")

					camera_extension.player = new_player
				end

				break
			end
		end
	end

	ScriptWorld.activate_viewport(world, ScriptWorld.viewport(world, new_player.viewport_name))
	ScriptWorld.deactivate_viewport(world, ScriptWorld.viewport(world, old_player.viewport_name))
	ScriptUnit.extension(new_unit, "first_person_system"):debug_set_first_person_mode(new_player ~= local_player, true)
	ScriptUnit.extension(old_unit, "first_person_system"):debug_set_first_person_mode(old_player == local_player, false)

	self._debugging_bot = bot_number
end

AIBotGroupSystem.ranged_attack_started = function (self, attacker_unit, victim_unit, attack_type)
	if DamageUtils.is_player_unit(victim_unit) then
		local proximity_extension = ScriptUnit.extension(attacker_unit, "proximity_system")

		proximity_extension.has_been_seen = true

		local bot_ai_data = self._bot_ai_data

		for side_id = 1, #bot_ai_data do
			local side_bot_data = bot_ai_data[side_id]

			for unit, _ in pairs(side_bot_data) do
				local ai_ext = ScriptUnit.extension(unit, "ai_system")

				ai_ext:ranged_attack_started(attacker_unit, victim_unit, attack_type)
			end
		end

		fassert(self._urgent_targets[attacker_unit] ~= math.huge, "Attacker unit %s is already attacking another victim! max one victim at a time allowed, otherwise we need to add ref counting", attacker_unit)

		self._urgent_targets[attacker_unit] = math.huge
	end
end

local OPPORTUNITY_TARGET_COOLDOWN = 30

AIBotGroupSystem.ranged_attack_ended = function (self, attacker_unit, victim_unit, attack_type, optional_cooldown)
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for unit, _ in pairs(side_bot_data) do
			local ai_ext = ScriptUnit.extension(unit, "ai_system")

			ai_ext:ranged_attack_ended(attacker_unit, victim_unit, attack_type)
		end
	end

	self._urgent_targets[attacker_unit] = self._t + (optional_cooldown or OPPORTUNITY_TARGET_COOLDOWN)
end

local OPPORTUNITY_TARGET_TELEPORT_DETECTION_DISTANCE = 7
local OPPORTUNITY_TARGET_TELEPORT_DETECTION_DISTANCE_SQ = OPPORTUNITY_TARGET_TELEPORT_DETECTION_DISTANCE^2

AIBotGroupSystem.enemy_teleported = function (self, enemy_unit, teleport_position)
	local proximity_extension = ScriptUnit.extension(enemy_unit, "proximity_system")

	proximity_extension.has_been_seen = false

	local physics_world = self._physics_world
	local enemy_side = Managers.state.side.side_by_unit[enemy_unit]
	local player_and_bot_units = enemy_side.ENEMY_PLAYER_AND_BOT_UNITS
	local bot_ai_data_lookup = self._bot_ai_data_lookup

	for i = 1, #player_and_bot_units do
		local player_unit = player_and_bot_units[i]

		if bot_ai_data_lookup[player_unit] then
			local position = POSITION_LOOKUP[player_unit]
			local distance_squared = Vector3.distance_squared(position, teleport_position)

			if distance_squared < OPPORTUNITY_TARGET_TELEPORT_DETECTION_DISTANCE_SQ and PerceptionUtils.raycast_spine_to_spine(player_unit, enemy_unit, physics_world) then
				proximity_extension.has_been_seen = true

				break
			end
		end
	end
end

local ALLY_AID_PRIORITY_STICKINESS_DISTANCE = 3

AIBotGroupSystem.register_ally_needs_aid_priority = function (self, bot_unit, target_unit)
	local aider_unit = self._ally_needs_aid_priority[target_unit]
	local set_new_aider = true

	if aider_unit then
		local bot_ai_data_lookup = self._bot_ai_data_lookup
		local current_aider_bb = bot_ai_data_lookup[aider_unit].blackboard
		local new_aider_bb = bot_ai_data_lookup[bot_unit].blackboard
		local current_aider_dist = current_aider_bb.ally_distance
		local new_aider_dist = new_aider_bb.ally_distance

		set_new_aider = current_aider_dist > new_aider_dist + ALLY_AID_PRIORITY_STICKINESS_DISTANCE
	end

	if set_new_aider then
		self._ally_needs_aid_priority[target_unit] = bot_unit
	end
end

AIBotGroupSystem.is_prioritized_ally = function (self, bot_unit, target_unit)
	return self._ally_needs_aid_priority[target_unit] == bot_unit
end

local BROADPHASE_RESULTS = {}

AIBotGroupSystem._update_proximity_bot_breakables = function (self, t)
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local nav_graph_system = Managers.state.entity:system("nav_graph_system")
	local bot_breakables_broadphase = self._bot_breakables_broadphase
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for bot_unit, data in pairs(side_bot_data) do
			local bot_position = POSITION_LOOKUP[bot_unit]
			local num_hits = Broadphase.query(bot_breakables_broadphase, bot_position, 2, BROADPHASE_RESULTS)
			local current_bot_breakables = data.current_bot_breakables
			local previous_bot_breakables = data.previous_bot_breakables
			local navigation_extension = ScriptUnit.extension(bot_unit, "ai_navigation_system")

			for i = 1, num_hits do
				local unit = BROADPHASE_RESULTS[i]

				if HEALTH_ALIVE[unit] then
					current_bot_breakables[unit] = unit

					if previous_bot_breakables[unit] then
						previous_bot_breakables[unit] = nil
					else
						local smart_object_id = nav_graph_system:get_smart_object_id(unit)
						local smart_objects = nav_graph_system:get_smart_objects(smart_object_id)
						local smart_object_data = smart_objects[1]
						local entrance_position = Vector3Aux.unbox(smart_object_data.pos1)
						local entrance_position_on_mesh = LocomotionUtils.pos_on_mesh(nav_world, entrance_position, 1.5, 3)
						local exit_position = Vector3Aux.unbox(smart_object_data.pos2)
						local exit_position_on_mesh = LocomotionUtils.pos_on_mesh(nav_world, exit_position, 1.5, 3)
						local smart_object_type = smart_object_data.smart_object_type

						if entrance_position_on_mesh and exit_position_on_mesh then
							navigation_extension:add_transition(unit, smart_object_type, entrance_position_on_mesh, exit_position_on_mesh)
						end
					end
				end
			end

			for unit, _ in pairs(previous_bot_breakables) do
				navigation_extension:remove_transition(unit)

				previous_bot_breakables[unit] = nil
			end

			fassert(table.is_empty(previous_bot_breakables), "Error! previous_bot_breakables table was not cleared!")

			data.current_bot_breakables = previous_bot_breakables
			data.previous_bot_breakables = current_bot_breakables
		end
	end
end

AIBotGroupSystem.set_in_cover = function (self, bot_unit, cover_unit)
	self._used_covers[bot_unit] = cover_unit
end

AIBotGroupSystem.in_cover = function (self, cover_unit)
	for bot_unit, cover in pairs(self._used_covers) do
		if cover == cover_unit then
			return bot_unit
		end
	end

	return nil
end

local EPSILON = 0.01

local function detect_cylinder(nav_world, traverse_logic, bot_position, bot_height, bot_radius, x, y, z, rotation, size)
	local bot_x = bot_position.x
	local bot_y = bot_position.y
	local bot_z = bot_position.z
	local offset_x = bot_x - x
	local offset_y = bot_y - y
	local flat_dist_from_center = math.sqrt(offset_x * offset_x + offset_y * offset_y)
	local radius = math.max(size.x, size.y)
	local half_height = size.z

	if flat_dist_from_center <= radius + bot_radius and bot_z > z - bot_height - half_height and bot_z < z + half_height then
		local escape_dist = radius - flat_dist_from_center
		local escape_dir

		if flat_dist_from_center < EPSILON then
			escape_dir = Vector3(0, 1, 0)
		else
			escape_dir = Vector3(offset_x / flat_dist_from_center, offset_y / flat_dist_from_center, 0)
		end

		local to = bot_position + escape_dir * escape_dist
		local above, below = 2, 2
		local success, z = GwNavQueries.triangle_from_position(nav_world, to, above, below)

		if not success then
			return
		end

		to.z = z
		success = GwNavQueries.raycango(nav_world, bot_position, to, traverse_logic)

		if success then
			return to
		end
	end
end

local function detect_sphere(nav_world, traverse_logic, bot_position, bot_height, bot_radius, sphere_x, sphere_y, sphere_z, rotation, sphere_radius)
	local bot_x = bot_position.x
	local bot_y = bot_position.y
	local bot_z = bot_position.z
	local offset_x = bot_x - sphere_x
	local offset_y = bot_y - sphere_y
	local flat_dist_from_center = math.sqrt(offset_x * offset_x + offset_y * offset_y)

	if flat_dist_from_center > sphere_radius + bot_radius then
		return
	elseif bot_z < sphere_z + sphere_radius and bot_z > sphere_z - bot_height - sphere_radius then
		local escape_dist = sphere_radius - flat_dist_from_center
		local escape_dir

		if flat_dist_from_center < EPSILON then
			escape_dir = Vector3(0, 1, 0)
		else
			escape_dir = Vector3(offset_x / flat_dist_from_center, offset_y / flat_dist_from_center, 0)
		end

		local to = bot_position + escape_dir * escape_dist
		local above, below = 2, 2
		local success, z = GwNavQueries.triangle_from_position(nav_world, to, above, below)

		if not success then
			return
		end

		to.z = z
		success = GwNavQueries.raycango(nav_world, bot_position, to, traverse_logic)

		if success then
			return to
		end
	end
end

local function detect_oobb(nav_world, traverse_logic, bot_position, bot_height, bot_radius, x, y, z, rotation, extents)
	local half_bot_height = bot_height * 0.5
	local offset = bot_position - Vector3(x, y, z - half_bot_height)
	local right_vector = Quaternion.right(rotation)
	local x_offset = Vector3.dot(right_vector, offset)
	local y_offset = Vector3.dot(Quaternion.forward(rotation), offset)
	local z_offset = Vector3.dot(Quaternion.up(rotation), offset)
	local extents_x = extents.x + bot_radius
	local extents_y = extents.y + bot_radius
	local extents_z = extents.z + half_bot_height

	if extents_x < x_offset or x_offset < -extents_x or extents_y < y_offset or y_offset < -extents_y or extents_z < z_offset or z_offset < -extents_z then
		return
	end

	local area_damage_system = Managers.state.entity:system("area_damage_system")
	local above, below = 2, 2
	local sign = x_offset == 0 and 1 - math.random(0, 1) * 2 or math.sign(x_offset)
	local stop_at
	local right_offset = x_offset * right_vector
	local right_extent = (bot_radius + extents_x) * right_vector

	for i = 1, 2 do
		local to = bot_position - right_offset + sign * right_extent
		local on_nav_mesh, z = GwNavQueries.triangle_from_position(nav_world, to, above, below)

		if on_nav_mesh then
			to.z = z
		end

		local raycango = on_nav_mesh and GwNavQueries.raycango(nav_world, bot_position, to, traverse_logic)

		if raycango then
			local in_liquid = area_damage_system:is_position_in_liquid(to, BotNavTransitionManager.NAV_COST_MAP_LAYERS)

			if not in_liquid or stop_at == nil then
				stop_at = to

				if not in_liquid then
					break
				end
			end
		end

		sign = -sign
	end

	return stop_at
end

AIBotGroupSystem.aoe_threat_created = function (self, position, shape, size, rotation, duration)
	local bot_radius = 1.25
	local bot_height = 1.8
	local t = Managers.time:time("game")
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local traverse_logic = Managers.state.bot_nav_transition:traverse_logic()
	local detect_func

	if shape == "oobb" then
		detect_func = detect_oobb
	elseif shape == "cylinder" then
		detect_func = detect_cylinder
	elseif shape == "sphere" then
		detect_func = detect_sphere
	end

	local pos_x, pos_y, pos_z = position.x, position.y, position.z
	local bot_ai_data = self._bot_ai_data

	for side_id = 1, #bot_ai_data do
		local side_bot_data = bot_ai_data[side_id]

		for unit, data in pairs(side_bot_data) do
			local threat_data = data.aoe_threat
			local expires = t + duration

			if expires > threat_data.expires then
				local escape_to = detect_func(nav_world, traverse_logic, POSITION_LOOKUP[unit], bot_height, bot_radius, pos_x, pos_y, pos_z, rotation, size)

				if escape_to then
					threat_data.expires = expires

					threat_data.escape_to:store(escape_to)
				end
			end
		end
	end
end

local MESSAGES = {
	abort_pickup_assigned_to_other = {
		default = {
			"bot_command_generic_abort_pickup_assigned_to_other_01",
		},
	},
	acknowledge_pickup = {
		default = {
			"bot_command_generic_acknowledge_pickup_01",
		},
	},
	acknowledge_ammo = {
		default = {
			"bot_command_generic_acknowledge_ammo_01",
		},
	},
	has_full_ammo = {
		default = {
			"bot_command_generic_has_full_ammo_01",
		},
	},
	already_picking_up = {
		default = {
			"bot_command_generic_already_picking_up_01",
		},
	},
	already_have_item = {
		default = {
			"bot_command_generic_already_have_item_01",
		},
	},
	acknowledge_drop = {
		default = {
			"bot_command_generic_acknowledge_drop_01",
		},
	},
}

AIBotGroupSystem._chat_message = function (self, unit, ordering_player, message, ...)
	local player = Managers.player:owner(unit)
	local character = SPProfiles[player:profile_index()].display_name
	local msg_table = MESSAGES[message]
	local chr_table = msg_table[character] or msg_table.default
	local message_string = chr_table[Math.random(1, #chr_table)]
	local localize, localize_parameters = true, true
	local localization_parameters = FrameTable.alloc_table()

	table.append_varargs(localization_parameters, ...)

	local channel_id, message_target = 1
	local mechanism = Managers.mechanism:game_mechanism()

	if mechanism.get_chat_channel then
		local peer_id = ordering_player:network_id()

		channel_id, message_target = mechanism:get_chat_channel(peer_id, false)
	end

	Managers.chat:send_chat_message(channel_id, player:local_player_id(), message_string, localize, localization_parameters, localize_parameters, nil, message_target)
end
