local MAX_SIZE = 228
local GAP = 2
local HIT_GAP = 3
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			1920,
			1080
		}
	},
	pivot = {
		parent = "screen",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	crosshair_root = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			MAX_SIZE,
			MAX_SIZE
		}
	},
	crosshair_dot = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			4,
			4
		}
	},
	crosshair_line = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			10,
			4
		}
	},
	crosshair_arrow = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			12,
			11
		}
	},
	crosshair_shotgun = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			8,
			25
		}
	},
	crosshair_projectile = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			-24,
			3
		},
		size = {
			14,
			28
		}
	},
	critical_hit_indication = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			75,
			75
		}
	},
	crosshair_circle = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			126,
			126
		}
	},
	crosshair_hit = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			10,
			4
		}
	},
	crosshair_hit_2 = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			-(HIT_GAP + 4),
			0,
			1
		},
		size = {
			8,
			8
		}
	},
	crosshair_hit_3 = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			-(HIT_GAP + 4),
			1
		},
		size = {
			8,
			8
		}
	},
	crosshair_hit_4 = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		position = {
			0,
			HIT_GAP + 4,
			1
		},
		size = {
			8,
			8
		}
	},
	crosshair_hit_armored = {
		vertical_alignment = "center",
		parent = "crosshair_root",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-80,
			1
		}
	}
}
local widget_definitions = {
	crosshair_dot = {
		scenegraph_id = "crosshair_dot",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_01_center"
		},
		style = {
			offset = {
				0,
				0,
				0
			}
		}
	},
	crosshair_projectile = {
		scenegraph_id = "crosshair_projectile",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_05"
		},
		style = {
			offset = {
				0,
				0,
				0
			}
		}
	},
	crosshair_arrow = {
		scenegraph_id = "crosshair_arrow",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_06"
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_arrow.size[1]/2,
				scenegraph_definition.crosshair_arrow.size[2]/2
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	crosshair_line = {
		scenegraph_id = "crosshair_line",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal"
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_line.size[1]/2,
				scenegraph_definition.crosshair_line.size[2]/2
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	crosshair_shotgun = {
		scenegraph_id = "crosshair_shotgun",
		element = UIElements.SimpleRotatedTexture,
		content = {
			texture_id = "crosshair_04"
		},
		style = {
			angle = 0,
			pivot = {
				scenegraph_definition.crosshair_shotgun.size[1]/2,
				scenegraph_definition.crosshair_shotgun.size[2]/2
			},
			offset = {
				0,
				0,
				0
			}
		}
	},
	critical_hit_indication = {
		scenegraph_id = "critical_hit_indication",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_03"
		},
		style = {
			offset = {
				0,
				0,
				0
			}
		}
	},
	crosshair_hit_1 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal"
		},
		style = {
			rotating_texture = {
				angle = 0,
				pivot = {
					5,
					2
				},
				offset = {
					6,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				size = {
					10,
					4
				}
			}
		}
	},
	crosshair_hit_2 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal"
		},
		style = {
			rotating_texture = {
				angle = 0,
				pivot = {
					5,
					2
				},
				offset = {
					-6,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				size = {
					10,
					4
				}
			}
		}
	},
	crosshair_hit_3 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal"
		},
		style = {
			rotating_texture = {
				angle = math.pi*0.5,
				pivot = {
					5,
					2
				},
				offset = {
					0,
					-6,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				size = {
					10,
					4
				}
			}
		}
	},
	crosshair_hit_4 = {
		scenegraph_id = "crosshair_hit",
		element = UIElements.RotatedTexture,
		content = {
			texture_id = "crosshair_01_horizontal"
		},
		style = {
			rotating_texture = {
				angle = math.pi*0.5,
				pivot = {
					5,
					2
				},
				offset = {
					0,
					6,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				size = {
					10,
					4
				}
			}
		}
	},
	crosshair_hit_armored_no_damage = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = "enemy_defense_indication_icon"
		},
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				0,
				255,
				255,
				255
			},
			texture_size = {
				42,
				46
			}
		}
	},
	crosshair_hit_armored_damage = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = "enemy_defense_indication_icon_partial"
		},
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				0,
				255,
				255,
				255
			},
			texture_size = {
				42,
				46
			}
		}
	},
	crosshair_hit_armored_break = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = "enemy_defense_indication_icon_broken"
		},
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				0,
				255,
				255,
				255
			},
			texture_size = {
				58,
				50
			}
		}
	},
	crosshair_hit_armored_open = {
		scenegraph_id = "crosshair_hit_armored",
		element = {
			passes = {
				{
					pass_type = "texture",
					texture_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = "enemy_defense_indication_icon_open"
		},
		style = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				0,
				255,
				255,
				255
			},
			texture_size = {
				42,
				46
			}
		}
	},
	crosshair_circle = {
		scenegraph_id = "crosshair_circle",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "crosshair_02"
		},
		style = {
			offset = {
				0,
				0,
				0
			}
		}
	}
}
local hit_marker_configurations = {
	normal = {
		color = Colors.color_definitions.hit_marker_normal,
		size = {
			8,
			8
		}
	},
	critical = {
		color = Colors.color_definitions.hit_marker_critical,
		size = {
			12,
			12
		}
	},
	armored = {
		color = Colors.color_definitions.hit_marker_armored,
		size = {
			8,
			8
		}
	},
	friendly = {
		color = Colors.color_definitions.hit_marker_friendly,
		size = {
			8,
			8
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	hit_marker_configurations = hit_marker_configurations,
	max_spread_pitch = MAX_SIZE,
	max_spread_yaw = MAX_SIZE,
	MAX_SIZE = MAX_SIZE
}
