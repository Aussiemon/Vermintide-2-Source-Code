-- chunkname: @scripts/settings/dlcs/carousel/carousel_badge_templates.lua

BadgeTemplates = BadgeTemplates or {
	server = {},
	client = {},
}

local function get_breed(player)
	if not player then
		return nil
	end

	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local profile = SPProfiles[profile_index]
	local career = profile and profile.careers[career_index]

	return career and career.breed or profile and profile.breed
end

local carousel_badge_templates = {
	server = {
		vs_kill_hero = {
			data = {},
			settings = {},
			events = {
				event_stat_incremented = function (settings, data, t, stats_id, event_name, target_breed_name)
					if not stats_id or event_name ~= "kills_per_breed" then
						return false
					end

					local target_breed = PlayerBreeds[target_breed_name]

					if not target_breed or not target_breed.is_hero then
						return false
					end

					return true
				end,
			},
			complete = function (statistics_db, settings, data, stats_id, ...)
				local player = Managers.player:player_from_unique_id(stats_id)

				if not player then
					return false
				end

				local peer_id = player.peer_id
				local badge_id = NetworkLookup.badges.kill_hero

				return peer_id, badge_id
			end,
		},
		vs_knock_down_hero = {
			data = {},
			settings = {},
			events = {
				event_stat_incremented = function (settings, data, t, stats_id, event_name, ...)
					if not stats_id or event_name ~= "vs_badge_knocked_down_target_per_breed" then
						return false
					end

					local player = Managers.player:player_from_unique_id(stats_id)
					local breed = get_breed(player)

					if not stats_id or not breed or breed.is_hero then
						return false
					end

					return true
				end,
			},
			complete = function (statistics_db, settings, data, stats_id, ...)
				local player = Managers.player:player_from_unique_id(stats_id)

				if not player then
					return false
				end

				local peer_id = player.peer_id
				local badge_id = NetworkLookup.badges.knock_down_hero

				return peer_id, badge_id
			end,
		},
	},
}

table.merge(BadgeTemplates.server, carousel_badge_templates.server)
