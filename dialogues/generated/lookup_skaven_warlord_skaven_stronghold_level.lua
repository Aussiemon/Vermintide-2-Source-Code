assert(DialogueLookup[DialogueLookup_n + 1] == nil)
assert(DialogueLookup[DialogueLookup_n + 2] == nil)
assert(DialogueLookup[DialogueLookup_n + 3] == nil)

DialogueLookup[DialogueLookup_n + 1] = "ewl_opening_line"
DialogueLookup[DialogueLookup_n + 2] = "ewl_gameplay_banter"
DialogueLookup[DialogueLookup_n + 3] = "ewl_gameplay_summoning_skaven"
DialogueLookup_n = DialogueLookup_n + 3

return 
