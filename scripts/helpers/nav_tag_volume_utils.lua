NavTagVolumeUtils = NavTagVolumeUtils or {}
NavTagVolumeUtils.nav_tags_from_position = function (nav_world, position, above, below, layer_name_optional)
	local layer_id_optional = layer_name_optional and LAYER_ID_MAPPING[layer_name_optional]
	local query_output = GwNavQueries.tag_volumes_from_position(nav_world, position, above, below)
	local nav_tags = nil

	if query_output then
		local tag_volume_n = GwNavQueries.nav_tag_volume_count(query_output)

		for i = 1, tag_volume_n, 1 do
			local tag_volume = GwNavQueries.nav_tag_volume(query_output, i)
			local is_exclusive, color, layer_id, smart_object_id, user_data_id = GwNavTagVolume.navtag(tag_volume)

			if not layer_id_optional or layer_id_optional == layer_id then
				nav_tags = nav_tags or {}
				nav_tags[#nav_tags + 1] = {
					is_exclusive = is_exclusive,
					color = color,
					layer_id = layer_id,
					smart_object_id = smart_object_id,
					user_data_id = user_data_id
				}
			end
		end
	end

	return nav_tags
end
NavTagVolumeUtils.inside_nav_tag_layer = function (nav_world, position, above, below, layer_name)
	local layer = LAYER_ID_MAPPING[layer_name]
	local query_output = GwNavQueries.tag_volumes_from_position(nav_world, position, above, below)

	if query_output then
		local tag_volume_n = GwNavQueries.nav_tag_volume_count(query_output)

		for i = 1, tag_volume_n, 1 do
			local tag_volume = GwNavQueries.nav_tag_volume(query_output, i)
			local is_exclusive, color, layer_id, smart_object_id, user_data_id = GwNavTagVolume.navtag(tag_volume)

			if layer == layer_id then
				return true
			end
		end
	end

	return 
end
NavTagVolumeUtils.inside_level_volume_layer = function (level, nav_tag_volume_handler, position, layer_name)
	local level_volumes = nav_tag_volume_handler.level_volumes_by_layer[layer_name]

	if not level_volumes then
		return 
	end

	for i = 1, #level_volumes, 1 do
		if Level.is_point_inside_volume(level, level_volumes[i], position) then
			return true
		end
	end

	return 
end

return 
