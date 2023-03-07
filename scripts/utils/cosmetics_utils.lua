CosmeticsUtils = {
	retrieve_skin_packages = function (skin_name, first_person)
		local skin_data = Cosmetics[skin_name]

		if not skin_data then
			return {}
		end

		local packages = nil

		if first_person then
			packages = {
				skin_data.first_person,
				skin_data.first_person_bot,
				skin_data.third_person,
				skin_data.third_person_bot,
				skin_data.first_person_attachment.unit,
				skin_data.third_person_attachment.unit
			}
		else
			packages = {
				skin_data.third_person_husk,
				skin_data.third_person_attachment.unit
			}
		end

		local material_changes = skin_data.material_changes

		if material_changes then
			packages[#packages + 1] = material_changes.package_name
		end

		return packages
	end,
	retrieve_skin_packages_for_preview = function (skin_name)
		local skin_data = Cosmetics[skin_name]

		if not skin_data then
			return {}
		end

		local packages = {
			skin_data.third_person,
			skin_data.third_person_bot,
			skin_data.third_person_attachment.unit
		}
		local material_changes = skin_data.material_changes

		if material_changes then
			packages[#packages + 1] = material_changes.package_name
		end

		return packages
	end,
	get_third_person_mesh_unit = function (unit)
		if not ALIVE[unit] then
			return nil
		end

		local cosmetic_extension = ScriptUnit.has_extension(unit, "cosmetic_system")

		return cosmetic_extension and cosmetic_extension:get_third_person_mesh_unit()
	end
}
local unit_flow_event = Unit.flow_event

CosmeticsUtils.flow_event_mesh_3p = function (unit, event_name)
	local mesh_unit = CosmeticsUtils.get_third_person_mesh_unit(unit)

	if mesh_unit then
		unit_flow_event(mesh_unit, event_name)
	end
end
