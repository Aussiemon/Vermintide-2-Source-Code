require("scripts/unit_extensions/human/ai_player_unit/ai_brain")

local unit_alive = Unit.alive
local BLACKBOARDS = BLACKBOARDS
local PROXIMITY_CHECK_RANGE = 5
local PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID = 4.5
local PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID_REVIVING = 1.5
local PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID_SUPPORT = 15
local STICKYNESS_DISTANCE_MODIFIER = -0.2
local FOLLOW_TIMER_LOWER_BOUND = 1
local FOLLOW_TIMER_UPPER_BOUND = 1.5
local ENEMY_PATH_FAILED_REPATH_THRESHOLD = 9
local ENEMY_PATH_FAILED_REPATH_VERTICAL_THRESHOLD = 0.8
local ALLY_PATH_FAILED_REPATH_THRESHOLD = 0.25
local FLAT_MOVE_TO_EPSILON = BotConstants.default.FLAT_MOVE_TO_EPSILON
local FLAT_MOVE_TO_EPSILON_SQ = FLAT_MOVE_TO_EPSILON^2
local FLAT_MOVE_TO_PREVIOUS_POS_EPSILON = BotConstants.default.FLAT_MOVE_TO_PREVIOUS_POS_EPSILON
local FLAT_MOVE_TO_PREVIOUS_POS_EPSILON_SQ = FLAT_MOVE_TO_PREVIOUS_POS_EPSILON^2
local Z_MOVE_TO_EPSILON = BotConstants.default.Z_MOVE_TO_EPSILON
local HOLD_POSITION_MAX_ALLOWED_Z = 0.5
local SELF_HEAL_STICKINESS = 0.1
local PLAYER_HEAL_STICKYBESS = 0.11
local WANTS_TO_HEAL_THRESHOLD = 0.25
local WANTS_TO_GIVE_HEAL_TO_OTHER = 0.6
local INTERESTED_IN_BEING_HEALED_THRESHOLD = 0.8
local VORTEX_ESCAPE_DISTANCE = 10
local VORTEX_ESCAPE_STICKINESS_WEIGHT = 0.75
local VORTEX_ESCAPE_RE_EVALUATE_DISTANCE_SQ = 1
local VORTEX_ESCAPE_RE_EVALUATE_REACHED_DISTANCE_SQ = 0.01
local SELF_UNIT = nil

local function dprint(...)
	if SELF_UNIT == script_data.debug_unit and script_data.ai_bots_debug then
		print(...)
	end
end

local function dtext(...)
	if SELF_UNIT == script_data.debug_unit and script_data.ai_bots_debug then
		Debug.text(...)
	end
end

PlayerBotBase = class(PlayerBotBase)

local function find_max_weight(data)
	local num_entries = #data
	local max_weight = -math.huge

	for i = 1, num_entries do
		local entry = data[i]
		local weight = entry.weight

		if max_weight < weight then
			max_weight = weight
		end
	end

	return max_weight
end

PlayerBotBase.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self._world = world
	self._unit = unit
	self._nav_world = extension_init_data.nav_world
	self._enemy_broadphase = Managers.state.entity:system("ai_system").broadphase
	local override_box = Vector3Box(Vector3(0, 0, 0))
	override_box.value_stored = false
	self.is_bot = true
	self._t = 0
	self._blackboard = {
		target_ally_needs_aid = false,
		using_navigation_destination_override = false,
		is_passive = true,
		re_evaluate_detection = Math.random() * 0.5,
		world = world,
		unit = unit,
		level = LevelHelper:current_level(extension_init_context.world),
		move_orders = {},
		nav_world = self._nav_world,
		node_data = {},
		running_nodes = {},
		proximite_enemies = {},
		follow = {
			needs_target_position_refresh = true,
			follow_timer = math.lerp(FOLLOW_TIMER_LOWER_BOUND, FOLLOW_TIMER_UPPER_BOUND, Math.random()),
			target_position = Vector3Box(POSITION_LOOKUP[unit])
		},
		target_ally_aid_destination = Vector3Box(),
		navigation_destination_override = override_box,
		navigation_liquid_escape_destination_override = Vector3Box(),
		navigation_vortex_escape_destination_override = Vector3Box(),
		navigation_vortex_escape_previous_evaluation_position = Vector3Box(),
		activate_ability_data = {
			is_using_ability = false,
			aim_position = Vector3Box()
		},
		hit_by_projectile = {},
		proximity_target_distance = math.huge,
		urgent_target_distance = math.huge,
		opportunity_target_distance = math.huge,
		taking_cover = {
			fails = 0,
			threats = {},
			active_threats = {},
			cover_position = Vector3Box(Vector3.invalid_vector()),
			failed_cover_points = {}
		}
	}
	local up = Vector3.up()
	local vortex_escape_directions = {
		{
			weight = 0.5,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 4 / 8)))
		},
		{
			weight = 0.75,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 3 / 8)))
		},
		{
			weight = 1,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 2 / 8)))
		},
		{
			weight = 0.7,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, -math.pi * 1 / 8)))
		},
		{
			weight = 0.6,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 0 / 8)))
		},
		{
			weight = 0.7,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 1 / 8)))
		},
		{
			weight = 1,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 2 / 8)))
		},
		{
			weight = 0.75,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 3 / 8)))
		},
		{
			weight = 0.5,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, math.pi * 4 / 8)))
		}
	}
	self._vortex_escape_directions = vortex_escape_directions
	local largest_vortex_weight = find_max_weight(vortex_escape_directions)
	self._vortex_largest_weighted_distance_sq = largest_vortex_weight * VORTEX_ESCAPE_DISTANCE^2
	self._bot_profile = extension_init_data.bot_profile
	self._player = extension_init_data.player

	Unit.set_data(unit, "bot", self._bot_profile)
	Managers.player:assign_unit_ownership(unit, self._player, true)
	Unit.set_flow_variable(unit, "is_bot", true)
	Unit.flow_event(unit, "character_vo_set")
	self:_init_brain()

	self._proximity_target_update_timer = -math.huge
	self._pickup_search_timer = -math.huge
	self._search_for_pickups_near_ally = false
	self._interactable_timer = -math.huge
	self._stay_near_player = false
	self._stay_near_player_range = math.huge
	self._attempted_enemy_paths = {}
	self._attempted_ally_paths = {}
	self._seen_by_players = {}
	self._last_health_pickup_attempt = {
		blacklist = false,
		distance = 0,
		index = 1,
		path_failed = false,
		rotation = QuaternionBox(),
		path_position = Vector3Box()
	}
	self._last_mule_pickup_attempt = {
		blacklist = false,
		distance = 0,
		index = 1,
		path_failed = false,
		rotation = QuaternionBox(),
		path_position = Vector3Box()
	}
end

PlayerBotBase.ranged_attack_started = function (self, attacking_unit, victim_unit, attack_type)
	local blackboard = self._blackboard

	if attack_type == "ratling_gun_fire" then
		local targets = blackboard.taking_cover.threats
		targets[attacking_unit] = victim_unit
	end
end

PlayerBotBase.ranged_attack_ended = function (self, attacking_unit, victim_unit, attack_type)
	local blackboard = self._blackboard

	if attack_type == "ratling_gun_fire" then
		local targets = blackboard.taking_cover.threats
		targets[attacking_unit] = nil
	end
end

PlayerBotBase.hit_by_projectile = function (self, attacking_unit)
	local blackboard = self._blackboard
	blackboard.hit_by_projectile[attacking_unit] = self._t
end

local DEFAULT_STAY_NEAR_PLAYER_RANGE = 5

PlayerBotBase.set_stay_near_player = function (self, stay_near_player, max_range)
	if stay_near_player then
		self._stay_near_player_range = max_range or DEFAULT_STAY_NEAR_PLAYER_RANGE
	else
		self._stay_near_player_range = math.huge
	end

	self._stay_near_player = stay_near_player
end

PlayerBotBase.should_stay_near_player = function (self)
	return self._stay_near_player, self._stay_near_player_range
end

PlayerBotBase.set_seen_by_player = function (self, seen, player_unit, t)
	local seen_by_players = self._seen_by_players

	if seen then
		seen_by_players[player_unit] = t
	else
		seen_by_players[player_unit] = nil
	end
end

PlayerBotBase.extensions_ready = function (self, world, unit)
	local blackboard = self._blackboard
	local input_ext = ScriptUnit.extension(unit, "input_system")
	local inventory_ext = ScriptUnit.extension(unit, "inventory_system")
	local overcharge_ext = ScriptUnit.extension(unit, "overcharge_system")
	local nav_ext = ScriptUnit.extension(unit, "ai_navigation_system")
	local first_person_ext = ScriptUnit.extension(unit, "first_person_system")
	local status_ext = ScriptUnit.extension(unit, "status_system")
	local interaction_ext = ScriptUnit.extension(unit, "interactor_system")
	local health_ext = ScriptUnit.extension(unit, "health_system")
	local ai_bot_group_ext = ScriptUnit.extension(unit, "ai_bot_group_system")
	local ai_ext = ScriptUnit.extension(unit, "ai_system")
	local locomotion_ext = ScriptUnit.extension(unit, "locomotion_system")
	local career_extension = ScriptUnit.extension(unit, "career_system")
	self._health_extension = health_ext
	self._status_extension = status_ext
	self._locomotion_extension = locomotion_ext
	self._navigation_extension = nav_ext
	blackboard.input_extension = input_ext
	blackboard.inventory_extension = inventory_ext
	blackboard.overcharge_extension = overcharge_ext
	blackboard.navigation_extension = nav_ext
	blackboard.locomotion_extension = locomotion_ext
	blackboard.first_person_extension = first_person_ext
	blackboard.status_extension = status_ext
	blackboard.interaction_extension = interaction_ext
	blackboard.health_extension = health_ext
	blackboard.ai_bot_group_extension = ai_bot_group_ext
	blackboard.ai_extension = ai_ext
	blackboard.career_extension = career_extension
	blackboard.side = Managers.state.side.side_by_unit[unit]
end

PlayerBotBase._init_brain = function (self)
	self._brain = AIBrain:new(self._world, self._unit, self._blackboard, self._bot_profile, self._bot_profile.behavior)
end

PlayerBotBase.brain = function (self)
	return self._brain
end

PlayerBotBase.profile = function (self)
	return self._bot_profile
