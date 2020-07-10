string.starts_with = function (str, start)
	return str:sub(1, #start) == start
end

string.ends_with = function (str, ending)
	return ending == "" or str:sub(-(#ending)) == ending
end

string.insert = function (str1, str2, pos)
	return str1:sub(1, pos) .. str2 .. str1:sub(pos + 1)
end

return
