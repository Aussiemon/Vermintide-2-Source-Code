SearchUtils = SearchUtils or {}

local function find_synonym_match(query, query_index, tuple_list)
	for i = 1, #tuple_list do
		local tuple = tuple_list[i]
		local synonyms = Localize(tuple[2])

		for synonym in string.gmatch(synonyms, "[^,]+") do
			synonym = Utf8.lower(string.gsub(synonym, "%s+", ""))
			local end_index = query_index + #synonym - 1

			if string.sub(query, query_index, end_index) == synonym then
				return tuple[1], end_index
			end
		end
	end

	return nil, nil
end

SearchUtils.extract_queries = function (query, definitions, results)
	query = Utf8.lower(query)

	for i = 1, #definitions do
		local def = definitions[i]
		local key = def.key
		local pattern = Localize("search_filter_" .. key) .. "%s*:%s*"
		local start_index, keyword_index = string.find(query, pattern)

		if start_index then
			local value, end_index = find_synonym_match(query, keyword_index + 1, def)

			if value ~= nil then
				results[key] = value
				query = string.remove(query, start_index, end_index)
			end
		end
	end

	query = string.trim(string.gsub(query, "%s+", " "))

	return query, results
end

local find = string.find
local lower = Utf8.lower

SearchUtils.simple_search = function (needle, haystack)
	return find(lower(haystack), needle, 1, true)
end
