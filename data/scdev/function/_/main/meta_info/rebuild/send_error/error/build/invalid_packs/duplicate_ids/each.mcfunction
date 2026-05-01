#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.dup_id set from storage scdev:_ t.error.this_entry.duplicate_ids[-1]

tellraw @a[tag=scdev.listener] [\
    {text:"  - Elements in array '", color: red},\
    {plain:true, storage:"scdev:_", nbt:"t.error.dup_id.in", color:gray},\
    {text:"' should be unique by key '", color: red},\
    {plain:true, storage:"scdev:_", nbt:"t.error.dup_id.id", color:gray},\
    {text:"' but are not.", color: red},\
]

data remove storage scdev:_ t.this_entry.entry.duplicate_ids[-1]
execute if data storage scdev:_ t.this_entry.entry.duplicate_ids[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each