-- chunkname: @scripts/helpers/steam_helper.lua

SteamHelper = SteamHelper or {}

local FRIEND_STATUS = {
	[0] = "offline",
	"online",
	"busy",
	"away",
	"snooze",
	"trading",
	"looking_to_play",
}

SteamHelper.debug_friends = function ()
	local number_of_friends = 5
	local friends = {}

	for i = 1, number_of_friends do
		local id = "id_" .. i

		friends[id] = {
			playing_this_game = false,
			name = "debug_friend_" .. i,
			playing_game = i % 2 == 1,
			status = math.random(1, 6),
		}
	end

	return friends
end

SteamHelper.friends = function ()
	local num_friends = Friends.num_friends()
	local friends = {}
	local app_id = Steam.app_id()

	for i = 1, num_friends do
		local id = Friends.id(i)
		local playing_game = Friends.playing_game(id)

		if playing_game and not playing_game.lobby and not playing_game.ip then
			local connect_info = Presence.presence(id, "connect")
			local prefix_len = #"+connect "

			if connect_info and prefix_len < #connect_info then
				local ip_port = string.sub(connect_info, prefix_len + 1, #connect_info)
				local ip, port = NetworkUtils.split_ip_port(ip_port)

				if ip then
					playing_game.ip = ip
					playing_game.server_port = port
				end
			end
		end

		local playing_this_game = playing_game and playing_game.app_id == app_id

		friends[id] = {
			name = Friends.name(id),
			playing_game = playing_game,
			playing_this_game = playing_this_game,
			status = FRIEND_STATUS[Friends.status(id)],
		}
	end

	return friends
end

SteamHelper.is_dev = function ()
	if rawget(_G, "Clans") then
		return SteamHelper.is_in_clan("170000000a021fa")
	else
		return false
	end
end

SteamHelper.is_in_clan = function (clan_id)
	local clan_count = Clans.clan_count()

	for i = 0, clan_count - 1 do
		local id = Clans.clan_by_index(i)

		if id == clan_id then
			return true
		end
	end

	return false
end

SteamHelper.clans_short = function ()
	if rawget(_G, "Clans") then
		local clan_count = Clans.clan_count()
		local clan_names = {}

		for i = 0, clan_count - 1 do
			local id = Clans.clan_by_index(i)
			local name = Clans.clan_tag(id)

			clan_names[id] = name
		end

		return clan_names
	else
		return {}
	end
end

SteamHelper.clans = function ()
	local clan_count = Clans.clan_count()
	local clan_names = {}

	for i = 0, clan_count - 1 do
		local id = Clans.clan_by_index(i)
		local name = Clans.clan_name(id)

		clan_names[id] = name
	end

	return clan_names
end
