require("scripts/unit_extensions/human/ai_player_unit/ai_navigation_extension")
require("scripts/unit_extensions/human/ai_player_unit/ai_brain")
require("scripts/unit_extensions/human/ai_player_unit/perception_utils")

local alive = Unit.alive
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
local Z_MOVE_TO_EPSILON = BotConstants.default.Z_MOVE_TO_EPSILON
local HOLD_POSITION_MAX_ALLOWED_Z = 0.5
local WANTS_TO_HEAL_THRESHOLD = 0.25
local WANTS_TO_GIVE_HEAL_TO_OTHER = 0.5
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

	return 
end

local function dtext(...)
	if SELF_UNIT == script_data.debug_unit and script_data.ai_bots_debug then
		Debug.text(...)
	end

	return 
end

PlayerBotBase = class(PlayerBotBase)

local function find_max_weight(data)
	local num_entries = #data
	local max_weight = -math.huge

	for i = 1, num_entries, 1 do
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
	self._blackboard = {
		target_ally_needs_aid = false,
		using_navigation_destination_override = false,
		is_passive = true,
		re_evaluate_detection = Math.random()*0.5,
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
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (-math.pi*4)/8)))
		},
		{
			weight = 0.75,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (-math.pi*3)/8)))
		},
		{
			weight = 1,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (-math.pi*2)/8)))
		},
		{
			weight = 0.7,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (-math.pi*1)/8)))
		},
		{
			weight = 0.6,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (math.pi*0)/8)))
		},
		{
			weight = 0.7,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (math.pi*1)/8)))
		},
		{
			weight = 1,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (math.pi*2)/8)))
		},
		{
			weight = 0.75,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (math.pi*3)/8)))
		},
		{
			weight = 0.5,
			direction = Vector3Box(Quaternion.forward(Quaternion(up, (math.pi*4)/8)))
		}
	}
	self._vortex_escape_directions = vortex_escape_directions
	local largest_vortex_weight = find_max_weight(vortex_escape_directions)
	self._vortex_largest_weighted_distance_sq = largest_vortex_weight*VORTEX_ESCAPE_DISTANCE^2
	self._bot_profile = extension_init_data.bot_profile
	self._player = extension_init_data.player

	Unit.set_data(unit, "bot", self._bot_profile)
	Managers.player:assign_unit_ownership(unit, self._player, true)
	Unit.set_flow_variable(unit, "is_bot", true)
	Unit.flow_event(unit, "character_vo_set")
	self._init_brain(self)

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

	return 
end
PlayerBotBase.ranged_attack_started = function (self, attacking_unit, victim_unit, attack_type)
	local blackboard = self._blackboard

	if attack_type == "ratling_gun_fire" then
		local targets = blackboard.taking_cover.threats
		targets[attacking_unit] = victim_unit
	end

	return 
end
PlayerBotBase.ranged_attack_ended = function (self, attacking_unit, victim_unit, attack_type)
	local blackboard = self._blackboard

	if attack_type == "ratling_gun_fire" then
		local targets = blackboard.taking_cover.threats
		targets[attacking_unit] = nil
	end

	return 
end
PlayerBotBase.hit_by_projectile = function (self, attacking_unit)
	local blackboard = self._blackboard
	blackboard.hit_by_projectile[attacking_unit] = true

	return 
end
local DEFAULT_STAY_NEAR_PLAYER_RANGE = 5
PlayerBotBase.set_stay_near_player = function (self, stay_near_player, max_range)
	if stay_near_player then
		self._stay_near_player_range = max_range or DEFAULT_STAY_NEAR_PLAYER_RANGE
	else
		self._stay_near_player_range = math.huge
	end

	self._stay_near_player = stay_near_player

	return 
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

	return 
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

	return 
end

function bot_printf(unit, num, str, ...)
	local player = Managers.player:owner(unit)

	if player.name(player) == "player_bot_" .. num then
		printf(str, ...)
	end

	return 
end

PlayerBotBase._init_brain = function (self)
	self._brain = AIBrain:new(self._world, self._unit, self._blackboard, self._bot_profile, self._bot_profile.behavior)

	return 
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
	Profiler.start("PlayerBotBase")

	local health_extension = self._health_extension
	local status_extension = self._status_extension
	local locomotion_extension = self._locomotion_extension
	local is_alive = health_extension.is_alive(health_extension)
	local is_ready_for_assisted_respawn = status_extension.is_ready_for_assisted_respawn(status_extension)
	local moving_platform = locomotion_extension.get_moving_platform(locomotion_extension)
	local is_linked_movement = locomotion_extension.is_linked_movement(locomotion_extension)

	if is_alive and not is_ready_for_assisted_respawn and moving_platform == nil and not is_linked_movement then
		SELF_UNIT = unit

		Profiler.start("update blackboard")
		self._update_blackboard(self, dt, t)
		Profiler.stop("update blackboard")
		Profiler.start("update target enemy")
		self._update_target_enemy(self, dt, t)
		Profiler.stop("update target enemy")
		Profiler.start("update target ally")
		self._update_target_ally(self, dt, t)
		Profiler.stop("update target ally")
		Profiler.start("_update_liquid_escape")
		self._update_liquid_escape(self)
		Profiler.stop("_update_liquid_escape")
		Profiler.start("_update_vortex_escape")
		self._update_vortex_escape(self)
		Profiler.stop("_update_vortex_escape")
		Profiler.start("update pickups")
		self._update_pickups(self, dt, t)
		Profiler.stop("update pickups")
		Profiler.start("update interactables")
		self._update_interactables(self, dt, t)
		Profiler.stop("update interactables")
		Profiler.start("update brain")
		self._brain:update(unit, t, dt)
		Profiler.stop("update brain")

		local is_disabled = status_extension.is_disabled(status_extension)

		if is_disabled then
			self._navigation_extension:teleport(POSITION_LOOKUP[unit])
		elseif locomotion_extension.is_on_ground(locomotion_extension) then
			Profiler.start("update movement target")
			self._update_movement_target(self, dt, t)
			Profiler.stop("update movement target")
		end

		Profiler.start("update_attack_request")
		self._update_attack_request(self, t)
		Profiler.stop("update_attack_request")
	end

	if script_data.ai_bots_debug then
		Profiler.start("update debug draw")
		self._debug_draw_update(self, dt)
		Profiler.stop("update debug draw")
	end

	Profiler.stop("PlayerBotBase")

	return 
