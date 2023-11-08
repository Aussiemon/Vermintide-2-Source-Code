ImguiPackageDebug = class(ImguiPackageDebug)
local SHOULD_RELOAD = true

ImguiPackageDebug.init = function (self)
	return
end

ImguiPackageDebug._hijack_package_manager = function (self)
	local package_manager = Managers.package
	self._old_load_func = package_manager.load
	self._old_unload_func = package_manager.unload

	PackageManager.load = function (this, ...)
		self._refresh_references = true

		self._old_load_func(this, ...)
	end

	PackageManager.unload = function (this, ...)
		self._refresh_references = true

		self._old_unload_func(this, ...)
	end

	self._refresh_references = true
end

ImguiPackageDebug.on_show = function (self)
	self:_hijack_package_manager()
end

ImguiPackageDebug.on_hide = function (self)
	PackageManager.load = self._old_load_func
	PackageManager.unload = self._old_unload_func
end

ImguiPackageDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if self._refresh_references then
		self._refresh_references = false
		local package_manager = Managers.package
		self._packages = self:_steal_and_sort(package_manager._packages)
		self._asynch_packages = self:_steal_and_sort(package_manager._asynch_packages)
		self._references = self:_steal_and_sort(package_manager._references)
		self._queued_async_packages = self:_steal_and_sort(package_manager._queued_async_packages)
		self._queue_order = self:_steal_and_sort(package_manager._queue_order)
	end
end

ImguiPackageDebug._steal_and_sort = function (self, table_to_steal)
	local copy = table.shallow_copy(table_to_steal)
	local keys = table.keys(copy)

	table.sort(keys)

	copy._sorted_keys = keys

	return copy
end

ImguiPackageDebug.is_persistent = function (self)
	return true
end

ImguiPackageDebug.draw = function (self, is_open)
	local do_close = Imgui.begin_window("Package Debug")

	self:_display_packages("packages", self._packages)
	self:_display_packages("async packages", self._asynch_packages)
	self:_display_references("references", self._references)
	self:_display_packages("queued async packages", self._queued_async_packages)
	self:_display_queue_order("queue order", self._queue_order)
	Imgui.end_window()

	return do_close
end

ImguiPackageDebug._display_references = function (self, name, table_to_display)
	if Imgui.tree_node(name) then
		if table_to_display then
			local keys = table_to_display._sorted_keys

			for i = 1, #keys do
				local package_name = keys[i]
				local references = table_to_display[package_name]

				if Imgui.tree_node(package_name) then
					for reference_name, count in pairs(references) do
						Imgui.text(reference_name .. "(" .. count .. ")")
						Imgui.separator()
					end
				end
			end
		end

		Imgui.dummy(10, 10)
		Imgui.tree_pop()
	end
end

ImguiPackageDebug._display_packages = function (self, name, packages)
	if Imgui.tree_node(name) then
		if packages then
			local keys = packages._sorted_keys

			for i = 1, #keys do
				local package_name = keys[i]

				Imgui.text(package_name)
			end
		end

		Imgui.dummy(10, 10)
		Imgui.tree_pop()
	end
end

ImguiPackageDebug._display_queue_order = function (self, name, queue)
	if Imgui.tree_node(name) then
		if queue then
			for i = 1, #queue do
				local package_name = queue[i]

				Imgui.text(i .. ": " .. package_name)
			end
		end

		Imgui.dummy(10, 10)
		Imgui.tree_pop()
	end
end

ImguiPackageDebug._display_userdata = function (self, name, table_to_display)
	if Imgui.tree_node(name) then
		if table_to_display then
			local keys = table_to_display._sorted_keys

			for i = 1, #keys do
				local package_name = keys[i]
				local references = table_to_display[package_name]

				if Imgui.tree_node(package_name) then
					for reference_name, count in pairs(references) do
						Imgui.text(reference_name .. "(userdata)")
						Imgui.separator()
					end

					Imgui.tree_pop()
				end
			end
		end

		Imgui.dummy(10, 10)
		Imgui.tree_pop()
	end
end
