#> scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [ \
    {text:" - ", color: red}, \
    {storage:"scdev:_", nbt:"t.error.entry.pack_ref", color:yellow}, \
    {text:":", color: gray}, \
    {storage:"scdev:_", nbt:"t.error.entry.id", color:"dark_green"}, \
]

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/build/missing_impls/each