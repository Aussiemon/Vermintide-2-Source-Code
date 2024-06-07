-- chunkname: @scripts/managers/backend_playfab/backend_interface_talents_playfab.lua

BackendInterfaceTalentsPlayfab = class(BackendInterfaceTalentsPlayfab)

BackendInterfaceTalentsPlayfab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._talents = {}
	self._default_loadouts_talents = {}
	self._career_loadouts_talents = {}
	self._default_talents_overrides = {}
	self._selected_career_custom_talents = {}
	self._bot_talents = {}

	self:_refresh()
end

BackendInterfaceTalentsPlayfab._refresh = function (self)
	if not DEDICATED_SERVER then
		self:_refresh_default_loadouts_talents()
		self:_refresh_career_loadouts_talents()
		self:_setup_default_overrides()
	end

	self:_refresh_talents()

	if not DEDICATED_SERVER then
		self:refresh_bot_talents()
	end
end

BackendInterfaceTalentsPlayfab._refresh_talents = function (self)
	local talents = self._talents
	local backend_mirror = self._backend_mirror

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			local talent_string = backend_mirror:get_character_data(career_name, "talents")

			if talent_string then
				local career_talents = string.split(talent_string, ",")

				for i = 1, #career_talents do
					career_talents[i] = tonumber(career_talents[i])
				end

				self:_validate_talents(career_name, career_talents, settings.talent_tree_index)

				talents[career_name] = career_talents
			end
		end
	end

	self._dirty = false
end

local EMPTY_TABLE = {}

BackendInterfaceTalentsPlayfab.refresh_bot_talents = function (self)
	self._bot_talents = table.clone(self._talents)

	local talents = self._bot_talents
	local backend_mirror = self._backend_mirror
	local loadout_selection = PlayerData.loadout_selection or EMPTY_TABLE
	local bot_equipment = loadout_selection.bot_equipment or EMPTY_TABLE

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			local bot_loadout_index = bot_equipment[career_name]

			if bot_loadout_index then
				local talent_string = backend_mirror:get_character_data(career_name, "talents", bot_loadout_index)

				if talent_string then
					local career_talents = string.split(talent_string, ",")

					for i = 1, #career_talents do
						career_talents[i] = tonumber(career_talents[i])
					end

					self:_validate_talents(career_name, career_talents, settings.talent_tree_index, bot_loadout_index)

					talents[career_name] = career_talents
				end
			end
		end
	end

	print("[BackendInterfaceItemPlayfab] Refreshing bot loadout")
end

BackendInterfaceTalentsPlayfab._refresh_default_loadouts_talents = function (self)
	local talents = self._default_loadouts_talents
	local backend_mirror = self._backend_mirror
	local skip_quipping_talents = true

	table.clear(talents)

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			local career_loadouts = backend_mirror:get_default_loadouts(career_name)

			if career_loadouts then
				talents[career_name] = talents[career_name] or {}

				local career_loadouts_talents = talents[career_name]

				for i = 1, #career_loadouts do
					local career_loadout = career_loadouts[i]
					local talent_string = career_loadout.talents

					if talent_string then
						local career_talents = string.split(talent_string, ",")

						for i = 1, #career_talents do
							career_talents[i] = tonumber(career_talents[i])
						end

						self:_validate_talents(career_name, career_talents, settings.talent_tree_index, skip_quipping_talents)

						career_loadouts_talents[i] = career_talents
					else
						career_loadouts_talents[i] = {
							0,
							0,
							0,
							0,
							0,
							0,
						}
					end
				end
			end
		end
	end

	self._dirty = false
end

BackendInterfaceTalentsPlayfab._refresh_career_loadouts_talents = function (self)
	local talents = self._career_loadouts_talents
	local backend_mirror = self._backend_mirror
	local skip_quipping_talents = true

	table.clear(talents)

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			local selected_career_loadout, career_loadouts = backend_mirror:get_career_loadouts(career_name)

			self._selected_career_custom_talents[career_name] = selected_career_loadout

			if career_loadouts then
				talents[career_name] = talents[career_name] or {}

				local career_loadouts_talents = talents[career_name]

				for i = 1, #career_loadouts do
					local career_loadout = career_loadouts[i]
					local talent_string = career_loadout.talents

					if talent_string then
						local career_talents = string.split(talent_string, ",")

						for i = 1, #career_talents do
							career_talents[i] = tonumber(career_talents[i])
						end

						self:_validate_talents(career_name, career_talents, settings.talent_tree_index, skip_quipping_talents)

						career_loadouts_talents[i] = career_talents
					else
						career_loadouts_talents[i] = {
							0,
							0,
							0,
							0,
							0,
							0,
						}
					end
				end
			end
		end
	end

	self._dirty = false
end

BackendInterfaceTalentsPlayfab._setup_default_overrides = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local loadout_selection = PlayerData.loadout_selection and PlayerData.loadout_selection[mechanism_name]

	table.clear(self._default_talents_overrides)

	if not loadout_selection then
		return
	end

	local game_mode_key = Managers.state.game_mode and Managers.state.game_mode:game_mode_key()

	if not game_mode_key or not InventorySettings.default_loadout_allowed_game_modes[game_mode_key] then
		return
	end

	for career_name, settings in pairs(CareerSettings) do
		local loadout_index = loadout_selection[career_name] or 1

		if loadout_index then
			local loadout_settings = InventorySettings.loadouts[loadout_index]

			if loadout_settings.loadout_type == "default" then
				self:set_default_override(career_name, loadout_index)
			end
		end
	end