end
PlayerBotBase._update_blackboard = function (self, dt, t)
	local bb = self._blackboard
	local status_ext = self._status_extension
	bb.is_knocked_down = status_ext.is_knocked_down(status_ext)
	bb.is_grabbed_by_pack_master = status_ext.is_grabbed_by_pack_master(status_ext)
	bb.is_pounced_down = status_ext.is_pounced_down(status_ext)
	bb.is_hanging_from_hook = status_ext.is_hanging_from_hook(status_ext)
	bb.is_ledge_hanging = status_ext.get_is_ledge_hanging(status_ext)
	bb.is_transported = status_ext.is_using_transport(status_ext)
	bb.is_grabbed_by_chaos_spawn = status_ext.is_grabbed_by_chaos_spawn(status_ext)
	local unit = self._unit
	local target_unit = bb.target_unit

	if alive(target_unit) then
		bb.target_dist = Vector3.distance(POSITION_LOOKUP[target_unit], POSITION_LOOKUP[unit])
	else
		bb.target_dist = math.huge
	end

	for _, action_data in pairs(bb.utility_actions) do
		action_data.time_since_last = t - action_data.last_time
	end

	return 
end
PlayerBotBase._update_target_enemy = function (self, dt, t)
	Profiler.start("update target enemy")

	local pos = POSITION_LOOKUP[self._unit]

	Profiler.start("update_slot_target")
	self._update_slot_target(self, dt, t, pos)
	Profiler.stop("update_slot_target")
	Profiler.start("update_proximity_target")
	self._update_proximity_target(self, dt, t, pos)
	Profiler.stop("update_proximity_target")

	local bb = self._blackboard
	local old_target = bb.target_unit
	local slot_enemy = bb.slot_target_enemy
	local prox_enemy = bb.proximity_target_enemy
	local priority_enemy = bb.priority_target_enemy
	local urgent_enemy = bb.urgent_target_enemy
	local opportunity_enemy = bb.opportunity_target_enemy
	local prox_enemy_dist = bb.proximity_target_distance + ((prox_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER) or 0)
	local prio_enemy_dist = bb.priority_target_distance + ((priority_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER) or 0)
	local urgent_enemy_dist = bb.urgent_target_distance + ((urgent_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER) or 0)
	local opp_enemy_dist = bb.opportunity_target_distance + ((opportunity_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER) or 0)

	if slot_enemy then
		local slot_enemy_dist = Vector3.length(POSITION_LOOKUP[slot_enemy] - pos) + ((slot_enemy == old_target and STICKYNESS_DISTANCE_MODIFIER) or 0)
	end

	if priority_enemy and prio_enemy_dist < 3 then
		bb.target_unit = priority_enemy

		dtext("Bot Enemy Target: priority_enemy")
	elseif urgent_enemy and urgent_enemy_dist < 3 then
		bb.target_unit = urgent_enemy

		dtext("Bot Enemy Target: urgent_enemy")
	elseif opportunity_enemy and opp_enemy_dist < 3 then
		bb.target_unit = opportunity_enemy

		dtext("Bot Enemy Target: opportunity_enemy")
	elseif slot_enemy and slot_enemy_dist < 3 then
		bb.target_unit = slot_enemy

		dtext("Bot Enemy Target: slot_enemy")
	elseif prox_enemy and prox_enemy_dist < 2 then
		bb.target_unit = prox_enemy

		dtext("Bot Enemy Target: prox_enemy")
	elseif priority_enemy then
		bb.target_unit = priority_enemy

		dtext("Bot Enemy Target: priority_enemy")
	elseif urgent_enemy then
		bb.target_unit = urgent_enemy

		dtext("Bot Enemy Target: urgent_enemy")
	elseif opportunity_enemy then
		bb.target_unit = opportunity_enemy

		dtext("Bot Enemy Target: opportunity_enemy")
	elseif slot_enemy then
		bb.target_unit = slot_enemy

		dtext("Bot Enemy Target: slot_enemy")
	elseif bb.target_unit then
		bb.target_unit = nil

		dtext("Bot Enemy Target: no_target")
	end

	Profiler.stop("update target enemy")

	return 
end
local BROADPHASE_QUERY_TEMP = {}
PlayerBotBase._update_proximity_target = function (self, dt, t, self_position)
	if self._proximity_target_update_timer < t then
		local blackboard = self._blackboard
		local self_unit = self._unit
		self._proximity_target_update_timer = t + 0.25 + Math.random()*0.15
		local prox_enemies = self._blackboard.proximite_enemies

		table.clear(prox_enemies)

		local check_range = PROXIMITY_CHECK_RANGE
		blackboard.aggressive_mode = false
		blackboard.force_aid = false
		local search_position = nil

		if alive(blackboard.target_ally_unit) and blackboard.target_ally_needs_aid and self.within_aid_range(self, blackboard) then
			search_position = POSITION_LOOKUP[blackboard.target_ally_unit]
			local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")
			local is_prioritized = ai_bot_group_system.is_prioritized_ally(ai_bot_group_system, self_unit, blackboard.target_ally_unit)
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
		local index = 1

		for i = 1, num_hits, 1 do
			local unit = BROADPHASE_QUERY_TEMP[i]
			local health_ext = ScriptUnit.extension(unit, "health_system")

			if health_ext.is_alive(health_ext) then
				local enemy_pos = POSITION_LOOKUP[unit]
				local enemy_offset = enemy_pos - search_position

				if self._target_valid(self, unit, enemy_offset) then
					prox_enemies[index] = unit
					index = index + 1
					local enemy_real_dist = Vector3.length(enemy_offset)
					local enemy_dist = enemy_real_dist + ((unit == blackboard.target_unit and STICKYNESS_DISTANCE_MODIFIER) or 0)

					if enemy_dist < closest_dist then
						closest_enemy = unit
						closest_dist = enemy_dist
						closest_real_dist = enemy_real_dist
					end
				end
			end
		end

		if blackboard.proximity_target_enemy or closest_enemy then
			blackboard.proximity_target_enemy = closest_enemy
		end

		blackboard.proximity_target_distance = closest_real_dist
	end

	return 
end
local PROXIMITY_UP_DOWN_THRESHOLD = math.sin(math.pi*0.25)
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
	local enemy_targetting_self = self._get_closest_target_in_slot(self, pos, unit, current_target, true)

	if enemy_targetting_self then
		bb.slot_target_enemy = enemy_targetting_self

		return 
	end

	local ally_unit = bb.target_ally_unit

	if alive(ally_unit) then
		local enemy_targetting_ally = self._get_closest_target_in_slot(self, pos, ally_unit, current_target)

		if enemy_targetting_ally then
			bb.slot_target_enemy = enemy_targetting_ally

			return 
		end
	end

	local players = Managers.player:human_and_bot_players()
	local best_target = nil
	local best_dist = math.huge

	for _, player in pairs(players) do
		local player_unit = player.player_unit

		if alive(player_unit) and player_unit ~= ally_unit and player_unit ~= unit then
			local target, dist = self._get_closest_target_in_slot(self, pos, player_unit, current_target)

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

	return 
