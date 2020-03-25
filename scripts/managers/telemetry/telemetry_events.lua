require("scripts/managers/telemetry/telemetry_settings")

local function timestamp()
	return os.time(os.date("!*t"))
end

TelemetryEvents = class(TelemetryEvents)

TelemetryEvents.init = function (self, manager)
	self.manager = manager
end

local params = {}

TelemetryEvents.header = function (self, engine_revision, content_revision)
	table.clear(params)

	params.version = TelemetrySettings.version
	params.created_at = timestamp()
	params.platform = PLATFORM
	params.build = BUILD
	params.engine_revision = engine_revision
	params.content_revision = content_revision

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

	self.manager:register_event("game_started", params)
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

TelemetryEvents.ai_died = function (self, breed, position)
	table.clear(params)

	params.breed = breed
	params.position = position

	self.manager:register_event("ai_died", params)
end

TelemetryEvents.ai_spawned = function (self, breed, position)
	table.clear(params)

	params.breed = breed
	params.position = position

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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.game_mode = data.game_mode
	params.level_key = data.level_key
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
	params.slot_melee = slot_melee and slot_melee.item_data.name
	params.slot_ranged = slot_ranged and slot_ranged.item_data.name

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

TelemetryEvents.fps = function (self, avg_fps)
	table.clear(params)

	params.avg_fps = avg_fps

	self.manager:register_event("fps", params)
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
	table.clear(params)

	params.id = product.product_id
	params.name = product.item.name
	params.type = product.item.data.item_type
	params.current_price = product.item.current_prices.SM
	params.regular_price = product.item.regular_prices.SM
	params.localized_name = product.item.data.localized_name

	self.manager:register_event("store_product_purchased", params)
end

return
