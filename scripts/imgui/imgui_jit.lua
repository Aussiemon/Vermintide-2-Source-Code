-- chunkname: @scripts/imgui/imgui_jit.lua

local jopt, format = require("jit.opt").start, string.format

ImguiJIT = class(ImguiJIT)

ImguiJIT.init = function (self)
	if not self._bytes then
		self._bytes = {
			d = 0,
			n = 240,
		}

		local seed = collectgarbage("count")

		for i = 1, self._bytes.n do
			self._bytes[i] = seed
		end
	end

	if not self._root_path then
		self._root_path = ""
		self._snapshot_data = nil
		self._memory_layout_name_max_size = 0
	end

	self._gc = {
		{
			d = "The garbage-collector pause controls how long the collector waits before starting a new cycle.",
			k = "setpause",
			v = 200,
		},
		{
			d = "The step multiplier controls the relative speed of the collector relative to memory allocation.",
			k = "setstepmul",
			v = 200,
		},
	}
	self._gc_state = "running"
	self._opts = {
		{
			k = "fold",
			v = true,
		},
		{
			k = "cse",
			v = true,
		},
		{
			k = "dce",
			v = true,
		},
		{
			k = "fwd",
			v = true,
		},
		{
			k = "dse",
			v = true,
		},
		{
			k = "narrow",
			v = true,
		},
		{
			k = "loop",
			v = true,
		},
		{
			k = "abc",
			v = true,
		},
		{
			k = "sink",
			v = true,
		},
		{
			k = "fuse",
			v = true,
		},
	}
	self._params = {
		{
			d = "Max. # of traces in cache.",
			k = "maxtrace",
			v = 8000,
		},
		{
			d = "Max. # of recorded IR instructions.",
			k = "maxrecord",
			v = 16000,
		},
		{
			d = "Max. # of IR constants of a trace.",
			k = "maxirconst",
			v = 500,
		},
		{
			d = "Max. # of side traces of a root trace.",
			k = "maxside",
			v = 100,
		},
		{
			d = "Max. # of snapshots for a trace.",
			k = "maxsnap",
			v = 500,
		},
		{
			d = "Min. # of IR ins for a stitched trace.",
			k = "minstitch",
			v = 3,
		},
		{
			d = "# of iter. to detect a hot loop/call.",
			k = "hotloop",
			v = 56,
		},
		{
			d = "# of taken exits to start a side trace.",
			k = "hotexit",
			v = 10,
		},
		{
			d = "# of attempts to compile a side trace.",
			k = "tryside",
			v = 4,
		},
		{
			d = "Max. unroll for instable loops.",
			k = "instunroll",
			v = 4,
		},
		{
			d = "Max. unroll for loop ops in side traces.",
			k = "loopunroll",
			v = 15,
		},
		{
			d = "Max. unroll for recursive calls.",
			k = "callunroll",
			v = 3,
		},
		{
			d = "Min. unroll for true recursion.",
			k = "recunroll",
			v = 2,
		},
		{
			d = "Size of each machine code area (in KBytes).",
			k = "sizemcode",
			v = 64,
		},
		{
			d = "Max. total size of all machine code areas (in KBytes).",
			k = "maxmcode",
			v = 40960,
		},
	}
	self._enabled = jit.status()

	local traces = {}

	self._traces = traces
end

local DO_RELOAD = true

ImguiJIT.update = function (self)
	if DO_RELOAD then
		DO_RELOAD = self:init()
	end
end

local function tooltip(text, key)
	if Imgui.is_item_hovered() then
		Imgui.begin_tool_tip()

		if key then
			Imgui.text_colored(key, 127, 127, 127, 255)
		end

		Imgui.text(text)
		Imgui.end_tool_tip()
	end
end

local function stats(t)
	local min, max, mean, M2, C2 = math.huge, -math.huge, 0, 0, 0
	local n = #t

	for i = 1, n do
		local x = t[i]

		if x < min then
			min = x
		end

		if max < x then
			max = x
		end

		local dx = x - mean

		mean = mean + dx / i
		M2 = M2 + dx * (x - mean)
		C2 = C2 + dx * (n - i - 0.5 * (i + 1))
	end

	return mean, M2 / (n - 1), min, max, C2 / (n - 1)
end

local function fmtbytes(b)
	return UIUtils.comma_value(math.ceil(1024 * b) .. " bytes")
end

local _pad_cache = {}

