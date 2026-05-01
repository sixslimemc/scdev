#> scdev:_/main/meta_info/load/start/preloads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_preload set from storage scdev:_ t.load.preloads[0]

data modify storage scdev:in preload_entrypoint.reference set from storage scdev:_ t.load.this_preload
data modify storage scdev:in preload_entrypoint.use_this_entity set value true
function scdev:format/preload_entrypoint
data modify storage scdev:_ t.load.preload_text set from storage scdev:out preload_entrypoint.result

data modify storage scdev:_ t.load.lines append value {text:"", color:gray, extra:[{text:"  "}, {plain:true, storage: "scdev:_", nbt:"t.load.this_preload.index", color: dark_gray}, {text:" - "}, {}]}
data modify storage scdev:_ t.load.lines[-1].extra[3] set from storage scdev:_ t.load.preload_text

data remove storage scdev:_ t.load.preloads[0]
execute if data storage scdev:_ t.load.preloads[0] run function scdev:_/main/meta_info/load/start/preloads/each