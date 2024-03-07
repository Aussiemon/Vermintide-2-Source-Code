-- chunkname: @scripts/entity_system/systems/darkness/darkness_system.lua

require("scripts/settings/level_settings")

DarknessSystem = class(DarknessSystem, ExtensionSystemBase)

local extensions = {
	"LightSourceExtension",
	"PlayerUnitDarknessExtension",
	"ShadowFlareExtension",
}
local RPCS = {
	"rpc_shadow_flare_done",
}

DarknessSystem.DARKNESS_THRESHOLD = 0.025
DarknessSystem.TOTAL_DARKNESS_TRESHOLD = 0.0125

DarknessSystem.init = function (self, entity_system_creation_context, system_name)
	DarknessSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._light_source_data = {}
	self._player_unit_darkness_data = {}
	self._screen_fx_name = "fx/screenspace_darkness_flash"

	local level_settings = LevelHelper:current_level_settings()
	local darkness_settings = level_settings.darkness_settings

	if darkness_settings then
		local volumes = darkness_settings.volumes

		fassert(volumes, "Missing volumes table in darkness settings.")

		self._darkness_volumes = volumes
		self._num_volumes = #volumes

		local player_light_intensity = darkness_settings.player_light_intensity

		if player_light_intensity then
			self:set_player_light_intensity(player_light_intensity)
		end

		if darkness_settings.disable_screen_fx then
			self._screen_fx_name = nil
		end
	else
		self._num_volumes = 0
	end

	self._in_darkness = false
	self._global_darkness = false
	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))
end

DarknessSystem.set_global_darkness = function (self, set)
	self._global_darkness = set
end

DarknessSystem.set_player_light_intensity = function (self, intensity)
	self._player_light_intensity = intensity
end

DarknessSystem.set_level = function (self, level)
	self._level = level
end

DarknessSystem.destroy = function (self)
	self._environment_handler = nil

	self._network_event_delegate:unregister(self)
end

DarknessSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	if extension_name == "ShadowFlareExtension" then
		return DarknessSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	end

	local script_data_intensity = Unit.get_data(unit, "light_intensity")
	local extension = {
		intensity = extension_init_data and extension_init_data.intensity or script_data_intensity or 1,
	}

	ScriptUnit.set_extension(unit, self.name, extension)

	if extension_name == "LightSourceExtension" then
		self._light_source_data[unit] = extension
		POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
	elseif extension_name == "PlayerUnitDarknessExtension" then
		self._player_unit_darkness_data[unit] = extension
	end

	return extension
end

DarknessSystem.on_remove_extension = function (self, unit, extension_name)
	DarknessSystem.super.on_remove_extension(self, unit, extension_name)

	if extension_name == "LightSourceExtension" then
		self._light_source_data[unit] = nil
		POSITION_LOOKUP[unit] = nil
	elseif extension_name == "PlayerUnitDarknessExtension" then
		self._player_unit_darkness_data[unit] = nil
	end
end

DarknessSystem.update = function (self, context, t)
	local dt = context.dt

	if self._darkness_volumes or self._global_darkness then
		self:_update_light_sources(dt, t)
		self:_update_player_unit_darkness(dt, t)
		self:_update_darkness_fx(dt, t)
	end

	self:_update_shadow_flare_extensions(dt, t)
end

DarknessSystem._update_light_sources = function (self, dt, t)
	return
end

local IN

LIGHT_LIGHT_VALUE = 0.05

local IN_TWILIGHT_LIGHT_VALUE = 0.015
local TWILIGHT_MAX_INTENSITY = 0.15

local function LIGHT_TO_DARKNESS_INTENSITY_CONVERSION_FUNCTION(light_value)
	local darkness = (1 - light_value / IN_TWILIGHT_LIGHT_VALUE)^2

	return darkness / 15
end

DarknessSystem._update_player_unit_darkness = function (self, dt, t)
	for unit, data in pairs(self._player_unit_darkness_data) do
		local unit_position = POSITION_LOOKUP[unit] or Unit.world_position(unit, 0)
		local pos = unit_position + Vector3(0, 0, 1)
		local in_darkness = self:is_in_darkness_volume(pos)
		local light_value

		if in_darkness then
			local side = Managers.state.side.side_by_unit[unit]

			if side then
				light_value = self:calculate_light_value(pos, side.PLAYER_UNITS)

				if light_value > LIGHT_LIGHT_VALUE then
					data.intensity = 0
					data.in_darkness = false
				elseif light_value > IN_TWILIGHT_LIGHT_VALUE then
					data.intensity = math.auto_lerp(LIGHT_LIGHT_VALUE, IN_TWILIGHT_LIGHT_VALUE, 0, TWILIGHT_MAX_INTENSITY, light_value)
					data.in_darkness = true
				else
					data.intensity = math.min(math.max(data.intensity, TWILIGHT_MAX_INTENSITY) + dt * LIGHT_TO_DARKNESS_INTENSITY_CONVERSION_FUNCTION(light_value), 1)
					data.in_darkness = true
				end
			end
		else
			data.in_darkness = false
			data.intensity = 0
		end
	end
end

local SOURCE_ID = 0

