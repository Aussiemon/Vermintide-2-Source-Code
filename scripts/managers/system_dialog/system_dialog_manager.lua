SystemDialogManager = class(SystemDialogManager)

local function dprint(...)
	print("[SystemDialogManager]", ...)

	return 
end

SystemDialogManager.init = function (self)
	self._dialogs = {}

	return 
end
SystemDialogManager.destroy = function (self)
	return 
end
SystemDialogManager.update = function (self, dt)
	self._handle_dialogs(self)

	return 
end
SystemDialogManager.check_status = function (self, dialog_instance)
	local data = nil

	if 0 < #self._dialogs then
		data = self._dialogs[1]
	end

	local status = nil

	if data then
		status = self._get_status(self, dialog_instance)
	end

	return status
end
SystemDialogManager._get_status = function (self, dialog_instance)
	local status = dialog_instance.update()

	return status
end
SystemDialogManager._initialize = function (self, dialog_instance)
	local result = dialog_instance.initialize()

	if result ~= PS4.SCE_OK then
		dprint("Failed to initialize " .. dialog_instance._name)

		return 
	end

	return true
end
SystemDialogManager._terminate = function (self, dialog_instance)
	local result = dialog_instance.terminate()

	if result ~= PS4.SCE_OK then
		dprint("Failed to terminate " .. dialog_instance._name)

		return 
	end

	return true
end
SystemDialogManager._handle_dialogs = function (self)
	local data = nil

	if 0 < #self._dialogs then
		data = self._dialogs[1]
	end

	if data then
		local dialog_instance = data.dialog_instance
		local status = self._get_status(self, dialog_instance)

		if status == dialog_instance.NONE then
			self._initialize(self, dialog_instance)
		elseif status == dialog_instance.INITIALIZED then
			local result = data.open(data)

			if result then
				if result == PS4.SCE_OK then
					dprint("Opened dialog")
				else
					dprint("Failed to open dialog")
				end
			end
		elseif status == dialog_instance.RUNNING then
		elseif status == dialog_instance.FINISHED then
			if data.callback then
				data.callback(status)
			end

			if self._terminate(self, dialog_instance) then
				table.remove(self._dialogs, 1)
			end
		end
	end

	return 
end
SystemDialogManager.open_system_dialog = function (self, message, user_id)
	local function open(data)
		local dialog_instance = data.dialog_instance

		dprint("open_system_dialog", unpack(data.params))

		return dialog_instance.open(unpack(data.params))
	end

	local params = {
		message,
		user_id
	}
	self._dialogs[#self._dialogs + 1] = {
		dialog_instance = MsgDialog,
		params = params,
		open = open
	}

	return 
end
SystemDialogManager.open_save_dialog = function (self, required_blocks)
	local function open(data)
		local dialog_instance = data.dialog_instance

		dprint("open_save_dialog", data.required_blocks)

		return dialog_instance.open(data.required_blocks)
	end

	self._dialogs[#self._dialogs + 1] = {
		dialog_instance = SaveSystemDialog,
		required_blocks = required_blocks,
		open = open
	}

	return 
end
SystemDialogManager.open_commerce_dialog = function (self, mode, user_id, targets)
	local function open(data)
		local dialog_instance = data.dialog_instance
		local targets = data.targets

		dprint("open_commerce_dialog", mode, user_id, targets and unpack(targets))

		return dialog_instance.open2(data.mode, data.user_id, targets and unpack(targets))
	end

	self._dialogs[#self._dialogs + 1] = {
		dialog_instance = NpCommerceDialog,
		mode = mode,
		user_id = user_id,
		targets = targets,
		open = open
	}

	return 
end
SystemDialogManager.open_error_dialog = function (self, error_code, callback)
	local function open(data)
		local dialog_instance = data.dialog_instance

		dprint("open_error_dialog", data.error_code)

		return dialog_instance.open(data.error_code)
	end

	self._dialogs[#self._dialogs + 1] = {
		dialog_instance = ErrorDialog,
		error_code = error_code,
		open = open,
		callback = callback
	}

	return 
end

return 
