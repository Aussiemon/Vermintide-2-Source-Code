-- chunkname: @scripts/managers/telemetry/telemetry_events.lua

require("scripts/managers/telemetry/telemetry_settings")
require("scripts/managers/telemetry/telemetry_rpc_listener")
require("scripts/managers/telemetry/telemetry_event")

local SOURCE = table.remove_empty_values(TelemetrySettings.source)

TelemetryEvents = class(TelemetryEvents)

TelemetryEvents.init = function (self, manager)
	self._manager = manager
	self.rpc_listener = TelemetryRPCListener:new(self)
	self._subject = {}

	if script_data.testify then
		self._subject.machine_id = Application.machine_id and Application.machine_id()
		self._subject.machine_name = script_data.machine_name
	end

	self._session = {
		game = Application.guid(),
	}
	self._context = {}

	if IS_XB1 then
		SOURCE.console_type = XboxOne.console_type_string()
	elseif IS_PS4 then
		SOURCE.console_type = PS4.is_pro() and "pro" or "not_pro"
	end

	self:game_startup()
end

TelemetryEvents.destroy = function (self)
	self:game_shutdown()
end

TelemetryEvents.game_startup = function (self)
	local event = self:_create_event("game_startup")

	self._manager:register_event(event)
end

TelemetryEvents.game_shutdown = function (self)
	local event = self:_create_event("game_shutdown")

	event:set_data({
		time_in_game = Application.time_since_launch(),
	})
	self._manager:register_event(event)
end

