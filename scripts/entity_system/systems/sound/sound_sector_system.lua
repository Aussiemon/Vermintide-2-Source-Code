require("scripts/entity_system/systems/sound/sound_sector_event_templates")

local font_size = 26
local font_size_blackboard = 16
local font = "gw_arial_32"
local font_mtrl = "materials/fonts/" .. font
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
	self._sector_particle_effects = {}
	self._sector_process_index = 0

	for i = 1, NUM_OF_SECTORS, 1 do
		self._sectors[i] = {}
		local sound_source_unit = World.spawn_unit(self.world, "units/testunits/camera")
		self._sector_sound_source_units[i] = sound_source_unit
	end

	self.debug_gui_screen = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
	script_data.sound_sector_system_debug = script_data.sound_sector_system_debug or Development.parameter("sound_sector_system_debug")
end

SoundSectorSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

SoundSectorSystem.on_add_extension = function (self, world, unit, extension_name)
	local extension = {}

	ScriptUnit.set_extension(unit, "sound_sector_system", extension)

	if extension_name == "SoundSectorExtension" then
		self._extensions[unit] = extension

		if self.camera_unit then
			local camera_position = Unit.local_position(self.camera_unit, 0)
			local sector_index = self:calc_unit_sector(camera_position, unit)

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
	extension.target_unit = nil
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
		local sector_index = self:calc_unit_sector(camera_position, unit)

		if sector_index then
			local death_extension = ScriptUnit.extension(unit, "death_system")
			self._sectors[sector_index][unit] = death_extension
		end

		extension.sector_index = sector_index
	end
end

local MIN_NUM_OF_UNITS = 7

SoundSectorSystem.update = function (self, context, t, dt)
	if not self.camera_unit then
		return
	end

	local world = self.world
	local camera_position = Unit.local_position(self.camera_unit, 0)
	local sector_sound_source_ids = self._sector_sound_source_ids

	self:update_sectors(camera_position)

	local entities = self._extensions
	local sector_sound_source_units = self._sector_sound_source_units
	local wwise_world = self.wwise_world
	local Vector3_zero = Vector3.zero
	local Unit_set_local_position = Unit.set_local_position
	local WwiseWorld_set_source_parameter = WwiseWorld.set_source_parameter
	self._sector_process_index = 1
	local sector_index = self._sector_process_index
	local sector = self._sectors[sector_index]

	for _, sound_event_template in pairs(SoundSectorEventTemplates) do
		local should_play, units_center, num_units, particle_value = sound_event_template.evaluate(self._sectors, sector_index, t, self._extensions, camera_position)
		local sector_sound_id = sound_event_template.sound_event_start .. sector_index
		local wwise_source_id = sector_sound_source_ids[sector_sound_id]
		local is_playing_sound = wwise_source_id ~= nil

		if script_data.sound_sector_system_debug and should_play then
			self:debug_draw(units_center, sector_index, camera_position)
		end

		if should_play then
			local sound_source_unit = sector_sound_source_units[sector_index]

			Unit_set_local_position(sound_source_unit, 0, units_center)
			WwiseWorld_set_source_parameter(wwise_world, wwise_source_id, "enemy_count", num_units)

			if not is_playing_sound then
				local particle_effect = sound_event_template.particle_effect
				local particle_value_name = sound_event_template.particle_value_name

				self:play_sector_sound_event(sector_index, sector_sound_id, num_units, units_center, sound_event_template.sound_event_start, particle_effect, particle_value_name, particle_value)
			end
		elseif is_playing_sound then
			self:stop_sector_sound_event(sector_index, sector_sound_id, sound_event_template.sound_event_stop)
		end
	end

	if script_data.sound_sector_system_debug then
		self:debug_draw_hud(camera_position)
	end
end

SoundSectorSystem.update_sectors = function (self, camera_position)
	for unit, extension in pairs(self._extensions) do
		local sector_index = self:calc_unit_sector(camera_position, unit)
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

SoundSectorSystem.play_sector_sound_event = function (self, sector_index, sound_id, num_of_units_in_sector, units_center, sound_event, particle_effect, particle_value_name, particle_value)
	if particle_effect then
		local world = self.world
		local normal_rotation = Quaternion.look(Vector3.forward(), Vector3.up())
		local effect_id = World.create_particles(world, particle_effect, units_center, normal_rotation)

		if particle_value then
			local effect_variable_id = World.find_particles_variable(world, particle_effect, particle_value_name)

			World.set_particles_variable(world, effect_id, effect_variable_id, particle_value)
		end

		self._sector_particle_effects[sound_id] = effect_id
	end

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

