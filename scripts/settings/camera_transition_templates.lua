require("scripts/settings/player_movement_settings")

CameraTransitionTemplates = CameraTransitionTemplates or {}
CameraTransitionSettings = CameraTransitionSettings or {}
CameraTransitionSettings.perspective_transition_time = 0.6
local DURATION = 0.3
CameraTransitionTemplates.instant_cut = {}
CameraTransitionTemplates.dead = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = CameraTransitionSettings.perspective_transition_time,
		transition_func = function (t)
			return math.sin(t*0.5*math.pi)*0.8 + 0.2
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = CameraTransitionSettings.perspective_transition_time*0.8
	}
}
CameraTransitionTemplates.reviving = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = CameraTransitionSettings.perspective_transition_time,
		transition_func = function (t)
			return math.sin(t*0.5*math.pi)*0.8 + 0.2
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = CameraTransitionSettings.perspective_transition_time*0.8
	}
}
CameraTransitionTemplates.first_person = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = CameraTransitionSettings.perspective_transition_time,
		transition_func = function (t)
			return t^2*0.8
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = CameraTransitionSettings.perspective_transition_time*0.8
	}
}
CameraTransitionTemplates.over_shoulder = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = DURATION,
		transition_func = function (t)
			return math.sin(t*0.5*math.pi)
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = DURATION*0.05
	},
	vertical_fov = {
		parameter = "vertical_fov",
		class = "CameraTransitionGeneric",
		duration = DURATION,
		transition_func = function (t)
			return math.smoothstep(t, 0, 1)
		end
	}
}
CameraTransitionTemplates.grabbed_by_chaos_spawn = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = DURATION,
		transition_func = function (t)
			return math.sin(t*0.25*math.pi)
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = DURATION*0.05
	},
	vertical_fov = {
		parameter = "vertical_fov",
		class = "CameraTransitionGeneric",
		duration = DURATION,
		transition_func = function (t)
			return math.smoothstep(t, 0, 1)
		end
	}
}
CameraTransitionTemplates.zoom = {
	position = {
		class = "CameraTransitionPositionLinear",
		duration = DURATION,
		transition_func = function (t)
			return math.sin(t*0.5*math.pi)
		end
	},
	rotation = {
		class = "CameraTransitionRotationLerp",
		duration = DURATION*0.05
	},
	vertical_fov = {
		parameter = "vertical_fov",
		class = "CameraTransitionGeneric",
		duration = DURATION,
		transition_func = function (t)
			return math.smoothstep(t, 0, 1)
		end
	}
}

return 
