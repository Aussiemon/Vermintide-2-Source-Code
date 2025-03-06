-- chunkname: @scripts/ui/views/show_cursor_stack.lua

ShowCursorStack = ShowCursorStack or {
	stack_depth = 0,
	reasons = {},
}

local set_clip_cursor = Window.set_clip_cursor

ShowCursorStack.render_cursor = function (allow_cursor_rendering)
	ShowCursorStack.allow_cursor_rendering = allow_cursor_rendering

	if ShowCursorStack.stack_depth > 0 then
		local is_fullscreen = Application.is_fullscreen and Application.is_fullscreen()

		Window.set_show_cursor(allow_cursor_rendering)
		set_clip_cursor(not allow_cursor_rendering or is_fullscreen)
	end
end

ShowCursorStack.push = function (skip_error)
	if ShowCursorStack.stack_depth == 0 and ShowCursorStack.allow_cursor_rendering then
		local is_fullscreen = Application.is_fullscreen and Application.is_fullscreen()

		Window.set_show_cursor(true)
		set_clip_cursor(is_fullscreen or false)
	end

	ShowCursorStack.stack_depth = ShowCursorStack.stack_depth + 1
end

ShowCursorStack.pop = function (skip_error)
	ShowCursorStack.stack_depth = ShowCursorStack.stack_depth - 1

	if ShowCursorStack.stack_depth < 0 and IS_WINDOWS then
		print("[ShowCursorStack.pop()] Trying to pop a cursor stack that doesn't exist.")
		Crashify.print_exception("ShowCursorStack", "Trying to pop a cursor stack that doesn't exist.")
	end

	if ShowCursorStack.stack_depth == 0 then
		Window.set_show_cursor(false)
		set_clip_cursor(true)
	end

	ShowCursorStack.stack_depth = math.max(ShowCursorStack.stack_depth, 0)
end

ShowCursorStack.show = function (reason)
	local was_visible = not table.is_empty(ShowCursorStack.reasons)

	ShowCursorStack.reasons[reason] = true

	if not was_visible then
		ShowCursorStack.push(true)
	end
end

ShowCursorStack.hide = function (reason)
	local was_visible = not table.is_empty(ShowCursorStack.reasons)

	ShowCursorStack.reasons[reason] = nil

	if was_visible and table.is_empty(ShowCursorStack.reasons) then
		ShowCursorStack.pop(true)
	end
end

ShowCursorStack.update_clip_cursor = function ()
	local is_fullscreen = Application.is_fullscreen and Application.is_fullscreen()
	local allow_cursor_rendering = ShowCursorStack.allow_cursor_rendering

	if ShowCursorStack.stack_depth == 0 and allow_cursor_rendering then
		set_clip_cursor(is_fullscreen or false)
	elseif ShowCursorStack.stack_depth > 0 then
		set_clip_cursor(is_fullscreen)
	end
end

ShowCursorStack.cursor_active = function ()
	return ShowCursorStack.stack_depth > 0
end

ShowCursorStack.dump = function ()
	local out = {}

	table.insert(out, "Stack size: " .. ShowCursorStack.stack_depth)
	table.insert(out, "Reasons:" .. (table.is_empty(ShowCursorStack.reasons) and " (none)" or ""))

	for reason in pairs(ShowCursorStack.reasons) do
		table.insert(out, "\t" .. reason)
	end

	print(table.concat(out, "\n"))
end
