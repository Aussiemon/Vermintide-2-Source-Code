ImguiUnlockOverride = class(ImguiUnlockOverride)

ImguiUnlockOverride.init = function (self)
	return
end

ImguiUnlockOverride.update = function (self)
	return
end

local dlc_list = {}

local function set_all(t, k, v)
	for i = 1, #k do
		t[k[i]] = v
	end
end

ImguiUnlockOverride.draw = function (self)
	return
end

ImguiUnlockOverride.is_persistent = function (self)
	return false
end
