TalentExtension = class(TalentExtension)

TalentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self._profile_index = extension_init_data.profile_index
	self._talent_buff_ids = {}
	self.talent_weapon_index = 1
end

TalentExtension.extensions_ready = function (self, world, unit)
	local career_extension = ScriptUnit.extension(unit, "career_system")
	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.career_extension = career_extension
	self.inventory_extension = inventory_extension
	local current_hero_index = self._profile_index
	local current_hero = SPProfiles[current_hero_index]
	local hero_affiliation = current_hero.affiliation
	local hero_name = current_hero.display_name
	local career_name = career_extension:career_name()
	self._hero_name = hero_name
	self._hero_affiliation = hero_affiliation
	self._career_name = career_name
	local talent_ids = self:_get_talent_ids()

	self:apply_buffs_from_talents(talent_ids)
	self:update_talent_weapon_index(talent_ids)
end

TalentExtension.game_object_initialized = function (self, unit, unit_go_id)
	if not self.is_server then
		local talent_ids = self:_get_talent_ids()

		self:_send_rpc_sync_talents(talent_ids)
	end
end

TalentExtension.talents_changed = function (self)
	local talent_ids = self:_get_talent_ids()

	self:apply_buffs_from_talents(talent_ids)
	self:update_talent_weapon_index(talent_ids)
	self.inventory_extension:update_career_skill_weapon_slot(self.world, self._unit)

	if not self.is_server and Managers.state.network:game() then
		self:_send_rpc_sync_talents(talent_ids)
	end
end

TalentExtension._send_rpc_sync_talents = function (self, talent_ids)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local unit_go_id = Managers.state.unit_storage:go_id(self._unit)
	local talent_id_1 = talent_ids[1]
	local talent_id_2 = talent_ids[2]
	local talent_id_3 = talent_ids[3]
	local talent_id_4 = talent_ids[4]
	local talent_id_5 = talent_ids[5]
	local talent_id_6 = talent_ids[6]

	network_transmit:send_rpc_server("rpc_sync_talents", unit_go_id, talent_id_1, talent_id_2, talent_id_3, talent_id_4, talent_id_5, talent_id_6 or 0)
end

TalentExtension.apply_buffs_from_talents = function (self, talent_ids)
	local hero_name = self._hero_name
	local buff_extension = self.buff_extension
	local player = self.player

	self:_clear_buffs_from_talents()

	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return
	end

	local talent_buff_ids = self._talent_buff_ids
	local is_server_bot = self.is_server and player.bot_player
	local talents = Talents[hero_name]

	if not talents then
		return
	end

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]
		local talent_data = talents[talent_id]

		if talent_data then
			local buffs = talent_data.buffs
			local buffer = talent_data.buffer

			if ((player.local_player or is_server_bot) and (not buffer or buffer == "client")) or (self.is_server and buffer == "server") or ((self.is_server or player.local_player) and buffer == "both") then
				local num_buffs = (buffs and #buffs) or 0

				if num_buffs > 0 then
					for j = 1, num_buffs, 1 do
						local buff_template = buffs[j]
						local id = buff_extension:add_buff(buff_template)
						talent_buff_ids[#talent_buff_ids + 1] = id
					end
				end
			end
		end
	end
end

TalentExtension.update_talent_weapon_index = function (self, talent_ids)
	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return
	end

	local hero_name = self._hero_name
	local talents = Talents[hero_name]

	if not talents then
		return
	end

	self.talent_weapon_index = 1

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]
		local talent_data = talents[talent_id]

		if talent_data and talent_data.talent_weapon_index then
			self.talent_weapon_index = talent_data.talent_weapon_index
		end
	end
end

TalentExtension.get_talent_weapon_index = function (self)
	return self.talent_weapon_index
end

TalentExtension._clear_buffs_from_talents = function (self)
	local buff_extension = self.buff_extension
	local talent_buff_ids = self._talent_buff_ids
	local num_talent_buff_ids = #talent_buff_ids

	for i = 1, num_talent_buff_ids, 1 do
		local id = talent_buff_ids[i]

		buff_extension:remove_buff(id)
	end

	table.clear(self._talent_buff_ids)
end

TalentExtension.has_talent = function (self, talent_name)
	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return false
	end

	local talent_ids = self:_get_talent_ids()
	local wanted_talent_lookup = TalentIDLookup[talent_name]

	if not wanted_talent_lookup then
		return false
	end

	if wanted_talent_lookup.hero_name ~= self._hero_name then
		return false
	end

	local wanted_talent_id = wanted_talent_lookup.talent_id

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]

		if wanted_talent_id == talent_id then
			return true
		end
	end

	return false
end

TalentExtension._get_talent_ids = function (self)
	local talent_interface = Managers.backend:get_talents_interface()
	local career_name = self._career_name
	local talent_tree = talent_interface:get_talent_tree(career_name)
	local talent_ids = {
		0,
		0,
		0,
		0,
		0,
		0
	}

	if talent_tree then
		local talents = talent_interface:get_talents(career_name)

		if talents then
			for i = 1, #talents, 1 do
				local column = talents[i]

				if column == 0 then
					talent_ids[i] = 0
				else
					local talent_name = talent_tree[i][column]
					talent_ids[i] = (TalentIDLookup[talent_name] and TalentIDLookup[talent_name].talent_id) or 0
				end
			end
		end
	end

	return talent_ids
end

TalentExtension.has_talent_perk = function (self, perk)
	local hero_name = self._hero_name
	local hero_affiliation = self._hero_affiliation

	if hero_affiliation == "tutorial" then
		return
	end

	local talent_ids = self:_get_talent_ids()

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]
		local talent_data = Talents[hero_name][talent_id]

		if talent_data then
			local perks = talent_data.perks

			if perks then
				local num_perks = #perks

				for j = 1, num_perks, 1 do
					if perks[j] == perk then
						return true
					end
				end
			end
		end
	end
end

TalentExtension.get_talent_names = function (self)
	local talent_names = {}
	local talent_interface = Managers.backend:get_talents_interface()
	local talent_tree = talent_interface:get_talent_tree(self._career_name)
	local talents = talent_interface:get_talents(self._career_name)

	if talents then
		for row, column in pairs(talents) do
			if column == 0 or not talent_tree then
				talent_names[#talent_names + 1] = "none"
			else
				local talent_name = talent_tree[row][column]
				talent_names[#talent_names + 1] = talent_name
			end
		end
	end

	return talent_names
end

TalentExtension.destroy = function (self)
	return
end

TalentExtension.initial_talent_synced = function (self)
	return true
end

return
