-- chunkname: @scripts/unit_extensions/outline/outline_extension.lua

require("scripts/settings/outline_settings")

OutlineExtension = class(OutlineExtension)

OutlineExtension.init = function (self)
	self._unique_id = 0
	self._default_settings = nil
	self.outlined = false
	self.reapply = false
	self.flag = nil
	self.apply_method = nil
	self.outline_color = nil
	self.distance = nil
	self.method = nil
	self.outline_settings = {}
end

OutlineExtension.add_outline = function (self, settings)
	local unique_id = self._unique_id
	local settings = table.clone(settings)

	self._unique_id = self._unique_id + 1

	if unique_id == 0 then
		self._default_settings = settings
	end

	settings._unique_id = unique_id
	settings.priority = settings.priority or 0

	local settings_bucket = self.outline_settings
	local num_settings_buckets = #settings_bucket
	local insert_index = num_settings_buckets + 1
	local priority = settings.priority

	for i = 1, num_settings_buckets do
		local current_bucket = settings_bucket[i][1]

		if priority >= current_bucket.priority then
			insert_index = i

			break
		end
	end

	if settings_bucket[insert_index] then
		local shared_priority_settings = settings_bucket[insert_index]

		table.insert(shared_priority_settings, 1, settings)
	else
		settings_bucket[insert_index] = {
			settings,
		}
	end

	if insert_index == 1 then
		self:_refresh_current_outline()
	end

	return unique_id
end

OutlineExtension.remove_outline = function (self, unique_id)
	if not unique_id or unique_id < 0 then
		return
	end

	local settings_bucket = self.outline_settings

	for bucket_id = 1, #settings_bucket do
		local current_bucket = settings_bucket[bucket_id]

		for setting_id = 1, #current_bucket do
			if current_bucket[setting_id]._unique_id == unique_id then
				table.remove(current_bucket, setting_id)

				if #current_bucket == 0 then
					table.remove(settings_bucket, bucket_id)
				end

				if bucket_id == 1 and setting_id == 1 then
					self:_refresh_current_outline()
				end

				return
			end
		end
	end
end

OutlineExtension.update_outline = function (self, settings, unique_id)
	if not unique_id or unique_id < 0 then
		return
	end

	local settings_bucket = self.outline_settings

	for bucket_id = 1, #settings_bucket do
		local current_bucket = settings_bucket[bucket_id]

		for setting_id = 1, #current_bucket do
			local bucket_settings = current_bucket[setting_id]

			if bucket_settings._unique_id == unique_id then
				table.merge(bucket_settings, settings)

				settings._unique_id = unique_id

				if bucket_id == 1 and setting_id == 1 then
					self:_refresh_current_outline()
				end
			end
		end
	end
end

OutlineExtension.reapply_outline = function (self)
	self.reapply = true
end

OutlineExtension._refresh_current_outline = function (self, reapply)
	local default = self._default_settings
	local current_settings = self.outline_settings[1][1]
	local new_color = not current_settings.outline_color or self.outline_color ~= current_settings.outline_color

	self.outline_color = current_settings.outline_color and current_settings.outline_color or default.outline_color
	self.distance = current_settings.distance and current_settings.distance or default.distance
	self.method = current_settings.method and current_settings.method or default.method
	self.prev_flag = self.flag
	self.flag = current_settings.flag and current_settings.flag or default.flag
	self.reapply = reapply or self.outlined and new_color
end

OutlineExtension.on_freeze = function (self)
	self.method = "never"

	table.clear(self.outline_settings)

	self.outline_settings[1] = {
		self._default_settings,
	}
end

OutlineExtension.on_unfreeze = function (self)
	self:_refresh_current_outline()
end

OutlineExtension.swap_delete_outline = function (self, new_id, old_id)
	local settings_bucket = self.outline_settings
	local to_bucket_id, to_setting_id, from_bucket_id, from_setting_id

	for bucket_id = 1, #settings_bucket do
		local current_bucket = settings_bucket[bucket_id]

		for setting_id = 1, #current_bucket do
			if current_bucket[setting_id]._unique_id == new_id then
				from_bucket_id = bucket_id
				from_setting_id = setting_id
			end

			if current_bucket[setting_id]._unique_id == old_id then
				to_bucket_id = bucket_id
				to_setting_id = setting_id
			end
		end
	end

	local new_settings = settings_bucket[from_bucket_id][from_setting_id]

	new_settings._unique_id = old_id
	settings_bucket[to_bucket_id][to_setting_id] = new_settings

	table.remove(settings_bucket[from_bucket_id], from_setting_id)

	if #settings_bucket[from_bucket_id] == 0 then
		table.remove(settings_bucket, from_bucket_id)
	end

	self._default_settings = new_settings

	self:update_outline(new_settings, old_id)
end
