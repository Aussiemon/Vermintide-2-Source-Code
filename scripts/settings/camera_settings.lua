-- chunkname: @scripts/settings/camera_settings.lua

CameraSettings = CameraSettings or {}
PITCH_SPEED = 480
YAW_SPEED = 480
CameraTweaks = CameraTweaks or {}
CameraTweaks.zoom = {
	scale = 0.1,
	interpolation_function = function (current, target, dt)
		return math.lerp(current, target, dt * 7)
	end,
}

local THIRD_PERSON_TRANSITIONS = {
	revive = CameraTransitionTemplates.reviving,
	heal_self = CameraTransitionTemplates.reviving,
	emotes = CameraTransitionTemplates.reviving,
	zoom_in = CameraTransitionTemplates.zoom,
	zoom_in_third_person = CameraTransitionTemplates.zoom,
	increased_zoom_in = CameraTransitionTemplates.zoom,
	increased_zoom_in_third_person = CameraTransitionTemplates.zoom,
	zoom_in_trueflight = CameraTransitionTemplates.zoom,
	zoom_in_trueflight_third_person = CameraTransitionTemplates.zoom,
	heal_other = CameraTransitionTemplates.reviving,
	pounced_down = CameraTransitionTemplates.reviving,
	smartobject = CameraTransitionTemplates.reviving,
	knocked_down = CameraTransitionTemplates.reviving,
	dead = CameraTransitionTemplates.reviving,
	ledge_hanging = CameraTransitionTemplates.reviving,
	observer = CameraTransitionTemplates.reviving,
	over_shoulder = CameraTransitionTemplates.over_shoulder,
	chaos_spawn_grabbed = CameraTransitionTemplates.grabbed_by_chaos_spawn,
	smart_climbing = CameraTransitionTemplates.smart_climbing,
	tunneling = CameraTransitionTemplates.tunneling,
}

