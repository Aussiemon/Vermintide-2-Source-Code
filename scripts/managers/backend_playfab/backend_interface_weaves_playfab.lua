require("scripts/settings/weaves/weave_loadout/weave_loadout_settings")
require("scripts/settings/equipment/power_level_settings")

BackendInterfaceWeavesPlayFab = class(BackendInterfaceWeavesPlayFab)
local LOADOUT_INTERFACE_OVERRIDES = {
	slot_hat = "items",
	slot_skin = "items",
	slot_frame = "items",
	slot_melee = "weaves",
	slot_ranged = "weaves"
}

local function magic_level_to_power_level(magic_level)
	local settings = PowerLevelFromMagicLevel

	return math.min(math.ceil(settings.starting_power_level + magic_level * settings.power_level_per_magic_level), settings.max_power_level)
end

local function career_magic_level_to_power_level(magic_level)
	local settings = PowerLevelFromMagicLevel

	return math.min(math.ceil(math.clamp(magic_level * settings.amulet_power_level_per_magic_level, 0, settings.power_level_per_magic_level)), settings.max_power_level)
end

BackendInterfaceWeavesPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._dirty_loadouts = {}
	local progression_settings = backend_mirror:get_weaves_progression_settings()

	self:_validate_backend_progression_settings(progression_settings)

	self._progression_settings = progression_settings
	local read_only_data = backend_mirror:get_read_only_data()
	self._forge_level = read_only_data.weaves_forge_level
	self._loadouts = self:_parse_loadouts(read_only_data)
	self._career_progress = self:_parse_career_progress(read_only_data)
	local inventory_items = backend_mirror:get_all_inventory_items()

	for _, item in pairs(inventory_items) do
		if item.magic_level then
			item.power_level = magic_level_to_power_level(item.magic_level)
		end
	end

	local valid_loadout_slots = {}

	for slot_name, interface_name in pairs(LOADOUT_INTERFACE_OVERRIDES) do
		if interface_name == "weaves" then
			valid_loadout_slots[slot_name] = true
		end
	end

	self._valid_loadout_slots = valid_loadout_slots

	if not script_data.disable_weave_loadout then
		Managers.backend:add_loadout_interface_override("weave", LOADOUT_INTERFACE_OVERRIDES)
	end

	if not script_data.disable_weave_talents then
		Managers.backend:add_talents_interface_override("weave", "weaves")
	end

	Managers.backend:set_total_power_level_interface_for_game_mode("weave", "weaves")

	self._last_id = 0
	self._player_entry = {}
	self._requesting_leaderboard = 0
	self._leaderboard_entries = {}
	self._leaderboard_player_rank_error = false
	self._leaderboard_request_error = false
end

BackendInterfaceWeavesPlayFab._validate_backend_progression_settings = function (self, progression_settings)
	for career_name, settings in pairs(WeaveLoadoutSettings) do
		for _, property_name in ipairs(settings.properties) do
			local progression_data = progression_settings.properties[property_name]

			if not progression_data or not progression_data.mastery_costs or not progression_data.required_forge_level then
				Application.warning("[BackendInterfaceWeavesPlayFab] Configuration not found or incomplete for property %q in weave_progression_settings", property_name)
			end
		end

		for _, trait_name in ipairs(settings.traits) do
			local progression_data = progression_settings.traits[trait_name]

			if not progression_data or not progression_data.mastery_cost or not progression_data.required_forge_level then
				Application.warning("[BackendInterfaceWeavesPlayFab] Configuration not found or incomplete for trait %q in weave_progression_settings", trait_name)
			end
		end

		for tree_row, tier_talents in ipairs(settings.talent_tree) do
			for tree_column, talent_name in ipairs(tier_talents) do
				local progression_data = progression_settings.talents[talent_name]

				if not progression_data or not progression_data.mastery_cost then
					Application.warning("[BackendInterfaceWeavesPlayFab] Configuration not found or incomplete for talent %q in weave_progression_settings", talent_name)
				end
			end
		end
	end

	for item_name, item_data in pairs(ItemMasterList) do
		local rarity = item_data.rarity
		local slot_type = item_data.slot_type

		if rarity and rarity == "magic" and slot_type and (slot_type == "melee" or slot_type == "ranged") then
			local progression_data = progression_settings.items[item_name]

			if not progression_data then
				Application.warning("[BackendInterfaceWeavesPlayFab] Configuration not found or incomplete for item %q in weave_progression_settings", item_name)
			end
		end
	end
end

BackendInterfaceWeavesPlayFab._parse_loadouts = function (self, read_only_data)
	local loadouts = {}

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name and not settings.excluded_from_weave_loadouts then
			local dlc_unlocked = settings.is_dlc_unlocked()

			if dlc_unlocked == nil or dlc_unlocked then
				local loadout_json = read_only_data["weaves_loadout_" .. career_name]
				local loadout = loadout_json and cjson.decode(loadout_json)
				loadouts[career_name] = loadout

				self:_validate_loadout(career_name, loadout)
			end
		end
	end

	for career_name, loadout in pairs(loadouts) do
		for item_backend_id, item_loadout in pairs(loadout.item_loadouts) do
			self:_update_item_custom_data(item_backend_id, item_loadout)
		end
	end

	return loadouts
