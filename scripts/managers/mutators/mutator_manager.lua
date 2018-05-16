MutatorManager = class(MutatorManager)

MutatorManager.init = function (self)
	self._mutators = {}
end

MutatorManager.update = function (self, dt)
	return
end

MutatorManager.get_mutators = function (self)
	return self._mutators
end

MutatorManager.clear_mutators = function (self)
	table.clear(self._mutators)
end

MutatorManager.add_mutator = function (self, template_name)
	self._mutators[#self._mutators + 1] = template_name
end

MutatorManager.destroy = function (self)
	return
end

return
