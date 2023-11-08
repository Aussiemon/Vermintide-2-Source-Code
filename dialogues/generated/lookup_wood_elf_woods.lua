assert(DialogueLookup[DialogueLookup_n + 1] == nil)
assert(DialogueLookup[DialogueLookup_n + 2] == nil)
assert(DialogueLookup[DialogueLookup_n + 3] == nil)

DialogueLookup[DialogueLookup_n + 1] = "pwe_overcharge_explode"
DialogueLookup[DialogueLookup_n + 2] = "pwe_overcharge_warning"
DialogueLookup[DialogueLookup_n + 3] = "pwe_st_activate_ability"
DialogueLookup_n = DialogueLookup_n + 3