end

PlayerBotBase.blackboard = function (self)
	return self._blackboard
end

PlayerBotBase.update = function (self, unit, input, dt, context, t)
	self._t = t
	local health_extension = self._health_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local is_alive = health_extension:is_alive()
	local is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
	local is_linked_movement = locomotion_extension:is_linked_movement()

	if is_alive and not is_ready_for_assisted_respawn and not is_linked_movement then
		SELF_UNIT = unit

		self:_update_blackboard(dt, t)
		self:_update_target_enemy(dt, t)
		self:_update_target_ally(dt, t)
		self:_update_liquid_escape()
		self:_update_vortex_escape()
		self:_update_pickups(dt, t)
		self:_update_interactables(dt, t)
		self:_update_weapon_loadout_data()
		self:_update_best_weapon()
		self._brain:update(unit, t, dt)

		local moving_platform = locomotion_extension:get_moving_platform()
		local is_disabled = status_extension:is_disabled()

		if is_disabled or moving_platform then
			self._navigation_extension:teleport(POSITION_LOOKUP[unit])
		elseif locomotion_extension:is_on_ground() then
			self:_update_movement_target(dt, t)
		end

		self:_update_attack_request(t)
	end
end

PlayerBotBase._update_blackboard = function (self, dt, t)
	local bb = self._blackboard
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	bb.is_knocked_down = status_extension:is_knocked_down()
	bb.is_grabbed_by_pack_master = status_extension:is_grabbed_by_pack_master()
	bb.is_pounced_down = status_extension:is_pounced_down()
	bb.is_hanging_from_hook = status_extension:is_hanging_from_hook()
	bb.is_ledge_hanging = status_extension:get_is_ledge_hanging()
	bb.is_transported = status_extension:is_using_transport() or locomotion_extension:get_moving_platform()
	bb.is_grabbed_by_chaos_spawn = status_extension:is_grabbed_by_chaos_spawn()
	local unit = self._unit
	local target_unit = bb.target_unit

	if ALIVE[target_unit] then
		bb.target_dist = Vector3.distance(POSITION_LOOKUP[target_unit], POSITION_LOOKUP[unit])
	else
		bb.target_dist = math.huge
		bb.target_unit = nil
	end

	for _, action_data in pairs(bb.utility_actions) do
		action_data.time_since_last = t - action_data.last_time
	end
end

PlayerBotBase._update_target_enemy = function (self, dt, t)
	local pos = POSITION_LOOKUP[self._unit]

	self:_update_slot_target(dt, t, pos)
	self:_update_proximity_target(dt, t, pos)

	local bb = self._blackboard
	local old_target = bb.target_unit
	local slot_enemy = bb.slot_target_enemy
	local prox_enemy = bb.proximity_target_enemy
	local priority_enemy = bb.priority_target_enemy
	local urgent_enemy = bb.urgent_target_enemy
	local opportunity_enemy = bb.opportunity_target_enemy
	local prox_enemy_dist = bb.proximity_target_distance + (prox_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER or 0)
	local prio_enemy_dist = bb.priority_target_distance + (priority_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER or 0)
	local urgent_enemy_dist = bb.urgent_target_distance + (urgent_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER or 0)
	local opp_enemy_dist = bb.opportunity_target_distance + (opportunity_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER or 0)
	local slot_enemy_dist = slot_enemy and Vector3.length(POSITION_LOOKUP[slot_enemy] - pos) + (slot_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER or 0)

	if priority_enemy and prio_enemy_dist < 3 then
		bb.target_unit = priority_enemy
	elseif urgent_enemy and urgent_enemy_dist < 3 then
		bb.target_unit = urgent_enemy
	elseif opportunity_enemy and opp_enemy_dist < 3 then
		bb.target_unit = opportunity_enemy
	elseif slot_enemy and slot_enemy_dist < 3 then
		bb.target_unit = slot_enemy
	elseif prox_enemy and prox_enemy_dist < 2 then
		bb.target_unit = prox_enemy
	elseif prox_enemy and bb.proximity_target_is_player and prox_enemy_dist < 10 then
		bb.target_unit = prox_enemy
	elseif priority_enemy then
		bb.target_unit = priority_enemy
	elseif urgent_enemy then
		bb.target_unit = urgent_enemy
	elseif opportunity_enemy then
		bb.target_unit = opportunity_enemy
	elseif slot_enemy then
		bb.target_unit = slot_enemy
	elseif bb.target_unit then
		bb.target_unit = nil
	end
end

local BROADPHASE_QUERY_TEMP = {}

PlayerBotBase._update_proximity_target = function (self, dt, t, self_position)
	local blackboard = self._blackboard

	if self._proximity_target_update_timer < t then
		local self_unit = self._unit
		self._proximity_target_update_timer = t + 0.25 + Math.random() * 0.15
		local prox_enemies = blackboard.proximite_enemies

		table.clear(prox_enemies)

		local check_range = PROXIMITY_CHECK_RANGE
		blackboard.aggressive_mode = false
		blackboard.force_aid = false
		local search_position = nil

		if ALIVE[blackboard.target_ally_unit] and blackboard.target_ally_needs_aid and self:within_aid_range(blackboard) then
			search_position = POSITION_LOOKUP[blackboard.target_ally_unit]
			local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
			local is_prioritized = ai_bot_group_system:is_prioritized_ally(self_unit, blackboard.target_ally_unit)
			local is_reviving = blackboard.current_interaction_unit == blackboard.target_ally_unit

			if is_prioritized and is_reviving then
				check_range = PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID_REVIVING
				blackboard.force_aid = true
			elseif is_prioritized then
				check_range = PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID
				blackboard.force_aid = true
			else
				blackboard.aggressive_mode = true
				check_range = PROXIMITY_CHECK_RANGE_ALLY_NEEDS_AID_SUPPORT
			end
		else
			search_position = self_position
		end

		local num_hits = Broadphase.query(self._enemy_broadphase, search_position, check_range, BROADPHASE_QUERY_TEMP)
		local closest_dist = math.huge
		local closest_enemy = nil
		local closest_real_dist = math.huge
		local side = blackboard.side

		for PLAYER_UNIT, _ in pairs(side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS) do
			num_hits = num_hits + 1
			BROADPHASE_QUERY_TEMP[num_hits] = PLAYER_UNIT
		end

		local index = 1

		for i = 1, num_hits do
			local unit = BROADPHASE_QUERY_TEMP[i]
			local health_ext = ScriptUnit.extension(unit, "health_system")

			if health_ext:is_alive() then
				local enemy_pos = POSITION_LOOKUP[unit]
				local enemy_offset = enemy_pos - search_position

				if self:_target_valid(unit, enemy_offset) then
					prox_enemies[index] = unit
					index = index + 1
					local enemy_real_dist = Vector3.length(enemy_offset)
					local enemy_dist = enemy_real_dist + (unit == blackboard.target_unit and STICKYNESS_DISTANCE_MODIFIER or 0)

					if closest_dist > enemy_dist then
						closest_enemy = unit
						closest_dist = enemy_dist
						closest_real_dist = enemy_real_dist
					end
				end
			end
		end

		if blackboard.proximity_target_enemy or closest_enemy then
			blackboard.proximity_target_enemy = closest_enemy
			blackboard.proximity_target_is_player = side.VALID_ENEMY_TARGETS_PLAYERS_AND_BOTS[closest_enemy] ~= nil
		end

		blackboard.proximity_target_distance = closest_real_dist
	elseif blackboard.proximity_target_enemy and not ALIVE[blackboard.proximity_target_enemy] then
		blackboard.proximity_target_enemy = nil
		blackboard.proximity_target_distance = math.huge
		blackboard.proximity_target_is_player = nil
	end
end

local PROXIMITY_UP_DOWN_THRESHOLD = math.sin(math.pi * 0.25)

PlayerBotBase._target_valid = function (self, unit, enemy_offset)
	local blackboard = BLACKBOARDS[unit]

	if not blackboard or blackboard.breed.not_bot_target then
		return false
	end

	if ScriptUnit.has_extension(unit, "ai_group_system") and not blackboard.target_unit then
		return false
	end

	local up_dot_product = Vector3.dot(Vector3.up(), Vector3.normalize(enemy_offset))

	if PROXIMITY_UP_DOWN_THRESHOLD < up_dot_product or up_dot_product < -PROXIMITY_UP_DOWN_THRESHOLD then
		return false
	end

	return true
end

PlayerBotBase._update_slot_target = function (self, dt, t, self_position)
	local bb = self._blackboard
	local unit = self._unit
	local current_target = bb.target_unit
	local pos = self_position
	local enemy_targetting_self = self:_get_closest_target_in_slot(pos, unit, current_target, true)

	if enemy_targetting_self then
		bb.slot_target_enemy = enemy_targetting_self

		return
	end

	local ally_unit = bb.target_ally_unit

	if ALIVE[ally_unit] then
		local enemy_targetting_ally = self:_get_closest_target_in_slot(pos, ally_unit, current_target)

		if enemy_targetting_ally then
			bb.slot_target_enemy = enemy_targetting_ally

			return
		end
	end

	local side = Managers.state.side.side_by_unit[unit]
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local best_target = nil
	local best_dist = math.huge

	for k = 1, #player_and_bot_units do
		local player_unit = player_and_bot_units[k]

		if player_unit ~= ally_unit and player_unit ~= unit then
			local target, dist = self:_get_closest_target_in_slot(pos, player_unit, current_target)

			if dist < best_dist then
				best_target = target
				best_dist = dist
			end
		end
	end

	if best_target then
		bb.slot_target_enemy = best_target

		return
	end

	if bb.slot_target_enemy then
		bb.slot_target_enemy = nil
	end
end

local BOT_THREAT_MODIFIER = -1
local SLOT_TYPES = table.keys(SlotTypeSettings)

