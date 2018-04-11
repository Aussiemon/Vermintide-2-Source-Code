require("scripts/managers/performance_title/performance_title_templates")

PerformanceTitleManager = class(PerformanceTitleManager)
local RPCS = {
	"rpc_sync_performance_titles"
}
local INVALID_PEER = "0"

local function networkify_number(number)
	local uint_16 = NetworkConstants.uint_16
	local min = uint_16.min
	local max = uint_16.max

	return math.clamp(number, min, max)
end

PerformanceTitleManager.init = function (self, network_transmit, statistics_db, is_server)
	self._network_transmit = network_transmit
	self._statistics_db = statistics_db
	self._is_server = is_server
	self._assigned_titles = {}

	return 
end
PerformanceTitleManager.register_rpcs = function (self, network_event_delegate)
	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate

	return 
end
PerformanceTitleManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil

	return 
end
PerformanceTitleManager.destroy = function (self)
	self._statistics_db = nil
	self._network_transmit = nil

	return 
end
PerformanceTitleManager.assigned_titles = function (self)
	return self._assigned_titles
end
PerformanceTitleManager._evaluate_player_titles = function (self, player, eligible_titles)
	local statistics_db = self._statistics_db
	local stats_id = player.stats_id(player)
	local titles = PerformanceTitles.titles
	local title_templates = PerformanceTitles.templates
	local found_any_title = false

	for title_name, data in pairs(titles) do
		local evaluation_template = title_templates[data.evaluation_template]
		local success, amount = evaluation_template.evaluate(statistics_db, stats_id, data)

		if success then
			eligible_titles[title_name] = amount
			found_any_title = true
		end
	end

	return found_any_title
end
PerformanceTitleManager._get_title_list_from_player_titles = function (self, player_titles)
	local title_list = {}

	for _, titles in pairs(player_titles) do
		for title_name, _ in pairs(titles) do
			if not table.contains(title_list, title_name) then
				title_list[#title_list + 1] = title_name
			end
		end
	end

	return title_list
end
PerformanceTitleManager._find_individually_achieved_title = function (self, player_titles, title_name)
	local found_player = nil
	local player_amount = 0

	for player, titles in pairs(player_titles) do
		if titles[title_name] then
			player_amount = player_amount + 1
			found_player = player
		end
	end

	if player_amount ~= 1 then
		found_player = nil
	end

	return found_player
end
PerformanceTitleManager._assign_title = function (self, assigned_titles, player_titles, player, title_name)
	local achieved_titles = player_titles[player]
	local amount = achieved_titles[title_name]
	local peer_id = player.network_id(player)
	local local_player_id = player.local_player_id(player)
	assigned_titles[#assigned_titles + 1] = {
		peer_id = peer_id,
		local_player_id = local_player_id,
		title = title_name,
		amount = amount
	}

	return 
end
PerformanceTitleManager._remove_title_from_player_titles = function (self, player_titles, title_name)
	for _, titles in pairs(player_titles) do
		titles[title_name] = nil
	end

	return 
end
PerformanceTitleManager._assign_individual_titles = function (self, player_titles, assigned_titles)
	local title_list = self._get_title_list_from_player_titles(self, player_titles)
	local i = 1

	while title_list[i] ~= nil do
		local title_name = title_list[i]
		local player = self._find_individually_achieved_title(self, player_titles, title_name)

		if player then
			self._assign_title(self, assigned_titles, player_titles, player, title_name)

			player_titles[player] = nil

			self._remove_title_from_player_titles(self, player_titles, title_name)

			i = 1
		else
			i = i + 1
		end
	end

	return 
end
PerformanceTitleManager._assign_compared_titles = function (self, player_titles, assigned_titles)
	local title_list = self._get_title_list_from_player_titles(self, player_titles)
	local title_settings = PerformanceTitles.titles
	local title_templates = PerformanceTitles.templates

	for _, title_name in ipairs(title_list) do
		local best_amount = 0
		local winner_player = nil
		local settings = title_settings[title_name]
		local template = title_templates[settings.evaluation_template]

		for player, titles in pairs(player_titles) do
			local amount = titles[title_name]

			if amount and template.compare(amount, best_amount) then
				best_amount = amount
				winner_player = player
			end
		end

		if winner_player then
			self._assign_title(self, assigned_titles, player_titles, winner_player, title_name)

			player_titles[winner_player] = nil
		end
	end

	return 
end
PerformanceTitleManager._sync_assigned_titles = function (self, assigned_titles)
	local peer_ids = {}
	local local_player_ids = {}
	local title_ids = {}
	local amounts = {}

	for i = 1, 4, 1 do
		local data = assigned_titles[i]

		if data then
			peer_ids[i] = data.peer_id
			local_player_ids[i] = data.local_player_id
			title_ids[i] = NetworkLookup.performance_titles[data.title]
			amounts[i] = networkify_number(data.amount)
		else
			peer_ids[i] = INVALID_PEER
			local_player_ids[i] = 0
			title_ids[i] = NetworkLookup.performance_titles["n/a"]
			amounts[i] = 0
		end
	end

	self._network_transmit:send_rpc_clients("rpc_sync_performance_titles", peer_ids, local_player_ids, title_ids, amounts)

	return 
end
PerformanceTitleManager.evaluate_titles = function (self, players)
	fassert(self._is_server, "Should only be server calling this")

	local player_titles = {}

	for unique_id, player in pairs(players) do
		local eligible_titles = {}
		local success = self._evaluate_player_titles(self, player, eligible_titles)

		if success then
			player_titles[player] = eligible_titles
		end
	end

	local assigned_titles = {}

	self._assign_individual_titles(self, player_titles, assigned_titles)

	if 0 < table.size(player_titles) then
		self._assign_compared_titles(self, player_titles, assigned_titles)
	end

	self._assigned_titles = assigned_titles

	self._sync_assigned_titles(self, assigned_titles)

	return 
end
PerformanceTitleManager._translate_title_assignment = function (self, peer_id, local_player_id, title_id, amount)
	if peer_id == INVALID_PEER then
		return nil
	end

	local title_assignment = {
		peer_id = peer_id,
		local_player_id = local_player_id,
		title = NetworkLookup.performance_titles[title_id],
		amount = amount
	}

	return title_assignment
end
PerformanceTitleManager.rpc_sync_performance_titles = function (self, sender, peer_ids, local_player_ids, title_ids, amounts)
	local assigned_titles = {}

	for i = 1, 4, 1 do
		local peer_id = peer_ids[i]

		if peer_id ~= INVALID_PEER then
			local local_player_id = local_player_ids[i]
			local title = NetworkLookup.performance_titles[title_ids[i]]
			local amount = amounts[i]
			assigned_titles[#assigned_titles + 1] = {
				peer_id = peer_id,
				local_player_id = local_player_id,
				title = title,
				amount = amount
			}
		end
	end

	self._assigned_titles = assigned_titles

	return 
end

return 
