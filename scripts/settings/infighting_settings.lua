local DEFAULT_IGNORED_BREEDS = table.set({
	"chaos_dummy_exalted_sorcerer_drachenfels",
	"chaos_dummy_sorcerer",
	"chaos_greed_pinata",
	"critter_nurgling",
	"critter_rat",
	"critter_pig"
})
InfightingSettings = {
	none = {
		trigger_minion_target_search = 100,
		distance = 1,
		max_slots = 0,
		crowded_slots = 0,
		boid_radius = 1,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	},
	small = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 12,
		crowded_slots = 10,
		boid_radius = 0.3,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	},
	medium = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 12,
		crowded_slots = 10,
		boid_radius = 0.4,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	},
	large = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 12,
		crowded_slots = 10,
		boid_radius = 0.5,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	},
	boss = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 16,
		crowded_slots = 18,
		boid_radius = 0.6,
		ignored_breed_filter = table.merge(table.set({
			"pet_skeleton",
			"pet_skeleton_dual_wield",
			"pet_skeleton_armored",
			"pet_skeleton_with_shield"
		}), DEFAULT_IGNORED_BREEDS)
	},
	skeleton_pet = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 4,
		crowded_slots = 4,
		boid_radius = 0.3,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	},
	skeleton_pet_shield = {
		trigger_minion_target_search = 100,
		distance = 2,
		max_slots = 7,
		crowded_slots = 7,
		boid_radius = 0.4,
		ignored_breed_filter = table.merge({}, DEFAULT_IGNORED_BREEDS)
	}
}