PlayerBotBase._get_closest_target_in_slot = function (self, position, unit, current_enemy_unit, is_self)
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	local best_target = nil
	local target_dist = math.huge

	for i = 1, #SLOT_TYPES do
		local slot_type = SLOT_TYPES[i]
		local slot_data = ai_slot_system:get_target_unit_slot_data(unit, slot_type)

		if slot_data then
			for slot_index, slot in pairs(slot_data) do
				local enemy_unit = slot.ai_unit

				if ALIVE[enemy_unit] and ScriptUnit.extension(enemy_unit, "health_system"):is_alive() then
					local dist = Vector3.length(POSITION_LOOKUP[enemy_unit] - position)

					if enemy_unit == current_enemy_unit then
						dist = dist + STICKYNESS_DISTANCE_MODIFIER
					end

					if is_self then
						local breed = Unit.get_data(enemy_unit, "breed")

						if breed.is_bot_threat then
							dist = dist + BOT_THREAT_MODIFIER
						end
					end

					if target_dist > dist then
						best_target = enemy_unit
						target_dist = dist
					end
				end
			end
		end
	end

	return best_target, target_dist
end

PlayerBotBase._alter_target_position = function (self, nav_world, self_position, target_unit, target_position, reason)
	local wanted_position, should_stop = nil

	if reason == "ledge" then
		local rotation = Unit.local_rotation(target_unit, 0)
		local forward_vector_flat = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
		wanted_position = target_position - forward_vector_flat * 0.5
	elseif reason == "in_need_of_heal" or reason == "can_accept_grenade" or reason == "can_accept_potion" or reason == "can_accept_heal_item" then
		local target_locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")
		local target_average_velocity = target_locomotion_extension:average_velocity()

		if Vector3.length_squared(target_average_velocity) > 2.25 then
			wanted_position = target_position + target_average_velocity
		else
			wanted_position = target_position + Vector3.normalize(self_position - target_position)
		end
	elseif reason == "knocked_down" and self._blackboard.aggressive_mode then
		wanted_position = target_position + Vector3.normalize(self_position - target_position)
	elseif reason == "in_need_of_attention_stop" then
		wanted_position = Vector3(self_position.x, self_position.y, self_position.z)
		should_stop = true
	else
		wanted_position = Vector3(target_position.x, target_position.y, target_position.z)
	end

	if should_stop then
		return wanted_position, should_stop
	end

	local above = 0.5
	local below = 3
	local success, z = GwNavQueries.triangle_from_position(nav_world, wanted_position, above, below)

	if success then
		wanted_position.z = z

		return wanted_position
	else
		local horizontal = 2
		local pos = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, above, below, horizontal, 0.1)

		if pos then
			return pos
		else
			return target_position
		end
	end
end

PlayerBotBase._find_target_position_on_nav_mesh = function (self, nav_world, wanted_position)
	local above = 0.5
	local below = 0.5
	local success, z = GwNavQueries.triangle_from_position(nav_world, wanted_position, above, below)

	if success then
		return Vector3(wanted_position.x, wanted_position.y, z)
	else
		local horizontal = 2.5
		local pos = GwNavQueries.inside_position_from_outside_position(nav_world, wanted_position, above, below, horizontal, 0.1)

		if pos then
			return pos
		else
			return wanted_position
		end
	end
end

PlayerBotBase._update_target_ally = function (self, dt, t)
	local unit = self._unit
	local blackboard = self._blackboard
	local breed = self._bot_profile
	local best_ally, ally_dist, in_need_type, look_at_ally = nil

	if blackboard.target_unit and blackboard.target_unit == blackboard.priority_target_enemy then
		best_ally = blackboard.priority_target_disabled_ally
		ally_dist = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[best_ally])
	else
		best_ally, ally_dist, in_need_type, look_at_ally = self:_select_ally_by_utility(unit, blackboard, breed, t)
	end

	blackboard.target_ally_unit = best_ally or nil
	blackboard.ally_distance = ally_dist

	if blackboard.target_ally_unit and in_need_type then
		if not blackboard.target_ally_needs_aid and in_need_type ~= "in_need_of_attention_look" then
			local follow_bb = blackboard.follow

			if follow_bb then
				follow_bb.needs_target_position_refresh = true
			end
		end

		blackboard.target_ally_needs_aid = true
		blackboard.target_ally_need_type = in_need_type
	elseif blackboard.target_ally_needs_aid then
		blackboard.target_ally_needs_aid = false
		blackboard.target_ally_need_type = nil
	end

	local input_extension = blackboard.input_extension

	if look_at_ally then
		input_extension:set_look_at_player(best_ally, false)
	else
		input_extension:set_look_at_player(nil)
	end

	local is_priority_aid_type = blackboard.target_ally_need_type == "knocked_down" or blackboard.target_ally_need_type == "ledge" or blackboard.target_ally_need_type == "hook"

	if blackboard.target_ally_needs_aid and is_priority_aid_type then
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

		ai_bot_group_system:register_ally_needs_aid_priority(unit, blackboard.target_ally_unit)
	end
end

local MIN_HEADING_TOWARDS_US_DOT = math.degrees_to_radians(30)
local ATTENTION_SAFE_TO_STOP_DISTANCE = 3.5

PlayerBotBase._player_needs_attention = function (self, self_unit, player_unit, blackboard, player_inventory_extension, player_locomotion_extension, t)
	local start_time = self._seen_by_players[player_unit]
	local player_wielded_slot = player_inventory_extension:equipment().wielded_slot
	local player_slot_data = player_inventory_extension:get_slot_data(player_wielded_slot)

	if not start_time or blackboard.target_unit or player_slot_data == nil then
		return false, 0
	end

	local status_extension = blackboard.status_extension
	local is_wounded = status_extension:is_wounded()
	local health_extension = blackboard.health_extension
	local health_percent = health_extension:current_permanent_health_percent()
	local item_template = player_inventory_extension:get_item_template(player_slot_data)
	local can_heal_other = item_template.can_heal_other
	local can_give_other = item_template.can_give_other
	local inventory_extension = blackboard.inventory_extension
	local slot_is_empty = not inventory_extension:get_slot_data(player_wielded_slot)
	local can_receive_item = can_give_other and slot_is_empty
	local interested_in_heal = can_heal_other and (is_wounded or health_percent < INTERESTED_IN_BEING_HEALED_THRESHOLD)
	local self_position = POSITION_LOOKUP[self_unit]
	local player_position = POSITION_LOOKUP[player_unit]
	local player_to_self = self_position - player_position
	local player_to_self_direction = Vector3.normalize(player_to_self)
	local player_velocity = player_locomotion_extension:current_velocity()
	local player_velocity_normalized = Vector3.normalize(player_velocity)
	local player_speed_sq = Vector3.length_squared(player_velocity)
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local velocity_normalized = Vector3.normalize(velocity)
	local speed_sq = Vector3.length_squared(velocity)
	local player_direction_dot = Vector3.dot(player_to_self_direction, player_velocity_normalized)
	local is_heading_towards_us = MIN_HEADING_TOWARDS_US_DOT < player_direction_dot
	local is_heading_towards_player = nil

	if speed_sq > 0.01 then
		local bot_direction_dot = Vector3.dot(player_to_self_direction, velocity_normalized)
		is_heading_towards_player = bot_direction_dot <= MIN_HEADING_TOWARDS_US_DOT
	else
		is_heading_towards_player = false
	end

	local look_threshold, stop_threshold = nil
	local safe_stop_distance = ATTENTION_SAFE_TO_STOP_DISTANCE

	if is_heading_towards_us and player_wielded_slot == "slot_healthkit" and (interested_in_heal or can_receive_item) then
		local health_term = (1 - health_percent) * 0.2
		stop_threshold = 0.5 - health_term
		look_threshold = 0.25
		safe_stop_distance = safe_stop_distance + math.sqrt(player_speed_sq)
	else
		local smallest_speed_sq = math.min(speed_sq, player_speed_sq)

		if smallest_speed_sq > 0.01 or is_heading_towards_player then
			stop_threshold = math.huge
			look_threshold = 0.5
		elseif speed_sq <= 0.01 and player_speed_sq <= 0.01 then
			stop_threshold = 0.3
			look_threshold = 0.25
		else
			stop_threshold = 1.25
			look_threshold = 0.5
		end
	end

	local player_to_self_length_squared = Vector3.length_squared(player_to_self)

	if player_to_self_length_squared > safe_stop_distance^2 or player_to_self_length_squared <= 0.25 then
		stop_threshold = math.huge
	end

	local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
	local has_ammo_pickup_order = ai_bot_group_system:get_ammo_pickup_order_unit(self_unit) ~= nil
	local has_pickup_order = has_ammo_pickup_order or ai_bot_group_system:has_pending_pickup_order(self_unit)
	local current_seen_time = t - start_time

	if stop_threshold < current_seen_time and not has_pickup_order then
		local extra_utility = math.clamp(current_seen_time, 0, 2)

		return "stop", extra_utility
	elseif look_threshold < current_seen_time then
		local extra_utility = math.clamp(current_seen_time, 0, 0.5)

		return "look_at", extra_utility
	end
end

PlayerBotBase._calculate_healing_item_utility = function (self, permanent_health_percent, is_wounded, is_quick_use)
	if is_quick_use then
		return 1 - (is_wounded and permanent_health_percent - 0.5 or permanent_health_percent)
	else
		return 1 - (is_wounded and permanent_health_percent * 0.33 or permanent_health_percent)
	end
end

