-- chunkname: @scripts/settings/infighting_settings.lua

local DEFAULT_IGNORED_BREEDS = table.set({
	"chaos_dummy_exalted_sorcerer_drachenfels",
	"chaos_dummy_sorcerer",
	"chaos_greed_pinata",
	"critter_nurgling",
	"critter_rat",
	"critter_pig",
})

InfightingSettings = {
	none = {
		boid_radius = 1,
		crowded_slots = 0,
		distance = 1,
		max_slots = 0,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
	small = {
		boid_radius = 0.3,
		crowded_slots = 10,
		distance = 2,
		max_slots = 12,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
	medium = {
		boid_radius = 0.4,
		crowded_slots = 10,
		distance = 2,
		max_slots = 12,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
	large = {
		boid_radius = 0.5,
		crowded_slots = 10,
		distance = 2,
		max_slots = 12,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
	boss = {
		boid_radius = 0.6,
		crowded_slots = 18,
		distance = 2,
		max_slots = 16,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge(table.set({
			"pet_skeleton",
			"pet_skeleton_dual_wield",
			"pet_skeleton_armored",
			"pet_skeleton_with_shield",
		}), DEFAULT_IGNORED_BREEDS),
	},
	skeleton_pet = {
		boid_radius = 0.3,
		crowded_slots = 4,
		distance = 2,
		max_slots = 4,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
	skeleton_pet_shield = {
		boid_radius = 0.4,
		crowded_slots = 7,
		distance = 2,
		max_slots = 7,
		trigger_minion_target_search = 100,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS),
	},
}
