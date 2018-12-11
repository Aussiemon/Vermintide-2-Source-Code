require("scripts/entity_system/systems/sound/sound_sector_event_templates")

local NUM_OF_SECTORS = 1
local RPCS = {
	"rpc_enemy_has_target"
}
SoundSectorSystem = class(SoundSectorSystem, ExtensionSystemBase)
SoundSectorSystem.system_extensions = {
	"SoundSectorExtension"
}

SoundSectorSystem.init = function (self, context, system_name)
	self.unit_storage = context.unit_storage
	local extensions = SoundSectorSystem.system_extensions
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.world = context.world
	self.wwise_world = Managers.world:wwise_world(self.world)
	local network_event_delegate = context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._extensions = {}
	self._frozen_extensions = {}
	self._sectors = {}
	self._sector_sound_source_ids = {}
	self._sector_sound_source_units = {}
	self._sector_process_index = 0

	for i = 1, NUM_OF_SECTORS, 1 do
		self._sectors[i] = {}
		local sound_source_unit = World.spawn_unit(self.world, "units/testunits/camera")
		self._sector_sound_source_units[i] = sound_source_unit
	end

	self._events = {
		ai_unit_deactivated = "event_ai_unit_deactivated",
		ai_unit_activated = "event_ai_unit_activated"
	}
	local event_manager = Managers.state.event

	for event_name, cb_name in pairs(self._events) do
		event_manager:register(self, event_name, cb_name)
	end
end

SoundSectorSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	local event_manager = Managers.state.event

	for event_name, _ in pairs(self._events) do
		event_manager:unregister(event_name, self)
	end
end

SoundSectorSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {}

	ScriptUnit.set_extension(unit, "sound_sector_system", extension)

	if extension_name == "SoundSectorExtension" then
		self._extensions[unit] = extension

		if self.camera_unit then
			local camera_position = Unit.local_position(self.camera_unit, 0)
			local sector_index = self:_calc_unit_sector(camera_position, unit)

			if sector_index then
				self._sectors[sector_index][unit] = unit
			end

			extension.sector_index = sector_index
		end
	end

	return extension
end

SoundSectorSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "SoundSectorExtension" then
		local extension = self._extensions[unit]
		local sector_index = extension.sector_index

		if sector_index then
			local death_extension = ScriptUnit.extension(unit, "death_system")
			self._sectors[sector_index][unit] = death_extension
		end
	end
end

