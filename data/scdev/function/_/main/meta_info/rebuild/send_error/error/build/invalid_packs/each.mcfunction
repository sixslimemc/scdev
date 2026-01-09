#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [{text:" - Manifest with 'pack_id' ", color:red}, {storage:"scdev:_", nbt:"t.error.entry.pack.pack_id", color:yellow}, {text:" has error(s):"}]

execute if data storage scdev:_ t.error.entry.invalid_pack_references run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
execute if data storage scdev:_ t.error.entry.duplicate_ids run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each