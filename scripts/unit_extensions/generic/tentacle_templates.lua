-- chunkname: @scripts/unit_extensions/generic/tentacle_templates.lua

TentacleTemplates = {
	portal = {
		portal_camera_node = "a_camera_attach",
		portal_unit_name = "units/beings/enemies/chaos_tentacle_portal/chr_chaos_tentacle_portal",
		switch_to_3p_dist_sq = 100,
		switch_to_portal_cam_dist_sq = 9,
	},
	blob = {
		portal_camera_node = "a_surface_center",
		portal_unit_name = "units/gameplay/portal_blob/portalblob",
		switch_to_3p_dist_sq = 10000,
		switch_to_portal_cam_dist_sq = -1,
		use_ik_chain = false,
	},
}
