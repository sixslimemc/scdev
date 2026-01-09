#> scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each
#--------------------
# ./send
#--------------------

data modify storage scdev:_ t.error.entry set from storage scdev:_ t.error.entries[-1]

tellraw @s [ \
    {text:" - Could not find datapack path for ", color: red}, \
    {storage:"scdev:_", nbt:"t.error.entry.pack.pack_id", color:yellow}, \
    {text:".", color:red} \
]

execute if data storage scdev:_ t.error.entry.path_override run tellraw @s [ \
    {text:"  Expected path was ", color:"red"}, \
    {storage:"scdev:_", nbt:"t.error.entry.path_override", color:dark_aqua}, \
    {text:" (specified by path override).", color:"red"}, \
]

execute unless data storage scdev:_ t.error.entry.path_override run tellraw @s {text:" Expected a standard datapack path.", color:"dark_aqua"}

data remove storage scdev:_ t.error.entries[-1]
execute if data storage scdev:_ t.error.entries[0] run function scdev:_/main/meta_info/rebuild/send_error/error/missing_paths/each