#> scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each
#--------------------
# ../each
#--------------------

data modify storage scdev:_ t.error.invalid_ref set from storage scdev:_ t.error.entry.invalid_pack_references[-1]

tellraw @s [\
    {text:"  - Key '", color: red},\
    {storage:"scdev:_", nbt:"t.error.invalid_ref.in", color:dark_aqua},\
    {text:"' references a pack that is not a dependency.", color: red},\
]

execute if data storage scdev:_ t.error.invalid_ref.index run tellraw @s [\
    {text:"   (Array index: ", color: red},\
    {storage:"scdev:_", nbt:"t.error.invalid_ref.index", color:dark_aqua},\
    {text:")", color: red},\
]

data remove storage scdev:_ t.error.entry.invalid_pack_references[-1]
execute if data storage scdev:_ t.error.entry.invalid_pack_references[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/invalid_packs/invalid_refs/each