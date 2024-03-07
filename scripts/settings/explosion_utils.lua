-- chunkname: @scripts/settings/explosion_utils.lua

ExplosionUtils = ExplosionUtils or {}

ExplosionUtils.get_template = function (template_name)
	if not template_name then
		return
	end

	return MechanismOverrides.get(ExplosionTemplates[template_name])
end
