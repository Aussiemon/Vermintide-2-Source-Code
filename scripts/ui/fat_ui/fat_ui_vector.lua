FatUIVector = FatUIVector or {}
local V2 = Vector2
local V3 = Vector3
local CC = Color

FatUI.tab2V2 = function (t)
	return V2(t[1], t[2])
end

FatUI.tab2V3 = function (t)
	return V3(t[1], t[2], t[3])
end

FatUI.tab2CC = function (t, a)
	return Color(a or t[1], t[2], t[3], t[4])
end

local luaVec = nil
FatUIVector.mt = FatUIVector.mt or {}
local mt = FatUIVector.mt

mt.__add = function (self, that)
	return luaVec(self[1] + that[1], self[2] + that[2], self[3] + that[3])
end

mt.__sub = function (self, that)
	return luaVec(self[1] - that[1], self[2] - that[2], self[3] - that[3])
end

mt.__mul = function (self, k)
	return luaVec(self[1] * k, self[2] * k, self[3] * k)
end

mt.__div = function (self, k)
	return luaVec(self[1] / k, self[2] / k, self[3] / k)
end

mt.__newindex = function (self)
	error("Attempted to add new field to a luaVector3", 2)
end

mt.__call = FatUI.tab2V3

if not FatUIVector.pool then
	FatUIVector.POOL_SIZE = 1024
	local pool = Script.new_array(FatUIVector.POOL_SIZE)
	FatUIVector.pool = pool

	for i = 0, FatUIVector.POOL_SIZE - 1, 1 do
		pool[i] = setmetatable({
			0,
			0,
			0
		}, mt)
	end

	local index = 0

	FatUIVector.reset = function ()
		index = 0
	end

	function luaVec(x, y, z)
		local v = pool[index]
		index = index + 1
		v[0] = x
		v[1] = y
		v[2] = z

		return v
	end

	FatUIVector.Vector3 = luaVec
end

return
