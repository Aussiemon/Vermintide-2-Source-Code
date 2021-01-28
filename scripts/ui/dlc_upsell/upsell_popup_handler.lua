require("scripts/ui/dlc_upsell/upsell_popup_settings")
require("scripts/ui/dlc_upsell/upsell_popup")

UpsellPopupHandler = class(UpsellPopupHandler)

UpsellPopupHandler.init = function (self, context)
	self._context = context

	Managers.state.event:register(self, "ui_dlc_upsell", "ui_dlc_upsell")
end

UpsellPopupHandler.destroy = function (self)
	Managers.state.event:unregister("ui_dlc_upsell", self)

	if self._ui_popup then
		self._ui_popup:destroy()

		self._ui_popup = nil
	end
end

UpsellPopupHandler.update = function (self, dt, t)
	local popup = self._ui_popup

	if not popup then
		return
	end

	popup:update(dt)

	if popup:exit_done() then
		popup:delete()

		self._ui_popup = nil
	end
end

UpsellPopupHandler.ui_dlc_upsell = function (self, dlc_name)
	if self._ui_popup then
		return
	end

	if Managers.unlock:is_dlc_unlocked(dlc_name) then
		printf("DLC %q already unlocked. Skipping upsell.", dlc_name)

		return
	end

	local popup_settings = UpsellPopupSettings[dlc_name]

	if not popup_settings then
		printf("No upsell popup settings for DLC %q", dlc_name)

		return
	end

	local popup_class = _G[popup_settings.class_name]
	self._ui_popup = popup_class:new(self._context, dlc_name, popup_settings)

	self._ui_popup:show()
end

return
