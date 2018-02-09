LoreBookHelper = LoreBookHelper or {}
local new_pages = {}
LoreBookHelper.save_new_pages = function ()
	local save_data = SaveData
	local new_lorebook_ids = save_data.new_lorebook_ids or {}

	for category_name, _ in pairs(new_pages) do
		new_lorebook_ids[category_name] = true
	end

	save_data.new_lorebook_ids = new_lorebook_ids

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
end
LoreBookHelper.mark_page_id_as_new = function (category_name)
	new_pages[category_name] = true

	return 
end
LoreBookHelper.unmark_page_id_as_new = function (page_id)
	local save_data = SaveData
	local new_lorebook_ids = save_data.new_lorebook_ids

	assert(new_lorebook_ids, "Requested to unmark lorebook page id %d without any save data.", page_id)

	new_lorebook_ids[page_id] = nil

	Managers.save:auto_save(SaveFileName, SaveData, nil)

	return 
end
LoreBookHelper.get_new_page_ids = function ()
	return SaveData.new_lorebook_ids
end

return 
