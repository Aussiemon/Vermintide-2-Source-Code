-- chunkname: @scripts/managers/news_ticker/news_ticker_manager.lua

require("scripts/managers/news_ticker/news_ticker_token")

NewsTickerManager = class(NewsTickerManager)

NewsTickerManager.init = function (self)
	self._server_name = "cdn.fatsharkgames.se"

	if IS_WINDOWS then
		self._loading_screen_url = Development.parameter("news_ticker_url") or "http://cdn.fatsharkgames.se/vermintide_2_news_ticker.txt"
		self._ingame_url = Development.parameter("news_ticker_ingame_url") or "http://cdn.fatsharkgames.se/vermintide_2_news_ticker_ingame.txt"
	else
		self._loading_screen_url = Development.parameter("news_ticker_url_xb1") or "vermintide_2_news_ticker_" .. PLATFORM .. ".txt"
		self._ingame_url = Development.parameter("news_ticker_ingame_url_xb1") or "vermintide_2_news_ticker_ingame_" .. PLATFORM .. ".txt"
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

	helper((str:gsub("(.-)\r?\n", helper)))

	return t
end

NewsTickerManager.update = function (self, dt)
	return
end

NewsTickerManager.destroy = function (self)
	return
end

local function _callback_wrapper(success, http_code, response_headers, data, userdata_callback)
	local info = {
		done = false,
	}

	if success and http_code >= 200 and http_code < 300 then
		info.done = true
		info.data = data
	end

	userdata_callback(info)
end

NewsTickerManager._load = function (self, url, callback)
	if rawget(_G, "Curl") then
		Managers.curl:get(url, nil, _callback_wrapper, callback)
	elseif rawget(_G, "Http") then
		local message = Http.get_uri(self._server_name, 80, url)

		if message then
			local is_ok = string.find(message, "HTTP/1.1 200 OK") or string.find(message, "HTTP/1.0 200 OK")

			if is_ok then
				local start_idx, end_idx = string.find(message, "\r\n\r\n")
				local formatted_message = ""

				if end_idx then
					formatted_message = string.sub(message, end_idx + 1)
				end

				local info = {
					done = true,
					data = formatted_message,
				}

				callback(info)

				return
			end
		end

		local info = {
			data = "",
			done = true,
		}

		callback(info)
	else
		self:cb_loading_screen_loaded({
			data = "This executable is built without Curl or Http. News ticker will be unavailable.",
			done = true,
		})
	end
end

NewsTickerManager.refresh_loading_screen_message = function (self)
	self._loading_screen_text = nil
	self._refreshing_loading_screen_message = true

	self:_load(Development.parameter("news_ticker_url_xb1") or self._loading_screen_url, callback(self, "cb_loading_screen_loaded"))
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

	self:_load(Development.parameter("news_ticker_ingame_url_xb1") or self._ingame_url, callback(self, "cb_ingame_loaded"))
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
