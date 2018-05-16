require("core/gwnav/lua/safe_require")

local NavRoute = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavRoute = NavClass(NavRoute)
local Vector3Box = stingray.Vector3Box

NavRoute.init = function (self)
	self._positions = {}
end

NavRoute.add_position = function (self, position)
	self._positions[#self._positions + 1] = Vector3Box(position)
end

NavRoute.positions = function (self)
	return self._positions
end

return NavRoute
