require("scripts/unit_extensions/generic/generic_volume_extension")
require("scripts/settings/volume_settings")

VolumeSystem = class(VolumeSystem, ExtensionSystemBase)
local extensions = {
	"PlayerVolumeExtension",
	"BotVolumeExtension",
	"AIVolumeExtension",
	"PickupProjectileVolumeExtension"
}
VolumeSystem.init = function (self, context, name)
	VolumeSystem.super.init(self, context, name, extensions)

	self.world = context.world
	self.unit_array = {}
	self.extension_array = {}
	self.unit_index_map = {}
	self.extension_volumes = {}
	self.extension_update_index = {}

	for _, extension_name in pairs(extensions) do
		self.unit_array[extension_name] = {}
		self.extension_array[extension_name] = {}
		self.unit_index_map[extension_name] = {}
		self.extension_update_index[extension_name] = 1
		self.extension_volumes[extension_name] = {}
	end

	self.nav_tag_volume_handler = nil
	self.nav_tag_volumes_to_create = {}

	return 
end
local dummy_input = {}
VolumeSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	assert(self.is_server, "Volume Extensions are only allowed on server!")

	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, "GenericVolumeExtension", self.NAME, extension_init_data)
	local unit_array = self.unit_array[extension_name]
	local extension_array = self.extension_array[extension_name]
	local unit_index_map = self.unit_index_map[extension_name]
	local index_n = #unit_array
	local index = index_n + 1
	unit_array[index] = unit
	extension_array[index] = extension
	unit_index_map[unit] = index

	return extension
end
VolumeSystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
VolumeSystem.on_freeze_extension = function (self, unit, extension_name)
	local unit_index_map = self.unit_index_map[extension_name]
	local index = unit_index_map[unit]

	if index == nil then
		return 
	end

	local unit_array = self.unit_array[extension_name]
	local extension_array = self.extension_array[extension_name]
	local index_n = #extension_array

	if index ~= index_n then
		unit_array[index] = unit_array[index_n]
		extension_array[index] = extension_array[index_n]
		unit_index_map[unit_array[index]] = index
	end

	unit_array[index_n] = nil
	extension_array[index_n] = nil
	unit_index_map[unit] = nil

	return 
end
VolumeSystem.update = function (self, context, t, dt)
	local updates_n = VolumeSystemSettings.updates_per_frame
	local extension_array = self.extension_array

	for extension_name, extensions in pairs(extension_array) do
		local extensions_n = #extensions
		local update_index = self.extension_update_index[extension_name]
		local start_index = (extensions_n < update_index and 1) or update_index
		local end_index = math.min((start_index + updates_n[extension_name]) - 1, extensions_n)

		for i = start_index, end_index, 1 do
			local extension = extensions[i]

			self.update_volumes(self, dt, t, extension_name, extension)
		end

		self.extension_update_index[extension_name] = end_index + 1

		for i = 1, extensions_n, 1 do
			local extension = extensions[i]

			if extension.do_update(extension) then
				extension.update(extension, dt, t, context)
			end
		end
	end

	return 
end
VolumeSystem.destroy = function (self)
	VolumeSystem.super.destroy(self)

	self.unit_array = nil
	self.extension_array = nil
	self.unit_index_map = nil
	self.extension_update_index = nil
	self.extension_volumes = nil
	self.nav_tag_volume_handler = nil
	self.nav_tag_volumes_to_create = nil

	return 
end
VolumeSystem.register_volume = function (self, volume_name, volume_type, params)
	local level = LevelHelper:current_level(self.world)

	fassert(Level.has_volume(level, volume_name), "No volume named %q exists in current level", volume_name)

	local sub_type = params.sub_type

	for extension_name, volumes in pairs(self.extension_volumes) do
		local settings = VolumeExtensionSettings[volume_type][sub_type][extension_name]

		if settings then
			volumes[volume_name] = {
				volume_name = volume_name,
				volume_type = volume_type,
				level = level,
				params = params,
				settings = settings,
				inverted = params.invert_volume
			}
		end
	end

	if not LEVEL_EDITOR_TEST then
		local layer_costs = VolumeSystemSettings.nav_tag_layer_costs
		layer_costs = layer_costs[volume_type] and layer_costs[volume_type][sub_type]

		if layer_costs then
			local layer_name = volume_type .. "_" .. sub_type

			if self.nav_tag_volume_handler then
				self.create_nav_tag_volume(self, volume_name, layer_name, layer_costs)
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

	return 
end
VolumeSystem.ai_ready = function (self)
	self.nav_tag_volume_handler = Managers.state.conflict.nav_tag_volume_handler
	local nav_tag_volumes_to_create = self.nav_tag_volumes_to_create

	for i = 1, #nav_tag_volumes_to_create, 1 do
		local volume_data = nav_tag_volumes_to_create[i]

		self.create_nav_tag_volume(self, volume_data.volume_name, volume_data.layer_name, volume_data.layer_costs)
	end

	self.nav_tag_volumes_to_create = nil

	return 
end
VolumeSystem.create_nav_tag_volume_from_data = function (self, pos, size, layer_name)
	local level_settings = LevelHelper:current_level_settings()

	if level_settings.no_bots_allowed then
		return 
	end

	local nav_tag_volume_handler = self.nav_tag_volume_handler
	local volume_name = nav_tag_volume_handler.create_mapping(nav_tag_volume_handler, pos, size, layer_name)

	nav_tag_volume_handler.create_tag_volume_from_mappings(nav_tag_volume_handler, volume_name)

	return volume_name
