require("core/gwnav/lua/safe_require")

local NavClass = safe_require_guard()

NavClass.NavClass = function (class, super)
	class = class or {}

	if next(class) == nil then
		local meta = {
			__call = function (self, ...)
				local object = {}

				setmetatable(object, class)

				if object.init then
					object:init(...)
				end

				return object
			end
		}

		setmetatable(class, meta)
	end

	if super then
		for k, v in pairs(super) do
			class[k] = v
		end
	end

	class.Super = super
	class.__index = class

	return class
end

return NavClass.NavClass
