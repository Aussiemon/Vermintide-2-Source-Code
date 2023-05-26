local settings = DLCSettings.skulls_2023
settings.live_events_packages = {
	skulls_2023 = {
		resource_packages = {
			"resource_packages/dlcs/skulls_2023_event"
		},
		dialogues = {
			adventure = {
				"dialogues/generated/npc_dlc_event_skulls"
			}
		}
	}
}
settings.anim_lookup = {}
settings.effects = {}
settings.unlock_settings = {}
settings.dialogue_lookup = {
	"dialogues/generated/lookup_npc_dlc_event_skulls"
}
settings.dialogue_settings = {}
settings.auto_load_files = {}
settings.network_sound_events = {}
settings.entity_extensions = {}
settings.prop_extension = {}
settings.death_reactions = {}
settings.interactions = {}
settings.interactions_filenames = {}
settings.unit_extension_templates = {}
settings.husk_lookup = {
	"units/mutator/skulls_2023/pup_skull_of_fury"
}
settings.generic_terror_event_files = {}
settings.mutators = {
	"skulls_2023"
}
settings.missions = {}
settings.network_go_types = {}
settings.item_master_list_file_names = {
	"scripts/settings/dlcs/skulls_2023/item_master_list_skulls_2023"
}
settings.weapon_skins_file_names = {
	"scripts/settings/dlcs/skulls_2023/weapon_skins_skulls_2023"
}
settings.pickups = {
	level_events = {
		skulls_2023 = {
			only_once = true,
			individual_pickup = false,
			hide_on_pickup = true,
			item_description = "skulls_2023_pickup_name",
			spawn_weighting = 1,
			debug_pickup_category = "special",
			pickup_sound_event = "Play_skulls_event_skull_pickup",
			type = "custom",
			unit_name = "units/mutator/skulls_2023/pup_skull_of_fury",
			local_pickup_sound = true,
			hud_description = "skulls_2023_pickup_name",
			disallow_bot_pickup = true,
			on_pick_up_func = function (world, interactor_unit, is_server, interactable_unit, is_husk)
				if not is_husk then
					local buff_system = Managers.state.entity:system("buff_system")

					buff_system:add_buff_synced(interactor_unit, "skulls_2023_buff", BuffSyncType.LocalAndServer)
				end

				Managers.state.achievement:trigger_event("register_skulls_2023_pickup")
				Managers.state.event:trigger("register_skulls_2023_pickup")
			end
		}
	}
}
settings.action_template_file_names = {}
settings.action_classes_lookup = {}
settings.game_object_templates = {}
settings.game_object_initializers = {}
settings.game_object_extractors = {}
settings.ai_group_templates = {}
