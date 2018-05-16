SmoketestManager = class(SmoketestManager)

SmoketestManager.init = function (self)
	local enabled = Development.parameter("smoke-test")
	self.disabled = not enabled

	if enabled then
		print("[SmokeTest] Start")
	else
		print("[SmokeTest] Disabled")
	end
end

SmoketestManager.update = function (self, dt)
	if self.disabled then
		return
	end
end

SmoketestManager.report = function (self, report)
	if self.disabled then
		return
	end

	if report == "enter_ingame" then
		print("[smoke-test] Success")
		Application.quit()
	else
		print("[SmokeTest] Unknown report:" .. tostring(report))
	end
end

SmoketestManager.quit = function (self)
	return
end

return