end
local BOT_THREAT_MODIFIER = -1
local SLOT_TYPES = table.keys(SlotSettings)
PlayerBotBase._get_closest_target_in_slot = function (self, position, unit, current_enemy_unit, is_self)
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")
	local best_target = nil
	local target_dist = math.huge

	for i = 1, #SLOT_TYPES, 1 do
		local slot_type = SLOT_TYPES[i]
		local slot_data = ai_slot_system.get_target_unit_slot_data(ai_slot_system, unit, slot_type)

		if slot_data then
			for slot_index, slot in pairs(slot_data) do
				local enemy_unit = slot.ai_unit

				if alive(enemy_unit) and ScriptUnit.extension(enemy_unit, "health_system"):is_alive() then
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

					if dist < target_dist then
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
		wanted_position = target_position - forward_vector_flat*0.5
	elseif reason == "in_need_of_heal" or reason == "can_accept_grenade" or reason == "can_accept_potion" or reason == "can_accept_heal_item" then
		local target_locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")
		local target_average_velocity = target_locomotion_extension.average_velocity(target_locomotion_extension)

		if 2.25 < Vector3.length_squared(target_average_velocity) then
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

	return 
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

	return 
end
PlayerBotBase._update_target_ally = function (self, dt, t)
	Profiler.start("update target ally")

	local unit = self._unit
	local blackboard = self._blackboard
	local breed = self._bot_profile
	local best_ally, ally_dist, in_need_type, look_at_ally = nil

	if blackboard.target_unit and blackboard.target_unit == blackboard.priority_target_enemy then
		best_ally = blackboard.priority_target_disabled_ally
		ally_dist = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[best_ally])
	else
		best_ally, ally_dist, in_need_type, look_at_ally = self._select_ally_by_utility(self, unit, blackboard, breed, t)
	end

	blackboard.target_ally_unit = best_ally or nil
	blackboard.ally_distance = ally_dist

	if blackboard.target_ally_unit and in_need_type then
		blackboard.target_ally_needs_aid = true
		blackboard.target_ally_need_type = in_need_type
	elseif blackboard.target_ally_needs_aid then
		blackboard.target_ally_needs_aid = false
		blackboard.target_ally_need_type = nil
	end

	local input_extension = blackboard.input_extension

	if look_at_ally then
		input_extension.set_look_at_player(input_extension, best_ally, false)
	else
		input_extension.set_look_at_player(input_extension, nil)
	end

	local is_priority_aid_type = blackboard.target_ally_need_type == "knocked_down" or blackboard.target_ally_need_type == "ledge" or blackboard.target_ally_need_type == "hook"

	if blackboard.target_ally_needs_aid and is_priority_aid_type then
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

		ai_bot_group_system.register_ally_needs_aid_priority(ai_bot_group_system, unit, blackboard.target_ally_unit)
	end

	Profiler.stop("update target ally")

	return 
end
local MIN_HEADING_TOWARDS_US_DOT = math.degrees_to_radians(30)
local ATTENTION_SAFE_TO_STOP_DISTANCE = 3.5
PlayerBotBase._player_needs_attention = function (self, self_unit, player_unit, blackboard, player_inventory_extension, player_locomotion_extension, t)
	local start_time = self._seen_by_players[player_unit]
	local player_wielded_slot = player_inventory_extension.equipment(player_inventory_extension).wielded_slot
	local player_slot_data = player_inventory_extension.get_slot_data(player_inventory_extension, player_wielded_slot)

	if not start_time or blackboard.target_unit or player_slot_data == nil then
		return false, 0
	end

	local status_extension = blackboard.status_extension
	local is_wounded = status_extension.is_wounded(status_extension)
	local health_extension = blackboard.health_extension
	local health_percent = health_extension.current_permanent_health_percent(health_extension)
	local item_template = player_inventory_extension.get_item_template(player_inventory_extension, player_slot_data)
	local can_heal_other = item_template.can_heal_other
	local can_give_other = item_template.can_give_other
	local inventory_extension = blackboard.inventory_extension
	local slot_is_empty = not inventory_extension.get_slot_data(inventory_extension, player_wielded_slot)
	local can_receive_item = can_give_other and slot_is_empty
	local interested_in_heal = can_heal_other and (is_wounded or health_percent < INTERESTED_IN_BEING_HEALED_THRESHOLD)
	local self_position = POSITION_LOOKUP[self_unit]
	local player_position = POSITION_LOOKUP[player_unit]
	local player_to_self = self_position - player_position
	local player_to_self_direction = Vector3.normalize(player_to_self)
	local player_velocity = player_locomotion_extension.current_velocity(player_locomotion_extension)
	local player_velocity_normalized = Vector3.normalize(player_velocity)
	local player_speed_sq = Vector3.length_squared(player_velocity)
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension.current_velocity(locomotion_extension)
	local velocity_normalized = Vector3.normalize(velocity)
	local speed_sq = Vector3.length_squared(velocity)
	local direction_dot = Vector3.dot(player_to_self_direction, player_velocity_normalized)
	local is_heading_towards_us = MIN_HEADING_TOWARDS_US_DOT < direction_dot
	local is_heading_towards_player = nil

	if 0.01 < speed_sq then
		local direction_dot = Vector3.dot(player_to_self_direction, velocity_normalized)
		is_heading_towards_player = direction_dot <= MIN_HEADING_TOWARDS_US_DOT
	else
		is_heading_towards_player = false
	end

	local look_threshold, stop_threshold = nil
	local safe_stop_distance = ATTENTION_SAFE_TO_STOP_DISTANCE

	if is_heading_towards_us and player_wielded_slot == "slot_healthkit" and (interested_in_heal or can_receive_item) then
		local health_term = (health_percent - 1)*0.2
		stop_threshold = health_term - 0.5
		look_threshold = 0.25
		safe_stop_distance = safe_stop_distance + math.sqrt(player_speed_sq)
	else
		local smallest_speed_sq = math.min(speed_sq, player_speed_sq)

		if 0.01 < smallest_speed_sq or is_heading_towards_player then
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

	if safe_stop_distance^2 < player_to_self_length_squared or player_to_self_length_squared <= 0.25 then
		stop_threshold = math.huge
	end

	local current_seen_time = t - start_time

	if stop_threshold < current_seen_time then
		local extra_utility = math.clamp(current_seen_time, 0, 2)

		return "stop", extra_utility
	elseif look_threshold < current_seen_time then
		local extra_utility = math.clamp(current_seen_time, 0, 0.5)

		return "look_at", extra_utility
	end

	return 
