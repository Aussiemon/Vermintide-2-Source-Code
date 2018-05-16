local destroyed_mt = {
	__index = function ()
		error("This object has been destroyed")
	end
}
local special_functions = {
	new = true,
	__index = true,
	super = true,
	delete = true
}

function class(class_table, ...)
	local super = ...

	if select("#", ...) >= 1 and super == nil then
		ferror("Trying to inherit from nil")
	end

	if not class_table then
		class_table = {
			super = super,
			__index = class_table,
			new = function (self, ...)
				local object = {}

				setmetatable(object, class_table)

				if object.init then
					object:init(...)
				end

				return object
			end,
			delete = function (self, ...)
				if self.destroy then
					self:destroy(...)
				end

				setmetatable(self, destroyed_mt)
			end
		}
	end

	if super then
		for k, v in pairs(super) do
			if not special_functions[k] then
				class_table[k] = v
			end
		end
	end

	return class_table
end

return
