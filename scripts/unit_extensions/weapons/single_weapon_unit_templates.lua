-- chunkname: @scripts/unit_extensions/weapons/single_weapon_unit_templates.lua

SingleWeaponUnitTemplates = {}
SingleWeaponUnitTemplates.templates = {}

DLCUtils.require("single_weapon_templates")

SingleWeaponUnitTemplates.get_template = function (projectile_template, is_husk)
	local templates = SingleWeaponUnitTemplates.templates
	local husk_key = is_husk == true and "husk" or is_husk == false and "unit" or nil
	local template = husk_key and templates[projectile_template][husk_key] or templates[projectile_template]

	return template
end
