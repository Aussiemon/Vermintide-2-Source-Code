-- chunkname: @scripts/helpers/talent_utils.lua

TalentUtils = {}

TalentUtils.get_talent = function (profile_name, talent_name)
	local talent_id = TalentIDLookup[talent_name]

	return TalentUtils.get_talent_by_id(profile_name, talent_id)
end

TalentUtils.get_talent_by_id = function (profile_name, talent_id)
	local talents = Talents[profile_name]

	if not talents then
		return nil
	end

	local talent = talents[talent_id]

	if not talent then
		return nil
	end

	if talent.mechanism_overrides then
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local mechanism_override = talent.mechanism_overrides[mechanism_name]

		if mechanism_override then
			talent = table.shallow_copy(talent)
			talent = table.merge(talent, mechanism_override)
		end
	end

	return talent
end