end

BackendInterfaceWeavesPlayFab._validate_loadout = function (self, career_name, loadout)
	local dirty_loadouts = self._dirty_loadouts

	if loadout.properties then
		local properties_data = WeavePropertiesByCareer[career_name]

		for property_name, property_slots in pairs(loadout.properties) do
			if not properties_data[property_name] then
				print("[BackendInterfaceWeavesPlayFab] Loadout property not found in local settings, removing it from the loadout!", career_name, property_name)

				loadout.properties[property_name] = nil
				dirty_loadouts[career_name] = true
			end
		end
	end

	if loadout.traits then
		local traits_data = WeaveTraitsByCareer[career_name]

		for trait_name, _ in pairs(loadout.traits) do
			if not traits_data[trait_name] then
				print("[BackendInterfaceWeavesPlayFab] Loadout trait not found in local settings, removing it from the loadout!", career_name, trait_name)

				loadout.traits[trait_name] = nil
				dirty_loadouts[career_name] = true
			end
		end
	end

	if loadout.talents then
		local talents_data = WeaveTalentsByCareer[career_name]

		for talent_name, _ in pairs(loadout.talents) do
			if not talents_data[talent_name] then
				print("[BackendInterfaceWeavesPlayFab] Loadout talent not found in local settings, removing it from the loadout!", career_name, talent_name)

				loadout.talents[talent_name] = nil
				dirty_loadouts[career_name] = true
			end
		end
	end

	if loadout.item_loadouts then
		local inventory_items = self._backend_mirror:get_all_inventory_items()

		for item_backend_id, item_loadout in pairs(loadout.item_loadouts) do
			local item = inventory_items[item_backend_id]

			if not item or item.rarity ~= "magic" then
				print("[BackendInterfaceWeavesPlayFab] Loadout weapon not found in local settings, removing it from the loadout!", career_name, item_backend_id)

				loadout.item_loadouts[item_backend_id] = nil
			else
				self:_validate_loadout(career_name, item_loadout)
			end
		end
	end
end

BackendInterfaceWeavesPlayFab._parse_career_progress = function (self, read_only_data)
	local progress_json = read_only_data.weaves_career_progress
	local progress = cjson.decode(progress_json)

	return progress
end

BackendInterfaceWeavesPlayFab._new_id = function (self)
	self._last_id = (self._last_id and self._last_id + 1) or 1

	return self._last_id
end

BackendInterfaceWeavesPlayFab._create_leaderboard_entry = function (self, data, previous_tier, previous_score)
	if not data then
		local entry = {
			score = "-",
			name = "-",
			weave = "-",
			ranking = "-",
			local_player = false
		}

		return entry
	end

	local position = data.Position + 1
	local profile = data.Profile
	local linked_accounts = profile.LinkedAccounts
	local name, position_text, platform_user_id = nil

	for i = 1, #linked_accounts, 1 do
		local account_data = linked_accounts[i]

		if account_data.Platform == "Steam" then
			name = account_data.Username
			platform_user_id = account_data.PlatformUserId
		elseif account_data.Platform == "XBoxLive" then
			name = account_data.Username
			platform_user_id = account_data.PlatformUserId
		elseif account_data.Platform == "PSN" then
			name = account_data.Username
			platform_user_id = account_data.PlatformUserId
		end
	end

	local tier, score, career_name = BackendUtils.convert_weave_score(data.StatValue)
	local local_player = profile.PlayerId == self._backend_mirror:get_playfab_id()

	if score == previous_score and tier == previous_tier then
		position_text = ""
	end

	local entry = {
		name = name,
		career_name = career_name,
		ranking = position_text or position,
		real_ranking = position,
		weave = tier,
		score = score,
		local_player = local_player,
		platform_user_id = platform_user_id
	}

	return entry
end

BackendInterfaceWeavesPlayFab._get_magic_inventory_item = function (self, item_backend_id)
	local inventory_items = self._backend_mirror:get_all_inventory_items()
	local item = inventory_items[item_backend_id]

	fassert(item, "[BackendInterfaceWeavesPlayFab] Item %q doesn't exist", tostring(item_backend_id))
	fassert(item.rarity == "magic", "[BackendInterfaceWeavesPlayFab] Item %q is not magic", tostring(item_backend_id))

	return item
end

