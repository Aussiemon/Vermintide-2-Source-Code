-- chunkname: @scripts/settings/breeds/breed_shadow_totem.lua

require("scripts/settings/dlcs/belakor/belakor_balancing")

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_1",
	base_unit = "units/props/blk/blk_totem_01",
	behavior = "shadow_totem",
	bot_melee_aim_node = "j_spine1",
	debug_despawn_immunity = false,
	debug_spawn_category = "Misc",
	exchange_order = 1,
	far_off_despawn_immunity = true,
	flesh_material = "stone",
	hit_effect_template = "HitEffectsShadowTotem",
	ignore_activate_unit = true,
	immediate_threat = true,
	no_blood_splatter_on_damage = true,
	override_bot_target_node = "j_spine1",
	perception = "perception_no_seeing",
	poison_resistance = 100,
	race = "chaos",
	target_head_node = "c_blk_totem_01",
	threat_value = 10,
	unit_template = "belakor_totem",
	max_health = BelakorBalancing.totem_health,
	infighting = InfightingSettings.small,
	debug_color = {
		255,
		255,
		255,
		255,
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {
				"enemy_hit_box",
			},
		},
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

			breed.modify_extension_init_data(breed, is_husk, extension_init_data)
		end,
	},
}

Breeds.shadow_totem = table.create_copy(Breeds.shadow_totem, breed_data)