end
PlayerBotBase._select_ally_by_utility = function (self, unit, blackboard, breed, t)
	local self_pos = POSITION_LOOKUP[unit]
	local closest_ally = nil
	local closest_dist = math.huge
	local closest_real_dist = math.huge
	local closest_in_need_type = nil
	local closest_ally_look_at = false
	local inventory_extension = blackboard.inventory_extension
	local health_slot_data = inventory_extension.get_slot_data(inventory_extension, "slot_healthkit")
	local can_heal_other = false
	local can_give_healing_to_other = false

	if health_slot_data then
		local template = inventory_extension.get_item_template(inventory_extension, health_slot_data)
		can_heal_other = template.can_heal_other
		can_give_healing_to_other = template.can_give_other
	end

	local can_give_grenade_to_other = false
	local grenade_slot_data = inventory_extension.get_slot_data(inventory_extension, "slot_grenade")

	if grenade_slot_data then
		local template = inventory_extension.get_item_template(inventory_extension, grenade_slot_data)
		can_give_grenade_to_other = template.can_give_other
	end

	local can_give_potion_to_other = false
	local potion_slot_data = inventory_extension.get_slot_data(inventory_extension, "slot_potion")

	if potion_slot_data then
		local template = inventory_extension.get_item_template(inventory_extension, potion_slot_data)
		can_give_potion_to_other = template.can_give_other
	end

	local conflict_director = Managers.state.conflict
	local self_segment = conflict_director.get_player_unit_segment(conflict_director, unit) or 1
	local level_settings = LevelHelper:current_level_settings()
	local disable_bot_main_path_teleport_check = level_settings.disable_bot_main_path_teleport_check
	local players = Managers.player:players()

	for k, player in pairs(players) do
		local player_unit = player.player_unit
		local is_bot = player.bot_player

		if AiUtils.unit_alive(player_unit) and player_unit ~= unit then
			local status_ext = ScriptUnit.extension(player_unit, "status_system")
			local utility = 0
			local look_at_ally = false

			if not status_ext.is_ready_for_assisted_respawn(status_ext) and not status_ext.near_vortex and (disable_bot_main_path_teleport_check or self_segment <= (conflict_director.get_player_unit_segment(conflict_director, player_unit) or 1)) then
				local in_need_type = nil

				if status_ext.is_knocked_down(status_ext) then
					in_need_type = "knocked_down"
					utility = 100
				elseif status_ext.get_is_ledge_hanging(status_ext) and not status_ext.is_pulled_up(status_ext) then
					in_need_type = "ledge"
					utility = 100
				elseif status_ext.is_hanging_from_hook(status_ext) then
					in_need_type = "hook"
					utility = 100
				else
					local health_percent = ScriptUnit.extension(player_unit, "health_system"):current_permanent_health_percent()
					local player_inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
					local player_locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")
					local is_wounded = status_ext.is_wounded(status_ext)
					local need_attention_type, extra_utility = self._player_needs_attention(self, unit, player_unit, blackboard, player_inventory_extension, player_locomotion_extension, t)

					if can_heal_other and (health_percent < WANTS_TO_HEAL_THRESHOLD or is_wounded) then
						in_need_type = "in_need_of_heal"
						local health_utility = ((is_wounded and health_percent*0.33) or health_percent) - 1
						utility = health_utility*15 + 70
					elseif can_give_healing_to_other and (health_percent < WANTS_TO_GIVE_HEAL_TO_OTHER or is_wounded) and not player_inventory_extension.get_slot_data(player_inventory_extension, "slot_healthkit") then
						in_need_type = "can_accept_heal_item"
						local health_utility = ((is_wounded and health_percent - 0.5) or health_percent) - 1
						utility = health_utility*10 + 70
					elseif can_give_grenade_to_other and not player_inventory_extension.get_slot_data(player_inventory_extension, "slot_grenade") and not is_bot then
						in_need_type = "can_accept_grenade"
						utility = 70
					elseif can_give_potion_to_other and not player_inventory_extension.get_slot_data(player_inventory_extension, "slot_potion") and not is_bot then
						in_need_type = "can_accept_potion"
						utility = 70
					elseif need_attention_type == "stop" then
						in_need_type = "in_need_of_attention_stop"
						look_at_ally = true
						utility = extra_utility + 5
					elseif need_attention_type == "look_at" then
						in_need_type = "in_need_of_attention_look"
						look_at_ally = true
						utility = extra_utility + 2
					end
				end

				if in_need_type or not is_bot then
					local target_pos = POSITION_LOOKUP[player_unit]
					local allowed_follow_path, allowed_aid_path = self._ally_path_allowed(self, unit, player_unit, t)

					if allowed_follow_path then
						if not allowed_aid_path then
							in_need_type = nil
						elseif in_need_type then
							local alive_bosses = conflict_director.alive_bosses(conflict_director)
							local num_alive_bosses = #alive_bosses

							for i = 1, num_alive_bosses, 1 do
								local boss_unit = alive_bosses[i]
								local boss_position = POSITION_LOOKUP[boss_unit]
								local target_to_boss_distance_sq = Vector3.distance_squared(target_pos, boss_position)
								local self_to_boss_distance_sq = Vector3.distance_squared(self_pos, boss_position)
								local boss_target = BLACKBOARDS[boss_unit].target_unit
								local boss_to_target_range_sq = (blackboard.target_ally_unit == player_unit and blackboard.target_ally_needs_aid and 9) or 12

								if boss_target == player_unit then
									boss_to_target_range_sq = boss_to_target_range_sq + 2
								end

								if target_to_boss_distance_sq < boss_to_target_range_sq or (boss_target == unit and self_to_boss_distance_sq < 12) then
									in_need_type = nil
									utility = 0

									break
								end
							end
						end

						if in_need_type or not is_bot then
							local real_dist = Vector3.distance(self_pos, target_pos)
							local dist = real_dist - utility

							if dist < closest_dist then
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
	local in_liquid = status_extension.is_in_liquid(status_extension)
	local use_liquid_escape_destination = blackboard.use_liquid_escape_destination
	local navigation_extension = blackboard.navigation_extension
	local is_disabled = status_extension.is_disabled(status_extension)

	if in_liquid and not is_disabled and (not use_liquid_escape_destination or navigation_extension.destination_reached(navigation_extension)) then
		local liquid_unit = status_extension.in_liquid_unit
		local liquid_extension = ScriptUnit.extension(liquid_unit, "area_damage_system")
		local rim_nodes, is_array = liquid_extension.get_rim_nodes(liquid_extension)
		local bot_position = POSITION_LOOKUP[unit]
		local best_distance_sq = math.huge
		local best_position = nil

		if is_array then
			local num_nodes = #rim_nodes

			for i = 1, num_nodes, 1 do
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

	return 
