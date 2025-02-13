-- chunkname: @scripts/settings/material_effect_mappings_utility.lua

MaterialEffectMappings = MaterialEffectMappings or {}

table.clear(MaterialEffectMappings)

local _added_keys, _removed_keys, _diffing_keys = {}, {}, {}

local function _find_diffs(t1, t2)
	local str = ""

	return str
end

MaterialEffectMappingsUtility = {
	add = function (identifier, mappings)
		if MaterialEffectMappings[identifier] then
			ferror("MaterialEffectMappings with identifier %s already exists. %s", identifier, _find_diffs(MaterialEffectMappings[identifier], mappings))
		end

		MaterialEffectMappings[identifier] = mappings

		if DEDICATED_SERVER then
			mappings.sound = nil
		end
	end,
	get = function (identifier)
		return MechanismOverrides.get(MaterialEffectMappings[identifier])
	end,
}
