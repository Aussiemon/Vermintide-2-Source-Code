require("scripts/ui/dlc_upsell/common_popup_settings")
require("scripts/ui/dlc_upsell/unlock_reminder_popup")
require("scripts/ui/dlc_upsell/upsell_popup")

CommonPopupHandler = class(CommonPopupHandler)

CommonPopupHandler.init = function (self, context)
	self._context = context
	self._popups = {}
	self._n_popups = 0
	self._popup_ids = 0

	Managers.state.event:register(self, "ui_show_popup", "ui_show_popup")
end

CommonPopupHandler.destroy = function (self)
	Managers.state.event:unregister("ui_show_popup", self)

	for i = 1, self._n_popups, 1 do
		local popup = self._popups[i]

		if popup then
			popup:destroy()

			self._popups[i] = nil
		end
	end
end

CommonPopupHandler.update = function (self, dt, t)
	local popup = self._popups[self._n_popups]

	if not popup then
		return
	end

	local managers_state = Managers.state

	if managers_state and managers_state.voting:vote_in_progress() and Managers.popup:has_popup() then
		popup:hide()

		return
	end

	popup:update(dt)

	if popup:exit_done() then
		popup:delete()

		self._popups[self._n_popups] = nil
		self._n_popups = self._n_popups - 1
	end
end

CommonPopupHandler.queue_popup = function (self, ui_popup)
	local n_popups = self._n_popups
	local popups = self._popups
	n_popups = n_popups + 1
	self._n_popups = n_popups
	self._popup_ids = self._popup_ids + 1
	local popup_id = tostring(self._popup_ids)
	ui_popup.popup_id = popup_id
	popups[n_popups] = ui_popup
	self._popups = popups

	return popup_id
end

CommonPopupHandler.ui_show_popup = function (self, dlc_name, type)
	local popup_settings = CommonPopupSettings[dlc_name]

	if not popup_settings then
		printf("No popup settings for DLC %q", dlc_name)

		return
	end

	if popup_settings.popup_type == type then
		self:new_popup(dlc_name, popup_settings)

		return
	end
end

CommonPopupHandler.new_popup = function (self, dlc_name, popup_settings)
	local popup_class = rawget(_G, popup_settings.class_name)
	local popup = popup_class:new(self._context, dlc_name, popup_settings)

	self:queue_popup(popup)
end

return
