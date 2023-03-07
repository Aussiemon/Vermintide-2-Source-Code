assert(DialogueLookup[DialogueLookup_n + 1] == nil)
assert(DialogueLookup[DialogueLookup_n + 2] == nil)

DialogueLookup[DialogueLookup_n + 1] = "pwh_wp_activate_ability"
DialogueLookup[DialogueLookup_n + 2] = "pwh_wp_activate_fury"
DialogueLookup_n = DialogueLookup_n + 2
