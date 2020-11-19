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
				skin_data.first_person_attachment.unit
			}
		else
			packages = {
				skin_data.third_person_husk
			}
		end

		local material_changes = skin_data.material_changes

		if material_changes then
			packages[#packages + 1] = material_changes.package_name
		end

		return packages
	end
}

return
