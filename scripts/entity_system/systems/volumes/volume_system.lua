require("scripts/settings/volume_settings")
require("scripts/unit_extensions/generic/generic_volume_templates")

VolumeSystem = class(VolumeSystem, ExtensionSystemBase)
local extensions = {
	"PlayerVolumeExtension",
	"BotVolumeExtension",
	"AIVolumeExtension",
	"PickupProjectileVolumeExtension"
}

VolumeSystem.init = function (self, context, name)
	VolumeSystem.super.init(self, context, name, extensions)

	self._volume_system = EngineOptimizedExtensions.volume_init_system(self._volume_system, VolumeSystemSettings.updates_per_frame)
	self.nav_tag_volume_handler = nil
	self.nav_tag_volumes_to_create = {}
end

VolumeSystem.destroy = function (self)
	VolumeSystem.super.destroy(self)
	EngineOptimizedExtensions.volume_destroy_system(self._volume_system)

	self._volume_system = nil
	self.nav_tag_volume_handler = nil
	self.nav_tag_volumes_to_create = nil
end

local dummy_table = {}

VolumeSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	fassert(self.is_server, "Volume Extensions are only allowed on server!")
	EngineOptimizedExtensions.volume_on_add_extension(self._volume_system, unit, extension_name)
	ScriptUnit.set_extension(unit, self.name, dummy_table)

	return dummy_table
end

VolumeSystem.on_remove_extension = function (self, unit, extension_name)
	self:_cleanup_extension(unit, extension_name)
end

VolumeSystem.on_freeze_extension = function (self, unit, extension_name)
	self:_cleanup_extension(unit, extension_name)
end

VolumeSystem.freeze = function (self, unit, extension_name, reason)
	self:_cleanup_extension(unit, extension_name)
end

VolumeSystem.unfreeze = function (self, unit, extension_name)
	EngineOptimizedExtensions.volume_on_add_extension(self._volume_system, unit, extension_name)
	ScriptUnit.set_extension(unit, self.name, dummy_table)
end

VolumeSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = ScriptUnit.has_extension(unit, "volume_system")

	if extension == nil then
		return
	end

	EngineOptimizedExtensions.volume_on_remove_extension(self._volume_system, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.name)
end

VolumeSystem.update = function (self, context, t)
	EngineOptimizedExtensions.volume_update(self._volume_system, t, context.dt)
end

VolumeSystem.register_volume = function (self, volume_name, volume_type, params)
	local level = LevelHelper:current_level(self.world)

	fassert(Level.has_volume(level, volume_name), "No volume named %q exists in current level", volume_name)

	local sub_type = params.sub_type

	for _, extension_name in ipairs(extensions) do
		local settings = VolumeExtensionSettings[volume_type][sub_type][extension_name]

		if settings then
			local volume = {
				volume_name = volume_name,
				volume_type = volume_type,
				level = level,
				params = params,
				settings = settings,
				inverted = params.invert_volume
			}
			local on_enter, on_exit = nil

			if GenericVolumeTemplates.functions and GenericVolumeTemplates.functions[volume.volume_type] and GenericVolumeTemplates.functions[volume.volume_type][volume.params.sub_type] then
				on_enter = GenericVolumeTemplates.functions[volume.volume_type][volume.params.sub_type].on_enter
				on_exit = GenericVolumeTemplates.functions[volume.volume_type][volume.params.sub_type].on_exit
			end

			local filter = settings.filter

			EngineOptimizedExtensions.volume_register_volume(self._volume_system, level, volume_name, extension_name, params.invert_volume, volume, on_enter, on_exit, filter)
		end
	end

	if not LEVEL_EDITOR_TEST then
		local layer_costs = VolumeSystemSettings.nav_tag_layer_costs
		layer_costs = layer_costs[volume_type] and layer_costs[volume_type][sub_type]

		if layer_costs then
			local layer_name = volume_type .. "_" .. sub_type

			if self.nav_tag_volume_handler then
				self:create_nav_tag_volume(volume_name, layer_name, layer_costs)
			else
				local nav_tag_volumes_to_create = self.nav_tag_volumes_to_create
				nav_tag_volumes_to_create[#nav_tag_volumes_to_create + 1] = {
					volume_name = volume_name,
					layer_name = layer_name,
					layer_costs = layer_costs
				}
			end
		end
	end
end

VolumeSystem.unregister_volume = function (self, volume_name)
	local level = LevelHelper:current_level(self.world)

	fassert(Level.has_volume(level, volume_name), "No volume named %q exists in current level", volume_name)

	for _, extension_name in ipairs(extensions) do
		EngineOptimizedExtensions.volume_unregister_volume(self._volume_system, level, volume_name, extension_name)
	end
end

