CosmeticUtils = CosmeticUtils or {}

CosmeticUtils.color_tint_unit = function (unit, hero_name, gradient_variation, gradient_value)
	local material_name = "mtr_outfit"

	if hero_name == "bright_wizard" then
		material_name = "mtr_body"
	end

	local num_meshes = Unit.num_meshes(unit)

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(unit, i)
		local has_material = Mesh.has_material(mesh, material_name)

		if has_material then
			local material = Mesh.material(mesh, material_name)
			local gradient_variation = gradient_variation
			local gradient_value = gradient_value

			Material.set_scalar(material, "gradient_variation", gradient_variation)
			Material.set_scalar(material, "tint_columns_pair", gradient_value)
		end
	end
end

return
