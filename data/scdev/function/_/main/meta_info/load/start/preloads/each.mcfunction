#> scdev:_/main/meta_info/load/start/preloads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_preload set from storage scdev:_ t.load.preloads[0]

tellraw @a[tag=scdev.watch] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_preload.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_preload.pack_ref", color: dark_aqua}, \
    {text:" : ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_preload.id", color: light_purple}, \
]

data remove storage scdev:_ t.load.preloads[0]
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each