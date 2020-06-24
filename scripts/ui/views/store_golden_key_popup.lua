local definitions = dofile("scripts/ui/views/store_golden_key_popup_definitions")
local widget_definitions = definitions.widget_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StoreGoldenKeyPopup = class(StoreGoldenKeyPopup)

StoreGoldenKeyPopup.init = function (self, parent, ui_renderer)
	self._parent = parent
	self._ui_renderer = ui_renderer
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = false
	}
	self._pending = false
	self._is_complete = false
	self._coupon_code = ""

	self:_create_ui_elements()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	self:_play_animation("on_enter")

	self._widgets_by_name.text_input.content.active = true
end

StoreGoldenKeyPopup._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

StoreGoldenKeyPopup.update = function (self, input_service, dt, t)
	local pending = self._pending
	self._widgets_by_name.button_ok.content.button_hotspot.disable_button = pending or self._coupon_code == ""
	self._widgets_by_name.text_input.content.active = not pending

	self:_update_animations(dt)
	self:_draw(input_service, dt, t)
	self:_handle_input(input_service, dt, t)
end

StoreGoldenKeyPopup._play_animation = function (self, name)
	return self._ui_animator:start_animation(name, self._widgets_by_name, self._scenegraph_definition, self._render_settings)
end

StoreGoldenKeyPopup._update_animations = function (self, dt)
	UIWidgetUtils.animate_default_button(self._widgets_by_name.button_ok, dt)
	self._ui_animator:update(dt)

	if self._anim_close and self._ui_animator:is_animation_completed(self._anim_close) then
		self._is_complete = true
	end
end

StoreGoldenKeyPopup._is_button_pressed = function (self, widget)
	local hotspot = widget.content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreGoldenKeyPopup._is_button_hover_enter = function (self, widget)
	return widget.content.button_hotspot.on_hover_enter
end

StoreGoldenKeyPopup.cb_redeem_coupon_success = function (self, items)
	for i = 1, #items, 1 do
		local item = items[i]

		print("Redeemed " .. tostring(item.key))
		self._parent:enqueue_acquired_product({
			type = "item",
			item = item,
			product_id = item.key
		})
	end

	self._is_complete = true
	self._pending = false
end

StoreGoldenKeyPopup.cb_redeem_coupon_failure = function (self, error_code, error_message)
	self:_play_sound("player_combat_weapon_grenade_explosion")

	local content = self._widgets_by_name.label_error.content
	content.show_error = true
	content.text = string.format("%s\n(%04d - %s)", Localize("menu_store_purchase_confirmation_denied"), error_code, error_message)
	self._pending = false
end

StoreGoldenKeyPopup._redeem_coupon = function (self, coupon_code, t)
	self._widgets_by_name.label_error.content.show_error = false
	self._pending = true

	Managers.backend:get_interface("peddler"):redeem_coupon(string.lower(coupon_code), callback(self, "cb_redeem_coupon_success"), callback(self, "cb_redeem_coupon_failure"))
end

StoreGoldenKeyPopup._handle_input = function (self, input_service, dt, t)
	local widgets_by_name = self._widgets_by_name
	local button_close = widgets_by_name.button_close
	local button_ok = widgets_by_name.button_ok

	if self:_is_button_hover_enter(button_close) or self:_is_button_hover_enter(button_ok) then
		self:_play_sound("Play_hud_hover")
	end

	local text_input = widgets_by_name.text_input.content

	if text_input.active then
		self._coupon_code = text_input.input
		local cos_pit = math.cos(3.14 * t)
		widgets_by_name.text_input.style.text.caret_color[1] = 255 * math.clamp(cos_pit * cos_pit, 0, 1)
	end

	if self:_is_button_pressed(button_close) or input_service:get("toggle_menu", true) then
		self:_play_sound("Play_hud_select")

		self._anim_close = self:_play_animation("on_exit")
	end

	if self:_is_button_pressed(button_ok) then
		self:_play_sound("Play_hud_store_button_buy")
		self:_redeem_coupon(self._coupon_code, t)
	end
end

StoreGoldenKeyPopup._draw = function (self, input_service, dt, t)
	local ui_renderer = self._ui_renderer

	UIRenderer.begin_pass(ui_renderer, self._ui_scenegraph, input_service, dt, nil, self._render_settings)

	local widget_list = self._widgets

	for i = 1, #widget_list, 1 do
		UIRenderer.draw_widget(ui_renderer, widget_list[i])
	end

	UIRenderer.end_pass(ui_renderer)
end

StoreGoldenKeyPopup._play_sound = function (self, event)
	return self._parent:play_sound(event)
end

StoreGoldenKeyPopup.is_complete = function (self)
	return self._is_complete
end

return
