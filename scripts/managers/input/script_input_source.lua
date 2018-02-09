require("scripts/settings/script_input_settings")

ScriptInputSource = class(ScriptInputSource, InputSource)
ScriptInputSource.init = function (self, slot, mapping_template)
	ScriptInputSource.super.init(self, slot, mapping_template)

	self._active = false

	return 
end
ScriptInputSource.start = function (self, input_table, loop)
	self._input_settings = input_table
	self._input_settings_copy = table.clone(input_table)
	self._input = {}
	self._active = true
	self._active_time = 0
	self._loop = loop

	return 
end
ScriptInputSource.clear = function (self)
	ScriptInputSource.super.clear(self)

	self._active = false

	return 
end
ScriptInputSource.get = function (self, name)
	fassert(self.mapping_table, "Trying to access unmapped input source.")

	local input_desc = self.mapping_table[name]

	fassert(input_desc, "No input description for %q", name)

	local controller = self.controllers[input_desc.controller_type]

	fassert(controller, "No controller of type %q", input_desc.controller_type)
	fassert(input_desc.func, "No input_desc.func")

	return (self._active and self._input[name]) or ScriptInputSource.super.get(self, name)
end
ScriptInputSource.update = function (self, dt, t)
	if self._active then
		self._update_input(self, dt, t)
	end

	return 
end
ScriptInputSource._update_input = function (self, dt, t)
	local input = {}

	for i = #self._input_settings_copy, 1, -1 do
		local config = self._input_settings_copy[i]

		if config.start < self._active_time then
			local input_desc = self.mapping_table[config.name]

			if input_desc.func == "button" then
				input[config.name] = config.value or 1
			elseif input_desc.func == "pressed" or input_desc.func == "released" then
				input[config.name] = true
			elseif input_desc.func == "axis" then
				input[config.name] = Vector3(config.value[1], config.value[2], config.value[3])
			elseif input_desc.func == "filter" then
				input[config.name] = Vector3(config.value[1], config.value[2], config.value[3])
			end

			if not config.duration or config.start + config.duration < self._active_time then
				table.remove(self._input_settings_copy, i)
			end
		end
	end

	self._input = input
	self._active_time = self._active_time + dt

	if #self._input_settings_copy == 0 and self._loop then
		self.start(self, self._input_settings, true)
	end

	return 
end

return 
