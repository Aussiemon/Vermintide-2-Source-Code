require("scripts/entity_system/systems/mission/mission_templates")
require("scripts/settings/missions")

MissionSystem = class(MissionSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_start_mission",
	"rpc_start_mission_with_unit",
	"rpc_end_mission",
	"rpc_request_mission",
	"rpc_request_mission_with_unit",
	"rpc_update_mission",
	"rpc_request_mission_update"
}
local extensions = {}
script_data.debug_mission_system = script_data.debug_mission_system or Development.parameter("debug_mission_system")

MissionSystem.init = function (self, entity_system_creation_context, system_name)
	MissionSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.active_missions = {}
	self.level_end_missions = {}
	self.completed_missions = {}
	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.statistics_db = entity_system_creation_context.statistics_db
	local network_manager = Managers.state.network
	self.network_manager = network_manager
	self.network_transmit = network_manager.network_transmit
	self.is_server = entity_system_creation_context.is_server
	self._percentage_completed = 0
end

MissionSystem.create_checkpoint_data = function (self)
	local world = self.world
	local checkpoint_data = {}
	local active_missions = {}

	for name, data in pairs(self.active_missions) do
		local mission_data = {}
		local unit = data.unit

		if unit then
			local index = LevelHelper:unit_index(world, unit)
			mission_data.unit_index = index
		end

		active_missions[name] = mission_data
	end

	checkpoint_data.active_missions = active_missions
	local completed_missions = {}

	for name, data in pairs(self.completed_missions) do
		local mission_data = {}
		local unit = data.unit

		if unit then
			local index = LevelHelper:unit_index(world, unit)
			mission_data.unit_index = index
		end

		completed_missions[name] = mission_data
	end

	checkpoint_data.completed_missions = completed_missions

	return checkpoint_data
end

MissionSystem.load_checkpoint_data = function (self, checkpoint_data)
	local world = self.world

	for name, data in pairs(checkpoint_data.completed_missions) do
		local unit_index = data.unit_index
		local unit = (unit_index and LevelHelper:unit_by_index(world, unit_index)) or nil

		self:start_mission(name, unit)
		self:end_mission(name, true)
	end

	for name, data in pairs(checkpoint_data.active_missions) do
		local unit_index = data.unit_index
		local unit = (unit_index and LevelHelper:unit_by_index(world, unit_index)) or nil

		self:start_mission(name, unit)
	end
end

MissionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.network_transmit = nil
	self.network_manager = nil
end

MissionSystem.update = function (self, context, t)
	local dt = context.dt

	Profiler.start("MissionSystem:update()")

	local active_missions = self.active_missions

	for name, data in pairs(active_missions) do
		if not data.manual_update then
			self:update_mission(name, nil, dt)
		end
	end

	self:_update_level_progress(dt)
	Profiler.stop("MissionSystem:update()")

	if script_data.debug_mission_system then
		self:debug_draw(dt)
	end
end

MissionSystem.request_mission = function (self, mission_name, unit)
	local mission_name_id = NetworkLookup.mission_names[mission_name]
	local level_unit_id = nil

	if unit then
		level_unit_id = Level.unit_index(LevelHelper:current_level(self.world), unit)
	end

	if self.is_server then
		if self.active_missions[mission_name] then
			Debug.sticky_text("Request to start mission %q denied, already started", mission_name)

			return
		end

		if level_unit_id then
			self:start_mission(mission_name, unit)
		else
			self:start_mission(mission_name)
		end

		local data = self.active_missions[mission_name]
		local mission_data = data.mission_data
		local mission_template_name = mission_data.mission_template_name
		local template = MissionTemplates[mission_template_name]
		local sync_data = template.create_sync_data(data)

		if level_unit_id then
			self.network_transmit:send_rpc_clients("rpc_start_mission_with_unit", mission_name_id, level_unit_id, sync_data)
		else
			self.network_transmit:send_rpc_clients("rpc_start_mission", mission_name_id, sync_data)
		end
	elseif level_unit_id then
		self.network_transmit:send_rpc_server("rpc_request_mission_with_unit", mission_name_id, level_unit_id)
	else
		self.network_transmit:send_rpc_server("rpc_request_mission", mission_name_id)
	end
end

