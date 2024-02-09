-- chunkname: @scripts/ui/views/pactsworn_video_transition_view_definitions.lua

local pactsworn_video_data = {
	{
		loop = false,
		material_name = "pactsworn_tunnel_transition_1",
		scenegraph_id = "pactsworn_video",
		sound_start = "Play_versus_sfx_tunnel_warp",
		sound_stop = "Stop_versus_sfx_tunnel_warp",
		video_name = "video/pactsworn_tunnel_transition_1",
	},
	{
		loop = false,
		material_name = "pactsworn_tunnel_transition_2",
		scenegraph_id = "pactsworn_video",
		sound_start = "Play_versus_sfx_tunnel_warp",
		sound_stop = "Stop_versus_sfx_tunnel_warp",
		video_name = "video/pactsworn_tunnel_transition_2",
	},
	{
		loop = false,
		material_name = "pactsworn_tunnel_transition_3",
		scenegraph_id = "pactsworn_video",
		sound_start = "Play_versus_sfx_tunnel_warp",
		sound_stop = "Stop_versus_sfx_tunnel_warp",
		video_name = "video/pactsworn_tunnel_transition_3",
	},
	{
		loop = false,
		material_name = "pactsworn_tunnel_transition_4",
		scenegraph_id = "pactsworn_video",
		sound_start = "Play_versus_sfx_tunnel_warp",
		sound_stop = "Stop_versus_sfx_tunnel_warp",
		video_name = "video/pactsworn_tunnel_transition_4",
	},
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	background = {
		horizontal_alignment = "center",
		scale = "fit",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			99,
		},
	},
	pactsworn_video = {
		parent = "root",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			700,
		},
	},
}
local VIDEO_REFERENCE_NAME = "PACTSWORN_VIDEO_PLAYER"
local definitions = {
	scenegraph_definition = scenegraph_definition,
	pactsworn_video_data = pactsworn_video_data,
	reference_name = VIDEO_REFERENCE_NAME,
}

return definitions