end
PlayerBotBase._should_re_evaluate_vortex_escape = function (self, current_position, previous_check_position, navigation_extension, vortex_unit)
	local re_evaluate_destination = false
	local escape_completed = false

	if Unit.alive(vortex_unit) then
		local vortex_extension = ScriptUnit.extension(vortex_unit, "ai_supplementary_system")
		escape_completed = not vortex_extension.is_position_inside(vortex_extension, current_position, VORTEX_ESCAPE_DISTANCE)
	else
		escape_completed = true
	end

	if not escape_completed then
		local traversed_distance_sq = Vector3.distance_squared(previous_check_position, current_position)
		local destination_reached = navigation_extension.destination_reached(navigation_extension)
		re_evaluate_destination = VORTEX_ESCAPE_RE_EVALUATE_DISTANCE_SQ <= traversed_distance_sq or (destination_reached and VORTEX_ESCAPE_RE_EVALUATE_REACHED_DISTANCE_SQ <= traversed_distance_sq)
	end

	return re_evaluate_destination, escape_completed
end
PlayerBotBase._find_vortex_escape_destination = function (self, start_position, rotation, nav_world, traverse_logic, best_weighted_distance_sq, largest_weighted_distance_sq)
	local best_weight, best_destination = nil
	local vortex_escape_directions = self._vortex_escape_directions
	local num_directions = #vortex_escape_directions

	for i = 1, num_directions, 1 do
		local escape_data = vortex_escape_directions[i]
		local base_weight = escape_data.weight
		local base_weight_sq = base_weight^2
		local direction = Quaternion.rotate(rotation, escape_data.direction:unbox())
		local _, last_valid_position = GwNavQueries.raycast(nav_world, start_position, start_position + direction*VORTEX_ESCAPE_DISTANCE, traverse_logic)
		local distance_sq = Vector3.distance_squared(start_position, last_valid_position)
		local weighted_distance_sq = distance_sq*base_weight_sq

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
	local is_disabled = status_extension.is_disabled(status_extension)
	local re_evaluate_destination = false
	local escape_completed = false

	if use_vortex_escape_destination then
		local current_vortex_escape_unit = blackboard.vortex_escape_unit
		local previous_check_position = blackboard.navigation_vortex_escape_previous_evaluation_position:unbox()
		re_evaluate_destination, escape_completed = self._should_re_evaluate_vortex_escape(self, self_position, previous_check_position, navigation_extension, current_vortex_escape_unit)
	end

	if not is_disabled and (re_evaluate_destination or (near_vortex and not use_vortex_escape_destination)) then
		blackboard.navigation_vortex_escape_previous_evaluation_position:store(self_position)

		local locomotion_extension = self._locomotion_extension
		local nav_world = blackboard.nav_world

		if locomotion_extension.is_on_ground(locomotion_extension) and GwNavQueries.triangle_from_position(nav_world, self_position, 0.25, 0.25) then
			local best_weighted_distance_sq = -math.huge
			local largest_weighted_distance_sq = self._vortex_largest_weighted_distance_sq

			if re_evaluate_destination then
				local current_escape_destination = blackboard.navigation_vortex_escape_destination_override:unbox()
				local current_escape_weight = blackboard.navigation_vortex_escape_weight + VORTEX_ESCAPE_STICKINESS_WEIGHT
				local current_escape_weight_sq = current_escape_weight^2
				best_weighted_distance_sq = Vector3.distance_squared(self_position, current_escape_destination)*current_escape_weight_sq

				if largest_weighted_distance_sq <= best_weighted_distance_sq then
					return 
				end
			end

			vortex_unit = status_extension.near_vortex_unit or blackboard.vortex_escape_unit
			local vortex_position = POSITION_LOOKUP[vortex_unit]
			local to_bot = self_position - vortex_position
			local to_bot_rotation = Quaternion.look(to_bot, Vector3.up())
			local traverse_logic = navigation_extension.traverse_logic(navigation_extension)
			local best_destination, best_weight, best_weighted_distance_sq = self._find_vortex_escape_destination(self, self_position, to_bot_rotation, nav_world, traverse_logic, best_weighted_distance_sq, largest_weighted_distance_sq)

			if best_destination then
				blackboard.use_vortex_escape_destination = true

				blackboard.navigation_vortex_escape_destination_override:store(best_destination)

				blackboard.navigation_vortex_escape_weight = best_weight
				blackboard.vortex_escape_unit = vortex_unit
			end
		end
	elseif use_vortex_escape_destination and (is_disabled or escape_completed or (not near_vortex and navigation_extension.destination_reached(navigation_extension))) then
		blackboard.use_vortex_escape_destination = false
		blackboard.vortex_escape_unit = nil
	end

	return 
end
PlayerBotBase._update_attack_request = function (self, t)
	local blackboard = self._blackboard
	local inventory_extension = blackboard.inventory_extension
	local _, right_hand_weapon_extension, left_hand_weapon_extension = CharacterStateHelper.get_item_data_and_weapon_extensions(inventory_extension)
	local _, current_action_extension, _ = CharacterStateHelper.get_current_action_data(left_hand_weapon_extension, right_hand_weapon_extension)
	local weapon_extension = current_action_extension or right_hand_weapon_extension or left_hand_weapon_extension

	if weapon_extension then
		weapon_extension.update_bot_attack_request(weapon_extension, t)
	end

	return 
end
PlayerBotBase._update_pickups = function (self, dt, t)
	local unit = self._unit
	local blackboard = self._blackboard
	blackboard.needs_ammo = false
	local target_unit = blackboard.priority_target_enemy or blackboard.target_unit
	local has_target = alive(target_unit)
	local ammo_percentage = (has_target and 0.1) or 0.9
	local inventory_extension = blackboard.inventory_extension
	local current, num_max = inventory_extension.current_ammo_status(inventory_extension, "slot_ranged")

	if current then
		blackboard.needs_ammo = current/num_max < ammo_percentage
	end

	return 
end
local INTERACTABLES_BROADPHASE_QUERY_RESULTS = {}
PlayerBotBase._update_interactables = function (self, dt, t)
	local blackboard = self._blackboard

	if self._interactable_timer < t then
		self._interactable_timer = t + 0.2 + Math.random()*0.15
		local door_ext = blackboard.interaction_unit and ScriptUnit.has_extension(blackboard.interaction_unit, "door_system")

		if door_ext and blackboard.interaction_unit ~= blackboard.target_ally_unit then
			blackboard.interaction_unit = nil
			blackboard.interaction_type = nil
		end

		local navigation_extension = blackboard.navigation_extension

		if navigation_extension.destination_reached(navigation_extension) then
			return 
		end

		local self_pos = POSITION_LOOKUP[self._unit]
		local num_doors = Managers.state.entity:system("door_system"):get_doors(self_pos, 1.5, INTERACTABLES_BROADPHASE_QUERY_RESULTS)
		local best_unit = nil
		local best_dist = math.huge
		local best_interaction_type = nil

		for i = 1, num_doors, 1 do
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
	elseif alive(blackboard.interaction_unit) then
		local door_ext = ScriptUnit.has_extension(blackboard.interaction_unit, "door_system")

		if door_ext and door_ext.is_open(door_ext) then
			blackboard.interaction_unit = nil
			blackboard.interaction_type = nil
		end
	elseif blackboard.interaction_unit then
		blackboard.interaction_unit = nil
		blackboard.interaction_type = nil
	end

	return 
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
		allow_forward_distance = math.min(allow_forward_distance, Vector3.length(offset)*0.5)
	end

	local search_pos = self_pos + (max_radius - allow_forward_distance)*offset_vector
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

	local direct_dist = Vector3.length(diff - lateral_dist*dir)

	if math.min(lateral_dist, width) < direct_dist then
		return false
	else
		return true
	end

	return 
