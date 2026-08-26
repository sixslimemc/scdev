#> scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - Manifest for pack with pack ID '"}, {text:"PACK ID", color:yellow}, {text:"' includes invalid references(s):"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].text set from storage scdev:_ t.error.this_entry.pack.pack_id

data modify storage scdev:_ t.error.refs set from storage scdev:_ t.error.this_entry.invalid_references
execute if data storage scdev:_ t.error.refs[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/packs_with_invalid_references/refs/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/dep_cycles/each