end

BackendInterfaceTalentsPlayfab.set_default_override = function (self, career_name, loadout_index)
	local default_career_talents = self._default_loadouts_talents[career_name]

	self._default_talents_overrides[career_name] = default_career_talents and default_career_talents[loadout_index]
end

BackendInterfaceTalentsPlayfab._validate_talents = function (self, career_name, career_talents, talent_tree_index, skip_quipping_talents, optional_loadout_index)
	local profile = PROFILES_BY_CAREER_NAMES[career_name]

	if not profile then
		return
	end

	local profile_name = profile.display_name
	local hero_experience = self._backend_mirror:get_read_only_data(profile_name .. "_experience")
	local hero_level = ExperienceSettings.get_level(hero_experience)
	local override_talents = PlayerUtils.get_talent_overrides_by_career(career_name)
	local talent_trees = TalentTrees[profile_name]
	local talent_tree = talent_trees and talent_trees[talent_tree_index]
	local changed = false

	for i = 1, #career_talents do
		local selected_talent = career_talents[i]

		if selected_talent > 0 then
			if not ProgressionUnlocks.is_unlocked("talent_point_" .. i, hero_level) then
				career_talents[i] = 0
				changed = true
			elseif override_talents and talent_tree then
				local selected_talent_name = talent_tree[i][selected_talent]

				if override_talents[selected_talent_name] == false then
					career_talents[i] = 0
					changed = true
				end
			end
		end
	end

	if changed and not skip_quipping_talents then
		self:set_talents(career_name, career_talents, optional_loadout_index)
	end
end

BackendInterfaceTalentsPlayfab.ready = function (self)
	return true
end

BackendInterfaceTalentsPlayfab.update = function (self, dt)
	return
end

BackendInterfaceTalentsPlayfab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceTalentsPlayfab.get_talent_ids = function (self, career_name, optional_talents, is_bot)
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_tree = talent_tree_index and TalentTrees[profile_name][talent_tree_index]
	local talent_ids = {}
	local game_mode_key = Managers.state.game_mode and Managers.state.game_mode:game_mode_key()
	local bot_loadout_allowed = InventorySettings.bot_loadout_allowed_game_modes[game_mode_key]
	local talents = bot_loadout_allowed and is_bot and self:get_bot_talents(career_name) or optional_talents or self:get_talents(career_name)

	if talents then
		for i = 1, #talents do
			local column = talents[i]

			if column ~= 0 then
				local talent_name = talent_tree[i][column]
				local talent_lookup = TalentIDLookup[talent_name]

				if talent_lookup and talent_lookup.talent_id then
					talent_ids[#talent_ids + 1] = talent_lookup.talent_id
				end
			end
		end
	end

	return talent_ids
end

BackendInterfaceTalentsPlayfab.get_talent_tree = function (self, career_name)
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_tree = talent_tree_index and TalentTrees[profile_name][talent_tree_index]

	return talent_tree
end

BackendInterfaceTalentsPlayfab.set_talents = function (self, career_name, talents, optional_loadout_index)
	local talent_string = ""

	for i = 1, #talents do
		local value = talents[i]

		if i == #talents then
			talent_string = talent_string .. value
		else
			talent_string = talent_string .. value .. ","
		end
	end

	self._backend_mirror:set_character_data(career_name, "talents", talent_string, optional_loadout_index)

	self._dirty = true
end

BackendInterfaceTalentsPlayfab.get_talents = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	local talents = table.clone(self._talents)

	for career_name, career_talents in pairs(self._default_talents_overrides) do
		talents[career_name] = career_talents
	end

	local career_talents = talents[career_name]

	return career_talents
end

BackendInterfaceTalentsPlayfab.get_bot_talents = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	return self._bot_talents[career_name]
end

BackendInterfaceTalentsPlayfab.get_default_talents = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	local default_talents = self._default_loadouts_talents[career_name]

	return default_talents
end

BackendInterfaceTalentsPlayfab.get_career_talents = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	local career_talents = self._career_loadouts_talents[career_name]

	return career_talents
end

BackendInterfaceTalentsPlayfab.get_career_talent_ids = function (self, career_name, loadout_index)
	local career_settings = CareerSettings[career_name]
	local profile_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index
	local talent_tree = talent_tree_index and TalentTrees[profile_name][talent_tree_index]
	local talent_ids = {}
	local talents = self:get_career_talents(career_name)
	local loadout_talents = talents[loadout_index]

	if loadout_talents then
		for i = 1, #loadout_talents do
			local column = loadout_talents[i]

			if column ~= 0 then
				local talent_name = talent_tree[i][column]
				local talent_lookup = TalentIDLookup[talent_name]

				if talent_lookup and talent_lookup.talent_id then
					talent_ids[#talent_ids + 1] = talent_lookup.talent_id
				end
			end
		end
	end

	return talent_ids
end
