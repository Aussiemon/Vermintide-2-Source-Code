require("core/gwnav/lua/safe_require")

local NavGraph = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavGraph = NavClass(NavGraph)
local GwNavGraph = stingray.GwNavGraph
NavGraph.init = function (self, world, bidirectional_edges, point_table, color, layer_id, smartobject_id, user_data_id)
	self.nav_navgraph = GwNavGraph.create(world, bidirectional_edges, point_table, color, layer_id, smartobject_id, user_data_id)

	return 
end
NavGraph.shutdown = function (self)
	GwNavGraph.destroy(self.nav_navgraph)

	self.nav_navgraph = nil

	return 
end
NavGraph.add_to_database = function (self)
	GwNavGraph.add_to_database(self.nav_navgraph)

	return 
end
NavGraph.remove_from_database = function (self)
	GwNavGraph.remove_from_database(self.nav_navgraph)

	return 
end

return NavGraph
