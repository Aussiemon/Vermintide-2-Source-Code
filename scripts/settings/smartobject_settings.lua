SmartObjectSettings = {
	jump_up_max_height = 5.1,
	templates = {}
}
SmartObjectSettings.templates.fallback = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			animation_fence = "jump_up_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_3m",
			vertical_length = 3,
			animation_edge = "jump_up_3m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down",
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.default_clan_rat = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = {
				"jump_up_1m",
				"jump_up_1m_2"
			},
			animation_fence = {
				"jump_up_fence_1m",
				"jump_up_fence_1m_2"
			}
		},
		{
			horizontal_length = 1,
			height_threshold = 4,
			vertical_length = 3,
			animation_edge = {
				"jump_up_3m",
				"jump_up_3m_2"
			},
			animation_fence = {
				"jump_up_fence_3m",
				"jump_up_fence_3m_2"
			}
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			height_threshold = math.huge,
			animation_edge = {
				"jump_up_5m",
				"jump_up_5m_2"
			}
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_land = "jump_down_land",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			animation_edge = {
				"jump_down",
				"jump_down_2"
			},
			animation_land = {
				"jump_down_land",
				"jump_down_land_2",
				"jump_down_land_3",
				"jump_down_land_4",
				"jump_down_land_5",
				"jump_down_land_6"
			}
		},
		{
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge,
			animation_edge = {
				"jump_down",
				"jump_down_2"
			},
			animation_land = {
				"jump_down_land",
				"jump_down_land_2",
				"jump_down_land_3",
				"jump_down_land_4",
				"jump_down_land_5",
				"jump_down_land_6"
			}
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			horizontal_threshold = math.huge,
			animation_jump = {
				"jump_over_gap_4m",
				"jump_over_gap_4m_2",
				"jump_over_gap_4m_3",
				"jump_over_gap_4m_4"
			}
		}
	}
}
SmartObjectSettings.templates.chaos_marauder = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = {
				"jump_up_1m",
				"jump_up_1m_2"
			},
			animation_fence = {
				"jump_up_fence_1m",
				"jump_up_fence_1m_2"
			}
		},
		{
			horizontal_length = 1,
			height_threshold = 4,
			vertical_length = 3,
			animation_edge = {
				"jump_up_3m",
				"jump_up_3m_2"
			},
			animation_fence = {
				"jump_up_fence_3m",
				"jump_up_fence_3m_2"
			}
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			height_threshold = math.huge,
			animation_edge = {
				"jump_up_5m",
				"jump_up_5m_2"
			}
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			animation_edge = {
				"jump_down",
				"jump_down_2"
			}
		},
		{
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge,
			animation_edge = {
				"jump_down",
				"jump_down_2"
			}
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.chaos_warrior = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = {
				"jump_up_1m"
			},
			animation_fence = {
				"jump_up_fence_1m"
			}
		},
		{
			horizontal_length = 1,
			height_threshold = 4,
			vertical_length = 3,
			animation_edge = {
				"jump_up_3m"
			},
			animation_fence = {
				"jump_up_fence_3m"
			}
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			height_threshold = math.huge,
			animation_edge = {
				"jump_up_5m"
			}
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			animation_edge = {
				"jump_down"
			}
		},
		{
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge,
			animation_edge = {
				"jump_down"
			}
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.special = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.ungor = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			horizontal_threshold = math.huge,
			animation_jump = {
				"jump_over_gap_4m",
				"jump_over_gap_4m_2",
				"jump_over_gap_4m_3"
			}
		}
	}
}
SmartObjectSettings.templates.rat_ogre = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			fence_vertical_length = 3,
			animation_edge = "jump_up_2m",
			animation_fence = "jump_up_fence_3m",
			height_threshold = 2.5,
			vertical_length = 2,
			horizontal_length = 2
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 3.5,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.stormfiend = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			fence_vertical_length = 3,
			animation_edge = "jump_up_2m",
			animation_fence = "jump_up_fence_3m",
			height_threshold = 2.5,
			vertical_length = 2,
			horizontal_length = 2
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 3.5,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.chaos_spawn = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_2m",
			height_threshold = 2.5,
			vertical_length = 2,
			animation_edge = "jump_up_2m"
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 3.5,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down_3m",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down_5m",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.chaos_troll = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			animation_edge = "jump_up_1m"
		},
		{
			fence_vertical_length = 3,
			animation_edge = "jump_up_2m",
			animation_fence = "jump_up_fence_3m",
			height_threshold = 2.5,
			vertical_length = 2,
			horizontal_length = 2
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_3m",
			height_threshold = 3.5,
			vertical_length = 3,
			animation_edge = "jump_up_3m"
		},
		{
			fence_vertical_length = 5,
			animation_edge = "jump_up_4m",
			animation_fence = "jump_up_fence_5m",
			height_threshold = 4.5,
			vertical_length = 4,
			horizontal_length = 2
		},
		{
			horizontal_length = 2,
			animation_fence = "jump_up_fence_5m",
			vertical_length = 5,
			animation_edge = "jump_up_5m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down_1m",
			animation_fence = "jump_down_fence_1m",
			height_threshold = 1.5,
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_3m",
			height_threshold = 4,
			vertical_length = 3,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4
		},
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_5m",
			vertical_length = 5,
			fence_horizontal_length = 1.1,
			fence_land_length = 0.4,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}
SmartObjectSettings.templates.chaos_zombie = {
	jump_up_anim_thresholds = {
		{
			horizontal_length = 1,
			animation_fence = "jump_up_fence_1m",
			vertical_length = 1,
			animation_edge = "jump_up_1m",
			height_threshold = math.huge
		}
	},
	jump_down_anim_thresholds = {
		{
			animation_edge = "jump_down",
			animation_fence = "jump_down_fence_1m",
			vertical_length = 1,
			fence_horizontal_length = 1.5,
			fence_land_length = 0,
			height_threshold = math.huge
		}
	},
	jump_across_anim_thresholds = {
		{
			horizontal_length = 4,
			animation_jump = "jump_over_gap_4m",
			horizontal_threshold = math.huge
		}
	}
}

return
