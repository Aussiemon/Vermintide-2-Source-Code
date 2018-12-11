string.starts_with = function (str, start)
	return str:sub(1, #start) == start
end

string.ends_with = function (str, ending)
	return ending == "" or str:sub(-(#ending)) == ending
end

return
