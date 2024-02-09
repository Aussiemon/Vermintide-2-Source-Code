-- chunkname: @scripts/settings/dlcs/carousel/carousel_game_object_initializers.lua

local settings = DLCSettings.carousel

settings.game_object_initializers = {}
settings.game_object_extractors = {}

local game_object_initializers = settings.game_object_initializers
local game_object_extractors = settings.game_object_extractors

game_object_initializers.versus_dark_pact_climbing_interaction_unit = function (unit, unit_name, unit_template, gameobject_functor_context)
	local extension = ScriptUnit.extension(unit, "nav_graph_system")
	local data_table = {
		go_type = NetworkLookup.go_types.versus_dark_pact_climbing_interaction_unit,
		husk_unit = NetworkLookup.husks[unit_name],
		position = Unit.local_position(unit, 0),
		rotation = Unit.local_rotation(unit, 0),
		smart_object_index = extension.smart_object_index,
		swap = extension.swap,
	}

	return data_table
end

game_object_extractors.versus_dark_pact_climbing_interaction_unit = function (game_session, go_id, owner_id, unit, gameobject_functor_context)
	local smart_object_index = GameSession.game_object_field(game_session, go_id, "smart_object_index")
	local swap = GameSession.game_object_field(game_session, go_id, "swap")
	local extension_init_data = {
		nav_graph_system = {
			smart_object_index = smart_object_index,
			swap = swap,
		},
	}
	local unit_template_name = "versus_dark_pact_climbing_interaction_unit"

	return unit_template_name, extension_init_data
end
