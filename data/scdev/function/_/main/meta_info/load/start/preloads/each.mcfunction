#> scdev:_/main/meta_info/load/start/preloads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_preload set from storage scdev:_ t.load.preloads[0]

data modify storage scdev:_/in preload_entrypoint.preload_entrypoint set from storage scdev:_ t.load.this_preload
function scdev:_/util/format/preload_entrypoint/main
data modify storage scdev:_ t.load.preload_text set from storage scdev:_/out preload_entrypoint.result

tellraw @a[tag=scdev.listener] \
[ \
    {text:"  "}, \
    {storage: "scdev:_", nbt:"t.load.this_preload.index", color: dark_gray}, \
    {text:" - ", color: gray}, \
    {interpret:true, storage:"scdev:_", nbt:"t.load.preload_text"} \
]

data remove storage scdev:_ t.load.preloads[0]
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each