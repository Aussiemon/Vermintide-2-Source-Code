TalentExtension = class(TalentExtension)
TalentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self._profile_index = extension_init_data.profile_index
	self._talent_buff_ids = {}

	return 
end
TalentExtension.extensions_ready = function (self, world, unit)
	local career_extension = ScriptUnit.extension(unit, "career_system")
	self.buff_extension = ScriptUnit.extension(unit, "buff_system")
	self.career_extension = career_extension
	local current_hero_index = self._profile_index
	local current_hero = SPProfiles[current_hero_index]
	local hero_name = current_hero.display_name
	local career_name = career_extension.career_name(career_extension)
	self._hero_name = hero_name
	self._career_name = career_name
	local talent_ids = self._get_talent_ids(self)

	self.apply_buffs_from_talents(self, talent_ids)

	return 
end
TalentExtension.game_object_initialized = function (self, unit, unit_go_id)
	if not self.is_server then
		local talent_ids = self._get_talent_ids(self)

		self._send_rpc_sync_talents(self, talent_ids)
	end

	return 
end
TalentExtension.talents_changed = function (self)
	local talent_ids = self._get_talent_ids(self)

	self.apply_buffs_from_talents(self, talent_ids)

	if not self.is_server and Managers.state.network:game() then
		self._send_rpc_sync_talents(self, talent_ids)
	end

	return 
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

	network_transmit.send_rpc_server(network_transmit, "rpc_sync_talents", unit_go_id, talent_id_1, talent_id_2, talent_id_3, talent_id_4, talent_id_5)

	return 
end
local params = {}
TalentExtension.apply_buffs_from_talents = function (self, talent_ids)
	local hero_name = self._hero_name
	local buff_extension = self.buff_extension
	local player = self.player

	self._clear_buffs_from_talents(self)

	local talent_buff_ids = self._talent_buff_ids

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]
		local talent_data = Talents[hero_name][talent_id]

		if talent_data then
			local buffs = talent_data.buffs
			local buffer = talent_data.buffer

			if (player.local_player and (not buffer or buffer == "client")) or (self.is_server and buffer == "server") or ((self.is_server or player.local_player) and buffer == "both") then
				local num_buffs = (buffs and #buffs) or 0

				if 0 < num_buffs then
					for j = 1, num_buffs, 1 do
						local buff_template = buffs[j]
						local id = buff_extension.add_buff(buff_extension, buff_template)
						talent_buff_ids[#talent_buff_ids + 1] = id
					end
				end
			end
		end
	end

	return 
end
TalentExtension._clear_buffs_from_talents = function (self)
	local buff_extension = self.buff_extension
	local talent_buff_ids = self._talent_buff_ids
	local num_talent_buff_ids = #talent_buff_ids

	for i = 1, num_talent_buff_ids, 1 do
		local id = talent_buff_ids[i]

		buff_extension.remove_buff(buff_extension, id)
	end

	table.clear(self._talent_buff_ids)

	return 
end
TalentExtension.has_talent = function (self, talent_name)
	local talent_ids = self._get_talent_ids(self)
	local wanted_talent_id = TalentIDLookup[talent_name]

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]

		if wanted_talent_id == talent_id then
			return true
		end
	end

	return false
end
local talent_ids = {}
TalentExtension._get_talent_ids = function (self)
	local talent_interface = Managers.backend:get_interface("talents")
	local career_name = self._career_name
	local talents = talent_interface.get_talents(talent_interface, career_name)
	local career_settings = self.career_extension:career_settings()
	local talent_tree_index = career_settings.talent_tree_index

	table.clear(talent_ids)

	if talent_tree_index then
		local talent_tree = TalentTrees[self._hero_name][talent_tree_index]

		for i = 1, #talents, 1 do
			local column = talents[i]

			if column == 0 then
				talent_ids[i] = 0
			else
				local talent_name = talent_tree[i][column]
				talent_ids[i] = TalentIDLookup[talent_name] or 0
			end
		end

		return talent_ids
	end

	return talent_ids
end
TalentExtension.get_talent_names = function (self)
	local talent_ids = self._get_talent_ids(self)
	local talent_names = {}
	local career_index = self.career_extension:career_index()
	local talent_trees = TalentTrees[self._hero_name]
	local talent_tree = talent_trees and talent_trees[career_index]

	for row, column in pairs(talent_ids) do
		if column == 0 or not talent_tree then
			talent_names[#talent_names + 1] = "none"
		else
			talent_names[#talent_names + 1] = talent_tree[row][column]
		end
	end

	return talent_names
end
TalentExtension.destroy = function (self)
	return 
end

return 
