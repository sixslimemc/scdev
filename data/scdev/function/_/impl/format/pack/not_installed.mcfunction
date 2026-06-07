#> scdev : format/pack
# not_installed
#--------------------
# ./main
#--------------------

data modify storage scdev:_ v.pack.text set value {text:"PACK ID", color:dark_gray, hover_event:{action:"show_text", value:{text:"Pack has not been initialized", color:dark_gray, italic:true}}}
execute if data storage scdev:in pack.reference run data modify storage scdev:_ v.pack.text.text set from storage scdev:in pack.reference.pack_ref
execute if data storage scdev:in pack.pack.pack_id run data modify storage scdev:_ v.pack.text.text set from storage scdev:in pack.pack.pack_id
data modify storage scdev:out pack.result set from storage scdev:_ v.pack.text