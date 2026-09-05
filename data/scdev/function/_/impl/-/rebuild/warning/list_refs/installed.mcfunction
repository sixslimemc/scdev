# IMPL > scdev:-/rebuild
# warning/list_refs/installed
#--------------------
# ./each
#--------------------


data modify storage scdev:in pack.reference set from storage scdev:_ v.rebuild.this_ref
data modify storage scdev:in pack.use_this_entity set value true
function scdev:format/pack
data modify storage scdev:_ v.rebuild.pack_text set from storage scdev:out pack.result

data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, extra:[{text:"  - "}, "PACK"]}
data modify storage scdev:_ v.rebuild.lines[-1].extra[1] set from storage scdev:_ v.rebuild.pack_text