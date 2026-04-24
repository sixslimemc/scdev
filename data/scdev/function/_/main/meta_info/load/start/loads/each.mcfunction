#> scdev:_/main/meta_info/load/start/loads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ t.load.loads[0].pack_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.load.pack_text set from storage scdev:out pack.result

tellraw @a[tag=scdev.listener] \
[ \
    {text:"  "}, \
    {plain:true, storage: "scdev:_", nbt:"t.load.loads[0].index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {interpret:true, storage:"scdev:_", nbt:"t.load.pack_text"}, \
]

data remove storage scdev:_ t.load.loads[0]
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each