BackendInterfaceWeavesPlayFab._update_item_custom_data = function (self, item_backend_id, item_loadout)
	local item = self:_get_magic_inventory_item(item_backend_id)
	local progression_settings = self._progression_settings

	if item_loadout.properties then
		if item.properties then
			table.clear(item.properties)
		else
			item.properties = {}
		end

		for property_name, property_slots in pairs(item_loadout.properties) do
			local num_slots = #property_slots
			local costs = self:get_property_mastery_costs(property_name)
			local max_num_slots = #costs
			local value = num_slots / max_num_slots
			item.properties[property_name] = value
		end
	else
		item.properties = nil
	end

	if item_loadout.traits then
		if item.traits then
			table.clear(item.traits)
		else
			item.traits = {}
		end

		for trait_name, _ in pairs(item_loadout.traits) do
			item.traits[#item.traits + 1] = trait_name
		end
	else
		item.traits = nil
	end
end

BackendInterfaceWeavesPlayFab._get_loadout_mastery_cost = function (self, loadout)
	local total_cost = 0
	local progression_settings = self._progression_settings

	if loadout.properties then
		for property_name, property_slots in pairs(loadout.properties) do
			local costs = self:get_property_mastery_costs(property_name)

			for i = 1, #property_slots, 1 do
				total_cost = total_cost + costs[i]
			end
		end
	end

	if loadout.traits then
		for trait_name, _ in pairs(loadout.traits) do
			local cost = self:get_trait_mastery_cost(trait_name)
			total_cost = total_cost + cost
		end
	end

	if loadout.talents then
		for talent_name, _ in pairs(loadout.talents) do
			local cost = self:get_talent_mastery_cost(talent_name)
			total_cost = total_cost + cost
		end
	end

	return total_cost
end

BackendInterfaceWeavesPlayFab.ready = function (self)
	return true
end

BackendInterfaceWeavesPlayFab.submit_scores = function (self, tier, score, num_players)
	local players = Managers.player:human_players()
	local scores_by_platform_id = {}

	for _, player in pairs(players) do
		local platform_id = player:platform_id()

		if not IS_XB1 then
			platform_id = Application.hex64_to_dec(platform_id)
		end

		local career_name = player:career_name()
		local weave_score = BackendUtils.calculate_weave_score(tier, score, career_name)
		scores_by_platform_id[platform_id] = weave_score
	end

	local submit_weave_score_request = {
		FunctionName = "submitWeaveScore",
		FunctionParameter = {
			scores_by_platform_id = scores_by_platform_id,
			num_players = num_players
		}
	}
	local success_callback = callback(self, "submit_weave_score_request_cb")
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(submit_weave_score_request, success_callback, true)
end

BackendInterfaceWeavesPlayFab.submit_weave_score_request_cb = function (self)
	return
end

BackendInterfaceWeavesPlayFab.request_player_rank = function (self, stat_name, leaderboard_type, external_error_cb)
	local player_rank_request = {
		MaxResultsCount = 1,
		StatisticName = stat_name,
		ProfileConstraints = {
			ShowLinkedAccounts = true
		}
	}

	if IS_XB1 then
		player_rank_request.XboxToken = Managers.account:get_xsts_token()
	end

	local success_callback = callback(self, "player_rank_request_cb")
	local fail_callback = callback(self, "player_rank_request_failed_cb", external_error_cb)
	local request_queue = self._backend_mirror:request_queue()
	local request_function = (leaderboard_type == "friends" and "GetFriendLeaderboardAroundPlayer") or "GetLeaderboardAroundPlayer"

	request_queue:enqueue_api_request(request_function, player_rank_request, success_callback, fail_callback)

	self._requesting_leaderboard = self._requesting_leaderboard + 1
end

BackendInterfaceWeavesPlayFab.player_rank_request_cb = function (self, result)
	local data = result.Leaderboard[1]
	local stat_value = data and data.StatValue

	if stat_value == 0 then
		data = nil
	end

	local leaderboard_entry = self:_create_leaderboard_entry(data)
	self._requesting_leaderboard = self._requesting_leaderboard - 1
	self._player_entry = leaderboard_entry
	self._leaderboard_player_rank_error = false
end

BackendInterfaceWeavesPlayFab.request_leaderboard_around_player = function (self, stat_name, leaderboard_type, max_result_count, external_error_cb)
	local request_leaderboard_around_player = {
		MaxResultsCount = max_result_count or 1,
		StatisticName = stat_name,
		ProfileConstraints = {
			ShowLinkedAccounts = true
		}
	}

	if IS_XB1 then
		request_leaderboard_around_player.XboxToken = Managers.account:get_xsts_token()
	end

	local success_callback = callback(self, "request_leaderboard_around_player_cb")
	local fail_callback = callback(self, "request_leaderboard_failed_cb", external_error_cb)
	local request_queue = self._backend_mirror:request_queue()
	local request_function = (leaderboard_type == "friends" and "GetFriendLeaderboardAroundPlayer") or "GetLeaderboardAroundPlayer"

	request_queue:enqueue_api_request(request_function, request_leaderboard_around_player, success_callback, fail_callback)

	self._requesting_leaderboard = self._requesting_leaderboard + 1
	self._leaderboard_request_error = false
end

BackendInterfaceWeavesPlayFab.request_leaderboard_around_player_cb = function (self, result)
	local leaderboard = result.Leaderboard

	table.clear(self._leaderboard_entries)

	local idx = 1

	for i = 1, #leaderboard, 1 do
		local data = leaderboard[i]
		local entry = nil

		if data.StatValue ~= 0 then
			local previous_score = idx > 1 and self._leaderboard_entries[idx - 1].score
			local previous_tier = idx > 1 and self._leaderboard_entries[idx - 1].weave
			local entry = self:_create_leaderboard_entry(data, previous_tier, previous_score)
			self._leaderboard_entries[idx] = entry
			idx = idx + 1
		end

		if data.Profile.PlayerId == self._backend_mirror:get_playfab_id() then
			self._player_entry = entry
		end
	end

	self._requesting_leaderboard = self._requesting_leaderboard - 1
end

BackendInterfaceWeavesPlayFab.get_player_entry = function (self)
	return self._player_entry
end

BackendInterfaceWeavesPlayFab.request_leaderboard = function (self, stat_name, start_position, leaderboard_type, external_error_cb)
	local leaderboard_request = {
		MaxResultsCount = 100,
		StatisticName = stat_name,
		ProfileConstraints = {
			ShowLinkedAccounts = true
		},
		StartPosition = start_position
	}

	if IS_XB1 then
		leaderboard_request.XboxToken = Managers.account:get_xsts_token()
	end

	local success_callback = callback(self, "leaderboard_request_cb")
	local fail_callback = callback(self, "request_leaderboard_failed_cb", external_error_cb)
	local request_queue = self._backend_mirror:request_queue()
	local request_function = (leaderboard_type == "friends" and "GetFriendLeaderboard") or "GetLeaderboard"

	request_queue:enqueue_api_request(request_function, leaderboard_request, success_callback, fail_callback)

	self._requesting_leaderboard = self._requesting_leaderboard + 1
end

BackendInterfaceWeavesPlayFab.leaderboard_request_cb = function (self, result)
	local leaderboard = result.Leaderboard

	table.clear(self._leaderboard_entries)

	for i = 1, #leaderboard, 1 do
		local data = leaderboard[i]
		local previous_score = i > 1 and self._leaderboard_entries[i - 1].score
		local previous_tier = i > 1 and self._leaderboard_entries[i - 1].weave
		local entry = self:_create_leaderboard_entry(data, previous_tier, previous_score)
		self._leaderboard_entries[i] = entry
	end

	self._requesting_leaderboard = self._requesting_leaderboard - 1
	self._leaderboard_request_error = false
end

BackendInterfaceWeavesPlayFab.is_requesting_leaderboard = function (self)
	return self._requesting_leaderboard > 0
end

BackendInterfaceWeavesPlayFab.get_leaderboard_entries = function (self)
	return self._leaderboard_entries
end

BackendInterfaceWeavesPlayFab.has_leaderboard_request_failed = function (self)
	return self._leaderboard_player_rank_error or self._leaderboard_request_error
end

BackendInterfaceWeavesPlayFab.player_rank_request_failed_cb = function (self, external_error_cb, result, reenable_queue_function)
	self._requesting_leaderboard = self._requesting_leaderboard - 1
	self._leaderboard_player_rank_error = true
	self._player_entry = self:_create_leaderboard_entry(nil)

	if external_error_cb then
		external_error_cb(result)
	end

	reenable_queue_function()
end

BackendInterfaceWeavesPlayFab.request_leaderboard_failed_cb = function (self, external_error_cb, result, reenable_queue_function)
	self._requesting_leaderboard = self._requesting_leaderboard - 1
	self._leaderboard_request_error = true

	table.clear(self._leaderboard_entries)

	if external_error_cb then
		external_error_cb(result)
	end

	reenable_queue_function()
end

BackendInterfaceWeavesPlayFab.get_mastery = function (self, career_name, optional_item_backend_id)
	local mastery_settings = WeaveMasterySettings
	local loadout = self._loadouts[career_name]
	local initial_mastery = nil

	if optional_item_backend_id then
		loadout = loadout.item_loadouts[optional_item_backend_id]
		local magic_level = self:get_item_magic_level(optional_item_backend_id)
		initial_mastery = (magic_level - 1) * mastery_settings.item_mastery_per_magic_level

		if self:max_magic_level() <= magic_level then
			initial_mastery = magic_level * mastery_settings.item_mastery_per_magic_level
		end
	else
		local magic_level = self:get_career_magic_level(career_name)
		initial_mastery = (magic_level - 1) * mastery_settings.career_mastery_per_magic_level

		if self:max_magic_level() <= magic_level then
			initial_mastery = magic_level * mastery_settings.career_mastery_per_magic_level
		end
	end

	local total_cost = (loadout and self:_get_loadout_mastery_cost(loadout)) or 0
	local current_mastery = initial_mastery - total_cost

	return initial_mastery, current_mastery
end

BackendInterfaceWeavesPlayFab.get_essence = function (self)
	return self._backend_mirror:get_essence()
end

BackendInterfaceWeavesPlayFab.get_total_essence = function (self)
	return self._backend_mirror:get_total_essence()
end

BackendInterfaceWeavesPlayFab.get_maximum_essence = function (self)
	return self._backend_mirror:get_maximum_essence()
end

BackendInterfaceWeavesPlayFab.get_average_power_level = function (self, career_name)
	local loadout = self._loadouts[career_name]
	local melee_item = self:_get_magic_inventory_item(loadout.slot_melee)
	local sum = melee_item.power_level
	local ranged_item = self:_get_magic_inventory_item(loadout.slot_ranged)
	sum = sum + ranged_item.power_level
	local career_power_level = self:get_career_power_level(career_name)
	local result = math.ceil(sum * 0.5)

	if career_power_level then
		result = result + career_power_level
	end

	return result
end

BackendInterfaceWeavesPlayFab.get_total_magic_level = function (self, career_name)
	local sum = self:get_career_magic_level(career_name)
	local loadout = self._loadouts[career_name]
	sum = sum + self:get_item_magic_level(loadout.slot_melee)
	sum = sum + self:get_item_magic_level(loadout.slot_ranged)

	return sum
end

BackendInterfaceWeavesPlayFab.max_magic_level = function (self)
	local magic_levels = self._progression_settings.magic_levels
	local num_levels = #magic_levels

	return num_levels
end

BackendInterfaceWeavesPlayFab.get_career_power_level = function (self, career_name)
	local magic_level = self:get_career_magic_level(career_name)
	local power_level = career_magic_level_to_power_level(magic_level)

	if power_level == 0 then
		return nil
	end

	return power_level
end

BackendInterfaceWeavesPlayFab.get_career_magic_level = function (self, career_name)
	local progress = self._career_progress[career_name]
	local magic_level = progress.magic_level

	return magic_level
end

BackendInterfaceWeavesPlayFab.career_upgrade_cost = function (self, career_name)
	local current_magic_level = self:get_career_magic_level(career_name)
	local new_magic_level = current_magic_level + 1

	if self:max_magic_level() < new_magic_level then
		return nil, nil
	end

	local magic_level_settings = self._progression_settings.magic_levels[new_magic_level]
	local essence_cost = magic_level_settings.essence_cost

	return essence_cost, new_magic_level
end

BackendInterfaceWeavesPlayFab.upgrade_career_magic_level = function (self, career_name, external_cb)
	local cost, new_magic_level = self:career_upgrade_cost(career_name)

	if not cost then
		external_cb(false)

		return
	end

	local request = {
		FunctionName = "upgradeCareerMagicLevel",
		FunctionParameter = {
			career_name = career_name,
			new_magic_level = new_magic_level,
			cost = cost
		}
	}
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, callback(self, "upgrade_career_magic_level_cb", external_cb), true)
end

