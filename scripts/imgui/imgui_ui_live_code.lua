-- chunkname: @scripts/imgui/imgui_ui_live_code.lua

require("scripts/utils/hash_utils")

ImguiUILiveCode = class(ImguiUILiveCode)

local HASH_ERROR = -1
local FILE_NAME_NEEDLES = {
	"definitions",
}

ImguiUILiveCode.init = function (self)
	self._require_datas = {}
	self._file_hashes = {}
	self._dirty_packages = {}
	self._cache = {}
	self._target_fps = 60
end

local DO_RELOAD = true

ImguiUILiveCode.update = function (self, t, dt)
	if DO_RELOAD then
		self:init()

		DO_RELOAD = false
	end

	self:_clear_cache_if_dirty()
	self:_process_packages(dt)
	self:_safeguard_dirty_packages()
end

ImguiUILiveCode._safeguard_dirty_packages = function (self)
	if table.is_empty(self._dirty_packages) then
		return
	end

	local orig_update = update

	function update(...)
		local valid, err = pcall(orig_update, ...)

		if not valid then
			self:_revert_dirty_packages(err)
		end

		table.clear(self._dirty_packages)

		update = orig_update
	end
end

ImguiUILiveCode.on_show = function (self)
	return
end

local msg = string.format("\n-------------------------------------------------\n\nFor a file to support live coding it must contain\none of the following words in thier filenames:\n\n[\n\t%s\n]\n\nand return a table, or specify 'live_code = true'\nin their return table.\n\n-------------------------------------------------\n\nIt's now running on a fairly naive solution of\nopening every relevant file in packages.loaded,\nreads it all, and diffs its content. This limits\nhow many files we can process each frame. If you\nhave the time, please implement a file watcher\ninstead.\n\n-------------------------------------------------\n\n", table.concat(FILE_NAME_NEEDLES, ",\n\t"))

ImguiUILiveCode.draw = function (self)
	local do_close, is_open = Imgui.begin_window("UI Live Code", "always_auto_resize")

	if not is_open then
		return do_close
	end

	Imgui.text("UI Live Coding is now active.")
	Imgui.text(string.format("Files processed last frame: %s out of %s", math.round(self._last_printed_package_count or 0), self:_num_processable_packages()))

	self._target_fps = Imgui.slider_int("FPS Throttle Limit", self._target_fps, 1, 120)

	Imgui.text(msg)

	local num_package_update_delay = 1
	local t = Managers.time:time("main")

	if t > (self._next_package_count_update_t or 0) then
		self._next_package_count_update_t = t + num_package_update_delay
		self._last_printed_package_count = self._last_num_packages
	end

	Imgui.text("Happy coding.")
	Imgui.end_window()

	return do_close
end

ImguiUILiveCode.is_persistent = function (self)
	return true
end

ImguiUILiveCode._next_package = function (self)
	self._next_package_name = next(package.loaded, self._next_package_name) or next(package.loaded)

	return self._next_package_name
end

ImguiUILiveCode._num_packages = function (self)
	self._cache.num_packages = self._cache.num_packages or table.size(package.loaded)

	return self._cache.num_packages
end

ImguiUILiveCode._num_processable_packages = function (self)
	if not self._cache.num_processable_packages then
		local count = 0

		for package_name, data in pairs(package.loaded) do
			if self:_is_live_code_file(package_name, data) then
				count = count + 1
			end
		end

		self._cache.num_processable_packages = count
	end

	return self._cache.num_processable_packages
end

ImguiUILiveCode._clear_cache_if_dirty = function (self)
	if self:_num_packages() ~= table.size(package.loaded) then
		table.clear(self._cache)
	end
end

ImguiUILiveCode._process_packages = function (self, dt)
	local packages_per_frame = self:_calculate_num_frame_packages(dt)
	local num_processed_packages = 0
	local num_packages = self:_num_packages()

	for i = 1, num_packages do
		local next_package = self:_next_package()
		local processed = self:_update_package(next_package)

		if processed then
			num_processed_packages = num_processed_packages + 1

			if packages_per_frame <= num_processed_packages then
				break
			end
		end
	end
