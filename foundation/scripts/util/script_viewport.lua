ScriptViewport = ScriptViewport or {}

ScriptViewport.active = function (viewport)
	return Viewport.get_data(viewport, "active")
end

ScriptViewport.camera = function (viewport)
	return Viewport.get_data(viewport, "camera")
end

ScriptViewport.shadow_cull_camera = function (viewport)
	return Viewport.get_data(viewport, "shadow_cull_camera")
end

return
