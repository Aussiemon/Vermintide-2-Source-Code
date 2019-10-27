require("scripts/settings/badge_templates")

BadgeManager = class(BadgeManager)
local RPCS = {
	"rpc_show_badge"
}

BadgeManager.init = function (self, statistics_db, network_event_delegate, is_server)
	self._statistics_db = statistics_db
	self._event_to_template_mapping = {}
	self._is_server = is_server
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
	Managers.state.event:register(self, "event_stat_incremented", "generic_event_callback")
	Managers.state.event:register(self, "event_stat_modified_by", "generic_event_callback")
	Managers.state.event:register(self, "add_damage_feedback_event", "add_damage_feedback_event")

	local current_mechanism_name = Managers.mechanism:current_mechanism_name()

	if current_mechanism_name == "versus" then
		require("scripts/settings/dlcs/carousel/carousel_badge_templates")
	elseif current_mechanism_name == "adventure" then
	end

	if is_server then
		self._templates = BadgeTemplates.server
	else
		self._templates = BadgeTemplates.client
	end

	local update_cache = {}

	for _, body in pairs(self._templates) do
		for _, event_name in ipairs(body.events) do
			local mapping = self._event_to_template_mapping[event_name] or {}
			mapping[#mapping + 1] = body
			self._event_to_template_mapping[event_name] = mapping
		end

		if body.update then
			update_cache[#update_cache + 1] = body
		end
	end

	self._update_cache = update_cache
end

BadgeManager.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

BadgeManager.update = function (self, dt, t)
	local update_cache = self._update_cache

	for _, template in ipairs(update_cache) do
		local players_succeded = template.update(template.data, dt, t)

		if players_succeded and #players_succeded > 0 then
			for _, stats_id in ipairs(players_succeded) do
				template.complete(self._statistics_db, stats_id, template.data)
			end
		end
	end
end

BadgeManager.generic_event_callback = function (self, stats_id, ...)
	local event_name = select(1, ...)
	local templates = self._event_to_template_mapping[event_name]

	if not templates then
		return
	end

	local t = Managers.time:time("main")

	for _, template in ipairs(templates) do
		local done = template.on_event(stats_id, template.data, t, ...)

		if done then
			template.complete(self._statistics_db, stats_id, template.data, ...)
		end
	end
end

BadgeManager.add_damage_feedback_event = function (self, stats_id, ...)
	local templates = self._event_to_template_mapping.add_damage_feedback_event

	if not templates then
		return
	end

	local t = Managers.time:time("main")

	for _, template in ipairs(templates) do
		local done = template.on_event(stats_id, template.data, t, ...)

		if done then
			template.complete(self._statistics_db, stats_id, template.data, ...)
		end
	end
end

BadgeManager.rpc_show_badge = function (self, sender, badge_id)
	Managers.state.event:trigger("add_local_badge", badge_id)
end

return
