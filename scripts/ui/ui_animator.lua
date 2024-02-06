-- chunkname: @scripts/ui/ui_animator.lua

UIAnimator = class(UIAnimator)

UIAnimator.init = function (self, ui_scenegraph, animation_definitions)
	self._ui_scenegraph = ui_scenegraph
	self._animation_definitions = animation_definitions
	self._active_animations = {}
	self._animation_id = 0
end

UIAnimator.start_animation = function (self, anim_name, widget, scenegraph_def, params, speed, initial_delay)
	local ui_scenegraph = self._ui_scenegraph
	local times = {}

	initial_delay = initial_delay or 0

	local anim_def = self._animation_definitions[anim_name]

	for i = 1, #anim_def do
		local anim = anim_def[i]

		anim.is_completed = nil

		anim.init(ui_scenegraph, scenegraph_def, widget, params)

		local t0, t1

		if anim.start_progress then
			t0, t1 = anim.start_progress, anim.end_progress
		else
			t0 = anim.delay or 0
			t1 = t0 + anim.duration
		end

		times[i * 2 - 1] = initial_delay + t0
		times[i * 2] = initial_delay + t1
	end

	local animation_id = self._animation_id + 1

	self._animation_id = animation_id
	self._active_animations[animation_id] = {
		time = 0,
		anim_name = anim_name,
		anim_def = anim_def,
		widget = widget,
		scenegraph_def = scenegraph_def,
		completed_animations = {},
		params = params or {},
		times = times,
	}

	return animation_id
end

UIAnimator.is_animation_completed = function (self, animation_id)
	return self._active_animations[animation_id] == nil
end

UIAnimator.stop_animation = function (self, animation_id)
	self._active_animations[animation_id] = nil
end

UIAnimator.update = function (self, dt)
	local ui_scenegraph = self._ui_scenegraph

	for name, data in pairs(self._active_animations) do
		if not data.completed then
			local widget = data.widget
			local scenegraph_def = data.scenegraph_def
			local params = data.params
			local completed_animations = data.completed_animations
			local times = data.times
			local time = data.time + dt

			data.time = time

			local all_done = true
			local anim_def = data.anim_def

			for i = 1, #anim_def do
				local anim = anim_def[i]
				local t0 = times[i * 2 - 1]
				local t1 = times[i * 2]

				if time < t1 then
					all_done = false
				end

				if t0 < time and not completed_animations[anim.name] then
					local p = (time - t0) / (t1 - t0)

					if p < 1 then
						anim.update(ui_scenegraph, scenegraph_def, widget, p, params)
					else
						anim.update(ui_scenegraph, scenegraph_def, widget, 1, params)
						anim.on_complete(ui_scenegraph, scenegraph_def, widget, params)

						completed_animations[anim.name] = true
					end
				end
			end

			if all_done then
				self._active_animations[name] = nil
			end
		end
	end
end