DarknessSystem._update_darkness_fx = function (self, dt, t)
	local player_manager = Managers.player
	local player = player_manager:local_player(1)

	if player then
		local world = self.world
		local unit = player:observed_unit()

		if not ALIVE[unit] then
			unit = player.player_unit
		end

		local data = self._player_unit_darkness_data[unit]
		local in_darkness = data and data.in_darkness
		local intensity = data and data.intensity or 0
		local wwise_world = Managers.world:wwise_world(world)

		if not in_darkness and self._in_darkness then
			WwiseWorld.trigger_event(wwise_world, "Stop_music_darkness_will_take_you", SOURCE_ID)

			self._in_darkness = false

			WwiseWorld.set_source_parameter(wwise_world, SOURCE_ID, "darkness_intensity", 0)

			local id = self._screen_fx_id

			if id then
				World.destroy_particles(world, id)
			end
		elseif in_darkness and not self._in_darkness then
			WwiseWorld.trigger_event(wwise_world, "Play_music_darkness_will_take_you", SOURCE_ID)

			self._in_darkness = true

			WwiseWorld.set_source_parameter(wwise_world, SOURCE_ID, "darkness_intensity", intensity * 100)

			local fx = self._screen_fx_name

			if fx then
				local id = World.create_particles(world, fx, Vector3.zero())
				local material_name = "overlay"
				local variable_name = "intensity"

				World.set_particles_material_scalar(world, id, material_name, variable_name, intensity)

				self._screen_fx_id = id
			end
		elseif in_darkness then
			WwiseWorld.set_source_parameter(wwise_world, SOURCE_ID, "darkness_intensity", intensity * 100)

			local id = self._screen_fx_id

			if id then
				local material_name = "overlay"
				local variable_name = "intensity"

				World.set_particles_material_scalar(world, id, material_name, variable_name, intensity)
			end
		end
	end
end

DarknessSystem.is_in_darkness_volume = function (self, position)
	if self._global_darkness then
		return true
	end

	local volumes = self._darkness_volumes

	if volumes then
		local is_inside_func = Level.is_point_inside_volume
		local level = self._level

		for i = 1, self._num_volumes do
			local vol_name = volumes[i]

			if is_inside_func(level, vol_name, position) then
				return true
			end
		end
	end

	return false
end

DarknessSystem.calculate_light_value = function (self, position, player_units)
	local light_value = 0

	for unit, data in pairs(self._light_source_data) do
		local pos = POSITION_LOOKUP[unit]
		local dist_sq = math.max(Vector3.distance_squared(position, pos), 1)
		local intensity = data.intensity

		light_value = light_value + intensity * (1 / dist_sq)
	end

	local player_light_intensity = self._player_light_intensity

	if self._player_light_intensity then
		local closest_distance_sq = math.huge

		for i = 1, #player_units do
			local player_unit = player_units[i]
			local player_position = POSITION_LOOKUP[player_unit]
			local distance_sq = math.max(Vector3.distance_squared(player_position, position), 1)

			if distance_sq < closest_distance_sq then
				closest_distance_sq = distance_sq
			end
		end

		light_value = light_value + player_light_intensity * (1 / closest_distance_sq)
	end

	return light_value
end

DarknessSystem.is_in_darkness = function (self, position, darkness_treshold)
	if not self:is_in_darkness_volume(position) then
		return false
	end

	local side = Managers.state.side:get_side_from_name("heroes")
	local light_value = self:calculate_light_value(position, side.PLAYER_UNITS)

	return light_value < (darkness_treshold or DarknessSystem.DARKNESS_THRESHOLD)
end

DarknessSystem._update_shadow_flare_extensions = function (self, dt, t)
	local units = Managers.state.entity:get_entities("ShadowFlareExtension")

	for unit, extension in pairs(units) do
		extension:update(unit, dt)
	end
end

DarknessSystem.remove_mutator_torches = function (self)
	local local_player_unit = Managers.player:local_player().player_unit
	local source_units = self._light_source_data

	if Managers.player.is_server then
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:disable_teleporting_pickups()

		for unit, _ in pairs(source_units) do
			local pickup_extension = ScriptUnit.has_extension(unit, "pickup_system")

			if pickup_extension and pickup_extension.pickup_name == "mutator_torch" then
				Managers.state.unit_spawner:mark_for_deletion(unit)
			end
		end
	end

	if Unit.alive(local_player_unit) then
		local inventory_extension = ScriptUnit.has_extension(local_player_unit, "inventory_system")

		if inventory_extension then
			local weapon_slot = inventory_extension:get_wielded_slot_name()
			local weapon_data = inventory_extension:get_slot_data(weapon_slot)

			if weapon_data then
				local item_data = weapon_data.item_data
				local item_name = item_data and item_data.name

				if item_name == "mutator_torch" then
					CharacterStateHelper.stop_weapon_actions(inventory_extension, "wield")
					inventory_extension:destroy_slot("slot_level_event", true)
					inventory_extension:wield("slot_melee")
				end
			end
		end
	end
end

DarknessSystem.shadow_flares_on_ground = function (self)
	return Managers.state.entity:get_entities("ShadowFlareExtension")
end

DarknessSystem.rpc_shadow_flare_done = function (self, channel_id, unit_id)
	if self.is_server then
		local network_manager = Managers.state.network
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		network_manager.network_transmit:send_rpc_clients_except("rpc_shadow_flare_done", peer_id, unit_id)
	end

	local rpc_unit = Managers.state.unit_storage:unit(unit_id)
	local script = ScriptUnit.extension(rpc_unit, "darkness_system")

	if script then
		script:set_flare_done()
	end
end
