require("scripts/ui/views/rcon_ui")

RconManager = class(RconManager)
local Commands = {
	["/help"] = {
		arg_help = "",
		min_args = 0,
		help = "rcon_meta_command_help_help",
		max_args = 0,
		method = "_meta_help"
	},
	["/connect"] = {
		arg_help = "rcon_meta_command_args_connect",
		min_args = 2,
		help = "rcon_meta_command_help_connect",
		max_args = 3,
		method = "_meta_connect"
	},
	["/disconnect"] = {
		arg_help = "",
		min_args = 0,
		help = "rcon_meta_command_help_disconnect",
		max_args = 0,
		method = "_meta_disconnect"
	}
}

local function tr(localize_key)
	if localize_key == "" then
		return ""
	end

	return Localize(localize_key)
end

RconManager.init = function (self)
	self._rcon_ui = nil
	self._enabled = false
	self._connected = false
	self._connection_id = nil
	self._server_id = nil
	self._intercept_ids = {}

	if PLATFORM == "win32" then
		self:_create_rcon_ui()
	end
end

RconManager.update = function (self, dt, t, menu_active, menu_input_service, no_unblock)
	if not self._enabled then
		return
	end

	self._rcon_ui:update(dt, menu_active, menu_input_service, no_unblock)

	if self._connection_id ~= nil then
		RConClient.update(dt, self)
	end
end

RconManager.set_input_manager = function (self, input_manager)
	if not self._enabled then
		return
	end

	self._rcon_ui:set_input_manager(input_manager)
end

RconManager.authenticated_server = function (self)
	return self._server_id
end

RconManager.authenticated_with_playing_server = function (self)
	local network_manager = Managers.state.network

	if network_manager == nil then
		return false
	end

	local lobby = network_manager:lobby()

	if lobby == nil then
		return false
	end

	return lobby:lobby_host() == self._server_id
end

RconManager.send_command = function (self, command)
	command = command:match("^%s*(.-)%s*$")

	if command:match("/.*") then
		self:_meta_command(command)
	else
		self:_server_command(command)
	end
end

RconManager.rcon_accepted = function (self, id)
	self._rcon_ui:add_output(tr("rcon_login_accept"), RconUI.OUTPUT_MSG)
	self._rcon_ui:set_header(tr("rcon_connection_status_connected"))

	self._connected = true
	local command_id = RConClient.command(self._connection_id, "id")
	self._intercept_ids[command_id] = RconManager._id_reply
end

RconManager.rcon_denied = function (self, id)
	self._rcon_ui:add_output(tr("rcon_login_denied"), RconUI.OUTPUT_MSG)
	self._rcon_ui:set_header(tr("rcon_connection_status_disconnected"))

	self._connection_id = nil
	self._connected = false
	self._server_id = nil
end

RconManager.rcon_disconnect = function (self, connection_id)
	self._rcon_ui:add_output(tr("rcon_connection_dropped"), RconUI.OUTPUT_MSG)
	self._rcon_ui:set_header(tr("rcon_connection_status_disconnected"))

	self._connection_id = nil
	self._connected = false
	self._server_id = nil
end

RconManager.rcon_reply = function (self, connection_id, command_id, message)
	if connection_id == self._connection_id then
		local intercept_method = self._intercept_ids[command_id]

		if intercept_method ~= nil then
			self._intercept_ids[connection_id] = nil

			intercept_method(self, message)

			return
		end

		self._rcon_ui:add_output(message, RconUI.OUTPUT_MSG)
	end
end

RconManager._meta_command = function (self, command_string)
	local args = split_string(command_string)

	if #args == 0 then
		return
	end

	local command = table.remove(args, 1)

	if command ~= "/connect" then
		self._rcon_ui:add_output(command_string, RconUI.ECHO_MSG)
	end

	local command_info = Commands[command]

	if command_info == nil then
		self._rcon_ui:add_output(tr("rcon_meta_command_error_unknown_command"), RconUI.META_MSG)

		return
	end

	local num_args = #args

	if num_args < command_info.min_args then
		self._rcon_ui:add_output(tr("rcon_meta_command_error_too_few_args"), RconUI.META_MSG)
		self._rcon_ui:add_output(string.format("%s %s", command, tr(command_info.arg_help)), RconUI.META_MSG)

		return
	end

	if command_info.max_args < num_args then
		self._rcon_ui:add_output(tr("rcon_meta_command_error_too_many_args"), RconUI.META_MSG)
		self._rcon_ui:add_output(string.format("%s %s", command, tr(command_info.arg_help)), RconUI.META_MSG)

		return
	end

	self[command_info.method](self, unpack(args))
end

RconManager._disconnect = function (self)
	if self._connection_id ~= nil then
		RConClient.close(self._connection_id)

		self._connection_id = nil
		self._connected = false
	end
end

RconManager._server_command = function (self, command_string)
	self._rcon_ui:add_output(command_string, RconUI.ECHO_MSG)

	if self._connected then
		slot2 = RConClient.command(self._connection_id, command_string)
	else
		self._rcon_ui:add_output(tr("rcon_command_error_not_connected"), RconUI.META_MSG)
	end
end

RconManager._create_rcon_ui = function (self)
	local top_world = Managers.world:world("top_ingame_view")
	self._ui_top_renderer = UIRenderer.create(top_world, "material", "materials/ui/ui_1080p_chat", "material", "materials/fonts/gw_fonts")
	local context = {
		input_manager = Managers.input,
		ui_top_renderer = self._ui_top_renderer
	}
	self._rcon_ui = RconUI:new(context, self)
	self._enabled = true

	self._rcon_ui:add_output(tr("rcon_introduction"), RconUI.META_MSG)
end

RconManager._id_reply = function (self, id_string)
	self._server_id = id_string:match("^%s*(.-)%s*$")
end

RconManager._meta_help = function (self)
	local help_text = tr("rcon_meta_help")

	self._rcon_ui:add_output(help_text, RconUI.META_MSG)
	self._rcon_ui:add_output("---", RconUI.META_MSG)

	local sorted_names = {}

	for command, _ in pairs(Commands) do
		sorted_names[#sorted_names + 1] = command
	end

	table.sort(sorted_names)

	for _, command in ipairs(sorted_names) do
		local command_info = Commands[command]

		self._rcon_ui:add_output(string.format("%s %s - %s", command, tr(command_info.arg_help), tr(command_info.help)), RconUI.META_MSG)
	end
end

RconManager._meta_connect = function (self, ip, port, password)
	self._rcon_ui:add_output(string.format("/connect %s %s ********", ip, port), RconUI.ECHO_MSG)

	if ip:match("^%d+%.%d+%.%d+%.%d+$") == nil then
		self._rcon_ui:add_output(tr("rcon_meta_command_error_invalid_ip"), RconUI.META_MSG)
	end

	if port:match("^%d+$") == nil then
		self._rcon_ui:add_output(tr("rcon_meta_command_error_invalid_port"), RconUI.META_MSG)
	end

	port = tonumber(port)

	if self._connection_id ~= nil then
		self:_disconnect()
	end

	self._connection_id = RConClient.connect(ip, port, password or "")

	self._rcon_ui:set_header(tr("rcon_connection_status_connecting"))
end

RconManager._meta_disconnect = function (self)
	self:_disconnect()
	self._rcon_ui:set_header(tr("rcon_connection_status_disconnected"))
end

return