TelemetryEvents.game_started = function (self, data)
	local event = self:_create_event("game_started")
	local mutator_names = {}

	table.keys(data.mutators, mutator_names)
	table.sort(mutator_names)
	event:set_data({
		peer_type = data.peer_type,
		country_code = data.country_code,
		quick_game = data.quick_game,
		game_mode = data.game_mode,
		level_key = data.level_key,
		difficulty = data.difficulty,
		mutators = table.concat(mutator_names, ","),
		realm = data.realm,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_round_started = function (self, player_id, game_round, match_id, slot_melee, slot_ranged, talents)
	local event = self:_create_event("versus_round_started")

	event:set_data({
		player_id = player_id,
		game_round = game_round,
		match_id = match_id,
		slot_melee = slot_melee,
		slot_ranged = slot_ranged,
		talents = talents,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_round_ended = function (self, score, game_round, match_id)
	local event = self:_create_event("versus_round_end")

	event:set_data({
		score = score,
		game_round = game_round,
		match_id = match_id,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_match_ended = function (self, match_id, is_draw, winning_team)
	local event = self:_create_event("versus_match_ended")

	event:set_data({
		match_id = match_id,
		is_draw = is_draw,
		winning_team = winning_team,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_pactsworn_picking = function (self, match_id, player_id, career_options, selected_career, career_selection_time_elapsed, platform, build)
	local event = self:_create_event("versus_pactsworn_picking")

	event:set_data({
		match_id = match_id,
		player_id = player_id,
		career_options = career_options,
		selected_career = selected_career,
		career_selection_time_elapsed = career_selection_time_elapsed,
		platform = platform,
		build = build,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_objective_started = function (self, match_id, objective_id, round_id, objective_name)
	local event = self:_create_event("versus_objective_started")

	event:set_data({
		match_id = match_id,
		objective_id = objective_id,
		round_id = round_id,
		objective_name = objective_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_objective_section_completed = function (self, match_id, objective_id, round_id, objective_name, num_sections_completed, total_num_sections)
	local event = self:_create_event("versus_objective_section_completed")

	event:set_data({
		match_id = match_id,
		objective_id = objective_id,
		round_id = round_id,
		objective_name = objective_name,
		num_sections_completed = num_sections_completed,
		total_num_sections = total_num_sections,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_activated_ability = function (self, match_id, game_round, player_id, ability_name)
	local event = self:_create_event("versus_activated_ability")

	event:set_data({
		match_id = match_id,
		game_round = game_round,
		player_id = player_id,
		ability_name = ability_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.weave_activated = function (self, wind, tier)
	local event = self:_create_event("weave_activated")

	event:set_data({
		wind = wind,
		tier = tier,
	})
	self._manager:register_event(event)
end

TelemetryEvents.round_started = function (self)
	local event = self:_create_event("round_started")

	self._manager:register_event(event)
end

TelemetryEvents.objective_captured = function (self, remaining_time)
	local event = self:_create_event("objective_captured")

	event:set_data({
		remaining_time = remaining_time,
	})
	self._manager:register_event(event)
end

TelemetryEvents.badge_gained = function (self, badge_name)
	local event = self:_create_event("badge_gained")

	event:set_data({
		badge_name = badge_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.node_climb = function (self, breed_name, node_position)
	local event = self:_create_event("node_climb")

	event:set_data({
		breed_name = breed_name,
		node_position = node_position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.left_ghost_mode = function (self, breed_name, position)
	local event = self:_create_event("left_ghost_mode")

	event:set_data({
		breed_name = breed_name,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.game_ended = function (self, end_reason)
	local event = self:_create_event("game_ended")

	event:set_data({
		end_reason = end_reason,
	})
	self._manager:register_event(event)

	self._session.server = nil
end

TelemetryEvents.client_session_id = function (self, session_id)
	self._session.client = session_id
end

TelemetryEvents.server_session_id = function (self, session_id)
	self._session.server = session_id
end

TelemetryEvents.ai_died = function (self, id, breed, position)
	local event = self:_create_event("ai_died")

	event:set_data({
		id = id,
		breed = breed,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.ai_spawned = function (self, id, breed, position, enhancements_array)
	local event = self:_create_event("ai_spawned")
	local enhancements = {}

	if enhancements_array then
		for i = 1, #enhancements_array do
			local enhancement_data = enhancements_array[i]

			enhancements[enhancement_data.name] = true
		end
	end

	event:set_data({
		id = id,
		breed = breed,
		position = position,
		enhancements = enhancements,
	})
	self._manager:register_event(event)
end

TelemetryEvents.ai_despawned = function (self, breed, position, reason)
	local event = self:_create_event("ai_despawned")

	event:set_data({
		breed = breed,
		position = position,
		reason = reason or "unknown",
	})
	self._manager:register_event(event)
end

local function matchmaking_peers()
	local party_peers
	local party = Managers.party:get_local_player_party()

	if party then
		local occupied_slots = party.occupied_slots

		party_peers = table.select_array(occupied_slots, function (_, status)
			local peer_id, local_player_id = status.peer_id, status.local_player_id

			if peer_id and local_player_id then
				return PlayerUtils.unique_player_id(peer_id, local_player_id)
			end
		end)
	end

	return party_peers or {}
end

TelemetryEvents.matchmaking_search = function (self, player, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "search",
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.matchmaking_search_timeout = function (self, player, time_taken, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "search_timeout",
		time_taken = time_taken,
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.matchmaking_cancelled = function (self, player, time_taken, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "cancelled",
		time_taken = time_taken,
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.matchmaking_hosting = function (self, player, time_taken, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "hosting",
		time_taken = time_taken,
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.matchmaking_starting_game = function (self, player, time_taken, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "starting_game",
		time_taken = time_taken,
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.matchmaking_player_joined = function (self, player, time_taken, data)
	if player and player.remote then
		return
	end

	local event = self:_create_event("matchmaking")

	event:set_data(table.merge({
		state = "player_joined",
		time_taken = time_taken,
		party_peers = matchmaking_peers(),
	}, data))
	self._manager:register_event(event)
end

TelemetryEvents.pickup_spawned = function (self, pickup_name, spawn_type, position)
	local event = self:_create_event("pickup_spawned")

	event:set_data({
		pickup_name = pickup_name,
		spawn_type = spawn_type,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.pickup_destroyed = function (self, pickup_name, spawn_type, position)
	local event = self:_create_event("pickup_destroyed")

	event:set_data({
		pickup_name = pickup_name,
		spawn_type = spawn_type,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_ammo_depleted = function (self, player, weapon_name, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_ammo_depleted", self._session)

	event:set_data({
		weapon_name = weapon_name,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_ammo_refilled = function (self, player, weapon_name, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_ammo_refilled", self._session)

	event:set_data({
		weapon_name = weapon_name,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_damaged = function (self, player, damage_type, damage_source, damage_amount, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_damaged", self._session)

	event:set_data({
		damage_type = damage_type,
		damage_source = damage_source,
		damage_amount = damage_amount,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.local_player_damaged_player = function (self, player, target_breed, damage_amount, attacker_position, target_position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "local_player_damaged_player", self._session)

	event:set_data({
		target_breed = target_breed,
		damage_amount = damage_amount,
		attacker_position = attacker_position,
		target_position = target_position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_died = function (self, player, damage_type, damage_source, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_died", self._session)

	event:set_data({
		damage_type = damage_type,
		damage_source = damage_source,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.local_player_killed_player = function (self, player, position, target_position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "local_player_killed_player", self._session)

	event:set_data({
		position = position,
		target_position = target_position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_killed_ai = function (self, player, player_position, victim_position, breed, weapon_name, damage_type, hit_zone)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_killed_ai", self._session)

	event:set_data({
		player_position = player_position,
		victim_position = victim_position,
		breed = breed,
		weapon_name = weapon_name,
		damage_type = damage_type,
		hit_zone = hit_zone,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_knocked_down = function (self, player, damage_type, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_knocked_down", self._session)

	event:set_data({
		damage_type = damage_type,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_pickup = function (self, player, pickup_name, pickup_spawn_type, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_pickup", self._session)

	event:set_data({
		pickup_name = pickup_name,
		pickup_spawn_type = pickup_spawn_type,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_revived = function (self, reviver, revivee, position)
	if not reviver.remote then
		local event = TelemetryEvent:new(SOURCE, {
			id = reviver:telemetry_id(),
		}, "player_revived_another_player", self._session)

		event:set_data({
			position = position,
		})
		self._manager:register_event(event)
	end

	if not revivee.remote then
		local event = TelemetryEvent:new(SOURCE, {
			id = revivee:telemetry_id(),
		}, "player_revived", self._session)

		event:set_data({
			position = position,
		})
		self._manager:register_event(event)
	end
end

TelemetryEvents.player_spawned = function (self, player)
	if player and player.remote then
		return
	end

	local career_system = ScriptUnit.extension(player.player_unit, "career_system")
	local inventory_system = ScriptUnit.extension(player.player_unit, "inventory_system")
	local equipment = inventory_system:equipment()
	local slot_melee = equipment.slots.slot_melee
	local slot_ranged = equipment.slots.slot_ranged
	local cosmetic_slot_melee = CosmeticUtils.get_cosmetic_slot(player, "slot_melee")
	local cosmetic_slot_ranged = CosmeticUtils.get_cosmetic_slot(player, "slot_ranged")
	local cosmetic_slot_hat = CosmeticUtils.get_cosmetic_slot(player, "slot_hat")
	local cosmetic_slot_skin = CosmeticUtils.get_cosmetic_slot(player, "slot_skin")
	local cosmetic_slot_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
	local talents = {}

	if ScriptUnit.has_extension(player.player_unit, "talent_system") then
		talents = ScriptUnit.extension(player.player_unit, "talent_system"):get_talent_names()
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_spawned", self._session)

	event:set_data({
		hero = player:profile_display_name(),
		career = player:career_name(),
		human = player.local_player == true,
		power_level = career_system:get_career_power_level(),
		slot_melee = slot_melee and slot_melee.item_data.name,
		slot_melee_skin = cosmetic_slot_melee and cosmetic_slot_melee.skin_name or "default",
		slot_ranged = slot_ranged and slot_ranged.item_data.name,
		slot_ranged_skin = cosmetic_slot_ranged and cosmetic_slot_ranged.skin_name or "default",
		slot_hat = cosmetic_slot_hat and cosmetic_slot_hat.item_name,
		slot_skin = cosmetic_slot_skin and cosmetic_slot_skin.item_name,
		slot_frame = cosmetic_slot_frame and cosmetic_slot_frame.item_name,
		talents = talents,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_despawned = function (self, player)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_despawned", self._session)

	self._manager:register_event(event)
end

TelemetryEvents.player_used_item = function (self, player, item_name, position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_used_item", self._session)

	event:set_data({
		item_name = item_name,
		position = position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.ping_used = function (self, player, own_ping, ping_type, ping_target, player_position)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "ping_used", self._session)

	event:set_data({
		own_ping = own_ping,
		ping_type = ping_type,
		ping_target = ping_target,
		player_position = player_position,
	})
	self._manager:register_event(event)
end

TelemetryEvents.tech_settings = function (self, resolution, graphics_quality, screen_mode, rendering_backend)
	local event = self:_create_event("tech_settings")

	event:set_data({
		resolution = resolution,
		graphics_quality = graphics_quality,
		screen_mode = screen_mode,
		rendering_backend = rendering_backend,
	})
	self._manager:register_event(event)
end

TelemetryEvents.tech_system = function (self, system_info, adapter_index)
	local event = self:_create_event("tech_system")

	event:set_data({
		system_info = system_info,
		adapter_index = adapter_index,
	})
	self._manager:register_event(event)
end

TelemetryEvents.ui_settings = function (self, use_pc_menu_layout)
	local event = self:_create_event("ui_menu_layout")

	event:set_data({
		use_pc_menu_layout = use_pc_menu_layout,
	})
	self._manager:register_event(event)
end

TelemetryEvents.vo_event_played = function (self, category, dialogue, sound_event, unit_name)
	local event = self:_create_event("vo_event_played")

	event:set_data({
		category = category,
		dialogue = dialogue,
		sound_event = sound_event,
		unit_name = unit_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.terror_event_started = function (self, event_name)
	local event = self:_create_event("terror_event_started")

	event:set_data({
		event_name = event_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.level_progression = function (self, percent)
	local event = self:_create_event("level_progression")

	event:set_data({
		percent = percent,
	})
	self._manager:register_event(event)
end

TelemetryEvents.memory_statistics = function (self, memory_tree, memory_resources, tag)
	local event = self:_create_event("memory_statistics")

	event:set_data({
		memory_tree = memory_tree,
		memory_resources,
		tag = tag,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_stuck = function (self, player, level_key)
	if player and player.remote then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_stuck", self._session)

	event:set_data({
		level_key = level_key,
		position = Unit.local_position(player.player_unit, 0),
		rotation = Unit.local_rotation(player.player_unit, 0),
	})
	self._manager:register_event(event)
end

TelemetryEvents.fps = function (self, avg_fps, histogram)
	local event = self:_create_event("fps")

	event:set_data({
		avg_fps = avg_fps,
		histogram = histogram,
	})
	self._manager:register_event(event)
end

TelemetryEvents.fps_at_point = function (self, point_id, cam_pos, cam_rot, avg_fps)
	local event = self:_create_event("fps_at_point")

	event:set_data({
		point_id = point_id,
		cam_pos = cam_pos,
		cam_rot = cam_rot,
		avg_fps = avg_fps,
	})
	self._manager:register_event(event)
end

TelemetryEvents.end_of_game_rewards = function (self, rewards)
	local event = self:_create_event("end_of_game_rewards")

	event:set_data({
		rewards = rewards,
	})
	self._manager:register_event(event)
end

TelemetryEvents.magic_item_level_upgraded = function (self, item_id, essence_cost, new_magic_level)
	local event = self:_create_event("magic_item_level_upgraded")

	event:set_data({
		item_id = item_id,
		essence_cost = essence_cost,
		new_magic_level = new_magic_level,
	})
	self._manager:register_event(event)
end

TelemetryEvents.store_opened = function (self)
	local event = self:_create_event("store_opened")

	self._manager:register_event(event)
end

TelemetryEvents.store_closed = function (self)
	local event = self:_create_event("store_closed")

	self._manager:register_event(event)
end

TelemetryEvents.store_breadcrumbs_changed = function (self, widgets, product)
	local path = {}
	local path_localized = {}

	for _, widget in ipairs(widgets) do
		path[#path + 1] = widget.content.page_name
		path_localized[#path_localized + 1] = widget.content.text
	end

	if product and path[#path] == "item_details" then
		path[#path] = product.product_id
	end

	local event = self:_create_event("store_breadcrumbs_changed")

	event:set_data({
		path = path,
		path_localized = path_localized,
	})
	self._manager:register_event(event)
end

TelemetryEvents.store_product_purchased = function (self, product)
	local item = product.product_item or product.item
	local currency_type = "SM"
	local regular_prices = item and item.regular_prices
	local current_prices = item and item.current_prices

	for currency, settings in pairs(DLCSettings.store.currency_ui_settings) do
		local has_regular_price = regular_prices[currency]
		local has_current_price = current_prices[currency]

		if has_regular_price and has_current_price then
			currency_type = currency

			break
		end
	end

	local current_price = current_prices[currency_type]
	local regular_price = regular_prices[currency_type]
	local prod = {
		id = product.product_id,
		type = item.data.item_type,
		current_price = current_price or regular_price,
		regular_price = regular_price,
		currency = currency_type,
	}

	self:_store_product_purchased(prod)
end

local function find_steam_currency(product)
	local price = tonumber(product.item.steam_price)
	local steam_data = product.item.steam_data
	local price_table = steam_data.discount_is_active and steam_data.discount_prices or steam_data.regular_prices or {}

	for currency, currency_price in pairs(price_table) do
		if price == currency_price then
			return currency
		end
	end
end

local function find_regular_price(product)
	local currency = find_steam_currency(product)

	return product.item.steam_data.regular_prices[currency]
end

TelemetryEvents.steam_store_product_purchased = function (self, steam_product)
	local steam_data = steam_product.item.steam_data
	local product = {
		id = steam_product.item.id,
		type = steam_product.item.data.item_type,
		current_price = tonumber(steam_product.item.steam_price),
		currency = steam_data and find_steam_currency(steam_product) or "?",
	}

	if steam_data and steam_data.discount_is_active then
		product.discounted = true
		product.regular_price = find_regular_price(steam_product)
	end

	self:_store_product_purchased(product)
end

TelemetryEvents._store_product_purchased = function (self, product)
	local event = self:_create_event("store_product_purchased")

	event:set_data(product)
	self._manager:register_event(event)
end

TelemetryEvents.store_rewards_claimed = function (self, claim, offset)
	local event = self:_create_event("store_rewards_claimed")
	local event_data = claim

	if event_data.event_type == "personal_time_strike" then
		event_data.reward_index = event_data.total_claims or 0
	else
		event_data.reward_index = #event_data.rewards + (offset or 0)
	end

	event:set_data(event_data)
	self._manager:register_event(event)
end

TelemetryEvents.player_joined = function (self, player, num_human_players)
	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_joined", self._session)

	event:set_data({
		num_human_players = num_human_players,
	})
	self._manager:register_event(event)
end

TelemetryEvents.player_left = function (self, player, num_human_players)
	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "player_left", self._session)

	event:set_data({
		num_human_players = num_human_players,
	})
	self._manager:register_event(event)
end

TelemetryEvents.deus_run_started = function (self, run_id, journey_name, run_seed, dominant_god, difficulty, is_weekly_expedition, event_mutators, event_boons)
	local event = self:_create_event("deus_run_started")

	event:set_data({
		run_id = run_id,
		journey_name = journey_name,
		run_seed = run_seed,
		dominant_god = dominant_god,
		difficulty = difficulty,
		is_weekly_expedition = is_weekly_expedition,
		event_mutators = event_mutators,
		event_boons = event_boons,
	})
	self._manager:register_event(event)
end

TelemetryEvents.deus_run_ended = function (self, data)
	local event = self:_create_event("deus_run_ended")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.deus_level_started = function (self, data)
	local event = self:_create_event("deus_level_started")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.deus_level_ended = function (self, data)
	local event = self:_create_event("deus_level_ended")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.deus_coins_changed = function (self, telemetry_id, run_id, coin_delta, coin_description)
	local event = TelemetryEvent:new(SOURCE, {
		id = telemetry_id,
	}, "deus_coins_changed", self._session)

	event:set_data({
		run_id = run_id,
		player_id = telemetry_id,
		coin_delta = coin_delta,
		coin_description = coin_description,
	})
	self._manager:register_event(event)
end

TelemetryEvents.deus_altar_passed = function (self, data)
	local event = self:_create_event("deus_altar_passed")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.cursed_chest_passed = function (self, data)
	local event = self:_create_event("cursed_chest_passed")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.store_node_traversed = function (self, data)
	local event = self:_create_event("store_node_traversed")

	event:set_data(data)
	self._manager:register_event(event)
end

TelemetryEvents.network_ping = function (self, avg, std_dev, p99, p95, p90, p75, p50, p25, observations)
	local event = self:_create_event("network_ping")

	event:set_data({
		avg = avg,
		std_dev = std_dev,
		p99 = p99,
		p95 = p95,
		p90 = p90,
		p75 = p75,
		p50 = p50,
		p25 = p25,
		observations = observations,
	})
	self._manager:register_event(event)
end

TelemetryEvents.memory_usage = function (self, index, memory_usage)
	local event = self:_create_event("memory_usage")

	event:set_data({
		index = index,
		memory_usage = memory_usage,
	})
	self._manager:register_event(event)
end

TelemetryEvents.chat_message = function (self, message)
	local local_player = Managers.player:local_player()

	if not local_player then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = local_player:telemetry_id(),
	}, "chat_message", self._session)

	event:set_data({
		message_length = message and #message or 0,
	})
	self._manager:register_event(event)
end

TelemetryEvents.twitch_mode_activated = function (self)
	local event = self:_create_event("twitch_mode_activated")

	self._manager:register_event(event)
end

TelemetryEvents.twitch_poll_completed = function (self, vote_info)
	local event = self:_create_event("twitch_poll_completed")

	event:set_data({
		type = vote_info.vote_type,
		templates = vote_info.vote_templates,
		winning_template = vote_info.winning_template_name,
		votes_cast = vote_info.options,
	})
	self._manager:register_event(event)
end

TelemetryEvents.breed_position_desync = function (self, source_position, destination_position, distance_sq, breed)
	local event = self:_create_event("breed_position_desync")

	event:set_data({
		source_position = source_position,
		destination_position = destination_position,
		distance_sq = distance_sq,
		breed = breed,
	})
	self._manager:register_event(event)
end

TelemetryEvents.heartbeat = function (self)
	local event = self:_create_event("heartbeat")

	self._manager:register_event(event)
end

TelemetryEvents.player_authenticated = function (self, player_id)
	self._subject.id = player_id

	local event = self:_create_event("player_authenticated")

	self._manager:register_event(event)
end

TelemetryEvents._create_event = function (self, type)
	return TelemetryEvent:new(SOURCE, self._subject, type, self._session)
end

TelemetryEvents.necromancer_used_command_item = function (self, player, command_name)
	if player and not player.local_player then
		return
	end

	local event = TelemetryEvent:new(SOURCE, {
		id = player:telemetry_id(),
	}, "necromancer_used_command_item", self._session)

	event:set_data({
		command_name = command_name,
	})
	self._manager:register_event(event)
end

TelemetryEvents.geheimnisnacht_hard_mode_toggled = function (self, activated)
	local event = self:_create_event("geheimnisnacht_hard_mode_toggled")
	local state = activated and "activated" or "deactivated"

	event:set_data({
		state = state,
	})
	self._manager:register_event(event)
end

TelemetryEvents.loadout_created = function (self, num_loadouts, max_num_loadouts)
	local event = self:_create_event("loadout_created")

	event:set_data({
		num_loadouts = num_loadouts,
		max_num_loadouts = max_num_loadouts,
	})
	self._manager:register_event(event)
end

TelemetryEvents.loadout_deleted = function (self, num_loadouts, max_num_loadouts)
	local event = self:_create_event("loadout_deleted")

	event:set_data({
		num_loadouts = num_loadouts,
		max_num_loadouts = max_num_loadouts,
	})
	self._manager:register_event(event)
end

TelemetryEvents.loadout_equipped = function (self)
	local event = self:_create_event("loadout_equipped")

	self._manager:register_event(event)
end

TelemetryEvents.default_loadout_equipped = function (self)
	local event = self:_create_event("default_loadout_equipped")

	self._manager:register_event(event)
end

TelemetryEvents.start_versus_experience = function (self, versus_level_start, versus_experience_start)
	local event = self:_create_event("start_versus_experience")

	event:set_data({
		start_experience = versus_experience_start,
		start_level = versus_level_start,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_experience_gained = function (self, versus_experience_gained)
	local event = self:_create_event("versus_experience_gained")

	event:set_data({
		versus_experience_gained = versus_experience_gained,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_level_gained = function (self, old_versus_level, new_versus_level)
	local event = self:_create_event("versus_level_gained")

	event:set_data({
		old_versus_level = old_versus_level,
		new_versus_level = new_versus_level,
	})
	self._manager:register_event(event)
end

TelemetryEvents.versus_currency_gained = function (self, currency_gained)
	local event = self:_create_event("versus_currency_gained")

	event:set_data({
		currency_gained = currency_gained,
	})
	self._manager:register_event(event)
end
