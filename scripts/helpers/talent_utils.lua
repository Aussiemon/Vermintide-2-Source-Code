-- chunkname: @scripts/helpers/talent_utils.lua

TalentUtils = {}
TalentUtils.NIL = {}

TalentUtils.get_talent = function (profile_name, talent_name)
	local talent = TalentIDLookup[talent_name]

	return TalentUtils.get_talent_by_id(profile_name, talent.talent_id)
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

			for key, value in pairs(mechanism_override) do
				if value == TalentUtils.NIL then
					talent[key] = nil
				else
					talent[key] = value
				end
			end
		end
	end

	return talent
end

TalentUtils.get_talent_attribute = function (talent_name, attribute_name)
	local talent_info = TalentIDLookup[talent_name]

	if not talent_info then
		return
	end

	local hero_name = talent_info.hero_name
	local talent_id = talent_info.talent_id
	local talent = Talents[hero_name][talent_id]

	if not talent then
		return nil
	end

	local mechanism_overrides = talent.mechanism_overrides

	if mechanism_overrides then
		local mechanism_name = Managers.mechanism:current_mechanism_name()

		mechanism_overrides = mechanism_overrides[mechanism_name]

		if mechanism_overrides then
			local attribute_overrides = mechanism_overrides.attributes

			if attribute_overrides then
				return attribute_overrides[attribute_name]
			end
		end
	end

	local attributes = talent.attributes

	if attributes then
		return attributes[attribute_name]
	end
end
