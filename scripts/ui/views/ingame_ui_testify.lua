local IngameUITestify = {}

IngameUITestify.transition_with_fade = function (ingame_ui, params)
	ingame_ui:transition_with_fade(params.transition, params.transition_params)
end

return IngameUITestify