PlayerBotBase._select_ally_by_utility = function (self, unit, blackboard, breed, t)
	local self_pos = POSITION_LOOKUP[unit]
	local closest_ally = nil
	local closest_dist = math.huge
	local closest_real_dist = math.huge
	local closest_in_need_type = nil
	local closest_ally_look_at = false
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local inventory_extension = blackboard.inventory_extension
	local health_slot_data = inventory_extension:get_slot_data("slot_healthkit")
	local can_heal_other = false
	local can_give_healing_to_other = false
	local self_health_utiliy = 0

	if health_slot_data then
		local self_wounded = self._status_extension:is_wounded()
		local template = inventory_extension:get_item_template(health_slot_data)
		local has_no_permanent_health_from_item_buff = buff_extension:has_buff_type("trait_necklace_no_healing_health_regen")
		can_heal_other = template.can_heal_other
		can_give_healing_to_other = template.can_give_other

		if not has_no_permanent_health_from_item_buff or self_wounded then
			local self_permanent_health_percent = self._health_extension:current_permanent_health_percent()
			self_health_utiliy = self:_calculate_healing_item_utility(self_permanent_health_percent, self_wounded, can_give_healing_to_other) + SELF_HEAL_STICKINESS
		end
	end

	local can_give_grenade_to_other = false
	local grenade_slot_data = inventory_extension:get_slot_data("slot_grenade")

	if grenade_slot_data then
		local template = inventory_extension:get_item_template(grenade_slot_data)
		can_give_grenade_to_other = template.can_give_other
	end

	local can_give_potion_to_other = false
	local potion_slot_data = inventory_extension:get_slot_data("slot_potion")

	if potion_slot_data then
		local template = inventory_extension:get_item_template(potion_slot_data)
		can_give_potion_to_other = template.can_give_other
	end

	local conflict_director = Managers.state.conflict
	local self_segment = conflict_director:get_player_unit_segment(unit) or 1
	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check
	local side = Managers.state.side.side_by_unit[unit]
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

	for k = 1, #player_and_bot_units do
		local player_unit = player_and_bot_units[k]

		if player_unit ~= unit and AiUtils.unit_alive(player_unit) then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")
			local utility = 0
			local look_at_ally = false

			if not status_ext:is_ready_for_assisted_respawn() and not status_ext.near_vortex and (disable_bot_main_path_teleport_check or self_segment <= (conflict_director:get_player_unit_segment(player_unit) or 1)) then
				local player = Managers.player:owner(player_unit)
				local is_bot = not player:is_player_controlled()
				local heal_player_preference = is_bot and 0 or PLAYER_HEAL_STICKYBESS
				local in_need_type = nil

				if status_ext:is_knocked_down() then
					in_need_type = "knocked_down"
					utility = 100
				elseif status_ext:get_is_ledge_hanging() and not status_ext:is_pulled_up() then
					in_need_type = "ledge"
					utility = 100
				elseif status_ext:is_hanging_from_hook() then
					in_need_type = "hook"
					utility = 100
				else
					local health_percent = ScriptUnit.extension(player_unit, "health_system"):current_permanent_health_percent()
					local has_no_permanent_health_from_item_buff = ScriptUnit.extension(player_unit, "buff_system"):has_buff_type("trait_necklace_no_healing_health_regen")
					local player_inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
					local player_locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")
					local is_wounded = status_ext:is_wounded()
					local health_utility = self:_calculate_healing_item_utility(health_percent, is_wounded, can_give_healing_to_other) + heal_player_preference
					local heal_other_allowed = self_health_utiliy < health_utility
					local need_attention_type, extra_utility = self:_player_needs_attention(unit, player_unit, blackboard, player_inventory_extension, player_locomotion_extension, t)

					if can_heal_other and (health_percent < WANTS_TO_HEAL_THRESHOLD or is_wounded) and heal_other_allowed then
						in_need_type = "in_need_of_heal"
						utility = 70 + health_utility * 15
					elseif can_give_healing_to_other and (not has_no_permanent_health_from_item_buff or is_wounded) and (health_percent < WANTS_TO_GIVE_HEAL_TO_OTHER or is_wounded) and not player_inventory_extension:get_slot_data("slot_healthkit") and heal_other_allowed then
						in_need_type = "can_accept_heal_item"
						utility = 70 + health_utility * 10
					elseif can_give_grenade_to_other and (not player_inventory_extension:get_slot_data("slot_grenade") or player_inventory_extension:can_store_additional_item("slot_grenade")) and not is_bot then
						in_need_type = "can_accept_grenade"
						utility = 70
					elseif can_give_potion_to_other and not player_inventory_extension:get_slot_data("slot_potion") and not is_bot then
						in_need_type = "can_accept_potion"
						utility = 70
					elseif need_attention_type == "stop" then
						in_need_type = "in_need_of_attention_stop"
						look_at_ally = true
						utility = 5 + extra_utility
					elseif need_attention_type == "look_at" then
						in_need_type = "in_need_of_attention_look"
						look_at_ally = true
						utility = 2 + extra_utility
					end
				end

				if in_need_type or not is_bot then
					local target_pos = POSITION_LOOKUP[player_unit]
					local allowed_follow_path, allowed_aid_path = self:_ally_path_allowed(unit, player_unit, t)

					if allowed_follow_path then
						if not allowed_aid_path then
							in_need_type = nil
						elseif in_need_type then
							local alive_bosses = conflict_director:alive_bosses()
							local num_alive_bosses = #alive_bosses

							for i = 1, num_alive_bosses do
								local boss_unit = alive_bosses[i]
								local boss_position = POSITION_LOOKUP[boss_unit]
								local self_to_boss_distance_sq = Vector3.distance_squared(self_pos, boss_position)
								local boss_bb = BLACKBOARDS[boss_unit]
								local boss_target = boss_bb.override_target_unit or boss_bb.target_unit

								if boss_target == unit and self_to_boss_distance_sq < 10 then
									in_need_type = nil
									utility = 0

									break
								end
							end
						end

						if not is_bot then
							utility = utility * 1.25
						end

						if in_need_type or not is_bot then
							local real_dist = Vector3.distance(self_pos, target_pos)
							local dist = real_dist - utility

							if closest_dist > dist then
								closest_dist = dist
								closest_real_dist = real_dist
								closest_ally = player_unit
								closest_in_need_type = in_need_type
								closest_ally_look_at = look_at_ally
							end
						end
					end
				end
			end
		end
	end

	return closest_ally, closest_real_dist, closest_in_need_type, closest_ally_look_at
end

PlayerBotBase.within_aid_range = function (self, blackboard)
	if blackboard.target_ally_needs_aid then
		local self_pos = POSITION_LOOKUP[self._unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_ally_unit]
		local distance_squared = Vector3.distance_squared(self_pos, target_pos)

		if distance_squared <= PROXIMITY_CHECK_RANGE^2 then
			return true
		end
	end

	return false
end

PlayerBotBase._update_liquid_escape = function (self)
	local unit = self._unit
	local blackboard = self._blackboard
	local status_extension = self._status_extension
	local in_liquid = status_extension:is_in_liquid()
	local use_liquid_escape_destination = blackboard.use_liquid_escape_destination
	local navigation_extension = blackboard.navigation_extension
	local is_disabled = status_extension:is_disabled()

	if in_liquid and not is_disabled and (not use_liquid_escape_destination or navigation_extension:destination_reached()) then
		local liquid_unit = status_extension.in_liquid_unit
		local liquid_extension = ScriptUnit.extension(liquid_unit, "area_damage_system")
		local rim_nodes, is_array = liquid_extension:get_rim_nodes()
		local bot_position = POSITION_LOOKUP[unit]
		local best_distance_sq = math.huge
		local best_position = nil

		if is_array then
			local num_nodes = #rim_nodes

			for i = 1, num_nodes do
				local position = rim_nodes[i]:unbox()
				local distance_sq = Vector3.distance_squared(bot_position, position)

				if distance_sq < best_distance_sq then
					best_position = position
					best_distance_sq = distance_sq
				end
			end
		else
			for _, node in pairs(rim_nodes) do
				local position = node.position:unbox()
				local distance_sq = Vector3.distance_squared(bot_position, position)

				if distance_sq < best_distance_sq then
					best_position = position
					best_distance_sq = distance_sq
				end
			end
		end

		if best_position then
			blackboard.navigation_liquid_escape_destination_override:store(best_position)

			blackboard.use_liquid_escape_destination = true
		end
	elseif use_liquid_escape_destination and (is_disabled or not in_liquid) then
		blackboard.use_liquid_escape_destination = false
	end
end

PlayerBotBase._should_re_evaluate_vortex_escape = function (self, current_position, previous_check_position, navigation_extension, vortex_unit)
	local re_evaluate_destination = false
	local escape_completed = nil

	if ALIVE[vortex_unit] then
		local vortex_extension = ScriptUnit.extension(vortex_unit, "ai_supplementary_system")
		escape_completed = not vortex_extension:is_position_inside(current_position, VORTEX_ESCAPE_DISTANCE)
	else
		escape_completed = true
	end

	if not escape_completed then
		local traversed_distance_sq = Vector3.distance_squared(previous_check_position, current_position)
		local destination_reached = navigation_extension:destination_reached()
		re_evaluate_destination = VORTEX_ESCAPE_RE_EVALUATE_DISTANCE_SQ <= traversed_distance_sq or destination_reached and VORTEX_ESCAPE_RE_EVALUATE_REACHED_DISTANCE_SQ <= traversed_distance_sq
	end

	return re_evaluate_destination, escape_completed
end

PlayerBotBase._find_vortex_escape_destination = function (self, start_position, rotation, nav_world, traverse_logic, best_weighted_distance_sq, largest_weighted_distance_sq)
	local best_weight, best_destination = nil
	local vortex_escape_directions = self._vortex_escape_directions
	local num_directions = #vortex_escape_directions

	for i = 1, num_directions do
		local escape_data = vortex_escape_directions[i]
		local base_weight = escape_data.weight
		local base_weight_sq = base_weight^2
		local direction = Quaternion.rotate(rotation, escape_data.direction:unbox())
		local _, last_valid_position = GwNavQueries.raycast(nav_world, start_position, start_position + direction * VORTEX_ESCAPE_DISTANCE, traverse_logic)
		local distance_sq = Vector3.distance_squared(start_position, last_valid_position)
		local weighted_distance_sq = distance_sq * base_weight_sq

		if best_weighted_distance_sq < weighted_distance_sq then
			best_weight = base_weight
			best_weighted_distance_sq = weighted_distance_sq
			best_destination = last_valid_position

			if largest_weighted_distance_sq <= weighted_distance_sq + 0.0001 then
				break
			end
		end
	end

	return best_destination, best_weight, best_weighted_distance_sq
end