CameraSettings.first_person = {
	_node = {
		class = "RootCamera",
		far_range = 5000,
		name = "root_node",
		near_range = 0.1,
		pitch_max = 0,
		pitch_min = -40,
		pitch_speed = 0,
		should_apply_fov_multiplier = true,
		vertical_fov = 65,
		yaw_speed = 0,
		tree_transitions = {},
		safe_position_offset = Vector3Box(0, 0, 0),
	},
	{
		_node = {
			class = "TransformCamera",
			name = "first_person_node",
			offset_position = {
				x = 0,
				y = 0,
				z = 0,
			},
			node_transitions = THIRD_PERSON_TRANSITIONS,
		},
		{
			_node = {
				class = "TransformCamera",
				name = "zoom_in",
				near_range = 0.1,
				vertical_fov = 30,
				offset_position = {
					x = 0,
					y = 0,
					z = 0,
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "zoom_in_third_person",
				near_range = 0.1,
				vertical_fov = 65,
				offset_position = {
					x = 0.75,
					y = 0.65,
					z = 0,
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "zoom_in_trueflight",
				offset_position = {
					x = 0,
					y = 0,
					z = 0,
				},
				node_transitions = table.merge({
					zoom_in = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "zoom_in_trueflight_third_person",
				offset_position = {
					x = 0.75,
					y = 0.65,
					z = 0,
				},
				node_transitions = table.merge({
					zoom_in = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "increased_zoom_in",
				near_range = 0.1,
				vertical_fov = 16,
				offset_position = {
					x = 0,
					y = 0,
					z = 0,
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					zoom_in = CameraTransitionTemplates.zoom,
					zoom_in_trueflight = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "increased_zoom_in_third_person",
				near_range = 0.1,
				vertical_fov = 16,
				offset_position = {
					x = 0.75,
					y = 0.65,
					z = 0,
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					zoom_in = CameraTransitionTemplates.zoom,
					zoom_in_trueflight = CameraTransitionTemplates.zoom,
				}, THIRD_PERSON_TRANSITIONS),
			},
		},
		{
			_node = {
				class = "RotationCamera",
				name = "map_deus",
				offset_pitch = -85,
				offset_position = {
					x = 0,
					y = 0,
					z = 0,
				},
				node_transitions = THIRD_PERSON_TRANSITIONS,
			},
		},
		{
			_node = {
				class = "TransformCamera",
				name = "up_translation",
				offset_position = {
					x = 0,
					y = 0,
					z = 0,
				},
			},
			{
				_node = {
					class = "TransformCamera",
					name = "onground_no_scale",
					offset_position = {
						x = 0,
						y = -2,
						z = 0,
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "knocked_down",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "heal_self",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "emotes_offset",
						offset_position = {
							x = 0,
							y = 1,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
					{
						_node = {
							class = "ScalableTransformCamera",
							name = "emotes",
							scale_variable = "emote_zoom",
							offset_position = {
								x = 0,
								y = -5,
								z = 0,
							},
							scale_function = function (scale)
								return scale
							end,
							node_transitions = {
								first_person_node = CameraTransitionTemplates.first_person,
							},
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "attract_mode",
						offset_position = {
							x = 0,
							y = -5,
							z = 1,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "over_shoulder",
						offset_position = {
							x = 0.75,
							y = 0.65,
							z = 0,
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person,
						}, THIRD_PERSON_TRANSITIONS),
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "observer",
						offset_position = {
							x = 0,
							y = -2,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "ledge_hanging",
						offset_position = {
							x = 0,
							y = 0,
							z = -1.5,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "chaos_spawn_grabbed",
						offset_position = {
							x = 0.5,
							y = -1.6,
							z = 0.5,
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person,
						}, THIRD_PERSON_TRANSITIONS),
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "pounced_down",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "smartobject",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "revive",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "heal_other",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "dead",
						offset_position = {
							x = 0,
							y = 0,
							z = 0,
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person,
						},
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "smart_climbing",
						offset_position = {
							x = 0,
							y = -1,
							z = 0.3,
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person_fast,
						}, THIRD_PERSON_TRANSITIONS),
					},
				},
				{
					_node = {
						class = "TransformCamera",
						name = "tunneling",
						offset_position = {
							x = 0,
							y = -1,
							z = 0.3,
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person_fast,
						}, THIRD_PERSON_TRANSITIONS),
					},
				},
			},
		},
	},
}

if script_data.debug_third_person then
	CameraSettings.first_person[1]._node.offset_position.y = -3
end

CameraSettings.world = {
	_node = {
		class = "RootCamera",
		far_range = 5000,
		name = "default",
		pitch_max = -90,
		pitch_min = -90,
		pitch_speed = 0,
		should_apply_fov_multiplier = true,
		vertical_fov = 45,
		yaw_speed = 0,
		tree_transitions = {},
		node_transitions = {},
	},
}
CameraSettings.main_menu = {
	_node = {
		class = "RootCamera",
		far_range = 1000,
		name = "default",
		near_range = 0.05,
		pitch_max = 0,
		pitch_min = 0,
		pitch_speed = 0,
		should_apply_fov_multiplier = true,
		vertical_fov = 45,
		yaw_speed = 0,
		tree_transitions = {},
		node_transitions = {},
	},
	{
		_node = {
			class = "OffsetCamera",
			name = "sway",
		},
	},
}
CameraSettings.ingame_menu = {
	_node = {
		class = "RootCamera",
		far_range = 1000,
		name = "default",
		near_range = 1,
		pitch_max = 0,
		pitch_min = 0,
		pitch_speed = 0,
		should_apply_fov_multiplier = true,
		vertical_fov = 45,
		yaw_speed = 0,
		tree_transitions = {},
		node_transitions = {},
	},
}
CameraSettings.player_dead = {
	_node = {
		class = "RootCamera",
		name = "root_node",
		pitch_max = 90,
		pitch_min = -90,
		pitch_offset = 0,
		root_object_name = "j_hips",
		should_apply_fov_multiplier = true,
		vertical_fov = 45,
		pitch_speed = PITCH_SPEED,
		yaw_speed = YAW_SPEED,
		safe_position_offset = Vector3Box(0, 0, 1.55),
		tree_transitions = {},
		node_transitions = {
			default = CameraTransitionTemplates.dead,
		},
	},
	{
		_node = {
			class = "AimCamera",
			name = "yaw_aim",
			pitch = false,
			pitch_offset = 22.5,
			yaw = true,
		},
		{
			_node = {
				class = "TransformCamera",
				name = "up_translation",
				offset_position = {
					x = 0,
					y = 0,
					z = 0.25,
				},
			},
			{
				_node = {
					class = "AimCamera",
					name = "pitch_aim",
					pitch = true,
					yaw = true,
				},
				{
					_node = {
						class = "TransformCamera",
						name = "onground_no_scale",
						offset_position = {
							x = 0,
							y = -2,
							z = 0.18,
						},
					},
					{
						_node = {
							class = "ScalableTransformCamera",
							name = "onground",
							scale_variable = "zoom",
							vertical_fov = 48,
							offset_position = {
								x = 0,
								y = -2,
								z = 0,
							},
							scale_function = function (scale)
								return scale
							end,
						},
						{
							_node = {
								class = "TransformCamera",
								name = "default",
								offset_position = {
									x = 0,
									y = 0,
									z = 0,
								},
							},
						},
					},
				},
			},
		},
	},
}
CameraSettings.cutscene = {
	_node = {
		class = "RootCamera",
		name = "root_node",
		offset_pitch = -10,
		pitch_max = -90,
		pitch_min = -90,
		pitch_offset = 0,
		pitch_speed = 0,
		safe_position_impact_offset = 0,
		vertical_fov = 80,
		yaw_speed = 0,
		safe_position_offset = Vector3Box(0, 0, 1.55),
		tree_transitions = {},
		node_transitions = {},
	},
}
