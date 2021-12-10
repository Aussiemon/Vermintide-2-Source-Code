ClientHuskTalentExtension = class(ClientHuskTalentExtension)

ClientHuskTalentExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local profile_index = extension_init_data.profile_index
	local current_hero = SPProfiles[profile_index]
	local hero_name = current_hero.display_name
	self._hero_name = hero_name
	self._talent_ids = {}
end

ClientHuskTalentExtension.set_talent_ids = function (self, talent_ids)
	self._talent_ids = talent_ids
end

ClientHuskTalentExtension.get_talent_ids = function (self)
	return self._talent_ids
end

ClientHuskTalentExtension.get_talent_names = function (self, talent_names)
	local talent_ids = self._talent_ids
	local hero_name = self._hero_name
	talent_names = talent_names or {}

	for i = 1, #talent_ids, 1 do
		local talent_id = talent_ids[i]
		local talent_data = Talents[hero_name][talent_id]
		talent_names[#talent_names + 1] = talent_data.name
	end

	return talent_names
end

ClientHuskTalentExtension.has_talent = function (self, talent_name)
	return nil
end

ClientHuskTalentExtension.apply_buffs_from_talents = function (self)
	print("[ClientHuskTalentExtension] apply_buffs_from_talents should not be called on a client husk")
end

ClientHuskTalentExtension.initial_talent_synced = function (self)
	print("[ClientHuskTalentExtension] initial_talent_synced should not be called on a client husk")
end

return