PlayerBotBase._update_vortex_escape = function (self)
	local unit = self._unit
	local blackboard = self._blackboard
	local self_position = POSITION_LOOKUP[unit]
	local status_extension = self._status_extension
	local near_vortex = status_extension.near_vortex
	local use_vortex_escape_destination = blackboard.use_vortex_escape_destination
	local navigation_extension = blackboard.navigation_extension
	local is_disabled = status_extension:is_disabled()
	local re_evaluate_destination = false
	local escape_completed = false

	if use_vortex_escape_destination then
		local current_vortex_escape_unit = blackboard.vortex_escape_unit
		local previous_check_position = blackboard.navigation_vortex_escape_previous_evaluation_position:unbox()
		re_evaluate_destination, escape_completed = self:_should_re_evaluate_vortex_escape(self_position, previous_check_position, navigation_extension, current_vortex_escape_unit)
	end

	if not is_disabled and (re_evaluate_destination or near_vortex and not use_vortex_escape_destination) then
		blackboard.navigation_vortex_escape_previous_evaluation_position:store(self_position)

		local locomotion_extension = self._locomotion_extension
		local nav_world = blackboard.nav_world

		if locomotion_extension:is_on_ground() and GwNavQueries.triangle_from_position(nav_world, self_position, 0.25, 0.25) then
			local best_weighted_distance_sq = -math.huge
			local largest_weighted_distance_sq = self._vortex_largest_weighted_distance_sq

			if re_evaluate_destination then
				local current_escape_destination = blackboard.navigation_vortex_escape_destination_override:unbox()
				local current_escape_weight = blackboard.navigation_vortex_escape_weight + VORTEX_ESCAPE_STICKINESS_WEIGHT
				local current_escape_weight_sq = current_escape_weight^2
				best_weighted_distance_sq = Vector3.distance_squared(self_position, current_escape_destination) * current_escape_weight_sq

				if largest_weighted_distance_sq <= best_weighted_distance_sq then
					return
				end
			end

			local vortex_unit = status_extension.near_vortex_unit or blackboard.vortex_escape_unit
			local vortex_position = POSITION_LOOKUP[vortex_unit]
			local to_bot = self_position - vortex_position
			local to_bot_rotation = Quaternion.look(to_bot, Vector3.up())
			local traverse_logic = navigation_extension:traverse_logic()
			local best_destination, best_weight, _ = self:_find_vortex_escape_destination(self_position, to_bot_rotation, nav_world, traverse_logic, best_weighted_distance_sq, largest_weighted_distance_sq)

			if best_destination then
				blackboard.use_vortex_escape_destination = true

				blackboard.navigation_vortex_escape_destination_override:store(best_destination)

				blackboard.navigation_vortex_escape_weight = best_weight
				blackboard.vortex_escape_unit = vortex_unit
			end
		end
	elseif use_vortex_escape_destination and (is_disabled or escape_completed or not near_vortex and navigation_extension:destination_reached()) then
		blackboard.use_vortex_escape_destination = false
		blackboard.vortex_escape_unit = nil
	end
end

PlayerBotBase._update_attack_request = function (self, t)
	local blackboard = self._blackboard
	local weapon_extension = AiUtils.get_bot_weapon_extension(blackboard)

	if weapon_extension then
		weapon_extension:update_bot_attack_request(t)
	end
end

PlayerBotBase._update_pickups = function (self, dt, t)
	local unit = self._unit
	local blackboard = self._blackboard
	blackboard.needs_ammo = false
	blackboard.has_ammo_missing = false
	local target_unit = blackboard.priority_target_enemy or blackboard.target_unit
	local has_target = ALIVE[target_unit]
	local ammo_percentage = has_target and 0.1 or 0.9
	local inventory_extension = blackboard.inventory_extension
	local current, num_max = inventory_extension:current_ammo_status("slot_ranged")

	if current and current < num_max then
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
		local has_ammo_pickup_order = ai_bot_group_system:get_ammo_pickup_order_unit(unit) ~= nil
		blackboard.needs_ammo = has_ammo_pickup_order or ammo_percentage > current / num_max
		blackboard.has_ammo_missing = current ~= num_max
	end
end

local INTERACTABLES_BROADPHASE_QUERY_RESULTS = {}

PlayerBotBase._update_interactables = function (self, dt, t)
	local blackboard = self._blackboard

	if self._interactable_timer < t then
		self._interactable_timer = t + 0.2 + Math.random() * 0.15
		local door_ext = blackboard.interaction_unit and ScriptUnit.has_extension(blackboard.interaction_unit, "door_system")

		if door_ext and blackboard.interaction_unit ~= blackboard.target_ally_unit then
			blackboard.interaction_unit = nil
			blackboard.interaction_type = nil
		end

		local navigation_extension = blackboard.navigation_extension

		if navigation_extension:destination_reached() then
			return
		end

		local self_pos = POSITION_LOOKUP[self._unit]
		local num_doors = Managers.state.entity:system("door_system"):get_doors(self_pos, 1.5, INTERACTABLES_BROADPHASE_QUERY_RESULTS)
		local best_unit = nil
		local best_dist = math.huge
		local best_interaction_type = nil

		for i = 1, num_doors do
			local hit_unit = INTERACTABLES_BROADPHASE_QUERY_RESULTS[i]

			if ScriptUnit.has_extension(hit_unit, "interactable_system") and not ScriptUnit.extension(hit_unit, "door_system"):is_open() then
				local pos = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
				local dist = Vector3.distance_squared(self_pos, pos)

				if dist < best_dist then
					best_dist = dist
					best_unit = hit_unit
					best_interaction_type = "door"
				end
			end
		end

		if best_unit then
			blackboard.interaction_unit = best_unit
			blackboard.interaction_type = best_interaction_type
		end
	elseif unit_alive(blackboard.interaction_unit) then
		local door_ext = ScriptUnit.has_extension(blackboard.interaction_unit, "door_system")

		if door_ext and door_ext:is_open() then
			blackboard.interaction_unit = nil
			blackboard.interaction_type = nil
		end
	elseif blackboard.interaction_unit then
		blackboard.interaction_unit = nil
		blackboard.interaction_type = nil
	end
end

local AVOID_POINTS_TEMP_TABLE = {}