SoundSectorSystem.stop_sector_sound_event = function (self, sector_index, sound_id, sound_event)
	local wwise_source_id = self._sector_sound_source_ids[sound_id]

	Managers.state.entity:system("sound_environment_system"):unregister_source_environment_update(wwise_source_id)
	WwiseWorld.trigger_event(self.wwise_world, sound_event, wwise_source_id)

	self._sector_sound_source_ids[sound_id] = nil
	local particle_effect_id = self._sector_particle_effects[sound_id]

	if particle_effect_id then
		World.destroy_particles(self.world, particle_effect_id)
	end
end

local MIN_DISTANCE_THRESHOLD = 25
local MAX_DISTANCE_THRESHOLD = 1600

SoundSectorSystem.calc_unit_sector = function (self, camera_position, unit)
	local unit_position = POSITION_LOOKUP[unit]
	local distance = Vector3.distance_squared(camera_position, unit_position)

	if distance < MIN_DISTANCE_THRESHOLD or MAX_DISTANCE_THRESHOLD < distance then
		return false, false
	end

	return 1
end

SoundSectorSystem.hot_join_sync = function (self, sender)
	return
end

SoundSectorSystem.local_player_created = function (self, player)
	self.camera_unit = player.camera_follow_unit
end

SoundSectorSystem.rpc_enemy_has_target = function (self, sender, unit_id, target_unit_id, target_is_level_unit)
	local unit = self.unit_storage:unit(unit_id)

	if unit == nil then
		return
	end

	local target_unit = nil

	if target_is_level_unit then
		target_unit = LevelHelper:unit_by_index(self.world, target_unit_id)
	else
		target_unit = self.unit_storage:unit(target_unit_id)
	end

	local sound_sector_extension = ScriptUnit.has_extension(unit, "sound_sector_system")

	if sound_sector_extension and target_unit then
		sound_sector_extension.has_target = true
		sound_sector_extension.target_unit = target_unit
	end
end

SoundSectorSystem.debug_draw_hud = function (self, camera_position)
	local debug_center = Vector3(200, 200, 2)
	local camera_rotation = Unit.local_rotation(self.camera_unit, 0)
	local camera_fwd_vec = Quaternion.forward(camera_rotation)

	Gui.rect(self.debug_gui_screen, debug_center - Vector3(150, 150, 1), Vector2(300, 300), Color(100, 100, 100, 100))
	Gui.rect(self.debug_gui_screen, debug_center, Vector2(10, 10), Color(100, 100, 255, 100))
	ScriptGUI.hud_line(self.debug_gui_screen, debug_center, debug_center + Vector3.flat(camera_fwd_vec) * 150, 3, 2, Color(255, 0, 255, 0))
	ScriptGUI.hud_line(self.debug_gui_screen, debug_center, debug_center + Vector3(150, 0, 0), 3, 2, Color(255, 0, 100, 0))
	ScriptGUI.hud_line(self.debug_gui_screen, debug_center, debug_center + Vector3(-150, 0, 0), 3, 2, Color(255, 0, 100, 0))
	ScriptGUI.hud_line(self.debug_gui_screen, debug_center, debug_center + Vector3(0, 150, 0), 3, 2, Color(255, 0, 100, 0))
	ScriptGUI.hud_line(self.debug_gui_screen, debug_center, debug_center + Vector3(-0, -150, 0), 3, 2, Color(255, 0, 100, 0))
end

SoundSectorSystem.debug_draw = function (self, sector_center, sector_index, camera_position)
	if sector_center == false then
		return
	end

	local debug_center = Vector3(200, 200, 2)
	local distance = Vector3.distance(camera_position, sector_center)
	local direction_camera_to_center = Vector3.normalize(sector_center - camera_position)
	local debug_pos_center = debug_center + Vector3.flat(direction_camera_to_center * distance * 5)

	Gui.text(self.debug_gui_screen, tostring(sector_index), font_mtrl, font_size + 30, font, debug_pos_center, Color(255, 255, 255, 0))

	for unit, _ in pairs(self._sectors[sector_index]) do
		local pose, radius = Unit.box(unit)
		local unit_center = Matrix4x4.translation(pose)
		local distance = Vector3.distance(camera_position, unit_center)
		local direction_camera_to_unit = Vector3.normalize(unit_center - camera_position)
		local debug_pos = debug_center + Vector3.flat(direction_camera_to_unit * distance * 5)

		Gui.text(self.debug_gui_screen, tostring(sector_index), font_mtrl, font_size, font, debug_pos, Color(255, 255, 0, 0))
	end
end

return
