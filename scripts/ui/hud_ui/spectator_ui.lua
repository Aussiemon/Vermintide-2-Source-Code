-- chunkname: @scripts/ui/hud_ui/spectator_ui.lua

SpectatorUI = class(SpectatorUI)

SpectatorUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._player_manager = ingame_ui_context.player_manager
	self._ui_animations = {}
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._text = ""

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)

	local event_manager = Managers.state.event

	event_manager:register(self, "on_spectator_target_changed", "on_spectator_target_changed")
	event_manager:register(self, "new_player_unit", "on_player_spawned")

	self._marker_ids = {}
end

SpectatorUI.destroy = function (self)
	print("[SpectatorUI] - Destroy")

	local event_manager = Managers.state.event

	event_manager:unregister("on_spectator_target_changed", self)
	event_manager:unregister("new_player_unit", self)
	self:set_visible(false)
end

SpectatorUI.update = function (self, dt, t)
	if not self._is_visible then
		return
	end

	self:draw(dt, t)
end

SpectatorUI.draw = function (self, dt, t)
	return
end

SpectatorUI.set_dirty = function (self)
	self._dirty = true
end

SpectatorUI.set_visible = function (self, visible)
	self._is_visible = visible

	if visible then
		local players = self:_get_actual_players()

		for _, player in pairs(players) do
			local player_unit = player.player_unit

			if player_unit then
				self:_add_world_marker(player_unit)
			end
		end
	else
		self:_clear_world_markers()
	end
end

SpectatorUI._get_actual_players = function (self)
	local players = {}
	local parties = Managers.party:parties()

	for _, party in pairs(parties) do
		if party.name ~= "spectators" then
			local occupied_slots = party.occupied_slots

			for _, slot in pairs(occupied_slots) do
				players[#players + 1] = slot.player
			end
		end
	end

	return players
end

SpectatorUI._add_world_marker = function (self, player_unit)
	local id = self._marker_ids[player_unit]

	if id then
		self:_clear_world_marker(player_unit, id)
	end

	local callback = callback(self, "cb_world_marker_spawned", player_unit)

	Managers.state.event:trigger("add_world_marker_unit", "versus_pactsworn_ghostmode", player_unit, callback)
end

SpectatorUI._clear_world_markers = function (self)
	for player_unit, id in pairs(self._marker_ids) do
		self:_clear_world_marker(player_unit, id)
	end
end

SpectatorUI._clear_world_marker = function (self, player_unit, id)
	Managers.state.event:trigger("remove_world_marker", id)

	self._marker_ids[player_unit] = nil
end

SpectatorUI.on_spectator_target_changed = function (self, spectated_player_unit)
	self._spectated_player_unit = spectated_player_unit
	self._spectated_player = Managers.player:owner(spectated_player_unit)
	self._is_spectator = true
	self._text = "Spectating: " .. self._spectated_player:name()
end

SpectatorUI.on_player_spawned = function (self, player, unit, player_unique_id)
	if not self._is_visible then
		return
	end

	self:_add_world_marker(unit)
end

SpectatorUI.cb_world_marker_spawned = function (self, unit, marker_id, widget)
	local profile_index = Managers.player:owner(unit):profile_index()
	local profile = SPProfiles[profile_index]

	widget.content.icon = profile.ui_portrait
	self._marker_ids[unit] = marker_id
end
