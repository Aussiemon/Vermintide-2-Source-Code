-- chunkname: @scripts/ui/hint_ui/hint_ui_handler.lua

require("scripts/ui/hint_ui/hint_templates")
require("scripts/ui/hint_ui/hint_ui_versus_how_to_play")

HintUIHandler = class(HintUIHandler)

local function on_save_ended_callback()
	print("HintUIHandler - save done")
end

local function save(hint_key)
	local save_data = SaveData
	local viewed_hints = save_data.viewed_hints or {}

	viewed_hints[hint_key] = true
	save_data.viewed_hints = viewed_hints

	Managers.save:auto_save(SaveFileName, SaveData, on_save_ended_callback)
end

HintUIHandler.init = function (self, context)
	self._context = context
	self._hints = {}
	self._n_hints = 0
	self._hints_ids = 0
	self._active_hint_lookup = {}
	self._unseen_hints = {}

	self:parse_unseen_hints()
	Managers.state.event:register(self, "ui_show_hint", "ui_show_hint")
end

HintUIHandler.destroy = function (self)
	Managers.state.event:unregister("ui_show_popup", self)

	for i = 1, self._n_hints do
		local hint = self._hints[i]

		if hint then
			hint:destroy()

			self._hints[i] = nil
		end
	end
end

HintUIHandler.update = function (self, dt, t)
	self:_handle_condition_hints(dt, t)

	local hint = self._hints[self._n_hints]

	if not hint then
		return
	end

	hint:update(dt, t)

	if hint:exit_done() then
		local hint_name = hint:get_hint_name()
		local unseen_hint_index = self:get_unseen_hint_index(hint_name)

		hint:delete()

		self._hints[self._n_hints] = nil
		self._n_hints = self._n_hints - 1

		save(hint_name)
		table.swap_delete(self._unseen_hints, unseen_hint_index)

		self._active_hint_lookup[hint_name] = false
	end
end

HintUIHandler.queue_hint = function (self, ui_hint)
	local n_hints, hints = self._n_hints, self._hints

	n_hints = n_hints + 1
	self._n_hints = n_hints
	self._hints_ids = self._hints_ids + 1

	local hint_id = tostring(self._hints_ids)

	ui_hint.hint_id = hint_id

	if n_hints > 1 then
		local previous_hint_showing = hints[n_hints - 1]:is_hint_showing()

		if previous_hint_showing then
			table.insert(hints, 1, ui_hint)

			self._hints = hints

			return hint_id
		end
	end

	hints[n_hints] = ui_hint
	self._hints = hints

	return hint_id
end

HintUIHandler.ui_show_hint = function (self, hint_name)
	local hint_settings = HintTemplates[hint_name]

	if not hint_settings then
		printf("[HintUIHandler]No HintTemplate settings found for hint %q", hint_name)

		return
	end

	if not hint_settings.data.duration then
		printf("[HintUIHandler]No duration defined for hint %q, A duration must be set in the HintTemplates data", hint_name)

		return
	end

	self:new_hint(hint_name, hint_settings)
end

HintUIHandler.new_hint = function (self, hint_name, hint_settings)
	local hint_data = hint_settings.data
	local hint_class = rawget(_G, hint_data.class_name)
	local hint = hint_class:new(self._context, hint_name, hint_settings)

	self._active_hint_lookup[hint_name] = true

	self:queue_hint(hint)
end

HintUIHandler._handle_condition_hints = function (self, dt, t)
	for i = 1, #self._unseen_hints do
		local hint_name = self._unseen_hints[i]

		if not self._active_hint_lookup[hint_name] then
			local hint_template = HintTemplates[hint_name]
			local hint_data = hint_template.data

			if hint_template.condition_function(hint_data, dt, t) then
				self:new_hint(hint_name, hint_template)
			end
		end
	end
end

HintUIHandler.is_hint_active = function (self)
	local hint = self._hints[self._n_hints]
	local hint_active = hint and true or false

	return hint_active
end

HintUIHandler.parse_unseen_hints = function (self)
	table.clear(self._unseen_hints)

	for hint_name, hint_template in pairs(HintTemplates) do
		if (not SaveData.viewed_hints or not SaveData.viewed_hints[hint_name]) and hint_template.condition_function then
			self._unseen_hints[#self._unseen_hints + 1] = hint_name
		end
	end
end

HintUIHandler.get_unseen_hint_index = function (self, hint_name)
	for i = 1, #self._unseen_hints do
		local unseen_hint_name = self._unseen_hints[i]

		if hint_name == unseen_hint_name then
			return i
		end
	end
end