local CAREER_ID_LOOKUP = {
	"dr_ranger",
	"dr_slayer",
	"dr_ironbreaker",
	"dr_engineer",
	"we_waywatcher",
	"we_shade",
	"we_maidenguard",
	"es_huntsman",
	"es_mercenary",
	"es_knight",
	"es_questingknight",
	"bw_adept",
	"bw_scholar",
	"bw_unchained",
	"wh_captain",
	"wh_bountyhunter",
	"wh_zealot"
}

BackendInterfaceWeavesPlayFab.upgrade_career_magic_level_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local error_message = function_result.error_message

	if error_message then
		print("[BackendInterfaceQuestsPlayfab] Error from backend when upgrading career magic level: ", tostring(error_message))

		if external_cb then
			external_cb(false)
		end

		return
	end

	local career_name = function_result.career_name
	local new_magic_level = function_result.new_magic_level
	local new_essence = function_result.new_essence
	local upgrade_all_career_magic_levels = function_result.upgrade_all_career_magic_levels

	if upgrade_all_career_magic_levels then
		for i = 1, #CAREER_ID_LOOKUP, 1 do
			local name = CAREER_ID_LOOKUP[i]
			local progress = self._career_progress[name]

			if progress then
				progress.magic_level = new_magic_level
			end
		end
	else
		local progress = self._career_progress[career_name]

		if progress then
			progress.magic_level = new_magic_level
		end
	end

	self._backend_mirror:set_essence(new_essence)

	if external_cb then
		external_cb(true)
	end
