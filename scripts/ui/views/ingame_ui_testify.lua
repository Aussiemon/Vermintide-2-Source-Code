local IngameUITestify = {
	transition_with_fade = function (params, ingame_ui)
		ingame_ui:transition_with_fade(params.transition, params.transition_params)
	end
}

return IngameUITestify
