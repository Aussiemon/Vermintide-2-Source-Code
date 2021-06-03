CameraSettings = CameraSettings or {}
PITCH_SPEED = 480
YAW_SPEED = 480
CameraTweaks = CameraTweaks or {}
CameraTweaks.zoom = {
	scale = 0.1,
	interpolation_function = function (current, target, dt)
		return math.lerp(current, target, dt * 7)
	end
}
local THIRD_PERSON_TRANSITIONS = {
	revive = CameraTransitionTemplates.reviving,
	heal_self = CameraTransitionTemplates.reviving,
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
	tunneling = CameraTransitionTemplates.tunneling
}
CameraSettings.first_person = {
	{
		{
			_node = {
				near_range = 0.1,
				name = "zoom_in",
				class = "TransformCamera",
				vertical_fov = 30,
				offset_position = {
					z = 0,
					x = 0,
					y = 0
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				near_range = 0.1,
				name = "zoom_in_third_person",
				class = "TransformCamera",
				vertical_fov = 65,
				offset_position = {
					z = 0,
					x = 0.75,
					y = 0.65
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				name = "zoom_in_trueflight",
				class = "TransformCamera",
				offset_position = {
					z = 0,
					x = 0,
					y = 0
				},
				node_transitions = table.merge({
					zoom_in = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				name = "zoom_in_trueflight_third_person",
				class = "TransformCamera",
				offset_position = {
					z = 0,
					x = 0.75,
					y = 0.65
				},
				node_transitions = table.merge({
					zoom_in = CameraTransitionTemplates.zoom,
					increased_zoom_in = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				near_range = 0.1,
				name = "increased_zoom_in",
				class = "TransformCamera",
				vertical_fov = 16,
				offset_position = {
					z = 0,
					x = 0,
					y = 0
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					zoom_in = CameraTransitionTemplates.zoom,
					zoom_in_trueflight = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				near_range = 0.1,
				name = "increased_zoom_in_third_person",
				class = "TransformCamera",
				vertical_fov = 16,
				offset_position = {
					z = 0,
					x = 0.75,
					y = 0.65
				},
				node_transitions = table.merge({
					first_person_node = CameraTransitionTemplates.zoom,
					zoom_in = CameraTransitionTemplates.zoom,
					zoom_in_trueflight = CameraTransitionTemplates.zoom
				}, THIRD_PERSON_TRANSITIONS)
			}
		},
		{
			_node = {
				name = "map_deus",
				class = "RotationCamera",
				offset_pitch = -85,
				offset_position = {
					z = 0,
					x = 0,
					y = 0
				},
				node_transitions = THIRD_PERSON_TRANSITIONS
			}
		},
		{
			{
				{
					_node = {
						name = "knocked_down",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "heal_self",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "attract_mode",
						class = "TransformCamera",
						offset_position = {
							z = 1,
							x = 0,
							y = -5
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "over_shoulder",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0.75,
							y = 0.65
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person
						}, THIRD_PERSON_TRANSITIONS)
					}
				},
				{
					_node = {
						name = "observer",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = -2
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "ledge_hanging",
						class = "TransformCamera",
						offset_position = {
							z = -1.5,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "chaos_spawn_grabbed",
						class = "TransformCamera",
						offset_position = {
							z = 0.5,
							x = 0.5,
							y = -1.6
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person
						}, THIRD_PERSON_TRANSITIONS)
					}
				},
				{
					_node = {
						name = "pounced_down",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "smartobject",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "revive",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "heal_other",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "dead",
						class = "TransformCamera",
						offset_position = {
							z = 0,
							x = 0,
							y = 0
						},
						node_transitions = {
							first_person_node = CameraTransitionTemplates.first_person
						}
					}
				},
				{
					_node = {
						name = "smart_climbing",
						class = "TransformCamera",
						offset_position = {
							z = 0.3,
							x = 0,
							y = -1
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person_fast
						}, THIRD_PERSON_TRANSITIONS)
					}
				},
				{
					_node = {
						name = "tunneling",
						class = "TransformCamera",
						offset_position = {
							z = 0.3,
							x = 0,
							y = -1
						},
						node_transitions = table.merge({
							first_person_node = CameraTransitionTemplates.first_person_fast
						}, THIRD_PERSON_TRANSITIONS)
					}
				},
				_node = {
					name = "onground_no_scale",
					class = "TransformCamera",
					offset_position = {
						z = 0,
						x = 0,
						y = -2
					}
				}
			},
			_node = {
				name = "up_translation",
				class = "TransformCamera",
				offset_position = {
					z = 0,
					x = 0,
					y = 0
				}
			}
		},
		_node = {
			name = "first_person_node",
			class = "TransformCamera",
			offset_position = {
				z = 0,
				x = 0,
				y = 0
			},
			node_transitions = THIRD_PERSON_TRANSITIONS
		}
	},
	_node = {
		far_range = 5000,
		name = "root_node",
		pitch_min = -40,
		near_range = 0.1,
		pitch_max = 0,
		should_apply_fov_multiplier = true,
		class = "RootCamera",
		yaw_speed = 0,
		vertical_fov = 65,
		pitch_speed = 0,
		tree_transitions = {},
		safe_position_offset = Vector3Box(0, 0, 0)
	}
}

if script_data.debug_third_person then
	CameraSettings.first_person[1]._node.offset_position.y = -3
end

CameraSettings.world = {
	_node = {
		pitch_min = -90,
		name = "default",
		far_range = 5000,
		pitch_max = -90,
		should_apply_fov_multiplier = true,
		class = "RootCamera",
		yaw_speed = 0,
		vertical_fov = 45,
		pitch_speed = 0,
		tree_transitions = {},
		node_transitions = {}
	}
}
CameraSettings.main_menu = {
	{
		_node = {
			class = "OffsetCamera",
			name = "sway"
		}
	},
	_node = {
		pitch_min = 0,
		name = "default",
		near_range = 0.05,
		far_range = 1000,
		pitch_max = 0,
		should_apply_fov_multiplier = true,
		class = "RootCamera",
		yaw_speed = 0,
		vertical_fov = 45,
		pitch_speed = 0,
		tree_transitions = {},
		node_transitions = {}
	}
}
CameraSettings.ingame_menu = {
	_node = {
		pitch_min = 0,
		name = "default",
		near_range = 1,
		far_range = 1000,
		pitch_max = 0,
		should_apply_fov_multiplier = true,
		class = "RootCamera",
		yaw_speed = 0,
		vertical_fov = 45,
		pitch_speed = 0,
		tree_transitions = {},
		node_transitions = {}
	}
}
CameraSettings.player_dead = {
	{
		{
			{
				{
					{
						{
							_node = {
								name = "default",
								class = "TransformCamera",
								offset_position = {
									z = 0,
									x = 0,
									y = 0
								}
							}
						},
						_node = {
							name = "onground",
							class = "ScalableTransformCamera",
							vertical_fov = 48,
							scale_variable = "zoom",
							offset_position = {
								z = 0,
								x = 0,
								y = -2
							},
							scale_function = function (scale)
								return scale
							end
						}
					},
					_node = {
						name = "onground_no_scale",
						class = "TransformCamera",
						offset_position = {
							z = 0.18,
							x = 0,
							y = -2
						}
					}
				},
				_node = {
					pitch = true,
					name = "pitch_aim",
					class = "AimCamera",
					yaw = true
				}
			},
			_node = {
				name = "up_translation",
				class = "TransformCamera",
				offset_position = {
					z = 0.25,
					x = 0,
					y = 0
				}
			}
		},
		_node = {
			yaw = true,
			name = "yaw_aim",
			class = "AimCamera",
			pitch_offset = 22.5,
			pitch = false
		}
	},
	_node = {
		pitch_min = -90,
		name = "root_node",
		pitch_offset = 0,
		pitch_max = 90,
		should_apply_fov_multiplier = true,
		class = "RootCamera",
		vertical_fov = 45,
		root_object_name = "j_hips",
		pitch_speed = PITCH_SPEED,
		yaw_speed = YAW_SPEED,
		safe_position_offset = Vector3Box(0, 0, 1.55),
		tree_transitions = {},
		node_transitions = {
			default = CameraTransitionTemplates.dead
		}
	}
}
CameraSettings.cutscene = {
	_node = {
		pitch_min = -90,
		name = "root_node",
		pitch_offset = 0,
		offset_pitch = -10,
		pitch_max = -90,
		class = "RootCamera",
		yaw_speed = 0,
		vertical_fov = 80,
		safe_position_impact_offset = 0,
		pitch_speed = 0,
		safe_position_offset = Vector3Box(0, 0, 1.55),
		tree_transitions = {},
		node_transitions = {}
	}
}

return
