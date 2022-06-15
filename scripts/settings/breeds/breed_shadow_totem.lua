require("scripts/settings/dlcs/belakor/belakor_balancing")

local breed_data = {
	immediate_threat = true,
	bot_melee_aim_node = "j_spine1",
	animation_sync_rpc = "rpc_sync_anim_state_1",
	unit_template = "belakor_totem",
	flesh_material = "stone",
	no_blood_splatter_on_damage = true,
	race = "chaos",
	ignore_activate_unit = true,
	exchange_order = 1,
	poison_resistance = 100,
	perception = "perception_no_seeing",
	debug_despawn_immunity = false,
	override_bot_target_node = "j_spine1",
	debug_spawn_category = "Misc",
	target_head_node = "c_blk_totem_01",
	far_off_despawn_immunity = true,
	behavior = "shadow_totem",
	base_unit = "units/props/blk/blk_totem_01",
	threat_value = 10,
	hit_effect_template = "HitEffectsShadowTotem",
	max_health = BelakorBalancing.totem_health,
	debug_color = {
		255,
		255,
		255,
		255
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {
				"enemy_hit_box"
			}
		}
	},
	modify_extension_init_data = function (breed, is_husk, extension_init_data)
		local death_system_data = extension_init_data.death_system or {}
		death_system_data.death_reaction_template = "ai_default"
		death_system_data.is_husk = is_husk
		extension_init_data.death_system = death_system_data
		local hit_reaction_system_data = extension_init_data.hit_reaction_system or {}
		hit_reaction_system_data.hit_reaction_template = "level_object"
		hit_reaction_system_data.is_husk = is_husk
		extension_init_data.hit_reaction_system = hit_reaction_system_data
		local ping_system_data = extension_init_data.ping_system or {}
		ping_system_data.always_pingable = true
		extension_init_data.ping_system = ping_system_data
	end,
	debug_spawn_optional_data = {
		prepare_func = function (breed, extension_init_data)
			local is_husk = false

			breed:modify_extension_init_data(is_husk, extension_init_data)
		end
	}
}
Breeds.shadow_totem = table.create_copy(Breeds.shadow_totem, breed_data)

return
