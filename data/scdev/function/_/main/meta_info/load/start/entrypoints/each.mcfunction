#> scdev:_/main/meta_info/load/start/entrypoints/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_entrypoint set from storage scdev:_ t.load.entrypoints[0]

tellraw @a[tag=scdev.watch] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_entrypoint.index", color: gray}, \
    {text:" - ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_entrypoint.id", color: green, italic:true}, \
    {text:" ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_entrypoint.pack_ref", color: dark_aqua}, \
]

data remove storage scdev:_ t.load.entrypoints[0]
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each