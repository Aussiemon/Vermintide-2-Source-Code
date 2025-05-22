-- chunkname: @scripts/ui/views/level_end/level_end_view_wrapper.lua

require("scripts/ui/views/level_end/level_end_view_v2")

local RPCS = {
	"rpc_signal_end_of_level_done",
	"rpc_notify_lobby_joined",
}

for _, dlc in pairs(DLCSettings) do
	local end_view_files = dlc.end_view

	if end_view_files then
		table.map(end_view_files, require)
	end
end

LevelEndViewWrapper = class(LevelEndViewWrapper)

LevelEndViewWrapper.init = function (self, level_end_view_context)
	self._level_end_view_context = level_end_view_context

	self:_create_input_service()

	self._delayed_calls = {}

	self:_load_level_packages()
end

LevelEndViewWrapper._load_level_packages = function (self)
	self._level_packages = self._level_end_view_context.level_end_view_packages or {}

	local asynchronous = true
	local prioritize = true
	local cb = callback(self, "cb_package_loaded")

	if not table.is_empty(self._level_packages) then
		for _, package_name in ipairs(self._level_packages) do
			Managers.package:load(package_name, "end_screen", cb, asynchronous, prioritize)
		end
	else
		cb()
	end
end

LevelEndViewWrapper.cb_package_loaded = function (self)
	for _, package_name in ipairs(self._level_packages) do
		if not Managers.package:has_loaded(package_name, "end_screen") then
			return
		end
	end

	self:_initiate_level_end_view()
end

LevelEndViewWrapper._unload_level_packages = function (self)
	for _, package_name in ipairs(self._level_packages) do
		Managers.package:unload(package_name, "end_screen")
	end
end

LevelEndViewWrapper.active_input_service = function (self)
	return self._level_end_view:active_input_service()
end

LevelEndViewWrapper.enable_chat = function (self)
	if not self._level_end_view then
		return false
	end

	return self._level_end_view:enable_chat()
end

LevelEndViewWrapper._initiate_level_end_view = function (self)
	local level_end_view = self._level_end_view_context.level_end_view

	if level_end_view then
		local class = rawget(_G, level_end_view)

		self._level_end_view = class:new(self._level_end_view_context)
	else
		self._level_end_view = LevelEndView:new(self._level_end_view_context)
	end

	for i = 1, #self._delayed_calls do
		local delayed_call = self._delayed_calls[i]

		self._level_end_view[delayed_call.func](self._level_end_view, unpack(delayed_call.parameters))
	end

	table.clear(self._delayed_calls)
end

LevelEndViewWrapper._create_input_service = function (self)
	local input_manager = Managers.input

	input_manager:create_input_service("end_of_level", "IngameMenuKeymaps", "EndLevelViewKeymapsFilters")
	input_manager:map_device_to_service("end_of_level", "keyboard")
	input_manager:map_device_to_service("end_of_level", "mouse")
	input_manager:map_device_to_service("end_of_level", "gamepad")
	input_manager:block_device_except_service("end_of_level", "keyboard", 1)
	input_manager:block_device_except_service("end_of_level", "mouse", 1)
	input_manager:block_device_except_service("end_of_level", "gamepad", 1)

	self._level_end_view_context.input_manager = input_manager
end

LevelEndViewWrapper.destroy = function (self)
	if self._registered_rpcs then
		self:unregister_rpcs()
	end

	if not Managers.chat:chat_is_focused() then
		local input_manager = Managers.input

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")
	end

	self._level_end_view:delete()

	self._level_end_view = nil
	self._level_end_view_context = nil

	self:_unload_level_packages()
end

LevelEndViewWrapper.game_state_changed = function (self)
	self:_create_input_service()

	local input_manager = Managers.input

	if self._level_end_view then
		self._level_end_view:set_input_manager(input_manager)
	else
		self._delayed_calls[#self._delayed_calls + 1] = {
			func = "set_input_manager",
			parameters = {
				input_manager,
			},
		}
	end
end

LevelEndViewWrapper.start = function (self, ...)
	if self._level_end_view then
		self._level_end_view:start()
	else
		self._delayed_calls[#self._delayed_calls + 1] = {
			func = "start",
			parameters = {
				...,
			},
		}
	end
end

LevelEndViewWrapper.done = function (self)
	if not self._level_end_view then
		return false
	end

	return self._level_end_view:done()
end

LevelEndViewWrapper.do_retry = function (self)
	if not self._level_end_view then
		return
	end

	return self._level_end_view:do_retry()
end

LevelEndViewWrapper.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._registered_rpcs = true
end

LevelEndViewWrapper.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._registered_rpcs = false
end

LevelEndViewWrapper.rpc_signal_end_of_level_done = function (self, ...)
	if self._level_end_view then
		self._level_end_view:rpc_signal_end_of_level_done(...)
	else
		self._delayed_calls[#self._delayed_calls + 1] = {
			func = "rpc_signal_end_of_level_done",
			parameters = {
				...,
			},
		}
	end
end

LevelEndViewWrapper.rpc_notify_lobby_joined = function (self, ...)
	if self._level_end_view then
		self._level_end_view:rpc_notify_lobby_joined(...)
	else
		self._delayed_calls[#self._delayed_calls + 1] = {
			func = "rpc_notify_lobby_joined",
			parameters = {
				...,
			},
		}
	end
end

LevelEndViewWrapper.left_lobby = function (self, ...)
	if self._level_end_view then
		self._level_end_view:left_lobby(...)
	else
		self._delayed_calls[#self._delayed_calls + 1] = {
			func = "left_lobby",
			parameters = {
				...,
			},
		}
	end
end

LevelEndViewWrapper.update = function (self, dt, t)
	if self._level_end_view then
		self._level_end_view:update(dt, t)
	end
end

LevelEndViewWrapper.post_update = function (self, dt, t)
	if self._level_end_view then
		self._level_end_view:post_update(dt, t)
	end
end
