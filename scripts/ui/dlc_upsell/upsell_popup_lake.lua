local_require("scripts/ui/dlc_upsell/upsell_popup")

local definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_lake_definitions")
UpsellPopupLake = class(UpsellPopupLake, UpsellPopup)

UpsellPopupLake.init = function (self, ui_context, dlc_name)
	UpsellPopupLake.super.init(self, ui_context, dlc_name)
end

UpsellPopupLake.show = function (self)
	local parent_show = UpsellPopupLake.super.show(self)

	if parent_show then
		self:start_transition_animation("on_show", "transition_enter")
	end
end

UpsellPopupLake.get_definitions = function (self)
	return definitions
end

UpsellPopupLake.create_ui_elements = function (self)
	UpsellPopupLake.super.create_ui_elements(self)

	local widgets_by_name = self.widgets_by_name
	self.ok_button = widgets_by_name.ok_button
	self.store_button = widgets_by_name.store_button
end

UpsellPopupLake.handle_input = function (self, dt)
	local input_service = self:input_service()

	UpsellPopupLake.super.handle_input(self, dt)

	if UIUtils.is_button_pressed(self.ok_button) or input_service:get("back", true) then
		self:hide()

		return
	end

	if UIUtils.is_button_pressed(self.store_button) or input_service:get("confirm_press", true) then
		self:show_store()

		return
	end
end

UpsellPopupLake.update_animations = function (self, dt)
	UpsellPopupLake.super.update_animations(self, dt)
	UIWidgetUtils.animate_default_button(self.ok_button, dt)
	UIWidgetUtils.animate_default_button(self.store_button, dt)
end

return
