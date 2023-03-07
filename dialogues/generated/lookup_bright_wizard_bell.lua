assert(DialogueLookup[DialogueLookup_n + 1] == nil)
assert(DialogueLookup[DialogueLookup_n + 2] == nil)
assert(DialogueLookup[DialogueLookup_n + 3] == nil)

DialogueLookup[DialogueLookup_n + 1] = "pbw_bell_intro_a"
DialogueLookup[DialogueLookup_n + 2] = "pbw_bell_intro_b"
DialogueLookup[DialogueLookup_n + 3] = "pbw_bell_intro_c"
DialogueLookup_n = DialogueLookup_n + 3
