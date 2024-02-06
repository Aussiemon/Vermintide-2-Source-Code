﻿-- chunkname: @foundation/scripts/util/stack.lua

Stack = class(Stack)

Stack.init = function (self)
	self._stack = {}
end

Stack.push = function (self, node)
	table.insert(self._stack, node)
end

Stack.pop = function (self)
	return table.remove(self._stack)
end

Stack.top = function (self)
	return self._stack[#self._stack]
end

Stack.size = function (self)
	return #self._stack
end

Stack.clear = function (self)
	self._stack = {}
end
