UIAnimator = class(UIAnimator)
UIAnimator.init = function (self, ui_scenegraph, animation_definitions)
	self.ui_scenegraph = ui_scenegraph
	self.animation_definitions = animation_definitions
	self.active_animations = {}
	self.animation_id = 0

	return 
end
UIAnimator.start_animation = function (self, animation_sequence_name, widget, scenegraph_definition, params, speed)
	local animation_sequence = self.animation_definitions[animation_sequence_name]
	local ui_scenegraph = self.ui_scenegraph

	for i = 1, #animation_sequence, 1 do
		local animation = animation_sequence[i]
		animation.is_completed = nil

		animation.init(ui_scenegraph, scenegraph_definition, widget, params)
	end

	local animation_id = self.animation_id + 1
	self.animation_id = animation_id
	self.active_animations[animation_id] = {
		time = 0,
		animation_sequence_name = animation_sequence_name,
		widget = widget,
		scenegraph_definition = scenegraph_definition,
		completed_animations = {},
		params = params or {},
		times = {}
	}

	if speed == 0 then
		speed = 1e-06
	end

	local times = self.active_animations[animation_id].times

	for i = 1, #animation_sequence, 1 do
		local animation = animation_sequence[i]

		if animation.start_relative_to then
			local relative_animation_index = animation.start_relative_to

			assert(animation.start_relative_to < i)

			local relative_animation_end = times[(relative_animation_index - 1)*2 + 2]
			local duration = animation.duration/((animation.scale_duration_by_speed and speed) or 1)
			local start_progress_new = relative_animation_end + animation.start_relative_time_offset
			local end_progress_new = start_progress_new + duration
			times[(i - 1)*2 + 1] = start_progress_new
			times[(i - 1)*2 + 2] = end_progress_new
		elseif animation.scale_duration_by_speed then
			local duration = (animation.end_progress - animation.start_progress)/((animation.scale_duration_by_speed and speed) or 1)
			times[(i - 1)*2 + 1] = animation.start_progress
			times[(i - 1)*2 + 2] = animation.start_progress + duration
		else
			times[(i - 1)*2 + 1] = animation.start_progress
			times[(i - 1)*2 + 2] = animation.end_progress
		end
	end

	return animation_id
end
UIAnimator.stop_animation = function (self, animation_id)
	self.active_animations[animation_id] = nil

	return 
end
UIAnimator.update = function (self, dt)
	local ui_scenegraph = self.ui_scenegraph

	for name, data in pairs(self.active_animations) do
		if not data.completed then
			local animation_sequence_name = data.animation_sequence_name
			local widget = data.widget
			local scenegraph_definition = data.scenegraph_definition
			local completed_animations = data.completed_animations
			local times = data.times
			local params = data.params
			local time = data.time + dt
			data.time = time
			local all_done = true
			local animation_sequence = self.animation_definitions[animation_sequence_name]

			for i = 1, #animation_sequence, 1 do
				local lol = math.random()
				local animation = animation_sequence[i]
				local start_progress = times[(i - 1)*2 + 1]
				local end_progress = times[(i - 1)*2 + 2]

				if time < end_progress then
					all_done = false
				end

				if start_progress < time and not completed_animations[animation.name] then
					local local_progress = (time - start_progress)/(end_progress - start_progress)

					if 1 <= local_progress then
						local_progress = 1
					end

					animation.update(ui_scenegraph, scenegraph_definition, widget, local_progress, params)

					if local_progress == 1 then
						animation.on_complete(ui_scenegraph, scenegraph_definition, widget, params)

						completed_animations[animation.name] = true
					end
				end
			end

			if all_done then
				self.active_animations[name] = nil
			end
		end
	end

	return 
end
UIAnimator.is_animation_completed = function (self, animation_id)
	return self.active_animations[animation_id] == nil
end

return 