MissionSystem.start_mission = function (self, mission_name, unit, sync_data)
	local mission_data = Missions[mission_name]
	local mission_template_name = mission_data.mission_template_name
	local template = MissionTemplates[mission_template_name]
	local data = template.init(mission_data, unit)
	data.mission_type = mission_template_name

	if sync_data then
		template.sync(data, sync_data)
	end

	template.update_text(data)

	if not mission_data.hidden and self.tutorial_ui then
		local info_slate_type = (data.mission_data.is_side_mission and "side_mission") or data.info_slate_type
		data.entry_id = self.tutorial_ui:queue_info_slate_entry(info_slate_type, data.text, "hud_tutorial_icon_mission", true, data.update_sound)

		if not data.mission_data.is_side_mission and self.mission_objective_ui then
			self.mission_objective_ui:add_mission_objective(mission_name, data.center_text or data.text)
		end
	end

	self.active_missions[mission_name] = data

	if unit then
		Unit.flow_event(unit, "lua_mission_started")
	end

	if data.evaluate_at_level_end then
		self.level_end_missions[mission_name] = data
	end
end

MissionSystem.end_mission = function (self, mission_name, sync)
	fassert(self.active_missions[mission_name], "No active mission with passed mission_name %q", mission_name)

	local data = self.active_missions[mission_name]
	local template = MissionTemplates[data.mission_data.mission_template_name]
	local completed = template.evaluate_mission(data)
	local info_slate_type = (data.mission_data.is_side_mission and "side_mission") or data.info_slate_type

	if not data.mission_data.hidden then
		if completed then
			if self.tutorial_ui then
				self.tutorial_ui:complete_mission_info_slate(info_slate_type, data.entry_id)
			end

			if self.mission_objective_ui then
				self.mission_objective_ui:complete_mission(mission_name, data.mission_data.dont_show_mission_end_tooltip)
			end
		else
			if self.tutorial_ui then
				self.tutorial_ui:complete_mission_info_slate(info_slate_type, data.entry_id)
			end

			if self.mission_objective_ui then
				self.mission_objective_ui:complete_mission(mission_name, data.mission_data.dont_show_mission_end_tooltip)
			end
		end
	end

	if sync and self.is_server then
		local mission_name_id = NetworkLookup.mission_names[mission_name]

		self.network_transmit:send_rpc_clients("rpc_end_mission", mission_name_id, completed)
	end

	local unit = data.unit

	if unit then
		local flow_event = (completed and "lua_mission_complete") or "lua_mission_failed"

		Unit.flow_event(unit, flow_event)
	end

	self.active_missions[mission_name] = nil
	self.completed_missions[mission_name] = data
end

MissionSystem.update_mission = function (self, mission_name, positive, dt, sync)
	fassert(self.active_missions[mission_name], "No active mission with passed mission_name %q", mission_name)

	local data = self.active_missions[mission_name]
	local network_time = self.network_manager:network_time()
	local mission_template_name = data.mission_data.mission_template_name
	local template = MissionTemplates[mission_template_name]
	local done = template.update(data, positive, dt, network_time)

	template.update_text(data)

	if not data.mission_data.hidden and self.tutorial_ui and self.mission_objective_ui then
		local info_slate_type = (data.mission_data.is_side_mission and "side_mission") or data.info_slate_type

		self.tutorial_ui:update_info_slate_entry_text(info_slate_type, data.entry_id, data.text)
		self.mission_objective_ui:update_mission(mission_name, data.center_text or data.text)
	end

	if sync and self.is_server then
		local mission_name_id = NetworkLookup.mission_names[mission_name]
		local sync_data = template.create_sync_data(data)

		self.network_transmit:send_rpc_clients("rpc_update_mission", mission_name_id, sync_data)
	end

	if done then
		self:end_mission(mission_name, sync)
	end
end

MissionSystem.evaluate_level_end_missions = function (self)
	local level_end_missions = self.level_end_missions

	for mission_name, data in pairs(level_end_missions) do
		local template = MissionTemplates[data.mission_data.mission_template_name]
		local completed = template.evaluate_mission(data)

		if completed then
			self:end_mission(mission_name, false)
		end
	end
end

MissionSystem.debug_draw = function (self, dt)
	for mission_name, data in pairs(self.active_missions) do
		Debug.text(data.text)
	end
end

