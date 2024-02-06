﻿-- chunkname: @scripts/imgui/imgui_lua_scratchpad.lua

ImguiLuaScratchpad = class(ImguiLuaScratchpad)

local fallback_color = {
	199,
	206,
	234,
	255,
}

ImguiLuaScratchpad._TYPE_TO_COLOR = setmetatable({
	["function"] = {
		181,
		234,
		215,
		255,
	},
	string = {
		226,
		240,
		203,
		255,
	},
	number = {
		255,
		218,
		193,
		255,
	},
	boolean = {
		255,
		183,
		178,
		255,
	},
	userdata = {
		255,
		154,
		162,
		255,
	},
	table = {
		255,
		247,
		154,
		255,
	},
}, {
	__index = function ()
		return fallback_color
	end,
})

local has_util, util = pcall(require, "jit.util")
local magic_mt = {
	__mode = "kv",
	__index = function (t, fn)
		local i = util.funcinfo(fn)

		t[fn] = i

		return i
	end,
}
local format = string.format

ImguiLuaScratchpad.init = function (self)
	self._expr = ""
	self._thunk, self._error, self._val = nil
	self._func_info_magic = setmetatable({}, magic_mt)
	self._is_persistent = false
	self._sort_keys = false
end

ImguiLuaScratchpad.update = function (self)
	return
end

ImguiLuaScratchpad.draw = function (self)
	local do_close = Imgui.begin_window("Lua Inspector")

	self._is_persistent = Imgui.checkbox("Is persistent", self._is_persistent)

	Imgui.same_line()

	self._sort_keys = Imgui.checkbox("Sort keys (slow)", self._sort_keys)

	Imgui.same_line()

	self._exec_every_frame = Imgui.checkbox("Execute every frame", self._exec_every_frame or false)

	Imgui.same_line()

	if (self._exec_every_frame or Imgui.button("Execute")) and self:_load_expression() then
		self:_execute_thunk()
	end

	Imgui.same_line()

	if self._error then
		Imgui.text_colored(self._error, 255, 100, 100, 255)
	else
		Imgui.text_colored("Thunk loaded.", 100, 255, 100, 255)
	end

	local last_expr = self._expr

	self._expr = Imgui.input_text_multiline("Input", last_expr)

	if last_expr ~= self._expr then
		self:_load_expression()
	end

	Imgui.begin_child_window("Inspector", 0, 0, true)
	self:_inspect_pair("Output", self._val)
	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiLuaScratchpad._inspect_pair = function (self, k, v)
	k = tostring(k)

	local t = type(v)

	if t == "table" then
		return self:_inspect_table(k, v)
	elseif t == "function" then
		return self:_inspect_function(k, v)
	elseif t == "string" then
		v = ("%q"):format(v):gsub("\\\n", "\\n")
	end

	Imgui.text(k .. " =")
	Imgui.same_line()
	Imgui.text_colored(tostring(v), unpack(self._TYPE_TO_COLOR[t]))
end

local has_ffi, ffi, shell32 = pcall(require, "ffi")

if has_ffi then
	has_ffi, shell32 = pcall(ffi.load, "shell32")

	ffi.cdef(" void *ShellExecuteA(void*, const char*, const char*, const char*, const char*, int); ")
end

ImguiLuaScratchpad._inspect_function = function (self, name, func)
	local is_open = Imgui.tree_node(name, false)

	Imgui.same_line()
	Imgui.text_colored(format("[%s]", func), unpack(self._TYPE_TO_COLOR["function"]))

	if has_util and is_open then
		local info = self._func_info_magic[func]
		local is_file_func = info.source and not string.find(info.source, "\n")
		local where = is_file_func and format("%s:%s", info.source, info.linedefined) or info.addr and format("0x%012x", info.addr) or "<unknown origin>"

		Imgui.text_colored(where, unpack(fallback_color))

		if has_ffi and is_file_func then
			Imgui.same_line()

			if Imgui.small_button("Open##" .. info.source) then
				local base_path = script_data.source_dir
				local path = base_path .. info.source:gsub("^@", "\\"):gsub("/", "\\")

				printf("Opening %q", path)
				print(shell32.ShellExecuteA(nil, "open", path, nil, base_path, 10))
			end
		end

		self:_inspect_table("[info]", info)

		local upvals = info.upvalues

		if upvals > 0 and Imgui.tree_node("[upvalues]", false) then
			for up = 1, upvals do
				local k, v = debug.getupvalue(func, up)

				self:_inspect_pair(up .. " (" .. k .. ")", v)
			end

			Imgui.tree_pop()
		end

		if has_util and info.nconsts and info.nconsts ~= 0 and info.gcconsts ~= 0 and Imgui.tree_node("[consts]", false) then
			for i = -info.gcconsts, info.nconsts - 1 do
				self:_inspect_pair(i, util.funck(func, i))
			end

			Imgui.tree_pop()
		end

		Imgui.tree_pop()
	end
end

local function compare(a, b)
	local ta = type(a)
	local tb = type(b)

	if ta ~= tb then
		return ta < tb
	elseif ta == "string" or ta == "number" then
		return a < b
	else
		return tostring(a) < tostring(b)
	end
end

ImguiLuaScratchpad._inspect_table = function (self, name, tab)
	local is_open = Imgui.tree_node(name, false)
	local mt = getmetatable(tab)
	local class_name = rawget(tab, "___is_class_metatable___") and "class" or mt and mt ~= true and mt.___is_class_metatable___ and table.find(_G, mt) or "table"

	Imgui.same_line()
	Imgui.text_colored(format("[%s: %p]", class_name, tab), unpack(self._TYPE_TO_COLOR.table))

	if is_open then
		if self._sort_keys then
			local keys = table.keys(tab)

			table.sort(keys, compare)

			for _, k in pairs(keys) do
				self:_inspect_pair(k, tab[k])
			end
		else
			for k, v in pairs(tab) do
				self:_inspect_pair(k, v)
			end
		end

		if mt then
			self:_inspect_table("[metatable]", mt)
		end

		Imgui.tree_pop()
	end
end

ImguiLuaScratchpad._load_expression = function (self)
	self._thunk, self._error = loadstring("return " .. self._expr, "Input")

	if not self._thunk then
		self._thunk, self._error = loadstring(self._expr, "Input")
	end

	return self._thunk ~= nil
end

local function traceback_table(err)
	local stack = {}

	for i = 2, 9999 do
		local info = debug.getinfo(i, "nSluf")

		if not info then
			break
		end

		local slots, ups = {}, {}

		for j = 1, 9999 do
			local k, v = debug.getlocal(i, j)

			if not k then
				break
			end

			slots[k] = v
		end

		for j = 1, info.nups or 0 do
			local k, v = debug.getupvalue(info.func, j)

			if not k then
				break
			end

			ups[k] = v
		end

		stack[i - 1] = {
			name = info.name,
			info = info,
			slots = slots,
			ups = ups,
		}
	end

	return {
		error = err or "?",
		stack = stack,
	}
end

ImguiLuaScratchpad._execute_thunk = function (self)
	local ok, val = xpcall(self._thunk, traceback_table)

	if ok then
		self._val, self._error = val
	else
		self._val, self._error = val, "Runtime error"
	end
end

ImguiLuaScratchpad.is_persistent = function (self)
	return self._is_persistent
end
