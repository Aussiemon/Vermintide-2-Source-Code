require("scripts/settings/script_input_settings")
require("scripts/settings/equipment/weapons")
require("scripts/settings/profiles/room_profiles")
require("scripts/settings/equipment/attachments")
require("scripts/settings/profiles/unit_wwise_profiles")
require("scripts/settings/equipment/cosmetics")

if script_data.honduras_demo then
	ProfilePriority = {
		3,
		5,
		4,
		1,
		2
	}
else
	ProfilePriority = {
		5,
		3,
		4,
		1,
		2
	}
end

ProfileIndexToPriorityIndex = {}

for priority_index, profile_index in ipairs(ProfilePriority) do
	ProfileIndexToPriorityIndex[profile_index] = priority_index
end

SPProfilesAbbreviation = {
	"wh",
	"bw",
	"dr",
	"we",
	"es"
}
TUTORIAL_PROFILE_INDEX = 6
SPProfiles = {
	{
		career_voice_parameter = "victor_career_voice_effect",
		display_name = "witch_hunter",
		ingame_short_display_name = "witch_hunter_short",
		hero_selection_image = "hero_icon_wh",
		character_name = "inventory_name_witch_hunter",
		character_vo = "witch_hunter",
		unit_name = "witch_hunter",
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_witch_hunter",
		ui_portrait = "unit_frame_portrait_victor_zealot",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.wh_1h_axe,
			slot_ranged = ItemMasterList.wh_brace_of_pistols,
			slot_hat = ItemMasterList.wh_hat_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.witch_hunter,
		base_units = UnitWwiseProfiles.base_units.witch_hunter,
		first_person_attachment = FirstPersonAttachments.witch_hunter,
		first_person_heights = {
			grabbed_by_tentacle = 1.9,
			knocked_down = 1,
			crouch = 1,
			stand = 1.7
		},
		mood_settings = {},
		careers = {
			CareerSettings.wh_captain,
			CareerSettings.wh_bountyhunter,
			CareerSettings.wh_zealot
		}
	},
	{
		career_voice_parameter = "sienna_career_voice_effect",
		display_name = "bright_wizard",
		ingame_short_display_name = "bright_wizard_short",
		hero_selection_image = "hero_icon_bw",
		character_name = "inventory_name_bright_wizard",
		character_vo = "bright_wizard",
		unit_name = "bright_wizard",
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_bright_wizard",
		ui_portrait = "unit_frame_portrait_sienna_adept",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.bw_sword,
			slot_ranged = ItemMasterList.bw_skullstaff_fireball,
			slot_hat = ItemMasterList.bw_gate_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.bright_wizard,
		base_units = UnitWwiseProfiles.base_units.bright_wizard,
		first_person_attachment = FirstPersonAttachments.bright_wizard,
		first_person_heights = {
			grabbed_by_tentacle = 1.7,
			knocked_down = 0.95,
			crouch = 1,
			stand = 1.55
		},
		mood_settings = {},
		careers = {
			CareerSettings.bw_adept,
			CareerSettings.bw_scholar,
			CareerSettings.bw_unchained
		}
	},
	{
		career_voice_parameter = "dwarf_career_voice_effect",
		display_name = "dwarf_ranger",
		ingame_short_display_name = "dwarf_ranger_short",
		hero_selection_image = "hero_icon_dr",
		character_name = "inventory_name_dwarf_ranger",
		character_vo = "dwarf_ranger",
		unit_name = "dwarf_ranger",
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_dwarf_ranger",
		ui_portrait = "unit_frame_portrait_bardin_slayer",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.dr_2h_hammer,
			slot_ranged = ItemMasterList.dr_crossbow,
			slot_hat = ItemMasterList.dr_helmet_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.dwarf_ranger,
		base_units = UnitWwiseProfiles.base_units.dwarf_ranger,
		first_person_attachment = FirstPersonAttachments.dwarf_ranger,
		first_person_heights = {
			grabbed_by_tentacle = 1.7,
			knocked_down = 0.7,
			crouch = 1,
			stand = 1.3
		},
		mood_settings = {},
		careers = {
			CareerSettings.dr_ranger,
			CareerSettings.dr_ironbreaker,
			CareerSettings.dr_slayer
		}
	},
	{
		career_voice_parameter = "kerillian_career_voice_effect",
		display_name = "wood_elf",
		ingame_short_display_name = "wood_elf_short",
		hero_selection_image = "hero_icon_ww",
		character_name = "inventory_name_wood_elf",
		character_vo = "wood_elf",
		unit_name = "way_watcher",
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_wood_elf",
		ui_portrait = "unit_frame_portrait_kerillian_shade",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.we_dual_wield_daggers,
			slot_ranged = ItemMasterList.we_shortbow,
			slot_hat = ItemMasterList.ww_hood_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.wood_elf,
		base_units = UnitWwiseProfiles.base_units.wood_elf,
		first_person_attachment = FirstPersonAttachments.wood_elf,
		first_person_heights = {
			grabbed_by_tentacle = 1.7,
			knocked_down = 1,
			crouch = 1,
			stand = 1.5
		},
		mood_settings = {},
		careers = {
			CareerSettings.we_waywatcher,
			CareerSettings.we_maidenguard,
			CareerSettings.we_shade
		}
	},
	{
		career_voice_parameter = "markus_career_voice_effect",
		display_name = "empire_soldier",
		ingame_short_display_name = "empire_soldier_short",
		hero_selection_image = "hero_icon_es",
		character_name = "inventory_name_empire_soldier",
		character_vo = "empire_soldier",
		unit_name = "empire_soldier",
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_empire_soldier",
		ui_portrait = "unit_frame_portrait_kruber_knight",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.es_sword_shield,
			slot_ranged = ItemMasterList.es_blunderbuss,
			slot_hat = ItemMasterList.es_hat_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.empire_soldier,
		base_units = UnitWwiseProfiles.base_units.empire_soldier,
		first_person_attachment = FirstPersonAttachments.empire_soldier,
		first_person_heights = {
			grabbed_by_tentacle = 1.9,
			knocked_down = 1,
			crouch = 1,
			stand = 1.65
		},
		mood_settings = {},
		careers = {
			CareerSettings.es_mercenary,
			CareerSettings.es_huntsman,
			CareerSettings.es_knight
		}
	},
	{
		career_voice_parameter = "markus_career_voice_effect",
		display_name = "empire_soldier_tutorial",
		ingame_short_display_name = "empire_soldier_short",
		hero_selection_image = "hero_icon_es",
		character_name = "inventory_name_empire_soldier",
		character_vo = "empire_soldier",
		unit_name = "empire_soldier",
		unit_template_name = "player_unit_3rd_tutorial",
		tutorial_profile = true,
		default_wielded_slot = "slot_melee",
		ingame_display_name = "inventory_name_empire_soldier",
		ui_portrait = "unit_frame_portrait_kruber_knight",
		career_voice_parameter_values = {
			0,
			100,
			50
		},
		equipment_slots = {
			slot_melee = ItemMasterList.es_sword_shield,
			slot_hat = ItemMasterList.es_hat_0001,
			slot_healthkit = ItemMasterList.healthkit_first_aid_kit_01
		},
		room_profile = RoomProfiles.empire_soldier,
		base_units = UnitWwiseProfiles.base_units.empire_soldier,
		first_person_attachment = FirstPersonAttachments.empire_soldier,
		first_person_heights = {
			grabbed_by_tentacle = 1.9,
			knocked_down = 1,
			crouch = 1,
			stand = 1.65
		},
		mood_settings = {},
		careers = {
			CareerSettings.empire_soldier_tutorial,
			CareerSettings.empire_soldier_tutorial,
			CareerSettings.empire_soldier_tutorial
		}
	}
}

function career_index_from_name(profile_index, career_name)
	local careers = SPProfiles[profile_index].careers

	for career_index, career in ipairs(careers) do
		if career.name == career_name then
			return career_index
		end
	end

	return nil
end

DefaultUnits = {
	standard = {
		backlit_camera = "units/generic/backlit_camera",
		camera = "core/units/camera"
	}
}

for index, profile in ipairs(SPProfiles) do
	local display_name = profile.display_name

	fassert(profile.equipment_slots.slot_melee, "\"slot_melee\" in profile %s contains no or invalid weapon, please fix error in SPProfiles", display_name)

	for slot_id, slot_data in pairs(profile.equipment_slots) do
		for other_slot_id, other_slot_data in pairs(profile.equipment_slots) do
			if other_slot_id ~= slot_id then
				assert(slot_data ~= other_slot_data, "Equipped the same item in two slots for profile %q (%s and %s)", class_name, slot_id, other_slot_id)
			end
		end
	end
end

function FindProfileIndex(profile_name)
	for i, profile_data in pairs(SPProfiles) do
		if profile_data.display_name == profile_name then
			return i
		end
	end

	return 
end

return 
