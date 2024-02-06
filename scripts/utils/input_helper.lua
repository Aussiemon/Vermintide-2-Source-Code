-- chunkname: @scripts/utils/input_helper.lua

InputUtils = InputUtils or {}

InputUtils.keymaps_key_approved = function (platform_key)
	local platform = PLATFORM

	if IS_WINDOWS then
		return not (platform_key ~= platform and platform_key ~= "xb1" and platform_key ~= "ps_pad") and true or nil
	elseif IS_XB1 then
		return not (platform_key ~= platform and platform_key ~= "win32") and true or nil
	else
		return platform_key == platform and true or nil
	end
end

InputUtils.get_platform_keymaps = function (keymappings, optional_platform_key)
	local platform = optional_platform_key or PLATFORM

	return keymappings[platform]
end

InputUtils.get_platform_filters = function (filters, optional_platform_key)
	local platform = optional_platform_key or PLATFORM

	return filters[platform]
end
