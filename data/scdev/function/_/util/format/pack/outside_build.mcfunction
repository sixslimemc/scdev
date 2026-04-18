# UTIL > six:_/util/format/pack
# outside_build
#--------------------
# ./main
#--------------------

data modify storage scdev:_ u.pack.text set value {text:"PACK ID", color:yellow, italic:true, hover_event:{action:"show_text", value:{text:"Pack is not in the current build", color:gray}}}
data modify storage scdev:_ u.pack.text.text set from storage six:_/in pack.pack_id
data modify storage scdev:_/out pack.result set from storage scdev:_ u.pack.text