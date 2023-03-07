BoonExtension = class(BoonExtension)

BoonExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._profile_index = extension_init_data.profile_index
end

BoonExtension.game_object_initialized = function (self, unit, go_id)
	if DamageUtils.is_in_inn then
		return
	end

	local boons_backend = Managers.backend:get_interface("boons")
	local active_boons = boons_backend:get_active_boons()
	local buff_system = Managers.state.entity:system("buff_system")

	for _, boon in ipairs(active_boons) do
		local buff_name = BoonTemplates[boon.boon_name].buff_per_hero[self._profile_index]

		fassert(buff_name, "boon %s doesn't have buff for profile %d", boon.boon_name, self._profile_index)
		buff_system:add_buff(unit, buff_name, unit, false)
	end
end

BoonExtension.destroy = function (self)
	return
end
