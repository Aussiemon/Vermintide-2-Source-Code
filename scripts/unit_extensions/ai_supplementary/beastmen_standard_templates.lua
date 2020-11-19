BeastmenStandardTemplates = {
	invincibility_standard = {
		buff_template_name = "invincibility_standard",
		radius = 20,
		astar_check_frequency = 10,
		apply_buff_to_ai = true,
		vfx_picked_up_standard = "fx/chr_beastmen_standard_bearer_end_02",
		ai_buff_proc_vfx_name = "",
		ai_buff_vfx_name = ""
	},
	healing_standard = {
		apply_buff_to_player = false,
		radius = 15,
		sfx_taking_damage = "Play_enemy_beastmen_standar_taking_damage",
		apply_buff_to_ai = true,
		sfx_destroyed = "Play_enemy_beastmen_standar_destroy",
		ai_buff_proc_vfx_name = "fx/chr_beastmen_standard_bearer_buff_02",
		astar_check_frequency = 10,
		buff_template_name = "healing_standard",
		sfx_placed = "Play_enemy_standard_bearer_place_standar",
		sfx_loop_stop = "Stop_enemy_beastmen_standar_spell_loop",
		vfx_picked_up_standard = "fx/chr_beastmen_standard_bearer_end_02",
		sfx_loop = "Play_enemy_standard_bearer_place_standar",
		ai_buff_vfx_name = "fx/chr_beastmen_standard_bearer_buff_01"
	},
	horde_standard = {
		sfx_loop_stop = "Stop_enemy_beastmen_standar_spell_loop",
		radius = 12,
		sfx_destroyed = "Play_enemy_beastmen_standar_destroy",
		astar_check_frequency = 10,
		vfx_picked_up_standard = "fx/chr_beastmen_standard_bearer_end_02",
		sfx_placed = "Play_enemy_standard_bearer_place_standar",
		sfx_taking_damage = "Play_enemy_beastmen_standar_taking_damage",
		sfx_loop = "Play_enemy_standard_bearer_place_standar",
		composition = "standard_bearer_ambush",
		custom_update_func = function (template, data, t, dt, unit, units_inside)
			local next_horde_t = data.next_horde_t or 0

			if t > next_horde_t then
				local conflict_director = Managers.state.conflict
				local override_epicenter_pos = Unit.local_position(unit, 0)
				local override_composition_table = HordeCompositions[template.composition]
				local current_difficulty_rank, difficulty_tweak = Managers.state.difficulty:get_difficulty_rank()
				local composition_difficulty_rank = DifficultyTweak.converters.composition_rank(current_difficulty_rank, difficulty_tweak)
				local override_composition = override_composition_table[composition_difficulty_rank - 1]
				local extra_data = {
					sound_settings = template.horde_sound_settings
				}

				conflict_director.horde_spawner:execute_ambush_horde(extra_data, conflict_director.default_enemy_side_id, false, override_epicenter_pos, override_composition)

				data.next_horde_t = t + 10
			end
		end,
		horde_sound_settings = {
			stinger_sound_event = "enemy_horde_beastmen_stinger",
			music_states = {
				pre_ambush = "pre_ambush_beastmen",
				horde = "horde_beastmen"
			}
		}
	}
}

return
