NewsTickerToken = NewsTickerToken or class()
NewsTickerToken.init = function (self, loader, job)
	self._loader = loader
	self._job = job

	return 
end
NewsTickerToken.info = function (self)
	if self.done(self) and UrlLoader.success(self._loader, self._job) then
		return UrlLoader.text(self._loader, self._job)
	else
		return "Failed loading news ticker"
	end

	return 
end
NewsTickerToken.update = function (self)
	return 
end
NewsTickerToken.done = function (self)
	return UrlLoader.done(self._loader, self._job)
end
NewsTickerToken.close = function (self)
	UrlLoader.unload(self._loader, self._job)

	return 
end

return 
