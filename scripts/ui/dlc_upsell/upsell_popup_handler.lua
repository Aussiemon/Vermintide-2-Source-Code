require("scripts/ui/dlc_upsell/upsell_popup_settings")
local_require("scripts/ui/dlc_upsell/upsell_popup_scorpion")
local_require("scripts/ui/dlc_upsell/upsell_popup_lake")

UpsellPopupHandler = class(UpsellPopupHandler)

UpsellPopupHandler.init = function (self, context)
	self._context = context

	self:register_events()
end

UpsellPopupHandler.destroy = function (self)
	self:unregister_events()

	if self.ui_popup then
		self.ui_popup:destroy()

		self.ui_popup = nil
	end
end

UpsellPopupHandler.update = function (self, dt, t)
	if self.ui_popup then
		local popup = self.ui_popup

		popup:update(dt)

		if popup:exit_done() then
			popup:destroy()

			self.ui_popup = nil
		end
	end
end

UpsellPopupHandler.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "ui_dlc_upsell", "ui_dlc_upsell")
	end
end

UpsellPopupHandler.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("ui_dlc_upsell", self)
	end
end

UpsellPopupHandler.ui_dlc_upsell = function (self, dlc_name)
	if self.ui_popup then
		return
	end

	if Managers.unlock:is_dlc_unlocked(dlc_name) then
		print("DLC " .. dlc_name .. " is already unlocked. Skipping upsell...")

		return
	end

	local popup_settings = dlc_name and UpsellPopupSettings[dlc_name]

	if not popup_settings then
		print("No upsell message for DLC " .. dlc_name)

		return
	end

	local popup_class = rawget(_G, popup_settings.class_name)

	if popup_class then
		self.ui_popup = popup_class:new(self._context, dlc_name)
	else
		print("Invalid popup class for DLC " .. dlc_name)
	end

	if self.ui_popup then
		self.ui_popup:show()
	end
end

return
