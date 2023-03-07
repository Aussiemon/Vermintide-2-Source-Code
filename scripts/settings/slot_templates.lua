SlotTypeSettings = {
	normal = {
		debug_color = "lime",
		priority = 2,
		distance = 1.85,
		queue_distance = 3,
		radius = 0.5,
		use_wait_slots = true,
		count = 9,
		dialogue_surrounded_count = 4
	},
	medium = {
		debug_color = "yellow",
		priority = 1.5,
		distance = 2.2,
		queue_distance = 3.5,
		radius = 1,
		use_wait_slots = true,
		count = 8,
		dialogue_surrounded_count = 3
	},
	large = {
		debug_color = "red",
		priority = 1,
		distance = 2.25,
		queue_distance = 3.5,
		radius = 1.5,
		use_wait_slots = false,
		count = 4,
		dialogue_surrounded_count = 2
	}
}
SlotTemplates = {
	normal = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	hard = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	harder = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	hardest = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	cataclysm = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	cataclysm_2 = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	},
	cataclysm_3 = {
		skaven_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = false,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 2
		},
		skaven_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "normal",
			min_wait_queue_distance = 2,
			restricted_queue_distance = true,
			abandon_slot_when_blocked = false
		},
		skaven_elite = {
			restricted_queue_distance = true,
			slot_type = "normal",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_horde = {
			abandon_slot_when_blocked = false,
			abandon_slot_when_staggered = true,
			avoid_slots_behind_overwhelmed_target = true,
			abandon_slot_when_staggered_time = 0.3,
			restricted_queue_distance = true,
			slot_type = "normal",
			prioritize_queued_units_on_death = true,
			abandon_slot_when_blocked_time = 0.3,
			min_wait_queue_distance = 3.5
		},
		chaos_roamer = {
			prioritize_queued_units_on_death = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			restricted_queue_distance = true,
			min_wait_queue_distance = 3
		},
		chaos_elite = {
			restricted_queue_distance = true,
			slot_type = "medium",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		},
		chaos_large_elite = {
			restricted_queue_distance = true,
			slot_type = "large",
			avoid_slots_behind_overwhelmed_target = false,
			min_wait_queue_distance = 3
		}
	}
}

DLCUtils.map_list("slot_templates_file_names", function (file_name)
	return table.merge_recursive(SlotTemplates, require(file_name))
end)
