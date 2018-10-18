Pacing = class(Pacing)
script_data.debug_ai_pacing = script_data.debug_ai_pacing or Development.parameter("debug_ai_pacing")
script_data.debug_player_intensity = script_data.debug_player_intensity or Development.parameter("debug_player_intensity")
local CurrentPacing = CurrentPacing or nil

Pacing.init = function (self, world)
	self.world = world
	self.pacing_state = "pacing_build_up"
	self._threat_population = 1
	self._specials_population = 1
	self._horde_population = 1
	self._state_start_time = 0
	self.total_intensity = 0
	self.player_intensity = {}
	CurrentPacing = _G.CurrentPacing
end

Pacing.disable = function (self)
	self._threat_population = 1
	self._specials_population = 0
	self._horde_population = 0
	self.pacing_state = "pacing_frozen"
end

Pacing.enable = function (self)
	self._threat_population = 1
	self._specials_population = 1
	self._horde_population = 1
	self.pacing_state = "pacing_build_up"
end

Pacing.pacing_frozen = function (self, t)
	return
end

Pacing.pacing_build_up = function (self, t)
	if CurrentPacing.peak_intensity_threshold < self.total_intensity then
		self:advance_pacing(t)
	end
end

Pacing.pacing_sustain_peak = function (self, t)
	if self._end_pacing_time < t then
		self:advance_pacing(t)
	end
end

Pacing.pacing_peak_fade = function (self, t)
	if self.total_intensity < CurrentPacing.peak_fade_threshold then
		self:advance_pacing(t)
	end
end

Pacing.pacing_relax = function (self, t)
	if CurrentPacing.leave_relax_if_zero_intensity and self.total_intensity <= 0 then
		self:advance_pacing(t)

		return
	end

	if self._end_pacing_time < t then
		self:advance_pacing(t)
	end
end

Pacing.get_pacing_data = function (self)
	return self.pacing_state, self._state_start_time, self._threat_population, self._specials_population, self._horde_population, self._end_pacing_time
end

Pacing.ignore_intensity_decay_delay = function (self)
	return self.pacing_state == "pacing_relax"
end

Pacing.get_state = function (self)
	return self.pacing_state
end

Pacing.threat_population = function (self)
	return self._threat_population
end

Pacing.horde_population = function (self)
	return self._horde_population
end

Pacing.specials_population = function (self)
	return self._specials_population
end

Pacing.enemy_killed = function (self, killed_unit, player_units)
	for i = 1, #player_units, 1 do
		local player_unit = player_units[i]
		local killed_pos = Unit.local_position(killed_unit, 0)
		local player_pos = Unit.local_position(player_unit, 0)
		local dist = Vector3.distance(killed_pos, player_pos)
		local amount = nil

		if dist > 0 then
			amount = 1 / dist * CurrentIntensitySettings.intensity_add_nearby_kill
		else
			amount = CurrentIntensitySettings.intensity_add_nearby_kill
		end

		local status_ext = ScriptUnit.extension(player_unit, "status_system")

		status_ext:add_intensity(amount)
	end
end

Pacing.advance_pacing = function (self, t, reason)
	local pacing = self.pacing_state
	next_pacing, self._end_pacing_time = nil

	if pacing == "pacing_build_up" then
		next_pacing = "pacing_sustain_peak"
		self._end_pacing_time = t + ConflictUtils.random_interval(CurrentPacing.sustain_peak_duration)
		self._threat_population = 1
		self._specials_population = 1
		self._horde_population = 1
	elseif pacing == "pacing_sustain_peak" then
		next_pacing = "pacing_peak_fade"
		self._threat_population = 0
		self._specials_population = 0
		self._horde_population = 0
	elseif pacing == "pacing_peak_fade" then
		next_pacing = "pacing_relax"
		self._end_pacing_time = t + ConflictUtils.random_interval(CurrentPacing.relax_duration)
		self._threat_population = 1
		self._specials_population = 0
		self._horde_population = 0

		Managers.state.conflict:going_to_relax_state()
		Managers.state.conflict:init_rush_check(t)
	elseif pacing == "pacing_relax" then
		next_pacing = "pacing_build_up"
		self._threat_population = 1
		self._specials_population = 1
		self._horde_population = 1

		Managers.state.conflict.specials_pacing:delay_spawning(t, 10, math.random(5, 10))
		Managers.state.conflict:stop_rush_check()
	end

	if script_data.debug_player_intensity then
		self:annotate_graph(next_pacing, "orange")

		if reason then
			self:annotate_graph(reason, "firebrick")
		end
	end

	if self.pacing_state ~= next_pacing then
		local pacing_id = NetworkLookup.pacing[next_pacing]

		Managers.state.network.network_transmit:send_rpc_all("rpc_pacing_changed", pacing_id)
	end

	self.pacing_state = next_pacing
	self._state_start_time = t