end

BackendInterfaceWeavesPlayFab.get_item_magic_level = function (self, item_backend_id)
	local item = self:_get_magic_inventory_item(item_backend_id)
	local magic_level = item.magic_level

	return magic_level
end

BackendInterfaceWeavesPlayFab.get_item_power_level = function (self, item_backend_id)
	local magic_level = self:get_item_magic_level(item_backend_id)
	local power_level = magic_level_to_power_level(magic_level)

	return power_level
end

BackendInterfaceWeavesPlayFab.magic_item_upgrade_cost = function (self, item_backend_id)
	local current_magic_level = self:get_item_magic_level(item_backend_id)
	local new_magic_level = current_magic_level + 1

	if self:max_magic_level() < new_magic_level then
		return nil, nil
	end

	local magic_level_settings = self._progression_settings.magic_levels[new_magic_level]
	local essence_cost = magic_level_settings.essence_cost

	return essence_cost, new_magic_level
end

BackendInterfaceWeavesPlayFab.upgrade_item_magic_level = function (self, item_backend_id, external_cb)
	local cost, new_magic_level = self:magic_item_upgrade_cost(item_backend_id)

	if not cost then
		external_cb(false)

		return
	end

	local request = {
		FunctionName = "upgradeItemMagicLevel",
		FunctionParameter = {
			item_backend_id = item_backend_id,
			new_magic_level = new_magic_level,
			cost = cost
		}
	}
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, callback(self, "upgrade_item_magic_level_cb", external_cb), true)
end

