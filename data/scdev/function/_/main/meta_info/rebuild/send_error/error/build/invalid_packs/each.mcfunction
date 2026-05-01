#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.this_entry set from storage scdev:_ t.error.entries[-1]

data modify storage scdev:_ x.msg set value {text:"", color:red, extra:[{text:" - Manifest for pack with pack ID '"}, {text:"PACK ID", color:yellow}, {text:"' has error(s):"}]}
data modify storage scdev:_ x.msg.extra[1] set from storage scdev:_ t.error.this_entry.pack.pack_id
tellraw @a[tag=scdev.listener] {interpret:true, storage:"scdev:_", nbt:"x.msg"}

execute if data storage scdev:_ t.error.this_entry.error.invalid_pack_references run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
execute if data storage scdev:_ t.error.this_entry.error.duplicate_ids run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/each