PlayerBotBase._find_cover = function (self, take_cover_targets, self_pos, max_radius, allow_forward_distance)
	local offset_vector = Vector3.zero()

	for unit, _ in pairs(take_cover_targets) do
		local unit_pos = POSITION_LOOKUP[unit]
		AVOID_POINTS_TEMP_TABLE[#AVOID_POINTS_TEMP_TABLE + 1] = unit_pos
		local offset = Vector3.flat(self_pos - unit_pos)
		local normalized_offset = Vector3.normalize(offset)
		offset_vector = offset_vector + normalized_offset
		allow_forward_distance = math.min(allow_forward_distance, 0.5 * Vector3.length(offset))
	end

	local search_pos = self_pos + (max_radius - allow_forward_distance) * offset_vector
	local num_found, hidden_cover_units = ConflictUtils.hidden_cover_points(search_pos, AVOID_POINTS_TEMP_TABLE, 0, max_radius, -0.9)

	table.clear(AVOID_POINTS_TEMP_TABLE)

	return num_found, hidden_cover_units
end

local TAKE_COVER_TEMP_TABLE = {}

local function line_of_fire_check(from, to, p, width, length)
	local diff = p - from
	local dir = Vector3.normalize(to - from)
	local lateral_dist = Vector3.dot(diff, dir)

	if lateral_dist <= 0 or length < lateral_dist then
		return false
	end

	local direct_dist = Vector3.length(diff - lateral_dist * dir)

	if math.min(lateral_dist, width) < direct_dist then
		return false
	else
		return true
	end
end

PlayerBotBase._in_line_of_fire = function (self, self_unit, self_pos, take_cover_targets, taking_cover_from)
	local changed = false
	local in_line_of_fire = false
	local width = 2.5
	local sticky_width = 6
	local length = 40

	for attacker, victim in pairs(take_cover_targets) do
		local already_in_cover_from = taking_cover_from[attacker]

		if ALIVE[victim] and (victim == self_unit or line_of_fire_check(POSITION_LOOKUP[attacker], POSITION_LOOKUP[victim], self_pos, already_in_cover_from and sticky_width or width, length)) then
			TAKE_COVER_TEMP_TABLE[attacker] = victim
			changed = changed or not already_in_cover_from
			in_line_of_fire = true
		end
	end

	for attacker, victim in pairs(taking_cover_from) do
		if not TAKE_COVER_TEMP_TABLE[attacker] then
			changed = true

			break
		end
	end

	table.clear(taking_cover_from)

	for attacker, victim in pairs(TAKE_COVER_TEMP_TABLE) do
		taking_cover_from[attacker] = victim
	end

	table.clear(TAKE_COVER_TEMP_TABLE)

	return in_line_of_fire, changed
end

function to_hash(vector3)
	return vector3.x + vector3.y * 10000 + vector3.z * 0.0001
end

PlayerBotBase.cb_cover_point_path_result = function (self, hash, success, destination)
	if not success then
		local cover_bb = self._blackboard.taking_cover
		cover_bb.failed_cover_points[hash] = true

		table.clear(cover_bb.active_threats)
	end
end

PlayerBotBase._update_cover = function (self, unit, self_pos, blackboard, cover_bb, follow_bb)
	local cover_position = nil
	local in_line_of_fire, changed = self:_in_line_of_fire(unit, self_pos, cover_bb.threats, cover_bb.active_threats)
	local bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	if in_line_of_fire and changed then
		local fails = cover_bb.fails
		local radius = math.min(5 + fails * 5, 40)
		local allowed_forward_dist = radius * 0.4
		local num_found, hidden_cover_units = self:_find_cover(cover_bb.active_threats, self_pos, radius, allowed_forward_dist)
		local found_point, found_unit, occupied_cover_unit, occupied_cover_point = nil

		for i = 1, num_found do
			local cover_unit = hidden_cover_units[i]
			local pos = Unit.local_position(cover_unit, 0)

			if not cover_bb.failed_cover_points[to_hash(pos)] then
				if bot_group_system:in_cover(cover_unit) then
					occupied_cover_point = occupied_cover_point or pos
					occupied_cover_unit = occupied_cover_unit or cover_unit
				else
					found_point = pos
					found_unit = cover_unit

					break
				end
			end
		end

		found_point = found_point or occupied_cover_point
		found_unit = found_unit or occupied_cover_unit

		if found_point then
			cover_position = found_point

			cover_bb.cover_position:store(cover_position)

			cover_bb.cover_unit = found_unit
			cover_bb.fails = 0

			bot_group_system:set_in_cover(unit, found_unit)
		else
			cover_bb.fails = cover_bb.fails + 1

			table.clear(cover_bb.active_threats)
		end
	elseif not in_line_of_fire and changed then
		cover_bb.cover_position:store(Vector3.invalid_vector())

		cover_bb.cover_unit = nil
		cover_bb.fails = 0
		follow_bb.needs_target_position_refresh = true

		bot_group_system:set_in_cover(unit, nil)
	elseif in_line_of_fire then
		cover_position = cover_bb.cover_position:unbox()
	end

	local obstruction_bb = blackboard.ranged_obstruction_by_static
	local obstruction_unit = obstruction_bb and obstruction_bb.unit

	if cover_bb.active_threats[obstruction_unit] then
		blackboard.ranged_obstruction_by_static = nil
	end

	return cover_position
end

PlayerBotBase.new_destination_distance_check = function (self, self_position, previous_destination, new_destination, navigation_extension)
	local destination_offset = new_destination - previous_destination
	local destination_offset_ok = Z_MOVE_TO_EPSILON < math.abs(destination_offset.z) or FLAT_MOVE_TO_EPSILON_SQ < Vector3.length_squared(Vector3.flat(destination_offset))

	if navigation_extension:destination_reached() then
		local position_when_destination_reached = navigation_extension:position_when_destination_reached()
		local previous_pos_offset = self_position - position_when_destination_reached
		local previous_pos_offset_ok = Z_MOVE_TO_EPSILON < math.abs(previous_pos_offset.z) or FLAT_MOVE_TO_PREVIOUS_POS_EPSILON_SQ < Vector3.length_squared(Vector3.flat(previous_pos_offset))
		local new_destination_offset = new_destination - self_position
		local new_destination_offset_ok = Z_MOVE_TO_EPSILON < math.abs(new_destination_offset.z) or FLAT_MOVE_TO_EPSILON_SQ < Vector3.length_squared(Vector3.flat(new_destination_offset))

		return (previous_pos_offset_ok or destination_offset_ok) and new_destination_offset_ok
	else
		return destination_offset_ok
	end
end

local VORTEX_SAFE_PATH_CHECK_DISTANCE = 15
local MIN_ALLOWED_VORTEX_DISTANCE = 2

PlayerBotBase._update_movement_target = function (self, dt, t)
	local unit = self._unit
	local self_pos = POSITION_LOOKUP[unit]
	local blackboard = self._blackboard
	local override_box = blackboard.navigation_destination_override
	local override_melee = blackboard.melee and blackboard.melee.engage_position_set and override_box:unbox()
	local override_ranged = blackboard.shoot and blackboard.shoot.disengage_position_set and override_box:unbox()
	local override_ability = blackboard.activate_ability_data and blackboard.activate_ability_data.move_to_position_set and override_box:unbox()
	local override_liquid_escape = blackboard.use_liquid_escape_destination and blackboard.navigation_liquid_escape_destination_override:unbox()
	local override_vortex_escape = blackboard.use_vortex_escape_destination and blackboard.navigation_vortex_escape_destination_override:unbox()
	local moving_towards_follow_position = false
	local follow_bb = blackboard.follow
	local cover_bb = blackboard.taking_cover
	local cover_position = self:_update_cover(unit, self_pos, blackboard, cover_bb, follow_bb)
	local transport_unit_override = nil
	local nav_world = self._nav_world
	local target_ally_unit = blackboard.target_ally_unit
	local target_ally_need_type = blackboard.target_ally_need_type
	local target_ally_has_moved_from_start_position = true

	if ALIVE[target_ally_unit] then
		local ally_status_extension = ScriptUnit.extension(target_ally_unit, "status_system")
		local transport_unit = ally_status_extension:get_inside_transport_unit()

		if unit_alive(transport_unit) and not blackboard.target_ally_needs_aid then
			blackboard.ally_inside_transport_unit = transport_unit
			local transportation_ext = ScriptUnit.extension(blackboard.ally_inside_transport_unit, "transportation_system")
			local has_valid_transportation_unit = transportation_ext.story_state == "stopped_beginning"

			if has_valid_transportation_unit then
				transport_unit_override = LocomotionUtils.new_goal_in_transport(nav_world, unit, target_ally_unit)
			end
		elseif blackboard.ally_inside_transport_unit then
			blackboard.ally_inside_transport_unit = nil
		elseif not target_ally_need_type or target_ally_need_type == "in_need_of_attention_stop" or target_ally_need_type == "in_need_of_attention_look" then
			local ally_locomotion_extension = ScriptUnit.extension(target_ally_unit, "locomotion_system")
			target_ally_has_moved_from_start_position = ally_locomotion_extension.has_moved_from_start_position
		end
	else
		blackboard.ally_inside_transport_unit = nil
	end

	local navigation_extension = blackboard.navigation_extension
	local previous_destination = navigation_extension:destination()
	local ai_bot_group_extension = blackboard.ai_bot_group_extension
	local hold_position, hold_position_max_distance_sq = ai_bot_group_extension:get_hold_position()
	local hold_position_offset = hold_position and hold_position - previous_destination
	local hold_position_offset_z = hold_position_offset and math.abs(hold_position_offset.z)
	local flat_hold_position_offset_length_sq = hold_position_offset and Vector3.length_squared(Vector3.flat(hold_position_offset))
	local should_go_back = hold_position_offset and (HOLD_POSITION_MAX_ALLOWED_Z < hold_position_offset_z or hold_position_max_distance_sq < flat_hold_position_offset_length_sq)
	local stop_for_vortex = not override_vortex_escape and blackboard.vortex_exist and not navigation_extension:is_path_safe_from_vortex(VORTEX_SAFE_PATH_CHECK_DISTANCE, MIN_ALLOWED_VORTEX_DISTANCE)

	if should_go_back then
		navigation_extension:move_to(hold_position)

		blackboard.using_navigation_destination_override = true
	elseif stop_for_vortex then
		local path_callback = navigation_extension:path_callback()

		if path_callback then
			path_callback(false, previous_destination, true)
		end

		navigation_extension:stop()

		if override_melee then
			blackboard.melee.engage_position_set = false
		end

		if override_ranged then
			blackboard.shoot.disengage_position_set = false
		end

		if override_ability then
			blackboard.activate_ability_data.move_to_position_set = false
		end
	elseif override_vortex_escape or override_liquid_escape or cover_position or override_melee or override_ranged or override_ability then
		local override = transport_unit_override or override_vortex_escape or override_liquid_escape or cover_position or override_melee or override_ranged or override_ability
		local offset = override - previous_destination
		local override_allowed = hold_position == nil or Vector3.distance_squared(hold_position, override) <= hold_position_max_distance_sq

		if override_allowed and (Z_MOVE_TO_EPSILON < math.abs(offset.z) or FLAT_MOVE_TO_EPSILON < Vector3.length(Vector3.flat(offset))) then
			local should_stop = override_melee and blackboard.melee.stop_at_current_position or override_ranged and blackboard.shoot.stop_at_current_position

			if should_stop then
				navigation_extension:stop()
			else
				local path_callback = not transport_unit_override and cover_position and callback(self, "cb_cover_point_path_result", to_hash(override)) or nil

				navigation_extension:move_to(override, path_callback)
			end

			blackboard.using_navigation_destination_override = true
		end
	else
		follow_bb.follow_timer = follow_bb.follow_timer - dt
		local interaction_extension = blackboard.interaction_extension
		local is_interacting = interaction_extension:is_interacting()
		local need_to_stop = target_ally_need_type == "in_need_of_attention_stop"

		if not follow_bb.needs_target_position_refresh and (follow_bb.follow_timer < 0 or need_to_stop or blackboard.target_ally_needs_aid and not is_interacting and navigation_extension:destination_reached()) then
			follow_bb.needs_target_position_refresh = true
		end

		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
		local has_ammo_pickup_order = ai_bot_group_system:get_ammo_pickup_order_unit(unit) ~= nil
		local has_pickup_order = has_ammo_pickup_order or ai_bot_group_system:has_pending_pickup_order(unit)

		if follow_bb.needs_target_position_refresh and (target_ally_has_moved_from_start_position or has_pickup_order) then
			local target_position, should_stop = nil
			local goal_selection_func_name = blackboard.follow.goal_selection_func
			local path_callback = nil
			local enemy_unit = blackboard.target_unit
			local priority_target_enemy = blackboard.priority_target_enemy
			local health_slot_pickup_order = ai_bot_group_system:get_pickup_order(unit, "slot_healthkit")
			local health_slot_pickup_order_unit = health_slot_pickup_order and health_slot_pickup_order.unit or nil
			local potion_slot_pickup_order = ai_bot_group_system:get_pickup_order(unit, "slot_potion")
			local potion_slot_pickup_order_unit = potion_slot_pickup_order and potion_slot_pickup_order.unit or nil

			if blackboard.revive_with_urgent_target and blackboard.target_ally_needs_aid and target_ally_need_type ~= "in_need_of_attention_look" then
				target_position, should_stop = self:_alter_target_position(nav_world, self_pos, target_ally_unit, POSITION_LOOKUP[target_ally_unit], target_ally_need_type)
				blackboard.interaction_unit = target_ally_unit

				blackboard.target_ally_aid_destination:store(target_position)

				path_callback = callback(self, "cb_ally_path_result", target_ally_unit)
			elseif priority_target_enemy and enemy_unit ~= priority_target_enemy and self:_enemy_path_allowed(priority_target_enemy) then
				target_position = self:_find_target_position_on_nav_mesh(nav_world, POSITION_LOOKUP[priority_target_enemy])
				path_callback = callback(self, "cb_enemy_path_result", priority_target_enemy)
			elseif enemy_unit and (enemy_unit == priority_target_enemy or enemy_unit == blackboard.urgent_target_enemy) and self:_enemy_path_allowed(enemy_unit) then
				target_position = self:_find_target_position_on_nav_mesh(nav_world, POSITION_LOOKUP[enemy_unit])
				path_callback = callback(self, "cb_enemy_path_result", enemy_unit)
			elseif blackboard.target_ally_needs_aid and target_ally_need_type ~= "in_need_of_attention_look" then
				target_position, should_stop = self:_alter_target_position(nav_world, self_pos, target_ally_unit, POSITION_LOOKUP[target_ally_unit], target_ally_need_type)
				blackboard.interaction_unit = target_ally_unit

				blackboard.target_ally_aid_destination:store(target_position)

				path_callback = callback(self, "cb_ally_path_result", target_ally_unit)
			elseif goal_selection_func_name and ALIVE[target_ally_unit] then
				local func = LocomotionUtils[goal_selection_func_name]
				target_position = func(nav_world, unit, target_ally_unit)
			elseif unit_alive(blackboard.health_pickup) and blackboard.allowed_to_take_health_pickup and t < blackboard.health_pickup_valid_until and (self._last_health_pickup_attempt.unit ~= blackboard.health_pickup or not self._last_health_pickup_attempt.blacklist or health_slot_pickup_order_unit == blackboard.health_pickup) then
				local pickup_unit = blackboard.health_pickup
				target_position = self:_find_pickup_position_on_navmesh(nav_world, self_pos, pickup_unit, self._last_health_pickup_attempt)
				local allowed_to_take_without_path = pickup_unit == health_slot_pickup_order_unit

				if target_position then
					path_callback = callback(self, "cb_health_pickup_path_result", pickup_unit)
					blackboard.interaction_unit = pickup_unit
				elseif allowed_to_take_without_path then
					blackboard.interaction_unit = pickup_unit
					blackboard.forced_pickup_unit = pickup_unit
				end
			elseif unit_alive(blackboard.mule_pickup) and (self._last_mule_pickup_attempt.unit ~= blackboard.mule_pickup or not self._last_mule_pickup_attempt.blacklist or potion_slot_pickup_order_unit == blackboard.mule_pickup) then
				local pickup_unit = blackboard.mule_pickup
				target_position = self:_find_pickup_position_on_navmesh(nav_world, self_pos, pickup_unit, self._last_mule_pickup_attempt)
				local allowed_to_take_without_path = pickup_unit == potion_slot_pickup_order_unit

				if target_position then
					path_callback = callback(self, "cb_mule_pickup_path_result", pickup_unit)
					blackboard.interaction_unit = pickup_unit
				elseif allowed_to_take_without_path then
					blackboard.interaction_unit = pickup_unit
					blackboard.forced_pickup_unit = pickup_unit
				end
			end

			if not target_position and unit_alive(blackboard.ammo_pickup) and blackboard.has_ammo_missing and t < blackboard.ammo_pickup_valid_until then
				local ammo_position = POSITION_LOOKUP[blackboard.ammo_pickup]
				local dir = Vector3.normalize(self_pos - ammo_position)
				local above = 0.5
				local below = 1.5
				local lateral = INTERACT_RAY_DISTANCE - 0.3
				local distance = 0
				target_position = self:_find_position_on_navmesh(nav_world, ammo_position, ammo_position + dir, above, below, lateral, distance)

				if target_position then
					blackboard.interaction_unit = blackboard.ammo_pickup
				end
			end

			local new_position_is_outside_hold_radius = hold_position and target_position and hold_position_max_distance_sq < Vector3.distance_squared(hold_position, target_position)

			if new_position_is_outside_hold_radius then
				target_position = nil
			end

			if not target_position then
				target_position = ai_bot_group_extension.data.follow_position
				moving_towards_follow_position = true
			end

			if should_stop then
				navigation_extension:stop()
			elseif target_position then
				blackboard.moving_toward_follow_position = moving_towards_follow_position
				follow_bb.needs_target_position_refresh = false
				follow_bb.follow_timer = math.lerp(FOLLOW_TIMER_LOWER_BOUND, FOLLOW_TIMER_UPPER_BOUND, Math.random())

				follow_bb.target_position:store(target_position)

				if self:new_destination_distance_check(self_pos, previous_destination, target_position, navigation_extension) then
					navigation_extension:move_to(target_position, path_callback)
				end

				blackboard.using_navigation_destination_override = false
			end
		end

		if blackboard.using_navigation_destination_override then
			navigation_extension:move_to(follow_bb.target_position:unbox())

			blackboard.using_navigation_destination_override = false
		end

		local current_goal = navigation_extension:current_goal()
		local area_damage_system = Managers.state.entity:system("area_damage_system")

		if current_goal and area_damage_system:is_position_in_liquid(current_goal, BotNavTransitionManager.NAV_COST_MAP_LAYERS) then
			navigation_extension:stop()
		end
	end
end

local PICKUP_ROTATIONS = {
	QuaternionBox(Quaternion(Vector3.up(), 0)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi * 0.25)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi * 0.25)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi * 0.5)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi * 0.5)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi * 0.75)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi * 0.75)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi))
}

