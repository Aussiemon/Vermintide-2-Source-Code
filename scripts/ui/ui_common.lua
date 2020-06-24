NOP = NOP or function ()
	return
end
FAKE_INPUT_SERVICE = {
	get = NOP,
	has = NOP
}
UICommon = UICommon or {}

UICommon.align = function (alignment, position, offset)
	if alignment == "right" or alignment == "top" then
		position = position + offset
	elseif alignment == "center" then
		position = position + 0.5 * offset
	end

	return position
end

UICommon.create_widgets = function (widget_definitions)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	return widgets, widgets_by_name
end

return
