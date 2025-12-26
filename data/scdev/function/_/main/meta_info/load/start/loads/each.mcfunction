#> scdev:_/main/meta_info/load/start/loads/each
#--------------------
# ../../start
#--------------------

say hi
data modify storage scdev:_ t.load.this_load set from storage scdev:_ t.load.loads[0]

tellraw @a[tag=scdev.watch] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_load.index", color: gray}, \
    {text:". ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_load.pack_ref", color: aqua}, \
]

data remove storage scdev:_ t.load.loads[0]
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each