ImguiJIT._recursive_header = function (self, tbl, children_by_ref, name_by_ref, size_by_ref, one_layer_size, depth_by_reference, name_length)
	local depth = depth_by_reference[tbl]
	local padding = (depth - 1) * 10

	Imgui.dummy(padding, 0)
	Imgui.same_line()

	if Imgui.collapsing_header(string.format("%s%s (self: %sb)", string.pad_right(name_by_ref[tbl], name_length + 4, " ", _pad_cache), string.pad_right(string.chunk_from_right(tostring(size_by_ref[tbl]), 3, "'") .. "b", 15, " ", _pad_cache), string.chunk_from_right(tostring(one_layer_size[tbl]), 3, "'")), false) then
		local children = children_by_ref[tbl]
		local _, longest_name_ref = table.max_func(children, function (ref)
			return #name_by_ref[ref]
		end)

		self._memory_layout_name_max_size = math.clamp(#name_by_ref[longest_name_ref], self._memory_layout_name_max_size, 125)

		for i = 1, #children do
			self:_recursive_header(children[i], children_by_ref, name_by_ref, size_by_ref, one_layer_size, depth_by_reference, self._memory_layout_name_max_size)
		end

		Imgui.tree_pop()
	end
end

ImguiJIT.draw = function (self)
	local do_close = Imgui.begin_window("JIT utilities")
	local enabled = Imgui.checkbox("JIT enabled", self._enabled or false)

	if enabled ~= self._enabled then
		jit[enabled and "on" or "off"]()

		self._enabled = enabled
	end

	Imgui.same_line()

	if Imgui.button("Flush") then
		jit.flush()
	end

	Imgui.separator()

	if Imgui.collapsing_header("Parameters", false) then
		for _, t in pairs(self._params) do
			local v = Imgui.input_int(t.k, math.max(0, t.v))

			tooltip(t.d, t.k)

			if v ~= t.v then
				jopt(format("%s=%d", t.k, v))

				t.v = v
			end
		end

		Imgui.tree_pop()
	end

	if Imgui.collapsing_header("Options", false) then
		for _, t in pairs(self._opts) do
			local v = Imgui.checkbox(t.k, t.v)

			if v ~= t.v then
				jopt(format("%s%s", v and "+" or "-", t.k))

				t.v = v
			end
		end

		Imgui.tree_pop()
	end

	if Imgui.collapsing_header("Traces", false) then
		Imgui.text("Traces go here.")

		local traces = self._traces

		for _, t in pairs(traces) do
			Imgui.text(tostring(t))
		end

		Imgui.tree_pop()
	end

	if Imgui.collapsing_header("Garbage", false) then
		local bytes = self._bytes
		local n = Imgui.input_int("History period", math.max(0, bytes.n))

		bytes.n = n

		local bytes_last = collectgarbage("count")

		bytes[#bytes + 1] = bytes_last

		for i = 1, #bytes - n do
			table.remove(bytes, 1)
		end

		Imgui.plot_lines("Garbage count", bytes)

		local mean, var, min, max, cov = stats(bytes)
		local b1 = 12 * cov / (n * n - 1)
		local b0 = mean - b1 * (n + 1) * 0.5

		Imgui.text(string.format("Current: %20s   ", fmtbytes(bytes_last)))
		Imgui.text(string.format("Average: %20s //", fmtbytes(mean)))
		Imgui.same_line()
		Imgui.text(string.format("Std.dev: %20s   ", fmtbytes(var^0.5)))
		Imgui.text(string.format("Minimum: %20s //", fmtbytes(min)))
		Imgui.same_line()
		Imgui.text(string.format("Lire.b0: %20s   ", fmtbytes(b0)))
		Imgui.text(string.format("Maximum: %20s //", fmtbytes(max)))
		Imgui.same_line()
		Imgui.text(string.format("Lire.b1: %20s   ", fmtbytes(b1)))
		Imgui.separator()

		for _, t in pairs(self._gc) do
			local v = Imgui.input_int(t.k, math.max(0, t.v))

			collectgarbage(t.k, v)

			t.v = v

			tooltip(t.d, t.k)
		end

		Imgui.separator()

		if Imgui.button("Collect") then
			self._gc_state = "running"

			collectgarbage("collect")
			tooltip("performs a full garbage-collection cycle. This is the default option.", "collect")
		end

		Imgui.same_line()

		if Imgui.button("Stop") then
			self._gc_state = "stopped"

			collectgarbage("stop")
			tooltip("stops the garbage collector.", "stop")
		end

		Imgui.same_line()

		if Imgui.button("Restart") then
			self._gc_state = "running"

			collectgarbage("restart")
			tooltip("restarts the garbage collector.", "restart")
		end

		Imgui.same_line()

		if Imgui.button("Step") then
			collectgarbage("step")
			tooltip("performs a garbage-collection step. The step \"size\" is controlled by arg (larger values mean more steps) in a non-specified way. If you want to control the step size you must experimentally tune the value of arg. Returns true if the step finished a collection cycle.", "step")
		end

		Imgui.text("Last known state: " .. self._gc_state)
		Imgui.tree_pop()
	end

	if Imgui.collapsing_header("Memory Layout", false) then
		self._root_path = Imgui.input_text("Path", self._root_path)

		local root

		if self._root_path == "" then
			root = _G
		else
			root = success and val
		end

		if root then
			Imgui.same_line()

			if Imgui.button("Snapshot") and root then
				self._snapshot_data = nil

				collectgarbage("collect")

				self._snapshot_data = {
					grab_lua_memory_tree_snapshot(root),
				}
			end

			if self._snapshot_data then
				local children, name_by_ref, size_by_ref, one_layer_size, depth_by_reference = unpack(self._snapshot_data)

				self._memory_layout_name_max_size = math.max(self._memory_layout_name_max_size, #name_by_ref[root])

				self:_recursive_header(root, children, name_by_ref, size_by_ref, one_layer_size, depth_by_reference, self._memory_layout_name_max_size)
			end
		end

		Imgui.tree_pop()
	end

	Imgui.end_window()

	return do_close
end

ImguiJIT.is_persistent = function (self)
	return false
end
