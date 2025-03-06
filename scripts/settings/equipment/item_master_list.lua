-- chunkname: @scripts/settings/equipment/item_master_list.lua

require("foundation/scripts/util/table")
require("scripts/settings/equipment/projectile_units")
require("scripts/settings/equipment/pickups")

CanWieldAllItemTemplates = CanWieldAllItemTemplates or {}

table.append(CanWieldAllItemTemplates, {
	"bw_scholar",
	"bw_adept",
	"bw_unchained",
	"we_shade",
	"we_maidenguard",
	"we_waywatcher",
	"dr_ironbreaker",
	"dr_slayer",
	"dr_ranger",
	"wh_zealot",
	"wh_bountyhunter",
	"wh_captain",
	"es_huntsman",
	"es_knight",
	"es_mercenary",
	"empire_soldier_tutorial",
})

ItemMasertListUpdateQueue = {}

function UpdateItemMasterList(item_names, career_name)
	if not table.contains(CanWieldAllItemTemplates, career_name) then
		table.insert(CanWieldAllItemTemplates, career_name)
	end

	table.insert(ItemMasertListUpdateQueue, {
		item_names,
		career_name,
	})
end

local_require("scripts/settings/equipment/item_master_list_local")
local_require("scripts/settings/equipment/item_master_list_exported")
local_require("scripts/settings/equipment/item_master_list_weapon_skins")
local_require("scripts/settings/equipment/item_master_list_test_items")
local_require("scripts/settings/equipment/item_master_list_steam_items")
local_require("scripts/settings/equipment/item_master_list_weapon_poses")
DLCUtils.require_list("item_master_list_file_names", true)

for i = 1, #ItemMasertListUpdateQueue do
	local item_names = ItemMasertListUpdateQueue[i][1]
	local career_name = ItemMasertListUpdateQueue[i][2]

	for item_id = 1, #item_names do
		local item_name = item_names[item_id]
		local item = ItemMasterList[item_name]

		fassert(item, "No such item %s found in item master list while trying to insert career %s", item_name, career_name)
		fassert(item.can_wield ~= CanWieldAllItemTemplates, "Trying to patch item %s that can already be wielded by all careers, you don't need to do that.", item_name)
		table.insert(item.can_wield, career_name)
	end
end

SteamitemdefidToMasterList = {}

if HAS_STEAM then
	for item_key, item_data in pairs(ItemMasterList) do
		local steam_itemdefid = item_data.steam_itemdefid

		if steam_itemdefid then
			fassert(SteamitemdefidToMasterList[steam_itemdefid] == nil, "duplicated steam item server item in ItemMasterList(%s)", steam_itemdefid)

			SteamitemdefidToMasterList[steam_itemdefid] = item_key
		end
	end
end

MagicItemByUnlockName = {}

for item_name, item_data in pairs(ItemMasterList) do
	if item_data.matching_item_key then
		local matching_item = ItemMasterList[item_data.matching_item_key]

		fassert(matching_item, "Missing matching item %s referenced by %s", item_data.matching_item_key, item_name)

		item_data.can_wield = matching_item.can_wield
	end

	if item_data.slot_type == "hat" then
		if table.find(item_data.can_wield, "bw_unchained") or table.find(item_data.can_wield, "bw_adept") then
			item_data.item_preview_environment = "hats_bloom_01"
		end
	elseif item_data.slot_type == "weapon_skin" and string.find(item_name, "_runed_") then
		item_data.item_preview_object_set_name = "flow_rune_weapon_lights"
	end

	if item_data.rarity == "magic" and item_data.required_unlock_item and item_data.item_type ~= "weapon_skin" then
		local required_unlock_key = item_data.required_unlock_item

		MagicItemByUnlockName[required_unlock_key] = item_name
	end
end

all_item_types = {}

function parse_item_master_list()
	for key, item in pairs(ItemMasterList) do
		item.key = key
		item.name = key

		if item.display_name then
			item.localized_name = Localize(item.display_name)
		else
			item.display_name = string.format("No_display_name_for_item_%q", tostring(key))
			item.localized_name = "<" .. item.display_name .. ">"
		end

		if item.item_type then
			all_item_types[item.item_type] = true
		end
	end
end

if Managers.localizer then
	parse_item_master_list()
end

ItemMasterListMeta = ItemMasterListMeta or {}

ItemMasterListMeta.__index = function (table, key)
	Crashify.print_exception("[ItemMasterList]", "ItemMaster List has no item %s", key)
end

setmetatable(ItemMasterList, ItemMasterListMeta)
