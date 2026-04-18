# UTIL > six:_/util/format/pack
# outside_build
#--------------------
# ./main
#--------------------

data modify storage scdev:_ u.pack.text set value {text:"PACK ID", color:dark_gray, hover_event:{action:"show_text", value:{text:"Not present in the current build", color:dark_gray, italic:true}}}
data modify storage scdev:_ u.pack.text.text set from storage scdev:_/in pack.pack_id
data modify storage scdev:_/out pack.result set from storage scdev:_ u.pack.text