VolumeSystem.ai_ready = function (self)
	self.nav_tag_volume_handler = Managers.state.conflict.nav_tag_volume_handler
	local nav_tag_volumes_to_create = self.nav_tag_volumes_to_create

	for i = 1, #nav_tag_volumes_to_create, 1 do
		local volume_data = nav_tag_volumes_to_create[i]

		self:create_nav_tag_volume(volume_data.volume_name, volume_data.layer_name, volume_data.layer_costs)
	end

	self.nav_tag_volumes_to_create = nil
end

VolumeSystem.create_nav_tag_volume_from_data = function (self, pos, size, layer_name)
	local level_settings = LevelHelper:current_level_settings()

	if level_settings.no_bots_allowed then
		return
	end

	local nav_tag_volume_handler = self.nav_tag_volume_handler
	local volume_name = nav_tag_volume_handler:create_mapping(pos, size, layer_name)

	nav_tag_volume_handler:create_tag_volume_from_mappings(volume_name)

	return volume_name
end

VolumeSystem.get_volume_mapping_from_lookup_id = function (self, lookup_id)
	local nav_tag_volume_handler = self.nav_tag_volume_handler

	return self.nav_tag_volume_handler:get_mapping_from_lookup_id(lookup_id)
end

VolumeSystem.destroy_nav_tag_volume = function (self, volume_name)
	local nav_tag_volume_handler = self.nav_tag_volume_handler

	nav_tag_volume_handler:destroy_nav_tag_volume(volume_name)
end

VolumeSystem.create_nav_tag_volume = function (self, volume_name, layer_name, layer_costs)
	local level_settings = LevelHelper:current_level_settings()

	if level_settings.no_bots_allowed then
		return
	end

	local nav_tag_volume_handler = self.nav_tag_volume_handler

	nav_tag_volume_handler:set_mapping_layer_name(volume_name, layer_name)
	nav_tag_volume_handler:create_tag_volume_from_mappings(volume_name)

	local entity_manager = Managers.state.entity
	local layer_cost_bot = layer_costs.BotVolumeExtension
	local layer_cost_ai = layer_costs.AIVolumeExtension

	if layer_cost_bot then
		NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = layer_cost_bot
		local bot_nav_transition_manager = Managers.state.bot_nav_transition

		bot_nav_transition_manager:set_layer_cost(layer_name, layer_cost_bot)
	end

	if layer_cost_ai then
		NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = layer_cost_ai
		local ai_extensions = entity_manager:get_entities("AINavigationExtension")

		for _, extension in pairs(ai_extensions) do
			extension:set_layer_cost(layer_name, layer_cost_ai)
		end
	end
end

VolumeSystem.volume_has_units_inside = function (self, volume_name)
	return EngineOptimizedExtensions.volume_has_any_units_inside(self._volume_system, volume_name)
end

VolumeSystem.all_alive_human_players_inside = function (self, volume_name)
	local side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_UNITS = side.PLAYER_UNITS
	local to_test_count = 0
	local to_test = {}

	for _, player_unit in ipairs(PLAYER_UNITS) do
		local status_ext = Unit.alive(player_unit) and ScriptUnit.has_extension(player_unit, "status_system")

		if status_ext and not status_ext:is_disabled() then
			to_test_count = to_test_count + 1
			to_test[to_test_count] = player_unit
		end
	end

	if to_test_count ~= 0 then
		return EngineOptimizedExtensions.volume_has_all_units_inside(self._volume_system, volume_name, unpack(to_test))
	end

	return false
end

VolumeSystem.all_alive_or_respawned_human_players_inside = function (self, volume_name)
	local side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_UNITS = side.PLAYER_UNITS
	local to_test_count = 0
	local to_test = {}

	for _, player_unit in ipairs(PLAYER_UNITS) do
		local status_ext = Unit.alive(player_unit) and ScriptUnit.has_extension(player_unit, "status_system")

		if status_ext and (not status_ext:is_disabled() or (status_ext:is_disabled() and not status_ext:is_ready_for_assisted_respawn())) then
			to_test_count = to_test_count + 1
			to_test[to_test_count] = player_unit
		end
	end

	if to_test_count ~= 0 then
		return EngineOptimizedExtensions.volume_has_all_units_inside(self._volume_system, volume_name, unpack(to_test))
	end

	return false
end

VolumeSystem.all_human_players_inside_disabled = function (self, volume_name)
	local human_players = Managers.player:human_players()
	local to_test_count = 0
	local to_test = {}

	for _, player in pairs(human_players) do
		local player_unit = player.player_unit
		local status_ext = Unit.alive(player_unit) and ScriptUnit.has_extension(player_unit, "status_system")

		if status_ext then
			if not status_ext:is_disabled() then
				return false
			end

			to_test_count = to_test_count + 1
			to_test[to_test_count] = player_unit
		end
	end

	if to_test_count ~= 0 then
		return EngineOptimizedExtensions.volume_has_all_units_inside(self._volume_system, volume_name, unpack(to_test))
	end

	return false
end

VolumeSystem.player_inside = function (self, volume_name, unit)
	return EngineOptimizedExtensions.volume_has_all_units_inside(self._volume_system, volume_name, unit)
end

return
