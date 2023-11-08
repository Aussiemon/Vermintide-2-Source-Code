assert(DialogueLookup[DialogueLookup_n + 1] == nil)
assert(DialogueLookup[DialogueLookup_n + 2] == nil)
assert(DialogueLookup[DialogueLookup_n + 3] == nil)

DialogueLookup[DialogueLookup_n + 1] = "pbw_nm_activate_ability"
DialogueLookup[DialogueLookup_n + 2] = "pbw_nm_command_attack"
DialogueLookup[DialogueLookup_n + 3] = "pbw_nm_command_defend"
DialogueLookup_n = DialogueLookup_n + 3
