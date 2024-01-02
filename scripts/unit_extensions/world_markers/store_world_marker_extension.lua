require("scripts/unit_extensions/world_markers/world_marker_extension")

StoreWorldMarkerExtension = class(StoreWorldMarkerExtension, WorldMarkerExtension)

StoreWorldMarkerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	StoreWorldMarkerExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._marker_type = "store"
	self._add_event_name = "add_world_marker_unit"
	self._remove_event_name = "remove_world_marker"
	self._initialized = false
	self._unseen_shop_items = false

	Managers.state.event:register(self, "set_all_shop_item_seen", "event_set_all_shop_item_seen")
end

StoreWorldMarkerExtension._destroy = function (self)
	Managers.state.event:unregister("set_all_shop_item_seen", self)
end

StoreWorldMarkerExtension.event_set_all_shop_item_seen = function (self)
	self._unseen_shop_items = false
end

StoreWorldMarkerExtension._extensions_ready = function (self)
	if DEDICATED_SERVER then
		return
	end

	self._local_player = Managers.player:local_player()
	self._backend_store = Managers.backend:get_interface("peddler")
	self._unseen_shop_items = ItemHelper.has_unseen_shop_items()
	self._initialized = true
end

StoreWorldMarkerExtension._add_marker = function (self, cb)
	local unit = self._unit
	local add_event_name = self._add_event_name
	local event_manager = self._event_manager
	local marker_type = self._marker_type

	event_manager:trigger(add_event_name, marker_type, unit, cb)
end

StoreWorldMarkerExtension.update = function (self, unit, dummy_input, dt, context, t)
	if not self._initialized then
		return
	end

	local player_unit = self._local_player.player_unit

	if not ALIVE[player_unit] then
		return
	end

	local should_show = false
	local login_rewards = self._backend_store:get_login_rewards()

	if login_rewards and login_rewards.next_claim_timestamp < os.time() then
		should_show = true
	end

	if should_show == not self._id then
		if should_show then
			self:add_marker()
		else
			self:remove_marker()
		end
	end
end
