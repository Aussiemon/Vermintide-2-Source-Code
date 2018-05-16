NewsTickerToken = NewsTickerToken or class()

NewsTickerToken.init = function (self, loader, job)
	self._loader = loader
	self._job = job
end

NewsTickerToken.info = function (self)
	if self:done() and UrlLoader.success(self._loader, self._job) then
		return UrlLoader.text(self._loader, self._job)
	else
		return "Failed loading news ticker"
	end
end

NewsTickerToken.update = function (self)
	return
end

NewsTickerToken.done = function (self)
	return UrlLoader.done(self._loader, self._job)
end

NewsTickerToken.close = function (self)
	UrlLoader.unload(self._loader, self._job)
end

return