PlayerBotBase._find_pickup_position_on_navmesh = function (self, nav_world, self_pos, pickup_unit, pickup_attempt)
	local above = 1.5
	local below = 2.2
	local STEP = 0.1
	local range = INTERACT_RAY_DISTANCE - 0.3
	local max_index = #PICKUP_ROTATIONS
	local pickup_pos = POSITION_LOOKUP[pickup_unit]

	if pickup_attempt.unit ~= pickup_unit then
		pickup_attempt.unit = pickup_unit
		pickup_attempt.index = 1
		pickup_attempt.distance = 0
		pickup_attempt.path_failed = true

		pickup_attempt.rotation:store(Quaternion.look(Vector3.flat(self_pos - pickup_pos), Vector3.up()))

		pickup_attempt.blacklist = false
	end

	if pickup_attempt.path_failed then
		local index = pickup_attempt.index
		local attempt_rotation = pickup_attempt.rotation:unbox()
		local dist = pickup_attempt.distance
		local found_position = nil

		while index <= max_index and not found_position do
			local rot = Quaternion.multiply(PICKUP_ROTATIONS[index]:unbox(), attempt_rotation)
			local dir = Quaternion.forward(rot)
			dist = math.min(dist + STEP, 1)
			local pos = pickup_pos + dir * dist * range
			local success, z = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

			if success then
				pos.z = z

				if dist >= 0.8 then
					found_position = pos
				else
					local ray_end_pos = pos + (1 - dist) * dir * range
					local success, ray_hit_pos = GwNavQueries.raycast(nav_world, pos, ray_end_pos)

					if success then
						found_position = ray_end_pos
						dist = 1
					else
						found_position = 0.1 * pos + ray_hit_pos * 0.9
						dist = Vector3.dot(Vector3.flat(found_position - pickup_pos), dir)
					end
				end
			end

			if dist >= 1 - FLAT_MOVE_TO_EPSILON then
				index = index + 1
				dist = 0
			end
		end

		pickup_attempt.distance = dist
		pickup_attempt.index = index

		if found_position then
			pickup_attempt.path_failed = false

			pickup_attempt.path_position:store(found_position)

			return found_position
		else
			pickup_attempt.blacklist = true

			return
		end
	else
		return pickup_attempt.path_position:unbox()
	end
end

PlayerBotBase._find_position_on_navmesh = function (self, nav_world, original_position, offset_position, above, below, lateral, distance)
	local success, z = GwNavQueries.triangle_from_position(nav_world, offset_position, above, below)

	if success then
		return Vector3(offset_position.x, offset_position.y, z)
	else
		success, z = GwNavQueries.triangle_from_position(nav_world, original_position, above, below)

		if success then
			return Vector3(offset_position.x, offset_position.y, z)
		else
			return GwNavQueries.inside_position_from_outside_position(nav_world, original_position, above, below, lateral, distance)
		end
	end
end

PlayerBotBase.unit_removed_from_game = function (self)
	return
end

PlayerBotBase.destroy = function (self)
	self._brain:destroy()

	if self._blackboard.taking_cover.cover_unit then
		Managers.state.entity:system("ai_bot_group_system"):set_in_cover(self._unit, nil)
	end
end

PlayerBotBase._debug_draw_update = function (self, dt)
	if script_data.debug_behaviour_trees then
		self._brain:debug_draw_behaviours()
	end

	local drawer_name = "bot_debug" .. self._player.player_name
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = drawer_name
	})
	local debug_sphere_position = Unit.local_position(self._unit, 0) + Vector3.up() * 2
	local color = self._player.color:unbox()

	drawer:sphere(debug_sphere_position, 0.25, color)

	local blackboard = self._blackboard
	local enemy = blackboard.target_unit
	local ally = blackboard.target_ally_unit
	local radius_offset = self._player:local_player_id() * 0.05

	if ALIVE[enemy] then
		local enemy_pose = Unit.world_pose(enemy, 0)
		local z_offset = 1.5 + radius_offset

		Matrix4x4.set_translation(enemy_pose, POSITION_LOOKUP[enemy] + Vector3.up() * z_offset)
		drawer:line(debug_sphere_position, Unit.world_position(enemy, 0) + Vector3(0, 0, 1.5), Color(125, 255, 0, 0))
		drawer:box(enemy_pose, Vector3(0.5 + radius_offset, 0.5 + radius_offset, z_offset), color)
	end

	if ALIVE[ally] then
		drawer:circle(POSITION_LOOKUP[ally] + Vector3(0, 0, 0.2), 0.6 + radius_offset, Vector3.up(), color, 16)
	end

	self._brain:debug_draw_current_behavior()
end

PlayerBotBase.clear_failed_paths = function (self)
	table.clear(self._attempted_ally_paths)
	table.clear(self._attempted_enemy_paths)
end

PlayerBotBase.cb_enemy_path_result = function (self, enemy_unit, success, destination, forced_callback)
	if forced_callback then
		return
	end

	local paths = self._attempted_enemy_paths
	local path_status = paths[enemy_unit]

	if not path_status then
		path_status = {
			last_path_destination = Vector3Box()
		}
		paths[enemy_unit] = path_status
	end

	local fail = not success

	if fail then
		self._blackboard.follow.needs_target_position_refresh = true
	end

	path_status.failed = fail

	path_status.last_path_destination:store(destination)

	for unit, path in pairs(paths) do
		if not unit_alive(unit) then
			paths[unit] = nil
		end
	end
end

PlayerBotBase._enemy_path_allowed = function (self, enemy_unit)
	local path_status = self._attempted_enemy_paths[enemy_unit]
	local enemy_pos = POSITION_LOOKUP[enemy_unit]

	if path_status and path_status.failed and Vector3.distance_squared(enemy_pos, path_status.last_path_destination:unbox()) < ENEMY_PATH_FAILED_REPATH_THRESHOLD and math.abs(enemy_pos.z - path_status.last_path_destination:unbox().z) < ENEMY_PATH_FAILED_REPATH_VERTICAL_THRESHOLD then
		return false
	end

	return true
end

PlayerBotBase.cb_health_pickup_path_result = function (self, pickup_unit, success, destination, forced_callback)
	if forced_callback then
		return
	end

	if pickup_unit == self._last_health_pickup_attempt.unit then
		self._last_health_pickup_attempt.path_failed = not success
	end
