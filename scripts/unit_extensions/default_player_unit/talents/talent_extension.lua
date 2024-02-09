﻿-- chunkname: @scripts/unit_extensions/default_player_unit/talents/talent_extension.lua

TalentExtension = class(TalentExtension)

TalentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	self._profile_index = extension_init_data.profile_index
	self._talent_buff_ids = {}
	self.talent_career_skill_index = 1
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

	local talent_ids = self:get_talent_ids()

	self:_check_talent_package_dendencies(talent_ids, true)
	self:apply_buffs_from_talents(talent_ids)
	self:update_talent_weapon_index(talent_ids)
	self:_broadcast_talents_changed()
end

TalentExtension.game_object_initialized = function (self, unit, unit_go_id)
	local talent_ids = self:get_talent_ids()

	self:_send_rpc_sync_talents(talent_ids)
end

TalentExtension.talents_changed = function (self)
	local talent_ids = self:get_talent_ids()

	self:_check_talent_package_dendencies(talent_ids)
	self:apply_buffs_from_talents(talent_ids)
	self:update_talent_weapon_index(talent_ids)
	self.inventory_extension:update_career_skill_weapon_slot_safe()

	if self._needs_loadout_resync then
		self._needs_loadout_resync = false

		local peer_id = self.player:network_id()
		local local_player_id = self.player:local_player_id()

		Managers.state.network.profile_synchronizer:resync_loadout(peer_id, local_player_id)
	end

	if Managers.state.network:game() then
		self:_send_rpc_sync_talents(talent_ids)
	end

	self:_broadcast_talents_changed(false)
end

TalentExtension._send_rpc_sync_talents = function (self, talent_ids)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local unit_go_id = Managers.state.unit_storage:go_id(self._unit)

	printf("TalentExtension:_send_rpc_sync_talents %d", unit_go_id)

	if self.is_server then
		network_transmit:send_rpc_clients("rpc_sync_talents", unit_go_id, talent_ids)
	else
		network_transmit:send_rpc_server("rpc_sync_talents", unit_go_id, talent_ids)
	end
end