BackendInterfaceWeavesPlayFab.upgrade_item_magic_level_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local error_message = function_result.error_message

	if error_message then
		print("[BackendInterfaceQuestsPlayfab] Error from backend when upgrading item magic level: ", tostring(error_message))

		if external_cb then
			external_cb(false)
		end

		return
	end

	local item_id = function_result.item_id
	local essence_cost = function_result.essence_cost
	local item_backend_id = function_result.item_backend_id
	local new_magic_level = function_result.new_magic_level
	local new_essence = function_result.new_essence

	Managers.telemetry.events:magic_item_level_upgraded(item_id, essence_cost, new_magic_level)

	local backend_mirror = self._backend_mirror

	backend_mirror:update_item_field(item_backend_id, "magic_level", new_magic_level)

	local new_power_level = magic_level_to_power_level(new_magic_level)

	backend_mirror:update_item_field(item_backend_id, "power_level", new_power_level)
	backend_mirror:set_essence(new_essence)

	if external_cb then
		external_cb(true)
	end
end

BackendInterfaceWeavesPlayFab.magic_item_cost = function (self, item_id)
	local item_settings = self._progression_settings.items[item_id]
	local essence_cost = item_settings and item_settings.essence_cost

	return essence_cost
end

BackendInterfaceWeavesPlayFab.buy_magic_item = function (self, item_id, external_cb)
	local cost = self:magic_item_cost(item_id)

	if not cost then
		external_cb(false)

		return
	end

	local request = {
		FunctionName = "buyMagicItem",
		FunctionParameter = {
			item_id = item_id,
			cost = cost
		}
	}
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, callback(self, "buy_magic_item_cb", external_cb), true)
end

BackendInterfaceWeavesPlayFab.buy_magic_item_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local error_message = function_result.error_message

	if error_message then
		print("[BackendInterfaceQuestsPlayfab] Error from backend when buying magic item: ", tostring(error_message))

		if external_cb then
			external_cb(false)
		end

		return
	end

	local grant_results = function_result.item_grant_results
	local new_essence = function_result.new_essence
	local backend_mirror = self._backend_mirror

	for i = 1, #grant_results, 1 do
		local item = grant_results[i]
		local backend_id = item.ItemInstanceId

		backend_mirror:add_item(backend_id, item)

		item.power_level = magic_level_to_power_level(item.CustomData.magic_level)
	end

	backend_mirror:set_essence(new_essence)

	if external_cb then
		external_cb(true)
	end
end

BackendInterfaceWeavesPlayFab.get_forge_level = function (self)
	return self._forge_level
end

BackendInterfaceWeavesPlayFab.forge_max_level = function (self)
	local forge_levels = self._progression_settings.forge_levels
	local num_levels = #forge_levels

	return num_levels
end

BackendInterfaceWeavesPlayFab.forge_magic_level_cap = function (self)
	local forge_level = self._forge_level
	local forge_level_settings = self._progression_settings.forge_levels[forge_level]
	local magic_level_cap = forge_level_settings.magic_level_cap

	return magic_level_cap
end

BackendInterfaceWeavesPlayFab.forge_upgrade_cost = function (self)
	local current_forge_level = self._forge_level
	local new_forge_level = current_forge_level + 1

	if self:forge_max_level() < new_forge_level then
		return nil, nil
	end

	local forge_level_settings = self._progression_settings.forge_levels[new_forge_level]
	local essence_cost = forge_level_settings.essence_cost

	return essence_cost, new_forge_level
end

BackendInterfaceWeavesPlayFab.upgrade_forge = function (self, external_cb)
	local cost, new_forge_level = self:forge_upgrade_cost()

	if not cost then
		extenal_cb(false)

		return
	end

	local request = {
		FunctionName = "upgradeWeaveForge",
		FunctionParameter = {
			new_forge_level = new_forge_level,
			cost = cost
		}
	}
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, callback(self, "upgrade_forge_cb", external_cb), true)
end

BackendInterfaceWeavesPlayFab.upgrade_forge_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult
	local error_message = function_result.error_message

	if error_message then
		print("[BackendInterfaceQuestsPlayfab] Error from backend when upgrading the forge: ", tostring(error_message))

		if external_cb then
			external_cb(false)
		end

		return
	end

	local new_forge_level = function_result.new_forge_level
	local new_essence = function_result.new_essence
	self._forge_level = new_forge_level

	self._backend_mirror:set_essence(new_essence)

	if external_cb then
		external_cb(true)
	end
end

