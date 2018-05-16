require("scripts/managers/news_ticker/news_ticker_token")

NewsTickerManager = class(NewsTickerManager)

NewsTickerManager.init = function (self)
	self._platform = PLATFORM

	if self._platform == "win32" then
		self._loading_screen_url = Development.parameter("news_ticker_url") or "http://cdn.fatsharkgames.se/vermintide_2_news_ticker.txt"
		self._ingame_url = Development.parameter("news_ticker_ingame_url") or "http://cdn.fatsharkgames.se/vermintide_2_news_ticker_ingame.txt"
	else
		self._server_name = "cdn.fatsharkgames.se"
		self._loading_screen_url = "empty.txt"
		self._ingame_url = "empty.txt"
	end

	self._loading_screen_text = nil
	self._ingame_text = nil
end

local function lines(str)
	local t = {}

	local function helper(line)
		table.insert(t, line)

		return ""
	end

	helper(str:gsub("(.-)\r?\n", helper))

	return t
end

NewsTickerManager.update = function (self, dt)
	return
end

NewsTickerManager.destroy = function (self)
	return
end

NewsTickerManager._load = function (self, url, callback)
	if self._platform == "win32" then
		local token = Curl.add_request(url)
		local curl_token = CurlToken:new(token)

		Managers.token:register_token(curl_token, callback)
	else
		local message = Http.get_uri(self._server_name, 80, url)

		if message then
			local is_ok = string.find(message, "HTTP/1.1 200 OK")

			if is_ok then
				local start_idx, end_idx = string.find(message, "\r\n\r\n")
				local formatted_message = string.sub(message, end_idx + 1)
				local info = {
					done = true,
					data = formatted_message
				}

				callback(info)

				return
			end
		end

		local info = {
			done = true,
			data = ""
		}

		callback(info)
	end
end

NewsTickerManager.refresh_loading_screen_message = function (self)
	self._loading_screen_text = nil
	self._refreshing_loading_screen_message = true

	if self._platform == "win32" and not rawget(_G, "Curl") then
		self:cb_loading_screen_loaded({
			done = true,
			data = "This executable is built without Curl. News ticker will be unavailable."
		})

		return
	end

	self:_load(self._loading_screen_url, callback(self, "cb_loading_screen_loaded"))
end

NewsTickerManager.cb_loading_screen_loaded = function (self, info)
	if self._refreshing_loading_screen_message and info.done then
		local str = info.data

		if str and str ~= "" then
			self._loading_screen_text = str
		else
			self._loading_screen_text = nil
		end

		self._refreshing_loading_screen_message = nil
	end
end

NewsTickerManager.loading_screen_text = function (self)
	return self._loading_screen_text
end

NewsTickerManager.refresh_ingame_message = function (self)
	self._ingame_text = nil
	self._refreshing_ingame_message = true

	if self._platform == "win32" and not rawget(_G, "Curl") then
		self:cb_ingame_loaded({
			done = true,
			data = "This executable is built without Curl. News ticker will be unavailable."
		})

		return
	end

	self:_load(self._ingame_url, callback(self, "cb_ingame_loaded"))
end

NewsTickerManager.refreshing_ingame_message = function (self)
	return self._refreshing_ingame_message
end

NewsTickerManager.cb_ingame_loaded = function (self, info)
	if self._refreshing_ingame_message and info.done then
		local str = info.data

		if str and str ~= "" then
			self._ingame_text = str
		else
			self._ingame_text = nil
		end

		self._refreshing_ingame_message = nil
	end
end

NewsTickerManager.ingame_text = function (self)
	return self._ingame_text
end

return
