Breeds.shadow_lieutenant = table.clone(Breeds.chaos_warrior)
Breeds.shadow_lieutenant.boss = true
Breeds.shadow_lieutenant.elite = false
Breeds.shadow_lieutenant.default_inventory_template = "warrior_axe_blk_shadow_lieutenant"
Breeds.shadow_lieutenant.no_blood_splatter_on_damage = true
Breeds.shadow_lieutenant.debug_spawn_category = "Misc"
Breeds.shadow_lieutenant.base_unit = "units/beings/enemies/blk_shadow_lieutenant/chr_blk_shadow_lieutenant"
Breeds.shadow_lieutenant.uses_spawn_animation = true
Breeds.shadow_lieutenant.default_spawn_animation = {
	"spawn_chaos_champion_01",
	"spawn_chaos_champion_01",
	"spawn_chaos_champion_01",
	"spawn_chaos_champion_02",
	"spawn_chaos_champion_02",
	"spawn_chaos_champion_02",
	"spawn_chaos_champion_03",
	"spawn_chaos_champion_03",
	"spawn_chaos_champion_03",
	"spawn_chaos_champion_04",
	"spawn_chaos_champion_04",
	"spawn_chaos_champion_04",
	"spawn_chaos_champion_05"
}
Breeds.shadow_lieutenant.dialogue_source_name = "npc_shadow_lieutenant"
Breeds.shadow_lieutenant.death_sound_event = "Play_enemy_vce_shadow_champion_death"
Breeds.shadow_lieutenant.trigger_dialogue_on_target_switch = false
Breeds.shadow_lieutenant.backstab_player_sound_event = "Play_enemy_vce_shadow_champion_attack_player_back"
Breeds.shadow_lieutenant.interrupt_spawning_on_stagger = true
Breeds.shadow_lieutenant.interrupt_spawning_on_health_percentage = 0.8
