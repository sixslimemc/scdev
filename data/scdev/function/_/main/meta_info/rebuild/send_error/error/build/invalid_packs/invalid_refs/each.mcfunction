#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.invalid_ref set from storage scdev:_ t.error.this_entry.invalid_pack_references[-1]

tellraw @a[tag=scdev.listener] [\
    {text:"   - Key '", color: red},\
    {plain:true, storage:"scdev:_", nbt:"t.error.invalid_ref.in", color:gray},\
    {text:"' references a pack that is not a dependency.", color: red},\
]

execute if data storage scdev:_ t.error.invalid_ref.index run tellraw @a[tag=scdev.listener] [\
    {text:"    (Array index: ", color: red},\
    {storage:"scdev:_", nbt:"t.error.invalid_ref.index", color:gray},\
    {text:")", color: red},\
]

data remove storage scdev:_ t.error.this_entry.invalid_pack_references[-1]
execute if data storage scdev:_ t.error.this_entry.invalid_pack_references[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each