end

Pacing.update = function (self, t, dt, alive_player_units)
	local num_alive_player_units = #alive_player_units

	if num_alive_player_units == 0 then
		return
	end

	local pacing_state = self.pacing_state

	self[pacing_state](self, t)

	local sum_intensity = 0

	for k = 1, num_alive_player_units, 1 do
		local unit = alive_player_units[k]
		local status_ext = ScriptUnit.extension(unit, "status_system")
		local intensity = status_ext:get_intensity()
		self.player_intensity[k] = intensity
		sum_intensity = sum_intensity + intensity
	end

	self.total_intensity = sum_intensity / num_alive_player_units

	self:intensity_graphs(t, dt, alive_player_units)
end

Pacing.toggle_graph = function (self)
	if self.graph then
		self.graph:set_active(not self.graph.active)
	end
end

Pacing.show_debug = function (self, show)
	if not self.graph then
		return false
	end

	if show then
		self.graph:set_active(true)
	else
		self.graph:set_active(false)
	end

	return true
end

Pacing.debug_add_intensity = function (self, player_units, value)
	for k = 1, #player_units, 1 do
		local unit = player_units[k]
		local status_ext = ScriptUnit.extension(unit, "status_system")

		status_ext:add_intensity(value)
	end
end

local time_width = 120
local player_names = {
	"player1",
	"player2",
	"player3",
	"player4"
}

Pacing.intensity_graphs = function (self, t, dt, alive_player_units)
	if script_data.debug_player_intensity then
		local g = self.graph

		if not g then
			self.graph = Managers.state.debug.graph_drawer:create_graph("intensity", {
				"time",
				"intensity"
			})
			self.graph.visual_frame.y_max = 100
			self.graph.scroll_lock.vertical = false
			self.graph.scroll_lock.left = false
			g = self.graph

			g:set_plot_color("rats", "blue", "blue")
			g:set_plot_color("sum", "red", "red")
		end

		local sum_intensity = self.total_intensity

		g:add_point(t, sum_intensity, "sum")

		self.graph.visual_frame.x_min = t - time_width

		for k = 1, #alive_player_units, 1 do
			local intensity = self.player_intensity[k]

			g:add_point(t, intensity, player_names[k])
		end

		local num_rats = Managers.state.conflict:count_units_by_breed("skaven_clan_rat")

		g:add_point(t, num_rats, "rats")
	elseif self.graph then
		Managers.state.debug.graph_drawer:destroy_graph(self.graph)

		self.graph = nil
	end
end

local annotate_pos = 70

Pacing.annotate_graph = function (self, text, color)
	if not self.graph then
		return
	end

	annotate_pos = annotate_pos - 6

	if annotate_pos <= 30 then
		annotate_pos = 70
	end

	local t = Managers.time:time("game")

	self.graph:add_annotation({
		live = true,
		x = t,
		y = annotate_pos,
		text = text,
		color = color or "orange"
	})
end

Pacing.get_intensity = function (self)
	return self.total_intensity, self.player_intensity
end

Pacing.get_roaming_density = function (self)
	return 0.5
end

return
