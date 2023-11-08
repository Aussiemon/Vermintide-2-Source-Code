require("scripts/settings/script_input_settings")
require("scripts/settings/equipment/weapons")
require("scripts/settings/profiles/room_profiles")
require("scripts/settings/equipment/attachments")
require("scripts/settings/profiles/base_units")
require("scripts/settings/equipment/cosmetics")

if script_data.honduras_demo then
	ProfilePriority = {
		3,
		5,
		4,
		1,
		2
	}
elseif LAUNCH_MODE == "attract_benchmark" then
	ProfilePriority = {
		3,
		4,
		2,
		1,
		5
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
local base_character_states = {
	"PlayerCharacterStateDead",
	"PlayerCharacterStateInteracting",
	"PlayerCharacterStateInspecting",
	"PlayerCharacterStateEmote",
	"PlayerCharacterStateJumping",
	"PlayerCharacterStateClimbingLadder",
	"PlayerCharacterStateLeavingLadderTop",
	"PlayerCharacterStateEnterLadderTop",
	"PlayerCharacterStateFalling",
	"PlayerCharacterStateKnockedDown",
	"PlayerCharacterStatePouncedDown",
	"PlayerCharacterStateStanding",
	"PlayerCharacterStateWalking",
	"PlayerCharacterStateDodging",
	"PlayerCharacterStateLedgeHanging",
	"PlayerCharacterStateLeaveLedgeHangingPullUp",
	"PlayerCharacterStateLeaveLedgeHangingFalling",
	"PlayerCharacterStateCatapulted",
	"PlayerCharacterStateStunned",
	"PlayerCharacterStateCharged",
	"PlayerCharacterStateUsingTransport",
	"PlayerCharacterStateGrabbedByPackMaster",
	"PlayerCharacterStateGrabbedByTentacle",
	"PlayerCharacterStateWaitingForAssistedRespawn",
	"PlayerCharacterStateOverchargeExploding",
	"PlayerCharacterStateInVortex",
	"PlayerCharacterStateGrabbedByChaosSpawn",
	"PlayerCharacterStateLunging",
	"PlayerCharacterStateLeaping",
	"PlayerCharacterStateOverpowered",
	"PlayerCharacterStateInHangingCage",
	"PlayerCharacterStateGrabbedByCorruptor"
}
local base_camera_states = {
	"CameraStateIdle",
	"CameraStateFollow",
	"CameraStateFollowThirdPerson",
	"CameraStateFollowAttract",
	"CameraStateFollowThirdPersonLedge",
	"CameraStateFollowThirdPersonOverShoulder",
	"CameraStateFollowThirdPersonSmartClimbing",
	"CameraStateFollowThirdPersonTunneling",
	"CameraStateFollowChaosSpawnGrabbed",
	"CameraStateObserver",
	"CameraStateInteraction"
}
local hud_components = {
	"LootObjectiveUI",
	"WaitForRescueUI",
	"ItemReceivedFeedbackUI",
	"OverchargeBarUI",
	"BuffUI",
	"BuffPresentationUI",
	"EquipmentUI",
	"GamePadEquipmentUI",
	"AbilityUI",
	"GamePadAbilityUI",
	"InteractionUI",
	"DamageIndicatorGui",
	"CrosshairUI",
	"FatigueUI",
	"BonusDiceUI",
	"PlayerInventoryUI",
	"SocialWheelUI",
	"WeaveProgressUI",
	"WeaveTimerUI",
	"WorldMarkerUI",
	"ChallengeTrackerUI"
}
local default_state_machine = "units/beings/player/first_person_base/state_machines/common"

for _, dlc in pairs(DLCSettings) do
	local dlc_hud_components = dlc.hero_hud_components

	if dlc_hud_components then
		for _, dlc_hud_component in ipairs(dlc_hud_components) do
			hud_components[#hud_components + 1] = dlc_hud_component
		end
	end
end

SPProfiles = {
	{
		career_voice_parameter = "victor_career_voice_effect",
		display_name = "witch_hunter",
		ingame_short_display_name = "witch_hunter_short",
		hero_selection_image = "hero_icon_wh",
		character_name = "inventory_name_witch_hunter",
		character_vo = "witch_hunter",
		unit_name = "witch_hunter",
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_witch_hunter",
		affiliation = "heroes",
		ui_portrait = "unit_frame_portrait_victor_captain",
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
		base_units = BaseUnits.witch_hunter,
		default_state_machine = default_state_machine,
		first_person_attachment = FirstPersonAttachments.witch_hunter,
		first_person_heights = {
			charged = 1,
			crouch = 1,
			stand = 1.7,
			knocked_down = 1,
			grabbed_by_tentacle = 1.9
		},
		mood_settings = {},
		careers = {
			CareerSettings.wh_captain,
			CareerSettings.wh_bountyhunter,
			CareerSettings.wh_zealot
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
	},
	{
		career_voice_parameter = "sienna_career_voice_effect",
		display_name = "bright_wizard",
		ingame_short_display_name = "bright_wizard_short",
		hero_selection_image = "hero_icon_bw",
		character_name = "inventory_name_bright_wizard",
		character_vo = "bright_wizard",
		unit_name = "bright_wizard",
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_bright_wizard",
		affiliation = "heroes",
		ui_portrait = "unit_frame_portrait_sienna_scholar",
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
		base_units = BaseUnits.bright_wizard,
		default_state_machine = default_state_machine,
		first_person_attachment = FirstPersonAttachments.bright_wizard,
		first_person_heights = {
			charged = 0.9,
			crouch = 1,
			stand = 1.55,
			knocked_down = 0.95,
			grabbed_by_tentacle = 1.7
		},
		mood_settings = {},
		careers = {
			CareerSettings.bw_adept,
			CareerSettings.bw_scholar,
			CareerSettings.bw_unchained
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
	},
	{
		career_voice_parameter = "dwarf_career_voice_effect",
		display_name = "dwarf_ranger",
		ingame_short_display_name = "dwarf_ranger_short",
		hero_selection_image = "hero_icon_dr",
		character_name = "inventory_name_dwarf_ranger",
		character_vo = "dwarf_ranger",
		unit_name = "dwarf_ranger",
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_dwarf_ranger",
		affiliation = "heroes",
		ui_portrait = "unit_frame_portrait_bardin_ranger",
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
		base_units = BaseUnits.dwarf_ranger,
		default_state_machine = default_state_machine,
		first_person_attachment = FirstPersonAttachments.dwarf_ranger,
		first_person_heights = {
			charged = 0.75,
			crouch = 1,
			stand = 1.3,
			knocked_down = 0.7,
			grabbed_by_tentacle = 1.7
		},
		mood_settings = {},
		careers = {
			CareerSettings.dr_ranger,
			CareerSettings.dr_ironbreaker,
			CareerSettings.dr_slayer
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
	},
	{
		career_voice_parameter = "kerillian_career_voice_effect",
		display_name = "wood_elf",
		ingame_short_display_name = "wood_elf_short",
		hero_selection_image = "hero_icon_ww",
		character_name = "inventory_name_wood_elf",
		character_vo = "wood_elf",
		unit_name = "way_watcher",
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_wood_elf",
		affiliation = "heroes",
		ui_portrait = "unit_frame_portrait_kerillian_waywatcher",
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
		base_units = BaseUnits.wood_elf,
		default_state_machine = default_state_machine,
		first_person_attachment = FirstPersonAttachments.wood_elf,
		first_person_heights = {
			charged = 0.85,
			crouch = 1,
			stand = 1.5,
			knocked_down = 1,
			grabbed_by_tentacle = 1.7
		},
		mood_settings = {},
		careers = {
			CareerSettings.we_waywatcher,
			CareerSettings.we_maidenguard,
			CareerSettings.we_shade
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
	},
	{
		career_voice_parameter = "markus_career_voice_effect",
		display_name = "empire_soldier",
		ingame_short_display_name = "empire_soldier_short",
		hero_selection_image = "hero_icon_es",
		character_name = "inventory_name_empire_soldier",
		character_vo = "empire_soldier",
		unit_name = "empire_soldier",
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_empire_soldier",
		affiliation = "heroes",
		ui_portrait = "unit_frame_portrait_kruber_huntsman",
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
		base_units = BaseUnits.empire_soldier,
		default_state_machine = default_state_machine,
		first_person_attachment = FirstPersonAttachments.empire_soldier,
		first_person_heights = {
			charged = 1,
			crouch = 1,
			stand = 1.65,
			knocked_down = 1,
			grabbed_by_tentacle = 1.9
		},
		mood_settings = {},
		careers = {
			CareerSettings.es_mercenary,
			CareerSettings.es_huntsman,
			CareerSettings.es_knight
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
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
		supports_motion_sickness_modes = true,
		default_wielded_slot = "slot_melee",
		role = "hero",
		ingame_display_name = "inventory_name_empire_soldier",
		affiliation = "tutorial",
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
		base_units = BaseUnits.empire_soldier,
		default_state_machine = default_state_machine,
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
		},
		base_character_states = base_character_states,
		base_camera_states = base_camera_states
	}
}
TUTORIAL_PROFILE_INDEX = nil

for profile_index, profile in pairs(SPProfiles) do
	if profile.tutorial_profile then
		TUTORIAL_PROFILE_INDEX = profile_index
	end
end

local function process_profiles()
	for i = 1, #SPProfiles do
		local profile = SPProfiles[i]
		local profile_name = profile.display_name

		if not PROFILES_BY_NAME[profile_name] then
			profile.index = i
			PROFILES_BY_NAME[profile_name] = profile
			local affiliation = profile.affiliation or "unfinished"

			if not PROFILES_BY_AFFILIATION[affiliation] then
				PROFILES_BY_AFFILIATION[affiliation] = {}
			end

			local affiliation_profiles = PROFILES_BY_AFFILIATION[affiliation]
			affiliation_profiles[#affiliation_profiles + 1] = profile_name
			affiliation_profiles[profile_name] = true
		end
	end
end

function FindProfileIndex(profile_name)
	local profile_settings = PROFILES_BY_NAME[profile_name]

	return profile_settings and profile_settings.index
end

function GetHeroAffiliationIndex(profile_index)
	local profile = SPProfiles[profile_index]
	local hero_profiles = PROFILES_BY_AFFILIATION.heroes

	for i = 1, #hero_profiles do
		local hero_profile = hero_profiles[i]

		if profile.display_name == hero_profile then
			return i
		end
	end
end

function add_career_to_profile(profile_name, career)
	local profile_idx = FindProfileIndex(profile_name)
	local profile = SPProfiles[profile_idx]
	local careers = profile.careers

	table.insert(careers, career)
end

PROFILES_BY_NAME = {}
PROFILES_BY_AFFILIATION = {}

process_profiles()

for _, dlc in pairs(DLCSettings) do
	local profile_files = dlc.profile_files

	if profile_files then
		for _, profile_file in ipairs(profile_files) do
			local additional_profiles = dofile(profile_file)

			if additional_profiles then
				table.append(SPProfiles, additional_profiles)
			end
		end
	end
end

process_profiles()

PROFILES_BY_NAME = {}
PROFILES_BY_CAREER_NAMES = {}
PROFILES_BY_AFFILIATION = {}

for i = 1, #SPProfiles do
	local profile = SPProfiles[i]
	profile.index = i
	PROFILES_BY_NAME[profile.display_name] = profile
	local affiliation = profile.affiliation or "unfinished"

	if not PROFILES_BY_AFFILIATION[affiliation] then
		PROFILES_BY_AFFILIATION[affiliation] = {}
	end

	local affiliation_profiles = PROFILES_BY_AFFILIATION[affiliation]
	affiliation_profiles[#affiliation_profiles + 1] = profile.display_name
	affiliation_profiles[profile.display_name] = true
	local careers = profile.careers

	for career_index, career in ipairs(careers) do
		PROFILES_BY_CAREER_NAMES[career.name] = profile
	end
end

function career_index_from_name(profile_index, career_name)
	local careers = SPProfiles[profile_index].careers

	for career_index, career in ipairs(careers) do
		if career.name == career_name then
			return career_index
		end
	end

	return nil
end

function hero_and_career_name_from_index(profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local profile_name = profile.display_name
	local career_name = career.name

	return profile_name, career_name
end

DefaultUnits = {
	standard = {
		backlit_camera = "units/generic/backlit_camera",
		camera = "core/units/camera"
	}
}
local character_state_names = {}
local camera_state_names = {}

for index, profile in ipairs(SPProfiles) do
	local display_name = profile.display_name

	for slot_id, slot_data in pairs(profile.equipment_slots) do
		for other_slot_id, other_slot_data in pairs(profile.equipment_slots) do
			if other_slot_id ~= slot_id then
				assert(slot_data ~= other_slot_data, "Equipped the same item in two slots for profile %q (%s and %s)", class_name, slot_id, other_slot_id)
			end
		end
	end

	for i, career_settings in ipairs(profile.careers) do
		local character_state_list = table.clone(profile.base_character_states)
		local camera_state_list = table.clone(profile.base_camera_states)
		local additional_character_states_list = career_settings.additional_character_states_list

		if additional_character_states_list then
			for _, character_state_name in ipairs(additional_character_states_list) do
				character_state_list[#character_state_list + 1] = character_state_name
			end
		end

		local additional_camera_states_list = career_settings.additional_camera_states_list

		if additional_camera_states_list then
			for _, camera_state_name in ipairs(additional_camera_states_list) do
				camera_state_list[#camera_state_list + 1] = camera_state_name
			end
		end

		for _, character_state_name in ipairs(character_state_list) do
			fassert(character_state_names[character_state_name] == nil, "Character state '%s' referenced more than once in career - %s profile - %s", character_state_name, career_settings.display_name, profile.display_name)

			character_state_names[character_state_name] = true
		end

		for _, camera_state_name in ipairs(camera_state_list) do
			fassert(camera_state_names[camera_state_name] == nil, "Camera state '%s' referenced more than once in career - %s profile - %s", camera_state_name, career_settings.display_name, profile.display_name)

			camera_state_names[camera_state_name] = true
		end

		career_settings.character_state_list = character_state_list
		career_settings.camera_state_list = camera_state_list

		table.clear(character_state_names)
		table.clear(camera_state_names)
	end
end
