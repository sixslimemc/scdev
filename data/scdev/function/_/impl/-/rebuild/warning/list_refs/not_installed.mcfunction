# IMPL > scdev:-/rebuild
# warning/list_refs/not_installed
#--------------------
# ./each
#--------------------

data modify storage scdev:_ v.rebuild.lines append value {text:"", color:gray, extra:[{text:"  - "}, {text:"PACK ID", color:yellow}]}
data modify storage scdev:_ v.rebuild.lines[-1].extra[1].text set from storage scdev:_ v.rebuild.this_ref.pack_ref