end

PlayerBotBase.cb_mule_pickup_path_result = function (self, pickup_unit, success, destination, forced_callback)
	if forced_callback then
		return
	end

	if pickup_unit == self._last_mule_pickup_attempt.unit then
		self._last_mule_pickup_attempt.path_failed = not success
	end
end

PlayerBotBase.cb_ally_path_result = function (self, ally_unit, success, destination, forced_callback)
	local paths = self._attempted_ally_paths
	local path_status = paths[ally_unit]

	if not path_status then
		path_status = {
			last_path_destination = Vector3Box()
		}
		paths[ally_unit] = path_status
	end

	local fail = not success
	path_status.failed = fail

	path_status.last_path_destination:store(destination)

	path_status.forced_callback = forced_callback

	if fail then
		path_status.ignore_ally_from = Managers.time:time("game")
	else
		path_status.ignore_ally_from = -math.huge
	end

	for unit, path in pairs(paths) do
		if not unit_alive(unit) then
			paths[unit] = nil
		end
	end
end

local ALLY_PATH_TIME_MIN_DISTANCE_SQ = 25
local ALLY_PATH_TIME_MAX_DISTANCE_SQ = 225
local ALLY_PATH_TIME_DISTANCE_SLOPE = 1 / (ALLY_PATH_TIME_MAX_DISTANCE_SQ - ALLY_PATH_TIME_MIN_DISTANCE_SQ)
local ALLY_PATH_MIN_DISTANCE_TIME = 3
local ALLY_PATH_MAX_DISTANCE_TIME = 12

PlayerBotBase._ally_path_allowed = function (self, self_unit, ally_unit, t)
	local path_status = self._attempted_ally_paths[ally_unit]

	if path_status and path_status.failed then
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_position = POSITION_LOOKUP[ally_unit]
		local ally_distance_sq = Vector3.distance_squared(self_position, ally_position)
		local p = math.clamp((ally_distance_sq - ALLY_PATH_TIME_MIN_DISTANCE_SQ) * ALLY_PATH_TIME_DISTANCE_SLOPE, 0, 1)
		local wait_time = math.lerp(ALLY_PATH_MIN_DISTANCE_TIME, ALLY_PATH_MAX_DISTANCE_TIME, p)

		if t > path_status.ignore_ally_from + wait_time then
			return true, true
		end

		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director:get_player_unit_segment(self._unit) or -1
		local target_segment = conflict_director:get_player_unit_segment(ally_unit) or -1
		local ignore_for = nil

		if self_segment < target_segment then
			ignore_for = 1
		elseif target_segment < self_segment then
			ignore_for = 10
		else
			ignore_for = 5
		end

		local no_longer_ignored = t > path_status.ignore_ally_from + ignore_for

		if no_longer_ignored then
			local last_path_destination = path_status.last_path_destination:unbox()
			local has_moved = ALLY_PATH_FAILED_REPATH_THRESHOLD < Vector3.distance_squared(ally_position, last_path_destination)
			local forced_callback = path_status.forced_callback

			return true, has_moved or forced_callback
		else
			return false, false
		end
	else
		return true, true
	end
end

local function find_chain_times(allowed_chain_actions)
	if not allowed_chain_actions then
		return 1, 0, 1, 0
	end

	local min = math.huge
	local max = -math.huge
	local min_idx = 1
	local max_idx = 1

	for i = 1, #allowed_chain_actions do
		local chain = allowed_chain_actions[i]

		if chain.input and chain.action ~= nil and chain.sub_action ~= nil and string.find(chain.input, "action_one") then
			local chain_start = chain.start_time

			if chain_start < min then
				min = chain_start
				min_idx = i
			end

			if max < chain_start then
				max = chain_start
				max_idx = i
			end
		end
	end

	return min_idx, min, max_idx, max
end

PlayerBotBase._update_weapon_metadata = function (self, template)
	local metadata = template and template.attack_meta_data

	if metadata and not template._precalculated_metadata then
		print("updating bot weapon metadata for weapon:", template and template.name)

		local used_actions = WeaponUtils.get_used_actions(template)

		if used_actions.action_one then
			local weapon_attacks = template.actions.action_one
			local data_count = 0
			local armor_types = 6
			local light_attack_data = {
				total_chain_time = 0,
				armor_mods = {
					0,
					0,
					0,
					0,
					0,
					0
				}
			}
			local heavy_attack_data = {
				total_chain_time = 0,
				armor_mods = {
					0,
					0,
					0,
					0,
					0,
					0
				}
			}

			for name, _ in pairs(used_actions.action_one) do
				local current_attack = weapon_attacks[name]

				if ActionUtils.is_melee_start_sub_action(current_attack) then
					local chain_attacks = current_attack.allowed_chain_actions
					local anim_speed_scale = current_attack.anim_time_scale or 1
					local min_idx, min, max_idx, max = find_chain_times(chain_attacks)
					light_attack_data.total_chain_time = light_attack_data.total_chain_time + min * anim_speed_scale
					heavy_attack_data.total_chain_time = heavy_attack_data.total_chain_time + max * anim_speed_scale
					local chain_action_name = chain_attacks[min_idx].action
					local chain_sub_action_name = chain_attacks[min_idx].sub_action
					local chain_action = template.actions[chain_action_name][chain_sub_action_name]
					anim_speed_scale = chain_action.anim_time_scale or 1
					min_idx, min = find_chain_times(chain_action.allowed_chain_actions)
					light_attack_data.total_chain_time = light_attack_data.total_chain_time + min * anim_speed_scale
					local light_armor_mods = ActionUtils.get_performance_scores_for_sub_action(chain_action)
					chain_action_name = chain_attacks[max_idx].action
					chain_sub_action_name = chain_attacks[max_idx].sub_action
					chain_action = template.actions[chain_action_name][chain_sub_action_name]
					anim_speed_scale = chain_action.anim_time_scale or 1
					min_idx, min = find_chain_times(chain_action.allowed_chain_actions)
					heavy_attack_data.total_chain_time = heavy_attack_data.total_chain_time + min * anim_speed_scale
					local heavy_armor_mods = ActionUtils.get_performance_scores_for_sub_action(chain_action)

					if light_armor_mods and heavy_armor_mods then
						for i = 1, armor_types do
							light_attack_data.armor_mods[i] = light_attack_data.armor_mods[i] + light_armor_mods[i]
							heavy_attack_data.armor_mods[i] = heavy_attack_data.armor_mods[i] + heavy_armor_mods[i]
						end

						data_count = data_count + 1
					end
				end
			end

			local light_meta = metadata.tap_attack

			if light_meta then
				for i = 1, #light_attack_data.armor_mods do
					light_attack_data.armor_mods[i] = light_attack_data.armor_mods[i] / data_count
				end

				light_meta.armor_modifiers = light_attack_data.armor_mods
				light_meta.speed_mod = 1 / math.clamp(light_attack_data.total_chain_time / data_count, 0.1, 10)
			end

			local hold_attack = metadata.hold_attack

			if hold_attack then
				for i = 1, #heavy_attack_data.armor_mods do
					heavy_attack_data.armor_mods[i] = heavy_attack_data.armor_mods[i] / data_count
				end

				hold_attack.armor_modifiers = heavy_attack_data.armor_mods
				hold_attack.speed_mod = 1 / math.clamp(heavy_attack_data.total_chain_time / data_count, 0.1, 10)
			end
		end

		template._precalculated_metadata = true
	end
end

PlayerBotBase._update_weapon_loadout_data = function (self)
	local blackboard = self._blackboard
	local inventory_ext = blackboard.inventory_extension
	local recently_acquired_melee = inventory_ext:recently_acquired("slot_melee")
	local recently_acquired_ranged = inventory_ext:recently_acquired("slot_ranged")

	if recently_acquired_melee or recently_acquired_ranged then
		local slot_data = inventory_ext:get_slot_data("slot_melee")
		local slot_template = slot_data and inventory_ext:get_item_template(slot_data)
		local slot_buff_type = slot_template and slot_template.buff_type
		local alt_slot_data = inventory_ext:get_slot_data("slot_ranged")
		local alt_slot_template = alt_slot_data and inventory_ext:get_item_template(alt_slot_data)
		local alt_slot_buff_type = alt_slot_template and alt_slot_template.buff_type

		if MeleeBuffTypes[slot_buff_type] and MeleeBuffTypes[alt_slot_buff_type] then
			blackboard.double_weapons = "slot_melee"
		elseif RangedBuffTypes[slot_buff_type] and RangedBuffTypes[alt_slot_buff_type] then
			blackboard.double_weapons = "slot_ranged"
		else
			blackboard.double_weapons = nil
		end

		self:_update_weapon_metadata(slot_template)
		self:_update_weapon_metadata(alt_slot_template)
	end
end

PlayerBotBase._update_best_weapon = function (self)
	local blackboard = self._blackboard

	if not blackboard.double_weapons then
		return
	end

	local combat_conditions = AiUtils.get_combat_conditions(blackboard)
	local weapons_scores = blackboard.weapon_scores or {}
	local slot_melee = weapons_scores.slot_melee or {}
	local slot_ranged = weapons_scores.slot_ranged or {}
	local inventory = blackboard.inventory_extension
	local melee_slot_data = inventory:get_slot_data("slot_melee")
	local melee_item_template = inventory:get_item_template(melee_slot_data)
	slot_melee.input, slot_melee.meta, slot_melee.score = AiUtils.get_melee_weapon_score(combat_conditions, melee_item_template)
	slot_melee.score = slot_melee.score
	local ranged_slot_data = inventory:get_slot_data("slot_ranged")
	local ranged_item_template = inventory:get_item_template(ranged_slot_data)
	slot_ranged.input, slot_ranged.meta, slot_ranged.score = AiUtils.get_melee_weapon_score(combat_conditions, ranged_item_template)
	slot_ranged.score = slot_ranged.score
	weapons_scores.slot_melee = slot_melee
	weapons_scores.slot_ranged = slot_ranged
	blackboard.weapon_scores = weapons_scores

	if script_data.debug_bot_weapon_preference then
		Debug.text(string.format("Melee: %.3f - %s", slot_melee.score, slot_melee.input))
		Debug.text(string.format("Ranged: %.3f - %s", slot_ranged.score, slot_ranged.input))
	end
end
