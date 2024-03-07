-- chunkname: @scripts/ui/views/level_end/states/end_view_state_parading_vs.lua

require("scripts/ui/views/world_hero_previewer")

EndViewStateParadingVS = class(EndViewStateParadingVS)
EndViewStateParadingVS.NAME = "EndViewStateParadingVS"

EndViewStateParadingVS.on_enter = function (self, params)
	self._parent = params.parent

	local context = params.context

	self._statistics_db = context.statistics_db
	self._profile_synchronizer = context.profile_synchronizer

	self:_prepare_score_data(context)
	ShowCursorStack.push()
end

EndViewStateParadingVS.on_exit = function (self)
	ShowCursorStack.pop()
end

EndViewStateParadingVS._prepare_score_data = function (self, context)
	local scores = {}

	for stats_id, player_data in pairs(context.players_session_score) do
		local career = SPProfiles[player_data.profile_index].careers[player_data.career_index]
		local data = {
			stats_id = stats_id,
			career = Localize(career.display_name),
			level = player_data.is_player_controlled and tostring(player_data.player_level) or "BOT",
			player_data = player_data,
		}

		for group_name, group_data in pairs(player_data.group_scores) do
			local group_total_score = 0

			for i = 1, #group_data do
				group_total_score = group_total_score + group_data[i].score
			end

			data[#data + 1] = {
				name = group_name,
				score = group_total_score,
			}
		end

		scores[#scores + 1] = data
	end

	self._scores = scores
end

EndViewStateParadingVS.update = function (self, dt, t)
	if not self._t then
		self._t = 25
	end

	self._t = math.max(0, self._t - dt)

	error("TODO: Rewrite")
end

EndViewStateParadingVS.done = function (self)
	return self._done
end

EndViewStateParadingVS.exit = function (self)
	return
end

EndViewStateParadingVS.exit_done = function (self)
	return true
end
