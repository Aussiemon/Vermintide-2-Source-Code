require("scripts/managers/telemetry/telemetry_settings")

local function timestamp()
	return os.time(os.date("!*t"))
end

TelemetryEvents = class(TelemetryEvents)

TelemetryEvents.init = function (self, manager)
	self.manager = manager
end

local params = {}

TelemetryEvents.header = function (self, engine_revision, content_revision, client_version, steam_branch, svn_branch, machine_name, is_testify_session)
	table.clear(params)

	params.version = TelemetrySettings.version
	params.created_at = timestamp()
	params.platform = PLATFORM
	params.build = BUILD
	params.engine_revision = engine_revision
	params.content_revision = content_revision
	params.client_version = client_version
	params.steam_branch = steam_branch
	params.svn_branch = svn_branch
	params.machine_id = Application.machine_id and Application.machine_id() or nil
	params.machine_name = machine_name
	params.is_testify_session = is_testify_session

	if IS_XB1 then
		params.console_type = XboxOne.console_type_string()
	elseif IS_PS4 then
		params.console_type = PS4.is_pro() and "pro" or "not_pro"
	end

	self.manager:register_event("header", params)
end

TelemetryEvents.game_started = function (self, data)
	table.clear(params)

	local mutator_names = {}

	table.keys(data.mutators, mutator_names)
	table.sort(mutator_names)

	params.player_id = data.player_id
	params.peer_type = data.peer_type
	params.country_code = data.country_code
	params.quick_game = data.quick_game
	params.game_mode = data.game_mode
	params.level_key = data.level_key
	params.difficulty = data.difficulty
	params.mutators = table.concat(mutator_names, ",")
	params.realm = data.realm

	self.manager:register_event("game_started", params)
end

TelemetryEvents.versus_round_started = function (self, player_id, game_round, win_condition)
	table.clear(params)

	params.player_id = player_id
	params.game_round = game_round
	params.win_condition = win_condition

	self.manager:register_event("versus_round_started", params)
end

TelemetryEvents.weave_activated = function (self, wind, tier)
	table.clear(params)

	params.wind = wind
	params.tier = tier

	self.manager:register_event("weave_activated", params)
end

TelemetryEvents.round_started = function (self)
	table.clear(params)
	self.manager:register_event("round_started", params)
end

TelemetryEvents.objective_captured = function (self, remaining_time)
	table.clear(params)

	params.remaining_time = remaining_time

	self.manager:register_event("objective_captured", params)
end

TelemetryEvents.badge_gained = function (self, badge_name)
	table.clear(params)

	params.badge_name = badge_name

	self.manager:register_event("badge_gained", params)
end

TelemetryEvents.node_climb = function (self, breed_name, node_position)
	table.clear(params)

	params.breed_name = breed_name
	params.node_position = node_position

	self.manager:register_event("node_climb", params)
end

TelemetryEvents.left_ghost_mode = function (self, breed_name, position)
	table.clear(params)

	params.breed_name = breed_name
	params.position = position

	self.manager:register_event("left_ghost_mode", params)
end

TelemetryEvents.game_ended = function (self, end_reason)
	table.clear(params)

	params.end_reason = end_reason

	self.manager:register_event("game_ended", params)
end

TelemetryEvents.session_id = function (self, session_id)
	table.clear(params)

	params.session_id = session_id

	self.manager:register_event("session_id", params)
end

TelemetryEvents.ai_died = function (self, id, breed, position)
	table.clear(params)

	params.id = id
	params.breed = breed
	params.position = position

	self.manager:register_event("ai_died", params)
end

TelemetryEvents.ai_spawned = function (self, id, breed, position, enhancements_array)
	table.clear(params)

	local enhancements = {}

	if enhancements_array then
		for i = 1, #enhancements_array do
			local enhancement_data = enhancements_array[i]
			enhancements[enhancement_data.name] = true
		end
	end

	params.id = id
	params.breed = breed
	params.position = position
	params.enhancements = enhancements

	self.manager:register_event("ai_spawned", params)
end

TelemetryEvents.ai_despawned = function (self, breed, position, reason)
	table.clear(params)

	params.breed = breed
	params.position = position
	params.reason = reason or "unknown"

	self.manager:register_event("ai_despawned", params)
