StoreDisplayItemGizmoExtension = class(StoreDisplayItemGizmoExtension)

StoreDisplayItemGizmoExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._gizmo_unit = unit
	self._world = extension_init_context.world
	local store_display_key = Unit.get_data(unit, "store_display_key")
	local backend_store = Managers.backend:get_interface("peddler")
	local store_display_items = backend_store:store_display_items()
	local item_key = store_display_items and store_display_items[store_display_key]

	if item_key then
		self:spawn_prop(item_key)
	elseif Unit.get_data(unit, "hide_if_empty") then
		Unit.set_unit_visibility(unit, false)
		Unit.disable_physics(unit)
	end
end

StoreDisplayItemGizmoExtension.cb_display_item_loaded = function (self)
	local unit = self._gizmo_unit
	local node_name = "ap_hat"
	local node_index = 0

	if Unit.has_node(unit, node_name) then
		node_index = Unit.node(unit, node_name)
	end

	local world = self._world
	local pose = Unit.world_pose(unit, node_index)
	local display_unit = World.spawn_unit(world, self._display_unit_name, pose)
	self._display_unit = display_unit

	World.link_unit(world, display_unit, unit, node_index)
end

StoreDisplayItemGizmoExtension.spawn_prop = function (self, item_master_list_id)
	local item_data = ItemMasterList[item_master_list_id]

	if item_data then
		local unit_name = item_data.unit
		unit_name = unit_name or (unit_name and unit_name .. "_3p")

		print("[StoreDisplayItemGizmoExtension] spawn prop", item_master_list_id, unit_name)

		if unit_name then
			self._display_unit_name = unit_name
			local cb = callback(self, "cb_display_item_loaded", unit_name)

			Managers.package:load(unit_name, "StoreDisplayItemGizmoExtension", cb, true, true)
		end
	else
		print("[StoreDisplayItemGizmoExtension] can't find master_item_id", item_master_list_id)
	end
end

StoreDisplayItemGizmoExtension.destroy = function (self)
	if Unit.alive(self._display_unit) then
		World.destroy_unit(self._world, self._display_unit)
	end

	if self._display_unit_name then
		Managers.package:unload(self._display_unit_name, "StoreDisplayItemGizmoExtension")
	end
end

return