TalentExtension.apply_buffs_from_talents = function (self, talent_ids)
	local hero_name = self._hero_name
	local buff_extension = self.buff_extension
	local player = self.player
	local talent_buff_ids = self._talent_buff_ids
	local sub_buffs_per_talent = {}

	for i = 1, #talent_buff_ids do
		local id = talent_buff_ids[i]
		local buff = buff_extension:get_buff_by_id(id)

		if buff and buff.template.restore_sub_buffs then
			local num_sub_buffs = buff_extension:num_sub_buffs(id)

			if num_sub_buffs > 0 then
				sub_buffs_per_talent[buff.buff_type] = {
					num_buffs = num_sub_buffs,
					buff_name = buff.template.buff_to_add,
				}
			end
		end
	end

	self:_clear_buffs_from_talents()

	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return
	end

	local is_server_bot = self.is_server and player.bot_player

	for i = 1, #talent_ids do
		local talent_id = talent_ids[i]
		local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)

		if talent_data then
			local buffs = talent_data.buffs
			local buffer = talent_data.buffer

			if not (not player.local_player and not is_server_bot) and (not buffer or buffer == "client") or self.is_server and buffer == "server" or not (not self.is_server and not player.local_player) and buffer == "both" or buffer == "all" then
				local num_buffs = buffs and #buffs or 0

				if num_buffs > 0 then
					for j = 1, num_buffs do
						local buff_template = buffs[j]
						local id = buff_extension:add_buff(buff_template)
						local sub_buffs = sub_buffs_per_talent[buff_template]

						if sub_buffs then
							for k = 1, sub_buffs.num_buffs do
								buff_extension:add_buff(sub_buffs.buff_name, {
									attacker_unit = player.player_unit,
								})
							end
						end

						talent_buff_ids[#talent_buff_ids + 1] = id
					end
				end
			end

			if player.local_player or is_server_bot then
				local client_buffs = talent_data.client_buffs

				if client_buffs then
					for j = 1, #client_buffs do
						local buff_template = client_buffs[j]
						local id = buff_extension:add_buff(buff_template)

						talent_buff_ids[#talent_buff_ids + 1] = id
					end
				end
			end

			if self.is_server then
				local server_buffs = talent_data.server_buffs

				if server_buffs then
					for j = 1, #server_buffs do
						local buff_template = server_buffs[j]
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

	self.talent_career_skill_index = 1
	self.talent_career_weapon_index = nil

	for i = 1, #talent_ids do
		local talent_id = talent_ids[i]
		local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)

		if talent_data then
			if talent_data.talent_career_skill_index then
				self.talent_career_skill_index = talent_data.talent_career_skill_index
			end

			if talent_data.talent_career_weapon_index then
				self.talent_career_weapon_index = talent_data.talent_career_weapon_index
			end
		end
	end
end

TalentExtension.get_talent_career_skill_index = function (self)
	return self.talent_career_skill_index
end

TalentExtension.get_talent_career_weapon_index = function (self)
	return self.talent_career_weapon_index
end

TalentExtension._clear_buffs_from_talents = function (self)
	local buff_extension = self.buff_extension
	local talent_buff_ids = self._talent_buff_ids
	local num_talent_buff_ids = #talent_buff_ids

	for i = 1, num_talent_buff_ids do
		local id = talent_buff_ids[i]

		buff_extension:remove_buff(id)
	end

	table.clear(self._talent_buff_ids)
end

TalentExtension.has_talent = function (self, talent_name)
	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return false
	end

	local talent_ids = self:get_talent_ids()
	local wanted_talent_lookup = TalentIDLookup[talent_name]

	if not wanted_talent_lookup then
		return false
	end

	if wanted_talent_lookup.hero_name ~= self._hero_name then
		return false
	end

	local wanted_talent_id = wanted_talent_lookup.talent_id

	for i = 1, #talent_ids do
		local talent_id = talent_ids[i]

		if wanted_talent_id == talent_id then
			return true
		end
	end

	return false
end

TalentExtension.get_talent_ids = function (self)
	local talent_interface = Managers.backend:get_talents_interface()
	local career_name = self._career_name
	local talent_ids = talent_interface:get_talent_ids(career_name)

	return talent_ids
end

TalentExtension.has_talent_perk = function (self, perk)
	local hero_name = self._hero_name
	local hero_affiliation = self._hero_affiliation

	if hero_affiliation == "tutorial" then
		return
	end

	local talent_ids = self:get_talent_ids()

	for i = 1, #talent_ids do
		local talent_id = talent_ids[i]
		local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)

		if talent_data then
			local perks = talent_data.perks

			if perks then
				local num_perks = #perks

				for j = 1, num_perks do
					if perks[j] == perk then
						return true
					end
				end
			end
		end
	end
end

TalentExtension.get_talent_names = function (self)
	local talent_ids = self:get_talent_ids()
	local talent_names = {}
	local hero_name = self._hero_name

	for _, talent_id in ipairs(talent_ids) do
		local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)

		talent_names[#talent_names + 1] = talent_data.name
	end

	return talent_names
end

TalentExtension._broadcast_talents_changed = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("on_talents_changed", self._unit, self)
	end
end

TalentExtension.destroy = function (self)
	return
end

TalentExtension.initial_talent_synced = function (self)
	return true
end

TalentExtension._check_talent_package_dendencies = function (self, talent_ids, initial_setup)
	local new_dependencies = {}
	local new_dependencies_n = 0
	local hero_name = self._hero_name

	for i = 1, #talent_ids do
		local talent_id = talent_ids[i]
		local talent_data = TalentUtils.get_talent_by_id(hero_name, talent_id)

		if talent_data.requires_packages then
			new_dependencies_n = new_dependencies_n + 1
			new_dependencies[new_dependencies_n] = talent_id
		end
	end

	table.sort(new_dependencies)

	if initial_setup then
		self._talent_ids_with_dependencies = new_dependencies
	else
		local talent_ids_with_dependencies = self._talent_ids_with_dependencies

		if not talent_ids_with_dependencies or #talent_ids_with_dependencies ~= new_dependencies_n then
			self._needs_loadout_resync = true
		else
			for i = 1, new_dependencies_n do
				if new_dependencies[i] ~= talent_ids_with_dependencies[i] then
					self._needs_loadout_resync = true

					break
				end
			end
		end
	end
end
