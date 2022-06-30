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
	self._percentage_completed = {}
	self._use_level_progress = Managers.state.game_mode:setting("use_level_progress")
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
	local active_missions = self.active_missions

	for name, data in pairs(active_missions) do
		if not data.manual_update then
			self:update_mission(name, nil, dt)
		end
	end

	if self._use_level_progress then
		self:_update_level_progress(dt)
	end

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

	if not mission_data.hidden and not data.mission_data.is_side_mission then
		Managers.state.event:trigger("ui_event_add_mission_objective", mission_name, data.center_text or data.text)
	end

	self.active_missions[mission_name] = data

	if unit then
		Unit.flow_event(unit, "lua_mission_started")
	end

	if data.evaluate_at_level_end then
		self.level_end_missions[mission_name] = data
	end
end

MissionSystem.block_mission_ui = function (self, ui_blocked)
	Managers.state.event:trigger("ui_event_block_mission_ui", ui_blocked)
end

MissionSystem.end_mission = function (self, mission_name, sync)
	fassert(self.active_missions[mission_name], "No active mission with passed mission_name %q", mission_name)

	local data = self.active_missions[mission_name]
	local template = MissionTemplates[data.mission_data.mission_template_name]
	local completed = template.evaluate_mission(data)
	local info_slate_type = (data.mission_data.is_side_mission and "side_mission") or data.info_slate_type

	if not data.mission_data.hidden then
		Managers.state.event:trigger("ui_event_complete_mission", mission_name, data.mission_data.dont_show_mission_end_tooltip)
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

	if not data.mission_data.hidden then
		Managers.state.event:trigger("ui_event_update_mission", mission_name, data.center_text or data.text)
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
		local channel_id = PEER_ID_TO_CHANNEL[sender]

		if level_unit then
			local level_unit_id = Level.unit_index(LevelHelper:current_level(self.world), level_unit)

			RPC.rpc_start_mission_with_unit(channel_id, mission_name_id, level_unit_id, sync_data)
		else
			RPC.rpc_start_mission(channel_id, mission_name_id, sync_data)
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

MissionSystem.rpc_start_mission = function (self, channel_id, mission_name_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:start_mission(mission_name, nil, sync_data)
end

MissionSystem.rpc_start_mission_with_unit = function (self, channel_id, mission_name_id, level_unit_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	self:start_mission(mission_name, unit, sync_data)
end

MissionSystem.rpc_request_mission = function (self, channel_id, mission_name_id)
	fassert(self.is_server, "[MissionSystem] Request mission ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:request_mission(mission_name)
end

MissionSystem.rpc_request_mission_with_unit = function (self, channel_id, mission_name_id, level_unit_id)
	fassert(self.is_server, "[MissionSystem] Request mission ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local unit = Level.unit_by_index(LevelHelper:current_level(self.world), level_unit_id)

	self:request_mission(mission_name, unit)
end

MissionSystem.rpc_request_mission_update = function (self, channel_id, mission_name_id, positive)
	fassert(self.is_server, "[MissionSystem] Request mission update ended up on a client")

	local mission_name = NetworkLookup.mission_names[mission_name_id]

	if self.active_missions[mission_name] then
		local data = self.active_missions[mission_name]

		fassert(data.manual_update, "[MissionSystem] Requested an update on a mission not using manual updates", mission_name)
		self:update_mission(mission_name, positive, nil, true)
	end
end

MissionSystem.rpc_end_mission = function (self, channel_id, mission_name_id)
	local mission_name = NetworkLookup.mission_names[mission_name_id]

	self:end_mission(mission_name)
end

MissionSystem.rpc_update_mission = function (self, channel_id, mission_name_id, sync_data)
	local mission_name = NetworkLookup.mission_names[mission_name_id]
	local data = self.active_missions[mission_name]

	fassert(data, "[MissionSystem]:rpc_update_mission() Trying to update non-active mission %q", mission_name)

	local mission_template_name = data.mission_data.mission_template_name
	local template = MissionTemplates[mission_template_name]

	template.sync(data, sync_data)
	template.update_text(data)

	if not data.mission_data.hidden then
		Managers.state.event:trigger("ui_event_update_mission", mission_name, data.center_text or data.text)
	end
end

MissionSystem.get_missions = function (self)
	return self.active_missions, self.completed_missions
end

MissionSystem.has_active_mission = function (self, mission_name)
	return self.active_missions[mission_name] ~= nil
end

MissionSystem.get_level_end_mission_data = function (self, mission_template_name)
	return self.level_end_missions[mission_template_name]
end

MissionSystem.set_percentage_completed = function (self, percentage_completed)
	self._percentage_completed = percentage_completed
end

MissionSystem._update_level_progress = function (self, dt)
	if self.is_server then
		local conflict_director = Managers.state.conflict
		local percentage_completed = self._percentage_completed
		local player_manager = Managers.player
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local PLAYER_AND_BOT_UNITS = hero_side.PLAYER_AND_BOT_UNITS

		for i = 1, #PLAYER_AND_BOT_UNITS, 1 do
			local player_unit = PLAYER_AND_BOT_UNITS[i]
			local main_path_completion = conflict_director:main_path_completion(player_unit)
			local player = player_manager:owner(player_unit)
			local unique_id = player:unique_id()
			local saved_main_path_completion = percentage_completed[unique_id] or 0

			if main_path_completion > saved_main_path_completion then
				percentage_completed[unique_id] = main_path_completion
			end
		end
	end
end

MissionSystem.override_percentage_completed = function (self, progression)
	if self.is_server then
		self._percentage_completed_override = progression
	end
end

MissionSystem.percentages_completed = function (self)
	for unique_id, main_path_completion in pairs(self._percentage_completed) do
		local percentage_completed = self._percentage_completed_override or main_path_completion
		self._percentage_completed[unique_id] = math.clamp(percentage_completed, 0, 1)
	end

	return self._percentage_completed
end

return