end

PlayerBotBase._in_line_of_fire = function (self, self_unit, self_pos, take_cover_targets, taking_cover_from)
	local changed = false
	local in_line_of_fire = false
	local width = 2.5
	local sticky_width = 6
	local length = 40

	for attacker, victim in pairs(take_cover_targets) do
		local already_in_cover_from = taking_cover_from[attacker]

		if alive(victim) and (victim == self_unit or line_of_fire_check(POSITION_LOOKUP[attacker], POSITION_LOOKUP[victim], self_pos, (already_in_cover_from and sticky_width) or width, length)) then
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
	return vector3.x + vector3.y*10000 + vector3.z*0.0001
end

PlayerBotBase.cb_cover_point_path_result = function (self, hash, success, destination)
	if not success then
		local cover_bb = self._blackboard.taking_cover
		cover_bb.failed_cover_points[hash] = true

		table.clear(cover_bb.active_threats)
		dprint("failed cover point", destination)
	end

	return 
end
PlayerBotBase._update_cover = function (self, unit, self_pos, blackboard, cover_bb, follow_bb)
	local cover_position = nil
	local in_line_of_fire, changed = self._in_line_of_fire(self, unit, self_pos, cover_bb.threats, cover_bb.active_threats)
	local bot_group_system = Managers.state.entity:system("ai_bot_group_system")

	if in_line_of_fire and changed then
		local fails = cover_bb.fails
		local radius = math.min(fails*5 + 5, 40)
		local allowed_forward_dist = radius*0.4
		local num_found, hidden_cover_units = self._find_cover(self, cover_bb.active_threats, self_pos, radius, allowed_forward_dist)
		local found_point, found_unit, occupied_cover_unit, occupied_cover_point = nil

		for i = 1, num_found, 1 do
			local cover_unit = hidden_cover_units[i]
			local pos = Unit.local_position(cover_unit, 0)

			if not cover_bb.failed_cover_points[to_hash(pos)] then
				if bot_group_system.in_cover(bot_group_system, cover_unit) then
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

			dprint("found point", cover_position)
			bot_group_system.set_in_cover(bot_group_system, unit, found_unit)
		else
			cover_bb.fails = cover_bb.fails + 1

			table.clear(cover_bb.active_threats)
			dprint("failed to find point, forcing re-evaluation")
		end
	elseif not in_line_of_fire and changed then
		cover_bb.cover_position:store(Vector3.invalid_vector())

		cover_bb.cover_unit = nil
		cover_bb.fails = 0
		follow_bb.needs_target_position_refresh = true

		bot_group_system.set_in_cover(bot_group_system, unit, nil)
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
local VORTEX_SAFE_PATH_CHECK_DISTANCE = 15
local MIN_ALLOWED_VORTEX_DISTANCE = 2
PlayerBotBase._update_movement_target = function (self, dt, t)
	local unit = self._unit
	local self_pos = POSITION_LOOKUP[unit]
	local blackboard = self._blackboard
	local override_box = blackboard.navigation_destination_override
	local override_melee = blackboard.melee and blackboard.melee.engage_position_set and override_box.unbox(override_box)
	local override_liquid_escape = blackboard.use_liquid_escape_destination and blackboard.navigation_liquid_escape_destination_override:unbox()
	local override_vortex_escape = blackboard.use_vortex_escape_destination and blackboard.navigation_vortex_escape_destination_override:unbox()
	local moving_towards_follow_position = false
	local follow_bb = blackboard.follow
	local cover_bb = blackboard.taking_cover
	local cover_position = self._update_cover(self, unit, self_pos, blackboard, cover_bb, follow_bb)
	local transport_unit_override = nil
	local nav_world = self._nav_world
	local target_ally_unit = blackboard.target_ally_unit

	if alive(target_ally_unit) then
		local ally_status_extension = ScriptUnit.extension(target_ally_unit, "status_system")
		local transport_unit = ally_status_extension.get_inside_transport_unit(ally_status_extension)

		if alive(transport_unit) and not blackboard.target_ally_needs_aid then
			blackboard.ally_inside_transport_unit = transport_unit
			local transportation_ext = ScriptUnit.extension(blackboard.ally_inside_transport_unit, "transportation_system")
			local has_valid_transportation_unit = transportation_ext.story_state == "stopped_beginning"

			if has_valid_transportation_unit then
				transport_unit_override = LocomotionUtils.new_goal_in_transport(nav_world, unit, target_ally_unit)
			end
		elseif blackboard.ally_inside_transport_unit then
			blackboard.ally_inside_transport_unit = nil
		end
	else
		blackboard.ally_inside_transport_unit = nil
	end

	local navigation_extension = blackboard.navigation_extension
	local previous_destination = navigation_extension.destination(navigation_extension)
	local ai_bot_group_extension = blackboard.ai_bot_group_extension
	local hold_position, hold_position_max_distance_sq = ai_bot_group_extension.get_hold_position(ai_bot_group_extension)
	local hold_position_offset = hold_position and hold_position - previous_destination
	local hold_position_offset_z = hold_position_offset and math.abs(hold_position_offset.z)
	local flat_hold_position_offset_length_sq = hold_position_offset and Vector3.length_squared(Vector3.flat(hold_position_offset))
	local should_go_back = hold_position_offset and (HOLD_POSITION_MAX_ALLOWED_Z < hold_position_offset_z or hold_position_max_distance_sq < flat_hold_position_offset_length_sq)
	local stop_for_vortex = not override_vortex_escape and blackboard.vortex_exist and not navigation_extension.is_path_safe_from_vortex(navigation_extension, VORTEX_SAFE_PATH_CHECK_DISTANCE, MIN_ALLOWED_VORTEX_DISTANCE)

	if should_go_back then
		navigation_extension.move_to(navigation_extension, hold_position)

		blackboard.using_navigation_destination_override = true
	elseif stop_for_vortex then
		local path_callback = navigation_extension.path_callback(navigation_extension)

		if path_callback then
			path_callback(false, previous_destination, true)
		end

		navigation_extension.stop(navigation_extension)

		if override_melee then
			blackboard.melee.engage_position_set = false
		end

		dprint("stop to avoid vortex")
	elseif override_vortex_escape or override_liquid_escape or cover_position or override_melee then
		local override = transport_unit_override or override_vortex_escape or override_liquid_escape or cover_position or override_melee
		local offset = override - previous_destination
		local override_allowed = hold_position == nil or Vector3.distance_squared(hold_position, override) <= hold_position_max_distance_sq

		if override_allowed and (Z_MOVE_TO_EPSILON < math.abs(offset.z) or FLAT_MOVE_TO_EPSILON < Vector3.length(Vector3.flat(offset))) then
			local should_stop = override_melee and blackboard.melee.stop_at_current_position

			if should_stop then
				navigation_extension.stop(navigation_extension)
			else
				local path_callback = (not transport_unit_override and cover_position and callback(self, "cb_cover_point_path_result", to_hash(override))) or nil

				navigation_extension.move_to(navigation_extension, override, path_callback)
			end

			blackboard.using_navigation_destination_override = true
		end
	else
		follow_bb.follow_timer = follow_bb.follow_timer - dt
		local interaction_extension = blackboard.interaction_extension
		local is_interacting = interaction_extension.is_interacting(interaction_extension)
		local need_to_stop = blackboard.target_ally_need_type == "in_need_of_attention_stop"

		if not follow_bb.needs_target_position_refresh and (follow_bb.follow_timer < 0 or need_to_stop or (blackboard.target_ally_needs_aid and not is_interacting and navigation_extension.destination_reached(navigation_extension))) then
			follow_bb.needs_target_position_refresh = true
		end

		if follow_bb.needs_target_position_refresh then
			local target_position, should_stop = nil
			local goal_selection_func_name = blackboard.follow.goal_selection_func
			local path_callback = nil
			local enemy_unit = blackboard.target_unit
			local priority_target_enemy = blackboard.priority_target_enemy

			if blackboard.revive_with_urgent_target and blackboard.target_ally_needs_aid and blackboard.target_ally_need_type ~= "in_need_of_attention_look" then
				target_position, should_stop = self._alter_target_position(self, nav_world, self_pos, target_ally_unit, POSITION_LOOKUP[target_ally_unit], blackboard.target_ally_need_type)
				blackboard.interaction_unit = target_ally_unit

				blackboard.target_ally_aid_destination:store(target_position)

				path_callback = callback(self, "cb_ally_path_result", target_ally_unit)

				dprint("path to ally")
			elseif priority_target_enemy and enemy_unit ~= priority_target_enemy and self._enemy_path_allowed(self, priority_target_enemy) then
				target_position = self._find_target_position_on_nav_mesh(self, nav_world, POSITION_LOOKUP[priority_target_enemy])
				path_callback = callback(self, "cb_enemy_path_result", priority_target_enemy)

				dprint("path to priority enemy", priority_target_enemy, target_position)
			elseif enemy_unit and (enemy_unit == priority_target_enemy or enemy_unit == blackboard.urgent_target_enemy) and self._enemy_path_allowed(self, enemy_unit) then
				target_position = self._find_target_position_on_nav_mesh(self, nav_world, POSITION_LOOKUP[enemy_unit])
				path_callback = callback(self, "cb_enemy_path_result", enemy_unit)

				dprint("path to enemy", enemy_unit, target_position)
			elseif blackboard.target_ally_needs_aid and blackboard.target_ally_need_type ~= "in_need_of_attention_look" then
				target_position, should_stop = self._alter_target_position(self, nav_world, self_pos, target_ally_unit, POSITION_LOOKUP[target_ally_unit], blackboard.target_ally_need_type)
				blackboard.interaction_unit = target_ally_unit

				blackboard.target_ally_aid_destination:store(target_position)

				path_callback = callback(self, "cb_ally_path_result", target_ally_unit)

				dprint("path to ally")
			elseif goal_selection_func_name and alive(target_ally_unit) then
				local func = LocomotionUtils[goal_selection_func_name]
				target_position = func(nav_world, unit, target_ally_unit)

				dprint("path to goal")
			elseif alive(blackboard.health_pickup) and blackboard.allowed_to_take_health_pickup and t < blackboard.health_pickup_valid_until and (self._last_health_pickup_attempt.unit ~= blackboard.health_pickup or not self._last_health_pickup_attempt.blacklist) then
				local pickup_unit = blackboard.health_pickup
				target_position = self._find_pickup_position_on_navmesh(self, nav_world, self_pos, pickup_unit, self._last_health_pickup_attempt)

				if target_position then
					path_callback = callback(self, "cb_health_pickup_path_result", pickup_unit)
					blackboard.interaction_unit = pickup_unit
				end

				dprint("path to health pickup")
			elseif alive(blackboard.mule_pickup) and (self._last_mule_pickup_attempt.unit ~= blackboard.mule_pickup or not self._last_mule_pickup_attempt.blacklist) then
				local pickup_unit = blackboard.mule_pickup
				target_position = self._find_pickup_position_on_navmesh(self, nav_world, self_pos, pickup_unit, self._last_mule_pickup_attempt)

				if target_position then
					path_callback = callback(self, "cb_mule_pickup_path_result", pickup_unit)
					blackboard.interaction_unit = pickup_unit
				end

				dprint("path to mule pickup")
			end

			if not target_position and alive(blackboard.ammo_pickup) and blackboard.needs_ammo and t < blackboard.ammo_pickup_valid_until then
				local ammo_position = POSITION_LOOKUP[blackboard.ammo_pickup]
				local dir = Vector3.normalize(self_pos - ammo_position)
				local above = 0.5
				local below = 1.5
				local lateral = 1
				local distance = 0
				target_position = self._find_position_on_navmesh(self, nav_world, ammo_position, ammo_position + dir, above, below, INTERACT_RAY_DISTANCE - 0.3, distance)

				if target_position then
					blackboard.interaction_unit = blackboard.ammo_pickup
				end

				dprint("path to ammo pickup")
			end

			new_position_is_outside_hold_radius = hold_position and target_position and hold_position_max_distance_sq < Vector3.distance_squared(hold_position, target_position)

			if new_position_is_outside_hold_radius then
				target_position = nil
			end

			if not target_position then
				target_position = ai_bot_group_extension.data.follow_position
				moving_towards_follow_position = true
			end

			if should_stop then
				navigation_extension.stop(navigation_extension)
			elseif target_position then
				blackboard.moving_toward_follow_position = moving_towards_follow_position
				follow_bb.needs_target_position_refresh = false
				follow_bb.follow_timer = math.lerp(FOLLOW_TIMER_LOWER_BOUND, FOLLOW_TIMER_UPPER_BOUND, Math.random())

				follow_bb.target_position:store(target_position)

				local current_destination = nil

				if navigation_extension.destination_reached(navigation_extension) then
					current_destination = self_pos
				else
					current_destination = previous_destination
				end

				local offset = target_position - current_destination

				if Z_MOVE_TO_EPSILON < math.abs(offset.z) or FLAT_MOVE_TO_EPSILON < Vector3.length(Vector3.flat(offset)) then
					dprint("move to ", target_position)
					navigation_extension.move_to(navigation_extension, target_position, path_callback)
				end

				blackboard.using_navigation_destination_override = false
			end
		end

		if blackboard.using_navigation_destination_override then
			navigation_extension.move_to(navigation_extension, follow_bb.target_position:unbox())

			blackboard.using_navigation_destination_override = false
		end

		local current_goal = navigation_extension.current_goal(navigation_extension)
		local area_damage_system = Managers.state.entity:system("area_damage_system")

		if current_goal and area_damage_system.is_position_in_liquid(area_damage_system, current_goal, BotNavTransitionManager.NAV_COST_MAP_LAYERS) then
			dprint("stop, next goal is in liquid ", current_goal)
			navigation_extension.stop(navigation_extension)
		end
	end

	return 
