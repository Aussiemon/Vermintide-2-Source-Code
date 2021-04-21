local definitions = local_require("scripts/ui/views/deus_menu/deus_inspect_ui_definitions")
DeusInspectUI = class(DeusInspectUI)

DeusInspectUI.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}

	self:_create_ui_elements()
end

DeusInspectUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

DeusInspectUI.update = function (self, dt, t, input_service)
	self:_draw(dt, t, input_service)
end

DeusInspectUI._draw = function (self, dt, t, input_service)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)
end

DeusInspectUI.set_loadout = function (self, melee, ranged, healing_slot, potion_slot, grenade_slot)
	self._widgets_by_name.weapon_melee.content.item = melee
	self._widgets_by_name.weapon_ranged.content.item = ranged
	local healing_widget = self._widgets_by_name.healing_slot
	local potion_widget = self._widgets_by_name.potion_slot
	local grenade_widget = self._widgets_by_name.grenade_slot
	local healing_item = healing_slot and ItemMasterList[healing_slot]
	healing_widget.content.icon = (healing_item and healing_item.hud_icon) or "consumables_empty_medpack"
	healing_widget.content.title_text = (healing_item and Localize(healing_slot)) or Localize("deus_weapon_inspect_title_unavailable")
	healing_widget.content.info_text = (healing_item and Localize(healing_item.description)) or Localize("deus_weapon_inspect_info_unavailable")
	local potion_item = potion_slot and ItemMasterList[potion_slot]
	local potion_icon = "consumables_empty_potion"
	local potion_title_text = Localize("deus_weapon_inspect_title_unavailable")
	local potion_info_text = Localize("deus_weapon_inspect_info_unavailable")

	if potion_item then
		potion_icon = potion_item.hud_icon or potion_icon
		potion_title_text = Localize(potion_slot)
		potion_info_text = UIUtils.format_localized_description(potion_item.description, potion_item.description_values)
	end

	potion_widget.content.icon = potion_icon
	potion_widget.content.title_text = potion_title_text
	potion_widget.content.info_text = potion_info_text
	local grenade_item = grenade_slot and ItemMasterList[grenade_slot]
	grenade_widget.content.icon = (grenade_item and grenade_item.hud_icon) or "consumables_empty_grenade"
	grenade_widget.content.title_text = (grenade_item and Localize(grenade_slot)) or Localize("deus_weapon_inspect_title_unavailable")
	grenade_widget.content.info_text = (grenade_item and Localize(grenade_item.description)) or Localize("deus_weapon_inspect_info_unavailable")
end

return
