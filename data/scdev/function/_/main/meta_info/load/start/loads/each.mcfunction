#> scdev:_/main/meta_info/load/start/loads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_load set from storage scdev:_ t.load.loads[0]

# get {..pack}
function scdev:_/main/meta_info/load/start/loads/get_pack with storage scdev:_ t.load.this_load

execute unless data storage scdev:_ t.load.pack{is_library:true} run tellraw @a[tag=scdev.watch] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_load.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_load.pack_ref", color: aqua}, \
]

execute if data storage scdev:_ t.load.pack{is_library:true} run tellraw @a[tag=scdev.watch] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_load.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {storage: "scdev:_", nbt:"t.load.this_load.pack_ref", color: "yellow", italic:true}, \
]

data remove storage scdev:_ t.load.loads[0]
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each