end
local PICKUP_ROTATIONS = {
	QuaternionBox(Quaternion(Vector3.up(), 0)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi*0.25)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi*0.25)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi*0.5)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi*0.5)),
	QuaternionBox(Quaternion(Vector3.up(), math.pi*0.75)),
	QuaternionBox(Quaternion(Vector3.up(), -math.pi*0.75)),
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
			local pos = pickup_pos + dir*dist*range
			local success, z = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

			if success then
				pos.z = z

				if 0.8 <= dist then
					found_position = pos
				else
					local ray_end_pos = pos + (dist - 1)*dir*range
					local success, ray_hit_pos = GwNavQueries.raycast(nav_world, pos, ray_end_pos)

					if success then
						found_position = ray_end_pos
						dist = 1
					else
						found_position = pos*0.1 + ray_hit_pos*0.9
						dist = Vector3.dot(Vector3.flat(found_position - pickup_pos), dir)
					end
				end
			end

			if FLAT_MOVE_TO_EPSILON - 1 <= dist then
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

	return 
end
PlayerBotBase._find_position_on_navmesh = function (self, nav_world, original_position, offset_position, above, below, lateral, distance)
	local success, z = GwNavQueries.triangle_from_position(nav_world, offset_position, above, below)

	if success then
		return Vector3(offset_position.x, offset_position.y, z)
	else
		local success, z = GwNavQueries.triangle_from_position(nav_world, original_position, above, below)

		if success then
			return Vector3(offset_position.x, offset_position.y, z)
		else
			return GwNavQueries.inside_position_from_outside_position(nav_world, original_position, above, below, lateral, distance)
		end
	end

	return 