BackendInterfaceWeavesPlayFab.get_property_mastery_costs = function (self, property_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.properties[property_name]
	local mastery_costs = progression_data.mastery_costs

	return mastery_costs
end

BackendInterfaceWeavesPlayFab.get_property_required_forge_level = function (self, property_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.properties[property_name]
	local required_forge_level = progression_data.required_forge_level

	return required_forge_level
end

BackendInterfaceWeavesPlayFab.set_loadout_property = function (self, career_name, property_name, slot_index, optional_item_backend_id)
	local property_data = WeavePropertiesByCareer[career_name][property_name]

	fassert(property_data, "[BackendInterfaceWeavesPlayFab] Property %q not found for %q", property_name, career_name)

	local loadout = self._loadouts[career_name]

	if optional_item_backend_id then
		local item_loadout = loadout.item_loadouts[optional_item_backend_id]

		if not item_loadout then
			item_loadout = {
				properties = {},
				traits = {}
			}
			loadout.item_loadouts[optional_item_backend_id] = item_loadout
		end

		loadout = item_loadout
	end

	local property_slots = loadout.properties[property_name]

	if not property_slots then
		property_slots = {}
		loadout.properties[property_name] = property_slots
	end

	for _, slots in pairs(loadout.properties) do
		if table.contains(slots, slot_index) then
			return
		end
	end

	local costs = self:get_property_mastery_costs(property_name)

	if #property_slots == #costs then
		return
	end

	property_slots[#property_slots + 1] = slot_index

	if optional_item_backend_id then
		self:_update_item_custom_data(optional_item_backend_id, loadout)
	end

	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.remove_loadout_property = function (self, career_name, property_name, slot_index, optional_item_backend_id)
	local loadout = self._loadouts[career_name]

	if optional_item_backend_id then
		loadout = loadout.item_loadouts[optional_item_backend_id]
	end

	local property_slots = loadout.properties[property_name]
	local index_to_remove = table.find(property_slots, slot_index)

	table.remove(property_slots, index_to_remove)

	if #property_slots == 0 then
		loadout.properties[property_name] = nil
	end

	if optional_item_backend_id then
		self:_update_item_custom_data(optional_item_backend_id, loadout)
	end

	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.get_loadout_properties = function (self, career_name, optional_item_backend_id)
	local loadout = self._loadouts[career_name]
	local properties = nil

	if optional_item_backend_id then
		local item_loadout = loadout.item_loadouts[optional_item_backend_id]
		properties = (item_loadout and item_loadout.properties) or {}
	else
		properties = loadout.properties
	end

	return properties
end

BackendInterfaceWeavesPlayFab.get_trait_mastery_cost = function (self, trait_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.traits[trait_name]
	local mastery_cost = progression_data.mastery_cost

	return mastery_cost
end

BackendInterfaceWeavesPlayFab.get_trait_required_forge_level = function (self, trait_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.traits[trait_name]
	local required_forge_level = progression_data.required_forge_level

	return required_forge_level
end

BackendInterfaceWeavesPlayFab.set_loadout_trait = function (self, career_name, trait_name, slot_index, optional_item_backend_id)
	local trait_data = WeaveTraitsByCareer[career_name][trait_name]

	fassert(trait_data, "[BackendInterfaceWeavesPlayFab] Trait %q not allowed for %q", trait_name, career_name)

	local loadout = self._loadouts[career_name]

	if optional_item_backend_id then
		local item_loadout = loadout.item_loadouts[optional_item_backend_id]

		if not item_loadout then
			item_loadout = {
				properties = {},
				traits = {}
			}
			loadout.item_loadouts[optional_item_backend_id] = item_loadout
		end

		loadout = item_loadout
	end

	if loadout.traits[trait_name] then
		return
	end

	for _, index in pairs(loadout.traits) do
		if index == slot_index then
			return
		end
	end

	loadout.traits[trait_name] = slot_index

	if optional_item_backend_id then
		self:_update_item_custom_data(optional_item_backend_id, loadout)
	end

	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.remove_loadout_trait = function (self, career_name, trait_name, optional_item_backend_id)
	local loadout = self._loadouts[career_name]

	if optional_item_backend_id then
		loadout = loadout.item_loadouts[optional_item_backend_id]
	end

	loadout.traits[trait_name] = nil

	if optional_item_backend_id then
		self:_update_item_custom_data(optional_item_backend_id, loadout)
	end

	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.get_loadout_traits = function (self, career_name, optional_item_backend_id)
	local loadout = self._loadouts[career_name]
	local traits = nil

	if optional_item_backend_id then
		local item_loadout = loadout.item_loadouts[optional_item_backend_id]
		traits = (item_loadout and item_loadout.traits) or {}
	else
		traits = loadout.traits
	end

	return traits
end

BackendInterfaceWeavesPlayFab.apply_career_item_loadouts = function (self, career_name)
	if career_name then
		local loadout = self._loadouts[career_name]
		local item_loadouts = loadout and loadout.item_loadouts

		if item_loadouts then
			local melee_item = loadout.slot_melee

			if melee_item then
				local melee_loadout = item_loadouts[melee_item] or {}

				self:_update_item_custom_data(melee_item, melee_loadout)
			end

			local ranged_item = loadout.slot_ranged

			if ranged_item then
				local ranged_loadout = item_loadouts[ranged_item] or {}

				self:_update_item_custom_data(ranged_item, ranged_loadout)
			end
		end
	end
end

BackendInterfaceWeavesPlayFab.get_talent_mastery_cost = function (self, talent_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.talents[talent_name]
	local mastery_cost = progression_data.mastery_cost

	return mastery_cost
end

BackendInterfaceWeavesPlayFab.get_talent_required_forge_level = function (self, talent_name)
	local progression_settings = self._progression_settings
	local progression_data = progression_settings.talents[talent_name]
	local required_forge_level = progression_data.required_forge_level

	return required_forge_level
end

BackendInterfaceWeavesPlayFab.set_loadout_talent = function (self, career_name, talent_name, slot_index)
	local talent_data = WeaveTalentsByCareer[career_name][talent_name]

	fassert(talent_data, "[BackendInterfaceWeavesPlayFab] Talent %q not allowed for %q", talent_name, career_name)

	local talent_tier = talent_data.tree_row
	local loadout = self._loadouts[career_name]
	local loadout_talents = loadout.talents

	if loadout_talents[talent_name] then
		return
	end

	for loadout_talent_name, index in pairs(loadout_talents) do
		if index == slot_index then
			return
		end

		local loadout_talent_data = WeaveTalentsByCareer[career_name][loadout_talent_name]
		local loadout_talent_tier = loadout_talent_data.tree_row

		if talent_tier == loadout_talent_tier then
			return
		end
	end

	loadout_talents[talent_name] = slot_index
	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.remove_loadout_talent = function (self, career_name, talent_name)
	local loadout = self._loadouts[career_name]
	local loadout_talents = loadout.talents

	fassert(loadout_talents[talent_name], "[BackendInterfaceWeavesPlayFab] Talent %q not found in loadout for %q", talent_name, career_name)

	loadout_talents[talent_name] = nil
	self._dirty_loadouts[career_name] = true
end

BackendInterfaceWeavesPlayFab.get_loadout_talents = function (self, career_name)
	local loadout = self._loadouts[career_name]
	local loadout_talents = loadout.talents

	return loadout_talents
end

BackendInterfaceWeavesPlayFab.get_talent_ids = function (self, career_name)
	local talent_tree = self:get_talent_tree(career_name)
	local talent_ids = {}
	local talents = self:get_talents(career_name)

	if talents then
		for i = 1, #talents, 1 do
			local column = talents[i]

			if column ~= 0 then
				local talent_name = talent_tree[i][column]
				local talent_lookup = TalentIDLookup[talent_name]

				if talent_lookup and talent_lookup.talent_id then
					talent_ids[#talent_ids + 1] = talent_lookup.talent_id
				end
			end
		end
	end

	return talent_ids
end

BackendInterfaceWeavesPlayFab.get_talent_tree = function (self, career_name)
	local loadout_settings = WeaveLoadoutSettings[career_name]
	local talent_tree = loadout_settings and loadout_settings.talent_tree

	return talent_tree
end

local TALENTS_RETURN_TABLE = {}

BackendInterfaceWeavesPlayFab.get_talents = function (self, career_name)
	local loadout = self._loadouts[career_name]
	local loadout_talents = loadout.talents
	local tree = self:get_talent_tree(career_name)

	table.clear(TALENTS_RETURN_TABLE)

	for i = 1, #tree, 1 do
		TALENTS_RETURN_TABLE[i] = 0
	end

	for talent_name, _ in pairs(loadout_talents) do
		local talent_data = WeaveTalentsByCareer[career_name][talent_name]
		local tree_row = talent_data.tree_row
		local tree_column = talent_data.tree_column
		TALENTS_RETURN_TABLE[tree_row] = tree_column
	end

	return TALENTS_RETURN_TABLE
end

BackendInterfaceWeavesPlayFab.get_total_power_level = function (self, profile_name, career_name)
	return self:get_average_power_level(career_name)
end

BackendInterfaceWeavesPlayFab.has_loadout_item_id = function (self, career_name, item_id)
	local loadout = self._loadouts[career_name]

	for slot_name, id in pairs(loadout) do
		if id == item_id then
			return true
		end
	end
end

BackendInterfaceWeavesPlayFab.get_loadout_item_id = function (self, career_name, slot_name)
	fassert(self._valid_loadout_slots[slot_name], "[BackendInterfaceWeavesPlayFab] Loadout in slot %q shouldn't be fetched from the weaves interface", tostring(slot_name))

	local loadout = self._loadouts[career_name]
	local item_backend_id = loadout[slot_name]

	return item_backend_id
end

BackendInterfaceWeavesPlayFab.set_loadout_item = function (self, item_backend_id, career_name, slot_name)
	fassert(self._valid_loadout_slots[slot_name], "[BackendInterfaceWeavesPlayFab] Loadout in slot %q shouldn't be set in the weaves interface", tostring(slot_name))

	local all_items = self._backend_mirror:get_all_inventory_items()
	local item = nil

	if item_backend_id then
		item = all_items[item_backend_id]

		fassert(item, "[BackendInterfaceWeavesPlayFab] Item %q doesn't exist", tostring(item_backend_id))
	end

	if not item then
		print("[BackendInterfaceWeavesPlayFab] Attempted to equip weapon that doesn't exist:", item_backend_id, career_name, slot_name)

		return false
	end

	if item.rarity ~= "magic" then
		print("[BackendInterfaceWeavesPlayFab] Attempted to equip non magic weapon in weaves:", item_backend_id, career_name, slot_name)

		return false
	end

	local loadout = self._loadouts[career_name]

	if loadout[slot_name] ~= item_backend_id then
		loadout[slot_name] = item_backend_id
		self._dirty_loadouts[career_name] = true
	end

	return true
end

BackendInterfaceWeavesPlayFab.get_dirty_user_data = function (self)
	local has_dirty_data = false
	local dirty_data = {}
	local dirty_loadouts = self._dirty_loadouts
	local loadouts = self._loadouts

	for career_name, _ in pairs(dirty_loadouts) do
		has_dirty_data = true
		dirty_data.loadouts = dirty_data.loadouts or {}
		dirty_data.loadouts[career_name] = table.clone(loadouts[career_name])
	end

	if has_dirty_data then
		return dirty_data
	end
end

BackendInterfaceWeavesPlayFab.clear_dirty_user_data = function (self)
	table.clear(self._dirty_loadouts)
end

return
