#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_ t.error.lines append value {text:"", color:red, extra:[{text:" - Manifest for pack with pack ID '"}, {text:"PACK ID", color:yellow}, {text:"' has error(s):"}]}
data modify storage scdev:_ t.error.lines[-1].extra[1].text set from storage scdev:_ t.error.this_entry.pack.pack_id

execute if data storage scdev:_ t.error.this_entry.error.invalid_pack_references run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
execute if data storage scdev:_ t.error.this_entry.error.duplicate_ids run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each
execute if data storage scdev:_ t.error.this_entry.error.invalid_urls run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_urls/each
execute if data storage scdev:_ t.error.this_entry.error.invalid_dependencies run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_deps/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each