end
PlayerBotBase.destroy = function (self)
	self._brain:destroy()

	if self._blackboard.taking_cover.cover_unit then
		Managers.state.entity:system("ai_bot_group_system"):set_in_cover(self._unit, nil)
	end

	return 
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
	local debug_sphere_position = Unit.local_position(self._unit, 0) + Vector3.up()*2
	local color = self._player.color:unbox()

	drawer.sphere(drawer, debug_sphere_position, 0.25, color)

	local blackboard = self._blackboard
	local enemy = blackboard.target_unit
	local ally = blackboard.target_ally_unit
	local radius_offset = self._player:local_player_id()*0.05

	if alive(enemy) then
		local enemy_pose = Unit.world_pose(enemy, 0)
		local z_offset = radius_offset + 1.5

		Matrix4x4.set_translation(enemy_pose, POSITION_LOOKUP[enemy] + Vector3.up()*z_offset)
		drawer.line(drawer, debug_sphere_position, Unit.world_position(enemy, 0) + Vector3(0, 0, 1.5), Color(125, 255, 0, 0))
		drawer.box(drawer, enemy_pose, Vector3(radius_offset + 0.5, radius_offset + 0.5, z_offset), color)
	end

	if alive(ally) then
		drawer.circle(drawer, POSITION_LOOKUP[ally] + Vector3(0, 0, 0.2), radius_offset + 0.6, Vector3.up(), color, 16)
	end

	self._brain:debug_draw_current_behavior()

	return 
end
PlayerBotBase.clear_failed_paths = function (self)
	table.clear(self._attempted_ally_paths)
	table.clear(self._attempted_enemy_paths)

	return 
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
	dprint("path to enemy result " .. ((success and "success") or "failed"))

	for unit, path in pairs(paths) do
		if not alive(unit) then
			paths[unit] = nil
		end
	end

	return 
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

	return 
end
PlayerBotBase.cb_mule_pickup_path_result = function (self, pickup_unit, success, destination, forced_callback)
	if forced_callback then
		return 
	end

	if pickup_unit == self._last_mule_pickup_attempt.unit then
		self._last_mule_pickup_attempt.path_failed = not success
	end

	return 
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
		if not alive(unit) then
			paths[unit] = nil
		end
	end

	return 
end
local ALLY_PATH_TIME_MIN_DISTANCE_SQ = 25
local ALLY_PATH_TIME_MAX_DISTANCE_SQ = 225
local ALLY_PATH_TIME_DISTANCE_SLOPE = (ALLY_PATH_TIME_MAX_DISTANCE_SQ - ALLY_PATH_TIME_MIN_DISTANCE_SQ)/1
local ALLY_PATH_MIN_DISTANCE_TIME = 3
local ALLY_PATH_MAX_DISTANCE_TIME = 12
PlayerBotBase._ally_path_allowed = function (self, self_unit, ally_unit, t)
	local path_status = self._attempted_ally_paths[ally_unit]

	if path_status and path_status.failed then
		local self_position = POSITION_LOOKUP[self_unit]
		local ally_position = POSITION_LOOKUP[ally_unit]
		local ally_distance_sq = Vector3.distance_squared(self_position, ally_position)
		local p = math.clamp((ally_distance_sq - ALLY_PATH_TIME_MIN_DISTANCE_SQ)*ALLY_PATH_TIME_DISTANCE_SLOPE, 0, 1)
		local wait_time = math.lerp(ALLY_PATH_MIN_DISTANCE_TIME, ALLY_PATH_MAX_DISTANCE_TIME, p)

		if path_status.ignore_ally_from + wait_time < t then
			return true, true
		end

		local conflict_director = Managers.state.conflict
		local self_segment = conflict_director.get_player_unit_segment(conflict_director, self._unit) or -1
		local target_segment = conflict_director.get_player_unit_segment(conflict_director, ally_unit) or -1
		local ignore_for = nil

		if self_segment < target_segment then
			ignore_for = 1
		elseif target_segment < self_segment then
			ignore_for = 10
		else
			ignore_for = 5
		end

		local no_longer_ignored = path_status.ignore_ally_from + ignore_for < t

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

	return 
end

return 
