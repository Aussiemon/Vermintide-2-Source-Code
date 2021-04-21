require("scripts/settings/breeds/breed_chaos_mutator_sorcerer")

local breed_data = table.clone(Breeds.chaos_mutator_sorcerer)
breed_data.unit_template = "ai_unit_curse_corruptor_sorcerer"
breed_data.behavior = "curse_mutator_sorcerer"
Breeds.curse_mutator_sorcerer = table.create_copy(Breeds.curse_mutator_sorcerer, breed_data)
local action_data = table.clone(BreedActions.chaos_mutator_sorcerer)
action_data.grab_attack.grab_delay = 2
action_data.follow.fast_move_speed = 0.5
action_data.follow.slow_move_speed = 3
BreedActions.curse_mutator_sorcerer = table.create_copy(BreedActions.curse_mutator_sorcerer, action_data)

return