SoundSectorSystem.on_remove_extension = function (self, unit, extension_name)
	self._frozen_extensions[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

SoundSectorSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self._extensions[unit]

	fassert(extension, "Unit was already frozen.")

	self._frozen_extensions[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

SoundSectorSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self._extensions[unit]

	if extension == nil then
		return
	end

	local unit_sector_index = extension.sector_index

	if unit_sector_index then
		self._sectors[unit_sector_index][unit] = nil
	end

	extension.has_target = nil
	self._extensions[unit] = nil
end

SoundSectorSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self._frozen_extensions

	if frozen_extensions[unit] then
		return
	end

	local extension = self._extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self._extensions[unit] = nil
	frozen_extensions[unit] = extension
end

SoundSectorSystem.unfreeze = function (self, unit)
	local extension = self._frozen_extensions[unit]
	self._frozen_extensions[unit] = nil
	self._extensions[unit] = extension

	if self.camera_unit then
		local camera_position = Unit.local_position(self.camera_unit, 0)
		local sector_index = self:_calc_unit_sector(camera_position, unit)

		if sector_index then
			local death_extension = ScriptUnit.extension(unit, "death_system")
			self._sectors[sector_index][unit] = death_extension
		end

		extension.sector_index = sector_index
	end
end

SoundSectorSystem.update = function (self, context, t, dt)
	if not self.camera_unit then
		return
	end

	local camera_position = Unit.local_position(self.camera_unit, 0)
	local sector_sound_source_ids = self._sector_sound_source_ids

	self:_update_sectors(camera_position)

	local sector_sound_source_units = self._sector_sound_source_units
	local wwise_world = self.wwise_world
	local Unit_set_local_position = Unit.set_local_position
	local WwiseWorld_set_source_parameter = WwiseWorld.set_source_parameter
	self._sector_process_index = 1
	local sector_index = self._sector_process_index

	for _, sound_event_template in pairs(SoundSectorEventTemplates) do
		local should_play, units_center, num_units = sound_event_template.evaluate(self._sectors, sector_index, t, self._extensions, camera_position)
		local sector_sound_id = sound_event_template.sound_event_start .. sector_index
		local wwise_source_id = sector_sound_source_ids[sector_sound_id]
		local is_playing_sound = wwise_source_id ~= nil

		if should_play then
			local sound_source_unit = sector_sound_source_units[sector_index]

			Unit_set_local_position(sound_source_unit, 0, units_center)
			WwiseWorld_set_source_parameter(wwise_world, wwise_source_id, "enemy_count", num_units)

			if not is_playing_sound then
				self:_play_sector_sound_event(sector_index, sector_sound_id, num_units, units_center, sound_event_template.sound_event_start)
			end
		elseif is_playing_sound then
			self:_stop_sector_sound_event(sector_index, sector_sound_id, sound_event_template.sound_event_stop)
		end
	end
end

SoundSectorSystem._update_sectors = function (self, camera_position)
	for unit, extension in pairs(self._extensions) do
		local sector_index = self:_calc_unit_sector(camera_position, unit)
		local unit_sector_index = extension.sector_index

		if unit_sector_index ~= sector_index then
			if unit_sector_index then
				self._sectors[unit_sector_index][unit] = nil
			end

			if sector_index then
				local death_extension = ScriptUnit.extension(unit, "death_system")
				self._sectors[sector_index][unit] = death_extension
			end

			extension.sector_index = sector_index
		end
	end
end

SoundSectorSystem._play_sector_sound_event = function (self, sector_index, sound_id, num_of_units_in_sector, units_center, sound_event)
	local level_settings = LevelHelper:current_level_settings()
	local terrain = level_settings.terrain or "city"
	local sound_source_unit = self._sector_sound_source_units[sector_index]
	local wwise_source_id, wwise_world = WwiseUtils.make_unit_auto_source(self.world, sound_source_unit)

	WwiseWorld.set_switch(self.wwise_world, "area", terrain, wwise_source_id)

	local wwise_playing_id = WwiseWorld.trigger_event(wwise_world, sound_event, wwise_source_id)

	Managers.state.entity:system("sound_environment_system"):register_source_environment_update(wwise_source_id, sound_source_unit)

	self._sector_sound_source_ids[sound_id] = wwise_source_id
	self.current_audio_event = sound_event
end

SoundSectorSystem._stop_sector_sound_event = function (self, sector_index, sound_id, sound_event)
	local wwise_source_id = self._sector_sound_source_ids[sound_id]

	Managers.state.entity:system("sound_environment_system"):unregister_source_environment_update(wwise_source_id)
	WwiseWorld.trigger_event(self.wwise_world, sound_event, wwise_source_id)

	self._sector_sound_source_ids[sound_id] = nil
end

local MIN_DISTANCE_THRESHOLD_SQ = 25
local MAX_DISTANCE_THRESHOLD_SQ = 1600

SoundSectorSystem._calc_unit_sector = function (self, camera_position, unit)
	local unit_position = POSITION_LOOKUP[unit]
	local distance = Vector3.distance_squared(camera_position, unit_position)

	if distance < MIN_DISTANCE_THRESHOLD_SQ or MAX_DISTANCE_THRESHOLD_SQ < distance then
		return false
	else
		return 1
	end
end

SoundSectorSystem.hot_join_sync = function (self, sender)
	local extensions = self._extensions
	local network_transmit = Managers.state.network.network_transmit

	for unit, extension in pairs(extensions) do
		if extension.has_target then
			local go_id = self.unit_storage:go_id(unit)

			network_transmit:send_rpc("rpc_enemy_has_target", sender, go_id, true)
		end
	end
end

SoundSectorSystem.local_player_created = function (self, player)
	self.camera_unit = player.camera_follow_unit
end

SoundSectorSystem.event_ai_unit_activated = function (self, unit, breed_name, event_spawned)
	local go_id = self.unit_storage:go_id(unit)
	local sound_sector_extension = self._extensions[unit]

	if sound_sector_extension then
		sound_sector_extension.has_target = true

		Managers.state.network.network_transmit:send_rpc_clients("rpc_enemy_has_target", go_id, true)
	end
end

SoundSectorSystem.event_ai_unit_deactivated = function (self, unit, breed_name)
	local go_id = self.unit_storage:go_id(unit)
	local sound_sector_extension = self._extensions[unit]

	if sound_sector_extension then
		sound_sector_extension.has_target = false

		Managers.state.network.network_transmit:send_rpc_clients("rpc_enemy_has_target", go_id, false)
	end
end

SoundSectorSystem.rpc_enemy_has_target = function (self, sender, unit_id, has_target)
	local unit = self.unit_storage:unit(unit_id)

	if unit == nil then
		return
	end

	local sound_sector_extension = self._extensions[unit]
	sound_sector_extension.has_target = has_target
end

return