end

ImguiUILiveCode._update_package = function (self, package_name)
	local data = package.loaded[package_name]
	local processed = false

	if self:_is_live_code_file(package_name, data) then
		local hash, file_str = self:_hash_file(package_name)

		if hash ~= HASH_ERROR and self._file_hashes[package_name] and self._file_hashes[package_name] ~= hash then
			self:_merge_changes(package_name, file_str)
		end

		self._file_hashes[package_name] = hash
		self._require_datas[package_name] = data
		processed = true
	end

	return processed
end

ImguiUILiveCode._file_name = function (self, package_name)
	self._src_dir = self._src_dir or string.gsub(Application.source_directory(), "\\", "/") .. "/"

	return self._src_dir .. package_name .. ".lua"
end

ImguiUILiveCode._is_live_code_file = function (self, package_name, data)
	if not self._cache.is_live_code_file then
		self._cache.is_live_code_file = {}
	end

	if not self._cache.is_live_code_file[package_name] then
		self._cache.is_live_code_file[package_name] = false

		if type(data) == "table" then
			if rawget(data, "live_code") then
				self._cache.is_live_code_file[package_name] = true
			else
				for _, needle in pairs(FILE_NAME_NEEDLES) do
					if string.find(package_name, needle) then
						self._cache.is_live_code_file[package_name] = true

						break
					end
				end
			end
		end
	end

	return self._cache.is_live_code_file[package_name]
end

ImguiUILiveCode._hash_file = function (self, package_name)
	local f = io.open(self:_file_name(package_name))

	if f then
		local file_str = f:read("*all")

		f:close()

		local hash = file_str

		return hash, file_str
	end

	return HASH_ERROR, ""
end

ImguiUILiveCode._mark_package_dirty = function (self, package_name, backup_data)
	self._dirty_packages[package_name] = backup_data
end

ImguiUILiveCode._merge_changes = function (self, package_name, file_str)
	local as_func = loadstring(file_str)
	local compiles, new_data = pcall(as_func)

	if compiles and new_data then
		local old_data = table.clone(self._require_datas[package_name])

		self:_mark_package_dirty(package_name, old_data)
		table.merge_recursive(self._require_datas[package_name], new_data)
		self:_handle_nil_recursive(old_data, new_data, self._require_datas[package_name])
		Managers.ui:reload_ingame_ui()
	end
end

ImguiUILiveCode._handle_nil_recursive = function (self, old, new, package_tbl)
	for k, v in pairs(old) do
		if not new[k] then
			package_tbl[k] = nil
		end

		if type(v) == "table" and type(new[k]) == "table" then
			self:_handle_nil_recursive(old[k], new[k], package_tbl[k])
		end
	end
end

ImguiUILiveCode._revert_dirty_packages = function (self, err)
	for package_name, backup_data in pairs(self._dirty_packages) do
		local faulty_data = table.clone(self._require_datas[package_name])

		table.merge_recursive(self._require_datas[package_name], backup_data)
		self:_handle_nil_recursive(faulty_data, backup_data, self._require_datas[package_name])
		printf("[ImguiUILiveCode] ERROR: %s", err)
		Debug.sticky_text("Error detected last frame. Reverted changes in %s. See error in console.", package_name, "delay", 6)
	end

	table.clear(self._dirty_packages)
end

ImguiUILiveCode._calculate_num_frame_packages = function (self, dt)
	self._last_num_packages = self._last_num_packages or 0

	local target_dt = 1 / self._target_fps
	local diff = dt > 0 and target_dt / dt or 0

	if target_dt < dt then
		diff = diff^3
		self._last_num_packages = self._last_num_packages - 1 / diff
	elseif diff > 0 then
		self._last_num_packages = self._last_num_packages + 1
	end

	self._last_num_packages = math.clamp(self._last_num_packages, 1, self:_num_processable_packages())

	return self._last_num_packages
end
