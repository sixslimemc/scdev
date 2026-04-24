#> scdev:_/main/meta_info/load/start/entrypoints/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_entrypoint set from storage scdev:_ t.load.entrypoints[0]

data modify storage scdev:in entrypoint.reference set from storage scdev:_ t.load.this_entrypoint
data modify storage scdev:in entrypoint.use_this_entity set value true
function scdev:format/entrypoint
data modify storage scdev:_ t.load.preload_text set from storage scdev:out entrypoint.result

tellraw @a[tag=scdev.listener] \
[ \
    {text:"  "}, \
    {plain:true, storage: "scdev:_", nbt:"t.load.this_entrypoint.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {interpret:true, storage:"scdev:_", nbt:"t.load.preload_text"} \
]

data remove storage scdev:_ t.load.entrypoints[0]
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each