MissionSystem.hot_join_sync = function (self, sender)
	for name, data in pairs(self.active_missions) do
		local mission_name_id = NetworkLookup.mission_names[name]
		local mission_template_name = data.mission_data.mission_template_name
		local template = MissionTemplates[mission_template_name]
		local sync_data = template.create_sync_data(data)
		local level_unit = data.unit

		if level_unit then
			local level_unit_id = Level.unit_index(LevelHelper:current_level(self.world), level_unit)

			RPC.rpc_start_mission_with_unit(sender, mission_name_id, level_unit_id, sync_data)
		else
			RPC.rpc_start_mission(sender, mission_name_id, sync_data)
		end
	end
end

MissionSystem.flow_callback_start_mission = function (self, mission_name, unit)
	if not self.is_server then
		return
	end

	self:request_mission(mission_name, unit)
end

MissionSystem.flow_callback_update_mission = function (self, mission_name)
	if not self.is_server then
		return
	end

	fassert(self.active_missions[mission_name], "No active mission with passed mission_name %q", mission_name)

	local data = self.active_missions[mission_name]

	fassert(data.manual_update, "MissionSystem:flow_callback_update_mission() Trying to update mission %q from flow", mission_name)
	self:update_mission(mission_name, true, nil, true)
end

MissionSystem.flow_callback_end_mission = function (self, mission_name)
	if not self.is_server then
		return
	end

	self:end_mission(mission_name, true)
end

MissionSystem.rpc_start_mission = function (self, peer_id, mission_name_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:start_mission(mission_name, nil, sync_data)
end

MissionSystem.rpc_start_mission_with_unit = function (self, peer_id, mission_name_id, level_unit_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	self:start_mission(mission_name, unit, sync_data)
end

MissionSystem.rpc_request_mission = function (self, peer_id, mission_name_id)
	fassert(self.is_server, "[MissionSystem] Request mission ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:request_mission(mission_name)
end

MissionSystem.rpc_request_mission_with_unit = function (self, peer_id, mission_name_id, level_unit_id)
	fassert(self.is_server, "[MissionSystem] Request mission ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	self:request_mission(mission_name, unit)
end

MissionSystem.rpc_request_mission_update = function (self, peer_id, mission_name_id, positive)
	fassert(self.is_server, "[MissionSystem] Request mission update ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]

	if self.active_missions[mission_name] then
		local data = self.active_missions[mission_name]

		fassert(data.manual_update, "[MissionSystem] Requested an update on a mission not using manual updates", mission_name)
		self:update_mission(mission_name, positive, nil, true)
	end
end

MissionSystem.rpc_end_mission = function (self, peer_id, mission_name_id)
	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:end_mission(mission_name)
end

MissionSystem.rpc_update_mission = function (self, peer_id, mission_name_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local data = self.active_missions[mission_name]

	fassert(data, "[MissionSystem]:rpc_update_mission() Trying to update non-active mission %q", mission_name)

	local mission_template_name = data.mission_data.mission_template_name
	local template = MissionTemplates[mission_template_name]

	template.sync(data, sync_data)
	template.update_text(data)

	if not data.mission_data.hidden and self.tutorial_ui and self.mission_objective_ui then
		local info_slate_type = (data.mission_data.is_side_mission and "side_mission") or data.info_slate_type

		self.tutorial_ui:update_info_slate_entry_text(info_slate_type, data.entry_id, data.text)
		self.mission_objective_ui:update_mission(mission_name, data.center_text or data.text)
	end
end

MissionSystem.get_missions = function (self)
	return self.active_missions, self.completed_missions
end

MissionSystem.get_level_end_mission_data = function (self, mission_template_name)
	return self.level_end_missions[mission_template_name]
end

MissionSystem.set_percentage_completed = function (self, percentage_completed)
	self._percentage_completed = percentage_completed
end

MissionSystem._update_level_progress = function (self, dt)
	if self.is_server then
		local completion = Managers.state.conflict:main_path_completion()

		if self._percentage_completed < completion then
			self._percentage_completed = completion
		end
	end
end

MissionSystem.override_percentage_completed = function (self, progression)
	if self.is_server then
		self._percentage_completed_override = progression
	end
end

MissionSystem.percentage_completed = function (self)
	local percentage_completed = self._percentage_completed_override or self._percentage_completed
	local clamped_percentage = math.clamp(percentage_completed, 0, 1)

	return clamped_percentage
end

return
