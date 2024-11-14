-- chunkname: @scripts/managers/network/lobby_manager.lua

LobbyManager = class(LobbyManager)

LobbyManager.init = function (self)
	self._lobbies = {}
end

LobbyManager.make_lobby = function (self, class, handle, ...)
	fassert(not self._lobbies[handle], "[LobbyManager] Overwriting existing lobby with handle %s", handle)

	self._lobbies[handle] = class:new(...)
end

LobbyManager.register_existing_lobby = function (self, lobby, handle)
	fassert(not self._lobbies[handle], "[LobbyManager] Overwriting existing lobby with handle %s", handle)

	self._lobbies[handle] = lobby
end

LobbyManager.move_lobby = function (self, old_handle, new_handle)
	fassert(not self._lobbies[new_handle], "[LobbyManager] Overwriting existing lobby with handle %s", new_handle)

	self._lobbies[new_handle] = self._lobbies[old_handle]

	print("[LobbyManager] Renaming lobby %s to %s", old_handle, new_handle)
end

LobbyManager.query_lobby = function (self, handle)
	return self._lobbies[handle]
end

LobbyManager.destroy_lobby = function (self, handle)
	local lobby = self:free_lobby(handle)

	lobby:destroy()
end

LobbyManager.free_lobby = function (self, handle)
	local lobby = self._lobbies[handle]

	self._lobbies[handle] = nil

	return lobby
end
