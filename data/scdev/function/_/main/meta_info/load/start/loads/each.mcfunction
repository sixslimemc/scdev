#> scdev:_/main/meta_info/load/start/loads/each
#--------------------
# ../../start
#--------------------

data modify storage scdev:_ t.load.this_load set from storage scdev:_ t.load.loads[0]

data modify storage scdev:in pack.reference.pack_ref set from storage scdev:_ t.load.this_load.pack_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ t.load.pack_text set from storage scdev:out pack.result

data modify storage scdev:_ t.load.lines append value {text:"", color:gray, extra:[{text:"  "}, {plain:true, storage: "scdev:_", nbt:"t.load.this_load.index", color: dark_gray}, {text:" - "}, {}]}
data modify storage scdev:_ t.load.lines[-1].extra[3] set from storage scdev:_ t.load.pack_text

data remove storage scdev:_ t.load.loads[0]
execute if data storage scdev:_ t.load.loads[0] run function scdev:_/main/meta_info/load/start/loads/each