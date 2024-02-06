-- chunkname: @scripts/unit_extensions/default_player_unit/weaves/player_unit_weave_loadout_extension.lua

PlayerUnitWeaveLoadoutExtension = class(PlayerUnitWeaveLoadoutExtension)

PlayerUnitWeaveLoadoutExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = extension_init_context.is_server
	self._buffs = {}
	self._synced_buff_params = nil
end

PlayerUnitWeaveLoadoutExtension.destroy = function (self)
	self._unit = nil
	self._buffs = nil
	self._synced_buff_params = nil
	self._buff_extension = nil
	self._career_extension = nil
end

PlayerUnitWeaveLoadoutExtension.extensions_ready = function (self, world, unit)
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")

	if self:_is_in_weave() then
		local buffs = self:_get_weave_buffs()

		self._buffs = buffs

		self:_apply_buffs(buffs)

		local weaves_interface = Managers.backend:get_interface("weaves")
		local career_name = self._career_extension:career_name()

		weaves_interface:apply_career_item_loadouts(career_name)
	end
end

PlayerUnitWeaveLoadoutExtension.game_object_initialized = function (self, unit, unit_go_id)
	self:_sync_buffs(unit_go_id)
end

PlayerUnitWeaveLoadoutExtension.hot_join_sync = function (self, sender)
	local rpc_params = self._synced_buff_params

	if rpc_params then
		local unit_go_id = Managers.state.unit_storage:go_id(self._unit)
		local channel_id = PEER_ID_TO_CHANNEL[sender]

		RPC.rpc_add_weave_buffs(channel_id, unit_go_id, unpack(rpc_params))
	end
end

PlayerUnitWeaveLoadoutExtension._is_in_weave = function (self)
	local mechanism_manager = Managers.mechanism
	local mechanism = mechanism_manager:game_mechanism()
	local mechanism_state = mechanism:get_state()
	local is_weave = mechanism_state == "weave"

	return is_weave
end

PlayerUnitWeaveLoadoutExtension._get_weave_buffs = function (self)
	local buffs = {
		client = {},
		server = {},
		both = {},
	}
	local weaves_interface = Managers.backend:get_interface("weaves")
	local career_name = self._career_extension:career_name()
	local properties = weaves_interface:get_loadout_properties(career_name)

	for property_key, property_upgrades in pairs(properties) do
		local num_upgrades = #property_upgrades
		local property_data = WeaveProperties.properties[property_key]
		local buff_name = property_data.buff_name

		fassert(BuffTemplates[buff_name], "Weave buff %q does not exist", buff_name)

		local costs = weaves_interface:get_property_mastery_costs(property_key)
		local max_num_upgrades = #costs
		local varable_value = num_upgrades / max_num_upgrades
		local buffer = property_data.buffer or "client"

		buffs[buffer][buff_name] = {
			variable_value = varable_value,
		}
	end

	local traits = weaves_interface:get_loadout_traits(career_name)

	for trait_key, _ in pairs(traits) do
		local trait_data = WeaveTraits.traits[trait_key]
		local buff_name = trait_data.buff_name

		fassert(BuffTemplates[buff_name], "Weave buff %q does not exist", buff_name)

		local buffer = trait_data.buffer or "client"

		buffs[buffer][buff_name] = {
			variable_value = 1,
		}
	end

	return buffs
end

PlayerUnitWeaveLoadoutExtension._apply_buffs = function (self, buffs_by_buffer)
	local buff_extension = self._buff_extension

	for buffer, buffs in pairs(buffs_by_buffer) do
		if self._is_server or buffer == "client" or buffer == "both" then
			for buff_name, variable_data in pairs(buffs) do
				local buff_data = BuffTemplates[buff_name]
				local params = {}

				for data_type, data_value in pairs(variable_data) do
					params[data_type] = data_value
				end

				buff_extension:add_buff(buff_name, params)
			end
		end
	end
end

PlayerUnitWeaveLoadoutExtension._sync_buffs = function (self, unit_go_id)
	local buffs = self._buffs

	if table.size(buffs) == 0 then
		return
	end

	local syncable_buffs = {}

	table.merge(syncable_buffs, buffs.server)
	table.merge(syncable_buffs, buffs.both)

	if table.size(syncable_buffs) == 0 then
		return
	end

	local rpc_params = BuffUtils.buffs_to_rpc_params(syncable_buffs)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit

	if self._is_server then
		network_transmit:send_rpc_clients("rpc_add_weave_buffs", unit_go_id, unpack(rpc_params))
	else
		network_transmit:send_rpc_server("rpc_add_weave_buffs", unit_go_id, unpack(rpc_params))
	end

	self._synced_buff_params = rpc_params
end
