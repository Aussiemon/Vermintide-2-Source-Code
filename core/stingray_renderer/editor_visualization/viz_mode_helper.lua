core = core or {}
core.vis_modes = core.vis_modes or {}

core.render_vis_on = function (settings)
	for _, viz_name in pairs(core.vis_modes) do
		Application.set_render_setting(viz_name, "false")
	end

	for render_setting, value in pairs(settings) do
		Application.set_render_setting(render_setting, tostring(value))
		print(render_setting .. ":" .. tostring(value))

		core.vis_modes[render_setting] = render_setting
	end
end