end

TelemetryEvents.matchmaking_search = function (self, player, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "search"
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.matchmaking_search_timeout = function (self, player, time_taken, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "search_timeout"
	params.time_taken = time_taken
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.matchmaking_cancelled = function (self, player, time_taken, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "cancelled"
	params.time_taken = time_taken
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.matchmaking_hosting = function (self, player, time_taken, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "hosting"
	params.time_taken = time_taken
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.matchmaking_starting_game = function (self, player, time_taken, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "starting_game"
	params.time_taken = time_taken
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.matchmaking_player_joined = function (self, player, time_taken, data)
	if player.remote then
		return
	end

	table.clear(params)

	params.state = "player_joined"
	params.time_taken = time_taken
	params.matchmaking_type = data.matchmaking_type
	params.mission_id = data.mission_id
	params.difficulty = data.difficulty
	params.quick_game = data.quick_game
	params.join_mode = data.join_mode
	params.private_game = data.private_game

	self.manager:register_event("matchmaking", params)
end

TelemetryEvents.pickup_spawned = function (self, pickup_name, spawn_type, position)
	table.clear(params)

	params.pickup_name = pickup_name
	params.spawn_type = spawn_type
	params.position = position

	self.manager:register_event("pickup_spawned", params)
end

TelemetryEvents.pickup_destroyed = function (self, pickup_name, spawn_type, position)
	table.clear(params)

	params.pickup_name = pickup_name
	params.spawn_type = spawn_type
	params.position = position

	self.manager:register_event("pickup_destroyed", params)
end

TelemetryEvents.player_ammo_depleted = function (self, player, weapon_name, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.weapon_name = weapon_name
	params.position = position

	self.manager:register_event("player_ammo_depleted", params)
end

TelemetryEvents.player_ammo_refilled = function (self, player, weapon_name, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.weapon_name = weapon_name
	params.position = position

	self.manager:register_event("player_ammo_refilled", params)
end

TelemetryEvents.player_damaged = function (self, player, damage_type, damage_source, damage_amount, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.damage_type = damage_type
	params.damage_source = damage_source
	params.damage_amount = damage_amount
	params.position = position

	self.manager:register_event("player_damaged", params)
end

TelemetryEvents.local_player_damaged_player = function (self, player, target_breed, damage_amount, attacker_position, target_position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player = player:telemetry_id()
	params.damage_amount = damage_amount
	params.target_breed = target_breed
	params.attacker_position = attacker_position
	params.target_position = target_position

	self.manager:register_event("local_player_damaged_player", params)
end

TelemetryEvents.player_died = function (self, player, damage_type, damage_source, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.damage_type = damage_type
	params.damage_source = damage_source
	params.position = position

	self.manager:register_event("player_died", params)
end

TelemetryEvents.local_player_killed_player = function (self, player, position, target_position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.position = position
	params.target_position = target_position

	self.manager:register_event("local_player_killed_player", params)
end

TelemetryEvents.player_jumped = function (self, player, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.position = position

	self.manager:register_event("player_jumped", params)
end

TelemetryEvents.player_killed_ai = function (self, player, player_position, victim_position, breed, weapon_name, damage_type, hit_zone)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.player_position = player_position
	params.victim_position = victim_position
	params.breed = breed
	params.weapon_name = weapon_name
	params.damage_type = damage_type
	params.hit_zone = hit_zone

	self.manager:register_event("player_killed_ai", params)
end

TelemetryEvents.player_knocked_down = function (self, player, damage_type, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.damage_type = damage_type
	params.position = position

	self.manager:register_event("player_knocked_down", params)
end

TelemetryEvents.player_pickup = function (self, player, pickup_name, pickup_spawn_type, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.pickup_name = pickup_name
	params.pickup_spawn_type = pickup_spawn_type
	params.position = position

	self.manager:register_event("player_pickup", params)
end

TelemetryEvents.player_revived = function (self, reviver, revivee, position)
	if not reviver.remote then
		table.clear(params)

		params.player_id = reviver:telemetry_id()
		params.position = position

		self.manager:register_event("player_revived_another_player", params)
	end

	if not revivee.remote then
		table.clear(params)

		params.player_id = revivee:telemetry_id()
		params.position = position

		self.manager:register_event("player_revived", params)
	end
end

TelemetryEvents.player_spawned = function (self, player)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.hero = player:profile_display_name()
	params.career = player:career_name()
	params.human = player.local_player == true
	local career_system = ScriptUnit.extension(player.player_unit, "career_system")
	params.power_level = career_system:get_career_power_level()
	local inventory_system = ScriptUnit.extension(player.player_unit, "inventory_system")
	local equipment = inventory_system:equipment()
	local slot_melee = equipment.slots.slot_melee
	local slot_ranged = equipment.slots.slot_ranged
	local cosmetic_slot_melee = CosmeticUtils.get_cosmetic_slot(player, "slot_melee")
	local cosmetic_slot_ranged = CosmeticUtils.get_cosmetic_slot(player, "slot_ranged")
	local cosmetic_slot_hat = CosmeticUtils.get_cosmetic_slot(player, "slot_hat")
	local cosmetic_slot_skin = CosmeticUtils.get_cosmetic_slot(player, "slot_skin")
	local cosmetic_slot_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
	params.slot_melee = slot_melee and slot_melee.item_data.name
	params.slot_melee_skin = cosmetic_slot_melee and cosmetic_slot_melee.skin_name or "default"
	params.slot_ranged = slot_ranged and slot_ranged.item_data.name
	params.slot_ranged_skin = cosmetic_slot_ranged and cosmetic_slot_ranged.skin_name or "default"
	params.slot_hat = cosmetic_slot_hat and cosmetic_slot_hat.item_name
	params.slot_skin = cosmetic_slot_skin and cosmetic_slot_skin.item_name
	params.slot_frame = cosmetic_slot_frame and cosmetic_slot_frame.item_name

	if ScriptUnit.has_extension(player.player_unit, "talent_system") then
		params.talents = ScriptUnit.extension(player.player_unit, "talent_system"):get_talent_names()
	else
		params.talents = {}
	end

	self.manager:register_event("player_spawned", params)
end

TelemetryEvents.player_despawned = function (self, player)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()

	self.manager:register_event("player_despawned", params)
end

TelemetryEvents.player_used_item = function (self, player, item_name, position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.item_name = item_name
	params.position = position

	self.manager:register_event("player_used_item", params)
end

TelemetryEvents.ping_used = function (self, player, own_ping, ping_type, ping_target, player_position)
	if player.remote then
		return
	end

	table.clear(params)

	params.player_id = player:telemetry_id()
	params.own_ping = own_ping
	params.ping_type = ping_type
	params.ping_target = ping_target
	params.player_position = player_position

	self.manager:register_event("ping_used", params)
end

TelemetryEvents.tech_settings = function (self, resolution, graphics_quality, screen_mode, rendering_backend)
	table.clear(params)

	params.resolution = resolution
	params.graphics_quality = graphics_quality
	params.screen_mode = screen_mode
	params.rendering_backend = rendering_backend

	self.manager:register_event("tech_settings", params)
end

TelemetryEvents.tech_system = function (self, system_info, adapter_index)
	table.clear(params)

	params.system_info = system_info
	params.adapter_index = adapter_index

	self.manager:register_event("tech_system", params)
end

TelemetryEvents.ui_settings = function (self, use_pc_menu_layout)
	table.clear(params)

	params.use_pc_menu_layout = use_pc_menu_layout

	self.manager:register_event("ui_menu_layout", params)
end

TelemetryEvents.vo_event_played = function (self, category, dialogue, sound_event, unit_name)
	table.clear(params)

	params.category = category
	params.dialogue = dialogue
	params.sound_event = sound_event
	params.unit_name = unit_name

	self.manager:register_event("vo_event_played", params)
end

TelemetryEvents.terror_event_started = function (self, event_name)
	table.clear(params)

	params.event_name = event_name

	self.manager:register_event("terror_event_started", params)
end

TelemetryEvents.level_progression = function (self, percent)
	table.clear(params)

	params.percent = percent

	self.manager:register_event("level_progression", params)
end

TelemetryEvents.memory_statistics = function (self, memory_tree, memory_resources, tag)
	table.clear(params)

	params.memory_tree = memory_tree
	params.memory_resources = memory_resources
	params.tag = tag

	self.manager:register_event("memory_statistics", params)
end

TelemetryEvents.player_stuck = function (self, player, level_key)
	if player.remote then
		return
	end

	table.clear(params)

	params.position = Unit.local_position(player.player_unit, 0)
	params.rotation = Unit.local_rotation(player.player_unit, 0)

	self.manager:register_event("player_stuck", params)
end

TelemetryEvents.fps = function (self, avg_fps, histogram)
	table.clear(params)

	params.avg_fps = avg_fps
	params.histogram = histogram

	self.manager:register_event("fps", params)
end

TelemetryEvents.fps_at_point = function (self, point_id, cam_pos, cam_rot, avg_fps)
	table.clear(params)

	params.point_id = point_id
	params.cam_pos = cam_pos
	params.cam_rot = cam_rot
	params.avg_fps = avg_fps

	self.manager:register_event("fps_at_point", params)
end

TelemetryEvents.end_of_game_rewards = function (self, rewards)
	table.clear(params)

	params.rewards = rewards

	self.manager:register_event("end_of_game_rewards", params)
end

TelemetryEvents.magic_item_level_upgraded = function (self, item_id, essence_cost, new_magic_level)
	table.clear(params)

	params.item_id = item_id
	params.essence_cost = essence_cost
	params.new_magic_level = new_magic_level

	self.manager:register_event("magic_item_level_upgraded", params)
end

TelemetryEvents.store_opened = function (self)
	table.clear(params)
	self.manager:register_event("store_opened", params)
end

TelemetryEvents.store_closed = function (self)
	table.clear(params)
	self.manager:register_event("store_closed", params)
end

TelemetryEvents.store_breadcrumbs_changed = function (self, widgets, product)
	table.clear(params)

	local path = {}
	local path_localized = {}

	for _, widget in ipairs(widgets) do
		path[#path + 1] = widget.content.page_name
		path_localized[#path_localized + 1] = widget.content.text
	end

	if product and path[#path] == "item_details" then
		path[#path] = product.product_id
	end

	params.path = path
	params.path_localized = path_localized

	self.manager:register_event("store_breadcrumbs_changed", params)
end

TelemetryEvents.store_product_purchased = function (self, product)
	local product = {
		currency = "SM",
		id = product.product_id,
		type = product.item.data.item_type,
		current_price = product.item.current_prices.SM or product.item.regular_prices.SM,
		regular_price = product.item.regular_prices.SM
	}

	self:_store_product_purchased(product)
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
		currency = steam_data and find_steam_currency(steam_product) or "?"
	}

	if steam_data and steam_data.discount_is_active then
		product.discounted = true
		product.regular_price = find_regular_price(steam_product)
	end

	self:_store_product_purchased(product)
end

TelemetryEvents._store_product_purchased = function (self, product)
	table.clear(params)
	self.manager:register_event("store_product_purchased", product)
end

TelemetryEvents.store_calendar_rewards_claimed = function (self, claim)
	table.clear(params)

	params.strike = claim.strike
	params.total_claims = claim.total_claims
	params.cooldown = claim.cooldown
	params.reward_index = claim.reward_index
	params.rewards = claim.rewards
	params.steam_items = claim.new_steam_items
	params.cosmetics = claim.new_cosmetics
	params.currency = claim.currency_added
	params.items = table.map(claim.items, function (item)
		return {
			name = item.data.name,
			type = item.data.item_type,
			rarity = item.data.rarity_key
		}
	end)

	self.manager:register_event("store_calendar_rewards_claimed", params)
end

TelemetryEvents.player_joined = function (self, player, num_human_players)
	table.clear(params)

	params.player_id = player:telemetry_id()
	params.num_human_players = num_human_players

	self.manager:register_event("player_joined", params)
end

TelemetryEvents.player_left = function (self, player, num_human_players)
	table.clear(params)

	params.player_id = player:telemetry_id()
	params.num_human_players = num_human_players

	self.manager:register_event("player_left", params)
end

TelemetryEvents.deus_run_started = function (self, run_id, journey_name, run_seed, dominant_god, difficulty)
	table.clear(params)

	params.run_id = run_id
	params.journey_name = journey_name
	params.run_seed = run_seed
	params.dominant_god = dominant_god
	params.difficulty = difficulty

	self.manager:register_event("deus_run_started", params)
end

TelemetryEvents.deus_run_ended = function (self, data)
	table.clear(params)

	params.run_id = data.run_id
	params.run_duration_in_seconds = data.run_duration_in_seconds
	params.completed_levels = data.completed_levels
	params.game_won = data.game_won
	params.blessings_boughts = data.blessings_boughts
	params.power_ups_bought = data.power_ups_bought
	params.ground_coins_picked_up = data.ground_coins_picked_up
	params.monster_coins_picked_up = data.monster_coins_picked_up
	params.melee_swap_chests_used = data.melee_swap_chests_used
	params.ranged_swap_chests_used = data.ranged_swap_chests_used
	params.upgrade_chests_used = data.upgrade_chests_used
	params.power_up_chests_used = data.power_up_chests_used
	params.cursed_chests_used = data.cursed_chests_used
	params.coins_earned = data.coins_earned
	params.coins_spent = data.coins_spent
	params.shops_visited = data.shops_visited
	params.signature_levels_completed = data.signature_levels_completed
	params.travel_levels_completed = data.travel_levels_completed
	params.host_migration_count = data.host_migration_count

	self.manager:register_event("deus_run_ended", params)
end

TelemetryEvents.deus_level_started = function (self, data)
	table.clear(params)

	params.run_id = data.run_id
	params.num_bots = data.num_bots
	params.level = data.level
	params.curse = data.curse
	params.theme = data.theme
	params.path = data.path
	params.difficulty_tweak = data.difficulty_tweak

	self.manager:register_event("deus_level_started", params)
end

TelemetryEvents.deus_level_ended = function (self, data)
	table.clear(params)

	params.run_id = data.run_id
	params.times_revived = data.times_revived
	params.num_bots = data.num_bots
	params.level = data.level
	params.curse = data.curse
	params.theme = data.theme
	params.game_won = data.game_won
	params.level_duration_in_seconds = data.level_duration_in_seconds
	params.path = data.path
	params.difficulty_tweak = data.difficulty_tweak

	self.manager:register_event("deus_level_ended", params)
end

TelemetryEvents.deus_coins_changed = function (self, telemetry_id, run_id, coin_delta, coin_description)
	table.clear(params)

	params.run_id = run_id
	params.player_id = telemetry_id
	params.coin_delta = coin_delta
	params.coin_description = coin_description

	self.manager:register_event("deus_coins_changed", params)
end

TelemetryEvents.network_ping = function (self, avg, std_dev, p99, p95, p90, p75, p50, p25, observations)
	table.clear(params)

	params.avg = avg
	params.std_dev = std_dev
	params.p99 = p99
	params.p95 = p95
	params.p90 = p90
	params.p75 = p75
	params.p50 = p50
	params.p25 = p25
	params.observations = observations

	self.manager:register_event("network_ping", params)
end

TelemetryEvents.memory_usage = function (self, index, memory_usage)
	table.clear(params)

	params.index = index
	params.memory_usage = memory_usage

	self.manager:register_event("memory_usage", params)
end

TelemetryEvents.chat_message = function (self, message)
	local local_player = Managers.player:local_player()

	if not local_player then
		return
	end

	table.clear(params)

	params.player_id = local_player:telemetry_id()
	params.message_length = message and #message or 0

	self.manager:register_event("chat_message", params)
end

TelemetryEvents.twitch_mode_activated = function (self)
	table.clear(params)
	self.manager:register_event("twitch_mode_activated", params)
end

TelemetryEvents.twitch_poll_completed = function (self, vote_info)
	table.clear(params)

	params.type = vote_info.vote_type
	params.templates = vote_info.vote_templates
	params.winning_template = vote_info.winning_template_name
	params.votes_cast = vote_info.options

	self.manager:register_event("twitch_poll_completed", params)
end

TelemetryEvents.breed_position_desync = function (self, source_position, destination_position, distance_sq, breed)
	table.clear(params)

	params.source_position = source_position
	params.destination_position = destination_position
	params.distance_sq = distance_sq
	params.breed = breed

	self.manager:register_event("breed_position_desync", params)
end
