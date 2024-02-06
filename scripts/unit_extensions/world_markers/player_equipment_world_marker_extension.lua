-- chunkname: @scripts/unit_extensions/world_markers/player_equipment_world_marker_extension.lua

require("scripts/unit_extensions/world_markers/world_marker_extension")

PlayerEquipmentWorldMarkerExtension = class(PlayerEquipmentWorldMarkerExtension, WorldMarkerExtension)

PlayerEquipmentWorldMarkerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	PlayerEquipmentWorldMarkerExtension.super.init(self, extension_init_context, unit, extension_init_data)

	self._marker_type = "versus_hero_status"
	self._add_event_name = "add_world_marker_unit"
	self._remove_event_name = "remove_world_marker"
	self._status_extension = nil
	self._side = nil
	self._is_enemy = false
	self._local_player_side = nil
	self._local_player_is_dark_pact = false
	self._initialized = false
end

PlayerEquipmentWorldMarkerExtension._extensions_ready = function (self)
	if DEDICATED_SERVER then
		return
	end

	if Managers.level_transition_handler:in_hub_level() then
		return
	end

	local unit = self._unit

	self._status_extension = ScriptUnit.extension(unit, "status_system")

	local local_player = Managers.player:local_player()
	local local_unique_id = local_player:unique_id()
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[unit]
	local local_side = side_manager:get_side_from_player_unique_id(local_unique_id)

	self._side = side
	self._is_enemy = side_manager:is_enemy_by_side(side, local_side)
	self._local_player_is_dark_pact = local_side:name() == "dark_pact"
	self._initialized = true
end

PlayerEquipmentWorldMarkerExtension._add_marker = function (self, cb)
	local unit = self._unit
	local add_event_name = self._add_event_name
	local event_manager = self._event_manager
	local marker_type = self._marker_type

	event_manager:trigger(add_event_name, marker_type, unit, cb)
end

PlayerEquipmentWorldMarkerExtension.update = function (self, unit, dummy_input, dt, context, t)
	if not self._initialized then
		return
	end

	local side_manager = Managers.state.side
	local local_player = Managers.player:local_player()
	local local_unique_id = local_player:unique_id()
	local local_side = side_manager:get_side_from_player_unique_id(local_unique_id)

	self._local_player_is_dark_pact = local_side:name() == "dark_pact"
	self._is_enemy = side_manager:is_enemy_by_side(self._side, local_side)

	if not self._local_player_is_dark_pact or not self._is_enemy then
		return
	end

	local status_extension = self._status_extension
	local is_dead = status_extension:is_dead()
	local is_invisible = status_extension:is_invisible()

	if self._id and (is_dead or is_invisible) then
		self:remove_marker()
	elseif not self._id and not is_dead and not is_invisible then
		self:add_marker()
	end
end
