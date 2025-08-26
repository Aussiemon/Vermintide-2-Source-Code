-- chunkname: @scripts/managers/network/lobby_manager.lua

LobbyManager = class(LobbyManager)

LobbyManager.init = function (self)
	self._lobbies = {}
	self._tags = {}
end

LobbyManager.make_lobby = function (self, class, handle, tag, ...)
	fassert(not self._lobbies[handle], "[LobbyManager] Overwriting existing lobby with handle %s. Tag: %s", handle, self._tags[handle])

	local lobby = class:new(...)

	self._lobbies[handle] = lobby
	self._tags[handle] = tag

	return lobby
end

LobbyManager.register_existing_lobby = function (self, lobby, handle, tag)
	fassert(not self._lobbies[handle], "[LobbyManager] Overwriting existing lobby with handle %s. Tag: %s", handle, self._tags[handle])

	self._lobbies[handle] = lobby
	self._tags[handle] = tag
end

LobbyManager.move_lobby = function (self, old_handle, new_handle, tag)
	fassert(not self._lobbies[new_handle], "[LobbyManager] Overwriting existing lobby with handle %s. Existing tag: %s", new_handle, self._tags[old_handle])

	self._lobbies[new_handle] = self._lobbies[old_handle]
	self._tags[new_handle] = self._tags[old_handle] .. " -> " .. tag
	self._lobbies[old_handle] = nil
	self._tags[old_handle] = nil

	print("[LobbyManager] Renaming lobby %s to %s", old_handle, new_handle)
end

LobbyManager.query_lobby = function (self, handle)
	return self._lobbies[handle]
end

LobbyManager.get_lobby = function (self, handle)
	local lobby = self._lobbies[handle]

	if not lobby then
		ferror("[LobbyManager] Expected lobby with handle %s but found none. Existing lobbies:", handle, table.tostring(table.map_to_array(self._lobbies, function (h)
			return h .. ": " .. self._tags[h]
		end)))
	end

	return lobby
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
