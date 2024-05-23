-- chunkname: @scripts/network/unit_extension_templates_vs.lua

local unit_templates_vs = {
	player_unit_dark_pact = {
		base_template = "player_unit_base",
		go_type = "player_unit",
		self_owned_extensions = {
			"DarkPactStatusExtension",
			"DialogueActorExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"PlayerUnitGhostModeExtension",
			"DarkPactPlayerOutlineExtension",
		},
		self_owned_extensions_server = {
			"DarkPactStatusExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"PlayerUnitGhostModeExtension",
			"DarkPactPlayerOutlineExtension",
		},
		husk_extensions = {
			"DarkPactStatusExtension",
			"DialogueActorExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"PlayerHuskGhostModeExtension",
			"DarkPactPlayerHuskOutlineExtension",
		},
		husk_extensions_server = {
			"DarkPactStatusExtension",
			"DialogueActorExtension",
			"HealthTriggerExtension",
			"GenericDialogueContextExtension",
			"PlayerProximityExtension",
			"SurroundingObserverExtension",
			"PlayerHuskGhostModeExtension",
			"DarkPactPlayerHuskOutlineExtension",
		},
	},
	versus_dark_pact_climbing_interaction_unit = {
		go_type = "versus_dark_pact_climbing_interaction_unit",
		self_owned_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension",
			"DarkPactClimbingExtension",
		},
		husk_extensions = {
			"GenericUnitInteractableExtension",
			"GenericOutlineExtension",
			"DarkPactClimbingExtension",
		},
	},
}

return unit_templates_vs
