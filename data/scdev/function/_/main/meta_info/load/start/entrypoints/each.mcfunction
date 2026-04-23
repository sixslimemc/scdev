#> scdev:_/main/meta_info/load/start/entrypoints/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_entrypoint set from storage scdev:_ t.load.entrypoints[0]

data modify storage scdev:_/in entrypoint.entrypoint set from storage scdev:_ t.load.this_entrypoint
function scdev:_/util/format/entrypoint/main
data modify storage scdev:_ t.load.preload_text set from storage scdev:_/out entrypoint.result

tellraw @a[tag=scdev.listener] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_entrypoint.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {interpret:true, storage:"scdev:_", nbt:"t.load.preload_text"} \
]

data remove storage scdev:_ t.load.entrypoints[0]
execute if data storage scdev:_ t.load.entrypoints[0] run function scdev:_/main/meta_info/load/start/entrypoints/each