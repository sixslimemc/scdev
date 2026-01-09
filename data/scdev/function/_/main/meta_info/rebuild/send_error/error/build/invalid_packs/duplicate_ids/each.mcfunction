#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.dup_id set from storage scdev:_ t.error.entry.invalid_pack_references[-1]

tellraw @s [\
    {text:"  - Elements in array '", color: red},\
    {storage:"scdev:_", nbt:"t.error.dup_id.in", color:dark_aqua},\
    {text:"' should be unique by key '", color: red},\
    {storage:"scdev:_", nbt:"t.error.dup_id.id", color:gold},\
    {text:"' but were not.", color: red},\
]

data remove storage scdev:_ t.error.entry.duplicate_ids[-1]
execute if data storage scdev:_ t.error.entry.duplicate_ids[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/duplicate_ids/each