end
VolumeSystem.get_volume_mapping_from_lookup_id = function (self, lookup_id)
	local nav_tag_volume_handler = self.nav_tag_volume_handler

	return self.nav_tag_volume_handler:get_mapping_from_lookup_id(lookup_id)
end
VolumeSystem.destroy_nav_tag_volume = function (self, volume_name)
	local nav_tag_volume_handler = self.nav_tag_volume_handler

	nav_tag_volume_handler.destroy_nav_tag_volume(nav_tag_volume_handler, volume_name)

	return 
end
VolumeSystem.create_nav_tag_volume = function (self, volume_name, layer_name, layer_costs)
	local level_settings = LevelHelper:current_level_settings()

	if level_settings.no_bots_allowed then
		return 
	end

	local nav_tag_volume_handler = self.nav_tag_volume_handler

	nav_tag_volume_handler.set_mapping_layer_name(nav_tag_volume_handler, volume_name, layer_name)
	nav_tag_volume_handler.create_tag_volume_from_mappings(nav_tag_volume_handler, volume_name)

	local entity_manager = Managers.state.entity
	local layer_cost_bot = layer_costs.BotVolumeExtension
	local layer_cost_ai = layer_costs.AIVolumeExtension

	if layer_cost_bot then
		NAV_TAG_VOLUME_LAYER_COST_BOTS[layer_name] = layer_cost_bot
		local bot_nav_transition_manager = Managers.state.bot_nav_transition

		bot_nav_transition_manager.set_layer_cost(bot_nav_transition_manager, layer_name, layer_cost_bot)
	end

	if layer_cost_ai then
		NAV_TAG_VOLUME_LAYER_COST_AI[layer_name] = layer_cost_ai
		local ai_extensions = entity_manager.get_entities(entity_manager, "AINavigationExtension")

		for _, extension in pairs(ai_extensions) do
			extension.set_layer_cost(extension, layer_name, layer_cost_ai)
		end
	end

	return 
end
VolumeSystem.unregister_volume = function (self, volume_name)
	local level = LevelHelper:current_level(self.world)

	fassert(Level.has_volume(level, volume_name), "No volume named %q exists in current level", volume_name)

	local extension_array = self.extension_array

	for extension_name, volumes in pairs(self.extension_volumes) do
		local volume = volumes[volume_name]

		if volume then
			local extensions = extension_array[extension_name]

			for i = 1, #extensions, 1 do
				local extension = extensions[i]

				if extension.is_inside_volume(extension, volume_name) then
					extension.on_volume_exit(extension, volume)
				end

				extension.on_volume_unregistered(extension, volume)
			end

			volumes[volume_name] = nil
		end
	end

	return 
end
VolumeSystem.update_volumes = function (self, dt, t, extension_name, extension)
	local unit = extension.unit
	local unit_position = POSITION_LOOKUP[unit]
	local volumes = self.extension_volumes[extension_name]
	local GenericVolumeTemplates = GenericVolumeTemplates

	for volume_name, volume in pairs(volumes) do
		local is_inside_volume = Level.is_point_inside_volume(volume.level, volume_name, unit_position)

		if volume.inverted then
			is_inside_volume = not is_inside_volume
		end

		local volume_filters = volume.settings.filters
		local passed_filters = true

		if volume_filters then
			local filter_functions = GenericVolumeTemplates.filters

			for filter_name, filter_value in pairs(volume_filters) do
				if filter_functions[filter_name](unit, volume_name) ~= filter_value then
					passed_filters = false

					break
				end
			end
		end

		if is_inside_volume and passed_filters then
			if not extension.is_inside_volume(extension, volume_name) then
				extension.on_volume_enter(extension, dt, t, volume)
			end
		elseif extension.is_inside_volume(extension, volume_name) then
			extension.on_volume_exit(extension, volume)
		end
	end

	return 
end
VolumeSystem.volume_has_units_inside = function (self, volume_name)
	local extension_array = self.extension_array
	local extension_volumes = self.extension_volumes

	for extension_name, extensions in pairs(extension_array) do
		if extension_volumes[extension_name][volume_name] then
			for i = 1, #extensions, 1 do
				local extension = extensions[i]

				if extension.is_inside_volume(extension, volume_name) then
					return true
				end
			end
		end
	end

	return 
end
VolumeSystem.all_human_players_inside = function (self, volume_name)
	local extension_array = self.extension_array
	local extension_volumes = self.extension_volumes

	for extension_name, extensions in pairs(extension_array) do
		local volume = extension_volumes[extension_name][volume_name]

		if volume then
			local human_players = Managers.player:human_players()

			for _, player in pairs(human_players) do
				local player_unit = player.player_unit
				local status_ext = Unit.alive(player_unit) and ScriptUnit.has_extension(player_unit, "status_system")

				if status_ext and not status_ext.is_disabled(status_ext) then
					local unit_position = POSITION_LOOKUP[player_unit]
					local is_inside_volume = Level.is_point_inside_volume(volume.level, volume_name, unit_position)

					if not is_inside_volume then
						return false
					end
				end
			end
		end
	end

	return true
end

return 
