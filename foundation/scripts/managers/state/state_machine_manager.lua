-- chunkname: @foundation/scripts/managers/state/state_machine_manager.lua

StateMachineManager = class(StateMachineManager)
StateMachineManager.DEBUG = false
StateMachineManager.FONT = "foundation/fonts/debug"
StateMachineManager.FONT_MATERIAL = "debug"
StateMachineManager.FONT_SIZE = 14

StateMachineManager.init = function (self)
	self._state_machines = {}
	self._world = nil
	self._gui = nil
	self._column1_width = 0
end

StateMachineManager.update = function (self, dt)
	if StateMachineManager.DEBUG then
		if self._world == nil then
			self._world = Application.debug_world()

			if self._world ~= nil then
				self._gui = World.create_screen_gui(self._world, "immediate", "material", StateMachineManager.FONT)
			end
		end

		if self._gui then
			self:_draw_panel()
		end
	end
end

StateMachineManager.destroy = function (self)
	if StateMachineManager.DEBUG and self._gui ~= nil then
		World.destroy_gui(self._world, self._gui)

		self._gui = nil
	end
end

StateMachineManager._register_state_machine = function (self, state_machine)
	self._state_machines[#self._state_machines + 1] = state_machine
end

StateMachineManager._unregister_state_machine = function (self, state_machine)
	local index = table.find(self._state_machines, state_machine)

	assert(index, "unregister a state machine " .. state_machine._name .. " that was not registered")
	table.remove(self._state_machines, index)
end

StateMachineManager._root_state_machines = function (self)
	local result = {}

	for _, state_machine in ipairs(self._state_machines) do
		if state_machine._state_machine_stack[1] == state_machine then
			result[#result + 1] = state_machine
		end
	end

	return result
end

StateMachineManager._state_machines_column_width = function (self, state_machines)
	local width = 0

	for _, state_machine in ipairs(state_machines) do
		local min, max = Gui.text_extents(self._gui, state_machine._name, StateMachineManager.FONT, StateMachineManager.FONT_SIZE)
		local text_width = max.x - min.x

		width = math.max(text_width, width)
	end

	return width
end

StateMachineManager._draw_panel = function (self)
	local width, height = Gui.resolution()
	local column_margin = 16
	local text_margin = 4
	local root_state_machines = self:_root_state_machines()
	local column1_width = self:_state_machines_column_width(root_state_machines) + 2 * text_margin

	self._column1_width = math.max(column1_width, self._column1_width)

	Gui.rect(self._gui, Vector2(column_margin, column_margin), Vector2(self._column1_width, height - 2 * column_margin), Color(64, 0, 0, 0))

	local x = column_margin
	local y = height - column_margin

	for _, state_machine in ipairs(root_state_machines) do
		Gui.text(self._gui, state_machine._name, StateMachineManager.FONT, StateMachineManager.FONT_SIZE, StateMachineManager.FONT_MATERIAL, Vector3(x + text_margin, y - StateMachineManager.FONT_SIZE, 0))

		y = y - StateMachineManager.FONT_SIZE
	end
end
